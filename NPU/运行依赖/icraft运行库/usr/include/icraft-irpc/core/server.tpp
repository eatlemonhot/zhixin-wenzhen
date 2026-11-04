/**
 * @file server.tpp
 * @author Weifan Gao (gaoweifan@fmsh.com.cn)
 * @brief IRPC服务端，负责服务端函数注册，解析请求并执行，构造响应
 * @date 2023-09-08
 * 
 * @copyright Copyright (c) 2023 Shanghai Fudan Microelectronics Group Co., Ltd. All rights reserved.
 * 
 */
#include <icraft-utils/logging.h>

namespace irpc{
    template<typename F, size_t ...i, typename T>
    decltype(auto) call_func_helper(F&& func, std::index_sequence<i...>, T&& t){
        return func(std::get<i>(std::forward<T>(t))...);
    }

    template<typename F, typename T>
    decltype(auto) call_func(F&& func, T&& t){
        constexpr auto size = std::tuple_size<typename std::decay<T>::type>::value;
        return call_func_helper(std::forward<F>(func), std::make_index_sequence<size>{}, std::forward<T>(t));
    }
    
    template<typename F>
    void server::callproxy(F func, msgpack::object &obj, uint24_t pktID){
        using args_type = typename utils::function_traits<F>::tuple_type;
        using ret_type = typename utils::function_traits<F>::return_type;

        try{
            // 尝试解析函数参数
            args_type args = codec_ptr->unpack_func_args<args_type>(obj);

            if constexpr (std::is_void<ret_type>::value){
                // 调用无返回值的函数
                irpc::call_func(func,args);
                if(verbose) ICRAFT_LOG(INFO) << "[irpc::server::callproxy] call_func done, sending reply...";
                // 发送函数执行完毕消息
                codec_ptr->send_packet(sp_ptr,msg_type::func_return,pktID,0,NULL,this->verbose);
            }else{
                // 调用函数
                auto res = irpc::call_func(func,args);
                if(verbose) ICRAFT_LOG(INFO) << "[irpc::server::callproxy] call_func done, sending reply...";
                // 发送函数返回值
                send_res(res,pktID);
            }
        }catch(msgpack::type_error &e){
            // 参数不匹配, 构造错误包裹
            this->send_err_args<args_type>(pktID);
            return;
        }catch(...){
            // 其他错误, 构造错误包裹
            auto expPtr = std::current_exception();
            try{
                if(expPtr) std::rethrow_exception(expPtr);
            }catch(const std::exception& e){ //it would not work if you pass by value
                std::string err_msg = e.what();
                if(this->verbose) ICRAFT_LOG(INFO) << "[irpc::server::callproxy] error occurred:\n" << err_msg;
                this->send_err(err_msg,pktID);
            }
        }
    }

    //类成员函数
    template<typename R, typename C, typename obj, typename... Args>
    void server::callproxy(R(C::* func)(Args...), obj* s, msgpack::object &o, uint24_t pktID){
        using args_type = std::tuple<typename std::decay<Args>::type...>;

        try{
            // 尝试解析函数参数
            args_type args = codec_ptr->unpack_func_args<args_type>(o);

            //构造匿名函数
            auto ff = [&](Args... ps)->R{
                return (s->*func)(ps...);
            };

            if constexpr (std::is_void<R>::value){
                // 调用无返回值的函数
                irpc::call_func(ff,args);
                if(verbose) ICRAFT_LOG(INFO) << "[irpc::server::callproxy] call_func done, sending reply...";
                // 发送函数执行完毕消息
                codec_ptr->send_packet(sp_ptr,msg_type::func_return,pktID,0,NULL,this->verbose);
            }else{
                // 调用函数
                auto res = irpc::call_func(ff,args);
                if(verbose) ICRAFT_LOG(INFO) << "[irpc::server::callproxy] call_func done, sending reply...";
                // 发送函数返回值
                send_res(res,pktID);
            }
        }catch(msgpack::type_error &e){
            // 参数不匹配, 构造错误包裹
            this->send_err_args<args_type>(pktID);
            return;
        }catch(...){
            // 其他错误, 构造错误包裹
            auto expPtr = std::current_exception();
            try{
                if(expPtr) std::rethrow_exception(expPtr);
            }catch(const std::exception& e){ //it would not work if you pass by value
                std::string err_msg = e.what();
                if(this->verbose) ICRAFT_LOG(INFO) << "[irpc::server::callproxy] error occurred:\n" << err_msg;
                this->send_err(err_msg,pktID);
            }
        }
    }

    template<typename F, typename obj>
    void server::callproxy_(F func, obj* self, msgpack::object &o, uint24_t pktID){
        callproxy(func,self,o,pktID);
    }

    //注册函数
    template<typename F>
    void server::register_func(const std::string funcName, F handler){
        m_handlers[funcName] = std::bind(&server::callproxy<F>, this, handler, std::placeholders::_1, std::placeholders::_2);
    }

    //成员函数
    template<typename F, typename obj>
    void server::register_func(const std::string funcName, F handler, obj* self){
        m_handlers[funcName] = std::bind(&server::callproxy_<F,obj>, this, handler, self, std::placeholders::_1, std::placeholders::_2);
    }

    template<typename T>
    void server::send_res(T& res, uint24_t pktID){
        auto msg = codec_ptr->pack(res);
        codec_ptr->send_packet(sp_ptr,msg_type::func_return,pktID,msg,this->verbose);
    }

    template<typename args_type>
    void server::send_err_args(uint24_t pktID){
        std::string err_msg = "arguments mismatch.\nrequired args type: "+
                            #ifdef _WIN32
                              utils::check_type<args_type>().substr(16);
                            #elif __linux__
                              utils::check_type<args_type>().substr(10);
                            #endif
                            //   boost::typeindex::type_id_with_cvr<args_type>().pretty_name().substr(10);
        if(this->verbose) ICRAFT_LOG(INFO) << "[irpc::server::send_err_args] " << err_msg;
        this->send_err(err_msg,pktID);
    }
}
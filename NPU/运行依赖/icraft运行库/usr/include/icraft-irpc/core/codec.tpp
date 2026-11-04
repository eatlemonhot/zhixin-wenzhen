/**
 * @file codec.tpp
 * @author Weifan Gao (gaoweifan@fmsh.com.cn)
 * @brief IRPC编解码器，负责数据包的编解码（序列化/反序列化）
 * @date 2023-09-08
 * 
 * @copyright Copyright (c) 2023 Shanghai Fudan Microelectronics Group Co., Ltd. All rights reserved.
 * 
 */

namespace irpc{
    template <typename T> 
    buffer_type codec::pack(T &&t){
        buffer_type buffer;
        msgpack::pack(buffer, std::forward<T>(t));
        return buffer;
    }

    template<typename T>
    T codec::unpack(const char* data, const size_t length){
        msgpack::unpack(msg_,data,length);
        return msg_.get().as<T>();
    }
    
    template<typename... Args>
    buffer_type codec::pack_func(const std::string funcName, Args&&... args){
        // store function name and its arguments as a pair
        std::tuple<Args&...> t_args(args...);
        auto func_pair = std::make_pair(funcName,t_args);
        // std::cout<<boost::typeindex::type_id_with_cvr<decltype(func_pair)>().pretty_name()<<std::endl;
        // pack func_pair
        buffer_type func_pair_bytes = this->pack(func_pair);

        return func_pair_bytes;
    }

    template<typename AT>
    AT codec::unpack_func_args(msgpack::object &obj){
        return obj.via.array.ptr[1].as<AT>(); // 提取pair.second，即函数参数
    }
}
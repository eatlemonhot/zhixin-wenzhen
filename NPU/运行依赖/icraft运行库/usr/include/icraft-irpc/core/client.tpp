/**
 * @file client.tpp
 * @author Weifan Gao (gaoweifan@fmsh.com.cn)
 * @brief IRPC客户端，用于客户端调用服务端的函数，构造请求，解析响应
 * @date 2023-09-08
 * 
 * @copyright Copyright (c) 2023 Shanghai Fudan Microelectronics Group Co., Ltd. All rights reserved.
 * 
 */
#include "icraft-irpc/core/client.hpp"
#include "icraft-irpc/utils/utils.hpp"
#include <icraft-utils/logging.h>
#include <type_traits>

namespace irpc{
    template<typename T, typename... Args>
    T client::call_sync(const std::string& funcName, Args&&... args){
        if(this->tp_ptr->n_threads()==0){ // 未开启线程池，只能单线程同步调用
            std::lock_guard lock(call_sync_mutex);
            // 获取新的数据包ID
            uint24_t pktID = getNewPktID();
            if(this->verbose) ICRAFT_LOG(INFO) << "[irpc::client::call_sync] new pktID: " << pktID;

            // 构造函数名、函数参数数据包
            buffer_type func_pair_bytes = codec_ptr->pack_func(funcName, std::forward<Args>(args)...);

            // 发送执行函数请求
            codec_ptr->send_packet(cp_ptr,msg_type::func_execute,pktID,func_pair_bytes,this->verbose);

            // 接收函数返回值
            auto ret = codec_ptr->get_packet(cp_ptr,this->verbose);
            
            // 检查返回包是否为请求包的响应（pktID匹配）
            if(std::get<1>(ret)!=pktID)
                throw std::runtime_error("[irpc::client::call_sync] pktID mismatched! Please use call_async instead.");

            // 解析函数返回值
            return process_packet<T>(ret);
        }else{ // 开启线程池，可以多线程异步调用
            auto ret_fut = call_async<T>(funcName, std::forward<Args>(args)...);
            return ret_fut.get();
        }
    }

    template<typename Ret, typename... Args>
    std::future<Ret> client::call_async(const std::string& funcName, Args&&... args){
        if(this->tp_ptr->n_threads()==0) // 未开启线程池，无法多线程异步调用
            throw std::runtime_error("[irpc::client::call_async] thread pool not available, n_threads==0");
            
        // 获取新的数据包ID（pktID），该数据包ID在一定范围内是唯一的
        uint24_t pktID = this->getNewPktID();
        if(this->verbose) ICRAFT_LOG(INFO) << "[irpc::client::call_async] new pktID: " << pktID;

        // 构造请求执行数据包
        buffer_type func_pair_bytes = this->codec_ptr->pack_func(funcName, std::forward<Args>(args)...);
        if(this->verbose) ICRAFT_LOG(INFO) << "[irpc::client::call_async] pktID:"<<pktID;
        auto packet_length = func_pair_bytes.size();
        auto packet_data = func_pair_bytes.release();

        // 异步发送call请求并等待返回值
        return this->tp_ptr->submit([this,pktID,packet_length,packet_data]{
            // 发送数据包
            this->codec_ptr->send_packet(this->cp_ptr,msg_type::func_execute,pktID,packet_length,packet_data,this->verbose);
            std::free(packet_data);
            
            // 阻塞等待接收到相同pktID的数据包（在另外一个线程接收call返回值pkt）
            pkt_t retPkt;
            {
                std::unique_lock<std::mutex> lock(this->m_retPkts_mutex);
                this->recv_pkt_cv.wait(lock, [this,&pktID,&retPkt]{
                    if(!this->isReceiverRunning()){
                        throw std::runtime_error(
                            "[irpc::client::call_async] receiver is not running when waiting for packet with pktID: " + 
                            std::to_string(pktID)
                        );
                    }
                    return this->m_retPkts.Find(pktID,retPkt);
                });
                if(this->verbose) ICRAFT_LOG(INFO) << "[irpc::client::call_async] notified by recv thread with pktID: " << pktID;
                this->m_retPkts.Erase(pktID);
            }

            // 解析函数返回值
            if(this->verbose) ICRAFT_LOG(INFO) << "[irpc::client::call_async] start process_packet with pktID: " << pktID;
            return this->process_packet<Ret>(retPkt);
        });
    }

    template<typename T, typename... Args>
    T client::call(const std::string& funcName, Args&&... args){
        return call_sync<T>(funcName, std::forward<Args>(args)...);
    }

    template<typename T>
    T client::process_packet(pkt_t pkt){
        msg_type type = std::get<0>(pkt);
        uint24_t pktID = std::get<1>(pkt);
        uint32_t length = std::get<2>(pkt);
        std::shared_ptr<uint8_t []> payload_bytes = std::get<3>(pkt);
        std::string msg;

        switch (type)
        {
        case func_return:
            if constexpr (std::is_void<T>::value)
                return;
            else
                return codec_ptr->unpack<T>(payload_bytes,length);
            break;
        
        case func_failed:
            msg = codec_ptr->unpack<std::string>(payload_bytes,length);
            throw std::runtime_error("[irpc::client::process_packet] got failed msg:\n"+msg);
            break;

        default:
            throw std::runtime_error("[irpc::client::process_packet] type unknown");
            break;
        }
    }
}
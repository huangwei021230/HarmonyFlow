#pragma once
#include <opt_infer_engine.h>
#include <mutex>
#include <memory>
#include <cassert>

namespace OPT{
class OPTEngineHelper{
public:
    static void Initialize(const std::string& dir){
        std::lock_guard<std::mutex> lock(mutex_);
        file_dir = dir;
    }
    static std::string GetReturnString(const std::string& str){
        auto engine = instance();
        assert(engine != nullptr);
        auto ret = engine->getReturnString(str);
        return ret;
    }
    
private:
    static OptInferEngine* instance(){
        std::lock_guard<std::mutex> lock(mutex_);
        if(!instance_){
            if(file_dir.empty()) return nullptr;
            auto model_path = file_dir + "/traced_opt-125m.pt";
            instance_ = std::make_unique<OptInferEngine>(model_path, file_dir + "/vocab.json", file_dir + "/merge.txt");
        }
        return instance_.get();
    };
    
    static std::unique_ptr<OptInferEngine> instance_;
    static std::mutex mutex_;
    static std::string file_dir;
};

std::unique_ptr<OptInferEngine> OPTEngineHelper::instance_  = nullptr;
std::mutex OPTEngineHelper::mutex_;
std::string OPTEngineHelper::file_dir = "";
}
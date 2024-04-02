#include "headers/pytorch/include/torch/csrc/api/include/torch/types.h"
#include <hilog/log.h>
#include <dlfcn.h>
#include <vector>
#include <string>
#include <iostream>
#include <sstream>
#include <fstream>
#include <cstring>
#include <torch/torch.h>
#include <torch/script.h>
#include <torch/csrc/jit/mobile/module.h>
#include <torch/csrc/jit/mobile/import.h>
#include <chrono>


bool fileExists(const std::string &filename) {
    std::ifstream file(filename);
    return file.good();
}

void output(torch::Tensor tensor) {
    std::ostringstream ostr;
    ostr << tensor << std::endl;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, "[DemoNative]", "Tensor:%{public}s", ostr.str().c_str());
}
//
//static napi_value TestClip(napi_env env, napi_callback_info info){
//    
//    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "[DemoNative]", 
//                "version: %{public}d.%{public}d.%{public}d",
//                TORCH_VERSION_MAJOR, TORCH_VERSION_MINOR, TORCH_VERSION_PATCH);
//
//    size_t argc = 1;
//    napi_value args[1] = {nullptr};
//    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
//    
//    const size_t MAX_SIZE = 256;
//    char buf[MAX_SIZE];
//    size_t size = 0;
//    napi_get_value_string_utf8(env, args[0], buf, MAX_SIZE, &size);
//    
//    std::string 
//    (buf, size);
//    
//    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "[DemoNative]", "filePath: %{public}s", fileName.c_str());
//    
////    fileName = '/data/app/el2/100/base/com.example.demonative/haps/entry/files/ResNet18.ptl';
//    if (fileExists(fileName)) {
//        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "[DemoNative]", "file exist");
//    } else {
//        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "[DemoNative]", "file does not exist");
//    }
//    
//    torch::jit::Module model;
//    bool ok = true;
//    // 测试加载模型
//    try {
//        model = torch::jit::load(fileName);
//        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "[DemoNative]", "Load model sucessfully!");
//    } catch (const c10::Error& e) {
//        ok = false;
//        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, "[DemoNative]", "Load model failed!");
//        std::ostringstream ostr;
//        ostr << e.what();
//        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, "[DemoNative]", "error:%{public}s", ostr.str().c_str());
//    }
//    // 测试模型推理
//    std::vector<torch::jit::IValue> inputs;
//    inputs.emplace_back(torch::rand({1, 3, 224, 224}));
//    inputs.emplace_back(torch::zeros({1, 52}, torch::kInt32));
//    
//    torch::Tensor out = model.forward(inputs).toTensor();
////    output(out);
//    std::cout << "sucessfully forward!" << std::endl;
//
//    napi_value res_value;
//    napi_get_boolean(env, ok, &res_value);
//    return res_value;
//}

bool test_pytorch_inference(std::string &fileName) {
    std::cout << "filename: " << fileName << std::endl;
    torch::jit::Module model;
    bool ok = true;
    try {
        auto start = std::chrono::high_resolution_clock::now();
        model = torch::jit::load(fileName);
        auto end = std::chrono::high_resolution_clock::now();
        std::cout << "Model Loading time: " << std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count() << "ms"
                  << std::endl;
        std::cout << "Load model sucessfully" << std::endl;
    } catch (const c10::Error &e) {
        std::cout << "error: " << e.what() << std::endl;
    }

    // 测试模型推理
    std::vector<torch::jit::IValue> inputs;
    torch::Tensor image_input(torch::rand({1, 3, 224, 224}));
//    torch::Tensor text_input(torch::randint(100, {1, 52}));
    torch::Tensor text_input = torch::zeros({1, 52}, torch::kInt32);

    inputs.emplace_back(image_input);
    inputs.emplace_back(text_input);
    try {
        auto start = std::chrono::high_resolution_clock::now();
        model.forward(inputs);
        auto end = std::chrono::high_resolution_clock::now();
        std::cout << "Inference time: " << std::chrono::duration_cast<std::chrono::milliseconds>(end-start).count() << "ms" << std::endl;
        
        std::cout << "inference successfully" << std::endl;
    } catch (const c10::Error &e) {
        std::cout << "inference failed" << std::endl;
    }
    //    std::cout << out << std::endl;
    return true;
}

int main(int argc, char *argv[]) {
    std::string fileName = std::string(argv[1], strlen(argv[1]));
    test_pytorch_inference(fileName);
    return 0;
}




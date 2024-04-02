#include "headers/clip_infer_engine.h"

namespace CLIP {

ClipInferEngine::ClipInferEngine(const std::string& image_encoder_path, 
                                 const std::string& text_encoder_path, 
                                 const std::string &vocab_file) 
    : preprocessor_(vocab_file) 
{
    loadImageEncoder(image_encoder_path);
    loadTextEncoder(text_encoder_path);
}

void ClipInferEngine::loadImageEncoder(const std::string& model_path) {
    auto start = std::chrono::high_resolution_clock::now();
    try {
        image_encoder_ = torch::jit::load(model_path); 
        image_encoder_.eval();
    } catch (const c10::Error& e) {
        std::cerr << "error loading the model\n";
        std::cerr << e.what();
        exit(1);
    }
    auto end = std::chrono::high_resolution_clock::now();
    std::cout << "ImageEncoder is loaded in " << std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count() << "ms" << std::endl;
}

void ClipInferEngine::loadTextEncoder(const std::string& model_path) {
    auto start = std::chrono::high_resolution_clock::now();
    try {
        text_encoder_ = torch::jit::load(model_path); 
        text_encoder_.eval();
    } catch (const c10::Error& e) {
        std::cerr << "error loading the model\n";
        std::cerr << e.what();
        exit(1);
    }
    auto end = std::chrono::high_resolution_clock::now();
    std::cout << "TextEncoder is loaded in " << std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count() << "ms" << std::endl;
}

//torch::Tensor ClipInferEngine::getImageFeature(const std::string& image_path) {
//    auto image_tensor = preprocessor_.preprocessImage(image_path);  
//      
//    std::vector<torch::jit::IValue> inputs = {image_tensor};
//    return image_encoder_.forward(inputs).toTensor();
//}

torch::Tensor ClipInferEngine::getTextFeature(const std::string& text) {
    auto text_tensor = preprocessor_.preprocessText(text);
    
    std::vector<torch::jit::IValue> inputs = {text_tensor};
    return text_encoder_.forward(inputs).toTensor();
}
};
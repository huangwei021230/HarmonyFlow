#pragma once

#include <clip_preprocessor.h>
#include <torch/script.h>
#include <torch/torch.h>

namespace CLIP {

class ClipInferEngine {

public:
    ClipInferEngine(const std::string& image_encoder_path, const std::string& text_encoder_path, const std::string &vocab_file);

//    torch::Tensor getImageFeature(const std::string& image_path);

    torch::Tensor getTextFeature(const std::string& text);

private:
    void loadImageEncoder(const std::string& model_path);
    void loadTextEncoder(const std::string& model_path);

    torch::jit::script::Module image_encoder_;
    torch::jit::script::Module text_encoder_;
    ClipPreprocessor preprocessor_;
};

}
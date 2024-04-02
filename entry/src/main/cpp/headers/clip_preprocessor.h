#pragma once
#include <string>
#include <vector>
#include <torch/torch.h>
#include <torch/script.h>
#include <tokenization.h>

namespace CLIP {
class ClipPreprocessor {
public:
    ClipPreprocessor(const std::string &vocab_file);
    torch::Tensor preprocessImage(const std::string &image_path);
    torch::Tensor preprocessText(const std::string &text);

    constexpr static int image_size = 224;
    constexpr static int text_length = 52;

private:
    std::unique_ptr<Tokenizer::FullTokenizer> tokenizer_;
};
} // namespace CLIP
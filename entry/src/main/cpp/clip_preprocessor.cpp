#include "headers/clip_preprocessor.h"
#include <iostream>

namespace CLIP {


ClipPreprocessor::ClipPreprocessor(const std::string &vocab_file) {
    tokenizer_ = std::make_unique<Tokenizer::FullTokenizer>(vocab_file);
}

//torch::Tensor ClipPreprocessor::preprocessImage(const std::string& image_path) {
//    // auto start = std::chrono::high_resolution_clock::now();
//    cv::Mat img = cv::imread(image_path);
//
//    // resize the image to size 224x224
//    cv::resize(img, img, cv::Size(image_size, image_size));
//
//    // convert the format from BGR to RGB
//    cv::cvtColor(img, img, cv::COLOR_BGR2RGB);
//
//    auto tensor_image = torch::from_blob(img.data, {img.rows, img.cols, 3}, torch::kByte);
//    // HWC to CHW
//    tensor_image = tensor_image.permute({2, 0, 1});
//
//    // map [0, 255] to [0, 1]
//    tensor_image = tensor_image.to(torch::kFloat32) / 255;
//
//    // convert image_mean and image_std to tensor
//    auto options = torch::TensorOptions().dtype(at::kFloat).device(tensor_image.device());
//    long image_mean_size = image_mean.size(), image_std_size = image_std.size();
//    auto tensor_mean = torch::from_blob(image_mean.data(), {image_mean_size}, options);
//    auto tensor_std = torch::from_blob(image_std.data(), {image_std_size}, options);
//    if (tensor_mean.dim() == 1) {
//        tensor_mean = tensor_mean.view({-1, 1, 1});
//    }
//    if (tensor_std.dim() == 1) {
//        tensor_std = tensor_std.view({-1, 1, 1});
//    }
//    // Normaliza the image tensor
//    tensor_image.sub_(tensor_mean).div_(tensor_std);
//
//    // Extend a dimension to the tensor
//    tensor_image = tensor_image.unsqueeze(0);
//
//    // auto end = std::chrono::high_resolution_clock::now();
//    // std::cout << "Image preprocessed in " << std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count() << "ms" << std::endl;
//    return tensor_image;
//}

torch::Tensor ClipPreprocessor::preprocessText(const std::string& text) {
    std::vector<size_t> all_tokens;

    // tokenize the text
    all_tokens.emplace_back(tokenizer_->getVocabId(L"[CLS]"));
    auto ids = tokenizer_->convertTokensToIds(tokenizer_->tokenize(text));
    if (ids.size() > text_length - 2) {
        ids.resize(text_length - 2);
    }
    all_tokens.insert(all_tokens.end(), ids.begin(), ids.end());
    all_tokens.emplace_back(tokenizer_->getVocabId(L"[SEP]"));

    // convert all_tokens to tensor
    auto tensor_text = torch::zeros({1, text_length}, torch::kInt32);
    for (auto i = 0; i < all_tokens.size(); i++) {
        tensor_text[0][i] = all_tokens[i];
    }

    // std::cout << "tensor size: " << tensor_text.sizes() << std::endl;

    return tensor_text;
}

}
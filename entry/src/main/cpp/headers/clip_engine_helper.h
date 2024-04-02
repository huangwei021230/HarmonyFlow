#pragma once

#include <clip_infer_engine.h>
#include <mutex>
#include <memory>
#include <cassert>

namespace CLIP {
class ClipEngineHelper {
public:

    static void Initialize(const std::string &dir) {
        std::lock_guard<std::mutex> lock(mutex_);
        file_dir = dir;
    }

//    static std::vector<float> GetImageFeature(const std::string& image_path) {
//        auto engine = instance();
//        assert(engine != nullptr);
//        auto tensor_feature = engine->getImageFeature(image_path);
//
//        float *data = tensor_feature.data_ptr<float>();
//        return std::vector<float>(data, data + tensor_feature.numel());
//    }

    static std::vector<float> GetTextFeature(const std::string& text) {
        auto engine = instance();
        assert(engine != nullptr);
        auto tensor_feature = engine->getTextFeature(text);

        float *data = tensor_feature.data_ptr<float>();
        return std::vector<float>(data, data + tensor_feature.numel());
    }

private:
    static ClipInferEngine* instance() {
        std::lock_guard<std::mutex> lock(mutex_);
        if (!instance_) {
            if (file_dir == "") return nullptr;
            auto image_encoder_path = file_dir + "/ImageEncoder.ptl";
            auto text_encoder_path = file_dir + "/TextEncoder.ptl";
            instance_ = std::make_unique<ClipInferEngine>(image_encoder_path, text_encoder_path, file_dir + "/vocab.txt");
        }
        return instance_.get();
    }

    static std::unique_ptr<ClipInferEngine> instance_;
    static std::mutex mutex_;
    static std::string file_dir;
};

std::unique_ptr<ClipInferEngine> ClipEngineHelper::instance_ = nullptr;
std::mutex ClipEngineHelper::mutex_;
std::string ClipEngineHelper::file_dir = "";
}
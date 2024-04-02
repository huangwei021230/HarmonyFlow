//
// Created on 2024/3/26.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
#include <hilog/log.h>
#include <iostream>
#include <sstream>
#include <fstream>
#include "headers/clip_engine_helper.h"
#include "headers/napi_util.h"

//TODO: to be deleted
static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t requireArgc = 2;
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "[DemoNative]", "Successfully use pytorch!");
    
    return sum;
}

//初始化模型文件目录
static napi_value Initialize(napi_env env, napi_callback_info info) {
    size_t requireArgc = 1;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);
    
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    // 保证valuetype0 是字符串类型，进行相应的操作
    bool ok = false;
    if (valuetype0 == napi_string) {
        const size_t MAX_SIZE = 256;
        char buf[MAX_SIZE];
        size_t size = 0;
        napi_get_value_string_utf8(env, args[0], buf, MAX_SIZE, &size);
        std::string file_dir(buf, size);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "[CLipNative]", "%{public}s", file_dir.c_str());
        ok = true;
        CLIP::ClipEngineHelper::Initialize(file_dir);
    }
    napi_value res_value;
    napi_get_boolean(env, ok, &res_value);
    return res_value;
}

// 文字转换成Feature
static napi_value GetTextFeature(napi_env env, napi_callback_info info) {
    size_t requireArgc = 1;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);
    
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    // 保证valuetype0 是字符串类型，进行相应的操作
    assert(valuetype0 == napi_string);
    const size_t MAX_SIZE = 256;
    char buf[MAX_SIZE];
    size_t size = 0;
    napi_get_value_string_utf8(env, args[0], buf, MAX_SIZE, &size);
    std::string text(buf, size);
    auto text_feature = CLIP::ClipEngineHelper::GetTextFeature(text);
    
    return ConvertVectorToJSArray(env, text_feature);
}

//// 图片转换成Feature
//static napi_value GetImageFeature(napi_env env, napi_callback_info info) {
//    size_t requireArgc = 1;
//    size_t argc = 1;
//    napi_value args[1] = {nullptr};
//    
//    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);
//    
//    napi_valuetype valuetype0;
//    napi_typeof(env, args[0], &valuetype0);
//    // 保证valuetype0 是字符串类型，进行相应的操作
//    assert(valuetype0 == napi_string);
//    const size_t MAX_SIZE = 256;
//    char buf[MAX_SIZE];
//    size_t size = 0;
//    napi_get_value_string_utf8(env, args[0], buf, MAX_SIZE, &size);
//    std::string img_path(buf, size);
//    
//    auto img_feature = CLIP::ClipEngineHelper::GetImageFeature(img_path);
//    
//    return ConvertVectorToJSArray(env, img_feature);
//}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"initialize", nullptr, Initialize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getTextFeature", nullptr, GetTextFeature, nullptr, nullptr, nullptr, napi_default, nullptr},
//        {"getImageFeature", nullptr, GetImageFeature, nullptr, nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END


static napi_module clipNativeModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "clipnative",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&clipNativeModule);
}


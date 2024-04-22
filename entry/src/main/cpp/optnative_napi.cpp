#include <iostream>
#include <sstream>
#include <fstream>
#include <opt_engine_helper.h>
#include <napi_util.h>
#include <hilog/log.h>

static napi_value Initialize(napi_env env, napi_callback_info info){
    size_t requireArgc = 1;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);
    
    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "[OptNative]", "%{public}s", "11");
    bool ok = false;
    if (valuetype == napi_string) {
        const size_t MAX_SIZE = 256;
        char buf[MAX_SIZE];
        size_t size = 0;
        napi_get_value_string_utf8(env, args[0], buf, MAX_SIZE, &size);
        std::string file_dir(buf, size);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "[OptNative]", "%{public}s", file_dir.c_str());
        ok = true;
        OPT::OPTEngineHelper::Initialize(file_dir);
    }
    napi_value result;
    napi_get_boolean(env, ok, &result);
    return result;
}

static napi_value GetReturnString(napi_env env, napi_callback_info info){
    size_t requireArgc = 1;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    assert(valuetype0 == napi_string);
    const size_t MAX_SIZE = 256;
    char buf[MAX_SIZE];
    size_t size = 0;
    napi_get_value_string_utf8(env, args[0], buf, MAX_SIZE, &size);
    std::string text(buf, size);
    auto gen_text = OPT::OPTEngineHelper::GetReturnString(text);
    return convertStringToNapiValue(env, gen_text);
}

static napi_value test(napi_env env, napi_callback_info info){
    size_t requireArgc = 1;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    assert(valuetype0 == napi_string);
    const size_t MAX_SIZE = 256;
    char buf[MAX_SIZE];
    size_t size = 0;
    napi_get_value_string_utf8(env, args[0], buf, MAX_SIZE, &size);
    
    std::string text(buf, size);
    OPT::OPTEngineHelper::test(text);
    std::string finish = "finished";
    return convertStringToNapiValue(env, finish);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"initialize", nullptr, Initialize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getReturnString", nullptr, GetReturnString, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"test", nullptr, test, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END


static napi_module optNativeModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "optnative",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&optNativeModule);
}

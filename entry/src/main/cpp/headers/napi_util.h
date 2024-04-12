#pragma once
#include "napi/native_api.h"
#include <hilog/log.h>
#include <cassert>

napi_value convertStringToNapiValue(napi_env env, const std::string& str) {
    napi_value result;
    napi_create_string_utf8(env, str.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}
#pragma once
#include "napi/native_api.h"
#include <hilog/log.h>
#include <cassert>

//将vector<float>转换成arkts 的array
napi_value ConvertVectorToJSArray(napi_env env, const std::vector<float>& vector) {
    // 创建一个新的空数组
    napi_status status;
    napi_value js_array;
    status = napi_create_array_with_length(env, vector.size(), &js_array);
    assert(status == napi_ok);

    // 遍历vector并填充到JS数组中
    for (size_t i = 0; i < vector.size(); ++i) {
        napi_value js_value;
        
        // 将每个float值转换成N-API的napi_value
        status = napi_create_double(env, static_cast<double>(vector[i]), &js_value);
        assert(status == napi_ok);
        // 将值设置到数组里
        status = napi_set_element(env, js_array, static_cast<uint32_t>(i), js_value);
        assert(status == napi_ok);
    }
    // 返回最终的JS数组
    return js_array;
}
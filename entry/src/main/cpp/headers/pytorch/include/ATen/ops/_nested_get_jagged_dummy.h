#pragma once

// @generated by torchgen/gen.py from Function.h

#include <ATen/Context.h>
#include <ATen/DeviceGuard.h>
#include <ATen/TensorUtils.h>
#include <ATen/TracerMode.h>
#include <ATen/core/Generator.h>
#include <ATen/core/Reduction.h>
#include <ATen/core/Tensor.h>
#include <c10/core/Scalar.h>
#include <c10/core/Storage.h>
#include <c10/core/TensorOptions.h>
#include <c10/util/Deprecated.h>
#include <c10/util/Optional.h>



#include <ATen/ops/_nested_get_jagged_dummy_ops.h>

namespace at {


// aten::_nested_get_jagged_dummy(Tensor any) -> Tensor
inline at::Tensor _nested_get_jagged_dummy(const at::Tensor & any) {
    return at::_ops::_nested_get_jagged_dummy::call(any);
}

}

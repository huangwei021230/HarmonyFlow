#pragma once

// @generated by torchgen/gen.py from NativeFunction.h

#include <c10/core/Scalar.h>
#include <c10/core/Storage.h>
#include <c10/core/TensorOptions.h>
#include <c10/util/Deprecated.h>
#include <c10/util/Optional.h>
#include <c10/core/QScheme.h>
#include <ATen/core/Reduction.h>
#include <ATen/core/Tensor.h>
#include <tuple>
#include <vector>


namespace at {
namespace native {
TORCH_API at::Tensor eye(int64_t n, c10::optional<at::ScalarType> dtype={}, c10::optional<at::Layout> layout={}, c10::optional<at::Device> device={}, c10::optional<bool> pin_memory={});
TORCH_API at::Tensor & eye_out_cpu(int64_t n, at::Tensor & out);
TORCH_API at::Tensor & eye_out_cuda(int64_t n, at::Tensor & out);
TORCH_API at::Tensor eye(int64_t n, int64_t m, c10::optional<at::ScalarType> dtype={}, c10::optional<at::Layout> layout={}, c10::optional<at::Device> device={}, c10::optional<bool> pin_memory={});
TORCH_API at::Tensor & eye_out_cpu(int64_t n, int64_t m, at::Tensor & out);
TORCH_API at::Tensor & eye_out_cuda(int64_t n, int64_t m, at::Tensor & out);
} // namespace native
} // namespace at

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



#include <ATen/ops/upsample_nearest2d_backward_ops.h>

namespace at {


// aten::upsample_nearest2d_backward.grad_input(Tensor grad_output, SymInt[2] output_size, SymInt[4] input_size, float? scales_h=None, float? scales_w=None, *, Tensor(a!) grad_input) -> Tensor(a!)
inline at::Tensor & upsample_nearest2d_backward_out(at::Tensor & grad_input, const at::Tensor & grad_output, at::IntArrayRef output_size, at::IntArrayRef input_size, ::std::optional<double> scales_h=::std::nullopt, ::std::optional<double> scales_w=::std::nullopt) {
    return at::_ops::upsample_nearest2d_backward_grad_input::call(grad_output, c10::fromIntArrayRefSlow(output_size), c10::fromIntArrayRefSlow(input_size), scales_h, scales_w, grad_input);
}
namespace symint {
  template <typename T, typename = std::enable_if_t<std::is_same<T, int64_t>::value>>
  at::Tensor & upsample_nearest2d_backward_out(at::Tensor & grad_input, const at::Tensor & grad_output, at::IntArrayRef output_size, at::IntArrayRef input_size, ::std::optional<double> scales_h=::std::nullopt, ::std::optional<double> scales_w=::std::nullopt) {
    return at::_ops::upsample_nearest2d_backward_grad_input::call(grad_output, c10::fromIntArrayRefSlow(output_size), c10::fromIntArrayRefSlow(input_size), scales_h, scales_w, grad_input);
  }
}

// aten::upsample_nearest2d_backward.grad_input(Tensor grad_output, SymInt[2] output_size, SymInt[4] input_size, float? scales_h=None, float? scales_w=None, *, Tensor(a!) grad_input) -> Tensor(a!)
inline at::Tensor & upsample_nearest2d_backward_outf(const at::Tensor & grad_output, at::IntArrayRef output_size, at::IntArrayRef input_size, ::std::optional<double> scales_h, ::std::optional<double> scales_w, at::Tensor & grad_input) {
    return at::_ops::upsample_nearest2d_backward_grad_input::call(grad_output, c10::fromIntArrayRefSlow(output_size), c10::fromIntArrayRefSlow(input_size), scales_h, scales_w, grad_input);
}
namespace symint {
  template <typename T, typename = std::enable_if_t<std::is_same<T, int64_t>::value>>
  at::Tensor & upsample_nearest2d_backward_outf(const at::Tensor & grad_output, at::IntArrayRef output_size, at::IntArrayRef input_size, ::std::optional<double> scales_h, ::std::optional<double> scales_w, at::Tensor & grad_input) {
    return at::_ops::upsample_nearest2d_backward_grad_input::call(grad_output, c10::fromIntArrayRefSlow(output_size), c10::fromIntArrayRefSlow(input_size), scales_h, scales_w, grad_input);
  }
}

// aten::upsample_nearest2d_backward.grad_input(Tensor grad_output, SymInt[2] output_size, SymInt[4] input_size, float? scales_h=None, float? scales_w=None, *, Tensor(a!) grad_input) -> Tensor(a!)
inline at::Tensor & upsample_nearest2d_backward_symint_out(at::Tensor & grad_input, const at::Tensor & grad_output, c10::SymIntArrayRef output_size, c10::SymIntArrayRef input_size, ::std::optional<double> scales_h=::std::nullopt, ::std::optional<double> scales_w=::std::nullopt) {
    return at::_ops::upsample_nearest2d_backward_grad_input::call(grad_output, output_size, input_size, scales_h, scales_w, grad_input);
}
namespace symint {
  template <typename T, typename = std::enable_if_t<std::is_same<T, c10::SymInt>::value>>
  at::Tensor & upsample_nearest2d_backward_out(at::Tensor & grad_input, const at::Tensor & grad_output, c10::SymIntArrayRef output_size, c10::SymIntArrayRef input_size, ::std::optional<double> scales_h=::std::nullopt, ::std::optional<double> scales_w=::std::nullopt) {
    return at::_ops::upsample_nearest2d_backward_grad_input::call(grad_output, output_size, input_size, scales_h, scales_w, grad_input);
  }
}

// aten::upsample_nearest2d_backward.grad_input(Tensor grad_output, SymInt[2] output_size, SymInt[4] input_size, float? scales_h=None, float? scales_w=None, *, Tensor(a!) grad_input) -> Tensor(a!)
inline at::Tensor & upsample_nearest2d_backward_symint_outf(const at::Tensor & grad_output, c10::SymIntArrayRef output_size, c10::SymIntArrayRef input_size, ::std::optional<double> scales_h, ::std::optional<double> scales_w, at::Tensor & grad_input) {
    return at::_ops::upsample_nearest2d_backward_grad_input::call(grad_output, output_size, input_size, scales_h, scales_w, grad_input);
}
namespace symint {
  template <typename T, typename = std::enable_if_t<std::is_same<T, c10::SymInt>::value>>
  at::Tensor & upsample_nearest2d_backward_outf(const at::Tensor & grad_output, c10::SymIntArrayRef output_size, c10::SymIntArrayRef input_size, ::std::optional<double> scales_h, ::std::optional<double> scales_w, at::Tensor & grad_input) {
    return at::_ops::upsample_nearest2d_backward_grad_input::call(grad_output, output_size, input_size, scales_h, scales_w, grad_input);
  }
}

// aten::upsample_nearest2d_backward(Tensor grad_output, SymInt[2] output_size, SymInt[4] input_size, float? scales_h=None, float? scales_w=None) -> Tensor
inline at::Tensor upsample_nearest2d_backward(const at::Tensor & grad_output, at::IntArrayRef output_size, at::IntArrayRef input_size, ::std::optional<double> scales_h=::std::nullopt, ::std::optional<double> scales_w=::std::nullopt) {
    return at::_ops::upsample_nearest2d_backward::call(grad_output, c10::fromIntArrayRefSlow(output_size), c10::fromIntArrayRefSlow(input_size), scales_h, scales_w);
}
namespace symint {
  template <typename T, typename = std::enable_if_t<std::is_same<T, int64_t>::value>>
  at::Tensor upsample_nearest2d_backward(const at::Tensor & grad_output, at::IntArrayRef output_size, at::IntArrayRef input_size, ::std::optional<double> scales_h=::std::nullopt, ::std::optional<double> scales_w=::std::nullopt) {
    return at::_ops::upsample_nearest2d_backward::call(grad_output, c10::fromIntArrayRefSlow(output_size), c10::fromIntArrayRefSlow(input_size), scales_h, scales_w);
  }
}

// aten::upsample_nearest2d_backward(Tensor grad_output, SymInt[2] output_size, SymInt[4] input_size, float? scales_h=None, float? scales_w=None) -> Tensor
inline at::Tensor upsample_nearest2d_backward_symint(const at::Tensor & grad_output, c10::SymIntArrayRef output_size, c10::SymIntArrayRef input_size, ::std::optional<double> scales_h=::std::nullopt, ::std::optional<double> scales_w=::std::nullopt) {
    return at::_ops::upsample_nearest2d_backward::call(grad_output, output_size, input_size, scales_h, scales_w);
}
namespace symint {
  template <typename T, typename = std::enable_if_t<std::is_same<T, c10::SymInt>::value>>
  at::Tensor upsample_nearest2d_backward(const at::Tensor & grad_output, c10::SymIntArrayRef output_size, c10::SymIntArrayRef input_size, ::std::optional<double> scales_h=::std::nullopt, ::std::optional<double> scales_w=::std::nullopt) {
    return at::_ops::upsample_nearest2d_backward::call(grad_output, output_size, input_size, scales_h, scales_w);
  }
}

}

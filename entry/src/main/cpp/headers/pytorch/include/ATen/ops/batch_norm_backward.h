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



#include <ATen/ops/batch_norm_backward_ops.h>

namespace at {


// aten::batch_norm_backward(Tensor grad_out, Tensor input, Tensor weight, Tensor? running_mean, Tensor? running_var, Tensor? save_mean, Tensor? save_var, bool update, float eps, bool[3] output_mask, Tensor reserve) -> (Tensor, Tensor, Tensor)
inline ::std::tuple<at::Tensor,at::Tensor,at::Tensor> batch_norm_backward(const at::Tensor & grad_out, const at::Tensor & input, const at::Tensor & weight, const ::std::optional<at::Tensor> & running_mean, const ::std::optional<at::Tensor> & running_var, const ::std::optional<at::Tensor> & save_mean, const ::std::optional<at::Tensor> & save_var, bool update, double eps, ::std::array<bool,3> output_mask, const at::Tensor & reserve) {
    return at::_ops::batch_norm_backward::call(grad_out, input, weight, running_mean, running_var, save_mean, save_var, update, eps, output_mask, reserve);
}

}

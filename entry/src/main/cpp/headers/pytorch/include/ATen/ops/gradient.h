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



#include <ATen/ops/gradient_ops.h>

namespace at {


// aten::gradient.scalarint(Tensor self, *, Scalar? spacing=None, int? dim=None, int edge_order=1) -> Tensor[]
inline ::std::vector<at::Tensor> gradient(const at::Tensor & self, const ::std::optional<at::Scalar> & spacing=::std::nullopt, ::std::optional<int64_t> dim=::std::nullopt, int64_t edge_order=1) {
    return at::_ops::gradient_scalarint::call(self, spacing, dim, edge_order);
}

// aten::gradient.scalararray(Tensor self, *, Scalar spacing, int[] dim, int edge_order=1) -> Tensor[]
inline ::std::vector<at::Tensor> gradient(const at::Tensor & self, const at::Scalar & spacing, at::IntArrayRef dim, int64_t edge_order=1) {
    return at::_ops::gradient_scalararray::call(self, spacing, dim, edge_order);
}

// aten::gradient.array(Tensor self, *, int[] dim, int edge_order=1) -> Tensor[]
inline ::std::vector<at::Tensor> gradient(const at::Tensor & self, at::IntArrayRef dim, int64_t edge_order=1) {
    return at::_ops::gradient_array::call(self, dim, edge_order);
}

// aten::gradient.scalarrayint(Tensor self, *, Scalar[] spacing, int? dim=None, int edge_order=1) -> Tensor[]
inline ::std::vector<at::Tensor> gradient(const at::Tensor & self, at::ArrayRef<at::Scalar> spacing, ::std::optional<int64_t> dim=::std::nullopt, int64_t edge_order=1) {
    return at::_ops::gradient_scalarrayint::call(self, spacing, dim, edge_order);
}

// aten::gradient.scalarrayarray(Tensor self, *, Scalar[] spacing, int[] dim, int edge_order=1) -> Tensor[]
inline ::std::vector<at::Tensor> gradient(const at::Tensor & self, at::ArrayRef<at::Scalar> spacing, at::IntArrayRef dim, int64_t edge_order=1) {
    return at::_ops::gradient_scalarrayarray::call(self, spacing, dim, edge_order);
}

// aten::gradient.tensorarrayint(Tensor self, *, Tensor[] spacing, int? dim=None, int edge_order=1) -> Tensor[]
inline ::std::vector<at::Tensor> gradient(const at::Tensor & self, at::TensorList spacing, ::std::optional<int64_t> dim=::std::nullopt, int64_t edge_order=1) {
    return at::_ops::gradient_tensorarrayint::call(self, spacing, dim, edge_order);
}

// aten::gradient.tensorarray(Tensor self, *, Tensor[] spacing, int[] dim, int edge_order=1) -> Tensor[]
inline ::std::vector<at::Tensor> gradient(const at::Tensor & self, at::TensorList spacing, at::IntArrayRef dim, int64_t edge_order=1) {
    return at::_ops::gradient_tensorarray::call(self, spacing, dim, edge_order);
}

}

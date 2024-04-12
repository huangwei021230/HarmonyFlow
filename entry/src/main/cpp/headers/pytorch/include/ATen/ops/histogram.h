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



#include <ATen/ops/histogram_ops.h>

namespace at {


// aten::histogram.bins_tensor_out(Tensor self, Tensor bins, *, Tensor? weight=None, bool density=False, Tensor(a!) hist, Tensor(b!) bin_edges) -> (Tensor(a!) hist, Tensor(b!) bin_edges)
inline ::std::tuple<at::Tensor &,at::Tensor &> histogram_out(at::Tensor & hist, at::Tensor & bin_edges, const at::Tensor & self, const at::Tensor & bins, const ::std::optional<at::Tensor> & weight={}, bool density=false) {
    return at::_ops::histogram_bins_tensor_out::call(self, bins, weight, density, hist, bin_edges);
}
// aten::histogram.bins_tensor_out(Tensor self, Tensor bins, *, Tensor? weight=None, bool density=False, Tensor(a!) hist, Tensor(b!) bin_edges) -> (Tensor(a!) hist, Tensor(b!) bin_edges)
inline ::std::tuple<at::Tensor &,at::Tensor &> histogram_outf(const at::Tensor & self, const at::Tensor & bins, const ::std::optional<at::Tensor> & weight, bool density, at::Tensor & hist, at::Tensor & bin_edges) {
    return at::_ops::histogram_bins_tensor_out::call(self, bins, weight, density, hist, bin_edges);
}

// aten::histogram.bins_tensor(Tensor self, Tensor bins, *, Tensor? weight=None, bool density=False) -> (Tensor hist, Tensor bin_edges)
inline ::std::tuple<at::Tensor,at::Tensor> histogram(const at::Tensor & self, const at::Tensor & bins, const ::std::optional<at::Tensor> & weight={}, bool density=false) {
    return at::_ops::histogram_bins_tensor::call(self, bins, weight, density);
}

// aten::histogram.bin_ct_out(Tensor self, int bins=100, *, float[]? range=None, Tensor? weight=None, bool density=False, Tensor(a!) hist, Tensor(b!) bin_edges) -> (Tensor(a!) hist, Tensor(b!) bin_edges)
inline ::std::tuple<at::Tensor &,at::Tensor &> histogram_out(at::Tensor & hist, at::Tensor & bin_edges, const at::Tensor & self, int64_t bins=100, ::std::optional<at::ArrayRef<double>> range=::std::nullopt, const ::std::optional<at::Tensor> & weight={}, bool density=false) {
    return at::_ops::histogram_bin_ct_out::call(self, bins, range, weight, density, hist, bin_edges);
}
// aten::histogram.bin_ct_out(Tensor self, int bins=100, *, float[]? range=None, Tensor? weight=None, bool density=False, Tensor(a!) hist, Tensor(b!) bin_edges) -> (Tensor(a!) hist, Tensor(b!) bin_edges)
inline ::std::tuple<at::Tensor &,at::Tensor &> histogram_outf(const at::Tensor & self, int64_t bins, ::std::optional<at::ArrayRef<double>> range, const ::std::optional<at::Tensor> & weight, bool density, at::Tensor & hist, at::Tensor & bin_edges) {
    return at::_ops::histogram_bin_ct_out::call(self, bins, range, weight, density, hist, bin_edges);
}

// aten::histogram.bin_ct(Tensor self, int bins=100, *, float[]? range=None, Tensor? weight=None, bool density=False) -> (Tensor hist, Tensor bin_edges)
inline ::std::tuple<at::Tensor,at::Tensor> histogram(const at::Tensor & self, int64_t bins=100, ::std::optional<at::ArrayRef<double>> range=::std::nullopt, const ::std::optional<at::Tensor> & weight={}, bool density=false) {
    return at::_ops::histogram_bin_ct::call(self, bins, range, weight, density);
}

}

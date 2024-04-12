#pragma once
// @generated by torchgen/gen.py from DispatchKeyFunction.h

// NB: The implementing C++ file is RegisterDispatchKey.cpp

// The only #includes we need are for custom classes that have defaults in the C++ API
#include <c10/core/MemoryFormat.h>
#include <c10/core/Scalar.h>
#include <ATen/core/Reduction.h>

// Forward declarations of any types needed in the operator signatures.
// We can't directly include these classes because it will cause circular include dependencies.
// This file is included by TensorBody.h, which defines the Tensor class.
#include <ATen/core/ATen_fwd.h>

namespace at {

namespace cuda {

TORCH_API at::Tensor ormqr(const at::Tensor & self, const at::Tensor & input2, const at::Tensor & input3, bool left=true, bool transpose=false);
TORCH_API at::Tensor & ormqr_out(at::Tensor & out, const at::Tensor & self, const at::Tensor & input2, const at::Tensor & input3, bool left=true, bool transpose=false);
TORCH_API at::Tensor & ormqr_outf(const at::Tensor & self, const at::Tensor & input2, const at::Tensor & input3, bool left, bool transpose, at::Tensor & out);

} // namespace cuda
} // namespace at

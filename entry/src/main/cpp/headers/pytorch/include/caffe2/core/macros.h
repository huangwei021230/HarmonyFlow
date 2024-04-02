// Automatically generated header file for caffe2 macros. These
// macros are used to build the Caffe2 binary, and if you are
// building a dependent library, they will need to be set as well
// for your program to link correctly.

#pragma once

#define CAFFE2_BUILD_SHARED_LIBS
/* #undef CAFFE2_FORCE_FALLBACK_CUDA_MPI */
/* #undef CAFFE2_HAS_MKL_DNN */
/* #undef CAFFE2_HAS_MKL_SGEMM_PACK */
/* #undef CAFFE2_PERF_WITH_AVX */
/* #undef CAFFE2_PERF_WITH_AVX2 */
/* #undef CAFFE2_PERF_WITH_AVX512 */
/* #undef CAFFE2_THREADPOOL_MAIN_IMBALANCE */
/* #undef CAFFE2_THREADPOOL_STATS */
#define CAFFE2_USE_EXCEPTION_PTR
/* #undef CAFFE2_USE_ACCELERATE */
/* #undef CAFFE2_USE_CUDNN */
#define CAFFE2_USE_EIGEN_FOR_BLAS
/* #undef CAFFE2_USE_FBCODE */
/* #undef CAFFE2_USE_GOOGLE_GLOG */
/* #undef CAFFE2_USE_LITE_PROTO */
/* #undef CAFFE2_USE_MKL */
/* #undef USE_MKLDNN */
/* #undef CAFFE2_USE_NVTX */
/* #undef CAFFE2_USE_ITT */
/* #undef CAFFE2_USE_TRT */

#ifndef EIGEN_MPL2_ONLY
#define EIGEN_MPL2_ONLY
#endif

// Useful build settings that are recorded in the compiled binary
// torch.__build__.show()
#define CAFFE2_BUILD_STRINGS { \
  {"TORCH_VERSION", "2.3.0"}, \
  {"CXX_COMPILER", "/mnt/ssd/yicw/OH4.0-debug/prebuilts/ohos-sdk/linux/10/native/llvm/bin/clang++"}, \
  {"CXX_FLAGS", "-fdata-sections -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -fno-addrsig -Wa,--noexecstack -Wformat -Werror=format-security   -D__MUSL__ -ffunction-sections -fdata-sections -DC10_MOBILE -fvisibility-inlines-hidden -DUSE_PTHREADPOOL -DUSE_KINETO -DLIBKINETO_NOCUPTI -DLIBKINETO_NOROCTRACER -DBUILD_LITE_INTERPRETER -DSYMBOLICATE_MOBILE_DEBUG_HANDLE -DEDGE_PROFILER_USE_KINETO -O2 -fPIC -Wall -Wextra -Werror=return-type -Werror=non-virtual-dtor -Werror=braced-scalar-init -Werror=range-loop-construct -Werror=bool-operation -Wnarrowing -Wno-missing-field-initializers -Wno-type-limits -Wno-array-bounds -Wno-unknown-pragmas -Wno-unused-parameter -Wno-unused-function -Wno-unused-result -Wno-strict-overflow -Wno-strict-aliasing -Wvla-extension -Wsuggest-override -Wnewline-eof -Winconsistent-missing-override -Winconsistent-missing-destructor-override -Wno-pass-failed -Wno-error=pedantic -Wno-error=old-style-cast -Wno-error=inconsistent-missing-override -Wno-error=inconsistent-missing-destructor-override -Wconstant-conversion -Wno-invalid-partial-specialization -Wno-missing-braces -Qunused-arguments -fcolor-diagnostics -faligned-new -Wno-unused-but-set-variable -fno-math-errno -fno-trapping-math -Werror=format"}, \
  {"BUILD_TYPE", "Release"}, \
  {"BLAS_INFO", ""}, \
  {"LAPACK_INFO", ""}, \
  {"USE_CUDA", "OFF"}, \
  {"USE_ROCM", "OFF"}, \
  {"CUDA_VERSION", ""}, \
  {"ROCM_VERSION", ""}, \
  {"USE_CUDNN", "OFF"}, \
  {"CUDNN_VERSION", ""}, \
  {"USE_NCCL", "OFF"}, \
  {"USE_MPI", "OFF"}, \
  {"USE_GFLAGS", "OFF"}, \
  {"USE_GLOG", "OFF"}, \
  {"USE_GLOO", "OFF"}, \
  {"USE_NNPACK", "OFF"}, \
  {"USE_OPENMP", "OFF"}, \
  {"FORCE_FALLBACK_CUDA_MPI", ""}, \
  {"HAS_MKL_DNN", ""}, \
  {"HAS_MKL_SGEMM_PACK", ""}, \
  {"PERF_WITH_AVX", ""}, \
  {"PERF_WITH_AVX2", ""}, \
  {"PERF_WITH_AVX512", ""}, \
  {"USE_EXCEPTION_PTR", "1"}, \
  {"USE_ACCELERATE", ""}, \
  {"USE_EIGEN_FOR_BLAS", "ON"}, \
  {"USE_LITE_PROTO", ""}, \
  {"USE_MKL", ""}, \
  {"USE_MKLDNN", "OFF"}, \
  {"USE_NVTX", ""}, \
  {"USE_ITT", ""}, \
  {"USE_TRT", ""}, \
  {"USE_ROCM_KERNEL_ASSERT", "OFF"}, \
  {"USE_CUSPARSELT", "OFF"}, \
}

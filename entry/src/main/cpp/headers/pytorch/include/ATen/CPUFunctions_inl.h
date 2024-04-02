#pragma once
// @generated by torchgen/gen.py from DispatchKeyFunctions_inl.h

// NB: The implementing C++ file is RegisterDispatchKey.cpp

// The only #includes we need are for custom classes that have defaults in the C++ API
#include <c10/core/MemoryFormat.h>
#include <c10/core/Scalar.h>
#include <ATen/core/Reduction.h>

#if defined(AT_PER_OPERATOR_HEADERS) && defined(TORCH_ASSERT_ONLY_METHOD_OPERATORS)
#error This change adds a dependency on all pytorch operators, meaning the     \
  file will need to be re-compiled every time an operator is changed or added. \
  Consider including a specific operator from                                  \
  <ATen/ops/{my_operator}_cpu_dispatch.h>.                   \
  See NOTE [TORCH_ASSERT_ONLY_METHOD_OPERATORS].
#endif

#include <ATen/ops/_adaptive_avg_pool2d_cpu_dispatch.h>
#include <ATen/ops/_adaptive_avg_pool2d_backward_cpu_dispatch.h>
#include <ATen/ops/_adaptive_avg_pool3d_cpu_dispatch.h>
#include <ATen/ops/_adaptive_avg_pool3d_backward_cpu_dispatch.h>
#include <ATen/ops/_add_relu_cpu_dispatch.h>
#include <ATen/ops/_addmm_activation_cpu_dispatch.h>
#include <ATen/ops/_aminmax_cpu_dispatch.h>
#include <ATen/ops/_amp_foreach_non_finite_check_and_unscale_cpu_dispatch.h>
#include <ATen/ops/_amp_update_scale_cpu_dispatch.h>
#include <ATen/ops/_assert_async_cpu_dispatch.h>
#include <ATen/ops/_cdist_backward_cpu_dispatch.h>
#include <ATen/ops/_cdist_forward_cpu_dispatch.h>
#include <ATen/ops/_cholesky_solve_helper_cpu_dispatch.h>
#include <ATen/ops/_compute_linear_combination_cpu_dispatch.h>
#include <ATen/ops/_convert_indices_from_coo_to_csr_cpu_dispatch.h>
#include <ATen/ops/_convert_indices_from_csr_to_coo_cpu_dispatch.h>
#include <ATen/ops/_ctc_loss_cpu_dispatch.h>
#include <ATen/ops/_ctc_loss_backward_cpu_dispatch.h>
#include <ATen/ops/_cummax_helper_cpu_dispatch.h>
#include <ATen/ops/_cummin_helper_cpu_dispatch.h>
#include <ATen/ops/_dirichlet_grad_cpu_dispatch.h>
#include <ATen/ops/_efficientzerotensor_cpu_dispatch.h>
#include <ATen/ops/_embedding_bag_cpu_dispatch.h>
#include <ATen/ops/_embedding_bag_dense_backward_cpu_dispatch.h>
#include <ATen/ops/_embedding_bag_forward_only_cpu_dispatch.h>
#include <ATen/ops/_embedding_bag_per_sample_weights_backward_cpu_dispatch.h>
#include <ATen/ops/_empty_affine_quantized_cpu_dispatch.h>
#include <ATen/ops/_empty_per_channel_affine_quantized_cpu_dispatch.h>
#include <ATen/ops/_fake_quantize_learnable_per_channel_affine_cpu_dispatch.h>
#include <ATen/ops/_fake_quantize_learnable_per_channel_affine_backward_cpu_dispatch.h>
#include <ATen/ops/_fake_quantize_learnable_per_tensor_affine_cpu_dispatch.h>
#include <ATen/ops/_fake_quantize_learnable_per_tensor_affine_backward_cpu_dispatch.h>
#include <ATen/ops/_fake_quantize_per_tensor_affine_cachemask_tensor_qparams_cpu_dispatch.h>
#include <ATen/ops/_fft_c2c_cpu_dispatch.h>
#include <ATen/ops/_fft_c2r_cpu_dispatch.h>
#include <ATen/ops/_fft_r2c_cpu_dispatch.h>
#include <ATen/ops/_foobar_cpu_dispatch.h>
#include <ATen/ops/_foreach_abs_cpu_dispatch.h>
#include <ATen/ops/_foreach_acos_cpu_dispatch.h>
#include <ATen/ops/_foreach_add_cpu_dispatch.h>
#include <ATen/ops/_foreach_addcdiv_cpu_dispatch.h>
#include <ATen/ops/_foreach_addcmul_cpu_dispatch.h>
#include <ATen/ops/_foreach_asin_cpu_dispatch.h>
#include <ATen/ops/_foreach_atan_cpu_dispatch.h>
#include <ATen/ops/_foreach_ceil_cpu_dispatch.h>
#include <ATen/ops/_foreach_clamp_max_cpu_dispatch.h>
#include <ATen/ops/_foreach_clamp_min_cpu_dispatch.h>
#include <ATen/ops/_foreach_copy_cpu_dispatch.h>
#include <ATen/ops/_foreach_cos_cpu_dispatch.h>
#include <ATen/ops/_foreach_cosh_cpu_dispatch.h>
#include <ATen/ops/_foreach_div_cpu_dispatch.h>
#include <ATen/ops/_foreach_erf_cpu_dispatch.h>
#include <ATen/ops/_foreach_erfc_cpu_dispatch.h>
#include <ATen/ops/_foreach_exp_cpu_dispatch.h>
#include <ATen/ops/_foreach_expm1_cpu_dispatch.h>
#include <ATen/ops/_foreach_floor_cpu_dispatch.h>
#include <ATen/ops/_foreach_frac_cpu_dispatch.h>
#include <ATen/ops/_foreach_lerp_cpu_dispatch.h>
#include <ATen/ops/_foreach_lgamma_cpu_dispatch.h>
#include <ATen/ops/_foreach_log_cpu_dispatch.h>
#include <ATen/ops/_foreach_log10_cpu_dispatch.h>
#include <ATen/ops/_foreach_log1p_cpu_dispatch.h>
#include <ATen/ops/_foreach_log2_cpu_dispatch.h>
#include <ATen/ops/_foreach_maximum_cpu_dispatch.h>
#include <ATen/ops/_foreach_minimum_cpu_dispatch.h>
#include <ATen/ops/_foreach_mul_cpu_dispatch.h>
#include <ATen/ops/_foreach_neg_cpu_dispatch.h>
#include <ATen/ops/_foreach_norm_cpu_dispatch.h>
#include <ATen/ops/_foreach_pow_cpu_dispatch.h>
#include <ATen/ops/_foreach_reciprocal_cpu_dispatch.h>
#include <ATen/ops/_foreach_round_cpu_dispatch.h>
#include <ATen/ops/_foreach_sigmoid_cpu_dispatch.h>
#include <ATen/ops/_foreach_sign_cpu_dispatch.h>
#include <ATen/ops/_foreach_sin_cpu_dispatch.h>
#include <ATen/ops/_foreach_sinh_cpu_dispatch.h>
#include <ATen/ops/_foreach_sqrt_cpu_dispatch.h>
#include <ATen/ops/_foreach_sub_cpu_dispatch.h>
#include <ATen/ops/_foreach_tan_cpu_dispatch.h>
#include <ATen/ops/_foreach_tanh_cpu_dispatch.h>
#include <ATen/ops/_foreach_trunc_cpu_dispatch.h>
#include <ATen/ops/_foreach_zero_cpu_dispatch.h>
#include <ATen/ops/_functional_assert_async_cpu_dispatch.h>
#include <ATen/ops/_fused_moving_avg_obs_fq_helper_cpu_dispatch.h>
#include <ATen/ops/_fused_sdp_choice_cpu_dispatch.h>
#include <ATen/ops/_histogramdd_bin_edges_cpu_dispatch.h>
#include <ATen/ops/_histogramdd_from_bin_cts_cpu_dispatch.h>
#include <ATen/ops/_histogramdd_from_bin_tensors_cpu_dispatch.h>
#include <ATen/ops/_index_put_impl_cpu_dispatch.h>
#include <ATen/ops/_linalg_det_cpu_dispatch.h>
#include <ATen/ops/_linalg_eigh_cpu_dispatch.h>
#include <ATen/ops/_linalg_slogdet_cpu_dispatch.h>
#include <ATen/ops/_linalg_solve_ex_cpu_dispatch.h>
#include <ATen/ops/_linalg_svd_cpu_dispatch.h>
#include <ATen/ops/_local_scalar_dense_cpu_dispatch.h>
#include <ATen/ops/_log_softmax_cpu_dispatch.h>
#include <ATen/ops/_log_softmax_backward_data_cpu_dispatch.h>
#include <ATen/ops/_logcumsumexp_cpu_dispatch.h>
#include <ATen/ops/_make_dep_token_cpu_dispatch.h>
#include <ATen/ops/_make_per_channel_quantized_tensor_cpu_dispatch.h>
#include <ATen/ops/_make_per_tensor_quantized_tensor_cpu_dispatch.h>
#include <ATen/ops/_masked_softmax_cpu_dispatch.h>
#include <ATen/ops/_masked_softmax_backward_cpu_dispatch.h>
#include <ATen/ops/_native_batch_norm_legit_cpu_dispatch.h>
#include <ATen/ops/_native_multi_head_attention_cpu_dispatch.h>
#include <ATen/ops/_nested_from_padded_cpu_dispatch.h>
#include <ATen/ops/_nested_tensor_from_mask_cpu_dispatch.h>
#include <ATen/ops/_nested_tensor_from_mask_left_aligned_cpu_dispatch.h>
#include <ATen/ops/_nested_view_from_buffer_cpu_dispatch.h>
#include <ATen/ops/_pdist_backward_cpu_dispatch.h>
#include <ATen/ops/_pdist_forward_cpu_dispatch.h>
#include <ATen/ops/_prelu_kernel_cpu_dispatch.h>
#include <ATen/ops/_prelu_kernel_backward_cpu_dispatch.h>
#include <ATen/ops/_reshape_alias_cpu_dispatch.h>
#include <ATen/ops/_sample_dirichlet_cpu_dispatch.h>
#include <ATen/ops/_scaled_dot_product_flash_attention_for_cpu_cpu_dispatch.h>
#include <ATen/ops/_scaled_dot_product_flash_attention_for_cpu_backward_cpu_dispatch.h>
#include <ATen/ops/_segment_reduce_backward_cpu_dispatch.h>
#include <ATen/ops/_slow_conv2d_backward_cpu_dispatch.h>
#include <ATen/ops/_slow_conv2d_forward_cpu_dispatch.h>
#include <ATen/ops/_softmax_cpu_dispatch.h>
#include <ATen/ops/_softmax_backward_data_cpu_dispatch.h>
#include <ATen/ops/_spdiags_cpu_dispatch.h>
#include <ATen/ops/_stack_cpu_dispatch.h>
#include <ATen/ops/_standard_gamma_cpu_dispatch.h>
#include <ATen/ops/_standard_gamma_grad_cpu_dispatch.h>
#include <ATen/ops/_test_functorch_fallback_cpu_dispatch.h>
#include <ATen/ops/_test_optional_filled_intlist_cpu_dispatch.h>
#include <ATen/ops/_test_optional_floatlist_cpu_dispatch.h>
#include <ATen/ops/_test_optional_intlist_cpu_dispatch.h>
#include <ATen/ops/_to_sparse_cpu_dispatch.h>
#include <ATen/ops/_to_sparse_bsc_cpu_dispatch.h>
#include <ATen/ops/_to_sparse_bsr_cpu_dispatch.h>
#include <ATen/ops/_to_sparse_csc_cpu_dispatch.h>
#include <ATen/ops/_to_sparse_csr_cpu_dispatch.h>
#include <ATen/ops/_transform_bias_rescale_qkv_cpu_dispatch.h>
#include <ATen/ops/_transformer_encoder_layer_fwd_cpu_dispatch.h>
#include <ATen/ops/_unique_cpu_dispatch.h>
#include <ATen/ops/_unique2_cpu_dispatch.h>
#include <ATen/ops/_upsample_bicubic2d_aa_cpu_dispatch.h>
#include <ATen/ops/_upsample_bicubic2d_aa_backward_cpu_dispatch.h>
#include <ATen/ops/_upsample_bilinear2d_aa_cpu_dispatch.h>
#include <ATen/ops/_upsample_bilinear2d_aa_backward_cpu_dispatch.h>
#include <ATen/ops/_upsample_nearest_exact1d_cpu_dispatch.h>
#include <ATen/ops/_upsample_nearest_exact1d_backward_cpu_dispatch.h>
#include <ATen/ops/_upsample_nearest_exact2d_cpu_dispatch.h>
#include <ATen/ops/_upsample_nearest_exact2d_backward_cpu_dispatch.h>
#include <ATen/ops/_upsample_nearest_exact3d_cpu_dispatch.h>
#include <ATen/ops/_upsample_nearest_exact3d_backward_cpu_dispatch.h>
#include <ATen/ops/_validate_compressed_sparse_indices_cpu_dispatch.h>
#include <ATen/ops/_weight_norm_interface_cpu_dispatch.h>
#include <ATen/ops/_weight_norm_interface_backward_cpu_dispatch.h>
#include <ATen/ops/abs_cpu_dispatch.h>
#include <ATen/ops/acos_cpu_dispatch.h>
#include <ATen/ops/acosh_cpu_dispatch.h>
#include <ATen/ops/adaptive_avg_pool2d_cpu_dispatch.h>
#include <ATen/ops/adaptive_avg_pool3d_cpu_dispatch.h>
#include <ATen/ops/adaptive_avg_pool3d_backward_cpu_dispatch.h>
#include <ATen/ops/adaptive_max_pool2d_cpu_dispatch.h>
#include <ATen/ops/adaptive_max_pool2d_backward_cpu_dispatch.h>
#include <ATen/ops/adaptive_max_pool3d_cpu_dispatch.h>
#include <ATen/ops/adaptive_max_pool3d_backward_cpu_dispatch.h>
#include <ATen/ops/add_cpu_dispatch.h>
#include <ATen/ops/addbmm_cpu_dispatch.h>
#include <ATen/ops/addcdiv_cpu_dispatch.h>
#include <ATen/ops/addcmul_cpu_dispatch.h>
#include <ATen/ops/addmm_cpu_dispatch.h>
#include <ATen/ops/addmv_cpu_dispatch.h>
#include <ATen/ops/addr_cpu_dispatch.h>
#include <ATen/ops/all_cpu_dispatch.h>
#include <ATen/ops/amax_cpu_dispatch.h>
#include <ATen/ops/amin_cpu_dispatch.h>
#include <ATen/ops/aminmax_cpu_dispatch.h>
#include <ATen/ops/angle_cpu_dispatch.h>
#include <ATen/ops/any_cpu_dispatch.h>
#include <ATen/ops/arange_cpu_dispatch.h>
#include <ATen/ops/argmax_cpu_dispatch.h>
#include <ATen/ops/argmin_cpu_dispatch.h>
#include <ATen/ops/argsort_cpu_dispatch.h>
#include <ATen/ops/as_strided_cpu_dispatch.h>
#include <ATen/ops/asin_cpu_dispatch.h>
#include <ATen/ops/asinh_cpu_dispatch.h>
#include <ATen/ops/atan_cpu_dispatch.h>
#include <ATen/ops/atan2_cpu_dispatch.h>
#include <ATen/ops/atanh_cpu_dispatch.h>
#include <ATen/ops/avg_pool2d_cpu_dispatch.h>
#include <ATen/ops/avg_pool2d_backward_cpu_dispatch.h>
#include <ATen/ops/avg_pool3d_cpu_dispatch.h>
#include <ATen/ops/avg_pool3d_backward_cpu_dispatch.h>
#include <ATen/ops/baddbmm_cpu_dispatch.h>
#include <ATen/ops/batch_norm_update_stats_cpu_dispatch.h>
#include <ATen/ops/bernoulli_cpu_dispatch.h>
#include <ATen/ops/binary_cross_entropy_cpu_dispatch.h>
#include <ATen/ops/binary_cross_entropy_backward_cpu_dispatch.h>
#include <ATen/ops/bincount_cpu_dispatch.h>
#include <ATen/ops/binomial_cpu_dispatch.h>
#include <ATen/ops/bitwise_and_cpu_dispatch.h>
#include <ATen/ops/bitwise_left_shift_cpu_dispatch.h>
#include <ATen/ops/bitwise_not_cpu_dispatch.h>
#include <ATen/ops/bitwise_or_cpu_dispatch.h>
#include <ATen/ops/bitwise_right_shift_cpu_dispatch.h>
#include <ATen/ops/bitwise_xor_cpu_dispatch.h>
#include <ATen/ops/bmm_cpu_dispatch.h>
#include <ATen/ops/bucketize_cpu_dispatch.h>
#include <ATen/ops/cat_cpu_dispatch.h>
#include <ATen/ops/cauchy_cpu_dispatch.h>
#include <ATen/ops/ceil_cpu_dispatch.h>
#include <ATen/ops/channel_shuffle_cpu_dispatch.h>
#include <ATen/ops/cholesky_cpu_dispatch.h>
#include <ATen/ops/cholesky_inverse_cpu_dispatch.h>
#include <ATen/ops/clamp_cpu_dispatch.h>
#include <ATen/ops/clamp_max_cpu_dispatch.h>
#include <ATen/ops/clamp_min_cpu_dispatch.h>
#include <ATen/ops/col2im_cpu_dispatch.h>
#include <ATen/ops/complex_cpu_dispatch.h>
#include <ATen/ops/conj_physical_cpu_dispatch.h>
#include <ATen/ops/copysign_cpu_dispatch.h>
#include <ATen/ops/cos_cpu_dispatch.h>
#include <ATen/ops/cosh_cpu_dispatch.h>
#include <ATen/ops/count_nonzero_cpu_dispatch.h>
#include <ATen/ops/cumprod_cpu_dispatch.h>
#include <ATen/ops/cumsum_cpu_dispatch.h>
#include <ATen/ops/dense_dim_cpu_dispatch.h>
#include <ATen/ops/dequantize_cpu_dispatch.h>
#include <ATen/ops/digamma_cpu_dispatch.h>
#include <ATen/ops/div_cpu_dispatch.h>
#include <ATen/ops/dot_cpu_dispatch.h>
#include <ATen/ops/elu_cpu_dispatch.h>
#include <ATen/ops/elu_backward_cpu_dispatch.h>
#include <ATen/ops/embedding_dense_backward_cpu_dispatch.h>
#include <ATen/ops/embedding_renorm_cpu_dispatch.h>
#include <ATen/ops/empty_cpu_dispatch.h>
#include <ATen/ops/empty_strided_cpu_dispatch.h>
#include <ATen/ops/eq_cpu_dispatch.h>
#include <ATen/ops/equal_cpu_dispatch.h>
#include <ATen/ops/erf_cpu_dispatch.h>
#include <ATen/ops/erfc_cpu_dispatch.h>
#include <ATen/ops/erfinv_cpu_dispatch.h>
#include <ATen/ops/exp_cpu_dispatch.h>
#include <ATen/ops/exp2_cpu_dispatch.h>
#include <ATen/ops/expm1_cpu_dispatch.h>
#include <ATen/ops/exponential_cpu_dispatch.h>
#include <ATen/ops/eye_cpu_dispatch.h>
#include <ATen/ops/fake_quantize_per_channel_affine_cachemask_cpu_dispatch.h>
#include <ATen/ops/fake_quantize_per_tensor_affine_cachemask_cpu_dispatch.h>
#include <ATen/ops/fill_cpu_dispatch.h>
#include <ATen/ops/flip_cpu_dispatch.h>
#include <ATen/ops/floor_cpu_dispatch.h>
#include <ATen/ops/floor_divide_cpu_dispatch.h>
#include <ATen/ops/fmax_cpu_dispatch.h>
#include <ATen/ops/fmin_cpu_dispatch.h>
#include <ATen/ops/fmod_cpu_dispatch.h>
#include <ATen/ops/frac_cpu_dispatch.h>
#include <ATen/ops/fractional_max_pool2d_cpu_dispatch.h>
#include <ATen/ops/fractional_max_pool2d_backward_cpu_dispatch.h>
#include <ATen/ops/fractional_max_pool3d_cpu_dispatch.h>
#include <ATen/ops/fractional_max_pool3d_backward_cpu_dispatch.h>
#include <ATen/ops/frexp_cpu_dispatch.h>
#include <ATen/ops/from_file_cpu_dispatch.h>
#include <ATen/ops/gather_cpu_dispatch.h>
#include <ATen/ops/gcd_cpu_dispatch.h>
#include <ATen/ops/ge_cpu_dispatch.h>
#include <ATen/ops/gelu_cpu_dispatch.h>
#include <ATen/ops/gelu_backward_cpu_dispatch.h>
#include <ATen/ops/geometric_cpu_dispatch.h>
#include <ATen/ops/geqrf_cpu_dispatch.h>
#include <ATen/ops/glu_cpu_dispatch.h>
#include <ATen/ops/glu_backward_cpu_dispatch.h>
#include <ATen/ops/glu_backward_jvp_cpu_dispatch.h>
#include <ATen/ops/glu_jvp_cpu_dispatch.h>
#include <ATen/ops/grid_sampler_2d_cpu_dispatch.h>
#include <ATen/ops/grid_sampler_2d_backward_cpu_dispatch.h>
#include <ATen/ops/grid_sampler_3d_cpu_dispatch.h>
#include <ATen/ops/grid_sampler_3d_backward_cpu_dispatch.h>
#include <ATen/ops/gt_cpu_dispatch.h>
#include <ATen/ops/hardshrink_cpu_dispatch.h>
#include <ATen/ops/hardshrink_backward_cpu_dispatch.h>
#include <ATen/ops/hardsigmoid_cpu_dispatch.h>
#include <ATen/ops/hardsigmoid_backward_cpu_dispatch.h>
#include <ATen/ops/hardswish_cpu_dispatch.h>
#include <ATen/ops/hardswish_backward_cpu_dispatch.h>
#include <ATen/ops/hardtanh_cpu_dispatch.h>
#include <ATen/ops/hardtanh_backward_cpu_dispatch.h>
#include <ATen/ops/heaviside_cpu_dispatch.h>
#include <ATen/ops/histc_cpu_dispatch.h>
#include <ATen/ops/histogram_cpu_dispatch.h>
#include <ATen/ops/huber_loss_cpu_dispatch.h>
#include <ATen/ops/huber_loss_backward_cpu_dispatch.h>
#include <ATen/ops/hypot_cpu_dispatch.h>
#include <ATen/ops/i0_cpu_dispatch.h>
#include <ATen/ops/igamma_cpu_dispatch.h>
#include <ATen/ops/igammac_cpu_dispatch.h>
#include <ATen/ops/im2col_cpu_dispatch.h>
#include <ATen/ops/index_cpu_dispatch.h>
#include <ATen/ops/index_add_cpu_dispatch.h>
#include <ATen/ops/index_copy_cpu_dispatch.h>
#include <ATen/ops/index_fill_cpu_dispatch.h>
#include <ATen/ops/index_reduce_cpu_dispatch.h>
#include <ATen/ops/index_select_cpu_dispatch.h>
#include <ATen/ops/is_set_to_cpu_dispatch.h>
#include <ATen/ops/isin_cpu_dispatch.h>
#include <ATen/ops/isnan_cpu_dispatch.h>
#include <ATen/ops/isneginf_cpu_dispatch.h>
#include <ATen/ops/isposinf_cpu_dispatch.h>
#include <ATen/ops/kthvalue_cpu_dispatch.h>
#include <ATen/ops/lcm_cpu_dispatch.h>
#include <ATen/ops/le_cpu_dispatch.h>
#include <ATen/ops/leaky_relu_cpu_dispatch.h>
#include <ATen/ops/leaky_relu_backward_cpu_dispatch.h>
#include <ATen/ops/lerp_cpu_dispatch.h>
#include <ATen/ops/lgamma_cpu_dispatch.h>
#include <ATen/ops/linalg_cholesky_ex_cpu_dispatch.h>
#include <ATen/ops/linalg_cross_cpu_dispatch.h>
#include <ATen/ops/linalg_eig_cpu_dispatch.h>
#include <ATen/ops/linalg_householder_product_cpu_dispatch.h>
#include <ATen/ops/linalg_inv_ex_cpu_dispatch.h>
#include <ATen/ops/linalg_ldl_factor_ex_cpu_dispatch.h>
#include <ATen/ops/linalg_ldl_solve_cpu_dispatch.h>
#include <ATen/ops/linalg_lstsq_cpu_dispatch.h>
#include <ATen/ops/linalg_lu_cpu_dispatch.h>
#include <ATen/ops/linalg_lu_factor_ex_cpu_dispatch.h>
#include <ATen/ops/linalg_lu_solve_cpu_dispatch.h>
#include <ATen/ops/linalg_matrix_exp_cpu_dispatch.h>
#include <ATen/ops/linalg_qr_cpu_dispatch.h>
#include <ATen/ops/linalg_solve_triangular_cpu_dispatch.h>
#include <ATen/ops/linalg_vector_norm_cpu_dispatch.h>
#include <ATen/ops/linspace_cpu_dispatch.h>
#include <ATen/ops/log_cpu_dispatch.h>
#include <ATen/ops/log10_cpu_dispatch.h>
#include <ATen/ops/log1p_cpu_dispatch.h>
#include <ATen/ops/log2_cpu_dispatch.h>
#include <ATen/ops/log_normal_cpu_dispatch.h>
#include <ATen/ops/log_sigmoid_backward_cpu_dispatch.h>
#include <ATen/ops/log_sigmoid_forward_cpu_dispatch.h>
#include <ATen/ops/logaddexp_cpu_dispatch.h>
#include <ATen/ops/logaddexp2_cpu_dispatch.h>
#include <ATen/ops/logical_and_cpu_dispatch.h>
#include <ATen/ops/logical_not_cpu_dispatch.h>
#include <ATen/ops/logical_or_cpu_dispatch.h>
#include <ATen/ops/logical_xor_cpu_dispatch.h>
#include <ATen/ops/logit_cpu_dispatch.h>
#include <ATen/ops/logit_backward_cpu_dispatch.h>
#include <ATen/ops/logspace_cpu_dispatch.h>
#include <ATen/ops/lshift_cpu_dispatch.h>
#include <ATen/ops/lt_cpu_dispatch.h>
#include <ATen/ops/lu_unpack_cpu_dispatch.h>
#include <ATen/ops/masked_fill_cpu_dispatch.h>
#include <ATen/ops/masked_scatter_cpu_dispatch.h>
#include <ATen/ops/masked_select_cpu_dispatch.h>
#include <ATen/ops/max_cpu_dispatch.h>
#include <ATen/ops/max_pool2d_with_indices_cpu_dispatch.h>
#include <ATen/ops/max_pool2d_with_indices_backward_cpu_dispatch.h>
#include <ATen/ops/max_pool3d_with_indices_cpu_dispatch.h>
#include <ATen/ops/max_pool3d_with_indices_backward_cpu_dispatch.h>
#include <ATen/ops/max_unpool2d_cpu_dispatch.h>
#include <ATen/ops/max_unpool3d_cpu_dispatch.h>
#include <ATen/ops/maximum_cpu_dispatch.h>
#include <ATen/ops/mean_cpu_dispatch.h>
#include <ATen/ops/median_cpu_dispatch.h>
#include <ATen/ops/min_cpu_dispatch.h>
#include <ATen/ops/minimum_cpu_dispatch.h>
#include <ATen/ops/mish_cpu_dispatch.h>
#include <ATen/ops/mish_backward_cpu_dispatch.h>
#include <ATen/ops/mkldnn_rnn_layer_cpu_dispatch.h>
#include <ATen/ops/mkldnn_rnn_layer_backward_cpu_dispatch.h>
#include <ATen/ops/mm_cpu_dispatch.h>
#include <ATen/ops/mode_cpu_dispatch.h>
#include <ATen/ops/mse_loss_cpu_dispatch.h>
#include <ATen/ops/mse_loss_backward_cpu_dispatch.h>
#include <ATen/ops/mul_cpu_dispatch.h>
#include <ATen/ops/multi_margin_loss_cpu_dispatch.h>
#include <ATen/ops/multi_margin_loss_backward_cpu_dispatch.h>
#include <ATen/ops/multilabel_margin_loss_backward_cpu_dispatch.h>
#include <ATen/ops/multilabel_margin_loss_forward_cpu_dispatch.h>
#include <ATen/ops/multinomial_cpu_dispatch.h>
#include <ATen/ops/mvlgamma_cpu_dispatch.h>
#include <ATen/ops/nan_to_num_cpu_dispatch.h>
#include <ATen/ops/nanmedian_cpu_dispatch.h>
#include <ATen/ops/nansum_cpu_dispatch.h>
#include <ATen/ops/narrow_copy_cpu_dispatch.h>
#include <ATen/ops/native_batch_norm_cpu_dispatch.h>
#include <ATen/ops/native_batch_norm_backward_cpu_dispatch.h>
#include <ATen/ops/native_channel_shuffle_cpu_dispatch.h>
#include <ATen/ops/native_dropout_cpu_dispatch.h>
#include <ATen/ops/native_dropout_backward_cpu_dispatch.h>
#include <ATen/ops/native_group_norm_cpu_dispatch.h>
#include <ATen/ops/native_group_norm_backward_cpu_dispatch.h>
#include <ATen/ops/native_layer_norm_cpu_dispatch.h>
#include <ATen/ops/native_layer_norm_backward_cpu_dispatch.h>
#include <ATen/ops/ne_cpu_dispatch.h>
#include <ATen/ops/neg_cpu_dispatch.h>
#include <ATen/ops/nextafter_cpu_dispatch.h>
#include <ATen/ops/nll_loss2d_backward_cpu_dispatch.h>
#include <ATen/ops/nll_loss2d_forward_cpu_dispatch.h>
#include <ATen/ops/nll_loss_backward_cpu_dispatch.h>
#include <ATen/ops/nll_loss_forward_cpu_dispatch.h>
#include <ATen/ops/nonzero_cpu_dispatch.h>
#include <ATen/ops/nonzero_static_cpu_dispatch.h>
#include <ATen/ops/norm_cpu_dispatch.h>
#include <ATen/ops/normal_cpu_dispatch.h>
#include <ATen/ops/ormqr_cpu_dispatch.h>
#include <ATen/ops/pixel_shuffle_cpu_dispatch.h>
#include <ATen/ops/pixel_unshuffle_cpu_dispatch.h>
#include <ATen/ops/poisson_cpu_dispatch.h>
#include <ATen/ops/polar_cpu_dispatch.h>
#include <ATen/ops/polygamma_cpu_dispatch.h>
#include <ATen/ops/pow_cpu_dispatch.h>
#include <ATen/ops/prod_cpu_dispatch.h>
#include <ATen/ops/put_cpu_dispatch.h>
#include <ATen/ops/quantize_per_channel_cpu_dispatch.h>
#include <ATen/ops/quantize_per_tensor_cpu_dispatch.h>
#include <ATen/ops/quantize_per_tensor_dynamic_cpu_dispatch.h>
#include <ATen/ops/random_cpu_dispatch.h>
#include <ATen/ops/randperm_cpu_dispatch.h>
#include <ATen/ops/range_cpu_dispatch.h>
#include <ATen/ops/reciprocal_cpu_dispatch.h>
#include <ATen/ops/reflection_pad1d_cpu_dispatch.h>
#include <ATen/ops/reflection_pad1d_backward_cpu_dispatch.h>
#include <ATen/ops/reflection_pad2d_cpu_dispatch.h>
#include <ATen/ops/reflection_pad2d_backward_cpu_dispatch.h>
#include <ATen/ops/reflection_pad3d_cpu_dispatch.h>
#include <ATen/ops/reflection_pad3d_backward_cpu_dispatch.h>
#include <ATen/ops/relu_cpu_dispatch.h>
#include <ATen/ops/remainder_cpu_dispatch.h>
#include <ATen/ops/renorm_cpu_dispatch.h>
#include <ATen/ops/repeat_interleave_cpu_dispatch.h>
#include <ATen/ops/replication_pad1d_cpu_dispatch.h>
#include <ATen/ops/replication_pad1d_backward_cpu_dispatch.h>
#include <ATen/ops/replication_pad2d_cpu_dispatch.h>
#include <ATen/ops/replication_pad2d_backward_cpu_dispatch.h>
#include <ATen/ops/replication_pad3d_cpu_dispatch.h>
#include <ATen/ops/replication_pad3d_backward_cpu_dispatch.h>
#include <ATen/ops/resize_cpu_dispatch.h>
#include <ATen/ops/roll_cpu_dispatch.h>
#include <ATen/ops/round_cpu_dispatch.h>
#include <ATen/ops/rrelu_with_noise_cpu_dispatch.h>
#include <ATen/ops/rshift_cpu_dispatch.h>
#include <ATen/ops/rsqrt_cpu_dispatch.h>
#include <ATen/ops/rsub_cpu_dispatch.h>
#include <ATen/ops/scatter_cpu_dispatch.h>
#include <ATen/ops/scatter_add_cpu_dispatch.h>
#include <ATen/ops/scatter_reduce_cpu_dispatch.h>
#include <ATen/ops/searchsorted_cpu_dispatch.h>
#include <ATen/ops/segment_reduce_cpu_dispatch.h>
#include <ATen/ops/set_cpu_dispatch.h>
#include <ATen/ops/sgn_cpu_dispatch.h>
#include <ATen/ops/sigmoid_cpu_dispatch.h>
#include <ATen/ops/sigmoid_backward_cpu_dispatch.h>
#include <ATen/ops/sign_cpu_dispatch.h>
#include <ATen/ops/signbit_cpu_dispatch.h>
#include <ATen/ops/silu_cpu_dispatch.h>
#include <ATen/ops/silu_backward_cpu_dispatch.h>
#include <ATen/ops/sin_cpu_dispatch.h>
#include <ATen/ops/sinc_cpu_dispatch.h>
#include <ATen/ops/sinh_cpu_dispatch.h>
#include <ATen/ops/slow_conv3d_forward_cpu_dispatch.h>
#include <ATen/ops/slow_conv_dilated2d_cpu_dispatch.h>
#include <ATen/ops/slow_conv_dilated3d_cpu_dispatch.h>
#include <ATen/ops/slow_conv_transpose2d_cpu_dispatch.h>
#include <ATen/ops/slow_conv_transpose3d_cpu_dispatch.h>
#include <ATen/ops/smooth_l1_loss_cpu_dispatch.h>
#include <ATen/ops/smooth_l1_loss_backward_cpu_dispatch.h>
#include <ATen/ops/softplus_cpu_dispatch.h>
#include <ATen/ops/softplus_backward_cpu_dispatch.h>
#include <ATen/ops/softshrink_cpu_dispatch.h>
#include <ATen/ops/softshrink_backward_cpu_dispatch.h>
#include <ATen/ops/sort_cpu_dispatch.h>
#include <ATen/ops/sparse_dim_cpu_dispatch.h>
#include <ATen/ops/special_airy_ai_cpu_dispatch.h>
#include <ATen/ops/special_bessel_j0_cpu_dispatch.h>
#include <ATen/ops/special_bessel_j1_cpu_dispatch.h>
#include <ATen/ops/special_bessel_y0_cpu_dispatch.h>
#include <ATen/ops/special_bessel_y1_cpu_dispatch.h>
#include <ATen/ops/special_chebyshev_polynomial_t_cpu_dispatch.h>
#include <ATen/ops/special_chebyshev_polynomial_u_cpu_dispatch.h>
#include <ATen/ops/special_chebyshev_polynomial_v_cpu_dispatch.h>
#include <ATen/ops/special_chebyshev_polynomial_w_cpu_dispatch.h>
#include <ATen/ops/special_entr_cpu_dispatch.h>
#include <ATen/ops/special_erfcx_cpu_dispatch.h>
#include <ATen/ops/special_hermite_polynomial_h_cpu_dispatch.h>
#include <ATen/ops/special_hermite_polynomial_he_cpu_dispatch.h>
#include <ATen/ops/special_i0e_cpu_dispatch.h>
#include <ATen/ops/special_i1_cpu_dispatch.h>
#include <ATen/ops/special_i1e_cpu_dispatch.h>
#include <ATen/ops/special_laguerre_polynomial_l_cpu_dispatch.h>
#include <ATen/ops/special_legendre_polynomial_p_cpu_dispatch.h>
#include <ATen/ops/special_log_ndtr_cpu_dispatch.h>
#include <ATen/ops/special_modified_bessel_i0_cpu_dispatch.h>
#include <ATen/ops/special_modified_bessel_i1_cpu_dispatch.h>
#include <ATen/ops/special_modified_bessel_k0_cpu_dispatch.h>
#include <ATen/ops/special_modified_bessel_k1_cpu_dispatch.h>
#include <ATen/ops/special_ndtri_cpu_dispatch.h>
#include <ATen/ops/special_scaled_modified_bessel_k0_cpu_dispatch.h>
#include <ATen/ops/special_scaled_modified_bessel_k1_cpu_dispatch.h>
#include <ATen/ops/special_shifted_chebyshev_polynomial_t_cpu_dispatch.h>
#include <ATen/ops/special_shifted_chebyshev_polynomial_u_cpu_dispatch.h>
#include <ATen/ops/special_shifted_chebyshev_polynomial_v_cpu_dispatch.h>
#include <ATen/ops/special_shifted_chebyshev_polynomial_w_cpu_dispatch.h>
#include <ATen/ops/special_spherical_bessel_j0_cpu_dispatch.h>
#include <ATen/ops/special_xlog1py_cpu_dispatch.h>
#include <ATen/ops/special_zeta_cpu_dispatch.h>
#include <ATen/ops/sqrt_cpu_dispatch.h>
#include <ATen/ops/sspaddmm_cpu_dispatch.h>
#include <ATen/ops/std_cpu_dispatch.h>
#include <ATen/ops/std_mean_cpu_dispatch.h>
#include <ATen/ops/sub_cpu_dispatch.h>
#include <ATen/ops/sum_cpu_dispatch.h>
#include <ATen/ops/take_cpu_dispatch.h>
#include <ATen/ops/tan_cpu_dispatch.h>
#include <ATen/ops/tanh_cpu_dispatch.h>
#include <ATen/ops/tanh_backward_cpu_dispatch.h>
#include <ATen/ops/threshold_cpu_dispatch.h>
#include <ATen/ops/threshold_backward_cpu_dispatch.h>
#include <ATen/ops/to_mkldnn_cpu_dispatch.h>
#include <ATen/ops/topk_cpu_dispatch.h>
#include <ATen/ops/trace_cpu_dispatch.h>
#include <ATen/ops/triangular_solve_cpu_dispatch.h>
#include <ATen/ops/tril_cpu_dispatch.h>
#include <ATen/ops/tril_indices_cpu_dispatch.h>
#include <ATen/ops/triu_cpu_dispatch.h>
#include <ATen/ops/triu_indices_cpu_dispatch.h>
#include <ATen/ops/trunc_cpu_dispatch.h>
#include <ATen/ops/unfold_cpu_dispatch.h>
#include <ATen/ops/unfold_backward_cpu_dispatch.h>
#include <ATen/ops/uniform_cpu_dispatch.h>
#include <ATen/ops/unique_consecutive_cpu_dispatch.h>
#include <ATen/ops/unique_dim_cpu_dispatch.h>
#include <ATen/ops/unique_dim_consecutive_cpu_dispatch.h>
#include <ATen/ops/upsample_bicubic2d_cpu_dispatch.h>
#include <ATen/ops/upsample_bicubic2d_backward_cpu_dispatch.h>
#include <ATen/ops/upsample_bilinear2d_cpu_dispatch.h>
#include <ATen/ops/upsample_bilinear2d_backward_cpu_dispatch.h>
#include <ATen/ops/upsample_linear1d_cpu_dispatch.h>
#include <ATen/ops/upsample_linear1d_backward_cpu_dispatch.h>
#include <ATen/ops/upsample_nearest1d_cpu_dispatch.h>
#include <ATen/ops/upsample_nearest1d_backward_cpu_dispatch.h>
#include <ATen/ops/upsample_nearest2d_cpu_dispatch.h>
#include <ATen/ops/upsample_nearest2d_backward_cpu_dispatch.h>
#include <ATen/ops/upsample_nearest3d_cpu_dispatch.h>
#include <ATen/ops/upsample_nearest3d_backward_cpu_dispatch.h>
#include <ATen/ops/upsample_trilinear3d_cpu_dispatch.h>
#include <ATen/ops/upsample_trilinear3d_backward_cpu_dispatch.h>
#include <ATen/ops/var_cpu_dispatch.h>
#include <ATen/ops/var_mean_cpu_dispatch.h>
#include <ATen/ops/vdot_cpu_dispatch.h>
#include <ATen/ops/view_cpu_dispatch.h>
#include <ATen/ops/view_as_complex_cpu_dispatch.h>
#include <ATen/ops/view_as_real_cpu_dispatch.h>
#include <ATen/ops/where_cpu_dispatch.h>
#include <ATen/ops/xlogy_cpu_dispatch.h>
#include <ATen/ops/zero_cpu_dispatch.h>




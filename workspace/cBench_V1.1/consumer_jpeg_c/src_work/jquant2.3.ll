; ModuleID = 'jquant2.2.ll'
source_filename = "jquant2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_decompress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_source_mgr*, i32, i32, i32, i32, i32, i32, i32, double, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8**, i32, i32, i32, i32, i32, [64 x i32]*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], i32, %struct.jpeg_component_info*, i32, i32, [16 x i8], [16 x i8], [16 x i8], i32, i32, i8, i16, i16, i32, i8, i32, i32, i32, i32, i32, i8*, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, i32, %struct.jpeg_decomp_master*, %struct.jpeg_d_main_controller*, %struct.jpeg_d_coef_controller*, %struct.jpeg_d_post_controller*, %struct.jpeg_input_controller*, %struct.jpeg_marker_reader*, %struct.jpeg_entropy_decoder*, %struct.jpeg_inverse_dct*, %struct.jpeg_upsampler*, %struct.jpeg_color_deconverter*, %struct.jpeg_color_quantizer* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_source_mgr = type { i8*, i64, {}*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, {}* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.jpeg_decomp_master = type { {}*, {}*, i32 }
%struct.jpeg_d_main_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* }
%struct.jpeg_d_coef_controller = type { {}*, i32 (%struct.jpeg_decompress_struct*)*, {}*, i32 (%struct.jpeg_decompress_struct*, i8***)*, %struct.jvirt_barray_control** }
%struct.jpeg_d_post_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* }
%struct.jpeg_input_controller = type { i32 (%struct.jpeg_decompress_struct*)*, {}*, {}*, {}*, i32, i32 }
%struct.jpeg_marker_reader = type { {}*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, [16 x i32 (%struct.jpeg_decompress_struct*)*], i32, i32, i32, i32 }
%struct.jpeg_entropy_decoder = type { {}*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* }
%struct.jpeg_inverse_dct = type { {}*, [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*] }
%struct.jpeg_upsampler = type { {}*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, i32 }
%struct.jpeg_color_deconverter = type { {}*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* }
%struct.jpeg_color_quantizer = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, {}*, {}* }
%struct.my_cquantizer = type { %struct.jpeg_color_quantizer, i8**, i32, [32 x i16]**, i32, i16*, i32, i32* }
%struct.box = type { i32, i32, i32, i32, i32, i32, i64, i64 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_2pass_quantizer = private constant [21 x i8] c"jinit_2pass_quantizer"
@__profn_tmp1.ll_start_pass_2_quant = private constant [26 x i8] c"tmp1.ll:start_pass_2_quant"
@__profn_tmp1.ll_new_color_map_2_quant = private constant [29 x i8] c"tmp1.ll:new_color_map_2_quant"
@__profn_tmp1.ll_init_error_limit = private constant [24 x i8] c"tmp1.ll:init_error_limit"
@__profn_tmp1.ll_prescan_quantize = private constant [24 x i8] c"tmp1.ll:prescan_quantize"
@__profn_tmp1.ll_finish_pass1 = private constant [20 x i8] c"tmp1.ll:finish_pass1"
@__profn_tmp1.ll_pass2_fs_dither = private constant [23 x i8] c"tmp1.ll:pass2_fs_dither"
@__profn_tmp1.ll_pass2_no_dither = private constant [23 x i8] c"tmp1.ll:pass2_no_dither"
@__profn_tmp1.ll_finish_pass2 = private constant [20 x i8] c"tmp1.ll:finish_pass2"
@__profn_tmp1.ll_select_colors = private constant [21 x i8] c"tmp1.ll:select_colors"
@__profn_tmp1.ll_update_box = private constant [18 x i8] c"tmp1.ll:update_box"
@__profn_tmp1.ll_median_cut = private constant [18 x i8] c"tmp1.ll:median_cut"
@__profn_tmp1.ll_compute_color = private constant [21 x i8] c"tmp1.ll:compute_color"
@__profn_tmp1.ll_find_biggest_color_pop = private constant [30 x i8] c"tmp1.ll:find_biggest_color_pop"
@__profn_tmp1.ll_find_biggest_volume = private constant [27 x i8] c"tmp1.ll:find_biggest_volume"
@__profn_tmp1.ll_fill_inverse_cmap = private constant [25 x i8] c"tmp1.ll:fill_inverse_cmap"
@__profn_tmp1.ll_find_nearby_colors = private constant [26 x i8] c"tmp1.ll:find_nearby_colors"
@__profn_tmp1.ll_find_best_colors = private constant [24 x i8] c"tmp1.ll:find_best_colors"
@__profc_jinit_2pass_quantizer = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_2pass_quantizer = private global [8 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_2pass_quantizer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2879582418750008127, i64 2251913979150143, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_2pass_quantizer, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @jinit_2pass_quantizer to i8*), i8* bitcast ([8 x i64]* @__profvp_jinit_2pass_quantizer to i8*), i32 8, [1 x i16] [i16 8] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass_2_quant = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_pass_2_quant = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_pass_2_quant = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5581429855264386049, i64 844581770008541, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i32)* @start_pass_2_quant to i8*), i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_start_pass_2_quant to i8*), i32 11, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_new_color_map_2_quant = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_new_color_map_2_quant = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -542469491703654255, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_new_color_map_2_quant, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @new_color_map_2_quant to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_init_error_limit = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_init_error_limit = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_init_error_limit = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4177869203679374593, i64 72339145693233907, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init_error_limit, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_init_error_limit to i8*), i32 5, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_prescan_quantize = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_prescan_quantize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2174539208282504645, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_prescan_quantize, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @prescan_quantize to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_pass1 = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_finish_pass1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5562675452325237071, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_pass1, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @finish_pass1 to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pass2_fs_dither = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pass2_fs_dither = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9113573186442038808, i64 84892571990, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pass2_fs_dither, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @pass2_fs_dither to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pass2_no_dither = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pass2_no_dither = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6574434412572062398, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pass2_no_dither, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @pass2_no_dither to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_pass2 = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_finish_pass2 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4456082487067356896, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_pass2, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @finish_pass2 to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_select_colors = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_select_colors = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_select_colors = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6318341781883057610, i64 562984091081628, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_select_colors, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_select_colors to i8*), i32 2, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_update_box = private global [35 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_update_box = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7398854509308876741, i64 656339402380, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i32 0, i32 0), i8* null, i8* null, i32 35, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_median_cut = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_median_cut = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7186016063159430831, i64 115086120657, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_compute_color = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_compute_color = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3928322424763177084, i64 89615196140, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_compute_color, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_find_biggest_color_pop = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_find_biggest_color_pop = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6512569017839615516, i64 51906241477, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_find_biggest_color_pop, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_find_biggest_volume = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_find_biggest_volume = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2589023579140230888, i64 45130900406, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_biggest_volume, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_fill_inverse_cmap = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_fill_inverse_cmap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2856426797030930792, i64 74483645111, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_fill_inverse_cmap, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_find_nearby_colors = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_find_nearby_colors = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4629280140848400844, i64 232516168995, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i32 0, i32 0), i8* null, i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_find_best_colors = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_find_best_colors = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6765448599539698535, i64 131292580878, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_best_colors, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [14 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [191 x i8] c"\B5\03\BB\01x\DAm\90Y\0E\C3 \0CD\D5\0BUJ>{\19\8B\10'q\C5\E2bH\97\D3\17\85\8A\D0\B4\9F\CC\B3g\C6\5C\C9Q\84\9E\95\08\DC\92r\91^\18N\D1rw6\E6\22Q\85\08\1B\EC\0B\AE\C8\E1\1D\B47>\80U\FCC7W\0C!cC\96v\C0\01E+W\B3*\98\F2\8A,[V\B7O\E7W\0F\93\C0Hqiz\15\DD\F9\A3\DE\98\F4\FB\11hP\C7RV\AA\9AxT\11a\F0\8F*Y\1C)W\D3i\AF\AB\BD\E5\94\C7\B6\E56f\84\81\E6\19\E5\E3\0B\EC\F9?^\BDI\B6=\D3\18 \B7b\90\EC\9A\BF\EE{\CB\A1\0A\C3\F3\D8\B5\18\D60y\03\F2\E7\A3\B3", section "__llvm_prf_names"
@llvm.used = appending global [20 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_2pass_quantizer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_2_quant to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_new_color_map_2_quant to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_init_error_limit to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prescan_quantize to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_pass1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pass2_fs_dither to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pass2_no_dither to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_pass2 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_select_colors to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_update_box to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_median_cut to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compute_color to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_find_biggest_color_pop to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_find_biggest_volume to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_fill_inverse_cmap to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_find_nearby_colors to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_find_best_colors to i8*), i8* bitcast ([14 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([191 x i8], [191 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jinit_2pass_quantizer(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_cquantizer*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %6, i32 0, i32 1
  %8 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %8, i32 0, i32 0
  %10 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %9, align 8
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %12 = bitcast %struct.jpeg_decompress_struct* %11 to %struct.jpeg_common_struct*
  %13 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %10 to i64
  call void @__llvm_profile_instrument_target(i64 %13, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_2pass_quantizer to i8*), i32 0)
  %14 = call i8* %10(%struct.jpeg_common_struct* %12, i32 1, i64 88)
  %15 = bitcast i8* %14 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %15, %struct.my_cquantizer** %3, align 8
  %16 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %17 = bitcast %struct.my_cquantizer* %16 to %struct.jpeg_color_quantizer*
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 83
  store %struct.jpeg_color_quantizer* %17, %struct.jpeg_color_quantizer** %19, align 8
  %20 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %21 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %20, i32 0, i32 0
  %22 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %21, i32 0, i32 0
  store void (%struct.jpeg_decompress_struct*, i32)* @start_pass_2_quant, void (%struct.jpeg_decompress_struct*, i32)** %22, align 8
  %23 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %24 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %23, i32 0, i32 0
  %25 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %24, i32 0, i32 3
  %26 = bitcast {}** %25 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @new_color_map_2_quant, void (%struct.jpeg_decompress_struct*)** %26, align 8
  %27 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %28 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %27, i32 0, i32 5
  store i16* null, i16** %28, align 8
  %29 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %30 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %29, i32 0, i32 7
  store i32* null, i32** %30, align 8
  %31 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %31, i32 0, i32 28
  %33 = load i32, i32* %32, align 8
  %34 = icmp ne i32 %33, 3
  br i1 %34, label %35, label %49

; <label>:35:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_2pass_quantizer, i64 0, i64 3)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_2pass_quantizer, i64 0, i64 3)
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %37, i32 0, i32 0
  %39 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %40 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %39, i32 0, i32 5
  store i32 46, i32* %40, align 8
  %41 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %41, i32 0, i32 0
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i32 0, i32 0
  %45 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %44, align 8
  %46 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %47 = bitcast %struct.jpeg_decompress_struct* %46 to %struct.jpeg_common_struct*
  %48 = ptrtoint void (%struct.jpeg_common_struct*)* %45 to i64
  call void @__llvm_profile_instrument_target(i64 %48, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_2pass_quantizer to i8*), i32 1)
  call void %45(%struct.jpeg_common_struct* %47)
  br label %49

; <label>:49:                                     ; preds = %35, %1
  %50 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %50, i32 0, i32 1
  %52 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %51, align 8
  %53 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %52, i32 0, i32 0
  %54 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %53, align 8
  %55 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %56 = bitcast %struct.jpeg_decompress_struct* %55 to %struct.jpeg_common_struct*
  %57 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %54 to i64
  call void @__llvm_profile_instrument_target(i64 %57, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_2pass_quantizer to i8*), i32 2)
  %58 = call i8* %54(%struct.jpeg_common_struct* %56, i32 1, i64 256)
  %59 = bitcast i8* %58 to [32 x i16]**
  %60 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %61 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %60, i32 0, i32 3
  store [32 x i16]** %59, [32 x i16]*** %61, align 8
  store i32 0, i32* %4, align 4
  br label %62

; <label>:62:                                     ; preds = %82, %49
  %63 = load i32, i32* %4, align 4
  %64 = icmp slt i32 %63, 32
  br i1 %64, label %65, label %86

; <label>:65:                                     ; preds = %62
  %66 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %67 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %66, i32 0, i32 1
  %68 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %67, align 8
  %69 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %68, i32 0, i32 1
  %70 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %69, align 8
  %71 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %72 = bitcast %struct.jpeg_decompress_struct* %71 to %struct.jpeg_common_struct*
  %73 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %70 to i64
  call void @__llvm_profile_instrument_target(i64 %73, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_2pass_quantizer to i8*), i32 3)
  %74 = call i8* %70(%struct.jpeg_common_struct* %72, i32 1, i64 4096)
  %75 = bitcast i8* %74 to [32 x i16]*
  %76 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %77 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %76, i32 0, i32 3
  %78 = load [32 x i16]**, [32 x i16]*** %77, align 8
  %79 = load i32, i32* %4, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [32 x i16]*, [32 x i16]** %78, i64 %80
  store [32 x i16]* %75, [32 x i16]** %81, align 8
  br label %82

; <label>:82:                                     ; preds = %65
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_2pass_quantizer, i64 0, i64 0)
  %83 = add i64 %pgocount1, 1
  store i64 %83, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_2pass_quantizer, i64 0, i64 0)
  %84 = load i32, i32* %4, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %4, align 4
  br label %62

; <label>:86:                                     ; preds = %62
  %87 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %88 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %87, i32 0, i32 4
  store i32 1, i32* %88, align 8
  %89 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %90 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %89, i32 0, i32 25
  %91 = load i32, i32* %90, align 4
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %93, label %159

; <label>:93:                                     ; preds = %86
  %94 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %95 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %94, i32 0, i32 22
  %96 = load i32, i32* %95, align 8
  store i32 %96, i32* %5, align 4
  %97 = load i32, i32* %5, align 4
  %98 = icmp slt i32 %97, 8
  br i1 %98, label %99, label %119

; <label>:99:                                     ; preds = %93
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_2pass_quantizer, i64 0, i64 6)
  %100 = add i64 %pgocount2, 1
  store i64 %100, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_2pass_quantizer, i64 0, i64 6)
  %101 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %102 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %101, i32 0, i32 0
  %103 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %102, align 8
  %104 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %103, i32 0, i32 5
  store i32 55, i32* %104, align 8
  %105 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %106 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %105, i32 0, i32 0
  %107 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %106, align 8
  %108 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %107, i32 0, i32 6
  %109 = bitcast %union.anon* %108 to [8 x i32]*
  %110 = getelementptr inbounds [8 x i32], [8 x i32]* %109, i64 0, i64 0
  store i32 8, i32* %110, align 4
  %111 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %112 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %111, i32 0, i32 0
  %113 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %112, align 8
  %114 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %113, i32 0, i32 0
  %115 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %114, align 8
  %116 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %117 = bitcast %struct.jpeg_decompress_struct* %116 to %struct.jpeg_common_struct*
  %118 = ptrtoint void (%struct.jpeg_common_struct*)* %115 to i64
  call void @__llvm_profile_instrument_target(i64 %118, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_2pass_quantizer to i8*), i32 4)
  call void %115(%struct.jpeg_common_struct* %117)
  br label %119

; <label>:119:                                    ; preds = %99, %93
  %120 = load i32, i32* %5, align 4
  %121 = icmp sgt i32 %120, 256
  br i1 %121, label %122, label %142

; <label>:122:                                    ; preds = %119
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_2pass_quantizer, i64 0, i64 7)
  %123 = add i64 %pgocount3, 1
  store i64 %123, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_2pass_quantizer, i64 0, i64 7)
  %124 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %125 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %124, i32 0, i32 0
  %126 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %125, align 8
  %127 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %126, i32 0, i32 5
  store i32 56, i32* %127, align 8
  %128 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %129 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %128, i32 0, i32 0
  %130 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %129, align 8
  %131 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %130, i32 0, i32 6
  %132 = bitcast %union.anon* %131 to [8 x i32]*
  %133 = getelementptr inbounds [8 x i32], [8 x i32]* %132, i64 0, i64 0
  store i32 256, i32* %133, align 4
  %134 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %135 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %134, i32 0, i32 0
  %136 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %135, align 8
  %137 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i32 0, i32 0
  %138 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %137, align 8
  %139 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %140 = bitcast %struct.jpeg_decompress_struct* %139 to %struct.jpeg_common_struct*
  %141 = ptrtoint void (%struct.jpeg_common_struct*)* %138 to i64
  call void @__llvm_profile_instrument_target(i64 %141, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_2pass_quantizer to i8*), i32 5)
  call void %138(%struct.jpeg_common_struct* %140)
  br label %142

; <label>:142:                                    ; preds = %122, %119
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_2pass_quantizer, i64 0, i64 1)
  %143 = add i64 %pgocount4, 1
  store i64 %143, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_2pass_quantizer, i64 0, i64 1)
  %144 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %145 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %144, i32 0, i32 1
  %146 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %145, align 8
  %147 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %146, i32 0, i32 2
  %148 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %147, align 8
  %149 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %150 = bitcast %struct.jpeg_decompress_struct* %149 to %struct.jpeg_common_struct*
  %151 = load i32, i32* %5, align 4
  %152 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %148 to i64
  call void @__llvm_profile_instrument_target(i64 %152, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_2pass_quantizer to i8*), i32 6)
  %153 = call i8** %148(%struct.jpeg_common_struct* %150, i32 1, i32 %151, i32 3)
  %154 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %155 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %154, i32 0, i32 1
  store i8** %153, i8*** %155, align 8
  %156 = load i32, i32* %5, align 4
  %157 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %158 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %157, i32 0, i32 2
  store i32 %156, i32* %158, align 8
  br label %163

; <label>:159:                                    ; preds = %86
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_2pass_quantizer, i64 0, i64 5)
  %160 = add i64 %pgocount5, 1
  store i64 %160, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_2pass_quantizer, i64 0, i64 5)
  %161 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %162 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %161, i32 0, i32 1
  store i8** null, i8*** %162, align 8
  br label %163

; <label>:163:                                    ; preds = %159, %142
  %164 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %165 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %164, i32 0, i32 20
  %166 = load i32, i32* %165, align 8
  %167 = icmp ne i32 %166, 0
  br i1 %167, label %168, label %172

; <label>:168:                                    ; preds = %163
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_2pass_quantizer, i64 0, i64 2)
  %169 = add i64 %pgocount6, 1
  store i64 %169, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_2pass_quantizer, i64 0, i64 2)
  %170 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %171 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %170, i32 0, i32 20
  store i32 2, i32* %171, align 8
  br label %172

; <label>:172:                                    ; preds = %168, %163
  %173 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %174 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %173, i32 0, i32 20
  %175 = load i32, i32* %174, align 8
  %176 = icmp eq i32 %175, 2
  br i1 %176, label %177, label %198

; <label>:177:                                    ; preds = %172
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_2pass_quantizer, i64 0, i64 4)
  %178 = add i64 %pgocount7, 1
  store i64 %178, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_2pass_quantizer, i64 0, i64 4)
  %179 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %180 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %179, i32 0, i32 1
  %181 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %180, align 8
  %182 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %181, i32 0, i32 1
  %183 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %182, align 8
  %184 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %185 = bitcast %struct.jpeg_decompress_struct* %184 to %struct.jpeg_common_struct*
  %186 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %187 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %186, i32 0, i32 26
  %188 = load i32, i32* %187, align 8
  %189 = add i32 %188, 2
  %190 = zext i32 %189 to i64
  %191 = mul i64 %190, 6
  %192 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %183 to i64
  call void @__llvm_profile_instrument_target(i64 %192, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_2pass_quantizer to i8*), i32 7)
  %193 = call i8* %183(%struct.jpeg_common_struct* %185, i32 1, i64 %191)
  %194 = bitcast i8* %193 to i16*
  %195 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %196 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %195, i32 0, i32 5
  store i16* %194, i16** %196, align 8
  %197 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @init_error_limit(%struct.jpeg_decompress_struct* %197)
  br label %198

; <label>:198:                                    ; preds = %177, %172
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @start_pass_2_quant(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.my_cquantizer*, align 8
  %6 = alloca [32 x i16]**, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %9 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %9, i32 0, i32 83
  %11 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %10, align 8
  %12 = bitcast %struct.jpeg_color_quantizer* %11 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %12, %struct.my_cquantizer** %5, align 8
  %13 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %14 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %13, i32 0, i32 3
  %15 = load [32 x i16]**, [32 x i16]*** %14, align 8
  store [32 x i16]** %15, [32 x i16]*** %6, align 8
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 20
  %18 = load i32, i32* %17, align 8
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 1)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 1)
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 20
  store i32 2, i32* %23, align 8
  br label %24

; <label>:24:                                     ; preds = %20, %2
  %25 = load i32, i32* %4, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %38

; <label>:27:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 2)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 2)
  %29 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %30 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %29, i32 0, i32 0
  %31 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %30, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @prescan_quantize, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %31, align 8
  %32 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %33 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %32, i32 0, i32 0
  %34 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %33, i32 0, i32 2
  %35 = bitcast {}** %34 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @finish_pass1, void (%struct.jpeg_decompress_struct*)** %35, align 8
  %36 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %37 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %36, i32 0, i32 4
  store i32 1, i32* %37, align 8
  br label %155

; <label>:38:                                     ; preds = %24
  %39 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %39, i32 0, i32 20
  %41 = load i32, i32* %40, align 8
  %42 = icmp eq i32 %41, 2
  br i1 %42, label %43, label %48

; <label>:43:                                     ; preds = %38
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 4)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 4)
  %45 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %46 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %45, i32 0, i32 0
  %47 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %46, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @pass2_fs_dither, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %47, align 8
  br label %53

; <label>:48:                                     ; preds = %38
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 5)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 5)
  %50 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %51 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %50, i32 0, i32 0
  %52 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %51, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @pass2_no_dither, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %52, align 8
  br label %53

; <label>:53:                                     ; preds = %48, %43
  %54 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %55 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %54, i32 0, i32 0
  %56 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %55, i32 0, i32 2
  %57 = bitcast {}** %56 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @finish_pass2, void (%struct.jpeg_decompress_struct*)** %57, align 8
  %58 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %58, i32 0, i32 31
  %60 = load i32, i32* %59, align 4
  store i32 %60, i32* %7, align 4
  %61 = load i32, i32* %7, align 4
  %62 = icmp slt i32 %61, 1
  br i1 %62, label %63, label %83

; <label>:63:                                     ; preds = %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 8)
  %64 = add i64 %pgocount4, 1
  store i64 %64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 8)
  %65 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %66 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %65, i32 0, i32 0
  %67 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %68 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %67, i32 0, i32 5
  store i32 55, i32* %68, align 8
  %69 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %70 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %69, i32 0, i32 0
  %71 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %71, i32 0, i32 6
  %73 = bitcast %union.anon* %72 to [8 x i32]*
  %74 = getelementptr inbounds [8 x i32], [8 x i32]* %73, i64 0, i64 0
  store i32 1, i32* %74, align 4
  %75 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %76 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %75, i32 0, i32 0
  %77 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %76, align 8
  %78 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %77, i32 0, i32 0
  %79 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %78, align 8
  %80 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %81 = bitcast %struct.jpeg_decompress_struct* %80 to %struct.jpeg_common_struct*
  %82 = ptrtoint void (%struct.jpeg_common_struct*)* %79 to i64
  call void @__llvm_profile_instrument_target(i64 %82, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_2_quant to i8*), i32 0)
  call void %79(%struct.jpeg_common_struct* %81)
  br label %83

; <label>:83:                                     ; preds = %63, %53
  %84 = load i32, i32* %7, align 4
  %85 = icmp sgt i32 %84, 256
  br i1 %85, label %86, label %106

; <label>:86:                                     ; preds = %83
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 6)
  %87 = add i64 %pgocount5, 1
  store i64 %87, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 6)
  %88 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %89 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %88, i32 0, i32 0
  %90 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %89, align 8
  %91 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %90, i32 0, i32 5
  store i32 56, i32* %91, align 8
  %92 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %93 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %92, i32 0, i32 0
  %94 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %93, align 8
  %95 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %94, i32 0, i32 6
  %96 = bitcast %union.anon* %95 to [8 x i32]*
  %97 = getelementptr inbounds [8 x i32], [8 x i32]* %96, i64 0, i64 0
  store i32 256, i32* %97, align 4
  %98 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %99 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %98, i32 0, i32 0
  %100 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %99, align 8
  %101 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %100, i32 0, i32 0
  %102 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %101, align 8
  %103 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %104 = bitcast %struct.jpeg_decompress_struct* %103 to %struct.jpeg_common_struct*
  %105 = ptrtoint void (%struct.jpeg_common_struct*)* %102 to i64
  call void @__llvm_profile_instrument_target(i64 %105, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_2_quant to i8*), i32 1)
  call void %102(%struct.jpeg_common_struct* %104)
  br label %106

; <label>:106:                                    ; preds = %86, %83
  %107 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %108 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %107, i32 0, i32 20
  %109 = load i32, i32* %108, align 8
  %110 = icmp eq i32 %109, 2
  br i1 %110, label %111, label %154

; <label>:111:                                    ; preds = %106
  %112 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %113 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %112, i32 0, i32 26
  %114 = load i32, i32* %113, align 8
  %115 = add i32 %114, 2
  %116 = zext i32 %115 to i64
  %117 = mul i64 %116, 6
  store i64 %117, i64* %8, align 8
  %118 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %119 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %118, i32 0, i32 5
  %120 = load i16*, i16** %119, align 8
  %121 = icmp eq i16* %120, null
  br i1 %121, label %122, label %137

; <label>:122:                                    ; preds = %111
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 9)
  %123 = add i64 %pgocount6, 1
  store i64 %123, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 9)
  %124 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %125 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %124, i32 0, i32 1
  %126 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %125, align 8
  %127 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %126, i32 0, i32 1
  %128 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %127, align 8
  %129 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %130 = bitcast %struct.jpeg_decompress_struct* %129 to %struct.jpeg_common_struct*
  %131 = load i64, i64* %8, align 8
  %132 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %128 to i64
  call void @__llvm_profile_instrument_target(i64 %132, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_2_quant to i8*), i32 2)
  %133 = call i8* %128(%struct.jpeg_common_struct* %130, i32 1, i64 %131)
  %134 = bitcast i8* %133 to i16*
  %135 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %136 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %135, i32 0, i32 5
  store i16* %134, i16** %136, align 8
  br label %137

; <label>:137:                                    ; preds = %122, %111
  %138 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %139 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %138, i32 0, i32 5
  %140 = load i16*, i16** %139, align 8
  %141 = bitcast i16* %140 to i8*
  %142 = load i64, i64* %8, align 8
  call void @jzero_far(i8* %141, i64 %142)
  %143 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %144 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %143, i32 0, i32 7
  %145 = load i32*, i32** %144, align 8
  %146 = icmp eq i32* %145, null
  br i1 %146, label %147, label %150

; <label>:147:                                    ; preds = %137
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 10)
  %148 = add i64 %pgocount7, 1
  store i64 %148, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 10)
  %149 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  call void @init_error_limit(%struct.jpeg_decompress_struct* %149)
  br label %150

; <label>:150:                                    ; preds = %147, %137
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 7)
  %151 = add i64 %pgocount8, 1
  store i64 %151, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 7)
  %152 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %153 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %152, i32 0, i32 6
  store i32 0, i32* %153, align 8
  br label %154

; <label>:154:                                    ; preds = %150, %106
  br label %155

; <label>:155:                                    ; preds = %154, %27
  %156 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %157 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %156, i32 0, i32 4
  %158 = load i32, i32* %157, align 8
  %159 = icmp ne i32 %158, 0
  br i1 %159, label %160, label %179

; <label>:160:                                    ; preds = %155
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 3)
  %161 = add i64 %pgocount9, 1
  store i64 %161, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 3)
  store i32 0, i32* %7, align 4
  br label %162

; <label>:162:                                    ; preds = %173, %160
  %163 = load i32, i32* %7, align 4
  %164 = icmp slt i32 %163, 32
  br i1 %164, label %165, label %176

; <label>:165:                                    ; preds = %162
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 0)
  %166 = add i64 %pgocount10, 1
  store i64 %166, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_start_pass_2_quant, i64 0, i64 0)
  %167 = load [32 x i16]**, [32 x i16]*** %6, align 8
  %168 = load i32, i32* %7, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [32 x i16]*, [32 x i16]** %167, i64 %169
  %171 = load [32 x i16]*, [32 x i16]** %170, align 8
  %172 = bitcast [32 x i16]* %171 to i8*
  call void @jzero_far(i8* %172, i64 4096)
  br label %173

; <label>:173:                                    ; preds = %165
  %174 = load i32, i32* %7, align 4
  %175 = add nsw i32 %174, 1
  store i32 %175, i32* %7, align 4
  br label %162

; <label>:176:                                    ; preds = %162
  %177 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %178 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %177, i32 0, i32 4
  store i32 0, i32* %178, align 8
  br label %179

; <label>:179:                                    ; preds = %176, %155
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @new_color_map_2_quant(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_new_color_map_2_quant, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_new_color_map_2_quant, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.my_cquantizer*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 83
  %7 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %6, align 8
  %8 = bitcast %struct.jpeg_color_quantizer* %7 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %8, %struct.my_cquantizer** %4, align 8
  %9 = load %struct.my_cquantizer*, %struct.my_cquantizer** %4, align 8
  %10 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %9, i32 0, i32 4
  store i32 1, i32* %10, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @init_error_limit(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_cquantizer*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %7 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %7, i32 0, i32 83
  %9 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %8, align 8
  %10 = bitcast %struct.jpeg_color_quantizer* %9 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %10, %struct.my_cquantizer** %3, align 8
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %11, i32 0, i32 1
  %13 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %13, i32 0, i32 0
  %15 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %14, align 8
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %17 = bitcast %struct.jpeg_decompress_struct* %16 to %struct.jpeg_common_struct*
  %18 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %15 to i64
  call void @__llvm_profile_instrument_target(i64 %18, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_init_error_limit to i8*), i32 0)
  %19 = call i8* %15(%struct.jpeg_common_struct* %17, i32 1, i64 2044)
  %20 = bitcast i8* %19 to i32*
  store i32* %20, i32** %4, align 8
  %21 = load i32*, i32** %4, align 8
  %22 = getelementptr inbounds i32, i32* %21, i64 255
  store i32* %22, i32** %4, align 8
  %23 = load i32*, i32** %4, align 8
  %24 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %25 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %24, i32 0, i32 7
  store i32* %23, i32** %25, align 8
  store i32 0, i32* %6, align 4
  store i32 0, i32* %5, align 4
  br label %26

; <label>:26:                                     ; preds = %42, %1
  %27 = load i32, i32* %5, align 4
  %28 = icmp slt i32 %27, 16
  br i1 %28, label %29, label %48

; <label>:29:                                     ; preds = %26
  %30 = load i32, i32* %6, align 4
  %31 = load i32*, i32** %4, align 8
  %32 = load i32, i32* %5, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32* %31, i64 %33
  store i32 %30, i32* %34, align 4
  %35 = load i32, i32* %6, align 4
  %36 = sub nsw i32 0, %35
  %37 = load i32*, i32** %4, align 8
  %38 = load i32, i32* %5, align 4
  %39 = sub nsw i32 0, %38
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32* %37, i64 %40
  store i32 %36, i32* %41, align 4
  br label %42

; <label>:42:                                     ; preds = %29
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init_error_limit, i64 0, i64 0)
  %43 = add i64 %pgocount, 1
  store i64 %43, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init_error_limit, i64 0, i64 0)
  %44 = load i32, i32* %5, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %5, align 4
  %46 = load i32, i32* %6, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %6, align 4
  br label %26

; <label>:48:                                     ; preds = %26
  br label %49

; <label>:49:                                     ; preds = %65, %48
  %50 = load i32, i32* %5, align 4
  %51 = icmp slt i32 %50, 48
  br i1 %51, label %52, label %77

; <label>:52:                                     ; preds = %49
  %53 = load i32, i32* %6, align 4
  %54 = load i32*, i32** %4, align 8
  %55 = load i32, i32* %5, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32* %54, i64 %56
  store i32 %53, i32* %57, align 4
  %58 = load i32, i32* %6, align 4
  %59 = sub nsw i32 0, %58
  %60 = load i32*, i32** %4, align 8
  %61 = load i32, i32* %5, align 4
  %62 = sub nsw i32 0, %61
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32* %60, i64 %63
  store i32 %59, i32* %64, align 4
  br label %65

; <label>:65:                                     ; preds = %52
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init_error_limit, i64 0, i64 1)
  %66 = add i64 %pgocount1, 1
  store i64 %66, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init_error_limit, i64 0, i64 1)
  %67 = load i32, i32* %5, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %5, align 4
  %69 = load i32, i32* %5, align 4
  %70 = and i32 %69, 1
  %71 = icmp ne i32 %70, 0
  %72 = zext i1 %71 to i64
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init_error_limit, i64 0, i64 4)
  %73 = add i64 %pgocount2, %72
  store i64 %73, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init_error_limit, i64 0, i64 4)
  %74 = select i1 %71, i32 0, i32 1
  %75 = load i32, i32* %6, align 4
  %76 = add nsw i32 %75, %74
  store i32 %76, i32* %6, align 4
  br label %49

; <label>:77:                                     ; preds = %49
  br label %78

; <label>:78:                                     ; preds = %94, %77
  %79 = load i32, i32* %5, align 4
  %80 = icmp sle i32 %79, 255
  br i1 %80, label %81, label %98

; <label>:81:                                     ; preds = %78
  %82 = load i32, i32* %6, align 4
  %83 = load i32*, i32** %4, align 8
  %84 = load i32, i32* %5, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32* %83, i64 %85
  store i32 %82, i32* %86, align 4
  %87 = load i32, i32* %6, align 4
  %88 = sub nsw i32 0, %87
  %89 = load i32*, i32** %4, align 8
  %90 = load i32, i32* %5, align 4
  %91 = sub nsw i32 0, %90
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32* %89, i64 %92
  store i32 %88, i32* %93, align 4
  br label %94

; <label>:94:                                     ; preds = %81
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init_error_limit, i64 0, i64 2)
  %95 = add i64 %pgocount3, 1
  store i64 %95, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init_error_limit, i64 0, i64 2)
  %96 = load i32, i32* %5, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %5, align 4
  br label %78

; <label>:98:                                     ; preds = %78
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init_error_limit, i64 0, i64 3)
  %99 = add i64 %pgocount4, 1
  store i64 %99, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init_error_limit, i64 0, i64 3)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @prescan_quantize(%struct.jpeg_decompress_struct*, i8**, i8**, i32) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.my_cquantizer*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca [32 x i16]**, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store i8** %1, i8*** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i32 %3, i32* %8, align 4
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 83
  %18 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %17, align 8
  %19 = bitcast %struct.jpeg_color_quantizer* %18 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %19, %struct.my_cquantizer** %9, align 8
  %20 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %21 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %20, i32 0, i32 3
  %22 = load [32 x i16]**, [32 x i16]*** %21, align 8
  store [32 x i16]** %22, [32 x i16]*** %12, align 8
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %23, i32 0, i32 26
  %25 = load i32, i32* %24, align 8
  store i32 %25, i32* %15, align 4
  store i32 0, i32* %13, align 4
  br label %26

; <label>:26:                                     ; preds = %82, %4
  %27 = load i32, i32* %13, align 4
  %28 = load i32, i32* %8, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %86

; <label>:30:                                     ; preds = %26
  %31 = load i8**, i8*** %6, align 8
  %32 = load i32, i32* %13, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8*, i8** %31, i64 %33
  %35 = load i8*, i8** %34, align 8
  store i8* %35, i8** %10, align 8
  %36 = load i32, i32* %15, align 4
  store i32 %36, i32* %14, align 4
  br label %37

; <label>:37:                                     ; preds = %77, %30
  %38 = load i32, i32* %14, align 4
  %39 = icmp ugt i32 %38, 0
  br i1 %39, label %40, label %81

; <label>:40:                                     ; preds = %37
  %41 = load [32 x i16]**, [32 x i16]*** %12, align 8
  %42 = load i8*, i8** %10, align 8
  %43 = getelementptr inbounds i8, i8* %42, i64 0
  %44 = load i8, i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = ashr i32 %45, 3
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [32 x i16]*, [32 x i16]** %41, i64 %47
  %49 = load [32 x i16]*, [32 x i16]** %48, align 8
  %50 = load i8*, i8** %10, align 8
  %51 = getelementptr inbounds i8, i8* %50, i64 1
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = ashr i32 %53, 2
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [32 x i16], [32 x i16]* %49, i64 %55
  %57 = load i8*, i8** %10, align 8
  %58 = getelementptr inbounds i8, i8* %57, i64 2
  %59 = load i8, i8* %58, align 1
  %60 = zext i8 %59 to i32
  %61 = ashr i32 %60, 3
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [32 x i16], [32 x i16]* %56, i64 0, i64 %62
  store i16* %63, i16** %11, align 8
  %64 = load i16*, i16** %11, align 8
  %65 = load i16, i16* %64, align 2
  %66 = add i16 %65, 1
  store i16 %66, i16* %64, align 2
  %67 = zext i16 %66 to i32
  %68 = icmp sle i32 %67, 0
  br i1 %68, label %69, label %74

; <label>:69:                                     ; preds = %40
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_prescan_quantize, i64 0, i64 1)
  %70 = add i64 %pgocount, 1
  store i64 %70, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_prescan_quantize, i64 0, i64 1)
  %71 = load i16*, i16** %11, align 8
  %72 = load i16, i16* %71, align 2
  %73 = add i16 %72, -1
  store i16 %73, i16* %71, align 2
  br label %74

; <label>:74:                                     ; preds = %69, %40
  %75 = load i8*, i8** %10, align 8
  %76 = getelementptr inbounds i8, i8* %75, i64 3
  store i8* %76, i8** %10, align 8
  br label %77

; <label>:77:                                     ; preds = %74
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_prescan_quantize, i64 0, i64 0)
  %78 = add i64 %pgocount1, 1
  store i64 %78, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_prescan_quantize, i64 0, i64 0)
  %79 = load i32, i32* %14, align 4
  %80 = add i32 %79, -1
  store i32 %80, i32* %14, align 4
  br label %37

; <label>:81:                                     ; preds = %37
  br label %82

; <label>:82:                                     ; preds = %81
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_prescan_quantize, i64 0, i64 2)
  %83 = add i64 %pgocount2, 1
  store i64 %83, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_prescan_quantize, i64 0, i64 2)
  %84 = load i32, i32* %13, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %13, align 4
  br label %26

; <label>:86:                                     ; preds = %26
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_prescan_quantize, i64 0, i64 3)
  %87 = add i64 %pgocount3, 1
  store i64 %87, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_prescan_quantize, i64 0, i64 3)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @finish_pass1(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_pass1, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_pass1, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.my_cquantizer*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 83
  %7 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %6, align 8
  %8 = bitcast %struct.jpeg_color_quantizer* %7 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %8, %struct.my_cquantizer** %4, align 8
  %9 = load %struct.my_cquantizer*, %struct.my_cquantizer** %4, align 8
  %10 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %9, i32 0, i32 1
  %11 = load i8**, i8*** %10, align 8
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %12, i32 0, i32 32
  store i8** %11, i8*** %13, align 8
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %15 = load %struct.my_cquantizer*, %struct.my_cquantizer** %4, align 8
  %16 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %15, i32 0, i32 2
  %17 = load i32, i32* %16, align 8
  call void @select_colors(%struct.jpeg_decompress_struct* %14, i32 %17)
  %18 = load %struct.my_cquantizer*, %struct.my_cquantizer** %4, align 8
  %19 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %18, i32 0, i32 4
  store i32 1, i32* %19, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @pass2_fs_dither(%struct.jpeg_decompress_struct*, i8**, i8**, i32) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.my_cquantizer*, align 8
  %10 = alloca [32 x i16]**, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i16*, align 8
  %21 = alloca i8*, align 8
  %22 = alloca i8*, align 8
  %23 = alloca i16*, align 8
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i8*, align 8
  %30 = alloca i32*, align 8
  %31 = alloca i8*, align 8
  %32 = alloca i8*, align 8
  %33 = alloca i8*, align 8
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store i8** %1, i8*** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i32 %3, i32* %8, align 4
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %37, i32 0, i32 83
  %39 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %38, align 8
  %40 = bitcast %struct.jpeg_color_quantizer* %39 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %40, %struct.my_cquantizer** %9, align 8
  %41 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %42 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %41, i32 0, i32 3
  %43 = load [32 x i16]**, [32 x i16]*** %42, align 8
  store [32 x i16]** %43, [32 x i16]*** %10, align 8
  %44 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %44, i32 0, i32 26
  %46 = load i32, i32* %45, align 8
  store i32 %46, i32* %28, align 4
  %47 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %47, i32 0, i32 61
  %49 = load i8*, i8** %48, align 8
  store i8* %49, i8** %29, align 8
  %50 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %51 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %50, i32 0, i32 7
  %52 = load i32*, i32** %51, align 8
  store i32* %52, i32** %30, align 8
  %53 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %53, i32 0, i32 32
  %55 = load i8**, i8*** %54, align 8
  %56 = getelementptr inbounds i8*, i8** %55, i64 0
  %57 = load i8*, i8** %56, align 8
  store i8* %57, i8** %31, align 8
  %58 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %58, i32 0, i32 32
  %60 = load i8**, i8*** %59, align 8
  %61 = getelementptr inbounds i8*, i8** %60, i64 1
  %62 = load i8*, i8** %61, align 8
  store i8* %62, i8** %32, align 8
  %63 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %63, i32 0, i32 32
  %65 = load i8**, i8*** %64, align 8
  %66 = getelementptr inbounds i8*, i8** %65, i64 2
  %67 = load i8*, i8** %66, align 8
  store i8* %67, i8** %33, align 8
  store i32 0, i32* %26, align 4
  br label %68

; <label>:68:                                     ; preds = %361, %4
  %69 = load i32, i32* %26, align 4
  %70 = load i32, i32* %8, align 4
  %71 = icmp slt i32 %69, %70
  br i1 %71, label %72, label %364

; <label>:72:                                     ; preds = %68
  %73 = load i8**, i8*** %6, align 8
  %74 = load i32, i32* %26, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8*, i8** %73, i64 %75
  %77 = load i8*, i8** %76, align 8
  store i8* %77, i8** %21, align 8
  %78 = load i8**, i8*** %7, align 8
  %79 = load i32, i32* %26, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8*, i8** %78, i64 %80
  %82 = load i8*, i8** %81, align 8
  store i8* %82, i8** %22, align 8
  %83 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %84 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %83, i32 0, i32 6
  %85 = load i32, i32* %84, align 8
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %87, label %110

; <label>:87:                                     ; preds = %72
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pass2_fs_dither, i64 0, i64 2)
  %88 = add i64 %pgocount, 1
  store i64 %88, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pass2_fs_dither, i64 0, i64 2)
  %89 = load i32, i32* %28, align 4
  %90 = sub i32 %89, 1
  %91 = mul i32 %90, 3
  %92 = load i8*, i8** %21, align 8
  %93 = zext i32 %91 to i64
  %94 = getelementptr inbounds i8, i8* %92, i64 %93
  store i8* %94, i8** %21, align 8
  %95 = load i32, i32* %28, align 4
  %96 = sub i32 %95, 1
  %97 = load i8*, i8** %22, align 8
  %98 = zext i32 %96 to i64
  %99 = getelementptr inbounds i8, i8* %97, i64 %98
  store i8* %99, i8** %22, align 8
  store i32 -1, i32* %24, align 4
  store i32 -3, i32* %25, align 4
  %100 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %101 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %100, i32 0, i32 5
  %102 = load i16*, i16** %101, align 8
  %103 = load i32, i32* %28, align 4
  %104 = add i32 %103, 1
  %105 = mul i32 %104, 3
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds i16, i16* %102, i64 %106
  store i16* %107, i16** %20, align 8
  %108 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %109 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %108, i32 0, i32 6
  store i32 0, i32* %109, align 8
  br label %117

; <label>:110:                                    ; preds = %72
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pass2_fs_dither, i64 0, i64 3)
  %111 = add i64 %pgocount1, 1
  store i64 %111, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pass2_fs_dither, i64 0, i64 3)
  store i32 1, i32* %24, align 4
  store i32 3, i32* %25, align 4
  %112 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %113 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %112, i32 0, i32 5
  %114 = load i16*, i16** %113, align 8
  store i16* %114, i16** %20, align 8
  %115 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %116 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %115, i32 0, i32 6
  store i32 1, i32* %116, align 8
  br label %117

; <label>:117:                                    ; preds = %110, %87
  store i32 0, i32* %13, align 4
  store i32 0, i32* %12, align 4
  store i32 0, i32* %11, align 4
  store i32 0, i32* %16, align 4
  store i32 0, i32* %15, align 4
  store i32 0, i32* %14, align 4
  store i32 0, i32* %19, align 4
  store i32 0, i32* %18, align 4
  store i32 0, i32* %17, align 4
  %118 = load i32, i32* %28, align 4
  store i32 %118, i32* %27, align 4
  br label %119

; <label>:119:                                    ; preds = %344, %117
  %120 = load i32, i32* %27, align 4
  %121 = icmp ugt i32 %120, 0
  br i1 %121, label %122, label %348

; <label>:122:                                    ; preds = %119
  %123 = load i32, i32* %11, align 4
  %124 = load i16*, i16** %20, align 8
  %125 = load i32, i32* %25, align 4
  %126 = add nsw i32 %125, 0
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i16, i16* %124, i64 %127
  %129 = load i16, i16* %128, align 2
  %130 = sext i16 %129 to i32
  %131 = add nsw i32 %123, %130
  %132 = add nsw i32 %131, 8
  %133 = ashr i32 %132, 4
  store i32 %133, i32* %11, align 4
  %134 = load i32, i32* %12, align 4
  %135 = load i16*, i16** %20, align 8
  %136 = load i32, i32* %25, align 4
  %137 = add nsw i32 %136, 1
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i16, i16* %135, i64 %138
  %140 = load i16, i16* %139, align 2
  %141 = sext i16 %140 to i32
  %142 = add nsw i32 %134, %141
  %143 = add nsw i32 %142, 8
  %144 = ashr i32 %143, 4
  store i32 %144, i32* %12, align 4
  %145 = load i32, i32* %13, align 4
  %146 = load i16*, i16** %20, align 8
  %147 = load i32, i32* %25, align 4
  %148 = add nsw i32 %147, 2
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i16, i16* %146, i64 %149
  %151 = load i16, i16* %150, align 2
  %152 = sext i16 %151 to i32
  %153 = add nsw i32 %145, %152
  %154 = add nsw i32 %153, 8
  %155 = ashr i32 %154, 4
  store i32 %155, i32* %13, align 4
  %156 = load i32*, i32** %30, align 8
  %157 = load i32, i32* %11, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i32, i32* %156, i64 %158
  %160 = load i32, i32* %159, align 4
  store i32 %160, i32* %11, align 4
  %161 = load i32*, i32** %30, align 8
  %162 = load i32, i32* %12, align 4
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i32, i32* %161, i64 %163
  %165 = load i32, i32* %164, align 4
  store i32 %165, i32* %12, align 4
  %166 = load i32*, i32** %30, align 8
  %167 = load i32, i32* %13, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i32, i32* %166, i64 %168
  %170 = load i32, i32* %169, align 4
  store i32 %170, i32* %13, align 4
  %171 = load i8*, i8** %21, align 8
  %172 = getelementptr inbounds i8, i8* %171, i64 0
  %173 = load i8, i8* %172, align 1
  %174 = zext i8 %173 to i32
  %175 = load i32, i32* %11, align 4
  %176 = add nsw i32 %175, %174
  store i32 %176, i32* %11, align 4
  %177 = load i8*, i8** %21, align 8
  %178 = getelementptr inbounds i8, i8* %177, i64 1
  %179 = load i8, i8* %178, align 1
  %180 = zext i8 %179 to i32
  %181 = load i32, i32* %12, align 4
  %182 = add nsw i32 %181, %180
  store i32 %182, i32* %12, align 4
  %183 = load i8*, i8** %21, align 8
  %184 = getelementptr inbounds i8, i8* %183, i64 2
  %185 = load i8, i8* %184, align 1
  %186 = zext i8 %185 to i32
  %187 = load i32, i32* %13, align 4
  %188 = add nsw i32 %187, %186
  store i32 %188, i32* %13, align 4
  %189 = load i8*, i8** %29, align 8
  %190 = load i32, i32* %11, align 4
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds i8, i8* %189, i64 %191
  %193 = load i8, i8* %192, align 1
  %194 = zext i8 %193 to i32
  store i32 %194, i32* %11, align 4
  %195 = load i8*, i8** %29, align 8
  %196 = load i32, i32* %12, align 4
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds i8, i8* %195, i64 %197
  %199 = load i8, i8* %198, align 1
  %200 = zext i8 %199 to i32
  store i32 %200, i32* %12, align 4
  %201 = load i8*, i8** %29, align 8
  %202 = load i32, i32* %13, align 4
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds i8, i8* %201, i64 %203
  %205 = load i8, i8* %204, align 1
  %206 = zext i8 %205 to i32
  store i32 %206, i32* %13, align 4
  %207 = load [32 x i16]**, [32 x i16]*** %10, align 8
  %208 = load i32, i32* %11, align 4
  %209 = ashr i32 %208, 3
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [32 x i16]*, [32 x i16]** %207, i64 %210
  %212 = load [32 x i16]*, [32 x i16]** %211, align 8
  %213 = load i32, i32* %12, align 4
  %214 = ashr i32 %213, 2
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds [32 x i16], [32 x i16]* %212, i64 %215
  %217 = load i32, i32* %13, align 4
  %218 = ashr i32 %217, 3
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [32 x i16], [32 x i16]* %216, i64 0, i64 %219
  store i16* %220, i16** %23, align 8
  %221 = load i16*, i16** %23, align 8
  %222 = load i16, i16* %221, align 2
  %223 = zext i16 %222 to i32
  %224 = icmp eq i32 %223, 0
  br i1 %224, label %225, label %234

; <label>:225:                                    ; preds = %122
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pass2_fs_dither, i64 0, i64 1)
  %226 = add i64 %pgocount2, 1
  store i64 %226, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pass2_fs_dither, i64 0, i64 1)
  %227 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %228 = load i32, i32* %11, align 4
  %229 = ashr i32 %228, 3
  %230 = load i32, i32* %12, align 4
  %231 = ashr i32 %230, 2
  %232 = load i32, i32* %13, align 4
  %233 = ashr i32 %232, 3
  call void @fill_inverse_cmap(%struct.jpeg_decompress_struct* %227, i32 %229, i32 %231, i32 %233)
  br label %234

; <label>:234:                                    ; preds = %225, %122
  %235 = load i16*, i16** %23, align 8
  %236 = load i16, i16* %235, align 2
  %237 = zext i16 %236 to i32
  %238 = sub nsw i32 %237, 1
  store i32 %238, i32* %34, align 4
  %239 = load i32, i32* %34, align 4
  %240 = trunc i32 %239 to i8
  %241 = load i8*, i8** %22, align 8
  store i8 %240, i8* %241, align 1
  %242 = load i8*, i8** %31, align 8
  %243 = load i32, i32* %34, align 4
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds i8, i8* %242, i64 %244
  %246 = load i8, i8* %245, align 1
  %247 = zext i8 %246 to i32
  %248 = load i32, i32* %11, align 4
  %249 = sub nsw i32 %248, %247
  store i32 %249, i32* %11, align 4
  %250 = load i8*, i8** %32, align 8
  %251 = load i32, i32* %34, align 4
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds i8, i8* %250, i64 %252
  %254 = load i8, i8* %253, align 1
  %255 = zext i8 %254 to i32
  %256 = load i32, i32* %12, align 4
  %257 = sub nsw i32 %256, %255
  store i32 %257, i32* %12, align 4
  %258 = load i8*, i8** %33, align 8
  %259 = load i32, i32* %34, align 4
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds i8, i8* %258, i64 %260
  %262 = load i8, i8* %261, align 1
  %263 = zext i8 %262 to i32
  %264 = load i32, i32* %13, align 4
  %265 = sub nsw i32 %264, %263
  store i32 %265, i32* %13, align 4
  %266 = load i32, i32* %11, align 4
  store i32 %266, i32* %35, align 4
  %267 = load i32, i32* %11, align 4
  %268 = mul nsw i32 %267, 2
  store i32 %268, i32* %36, align 4
  %269 = load i32, i32* %36, align 4
  %270 = load i32, i32* %11, align 4
  %271 = add nsw i32 %270, %269
  store i32 %271, i32* %11, align 4
  %272 = load i32, i32* %17, align 4
  %273 = load i32, i32* %11, align 4
  %274 = add nsw i32 %272, %273
  %275 = trunc i32 %274 to i16
  %276 = load i16*, i16** %20, align 8
  %277 = getelementptr inbounds i16, i16* %276, i64 0
  store i16 %275, i16* %277, align 2
  %278 = load i32, i32* %36, align 4
  %279 = load i32, i32* %11, align 4
  %280 = add nsw i32 %279, %278
  store i32 %280, i32* %11, align 4
  %281 = load i32, i32* %14, align 4
  %282 = load i32, i32* %11, align 4
  %283 = add nsw i32 %281, %282
  store i32 %283, i32* %17, align 4
  %284 = load i32, i32* %35, align 4
  store i32 %284, i32* %14, align 4
  %285 = load i32, i32* %36, align 4
  %286 = load i32, i32* %11, align 4
  %287 = add nsw i32 %286, %285
  store i32 %287, i32* %11, align 4
  %288 = load i32, i32* %12, align 4
  store i32 %288, i32* %35, align 4
  %289 = load i32, i32* %12, align 4
  %290 = mul nsw i32 %289, 2
  store i32 %290, i32* %36, align 4
  %291 = load i32, i32* %36, align 4
  %292 = load i32, i32* %12, align 4
  %293 = add nsw i32 %292, %291
  store i32 %293, i32* %12, align 4
  %294 = load i32, i32* %18, align 4
  %295 = load i32, i32* %12, align 4
  %296 = add nsw i32 %294, %295
  %297 = trunc i32 %296 to i16
  %298 = load i16*, i16** %20, align 8
  %299 = getelementptr inbounds i16, i16* %298, i64 1
  store i16 %297, i16* %299, align 2
  %300 = load i32, i32* %36, align 4
  %301 = load i32, i32* %12, align 4
  %302 = add nsw i32 %301, %300
  store i32 %302, i32* %12, align 4
  %303 = load i32, i32* %15, align 4
  %304 = load i32, i32* %12, align 4
  %305 = add nsw i32 %303, %304
  store i32 %305, i32* %18, align 4
  %306 = load i32, i32* %35, align 4
  store i32 %306, i32* %15, align 4
  %307 = load i32, i32* %36, align 4
  %308 = load i32, i32* %12, align 4
  %309 = add nsw i32 %308, %307
  store i32 %309, i32* %12, align 4
  %310 = load i32, i32* %13, align 4
  store i32 %310, i32* %35, align 4
  %311 = load i32, i32* %13, align 4
  %312 = mul nsw i32 %311, 2
  store i32 %312, i32* %36, align 4
  %313 = load i32, i32* %36, align 4
  %314 = load i32, i32* %13, align 4
  %315 = add nsw i32 %314, %313
  store i32 %315, i32* %13, align 4
  %316 = load i32, i32* %19, align 4
  %317 = load i32, i32* %13, align 4
  %318 = add nsw i32 %316, %317
  %319 = trunc i32 %318 to i16
  %320 = load i16*, i16** %20, align 8
  %321 = getelementptr inbounds i16, i16* %320, i64 2
  store i16 %319, i16* %321, align 2
  %322 = load i32, i32* %36, align 4
  %323 = load i32, i32* %13, align 4
  %324 = add nsw i32 %323, %322
  store i32 %324, i32* %13, align 4
  %325 = load i32, i32* %16, align 4
  %326 = load i32, i32* %13, align 4
  %327 = add nsw i32 %325, %326
  store i32 %327, i32* %19, align 4
  %328 = load i32, i32* %35, align 4
  store i32 %328, i32* %16, align 4
  %329 = load i32, i32* %36, align 4
  %330 = load i32, i32* %13, align 4
  %331 = add nsw i32 %330, %329
  store i32 %331, i32* %13, align 4
  %332 = load i32, i32* %25, align 4
  %333 = load i8*, i8** %21, align 8
  %334 = sext i32 %332 to i64
  %335 = getelementptr inbounds i8, i8* %333, i64 %334
  store i8* %335, i8** %21, align 8
  %336 = load i32, i32* %24, align 4
  %337 = load i8*, i8** %22, align 8
  %338 = sext i32 %336 to i64
  %339 = getelementptr inbounds i8, i8* %337, i64 %338
  store i8* %339, i8** %22, align 8
  %340 = load i32, i32* %25, align 4
  %341 = load i16*, i16** %20, align 8
  %342 = sext i32 %340 to i64
  %343 = getelementptr inbounds i16, i16* %341, i64 %342
  store i16* %343, i16** %20, align 8
  br label %344

; <label>:344:                                    ; preds = %234
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pass2_fs_dither, i64 0, i64 0)
  %345 = add i64 %pgocount3, 1
  store i64 %345, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pass2_fs_dither, i64 0, i64 0)
  %346 = load i32, i32* %27, align 4
  %347 = add i32 %346, -1
  store i32 %347, i32* %27, align 4
  br label %119

; <label>:348:                                    ; preds = %119
  %349 = load i32, i32* %17, align 4
  %350 = trunc i32 %349 to i16
  %351 = load i16*, i16** %20, align 8
  %352 = getelementptr inbounds i16, i16* %351, i64 0
  store i16 %350, i16* %352, align 2
  %353 = load i32, i32* %18, align 4
  %354 = trunc i32 %353 to i16
  %355 = load i16*, i16** %20, align 8
  %356 = getelementptr inbounds i16, i16* %355, i64 1
  store i16 %354, i16* %356, align 2
  %357 = load i32, i32* %19, align 4
  %358 = trunc i32 %357 to i16
  %359 = load i16*, i16** %20, align 8
  %360 = getelementptr inbounds i16, i16* %359, i64 2
  store i16 %358, i16* %360, align 2
  br label %361

; <label>:361:                                    ; preds = %348
  %362 = load i32, i32* %26, align 4
  %363 = add nsw i32 %362, 1
  store i32 %363, i32* %26, align 4
  br label %68

; <label>:364:                                    ; preds = %68
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pass2_fs_dither, i64 0, i64 4)
  %365 = add i64 %pgocount4, 1
  store i64 %365, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_pass2_fs_dither, i64 0, i64 4)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @pass2_no_dither(%struct.jpeg_decompress_struct*, i8**, i8**, i32) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.my_cquantizer*, align 8
  %10 = alloca [32 x i16]**, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i16*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store i8** %1, i8*** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i32 %3, i32* %8, align 4
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %20, i32 0, i32 83
  %22 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %21, align 8
  %23 = bitcast %struct.jpeg_color_quantizer* %22 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %23, %struct.my_cquantizer** %9, align 8
  %24 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %25 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %24, i32 0, i32 3
  %26 = load [32 x i16]**, [32 x i16]*** %25, align 8
  store [32 x i16]** %26, [32 x i16]*** %10, align 8
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %27, i32 0, i32 26
  %29 = load i32, i32* %28, align 8
  store i32 %29, i32* %19, align 4
  store i32 0, i32* %17, align 4
  br label %30

; <label>:30:                                     ; preds = %99, %4
  %31 = load i32, i32* %17, align 4
  %32 = load i32, i32* %8, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %103

; <label>:34:                                     ; preds = %30
  %35 = load i8**, i8*** %6, align 8
  %36 = load i32, i32* %17, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8*, i8** %35, i64 %37
  %39 = load i8*, i8** %38, align 8
  store i8* %39, i8** %11, align 8
  %40 = load i8**, i8*** %7, align 8
  %41 = load i32, i32* %17, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8*, i8** %40, i64 %42
  %44 = load i8*, i8** %43, align 8
  store i8* %44, i8** %12, align 8
  %45 = load i32, i32* %19, align 4
  store i32 %45, i32* %18, align 4
  br label %46

; <label>:46:                                     ; preds = %94, %34
  %47 = load i32, i32* %18, align 4
  %48 = icmp ugt i32 %47, 0
  br i1 %48, label %49, label %98

; <label>:49:                                     ; preds = %46
  %50 = load i8*, i8** %11, align 8
  %51 = getelementptr inbounds i8, i8* %50, i32 1
  store i8* %51, i8** %11, align 8
  %52 = load i8, i8* %50, align 1
  %53 = zext i8 %52 to i32
  %54 = ashr i32 %53, 3
  store i32 %54, i32* %14, align 4
  %55 = load i8*, i8** %11, align 8
  %56 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %56, i8** %11, align 8
  %57 = load i8, i8* %55, align 1
  %58 = zext i8 %57 to i32
  %59 = ashr i32 %58, 2
  store i32 %59, i32* %15, align 4
  %60 = load i8*, i8** %11, align 8
  %61 = getelementptr inbounds i8, i8* %60, i32 1
  store i8* %61, i8** %11, align 8
  %62 = load i8, i8* %60, align 1
  %63 = zext i8 %62 to i32
  %64 = ashr i32 %63, 3
  store i32 %64, i32* %16, align 4
  %65 = load [32 x i16]**, [32 x i16]*** %10, align 8
  %66 = load i32, i32* %14, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [32 x i16]*, [32 x i16]** %65, i64 %67
  %69 = load [32 x i16]*, [32 x i16]** %68, align 8
  %70 = load i32, i32* %15, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [32 x i16], [32 x i16]* %69, i64 %71
  %73 = load i32, i32* %16, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [32 x i16], [32 x i16]* %72, i64 0, i64 %74
  store i16* %75, i16** %13, align 8
  %76 = load i16*, i16** %13, align 8
  %77 = load i16, i16* %76, align 2
  %78 = zext i16 %77 to i32
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %86

; <label>:80:                                     ; preds = %49
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pass2_no_dither, i64 0, i64 1)
  %81 = add i64 %pgocount, 1
  store i64 %81, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pass2_no_dither, i64 0, i64 1)
  %82 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %83 = load i32, i32* %14, align 4
  %84 = load i32, i32* %15, align 4
  %85 = load i32, i32* %16, align 4
  call void @fill_inverse_cmap(%struct.jpeg_decompress_struct* %82, i32 %83, i32 %84, i32 %85)
  br label %86

; <label>:86:                                     ; preds = %80, %49
  %87 = load i16*, i16** %13, align 8
  %88 = load i16, i16* %87, align 2
  %89 = zext i16 %88 to i32
  %90 = sub nsw i32 %89, 1
  %91 = trunc i32 %90 to i8
  %92 = load i8*, i8** %12, align 8
  %93 = getelementptr inbounds i8, i8* %92, i32 1
  store i8* %93, i8** %12, align 8
  store i8 %91, i8* %92, align 1
  br label %94

; <label>:94:                                     ; preds = %86
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pass2_no_dither, i64 0, i64 0)
  %95 = add i64 %pgocount1, 1
  store i64 %95, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pass2_no_dither, i64 0, i64 0)
  %96 = load i32, i32* %18, align 4
  %97 = add i32 %96, -1
  store i32 %97, i32* %18, align 4
  br label %46

; <label>:98:                                     ; preds = %46
  br label %99

; <label>:99:                                     ; preds = %98
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pass2_no_dither, i64 0, i64 2)
  %100 = add i64 %pgocount2, 1
  store i64 %100, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pass2_no_dither, i64 0, i64 2)
  %101 = load i32, i32* %17, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* %17, align 4
  br label %30

; <label>:103:                                    ; preds = %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pass2_no_dither, i64 0, i64 3)
  %104 = add i64 %pgocount3, 1
  store i64 %104, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pass2_no_dither, i64 0, i64 3)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @finish_pass2(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_pass2, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_pass2, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  ret void
}

declare void @jzero_far(i8*, i64) #1

; Function Attrs: nounwind uwtable
define internal void @select_colors(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.box*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %8 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %8, i32 0, i32 1
  %10 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %10, i32 0, i32 0
  %12 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %11, align 8
  %13 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %14 = bitcast %struct.jpeg_decompress_struct* %13 to %struct.jpeg_common_struct*
  %15 = load i32, i32* %4, align 4
  %16 = sext i32 %15 to i64
  %17 = mul i64 %16, 40
  %18 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %12 to i64
  call void @__llvm_profile_instrument_target(i64 %18, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_select_colors to i8*), i32 0)
  %19 = call i8* %12(%struct.jpeg_common_struct* %14, i32 1, i64 %17)
  %20 = bitcast i8* %19 to %struct.box*
  store %struct.box* %20, %struct.box** %5, align 8
  store i32 1, i32* %6, align 4
  %21 = load %struct.box*, %struct.box** %5, align 8
  %22 = getelementptr inbounds %struct.box, %struct.box* %21, i64 0
  %23 = getelementptr inbounds %struct.box, %struct.box* %22, i32 0, i32 0
  store i32 0, i32* %23, align 8
  %24 = load %struct.box*, %struct.box** %5, align 8
  %25 = getelementptr inbounds %struct.box, %struct.box* %24, i64 0
  %26 = getelementptr inbounds %struct.box, %struct.box* %25, i32 0, i32 1
  store i32 31, i32* %26, align 4
  %27 = load %struct.box*, %struct.box** %5, align 8
  %28 = getelementptr inbounds %struct.box, %struct.box* %27, i64 0
  %29 = getelementptr inbounds %struct.box, %struct.box* %28, i32 0, i32 2
  store i32 0, i32* %29, align 8
  %30 = load %struct.box*, %struct.box** %5, align 8
  %31 = getelementptr inbounds %struct.box, %struct.box* %30, i64 0
  %32 = getelementptr inbounds %struct.box, %struct.box* %31, i32 0, i32 3
  store i32 63, i32* %32, align 4
  %33 = load %struct.box*, %struct.box** %5, align 8
  %34 = getelementptr inbounds %struct.box, %struct.box* %33, i64 0
  %35 = getelementptr inbounds %struct.box, %struct.box* %34, i32 0, i32 4
  store i32 0, i32* %35, align 8
  %36 = load %struct.box*, %struct.box** %5, align 8
  %37 = getelementptr inbounds %struct.box, %struct.box* %36, i64 0
  %38 = getelementptr inbounds %struct.box, %struct.box* %37, i32 0, i32 5
  store i32 31, i32* %38, align 4
  %39 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %40 = load %struct.box*, %struct.box** %5, align 8
  %41 = getelementptr inbounds %struct.box, %struct.box* %40, i64 0
  call void @update_box(%struct.jpeg_decompress_struct* %39, %struct.box* %41)
  %42 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %43 = load %struct.box*, %struct.box** %5, align 8
  %44 = load i32, i32* %6, align 4
  %45 = load i32, i32* %4, align 4
  %46 = call i32 @median_cut(%struct.jpeg_decompress_struct* %42, %struct.box* %43, i32 %44, i32 %45)
  store i32 %46, i32* %6, align 4
  store i32 0, i32* %7, align 4
  br label %47

; <label>:47:                                     ; preds = %58, %2
  %48 = load i32, i32* %7, align 4
  %49 = load i32, i32* %6, align 4
  %50 = icmp slt i32 %48, %49
  br i1 %50, label %51, label %62

; <label>:51:                                     ; preds = %47
  %52 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %53 = load %struct.box*, %struct.box** %5, align 8
  %54 = load i32, i32* %7, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds %struct.box, %struct.box* %53, i64 %55
  %57 = load i32, i32* %7, align 4
  call void @compute_color(%struct.jpeg_decompress_struct* %52, %struct.box* %56, i32 %57)
  br label %58

; <label>:58:                                     ; preds = %51
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_select_colors, i64 0, i64 0)
  %59 = add i64 %pgocount, 1
  store i64 %59, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_select_colors, i64 0, i64 0)
  %60 = load i32, i32* %7, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %7, align 4
  br label %47

; <label>:62:                                     ; preds = %47
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_select_colors, i64 0, i64 1)
  %63 = add i64 %pgocount1, 1
  store i64 %63, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_select_colors, i64 0, i64 1)
  %64 = load i32, i32* %6, align 4
  %65 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %66 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %65, i32 0, i32 31
  store i32 %64, i32* %66, align 4
  %67 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %68 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %67, i32 0, i32 0
  %69 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %68, align 8
  %70 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %69, i32 0, i32 5
  store i32 95, i32* %70, align 8
  %71 = load i32, i32* %6, align 4
  %72 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %72, i32 0, i32 0
  %74 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %73, align 8
  %75 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %74, i32 0, i32 6
  %76 = bitcast %union.anon* %75 to [8 x i32]*
  %77 = getelementptr inbounds [8 x i32], [8 x i32]* %76, i64 0, i64 0
  store i32 %71, i32* %77, align 4
  %78 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %78, i32 0, i32 0
  %80 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %79, align 8
  %81 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %80, i32 0, i32 1
  %82 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %81, align 8
  %83 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %84 = bitcast %struct.jpeg_decompress_struct* %83 to %struct.jpeg_common_struct*
  %85 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %82 to i64
  call void @__llvm_profile_instrument_target(i64 %85, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_select_colors to i8*), i32 1)
  call void %82(%struct.jpeg_common_struct* %84, i32 1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @update_box(%struct.jpeg_decompress_struct*, %struct.box*) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.box*, align 8
  %5 = alloca %struct.my_cquantizer*, align 8
  %6 = alloca [32 x i16]**, align 8
  %7 = alloca i16*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store %struct.box* %1, %struct.box** %4, align 8
  %21 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %21, i32 0, i32 83
  %23 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %22, align 8
  %24 = bitcast %struct.jpeg_color_quantizer* %23 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %24, %struct.my_cquantizer** %5, align 8
  %25 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %26 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %25, i32 0, i32 3
  %27 = load [32 x i16]**, [32 x i16]*** %26, align 8
  store [32 x i16]** %27, [32 x i16]*** %6, align 8
  %28 = load %struct.box*, %struct.box** %4, align 8
  %29 = getelementptr inbounds %struct.box, %struct.box* %28, i32 0, i32 0
  %30 = load i32, i32* %29, align 8
  store i32 %30, i32* %11, align 4
  %31 = load %struct.box*, %struct.box** %4, align 8
  %32 = getelementptr inbounds %struct.box, %struct.box* %31, i32 0, i32 1
  %33 = load i32, i32* %32, align 4
  store i32 %33, i32* %12, align 4
  %34 = load %struct.box*, %struct.box** %4, align 8
  %35 = getelementptr inbounds %struct.box, %struct.box* %34, i32 0, i32 2
  %36 = load i32, i32* %35, align 8
  store i32 %36, i32* %13, align 4
  %37 = load %struct.box*, %struct.box** %4, align 8
  %38 = getelementptr inbounds %struct.box, %struct.box* %37, i32 0, i32 3
  %39 = load i32, i32* %38, align 4
  store i32 %39, i32* %14, align 4
  %40 = load %struct.box*, %struct.box** %4, align 8
  %41 = getelementptr inbounds %struct.box, %struct.box* %40, i32 0, i32 4
  %42 = load i32, i32* %41, align 8
  store i32 %42, i32* %15, align 4
  %43 = load %struct.box*, %struct.box** %4, align 8
  %44 = getelementptr inbounds %struct.box, %struct.box* %43, i32 0, i32 5
  %45 = load i32, i32* %44, align 4
  store i32 %45, i32* %16, align 4
  %46 = load i32, i32* %12, align 4
  %47 = load i32, i32* %11, align 4
  %48 = icmp sgt i32 %46, %47
  br i1 %48, label %49, label %106

; <label>:49:                                     ; preds = %2
  %50 = load i32, i32* %11, align 4
  store i32 %50, i32* %8, align 4
  br label %51

; <label>:51:                                     ; preds = %100, %49
  %52 = load i32, i32* %8, align 4
  %53 = load i32, i32* %12, align 4
  %54 = icmp sle i32 %52, %53
  br i1 %54, label %55, label %104

; <label>:55:                                     ; preds = %51
  %56 = load i32, i32* %13, align 4
  store i32 %56, i32* %9, align 4
  br label %57

; <label>:57:                                     ; preds = %95, %55
  %58 = load i32, i32* %9, align 4
  %59 = load i32, i32* %14, align 4
  %60 = icmp sle i32 %58, %59
  br i1 %60, label %61, label %99

; <label>:61:                                     ; preds = %57
  %62 = load [32 x i16]**, [32 x i16]*** %6, align 8
  %63 = load i32, i32* %8, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [32 x i16]*, [32 x i16]** %62, i64 %64
  %66 = load [32 x i16]*, [32 x i16]** %65, align 8
  %67 = load i32, i32* %9, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [32 x i16], [32 x i16]* %66, i64 %68
  %70 = load i32, i32* %15, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [32 x i16], [32 x i16]* %69, i64 0, i64 %71
  store i16* %72, i16** %7, align 8
  %73 = load i32, i32* %15, align 4
  store i32 %73, i32* %10, align 4
  br label %74

; <label>:74:                                     ; preds = %91, %61
  %75 = load i32, i32* %10, align 4
  %76 = load i32, i32* %16, align 4
  %77 = icmp sle i32 %75, %76
  br i1 %77, label %78, label %94

; <label>:78:                                     ; preds = %74
  %79 = load i16*, i16** %7, align 8
  %80 = getelementptr inbounds i16, i16* %79, i32 1
  store i16* %80, i16** %7, align 8
  %81 = load i16, i16* %79, align 2
  %82 = zext i16 %81 to i32
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %84, label %89

; <label>:84:                                     ; preds = %78
  %pgocount = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 17)
  %85 = add i64 %pgocount, 1
  store i64 %85, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 17)
  %86 = load i32, i32* %8, align 4
  store i32 %86, i32* %11, align 4
  %87 = load %struct.box*, %struct.box** %4, align 8
  %88 = getelementptr inbounds %struct.box, %struct.box* %87, i32 0, i32 0
  store i32 %86, i32* %88, align 8
  br label %107

; <label>:89:                                     ; preds = %78
  %pgocount1 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 4)
  %90 = add i64 %pgocount1, 1
  store i64 %90, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 4)
  br label %91

; <label>:91:                                     ; preds = %89
  %92 = load i32, i32* %10, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %10, align 4
  br label %74

; <label>:94:                                     ; preds = %74
  br label %95

; <label>:95:                                     ; preds = %94
  %pgocount2 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 11)
  %96 = add i64 %pgocount2, 1
  store i64 %96, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 11)
  %97 = load i32, i32* %9, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %9, align 4
  br label %57

; <label>:99:                                     ; preds = %57
  br label %100

; <label>:100:                                    ; preds = %99
  %pgocount3 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 23)
  %101 = add i64 %pgocount3, 1
  store i64 %101, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 23)
  %102 = load i32, i32* %8, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, i32* %8, align 4
  br label %51

; <label>:104:                                    ; preds = %51
  %pgocount4 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 29)
  %105 = add i64 %pgocount4, 1
  store i64 %105, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 29)
  br label %106

; <label>:106:                                    ; preds = %104, %2
  br label %107

; <label>:107:                                    ; preds = %106, %84
  %108 = load i32, i32* %12, align 4
  %109 = load i32, i32* %11, align 4
  %110 = icmp sgt i32 %108, %109
  br i1 %110, label %111, label %168

; <label>:111:                                    ; preds = %107
  %112 = load i32, i32* %12, align 4
  store i32 %112, i32* %8, align 4
  br label %113

; <label>:113:                                    ; preds = %162, %111
  %114 = load i32, i32* %8, align 4
  %115 = load i32, i32* %11, align 4
  %116 = icmp sge i32 %114, %115
  br i1 %116, label %117, label %166

; <label>:117:                                    ; preds = %113
  %118 = load i32, i32* %13, align 4
  store i32 %118, i32* %9, align 4
  br label %119

; <label>:119:                                    ; preds = %157, %117
  %120 = load i32, i32* %9, align 4
  %121 = load i32, i32* %14, align 4
  %122 = icmp sle i32 %120, %121
  br i1 %122, label %123, label %161

; <label>:123:                                    ; preds = %119
  %124 = load [32 x i16]**, [32 x i16]*** %6, align 8
  %125 = load i32, i32* %8, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [32 x i16]*, [32 x i16]** %124, i64 %126
  %128 = load [32 x i16]*, [32 x i16]** %127, align 8
  %129 = load i32, i32* %9, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [32 x i16], [32 x i16]* %128, i64 %130
  %132 = load i32, i32* %15, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [32 x i16], [32 x i16]* %131, i64 0, i64 %133
  store i16* %134, i16** %7, align 8
  %135 = load i32, i32* %15, align 4
  store i32 %135, i32* %10, align 4
  br label %136

; <label>:136:                                    ; preds = %153, %123
  %137 = load i32, i32* %10, align 4
  %138 = load i32, i32* %16, align 4
  %139 = icmp sle i32 %137, %138
  br i1 %139, label %140, label %156

; <label>:140:                                    ; preds = %136
  %141 = load i16*, i16** %7, align 8
  %142 = getelementptr inbounds i16, i16* %141, i32 1
  store i16* %142, i16** %7, align 8
  %143 = load i16, i16* %141, align 2
  %144 = zext i16 %143 to i32
  %145 = icmp ne i32 %144, 0
  br i1 %145, label %146, label %151

; <label>:146:                                    ; preds = %140
  %pgocount5 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 18)
  %147 = add i64 %pgocount5, 1
  store i64 %147, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 18)
  %148 = load i32, i32* %8, align 4
  store i32 %148, i32* %12, align 4
  %149 = load %struct.box*, %struct.box** %4, align 8
  %150 = getelementptr inbounds %struct.box, %struct.box* %149, i32 0, i32 1
  store i32 %148, i32* %150, align 4
  br label %169

; <label>:151:                                    ; preds = %140
  %pgocount6 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 5)
  %152 = add i64 %pgocount6, 1
  store i64 %152, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 5)
  br label %153

; <label>:153:                                    ; preds = %151
  %154 = load i32, i32* %10, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, i32* %10, align 4
  br label %136

; <label>:156:                                    ; preds = %136
  br label %157

; <label>:157:                                    ; preds = %156
  %pgocount7 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 12)
  %158 = add i64 %pgocount7, 1
  store i64 %158, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 12)
  %159 = load i32, i32* %9, align 4
  %160 = add nsw i32 %159, 1
  store i32 %160, i32* %9, align 4
  br label %119

; <label>:161:                                    ; preds = %119
  br label %162

; <label>:162:                                    ; preds = %161
  %pgocount8 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 24)
  %163 = add i64 %pgocount8, 1
  store i64 %163, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 24)
  %164 = load i32, i32* %8, align 4
  %165 = add nsw i32 %164, -1
  store i32 %165, i32* %8, align 4
  br label %113

; <label>:166:                                    ; preds = %113
  %pgocount9 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 30)
  %167 = add i64 %pgocount9, 1
  store i64 %167, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 30)
  br label %168

; <label>:168:                                    ; preds = %166, %107
  br label %169

; <label>:169:                                    ; preds = %168, %146
  %170 = load i32, i32* %14, align 4
  %171 = load i32, i32* %13, align 4
  %172 = icmp sgt i32 %170, %171
  br i1 %172, label %173, label %230

; <label>:173:                                    ; preds = %169
  %174 = load i32, i32* %13, align 4
  store i32 %174, i32* %9, align 4
  br label %175

; <label>:175:                                    ; preds = %224, %173
  %176 = load i32, i32* %9, align 4
  %177 = load i32, i32* %14, align 4
  %178 = icmp sle i32 %176, %177
  br i1 %178, label %179, label %228

; <label>:179:                                    ; preds = %175
  %180 = load i32, i32* %11, align 4
  store i32 %180, i32* %8, align 4
  br label %181

; <label>:181:                                    ; preds = %219, %179
  %182 = load i32, i32* %8, align 4
  %183 = load i32, i32* %12, align 4
  %184 = icmp sle i32 %182, %183
  br i1 %184, label %185, label %223

; <label>:185:                                    ; preds = %181
  %186 = load [32 x i16]**, [32 x i16]*** %6, align 8
  %187 = load i32, i32* %8, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [32 x i16]*, [32 x i16]** %186, i64 %188
  %190 = load [32 x i16]*, [32 x i16]** %189, align 8
  %191 = load i32, i32* %9, align 4
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds [32 x i16], [32 x i16]* %190, i64 %192
  %194 = load i32, i32* %15, align 4
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds [32 x i16], [32 x i16]* %193, i64 0, i64 %195
  store i16* %196, i16** %7, align 8
  %197 = load i32, i32* %15, align 4
  store i32 %197, i32* %10, align 4
  br label %198

; <label>:198:                                    ; preds = %215, %185
  %199 = load i32, i32* %10, align 4
  %200 = load i32, i32* %16, align 4
  %201 = icmp sle i32 %199, %200
  br i1 %201, label %202, label %218

; <label>:202:                                    ; preds = %198
  %203 = load i16*, i16** %7, align 8
  %204 = getelementptr inbounds i16, i16* %203, i32 1
  store i16* %204, i16** %7, align 8
  %205 = load i16, i16* %203, align 2
  %206 = zext i16 %205 to i32
  %207 = icmp ne i32 %206, 0
  br i1 %207, label %208, label %213

; <label>:208:                                    ; preds = %202
  %pgocount10 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 19)
  %209 = add i64 %pgocount10, 1
  store i64 %209, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 19)
  %210 = load i32, i32* %9, align 4
  store i32 %210, i32* %13, align 4
  %211 = load %struct.box*, %struct.box** %4, align 8
  %212 = getelementptr inbounds %struct.box, %struct.box* %211, i32 0, i32 2
  store i32 %210, i32* %212, align 8
  br label %231

; <label>:213:                                    ; preds = %202
  %pgocount11 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 6)
  %214 = add i64 %pgocount11, 1
  store i64 %214, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 6)
  br label %215

; <label>:215:                                    ; preds = %213
  %216 = load i32, i32* %10, align 4
  %217 = add nsw i32 %216, 1
  store i32 %217, i32* %10, align 4
  br label %198

; <label>:218:                                    ; preds = %198
  br label %219

; <label>:219:                                    ; preds = %218
  %pgocount12 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 13)
  %220 = add i64 %pgocount12, 1
  store i64 %220, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 13)
  %221 = load i32, i32* %8, align 4
  %222 = add nsw i32 %221, 1
  store i32 %222, i32* %8, align 4
  br label %181

; <label>:223:                                    ; preds = %181
  br label %224

; <label>:224:                                    ; preds = %223
  %pgocount13 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 25)
  %225 = add i64 %pgocount13, 1
  store i64 %225, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 25)
  %226 = load i32, i32* %9, align 4
  %227 = add nsw i32 %226, 1
  store i32 %227, i32* %9, align 4
  br label %175

; <label>:228:                                    ; preds = %175
  %pgocount14 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 31)
  %229 = add i64 %pgocount14, 1
  store i64 %229, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 31)
  br label %230

; <label>:230:                                    ; preds = %228, %169
  br label %231

; <label>:231:                                    ; preds = %230, %208
  %232 = load i32, i32* %14, align 4
  %233 = load i32, i32* %13, align 4
  %234 = icmp sgt i32 %232, %233
  br i1 %234, label %235, label %292

; <label>:235:                                    ; preds = %231
  %236 = load i32, i32* %14, align 4
  store i32 %236, i32* %9, align 4
  br label %237

; <label>:237:                                    ; preds = %286, %235
  %238 = load i32, i32* %9, align 4
  %239 = load i32, i32* %13, align 4
  %240 = icmp sge i32 %238, %239
  br i1 %240, label %241, label %290

; <label>:241:                                    ; preds = %237
  %242 = load i32, i32* %11, align 4
  store i32 %242, i32* %8, align 4
  br label %243

; <label>:243:                                    ; preds = %281, %241
  %244 = load i32, i32* %8, align 4
  %245 = load i32, i32* %12, align 4
  %246 = icmp sle i32 %244, %245
  br i1 %246, label %247, label %285

; <label>:247:                                    ; preds = %243
  %248 = load [32 x i16]**, [32 x i16]*** %6, align 8
  %249 = load i32, i32* %8, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds [32 x i16]*, [32 x i16]** %248, i64 %250
  %252 = load [32 x i16]*, [32 x i16]** %251, align 8
  %253 = load i32, i32* %9, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds [32 x i16], [32 x i16]* %252, i64 %254
  %256 = load i32, i32* %15, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [32 x i16], [32 x i16]* %255, i64 0, i64 %257
  store i16* %258, i16** %7, align 8
  %259 = load i32, i32* %15, align 4
  store i32 %259, i32* %10, align 4
  br label %260

; <label>:260:                                    ; preds = %277, %247
  %261 = load i32, i32* %10, align 4
  %262 = load i32, i32* %16, align 4
  %263 = icmp sle i32 %261, %262
  br i1 %263, label %264, label %280

; <label>:264:                                    ; preds = %260
  %265 = load i16*, i16** %7, align 8
  %266 = getelementptr inbounds i16, i16* %265, i32 1
  store i16* %266, i16** %7, align 8
  %267 = load i16, i16* %265, align 2
  %268 = zext i16 %267 to i32
  %269 = icmp ne i32 %268, 0
  br i1 %269, label %270, label %275

; <label>:270:                                    ; preds = %264
  %pgocount15 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 20)
  %271 = add i64 %pgocount15, 1
  store i64 %271, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 20)
  %272 = load i32, i32* %9, align 4
  store i32 %272, i32* %14, align 4
  %273 = load %struct.box*, %struct.box** %4, align 8
  %274 = getelementptr inbounds %struct.box, %struct.box* %273, i32 0, i32 3
  store i32 %272, i32* %274, align 4
  br label %293

; <label>:275:                                    ; preds = %264
  %pgocount16 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 7)
  %276 = add i64 %pgocount16, 1
  store i64 %276, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 7)
  br label %277

; <label>:277:                                    ; preds = %275
  %278 = load i32, i32* %10, align 4
  %279 = add nsw i32 %278, 1
  store i32 %279, i32* %10, align 4
  br label %260

; <label>:280:                                    ; preds = %260
  br label %281

; <label>:281:                                    ; preds = %280
  %pgocount17 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 14)
  %282 = add i64 %pgocount17, 1
  store i64 %282, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 14)
  %283 = load i32, i32* %8, align 4
  %284 = add nsw i32 %283, 1
  store i32 %284, i32* %8, align 4
  br label %243

; <label>:285:                                    ; preds = %243
  br label %286

; <label>:286:                                    ; preds = %285
  %pgocount18 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 26)
  %287 = add i64 %pgocount18, 1
  store i64 %287, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 26)
  %288 = load i32, i32* %9, align 4
  %289 = add nsw i32 %288, -1
  store i32 %289, i32* %9, align 4
  br label %237

; <label>:290:                                    ; preds = %237
  %pgocount19 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 32)
  %291 = add i64 %pgocount19, 1
  store i64 %291, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 32)
  br label %292

; <label>:292:                                    ; preds = %290, %231
  br label %293

; <label>:293:                                    ; preds = %292, %270
  %294 = load i32, i32* %16, align 4
  %295 = load i32, i32* %15, align 4
  %296 = icmp sgt i32 %294, %295
  br i1 %296, label %297, label %355

; <label>:297:                                    ; preds = %293
  %298 = load i32, i32* %15, align 4
  store i32 %298, i32* %10, align 4
  br label %299

; <label>:299:                                    ; preds = %349, %297
  %300 = load i32, i32* %10, align 4
  %301 = load i32, i32* %16, align 4
  %302 = icmp sle i32 %300, %301
  br i1 %302, label %303, label %353

; <label>:303:                                    ; preds = %299
  %304 = load i32, i32* %11, align 4
  store i32 %304, i32* %8, align 4
  br label %305

; <label>:305:                                    ; preds = %344, %303
  %306 = load i32, i32* %8, align 4
  %307 = load i32, i32* %12, align 4
  %308 = icmp sle i32 %306, %307
  br i1 %308, label %309, label %348

; <label>:309:                                    ; preds = %305
  %310 = load [32 x i16]**, [32 x i16]*** %6, align 8
  %311 = load i32, i32* %8, align 4
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds [32 x i16]*, [32 x i16]** %310, i64 %312
  %314 = load [32 x i16]*, [32 x i16]** %313, align 8
  %315 = load i32, i32* %13, align 4
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds [32 x i16], [32 x i16]* %314, i64 %316
  %318 = load i32, i32* %10, align 4
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds [32 x i16], [32 x i16]* %317, i64 0, i64 %319
  store i16* %320, i16** %7, align 8
  %321 = load i32, i32* %13, align 4
  store i32 %321, i32* %9, align 4
  br label %322

; <label>:322:                                    ; preds = %338, %309
  %323 = load i32, i32* %9, align 4
  %324 = load i32, i32* %14, align 4
  %325 = icmp sle i32 %323, %324
  br i1 %325, label %326, label %343

; <label>:326:                                    ; preds = %322
  %327 = load i16*, i16** %7, align 8
  %328 = load i16, i16* %327, align 2
  %329 = zext i16 %328 to i32
  %330 = icmp ne i32 %329, 0
  br i1 %330, label %331, label %336

; <label>:331:                                    ; preds = %326
  %pgocount20 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 21)
  %332 = add i64 %pgocount20, 1
  store i64 %332, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 21)
  %333 = load i32, i32* %10, align 4
  store i32 %333, i32* %15, align 4
  %334 = load %struct.box*, %struct.box** %4, align 8
  %335 = getelementptr inbounds %struct.box, %struct.box* %334, i32 0, i32 4
  store i32 %333, i32* %335, align 8
  br label %356

; <label>:336:                                    ; preds = %326
  %pgocount21 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 8)
  %337 = add i64 %pgocount21, 1
  store i64 %337, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 8)
  br label %338

; <label>:338:                                    ; preds = %336
  %339 = load i32, i32* %9, align 4
  %340 = add nsw i32 %339, 1
  store i32 %340, i32* %9, align 4
  %341 = load i16*, i16** %7, align 8
  %342 = getelementptr inbounds i16, i16* %341, i64 32
  store i16* %342, i16** %7, align 8
  br label %322

; <label>:343:                                    ; preds = %322
  br label %344

; <label>:344:                                    ; preds = %343
  %pgocount22 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 15)
  %345 = add i64 %pgocount22, 1
  store i64 %345, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 15)
  %346 = load i32, i32* %8, align 4
  %347 = add nsw i32 %346, 1
  store i32 %347, i32* %8, align 4
  br label %305

; <label>:348:                                    ; preds = %305
  br label %349

; <label>:349:                                    ; preds = %348
  %pgocount23 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 27)
  %350 = add i64 %pgocount23, 1
  store i64 %350, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 27)
  %351 = load i32, i32* %10, align 4
  %352 = add nsw i32 %351, 1
  store i32 %352, i32* %10, align 4
  br label %299

; <label>:353:                                    ; preds = %299
  %pgocount24 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 33)
  %354 = add i64 %pgocount24, 1
  store i64 %354, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 33)
  br label %355

; <label>:355:                                    ; preds = %353, %293
  br label %356

; <label>:356:                                    ; preds = %355, %331
  %357 = load i32, i32* %16, align 4
  %358 = load i32, i32* %15, align 4
  %359 = icmp sgt i32 %357, %358
  br i1 %359, label %360, label %418

; <label>:360:                                    ; preds = %356
  %361 = load i32, i32* %16, align 4
  store i32 %361, i32* %10, align 4
  br label %362

; <label>:362:                                    ; preds = %412, %360
  %363 = load i32, i32* %10, align 4
  %364 = load i32, i32* %15, align 4
  %365 = icmp sge i32 %363, %364
  br i1 %365, label %366, label %416

; <label>:366:                                    ; preds = %362
  %367 = load i32, i32* %11, align 4
  store i32 %367, i32* %8, align 4
  br label %368

; <label>:368:                                    ; preds = %407, %366
  %369 = load i32, i32* %8, align 4
  %370 = load i32, i32* %12, align 4
  %371 = icmp sle i32 %369, %370
  br i1 %371, label %372, label %411

; <label>:372:                                    ; preds = %368
  %373 = load [32 x i16]**, [32 x i16]*** %6, align 8
  %374 = load i32, i32* %8, align 4
  %375 = sext i32 %374 to i64
  %376 = getelementptr inbounds [32 x i16]*, [32 x i16]** %373, i64 %375
  %377 = load [32 x i16]*, [32 x i16]** %376, align 8
  %378 = load i32, i32* %13, align 4
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds [32 x i16], [32 x i16]* %377, i64 %379
  %381 = load i32, i32* %10, align 4
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds [32 x i16], [32 x i16]* %380, i64 0, i64 %382
  store i16* %383, i16** %7, align 8
  %384 = load i32, i32* %13, align 4
  store i32 %384, i32* %9, align 4
  br label %385

; <label>:385:                                    ; preds = %401, %372
  %386 = load i32, i32* %9, align 4
  %387 = load i32, i32* %14, align 4
  %388 = icmp sle i32 %386, %387
  br i1 %388, label %389, label %406

; <label>:389:                                    ; preds = %385
  %390 = load i16*, i16** %7, align 8
  %391 = load i16, i16* %390, align 2
  %392 = zext i16 %391 to i32
  %393 = icmp ne i32 %392, 0
  br i1 %393, label %394, label %399

; <label>:394:                                    ; preds = %389
  %pgocount25 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 22)
  %395 = add i64 %pgocount25, 1
  store i64 %395, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 22)
  %396 = load i32, i32* %10, align 4
  store i32 %396, i32* %16, align 4
  %397 = load %struct.box*, %struct.box** %4, align 8
  %398 = getelementptr inbounds %struct.box, %struct.box* %397, i32 0, i32 5
  store i32 %396, i32* %398, align 4
  br label %420

; <label>:399:                                    ; preds = %389
  %pgocount26 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 9)
  %400 = add i64 %pgocount26, 1
  store i64 %400, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 9)
  br label %401

; <label>:401:                                    ; preds = %399
  %402 = load i32, i32* %9, align 4
  %403 = add nsw i32 %402, 1
  store i32 %403, i32* %9, align 4
  %404 = load i16*, i16** %7, align 8
  %405 = getelementptr inbounds i16, i16* %404, i64 32
  store i16* %405, i16** %7, align 8
  br label %385

; <label>:406:                                    ; preds = %385
  br label %407

; <label>:407:                                    ; preds = %406
  %pgocount27 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 16)
  %408 = add i64 %pgocount27, 1
  store i64 %408, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 16)
  %409 = load i32, i32* %8, align 4
  %410 = add nsw i32 %409, 1
  store i32 %410, i32* %8, align 4
  br label %368

; <label>:411:                                    ; preds = %368
  br label %412

; <label>:412:                                    ; preds = %411
  %pgocount28 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 28)
  %413 = add i64 %pgocount28, 1
  store i64 %413, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 28)
  %414 = load i32, i32* %10, align 4
  %415 = add nsw i32 %414, -1
  store i32 %415, i32* %10, align 4
  br label %362

; <label>:416:                                    ; preds = %362
  %pgocount29 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 34)
  %417 = add i64 %pgocount29, 1
  store i64 %417, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 34)
  br label %418

; <label>:418:                                    ; preds = %416, %356
  %pgocount30 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 10)
  %419 = add i64 %pgocount30, 1
  store i64 %419, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 10)
  br label %420

; <label>:420:                                    ; preds = %418, %394
  %421 = load i32, i32* %12, align 4
  %422 = load i32, i32* %11, align 4
  %423 = sub nsw i32 %421, %422
  %424 = shl i32 %423, 3
  %425 = mul nsw i32 %424, 2
  %426 = sext i32 %425 to i64
  store i64 %426, i64* %17, align 8
  %427 = load i32, i32* %14, align 4
  %428 = load i32, i32* %13, align 4
  %429 = sub nsw i32 %427, %428
  %430 = shl i32 %429, 2
  %431 = mul nsw i32 %430, 3
  %432 = sext i32 %431 to i64
  store i64 %432, i64* %18, align 8
  %433 = load i32, i32* %16, align 4
  %434 = load i32, i32* %15, align 4
  %435 = sub nsw i32 %433, %434
  %436 = shl i32 %435, 3
  %437 = mul nsw i32 %436, 1
  %438 = sext i32 %437 to i64
  store i64 %438, i64* %19, align 8
  %439 = load i64, i64* %17, align 8
  %440 = load i64, i64* %17, align 8
  %441 = mul nsw i64 %439, %440
  %442 = load i64, i64* %18, align 8
  %443 = load i64, i64* %18, align 8
  %444 = mul nsw i64 %442, %443
  %445 = add nsw i64 %441, %444
  %446 = load i64, i64* %19, align 8
  %447 = load i64, i64* %19, align 8
  %448 = mul nsw i64 %446, %447
  %449 = add nsw i64 %445, %448
  %450 = load %struct.box*, %struct.box** %4, align 8
  %451 = getelementptr inbounds %struct.box, %struct.box* %450, i32 0, i32 6
  store i64 %449, i64* %451, align 8
  store i64 0, i64* %20, align 8
  %452 = load i32, i32* %11, align 4
  store i32 %452, i32* %8, align 4
  br label %453

; <label>:453:                                    ; preds = %503, %420
  %454 = load i32, i32* %8, align 4
  %455 = load i32, i32* %12, align 4
  %456 = icmp sle i32 %454, %455
  br i1 %456, label %457, label %506

; <label>:457:                                    ; preds = %453
  %pgocount31 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 3)
  %458 = add i64 %pgocount31, 1
  store i64 %458, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 3)
  %459 = load i32, i32* %13, align 4
  store i32 %459, i32* %9, align 4
  br label %460

; <label>:460:                                    ; preds = %498, %457
  %461 = load i32, i32* %9, align 4
  %462 = load i32, i32* %14, align 4
  %463 = icmp sle i32 %461, %462
  br i1 %463, label %464, label %502

; <label>:464:                                    ; preds = %460
  %465 = load [32 x i16]**, [32 x i16]*** %6, align 8
  %466 = load i32, i32* %8, align 4
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds [32 x i16]*, [32 x i16]** %465, i64 %467
  %469 = load [32 x i16]*, [32 x i16]** %468, align 8
  %470 = load i32, i32* %9, align 4
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds [32 x i16], [32 x i16]* %469, i64 %471
  %473 = load i32, i32* %15, align 4
  %474 = sext i32 %473 to i64
  %475 = getelementptr inbounds [32 x i16], [32 x i16]* %472, i64 0, i64 %474
  store i16* %475, i16** %7, align 8
  %476 = load i32, i32* %15, align 4
  store i32 %476, i32* %10, align 4
  br label %477

; <label>:477:                                    ; preds = %491, %464
  %478 = load i32, i32* %10, align 4
  %479 = load i32, i32* %16, align 4
  %480 = icmp sle i32 %478, %479
  br i1 %480, label %481, label %497

; <label>:481:                                    ; preds = %477
  %482 = load i16*, i16** %7, align 8
  %483 = load i16, i16* %482, align 2
  %484 = zext i16 %483 to i32
  %485 = icmp ne i32 %484, 0
  br i1 %485, label %486, label %490

; <label>:486:                                    ; preds = %481
  %pgocount32 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 1)
  %487 = add i64 %pgocount32, 1
  store i64 %487, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 1)
  %488 = load i64, i64* %20, align 8
  %489 = add nsw i64 %488, 1
  store i64 %489, i64* %20, align 8
  br label %490

; <label>:490:                                    ; preds = %486, %481
  br label %491

; <label>:491:                                    ; preds = %490
  %pgocount33 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 0)
  %492 = add i64 %pgocount33, 1
  store i64 %492, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 0)
  %493 = load i32, i32* %10, align 4
  %494 = add nsw i32 %493, 1
  store i32 %494, i32* %10, align 4
  %495 = load i16*, i16** %7, align 8
  %496 = getelementptr inbounds i16, i16* %495, i32 1
  store i16* %496, i16** %7, align 8
  br label %477

; <label>:497:                                    ; preds = %477
  br label %498

; <label>:498:                                    ; preds = %497
  %pgocount34 = load i64, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 2)
  %499 = add i64 %pgocount34, 1
  store i64 %499, i64* getelementptr inbounds ([35 x i64], [35 x i64]* @__profc_tmp1.ll_update_box, i64 0, i64 2)
  %500 = load i32, i32* %9, align 4
  %501 = add nsw i32 %500, 1
  store i32 %501, i32* %9, align 4
  br label %460

; <label>:502:                                    ; preds = %460
  br label %503

; <label>:503:                                    ; preds = %502
  %504 = load i32, i32* %8, align 4
  %505 = add nsw i32 %504, 1
  store i32 %505, i32* %8, align 4
  br label %453

; <label>:506:                                    ; preds = %453
  %507 = load i64, i64* %20, align 8
  %508 = load %struct.box*, %struct.box** %4, align 8
  %509 = getelementptr inbounds %struct.box, %struct.box* %508, i32 0, i32 7
  store i64 %507, i64* %509, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @median_cut(%struct.jpeg_decompress_struct*, %struct.box*, i32, i32) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca %struct.box*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca %struct.box*, align 8
  %16 = alloca %struct.box*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store %struct.box* %1, %struct.box** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  br label %17

; <label>:17:                                     ; preds = %169, %4
  %18 = load i32, i32* %7, align 4
  %19 = load i32, i32* %8, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %176

; <label>:21:                                     ; preds = %17
  %22 = load i32, i32* %7, align 4
  %23 = mul nsw i32 %22, 2
  %24 = load i32, i32* %8, align 4
  %25 = icmp sle i32 %23, %24
  br i1 %25, label %26, label %31

; <label>:26:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 0)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 0)
  %28 = load %struct.box*, %struct.box** %6, align 8
  %29 = load i32, i32* %7, align 4
  %30 = call %struct.box* @find_biggest_color_pop(%struct.box* %28, i32 %29)
  store %struct.box* %30, %struct.box** %15, align 8
  br label %36

; <label>:31:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 1)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 1)
  %33 = load %struct.box*, %struct.box** %6, align 8
  %34 = load i32, i32* %7, align 4
  %35 = call %struct.box* @find_biggest_volume(%struct.box* %33, i32 %34)
  store %struct.box* %35, %struct.box** %15, align 8
  br label %36

; <label>:36:                                     ; preds = %31, %26
  %37 = load %struct.box*, %struct.box** %15, align 8
  %38 = icmp eq %struct.box* %37, null
  br i1 %38, label %39, label %41

; <label>:39:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 8)
  %40 = add i64 %pgocount2, 1
  store i64 %40, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 8)
  br label %176

; <label>:41:                                     ; preds = %36
  %42 = load %struct.box*, %struct.box** %6, align 8
  %43 = load i32, i32* %7, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds %struct.box, %struct.box* %42, i64 %44
  store %struct.box* %45, %struct.box** %16, align 8
  %46 = load %struct.box*, %struct.box** %15, align 8
  %47 = getelementptr inbounds %struct.box, %struct.box* %46, i32 0, i32 1
  %48 = load i32, i32* %47, align 4
  %49 = load %struct.box*, %struct.box** %16, align 8
  %50 = getelementptr inbounds %struct.box, %struct.box* %49, i32 0, i32 1
  store i32 %48, i32* %50, align 4
  %51 = load %struct.box*, %struct.box** %15, align 8
  %52 = getelementptr inbounds %struct.box, %struct.box* %51, i32 0, i32 3
  %53 = load i32, i32* %52, align 4
  %54 = load %struct.box*, %struct.box** %16, align 8
  %55 = getelementptr inbounds %struct.box, %struct.box* %54, i32 0, i32 3
  store i32 %53, i32* %55, align 4
  %56 = load %struct.box*, %struct.box** %15, align 8
  %57 = getelementptr inbounds %struct.box, %struct.box* %56, i32 0, i32 5
  %58 = load i32, i32* %57, align 4
  %59 = load %struct.box*, %struct.box** %16, align 8
  %60 = getelementptr inbounds %struct.box, %struct.box* %59, i32 0, i32 5
  store i32 %58, i32* %60, align 4
  %61 = load %struct.box*, %struct.box** %15, align 8
  %62 = getelementptr inbounds %struct.box, %struct.box* %61, i32 0, i32 0
  %63 = load i32, i32* %62, align 8
  %64 = load %struct.box*, %struct.box** %16, align 8
  %65 = getelementptr inbounds %struct.box, %struct.box* %64, i32 0, i32 0
  store i32 %63, i32* %65, align 8
  %66 = load %struct.box*, %struct.box** %15, align 8
  %67 = getelementptr inbounds %struct.box, %struct.box* %66, i32 0, i32 2
  %68 = load i32, i32* %67, align 8
  %69 = load %struct.box*, %struct.box** %16, align 8
  %70 = getelementptr inbounds %struct.box, %struct.box* %69, i32 0, i32 2
  store i32 %68, i32* %70, align 8
  %71 = load %struct.box*, %struct.box** %15, align 8
  %72 = getelementptr inbounds %struct.box, %struct.box* %71, i32 0, i32 4
  %73 = load i32, i32* %72, align 8
  %74 = load %struct.box*, %struct.box** %16, align 8
  %75 = getelementptr inbounds %struct.box, %struct.box* %74, i32 0, i32 4
  store i32 %73, i32* %75, align 8
  %76 = load %struct.box*, %struct.box** %15, align 8
  %77 = getelementptr inbounds %struct.box, %struct.box* %76, i32 0, i32 1
  %78 = load i32, i32* %77, align 4
  %79 = load %struct.box*, %struct.box** %15, align 8
  %80 = getelementptr inbounds %struct.box, %struct.box* %79, i32 0, i32 0
  %81 = load i32, i32* %80, align 8
  %82 = sub nsw i32 %78, %81
  %83 = shl i32 %82, 3
  %84 = mul nsw i32 %83, 2
  store i32 %84, i32* %11, align 4
  %85 = load %struct.box*, %struct.box** %15, align 8
  %86 = getelementptr inbounds %struct.box, %struct.box* %85, i32 0, i32 3
  %87 = load i32, i32* %86, align 4
  %88 = load %struct.box*, %struct.box** %15, align 8
  %89 = getelementptr inbounds %struct.box, %struct.box* %88, i32 0, i32 2
  %90 = load i32, i32* %89, align 8
  %91 = sub nsw i32 %87, %90
  %92 = shl i32 %91, 2
  %93 = mul nsw i32 %92, 3
  store i32 %93, i32* %12, align 4
  %94 = load %struct.box*, %struct.box** %15, align 8
  %95 = getelementptr inbounds %struct.box, %struct.box* %94, i32 0, i32 5
  %96 = load i32, i32* %95, align 4
  %97 = load %struct.box*, %struct.box** %15, align 8
  %98 = getelementptr inbounds %struct.box, %struct.box* %97, i32 0, i32 4
  %99 = load i32, i32* %98, align 8
  %100 = sub nsw i32 %96, %99
  %101 = shl i32 %100, 3
  %102 = mul nsw i32 %101, 1
  store i32 %102, i32* %13, align 4
  %103 = load i32, i32* %12, align 4
  store i32 %103, i32* %14, align 4
  store i32 1, i32* %9, align 4
  %104 = load i32, i32* %11, align 4
  %105 = load i32, i32* %14, align 4
  %106 = icmp sgt i32 %104, %105
  br i1 %106, label %107, label %110

; <label>:107:                                    ; preds = %41
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 2)
  %108 = add i64 %pgocount3, 1
  store i64 %108, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 2)
  %109 = load i32, i32* %11, align 4
  store i32 %109, i32* %14, align 4
  store i32 0, i32* %9, align 4
  br label %110

; <label>:110:                                    ; preds = %107, %41
  %111 = load i32, i32* %13, align 4
  %112 = load i32, i32* %14, align 4
  %113 = icmp sgt i32 %111, %112
  br i1 %113, label %114, label %116

; <label>:114:                                    ; preds = %110
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 3)
  %115 = add i64 %pgocount4, 1
  store i64 %115, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 3)
  store i32 2, i32* %9, align 4
  br label %116

; <label>:116:                                    ; preds = %114, %110
  %117 = load i32, i32* %9, align 4
  switch i32 %117, label %169 [
    i32 0, label %118
    i32 1, label %135
    i32 2, label %152
  ]

; <label>:118:                                    ; preds = %116
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 5)
  %119 = add i64 %pgocount5, 1
  store i64 %119, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 5)
  %120 = load %struct.box*, %struct.box** %15, align 8
  %121 = getelementptr inbounds %struct.box, %struct.box* %120, i32 0, i32 1
  %122 = load i32, i32* %121, align 4
  %123 = load %struct.box*, %struct.box** %15, align 8
  %124 = getelementptr inbounds %struct.box, %struct.box* %123, i32 0, i32 0
  %125 = load i32, i32* %124, align 8
  %126 = add nsw i32 %122, %125
  %127 = sdiv i32 %126, 2
  store i32 %127, i32* %10, align 4
  %128 = load i32, i32* %10, align 4
  %129 = load %struct.box*, %struct.box** %15, align 8
  %130 = getelementptr inbounds %struct.box, %struct.box* %129, i32 0, i32 1
  store i32 %128, i32* %130, align 4
  %131 = load i32, i32* %10, align 4
  %132 = add nsw i32 %131, 1
  %133 = load %struct.box*, %struct.box** %16, align 8
  %134 = getelementptr inbounds %struct.box, %struct.box* %133, i32 0, i32 0
  store i32 %132, i32* %134, align 8
  br label %169

; <label>:135:                                    ; preds = %116
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 4)
  %136 = add i64 %pgocount6, 1
  store i64 %136, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 4)
  %137 = load %struct.box*, %struct.box** %15, align 8
  %138 = getelementptr inbounds %struct.box, %struct.box* %137, i32 0, i32 3
  %139 = load i32, i32* %138, align 4
  %140 = load %struct.box*, %struct.box** %15, align 8
  %141 = getelementptr inbounds %struct.box, %struct.box* %140, i32 0, i32 2
  %142 = load i32, i32* %141, align 8
  %143 = add nsw i32 %139, %142
  %144 = sdiv i32 %143, 2
  store i32 %144, i32* %10, align 4
  %145 = load i32, i32* %10, align 4
  %146 = load %struct.box*, %struct.box** %15, align 8
  %147 = getelementptr inbounds %struct.box, %struct.box* %146, i32 0, i32 3
  store i32 %145, i32* %147, align 4
  %148 = load i32, i32* %10, align 4
  %149 = add nsw i32 %148, 1
  %150 = load %struct.box*, %struct.box** %16, align 8
  %151 = getelementptr inbounds %struct.box, %struct.box* %150, i32 0, i32 2
  store i32 %149, i32* %151, align 8
  br label %169

; <label>:152:                                    ; preds = %116
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 6)
  %153 = add i64 %pgocount7, 1
  store i64 %153, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 6)
  %154 = load %struct.box*, %struct.box** %15, align 8
  %155 = getelementptr inbounds %struct.box, %struct.box* %154, i32 0, i32 5
  %156 = load i32, i32* %155, align 4
  %157 = load %struct.box*, %struct.box** %15, align 8
  %158 = getelementptr inbounds %struct.box, %struct.box* %157, i32 0, i32 4
  %159 = load i32, i32* %158, align 8
  %160 = add nsw i32 %156, %159
  %161 = sdiv i32 %160, 2
  store i32 %161, i32* %10, align 4
  %162 = load i32, i32* %10, align 4
  %163 = load %struct.box*, %struct.box** %15, align 8
  %164 = getelementptr inbounds %struct.box, %struct.box* %163, i32 0, i32 5
  store i32 %162, i32* %164, align 4
  %165 = load i32, i32* %10, align 4
  %166 = add nsw i32 %165, 1
  %167 = load %struct.box*, %struct.box** %16, align 8
  %168 = getelementptr inbounds %struct.box, %struct.box* %167, i32 0, i32 4
  store i32 %166, i32* %168, align 8
  br label %169

; <label>:169:                                    ; preds = %152, %135, %118, %116
  %170 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %171 = load %struct.box*, %struct.box** %15, align 8
  call void @update_box(%struct.jpeg_decompress_struct* %170, %struct.box* %171)
  %172 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %173 = load %struct.box*, %struct.box** %16, align 8
  call void @update_box(%struct.jpeg_decompress_struct* %172, %struct.box* %173)
  %174 = load i32, i32* %7, align 4
  %175 = add nsw i32 %174, 1
  store i32 %175, i32* %7, align 4
  br label %17

; <label>:176:                                    ; preds = %39, %17
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 7)
  %177 = add i64 %pgocount8, 1
  store i64 %177, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_median_cut, i64 0, i64 7)
  %178 = load i32, i32* %7, align 4
  ret i32 %178
}

; Function Attrs: nounwind uwtable
define internal void @compute_color(%struct.jpeg_decompress_struct*, %struct.box*, i32) #0 {
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca %struct.box*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.my_cquantizer*, align 8
  %8 = alloca [32 x i16]**, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i64, align 8
  %20 = alloca i64, align 8
  %21 = alloca i64, align 8
  %22 = alloca i64, align 8
  %23 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store %struct.box* %1, %struct.box** %5, align 8
  store i32 %2, i32* %6, align 4
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 83
  %26 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %25, align 8
  %27 = bitcast %struct.jpeg_color_quantizer* %26 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %27, %struct.my_cquantizer** %7, align 8
  %28 = load %struct.my_cquantizer*, %struct.my_cquantizer** %7, align 8
  %29 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %28, i32 0, i32 3
  %30 = load [32 x i16]**, [32 x i16]*** %29, align 8
  store [32 x i16]** %30, [32 x i16]*** %8, align 8
  store i64 0, i64* %20, align 8
  store i64 0, i64* %21, align 8
  store i64 0, i64* %22, align 8
  store i64 0, i64* %23, align 8
  %31 = load %struct.box*, %struct.box** %5, align 8
  %32 = getelementptr inbounds %struct.box, %struct.box* %31, i32 0, i32 0
  %33 = load i32, i32* %32, align 8
  store i32 %33, i32* %13, align 4
  %34 = load %struct.box*, %struct.box** %5, align 8
  %35 = getelementptr inbounds %struct.box, %struct.box* %34, i32 0, i32 1
  %36 = load i32, i32* %35, align 4
  store i32 %36, i32* %14, align 4
  %37 = load %struct.box*, %struct.box** %5, align 8
  %38 = getelementptr inbounds %struct.box, %struct.box* %37, i32 0, i32 2
  %39 = load i32, i32* %38, align 8
  store i32 %39, i32* %15, align 4
  %40 = load %struct.box*, %struct.box** %5, align 8
  %41 = getelementptr inbounds %struct.box, %struct.box* %40, i32 0, i32 3
  %42 = load i32, i32* %41, align 4
  store i32 %42, i32* %16, align 4
  %43 = load %struct.box*, %struct.box** %5, align 8
  %44 = getelementptr inbounds %struct.box, %struct.box* %43, i32 0, i32 4
  %45 = load i32, i32* %44, align 8
  store i32 %45, i32* %17, align 4
  %46 = load %struct.box*, %struct.box** %5, align 8
  %47 = getelementptr inbounds %struct.box, %struct.box* %46, i32 0, i32 5
  %48 = load i32, i32* %47, align 4
  store i32 %48, i32* %18, align 4
  %49 = load i32, i32* %13, align 4
  store i32 %49, i32* %10, align 4
  br label %50

; <label>:50:                                     ; preds = %123, %3
  %51 = load i32, i32* %10, align 4
  %52 = load i32, i32* %14, align 4
  %53 = icmp sle i32 %51, %52
  br i1 %53, label %54, label %127

; <label>:54:                                     ; preds = %50
  %55 = load i32, i32* %15, align 4
  store i32 %55, i32* %11, align 4
  br label %56

; <label>:56:                                     ; preds = %118, %54
  %57 = load i32, i32* %11, align 4
  %58 = load i32, i32* %16, align 4
  %59 = icmp sle i32 %57, %58
  br i1 %59, label %60, label %122

; <label>:60:                                     ; preds = %56
  %61 = load [32 x i16]**, [32 x i16]*** %8, align 8
  %62 = load i32, i32* %10, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [32 x i16]*, [32 x i16]** %61, i64 %63
  %65 = load [32 x i16]*, [32 x i16]** %64, align 8
  %66 = load i32, i32* %11, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [32 x i16], [32 x i16]* %65, i64 %67
  %69 = load i32, i32* %17, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [32 x i16], [32 x i16]* %68, i64 0, i64 %70
  store i16* %71, i16** %9, align 8
  %72 = load i32, i32* %17, align 4
  store i32 %72, i32* %12, align 4
  br label %73

; <label>:73:                                     ; preds = %113, %60
  %74 = load i32, i32* %12, align 4
  %75 = load i32, i32* %18, align 4
  %76 = icmp sle i32 %74, %75
  br i1 %76, label %77, label %117

; <label>:77:                                     ; preds = %73
  %78 = load i16*, i16** %9, align 8
  %79 = getelementptr inbounds i16, i16* %78, i32 1
  store i16* %79, i16** %9, align 8
  %80 = load i16, i16* %78, align 2
  %81 = zext i16 %80 to i64
  store i64 %81, i64* %19, align 8
  %82 = icmp ne i64 %81, 0
  br i1 %82, label %83, label %112

; <label>:83:                                     ; preds = %77
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_compute_color, i64 0, i64 1)
  %84 = add i64 %pgocount, 1
  store i64 %84, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_compute_color, i64 0, i64 1)
  %85 = load i64, i64* %19, align 8
  %86 = load i64, i64* %20, align 8
  %87 = add nsw i64 %86, %85
  store i64 %87, i64* %20, align 8
  %88 = load i32, i32* %10, align 4
  %89 = shl i32 %88, 3
  %90 = add nsw i32 %89, 4
  %91 = sext i32 %90 to i64
  %92 = load i64, i64* %19, align 8
  %93 = mul nsw i64 %91, %92
  %94 = load i64, i64* %21, align 8
  %95 = add nsw i64 %94, %93
  store i64 %95, i64* %21, align 8
  %96 = load i32, i32* %11, align 4
  %97 = shl i32 %96, 2
  %98 = add nsw i32 %97, 2
  %99 = sext i32 %98 to i64
  %100 = load i64, i64* %19, align 8
  %101 = mul nsw i64 %99, %100
  %102 = load i64, i64* %22, align 8
  %103 = add nsw i64 %102, %101
  store i64 %103, i64* %22, align 8
  %104 = load i32, i32* %12, align 4
  %105 = shl i32 %104, 3
  %106 = add nsw i32 %105, 4
  %107 = sext i32 %106 to i64
  %108 = load i64, i64* %19, align 8
  %109 = mul nsw i64 %107, %108
  %110 = load i64, i64* %23, align 8
  %111 = add nsw i64 %110, %109
  store i64 %111, i64* %23, align 8
  br label %112

; <label>:112:                                    ; preds = %83, %77
  br label %113

; <label>:113:                                    ; preds = %112
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_compute_color, i64 0, i64 0)
  %114 = add i64 %pgocount1, 1
  store i64 %114, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_compute_color, i64 0, i64 0)
  %115 = load i32, i32* %12, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, i32* %12, align 4
  br label %73

; <label>:117:                                    ; preds = %73
  br label %118

; <label>:118:                                    ; preds = %117
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_compute_color, i64 0, i64 2)
  %119 = add i64 %pgocount2, 1
  store i64 %119, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_compute_color, i64 0, i64 2)
  %120 = load i32, i32* %11, align 4
  %121 = add nsw i32 %120, 1
  store i32 %121, i32* %11, align 4
  br label %56

; <label>:122:                                    ; preds = %56
  br label %123

; <label>:123:                                    ; preds = %122
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_compute_color, i64 0, i64 3)
  %124 = add i64 %pgocount3, 1
  store i64 %124, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_compute_color, i64 0, i64 3)
  %125 = load i32, i32* %10, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, i32* %10, align 4
  br label %50

; <label>:127:                                    ; preds = %50
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_compute_color, i64 0, i64 4)
  %128 = add i64 %pgocount4, 1
  store i64 %128, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_compute_color, i64 0, i64 4)
  %129 = load i64, i64* %21, align 8
  %130 = load i64, i64* %20, align 8
  %131 = ashr i64 %130, 1
  %132 = add nsw i64 %129, %131
  %133 = load i64, i64* %20, align 8
  %134 = sdiv i64 %132, %133
  %135 = trunc i64 %134 to i8
  %136 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %137 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %136, i32 0, i32 32
  %138 = load i8**, i8*** %137, align 8
  %139 = getelementptr inbounds i8*, i8** %138, i64 0
  %140 = load i8*, i8** %139, align 8
  %141 = load i32, i32* %6, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i8, i8* %140, i64 %142
  store i8 %135, i8* %143, align 1
  %144 = load i64, i64* %22, align 8
  %145 = load i64, i64* %20, align 8
  %146 = ashr i64 %145, 1
  %147 = add nsw i64 %144, %146
  %148 = load i64, i64* %20, align 8
  %149 = sdiv i64 %147, %148
  %150 = trunc i64 %149 to i8
  %151 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %152 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %151, i32 0, i32 32
  %153 = load i8**, i8*** %152, align 8
  %154 = getelementptr inbounds i8*, i8** %153, i64 1
  %155 = load i8*, i8** %154, align 8
  %156 = load i32, i32* %6, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i8, i8* %155, i64 %157
  store i8 %150, i8* %158, align 1
  %159 = load i64, i64* %23, align 8
  %160 = load i64, i64* %20, align 8
  %161 = ashr i64 %160, 1
  %162 = add nsw i64 %159, %161
  %163 = load i64, i64* %20, align 8
  %164 = sdiv i64 %162, %163
  %165 = trunc i64 %164 to i8
  %166 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %167 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %166, i32 0, i32 32
  %168 = load i8**, i8*** %167, align 8
  %169 = getelementptr inbounds i8*, i8** %168, i64 2
  %170 = load i8*, i8** %169, align 8
  %171 = load i32, i32* %6, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds i8, i8* %170, i64 %172
  store i8 %165, i8* %173, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define internal %struct.box* @find_biggest_color_pop(%struct.box*, i32) #0 {
  %3 = alloca %struct.box*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.box*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca %struct.box*, align 8
  store %struct.box* %0, %struct.box** %3, align 8
  store i32 %1, i32* %4, align 4
  store i64 0, i64* %7, align 8
  store %struct.box* null, %struct.box** %8, align 8
  store i32 0, i32* %6, align 4
  %9 = load %struct.box*, %struct.box** %3, align 8
  store %struct.box* %9, %struct.box** %5, align 8
  br label %10

; <label>:10:                                     ; preds = %33, %2
  %11 = load i32, i32* %6, align 4
  %12 = load i32, i32* %4, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %39

; <label>:14:                                     ; preds = %10
  %15 = load %struct.box*, %struct.box** %5, align 8
  %16 = getelementptr inbounds %struct.box, %struct.box* %15, i32 0, i32 7
  %17 = load i64, i64* %16, align 8
  %18 = load i64, i64* %7, align 8
  %19 = icmp sgt i64 %17, %18
  br i1 %19, label %20, label %32

; <label>:20:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_find_biggest_color_pop, i64 0, i64 1)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_find_biggest_color_pop, i64 0, i64 1)
  %22 = load %struct.box*, %struct.box** %5, align 8
  %23 = getelementptr inbounds %struct.box, %struct.box* %22, i32 0, i32 6
  %24 = load i64, i64* %23, align 8
  %25 = icmp sgt i64 %24, 0
  br i1 %25, label %26, label %32

; <label>:26:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_find_biggest_color_pop, i64 0, i64 2)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_find_biggest_color_pop, i64 0, i64 2)
  %28 = load %struct.box*, %struct.box** %5, align 8
  store %struct.box* %28, %struct.box** %8, align 8
  %29 = load %struct.box*, %struct.box** %5, align 8
  %30 = getelementptr inbounds %struct.box, %struct.box* %29, i32 0, i32 7
  %31 = load i64, i64* %30, align 8
  store i64 %31, i64* %7, align 8
  br label %32

; <label>:32:                                     ; preds = %26, %20, %14
  br label %33

; <label>:33:                                     ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_find_biggest_color_pop, i64 0, i64 0)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_find_biggest_color_pop, i64 0, i64 0)
  %35 = load i32, i32* %6, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %6, align 4
  %37 = load %struct.box*, %struct.box** %5, align 8
  %38 = getelementptr inbounds %struct.box, %struct.box* %37, i32 1
  store %struct.box* %38, %struct.box** %5, align 8
  br label %10

; <label>:39:                                     ; preds = %10
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_find_biggest_color_pop, i64 0, i64 3)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_find_biggest_color_pop, i64 0, i64 3)
  %41 = load %struct.box*, %struct.box** %8, align 8
  ret %struct.box* %41
}

; Function Attrs: nounwind uwtable
define internal %struct.box* @find_biggest_volume(%struct.box*, i32) #0 {
  %3 = alloca %struct.box*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.box*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca %struct.box*, align 8
  store %struct.box* %0, %struct.box** %3, align 8
  store i32 %1, i32* %4, align 4
  store i64 0, i64* %7, align 8
  store %struct.box* null, %struct.box** %8, align 8
  store i32 0, i32* %6, align 4
  %9 = load %struct.box*, %struct.box** %3, align 8
  store %struct.box* %9, %struct.box** %5, align 8
  br label %10

; <label>:10:                                     ; preds = %27, %2
  %11 = load i32, i32* %6, align 4
  %12 = load i32, i32* %4, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %33

; <label>:14:                                     ; preds = %10
  %15 = load %struct.box*, %struct.box** %5, align 8
  %16 = getelementptr inbounds %struct.box, %struct.box* %15, i32 0, i32 6
  %17 = load i64, i64* %16, align 8
  %18 = load i64, i64* %7, align 8
  %19 = icmp sgt i64 %17, %18
  br i1 %19, label %20, label %26

; <label>:20:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_biggest_volume, i64 0, i64 1)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_biggest_volume, i64 0, i64 1)
  %22 = load %struct.box*, %struct.box** %5, align 8
  store %struct.box* %22, %struct.box** %8, align 8
  %23 = load %struct.box*, %struct.box** %5, align 8
  %24 = getelementptr inbounds %struct.box, %struct.box* %23, i32 0, i32 6
  %25 = load i64, i64* %24, align 8
  store i64 %25, i64* %7, align 8
  br label %26

; <label>:26:                                     ; preds = %20, %14
  br label %27

; <label>:27:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_biggest_volume, i64 0, i64 0)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_biggest_volume, i64 0, i64 0)
  %29 = load i32, i32* %6, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %6, align 4
  %31 = load %struct.box*, %struct.box** %5, align 8
  %32 = getelementptr inbounds %struct.box, %struct.box* %31, i32 1
  store %struct.box* %32, %struct.box** %5, align 8
  br label %10

; <label>:33:                                     ; preds = %10
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_biggest_volume, i64 0, i64 2)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_biggest_volume, i64 0, i64 2)
  %35 = load %struct.box*, %struct.box** %8, align 8
  ret %struct.box* %35
}

; Function Attrs: nounwind uwtable
define internal void @fill_inverse_cmap(%struct.jpeg_decompress_struct*, i32, i32, i32) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.my_cquantizer*, align 8
  %10 = alloca [32 x i16]**, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i8*, align 8
  %18 = alloca i16*, align 8
  %19 = alloca [256 x i8], align 16
  %20 = alloca i32, align 4
  %21 = alloca [128 x i8], align 16
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 83
  %24 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %23, align 8
  %25 = bitcast %struct.jpeg_color_quantizer* %24 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %25, %struct.my_cquantizer** %9, align 8
  %26 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %27 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %26, i32 0, i32 3
  %28 = load [32 x i16]**, [32 x i16]*** %27, align 8
  store [32 x i16]** %28, [32 x i16]*** %10, align 8
  %29 = load i32, i32* %6, align 4
  %30 = ashr i32 %29, 2
  store i32 %30, i32* %6, align 4
  %31 = load i32, i32* %7, align 4
  %32 = ashr i32 %31, 3
  store i32 %32, i32* %7, align 4
  %33 = load i32, i32* %8, align 4
  %34 = ashr i32 %33, 2
  store i32 %34, i32* %8, align 4
  %35 = load i32, i32* %6, align 4
  %36 = shl i32 %35, 5
  %37 = add nsw i32 %36, 4
  store i32 %37, i32* %11, align 4
  %38 = load i32, i32* %7, align 4
  %39 = shl i32 %38, 5
  %40 = add nsw i32 %39, 2
  store i32 %40, i32* %12, align 4
  %41 = load i32, i32* %8, align 4
  %42 = shl i32 %41, 5
  %43 = add nsw i32 %42, 4
  store i32 %43, i32* %13, align 4
  %44 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %45 = load i32, i32* %11, align 4
  %46 = load i32, i32* %12, align 4
  %47 = load i32, i32* %13, align 4
  %48 = getelementptr inbounds [256 x i8], [256 x i8]* %19, i32 0, i32 0
  %49 = call i32 @find_nearby_colors(%struct.jpeg_decompress_struct* %44, i32 %45, i32 %46, i32 %47, i8* %48)
  store i32 %49, i32* %20, align 4
  %50 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %51 = load i32, i32* %11, align 4
  %52 = load i32, i32* %12, align 4
  %53 = load i32, i32* %13, align 4
  %54 = load i32, i32* %20, align 4
  %55 = getelementptr inbounds [256 x i8], [256 x i8]* %19, i32 0, i32 0
  %56 = getelementptr inbounds [128 x i8], [128 x i8]* %21, i32 0, i32 0
  call void @find_best_colors(%struct.jpeg_decompress_struct* %50, i32 %51, i32 %52, i32 %53, i32 %54, i8* %55, i8* %56)
  %57 = load i32, i32* %6, align 4
  %58 = shl i32 %57, 2
  store i32 %58, i32* %6, align 4
  %59 = load i32, i32* %7, align 4
  %60 = shl i32 %59, 3
  store i32 %60, i32* %7, align 4
  %61 = load i32, i32* %8, align 4
  %62 = shl i32 %61, 2
  store i32 %62, i32* %8, align 4
  %63 = getelementptr inbounds [128 x i8], [128 x i8]* %21, i32 0, i32 0
  store i8* %63, i8** %17, align 8
  store i32 0, i32* %14, align 4
  br label %64

; <label>:64:                                     ; preds = %109, %4
  %65 = load i32, i32* %14, align 4
  %66 = icmp slt i32 %65, 4
  br i1 %66, label %67, label %113

; <label>:67:                                     ; preds = %64
  store i32 0, i32* %15, align 4
  br label %68

; <label>:68:                                     ; preds = %104, %67
  %69 = load i32, i32* %15, align 4
  %70 = icmp slt i32 %69, 8
  br i1 %70, label %71, label %108

; <label>:71:                                     ; preds = %68
  %72 = load [32 x i16]**, [32 x i16]*** %10, align 8
  %73 = load i32, i32* %6, align 4
  %74 = load i32, i32* %14, align 4
  %75 = add nsw i32 %73, %74
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [32 x i16]*, [32 x i16]** %72, i64 %76
  %78 = load [32 x i16]*, [32 x i16]** %77, align 8
  %79 = load i32, i32* %7, align 4
  %80 = load i32, i32* %15, align 4
  %81 = add nsw i32 %79, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [32 x i16], [32 x i16]* %78, i64 %82
  %84 = load i32, i32* %8, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [32 x i16], [32 x i16]* %83, i64 0, i64 %85
  store i16* %86, i16** %18, align 8
  store i32 0, i32* %16, align 4
  br label %87

; <label>:87:                                     ; preds = %99, %71
  %88 = load i32, i32* %16, align 4
  %89 = icmp slt i32 %88, 4
  br i1 %89, label %90, label %103

; <label>:90:                                     ; preds = %87
  %91 = load i8*, i8** %17, align 8
  %92 = getelementptr inbounds i8, i8* %91, i32 1
  store i8* %92, i8** %17, align 8
  %93 = load i8, i8* %91, align 1
  %94 = zext i8 %93 to i32
  %95 = add nsw i32 %94, 1
  %96 = trunc i32 %95 to i16
  %97 = load i16*, i16** %18, align 8
  %98 = getelementptr inbounds i16, i16* %97, i32 1
  store i16* %98, i16** %18, align 8
  store i16 %96, i16* %97, align 2
  br label %99

; <label>:99:                                     ; preds = %90
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_fill_inverse_cmap, i64 0, i64 0)
  %100 = add i64 %pgocount, 1
  store i64 %100, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_fill_inverse_cmap, i64 0, i64 0)
  %101 = load i32, i32* %16, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* %16, align 4
  br label %87

; <label>:103:                                    ; preds = %87
  br label %104

; <label>:104:                                    ; preds = %103
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_fill_inverse_cmap, i64 0, i64 1)
  %105 = add i64 %pgocount1, 1
  store i64 %105, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_fill_inverse_cmap, i64 0, i64 1)
  %106 = load i32, i32* %15, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, i32* %15, align 4
  br label %68

; <label>:108:                                    ; preds = %68
  br label %109

; <label>:109:                                    ; preds = %108
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_fill_inverse_cmap, i64 0, i64 2)
  %110 = add i64 %pgocount2, 1
  store i64 %110, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_fill_inverse_cmap, i64 0, i64 2)
  %111 = load i32, i32* %14, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %14, align 4
  br label %64

; <label>:113:                                    ; preds = %64
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_fill_inverse_cmap, i64 0, i64 3)
  %114 = add i64 %pgocount3, 1
  store i64 %114, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_fill_inverse_cmap, i64 0, i64 3)
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @find_nearby_colors(%struct.jpeg_decompress_struct*, i32, i32, i32, i8*) #0 {
  %6 = alloca %struct.jpeg_decompress_struct*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i64, align 8
  %22 = alloca i64, align 8
  %23 = alloca i64, align 8
  %24 = alloca i64, align 8
  %25 = alloca [256 x i64], align 16
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %6, align 8
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store i8* %4, i8** %10, align 8
  %26 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %26, i32 0, i32 31
  %28 = load i32, i32* %27, align 4
  store i32 %28, i32* %11, align 4
  %29 = load i32, i32* %7, align 4
  %30 = add nsw i32 %29, 24
  store i32 %30, i32* %12, align 4
  %31 = load i32, i32* %7, align 4
  %32 = load i32, i32* %12, align 4
  %33 = add nsw i32 %31, %32
  %34 = ashr i32 %33, 1
  store i32 %34, i32* %15, align 4
  %35 = load i32, i32* %8, align 4
  %36 = add nsw i32 %35, 28
  store i32 %36, i32* %13, align 4
  %37 = load i32, i32* %8, align 4
  %38 = load i32, i32* %13, align 4
  %39 = add nsw i32 %37, %38
  %40 = ashr i32 %39, 1
  store i32 %40, i32* %16, align 4
  %41 = load i32, i32* %9, align 4
  %42 = add nsw i32 %41, 24
  store i32 %42, i32* %14, align 4
  %43 = load i32, i32* %9, align 4
  %44 = load i32, i32* %14, align 4
  %45 = add nsw i32 %43, %44
  %46 = ashr i32 %45, 1
  store i32 %46, i32* %17, align 4
  store i64 2147483647, i64* %21, align 8
  store i32 0, i32* %18, align 4
  br label %47

; <label>:47:                                     ; preds = %325, %5
  %48 = load i32, i32* %18, align 4
  %49 = load i32, i32* %11, align 4
  %50 = icmp slt i32 %48, %49
  br i1 %50, label %51, label %328

; <label>:51:                                     ; preds = %47
  %52 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %52, i32 0, i32 32
  %54 = load i8**, i8*** %53, align 8
  %55 = getelementptr inbounds i8*, i8** %54, i64 0
  %56 = load i8*, i8** %55, align 8
  %57 = load i32, i32* %18, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8* %56, i64 %58
  %60 = load i8, i8* %59, align 1
  %61 = zext i8 %60 to i32
  store i32 %61, i32* %19, align 4
  %62 = load i32, i32* %19, align 4
  %63 = load i32, i32* %7, align 4
  %64 = icmp slt i32 %62, %63
  br i1 %64, label %65, label %82

; <label>:65:                                     ; preds = %51
  %66 = load i32, i32* %19, align 4
  %67 = load i32, i32* %7, align 4
  %68 = sub nsw i32 %66, %67
  %69 = mul nsw i32 %68, 2
  %70 = sext i32 %69 to i64
  store i64 %70, i64* %24, align 8
  %71 = load i64, i64* %24, align 8
  %72 = load i64, i64* %24, align 8
  %73 = mul nsw i64 %71, %72
  store i64 %73, i64* %22, align 8
  %74 = load i32, i32* %19, align 4
  %75 = load i32, i32* %12, align 4
  %76 = sub nsw i32 %74, %75
  %77 = mul nsw i32 %76, 2
  %78 = sext i32 %77 to i64
  store i64 %78, i64* %24, align 8
  %79 = load i64, i64* %24, align 8
  %80 = load i64, i64* %24, align 8
  %81 = mul nsw i64 %79, %80
  store i64 %81, i64* %23, align 8
  br label %130

; <label>:82:                                     ; preds = %51
  %83 = load i32, i32* %19, align 4
  %84 = load i32, i32* %12, align 4
  %85 = icmp sgt i32 %83, %84
  br i1 %85, label %86, label %104

; <label>:86:                                     ; preds = %82
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 4)
  %87 = add i64 %pgocount, 1
  store i64 %87, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 4)
  %88 = load i32, i32* %19, align 4
  %89 = load i32, i32* %12, align 4
  %90 = sub nsw i32 %88, %89
  %91 = mul nsw i32 %90, 2
  %92 = sext i32 %91 to i64
  store i64 %92, i64* %24, align 8
  %93 = load i64, i64* %24, align 8
  %94 = load i64, i64* %24, align 8
  %95 = mul nsw i64 %93, %94
  store i64 %95, i64* %22, align 8
  %96 = load i32, i32* %19, align 4
  %97 = load i32, i32* %7, align 4
  %98 = sub nsw i32 %96, %97
  %99 = mul nsw i32 %98, 2
  %100 = sext i32 %99 to i64
  store i64 %100, i64* %24, align 8
  %101 = load i64, i64* %24, align 8
  %102 = load i64, i64* %24, align 8
  %103 = mul nsw i64 %101, %102
  store i64 %103, i64* %23, align 8
  br label %129

; <label>:104:                                    ; preds = %82
  store i64 0, i64* %22, align 8
  %105 = load i32, i32* %19, align 4
  %106 = load i32, i32* %15, align 4
  %107 = icmp sle i32 %105, %106
  br i1 %107, label %108, label %118

; <label>:108:                                    ; preds = %104
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 7)
  %109 = add i64 %pgocount1, 1
  store i64 %109, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 7)
  %110 = load i32, i32* %19, align 4
  %111 = load i32, i32* %12, align 4
  %112 = sub nsw i32 %110, %111
  %113 = mul nsw i32 %112, 2
  %114 = sext i32 %113 to i64
  store i64 %114, i64* %24, align 8
  %115 = load i64, i64* %24, align 8
  %116 = load i64, i64* %24, align 8
  %117 = mul nsw i64 %115, %116
  store i64 %117, i64* %23, align 8
  br label %128

; <label>:118:                                    ; preds = %104
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 8)
  %119 = add i64 %pgocount2, 1
  store i64 %119, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 8)
  %120 = load i32, i32* %19, align 4
  %121 = load i32, i32* %7, align 4
  %122 = sub nsw i32 %120, %121
  %123 = mul nsw i32 %122, 2
  %124 = sext i32 %123 to i64
  store i64 %124, i64* %24, align 8
  %125 = load i64, i64* %24, align 8
  %126 = load i64, i64* %24, align 8
  %127 = mul nsw i64 %125, %126
  store i64 %127, i64* %23, align 8
  br label %128

; <label>:128:                                    ; preds = %118, %108
  br label %129

; <label>:129:                                    ; preds = %128, %86
  br label %130

; <label>:130:                                    ; preds = %129, %65
  %131 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %132 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %131, i32 0, i32 32
  %133 = load i8**, i8*** %132, align 8
  %134 = getelementptr inbounds i8*, i8** %133, i64 1
  %135 = load i8*, i8** %134, align 8
  %136 = load i32, i32* %18, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i8, i8* %135, i64 %137
  %139 = load i8, i8* %138, align 1
  %140 = zext i8 %139 to i32
  store i32 %140, i32* %19, align 4
  %141 = load i32, i32* %19, align 4
  %142 = load i32, i32* %8, align 4
  %143 = icmp slt i32 %141, %142
  br i1 %143, label %144, label %165

; <label>:144:                                    ; preds = %130
  %145 = load i32, i32* %19, align 4
  %146 = load i32, i32* %8, align 4
  %147 = sub nsw i32 %145, %146
  %148 = mul nsw i32 %147, 3
  %149 = sext i32 %148 to i64
  store i64 %149, i64* %24, align 8
  %150 = load i64, i64* %24, align 8
  %151 = load i64, i64* %24, align 8
  %152 = mul nsw i64 %150, %151
  %153 = load i64, i64* %22, align 8
  %154 = add nsw i64 %153, %152
  store i64 %154, i64* %22, align 8
  %155 = load i32, i32* %19, align 4
  %156 = load i32, i32* %13, align 4
  %157 = sub nsw i32 %155, %156
  %158 = mul nsw i32 %157, 3
  %159 = sext i32 %158 to i64
  store i64 %159, i64* %24, align 8
  %160 = load i64, i64* %24, align 8
  %161 = load i64, i64* %24, align 8
  %162 = mul nsw i64 %160, %161
  %163 = load i64, i64* %23, align 8
  %164 = add nsw i64 %163, %162
  store i64 %164, i64* %23, align 8
  br label %221

; <label>:165:                                    ; preds = %130
  %166 = load i32, i32* %19, align 4
  %167 = load i32, i32* %13, align 4
  %168 = icmp sgt i32 %166, %167
  br i1 %168, label %169, label %191

; <label>:169:                                    ; preds = %165
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 5)
  %170 = add i64 %pgocount3, 1
  store i64 %170, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 5)
  %171 = load i32, i32* %19, align 4
  %172 = load i32, i32* %13, align 4
  %173 = sub nsw i32 %171, %172
  %174 = mul nsw i32 %173, 3
  %175 = sext i32 %174 to i64
  store i64 %175, i64* %24, align 8
  %176 = load i64, i64* %24, align 8
  %177 = load i64, i64* %24, align 8
  %178 = mul nsw i64 %176, %177
  %179 = load i64, i64* %22, align 8
  %180 = add nsw i64 %179, %178
  store i64 %180, i64* %22, align 8
  %181 = load i32, i32* %19, align 4
  %182 = load i32, i32* %8, align 4
  %183 = sub nsw i32 %181, %182
  %184 = mul nsw i32 %183, 3
  %185 = sext i32 %184 to i64
  store i64 %185, i64* %24, align 8
  %186 = load i64, i64* %24, align 8
  %187 = load i64, i64* %24, align 8
  %188 = mul nsw i64 %186, %187
  %189 = load i64, i64* %23, align 8
  %190 = add nsw i64 %189, %188
  store i64 %190, i64* %23, align 8
  br label %220

; <label>:191:                                    ; preds = %165
  %192 = load i32, i32* %19, align 4
  %193 = load i32, i32* %16, align 4
  %194 = icmp sle i32 %192, %193
  br i1 %194, label %195, label %207

; <label>:195:                                    ; preds = %191
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 9)
  %196 = add i64 %pgocount4, 1
  store i64 %196, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 9)
  %197 = load i32, i32* %19, align 4
  %198 = load i32, i32* %13, align 4
  %199 = sub nsw i32 %197, %198
  %200 = mul nsw i32 %199, 3
  %201 = sext i32 %200 to i64
  store i64 %201, i64* %24, align 8
  %202 = load i64, i64* %24, align 8
  %203 = load i64, i64* %24, align 8
  %204 = mul nsw i64 %202, %203
  %205 = load i64, i64* %23, align 8
  %206 = add nsw i64 %205, %204
  store i64 %206, i64* %23, align 8
  br label %219

; <label>:207:                                    ; preds = %191
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 10)
  %208 = add i64 %pgocount5, 1
  store i64 %208, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 10)
  %209 = load i32, i32* %19, align 4
  %210 = load i32, i32* %8, align 4
  %211 = sub nsw i32 %209, %210
  %212 = mul nsw i32 %211, 3
  %213 = sext i32 %212 to i64
  store i64 %213, i64* %24, align 8
  %214 = load i64, i64* %24, align 8
  %215 = load i64, i64* %24, align 8
  %216 = mul nsw i64 %214, %215
  %217 = load i64, i64* %23, align 8
  %218 = add nsw i64 %217, %216
  store i64 %218, i64* %23, align 8
  br label %219

; <label>:219:                                    ; preds = %207, %195
  br label %220

; <label>:220:                                    ; preds = %219, %169
  br label %221

; <label>:221:                                    ; preds = %220, %144
  %222 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %223 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %222, i32 0, i32 32
  %224 = load i8**, i8*** %223, align 8
  %225 = getelementptr inbounds i8*, i8** %224, i64 2
  %226 = load i8*, i8** %225, align 8
  %227 = load i32, i32* %18, align 4
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds i8, i8* %226, i64 %228
  %230 = load i8, i8* %229, align 1
  %231 = zext i8 %230 to i32
  store i32 %231, i32* %19, align 4
  %232 = load i32, i32* %19, align 4
  %233 = load i32, i32* %9, align 4
  %234 = icmp slt i32 %232, %233
  br i1 %234, label %235, label %257

; <label>:235:                                    ; preds = %221
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 1)
  %236 = add i64 %pgocount6, 1
  store i64 %236, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 1)
  %237 = load i32, i32* %19, align 4
  %238 = load i32, i32* %9, align 4
  %239 = sub nsw i32 %237, %238
  %240 = mul nsw i32 %239, 1
  %241 = sext i32 %240 to i64
  store i64 %241, i64* %24, align 8
  %242 = load i64, i64* %24, align 8
  %243 = load i64, i64* %24, align 8
  %244 = mul nsw i64 %242, %243
  %245 = load i64, i64* %22, align 8
  %246 = add nsw i64 %245, %244
  store i64 %246, i64* %22, align 8
  %247 = load i32, i32* %19, align 4
  %248 = load i32, i32* %14, align 4
  %249 = sub nsw i32 %247, %248
  %250 = mul nsw i32 %249, 1
  %251 = sext i32 %250 to i64
  store i64 %251, i64* %24, align 8
  %252 = load i64, i64* %24, align 8
  %253 = load i64, i64* %24, align 8
  %254 = mul nsw i64 %252, %253
  %255 = load i64, i64* %23, align 8
  %256 = add nsw i64 %255, %254
  store i64 %256, i64* %23, align 8
  br label %313

; <label>:257:                                    ; preds = %221
  %258 = load i32, i32* %19, align 4
  %259 = load i32, i32* %14, align 4
  %260 = icmp sgt i32 %258, %259
  br i1 %260, label %261, label %283

; <label>:261:                                    ; preds = %257
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 6)
  %262 = add i64 %pgocount7, 1
  store i64 %262, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 6)
  %263 = load i32, i32* %19, align 4
  %264 = load i32, i32* %14, align 4
  %265 = sub nsw i32 %263, %264
  %266 = mul nsw i32 %265, 1
  %267 = sext i32 %266 to i64
  store i64 %267, i64* %24, align 8
  %268 = load i64, i64* %24, align 8
  %269 = load i64, i64* %24, align 8
  %270 = mul nsw i64 %268, %269
  %271 = load i64, i64* %22, align 8
  %272 = add nsw i64 %271, %270
  store i64 %272, i64* %22, align 8
  %273 = load i32, i32* %19, align 4
  %274 = load i32, i32* %9, align 4
  %275 = sub nsw i32 %273, %274
  %276 = mul nsw i32 %275, 1
  %277 = sext i32 %276 to i64
  store i64 %277, i64* %24, align 8
  %278 = load i64, i64* %24, align 8
  %279 = load i64, i64* %24, align 8
  %280 = mul nsw i64 %278, %279
  %281 = load i64, i64* %23, align 8
  %282 = add nsw i64 %281, %280
  store i64 %282, i64* %23, align 8
  br label %312

; <label>:283:                                    ; preds = %257
  %284 = load i32, i32* %19, align 4
  %285 = load i32, i32* %17, align 4
  %286 = icmp sle i32 %284, %285
  br i1 %286, label %287, label %299

; <label>:287:                                    ; preds = %283
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 11)
  %288 = add i64 %pgocount8, 1
  store i64 %288, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 11)
  %289 = load i32, i32* %19, align 4
  %290 = load i32, i32* %14, align 4
  %291 = sub nsw i32 %289, %290
  %292 = mul nsw i32 %291, 1
  %293 = sext i32 %292 to i64
  store i64 %293, i64* %24, align 8
  %294 = load i64, i64* %24, align 8
  %295 = load i64, i64* %24, align 8
  %296 = mul nsw i64 %294, %295
  %297 = load i64, i64* %23, align 8
  %298 = add nsw i64 %297, %296
  store i64 %298, i64* %23, align 8
  br label %311

; <label>:299:                                    ; preds = %283
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 12)
  %300 = add i64 %pgocount9, 1
  store i64 %300, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 12)
  %301 = load i32, i32* %19, align 4
  %302 = load i32, i32* %9, align 4
  %303 = sub nsw i32 %301, %302
  %304 = mul nsw i32 %303, 1
  %305 = sext i32 %304 to i64
  store i64 %305, i64* %24, align 8
  %306 = load i64, i64* %24, align 8
  %307 = load i64, i64* %24, align 8
  %308 = mul nsw i64 %306, %307
  %309 = load i64, i64* %23, align 8
  %310 = add nsw i64 %309, %308
  store i64 %310, i64* %23, align 8
  br label %311

; <label>:311:                                    ; preds = %299, %287
  br label %312

; <label>:312:                                    ; preds = %311, %261
  br label %313

; <label>:313:                                    ; preds = %312, %235
  %314 = load i64, i64* %22, align 8
  %315 = load i32, i32* %18, align 4
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds [256 x i64], [256 x i64]* %25, i64 0, i64 %316
  store i64 %314, i64* %317, align 8
  %318 = load i64, i64* %23, align 8
  %319 = load i64, i64* %21, align 8
  %320 = icmp slt i64 %318, %319
  br i1 %320, label %321, label %324

; <label>:321:                                    ; preds = %313
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 2)
  %322 = add i64 %pgocount10, 1
  store i64 %322, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 2)
  %323 = load i64, i64* %23, align 8
  store i64 %323, i64* %21, align 8
  br label %324

; <label>:324:                                    ; preds = %321, %313
  br label %325

; <label>:325:                                    ; preds = %324
  %326 = load i32, i32* %18, align 4
  %327 = add nsw i32 %326, 1
  store i32 %327, i32* %18, align 4
  br label %47

; <label>:328:                                    ; preds = %47
  store i32 0, i32* %20, align 4
  store i32 0, i32* %18, align 4
  br label %329

; <label>:329:                                    ; preds = %350, %328
  %330 = load i32, i32* %18, align 4
  %331 = load i32, i32* %11, align 4
  %332 = icmp slt i32 %330, %331
  br i1 %332, label %333, label %354

; <label>:333:                                    ; preds = %329
  %334 = load i32, i32* %18, align 4
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds [256 x i64], [256 x i64]* %25, i64 0, i64 %335
  %337 = load i64, i64* %336, align 8
  %338 = load i64, i64* %21, align 8
  %339 = icmp sle i64 %337, %338
  br i1 %339, label %340, label %349

; <label>:340:                                    ; preds = %333
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 3)
  %341 = add i64 %pgocount11, 1
  store i64 %341, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 3)
  %342 = load i32, i32* %18, align 4
  %343 = trunc i32 %342 to i8
  %344 = load i8*, i8** %10, align 8
  %345 = load i32, i32* %20, align 4
  %346 = add nsw i32 %345, 1
  store i32 %346, i32* %20, align 4
  %347 = sext i32 %345 to i64
  %348 = getelementptr inbounds i8, i8* %344, i64 %347
  store i8 %343, i8* %348, align 1
  br label %349

; <label>:349:                                    ; preds = %340, %333
  br label %350

; <label>:350:                                    ; preds = %349
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 0)
  %351 = add i64 %pgocount12, 1
  store i64 %351, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 0)
  %352 = load i32, i32* %18, align 4
  %353 = add nsw i32 %352, 1
  store i32 %353, i32* %18, align 4
  br label %329

; <label>:354:                                    ; preds = %329
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 13)
  %355 = add i64 %pgocount13, 1
  store i64 %355, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_find_nearby_colors, i64 0, i64 13)
  %356 = load i32, i32* %20, align 4
  ret i32 %356
}

; Function Attrs: nounwind uwtable
define internal void @find_best_colors(%struct.jpeg_decompress_struct*, i32, i32, i32, i32, i8*, i8*) #0 {
  %8 = alloca %struct.jpeg_decompress_struct*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i64*, align 8
  %21 = alloca i8*, align 8
  %22 = alloca i64, align 8
  %23 = alloca i64, align 8
  %24 = alloca i64, align 8
  %25 = alloca i64, align 8
  %26 = alloca i64, align 8
  %27 = alloca i64, align 8
  %28 = alloca i64, align 8
  %29 = alloca i64, align 8
  %30 = alloca i64, align 8
  %31 = alloca [128 x i64], align 16
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32 %2, i32* %10, align 4
  store i32 %3, i32* %11, align 4
  store i32 %4, i32* %12, align 4
  store i8* %5, i8** %13, align 8
  store i8* %6, i8** %14, align 8
  %32 = getelementptr inbounds [128 x i64], [128 x i64]* %31, i32 0, i32 0
  store i64* %32, i64** %20, align 8
  store i32 127, i32* %18, align 4
  br label %33

; <label>:33:                                     ; preds = %39, %7
  %34 = load i32, i32* %18, align 4
  %35 = icmp sge i32 %34, 0
  br i1 %35, label %36, label %43

; <label>:36:                                     ; preds = %33
  %37 = load i64*, i64** %20, align 8
  %38 = getelementptr inbounds i64, i64* %37, i32 1
  store i64* %38, i64** %20, align 8
  store i64 2147483647, i64* %37, align 8
  br label %39

; <label>:39:                                     ; preds = %36
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_best_colors, i64 0, i64 4)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_best_colors, i64 0, i64 4)
  %41 = load i32, i32* %18, align 4
  %42 = add nsw i32 %41, -1
  store i32 %42, i32* %18, align 4
  br label %33

; <label>:43:                                     ; preds = %33
  store i32 0, i32* %18, align 4
  br label %44

; <label>:44:                                     ; preds = %184, %43
  %45 = load i32, i32* %18, align 4
  %46 = load i32, i32* %12, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %188

; <label>:48:                                     ; preds = %44
  %49 = load i8*, i8** %13, align 8
  %50 = load i32, i32* %18, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8* %49, i64 %51
  %53 = load i8, i8* %52, align 1
  %54 = zext i8 %53 to i32
  store i32 %54, i32* %19, align 4
  %55 = load i32, i32* %9, align 4
  %56 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %56, i32 0, i32 32
  %58 = load i8**, i8*** %57, align 8
  %59 = getelementptr inbounds i8*, i8** %58, i64 0
  %60 = load i8*, i8** %59, align 8
  %61 = load i32, i32* %19, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8* %60, i64 %62
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = sub nsw i32 %55, %65
  %67 = mul nsw i32 %66, 2
  %68 = sext i32 %67 to i64
  store i64 %68, i64* %28, align 8
  %69 = load i64, i64* %28, align 8
  %70 = load i64, i64* %28, align 8
  %71 = mul nsw i64 %69, %70
  store i64 %71, i64* %22, align 8
  %72 = load i32, i32* %10, align 4
  %73 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %74 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %73, i32 0, i32 32
  %75 = load i8**, i8*** %74, align 8
  %76 = getelementptr inbounds i8*, i8** %75, i64 1
  %77 = load i8*, i8** %76, align 8
  %78 = load i32, i32* %19, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i8, i8* %77, i64 %79
  %81 = load i8, i8* %80, align 1
  %82 = zext i8 %81 to i32
  %83 = sub nsw i32 %72, %82
  %84 = mul nsw i32 %83, 3
  %85 = sext i32 %84 to i64
  store i64 %85, i64* %29, align 8
  %86 = load i64, i64* %29, align 8
  %87 = load i64, i64* %29, align 8
  %88 = mul nsw i64 %86, %87
  %89 = load i64, i64* %22, align 8
  %90 = add nsw i64 %89, %88
  store i64 %90, i64* %22, align 8
  %91 = load i32, i32* %11, align 4
  %92 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %93 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %92, i32 0, i32 32
  %94 = load i8**, i8*** %93, align 8
  %95 = getelementptr inbounds i8*, i8** %94, i64 2
  %96 = load i8*, i8** %95, align 8
  %97 = load i32, i32* %19, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i8, i8* %96, i64 %98
  %100 = load i8, i8* %99, align 1
  %101 = zext i8 %100 to i32
  %102 = sub nsw i32 %91, %101
  %103 = mul nsw i32 %102, 1
  %104 = sext i32 %103 to i64
  store i64 %104, i64* %30, align 8
  %105 = load i64, i64* %30, align 8
  %106 = load i64, i64* %30, align 8
  %107 = mul nsw i64 %105, %106
  %108 = load i64, i64* %22, align 8
  %109 = add nsw i64 %108, %107
  store i64 %109, i64* %22, align 8
  %110 = load i64, i64* %28, align 8
  %111 = mul nsw i64 %110, 32
  %112 = add nsw i64 %111, 256
  store i64 %112, i64* %28, align 8
  %113 = load i64, i64* %29, align 8
  %114 = mul nsw i64 %113, 24
  %115 = add nsw i64 %114, 144
  store i64 %115, i64* %29, align 8
  %116 = load i64, i64* %30, align 8
  %117 = mul nsw i64 %116, 16
  %118 = add nsw i64 %117, 64
  store i64 %118, i64* %30, align 8
  %119 = getelementptr inbounds [128 x i64], [128 x i64]* %31, i32 0, i32 0
  store i64* %119, i64** %20, align 8
  %120 = load i8*, i8** %14, align 8
  store i8* %120, i8** %21, align 8
  %121 = load i64, i64* %28, align 8
  store i64 %121, i64* %25, align 8
  store i32 3, i32* %15, align 4
  br label %122

; <label>:122:                                    ; preds = %179, %48
  %123 = load i32, i32* %15, align 4
  %124 = icmp sge i32 %123, 0
  br i1 %124, label %125, label %183

; <label>:125:                                    ; preds = %122
  %126 = load i64, i64* %22, align 8
  store i64 %126, i64* %23, align 8
  %127 = load i64, i64* %29, align 8
  store i64 %127, i64* %26, align 8
  store i32 7, i32* %16, align 4
  br label %128

; <label>:128:                                    ; preds = %169, %125
  %129 = load i32, i32* %16, align 4
  %130 = icmp sge i32 %129, 0
  br i1 %130, label %131, label %173

; <label>:131:                                    ; preds = %128
  %132 = load i64, i64* %23, align 8
  store i64 %132, i64* %24, align 8
  %133 = load i64, i64* %30, align 8
  store i64 %133, i64* %27, align 8
  store i32 3, i32* %17, align 4
  br label %134

; <label>:134:                                    ; preds = %159, %131
  %135 = load i32, i32* %17, align 4
  %136 = icmp sge i32 %135, 0
  br i1 %136, label %137, label %163

; <label>:137:                                    ; preds = %134
  %138 = load i64, i64* %24, align 8
  %139 = load i64*, i64** %20, align 8
  %140 = load i64, i64* %139, align 8
  %141 = icmp slt i64 %138, %140
  br i1 %141, label %142, label %149

; <label>:142:                                    ; preds = %137
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_best_colors, i64 0, i64 1)
  %143 = add i64 %pgocount1, 1
  store i64 %143, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_best_colors, i64 0, i64 1)
  %144 = load i64, i64* %24, align 8
  %145 = load i64*, i64** %20, align 8
  store i64 %144, i64* %145, align 8
  %146 = load i32, i32* %19, align 4
  %147 = trunc i32 %146 to i8
  %148 = load i8*, i8** %21, align 8
  store i8 %147, i8* %148, align 1
  br label %149

; <label>:149:                                    ; preds = %142, %137
  %150 = load i64, i64* %27, align 8
  %151 = load i64, i64* %24, align 8
  %152 = add nsw i64 %151, %150
  store i64 %152, i64* %24, align 8
  %153 = load i64, i64* %27, align 8
  %154 = add nsw i64 %153, 128
  store i64 %154, i64* %27, align 8
  %155 = load i64*, i64** %20, align 8
  %156 = getelementptr inbounds i64, i64* %155, i32 1
  store i64* %156, i64** %20, align 8
  %157 = load i8*, i8** %21, align 8
  %158 = getelementptr inbounds i8, i8* %157, i32 1
  store i8* %158, i8** %21, align 8
  br label %159

; <label>:159:                                    ; preds = %149
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_best_colors, i64 0, i64 0)
  %160 = add i64 %pgocount2, 1
  store i64 %160, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_best_colors, i64 0, i64 0)
  %161 = load i32, i32* %17, align 4
  %162 = add nsw i32 %161, -1
  store i32 %162, i32* %17, align 4
  br label %134

; <label>:163:                                    ; preds = %134
  %164 = load i64, i64* %26, align 8
  %165 = load i64, i64* %23, align 8
  %166 = add nsw i64 %165, %164
  store i64 %166, i64* %23, align 8
  %167 = load i64, i64* %26, align 8
  %168 = add nsw i64 %167, 288
  store i64 %168, i64* %26, align 8
  br label %169

; <label>:169:                                    ; preds = %163
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_best_colors, i64 0, i64 2)
  %170 = add i64 %pgocount3, 1
  store i64 %170, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_best_colors, i64 0, i64 2)
  %171 = load i32, i32* %16, align 4
  %172 = add nsw i32 %171, -1
  store i32 %172, i32* %16, align 4
  br label %128

; <label>:173:                                    ; preds = %128
  %174 = load i64, i64* %25, align 8
  %175 = load i64, i64* %22, align 8
  %176 = add nsw i64 %175, %174
  store i64 %176, i64* %22, align 8
  %177 = load i64, i64* %25, align 8
  %178 = add nsw i64 %177, 512
  store i64 %178, i64* %25, align 8
  br label %179

; <label>:179:                                    ; preds = %173
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_best_colors, i64 0, i64 3)
  %180 = add i64 %pgocount4, 1
  store i64 %180, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_best_colors, i64 0, i64 3)
  %181 = load i32, i32* %15, align 4
  %182 = add nsw i32 %181, -1
  store i32 %182, i32* %15, align 4
  br label %122

; <label>:183:                                    ; preds = %122
  br label %184

; <label>:184:                                    ; preds = %183
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_best_colors, i64 0, i64 5)
  %185 = add i64 %pgocount5, 1
  store i64 %185, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_best_colors, i64 0, i64 5)
  %186 = load i32, i32* %18, align 4
  %187 = add nsw i32 %186, 1
  store i32 %187, i32* %18, align 4
  br label %44

; <label>:188:                                    ; preds = %44
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_best_colors, i64 0, i64 6)
  %189 = add i64 %pgocount6, 1
  store i64 %189, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_best_colors, i64 0, i64 6)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

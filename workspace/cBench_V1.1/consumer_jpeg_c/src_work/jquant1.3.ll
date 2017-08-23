; ModuleID = 'jquant1.2.ll'
source_filename = "jquant1.c"
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
%struct.my_cquantizer = type { %struct.jpeg_color_quantizer, i8**, i32, i8**, i32, [4 x i32], i32, [4 x [16 x i32]*], [4 x i16*], i32 }

$__llvm_profile_raw_version = comdat any

@base_dither_matrix = internal constant [16 x [16 x i8]] [[16 x i8] c"\00\C00\F0\0C\CC<\FC\03\C33\F3\0F\CF?\FF", [16 x i8] c"\80@\B0p\8CL\BC|\83C\B3s\8FO\BF\7F", [16 x i8] c" \E0\10\D0,\EC\1C\DC#\E3\13\D3/\EF\1F\DF", [16 x i8] c"\A0`\90P\ACl\9C\5C\A3c\93S\AFo\9F_", [16 x i8] c"\08\C88\F8\04\C44\F4\0B\CB;\FB\07\C77\F7", [16 x i8] c"\88H\B8x\84D\B4t\8BK\BB{\87G\B7w", [16 x i8] c"(\E8\18\D8$\E4\14\D4+\EB\1B\DB'\E7\17\D7", [16 x i8] c"\A8h\98X\A4d\94T\ABk\9B[\A7g\97W", [16 x i8] c"\02\C22\F2\0E\CE>\FE\01\C11\F1\0D\CD=\FD", [16 x i8] c"\82B\B2r\8EN\BE~\81A\B1q\8DM\BD}", [16 x i8] c"\22\E2\12\D2.\EE\1E\DE!\E1\11\D1-\ED\1D\DD", [16 x i8] c"\A2b\92R\AEn\9E^\A1a\91Q\ADm\9D]", [16 x i8] c"\0A\CA:\FA\06\C66\F6\09\C99\F9\05\C55\F5", [16 x i8] c"\8AJ\BAz\86F\B6v\89I\B9y\85E\B5u", [16 x i8] c"*\EA\1A\DA&\E6\16\D6)\E9\19\D9%\E5\15\D5", [16 x i8] c"\AAj\9AZ\A6f\96V\A9i\99Y\A5e\95U"], align 16
@select_ncolors.RGB_order = internal constant [3 x i32] [i32 1, i32 0, i32 2], align 4
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_1pass_quantizer = private constant [21 x i8] c"jinit_1pass_quantizer"
@__profn_tmp1.ll_start_pass_1_quant = private constant [26 x i8] c"tmp1.ll:start_pass_1_quant"
@__profn_tmp1.ll_finish_pass_1_quant = private constant [27 x i8] c"tmp1.ll:finish_pass_1_quant"
@__profn_tmp1.ll_new_color_map_1_quant = private constant [29 x i8] c"tmp1.ll:new_color_map_1_quant"
@__profn_tmp1.ll_create_colormap = private constant [23 x i8] c"tmp1.ll:create_colormap"
@__profn_tmp1.ll_create_colorindex = private constant [25 x i8] c"tmp1.ll:create_colorindex"
@__profn_tmp1.ll_alloc_fs_workspace = private constant [26 x i8] c"tmp1.ll:alloc_fs_workspace"
@__profn_tmp1.ll_color_quantize3 = private constant [23 x i8] c"tmp1.ll:color_quantize3"
@__profn_tmp1.ll_color_quantize = private constant [22 x i8] c"tmp1.ll:color_quantize"
@__profn_tmp1.ll_quantize3_ord_dither = private constant [28 x i8] c"tmp1.ll:quantize3_ord_dither"
@__profn_tmp1.ll_quantize_ord_dither = private constant [27 x i8] c"tmp1.ll:quantize_ord_dither"
@__profn_tmp1.ll_create_odither_tables = private constant [29 x i8] c"tmp1.ll:create_odither_tables"
@__profn_tmp1.ll_quantize_fs_dither = private constant [26 x i8] c"tmp1.ll:quantize_fs_dither"
@__profn_tmp1.ll_make_odither_array = private constant [26 x i8] c"tmp1.ll:make_odither_array"
@__profn_tmp1.ll_select_ncolors = private constant [22 x i8] c"tmp1.ll:select_ncolors"
@__profn_tmp1.ll_output_value = private constant [20 x i8] c"tmp1.ll:output_value"
@__profn_tmp1.ll_largest_input_value = private constant [27 x i8] c"tmp1.ll:largest_input_value"
@__profc_jinit_1pass_quantizer = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_1pass_quantizer = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_1pass_quantizer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6504728273095041597, i64 844476199398095, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_1pass_quantizer, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @jinit_1pass_quantizer to i8*), i8* bitcast ([3 x i64]* @__profvp_jinit_1pass_quantizer to i8*), i32 4, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass_1_quant = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_pass_1_quant = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_pass_1_quant = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1978364783496045807, i64 281615034010089, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i32)* @start_pass_1_quant to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_start_pass_1_quant to i8*), i32 10, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_pass_1_quant = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_finish_pass_1_quant = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7745512152526316526, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_pass_1_quant, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @finish_pass_1_quant to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_new_color_map_1_quant = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_new_color_map_1_quant = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_new_color_map_1_quant = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4793381717834739739, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_new_color_map_1_quant, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @new_color_map_1_quant to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_new_color_map_1_quant to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_create_colormap = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_create_colormap = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_create_colormap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4208753183505628544, i64 844545564786070, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_create_colormap, i32 0, i32 0), i8* null, i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_create_colormap to i8*), i32 6, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_create_colorindex = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_create_colorindex = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_create_colorindex = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8068518421338624485, i64 281612004516572, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_create_colorindex, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_create_colorindex to i8*), i32 8, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_alloc_fs_workspace = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_alloc_fs_workspace = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_alloc_fs_workspace = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3461937757922854232, i64 281509114370972, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_alloc_fs_workspace, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_alloc_fs_workspace to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_color_quantize3 = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_color_quantize3 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5893487650634239757, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_color_quantize3, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @color_quantize3 to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_color_quantize = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_color_quantize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 812092893633737901, i64 74483645111, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_color_quantize, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @color_quantize to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_quantize3_ord_dither = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_quantize3_ord_dither = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1303082796599847638, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_quantize3_ord_dither, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @quantize3_ord_dither to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_quantize_ord_dither = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_quantize_ord_dither = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3476630995119517695, i64 74483645111, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_quantize_ord_dither, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @quantize_ord_dither to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_create_odither_tables = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_create_odither_tables = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5934565162626977719, i64 79780713888, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_create_odither_tables, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_quantize_fs_dither = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_quantize_fs_dither = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8167540725795579789, i64 72057684998751912, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_quantize_fs_dither, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @quantize_fs_dither to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_make_odither_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_make_odither_array = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_make_odither_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8001215335312903667, i64 281545243730347, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_make_odither_array, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_make_odither_array to i8*), i32 4, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_select_ncolors = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_select_ncolors = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_select_ncolors = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8216514967117131452, i64 281627136826001, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_select_ncolors to i8*), i32 9, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_output_value = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_output_value = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4507461892834792852, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_output_value, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_largest_input_value = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_largest_input_value = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2652401892899365637, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_largest_input_value, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [12 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [177 x i8] c"\BB\03\AD\01x\DAu\90\DD\0E\820\0CF\E3\0B\99\10\EF|\99\A6\8E\22\93\B2\CD\B6\F8\F7\F4\12\90\CD\08\DE~\A7\A7\FD\B6\8B\0F\DE\A0J\A8\0A\D7\01\83\F9\17\C9\CE\FAT\ED\99\8Fj(\06\13\ACf\9CQ3\8A\DAn\B3@wp\91\A3@\8FiE\9D\10\1A\CD\03#\DF\CC}\A8\E9\91\092G\07\8D\C2=J\A7\09\1D\15i:\B34?\FC\C9s\9C\07!J\0D\B5\B7\F6\EB\B5\0B\DCb\9Frq\8E\C1\F0\C4\A4ks\EC\F8#\F6\D8\15\0DE\F0Y~\97\98\9CA\98\BA\96eq\B04\18\DC\90\87R\9CQ\CE\A4\06>d\F6\06+J\A7\CE", section "__llvm_prf_names"
@llvm.used = appending global [19 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_1pass_quantizer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_1_quant to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_pass_1_quant to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_new_color_map_1_quant to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_create_colormap to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_create_colorindex to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_alloc_fs_workspace to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_color_quantize3 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_color_quantize to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_quantize3_ord_dither to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_quantize_ord_dither to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_create_odither_tables to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_quantize_fs_dither to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_make_odither_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_select_ncolors to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_output_value to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_largest_input_value to i8*), i8* bitcast ([12 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([177 x i8], [177 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jinit_1pass_quantizer(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_cquantizer*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 1
  %6 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %6, i32 0, i32 0
  %8 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %7, align 8
  %9 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %10 = bitcast %struct.jpeg_decompress_struct* %9 to %struct.jpeg_common_struct*
  %11 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %8 to i64
  call void @__llvm_profile_instrument_target(i64 %11, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_1pass_quantizer to i8*), i32 0)
  %12 = call i8* %8(%struct.jpeg_common_struct* %10, i32 1, i64 152)
  %13 = bitcast i8* %12 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %13, %struct.my_cquantizer** %3, align 8
  %14 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %15 = bitcast %struct.my_cquantizer* %14 to %struct.jpeg_color_quantizer*
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 83
  store %struct.jpeg_color_quantizer* %15, %struct.jpeg_color_quantizer** %17, align 8
  %18 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %19 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %18, i32 0, i32 0
  %20 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %19, i32 0, i32 0
  store void (%struct.jpeg_decompress_struct*, i32)* @start_pass_1_quant, void (%struct.jpeg_decompress_struct*, i32)** %20, align 8
  %21 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %22 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %21, i32 0, i32 0
  %23 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %22, i32 0, i32 2
  %24 = bitcast {}** %23 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @finish_pass_1_quant, void (%struct.jpeg_decompress_struct*)** %24, align 8
  %25 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %26 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %25, i32 0, i32 0
  %27 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %26, i32 0, i32 3
  %28 = bitcast {}** %27 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @new_color_map_1_quant, void (%struct.jpeg_decompress_struct*)** %28, align 8
  %29 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %30 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %29, i32 0, i32 8
  %31 = getelementptr inbounds [4 x i16*], [4 x i16*]* %30, i64 0, i64 0
  store i16* null, i16** %31, align 8
  %32 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %33 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %32, i32 0, i32 7
  %34 = getelementptr inbounds [4 x [16 x i32]*], [4 x [16 x i32]*]* %33, i64 0, i64 0
  store [16 x i32]* null, [16 x i32]** %34, align 8
  %35 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %35, i32 0, i32 28
  %37 = load i32, i32* %36, align 8
  %38 = icmp sgt i32 %37, 4
  br i1 %38, label %39, label %59

; <label>:39:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_1pass_quantizer, i64 0, i64 1)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_1pass_quantizer, i64 0, i64 1)
  %41 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %41, i32 0, i32 0
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i32 0, i32 5
  store i32 54, i32* %44, align 8
  %45 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %45, i32 0, i32 0
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i32 0, i32 6
  %49 = bitcast %union.anon* %48 to [8 x i32]*
  %50 = getelementptr inbounds [8 x i32], [8 x i32]* %49, i64 0, i64 0
  store i32 4, i32* %50, align 4
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 0
  %53 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %53, i32 0, i32 0
  %55 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %54, align 8
  %56 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %57 = bitcast %struct.jpeg_decompress_struct* %56 to %struct.jpeg_common_struct*
  %58 = ptrtoint void (%struct.jpeg_common_struct*)* %55 to i64
  call void @__llvm_profile_instrument_target(i64 %58, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_1pass_quantizer to i8*), i32 1)
  call void %55(%struct.jpeg_common_struct* %57)
  br label %59

; <label>:59:                                     ; preds = %39, %1
  %60 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %61 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %60, i32 0, i32 22
  %62 = load i32, i32* %61, align 8
  %63 = icmp sgt i32 %62, 256
  br i1 %63, label %64, label %84

; <label>:64:                                     ; preds = %59
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_1pass_quantizer, i64 0, i64 2)
  %65 = add i64 %pgocount1, 1
  store i64 %65, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_1pass_quantizer, i64 0, i64 2)
  %66 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %67 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %66, i32 0, i32 0
  %68 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %67, align 8
  %69 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %68, i32 0, i32 5
  store i32 56, i32* %69, align 8
  %70 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %71 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %70, i32 0, i32 0
  %72 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %71, align 8
  %73 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %72, i32 0, i32 6
  %74 = bitcast %union.anon* %73 to [8 x i32]*
  %75 = getelementptr inbounds [8 x i32], [8 x i32]* %74, i64 0, i64 0
  store i32 256, i32* %75, align 4
  %76 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %76, i32 0, i32 0
  %78 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %77, align 8
  %79 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %78, i32 0, i32 0
  %80 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %79, align 8
  %81 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %82 = bitcast %struct.jpeg_decompress_struct* %81 to %struct.jpeg_common_struct*
  %83 = ptrtoint void (%struct.jpeg_common_struct*)* %80 to i64
  call void @__llvm_profile_instrument_target(i64 %83, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_1pass_quantizer to i8*), i32 2)
  call void %80(%struct.jpeg_common_struct* %82)
  br label %84

; <label>:84:                                     ; preds = %64, %59
  %85 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @create_colormap(%struct.jpeg_decompress_struct* %85)
  %86 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @create_colorindex(%struct.jpeg_decompress_struct* %86)
  %87 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %88 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %87, i32 0, i32 20
  %89 = load i32, i32* %88, align 8
  %90 = icmp eq i32 %89, 2
  br i1 %90, label %91, label %94

; <label>:91:                                     ; preds = %84
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_1pass_quantizer, i64 0, i64 3)
  %92 = add i64 %pgocount2, 1
  store i64 %92, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_1pass_quantizer, i64 0, i64 3)
  %93 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @alloc_fs_workspace(%struct.jpeg_decompress_struct* %93)
  br label %94

; <label>:94:                                     ; preds = %91, %84
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_1pass_quantizer, i64 0, i64 0)
  %95 = add i64 %pgocount3, 1
  store i64 %95, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_1pass_quantizer, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @start_pass_1_quant(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.my_cquantizer*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %8 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %8, i32 0, i32 83
  %10 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %9, align 8
  %11 = bitcast %struct.jpeg_color_quantizer* %10 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %11, %struct.my_cquantizer** %5, align 8
  %12 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %13 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %12, i32 0, i32 1
  %14 = load i8**, i8*** %13, align 8
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 32
  store i8** %14, i8*** %16, align 8
  %17 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %18 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %17, i32 0, i32 2
  %19 = load i32, i32* %18, align 8
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %20, i32 0, i32 31
  store i32 %19, i32* %21, align 4
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 20
  %24 = load i32, i32* %23, align 8
  switch i32 %24, label %118 [
    i32 0, label %25
    i32 1, label %41
    i32 2, label %76
  ]

; <label>:25:                                     ; preds = %2
  %26 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %26, i32 0, i32 28
  %28 = load i32, i32* %27, align 8
  %29 = icmp eq i32 %28, 3
  br i1 %29, label %30, label %35

; <label>:30:                                     ; preds = %25
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 3)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 3)
  %32 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %33 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %32, i32 0, i32 0
  %34 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %33, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @color_quantize3, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %34, align 8
  br label %40

; <label>:35:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 4)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 4)
  %37 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %38 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %37, i32 0, i32 0
  %39 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %38, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @color_quantize, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %39, align 8
  br label %40

; <label>:40:                                     ; preds = %35, %30
  br label %132

; <label>:41:                                     ; preds = %2
  %42 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %42, i32 0, i32 28
  %44 = load i32, i32* %43, align 8
  %45 = icmp eq i32 %44, 3
  br i1 %45, label %46, label %51

; <label>:46:                                     ; preds = %41
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 5)
  %47 = add i64 %pgocount2, 1
  store i64 %47, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 5)
  %48 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %49 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %48, i32 0, i32 0
  %50 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %49, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @quantize3_ord_dither, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %50, align 8
  br label %56

; <label>:51:                                     ; preds = %41
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 6)
  %52 = add i64 %pgocount3, 1
  store i64 %52, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 6)
  %53 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %54 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %53, i32 0, i32 0
  %55 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %54, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @quantize_ord_dither, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %55, align 8
  br label %56

; <label>:56:                                     ; preds = %51, %46
  %57 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %58 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %57, i32 0, i32 6
  store i32 0, i32* %58, align 4
  %59 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %60 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %59, i32 0, i32 4
  %61 = load i32, i32* %60, align 8
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %66, label %63

; <label>:63:                                     ; preds = %56
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 7)
  %64 = add i64 %pgocount4, 1
  store i64 %64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 7)
  %65 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  call void @create_colorindex(%struct.jpeg_decompress_struct* %65)
  br label %66

; <label>:66:                                     ; preds = %63, %56
  %67 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %68 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %67, i32 0, i32 7
  %69 = getelementptr inbounds [4 x [16 x i32]*], [4 x [16 x i32]*]* %68, i64 0, i64 0
  %70 = load [16 x i32]*, [16 x i32]** %69, align 8
  %71 = icmp eq [16 x i32]* %70, null
  br i1 %71, label %72, label %75

; <label>:72:                                     ; preds = %66
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 8)
  %73 = add i64 %pgocount5, 1
  store i64 %73, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 8)
  %74 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  call void @create_odither_tables(%struct.jpeg_decompress_struct* %74)
  br label %75

; <label>:75:                                     ; preds = %72, %66
  br label %132

; <label>:76:                                     ; preds = %2
  %77 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %78 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %77, i32 0, i32 0
  %79 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %78, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @quantize_fs_dither, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %79, align 8
  %80 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %81 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %80, i32 0, i32 9
  store i32 0, i32* %81, align 8
  %82 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %83 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %82, i32 0, i32 8
  %84 = getelementptr inbounds [4 x i16*], [4 x i16*]* %83, i64 0, i64 0
  %85 = load i16*, i16** %84, align 8
  %86 = icmp eq i16* %85, null
  br i1 %86, label %87, label %90

; <label>:87:                                     ; preds = %76
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 9)
  %88 = add i64 %pgocount6, 1
  store i64 %88, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 9)
  %89 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  call void @alloc_fs_workspace(%struct.jpeg_decompress_struct* %89)
  br label %90

; <label>:90:                                     ; preds = %87, %76
  %91 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %92 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %91, i32 0, i32 26
  %93 = load i32, i32* %92, align 8
  %94 = add i32 %93, 2
  %95 = zext i32 %94 to i64
  %96 = mul i64 %95, 2
  store i64 %96, i64* %6, align 8
  store i32 0, i32* %7, align 4
  br label %97

; <label>:97:                                     ; preds = %113, %90
  %98 = load i32, i32* %7, align 4
  %99 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %100 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %99, i32 0, i32 28
  %101 = load i32, i32* %100, align 8
  %102 = icmp slt i32 %98, %101
  br i1 %102, label %103, label %116

; <label>:103:                                    ; preds = %97
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 0)
  %104 = add i64 %pgocount7, 1
  store i64 %104, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 0)
  %105 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %106 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %105, i32 0, i32 8
  %107 = load i32, i32* %7, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [4 x i16*], [4 x i16*]* %106, i64 0, i64 %108
  %110 = load i16*, i16** %109, align 8
  %111 = bitcast i16* %110 to i8*
  %112 = load i64, i64* %6, align 8
  call void @jzero_far(i8* %111, i64 %112)
  br label %113

; <label>:113:                                    ; preds = %103
  %114 = load i32, i32* %7, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, i32* %7, align 4
  br label %97

; <label>:116:                                    ; preds = %97
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 1)
  %117 = add i64 %pgocount8, 1
  store i64 %117, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 1)
  br label %132

; <label>:118:                                    ; preds = %2
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 2)
  %119 = add i64 %pgocount9, 1
  store i64 %119, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_start_pass_1_quant, i64 0, i64 2)
  %120 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %121 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %120, i32 0, i32 0
  %122 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %121, align 8
  %123 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %122, i32 0, i32 5
  store i32 47, i32* %123, align 8
  %124 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %125 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %124, i32 0, i32 0
  %126 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %125, align 8
  %127 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %126, i32 0, i32 0
  %128 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %127, align 8
  %129 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %130 = bitcast %struct.jpeg_decompress_struct* %129 to %struct.jpeg_common_struct*
  %131 = ptrtoint void (%struct.jpeg_common_struct*)* %128 to i64
  call void @__llvm_profile_instrument_target(i64 %131, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_1_quant to i8*), i32 0)
  call void %128(%struct.jpeg_common_struct* %130)
  br label %132

; <label>:132:                                    ; preds = %118, %116, %75, %40
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @finish_pass_1_quant(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_pass_1_quant, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_pass_1_quant, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @new_color_map_1_quant(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_new_color_map_1_quant, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_new_color_map_1_quant, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 0
  %6 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %6, i32 0, i32 5
  store i32 45, i32* %7, align 8
  %8 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %8, i32 0, i32 0
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i32 0, i32 0
  %12 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %11, align 8
  %13 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %14 = bitcast %struct.jpeg_decompress_struct* %13 to %struct.jpeg_common_struct*
  %15 = ptrtoint void (%struct.jpeg_common_struct*)* %12 to i64
  call void @__llvm_profile_instrument_target(i64 %15, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_new_color_map_1_quant to i8*), i32 0)
  call void %12(%struct.jpeg_common_struct* %14)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @create_colormap(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_cquantizer*, align 8
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 83
  %17 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %16, align 8
  %18 = bitcast %struct.jpeg_color_quantizer* %17 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %18, %struct.my_cquantizer** %3, align 8
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %20 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %21 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %20, i32 0, i32 5
  %22 = getelementptr inbounds [4 x i32], [4 x i32]* %21, i32 0, i32 0
  %23 = call i32 @select_ncolors(%struct.jpeg_decompress_struct* %19, i32* %22)
  store i32 %23, i32* %5, align 4
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 28
  %26 = load i32, i32* %25, align 8
  %27 = icmp eq i32 %26, 3
  br i1 %27, label %28, label %71

; <label>:28:                                     ; preds = %1
  br label %29

; <label>:29:                                     ; preds = %28
  %30 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %30, i32 0, i32 0
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i32 0, i32 6
  %34 = bitcast %union.anon* %33 to [8 x i32]*
  %35 = getelementptr inbounds [8 x i32], [8 x i32]* %34, i32 0, i32 0
  store i32* %35, i32** %14, align 8
  %36 = load i32, i32* %5, align 4
  %37 = load i32*, i32** %14, align 8
  %38 = getelementptr inbounds i32, i32* %37, i64 0
  store i32 %36, i32* %38, align 4
  %39 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %40 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %39, i32 0, i32 5
  %41 = getelementptr inbounds [4 x i32], [4 x i32]* %40, i64 0, i64 0
  %42 = load i32, i32* %41, align 4
  %43 = load i32*, i32** %14, align 8
  %44 = getelementptr inbounds i32, i32* %43, i64 1
  store i32 %42, i32* %44, align 4
  %45 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %46 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %45, i32 0, i32 5
  %47 = getelementptr inbounds [4 x i32], [4 x i32]* %46, i64 0, i64 1
  %48 = load i32, i32* %47, align 4
  %49 = load i32*, i32** %14, align 8
  %50 = getelementptr inbounds i32, i32* %49, i64 2
  store i32 %48, i32* %50, align 4
  %51 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %52 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %51, i32 0, i32 5
  %53 = getelementptr inbounds [4 x i32], [4 x i32]* %52, i64 0, i64 2
  %54 = load i32, i32* %53, align 4
  %55 = load i32*, i32** %14, align 8
  %56 = getelementptr inbounds i32, i32* %55, i64 3
  store i32 %54, i32* %56, align 4
  %57 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %57, i32 0, i32 0
  %59 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %60 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %59, i32 0, i32 5
  store i32 93, i32* %60, align 8
  %61 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %62 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %61, i32 0, i32 0
  %63 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %62, align 8
  %64 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %63, i32 0, i32 1
  %65 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %64, align 8
  %66 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %67 = bitcast %struct.jpeg_decompress_struct* %66 to %struct.jpeg_common_struct*
  %68 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %65 to i64
  call void @__llvm_profile_instrument_target(i64 %68, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_create_colormap to i8*), i32 0)
  call void %65(%struct.jpeg_common_struct* %67, i32 1)
  br label %69

; <label>:69:                                     ; preds = %29
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_create_colormap, i64 0, i64 4)
  %70 = add i64 %pgocount, 1
  store i64 %70, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_create_colormap, i64 0, i64 4)
  br label %92

; <label>:71:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_create_colormap, i64 0, i64 5)
  %72 = add i64 %pgocount1, 1
  store i64 %72, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_create_colormap, i64 0, i64 5)
  %73 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %74 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %73, i32 0, i32 0
  %75 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %74, align 8
  %76 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %75, i32 0, i32 5
  store i32 94, i32* %76, align 8
  %77 = load i32, i32* %5, align 4
  %78 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %78, i32 0, i32 0
  %80 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %79, align 8
  %81 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %80, i32 0, i32 6
  %82 = bitcast %union.anon* %81 to [8 x i32]*
  %83 = getelementptr inbounds [8 x i32], [8 x i32]* %82, i64 0, i64 0
  store i32 %77, i32* %83, align 4
  %84 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %85 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %84, i32 0, i32 0
  %86 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %85, align 8
  %87 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %86, i32 0, i32 1
  %88 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %87, align 8
  %89 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %90 = bitcast %struct.jpeg_decompress_struct* %89 to %struct.jpeg_common_struct*
  %91 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %88 to i64
  call void @__llvm_profile_instrument_target(i64 %91, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_create_colormap to i8*), i32 1)
  call void %88(%struct.jpeg_common_struct* %90, i32 1)
  br label %92

; <label>:92:                                     ; preds = %71, %69
  %93 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %94 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %93, i32 0, i32 1
  %95 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %94, align 8
  %96 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %95, i32 0, i32 2
  %97 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %96, align 8
  %98 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %99 = bitcast %struct.jpeg_decompress_struct* %98 to %struct.jpeg_common_struct*
  %100 = load i32, i32* %5, align 4
  %101 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %102 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %101, i32 0, i32 28
  %103 = load i32, i32* %102, align 8
  %104 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %97 to i64
  call void @__llvm_profile_instrument_target(i64 %104, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_create_colormap to i8*), i32 2)
  %105 = call i8** %97(%struct.jpeg_common_struct* %99, i32 1, i32 %100, i32 %103)
  store i8** %105, i8*** %4, align 8
  %106 = load i32, i32* %5, align 4
  store i32 %106, i32* %11, align 4
  store i32 0, i32* %6, align 4
  br label %107

; <label>:107:                                    ; preds = %176, %92
  %108 = load i32, i32* %6, align 4
  %109 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %110 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %109, i32 0, i32 28
  %111 = load i32, i32* %110, align 8
  %112 = icmp slt i32 %108, %111
  br i1 %112, label %113, label %180

; <label>:113:                                    ; preds = %107
  %114 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %115 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %114, i32 0, i32 5
  %116 = load i32, i32* %6, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [4 x i32], [4 x i32]* %115, i64 0, i64 %117
  %119 = load i32, i32* %118, align 4
  store i32 %119, i32* %9, align 4
  %120 = load i32, i32* %11, align 4
  %121 = load i32, i32* %9, align 4
  %122 = sdiv i32 %120, %121
  store i32 %122, i32* %10, align 4
  store i32 0, i32* %7, align 4
  br label %123

; <label>:123:                                    ; preds = %170, %113
  %124 = load i32, i32* %7, align 4
  %125 = load i32, i32* %9, align 4
  %126 = icmp slt i32 %124, %125
  br i1 %126, label %127, label %174

; <label>:127:                                    ; preds = %123
  %128 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %129 = load i32, i32* %6, align 4
  %130 = load i32, i32* %7, align 4
  %131 = load i32, i32* %9, align 4
  %132 = sub nsw i32 %131, 1
  %133 = call i32 @output_value(%struct.jpeg_decompress_struct* %128, i32 %129, i32 %130, i32 %132)
  store i32 %133, i32* %13, align 4
  %134 = load i32, i32* %7, align 4
  %135 = load i32, i32* %10, align 4
  %136 = mul nsw i32 %134, %135
  store i32 %136, i32* %12, align 4
  br label %137

; <label>:137:                                    ; preds = %164, %127
  %138 = load i32, i32* %12, align 4
  %139 = load i32, i32* %5, align 4
  %140 = icmp slt i32 %138, %139
  br i1 %140, label %141, label %169

; <label>:141:                                    ; preds = %137
  store i32 0, i32* %8, align 4
  br label %142

; <label>:142:                                    ; preds = %159, %141
  %143 = load i32, i32* %8, align 4
  %144 = load i32, i32* %10, align 4
  %145 = icmp slt i32 %143, %144
  br i1 %145, label %146, label %163

; <label>:146:                                    ; preds = %142
  %147 = load i32, i32* %13, align 4
  %148 = trunc i32 %147 to i8
  %149 = load i8**, i8*** %4, align 8
  %150 = load i32, i32* %6, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i8*, i8** %149, i64 %151
  %153 = load i8*, i8** %152, align 8
  %154 = load i32, i32* %12, align 4
  %155 = load i32, i32* %8, align 4
  %156 = add nsw i32 %154, %155
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i8, i8* %153, i64 %157
  store i8 %148, i8* %158, align 1
  br label %159

; <label>:159:                                    ; preds = %146
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_create_colormap, i64 0, i64 0)
  %160 = add i64 %pgocount2, 1
  store i64 %160, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_create_colormap, i64 0, i64 0)
  %161 = load i32, i32* %8, align 4
  %162 = add nsw i32 %161, 1
  store i32 %162, i32* %8, align 4
  br label %142

; <label>:163:                                    ; preds = %142
  br label %164

; <label>:164:                                    ; preds = %163
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_create_colormap, i64 0, i64 1)
  %165 = add i64 %pgocount3, 1
  store i64 %165, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_create_colormap, i64 0, i64 1)
  %166 = load i32, i32* %11, align 4
  %167 = load i32, i32* %12, align 4
  %168 = add nsw i32 %167, %166
  store i32 %168, i32* %12, align 4
  br label %137

; <label>:169:                                    ; preds = %137
  br label %170

; <label>:170:                                    ; preds = %169
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_create_colormap, i64 0, i64 2)
  %171 = add i64 %pgocount4, 1
  store i64 %171, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_create_colormap, i64 0, i64 2)
  %172 = load i32, i32* %7, align 4
  %173 = add nsw i32 %172, 1
  store i32 %173, i32* %7, align 4
  br label %123

; <label>:174:                                    ; preds = %123
  %175 = load i32, i32* %10, align 4
  store i32 %175, i32* %11, align 4
  br label %176

; <label>:176:                                    ; preds = %174
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_create_colormap, i64 0, i64 3)
  %177 = add i64 %pgocount5, 1
  store i64 %177, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_create_colormap, i64 0, i64 3)
  %178 = load i32, i32* %6, align 4
  %179 = add nsw i32 %178, 1
  store i32 %179, i32* %6, align 4
  br label %107

; <label>:180:                                    ; preds = %107
  %181 = load i8**, i8*** %4, align 8
  %182 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %183 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %182, i32 0, i32 1
  store i8** %181, i8*** %183, align 8
  %184 = load i32, i32* %5, align 4
  %185 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %186 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %185, i32 0, i32 2
  store i32 %184, i32* %186, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @create_colorindex(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_cquantizer*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %12, i32 0, i32 83
  %14 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %13, align 8
  %15 = bitcast %struct.jpeg_color_quantizer* %14 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %15, %struct.my_cquantizer** %3, align 8
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 20
  %18 = load i32, i32* %17, align 8
  %19 = icmp eq i32 %18, 1
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_create_colorindex, i64 0, i64 6)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_create_colorindex, i64 0, i64 6)
  store i32 510, i32* %11, align 4
  %22 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %23 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %22, i32 0, i32 4
  store i32 1, i32* %23, align 8
  br label %28

; <label>:24:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_create_colorindex, i64 0, i64 7)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_create_colorindex, i64 0, i64 7)
  store i32 0, i32* %11, align 4
  %26 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %27 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %26, i32 0, i32 4
  store i32 0, i32* %27, align 8
  br label %28

; <label>:28:                                     ; preds = %24, %20
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %29, i32 0, i32 1
  %31 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %31, i32 0, i32 2
  %33 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %32, align 8
  %34 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %35 = bitcast %struct.jpeg_decompress_struct* %34 to %struct.jpeg_common_struct*
  %36 = load i32, i32* %11, align 4
  %37 = add nsw i32 256, %36
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %38, i32 0, i32 28
  %40 = load i32, i32* %39, align 8
  %41 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %33 to i64
  call void @__llvm_profile_instrument_target(i64 %41, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_create_colorindex to i8*), i32 0)
  %42 = call i8** %33(%struct.jpeg_common_struct* %35, i32 1, i32 %37, i32 %40)
  %43 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %44 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %43, i32 0, i32 3
  store i8** %42, i8*** %44, align 8
  %45 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %46 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %45, i32 0, i32 2
  %47 = load i32, i32* %46, align 8
  store i32 %47, i32* %9, align 4
  store i32 0, i32* %5, align 4
  br label %48

; <label>:48:                                     ; preds = %150, %28
  %49 = load i32, i32* %5, align 4
  %50 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %50, i32 0, i32 28
  %52 = load i32, i32* %51, align 8
  %53 = icmp slt i32 %49, %52
  br i1 %53, label %54, label %154

; <label>:54:                                     ; preds = %48
  %55 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %56 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %55, i32 0, i32 5
  %57 = load i32, i32* %5, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [4 x i32], [4 x i32]* %56, i64 0, i64 %58
  %60 = load i32, i32* %59, align 4
  store i32 %60, i32* %8, align 4
  %61 = load i32, i32* %9, align 4
  %62 = load i32, i32* %8, align 4
  %63 = sdiv i32 %61, %62
  store i32 %63, i32* %9, align 4
  %64 = load i32, i32* %11, align 4
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %76

; <label>:66:                                     ; preds = %54
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_create_colorindex, i64 0, i64 4)
  %67 = add i64 %pgocount2, 1
  store i64 %67, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_create_colorindex, i64 0, i64 4)
  %68 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %69 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %68, i32 0, i32 3
  %70 = load i8**, i8*** %69, align 8
  %71 = load i32, i32* %5, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i8*, i8** %70, i64 %72
  %74 = load i8*, i8** %73, align 8
  %75 = getelementptr inbounds i8, i8* %74, i64 255
  store i8* %75, i8** %73, align 8
  br label %76

; <label>:76:                                     ; preds = %66, %54
  %77 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %78 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %77, i32 0, i32 3
  %79 = load i8**, i8*** %78, align 8
  %80 = load i32, i32* %5, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i8*, i8** %79, i64 %81
  %83 = load i8*, i8** %82, align 8
  store i8* %83, i8** %4, align 8
  store i32 0, i32* %10, align 4
  %84 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %85 = load i32, i32* %5, align 4
  %86 = load i32, i32* %8, align 4
  %87 = sub nsw i32 %86, 1
  %88 = call i32 @largest_input_value(%struct.jpeg_decompress_struct* %84, i32 %85, i32 0, i32 %87)
  store i32 %88, i32* %7, align 4
  store i32 0, i32* %6, align 4
  br label %89

; <label>:89:                                     ; preds = %115, %76
  %90 = load i32, i32* %6, align 4
  %91 = icmp sle i32 %90, 255
  br i1 %91, label %92, label %119

; <label>:92:                                     ; preds = %89
  br label %93

; <label>:93:                                     ; preds = %97, %92
  %94 = load i32, i32* %6, align 4
  %95 = load i32, i32* %7, align 4
  %96 = icmp sgt i32 %94, %95
  br i1 %96, label %97, label %106

; <label>:97:                                     ; preds = %93
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_create_colorindex, i64 0, i64 0)
  %98 = add i64 %pgocount3, 1
  store i64 %98, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_create_colorindex, i64 0, i64 0)
  %99 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %100 = load i32, i32* %5, align 4
  %101 = load i32, i32* %10, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* %10, align 4
  %103 = load i32, i32* %8, align 4
  %104 = sub nsw i32 %103, 1
  %105 = call i32 @largest_input_value(%struct.jpeg_decompress_struct* %99, i32 %100, i32 %102, i32 %104)
  store i32 %105, i32* %7, align 4
  br label %93

; <label>:106:                                    ; preds = %93
  %107 = load i32, i32* %10, align 4
  %108 = load i32, i32* %9, align 4
  %109 = mul nsw i32 %107, %108
  %110 = trunc i32 %109 to i8
  %111 = load i8*, i8** %4, align 8
  %112 = load i32, i32* %6, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i8, i8* %111, i64 %113
  store i8 %110, i8* %114, align 1
  br label %115

; <label>:115:                                    ; preds = %106
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_create_colorindex, i64 0, i64 1)
  %116 = add i64 %pgocount4, 1
  store i64 %116, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_create_colorindex, i64 0, i64 1)
  %117 = load i32, i32* %6, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, i32* %6, align 4
  br label %89

; <label>:119:                                    ; preds = %89
  %120 = load i32, i32* %11, align 4
  %121 = icmp ne i32 %120, 0
  br i1 %121, label %122, label %149

; <label>:122:                                    ; preds = %119
  store i32 1, i32* %6, align 4
  br label %123

; <label>:123:                                    ; preds = %143, %122
  %124 = load i32, i32* %6, align 4
  %125 = icmp sle i32 %124, 255
  br i1 %125, label %126, label %147

; <label>:126:                                    ; preds = %123
  %127 = load i8*, i8** %4, align 8
  %128 = getelementptr inbounds i8, i8* %127, i64 0
  %129 = load i8, i8* %128, align 1
  %130 = load i8*, i8** %4, align 8
  %131 = load i32, i32* %6, align 4
  %132 = sub nsw i32 0, %131
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i8, i8* %130, i64 %133
  store i8 %129, i8* %134, align 1
  %135 = load i8*, i8** %4, align 8
  %136 = getelementptr inbounds i8, i8* %135, i64 255
  %137 = load i8, i8* %136, align 1
  %138 = load i8*, i8** %4, align 8
  %139 = load i32, i32* %6, align 4
  %140 = add nsw i32 255, %139
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i8, i8* %138, i64 %141
  store i8 %137, i8* %142, align 1
  br label %143

; <label>:143:                                    ; preds = %126
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_create_colorindex, i64 0, i64 2)
  %144 = add i64 %pgocount5, 1
  store i64 %144, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_create_colorindex, i64 0, i64 2)
  %145 = load i32, i32* %6, align 4
  %146 = add nsw i32 %145, 1
  store i32 %146, i32* %6, align 4
  br label %123

; <label>:147:                                    ; preds = %123
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_create_colorindex, i64 0, i64 5)
  %148 = add i64 %pgocount6, 1
  store i64 %148, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_create_colorindex, i64 0, i64 5)
  br label %149

; <label>:149:                                    ; preds = %147, %119
  br label %150

; <label>:150:                                    ; preds = %149
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_create_colorindex, i64 0, i64 3)
  %151 = add i64 %pgocount7, 1
  store i64 %151, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_create_colorindex, i64 0, i64 3)
  %152 = load i32, i32* %5, align 4
  %153 = add nsw i32 %152, 1
  store i32 %153, i32* %5, align 4
  br label %48

; <label>:154:                                    ; preds = %48
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @alloc_fs_workspace(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_cquantizer*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %6, i32 0, i32 83
  %8 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %7, align 8
  %9 = bitcast %struct.jpeg_color_quantizer* %8 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %9, %struct.my_cquantizer** %3, align 8
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %10, i32 0, i32 26
  %12 = load i32, i32* %11, align 8
  %13 = add i32 %12, 2
  %14 = zext i32 %13 to i64
  %15 = mul i64 %14, 2
  store i64 %15, i64* %4, align 8
  store i32 0, i32* %5, align 4
  br label %16

; <label>:16:                                     ; preds = %39, %1
  %17 = load i32, i32* %5, align 4
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 28
  %20 = load i32, i32* %19, align 8
  %21 = icmp slt i32 %17, %20
  br i1 %21, label %22, label %43

; <label>:22:                                     ; preds = %16
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %23, i32 0, i32 1
  %25 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %25, i32 0, i32 1
  %27 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %26, align 8
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %29 = bitcast %struct.jpeg_decompress_struct* %28 to %struct.jpeg_common_struct*
  %30 = load i64, i64* %4, align 8
  %31 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %27 to i64
  call void @__llvm_profile_instrument_target(i64 %31, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_alloc_fs_workspace to i8*), i32 0)
  %32 = call i8* %27(%struct.jpeg_common_struct* %29, i32 1, i64 %30)
  %33 = bitcast i8* %32 to i16*
  %34 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %35 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %34, i32 0, i32 8
  %36 = load i32, i32* %5, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [4 x i16*], [4 x i16*]* %35, i64 0, i64 %37
  store i16* %33, i16** %38, align 8
  br label %39

; <label>:39:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_alloc_fs_workspace, i64 0, i64 0)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_alloc_fs_workspace, i64 0, i64 0)
  %41 = load i32, i32* %5, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %5, align 4
  br label %16

; <label>:43:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_alloc_fs_workspace, i64 0, i64 1)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_alloc_fs_workspace, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @color_quantize3(%struct.jpeg_decompress_struct*, i8**, i8**, i32) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.my_cquantizer*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i8*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store i8** %1, i8*** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i32 %3, i32* %8, align 4
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 83
  %21 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %20, align 8
  %22 = bitcast %struct.jpeg_color_quantizer* %21 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %22, %struct.my_cquantizer** %9, align 8
  %23 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %24 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %23, i32 0, i32 3
  %25 = load i8**, i8*** %24, align 8
  %26 = getelementptr inbounds i8*, i8** %25, i64 0
  %27 = load i8*, i8** %26, align 8
  store i8* %27, i8** %13, align 8
  %28 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %29 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %28, i32 0, i32 3
  %30 = load i8**, i8*** %29, align 8
  %31 = getelementptr inbounds i8*, i8** %30, i64 1
  %32 = load i8*, i8** %31, align 8
  store i8* %32, i8** %14, align 8
  %33 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %34 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %33, i32 0, i32 3
  %35 = load i8**, i8*** %34, align 8
  %36 = getelementptr inbounds i8*, i8** %35, i64 2
  %37 = load i8*, i8** %36, align 8
  store i8* %37, i8** %15, align 8
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %38, i32 0, i32 26
  %40 = load i32, i32* %39, align 8
  store i32 %40, i32* %18, align 4
  store i32 0, i32* %16, align 4
  br label %41

; <label>:41:                                     ; preds = %101, %4
  %42 = load i32, i32* %16, align 4
  %43 = load i32, i32* %8, align 4
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %45, label %105

; <label>:45:                                     ; preds = %41
  %46 = load i8**, i8*** %6, align 8
  %47 = load i32, i32* %16, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i8*, i8** %46, i64 %48
  %50 = load i8*, i8** %49, align 8
  store i8* %50, i8** %11, align 8
  %51 = load i8**, i8*** %7, align 8
  %52 = load i32, i32* %16, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8*, i8** %51, i64 %53
  %55 = load i8*, i8** %54, align 8
  store i8* %55, i8** %12, align 8
  %56 = load i32, i32* %18, align 4
  store i32 %56, i32* %17, align 4
  br label %57

; <label>:57:                                     ; preds = %96, %45
  %58 = load i32, i32* %17, align 4
  %59 = icmp ugt i32 %58, 0
  br i1 %59, label %60, label %100

; <label>:60:                                     ; preds = %57
  %61 = load i8*, i8** %13, align 8
  %62 = load i8*, i8** %11, align 8
  %63 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %63, i8** %11, align 8
  %64 = load i8, i8* %62, align 1
  %65 = zext i8 %64 to i32
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8* %61, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i32
  store i32 %69, i32* %10, align 4
  %70 = load i8*, i8** %14, align 8
  %71 = load i8*, i8** %11, align 8
  %72 = getelementptr inbounds i8, i8* %71, i32 1
  store i8* %72, i8** %11, align 8
  %73 = load i8, i8* %71, align 1
  %74 = zext i8 %73 to i32
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8* %70, i64 %75
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = load i32, i32* %10, align 4
  %80 = add nsw i32 %79, %78
  store i32 %80, i32* %10, align 4
  %81 = load i8*, i8** %15, align 8
  %82 = load i8*, i8** %11, align 8
  %83 = getelementptr inbounds i8, i8* %82, i32 1
  store i8* %83, i8** %11, align 8
  %84 = load i8, i8* %82, align 1
  %85 = zext i8 %84 to i32
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i8, i8* %81, i64 %86
  %88 = load i8, i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = load i32, i32* %10, align 4
  %91 = add nsw i32 %90, %89
  store i32 %91, i32* %10, align 4
  %92 = load i32, i32* %10, align 4
  %93 = trunc i32 %92 to i8
  %94 = load i8*, i8** %12, align 8
  %95 = getelementptr inbounds i8, i8* %94, i32 1
  store i8* %95, i8** %12, align 8
  store i8 %93, i8* %94, align 1
  br label %96

; <label>:96:                                     ; preds = %60
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_color_quantize3, i64 0, i64 0)
  %97 = add i64 %pgocount, 1
  store i64 %97, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_color_quantize3, i64 0, i64 0)
  %98 = load i32, i32* %17, align 4
  %99 = add i32 %98, -1
  store i32 %99, i32* %17, align 4
  br label %57

; <label>:100:                                    ; preds = %57
  br label %101

; <label>:101:                                    ; preds = %100
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_color_quantize3, i64 0, i64 1)
  %102 = add i64 %pgocount1, 1
  store i64 %102, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_color_quantize3, i64 0, i64 1)
  %103 = load i32, i32* %16, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, i32* %16, align 4
  br label %41

; <label>:105:                                    ; preds = %41
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_color_quantize3, i64 0, i64 2)
  %106 = add i64 %pgocount2, 1
  store i64 %106, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_color_quantize3, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @color_quantize(%struct.jpeg_decompress_struct*, i8**, i8**, i32) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.my_cquantizer*, align 8
  %10 = alloca i8**, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store i8** %1, i8*** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i32 %3, i32* %8, align 4
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 83
  %21 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %20, align 8
  %22 = bitcast %struct.jpeg_color_quantizer* %21 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %22, %struct.my_cquantizer** %9, align 8
  %23 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %24 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %23, i32 0, i32 3
  %25 = load i8**, i8*** %24, align 8
  store i8** %25, i8*** %10, align 8
  %26 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %26, i32 0, i32 26
  %28 = load i32, i32* %27, align 8
  store i32 %28, i32* %17, align 4
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %29, i32 0, i32 28
  %31 = load i32, i32* %30, align 8
  store i32 %31, i32* %18, align 4
  store i32 0, i32* %15, align 4
  br label %32

; <label>:32:                                     ; preds = %86, %4
  %33 = load i32, i32* %15, align 4
  %34 = load i32, i32* %8, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %90

; <label>:36:                                     ; preds = %32
  %37 = load i8**, i8*** %6, align 8
  %38 = load i32, i32* %15, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8*, i8** %37, i64 %39
  %41 = load i8*, i8** %40, align 8
  store i8* %41, i8** %13, align 8
  %42 = load i8**, i8*** %7, align 8
  %43 = load i32, i32* %15, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8*, i8** %42, i64 %44
  %46 = load i8*, i8** %45, align 8
  store i8* %46, i8** %14, align 8
  %47 = load i32, i32* %17, align 4
  store i32 %47, i32* %16, align 4
  br label %48

; <label>:48:                                     ; preds = %81, %36
  %49 = load i32, i32* %16, align 4
  %50 = icmp ugt i32 %49, 0
  br i1 %50, label %51, label %85

; <label>:51:                                     ; preds = %48
  store i32 0, i32* %11, align 4
  store i32 0, i32* %12, align 4
  br label %52

; <label>:52:                                     ; preds = %72, %51
  %53 = load i32, i32* %12, align 4
  %54 = load i32, i32* %18, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %76

; <label>:56:                                     ; preds = %52
  %57 = load i8**, i8*** %10, align 8
  %58 = load i32, i32* %12, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8*, i8** %57, i64 %59
  %61 = load i8*, i8** %60, align 8
  %62 = load i8*, i8** %13, align 8
  %63 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %63, i8** %13, align 8
  %64 = load i8, i8* %62, align 1
  %65 = zext i8 %64 to i32
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8* %61, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = load i32, i32* %11, align 4
  %71 = add nsw i32 %70, %69
  store i32 %71, i32* %11, align 4
  br label %72

; <label>:72:                                     ; preds = %56
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_color_quantize, i64 0, i64 0)
  %73 = add i64 %pgocount, 1
  store i64 %73, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_color_quantize, i64 0, i64 0)
  %74 = load i32, i32* %12, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %12, align 4
  br label %52

; <label>:76:                                     ; preds = %52
  %77 = load i32, i32* %11, align 4
  %78 = trunc i32 %77 to i8
  %79 = load i8*, i8** %14, align 8
  %80 = getelementptr inbounds i8, i8* %79, i32 1
  store i8* %80, i8** %14, align 8
  store i8 %78, i8* %79, align 1
  br label %81

; <label>:81:                                     ; preds = %76
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_color_quantize, i64 0, i64 1)
  %82 = add i64 %pgocount1, 1
  store i64 %82, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_color_quantize, i64 0, i64 1)
  %83 = load i32, i32* %16, align 4
  %84 = add i32 %83, -1
  store i32 %84, i32* %16, align 4
  br label %48

; <label>:85:                                     ; preds = %48
  br label %86

; <label>:86:                                     ; preds = %85
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_color_quantize, i64 0, i64 2)
  %87 = add i64 %pgocount2, 1
  store i64 %87, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_color_quantize, i64 0, i64 2)
  %88 = load i32, i32* %15, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %15, align 4
  br label %32

; <label>:90:                                     ; preds = %32
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_color_quantize, i64 0, i64 3)
  %91 = add i64 %pgocount3, 1
  store i64 %91, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_color_quantize, i64 0, i64 3)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @quantize3_ord_dither(%struct.jpeg_decompress_struct*, i8**, i8**, i32) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.my_cquantizer*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i8*, align 8
  %16 = alloca i32*, align 8
  %17 = alloca i32*, align 8
  %18 = alloca i32*, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store i8** %1, i8*** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i32 %3, i32* %8, align 4
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 83
  %26 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %25, align 8
  %27 = bitcast %struct.jpeg_color_quantizer* %26 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %27, %struct.my_cquantizer** %9, align 8
  %28 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %29 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %28, i32 0, i32 3
  %30 = load i8**, i8*** %29, align 8
  %31 = getelementptr inbounds i8*, i8** %30, i64 0
  %32 = load i8*, i8** %31, align 8
  store i8* %32, i8** %13, align 8
  %33 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %34 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %33, i32 0, i32 3
  %35 = load i8**, i8*** %34, align 8
  %36 = getelementptr inbounds i8*, i8** %35, i64 1
  %37 = load i8*, i8** %36, align 8
  store i8* %37, i8** %14, align 8
  %38 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %39 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %38, i32 0, i32 3
  %40 = load i8**, i8*** %39, align 8
  %41 = getelementptr inbounds i8*, i8** %40, i64 2
  %42 = load i8*, i8** %41, align 8
  store i8* %42, i8** %15, align 8
  %43 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %43, i32 0, i32 26
  %45 = load i32, i32* %44, align 8
  store i32 %45, i32* %23, align 4
  store i32 0, i32* %21, align 4
  br label %46

; <label>:46:                                     ; preds = %160, %4
  %47 = load i32, i32* %21, align 4
  %48 = load i32, i32* %8, align 4
  %49 = icmp slt i32 %47, %48
  br i1 %49, label %50, label %164

; <label>:50:                                     ; preds = %46
  %51 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %52 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %51, i32 0, i32 6
  %53 = load i32, i32* %52, align 4
  store i32 %53, i32* %19, align 4
  %54 = load i8**, i8*** %6, align 8
  %55 = load i32, i32* %21, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8*, i8** %54, i64 %56
  %58 = load i8*, i8** %57, align 8
  store i8* %58, i8** %11, align 8
  %59 = load i8**, i8*** %7, align 8
  %60 = load i32, i32* %21, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8*, i8** %59, i64 %61
  %63 = load i8*, i8** %62, align 8
  store i8* %63, i8** %12, align 8
  %64 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %65 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %64, i32 0, i32 7
  %66 = getelementptr inbounds [4 x [16 x i32]*], [4 x [16 x i32]*]* %65, i64 0, i64 0
  %67 = load [16 x i32]*, [16 x i32]** %66, align 8
  %68 = load i32, i32* %19, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [16 x i32], [16 x i32]* %67, i64 %69
  %71 = getelementptr inbounds [16 x i32], [16 x i32]* %70, i32 0, i32 0
  store i32* %71, i32** %16, align 8
  %72 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %73 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %72, i32 0, i32 7
  %74 = getelementptr inbounds [4 x [16 x i32]*], [4 x [16 x i32]*]* %73, i64 0, i64 1
  %75 = load [16 x i32]*, [16 x i32]** %74, align 8
  %76 = load i32, i32* %19, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [16 x i32], [16 x i32]* %75, i64 %77
  %79 = getelementptr inbounds [16 x i32], [16 x i32]* %78, i32 0, i32 0
  store i32* %79, i32** %17, align 8
  %80 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %81 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %80, i32 0, i32 7
  %82 = getelementptr inbounds [4 x [16 x i32]*], [4 x [16 x i32]*]* %81, i64 0, i64 2
  %83 = load [16 x i32]*, [16 x i32]** %82, align 8
  %84 = load i32, i32* %19, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [16 x i32], [16 x i32]* %83, i64 %85
  %87 = getelementptr inbounds [16 x i32], [16 x i32]* %86, i32 0, i32 0
  store i32* %87, i32** %18, align 8
  store i32 0, i32* %20, align 4
  %88 = load i32, i32* %23, align 4
  store i32 %88, i32* %22, align 4
  br label %89

; <label>:89:                                     ; preds = %149, %50
  %90 = load i32, i32* %22, align 4
  %91 = icmp ugt i32 %90, 0
  br i1 %91, label %92, label %153

; <label>:92:                                     ; preds = %89
  %93 = load i8*, i8** %13, align 8
  %94 = load i8*, i8** %11, align 8
  %95 = getelementptr inbounds i8, i8* %94, i32 1
  store i8* %95, i8** %11, align 8
  %96 = load i8, i8* %94, align 1
  %97 = zext i8 %96 to i32
  %98 = load i32*, i32** %16, align 8
  %99 = load i32, i32* %20, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32* %98, i64 %100
  %102 = load i32, i32* %101, align 4
  %103 = add nsw i32 %97, %102
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i8, i8* %93, i64 %104
  %106 = load i8, i8* %105, align 1
  %107 = zext i8 %106 to i32
  store i32 %107, i32* %10, align 4
  %108 = load i8*, i8** %14, align 8
  %109 = load i8*, i8** %11, align 8
  %110 = getelementptr inbounds i8, i8* %109, i32 1
  store i8* %110, i8** %11, align 8
  %111 = load i8, i8* %109, align 1
  %112 = zext i8 %111 to i32
  %113 = load i32*, i32** %17, align 8
  %114 = load i32, i32* %20, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32* %113, i64 %115
  %117 = load i32, i32* %116, align 4
  %118 = add nsw i32 %112, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i8, i8* %108, i64 %119
  %121 = load i8, i8* %120, align 1
  %122 = zext i8 %121 to i32
  %123 = load i32, i32* %10, align 4
  %124 = add nsw i32 %123, %122
  store i32 %124, i32* %10, align 4
  %125 = load i8*, i8** %15, align 8
  %126 = load i8*, i8** %11, align 8
  %127 = getelementptr inbounds i8, i8* %126, i32 1
  store i8* %127, i8** %11, align 8
  %128 = load i8, i8* %126, align 1
  %129 = zext i8 %128 to i32
  %130 = load i32*, i32** %18, align 8
  %131 = load i32, i32* %20, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i32, i32* %130, i64 %132
  %134 = load i32, i32* %133, align 4
  %135 = add nsw i32 %129, %134
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i8, i8* %125, i64 %136
  %138 = load i8, i8* %137, align 1
  %139 = zext i8 %138 to i32
  %140 = load i32, i32* %10, align 4
  %141 = add nsw i32 %140, %139
  store i32 %141, i32* %10, align 4
  %142 = load i32, i32* %10, align 4
  %143 = trunc i32 %142 to i8
  %144 = load i8*, i8** %12, align 8
  %145 = getelementptr inbounds i8, i8* %144, i32 1
  store i8* %145, i8** %12, align 8
  store i8 %143, i8* %144, align 1
  %146 = load i32, i32* %20, align 4
  %147 = add nsw i32 %146, 1
  %148 = and i32 %147, 15
  store i32 %148, i32* %20, align 4
  br label %149

; <label>:149:                                    ; preds = %92
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_quantize3_ord_dither, i64 0, i64 0)
  %150 = add i64 %pgocount, 1
  store i64 %150, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_quantize3_ord_dither, i64 0, i64 0)
  %151 = load i32, i32* %22, align 4
  %152 = add i32 %151, -1
  store i32 %152, i32* %22, align 4
  br label %89

; <label>:153:                                    ; preds = %89
  %154 = load i32, i32* %19, align 4
  %155 = add nsw i32 %154, 1
  %156 = and i32 %155, 15
  store i32 %156, i32* %19, align 4
  %157 = load i32, i32* %19, align 4
  %158 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %159 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %158, i32 0, i32 6
  store i32 %157, i32* %159, align 4
  br label %160

; <label>:160:                                    ; preds = %153
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_quantize3_ord_dither, i64 0, i64 1)
  %161 = add i64 %pgocount1, 1
  store i64 %161, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_quantize3_ord_dither, i64 0, i64 1)
  %162 = load i32, i32* %21, align 4
  %163 = add nsw i32 %162, 1
  store i32 %163, i32* %21, align 4
  br label %46

; <label>:164:                                    ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_quantize3_ord_dither, i64 0, i64 2)
  %165 = add i64 %pgocount2, 1
  store i64 %165, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_quantize3_ord_dither, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @quantize_ord_dither(%struct.jpeg_decompress_struct*, i8**, i8**, i32) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.my_cquantizer*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store i8** %1, i8*** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i32 %3, i32* %8, align 4
  %21 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %21, i32 0, i32 83
  %23 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %22, align 8
  %24 = bitcast %struct.jpeg_color_quantizer* %23 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %24, %struct.my_cquantizer** %9, align 8
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %25, i32 0, i32 28
  %27 = load i32, i32* %26, align 8
  store i32 %27, i32* %16, align 4
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %28, i32 0, i32 26
  %30 = load i32, i32* %29, align 8
  store i32 %30, i32* %20, align 4
  store i32 0, i32* %18, align 4
  br label %31

; <label>:31:                                     ; preds = %131, %4
  %32 = load i32, i32* %18, align 4
  %33 = load i32, i32* %8, align 4
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %135

; <label>:35:                                     ; preds = %31
  %36 = load i8**, i8*** %7, align 8
  %37 = load i32, i32* %18, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8*, i8** %36, i64 %38
  %40 = load i8*, i8** %39, align 8
  %41 = load i32, i32* %20, align 4
  %42 = zext i32 %41 to i64
  %43 = mul i64 %42, 1
  call void @jzero_far(i8* %40, i64 %43)
  %44 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %45 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %44, i32 0, i32 6
  %46 = load i32, i32* %45, align 4
  store i32 %46, i32* %14, align 4
  store i32 0, i32* %17, align 4
  br label %47

; <label>:47:                                     ; preds = %120, %35
  %48 = load i32, i32* %17, align 4
  %49 = load i32, i32* %16, align 4
  %50 = icmp slt i32 %48, %49
  br i1 %50, label %51, label %124

; <label>:51:                                     ; preds = %47
  %52 = load i8**, i8*** %6, align 8
  %53 = load i32, i32* %18, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8*, i8** %52, i64 %54
  %56 = load i8*, i8** %55, align 8
  %57 = load i32, i32* %17, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8* %56, i64 %58
  store i8* %59, i8** %10, align 8
  %60 = load i8**, i8*** %7, align 8
  %61 = load i32, i32* %18, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8*, i8** %60, i64 %62
  %64 = load i8*, i8** %63, align 8
  store i8* %64, i8** %11, align 8
  %65 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %66 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %65, i32 0, i32 3
  %67 = load i8**, i8*** %66, align 8
  %68 = load i32, i32* %17, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8*, i8** %67, i64 %69
  %71 = load i8*, i8** %70, align 8
  store i8* %71, i8** %12, align 8
  %72 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %73 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %72, i32 0, i32 7
  %74 = load i32, i32* %17, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [4 x [16 x i32]*], [4 x [16 x i32]*]* %73, i64 0, i64 %75
  %77 = load [16 x i32]*, [16 x i32]** %76, align 8
  %78 = load i32, i32* %14, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [16 x i32], [16 x i32]* %77, i64 %79
  %81 = getelementptr inbounds [16 x i32], [16 x i32]* %80, i32 0, i32 0
  store i32* %81, i32** %13, align 8
  store i32 0, i32* %15, align 4
  %82 = load i32, i32* %20, align 4
  store i32 %82, i32* %19, align 4
  br label %83

; <label>:83:                                     ; preds = %115, %51
  %84 = load i32, i32* %19, align 4
  %85 = icmp ugt i32 %84, 0
  br i1 %85, label %86, label %119

; <label>:86:                                     ; preds = %83
  %87 = load i8*, i8** %12, align 8
  %88 = load i8*, i8** %10, align 8
  %89 = load i8, i8* %88, align 1
  %90 = zext i8 %89 to i32
  %91 = load i32*, i32** %13, align 8
  %92 = load i32, i32* %15, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32* %91, i64 %93
  %95 = load i32, i32* %94, align 4
  %96 = add nsw i32 %90, %95
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i8, i8* %87, i64 %97
  %99 = load i8, i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = load i8*, i8** %11, align 8
  %102 = load i8, i8* %101, align 1
  %103 = zext i8 %102 to i32
  %104 = add nsw i32 %103, %100
  %105 = trunc i32 %104 to i8
  store i8 %105, i8* %101, align 1
  %106 = load i32, i32* %16, align 4
  %107 = load i8*, i8** %10, align 8
  %108 = sext i32 %106 to i64
  %109 = getelementptr inbounds i8, i8* %107, i64 %108
  store i8* %109, i8** %10, align 8
  %110 = load i8*, i8** %11, align 8
  %111 = getelementptr inbounds i8, i8* %110, i32 1
  store i8* %111, i8** %11, align 8
  %112 = load i32, i32* %15, align 4
  %113 = add nsw i32 %112, 1
  %114 = and i32 %113, 15
  store i32 %114, i32* %15, align 4
  br label %115

; <label>:115:                                    ; preds = %86
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_quantize_ord_dither, i64 0, i64 0)
  %116 = add i64 %pgocount, 1
  store i64 %116, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_quantize_ord_dither, i64 0, i64 0)
  %117 = load i32, i32* %19, align 4
  %118 = add i32 %117, -1
  store i32 %118, i32* %19, align 4
  br label %83

; <label>:119:                                    ; preds = %83
  br label %120

; <label>:120:                                    ; preds = %119
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_quantize_ord_dither, i64 0, i64 1)
  %121 = add i64 %pgocount1, 1
  store i64 %121, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_quantize_ord_dither, i64 0, i64 1)
  %122 = load i32, i32* %17, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %17, align 4
  br label %47

; <label>:124:                                    ; preds = %47
  %125 = load i32, i32* %14, align 4
  %126 = add nsw i32 %125, 1
  %127 = and i32 %126, 15
  store i32 %127, i32* %14, align 4
  %128 = load i32, i32* %14, align 4
  %129 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %130 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %129, i32 0, i32 6
  store i32 %128, i32* %130, align 4
  br label %131

; <label>:131:                                    ; preds = %124
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_quantize_ord_dither, i64 0, i64 2)
  %132 = add i64 %pgocount2, 1
  store i64 %132, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_quantize_ord_dither, i64 0, i64 2)
  %133 = load i32, i32* %18, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, i32* %18, align 4
  br label %31

; <label>:135:                                    ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_quantize_ord_dither, i64 0, i64 3)
  %136 = add i64 %pgocount3, 1
  store i64 %136, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_quantize_ord_dither, i64 0, i64 3)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @create_odither_tables(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_cquantizer*, align 8
  %4 = alloca [16 x i32]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %8 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %8, i32 0, i32 83
  %10 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %9, align 8
  %11 = bitcast %struct.jpeg_color_quantizer* %10 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %11, %struct.my_cquantizer** %3, align 8
  store i32 0, i32* %5, align 4
  br label %12

; <label>:12:                                     ; preds = %66, %1
  %13 = load i32, i32* %5, align 4
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 28
  %16 = load i32, i32* %15, align 8
  %17 = icmp slt i32 %13, %16
  br i1 %17, label %18, label %70

; <label>:18:                                     ; preds = %12
  %19 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %20 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %19, i32 0, i32 5
  %21 = load i32, i32* %5, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [4 x i32], [4 x i32]* %20, i64 0, i64 %22
  %24 = load i32, i32* %23, align 4
  store i32 %24, i32* %7, align 4
  store [16 x i32]* null, [16 x i32]** %4, align 8
  store i32 0, i32* %6, align 4
  br label %25

; <label>:25:                                     ; preds = %47, %18
  %26 = load i32, i32* %6, align 4
  %27 = load i32, i32* %5, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %51

; <label>:29:                                     ; preds = %25
  %30 = load i32, i32* %7, align 4
  %31 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %32 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %31, i32 0, i32 5
  %33 = load i32, i32* %6, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [4 x i32], [4 x i32]* %32, i64 0, i64 %34
  %36 = load i32, i32* %35, align 4
  %37 = icmp eq i32 %30, %36
  br i1 %37, label %38, label %46

; <label>:38:                                     ; preds = %29
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_create_odither_tables, i64 0, i64 2)
  %39 = add i64 %pgocount, 1
  store i64 %39, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_create_odither_tables, i64 0, i64 2)
  %40 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %41 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %40, i32 0, i32 7
  %42 = load i32, i32* %6, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [4 x [16 x i32]*], [4 x [16 x i32]*]* %41, i64 0, i64 %43
  %45 = load [16 x i32]*, [16 x i32]** %44, align 8
  store [16 x i32]* %45, [16 x i32]** %4, align 8
  br label %51

; <label>:46:                                     ; preds = %29
  br label %47

; <label>:47:                                     ; preds = %46
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_create_odither_tables, i64 0, i64 0)
  %48 = add i64 %pgocount1, 1
  store i64 %48, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_create_odither_tables, i64 0, i64 0)
  %49 = load i32, i32* %6, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %6, align 4
  br label %25

; <label>:51:                                     ; preds = %38, %25
  %52 = load [16 x i32]*, [16 x i32]** %4, align 8
  %53 = icmp eq [16 x i32]* %52, null
  br i1 %53, label %54, label %59

; <label>:54:                                     ; preds = %51
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_create_odither_tables, i64 0, i64 3)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_create_odither_tables, i64 0, i64 3)
  %56 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %57 = load i32, i32* %7, align 4
  %58 = call [16 x i32]* @make_odither_array(%struct.jpeg_decompress_struct* %56, i32 %57)
  store [16 x i32]* %58, [16 x i32]** %4, align 8
  br label %59

; <label>:59:                                     ; preds = %54, %51
  %60 = load [16 x i32]*, [16 x i32]** %4, align 8
  %61 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %62 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %61, i32 0, i32 7
  %63 = load i32, i32* %5, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [4 x [16 x i32]*], [4 x [16 x i32]*]* %62, i64 0, i64 %64
  store [16 x i32]* %60, [16 x i32]** %65, align 8
  br label %66

; <label>:66:                                     ; preds = %59
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_create_odither_tables, i64 0, i64 1)
  %67 = add i64 %pgocount3, 1
  store i64 %67, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_create_odither_tables, i64 0, i64 1)
  %68 = load i32, i32* %5, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %5, align 4
  br label %12

; <label>:70:                                     ; preds = %12
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_create_odither_tables, i64 0, i64 4)
  %71 = add i64 %pgocount4, 1
  store i64 %71, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_create_odither_tables, i64 0, i64 4)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @quantize_fs_dither(%struct.jpeg_decompress_struct*, i8**, i8**, i32) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.my_cquantizer*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i16*, align 8
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i8*, align 8
  %19 = alloca i8*, align 8
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i8*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store i8** %1, i8*** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i32 %3, i32* %8, align 4
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %29, i32 0, i32 83
  %31 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %30, align 8
  %32 = bitcast %struct.jpeg_color_quantizer* %31 to %struct.my_cquantizer*
  store %struct.my_cquantizer* %32, %struct.my_cquantizer** %9, align 8
  %33 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %33, i32 0, i32 28
  %35 = load i32, i32* %34, align 8
  store i32 %35, i32* %21, align 4
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 26
  %38 = load i32, i32* %37, align 8
  store i32 %38, i32* %27, align 4
  %39 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %39, i32 0, i32 61
  %41 = load i8*, i8** %40, align 8
  store i8* %41, i8** %28, align 8
  store i32 0, i32* %25, align 4
  br label %42

; <label>:42:                                     ; preds = %231, %4
  %43 = load i32, i32* %25, align 4
  %44 = load i32, i32* %8, align 4
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %46, label %235

; <label>:46:                                     ; preds = %42
  %47 = load i8**, i8*** %7, align 8
  %48 = load i32, i32* %25, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8*, i8** %47, i64 %49
  %51 = load i8*, i8** %50, align 8
  %52 = load i32, i32* %27, align 4
  %53 = zext i32 %52 to i64
  %54 = mul i64 %53, 1
  call void @jzero_far(i8* %51, i64 %54)
  store i32 0, i32* %24, align 4
  br label %55

; <label>:55:                                     ; preds = %218, %46
  %56 = load i32, i32* %24, align 4
  %57 = load i32, i32* %21, align 4
  %58 = icmp slt i32 %56, %57
  br i1 %58, label %59, label %221

; <label>:59:                                     ; preds = %55
  %60 = load i8**, i8*** %6, align 8
  %61 = load i32, i32* %25, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8*, i8** %60, i64 %62
  %64 = load i8*, i8** %63, align 8
  %65 = load i32, i32* %24, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8* %64, i64 %66
  store i8* %67, i8** %16, align 8
  %68 = load i8**, i8*** %7, align 8
  %69 = load i32, i32* %25, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8*, i8** %68, i64 %70
  %72 = load i8*, i8** %71, align 8
  store i8* %72, i8** %17, align 8
  %73 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %74 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %73, i32 0, i32 9
  %75 = load i32, i32* %74, align 8
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %77, label %103

; <label>:77:                                     ; preds = %59
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_quantize_fs_dither, i64 0, i64 1)
  %78 = add i64 %pgocount, 1
  store i64 %78, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_quantize_fs_dither, i64 0, i64 1)
  %79 = load i32, i32* %27, align 4
  %80 = sub i32 %79, 1
  %81 = load i32, i32* %21, align 4
  %82 = mul i32 %80, %81
  %83 = load i8*, i8** %16, align 8
  %84 = zext i32 %82 to i64
  %85 = getelementptr inbounds i8, i8* %83, i64 %84
  store i8* %85, i8** %16, align 8
  %86 = load i32, i32* %27, align 4
  %87 = sub i32 %86, 1
  %88 = load i8*, i8** %17, align 8
  %89 = zext i32 %87 to i64
  %90 = getelementptr inbounds i8, i8* %88, i64 %89
  store i8* %90, i8** %17, align 8
  store i32 -1, i32* %22, align 4
  %91 = load i32, i32* %21, align 4
  %92 = sub nsw i32 0, %91
  store i32 %92, i32* %23, align 4
  %93 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %94 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %93, i32 0, i32 8
  %95 = load i32, i32* %24, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [4 x i16*], [4 x i16*]* %94, i64 0, i64 %96
  %98 = load i16*, i16** %97, align 8
  %99 = load i32, i32* %27, align 4
  %100 = add i32 %99, 1
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds i16, i16* %98, i64 %101
  store i16* %102, i16** %15, align 8
  br label %112

; <label>:103:                                    ; preds = %59
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_quantize_fs_dither, i64 0, i64 2)
  %104 = add i64 %pgocount1, 1
  store i64 %104, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_quantize_fs_dither, i64 0, i64 2)
  store i32 1, i32* %22, align 4
  %105 = load i32, i32* %21, align 4
  store i32 %105, i32* %23, align 4
  %106 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %107 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %106, i32 0, i32 8
  %108 = load i32, i32* %24, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [4 x i16*], [4 x i16*]* %107, i64 0, i64 %109
  %111 = load i16*, i16** %110, align 8
  store i16* %111, i16** %15, align 8
  br label %112

; <label>:112:                                    ; preds = %103, %77
  %113 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %114 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %113, i32 0, i32 3
  %115 = load i8**, i8*** %114, align 8
  %116 = load i32, i32* %24, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i8*, i8** %115, i64 %117
  %119 = load i8*, i8** %118, align 8
  store i8* %119, i8** %18, align 8
  %120 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %121 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %120, i32 0, i32 1
  %122 = load i8**, i8*** %121, align 8
  %123 = load i32, i32* %24, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i8*, i8** %122, i64 %124
  %126 = load i8*, i8** %125, align 8
  store i8* %126, i8** %19, align 8
  store i32 0, i32* %10, align 4
  store i32 0, i32* %12, align 4
  store i32 0, i32* %11, align 4
  %127 = load i32, i32* %27, align 4
  store i32 %127, i32* %26, align 4
  br label %128

; <label>:128:                                    ; preds = %209, %112
  %129 = load i32, i32* %26, align 4
  %130 = icmp ugt i32 %129, 0
  br i1 %130, label %131, label %213

; <label>:131:                                    ; preds = %128
  %132 = load i32, i32* %10, align 4
  %133 = load i16*, i16** %15, align 8
  %134 = load i32, i32* %22, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i16, i16* %133, i64 %135
  %137 = load i16, i16* %136, align 2
  %138 = sext i16 %137 to i32
  %139 = add nsw i32 %132, %138
  %140 = add nsw i32 %139, 8
  %141 = ashr i32 %140, 4
  store i32 %141, i32* %10, align 4
  %142 = load i8*, i8** %16, align 8
  %143 = load i8, i8* %142, align 1
  %144 = zext i8 %143 to i32
  %145 = load i32, i32* %10, align 4
  %146 = add nsw i32 %145, %144
  store i32 %146, i32* %10, align 4
  %147 = load i8*, i8** %28, align 8
  %148 = load i32, i32* %10, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i8, i8* %147, i64 %149
  %151 = load i8, i8* %150, align 1
  %152 = zext i8 %151 to i32
  store i32 %152, i32* %10, align 4
  %153 = load i8*, i8** %18, align 8
  %154 = load i32, i32* %10, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i8, i8* %153, i64 %155
  %157 = load i8, i8* %156, align 1
  %158 = zext i8 %157 to i32
  store i32 %158, i32* %20, align 4
  %159 = load i32, i32* %20, align 4
  %160 = trunc i32 %159 to i8
  %161 = zext i8 %160 to i32
  %162 = load i8*, i8** %17, align 8
  %163 = load i8, i8* %162, align 1
  %164 = zext i8 %163 to i32
  %165 = add nsw i32 %164, %161
  %166 = trunc i32 %165 to i8
  store i8 %166, i8* %162, align 1
  %167 = load i8*, i8** %19, align 8
  %168 = load i32, i32* %20, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds i8, i8* %167, i64 %169
  %171 = load i8, i8* %170, align 1
  %172 = zext i8 %171 to i32
  %173 = load i32, i32* %10, align 4
  %174 = sub nsw i32 %173, %172
  store i32 %174, i32* %10, align 4
  %175 = load i32, i32* %10, align 4
  store i32 %175, i32* %13, align 4
  %176 = load i32, i32* %10, align 4
  %177 = mul nsw i32 %176, 2
  store i32 %177, i32* %14, align 4
  %178 = load i32, i32* %14, align 4
  %179 = load i32, i32* %10, align 4
  %180 = add nsw i32 %179, %178
  store i32 %180, i32* %10, align 4
  %181 = load i32, i32* %12, align 4
  %182 = load i32, i32* %10, align 4
  %183 = add nsw i32 %181, %182
  %184 = trunc i32 %183 to i16
  %185 = load i16*, i16** %15, align 8
  %186 = getelementptr inbounds i16, i16* %185, i64 0
  store i16 %184, i16* %186, align 2
  %187 = load i32, i32* %14, align 4
  %188 = load i32, i32* %10, align 4
  %189 = add nsw i32 %188, %187
  store i32 %189, i32* %10, align 4
  %190 = load i32, i32* %11, align 4
  %191 = load i32, i32* %10, align 4
  %192 = add nsw i32 %190, %191
  store i32 %192, i32* %12, align 4
  %193 = load i32, i32* %13, align 4
  store i32 %193, i32* %11, align 4
  %194 = load i32, i32* %14, align 4
  %195 = load i32, i32* %10, align 4
  %196 = add nsw i32 %195, %194
  store i32 %196, i32* %10, align 4
  %197 = load i32, i32* %23, align 4
  %198 = load i8*, i8** %16, align 8
  %199 = sext i32 %197 to i64
  %200 = getelementptr inbounds i8, i8* %198, i64 %199
  store i8* %200, i8** %16, align 8
  %201 = load i32, i32* %22, align 4
  %202 = load i8*, i8** %17, align 8
  %203 = sext i32 %201 to i64
  %204 = getelementptr inbounds i8, i8* %202, i64 %203
  store i8* %204, i8** %17, align 8
  %205 = load i32, i32* %22, align 4
  %206 = load i16*, i16** %15, align 8
  %207 = sext i32 %205 to i64
  %208 = getelementptr inbounds i16, i16* %206, i64 %207
  store i16* %208, i16** %15, align 8
  br label %209

; <label>:209:                                    ; preds = %131
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_quantize_fs_dither, i64 0, i64 0)
  %210 = add i64 %pgocount2, 1
  store i64 %210, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_quantize_fs_dither, i64 0, i64 0)
  %211 = load i32, i32* %26, align 4
  %212 = add i32 %211, -1
  store i32 %212, i32* %26, align 4
  br label %128

; <label>:213:                                    ; preds = %128
  %214 = load i32, i32* %12, align 4
  %215 = trunc i32 %214 to i16
  %216 = load i16*, i16** %15, align 8
  %217 = getelementptr inbounds i16, i16* %216, i64 0
  store i16 %215, i16* %217, align 2
  br label %218

; <label>:218:                                    ; preds = %213
  %219 = load i32, i32* %24, align 4
  %220 = add nsw i32 %219, 1
  store i32 %220, i32* %24, align 4
  br label %55

; <label>:221:                                    ; preds = %55
  %222 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %223 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %222, i32 0, i32 9
  %224 = load i32, i32* %223, align 8
  %225 = icmp ne i32 %224, 0
  %226 = zext i1 %225 to i64
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_quantize_fs_dither, i64 0, i64 5)
  %227 = add i64 %pgocount3, %226
  store i64 %227, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_quantize_fs_dither, i64 0, i64 5)
  %228 = select i1 %225, i32 0, i32 1
  %229 = load %struct.my_cquantizer*, %struct.my_cquantizer** %9, align 8
  %230 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %229, i32 0, i32 9
  store i32 %228, i32* %230, align 8
  br label %231

; <label>:231:                                    ; preds = %221
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_quantize_fs_dither, i64 0, i64 3)
  %232 = add i64 %pgocount4, 1
  store i64 %232, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_quantize_fs_dither, i64 0, i64 3)
  %233 = load i32, i32* %25, align 4
  %234 = add nsw i32 %233, 1
  store i32 %234, i32* %25, align 4
  br label %42

; <label>:235:                                    ; preds = %42
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_quantize_fs_dither, i64 0, i64 4)
  %236 = add i64 %pgocount5, 1
  store i64 %236, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_quantize_fs_dither, i64 0, i64 4)
  ret void
}

declare void @jzero_far(i8*, i64) #1

; Function Attrs: nounwind uwtable
define internal [16 x i32]* @make_odither_array(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca [16 x i32]*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %10, i32 0, i32 1
  %12 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %12, i32 0, i32 0
  %14 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %13, align 8
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %16 = bitcast %struct.jpeg_decompress_struct* %15 to %struct.jpeg_common_struct*
  %17 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %14 to i64
  call void @__llvm_profile_instrument_target(i64 %17, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_make_odither_array to i8*), i32 0)
  %18 = call i8* %14(%struct.jpeg_common_struct* %16, i32 1, i64 1024)
  %19 = bitcast i8* %18 to [16 x i32]*
  store [16 x i32]* %19, [16 x i32]** %5, align 8
  %20 = load i32, i32* %4, align 4
  %21 = sub nsw i32 %20, 1
  %22 = sext i32 %21 to i64
  %23 = mul nsw i64 512, %22
  store i64 %23, i64* %9, align 8
  store i32 0, i32* %6, align 4
  br label %24

; <label>:24:                                     ; preds = %72, %2
  %25 = load i32, i32* %6, align 4
  %26 = icmp slt i32 %25, 16
  br i1 %26, label %27, label %76

; <label>:27:                                     ; preds = %24
  store i32 0, i32* %7, align 4
  br label %28

; <label>:28:                                     ; preds = %68, %27
  %29 = load i32, i32* %7, align 4
  %30 = icmp slt i32 %29, 16
  br i1 %30, label %31, label %71

; <label>:31:                                     ; preds = %28
  %32 = load i32, i32* %6, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @base_dither_matrix, i64 0, i64 %33
  %35 = load i32, i32* %7, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [16 x i8], [16 x i8]* %34, i64 0, i64 %36
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = mul nsw i32 2, %39
  %41 = sub nsw i32 255, %40
  %42 = sext i32 %41 to i64
  %43 = mul nsw i64 %42, 255
  store i64 %43, i64* %8, align 8
  %44 = load i64, i64* %8, align 8
  %45 = icmp slt i64 %44, 0
  br i1 %45, label %46, label %53

; <label>:46:                                     ; preds = %31
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_make_odither_array, i64 0, i64 1)
  %47 = add i64 %pgocount, 1
  store i64 %47, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_make_odither_array, i64 0, i64 1)
  %48 = load i64, i64* %8, align 8
  %49 = sub nsw i64 0, %48
  %50 = load i64, i64* %9, align 8
  %51 = sdiv i64 %49, %50
  %52 = sub nsw i64 0, %51
  br label %58

; <label>:53:                                     ; preds = %31
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_make_odither_array, i64 0, i64 0)
  %54 = add i64 %pgocount1, 1
  store i64 %54, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_make_odither_array, i64 0, i64 0)
  %55 = load i64, i64* %8, align 8
  %56 = load i64, i64* %9, align 8
  %57 = sdiv i64 %55, %56
  br label %58

; <label>:58:                                     ; preds = %53, %46
  %59 = phi i64 [ %52, %46 ], [ %57, %53 ]
  %60 = trunc i64 %59 to i32
  %61 = load [16 x i32]*, [16 x i32]** %5, align 8
  %62 = load i32, i32* %6, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [16 x i32], [16 x i32]* %61, i64 %63
  %65 = load i32, i32* %7, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [16 x i32], [16 x i32]* %64, i64 0, i64 %66
  store i32 %60, i32* %67, align 4
  br label %68

; <label>:68:                                     ; preds = %58
  %69 = load i32, i32* %7, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %7, align 4
  br label %28

; <label>:71:                                     ; preds = %28
  br label %72

; <label>:72:                                     ; preds = %71
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_make_odither_array, i64 0, i64 2)
  %73 = add i64 %pgocount2, 1
  store i64 %73, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_make_odither_array, i64 0, i64 2)
  %74 = load i32, i32* %6, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %6, align 4
  br label %24

; <label>:76:                                     ; preds = %24
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_make_odither_array, i64 0, i64 3)
  %77 = add i64 %pgocount3, 1
  store i64 %77, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_make_odither_array, i64 0, i64 3)
  %78 = load [16 x i32]*, [16 x i32]** %5, align 8
  ret [16 x i32]* %78
}

; Function Attrs: nounwind uwtable
define internal i32 @select_ncolors(%struct.jpeg_decompress_struct*, i32*) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store i32* %1, i32** %4, align 8
  %13 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %13, i32 0, i32 28
  %15 = load i32, i32* %14, align 8
  store i32 %15, i32* %5, align 4
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 22
  %18 = load i32, i32* %17, align 8
  store i32 %18, i32* %6, align 4
  store i32 1, i32* %8, align 4
  br label %19

; <label>:19:                                     ; preds = %39, %2
  %20 = load i32, i32* %8, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %8, align 4
  %22 = load i32, i32* %8, align 4
  %23 = sext i32 %22 to i64
  store i64 %23, i64* %12, align 8
  store i32 1, i32* %9, align 4
  br label %24

; <label>:24:                                     ; preds = %33, %19
  %25 = load i32, i32* %9, align 4
  %26 = load i32, i32* %5, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %37

; <label>:28:                                     ; preds = %24
  %29 = load i32, i32* %8, align 4
  %30 = sext i32 %29 to i64
  %31 = load i64, i64* %12, align 8
  %32 = mul nsw i64 %31, %30
  store i64 %32, i64* %12, align 8
  br label %33

; <label>:33:                                     ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 0)
  %34 = add i64 %pgocount, 1
  store i64 %34, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 0)
  %35 = load i32, i32* %9, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %9, align 4
  br label %24

; <label>:37:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 3)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 3)
  br label %39

; <label>:39:                                     ; preds = %37
  %40 = load i64, i64* %12, align 8
  %41 = load i32, i32* %6, align 4
  %42 = sext i32 %41 to i64
  %43 = icmp sle i64 %40, %42
  br i1 %43, label %19, label %44

; <label>:44:                                     ; preds = %39
  %45 = load i32, i32* %8, align 4
  %46 = add nsw i32 %45, -1
  store i32 %46, i32* %8, align 4
  %47 = load i32, i32* %8, align 4
  %48 = icmp slt i32 %47, 2
  br i1 %48, label %49, label %71

; <label>:49:                                     ; preds = %44
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 8)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 8)
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 0
  %53 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %53, i32 0, i32 5
  store i32 55, i32* %54, align 8
  %55 = load i64, i64* %12, align 8
  %56 = trunc i64 %55 to i32
  %57 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %57, i32 0, i32 0
  %59 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %60 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %59, i32 0, i32 6
  %61 = bitcast %union.anon* %60 to [8 x i32]*
  %62 = getelementptr inbounds [8 x i32], [8 x i32]* %61, i64 0, i64 0
  store i32 %56, i32* %62, align 4
  %63 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %63, i32 0, i32 0
  %65 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %64, align 8
  %66 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %65, i32 0, i32 0
  %67 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %66, align 8
  %68 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %69 = bitcast %struct.jpeg_decompress_struct* %68 to %struct.jpeg_common_struct*
  %70 = ptrtoint void (%struct.jpeg_common_struct*)* %67 to i64
  call void @__llvm_profile_instrument_target(i64 %70, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_select_ncolors to i8*), i32 0)
  call void %67(%struct.jpeg_common_struct* %69)
  br label %71

; <label>:71:                                     ; preds = %49, %44
  store i32 1, i32* %7, align 4
  store i32 0, i32* %9, align 4
  br label %72

; <label>:72:                                     ; preds = %85, %71
  %73 = load i32, i32* %9, align 4
  %74 = load i32, i32* %5, align 4
  %75 = icmp slt i32 %73, %74
  br i1 %75, label %76, label %89

; <label>:76:                                     ; preds = %72
  %77 = load i32, i32* %8, align 4
  %78 = load i32*, i32** %4, align 8
  %79 = load i32, i32* %9, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32* %78, i64 %80
  store i32 %77, i32* %81, align 4
  %82 = load i32, i32* %8, align 4
  %83 = load i32, i32* %7, align 4
  %84 = mul nsw i32 %83, %82
  store i32 %84, i32* %7, align 4
  br label %85

; <label>:85:                                     ; preds = %76
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 5)
  %86 = add i64 %pgocount3, 1
  store i64 %86, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 5)
  %87 = load i32, i32* %9, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %9, align 4
  br label %72

; <label>:89:                                     ; preds = %72
  br label %90

; <label>:90:                                     ; preds = %148, %89
  store i32 0, i32* %11, align 4
  store i32 0, i32* %9, align 4
  br label %91

; <label>:91:                                     ; preds = %143, %90
  %92 = load i32, i32* %9, align 4
  %93 = load i32, i32* %5, align 4
  %94 = icmp slt i32 %92, %93
  br i1 %94, label %95, label %146

; <label>:95:                                     ; preds = %91
  %96 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %97 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %96, i32 0, i32 10
  %98 = load i32, i32* %97, align 8
  %99 = icmp eq i32 %98, 2
  br i1 %99, label %100, label %106

; <label>:100:                                    ; preds = %95
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 1)
  %101 = add i64 %pgocount4, 1
  store i64 %101, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 1)
  %102 = load i32, i32* %9, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [3 x i32], [3 x i32]* @select_ncolors.RGB_order, i64 0, i64 %103
  %105 = load i32, i32* %104, align 4
  br label %109

; <label>:106:                                    ; preds = %95
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 2)
  %107 = add i64 %pgocount5, 1
  store i64 %107, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 2)
  %108 = load i32, i32* %9, align 4
  br label %109

; <label>:109:                                    ; preds = %106, %100
  %110 = phi i32 [ %105, %100 ], [ %108, %106 ]
  store i32 %110, i32* %10, align 4
  %111 = load i32, i32* %7, align 4
  %112 = load i32*, i32** %4, align 8
  %113 = load i32, i32* %10, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32* %112, i64 %114
  %116 = load i32, i32* %115, align 4
  %117 = sdiv i32 %111, %116
  %118 = sext i32 %117 to i64
  store i64 %118, i64* %12, align 8
  %119 = load i32*, i32** %4, align 8
  %120 = load i32, i32* %10, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32* %119, i64 %121
  %123 = load i32, i32* %122, align 4
  %124 = add nsw i32 %123, 1
  %125 = sext i32 %124 to i64
  %126 = load i64, i64* %12, align 8
  %127 = mul nsw i64 %126, %125
  store i64 %127, i64* %12, align 8
  %128 = load i64, i64* %12, align 8
  %129 = load i32, i32* %6, align 4
  %130 = sext i32 %129 to i64
  %131 = icmp sgt i64 %128, %130
  br i1 %131, label %132, label %134

; <label>:132:                                    ; preds = %109
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 6)
  %133 = add i64 %pgocount6, 1
  store i64 %133, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 6)
  br label %146

; <label>:134:                                    ; preds = %109
  %135 = load i32*, i32** %4, align 8
  %136 = load i32, i32* %10, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i32, i32* %135, i64 %137
  %139 = load i32, i32* %138, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, i32* %138, align 4
  %141 = load i64, i64* %12, align 8
  %142 = trunc i64 %141 to i32
  store i32 %142, i32* %7, align 4
  store i32 1, i32* %11, align 4
  br label %143

; <label>:143:                                    ; preds = %134
  %144 = load i32, i32* %9, align 4
  %145 = add nsw i32 %144, 1
  store i32 %145, i32* %9, align 4
  br label %91

; <label>:146:                                    ; preds = %132, %91
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 4)
  %147 = add i64 %pgocount7, 1
  store i64 %147, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 4)
  br label %148

; <label>:148:                                    ; preds = %146
  %149 = load i32, i32* %11, align 4
  %150 = icmp ne i32 %149, 0
  br i1 %150, label %90, label %151

; <label>:151:                                    ; preds = %148
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 7)
  %152 = add i64 %pgocount8, 1
  store i64 %152, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_select_ncolors, i64 0, i64 7)
  %153 = load i32, i32* %7, align 4
  ret i32 %153
}

; Function Attrs: nounwind uwtable
define internal i32 @output_value(%struct.jpeg_decompress_struct*, i32, i32, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_output_value, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_output_value, i64 0, i64 0)
  %6 = alloca %struct.jpeg_decompress_struct*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %6, align 8
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  %10 = load i32, i32* %8, align 4
  %11 = sext i32 %10 to i64
  %12 = mul nsw i64 %11, 255
  %13 = load i32, i32* %9, align 4
  %14 = sdiv i32 %13, 2
  %15 = sext i32 %14 to i64
  %16 = add nsw i64 %12, %15
  %17 = load i32, i32* %9, align 4
  %18 = sext i32 %17 to i64
  %19 = sdiv i64 %16, %18
  %20 = trunc i64 %19 to i32
  ret i32 %20
}

; Function Attrs: nounwind uwtable
define internal i32 @largest_input_value(%struct.jpeg_decompress_struct*, i32, i32, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_largest_input_value, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_largest_input_value, i64 0, i64 0)
  %6 = alloca %struct.jpeg_decompress_struct*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %6, align 8
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  %10 = load i32, i32* %8, align 4
  %11 = mul nsw i32 2, %10
  %12 = add nsw i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = mul nsw i64 %13, 255
  %15 = load i32, i32* %9, align 4
  %16 = sext i32 %15 to i64
  %17 = add nsw i64 %14, %16
  %18 = load i32, i32* %9, align 4
  %19 = mul nsw i32 2, %18
  %20 = sext i32 %19 to i64
  %21 = sdiv i64 %17, %20
  %22 = trunc i64 %21 to i32
  ret i32 %22
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

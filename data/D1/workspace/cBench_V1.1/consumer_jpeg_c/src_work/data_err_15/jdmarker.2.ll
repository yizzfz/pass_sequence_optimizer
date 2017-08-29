; ModuleID = 'tmp1.ll'
source_filename = "jdmarker.c"
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
%struct.jpeg_source_mgr = type { i8*, i64, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, {}*, void (%struct.jpeg_decompress_struct*)* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.jpeg_decomp_master = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32 }
%struct.jpeg_d_main_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* }
%struct.jpeg_d_coef_controller = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, i8***)*, %struct.jvirt_barray_control** }
%struct.jpeg_d_post_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* }
%struct.jpeg_input_controller = type { i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32, i32 }
%struct.jpeg_marker_reader = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, [16 x i32 (%struct.jpeg_decompress_struct*)*], i32, i32, i32, i32 }
%struct.jpeg_entropy_decoder = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* }
%struct.jpeg_inverse_dct = type { void (%struct.jpeg_decompress_struct*)*, [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*] }
%struct.jpeg_upsampler = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, i32 }
%struct.jpeg_color_deconverter = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* }
%struct.jpeg_color_quantizer = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)* }

$__llvm_profile_raw_version = comdat any

@jpeg_natural_order = external constant [0 x i32], align 4
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_resync_to_restart = private constant [22 x i8] c"jpeg_resync_to_restart"
@__profn_tmp1.ll_next_marker = private constant [19 x i8] c"tmp1.ll:next_marker"
@__profn_jinit_marker_reader = private constant [19 x i8] c"jinit_marker_reader"
@__profn_tmp1.ll_reset_marker_reader = private constant [27 x i8] c"tmp1.ll:reset_marker_reader"
@__profn_tmp1.ll_read_markers = private constant [20 x i8] c"tmp1.ll:read_markers"
@__profn_tmp1.ll_read_restart_marker = private constant [27 x i8] c"tmp1.ll:read_restart_marker"
@__profn_tmp1.ll_skip_variable = private constant [21 x i8] c"tmp1.ll:skip_variable"
@__profn_tmp1.ll_get_app0 = private constant [16 x i8] c"tmp1.ll:get_app0"
@__profn_tmp1.ll_get_app14 = private constant [17 x i8] c"tmp1.ll:get_app14"
@__profn_tmp1.ll_first_marker = private constant [20 x i8] c"tmp1.ll:first_marker"
@__profn_tmp1.ll_get_soi = private constant [15 x i8] c"tmp1.ll:get_soi"
@__profn_tmp1.ll_get_sof = private constant [15 x i8] c"tmp1.ll:get_sof"
@__profn_tmp1.ll_get_sos = private constant [15 x i8] c"tmp1.ll:get_sos"
@__profn_tmp1.ll_get_dac = private constant [15 x i8] c"tmp1.ll:get_dac"
@__profn_tmp1.ll_get_dht = private constant [15 x i8] c"tmp1.ll:get_dht"
@__profn_tmp1.ll_get_dqt = private constant [15 x i8] c"tmp1.ll:get_dqt"
@__profn_tmp1.ll_get_dri = private constant [15 x i8] c"tmp1.ll:get_dri"
@__profc_jpeg_resync_to_restart = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_resync_to_restart = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_resync_to_restart = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1305038538075872199, i64 563105992370666, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*, i32)* @jpeg_resync_to_restart to i8*), i8* bitcast ([2 x i64]* @__profvp_jpeg_resync_to_restart to i8*), i32 12, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_next_marker = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_next_marker = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_next_marker = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3851945953294265519, i64 1126088660654600, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i32 0, i32 0), i8* null, i8* bitcast ([4 x i64]* @__profvp_tmp1.ll_next_marker to i8*), i32 11, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_jinit_marker_reader = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_marker_reader = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_marker_reader = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2121387850653387949, i64 281509114370972, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_marker_reader, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @jinit_marker_reader to i8*), i8* bitcast ([1 x i64]* @__profvp_jinit_marker_reader to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_reset_marker_reader = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_reset_marker_reader = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7424041799071739951, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_reset_marker_reader, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @reset_marker_reader to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_markers = private global [66 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_read_markers = private global [6 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_read_markers = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1280670572737445423, i64 1689377249018713, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*)* @read_markers to i8*), i8* bitcast ([6 x i64]* @__profvp_tmp1.ll_read_markers to i8*), i32 66, [1 x i16] [i16 6] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_restart_marker = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_read_restart_marker = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_read_restart_marker = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5730286471697346274, i64 563022269235211, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_restart_marker, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*)* @read_restart_marker to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_read_restart_marker to i8*), i32 5, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_skip_variable = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_skip_variable = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_skip_variable = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6360951679601376574, i64 1125974637768702, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_skip_variable, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*)* @skip_variable to i8*), i8* bitcast ([4 x i64]* @__profvp_tmp1.ll_skip_variable to i8*), i32 5, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_app0 = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_app0 = private global [11 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_app0 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2899209283846704495, i64 3096500276072405, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*)* @get_app0 to i8*), i8* bitcast ([11 x i64]* @__profvp_tmp1.ll_get_app0 to i8*), i32 19, [1 x i16] [i16 11] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_app14 = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_app14 = private global [7 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_app14 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6958520990385779297, i64 1970546338480016, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*)* @get_app14 to i8*), i8* bitcast ([7 x i64]* @__profvp_tmp1.ll_get_app14 to i8*), i32 15, [1 x i16] [i16 7] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_first_marker = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_first_marker = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_first_marker = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3598035885737693165, i64 844528693091318, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_first_marker, i32 0, i32 0), i8* null, i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_first_marker to i8*), i32 7, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_soi = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_soi = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_soi = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5088799950124029590, i64 562996575077545, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_soi, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_get_soi to i8*), i32 3, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_sof = private global [30 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_sof = private global [17 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_sof = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 490484929305267429, i64 4785548147652059, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i32 0, i32 0), i8* null, i8* bitcast ([17 x i64]* @__profvp_tmp1.ll_get_sof to i8*), i32 30, [1 x i16] [i16 17] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_sos = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_sos = private global [14 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_sos = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4135544087309234337, i64 3941052556212019, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i32 0, i32 0), i8* null, i8* bitcast ([14 x i64]* @__profvp_tmp1.ll_get_sos to i8*), i32 24, [1 x i16] [i16 14] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_dac = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_dac = private global [7 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_dac = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7730805177598911989, i64 1970538019045801, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i32 0, i32 0), i8* null, i8* bitcast ([7 x i64]* @__profvp_tmp1.ll_get_dac to i8*), i32 14, [1 x i16] [i16 7] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_dht = private global [20 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_dht = private global [10 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_dht = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7812503880520732534, i64 2815078896661240, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i32 0, i32 0), i8* null, i8* bitcast ([10 x i64]* @__profvp_tmp1.ll_get_dht to i8*), i32 20, [1 x i16] [i16 10] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_dqt = private global [21 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_dqt = private global [9 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_dqt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 340827587215630587, i64 2533617597398752, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i32 0, i32 0), i8* null, i8* bitcast ([9 x i64]* @__profvp_tmp1.ll_get_dqt to i8*), i32 21, [1 x i16] [i16 9] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_dri = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_dri = private global [6 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_dri = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7681206643258889482, i64 1688997209902955, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i32 0, i32 0), i8* null, i8* bitcast ([6 x i64]* @__profvp_tmp1.ll_get_dri to i8*), i32 10, [1 x i16] [i16 6] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [105 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [332 x i8] c"\C9\02\00jpeg_resync_to_restart\01tmp1.ll:next_marker\01jinit_marker_reader\01tmp1.ll:reset_marker_reader\01tmp1.ll:read_markers\01tmp1.ll:read_restart_marker\01tmp1.ll:skip_variable\01tmp1.ll:get_app0\01tmp1.ll:get_app14\01tmp1.ll:first_marker\01tmp1.ll:get_soi\01tmp1.ll:get_sof\01tmp1.ll:get_sos\01tmp1.ll:get_dac\01tmp1.ll:get_dht\01tmp1.ll:get_dqt\01tmp1.ll:get_dri", section "__llvm_prf_names"
@llvm.used = appending global [19 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_resync_to_restart to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_next_marker to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_marker_reader to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_reset_marker_reader to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_markers to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_restart_marker to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_skip_variable to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app0 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app14 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_first_marker to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_soi to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sos to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dac to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dht to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dqt to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dri to i8*), i8* bitcast ([105 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([332 x i8], [332 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_resync_to_restart(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store i32 %1, i32* %5, align 4
  %8 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %8, i32 0, i32 72
  %10 = load i32, i32* %9, align 4
  store i32 %10, i32* %6, align 4
  store i32 1, i32* %7, align 4
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %11, i32 0, i32 0
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i32 0, i32 5
  store i32 117, i32* %14, align 8
  %15 = load i32, i32* %6, align 4
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 0
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i32 0, i32 6
  %20 = bitcast %union.anon* %19 to [8 x i32]*
  %21 = getelementptr inbounds [8 x i32], [8 x i32]* %20, i64 0, i64 0
  store i32 %15, i32* %21, align 4
  %22 = load i32, i32* %5, align 4
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %23, i32 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i32 0, i32 6
  %27 = bitcast %union.anon* %26 to [8 x i32]*
  %28 = getelementptr inbounds [8 x i32], [8 x i32]* %27, i64 0, i64 1
  store i32 %22, i32* %28, align 4
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %29, i32 0, i32 0
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i32 0, i32 1
  %33 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %32, align 8
  %34 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %35 = bitcast %struct.jpeg_decompress_struct* %34 to %struct.jpeg_common_struct*
  %36 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %33 to i64
  call void @__llvm_profile_instrument_target(i64 %36, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_resync_to_restart to i8*), i32 0)
  call void %33(%struct.jpeg_common_struct* %35, i32 -1)
  br label %37

; <label>:37:                                     ; preds = %135, %2
  %38 = load i32, i32* %6, align 4
  %39 = icmp slt i32 %38, 192
  br i1 %39, label %40, label %42

; <label>:40:                                     ; preds = %37
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 0)
  %41 = add i64 %pgocount, 1
  store i64 %41, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 0)
  store i32 2, i32* %7, align 4
  br label %90

; <label>:42:                                     ; preds = %37
  %43 = load i32, i32* %6, align 4
  %44 = icmp slt i32 %43, 208
  br i1 %44, label %49, label %45

; <label>:45:                                     ; preds = %42
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 3)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 3)
  %47 = load i32, i32* %6, align 4
  %48 = icmp sgt i32 %47, 215
  br i1 %48, label %49, label %51

; <label>:49:                                     ; preds = %45, %42
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 2)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 2)
  store i32 3, i32* %7, align 4
  br label %89

; <label>:51:                                     ; preds = %45
  %52 = load i32, i32* %6, align 4
  %53 = load i32, i32* %5, align 4
  %54 = add nsw i32 %53, 1
  %55 = and i32 %54, 7
  %56 = add nsw i32 208, %55
  %57 = icmp eq i32 %52, %56
  br i1 %57, label %66, label %58

; <label>:58:                                     ; preds = %51
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 5)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 5)
  %60 = load i32, i32* %6, align 4
  %61 = load i32, i32* %5, align 4
  %62 = add nsw i32 %61, 2
  %63 = and i32 %62, 7
  %64 = add nsw i32 208, %63
  %65 = icmp eq i32 %60, %64
  br i1 %65, label %66, label %68

; <label>:66:                                     ; preds = %58, %51
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 4)
  %67 = add i64 %pgocount4, 1
  store i64 %67, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 4)
  store i32 3, i32* %7, align 4
  br label %88

; <label>:68:                                     ; preds = %58
  %69 = load i32, i32* %6, align 4
  %70 = load i32, i32* %5, align 4
  %71 = sub nsw i32 %70, 1
  %72 = and i32 %71, 7
  %73 = add nsw i32 208, %72
  %74 = icmp eq i32 %69, %73
  br i1 %74, label %83, label %75

; <label>:75:                                     ; preds = %68
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 7)
  %76 = add i64 %pgocount5, 1
  store i64 %76, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 7)
  %77 = load i32, i32* %6, align 4
  %78 = load i32, i32* %5, align 4
  %79 = sub nsw i32 %78, 2
  %80 = and i32 %79, 7
  %81 = add nsw i32 208, %80
  %82 = icmp eq i32 %77, %81
  br i1 %82, label %83, label %85

; <label>:83:                                     ; preds = %75, %68
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 6)
  %84 = add i64 %pgocount6, 1
  store i64 %84, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 6)
  store i32 2, i32* %7, align 4
  br label %87

; <label>:85:                                     ; preds = %75
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 11)
  %86 = add i64 %pgocount7, 1
  store i64 %86, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 11)
  store i32 1, i32* %7, align 4
  br label %87

; <label>:87:                                     ; preds = %85, %83
  br label %88

; <label>:88:                                     ; preds = %87, %66
  br label %89

; <label>:89:                                     ; preds = %88, %49
  br label %90

; <label>:90:                                     ; preds = %89, %40
  %91 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %92 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %91, i32 0, i32 0
  %93 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %92, align 8
  %94 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %93, i32 0, i32 5
  store i32 96, i32* %94, align 8
  %95 = load i32, i32* %6, align 4
  %96 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %97 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %96, i32 0, i32 0
  %98 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %97, align 8
  %99 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i32 0, i32 6
  %100 = bitcast %union.anon* %99 to [8 x i32]*
  %101 = getelementptr inbounds [8 x i32], [8 x i32]* %100, i64 0, i64 0
  store i32 %95, i32* %101, align 4
  %102 = load i32, i32* %7, align 4
  %103 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %104 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %103, i32 0, i32 0
  %105 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %104, align 8
  %106 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %105, i32 0, i32 6
  %107 = bitcast %union.anon* %106 to [8 x i32]*
  %108 = getelementptr inbounds [8 x i32], [8 x i32]* %107, i64 0, i64 1
  store i32 %102, i32* %108, align 4
  %109 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %110 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %109, i32 0, i32 0
  %111 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %110, align 8
  %112 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %111, i32 0, i32 1
  %113 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %112, align 8
  %114 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %115 = bitcast %struct.jpeg_decompress_struct* %114 to %struct.jpeg_common_struct*
  %116 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %113 to i64
  call void @__llvm_profile_instrument_target(i64 %116, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_resync_to_restart to i8*), i32 1)
  call void %113(%struct.jpeg_common_struct* %115, i32 4)
  %117 = load i32, i32* %7, align 4
  switch i32 %117, label %135 [
    i32 1, label %118
    i32 2, label %122
    i32 3, label %133
  ]

; <label>:118:                                    ; preds = %90
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 8)
  %119 = add i64 %pgocount8, 1
  store i64 %119, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 8)
  %120 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %121 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %120, i32 0, i32 72
  store i32 0, i32* %121, align 4
  store i32 1, i32* %3, align 4
  br label %136

; <label>:122:                                    ; preds = %90
  %123 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %124 = call i32 @next_marker(%struct.jpeg_decompress_struct* %123)
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %128, label %126

; <label>:126:                                    ; preds = %122
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 9)
  %127 = add i64 %pgocount9, 1
  store i64 %127, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 9)
  store i32 0, i32* %3, align 4
  br label %136

; <label>:128:                                    ; preds = %122
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 1)
  %129 = add i64 %pgocount10, 1
  store i64 %129, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 1)
  %130 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %131 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %130, i32 0, i32 72
  %132 = load i32, i32* %131, align 4
  store i32 %132, i32* %6, align 4
  br label %135

; <label>:133:                                    ; preds = %90
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 10)
  %134 = add i64 %pgocount11, 1
  store i64 %134, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_resync_to_restart, i64 0, i64 10)
  store i32 1, i32* %3, align 4
  br label %136

; <label>:135:                                    ; preds = %128, %90
  br label %37

; <label>:136:                                    ; preds = %133, %126, %118
  %137 = load i32, i32* %3, align 4
  ret i32 %137
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @next_marker(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.jpeg_source_mgr*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %8 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %8, i32 0, i32 5
  %10 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %9, align 8
  store %struct.jpeg_source_mgr* %10, %struct.jpeg_source_mgr** %5, align 8
  %11 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %12 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %11, i32 0, i32 0
  %13 = load i8*, i8** %12, align 8
  store i8* %13, i8** %6, align 8
  %14 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %15 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %14, i32 0, i32 1
  %16 = load i64, i64* %15, align 8
  store i64 %16, i64* %7, align 8
  br label %17

; <label>:17:                                     ; preds = %132, %1
  br label %18

; <label>:18:                                     ; preds = %17
  %19 = load i64, i64* %7, align 8
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %21, label %39

; <label>:21:                                     ; preds = %18
  %22 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %23 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %22, i32 0, i32 3
  %24 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %23, align 8
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %26 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %24 to i64
  call void @__llvm_profile_instrument_target(i64 %26, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_next_marker to i8*), i32 0)
  %27 = call i32 %24(%struct.jpeg_decompress_struct* %25)
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %31, label %29

; <label>:29:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 9)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 9)
  store i32 0, i32* %2, align 4
  br label %200

; <label>:31:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 5)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 5)
  %33 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %34 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %33, i32 0, i32 0
  %35 = load i8*, i8** %34, align 8
  store i8* %35, i8** %6, align 8
  %36 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %37 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %36, i32 0, i32 1
  %38 = load i64, i64* %37, align 8
  store i64 %38, i64* %7, align 8
  br label %39

; <label>:39:                                     ; preds = %31, %18
  %40 = load i64, i64* %7, align 8
  %41 = add i64 %40, -1
  store i64 %41, i64* %7, align 8
  %42 = load i8*, i8** %6, align 8
  %43 = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %43, i8** %6, align 8
  %44 = load i8, i8* %42, align 1
  %45 = zext i8 %44 to i32
  store i32 %45, i32* %4, align 4
  br label %46

; <label>:46:                                     ; preds = %39
  br label %47

; <label>:47:                                     ; preds = %91, %46
  %48 = load i32, i32* %4, align 4
  %49 = icmp ne i32 %48, 255
  br i1 %49, label %50, label %93

; <label>:50:                                     ; preds = %47
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 78
  %53 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %53, i32 0, i32 8
  %55 = load i32, i32* %54, align 4
  %56 = add i32 %55, 1
  store i32 %56, i32* %54, align 4
  %57 = load i8*, i8** %6, align 8
  %58 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %59 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %58, i32 0, i32 0
  store i8* %57, i8** %59, align 8
  %60 = load i64, i64* %7, align 8
  %61 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %62 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %61, i32 0, i32 1
  store i64 %60, i64* %62, align 8
  br label %63

; <label>:63:                                     ; preds = %50
  %64 = load i64, i64* %7, align 8
  %65 = icmp eq i64 %64, 0
  br i1 %65, label %66, label %84

; <label>:66:                                     ; preds = %63
  %67 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %68 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %67, i32 0, i32 3
  %69 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %68, align 8
  %70 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %71 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %69 to i64
  call void @__llvm_profile_instrument_target(i64 %71, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_next_marker to i8*), i32 1)
  %72 = call i32 %69(%struct.jpeg_decompress_struct* %70)
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %76, label %74

; <label>:74:                                     ; preds = %66
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 6)
  %75 = add i64 %pgocount2, 1
  store i64 %75, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 6)
  store i32 0, i32* %2, align 4
  br label %200

; <label>:76:                                     ; preds = %66
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 2)
  %77 = add i64 %pgocount3, 1
  store i64 %77, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 2)
  %78 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %79 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %78, i32 0, i32 0
  %80 = load i8*, i8** %79, align 8
  store i8* %80, i8** %6, align 8
  %81 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %82 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %81, i32 0, i32 1
  %83 = load i64, i64* %82, align 8
  store i64 %83, i64* %7, align 8
  br label %84

; <label>:84:                                     ; preds = %76, %63
  %85 = load i64, i64* %7, align 8
  %86 = add i64 %85, -1
  store i64 %86, i64* %7, align 8
  %87 = load i8*, i8** %6, align 8
  %88 = getelementptr inbounds i8, i8* %87, i32 1
  store i8* %88, i8** %6, align 8
  %89 = load i8, i8* %87, align 1
  %90 = zext i8 %89 to i32
  store i32 %90, i32* %4, align 4
  br label %91

; <label>:91:                                     ; preds = %84
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 0)
  %92 = add i64 %pgocount4, 1
  store i64 %92, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 0)
  br label %47

; <label>:93:                                     ; preds = %47
  br label %94

; <label>:94:                                     ; preds = %125, %93
  br label %95

; <label>:95:                                     ; preds = %94
  %96 = load i64, i64* %7, align 8
  %97 = icmp eq i64 %96, 0
  br i1 %97, label %98, label %116

; <label>:98:                                     ; preds = %95
  %99 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %100 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %99, i32 0, i32 3
  %101 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %100, align 8
  %102 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %103 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %101 to i64
  call void @__llvm_profile_instrument_target(i64 %103, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_next_marker to i8*), i32 2)
  %104 = call i32 %101(%struct.jpeg_decompress_struct* %102)
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %108, label %106

; <label>:106:                                    ; preds = %98
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 7)
  %107 = add i64 %pgocount5, 1
  store i64 %107, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 7)
  store i32 0, i32* %2, align 4
  br label %200

; <label>:108:                                    ; preds = %98
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 3)
  %109 = add i64 %pgocount6, 1
  store i64 %109, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 3)
  %110 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %111 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %110, i32 0, i32 0
  %112 = load i8*, i8** %111, align 8
  store i8* %112, i8** %6, align 8
  %113 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %114 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %113, i32 0, i32 1
  %115 = load i64, i64* %114, align 8
  store i64 %115, i64* %7, align 8
  br label %116

; <label>:116:                                    ; preds = %108, %95
  %117 = load i64, i64* %7, align 8
  %118 = add i64 %117, -1
  store i64 %118, i64* %7, align 8
  %119 = load i8*, i8** %6, align 8
  %120 = getelementptr inbounds i8, i8* %119, i32 1
  store i8* %120, i8** %6, align 8
  %121 = load i8, i8* %119, align 1
  %122 = zext i8 %121 to i32
  store i32 %122, i32* %4, align 4
  br label %123

; <label>:123:                                    ; preds = %116
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 1)
  %124 = add i64 %pgocount7, 1
  store i64 %124, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 1)
  br label %125

; <label>:125:                                    ; preds = %123
  %126 = load i32, i32* %4, align 4
  %127 = icmp eq i32 %126, 255
  br i1 %127, label %94, label %128

; <label>:128:                                    ; preds = %125
  %129 = load i32, i32* %4, align 4
  %130 = icmp ne i32 %129, 0
  br i1 %130, label %131, label %132

; <label>:131:                                    ; preds = %128
  br label %146

; <label>:132:                                    ; preds = %128
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 4)
  %133 = add i64 %pgocount8, 1
  store i64 %133, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 4)
  %134 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %135 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %134, i32 0, i32 78
  %136 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %135, align 8
  %137 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %136, i32 0, i32 8
  %138 = load i32, i32* %137, align 4
  %139 = add i32 %138, 2
  store i32 %139, i32* %137, align 4
  %140 = load i8*, i8** %6, align 8
  %141 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %142 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %141, i32 0, i32 0
  store i8* %140, i8** %142, align 8
  %143 = load i64, i64* %7, align 8
  %144 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %145 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %144, i32 0, i32 1
  store i64 %143, i64* %145, align 8
  br label %17

; <label>:146:                                    ; preds = %131
  %147 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %148 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %147, i32 0, i32 78
  %149 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %148, align 8
  %150 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %149, i32 0, i32 8
  %151 = load i32, i32* %150, align 4
  %152 = icmp ne i32 %151, 0
  br i1 %152, label %153, label %189

; <label>:153:                                    ; preds = %146
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 10)
  %154 = add i64 %pgocount9, 1
  store i64 %154, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 10)
  %155 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %156 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %155, i32 0, i32 0
  %157 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %156, align 8
  %158 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %157, i32 0, i32 5
  store i32 112, i32* %158, align 8
  %159 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %160 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %159, i32 0, i32 78
  %161 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %160, align 8
  %162 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %161, i32 0, i32 8
  %163 = load i32, i32* %162, align 4
  %164 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %165 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %164, i32 0, i32 0
  %166 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %165, align 8
  %167 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %166, i32 0, i32 6
  %168 = bitcast %union.anon* %167 to [8 x i32]*
  %169 = getelementptr inbounds [8 x i32], [8 x i32]* %168, i64 0, i64 0
  store i32 %163, i32* %169, align 4
  %170 = load i32, i32* %4, align 4
  %171 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %172 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %171, i32 0, i32 0
  %173 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %172, align 8
  %174 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %173, i32 0, i32 6
  %175 = bitcast %union.anon* %174 to [8 x i32]*
  %176 = getelementptr inbounds [8 x i32], [8 x i32]* %175, i64 0, i64 1
  store i32 %170, i32* %176, align 4
  %177 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %178 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %177, i32 0, i32 0
  %179 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %178, align 8
  %180 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %179, i32 0, i32 1
  %181 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %180, align 8
  %182 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %183 = bitcast %struct.jpeg_decompress_struct* %182 to %struct.jpeg_common_struct*
  %184 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %181 to i64
  call void @__llvm_profile_instrument_target(i64 %184, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_next_marker to i8*), i32 3)
  call void %181(%struct.jpeg_common_struct* %183, i32 -1)
  %185 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %186 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %185, i32 0, i32 78
  %187 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %186, align 8
  %188 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %187, i32 0, i32 8
  store i32 0, i32* %188, align 4
  br label %189

; <label>:189:                                    ; preds = %153, %146
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 8)
  %190 = add i64 %pgocount10, 1
  store i64 %190, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_next_marker, i64 0, i64 8)
  %191 = load i32, i32* %4, align 4
  %192 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %193 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %192, i32 0, i32 72
  store i32 %191, i32* %193, align 4
  %194 = load i8*, i8** %6, align 8
  %195 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %196 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %195, i32 0, i32 0
  store i8* %194, i8** %196, align 8
  %197 = load i64, i64* %7, align 8
  %198 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %199 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %198, i32 0, i32 1
  store i64 %197, i64* %199, align 8
  store i32 1, i32* %2, align 4
  br label %200

; <label>:200:                                    ; preds = %189, %106, %74, %29
  %201 = load i32, i32* %2, align 4
  ret i32 %201
}

; Function Attrs: noinline nounwind uwtable
define void @jinit_marker_reader(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 1
  %6 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %6, i32 0, i32 0
  %8 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %7, align 8
  %9 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %10 = bitcast %struct.jpeg_decompress_struct* %9 to %struct.jpeg_common_struct*
  %11 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %8 to i64
  call void @__llvm_profile_instrument_target(i64 %11, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_marker_reader to i8*), i32 0)
  %12 = call i8* %8(%struct.jpeg_common_struct* %10, i32 0, i64 176)
  %13 = bitcast i8* %12 to %struct.jpeg_marker_reader*
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 78
  store %struct.jpeg_marker_reader* %13, %struct.jpeg_marker_reader** %15, align 8
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 78
  %18 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %18, i32 0, i32 0
  store void (%struct.jpeg_decompress_struct*)* @reset_marker_reader, void (%struct.jpeg_decompress_struct*)** %19, align 8
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %20, i32 0, i32 78
  %22 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %22, i32 0, i32 1
  store i32 (%struct.jpeg_decompress_struct*)* @read_markers, i32 (%struct.jpeg_decompress_struct*)** %23, align 8
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 78
  %26 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %26, i32 0, i32 2
  store i32 (%struct.jpeg_decompress_struct*)* @read_restart_marker, i32 (%struct.jpeg_decompress_struct*)** %27, align 8
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %28, i32 0, i32 78
  %30 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %30, i32 0, i32 3
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %31, align 8
  store i32 0, i32* %3, align 4
  br label %32

; <label>:32:                                     ; preds = %43, %1
  %33 = load i32, i32* %3, align 4
  %34 = icmp slt i32 %33, 16
  br i1 %34, label %35, label %47

; <label>:35:                                     ; preds = %32
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 78
  %38 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %37, align 8
  %39 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %38, i32 0, i32 4
  %40 = load i32, i32* %3, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [16 x i32 (%struct.jpeg_decompress_struct*)*], [16 x i32 (%struct.jpeg_decompress_struct*)*]* %39, i64 0, i64 %41
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %42, align 8
  br label %43

; <label>:43:                                     ; preds = %35
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_marker_reader, i64 0, i64 0)
  %44 = add i64 %pgocount, 1
  store i64 %44, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_marker_reader, i64 0, i64 0)
  %45 = load i32, i32* %3, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %3, align 4
  br label %32

; <label>:47:                                     ; preds = %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_marker_reader, i64 0, i64 1)
  %48 = add i64 %pgocount1, 1
  store i64 %48, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_marker_reader, i64 0, i64 1)
  %49 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %50 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %49, i32 0, i32 78
  %51 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %50, align 8
  %52 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %51, i32 0, i32 4
  %53 = getelementptr inbounds [16 x i32 (%struct.jpeg_decompress_struct*)*], [16 x i32 (%struct.jpeg_decompress_struct*)*]* %52, i64 0, i64 0
  store i32 (%struct.jpeg_decompress_struct*)* @get_app0, i32 (%struct.jpeg_decompress_struct*)** %53, align 8
  %54 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %55 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %54, i32 0, i32 78
  %56 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %55, align 8
  %57 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %56, i32 0, i32 4
  %58 = getelementptr inbounds [16 x i32 (%struct.jpeg_decompress_struct*)*], [16 x i32 (%struct.jpeg_decompress_struct*)*]* %57, i64 0, i64 14
  store i32 (%struct.jpeg_decompress_struct*)* @get_app14, i32 (%struct.jpeg_decompress_struct*)** %58, align 8
  %59 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @reset_marker_reader(%struct.jpeg_decompress_struct* %59)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @reset_marker_reader(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_reset_marker_reader, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_reset_marker_reader, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 43
  store %struct.jpeg_component_info* null, %struct.jpeg_component_info** %5, align 8
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %6, i32 0, i32 34
  store i32 0, i32* %7, align 4
  %8 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %8, i32 0, i32 72
  store i32 0, i32* %9, align 4
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %10, i32 0, i32 78
  %12 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %12, i32 0, i32 5
  store i32 0, i32* %13, align 8
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 78
  %16 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %16, i32 0, i32 6
  store i32 0, i32* %17, align 4
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 78
  %20 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %20, i32 0, i32 8
  store i32 0, i32* %21, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @read_markers(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  br label %4

; <label>:4:                                      ; preds = %278, %1
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 72
  %7 = load i32, i32* %6, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %33

; <label>:9:                                      ; preds = %4
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %10, i32 0, i32 78
  %12 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %12, i32 0, i32 5
  %14 = load i32, i32* %13, align 8
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %24, label %16

; <label>:16:                                     ; preds = %9
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %18 = call i32 @first_marker(%struct.jpeg_decompress_struct* %17)
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %16
  %pgocount = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 54)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 54)
  store i32 0, i32* %2, align 4
  br label %281

; <label>:22:                                     ; preds = %16
  %pgocount32 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 36)
  %23 = add i64 %pgocount32, 1
  store i64 %23, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 36)
  br label %32

; <label>:24:                                     ; preds = %9
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %26 = call i32 @next_marker(%struct.jpeg_decompress_struct* %25)
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %30, label %28

; <label>:28:                                     ; preds = %24
  %pgocount33 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 52)
  %29 = add i64 %pgocount33, 1
  store i64 %29, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 52)
  store i32 0, i32* %2, align 4
  br label %281

; <label>:30:                                     ; preds = %24
  %pgocount34 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 33)
  %31 = add i64 %pgocount34, 1
  store i64 %31, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 33)
  br label %32

; <label>:32:                                     ; preds = %30, %22
  br label %33

; <label>:33:                                     ; preds = %32, %4
  %34 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %34, i32 0, i32 72
  %36 = load i32, i32* %35, align 4
  switch i32 %36, label %255 [
    i32 216, label %69
    i32 192, label %._crit_edge31
    i32 193, label %77
    i32 194, label %85
    i32 201, label %93
    i32 202, label %101
    i32 195, label %._crit_edge15
    i32 197, label %._crit_edge16
    i32 198, label %._crit_edge17
    i32 199, label %._crit_edge18
    i32 200, label %._crit_edge19
    i32 203, label %._crit_edge20
    i32 205, label %._crit_edge21
    i32 206, label %._crit_edge22
    i32 207, label %109
    i32 218, label %132
    i32 217, label %142
    i32 204, label %158
    i32 196, label %166
    i32 219, label %174
    i32 221, label %182
    i32 224, label %._crit_edge
    i32 225, label %._crit_edge1
    i32 226, label %._crit_edge2
    i32 227, label %._crit_edge3
    i32 228, label %._crit_edge4
    i32 229, label %._crit_edge5
    i32 230, label %._crit_edge6
    i32 231, label %._crit_edge7
    i32 232, label %._crit_edge8
    i32 233, label %._crit_edge9
    i32 234, label %._crit_edge10
    i32 235, label %._crit_edge11
    i32 236, label %._crit_edge12
    i32 237, label %._crit_edge13
    i32 238, label %._crit_edge14
    i32 239, label %190
    i32 254, label %210
    i32 208, label %._crit_edge23
    i32 209, label %._crit_edge24
    i32 210, label %._crit_edge25
    i32 211, label %._crit_edge26
    i32 212, label %._crit_edge27
    i32 213, label %._crit_edge28
    i32 214, label %._crit_edge29
    i32 215, label %._crit_edge30
    i32 1, label %224
    i32 220, label %247
  ]

._crit_edge31:                                    ; preds = %33
  %pgocount35 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 31)
  %37 = add i64 %pgocount35, 1
  store i64 %37, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 31)
  br label %77

._crit_edge30:                                    ; preds = %33
  %pgocount36 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 30)
  %38 = add i64 %pgocount36, 1
  store i64 %38, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 30)
  br label %224

._crit_edge29:                                    ; preds = %33
  %pgocount37 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 29)
  %39 = add i64 %pgocount37, 1
  store i64 %39, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 29)
  br label %224

._crit_edge28:                                    ; preds = %33
  %pgocount38 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 28)
  %40 = add i64 %pgocount38, 1
  store i64 %40, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 28)
  br label %224

._crit_edge27:                                    ; preds = %33
  %pgocount39 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 27)
  %41 = add i64 %pgocount39, 1
  store i64 %41, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 27)
  br label %224

._crit_edge26:                                    ; preds = %33
  %pgocount40 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 26)
  %42 = add i64 %pgocount40, 1
  store i64 %42, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 26)
  br label %224

._crit_edge25:                                    ; preds = %33
  %pgocount41 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 25)
  %43 = add i64 %pgocount41, 1
  store i64 %43, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 25)
  br label %224

._crit_edge24:                                    ; preds = %33
  %pgocount42 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 24)
  %44 = add i64 %pgocount42, 1
  store i64 %44, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 24)
  br label %224

._crit_edge23:                                    ; preds = %33
  %pgocount43 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 23)
  %45 = add i64 %pgocount43, 1
  store i64 %45, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 23)
  br label %224

._crit_edge22:                                    ; preds = %33
  %pgocount44 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 22)
  %46 = add i64 %pgocount44, 1
  store i64 %46, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 22)
  br label %109

._crit_edge21:                                    ; preds = %33
  %pgocount45 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 21)
  %47 = add i64 %pgocount45, 1
  store i64 %47, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 21)
  br label %109

._crit_edge20:                                    ; preds = %33
  %pgocount46 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 20)
  %48 = add i64 %pgocount46, 1
  store i64 %48, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 20)
  br label %109

._crit_edge19:                                    ; preds = %33
  %pgocount47 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 19)
  %49 = add i64 %pgocount47, 1
  store i64 %49, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 19)
  br label %109

._crit_edge18:                                    ; preds = %33
  %pgocount48 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 18)
  %50 = add i64 %pgocount48, 1
  store i64 %50, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 18)
  br label %109

._crit_edge17:                                    ; preds = %33
  %pgocount49 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 17)
  %51 = add i64 %pgocount49, 1
  store i64 %51, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 17)
  br label %109

._crit_edge16:                                    ; preds = %33
  %pgocount50 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 16)
  %52 = add i64 %pgocount50, 1
  store i64 %52, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 16)
  br label %109

._crit_edge15:                                    ; preds = %33
  %pgocount51 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 15)
  %53 = add i64 %pgocount51, 1
  store i64 %53, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 15)
  br label %109

._crit_edge14:                                    ; preds = %33
  %pgocount52 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 14)
  %54 = add i64 %pgocount52, 1
  store i64 %54, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 14)
  br label %190

._crit_edge13:                                    ; preds = %33
  %pgocount53 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 13)
  %55 = add i64 %pgocount53, 1
  store i64 %55, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 13)
  br label %190

._crit_edge12:                                    ; preds = %33
  %pgocount54 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 12)
  %56 = add i64 %pgocount54, 1
  store i64 %56, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 12)
  br label %190

._crit_edge11:                                    ; preds = %33
  %pgocount55 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 11)
  %57 = add i64 %pgocount55, 1
  store i64 %57, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 11)
  br label %190

._crit_edge10:                                    ; preds = %33
  %pgocount56 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 10)
  %58 = add i64 %pgocount56, 1
  store i64 %58, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 10)
  br label %190

._crit_edge9:                                     ; preds = %33
  %pgocount57 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 9)
  %59 = add i64 %pgocount57, 1
  store i64 %59, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 9)
  br label %190

._crit_edge8:                                     ; preds = %33
  %pgocount58 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 8)
  %60 = add i64 %pgocount58, 1
  store i64 %60, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 8)
  br label %190

._crit_edge7:                                     ; preds = %33
  %pgocount59 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 7)
  %61 = add i64 %pgocount59, 1
  store i64 %61, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 7)
  br label %190

._crit_edge6:                                     ; preds = %33
  %pgocount60 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 6)
  %62 = add i64 %pgocount60, 1
  store i64 %62, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 6)
  br label %190

._crit_edge5:                                     ; preds = %33
  %pgocount61 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 5)
  %63 = add i64 %pgocount61, 1
  store i64 %63, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 5)
  br label %190

._crit_edge4:                                     ; preds = %33
  %pgocount62 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 4)
  %64 = add i64 %pgocount62, 1
  store i64 %64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 4)
  br label %190

._crit_edge3:                                     ; preds = %33
  %pgocount63 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 3)
  %65 = add i64 %pgocount63, 1
  store i64 %65, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 3)
  br label %190

._crit_edge2:                                     ; preds = %33
  %pgocount64 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 2)
  %66 = add i64 %pgocount64, 1
  store i64 %66, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 2)
  br label %190

._crit_edge1:                                     ; preds = %33
  %pgocount65 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 1)
  %67 = add i64 %pgocount65, 1
  store i64 %67, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 1)
  br label %190

._crit_edge:                                      ; preds = %33
  %pgocount66 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 0)
  %68 = add i64 %pgocount66, 1
  store i64 %68, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 0)
  br label %190

; <label>:69:                                     ; preds = %33
  %70 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %71 = call i32 @get_soi(%struct.jpeg_decompress_struct* %70)
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %75, label %73

; <label>:73:                                     ; preds = %69
  %pgocount67 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 56)
  %74 = add i64 %pgocount67, 1
  store i64 %74, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 56)
  store i32 0, i32* %2, align 4
  br label %281

; <label>:75:                                     ; preds = %69
  %pgocount68 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 39)
  %76 = add i64 %pgocount68, 1
  store i64 %76, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 39)
  br label %278

; <label>:77:                                     ; preds = %._crit_edge31, %33
  %78 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %79 = call i32 @get_sof(%struct.jpeg_decompress_struct* %78, i32 0, i32 0)
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %83, label %81

; <label>:81:                                     ; preds = %77
  %pgocount69 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 55)
  %82 = add i64 %pgocount69, 1
  store i64 %82, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 55)
  store i32 0, i32* %2, align 4
  br label %281

; <label>:83:                                     ; preds = %77
  %pgocount70 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 37)
  %84 = add i64 %pgocount70, 1
  store i64 %84, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 37)
  br label %278

; <label>:85:                                     ; preds = %33
  %86 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %87 = call i32 @get_sof(%struct.jpeg_decompress_struct* %86, i32 1, i32 0)
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %91, label %89

; <label>:89:                                     ; preds = %85
  %pgocount71 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 57)
  %90 = add i64 %pgocount71, 1
  store i64 %90, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 57)
  store i32 0, i32* %2, align 4
  br label %281

; <label>:91:                                     ; preds = %85
  %pgocount72 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 40)
  %92 = add i64 %pgocount72, 1
  store i64 %92, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 40)
  br label %278

; <label>:93:                                     ; preds = %33
  %94 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %95 = call i32 @get_sof(%struct.jpeg_decompress_struct* %94, i32 0, i32 1)
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %99, label %97

; <label>:97:                                     ; preds = %93
  %pgocount73 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 58)
  %98 = add i64 %pgocount73, 1
  store i64 %98, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 58)
  store i32 0, i32* %2, align 4
  br label %281

; <label>:99:                                     ; preds = %93
  %pgocount74 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 41)
  %100 = add i64 %pgocount74, 1
  store i64 %100, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 41)
  br label %278

; <label>:101:                                    ; preds = %33
  %102 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %103 = call i32 @get_sof(%struct.jpeg_decompress_struct* %102, i32 1, i32 1)
  %104 = icmp ne i32 %103, 0
  br i1 %104, label %107, label %105

; <label>:105:                                    ; preds = %101
  %pgocount75 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 59)
  %106 = add i64 %pgocount75, 1
  store i64 %106, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 59)
  store i32 0, i32* %2, align 4
  br label %281

; <label>:107:                                    ; preds = %101
  %pgocount76 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 42)
  %108 = add i64 %pgocount76, 1
  store i64 %108, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 42)
  br label %278

; <label>:109:                                    ; preds = %._crit_edge22, %._crit_edge21, %._crit_edge20, %._crit_edge19, %._crit_edge18, %._crit_edge17, %._crit_edge16, %._crit_edge15, %33
  %pgocount77 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 34)
  %110 = add i64 %pgocount77, 1
  store i64 %110, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 34)
  %111 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %112 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %111, i32 0, i32 0
  %113 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %112, align 8
  %114 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %113, i32 0, i32 5
  store i32 59, i32* %114, align 8
  %115 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %116 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %115, i32 0, i32 72
  %117 = load i32, i32* %116, align 4
  %118 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %119 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %118, i32 0, i32 0
  %120 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %119, align 8
  %121 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %120, i32 0, i32 6
  %122 = bitcast %union.anon* %121 to [8 x i32]*
  %123 = getelementptr inbounds [8 x i32], [8 x i32]* %122, i64 0, i64 0
  store i32 %117, i32* %123, align 4
  %124 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %125 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %124, i32 0, i32 0
  %126 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %125, align 8
  %127 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %126, i32 0, i32 0
  %128 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %127, align 8
  %129 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %130 = bitcast %struct.jpeg_decompress_struct* %129 to %struct.jpeg_common_struct*
  %131 = ptrtoint void (%struct.jpeg_common_struct*)* %128 to i64
  call void @__llvm_profile_instrument_target(i64 %131, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_markers to i8*), i32 0)
  call void %128(%struct.jpeg_common_struct* %130)
  br label %278

; <label>:132:                                    ; preds = %33
  %133 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %134 = call i32 @get_sos(%struct.jpeg_decompress_struct* %133)
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %138, label %136

; <label>:136:                                    ; preds = %132
  %pgocount78 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 53)
  %137 = add i64 %pgocount78, 1
  store i64 %137, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 53)
  store i32 0, i32* %2, align 4
  br label %281

; <label>:138:                                    ; preds = %132
  %pgocount79 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 51)
  %139 = add i64 %pgocount79, 1
  store i64 %139, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 51)
  %140 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %141 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %140, i32 0, i32 72
  store i32 0, i32* %141, align 4
  store i32 1, i32* %2, align 4
  br label %281

; <label>:142:                                    ; preds = %33
  %pgocount80 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 49)
  %143 = add i64 %pgocount80, 1
  store i64 %143, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 49)
  %144 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %145 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %144, i32 0, i32 0
  %146 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %145, align 8
  %147 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %146, i32 0, i32 5
  store i32 84, i32* %147, align 8
  %148 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %149 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %148, i32 0, i32 0
  %150 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %149, align 8
  %151 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %150, i32 0, i32 1
  %152 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %151, align 8
  %153 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %154 = bitcast %struct.jpeg_decompress_struct* %153 to %struct.jpeg_common_struct*
  %155 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %152 to i64
  call void @__llvm_profile_instrument_target(i64 %155, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_markers to i8*), i32 1)
  call void %152(%struct.jpeg_common_struct* %154, i32 1)
  %156 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %157 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %156, i32 0, i32 72
  store i32 0, i32* %157, align 4
  store i32 2, i32* %2, align 4
  br label %281

; <label>:158:                                    ; preds = %33
  %159 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %160 = call i32 @get_dac(%struct.jpeg_decompress_struct* %159)
  %161 = icmp ne i32 %160, 0
  br i1 %161, label %164, label %162

; <label>:162:                                    ; preds = %158
  %pgocount81 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 60)
  %163 = add i64 %pgocount81, 1
  store i64 %163, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 60)
  store i32 0, i32* %2, align 4
  br label %281

; <label>:164:                                    ; preds = %158
  %pgocount82 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 43)
  %165 = add i64 %pgocount82, 1
  store i64 %165, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 43)
  br label %278

; <label>:166:                                    ; preds = %33
  %167 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %168 = call i32 @get_dht(%struct.jpeg_decompress_struct* %167)
  %169 = icmp ne i32 %168, 0
  br i1 %169, label %172, label %170

; <label>:170:                                    ; preds = %166
  %pgocount83 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 61)
  %171 = add i64 %pgocount83, 1
  store i64 %171, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 61)
  store i32 0, i32* %2, align 4
  br label %281

; <label>:172:                                    ; preds = %166
  %pgocount84 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 44)
  %173 = add i64 %pgocount84, 1
  store i64 %173, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 44)
  br label %278

; <label>:174:                                    ; preds = %33
  %175 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %176 = call i32 @get_dqt(%struct.jpeg_decompress_struct* %175)
  %177 = icmp ne i32 %176, 0
  br i1 %177, label %180, label %178

; <label>:178:                                    ; preds = %174
  %pgocount85 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 62)
  %179 = add i64 %pgocount85, 1
  store i64 %179, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 62)
  store i32 0, i32* %2, align 4
  br label %281

; <label>:180:                                    ; preds = %174
  %pgocount86 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 45)
  %181 = add i64 %pgocount86, 1
  store i64 %181, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 45)
  br label %278

; <label>:182:                                    ; preds = %33
  %183 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %184 = call i32 @get_dri(%struct.jpeg_decompress_struct* %183)
  %185 = icmp ne i32 %184, 0
  br i1 %185, label %188, label %186

; <label>:186:                                    ; preds = %182
  %pgocount87 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 63)
  %187 = add i64 %pgocount87, 1
  store i64 %187, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 63)
  store i32 0, i32* %2, align 4
  br label %281

; <label>:188:                                    ; preds = %182
  %pgocount88 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 46)
  %189 = add i64 %pgocount88, 1
  store i64 %189, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 46)
  br label %278

; <label>:190:                                    ; preds = %._crit_edge14, %._crit_edge13, %._crit_edge12, %._crit_edge11, %._crit_edge10, %._crit_edge9, %._crit_edge8, %._crit_edge7, %._crit_edge6, %._crit_edge5, %._crit_edge4, %._crit_edge3, %._crit_edge2, %._crit_edge1, %._crit_edge, %33
  %191 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %192 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %191, i32 0, i32 78
  %193 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %192, align 8
  %194 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %193, i32 0, i32 4
  %195 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %196 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %195, i32 0, i32 72
  %197 = load i32, i32* %196, align 4
  %198 = sub nsw i32 %197, 224
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds [16 x i32 (%struct.jpeg_decompress_struct*)*], [16 x i32 (%struct.jpeg_decompress_struct*)*]* %194, i64 0, i64 %199
  %201 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %200, align 8
  %202 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %203 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %201 to i64
  call void @__llvm_profile_instrument_target(i64 %203, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_markers to i8*), i32 2)
  %204 = call i32 %201(%struct.jpeg_decompress_struct* %202)
  %205 = icmp ne i32 %204, 0
  br i1 %205, label %208, label %206

; <label>:206:                                    ; preds = %190
  %pgocount89 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 50)
  %207 = add i64 %pgocount89, 1
  store i64 %207, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 50)
  store i32 0, i32* %2, align 4
  br label %281

; <label>:208:                                    ; preds = %190
  %pgocount90 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 32)
  %209 = add i64 %pgocount90, 1
  store i64 %209, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 32)
  br label %278

; <label>:210:                                    ; preds = %33
  %211 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %212 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %211, i32 0, i32 78
  %213 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %212, align 8
  %214 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %213, i32 0, i32 3
  %215 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %214, align 8
  %216 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %217 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %215 to i64
  call void @__llvm_profile_instrument_target(i64 %217, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_markers to i8*), i32 3)
  %218 = call i32 %215(%struct.jpeg_decompress_struct* %216)
  %219 = icmp ne i32 %218, 0
  br i1 %219, label %222, label %220

; <label>:220:                                    ; preds = %210
  %pgocount91 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 64)
  %221 = add i64 %pgocount91, 1
  store i64 %221, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 64)
  store i32 0, i32* %2, align 4
  br label %281

; <label>:222:                                    ; preds = %210
  %pgocount92 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 47)
  %223 = add i64 %pgocount92, 1
  store i64 %223, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 47)
  br label %278

; <label>:224:                                    ; preds = %._crit_edge30, %._crit_edge29, %._crit_edge28, %._crit_edge27, %._crit_edge26, %._crit_edge25, %._crit_edge24, %._crit_edge23, %33
  %pgocount93 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 35)
  %225 = add i64 %pgocount93, 1
  store i64 %225, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 35)
  %226 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %227 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %226, i32 0, i32 0
  %228 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %227, align 8
  %229 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %228, i32 0, i32 5
  store i32 91, i32* %229, align 8
  %230 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %231 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %230, i32 0, i32 72
  %232 = load i32, i32* %231, align 4
  %233 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %234 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %233, i32 0, i32 0
  %235 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %234, align 8
  %236 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %235, i32 0, i32 6
  %237 = bitcast %union.anon* %236 to [8 x i32]*
  %238 = getelementptr inbounds [8 x i32], [8 x i32]* %237, i64 0, i64 0
  store i32 %232, i32* %238, align 4
  %239 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %240 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %239, i32 0, i32 0
  %241 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %240, align 8
  %242 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %241, i32 0, i32 1
  %243 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %242, align 8
  %244 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %245 = bitcast %struct.jpeg_decompress_struct* %244 to %struct.jpeg_common_struct*
  %246 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %243 to i64
  call void @__llvm_profile_instrument_target(i64 %246, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_markers to i8*), i32 4)
  call void %243(%struct.jpeg_common_struct* %245, i32 1)
  br label %278

; <label>:247:                                    ; preds = %33
  %248 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %249 = call i32 @skip_variable(%struct.jpeg_decompress_struct* %248)
  %250 = icmp ne i32 %249, 0
  br i1 %250, label %253, label %251

; <label>:251:                                    ; preds = %247
  %pgocount94 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 65)
  %252 = add i64 %pgocount94, 1
  store i64 %252, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 65)
  store i32 0, i32* %2, align 4
  br label %281

; <label>:253:                                    ; preds = %247
  %pgocount95 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 48)
  %254 = add i64 %pgocount95, 1
  store i64 %254, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 48)
  br label %278

; <label>:255:                                    ; preds = %33
  %pgocount96 = load i64, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 38)
  %256 = add i64 %pgocount96, 1
  store i64 %256, i64* getelementptr inbounds ([66 x i64], [66 x i64]* @__profc_tmp1.ll_read_markers, i64 0, i64 38)
  %257 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %258 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %257, i32 0, i32 0
  %259 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %258, align 8
  %260 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %259, i32 0, i32 5
  store i32 67, i32* %260, align 8
  %261 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %262 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %261, i32 0, i32 72
  %263 = load i32, i32* %262, align 4
  %264 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %265 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %264, i32 0, i32 0
  %266 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %265, align 8
  %267 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %266, i32 0, i32 6
  %268 = bitcast %union.anon* %267 to [8 x i32]*
  %269 = getelementptr inbounds [8 x i32], [8 x i32]* %268, i64 0, i64 0
  store i32 %263, i32* %269, align 4
  %270 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %271 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %270, i32 0, i32 0
  %272 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %271, align 8
  %273 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %272, i32 0, i32 0
  %274 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %273, align 8
  %275 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %276 = bitcast %struct.jpeg_decompress_struct* %275 to %struct.jpeg_common_struct*
  %277 = ptrtoint void (%struct.jpeg_common_struct*)* %274 to i64
  call void @__llvm_profile_instrument_target(i64 %277, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_markers to i8*), i32 5)
  call void %274(%struct.jpeg_common_struct* %276)
  br label %278

; <label>:278:                                    ; preds = %255, %253, %224, %222, %208, %188, %180, %172, %164, %109, %107, %99, %91, %83, %75
  %279 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %280 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %279, i32 0, i32 72
  store i32 0, i32* %280, align 4
  br label %4

; <label>:281:                                    ; preds = %251, %220, %206, %186, %178, %170, %162, %142, %138, %136, %105, %97, %89, %81, %73, %28, %20
  %282 = load i32, i32* %2, align 4
  ret i32 %282
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @read_restart_marker(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 72
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %16

; <label>:8:                                      ; preds = %1
  %9 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %10 = call i32 @next_marker(%struct.jpeg_decompress_struct* %9)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %14, label %12

; <label>:12:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_restart_marker, i64 0, i64 4)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_restart_marker, i64 0, i64 4)
  store i32 0, i32* %2, align 4
  br label %86

; <label>:14:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_restart_marker, i64 0, i64 2)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_restart_marker, i64 0, i64 2)
  br label %16

; <label>:16:                                     ; preds = %14, %1
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 72
  %19 = load i32, i32* %18, align 4
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %20, i32 0, i32 78
  %22 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %22, i32 0, i32 7
  %24 = load i32, i32* %23, align 8
  %25 = add nsw i32 208, %24
  %26 = icmp eq i32 %19, %25
  br i1 %26, label %27, label %54

; <label>:27:                                     ; preds = %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_restart_marker, i64 0, i64 0)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_restart_marker, i64 0, i64 0)
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %29, i32 0, i32 0
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i32 0, i32 5
  store i32 97, i32* %32, align 8
  %33 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %33, i32 0, i32 78
  %35 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %35, i32 0, i32 7
  %37 = load i32, i32* %36, align 8
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %38, i32 0, i32 0
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i32 0, i32 6
  %42 = bitcast %union.anon* %41 to [8 x i32]*
  %43 = getelementptr inbounds [8 x i32], [8 x i32]* %42, i64 0, i64 0
  store i32 %37, i32* %43, align 4
  %44 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %44, i32 0, i32 0
  %46 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %45, align 8
  %47 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %46, i32 0, i32 1
  %48 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %47, align 8
  %49 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %50 = bitcast %struct.jpeg_decompress_struct* %49 to %struct.jpeg_common_struct*
  %51 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %48 to i64
  call void @__llvm_profile_instrument_target(i64 %51, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_restart_marker to i8*), i32 0)
  call void %48(%struct.jpeg_common_struct* %50, i32 3)
  %52 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %52, i32 0, i32 72
  store i32 0, i32* %53, align 4
  br label %74

; <label>:54:                                     ; preds = %16
  %55 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %56 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %55, i32 0, i32 5
  %57 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %56, align 8
  %58 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %57, i32 0, i32 5
  %59 = bitcast {}** %58 to i32 (%struct.jpeg_decompress_struct*, i32)**
  %60 = load i32 (%struct.jpeg_decompress_struct*, i32)*, i32 (%struct.jpeg_decompress_struct*, i32)** %59, align 8
  %61 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %62 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %62, i32 0, i32 78
  %64 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %63, align 8
  %65 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %64, i32 0, i32 7
  %66 = load i32, i32* %65, align 8
  %67 = ptrtoint i32 (%struct.jpeg_decompress_struct*, i32)* %60 to i64
  call void @__llvm_profile_instrument_target(i64 %67, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_restart_marker to i8*), i32 1)
  %68 = call i32 %60(%struct.jpeg_decompress_struct* %61, i32 %66)
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %72, label %70

; <label>:70:                                     ; preds = %54
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_restart_marker, i64 0, i64 3)
  %71 = add i64 %pgocount3, 1
  store i64 %71, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_restart_marker, i64 0, i64 3)
  store i32 0, i32* %2, align 4
  br label %86

; <label>:72:                                     ; preds = %54
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_restart_marker, i64 0, i64 1)
  %73 = add i64 %pgocount4, 1
  store i64 %73, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_restart_marker, i64 0, i64 1)
  br label %74

; <label>:74:                                     ; preds = %72, %27
  %75 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %76 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %75, i32 0, i32 78
  %77 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %76, align 8
  %78 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %77, i32 0, i32 7
  %79 = load i32, i32* %78, align 8
  %80 = add nsw i32 %79, 1
  %81 = and i32 %80, 7
  %82 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %83 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %82, i32 0, i32 78
  %84 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %83, align 8
  %85 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %84, i32 0, i32 7
  store i32 %81, i32* %85, align 8
  store i32 1, i32* %2, align 4
  br label %86

; <label>:86:                                     ; preds = %74, %70, %12
  %87 = load i32, i32* %2, align 4
  ret i32 %87
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @skip_variable(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.jpeg_source_mgr*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %8 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %8, i32 0, i32 5
  %10 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %9, align 8
  store %struct.jpeg_source_mgr* %10, %struct.jpeg_source_mgr** %5, align 8
  %11 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %12 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %11, i32 0, i32 0
  %13 = load i8*, i8** %12, align 8
  store i8* %13, i8** %6, align 8
  %14 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %15 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %14, i32 0, i32 1
  %16 = load i64, i64* %15, align 8
  store i64 %16, i64* %7, align 8
  br label %17

; <label>:17:                                     ; preds = %1
  %18 = load i64, i64* %7, align 8
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %20, label %38

; <label>:20:                                     ; preds = %17
  %21 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %22 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %21, i32 0, i32 3
  %23 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %22, align 8
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %25 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %23 to i64
  call void @__llvm_profile_instrument_target(i64 %25, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_skip_variable to i8*), i32 0)
  %26 = call i32 %23(%struct.jpeg_decompress_struct* %24)
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %30, label %28

; <label>:28:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_skip_variable, i64 0, i64 3)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_skip_variable, i64 0, i64 3)
  store i32 0, i32* %2, align 4
  br label %122

; <label>:30:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_skip_variable, i64 0, i64 1)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_skip_variable, i64 0, i64 1)
  %32 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %33 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %32, i32 0, i32 0
  %34 = load i8*, i8** %33, align 8
  store i8* %34, i8** %6, align 8
  %35 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %36 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %35, i32 0, i32 1
  %37 = load i64, i64* %36, align 8
  store i64 %37, i64* %7, align 8
  br label %38

; <label>:38:                                     ; preds = %30, %17
  %39 = load i64, i64* %7, align 8
  %40 = add i64 %39, -1
  store i64 %40, i64* %7, align 8
  %41 = load i8*, i8** %6, align 8
  %42 = getelementptr inbounds i8, i8* %41, i32 1
  store i8* %42, i8** %6, align 8
  %43 = load i8, i8* %41, align 1
  %44 = zext i8 %43 to i32
  %45 = shl i32 %44, 8
  %46 = zext i32 %45 to i64
  store i64 %46, i64* %4, align 8
  %47 = load i64, i64* %7, align 8
  %48 = icmp eq i64 %47, 0
  br i1 %48, label %49, label %67

; <label>:49:                                     ; preds = %38
  %50 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %51 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %50, i32 0, i32 3
  %52 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %51, align 8
  %53 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %54 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %52 to i64
  call void @__llvm_profile_instrument_target(i64 %54, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_skip_variable to i8*), i32 1)
  %55 = call i32 %52(%struct.jpeg_decompress_struct* %53)
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %59, label %57

; <label>:57:                                     ; preds = %49
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_skip_variable, i64 0, i64 4)
  %58 = add i64 %pgocount2, 1
  store i64 %58, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_skip_variable, i64 0, i64 4)
  store i32 0, i32* %2, align 4
  br label %122

; <label>:59:                                     ; preds = %49
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_skip_variable, i64 0, i64 2)
  %60 = add i64 %pgocount3, 1
  store i64 %60, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_skip_variable, i64 0, i64 2)
  %61 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %62 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %61, i32 0, i32 0
  %63 = load i8*, i8** %62, align 8
  store i8* %63, i8** %6, align 8
  %64 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %65 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %64, i32 0, i32 1
  %66 = load i64, i64* %65, align 8
  store i64 %66, i64* %7, align 8
  br label %67

; <label>:67:                                     ; preds = %59, %38
  %68 = load i64, i64* %7, align 8
  %69 = add i64 %68, -1
  store i64 %69, i64* %7, align 8
  %70 = load i8*, i8** %6, align 8
  %71 = getelementptr inbounds i8, i8* %70, i32 1
  store i8* %71, i8** %6, align 8
  %72 = load i8, i8* %70, align 1
  %73 = zext i8 %72 to i64
  %74 = load i64, i64* %4, align 8
  %75 = add nsw i64 %74, %73
  store i64 %75, i64* %4, align 8
  br label %76

; <label>:76:                                     ; preds = %67
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_skip_variable, i64 0, i64 0)
  %77 = add i64 %pgocount4, 1
  store i64 %77, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_skip_variable, i64 0, i64 0)
  %78 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %78, i32 0, i32 0
  %80 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %79, align 8
  %81 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %80, i32 0, i32 5
  store i32 90, i32* %81, align 8
  %82 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %83 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %82, i32 0, i32 72
  %84 = load i32, i32* %83, align 4
  %85 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %86 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %85, i32 0, i32 0
  %87 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %86, align 8
  %88 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %87, i32 0, i32 6
  %89 = bitcast %union.anon* %88 to [8 x i32]*
  %90 = getelementptr inbounds [8 x i32], [8 x i32]* %89, i64 0, i64 0
  store i32 %84, i32* %90, align 4
  %91 = load i64, i64* %4, align 8
  %92 = trunc i64 %91 to i32
  %93 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %94 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %93, i32 0, i32 0
  %95 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %94, align 8
  %96 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %95, i32 0, i32 6
  %97 = bitcast %union.anon* %96 to [8 x i32]*
  %98 = getelementptr inbounds [8 x i32], [8 x i32]* %97, i64 0, i64 1
  store i32 %92, i32* %98, align 4
  %99 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %100 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %99, i32 0, i32 0
  %101 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %100, align 8
  %102 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %101, i32 0, i32 1
  %103 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %102, align 8
  %104 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %105 = bitcast %struct.jpeg_decompress_struct* %104 to %struct.jpeg_common_struct*
  %106 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %103 to i64
  call void @__llvm_profile_instrument_target(i64 %106, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_skip_variable to i8*), i32 2)
  call void %103(%struct.jpeg_common_struct* %105, i32 1)
  %107 = load i8*, i8** %6, align 8
  %108 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %109 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %108, i32 0, i32 0
  store i8* %107, i8** %109, align 8
  %110 = load i64, i64* %7, align 8
  %111 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %5, align 8
  %112 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %111, i32 0, i32 1
  store i64 %110, i64* %112, align 8
  %113 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %114 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %113, i32 0, i32 5
  %115 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %114, align 8
  %116 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %115, i32 0, i32 4
  %117 = load void (%struct.jpeg_decompress_struct*, i64)*, void (%struct.jpeg_decompress_struct*, i64)** %116, align 8
  %118 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %119 = load i64, i64* %4, align 8
  %120 = sub nsw i64 %119, 2
  %121 = ptrtoint void (%struct.jpeg_decompress_struct*, i64)* %117 to i64
  call void @__llvm_profile_instrument_target(i64 %121, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_skip_variable to i8*), i32 3)
  call void %117(%struct.jpeg_decompress_struct* %118, i64 %120)
  store i32 1, i32* %2, align 4
  br label %122

; <label>:122:                                    ; preds = %76, %57, %28
  %123 = load i32, i32* %2, align 4
  ret i32 %123
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_app0(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i64, align 8
  %5 = alloca [14 x i8], align 1
  %6 = alloca i32, align 4
  %7 = alloca %struct.jpeg_source_mgr*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i32*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %11, i32 0, i32 5
  %13 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  store %struct.jpeg_source_mgr* %13, %struct.jpeg_source_mgr** %7, align 8
  %14 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %15 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %14, i32 0, i32 0
  %16 = load i8*, i8** %15, align 8
  store i8* %16, i8** %8, align 8
  %17 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %18 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %17, i32 0, i32 1
  %19 = load i64, i64* %18, align 8
  store i64 %19, i64* %9, align 8
  br label %20

; <label>:20:                                     ; preds = %1
  %21 = load i64, i64* %9, align 8
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %23, label %41

; <label>:23:                                     ; preds = %20
  %24 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %25 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %24, i32 0, i32 3
  %26 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %25, align 8
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %28 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %26 to i64
  call void @__llvm_profile_instrument_target(i64 %28, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app0 to i8*), i32 0)
  %29 = call i32 %26(%struct.jpeg_decompress_struct* %27)
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %33, label %31

; <label>:31:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 7)
  %32 = add i64 %pgocount, 1
  store i64 %32, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 7)
  store i32 0, i32* %2, align 4
  br label %438

; <label>:33:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 5)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 5)
  %35 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %36 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %35, i32 0, i32 0
  %37 = load i8*, i8** %36, align 8
  store i8* %37, i8** %8, align 8
  %38 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %39 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %38, i32 0, i32 1
  %40 = load i64, i64* %39, align 8
  store i64 %40, i64* %9, align 8
  br label %41

; <label>:41:                                     ; preds = %33, %20
  %42 = load i64, i64* %9, align 8
  %43 = add i64 %42, -1
  store i64 %43, i64* %9, align 8
  %44 = load i8*, i8** %8, align 8
  %45 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %45, i8** %8, align 8
  %46 = load i8, i8* %44, align 1
  %47 = zext i8 %46 to i32
  %48 = shl i32 %47, 8
  %49 = zext i32 %48 to i64
  store i64 %49, i64* %4, align 8
  %50 = load i64, i64* %9, align 8
  %51 = icmp eq i64 %50, 0
  br i1 %51, label %52, label %70

; <label>:52:                                     ; preds = %41
  %53 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %54 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %53, i32 0, i32 3
  %55 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %54, align 8
  %56 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %57 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %55 to i64
  call void @__llvm_profile_instrument_target(i64 %57, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app0 to i8*), i32 1)
  %58 = call i32 %55(%struct.jpeg_decompress_struct* %56)
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %62, label %60

; <label>:60:                                     ; preds = %52
  %pgocount2 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 9)
  %61 = add i64 %pgocount2, 1
  store i64 %61, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 9)
  store i32 0, i32* %2, align 4
  br label %438

; <label>:62:                                     ; preds = %52
  %pgocount3 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 6)
  %63 = add i64 %pgocount3, 1
  store i64 %63, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 6)
  %64 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %65 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %64, i32 0, i32 0
  %66 = load i8*, i8** %65, align 8
  store i8* %66, i8** %8, align 8
  %67 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %68 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %67, i32 0, i32 1
  %69 = load i64, i64* %68, align 8
  store i64 %69, i64* %9, align 8
  br label %70

; <label>:70:                                     ; preds = %62, %41
  %71 = load i64, i64* %9, align 8
  %72 = add i64 %71, -1
  store i64 %72, i64* %9, align 8
  %73 = load i8*, i8** %8, align 8
  %74 = getelementptr inbounds i8, i8* %73, i32 1
  store i8* %74, i8** %8, align 8
  %75 = load i8, i8* %73, align 1
  %76 = zext i8 %75 to i64
  %77 = load i64, i64* %4, align 8
  %78 = add nsw i64 %77, %76
  store i64 %78, i64* %4, align 8
  br label %79

; <label>:79:                                     ; preds = %70
  %80 = load i64, i64* %4, align 8
  %81 = sub nsw i64 %80, 2
  store i64 %81, i64* %4, align 8
  %82 = load i64, i64* %4, align 8
  %83 = icmp sge i64 %82, 14
  br i1 %83, label %84, label %396

; <label>:84:                                     ; preds = %79
  store i32 0, i32* %6, align 4
  br label %85

; <label>:85:                                     ; preds = %120, %84
  %86 = load i32, i32* %6, align 4
  %87 = icmp slt i32 %86, 14
  br i1 %87, label %88, label %124

; <label>:88:                                     ; preds = %85
  br label %89

; <label>:89:                                     ; preds = %88
  %90 = load i64, i64* %9, align 8
  %91 = icmp eq i64 %90, 0
  br i1 %91, label %92, label %110

; <label>:92:                                     ; preds = %89
  %93 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %94 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %93, i32 0, i32 3
  %95 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %94, align 8
  %96 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %97 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %95 to i64
  call void @__llvm_profile_instrument_target(i64 %97, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app0 to i8*), i32 2)
  %98 = call i32 %95(%struct.jpeg_decompress_struct* %96)
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %102, label %100

; <label>:100:                                    ; preds = %92
  %pgocount4 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 10)
  %101 = add i64 %pgocount4, 1
  store i64 %101, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 10)
  store i32 0, i32* %2, align 4
  br label %438

; <label>:102:                                    ; preds = %92
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 1)
  %103 = add i64 %pgocount5, 1
  store i64 %103, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 1)
  %104 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %105 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %104, i32 0, i32 0
  %106 = load i8*, i8** %105, align 8
  store i8* %106, i8** %8, align 8
  %107 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %108 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %107, i32 0, i32 1
  %109 = load i64, i64* %108, align 8
  store i64 %109, i64* %9, align 8
  br label %110

; <label>:110:                                    ; preds = %102, %89
  %111 = load i64, i64* %9, align 8
  %112 = add i64 %111, -1
  store i64 %112, i64* %9, align 8
  %113 = load i8*, i8** %8, align 8
  %114 = getelementptr inbounds i8, i8* %113, i32 1
  store i8* %114, i8** %8, align 8
  %115 = load i8, i8* %113, align 1
  %116 = load i32, i32* %6, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 %117
  store i8 %115, i8* %118, align 1
  br label %119

; <label>:119:                                    ; preds = %110
  br label %120

; <label>:120:                                    ; preds = %119
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 0)
  %121 = add i64 %pgocount6, 1
  store i64 %121, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 0)
  %122 = load i32, i32* %6, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %6, align 4
  br label %85

; <label>:124:                                    ; preds = %85
  %125 = load i64, i64* %4, align 8
  %126 = sub nsw i64 %125, 14
  store i64 %126, i64* %4, align 8
  %127 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 0
  %128 = load i8, i8* %127, align 1
  %129 = zext i8 %128 to i32
  %130 = icmp eq i32 %129, 74
  br i1 %130, label %131, label %372

; <label>:131:                                    ; preds = %124
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 8)
  %132 = add i64 %pgocount7, 1
  store i64 %132, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 8)
  %133 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 1
  %134 = load i8, i8* %133, align 1
  %135 = zext i8 %134 to i32
  %136 = icmp eq i32 %135, 70
  br i1 %136, label %137, label %372

; <label>:137:                                    ; preds = %131
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 11)
  %138 = add i64 %pgocount8, 1
  store i64 %138, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 11)
  %139 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 2
  %140 = load i8, i8* %139, align 1
  %141 = zext i8 %140 to i32
  %142 = icmp eq i32 %141, 73
  br i1 %142, label %143, label %372

; <label>:143:                                    ; preds = %137
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 12)
  %144 = add i64 %pgocount9, 1
  store i64 %144, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 12)
  %145 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 3
  %146 = load i8, i8* %145, align 1
  %147 = zext i8 %146 to i32
  %148 = icmp eq i32 %147, 70
  br i1 %148, label %149, label %372

; <label>:149:                                    ; preds = %143
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 13)
  %150 = add i64 %pgocount10, 1
  store i64 %150, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 13)
  %151 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 4
  %152 = load i8, i8* %151, align 1
  %153 = zext i8 %152 to i32
  %154 = icmp eq i32 %153, 0
  br i1 %154, label %155, label %372

; <label>:155:                                    ; preds = %149
  %156 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 5
  %157 = load i8, i8* %156, align 1
  %158 = zext i8 %157 to i32
  %159 = icmp ne i32 %158, 1
  br i1 %159, label %160, label %192

; <label>:160:                                    ; preds = %155
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 15)
  %161 = add i64 %pgocount11, 1
  store i64 %161, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 15)
  %162 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %163 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %162, i32 0, i32 0
  %164 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %163, align 8
  %165 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %164, i32 0, i32 5
  store i32 115, i32* %165, align 8
  %166 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 5
  %167 = load i8, i8* %166, align 1
  %168 = zext i8 %167 to i32
  %169 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %170 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %169, i32 0, i32 0
  %171 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %170, align 8
  %172 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %171, i32 0, i32 6
  %173 = bitcast %union.anon* %172 to [8 x i32]*
  %174 = getelementptr inbounds [8 x i32], [8 x i32]* %173, i64 0, i64 0
  store i32 %168, i32* %174, align 4
  %175 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 6
  %176 = load i8, i8* %175, align 1
  %177 = zext i8 %176 to i32
  %178 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %179 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %178, i32 0, i32 0
  %180 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %179, align 8
  %181 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %180, i32 0, i32 6
  %182 = bitcast %union.anon* %181 to [8 x i32]*
  %183 = getelementptr inbounds [8 x i32], [8 x i32]* %182, i64 0, i64 1
  store i32 %177, i32* %183, align 4
  %184 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %185 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %184, i32 0, i32 0
  %186 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %185, align 8
  %187 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %186, i32 0, i32 1
  %188 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %187, align 8
  %189 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %190 = bitcast %struct.jpeg_decompress_struct* %189 to %struct.jpeg_common_struct*
  %191 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %188 to i64
  call void @__llvm_profile_instrument_target(i64 %191, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app0 to i8*), i32 3)
  call void %188(%struct.jpeg_common_struct* %190, i32 -1)
  br label %231

; <label>:192:                                    ; preds = %155
  %193 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 6
  %194 = load i8, i8* %193, align 1
  %195 = zext i8 %194 to i32
  %196 = icmp sgt i32 %195, 2
  br i1 %196, label %197, label %229

; <label>:197:                                    ; preds = %192
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 18)
  %198 = add i64 %pgocount12, 1
  store i64 %198, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 18)
  %199 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %200 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %199, i32 0, i32 0
  %201 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %200, align 8
  %202 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %201, i32 0, i32 5
  store i32 88, i32* %202, align 8
  %203 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 5
  %204 = load i8, i8* %203, align 1
  %205 = zext i8 %204 to i32
  %206 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %207 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %206, i32 0, i32 0
  %208 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %207, align 8
  %209 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %208, i32 0, i32 6
  %210 = bitcast %union.anon* %209 to [8 x i32]*
  %211 = getelementptr inbounds [8 x i32], [8 x i32]* %210, i64 0, i64 0
  store i32 %205, i32* %211, align 4
  %212 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 6
  %213 = load i8, i8* %212, align 1
  %214 = zext i8 %213 to i32
  %215 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %216 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %215, i32 0, i32 0
  %217 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %216, align 8
  %218 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %217, i32 0, i32 6
  %219 = bitcast %union.anon* %218 to [8 x i32]*
  %220 = getelementptr inbounds [8 x i32], [8 x i32]* %219, i64 0, i64 1
  store i32 %214, i32* %220, align 4
  %221 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %222 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %221, i32 0, i32 0
  %223 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %222, align 8
  %224 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %223, i32 0, i32 1
  %225 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %224, align 8
  %226 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %227 = bitcast %struct.jpeg_decompress_struct* %226 to %struct.jpeg_common_struct*
  %228 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %225 to i64
  call void @__llvm_profile_instrument_target(i64 %228, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app0 to i8*), i32 4)
  call void %225(%struct.jpeg_common_struct* %227, i32 1)
  br label %229

; <label>:229:                                    ; preds = %197, %192
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 16)
  %230 = add i64 %pgocount13, 1
  store i64 %230, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 16)
  br label %231

; <label>:231:                                    ; preds = %229, %160
  %232 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %233 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %232, i32 0, i32 50
  store i32 1, i32* %233, align 4
  %234 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 7
  %235 = load i8, i8* %234, align 1
  %236 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %237 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %236, i32 0, i32 51
  store i8 %235, i8* %237, align 8
  %238 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 8
  %239 = load i8, i8* %238, align 1
  %240 = zext i8 %239 to i32
  %241 = shl i32 %240, 8
  %242 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 9
  %243 = load i8, i8* %242, align 1
  %244 = zext i8 %243 to i32
  %245 = add nsw i32 %241, %244
  %246 = trunc i32 %245 to i16
  %247 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %248 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %247, i32 0, i32 52
  store i16 %246, i16* %248, align 2
  %249 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 10
  %250 = load i8, i8* %249, align 1
  %251 = zext i8 %250 to i32
  %252 = shl i32 %251, 8
  %253 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 11
  %254 = load i8, i8* %253, align 1
  %255 = zext i8 %254 to i32
  %256 = add nsw i32 %252, %255
  %257 = trunc i32 %256 to i16
  %258 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %259 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %258, i32 0, i32 53
  store i16 %257, i16* %259, align 4
  br label %260

; <label>:260:                                    ; preds = %231
  %261 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %262 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %261, i32 0, i32 0
  %263 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %262, align 8
  %264 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %263, i32 0, i32 6
  %265 = bitcast %union.anon* %264 to [8 x i32]*
  %266 = getelementptr inbounds [8 x i32], [8 x i32]* %265, i32 0, i32 0
  store i32* %266, i32** %10, align 8
  %267 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %268 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %267, i32 0, i32 52
  %269 = load i16, i16* %268, align 2
  %270 = zext i16 %269 to i32
  %271 = load i32*, i32** %10, align 8
  %272 = getelementptr inbounds i32, i32* %271, i64 0
  store i32 %270, i32* %272, align 4
  %273 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %274 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %273, i32 0, i32 53
  %275 = load i16, i16* %274, align 4
  %276 = zext i16 %275 to i32
  %277 = load i32*, i32** %10, align 8
  %278 = getelementptr inbounds i32, i32* %277, i64 1
  store i32 %276, i32* %278, align 4
  %279 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %280 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %279, i32 0, i32 51
  %281 = load i8, i8* %280, align 8
  %282 = zext i8 %281 to i32
  %283 = load i32*, i32** %10, align 8
  %284 = getelementptr inbounds i32, i32* %283, i64 2
  store i32 %282, i32* %284, align 4
  %285 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %286 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %285, i32 0, i32 0
  %287 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %286, align 8
  %288 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %287, i32 0, i32 5
  store i32 86, i32* %288, align 8
  %289 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %290 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %289, i32 0, i32 0
  %291 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %290, align 8
  %292 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %291, i32 0, i32 1
  %293 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %292, align 8
  %294 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %295 = bitcast %struct.jpeg_decompress_struct* %294 to %struct.jpeg_common_struct*
  %296 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %293 to i64
  call void @__llvm_profile_instrument_target(i64 %296, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app0 to i8*), i32 5)
  call void %293(%struct.jpeg_common_struct* %295, i32 1)
  br label %297

; <label>:297:                                    ; preds = %260
  %298 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 12
  %299 = load i8, i8* %298, align 1
  %300 = zext i8 %299 to i32
  %301 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 13
  %302 = load i8, i8* %301, align 1
  %303 = zext i8 %302 to i32
  %304 = or i32 %300, %303
  %305 = icmp ne i32 %304, 0
  br i1 %305, label %306, label %338

; <label>:306:                                    ; preds = %297
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 14)
  %307 = add i64 %pgocount14, 1
  store i64 %307, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 14)
  %308 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %309 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %308, i32 0, i32 0
  %310 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %309, align 8
  %311 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %310, i32 0, i32 5
  store i32 89, i32* %311, align 8
  %312 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 12
  %313 = load i8, i8* %312, align 1
  %314 = zext i8 %313 to i32
  %315 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %316 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %315, i32 0, i32 0
  %317 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %316, align 8
  %318 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %317, i32 0, i32 6
  %319 = bitcast %union.anon* %318 to [8 x i32]*
  %320 = getelementptr inbounds [8 x i32], [8 x i32]* %319, i64 0, i64 0
  store i32 %314, i32* %320, align 4
  %321 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 13
  %322 = load i8, i8* %321, align 1
  %323 = zext i8 %322 to i32
  %324 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %325 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %324, i32 0, i32 0
  %326 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %325, align 8
  %327 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %326, i32 0, i32 6
  %328 = bitcast %union.anon* %327 to [8 x i32]*
  %329 = getelementptr inbounds [8 x i32], [8 x i32]* %328, i64 0, i64 1
  store i32 %323, i32* %329, align 4
  %330 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %331 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %330, i32 0, i32 0
  %332 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %331, align 8
  %333 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %332, i32 0, i32 1
  %334 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %333, align 8
  %335 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %336 = bitcast %struct.jpeg_decompress_struct* %335 to %struct.jpeg_common_struct*
  %337 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %334 to i64
  call void @__llvm_profile_instrument_target(i64 %337, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app0 to i8*), i32 6)
  call void %334(%struct.jpeg_common_struct* %336, i32 1)
  br label %338

; <label>:338:                                    ; preds = %306, %297
  %339 = load i64, i64* %4, align 8
  %340 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 12
  %341 = load i8, i8* %340, align 1
  %342 = zext i8 %341 to i64
  %343 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 13
  %344 = load i8, i8* %343, align 1
  %345 = zext i8 %344 to i64
  %346 = mul nsw i64 %342, %345
  %347 = mul nsw i64 %346, 3
  %348 = icmp ne i64 %339, %347
  br i1 %348, label %349, label %371

; <label>:349:                                    ; preds = %338
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 17)
  %350 = add i64 %pgocount15, 1
  store i64 %350, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 17)
  %351 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %352 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %351, i32 0, i32 0
  %353 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %352, align 8
  %354 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %353, i32 0, i32 5
  store i32 87, i32* %354, align 8
  %355 = load i64, i64* %4, align 8
  %356 = trunc i64 %355 to i32
  %357 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %358 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %357, i32 0, i32 0
  %359 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %358, align 8
  %360 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %359, i32 0, i32 6
  %361 = bitcast %union.anon* %360 to [8 x i32]*
  %362 = getelementptr inbounds [8 x i32], [8 x i32]* %361, i64 0, i64 0
  store i32 %356, i32* %362, align 4
  %363 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %364 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %363, i32 0, i32 0
  %365 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %364, align 8
  %366 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %365, i32 0, i32 1
  %367 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %366, align 8
  %368 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %369 = bitcast %struct.jpeg_decompress_struct* %368 to %struct.jpeg_common_struct*
  %370 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %367 to i64
  call void @__llvm_profile_instrument_target(i64 %370, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app0 to i8*), i32 7)
  call void %367(%struct.jpeg_common_struct* %369, i32 1)
  br label %371

; <label>:371:                                    ; preds = %349, %338
  br label %395

; <label>:372:                                    ; preds = %149, %143, %137, %131, %124
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 4)
  %373 = add i64 %pgocount16, 1
  store i64 %373, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 4)
  %374 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %375 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %374, i32 0, i32 0
  %376 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %375, align 8
  %377 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %376, i32 0, i32 5
  store i32 76, i32* %377, align 8
  %378 = load i64, i64* %4, align 8
  %379 = trunc i64 %378 to i32
  %380 = add nsw i32 %379, 14
  %381 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %382 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %381, i32 0, i32 0
  %383 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %382, align 8
  %384 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %383, i32 0, i32 6
  %385 = bitcast %union.anon* %384 to [8 x i32]*
  %386 = getelementptr inbounds [8 x i32], [8 x i32]* %385, i64 0, i64 0
  store i32 %380, i32* %386, align 4
  %387 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %388 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %387, i32 0, i32 0
  %389 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %388, align 8
  %390 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %389, i32 0, i32 1
  %391 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %390, align 8
  %392 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %393 = bitcast %struct.jpeg_decompress_struct* %392 to %struct.jpeg_common_struct*
  %394 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %391 to i64
  call void @__llvm_profile_instrument_target(i64 %394, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app0 to i8*), i32 8)
  call void %391(%struct.jpeg_common_struct* %393, i32 1)
  br label %395

; <label>:395:                                    ; preds = %372, %371
  br label %418

; <label>:396:                                    ; preds = %79
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 3)
  %397 = add i64 %pgocount17, 1
  store i64 %397, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 3)
  %398 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %399 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %398, i32 0, i32 0
  %400 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %399, align 8
  %401 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %400, i32 0, i32 5
  store i32 76, i32* %401, align 8
  %402 = load i64, i64* %4, align 8
  %403 = trunc i64 %402 to i32
  %404 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %405 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %404, i32 0, i32 0
  %406 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %405, align 8
  %407 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %406, i32 0, i32 6
  %408 = bitcast %union.anon* %407 to [8 x i32]*
  %409 = getelementptr inbounds [8 x i32], [8 x i32]* %408, i64 0, i64 0
  store i32 %403, i32* %409, align 4
  %410 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %411 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %410, i32 0, i32 0
  %412 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %411, align 8
  %413 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %412, i32 0, i32 1
  %414 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %413, align 8
  %415 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %416 = bitcast %struct.jpeg_decompress_struct* %415 to %struct.jpeg_common_struct*
  %417 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %414 to i64
  call void @__llvm_profile_instrument_target(i64 %417, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app0 to i8*), i32 9)
  call void %414(%struct.jpeg_common_struct* %416, i32 1)
  br label %418

; <label>:418:                                    ; preds = %396, %395
  %419 = load i8*, i8** %8, align 8
  %420 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %421 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %420, i32 0, i32 0
  store i8* %419, i8** %421, align 8
  %422 = load i64, i64* %9, align 8
  %423 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %424 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %423, i32 0, i32 1
  store i64 %422, i64* %424, align 8
  %425 = load i64, i64* %4, align 8
  %426 = icmp sgt i64 %425, 0
  br i1 %426, label %427, label %437

; <label>:427:                                    ; preds = %418
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 2)
  %428 = add i64 %pgocount18, 1
  store i64 %428, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_get_app0, i64 0, i64 2)
  %429 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %430 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %429, i32 0, i32 5
  %431 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %430, align 8
  %432 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %431, i32 0, i32 4
  %433 = load void (%struct.jpeg_decompress_struct*, i64)*, void (%struct.jpeg_decompress_struct*, i64)** %432, align 8
  %434 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %435 = load i64, i64* %4, align 8
  %436 = ptrtoint void (%struct.jpeg_decompress_struct*, i64)* %433 to i64
  call void @__llvm_profile_instrument_target(i64 %436, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app0 to i8*), i32 10)
  call void %433(%struct.jpeg_decompress_struct* %434, i64 %435)
  br label %437

; <label>:437:                                    ; preds = %427, %418
  store i32 1, i32* %2, align 4
  br label %438

; <label>:438:                                    ; preds = %437, %100, %60, %31
  %439 = load i32, i32* %2, align 4
  ret i32 %439
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_app14(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i64, align 8
  %5 = alloca [12 x i8], align 1
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.jpeg_source_mgr*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i64, align 8
  %14 = alloca i32*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 5
  %17 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %16, align 8
  store %struct.jpeg_source_mgr* %17, %struct.jpeg_source_mgr** %11, align 8
  %18 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %19 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %18, i32 0, i32 0
  %20 = load i8*, i8** %19, align 8
  store i8* %20, i8** %12, align 8
  %21 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %22 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %21, i32 0, i32 1
  %23 = load i64, i64* %22, align 8
  store i64 %23, i64* %13, align 8
  br label %24

; <label>:24:                                     ; preds = %1
  %25 = load i64, i64* %13, align 8
  %26 = icmp eq i64 %25, 0
  br i1 %26, label %27, label %45

; <label>:27:                                     ; preds = %24
  %28 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %29 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %28, i32 0, i32 3
  %30 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %29, align 8
  %31 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %32 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %30 to i64
  call void @__llvm_profile_instrument_target(i64 %32, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app14 to i8*), i32 0)
  %33 = call i32 %30(%struct.jpeg_decompress_struct* %31)
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %37, label %35

; <label>:35:                                     ; preds = %27
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 7)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 7)
  store i32 0, i32* %2, align 4
  br label %292

; <label>:37:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 5)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 5)
  %39 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %40 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %39, i32 0, i32 0
  %41 = load i8*, i8** %40, align 8
  store i8* %41, i8** %12, align 8
  %42 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %43 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %42, i32 0, i32 1
  %44 = load i64, i64* %43, align 8
  store i64 %44, i64* %13, align 8
  br label %45

; <label>:45:                                     ; preds = %37, %24
  %46 = load i64, i64* %13, align 8
  %47 = add i64 %46, -1
  store i64 %47, i64* %13, align 8
  %48 = load i8*, i8** %12, align 8
  %49 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %49, i8** %12, align 8
  %50 = load i8, i8* %48, align 1
  %51 = zext i8 %50 to i32
  %52 = shl i32 %51, 8
  %53 = zext i32 %52 to i64
  store i64 %53, i64* %4, align 8
  %54 = load i64, i64* %13, align 8
  %55 = icmp eq i64 %54, 0
  br i1 %55, label %56, label %74

; <label>:56:                                     ; preds = %45
  %57 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %58 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %57, i32 0, i32 3
  %59 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %58, align 8
  %60 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %61 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %59 to i64
  call void @__llvm_profile_instrument_target(i64 %61, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app14 to i8*), i32 1)
  %62 = call i32 %59(%struct.jpeg_decompress_struct* %60)
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %66, label %64

; <label>:64:                                     ; preds = %56
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 9)
  %65 = add i64 %pgocount2, 1
  store i64 %65, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 9)
  store i32 0, i32* %2, align 4
  br label %292

; <label>:66:                                     ; preds = %56
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 6)
  %67 = add i64 %pgocount3, 1
  store i64 %67, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 6)
  %68 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %69 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %68, i32 0, i32 0
  %70 = load i8*, i8** %69, align 8
  store i8* %70, i8** %12, align 8
  %71 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %72 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %71, i32 0, i32 1
  %73 = load i64, i64* %72, align 8
  store i64 %73, i64* %13, align 8
  br label %74

; <label>:74:                                     ; preds = %66, %45
  %75 = load i64, i64* %13, align 8
  %76 = add i64 %75, -1
  store i64 %76, i64* %13, align 8
  %77 = load i8*, i8** %12, align 8
  %78 = getelementptr inbounds i8, i8* %77, i32 1
  store i8* %78, i8** %12, align 8
  %79 = load i8, i8* %77, align 1
  %80 = zext i8 %79 to i64
  %81 = load i64, i64* %4, align 8
  %82 = add nsw i64 %81, %80
  store i64 %82, i64* %4, align 8
  br label %83

; <label>:83:                                     ; preds = %74
  %84 = load i64, i64* %4, align 8
  %85 = sub nsw i64 %84, 2
  store i64 %85, i64* %4, align 8
  %86 = load i64, i64* %4, align 8
  %87 = icmp sge i64 %86, 12
  br i1 %87, label %88, label %250

; <label>:88:                                     ; preds = %83
  store i32 0, i32* %6, align 4
  br label %89

; <label>:89:                                     ; preds = %124, %88
  %90 = load i32, i32* %6, align 4
  %91 = icmp slt i32 %90, 12
  br i1 %91, label %92, label %128

; <label>:92:                                     ; preds = %89
  br label %93

; <label>:93:                                     ; preds = %92
  %94 = load i64, i64* %13, align 8
  %95 = icmp eq i64 %94, 0
  br i1 %95, label %96, label %114

; <label>:96:                                     ; preds = %93
  %97 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %98 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %97, i32 0, i32 3
  %99 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %98, align 8
  %100 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %101 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %99 to i64
  call void @__llvm_profile_instrument_target(i64 %101, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app14 to i8*), i32 2)
  %102 = call i32 %99(%struct.jpeg_decompress_struct* %100)
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %106, label %104

; <label>:104:                                    ; preds = %96
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 10)
  %105 = add i64 %pgocount4, 1
  store i64 %105, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 10)
  store i32 0, i32* %2, align 4
  br label %292

; <label>:106:                                    ; preds = %96
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 1)
  %107 = add i64 %pgocount5, 1
  store i64 %107, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 1)
  %108 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %109 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %108, i32 0, i32 0
  %110 = load i8*, i8** %109, align 8
  store i8* %110, i8** %12, align 8
  %111 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %112 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %111, i32 0, i32 1
  %113 = load i64, i64* %112, align 8
  store i64 %113, i64* %13, align 8
  br label %114

; <label>:114:                                    ; preds = %106, %93
  %115 = load i64, i64* %13, align 8
  %116 = add i64 %115, -1
  store i64 %116, i64* %13, align 8
  %117 = load i8*, i8** %12, align 8
  %118 = getelementptr inbounds i8, i8* %117, i32 1
  store i8* %118, i8** %12, align 8
  %119 = load i8, i8* %117, align 1
  %120 = load i32, i32* %6, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [12 x i8], [12 x i8]* %5, i64 0, i64 %121
  store i8 %119, i8* %122, align 1
  br label %123

; <label>:123:                                    ; preds = %114
  br label %124

; <label>:124:                                    ; preds = %123
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 0)
  %125 = add i64 %pgocount6, 1
  store i64 %125, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 0)
  %126 = load i32, i32* %6, align 4
  %127 = add nsw i32 %126, 1
  store i32 %127, i32* %6, align 4
  br label %89

; <label>:128:                                    ; preds = %89
  %129 = load i64, i64* %4, align 8
  %130 = sub nsw i64 %129, 12
  store i64 %130, i64* %4, align 8
  %131 = getelementptr inbounds [12 x i8], [12 x i8]* %5, i64 0, i64 0
  %132 = load i8, i8* %131, align 1
  %133 = zext i8 %132 to i32
  %134 = icmp eq i32 %133, 65
  br i1 %134, label %135, label %226

; <label>:135:                                    ; preds = %128
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 8)
  %136 = add i64 %pgocount7, 1
  store i64 %136, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 8)
  %137 = getelementptr inbounds [12 x i8], [12 x i8]* %5, i64 0, i64 1
  %138 = load i8, i8* %137, align 1
  %139 = zext i8 %138 to i32
  %140 = icmp eq i32 %139, 100
  br i1 %140, label %141, label %226

; <label>:141:                                    ; preds = %135
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 11)
  %142 = add i64 %pgocount8, 1
  store i64 %142, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 11)
  %143 = getelementptr inbounds [12 x i8], [12 x i8]* %5, i64 0, i64 2
  %144 = load i8, i8* %143, align 1
  %145 = zext i8 %144 to i32
  %146 = icmp eq i32 %145, 111
  br i1 %146, label %147, label %226

; <label>:147:                                    ; preds = %141
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 12)
  %148 = add i64 %pgocount9, 1
  store i64 %148, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 12)
  %149 = getelementptr inbounds [12 x i8], [12 x i8]* %5, i64 0, i64 3
  %150 = load i8, i8* %149, align 1
  %151 = zext i8 %150 to i32
  %152 = icmp eq i32 %151, 98
  br i1 %152, label %153, label %226

; <label>:153:                                    ; preds = %147
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 13)
  %154 = add i64 %pgocount10, 1
  store i64 %154, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 13)
  %155 = getelementptr inbounds [12 x i8], [12 x i8]* %5, i64 0, i64 4
  %156 = load i8, i8* %155, align 1
  %157 = zext i8 %156 to i32
  %158 = icmp eq i32 %157, 101
  br i1 %158, label %159, label %226

; <label>:159:                                    ; preds = %153
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 14)
  %160 = add i64 %pgocount11, 1
  store i64 %160, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 14)
  %161 = getelementptr inbounds [12 x i8], [12 x i8]* %5, i64 0, i64 5
  %162 = load i8, i8* %161, align 1
  %163 = zext i8 %162 to i32
  %164 = shl i32 %163, 8
  %165 = getelementptr inbounds [12 x i8], [12 x i8]* %5, i64 0, i64 6
  %166 = load i8, i8* %165, align 1
  %167 = zext i8 %166 to i32
  %168 = add nsw i32 %164, %167
  store i32 %168, i32* %7, align 4
  %169 = getelementptr inbounds [12 x i8], [12 x i8]* %5, i64 0, i64 7
  %170 = load i8, i8* %169, align 1
  %171 = zext i8 %170 to i32
  %172 = shl i32 %171, 8
  %173 = getelementptr inbounds [12 x i8], [12 x i8]* %5, i64 0, i64 8
  %174 = load i8, i8* %173, align 1
  %175 = zext i8 %174 to i32
  %176 = add nsw i32 %172, %175
  store i32 %176, i32* %8, align 4
  %177 = getelementptr inbounds [12 x i8], [12 x i8]* %5, i64 0, i64 9
  %178 = load i8, i8* %177, align 1
  %179 = zext i8 %178 to i32
  %180 = shl i32 %179, 8
  %181 = getelementptr inbounds [12 x i8], [12 x i8]* %5, i64 0, i64 10
  %182 = load i8, i8* %181, align 1
  %183 = zext i8 %182 to i32
  %184 = add nsw i32 %180, %183
  store i32 %184, i32* %9, align 4
  %185 = getelementptr inbounds [12 x i8], [12 x i8]* %5, i64 0, i64 11
  %186 = load i8, i8* %185, align 1
  %187 = zext i8 %186 to i32
  store i32 %187, i32* %10, align 4
  br label %188

; <label>:188:                                    ; preds = %159
  %189 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %190 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %189, i32 0, i32 0
  %191 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %190, align 8
  %192 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %191, i32 0, i32 6
  %193 = bitcast %union.anon* %192 to [8 x i32]*
  %194 = getelementptr inbounds [8 x i32], [8 x i32]* %193, i32 0, i32 0
  store i32* %194, i32** %14, align 8
  %195 = load i32, i32* %7, align 4
  %196 = load i32*, i32** %14, align 8
  %197 = getelementptr inbounds i32, i32* %196, i64 0
  store i32 %195, i32* %197, align 4
  %198 = load i32, i32* %8, align 4
  %199 = load i32*, i32** %14, align 8
  %200 = getelementptr inbounds i32, i32* %199, i64 1
  store i32 %198, i32* %200, align 4
  %201 = load i32, i32* %9, align 4
  %202 = load i32*, i32** %14, align 8
  %203 = getelementptr inbounds i32, i32* %202, i64 2
  store i32 %201, i32* %203, align 4
  %204 = load i32, i32* %10, align 4
  %205 = load i32*, i32** %14, align 8
  %206 = getelementptr inbounds i32, i32* %205, i64 3
  store i32 %204, i32* %206, align 4
  %207 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %208 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %207, i32 0, i32 0
  %209 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %208, align 8
  %210 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %209, i32 0, i32 5
  store i32 75, i32* %210, align 8
  %211 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %212 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %211, i32 0, i32 0
  %213 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %212, align 8
  %214 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %213, i32 0, i32 1
  %215 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %214, align 8
  %216 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %217 = bitcast %struct.jpeg_decompress_struct* %216 to %struct.jpeg_common_struct*
  %218 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %215 to i64
  call void @__llvm_profile_instrument_target(i64 %218, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app14 to i8*), i32 3)
  call void %215(%struct.jpeg_common_struct* %217, i32 1)
  br label %219

; <label>:219:                                    ; preds = %188
  %220 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %221 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %220, i32 0, i32 54
  store i32 1, i32* %221, align 8
  %222 = load i32, i32* %10, align 4
  %223 = trunc i32 %222 to i8
  %224 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %225 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %224, i32 0, i32 55
  store i8 %223, i8* %225, align 4
  br label %249

; <label>:226:                                    ; preds = %153, %147, %141, %135, %128
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 4)
  %227 = add i64 %pgocount12, 1
  store i64 %227, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 4)
  %228 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %229 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %228, i32 0, i32 0
  %230 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %229, align 8
  %231 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %230, i32 0, i32 5
  store i32 77, i32* %231, align 8
  %232 = load i64, i64* %4, align 8
  %233 = trunc i64 %232 to i32
  %234 = add nsw i32 %233, 12
  %235 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %236 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %235, i32 0, i32 0
  %237 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %236, align 8
  %238 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %237, i32 0, i32 6
  %239 = bitcast %union.anon* %238 to [8 x i32]*
  %240 = getelementptr inbounds [8 x i32], [8 x i32]* %239, i64 0, i64 0
  store i32 %234, i32* %240, align 4
  %241 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %242 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %241, i32 0, i32 0
  %243 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %242, align 8
  %244 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %243, i32 0, i32 1
  %245 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %244, align 8
  %246 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %247 = bitcast %struct.jpeg_decompress_struct* %246 to %struct.jpeg_common_struct*
  %248 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %245 to i64
  call void @__llvm_profile_instrument_target(i64 %248, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app14 to i8*), i32 4)
  call void %245(%struct.jpeg_common_struct* %247, i32 1)
  br label %249

; <label>:249:                                    ; preds = %226, %219
  br label %272

; <label>:250:                                    ; preds = %83
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 3)
  %251 = add i64 %pgocount13, 1
  store i64 %251, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 3)
  %252 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %253 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %252, i32 0, i32 0
  %254 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %253, align 8
  %255 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %254, i32 0, i32 5
  store i32 77, i32* %255, align 8
  %256 = load i64, i64* %4, align 8
  %257 = trunc i64 %256 to i32
  %258 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %259 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %258, i32 0, i32 0
  %260 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %259, align 8
  %261 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %260, i32 0, i32 6
  %262 = bitcast %union.anon* %261 to [8 x i32]*
  %263 = getelementptr inbounds [8 x i32], [8 x i32]* %262, i64 0, i64 0
  store i32 %257, i32* %263, align 4
  %264 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %265 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %264, i32 0, i32 0
  %266 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %265, align 8
  %267 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %266, i32 0, i32 1
  %268 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %267, align 8
  %269 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %270 = bitcast %struct.jpeg_decompress_struct* %269 to %struct.jpeg_common_struct*
  %271 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %268 to i64
  call void @__llvm_profile_instrument_target(i64 %271, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app14 to i8*), i32 5)
  call void %268(%struct.jpeg_common_struct* %270, i32 1)
  br label %272

; <label>:272:                                    ; preds = %250, %249
  %273 = load i8*, i8** %12, align 8
  %274 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %275 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %274, i32 0, i32 0
  store i8* %273, i8** %275, align 8
  %276 = load i64, i64* %13, align 8
  %277 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %278 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %277, i32 0, i32 1
  store i64 %276, i64* %278, align 8
  %279 = load i64, i64* %4, align 8
  %280 = icmp sgt i64 %279, 0
  br i1 %280, label %281, label %291

; <label>:281:                                    ; preds = %272
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 2)
  %282 = add i64 %pgocount14, 1
  store i64 %282, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_get_app14, i64 0, i64 2)
  %283 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %284 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %283, i32 0, i32 5
  %285 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %284, align 8
  %286 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %285, i32 0, i32 4
  %287 = load void (%struct.jpeg_decompress_struct*, i64)*, void (%struct.jpeg_decompress_struct*, i64)** %286, align 8
  %288 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %289 = load i64, i64* %4, align 8
  %290 = ptrtoint void (%struct.jpeg_decompress_struct*, i64)* %287 to i64
  call void @__llvm_profile_instrument_target(i64 %290, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_app14 to i8*), i32 6)
  call void %287(%struct.jpeg_decompress_struct* %288, i64 %289)
  br label %291

; <label>:291:                                    ; preds = %281, %272
  store i32 1, i32* %2, align 4
  br label %292

; <label>:292:                                    ; preds = %291, %104, %64, %35
  %293 = load i32, i32* %2, align 4
  ret i32 %293
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @first_marker(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.jpeg_source_mgr*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %9 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %9, i32 0, i32 5
  %11 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  store %struct.jpeg_source_mgr* %11, %struct.jpeg_source_mgr** %6, align 8
  %12 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %13 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %12, i32 0, i32 0
  %14 = load i8*, i8** %13, align 8
  store i8* %14, i8** %7, align 8
  %15 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %16 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %15, i32 0, i32 1
  %17 = load i64, i64* %16, align 8
  store i64 %17, i64* %8, align 8
  br label %18

; <label>:18:                                     ; preds = %1
  %19 = load i64, i64* %8, align 8
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %21, label %39

; <label>:21:                                     ; preds = %18
  %22 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %23 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %22, i32 0, i32 3
  %24 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %23, align 8
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %26 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %24 to i64
  call void @__llvm_profile_instrument_target(i64 %26, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_first_marker to i8*), i32 0)
  %27 = call i32 %24(%struct.jpeg_decompress_struct* %25)
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %31, label %29

; <label>:29:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_first_marker, i64 0, i64 5)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_first_marker, i64 0, i64 5)
  store i32 0, i32* %2, align 4
  br label %121

; <label>:31:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_first_marker, i64 0, i64 3)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_first_marker, i64 0, i64 3)
  %33 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %34 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %33, i32 0, i32 0
  %35 = load i8*, i8** %34, align 8
  store i8* %35, i8** %7, align 8
  %36 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %37 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %36, i32 0, i32 1
  %38 = load i64, i64* %37, align 8
  store i64 %38, i64* %8, align 8
  br label %39

; <label>:39:                                     ; preds = %31, %18
  %40 = load i64, i64* %8, align 8
  %41 = add i64 %40, -1
  store i64 %41, i64* %8, align 8
  %42 = load i8*, i8** %7, align 8
  %43 = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %43, i8** %7, align 8
  %44 = load i8, i8* %42, align 1
  %45 = zext i8 %44 to i32
  store i32 %45, i32* %4, align 4
  br label %46

; <label>:46:                                     ; preds = %39
  br label %47

; <label>:47:                                     ; preds = %46
  %48 = load i64, i64* %8, align 8
  %49 = icmp eq i64 %48, 0
  br i1 %49, label %50, label %68

; <label>:50:                                     ; preds = %47
  %51 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %52 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %51, i32 0, i32 3
  %53 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %52, align 8
  %54 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %55 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %53 to i64
  call void @__llvm_profile_instrument_target(i64 %55, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_first_marker to i8*), i32 1)
  %56 = call i32 %53(%struct.jpeg_decompress_struct* %54)
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %60, label %58

; <label>:58:                                     ; preds = %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_first_marker, i64 0, i64 6)
  %59 = add i64 %pgocount2, 1
  store i64 %59, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_first_marker, i64 0, i64 6)
  store i32 0, i32* %2, align 4
  br label %121

; <label>:60:                                     ; preds = %50
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_first_marker, i64 0, i64 4)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_first_marker, i64 0, i64 4)
  %62 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %63 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %62, i32 0, i32 0
  %64 = load i8*, i8** %63, align 8
  store i8* %64, i8** %7, align 8
  %65 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %66 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %65, i32 0, i32 1
  %67 = load i64, i64* %66, align 8
  store i64 %67, i64* %8, align 8
  br label %68

; <label>:68:                                     ; preds = %60, %47
  %69 = load i64, i64* %8, align 8
  %70 = add i64 %69, -1
  store i64 %70, i64* %8, align 8
  %71 = load i8*, i8** %7, align 8
  %72 = getelementptr inbounds i8, i8* %71, i32 1
  store i8* %72, i8** %7, align 8
  %73 = load i8, i8* %71, align 1
  %74 = zext i8 %73 to i32
  store i32 %74, i32* %5, align 4
  br label %75

; <label>:75:                                     ; preds = %68
  %76 = load i32, i32* %4, align 4
  %77 = icmp ne i32 %76, 255
  br i1 %77, label %82, label %78

; <label>:78:                                     ; preds = %75
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_first_marker, i64 0, i64 2)
  %79 = add i64 %pgocount4, 1
  store i64 %79, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_first_marker, i64 0, i64 2)
  %80 = load i32, i32* %5, align 4
  %81 = icmp ne i32 %80, 216
  br i1 %81, label %82, label %110

; <label>:82:                                     ; preds = %78, %75
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_first_marker, i64 0, i64 1)
  %83 = add i64 %pgocount5, 1
  store i64 %83, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_first_marker, i64 0, i64 1)
  %84 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %85 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %84, i32 0, i32 0
  %86 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %85, align 8
  %87 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %86, i32 0, i32 5
  store i32 52, i32* %87, align 8
  %88 = load i32, i32* %4, align 4
  %89 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %90 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %89, i32 0, i32 0
  %91 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %90, align 8
  %92 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %91, i32 0, i32 6
  %93 = bitcast %union.anon* %92 to [8 x i32]*
  %94 = getelementptr inbounds [8 x i32], [8 x i32]* %93, i64 0, i64 0
  store i32 %88, i32* %94, align 4
  %95 = load i32, i32* %5, align 4
  %96 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %97 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %96, i32 0, i32 0
  %98 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %97, align 8
  %99 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i32 0, i32 6
  %100 = bitcast %union.anon* %99 to [8 x i32]*
  %101 = getelementptr inbounds [8 x i32], [8 x i32]* %100, i64 0, i64 1
  store i32 %95, i32* %101, align 4
  %102 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %103 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %102, i32 0, i32 0
  %104 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %103, align 8
  %105 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %104, i32 0, i32 0
  %106 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %105, align 8
  %107 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %108 = bitcast %struct.jpeg_decompress_struct* %107 to %struct.jpeg_common_struct*
  %109 = ptrtoint void (%struct.jpeg_common_struct*)* %106 to i64
  call void @__llvm_profile_instrument_target(i64 %109, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_first_marker to i8*), i32 2)
  call void %106(%struct.jpeg_common_struct* %108)
  br label %110

; <label>:110:                                    ; preds = %82, %78
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_first_marker, i64 0, i64 0)
  %111 = add i64 %pgocount6, 1
  store i64 %111, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_first_marker, i64 0, i64 0)
  %112 = load i32, i32* %5, align 4
  %113 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %114 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %113, i32 0, i32 72
  store i32 %112, i32* %114, align 4
  %115 = load i8*, i8** %7, align 8
  %116 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %117 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %116, i32 0, i32 0
  store i8* %115, i8** %117, align 8
  %118 = load i64, i64* %8, align 8
  %119 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %120 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %119, i32 0, i32 1
  store i64 %118, i64* %120, align 8
  store i32 1, i32* %2, align 4
  br label %121

; <label>:121:                                    ; preds = %110, %58, %29
  %122 = load i32, i32* %2, align 4
  ret i32 %122
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_soi(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 0
  %6 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %6, i32 0, i32 5
  store i32 101, i32* %7, align 8
  %8 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %8, i32 0, i32 0
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i32 0, i32 1
  %12 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %11, align 8
  %13 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %14 = bitcast %struct.jpeg_decompress_struct* %13 to %struct.jpeg_common_struct*
  %15 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %12 to i64
  call void @__llvm_profile_instrument_target(i64 %15, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_soi to i8*), i32 0)
  call void %12(%struct.jpeg_common_struct* %14, i32 1)
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 78
  %18 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %18, i32 0, i32 5
  %20 = load i32, i32* %19, align 8
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %36

; <label>:22:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_soi, i64 0, i64 2)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_soi, i64 0, i64 2)
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 0
  %26 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %26, i32 0, i32 5
  store i32 60, i32* %27, align 8
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %28, i32 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i32 0, i32 0
  %32 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %31, align 8
  %33 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %34 = bitcast %struct.jpeg_decompress_struct* %33 to %struct.jpeg_common_struct*
  %35 = ptrtoint void (%struct.jpeg_common_struct*)* %32 to i64
  call void @__llvm_profile_instrument_target(i64 %35, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_soi to i8*), i32 1)
  call void %32(%struct.jpeg_common_struct* %34)
  br label %36

; <label>:36:                                     ; preds = %22, %1
  store i32 0, i32* %3, align 4
  br label %37

; <label>:37:                                     ; preds = %56, %36
  %38 = load i32, i32* %3, align 4
  %39 = icmp slt i32 %38, 16
  br i1 %39, label %40, label %60

; <label>:40:                                     ; preds = %37
  %41 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %41, i32 0, i32 46
  %43 = load i32, i32* %3, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [16 x i8], [16 x i8]* %42, i64 0, i64 %44
  store i8 0, i8* %45, align 1
  %46 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %46, i32 0, i32 47
  %48 = load i32, i32* %3, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [16 x i8], [16 x i8]* %47, i64 0, i64 %49
  store i8 1, i8* %50, align 1
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 48
  %53 = load i32, i32* %3, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [16 x i8], [16 x i8]* %52, i64 0, i64 %54
  store i8 5, i8* %55, align 1
  br label %56

; <label>:56:                                     ; preds = %40
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_soi, i64 0, i64 0)
  %57 = add i64 %pgocount1, 1
  store i64 %57, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_soi, i64 0, i64 0)
  %58 = load i32, i32* %3, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %3, align 4
  br label %37

; <label>:60:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_soi, i64 0, i64 1)
  %61 = add i64 %pgocount2, 1
  store i64 %61, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_soi, i64 0, i64 1)
  %62 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %62, i32 0, i32 49
  store i32 0, i32* %63, align 8
  %64 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %65 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %64, i32 0, i32 9
  store i32 0, i32* %65, align 4
  %66 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %67 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %66, i32 0, i32 56
  store i32 0, i32* %67, align 8
  %68 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %69 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %68, i32 0, i32 50
  store i32 0, i32* %69, align 4
  %70 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %71 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %70, i32 0, i32 51
  store i8 0, i8* %71, align 8
  %72 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %72, i32 0, i32 52
  store i16 1, i16* %73, align 2
  %74 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %75 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %74, i32 0, i32 53
  store i16 1, i16* %75, align 4
  %76 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %76, i32 0, i32 54
  store i32 0, i32* %77, align 8
  %78 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %78, i32 0, i32 55
  store i8 0, i8* %79, align 4
  %80 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %81 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %80, i32 0, i32 78
  %82 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %81, align 8
  %83 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %82, i32 0, i32 5
  store i32 1, i32* %83, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_sof(%struct.jpeg_decompress_struct*, i32, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.jpeg_component_info*, align 8
  %12 = alloca %struct.jpeg_source_mgr*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i64, align 8
  %15 = alloca i32*, align 8
  %16 = alloca i32*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 5
  %19 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %18, align 8
  store %struct.jpeg_source_mgr* %19, %struct.jpeg_source_mgr** %12, align 8
  %20 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %21 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %20, i32 0, i32 0
  %22 = load i8*, i8** %21, align 8
  store i8* %22, i8** %13, align 8
  %23 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %24 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %23, i32 0, i32 1
  %25 = load i64, i64* %24, align 8
  store i64 %25, i64* %14, align 8
  %26 = load i32, i32* %6, align 4
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %27, i32 0, i32 44
  store i32 %26, i32* %28, align 8
  %29 = load i32, i32* %7, align 4
  %30 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %30, i32 0, i32 45
  store i32 %29, i32* %31, align 4
  br label %32

; <label>:32:                                     ; preds = %3
  %33 = load i64, i64* %14, align 8
  %34 = icmp eq i64 %33, 0
  br i1 %34, label %35, label %53

; <label>:35:                                     ; preds = %32
  %36 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %37 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %36, i32 0, i32 3
  %38 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %37, align 8
  %39 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %40 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %38 to i64
  call void @__llvm_profile_instrument_target(i64 %40, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i32 0)
  %41 = call i32 %38(%struct.jpeg_decompress_struct* %39)
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %45, label %43

; <label>:43:                                     ; preds = %35
  %pgocount = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 13)
  %44 = add i64 %pgocount, 1
  store i64 %44, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 13)
  store i32 0, i32* %4, align 4
  br label %591

; <label>:45:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 5)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 5)
  %47 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %48 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %47, i32 0, i32 0
  %49 = load i8*, i8** %48, align 8
  store i8* %49, i8** %13, align 8
  %50 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %51 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %50, i32 0, i32 1
  %52 = load i64, i64* %51, align 8
  store i64 %52, i64* %14, align 8
  br label %53

; <label>:53:                                     ; preds = %45, %32
  %54 = load i64, i64* %14, align 8
  %55 = add i64 %54, -1
  store i64 %55, i64* %14, align 8
  %56 = load i8*, i8** %13, align 8
  %57 = getelementptr inbounds i8, i8* %56, i32 1
  store i8* %57, i8** %13, align 8
  %58 = load i8, i8* %56, align 1
  %59 = zext i8 %58 to i32
  %60 = shl i32 %59, 8
  %61 = zext i32 %60 to i64
  store i64 %61, i64* %8, align 8
  %62 = load i64, i64* %14, align 8
  %63 = icmp eq i64 %62, 0
  br i1 %63, label %64, label %82

; <label>:64:                                     ; preds = %53
  %65 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %66 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %65, i32 0, i32 3
  %67 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %66, align 8
  %68 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %69 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %67 to i64
  call void @__llvm_profile_instrument_target(i64 %69, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i32 1)
  %70 = call i32 %67(%struct.jpeg_decompress_struct* %68)
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %74, label %72

; <label>:72:                                     ; preds = %64
  %pgocount2 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 15)
  %73 = add i64 %pgocount2, 1
  store i64 %73, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 15)
  store i32 0, i32* %4, align 4
  br label %591

; <label>:74:                                     ; preds = %64
  %pgocount3 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 6)
  %75 = add i64 %pgocount3, 1
  store i64 %75, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 6)
  %76 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %77 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %76, i32 0, i32 0
  %78 = load i8*, i8** %77, align 8
  store i8* %78, i8** %13, align 8
  %79 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %80 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %79, i32 0, i32 1
  %81 = load i64, i64* %80, align 8
  store i64 %81, i64* %14, align 8
  br label %82

; <label>:82:                                     ; preds = %74, %53
  %83 = load i64, i64* %14, align 8
  %84 = add i64 %83, -1
  store i64 %84, i64* %14, align 8
  %85 = load i8*, i8** %13, align 8
  %86 = getelementptr inbounds i8, i8* %85, i32 1
  store i8* %86, i8** %13, align 8
  %87 = load i8, i8* %85, align 1
  %88 = zext i8 %87 to i64
  %89 = load i64, i64* %8, align 8
  %90 = add nsw i64 %89, %88
  store i64 %90, i64* %8, align 8
  br label %91

; <label>:91:                                     ; preds = %82
  br label %92

; <label>:92:                                     ; preds = %91
  %93 = load i64, i64* %14, align 8
  %94 = icmp eq i64 %93, 0
  br i1 %94, label %95, label %113

; <label>:95:                                     ; preds = %92
  %96 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %97 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %96, i32 0, i32 3
  %98 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %97, align 8
  %99 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %100 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %98 to i64
  call void @__llvm_profile_instrument_target(i64 %100, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i32 2)
  %101 = call i32 %98(%struct.jpeg_decompress_struct* %99)
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %105, label %103

; <label>:103:                                    ; preds = %95
  %pgocount4 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 18)
  %104 = add i64 %pgocount4, 1
  store i64 %104, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 18)
  store i32 0, i32* %4, align 4
  br label %591

; <label>:105:                                    ; preds = %95
  %pgocount5 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 8)
  %106 = add i64 %pgocount5, 1
  store i64 %106, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 8)
  %107 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %108 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %107, i32 0, i32 0
  %109 = load i8*, i8** %108, align 8
  store i8* %109, i8** %13, align 8
  %110 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %111 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %110, i32 0, i32 1
  %112 = load i64, i64* %111, align 8
  store i64 %112, i64* %14, align 8
  br label %113

; <label>:113:                                    ; preds = %105, %92
  %114 = load i64, i64* %14, align 8
  %115 = add i64 %114, -1
  store i64 %115, i64* %14, align 8
  %116 = load i8*, i8** %13, align 8
  %117 = getelementptr inbounds i8, i8* %116, i32 1
  store i8* %117, i8** %13, align 8
  %118 = load i8, i8* %116, align 1
  %119 = zext i8 %118 to i32
  %120 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %121 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %120, i32 0, i32 42
  store i32 %119, i32* %121, align 8
  br label %122

; <label>:122:                                    ; preds = %113
  br label %123

; <label>:123:                                    ; preds = %122
  %124 = load i64, i64* %14, align 8
  %125 = icmp eq i64 %124, 0
  br i1 %125, label %126, label %144

; <label>:126:                                    ; preds = %123
  %127 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %128 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %127, i32 0, i32 3
  %129 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %128, align 8
  %130 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %131 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %129 to i64
  call void @__llvm_profile_instrument_target(i64 %131, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i32 3)
  %132 = call i32 %129(%struct.jpeg_decompress_struct* %130)
  %133 = icmp ne i32 %132, 0
  br i1 %133, label %136, label %134

; <label>:134:                                    ; preds = %126
  %pgocount6 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 20)
  %135 = add i64 %pgocount6, 1
  store i64 %135, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 20)
  store i32 0, i32* %4, align 4
  br label %591

; <label>:136:                                    ; preds = %126
  %pgocount7 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 9)
  %137 = add i64 %pgocount7, 1
  store i64 %137, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 9)
  %138 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %139 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %138, i32 0, i32 0
  %140 = load i8*, i8** %139, align 8
  store i8* %140, i8** %13, align 8
  %141 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %142 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %141, i32 0, i32 1
  %143 = load i64, i64* %142, align 8
  store i64 %143, i64* %14, align 8
  br label %144

; <label>:144:                                    ; preds = %136, %123
  %145 = load i64, i64* %14, align 8
  %146 = add i64 %145, -1
  store i64 %146, i64* %14, align 8
  %147 = load i8*, i8** %13, align 8
  %148 = getelementptr inbounds i8, i8* %147, i32 1
  store i8* %148, i8** %13, align 8
  %149 = load i8, i8* %147, align 1
  %150 = zext i8 %149 to i32
  %151 = shl i32 %150, 8
  %152 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %153 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %152, i32 0, i32 7
  store i32 %151, i32* %153, align 4
  %154 = load i64, i64* %14, align 8
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %156, label %174

; <label>:156:                                    ; preds = %144
  %157 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %158 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %157, i32 0, i32 3
  %159 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %158, align 8
  %160 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %161 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %159 to i64
  call void @__llvm_profile_instrument_target(i64 %161, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i32 4)
  %162 = call i32 %159(%struct.jpeg_decompress_struct* %160)
  %163 = icmp ne i32 %162, 0
  br i1 %163, label %166, label %164

; <label>:164:                                    ; preds = %156
  %pgocount8 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 22)
  %165 = add i64 %pgocount8, 1
  store i64 %165, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 22)
  store i32 0, i32* %4, align 4
  br label %591

; <label>:166:                                    ; preds = %156
  %pgocount9 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 14)
  %167 = add i64 %pgocount9, 1
  store i64 %167, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 14)
  %168 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %169 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %168, i32 0, i32 0
  %170 = load i8*, i8** %169, align 8
  store i8* %170, i8** %13, align 8
  %171 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %172 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %171, i32 0, i32 1
  %173 = load i64, i64* %172, align 8
  store i64 %173, i64* %14, align 8
  br label %174

; <label>:174:                                    ; preds = %166, %144
  %175 = load i64, i64* %14, align 8
  %176 = add i64 %175, -1
  store i64 %176, i64* %14, align 8
  %177 = load i8*, i8** %13, align 8
  %178 = getelementptr inbounds i8, i8* %177, i32 1
  store i8* %178, i8** %13, align 8
  %179 = load i8, i8* %177, align 1
  %180 = zext i8 %179 to i32
  %181 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %182 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %181, i32 0, i32 7
  %183 = load i32, i32* %182, align 4
  %184 = add i32 %183, %180
  store i32 %184, i32* %182, align 4
  br label %185

; <label>:185:                                    ; preds = %174
  br label %186

; <label>:186:                                    ; preds = %185
  %187 = load i64, i64* %14, align 8
  %188 = icmp eq i64 %187, 0
  br i1 %188, label %189, label %207

; <label>:189:                                    ; preds = %186
  %190 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %191 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %190, i32 0, i32 3
  %192 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %191, align 8
  %193 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %194 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %192 to i64
  call void @__llvm_profile_instrument_target(i64 %194, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i32 5)
  %195 = call i32 %192(%struct.jpeg_decompress_struct* %193)
  %196 = icmp ne i32 %195, 0
  br i1 %196, label %199, label %197

; <label>:197:                                    ; preds = %189
  %pgocount10 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 24)
  %198 = add i64 %pgocount10, 1
  store i64 %198, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 24)
  store i32 0, i32* %4, align 4
  br label %591

; <label>:199:                                    ; preds = %189
  %pgocount11 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 17)
  %200 = add i64 %pgocount11, 1
  store i64 %200, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 17)
  %201 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %202 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %201, i32 0, i32 0
  %203 = load i8*, i8** %202, align 8
  store i8* %203, i8** %13, align 8
  %204 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %205 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %204, i32 0, i32 1
  %206 = load i64, i64* %205, align 8
  store i64 %206, i64* %14, align 8
  br label %207

; <label>:207:                                    ; preds = %199, %186
  %208 = load i64, i64* %14, align 8
  %209 = add i64 %208, -1
  store i64 %209, i64* %14, align 8
  %210 = load i8*, i8** %13, align 8
  %211 = getelementptr inbounds i8, i8* %210, i32 1
  store i8* %211, i8** %13, align 8
  %212 = load i8, i8* %210, align 1
  %213 = zext i8 %212 to i32
  %214 = shl i32 %213, 8
  %215 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %216 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %215, i32 0, i32 6
  store i32 %214, i32* %216, align 8
  %217 = load i64, i64* %14, align 8
  %218 = icmp eq i64 %217, 0
  br i1 %218, label %219, label %237

; <label>:219:                                    ; preds = %207
  %220 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %221 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %220, i32 0, i32 3
  %222 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %221, align 8
  %223 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %224 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %222 to i64
  call void @__llvm_profile_instrument_target(i64 %224, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i32 6)
  %225 = call i32 %222(%struct.jpeg_decompress_struct* %223)
  %226 = icmp ne i32 %225, 0
  br i1 %226, label %229, label %227

; <label>:227:                                    ; preds = %219
  %pgocount12 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 25)
  %228 = add i64 %pgocount12, 1
  store i64 %228, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 25)
  store i32 0, i32* %4, align 4
  br label %591

; <label>:229:                                    ; preds = %219
  %pgocount13 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 19)
  %230 = add i64 %pgocount13, 1
  store i64 %230, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 19)
  %231 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %232 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %231, i32 0, i32 0
  %233 = load i8*, i8** %232, align 8
  store i8* %233, i8** %13, align 8
  %234 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %235 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %234, i32 0, i32 1
  %236 = load i64, i64* %235, align 8
  store i64 %236, i64* %14, align 8
  br label %237

; <label>:237:                                    ; preds = %229, %207
  %238 = load i64, i64* %14, align 8
  %239 = add i64 %238, -1
  store i64 %239, i64* %14, align 8
  %240 = load i8*, i8** %13, align 8
  %241 = getelementptr inbounds i8, i8* %240, i32 1
  store i8* %241, i8** %13, align 8
  %242 = load i8, i8* %240, align 1
  %243 = zext i8 %242 to i32
  %244 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %245 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %244, i32 0, i32 6
  %246 = load i32, i32* %245, align 8
  %247 = add i32 %246, %243
  store i32 %247, i32* %245, align 8
  br label %248

; <label>:248:                                    ; preds = %237
  br label %249

; <label>:249:                                    ; preds = %248
  %250 = load i64, i64* %14, align 8
  %251 = icmp eq i64 %250, 0
  br i1 %251, label %252, label %270

; <label>:252:                                    ; preds = %249
  %253 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %254 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %253, i32 0, i32 3
  %255 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %254, align 8
  %256 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %257 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %255 to i64
  call void @__llvm_profile_instrument_target(i64 %257, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i32 7)
  %258 = call i32 %255(%struct.jpeg_decompress_struct* %256)
  %259 = icmp ne i32 %258, 0
  br i1 %259, label %262, label %260

; <label>:260:                                    ; preds = %252
  %pgocount14 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 29)
  %261 = add i64 %pgocount14, 1
  store i64 %261, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 29)
  store i32 0, i32* %4, align 4
  br label %591

; <label>:262:                                    ; preds = %252
  %pgocount15 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 21)
  %263 = add i64 %pgocount15, 1
  store i64 %263, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 21)
  %264 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %265 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %264, i32 0, i32 0
  %266 = load i8*, i8** %265, align 8
  store i8* %266, i8** %13, align 8
  %267 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %268 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %267, i32 0, i32 1
  %269 = load i64, i64* %268, align 8
  store i64 %269, i64* %14, align 8
  br label %270

; <label>:270:                                    ; preds = %262, %249
  %271 = load i64, i64* %14, align 8
  %272 = add i64 %271, -1
  store i64 %272, i64* %14, align 8
  %273 = load i8*, i8** %13, align 8
  %274 = getelementptr inbounds i8, i8* %273, i32 1
  store i8* %274, i8** %13, align 8
  %275 = load i8, i8* %273, align 1
  %276 = zext i8 %275 to i32
  %277 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %278 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %277, i32 0, i32 8
  store i32 %276, i32* %278, align 8
  br label %279

; <label>:279:                                    ; preds = %270
  %280 = load i64, i64* %8, align 8
  %281 = sub nsw i64 %280, 8
  store i64 %281, i64* %8, align 8
  br label %282

; <label>:282:                                    ; preds = %279
  %283 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %284 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %283, i32 0, i32 0
  %285 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %284, align 8
  %286 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %285, i32 0, i32 6
  %287 = bitcast %union.anon* %286 to [8 x i32]*
  %288 = getelementptr inbounds [8 x i32], [8 x i32]* %287, i32 0, i32 0
  store i32* %288, i32** %15, align 8
  %289 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %290 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %289, i32 0, i32 72
  %291 = load i32, i32* %290, align 4
  %292 = load i32*, i32** %15, align 8
  %293 = getelementptr inbounds i32, i32* %292, i64 0
  store i32 %291, i32* %293, align 4
  %294 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %295 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %294, i32 0, i32 6
  %296 = load i32, i32* %295, align 8
  %297 = load i32*, i32** %15, align 8
  %298 = getelementptr inbounds i32, i32* %297, i64 1
  store i32 %296, i32* %298, align 4
  %299 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %300 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %299, i32 0, i32 7
  %301 = load i32, i32* %300, align 4
  %302 = load i32*, i32** %15, align 8
  %303 = getelementptr inbounds i32, i32* %302, i64 2
  store i32 %301, i32* %303, align 4
  %304 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %305 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %304, i32 0, i32 8
  %306 = load i32, i32* %305, align 8
  %307 = load i32*, i32** %15, align 8
  %308 = getelementptr inbounds i32, i32* %307, i64 3
  store i32 %306, i32* %308, align 4
  %309 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %310 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %309, i32 0, i32 0
  %311 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %310, align 8
  %312 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %311, i32 0, i32 5
  store i32 99, i32* %312, align 8
  %313 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %314 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %313, i32 0, i32 0
  %315 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %314, align 8
  %316 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %315, i32 0, i32 1
  %317 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %316, align 8
  %318 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %319 = bitcast %struct.jpeg_decompress_struct* %318 to %struct.jpeg_common_struct*
  %320 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %317 to i64
  call void @__llvm_profile_instrument_target(i64 %320, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i32 8)
  call void %317(%struct.jpeg_common_struct* %319, i32 1)
  br label %321

; <label>:321:                                    ; preds = %282
  %322 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %323 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %322, i32 0, i32 78
  %324 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %323, align 8
  %325 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %324, i32 0, i32 6
  %326 = load i32, i32* %325, align 4
  %327 = icmp ne i32 %326, 0
  br i1 %327, label %328, label %342

; <label>:328:                                    ; preds = %321
  %pgocount16 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 7)
  %329 = add i64 %pgocount16, 1
  store i64 %329, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 7)
  %330 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %331 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %330, i32 0, i32 0
  %332 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %331, align 8
  %333 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %332, i32 0, i32 5
  store i32 57, i32* %333, align 8
  %334 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %335 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %334, i32 0, i32 0
  %336 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %335, align 8
  %337 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %336, i32 0, i32 0
  %338 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %337, align 8
  %339 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %340 = bitcast %struct.jpeg_decompress_struct* %339 to %struct.jpeg_common_struct*
  %341 = ptrtoint void (%struct.jpeg_common_struct*)* %338 to i64
  call void @__llvm_profile_instrument_target(i64 %341, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i32 9)
  call void %338(%struct.jpeg_common_struct* %340)
  br label %342

; <label>:342:                                    ; preds = %328, %321
  %343 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %344 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %343, i32 0, i32 7
  %345 = load i32, i32* %344, align 4
  %346 = icmp ule i32 %345, 0
  br i1 %346, label %359, label %347

; <label>:347:                                    ; preds = %342
  %pgocount17 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 10)
  %348 = add i64 %pgocount17, 1
  store i64 %348, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 10)
  %349 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %350 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %349, i32 0, i32 6
  %351 = load i32, i32* %350, align 8
  %352 = icmp ule i32 %351, 0
  br i1 %352, label %359, label %353

; <label>:353:                                    ; preds = %347
  %pgocount18 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 23)
  %354 = add i64 %pgocount18, 1
  store i64 %354, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 23)
  %355 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %356 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %355, i32 0, i32 8
  %357 = load i32, i32* %356, align 8
  %358 = icmp sle i32 %357, 0
  br i1 %358, label %359, label %373

; <label>:359:                                    ; preds = %353, %347, %342
  %pgocount19 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 4)
  %360 = add i64 %pgocount19, 1
  store i64 %360, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 4)
  %361 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %362 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %361, i32 0, i32 0
  %363 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %362, align 8
  %364 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %363, i32 0, i32 5
  store i32 31, i32* %364, align 8
  %365 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %366 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %365, i32 0, i32 0
  %367 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %366, align 8
  %368 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %367, i32 0, i32 0
  %369 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %368, align 8
  %370 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %371 = bitcast %struct.jpeg_decompress_struct* %370 to %struct.jpeg_common_struct*
  %372 = ptrtoint void (%struct.jpeg_common_struct*)* %369 to i64
  call void @__llvm_profile_instrument_target(i64 %372, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i32 10)
  call void %369(%struct.jpeg_common_struct* %371)
  br label %373

; <label>:373:                                    ; preds = %359, %353
  %374 = load i64, i64* %8, align 8
  %375 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %376 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %375, i32 0, i32 8
  %377 = load i32, i32* %376, align 8
  %378 = mul nsw i32 %377, 3
  %379 = sext i32 %378 to i64
  %380 = icmp ne i64 %374, %379
  br i1 %380, label %381, label %395

; <label>:381:                                    ; preds = %373
  %pgocount20 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 11)
  %382 = add i64 %pgocount20, 1
  store i64 %382, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 11)
  %383 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %384 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %383, i32 0, i32 0
  %385 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %384, align 8
  %386 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %385, i32 0, i32 5
  store i32 9, i32* %386, align 8
  %387 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %388 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %387, i32 0, i32 0
  %389 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %388, align 8
  %390 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %389, i32 0, i32 0
  %391 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %390, align 8
  %392 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %393 = bitcast %struct.jpeg_decompress_struct* %392 to %struct.jpeg_common_struct*
  %394 = ptrtoint void (%struct.jpeg_common_struct*)* %391 to i64
  call void @__llvm_profile_instrument_target(i64 %394, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i32 11)
  call void %391(%struct.jpeg_common_struct* %393)
  br label %395

; <label>:395:                                    ; preds = %381, %373
  %396 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %397 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %396, i32 0, i32 43
  %398 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %397, align 8
  %399 = icmp eq %struct.jpeg_component_info* %398, null
  br i1 %399, label %400, label %419

; <label>:400:                                    ; preds = %395
  %pgocount21 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 16)
  %401 = add i64 %pgocount21, 1
  store i64 %401, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 16)
  %402 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %403 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %402, i32 0, i32 1
  %404 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %403, align 8
  %405 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %404, i32 0, i32 0
  %406 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %405, align 8
  %407 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %408 = bitcast %struct.jpeg_decompress_struct* %407 to %struct.jpeg_common_struct*
  %409 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %410 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %409, i32 0, i32 8
  %411 = load i32, i32* %410, align 8
  %412 = sext i32 %411 to i64
  %413 = mul i64 %412, 96
  %414 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %406 to i64
  call void @__llvm_profile_instrument_target(i64 %414, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i32 12)
  %415 = call i8* %406(%struct.jpeg_common_struct* %408, i32 1, i64 %413)
  %416 = bitcast i8* %415 to %struct.jpeg_component_info*
  %417 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %418 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %417, i32 0, i32 43
  store %struct.jpeg_component_info* %416, %struct.jpeg_component_info** %418, align 8
  br label %419

; <label>:419:                                    ; preds = %400, %395
  store i32 0, i32* %10, align 4
  %420 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %421 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %420, i32 0, i32 43
  %422 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %421, align 8
  store %struct.jpeg_component_info* %422, %struct.jpeg_component_info** %11, align 8
  br label %423

; <label>:423:                                    ; preds = %573, %419
  %424 = load i32, i32* %10, align 4
  %425 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %426 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %425, i32 0, i32 8
  %427 = load i32, i32* %426, align 8
  %428 = icmp slt i32 %424, %427
  br i1 %428, label %429, label %579

; <label>:429:                                    ; preds = %423
  %430 = load i32, i32* %10, align 4
  %431 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %11, align 8
  %432 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %431, i32 0, i32 1
  store i32 %430, i32* %432, align 4
  br label %433

; <label>:433:                                    ; preds = %429
  %434 = load i64, i64* %14, align 8
  %435 = icmp eq i64 %434, 0
  br i1 %435, label %436, label %454

; <label>:436:                                    ; preds = %433
  %437 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %438 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %437, i32 0, i32 3
  %439 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %438, align 8
  %440 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %441 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %439 to i64
  call void @__llvm_profile_instrument_target(i64 %441, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i32 13)
  %442 = call i32 %439(%struct.jpeg_decompress_struct* %440)
  %443 = icmp ne i32 %442, 0
  br i1 %443, label %446, label %444

; <label>:444:                                    ; preds = %436
  %pgocount22 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 26)
  %445 = add i64 %pgocount22, 1
  store i64 %445, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 26)
  store i32 0, i32* %4, align 4
  br label %591

; <label>:446:                                    ; preds = %436
  %pgocount23 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 1)
  %447 = add i64 %pgocount23, 1
  store i64 %447, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 1)
  %448 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %449 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %448, i32 0, i32 0
  %450 = load i8*, i8** %449, align 8
  store i8* %450, i8** %13, align 8
  %451 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %452 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %451, i32 0, i32 1
  %453 = load i64, i64* %452, align 8
  store i64 %453, i64* %14, align 8
  br label %454

; <label>:454:                                    ; preds = %446, %433
  %455 = load i64, i64* %14, align 8
  %456 = add i64 %455, -1
  store i64 %456, i64* %14, align 8
  %457 = load i8*, i8** %13, align 8
  %458 = getelementptr inbounds i8, i8* %457, i32 1
  store i8* %458, i8** %13, align 8
  %459 = load i8, i8* %457, align 1
  %460 = zext i8 %459 to i32
  %461 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %11, align 8
  %462 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %461, i32 0, i32 0
  store i32 %460, i32* %462, align 8
  br label %463

; <label>:463:                                    ; preds = %454
  br label %464

; <label>:464:                                    ; preds = %463
  %465 = load i64, i64* %14, align 8
  %466 = icmp eq i64 %465, 0
  br i1 %466, label %467, label %485

; <label>:467:                                    ; preds = %464
  %468 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %469 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %468, i32 0, i32 3
  %470 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %469, align 8
  %471 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %472 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %470 to i64
  call void @__llvm_profile_instrument_target(i64 %472, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i32 14)
  %473 = call i32 %470(%struct.jpeg_decompress_struct* %471)
  %474 = icmp ne i32 %473, 0
  br i1 %474, label %477, label %475

; <label>:475:                                    ; preds = %467
  %pgocount24 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 27)
  %476 = add i64 %pgocount24, 1
  store i64 %476, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 27)
  store i32 0, i32* %4, align 4
  br label %591

; <label>:477:                                    ; preds = %467
  %pgocount25 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 2)
  %478 = add i64 %pgocount25, 1
  store i64 %478, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 2)
  %479 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %480 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %479, i32 0, i32 0
  %481 = load i8*, i8** %480, align 8
  store i8* %481, i8** %13, align 8
  %482 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %483 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %482, i32 0, i32 1
  %484 = load i64, i64* %483, align 8
  store i64 %484, i64* %14, align 8
  br label %485

; <label>:485:                                    ; preds = %477, %464
  %486 = load i64, i64* %14, align 8
  %487 = add i64 %486, -1
  store i64 %487, i64* %14, align 8
  %488 = load i8*, i8** %13, align 8
  %489 = getelementptr inbounds i8, i8* %488, i32 1
  store i8* %489, i8** %13, align 8
  %490 = load i8, i8* %488, align 1
  %491 = zext i8 %490 to i32
  store i32 %491, i32* %9, align 4
  br label %492

; <label>:492:                                    ; preds = %485
  %493 = load i32, i32* %9, align 4
  %494 = ashr i32 %493, 4
  %495 = and i32 %494, 15
  %496 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %11, align 8
  %497 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %496, i32 0, i32 2
  store i32 %495, i32* %497, align 8
  %498 = load i32, i32* %9, align 4
  %499 = and i32 %498, 15
  %500 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %11, align 8
  %501 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %500, i32 0, i32 3
  store i32 %499, i32* %501, align 4
  br label %502

; <label>:502:                                    ; preds = %492
  %503 = load i64, i64* %14, align 8
  %504 = icmp eq i64 %503, 0
  br i1 %504, label %505, label %523

; <label>:505:                                    ; preds = %502
  %506 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %507 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %506, i32 0, i32 3
  %508 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %507, align 8
  %509 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %510 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %508 to i64
  call void @__llvm_profile_instrument_target(i64 %510, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i32 15)
  %511 = call i32 %508(%struct.jpeg_decompress_struct* %509)
  %512 = icmp ne i32 %511, 0
  br i1 %512, label %515, label %513

; <label>:513:                                    ; preds = %505
  %pgocount26 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 28)
  %514 = add i64 %pgocount26, 1
  store i64 %514, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 28)
  store i32 0, i32* %4, align 4
  br label %591

; <label>:515:                                    ; preds = %505
  %pgocount27 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 3)
  %516 = add i64 %pgocount27, 1
  store i64 %516, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 3)
  %517 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %518 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %517, i32 0, i32 0
  %519 = load i8*, i8** %518, align 8
  store i8* %519, i8** %13, align 8
  %520 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %521 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %520, i32 0, i32 1
  %522 = load i64, i64* %521, align 8
  store i64 %522, i64* %14, align 8
  br label %523

; <label>:523:                                    ; preds = %515, %502
  %524 = load i64, i64* %14, align 8
  %525 = add i64 %524, -1
  store i64 %525, i64* %14, align 8
  %526 = load i8*, i8** %13, align 8
  %527 = getelementptr inbounds i8, i8* %526, i32 1
  store i8* %527, i8** %13, align 8
  %528 = load i8, i8* %526, align 1
  %529 = zext i8 %528 to i32
  %530 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %11, align 8
  %531 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %530, i32 0, i32 4
  store i32 %529, i32* %531, align 8
  br label %532

; <label>:532:                                    ; preds = %523
  br label %533

; <label>:533:                                    ; preds = %532
  %534 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %535 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %534, i32 0, i32 0
  %536 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %535, align 8
  %537 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %536, i32 0, i32 6
  %538 = bitcast %union.anon* %537 to [8 x i32]*
  %539 = getelementptr inbounds [8 x i32], [8 x i32]* %538, i32 0, i32 0
  store i32* %539, i32** %16, align 8
  %540 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %11, align 8
  %541 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %540, i32 0, i32 0
  %542 = load i32, i32* %541, align 8
  %543 = load i32*, i32** %16, align 8
  %544 = getelementptr inbounds i32, i32* %543, i64 0
  store i32 %542, i32* %544, align 4
  %545 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %11, align 8
  %546 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %545, i32 0, i32 2
  %547 = load i32, i32* %546, align 8
  %548 = load i32*, i32** %16, align 8
  %549 = getelementptr inbounds i32, i32* %548, i64 1
  store i32 %547, i32* %549, align 4
  %550 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %11, align 8
  %551 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %550, i32 0, i32 3
  %552 = load i32, i32* %551, align 4
  %553 = load i32*, i32** %16, align 8
  %554 = getelementptr inbounds i32, i32* %553, i64 2
  store i32 %552, i32* %554, align 4
  %555 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %11, align 8
  %556 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %555, i32 0, i32 4
  %557 = load i32, i32* %556, align 8
  %558 = load i32*, i32** %16, align 8
  %559 = getelementptr inbounds i32, i32* %558, i64 3
  store i32 %557, i32* %559, align 4
  %560 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %561 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %560, i32 0, i32 0
  %562 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %561, align 8
  %563 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %562, i32 0, i32 5
  store i32 100, i32* %563, align 8
  %564 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %565 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %564, i32 0, i32 0
  %566 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %565, align 8
  %567 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %566, i32 0, i32 1
  %568 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %567, align 8
  %569 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %570 = bitcast %struct.jpeg_decompress_struct* %569 to %struct.jpeg_common_struct*
  %571 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %568 to i64
  call void @__llvm_profile_instrument_target(i64 %571, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sof to i8*), i32 16)
  call void %568(%struct.jpeg_common_struct* %570, i32 1)
  br label %572

; <label>:572:                                    ; preds = %533
  br label %573

; <label>:573:                                    ; preds = %572
  %pgocount28 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 0)
  %574 = add i64 %pgocount28, 1
  store i64 %574, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 0)
  %575 = load i32, i32* %10, align 4
  %576 = add nsw i32 %575, 1
  store i32 %576, i32* %10, align 4
  %577 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %11, align 8
  %578 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %577, i32 1
  store %struct.jpeg_component_info* %578, %struct.jpeg_component_info** %11, align 8
  br label %423

; <label>:579:                                    ; preds = %423
  %pgocount29 = load i64, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 12)
  %580 = add i64 %pgocount29, 1
  store i64 %580, i64* getelementptr inbounds ([30 x i64], [30 x i64]* @__profc_tmp1.ll_get_sof, i64 0, i64 12)
  %581 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %582 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %581, i32 0, i32 78
  %583 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %582, align 8
  %584 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %583, i32 0, i32 6
  store i32 1, i32* %584, align 4
  %585 = load i8*, i8** %13, align 8
  %586 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %587 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %586, i32 0, i32 0
  store i8* %585, i8** %587, align 8
  %588 = load i64, i64* %14, align 8
  %589 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %12, align 8
  %590 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %589, i32 0, i32 1
  store i64 %588, i64* %590, align 8
  store i32 1, i32* %4, align 4
  br label %591

; <label>:591:                                    ; preds = %579, %513, %475, %444, %260, %227, %197, %164, %134, %103, %72, %43
  %592 = load i32, i32* %4, align 4
  ret i32 %592
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_sos(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.jpeg_component_info*, align 8
  %11 = alloca %struct.jpeg_source_mgr*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i64, align 8
  %14 = alloca i32*, align 8
  %15 = alloca i32*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 5
  %18 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %17, align 8
  store %struct.jpeg_source_mgr* %18, %struct.jpeg_source_mgr** %11, align 8
  %19 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %20 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %19, i32 0, i32 0
  %21 = load i8*, i8** %20, align 8
  store i8* %21, i8** %12, align 8
  %22 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %23 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %22, i32 0, i32 1
  %24 = load i64, i64* %23, align 8
  store i64 %24, i64* %13, align 8
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %25, i32 0, i32 78
  %27 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %27, i32 0, i32 6
  %29 = load i32, i32* %28, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %45, label %31

; <label>:31:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 6)
  %32 = add i64 %pgocount, 1
  store i64 %32, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 6)
  %33 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %33, i32 0, i32 0
  %35 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %35, i32 0, i32 5
  store i32 61, i32* %36, align 8
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %37, i32 0, i32 0
  %39 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %40 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %39, i32 0, i32 0
  %41 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %40, align 8
  %42 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %43 = bitcast %struct.jpeg_decompress_struct* %42 to %struct.jpeg_common_struct*
  %44 = ptrtoint void (%struct.jpeg_common_struct*)* %41 to i64
  call void @__llvm_profile_instrument_target(i64 %44, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sos to i8*), i32 0)
  call void %41(%struct.jpeg_common_struct* %43)
  br label %45

; <label>:45:                                     ; preds = %31, %1
  br label %46

; <label>:46:                                     ; preds = %45
  %47 = load i64, i64* %13, align 8
  %48 = icmp eq i64 %47, 0
  br i1 %48, label %49, label %67

; <label>:49:                                     ; preds = %46
  %50 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %51 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %50, i32 0, i32 3
  %52 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %51, align 8
  %53 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %54 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %52 to i64
  call void @__llvm_profile_instrument_target(i64 %54, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sos to i8*), i32 1)
  %55 = call i32 %52(%struct.jpeg_decompress_struct* %53)
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %59, label %57

; <label>:57:                                     ; preds = %49
  %pgocount1 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 13)
  %58 = add i64 %pgocount1, 1
  store i64 %58, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 13)
  store i32 0, i32* %2, align 4
  br label %504

; <label>:59:                                     ; preds = %49
  %pgocount2 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 8)
  %60 = add i64 %pgocount2, 1
  store i64 %60, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 8)
  %61 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %62 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %61, i32 0, i32 0
  %63 = load i8*, i8** %62, align 8
  store i8* %63, i8** %12, align 8
  %64 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %65 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %64, i32 0, i32 1
  %66 = load i64, i64* %65, align 8
  store i64 %66, i64* %13, align 8
  br label %67

; <label>:67:                                     ; preds = %59, %46
  %68 = load i64, i64* %13, align 8
  %69 = add i64 %68, -1
  store i64 %69, i64* %13, align 8
  %70 = load i8*, i8** %12, align 8
  %71 = getelementptr inbounds i8, i8* %70, i32 1
  store i8* %71, i8** %12, align 8
  %72 = load i8, i8* %70, align 1
  %73 = zext i8 %72 to i32
  %74 = shl i32 %73, 8
  %75 = zext i32 %74 to i64
  store i64 %75, i64* %4, align 8
  %76 = load i64, i64* %13, align 8
  %77 = icmp eq i64 %76, 0
  br i1 %77, label %78, label %96

; <label>:78:                                     ; preds = %67
  %79 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %80 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %79, i32 0, i32 3
  %81 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %80, align 8
  %82 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %83 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %81 to i64
  call void @__llvm_profile_instrument_target(i64 %83, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sos to i8*), i32 2)
  %84 = call i32 %81(%struct.jpeg_decompress_struct* %82)
  %85 = icmp ne i32 %84, 0
  br i1 %85, label %88, label %86

; <label>:86:                                     ; preds = %78
  %pgocount3 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 16)
  %87 = add i64 %pgocount3, 1
  store i64 %87, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 16)
  store i32 0, i32* %2, align 4
  br label %504

; <label>:88:                                     ; preds = %78
  %pgocount4 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 10)
  %89 = add i64 %pgocount4, 1
  store i64 %89, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 10)
  %90 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %91 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %90, i32 0, i32 0
  %92 = load i8*, i8** %91, align 8
  store i8* %92, i8** %12, align 8
  %93 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %94 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %93, i32 0, i32 1
  %95 = load i64, i64* %94, align 8
  store i64 %95, i64* %13, align 8
  br label %96

; <label>:96:                                     ; preds = %88, %67
  %97 = load i64, i64* %13, align 8
  %98 = add i64 %97, -1
  store i64 %98, i64* %13, align 8
  %99 = load i8*, i8** %12, align 8
  %100 = getelementptr inbounds i8, i8* %99, i32 1
  store i8* %100, i8** %12, align 8
  %101 = load i8, i8* %99, align 1
  %102 = zext i8 %101 to i64
  %103 = load i64, i64* %4, align 8
  %104 = add nsw i64 %103, %102
  store i64 %104, i64* %4, align 8
  br label %105

; <label>:105:                                    ; preds = %96
  br label %106

; <label>:106:                                    ; preds = %105
  %107 = load i64, i64* %13, align 8
  %108 = icmp eq i64 %107, 0
  br i1 %108, label %109, label %127

; <label>:109:                                    ; preds = %106
  %110 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %111 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %110, i32 0, i32 3
  %112 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %111, align 8
  %113 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %114 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %112 to i64
  call void @__llvm_profile_instrument_target(i64 %114, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sos to i8*), i32 3)
  %115 = call i32 %112(%struct.jpeg_decompress_struct* %113)
  %116 = icmp ne i32 %115, 0
  br i1 %116, label %119, label %117

; <label>:117:                                    ; preds = %109
  %pgocount5 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 17)
  %118 = add i64 %pgocount5, 1
  store i64 %118, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 17)
  store i32 0, i32* %2, align 4
  br label %504

; <label>:119:                                    ; preds = %109
  %pgocount6 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 12)
  %120 = add i64 %pgocount6, 1
  store i64 %120, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 12)
  %121 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %122 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %121, i32 0, i32 0
  %123 = load i8*, i8** %122, align 8
  store i8* %123, i8** %12, align 8
  %124 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %125 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %124, i32 0, i32 1
  %126 = load i64, i64* %125, align 8
  store i64 %126, i64* %13, align 8
  br label %127

; <label>:127:                                    ; preds = %119, %106
  %128 = load i64, i64* %13, align 8
  %129 = add i64 %128, -1
  store i64 %129, i64* %13, align 8
  %130 = load i8*, i8** %12, align 8
  %131 = getelementptr inbounds i8, i8* %130, i32 1
  store i8* %131, i8** %12, align 8
  %132 = load i8, i8* %130, align 1
  %133 = zext i8 %132 to i32
  store i32 %133, i32* %7, align 4
  br label %134

; <label>:134:                                    ; preds = %127
  %135 = load i64, i64* %4, align 8
  %136 = load i32, i32* %7, align 4
  %137 = mul nsw i32 %136, 2
  %138 = add nsw i32 %137, 6
  %139 = sext i32 %138 to i64
  %140 = icmp ne i64 %135, %139
  br i1 %140, label %149, label %141

; <label>:141:                                    ; preds = %134
  %pgocount7 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 7)
  %142 = add i64 %pgocount7, 1
  store i64 %142, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 7)
  %143 = load i32, i32* %7, align 4
  %144 = icmp slt i32 %143, 1
  br i1 %144, label %149, label %145

; <label>:145:                                    ; preds = %141
  %pgocount8 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 11)
  %146 = add i64 %pgocount8, 1
  store i64 %146, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 11)
  %147 = load i32, i32* %7, align 4
  %148 = icmp sgt i32 %147, 4
  br i1 %148, label %149, label %163

; <label>:149:                                    ; preds = %145, %141, %134
  %pgocount9 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 5)
  %150 = add i64 %pgocount9, 1
  store i64 %150, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 5)
  %151 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %152 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %151, i32 0, i32 0
  %153 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %152, align 8
  %154 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %153, i32 0, i32 5
  store i32 9, i32* %154, align 8
  %155 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %156 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %155, i32 0, i32 0
  %157 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %156, align 8
  %158 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %157, i32 0, i32 0
  %159 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %158, align 8
  %160 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %161 = bitcast %struct.jpeg_decompress_struct* %160 to %struct.jpeg_common_struct*
  %162 = ptrtoint void (%struct.jpeg_common_struct*)* %159 to i64
  call void @__llvm_profile_instrument_target(i64 %162, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sos to i8*), i32 4)
  call void %159(%struct.jpeg_common_struct* %161)
  br label %163

; <label>:163:                                    ; preds = %149, %145
  %164 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %165 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %164, i32 0, i32 0
  %166 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %165, align 8
  %167 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %166, i32 0, i32 5
  store i32 102, i32* %167, align 8
  %168 = load i32, i32* %7, align 4
  %169 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %170 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %169, i32 0, i32 0
  %171 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %170, align 8
  %172 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %171, i32 0, i32 6
  %173 = bitcast %union.anon* %172 to [8 x i32]*
  %174 = getelementptr inbounds [8 x i32], [8 x i32]* %173, i64 0, i64 0
  store i32 %168, i32* %174, align 4
  %175 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %176 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %175, i32 0, i32 0
  %177 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %176, align 8
  %178 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %177, i32 0, i32 1
  %179 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %178, align 8
  %180 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %181 = bitcast %struct.jpeg_decompress_struct* %180 to %struct.jpeg_common_struct*
  %182 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %179 to i64
  call void @__llvm_profile_instrument_target(i64 %182, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sos to i8*), i32 5)
  call void %179(%struct.jpeg_common_struct* %181, i32 1)
  %183 = load i32, i32* %7, align 4
  %184 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %185 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %184, i32 0, i32 62
  store i32 %183, i32* %185, align 8
  store i32 0, i32* %5, align 4
  br label %186

; <label>:186:                                    ; preds = %343, %163
  %187 = load i32, i32* %5, align 4
  %188 = load i32, i32* %7, align 4
  %189 = icmp slt i32 %187, %188
  br i1 %189, label %190, label %346

; <label>:190:                                    ; preds = %186
  br label %191

; <label>:191:                                    ; preds = %190
  %192 = load i64, i64* %13, align 8
  %193 = icmp eq i64 %192, 0
  br i1 %193, label %194, label %212

; <label>:194:                                    ; preds = %191
  %195 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %196 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %195, i32 0, i32 3
  %197 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %196, align 8
  %198 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %199 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %197 to i64
  call void @__llvm_profile_instrument_target(i64 %199, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sos to i8*), i32 6)
  %200 = call i32 %197(%struct.jpeg_decompress_struct* %198)
  %201 = icmp ne i32 %200, 0
  br i1 %201, label %204, label %202

; <label>:202:                                    ; preds = %194
  %pgocount10 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 14)
  %203 = add i64 %pgocount10, 1
  store i64 %203, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 14)
  store i32 0, i32* %2, align 4
  br label %504

; <label>:204:                                    ; preds = %194
  %pgocount11 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 3)
  %205 = add i64 %pgocount11, 1
  store i64 %205, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 3)
  %206 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %207 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %206, i32 0, i32 0
  %208 = load i8*, i8** %207, align 8
  store i8* %208, i8** %12, align 8
  %209 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %210 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %209, i32 0, i32 1
  %211 = load i64, i64* %210, align 8
  store i64 %211, i64* %13, align 8
  br label %212

; <label>:212:                                    ; preds = %204, %191
  %213 = load i64, i64* %13, align 8
  %214 = add i64 %213, -1
  store i64 %214, i64* %13, align 8
  %215 = load i8*, i8** %12, align 8
  %216 = getelementptr inbounds i8, i8* %215, i32 1
  store i8* %216, i8** %12, align 8
  %217 = load i8, i8* %215, align 1
  %218 = zext i8 %217 to i32
  store i32 %218, i32* %9, align 4
  br label %219

; <label>:219:                                    ; preds = %212
  br label %220

; <label>:220:                                    ; preds = %219
  %221 = load i64, i64* %13, align 8
  %222 = icmp eq i64 %221, 0
  br i1 %222, label %223, label %241

; <label>:223:                                    ; preds = %220
  %224 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %225 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %224, i32 0, i32 3
  %226 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %225, align 8
  %227 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %228 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %226 to i64
  call void @__llvm_profile_instrument_target(i64 %228, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sos to i8*), i32 7)
  %229 = call i32 %226(%struct.jpeg_decompress_struct* %227)
  %230 = icmp ne i32 %229, 0
  br i1 %230, label %233, label %231

; <label>:231:                                    ; preds = %223
  %pgocount12 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 15)
  %232 = add i64 %pgocount12, 1
  store i64 %232, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 15)
  store i32 0, i32* %2, align 4
  br label %504

; <label>:233:                                    ; preds = %223
  %pgocount13 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 4)
  %234 = add i64 %pgocount13, 1
  store i64 %234, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 4)
  %235 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %236 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %235, i32 0, i32 0
  %237 = load i8*, i8** %236, align 8
  store i8* %237, i8** %12, align 8
  %238 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %239 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %238, i32 0, i32 1
  %240 = load i64, i64* %239, align 8
  store i64 %240, i64* %13, align 8
  br label %241

; <label>:241:                                    ; preds = %233, %220
  %242 = load i64, i64* %13, align 8
  %243 = add i64 %242, -1
  store i64 %243, i64* %13, align 8
  %244 = load i8*, i8** %12, align 8
  %245 = getelementptr inbounds i8, i8* %244, i32 1
  store i8* %245, i8** %12, align 8
  %246 = load i8, i8* %244, align 1
  %247 = zext i8 %246 to i32
  store i32 %247, i32* %8, align 4
  br label %248

; <label>:248:                                    ; preds = %241
  store i32 0, i32* %6, align 4
  %249 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %250 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %249, i32 0, i32 43
  %251 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %250, align 8
  store %struct.jpeg_component_info* %251, %struct.jpeg_component_info** %10, align 8
  br label %252

; <label>:252:                                    ; preds = %267, %248
  %253 = load i32, i32* %6, align 4
  %254 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %255 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %254, i32 0, i32 8
  %256 = load i32, i32* %255, align 8
  %257 = icmp slt i32 %253, %256
  br i1 %257, label %258, label %273

; <label>:258:                                    ; preds = %252
  %259 = load i32, i32* %9, align 4
  %260 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %10, align 8
  %261 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %260, i32 0, i32 0
  %262 = load i32, i32* %261, align 8
  %263 = icmp eq i32 %259, %262
  br i1 %263, label %264, label %266

; <label>:264:                                    ; preds = %258
  %pgocount14 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 2)
  %265 = add i64 %pgocount14, 1
  store i64 %265, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 2)
  br label %294

; <label>:266:                                    ; preds = %258
  br label %267

; <label>:267:                                    ; preds = %266
  %pgocount15 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 0)
  %268 = add i64 %pgocount15, 1
  store i64 %268, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 0)
  %269 = load i32, i32* %6, align 4
  %270 = add nsw i32 %269, 1
  store i32 %270, i32* %6, align 4
  %271 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %10, align 8
  %272 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %271, i32 1
  store %struct.jpeg_component_info* %272, %struct.jpeg_component_info** %10, align 8
  br label %252

; <label>:273:                                    ; preds = %252
  %pgocount16 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 1)
  %274 = add i64 %pgocount16, 1
  store i64 %274, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 1)
  %275 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %276 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %275, i32 0, i32 0
  %277 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %276, align 8
  %278 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %277, i32 0, i32 5
  store i32 5, i32* %278, align 8
  %279 = load i32, i32* %9, align 4
  %280 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %281 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %280, i32 0, i32 0
  %282 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %281, align 8
  %283 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %282, i32 0, i32 6
  %284 = bitcast %union.anon* %283 to [8 x i32]*
  %285 = getelementptr inbounds [8 x i32], [8 x i32]* %284, i64 0, i64 0
  store i32 %279, i32* %285, align 4
  %286 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %287 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %286, i32 0, i32 0
  %288 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %287, align 8
  %289 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %288, i32 0, i32 0
  %290 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %289, align 8
  %291 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %292 = bitcast %struct.jpeg_decompress_struct* %291 to %struct.jpeg_common_struct*
  %293 = ptrtoint void (%struct.jpeg_common_struct*)* %290 to i64
  call void @__llvm_profile_instrument_target(i64 %293, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sos to i8*), i32 8)
  call void %290(%struct.jpeg_common_struct* %292)
  br label %294

; <label>:294:                                    ; preds = %273, %264
  %295 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %10, align 8
  %296 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %297 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %296, i32 0, i32 63
  %298 = load i32, i32* %5, align 4
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %297, i64 0, i64 %299
  store %struct.jpeg_component_info* %295, %struct.jpeg_component_info** %300, align 8
  %301 = load i32, i32* %8, align 4
  %302 = ashr i32 %301, 4
  %303 = and i32 %302, 15
  %304 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %10, align 8
  %305 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %304, i32 0, i32 5
  store i32 %303, i32* %305, align 4
  %306 = load i32, i32* %8, align 4
  %307 = and i32 %306, 15
  %308 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %10, align 8
  %309 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %308, i32 0, i32 6
  store i32 %307, i32* %309, align 8
  br label %310

; <label>:310:                                    ; preds = %294
  %311 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %312 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %311, i32 0, i32 0
  %313 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %312, align 8
  %314 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %313, i32 0, i32 6
  %315 = bitcast %union.anon* %314 to [8 x i32]*
  %316 = getelementptr inbounds [8 x i32], [8 x i32]* %315, i32 0, i32 0
  store i32* %316, i32** %14, align 8
  %317 = load i32, i32* %9, align 4
  %318 = load i32*, i32** %14, align 8
  %319 = getelementptr inbounds i32, i32* %318, i64 0
  store i32 %317, i32* %319, align 4
  %320 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %10, align 8
  %321 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %320, i32 0, i32 5
  %322 = load i32, i32* %321, align 4
  %323 = load i32*, i32** %14, align 8
  %324 = getelementptr inbounds i32, i32* %323, i64 1
  store i32 %322, i32* %324, align 4
  %325 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %10, align 8
  %326 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %325, i32 0, i32 6
  %327 = load i32, i32* %326, align 8
  %328 = load i32*, i32** %14, align 8
  %329 = getelementptr inbounds i32, i32* %328, i64 2
  store i32 %327, i32* %329, align 4
  %330 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %331 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %330, i32 0, i32 0
  %332 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %331, align 8
  %333 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %332, i32 0, i32 5
  store i32 103, i32* %333, align 8
  %334 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %335 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %334, i32 0, i32 0
  %336 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %335, align 8
  %337 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %336, i32 0, i32 1
  %338 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %337, align 8
  %339 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %340 = bitcast %struct.jpeg_decompress_struct* %339 to %struct.jpeg_common_struct*
  %341 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %338 to i64
  call void @__llvm_profile_instrument_target(i64 %341, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sos to i8*), i32 9)
  call void %338(%struct.jpeg_common_struct* %340, i32 1)
  br label %342

; <label>:342:                                    ; preds = %310
  br label %343

; <label>:343:                                    ; preds = %342
  %344 = load i32, i32* %5, align 4
  %345 = add nsw i32 %344, 1
  store i32 %345, i32* %5, align 4
  br label %186

; <label>:346:                                    ; preds = %186
  br label %347

; <label>:347:                                    ; preds = %346
  %348 = load i64, i64* %13, align 8
  %349 = icmp eq i64 %348, 0
  br i1 %349, label %350, label %368

; <label>:350:                                    ; preds = %347
  %351 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %352 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %351, i32 0, i32 3
  %353 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %352, align 8
  %354 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %355 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %353 to i64
  call void @__llvm_profile_instrument_target(i64 %355, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sos to i8*), i32 10)
  %356 = call i32 %353(%struct.jpeg_decompress_struct* %354)
  %357 = icmp ne i32 %356, 0
  br i1 %357, label %360, label %358

; <label>:358:                                    ; preds = %350
  %pgocount17 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 21)
  %359 = add i64 %pgocount17, 1
  store i64 %359, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 21)
  store i32 0, i32* %2, align 4
  br label %504

; <label>:360:                                    ; preds = %350
  %pgocount18 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 18)
  %361 = add i64 %pgocount18, 1
  store i64 %361, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 18)
  %362 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %363 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %362, i32 0, i32 0
  %364 = load i8*, i8** %363, align 8
  store i8* %364, i8** %12, align 8
  %365 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %366 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %365, i32 0, i32 1
  %367 = load i64, i64* %366, align 8
  store i64 %367, i64* %13, align 8
  br label %368

; <label>:368:                                    ; preds = %360, %347
  %369 = load i64, i64* %13, align 8
  %370 = add i64 %369, -1
  store i64 %370, i64* %13, align 8
  %371 = load i8*, i8** %12, align 8
  %372 = getelementptr inbounds i8, i8* %371, i32 1
  store i8* %372, i8** %12, align 8
  %373 = load i8, i8* %371, align 1
  %374 = zext i8 %373 to i32
  store i32 %374, i32* %8, align 4
  br label %375

; <label>:375:                                    ; preds = %368
  %376 = load i32, i32* %8, align 4
  %377 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %378 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %377, i32 0, i32 68
  store i32 %376, i32* %378, align 4
  br label %379

; <label>:379:                                    ; preds = %375
  %380 = load i64, i64* %13, align 8
  %381 = icmp eq i64 %380, 0
  br i1 %381, label %382, label %400

; <label>:382:                                    ; preds = %379
  %383 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %384 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %383, i32 0, i32 3
  %385 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %384, align 8
  %386 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %387 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %385 to i64
  call void @__llvm_profile_instrument_target(i64 %387, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sos to i8*), i32 11)
  %388 = call i32 %385(%struct.jpeg_decompress_struct* %386)
  %389 = icmp ne i32 %388, 0
  br i1 %389, label %392, label %390

; <label>:390:                                    ; preds = %382
  %pgocount19 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 22)
  %391 = add i64 %pgocount19, 1
  store i64 %391, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 22)
  store i32 0, i32* %2, align 4
  br label %504

; <label>:392:                                    ; preds = %382
  %pgocount20 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 19)
  %393 = add i64 %pgocount20, 1
  store i64 %393, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 19)
  %394 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %395 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %394, i32 0, i32 0
  %396 = load i8*, i8** %395, align 8
  store i8* %396, i8** %12, align 8
  %397 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %398 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %397, i32 0, i32 1
  %399 = load i64, i64* %398, align 8
  store i64 %399, i64* %13, align 8
  br label %400

; <label>:400:                                    ; preds = %392, %379
  %401 = load i64, i64* %13, align 8
  %402 = add i64 %401, -1
  store i64 %402, i64* %13, align 8
  %403 = load i8*, i8** %12, align 8
  %404 = getelementptr inbounds i8, i8* %403, i32 1
  store i8* %404, i8** %12, align 8
  %405 = load i8, i8* %403, align 1
  %406 = zext i8 %405 to i32
  store i32 %406, i32* %8, align 4
  br label %407

; <label>:407:                                    ; preds = %400
  %408 = load i32, i32* %8, align 4
  %409 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %410 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %409, i32 0, i32 69
  store i32 %408, i32* %410, align 8
  br label %411

; <label>:411:                                    ; preds = %407
  %412 = load i64, i64* %13, align 8
  %413 = icmp eq i64 %412, 0
  br i1 %413, label %414, label %432

; <label>:414:                                    ; preds = %411
  %415 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %416 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %415, i32 0, i32 3
  %417 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %416, align 8
  %418 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %419 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %417 to i64
  call void @__llvm_profile_instrument_target(i64 %419, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sos to i8*), i32 12)
  %420 = call i32 %417(%struct.jpeg_decompress_struct* %418)
  %421 = icmp ne i32 %420, 0
  br i1 %421, label %424, label %422

; <label>:422:                                    ; preds = %414
  %pgocount21 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 23)
  %423 = add i64 %pgocount21, 1
  store i64 %423, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 23)
  store i32 0, i32* %2, align 4
  br label %504

; <label>:424:                                    ; preds = %414
  %pgocount22 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 20)
  %425 = add i64 %pgocount22, 1
  store i64 %425, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 20)
  %426 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %427 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %426, i32 0, i32 0
  %428 = load i8*, i8** %427, align 8
  store i8* %428, i8** %12, align 8
  %429 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %430 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %429, i32 0, i32 1
  %431 = load i64, i64* %430, align 8
  store i64 %431, i64* %13, align 8
  br label %432

; <label>:432:                                    ; preds = %424, %411
  %433 = load i64, i64* %13, align 8
  %434 = add i64 %433, -1
  store i64 %434, i64* %13, align 8
  %435 = load i8*, i8** %12, align 8
  %436 = getelementptr inbounds i8, i8* %435, i32 1
  store i8* %436, i8** %12, align 8
  %437 = load i8, i8* %435, align 1
  %438 = zext i8 %437 to i32
  store i32 %438, i32* %8, align 4
  br label %439

; <label>:439:                                    ; preds = %432
  %440 = load i32, i32* %8, align 4
  %441 = ashr i32 %440, 4
  %442 = and i32 %441, 15
  %443 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %444 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %443, i32 0, i32 70
  store i32 %442, i32* %444, align 4
  %445 = load i32, i32* %8, align 4
  %446 = and i32 %445, 15
  %447 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %448 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %447, i32 0, i32 71
  store i32 %446, i32* %448, align 8
  br label %449

; <label>:449:                                    ; preds = %439
  %450 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %451 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %450, i32 0, i32 0
  %452 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %451, align 8
  %453 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %452, i32 0, i32 6
  %454 = bitcast %union.anon* %453 to [8 x i32]*
  %455 = getelementptr inbounds [8 x i32], [8 x i32]* %454, i32 0, i32 0
  store i32* %455, i32** %15, align 8
  %456 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %457 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %456, i32 0, i32 68
  %458 = load i32, i32* %457, align 4
  %459 = load i32*, i32** %15, align 8
  %460 = getelementptr inbounds i32, i32* %459, i64 0
  store i32 %458, i32* %460, align 4
  %461 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %462 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %461, i32 0, i32 69
  %463 = load i32, i32* %462, align 8
  %464 = load i32*, i32** %15, align 8
  %465 = getelementptr inbounds i32, i32* %464, i64 1
  store i32 %463, i32* %465, align 4
  %466 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %467 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %466, i32 0, i32 70
  %468 = load i32, i32* %467, align 4
  %469 = load i32*, i32** %15, align 8
  %470 = getelementptr inbounds i32, i32* %469, i64 2
  store i32 %468, i32* %470, align 4
  %471 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %472 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %471, i32 0, i32 71
  %473 = load i32, i32* %472, align 8
  %474 = load i32*, i32** %15, align 8
  %475 = getelementptr inbounds i32, i32* %474, i64 3
  store i32 %473, i32* %475, align 4
  %476 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %477 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %476, i32 0, i32 0
  %478 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %477, align 8
  %479 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %478, i32 0, i32 5
  store i32 104, i32* %479, align 8
  %480 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %481 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %480, i32 0, i32 0
  %482 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %481, align 8
  %483 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %482, i32 0, i32 1
  %484 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %483, align 8
  %485 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %486 = bitcast %struct.jpeg_decompress_struct* %485 to %struct.jpeg_common_struct*
  %487 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %484 to i64
  call void @__llvm_profile_instrument_target(i64 %487, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_sos to i8*), i32 13)
  call void %484(%struct.jpeg_common_struct* %486, i32 1)
  br label %488

; <label>:488:                                    ; preds = %449
  %pgocount23 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 9)
  %489 = add i64 %pgocount23, 1
  store i64 %489, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_get_sos, i64 0, i64 9)
  %490 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %491 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %490, i32 0, i32 78
  %492 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %491, align 8
  %493 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %492, i32 0, i32 7
  store i32 0, i32* %493, align 8
  %494 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %495 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %494, i32 0, i32 34
  %496 = load i32, i32* %495, align 4
  %497 = add nsw i32 %496, 1
  store i32 %497, i32* %495, align 4
  %498 = load i8*, i8** %12, align 8
  %499 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %500 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %499, i32 0, i32 0
  store i8* %498, i8** %500, align 8
  %501 = load i64, i64* %13, align 8
  %502 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %503 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %502, i32 0, i32 1
  store i64 %501, i64* %503, align 8
  store i32 1, i32* %2, align 4
  br label %504

; <label>:504:                                    ; preds = %488, %422, %390, %358, %231, %202, %117, %86, %57
  %505 = load i32, i32* %2, align 4
  ret i32 %505
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_dac(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.jpeg_source_mgr*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %10, i32 0, i32 5
  %12 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  store %struct.jpeg_source_mgr* %12, %struct.jpeg_source_mgr** %7, align 8
  %13 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %14 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %13, i32 0, i32 0
  %15 = load i8*, i8** %14, align 8
  store i8* %15, i8** %8, align 8
  %16 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %17 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %16, i32 0, i32 1
  %18 = load i64, i64* %17, align 8
  store i64 %18, i64* %9, align 8
  br label %19

; <label>:19:                                     ; preds = %1
  %20 = load i64, i64* %9, align 8
  %21 = icmp eq i64 %20, 0
  br i1 %21, label %22, label %40

; <label>:22:                                     ; preds = %19
  %23 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %24 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %23, i32 0, i32 3
  %25 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %24, align 8
  %26 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %27 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %25 to i64
  call void @__llvm_profile_instrument_target(i64 %27, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dac to i8*), i32 0)
  %28 = call i32 %25(%struct.jpeg_decompress_struct* %26)
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %32, label %30

; <label>:30:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 12)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 12)
  store i32 0, i32* %2, align 4
  br label %275

; <label>:32:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 8)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 8)
  %34 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %35 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %34, i32 0, i32 0
  %36 = load i8*, i8** %35, align 8
  store i8* %36, i8** %8, align 8
  %37 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %38 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %37, i32 0, i32 1
  %39 = load i64, i64* %38, align 8
  store i64 %39, i64* %9, align 8
  br label %40

; <label>:40:                                     ; preds = %32, %19
  %41 = load i64, i64* %9, align 8
  %42 = add i64 %41, -1
  store i64 %42, i64* %9, align 8
  %43 = load i8*, i8** %8, align 8
  %44 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %44, i8** %8, align 8
  %45 = load i8, i8* %43, align 1
  %46 = zext i8 %45 to i32
  %47 = shl i32 %46, 8
  %48 = zext i32 %47 to i64
  store i64 %48, i64* %4, align 8
  %49 = load i64, i64* %9, align 8
  %50 = icmp eq i64 %49, 0
  br i1 %50, label %51, label %69

; <label>:51:                                     ; preds = %40
  %52 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %53 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %52, i32 0, i32 3
  %54 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %53, align 8
  %55 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %56 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %54 to i64
  call void @__llvm_profile_instrument_target(i64 %56, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dac to i8*), i32 1)
  %57 = call i32 %54(%struct.jpeg_decompress_struct* %55)
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %61, label %59

; <label>:59:                                     ; preds = %51
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 13)
  %60 = add i64 %pgocount2, 1
  store i64 %60, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 13)
  store i32 0, i32* %2, align 4
  br label %275

; <label>:61:                                     ; preds = %51
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 9)
  %62 = add i64 %pgocount3, 1
  store i64 %62, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 9)
  %63 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %64 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %63, i32 0, i32 0
  %65 = load i8*, i8** %64, align 8
  store i8* %65, i8** %8, align 8
  %66 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %67 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %66, i32 0, i32 1
  %68 = load i64, i64* %67, align 8
  store i64 %68, i64* %9, align 8
  br label %69

; <label>:69:                                     ; preds = %61, %40
  %70 = load i64, i64* %9, align 8
  %71 = add i64 %70, -1
  store i64 %71, i64* %9, align 8
  %72 = load i8*, i8** %8, align 8
  %73 = getelementptr inbounds i8, i8* %72, i32 1
  store i8* %73, i8** %8, align 8
  %74 = load i8, i8* %72, align 1
  %75 = zext i8 %74 to i64
  %76 = load i64, i64* %4, align 8
  %77 = add nsw i64 %76, %75
  store i64 %77, i64* %4, align 8
  br label %78

; <label>:78:                                     ; preds = %69
  %79 = load i64, i64* %4, align 8
  %80 = sub nsw i64 %79, 2
  store i64 %80, i64* %4, align 8
  br label %81

; <label>:81:                                     ; preds = %266, %78
  %82 = load i64, i64* %4, align 8
  %83 = icmp sgt i64 %82, 0
  br i1 %83, label %84, label %267

; <label>:84:                                     ; preds = %81
  br label %85

; <label>:85:                                     ; preds = %84
  %86 = load i64, i64* %9, align 8
  %87 = icmp eq i64 %86, 0
  br i1 %87, label %88, label %106

; <label>:88:                                     ; preds = %85
  %89 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %90 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %89, i32 0, i32 3
  %91 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %90, align 8
  %92 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %93 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %91 to i64
  call void @__llvm_profile_instrument_target(i64 %93, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dac to i8*), i32 2)
  %94 = call i32 %91(%struct.jpeg_decompress_struct* %92)
  %95 = icmp ne i32 %94, 0
  br i1 %95, label %98, label %96

; <label>:96:                                     ; preds = %88
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 10)
  %97 = add i64 %pgocount4, 1
  store i64 %97, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 10)
  store i32 0, i32* %2, align 4
  br label %275

; <label>:98:                                     ; preds = %88
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 4)
  %99 = add i64 %pgocount5, 1
  store i64 %99, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 4)
  %100 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %101 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %100, i32 0, i32 0
  %102 = load i8*, i8** %101, align 8
  store i8* %102, i8** %8, align 8
  %103 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %104 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %103, i32 0, i32 1
  %105 = load i64, i64* %104, align 8
  store i64 %105, i64* %9, align 8
  br label %106

; <label>:106:                                    ; preds = %98, %85
  %107 = load i64, i64* %9, align 8
  %108 = add i64 %107, -1
  store i64 %108, i64* %9, align 8
  %109 = load i8*, i8** %8, align 8
  %110 = getelementptr inbounds i8, i8* %109, i32 1
  store i8* %110, i8** %8, align 8
  %111 = load i8, i8* %109, align 1
  %112 = zext i8 %111 to i32
  store i32 %112, i32* %5, align 4
  br label %113

; <label>:113:                                    ; preds = %106
  br label %114

; <label>:114:                                    ; preds = %113
  %115 = load i64, i64* %9, align 8
  %116 = icmp eq i64 %115, 0
  br i1 %116, label %117, label %135

; <label>:117:                                    ; preds = %114
  %118 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %119 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %118, i32 0, i32 3
  %120 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %119, align 8
  %121 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %122 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %120 to i64
  call void @__llvm_profile_instrument_target(i64 %122, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dac to i8*), i32 3)
  %123 = call i32 %120(%struct.jpeg_decompress_struct* %121)
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %127, label %125

; <label>:125:                                    ; preds = %117
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 11)
  %126 = add i64 %pgocount6, 1
  store i64 %126, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 11)
  store i32 0, i32* %2, align 4
  br label %275

; <label>:127:                                    ; preds = %117
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 5)
  %128 = add i64 %pgocount7, 1
  store i64 %128, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 5)
  %129 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %130 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %129, i32 0, i32 0
  %131 = load i8*, i8** %130, align 8
  store i8* %131, i8** %8, align 8
  %132 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %133 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %132, i32 0, i32 1
  %134 = load i64, i64* %133, align 8
  store i64 %134, i64* %9, align 8
  br label %135

; <label>:135:                                    ; preds = %127, %114
  %136 = load i64, i64* %9, align 8
  %137 = add i64 %136, -1
  store i64 %137, i64* %9, align 8
  %138 = load i8*, i8** %8, align 8
  %139 = getelementptr inbounds i8, i8* %138, i32 1
  store i8* %139, i8** %8, align 8
  %140 = load i8, i8* %138, align 1
  %141 = zext i8 %140 to i32
  store i32 %141, i32* %6, align 4
  br label %142

; <label>:142:                                    ; preds = %135
  %143 = load i64, i64* %4, align 8
  %144 = sub nsw i64 %143, 2
  store i64 %144, i64* %4, align 8
  %145 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %146 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %145, i32 0, i32 0
  %147 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %146, align 8
  %148 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %147, i32 0, i32 5
  store i32 78, i32* %148, align 8
  %149 = load i32, i32* %5, align 4
  %150 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %151 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %150, i32 0, i32 0
  %152 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %151, align 8
  %153 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %152, i32 0, i32 6
  %154 = bitcast %union.anon* %153 to [8 x i32]*
  %155 = getelementptr inbounds [8 x i32], [8 x i32]* %154, i64 0, i64 0
  store i32 %149, i32* %155, align 4
  %156 = load i32, i32* %6, align 4
  %157 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %158 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %157, i32 0, i32 0
  %159 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %158, align 8
  %160 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %159, i32 0, i32 6
  %161 = bitcast %union.anon* %160 to [8 x i32]*
  %162 = getelementptr inbounds [8 x i32], [8 x i32]* %161, i64 0, i64 1
  store i32 %156, i32* %162, align 4
  %163 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %164 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %163, i32 0, i32 0
  %165 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %164, align 8
  %166 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %165, i32 0, i32 1
  %167 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %166, align 8
  %168 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %169 = bitcast %struct.jpeg_decompress_struct* %168 to %struct.jpeg_common_struct*
  %170 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %167 to i64
  call void @__llvm_profile_instrument_target(i64 %170, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dac to i8*), i32 4)
  call void %167(%struct.jpeg_common_struct* %169, i32 1)
  %171 = load i32, i32* %5, align 4
  %172 = icmp slt i32 %171, 0
  br i1 %172, label %177, label %173

; <label>:173:                                    ; preds = %142
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 1)
  %174 = add i64 %pgocount8, 1
  store i64 %174, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 1)
  %175 = load i32, i32* %5, align 4
  %176 = icmp sge i32 %175, 32
  br i1 %176, label %177, label %198

; <label>:177:                                    ; preds = %173, %142
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 0)
  %178 = add i64 %pgocount9, 1
  store i64 %178, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 0)
  %179 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %180 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %179, i32 0, i32 0
  %181 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %180, align 8
  %182 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %181, i32 0, i32 5
  store i32 26, i32* %182, align 8
  %183 = load i32, i32* %5, align 4
  %184 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %185 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %184, i32 0, i32 0
  %186 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %185, align 8
  %187 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %186, i32 0, i32 6
  %188 = bitcast %union.anon* %187 to [8 x i32]*
  %189 = getelementptr inbounds [8 x i32], [8 x i32]* %188, i64 0, i64 0
  store i32 %183, i32* %189, align 4
  %190 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %191 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %190, i32 0, i32 0
  %192 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %191, align 8
  %193 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %192, i32 0, i32 0
  %194 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %193, align 8
  %195 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %196 = bitcast %struct.jpeg_decompress_struct* %195 to %struct.jpeg_common_struct*
  %197 = ptrtoint void (%struct.jpeg_common_struct*)* %194 to i64
  call void @__llvm_profile_instrument_target(i64 %197, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dac to i8*), i32 5)
  call void %194(%struct.jpeg_common_struct* %196)
  br label %198

; <label>:198:                                    ; preds = %177, %173
  %199 = load i32, i32* %5, align 4
  %200 = icmp sge i32 %199, 16
  br i1 %200, label %201, label %211

; <label>:201:                                    ; preds = %198
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 2)
  %202 = add i64 %pgocount10, 1
  store i64 %202, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 2)
  %203 = load i32, i32* %6, align 4
  %204 = trunc i32 %203 to i8
  %205 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %206 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %205, i32 0, i32 48
  %207 = load i32, i32* %5, align 4
  %208 = sub nsw i32 %207, 16
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [16 x i8], [16 x i8]* %206, i64 0, i64 %209
  store i8 %204, i8* %210, align 1
  br label %266

; <label>:211:                                    ; preds = %198
  %212 = load i32, i32* %6, align 4
  %213 = and i32 %212, 15
  %214 = trunc i32 %213 to i8
  %215 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %216 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %215, i32 0, i32 46
  %217 = load i32, i32* %5, align 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [16 x i8], [16 x i8]* %216, i64 0, i64 %218
  store i8 %214, i8* %219, align 1
  %220 = load i32, i32* %6, align 4
  %221 = ashr i32 %220, 4
  %222 = trunc i32 %221 to i8
  %223 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %224 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %223, i32 0, i32 47
  %225 = load i32, i32* %5, align 4
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds [16 x i8], [16 x i8]* %224, i64 0, i64 %226
  store i8 %222, i8* %227, align 1
  %228 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %229 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %228, i32 0, i32 46
  %230 = load i32, i32* %5, align 4
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds [16 x i8], [16 x i8]* %229, i64 0, i64 %231
  %233 = load i8, i8* %232, align 1
  %234 = zext i8 %233 to i32
  %235 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %236 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %235, i32 0, i32 47
  %237 = load i32, i32* %5, align 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds [16 x i8], [16 x i8]* %236, i64 0, i64 %238
  %240 = load i8, i8* %239, align 1
  %241 = zext i8 %240 to i32
  %242 = icmp sgt i32 %234, %241
  br i1 %242, label %243, label %264

; <label>:243:                                    ; preds = %211
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 6)
  %244 = add i64 %pgocount11, 1
  store i64 %244, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 6)
  %245 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %246 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %245, i32 0, i32 0
  %247 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %246, align 8
  %248 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %247, i32 0, i32 5
  store i32 27, i32* %248, align 8
  %249 = load i32, i32* %6, align 4
  %250 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %251 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %250, i32 0, i32 0
  %252 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %251, align 8
  %253 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %252, i32 0, i32 6
  %254 = bitcast %union.anon* %253 to [8 x i32]*
  %255 = getelementptr inbounds [8 x i32], [8 x i32]* %254, i64 0, i64 0
  store i32 %249, i32* %255, align 4
  %256 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %257 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %256, i32 0, i32 0
  %258 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %257, align 8
  %259 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %258, i32 0, i32 0
  %260 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %259, align 8
  %261 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %262 = bitcast %struct.jpeg_decompress_struct* %261 to %struct.jpeg_common_struct*
  %263 = ptrtoint void (%struct.jpeg_common_struct*)* %260 to i64
  call void @__llvm_profile_instrument_target(i64 %263, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dac to i8*), i32 6)
  call void %260(%struct.jpeg_common_struct* %262)
  br label %264

; <label>:264:                                    ; preds = %243, %211
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 3)
  %265 = add i64 %pgocount12, 1
  store i64 %265, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 3)
  br label %266

; <label>:266:                                    ; preds = %264, %201
  br label %81

; <label>:267:                                    ; preds = %81
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 7)
  %268 = add i64 %pgocount13, 1
  store i64 %268, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_get_dac, i64 0, i64 7)
  %269 = load i8*, i8** %8, align 8
  %270 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %271 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %270, i32 0, i32 0
  store i8* %269, i8** %271, align 8
  %272 = load i64, i64* %9, align 8
  %273 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %274 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %273, i32 0, i32 1
  store i64 %272, i64* %274, align 8
  store i32 1, i32* %2, align 4
  br label %275

; <label>:275:                                    ; preds = %267, %125, %96, %59, %30
  %276 = load i32, i32* %2, align 4
  ret i32 %276
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_dht(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i64, align 8
  %5 = alloca [17 x i8], align 16
  %6 = alloca [256 x i8], align 16
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.JHUFF_TBL**, align 8
  %11 = alloca %struct.jpeg_source_mgr*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i64, align 8
  %14 = alloca i32*, align 8
  %15 = alloca i32*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 5
  %18 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %17, align 8
  store %struct.jpeg_source_mgr* %18, %struct.jpeg_source_mgr** %11, align 8
  %19 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %20 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %19, i32 0, i32 0
  %21 = load i8*, i8** %20, align 8
  store i8* %21, i8** %12, align 8
  %22 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %23 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %22, i32 0, i32 1
  %24 = load i64, i64* %23, align 8
  store i64 %24, i64* %13, align 8
  br label %25

; <label>:25:                                     ; preds = %1
  %26 = load i64, i64* %13, align 8
  %27 = icmp eq i64 %26, 0
  br i1 %27, label %28, label %46

; <label>:28:                                     ; preds = %25
  %29 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %30 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %29, i32 0, i32 3
  %31 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %30, align 8
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %33 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %31 to i64
  call void @__llvm_profile_instrument_target(i64 %33, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dht to i8*), i32 0)
  %34 = call i32 %31(%struct.jpeg_decompress_struct* %32)
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %38, label %36

; <label>:36:                                     ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 16)
  %37 = add i64 %pgocount, 1
  store i64 %37, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 16)
  store i32 0, i32* %2, align 4
  br label %453

; <label>:38:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 14)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 14)
  %40 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %41 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %40, i32 0, i32 0
  %42 = load i8*, i8** %41, align 8
  store i8* %42, i8** %12, align 8
  %43 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %44 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %43, i32 0, i32 1
  %45 = load i64, i64* %44, align 8
  store i64 %45, i64* %13, align 8
  br label %46

; <label>:46:                                     ; preds = %38, %25
  %47 = load i64, i64* %13, align 8
  %48 = add i64 %47, -1
  store i64 %48, i64* %13, align 8
  %49 = load i8*, i8** %12, align 8
  %50 = getelementptr inbounds i8, i8* %49, i32 1
  store i8* %50, i8** %12, align 8
  %51 = load i8, i8* %49, align 1
  %52 = zext i8 %51 to i32
  %53 = shl i32 %52, 8
  %54 = zext i32 %53 to i64
  store i64 %54, i64* %4, align 8
  %55 = load i64, i64* %13, align 8
  %56 = icmp eq i64 %55, 0
  br i1 %56, label %57, label %75

; <label>:57:                                     ; preds = %46
  %58 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %59 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %58, i32 0, i32 3
  %60 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %59, align 8
  %61 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %62 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %60 to i64
  call void @__llvm_profile_instrument_target(i64 %62, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dht to i8*), i32 1)
  %63 = call i32 %60(%struct.jpeg_decompress_struct* %61)
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %67, label %65

; <label>:65:                                     ; preds = %57
  %pgocount2 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 17)
  %66 = add i64 %pgocount2, 1
  store i64 %66, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 17)
  store i32 0, i32* %2, align 4
  br label %453

; <label>:67:                                     ; preds = %57
  %pgocount3 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 15)
  %68 = add i64 %pgocount3, 1
  store i64 %68, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 15)
  %69 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %70 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %69, i32 0, i32 0
  %71 = load i8*, i8** %70, align 8
  store i8* %71, i8** %12, align 8
  %72 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %73 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %72, i32 0, i32 1
  %74 = load i64, i64* %73, align 8
  store i64 %74, i64* %13, align 8
  br label %75

; <label>:75:                                     ; preds = %67, %46
  %76 = load i64, i64* %13, align 8
  %77 = add i64 %76, -1
  store i64 %77, i64* %13, align 8
  %78 = load i8*, i8** %12, align 8
  %79 = getelementptr inbounds i8, i8* %78, i32 1
  store i8* %79, i8** %12, align 8
  %80 = load i8, i8* %78, align 1
  %81 = zext i8 %80 to i64
  %82 = load i64, i64* %4, align 8
  %83 = add nsw i64 %82, %81
  store i64 %83, i64* %4, align 8
  br label %84

; <label>:84:                                     ; preds = %75
  %85 = load i64, i64* %4, align 8
  %86 = sub nsw i64 %85, 2
  store i64 %86, i64* %4, align 8
  br label %87

; <label>:87:                                     ; preds = %434, %84
  %88 = load i64, i64* %4, align 8
  %89 = icmp sgt i64 %88, 0
  br i1 %89, label %90, label %445

; <label>:90:                                     ; preds = %87
  br label %91

; <label>:91:                                     ; preds = %90
  %92 = load i64, i64* %13, align 8
  %93 = icmp eq i64 %92, 0
  br i1 %93, label %94, label %112

; <label>:94:                                     ; preds = %91
  %95 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %96 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %95, i32 0, i32 3
  %97 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %96, align 8
  %98 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %99 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %97 to i64
  call void @__llvm_profile_instrument_target(i64 %99, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dht to i8*), i32 2)
  %100 = call i32 %97(%struct.jpeg_decompress_struct* %98)
  %101 = icmp ne i32 %100, 0
  br i1 %101, label %104, label %102

; <label>:102:                                    ; preds = %94
  %pgocount4 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 19)
  %103 = add i64 %pgocount4, 1
  store i64 %103, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 19)
  store i32 0, i32* %2, align 4
  br label %453

; <label>:104:                                    ; preds = %94
  %pgocount5 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 6)
  %105 = add i64 %pgocount5, 1
  store i64 %105, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 6)
  %106 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %107 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %106, i32 0, i32 0
  %108 = load i8*, i8** %107, align 8
  store i8* %108, i8** %12, align 8
  %109 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %110 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %109, i32 0, i32 1
  %111 = load i64, i64* %110, align 8
  store i64 %111, i64* %13, align 8
  br label %112

; <label>:112:                                    ; preds = %104, %91
  %113 = load i64, i64* %13, align 8
  %114 = add i64 %113, -1
  store i64 %114, i64* %13, align 8
  %115 = load i8*, i8** %12, align 8
  %116 = getelementptr inbounds i8, i8* %115, i32 1
  store i8* %116, i8** %12, align 8
  %117 = load i8, i8* %115, align 1
  %118 = zext i8 %117 to i32
  store i32 %118, i32* %8, align 4
  br label %119

; <label>:119:                                    ; preds = %112
  %120 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %121 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %120, i32 0, i32 0
  %122 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %121, align 8
  %123 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %122, i32 0, i32 5
  store i32 79, i32* %123, align 8
  %124 = load i32, i32* %8, align 4
  %125 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %126 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %125, i32 0, i32 0
  %127 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %126, align 8
  %128 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %127, i32 0, i32 6
  %129 = bitcast %union.anon* %128 to [8 x i32]*
  %130 = getelementptr inbounds [8 x i32], [8 x i32]* %129, i64 0, i64 0
  store i32 %124, i32* %130, align 4
  %131 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %132 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %131, i32 0, i32 0
  %133 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %132, align 8
  %134 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %133, i32 0, i32 1
  %135 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %134, align 8
  %136 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %137 = bitcast %struct.jpeg_decompress_struct* %136 to %struct.jpeg_common_struct*
  %138 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %135 to i64
  call void @__llvm_profile_instrument_target(i64 %138, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dht to i8*), i32 3)
  call void %135(%struct.jpeg_common_struct* %137, i32 1)
  %139 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 0
  store i8 0, i8* %139, align 16
  store i32 0, i32* %9, align 4
  store i32 1, i32* %7, align 4
  br label %140

; <label>:140:                                    ; preds = %182, %119
  %141 = load i32, i32* %7, align 4
  %142 = icmp sle i32 %141, 16
  br i1 %142, label %143, label %186

; <label>:143:                                    ; preds = %140
  br label %144

; <label>:144:                                    ; preds = %143
  %145 = load i64, i64* %13, align 8
  %146 = icmp eq i64 %145, 0
  br i1 %146, label %147, label %165

; <label>:147:                                    ; preds = %144
  %148 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %149 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %148, i32 0, i32 3
  %150 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %149, align 8
  %151 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %152 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %150 to i64
  call void @__llvm_profile_instrument_target(i64 %152, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dht to i8*), i32 4)
  %153 = call i32 %150(%struct.jpeg_decompress_struct* %151)
  %154 = icmp ne i32 %153, 0
  br i1 %154, label %157, label %155

; <label>:155:                                    ; preds = %147
  %pgocount6 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 11)
  %156 = add i64 %pgocount6, 1
  store i64 %156, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 11)
  store i32 0, i32* %2, align 4
  br label %453

; <label>:157:                                    ; preds = %147
  %pgocount7 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 2)
  %158 = add i64 %pgocount7, 1
  store i64 %158, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 2)
  %159 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %160 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %159, i32 0, i32 0
  %161 = load i8*, i8** %160, align 8
  store i8* %161, i8** %12, align 8
  %162 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %163 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %162, i32 0, i32 1
  %164 = load i64, i64* %163, align 8
  store i64 %164, i64* %13, align 8
  br label %165

; <label>:165:                                    ; preds = %157, %144
  %166 = load i64, i64* %13, align 8
  %167 = add i64 %166, -1
  store i64 %167, i64* %13, align 8
  %168 = load i8*, i8** %12, align 8
  %169 = getelementptr inbounds i8, i8* %168, i32 1
  store i8* %169, i8** %12, align 8
  %170 = load i8, i8* %168, align 1
  %171 = load i32, i32* %7, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 %172
  store i8 %170, i8* %173, align 1
  br label %174

; <label>:174:                                    ; preds = %165
  %175 = load i32, i32* %7, align 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 %176
  %178 = load i8, i8* %177, align 1
  %179 = zext i8 %178 to i32
  %180 = load i32, i32* %9, align 4
  %181 = add nsw i32 %180, %179
  store i32 %181, i32* %9, align 4
  br label %182

; <label>:182:                                    ; preds = %174
  %pgocount8 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 0)
  %183 = add i64 %pgocount8, 1
  store i64 %183, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 0)
  %184 = load i32, i32* %7, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, i32* %7, align 4
  br label %140

; <label>:186:                                    ; preds = %140
  %187 = load i64, i64* %4, align 8
  %188 = sub nsw i64 %187, 17
  store i64 %188, i64* %4, align 8
  br label %189

; <label>:189:                                    ; preds = %186
  %190 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %191 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %190, i32 0, i32 0
  %192 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %191, align 8
  %193 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %192, i32 0, i32 6
  %194 = bitcast %union.anon* %193 to [8 x i32]*
  %195 = getelementptr inbounds [8 x i32], [8 x i32]* %194, i32 0, i32 0
  store i32* %195, i32** %14, align 8
  %196 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 1
  %197 = load i8, i8* %196, align 1
  %198 = zext i8 %197 to i32
  %199 = load i32*, i32** %14, align 8
  %200 = getelementptr inbounds i32, i32* %199, i64 0
  store i32 %198, i32* %200, align 4
  %201 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 2
  %202 = load i8, i8* %201, align 2
  %203 = zext i8 %202 to i32
  %204 = load i32*, i32** %14, align 8
  %205 = getelementptr inbounds i32, i32* %204, i64 1
  store i32 %203, i32* %205, align 4
  %206 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 3
  %207 = load i8, i8* %206, align 1
  %208 = zext i8 %207 to i32
  %209 = load i32*, i32** %14, align 8
  %210 = getelementptr inbounds i32, i32* %209, i64 2
  store i32 %208, i32* %210, align 4
  %211 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 4
  %212 = load i8, i8* %211, align 4
  %213 = zext i8 %212 to i32
  %214 = load i32*, i32** %14, align 8
  %215 = getelementptr inbounds i32, i32* %214, i64 3
  store i32 %213, i32* %215, align 4
  %216 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 5
  %217 = load i8, i8* %216, align 1
  %218 = zext i8 %217 to i32
  %219 = load i32*, i32** %14, align 8
  %220 = getelementptr inbounds i32, i32* %219, i64 4
  store i32 %218, i32* %220, align 4
  %221 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 6
  %222 = load i8, i8* %221, align 2
  %223 = zext i8 %222 to i32
  %224 = load i32*, i32** %14, align 8
  %225 = getelementptr inbounds i32, i32* %224, i64 5
  store i32 %223, i32* %225, align 4
  %226 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 7
  %227 = load i8, i8* %226, align 1
  %228 = zext i8 %227 to i32
  %229 = load i32*, i32** %14, align 8
  %230 = getelementptr inbounds i32, i32* %229, i64 6
  store i32 %228, i32* %230, align 4
  %231 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 8
  %232 = load i8, i8* %231, align 8
  %233 = zext i8 %232 to i32
  %234 = load i32*, i32** %14, align 8
  %235 = getelementptr inbounds i32, i32* %234, i64 7
  store i32 %233, i32* %235, align 4
  %236 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %237 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %236, i32 0, i32 0
  %238 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %237, align 8
  %239 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %238, i32 0, i32 5
  store i32 85, i32* %239, align 8
  %240 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %241 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %240, i32 0, i32 0
  %242 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %241, align 8
  %243 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %242, i32 0, i32 1
  %244 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %243, align 8
  %245 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %246 = bitcast %struct.jpeg_decompress_struct* %245 to %struct.jpeg_common_struct*
  %247 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %244 to i64
  call void @__llvm_profile_instrument_target(i64 %247, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dht to i8*), i32 5)
  call void %244(%struct.jpeg_common_struct* %246, i32 2)
  br label %248

; <label>:248:                                    ; preds = %189
  br label %249

; <label>:249:                                    ; preds = %248
  %250 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %251 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %250, i32 0, i32 0
  %252 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %251, align 8
  %253 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %252, i32 0, i32 6
  %254 = bitcast %union.anon* %253 to [8 x i32]*
  %255 = getelementptr inbounds [8 x i32], [8 x i32]* %254, i32 0, i32 0
  store i32* %255, i32** %15, align 8
  %256 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 9
  %257 = load i8, i8* %256, align 1
  %258 = zext i8 %257 to i32
  %259 = load i32*, i32** %15, align 8
  %260 = getelementptr inbounds i32, i32* %259, i64 0
  store i32 %258, i32* %260, align 4
  %261 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 10
  %262 = load i8, i8* %261, align 2
  %263 = zext i8 %262 to i32
  %264 = load i32*, i32** %15, align 8
  %265 = getelementptr inbounds i32, i32* %264, i64 1
  store i32 %263, i32* %265, align 4
  %266 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 11
  %267 = load i8, i8* %266, align 1
  %268 = zext i8 %267 to i32
  %269 = load i32*, i32** %15, align 8
  %270 = getelementptr inbounds i32, i32* %269, i64 2
  store i32 %268, i32* %270, align 4
  %271 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 12
  %272 = load i8, i8* %271, align 4
  %273 = zext i8 %272 to i32
  %274 = load i32*, i32** %15, align 8
  %275 = getelementptr inbounds i32, i32* %274, i64 3
  store i32 %273, i32* %275, align 4
  %276 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 13
  %277 = load i8, i8* %276, align 1
  %278 = zext i8 %277 to i32
  %279 = load i32*, i32** %15, align 8
  %280 = getelementptr inbounds i32, i32* %279, i64 4
  store i32 %278, i32* %280, align 4
  %281 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 14
  %282 = load i8, i8* %281, align 2
  %283 = zext i8 %282 to i32
  %284 = load i32*, i32** %15, align 8
  %285 = getelementptr inbounds i32, i32* %284, i64 5
  store i32 %283, i32* %285, align 4
  %286 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 15
  %287 = load i8, i8* %286, align 1
  %288 = zext i8 %287 to i32
  %289 = load i32*, i32** %15, align 8
  %290 = getelementptr inbounds i32, i32* %289, i64 6
  store i32 %288, i32* %290, align 4
  %291 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i64 0, i64 16
  %292 = load i8, i8* %291, align 16
  %293 = zext i8 %292 to i32
  %294 = load i32*, i32** %15, align 8
  %295 = getelementptr inbounds i32, i32* %294, i64 7
  store i32 %293, i32* %295, align 4
  %296 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %297 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %296, i32 0, i32 0
  %298 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %297, align 8
  %299 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %298, i32 0, i32 5
  store i32 85, i32* %299, align 8
  %300 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %301 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %300, i32 0, i32 0
  %302 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %301, align 8
  %303 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %302, i32 0, i32 1
  %304 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %303, align 8
  %305 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %306 = bitcast %struct.jpeg_decompress_struct* %305 to %struct.jpeg_common_struct*
  %307 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %304 to i64
  call void @__llvm_profile_instrument_target(i64 %307, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dht to i8*), i32 6)
  call void %304(%struct.jpeg_common_struct* %306, i32 2)
  br label %308

; <label>:308:                                    ; preds = %249
  %309 = load i32, i32* %9, align 4
  %310 = icmp sgt i32 %309, 256
  br i1 %310, label %317, label %311

; <label>:311:                                    ; preds = %308
  %pgocount9 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 7)
  %312 = add i64 %pgocount9, 1
  store i64 %312, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 7)
  %313 = load i32, i32* %9, align 4
  %314 = sext i32 %313 to i64
  %315 = load i64, i64* %4, align 8
  %316 = icmp sgt i64 %314, %315
  br i1 %316, label %317, label %331

; <label>:317:                                    ; preds = %311, %308
  %pgocount10 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 4)
  %318 = add i64 %pgocount10, 1
  store i64 %318, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 4)
  %319 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %320 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %319, i32 0, i32 0
  %321 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %320, align 8
  %322 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %321, i32 0, i32 5
  store i32 28, i32* %322, align 8
  %323 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %324 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %323, i32 0, i32 0
  %325 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %324, align 8
  %326 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %325, i32 0, i32 0
  %327 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %326, align 8
  %328 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %329 = bitcast %struct.jpeg_decompress_struct* %328 to %struct.jpeg_common_struct*
  %330 = ptrtoint void (%struct.jpeg_common_struct*)* %327 to i64
  call void @__llvm_profile_instrument_target(i64 %330, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dht to i8*), i32 7)
  call void %327(%struct.jpeg_common_struct* %329)
  br label %331

; <label>:331:                                    ; preds = %317, %311
  store i32 0, i32* %7, align 4
  br label %332

; <label>:332:                                    ; preds = %368, %331
  %333 = load i32, i32* %7, align 4
  %334 = load i32, i32* %9, align 4
  %335 = icmp slt i32 %333, %334
  br i1 %335, label %336, label %372

; <label>:336:                                    ; preds = %332
  br label %337

; <label>:337:                                    ; preds = %336
  %338 = load i64, i64* %13, align 8
  %339 = icmp eq i64 %338, 0
  br i1 %339, label %340, label %358

; <label>:340:                                    ; preds = %337
  %341 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %342 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %341, i32 0, i32 3
  %343 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %342, align 8
  %344 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %345 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %343 to i64
  call void @__llvm_profile_instrument_target(i64 %345, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dht to i8*), i32 8)
  %346 = call i32 %343(%struct.jpeg_decompress_struct* %344)
  %347 = icmp ne i32 %346, 0
  br i1 %347, label %350, label %348

; <label>:348:                                    ; preds = %340
  %pgocount11 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 13)
  %349 = add i64 %pgocount11, 1
  store i64 %349, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 13)
  store i32 0, i32* %2, align 4
  br label %453

; <label>:350:                                    ; preds = %340
  %pgocount12 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 3)
  %351 = add i64 %pgocount12, 1
  store i64 %351, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 3)
  %352 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %353 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %352, i32 0, i32 0
  %354 = load i8*, i8** %353, align 8
  store i8* %354, i8** %12, align 8
  %355 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %356 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %355, i32 0, i32 1
  %357 = load i64, i64* %356, align 8
  store i64 %357, i64* %13, align 8
  br label %358

; <label>:358:                                    ; preds = %350, %337
  %359 = load i64, i64* %13, align 8
  %360 = add i64 %359, -1
  store i64 %360, i64* %13, align 8
  %361 = load i8*, i8** %12, align 8
  %362 = getelementptr inbounds i8, i8* %361, i32 1
  store i8* %362, i8** %12, align 8
  %363 = load i8, i8* %361, align 1
  %364 = load i32, i32* %7, align 4
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds [256 x i8], [256 x i8]* %6, i64 0, i64 %365
  store i8 %363, i8* %366, align 1
  br label %367

; <label>:367:                                    ; preds = %358
  br label %368

; <label>:368:                                    ; preds = %367
  %pgocount13 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 1)
  %369 = add i64 %pgocount13, 1
  store i64 %369, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 1)
  %370 = load i32, i32* %7, align 4
  %371 = add nsw i32 %370, 1
  store i32 %371, i32* %7, align 4
  br label %332

; <label>:372:                                    ; preds = %332
  %373 = load i32, i32* %9, align 4
  %374 = sext i32 %373 to i64
  %375 = load i64, i64* %4, align 8
  %376 = sub nsw i64 %375, %374
  store i64 %376, i64* %4, align 8
  %377 = load i32, i32* %8, align 4
  %378 = and i32 %377, 16
  %379 = icmp ne i32 %378, 0
  br i1 %379, label %380, label %389

; <label>:380:                                    ; preds = %372
  %pgocount14 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 9)
  %381 = add i64 %pgocount14, 1
  store i64 %381, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 9)
  %382 = load i32, i32* %8, align 4
  %383 = sub nsw i32 %382, 16
  store i32 %383, i32* %8, align 4
  %384 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %385 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %384, i32 0, i32 41
  %386 = load i32, i32* %8, align 4
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %385, i64 0, i64 %387
  store %struct.JHUFF_TBL** %388, %struct.JHUFF_TBL*** %10, align 8
  br label %396

; <label>:389:                                    ; preds = %372
  %pgocount15 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 10)
  %390 = add i64 %pgocount15, 1
  store i64 %390, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 10)
  %391 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %392 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %391, i32 0, i32 40
  %393 = load i32, i32* %8, align 4
  %394 = sext i32 %393 to i64
  %395 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %392, i64 0, i64 %394
  store %struct.JHUFF_TBL** %395, %struct.JHUFF_TBL*** %10, align 8
  br label %396

; <label>:396:                                    ; preds = %389, %380
  %397 = load i32, i32* %8, align 4
  %398 = icmp slt i32 %397, 0
  br i1 %398, label %403, label %399

; <label>:399:                                    ; preds = %396
  %pgocount16 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 8)
  %400 = add i64 %pgocount16, 1
  store i64 %400, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 8)
  %401 = load i32, i32* %8, align 4
  %402 = icmp sge i32 %401, 4
  br i1 %402, label %403, label %424

; <label>:403:                                    ; preds = %399, %396
  %pgocount17 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 5)
  %404 = add i64 %pgocount17, 1
  store i64 %404, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 5)
  %405 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %406 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %405, i32 0, i32 0
  %407 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %406, align 8
  %408 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %407, i32 0, i32 5
  store i32 29, i32* %408, align 8
  %409 = load i32, i32* %8, align 4
  %410 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %411 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %410, i32 0, i32 0
  %412 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %411, align 8
  %413 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %412, i32 0, i32 6
  %414 = bitcast %union.anon* %413 to [8 x i32]*
  %415 = getelementptr inbounds [8 x i32], [8 x i32]* %414, i64 0, i64 0
  store i32 %409, i32* %415, align 4
  %416 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %417 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %416, i32 0, i32 0
  %418 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %417, align 8
  %419 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %418, i32 0, i32 0
  %420 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %419, align 8
  %421 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %422 = bitcast %struct.jpeg_decompress_struct* %421 to %struct.jpeg_common_struct*
  %423 = ptrtoint void (%struct.jpeg_common_struct*)* %420 to i64
  call void @__llvm_profile_instrument_target(i64 %423, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dht to i8*), i32 9)
  call void %420(%struct.jpeg_common_struct* %422)
  br label %424

; <label>:424:                                    ; preds = %403, %399
  %425 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %10, align 8
  %426 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %425, align 8
  %427 = icmp eq %struct.JHUFF_TBL* %426, null
  br i1 %427, label %428, label %434

; <label>:428:                                    ; preds = %424
  %pgocount18 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 12)
  %429 = add i64 %pgocount18, 1
  store i64 %429, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 12)
  %430 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %431 = bitcast %struct.jpeg_decompress_struct* %430 to %struct.jpeg_common_struct*
  %432 = call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* %431)
  %433 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %10, align 8
  store %struct.JHUFF_TBL* %432, %struct.JHUFF_TBL** %433, align 8
  br label %434

; <label>:434:                                    ; preds = %428, %424
  %435 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %10, align 8
  %436 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %435, align 8
  %437 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %436, i32 0, i32 0
  %438 = getelementptr inbounds [17 x i8], [17 x i8]* %437, i32 0, i32 0
  %439 = getelementptr inbounds [17 x i8], [17 x i8]* %5, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %438, i8* %439, i64 17, i32 4, i1 false)
  %440 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %10, align 8
  %441 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %440, align 8
  %442 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %441, i32 0, i32 1
  %443 = getelementptr inbounds [256 x i8], [256 x i8]* %442, i32 0, i32 0
  %444 = getelementptr inbounds [256 x i8], [256 x i8]* %6, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %443, i8* %444, i64 256, i32 1, i1 false)
  br label %87

; <label>:445:                                    ; preds = %87
  %pgocount19 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 18)
  %446 = add i64 %pgocount19, 1
  store i64 %446, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_get_dht, i64 0, i64 18)
  %447 = load i8*, i8** %12, align 8
  %448 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %449 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %448, i32 0, i32 0
  store i8* %447, i8** %449, align 8
  %450 = load i64, i64* %13, align 8
  %451 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %11, align 8
  %452 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %451, i32 0, i32 1
  store i64 %450, i64* %452, align 8
  store i32 1, i32* %2, align 4
  br label %453

; <label>:453:                                    ; preds = %445, %348, %155, %102, %65, %36
  %454 = load i32, i32* %2, align 4
  ret i32 %454
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_dqt(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.JQUANT_TBL*, align 8
  %10 = alloca %struct.jpeg_source_mgr*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i64, align 8
  %13 = alloca i32*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 5
  %16 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %15, align 8
  store %struct.jpeg_source_mgr* %16, %struct.jpeg_source_mgr** %10, align 8
  %17 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %18 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %17, i32 0, i32 0
  %19 = load i8*, i8** %18, align 8
  store i8* %19, i8** %11, align 8
  %20 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %21 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %20, i32 0, i32 1
  %22 = load i64, i64* %21, align 8
  store i64 %22, i64* %12, align 8
  br label %23

; <label>:23:                                     ; preds = %1
  %24 = load i64, i64* %12, align 8
  %25 = icmp eq i64 %24, 0
  br i1 %25, label %26, label %44

; <label>:26:                                     ; preds = %23
  %27 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %28 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %27, i32 0, i32 3
  %29 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %28, align 8
  %30 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %31 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %29 to i64
  call void @__llvm_profile_instrument_target(i64 %31, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dqt to i8*), i32 0)
  %32 = call i32 %29(%struct.jpeg_decompress_struct* %30)
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %36, label %34

; <label>:34:                                     ; preds = %26
  %pgocount = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 17)
  %35 = add i64 %pgocount, 1
  store i64 %35, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 17)
  store i32 0, i32* %2, align 4
  br label %444

; <label>:36:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 14)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 14)
  %38 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %39 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %38, i32 0, i32 0
  %40 = load i8*, i8** %39, align 8
  store i8* %40, i8** %11, align 8
  %41 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %42 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %41, i32 0, i32 1
  %43 = load i64, i64* %42, align 8
  store i64 %43, i64* %12, align 8
  br label %44

; <label>:44:                                     ; preds = %36, %23
  %45 = load i64, i64* %12, align 8
  %46 = add i64 %45, -1
  store i64 %46, i64* %12, align 8
  %47 = load i8*, i8** %11, align 8
  %48 = getelementptr inbounds i8, i8* %47, i32 1
  store i8* %48, i8** %11, align 8
  %49 = load i8, i8* %47, align 1
  %50 = zext i8 %49 to i32
  %51 = shl i32 %50, 8
  %52 = zext i32 %51 to i64
  store i64 %52, i64* %4, align 8
  %53 = load i64, i64* %12, align 8
  %54 = icmp eq i64 %53, 0
  br i1 %54, label %55, label %73

; <label>:55:                                     ; preds = %44
  %56 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %57 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %56, i32 0, i32 3
  %58 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %57, align 8
  %59 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %60 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %58 to i64
  call void @__llvm_profile_instrument_target(i64 %60, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dqt to i8*), i32 1)
  %61 = call i32 %58(%struct.jpeg_decompress_struct* %59)
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %65, label %63

; <label>:63:                                     ; preds = %55
  %pgocount2 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 18)
  %64 = add i64 %pgocount2, 1
  store i64 %64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 18)
  store i32 0, i32* %2, align 4
  br label %444

; <label>:65:                                     ; preds = %55
  %pgocount3 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 15)
  %66 = add i64 %pgocount3, 1
  store i64 %66, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 15)
  %67 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %68 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %67, i32 0, i32 0
  %69 = load i8*, i8** %68, align 8
  store i8* %69, i8** %11, align 8
  %70 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %71 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %70, i32 0, i32 1
  %72 = load i64, i64* %71, align 8
  store i64 %72, i64* %12, align 8
  br label %73

; <label>:73:                                     ; preds = %65, %44
  %74 = load i64, i64* %12, align 8
  %75 = add i64 %74, -1
  store i64 %75, i64* %12, align 8
  %76 = load i8*, i8** %11, align 8
  %77 = getelementptr inbounds i8, i8* %76, i32 1
  store i8* %77, i8** %11, align 8
  %78 = load i8, i8* %76, align 1
  %79 = zext i8 %78 to i64
  %80 = load i64, i64* %4, align 8
  %81 = add nsw i64 %80, %79
  store i64 %81, i64* %4, align 8
  br label %82

; <label>:82:                                     ; preds = %73
  %83 = load i64, i64* %4, align 8
  %84 = sub nsw i64 %83, 2
  store i64 %84, i64* %4, align 8
  br label %85

; <label>:85:                                     ; preds = %434, %82
  %86 = load i64, i64* %4, align 8
  %87 = icmp sgt i64 %86, 0
  br i1 %87, label %88, label %436

; <label>:88:                                     ; preds = %85
  br label %89

; <label>:89:                                     ; preds = %88
  %90 = load i64, i64* %12, align 8
  %91 = icmp eq i64 %90, 0
  br i1 %91, label %92, label %110

; <label>:92:                                     ; preds = %89
  %93 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %94 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %93, i32 0, i32 3
  %95 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %94, align 8
  %96 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %97 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %95 to i64
  call void @__llvm_profile_instrument_target(i64 %97, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dqt to i8*), i32 2)
  %98 = call i32 %95(%struct.jpeg_decompress_struct* %96)
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %102, label %100

; <label>:100:                                    ; preds = %92
  %pgocount4 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 20)
  %101 = add i64 %pgocount4, 1
  store i64 %101, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 20)
  store i32 0, i32* %2, align 4
  br label %444

; <label>:102:                                    ; preds = %92
  %pgocount5 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 10)
  %103 = add i64 %pgocount5, 1
  store i64 %103, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 10)
  %104 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %105 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %104, i32 0, i32 0
  %106 = load i8*, i8** %105, align 8
  store i8* %106, i8** %11, align 8
  %107 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %108 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %107, i32 0, i32 1
  %109 = load i64, i64* %108, align 8
  store i64 %109, i64* %12, align 8
  br label %110

; <label>:110:                                    ; preds = %102, %89
  %111 = load i64, i64* %12, align 8
  %112 = add i64 %111, -1
  store i64 %112, i64* %12, align 8
  %113 = load i8*, i8** %11, align 8
  %114 = getelementptr inbounds i8, i8* %113, i32 1
  store i8* %114, i8** %11, align 8
  %115 = load i8, i8* %113, align 1
  %116 = zext i8 %115 to i32
  store i32 %116, i32* %5, align 4
  br label %117

; <label>:117:                                    ; preds = %110
  %118 = load i32, i32* %5, align 4
  %119 = ashr i32 %118, 4
  store i32 %119, i32* %7, align 4
  %120 = load i32, i32* %5, align 4
  %121 = and i32 %120, 15
  store i32 %121, i32* %5, align 4
  %122 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %123 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %122, i32 0, i32 0
  %124 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %123, align 8
  %125 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %124, i32 0, i32 5
  store i32 80, i32* %125, align 8
  %126 = load i32, i32* %5, align 4
  %127 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %128 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %127, i32 0, i32 0
  %129 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %128, align 8
  %130 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %129, i32 0, i32 6
  %131 = bitcast %union.anon* %130 to [8 x i32]*
  %132 = getelementptr inbounds [8 x i32], [8 x i32]* %131, i64 0, i64 0
  store i32 %126, i32* %132, align 4
  %133 = load i32, i32* %7, align 4
  %134 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %135 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %134, i32 0, i32 0
  %136 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %135, align 8
  %137 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i32 0, i32 6
  %138 = bitcast %union.anon* %137 to [8 x i32]*
  %139 = getelementptr inbounds [8 x i32], [8 x i32]* %138, i64 0, i64 1
  store i32 %133, i32* %139, align 4
  %140 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %141 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %140, i32 0, i32 0
  %142 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %141, align 8
  %143 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %142, i32 0, i32 1
  %144 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %143, align 8
  %145 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %146 = bitcast %struct.jpeg_decompress_struct* %145 to %struct.jpeg_common_struct*
  %147 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %144 to i64
  call void @__llvm_profile_instrument_target(i64 %147, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dqt to i8*), i32 3)
  call void %144(%struct.jpeg_common_struct* %146, i32 1)
  %148 = load i32, i32* %5, align 4
  %149 = icmp sge i32 %148, 4
  br i1 %149, label %150, label %171

; <label>:150:                                    ; preds = %117
  %pgocount6 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 7)
  %151 = add i64 %pgocount6, 1
  store i64 %151, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 7)
  %152 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %153 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %152, i32 0, i32 0
  %154 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %153, align 8
  %155 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %154, i32 0, i32 5
  store i32 30, i32* %155, align 8
  %156 = load i32, i32* %5, align 4
  %157 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %158 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %157, i32 0, i32 0
  %159 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %158, align 8
  %160 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %159, i32 0, i32 6
  %161 = bitcast %union.anon* %160 to [8 x i32]*
  %162 = getelementptr inbounds [8 x i32], [8 x i32]* %161, i64 0, i64 0
  store i32 %156, i32* %162, align 4
  %163 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %164 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %163, i32 0, i32 0
  %165 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %164, align 8
  %166 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %165, i32 0, i32 0
  %167 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %166, align 8
  %168 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %169 = bitcast %struct.jpeg_decompress_struct* %168 to %struct.jpeg_common_struct*
  %170 = ptrtoint void (%struct.jpeg_common_struct*)* %167 to i64
  call void @__llvm_profile_instrument_target(i64 %170, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dqt to i8*), i32 4)
  call void %167(%struct.jpeg_common_struct* %169)
  br label %171

; <label>:171:                                    ; preds = %150, %117
  %172 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %173 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %172, i32 0, i32 39
  %174 = load i32, i32* %5, align 4
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %173, i64 0, i64 %175
  %177 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %176, align 8
  %178 = icmp eq %struct.JQUANT_TBL* %177, null
  br i1 %178, label %179, label %189

; <label>:179:                                    ; preds = %171
  %pgocount7 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 9)
  %180 = add i64 %pgocount7, 1
  store i64 %180, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 9)
  %181 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %182 = bitcast %struct.jpeg_decompress_struct* %181 to %struct.jpeg_common_struct*
  %183 = call %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct* %182)
  %184 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %185 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %184, i32 0, i32 39
  %186 = load i32, i32* %5, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %185, i64 0, i64 %187
  store %struct.JQUANT_TBL* %183, %struct.JQUANT_TBL** %188, align 8
  br label %189

; <label>:189:                                    ; preds = %179, %171
  %190 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %191 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %190, i32 0, i32 39
  %192 = load i32, i32* %5, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %191, i64 0, i64 %193
  %195 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %194, align 8
  store %struct.JQUANT_TBL* %195, %struct.JQUANT_TBL** %9, align 8
  store i32 0, i32* %6, align 4
  br label %196

; <label>:196:                                    ; preds = %305, %189
  %197 = load i32, i32* %6, align 4
  %198 = icmp slt i32 %197, 64
  br i1 %198, label %199, label %308

; <label>:199:                                    ; preds = %196
  %200 = load i32, i32* %7, align 4
  %201 = icmp ne i32 %200, 0
  br i1 %201, label %202, label %263

; <label>:202:                                    ; preds = %199
  br label %203

; <label>:203:                                    ; preds = %202
  %204 = load i64, i64* %12, align 8
  %205 = icmp eq i64 %204, 0
  br i1 %205, label %206, label %224

; <label>:206:                                    ; preds = %203
  %207 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %208 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %207, i32 0, i32 3
  %209 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %208, align 8
  %210 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %211 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %209 to i64
  call void @__llvm_profile_instrument_target(i64 %211, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dqt to i8*), i32 5)
  %212 = call i32 %209(%struct.jpeg_decompress_struct* %210)
  %213 = icmp ne i32 %212, 0
  br i1 %213, label %216, label %214

; <label>:214:                                    ; preds = %206
  %pgocount8 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 12)
  %215 = add i64 %pgocount8, 1
  store i64 %215, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 12)
  store i32 0, i32* %2, align 4
  br label %444

; <label>:216:                                    ; preds = %206
  %pgocount9 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 3)
  %217 = add i64 %pgocount9, 1
  store i64 %217, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 3)
  %218 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %219 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %218, i32 0, i32 0
  %220 = load i8*, i8** %219, align 8
  store i8* %220, i8** %11, align 8
  %221 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %222 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %221, i32 0, i32 1
  %223 = load i64, i64* %222, align 8
  store i64 %223, i64* %12, align 8
  br label %224

; <label>:224:                                    ; preds = %216, %203
  %225 = load i64, i64* %12, align 8
  %226 = add i64 %225, -1
  store i64 %226, i64* %12, align 8
  %227 = load i8*, i8** %11, align 8
  %228 = getelementptr inbounds i8, i8* %227, i32 1
  store i8* %228, i8** %11, align 8
  %229 = load i8, i8* %227, align 1
  %230 = zext i8 %229 to i32
  %231 = shl i32 %230, 8
  store i32 %231, i32* %8, align 4
  %232 = load i64, i64* %12, align 8
  %233 = icmp eq i64 %232, 0
  br i1 %233, label %234, label %252

; <label>:234:                                    ; preds = %224
  %235 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %236 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %235, i32 0, i32 3
  %237 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %236, align 8
  %238 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %239 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %237 to i64
  call void @__llvm_profile_instrument_target(i64 %239, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dqt to i8*), i32 6)
  %240 = call i32 %237(%struct.jpeg_decompress_struct* %238)
  %241 = icmp ne i32 %240, 0
  br i1 %241, label %244, label %242

; <label>:242:                                    ; preds = %234
  %pgocount10 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 13)
  %243 = add i64 %pgocount10, 1
  store i64 %243, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 13)
  store i32 0, i32* %2, align 4
  br label %444

; <label>:244:                                    ; preds = %234
  %pgocount11 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 4)
  %245 = add i64 %pgocount11, 1
  store i64 %245, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 4)
  %246 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %247 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %246, i32 0, i32 0
  %248 = load i8*, i8** %247, align 8
  store i8* %248, i8** %11, align 8
  %249 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %250 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %249, i32 0, i32 1
  %251 = load i64, i64* %250, align 8
  store i64 %251, i64* %12, align 8
  br label %252

; <label>:252:                                    ; preds = %244, %224
  %253 = load i64, i64* %12, align 8
  %254 = add i64 %253, -1
  store i64 %254, i64* %12, align 8
  %255 = load i8*, i8** %11, align 8
  %256 = getelementptr inbounds i8, i8* %255, i32 1
  store i8* %256, i8** %11, align 8
  %257 = load i8, i8* %255, align 1
  %258 = zext i8 %257 to i32
  %259 = load i32, i32* %8, align 4
  %260 = add i32 %259, %258
  store i32 %260, i32* %8, align 4
  br label %261

; <label>:261:                                    ; preds = %252
  %pgocount12 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 0)
  %262 = add i64 %pgocount12, 1
  store i64 %262, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 0)
  br label %294

; <label>:263:                                    ; preds = %199
  br label %264

; <label>:264:                                    ; preds = %263
  %265 = load i64, i64* %12, align 8
  %266 = icmp eq i64 %265, 0
  br i1 %266, label %267, label %285

; <label>:267:                                    ; preds = %264
  %268 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %269 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %268, i32 0, i32 3
  %270 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %269, align 8
  %271 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %272 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %270 to i64
  call void @__llvm_profile_instrument_target(i64 %272, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dqt to i8*), i32 7)
  %273 = call i32 %270(%struct.jpeg_decompress_struct* %271)
  %274 = icmp ne i32 %273, 0
  br i1 %274, label %277, label %275

; <label>:275:                                    ; preds = %267
  %pgocount13 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 16)
  %276 = add i64 %pgocount13, 1
  store i64 %276, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 16)
  store i32 0, i32* %2, align 4
  br label %444

; <label>:277:                                    ; preds = %267
  %pgocount14 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 5)
  %278 = add i64 %pgocount14, 1
  store i64 %278, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 5)
  %279 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %280 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %279, i32 0, i32 0
  %281 = load i8*, i8** %280, align 8
  store i8* %281, i8** %11, align 8
  %282 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %283 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %282, i32 0, i32 1
  %284 = load i64, i64* %283, align 8
  store i64 %284, i64* %12, align 8
  br label %285

; <label>:285:                                    ; preds = %277, %264
  %286 = load i64, i64* %12, align 8
  %287 = add i64 %286, -1
  store i64 %287, i64* %12, align 8
  %288 = load i8*, i8** %11, align 8
  %289 = getelementptr inbounds i8, i8* %288, i32 1
  store i8* %289, i8** %11, align 8
  %290 = load i8, i8* %288, align 1
  %291 = zext i8 %290 to i32
  store i32 %291, i32* %8, align 4
  br label %292

; <label>:292:                                    ; preds = %285
  %pgocount15 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 2)
  %293 = add i64 %pgocount15, 1
  store i64 %293, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 2)
  br label %294

; <label>:294:                                    ; preds = %292, %261
  %295 = load i32, i32* %8, align 4
  %296 = trunc i32 %295 to i16
  %297 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %298 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %297, i32 0, i32 0
  %299 = load i32, i32* %6, align 4
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %300
  %302 = load i32, i32* %301, align 4
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds [64 x i16], [64 x i16]* %298, i64 0, i64 %303
  store i16 %296, i16* %304, align 2
  br label %305

; <label>:305:                                    ; preds = %294
  %306 = load i32, i32* %6, align 4
  %307 = add nsw i32 %306, 1
  store i32 %307, i32* %6, align 4
  br label %196

; <label>:308:                                    ; preds = %196
  %309 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %310 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %309, i32 0, i32 0
  %311 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %310, align 8
  %312 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %311, i32 0, i32 7
  %313 = load i32, i32* %312, align 4
  %314 = icmp sge i32 %313, 2
  br i1 %314, label %315, label %425

; <label>:315:                                    ; preds = %308
  store i32 0, i32* %6, align 4
  br label %316

; <label>:316:                                    ; preds = %419, %315
  %317 = load i32, i32* %6, align 4
  %318 = icmp slt i32 %317, 64
  br i1 %318, label %319, label %423

; <label>:319:                                    ; preds = %316
  br label %320

; <label>:320:                                    ; preds = %319
  %321 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %322 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %321, i32 0, i32 0
  %323 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %322, align 8
  %324 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %323, i32 0, i32 6
  %325 = bitcast %union.anon* %324 to [8 x i32]*
  %326 = getelementptr inbounds [8 x i32], [8 x i32]* %325, i32 0, i32 0
  store i32* %326, i32** %13, align 8
  %327 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %328 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %327, i32 0, i32 0
  %329 = load i32, i32* %6, align 4
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds [64 x i16], [64 x i16]* %328, i64 0, i64 %330
  %332 = load i16, i16* %331, align 2
  %333 = zext i16 %332 to i32
  %334 = load i32*, i32** %13, align 8
  %335 = getelementptr inbounds i32, i32* %334, i64 0
  store i32 %333, i32* %335, align 4
  %336 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %337 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %336, i32 0, i32 0
  %338 = load i32, i32* %6, align 4
  %339 = add nsw i32 %338, 1
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds [64 x i16], [64 x i16]* %337, i64 0, i64 %340
  %342 = load i16, i16* %341, align 2
  %343 = zext i16 %342 to i32
  %344 = load i32*, i32** %13, align 8
  %345 = getelementptr inbounds i32, i32* %344, i64 1
  store i32 %343, i32* %345, align 4
  %346 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %347 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %346, i32 0, i32 0
  %348 = load i32, i32* %6, align 4
  %349 = add nsw i32 %348, 2
  %350 = sext i32 %349 to i64
  %351 = getelementptr inbounds [64 x i16], [64 x i16]* %347, i64 0, i64 %350
  %352 = load i16, i16* %351, align 2
  %353 = zext i16 %352 to i32
  %354 = load i32*, i32** %13, align 8
  %355 = getelementptr inbounds i32, i32* %354, i64 2
  store i32 %353, i32* %355, align 4
  %356 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %357 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %356, i32 0, i32 0
  %358 = load i32, i32* %6, align 4
  %359 = add nsw i32 %358, 3
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds [64 x i16], [64 x i16]* %357, i64 0, i64 %360
  %362 = load i16, i16* %361, align 2
  %363 = zext i16 %362 to i32
  %364 = load i32*, i32** %13, align 8
  %365 = getelementptr inbounds i32, i32* %364, i64 3
  store i32 %363, i32* %365, align 4
  %366 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %367 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %366, i32 0, i32 0
  %368 = load i32, i32* %6, align 4
  %369 = add nsw i32 %368, 4
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds [64 x i16], [64 x i16]* %367, i64 0, i64 %370
  %372 = load i16, i16* %371, align 2
  %373 = zext i16 %372 to i32
  %374 = load i32*, i32** %13, align 8
  %375 = getelementptr inbounds i32, i32* %374, i64 4
  store i32 %373, i32* %375, align 4
  %376 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %377 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %376, i32 0, i32 0
  %378 = load i32, i32* %6, align 4
  %379 = add nsw i32 %378, 5
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds [64 x i16], [64 x i16]* %377, i64 0, i64 %380
  %382 = load i16, i16* %381, align 2
  %383 = zext i16 %382 to i32
  %384 = load i32*, i32** %13, align 8
  %385 = getelementptr inbounds i32, i32* %384, i64 5
  store i32 %383, i32* %385, align 4
  %386 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %387 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %386, i32 0, i32 0
  %388 = load i32, i32* %6, align 4
  %389 = add nsw i32 %388, 6
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds [64 x i16], [64 x i16]* %387, i64 0, i64 %390
  %392 = load i16, i16* %391, align 2
  %393 = zext i16 %392 to i32
  %394 = load i32*, i32** %13, align 8
  %395 = getelementptr inbounds i32, i32* %394, i64 6
  store i32 %393, i32* %395, align 4
  %396 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %397 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %396, i32 0, i32 0
  %398 = load i32, i32* %6, align 4
  %399 = add nsw i32 %398, 7
  %400 = sext i32 %399 to i64
  %401 = getelementptr inbounds [64 x i16], [64 x i16]* %397, i64 0, i64 %400
  %402 = load i16, i16* %401, align 2
  %403 = zext i16 %402 to i32
  %404 = load i32*, i32** %13, align 8
  %405 = getelementptr inbounds i32, i32* %404, i64 7
  store i32 %403, i32* %405, align 4
  %406 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %407 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %406, i32 0, i32 0
  %408 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %407, align 8
  %409 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %408, i32 0, i32 5
  store i32 92, i32* %409, align 8
  %410 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %411 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %410, i32 0, i32 0
  %412 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %411, align 8
  %413 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %412, i32 0, i32 1
  %414 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %413, align 8
  %415 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %416 = bitcast %struct.jpeg_decompress_struct* %415 to %struct.jpeg_common_struct*
  %417 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %414 to i64
  call void @__llvm_profile_instrument_target(i64 %417, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dqt to i8*), i32 8)
  call void %414(%struct.jpeg_common_struct* %416, i32 2)
  br label %418

; <label>:418:                                    ; preds = %320
  br label %419

; <label>:419:                                    ; preds = %418
  %pgocount16 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 1)
  %420 = add i64 %pgocount16, 1
  store i64 %420, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 1)
  %421 = load i32, i32* %6, align 4
  %422 = add nsw i32 %421, 8
  store i32 %422, i32* %6, align 4
  br label %316

; <label>:423:                                    ; preds = %316
  %pgocount17 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 11)
  %424 = add i64 %pgocount17, 1
  store i64 %424, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 11)
  br label %425

; <label>:425:                                    ; preds = %423, %308
  %426 = load i64, i64* %4, align 8
  %427 = sub nsw i64 %426, 65
  store i64 %427, i64* %4, align 8
  %428 = load i32, i32* %7, align 4
  %429 = icmp ne i32 %428, 0
  br i1 %429, label %430, label %434

; <label>:430:                                    ; preds = %425
  %pgocount18 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 8)
  %431 = add i64 %pgocount18, 1
  store i64 %431, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 8)
  %432 = load i64, i64* %4, align 8
  %433 = sub nsw i64 %432, 64
  store i64 %433, i64* %4, align 8
  br label %434

; <label>:434:                                    ; preds = %430, %425
  %pgocount19 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 6)
  %435 = add i64 %pgocount19, 1
  store i64 %435, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 6)
  br label %85

; <label>:436:                                    ; preds = %85
  %pgocount20 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 19)
  %437 = add i64 %pgocount20, 1
  store i64 %437, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_get_dqt, i64 0, i64 19)
  %438 = load i8*, i8** %11, align 8
  %439 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %440 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %439, i32 0, i32 0
  store i8* %438, i8** %440, align 8
  %441 = load i64, i64* %12, align 8
  %442 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  %443 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %442, i32 0, i32 1
  store i64 %441, i64* %443, align 8
  store i32 1, i32* %2, align 4
  br label %444

; <label>:444:                                    ; preds = %436, %275, %242, %214, %100, %63, %34
  %445 = load i32, i32* %2, align 4
  ret i32 %445
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_dri(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.jpeg_source_mgr*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %9 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %9, i32 0, i32 5
  %11 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %10, align 8
  store %struct.jpeg_source_mgr* %11, %struct.jpeg_source_mgr** %6, align 8
  %12 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %13 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %12, i32 0, i32 0
  %14 = load i8*, i8** %13, align 8
  store i8* %14, i8** %7, align 8
  %15 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %16 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %15, i32 0, i32 1
  %17 = load i64, i64* %16, align 8
  store i64 %17, i64* %8, align 8
  br label %18

; <label>:18:                                     ; preds = %1
  %19 = load i64, i64* %8, align 8
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %21, label %39

; <label>:21:                                     ; preds = %18
  %22 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %23 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %22, i32 0, i32 3
  %24 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %23, align 8
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %26 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %24 to i64
  call void @__llvm_profile_instrument_target(i64 %26, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dri to i8*), i32 0)
  %27 = call i32 %24(%struct.jpeg_decompress_struct* %25)
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %31, label %29

; <label>:29:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 6)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 6)
  store i32 0, i32* %2, align 4
  br label %183

; <label>:31:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 2)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 2)
  %33 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %34 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %33, i32 0, i32 0
  %35 = load i8*, i8** %34, align 8
  store i8* %35, i8** %7, align 8
  %36 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %37 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %36, i32 0, i32 1
  %38 = load i64, i64* %37, align 8
  store i64 %38, i64* %8, align 8
  br label %39

; <label>:39:                                     ; preds = %31, %18
  %40 = load i64, i64* %8, align 8
  %41 = add i64 %40, -1
  store i64 %41, i64* %8, align 8
  %42 = load i8*, i8** %7, align 8
  %43 = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %43, i8** %7, align 8
  %44 = load i8, i8* %42, align 1
  %45 = zext i8 %44 to i32
  %46 = shl i32 %45, 8
  %47 = zext i32 %46 to i64
  store i64 %47, i64* %4, align 8
  %48 = load i64, i64* %8, align 8
  %49 = icmp eq i64 %48, 0
  br i1 %49, label %50, label %68

; <label>:50:                                     ; preds = %39
  %51 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %52 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %51, i32 0, i32 3
  %53 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %52, align 8
  %54 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %55 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %53 to i64
  call void @__llvm_profile_instrument_target(i64 %55, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dri to i8*), i32 1)
  %56 = call i32 %53(%struct.jpeg_decompress_struct* %54)
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %60, label %58

; <label>:58:                                     ; preds = %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 7)
  %59 = add i64 %pgocount2, 1
  store i64 %59, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 7)
  store i32 0, i32* %2, align 4
  br label %183

; <label>:60:                                     ; preds = %50
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 3)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 3)
  %62 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %63 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %62, i32 0, i32 0
  %64 = load i8*, i8** %63, align 8
  store i8* %64, i8** %7, align 8
  %65 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %66 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %65, i32 0, i32 1
  %67 = load i64, i64* %66, align 8
  store i64 %67, i64* %8, align 8
  br label %68

; <label>:68:                                     ; preds = %60, %39
  %69 = load i64, i64* %8, align 8
  %70 = add i64 %69, -1
  store i64 %70, i64* %8, align 8
  %71 = load i8*, i8** %7, align 8
  %72 = getelementptr inbounds i8, i8* %71, i32 1
  store i8* %72, i8** %7, align 8
  %73 = load i8, i8* %71, align 1
  %74 = zext i8 %73 to i64
  %75 = load i64, i64* %4, align 8
  %76 = add nsw i64 %75, %74
  store i64 %76, i64* %4, align 8
  br label %77

; <label>:77:                                     ; preds = %68
  %78 = load i64, i64* %4, align 8
  %79 = icmp ne i64 %78, 4
  br i1 %79, label %80, label %94

; <label>:80:                                     ; preds = %77
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 1)
  %81 = add i64 %pgocount4, 1
  store i64 %81, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 1)
  %82 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %83 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %82, i32 0, i32 0
  %84 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %83, align 8
  %85 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %84, i32 0, i32 5
  store i32 9, i32* %85, align 8
  %86 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %87 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %86, i32 0, i32 0
  %88 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %87, align 8
  %89 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %88, i32 0, i32 0
  %90 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %89, align 8
  %91 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %92 = bitcast %struct.jpeg_decompress_struct* %91 to %struct.jpeg_common_struct*
  %93 = ptrtoint void (%struct.jpeg_common_struct*)* %90 to i64
  call void @__llvm_profile_instrument_target(i64 %93, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dri to i8*), i32 2)
  call void %90(%struct.jpeg_common_struct* %92)
  br label %94

; <label>:94:                                     ; preds = %80, %77
  br label %95

; <label>:95:                                     ; preds = %94
  %96 = load i64, i64* %8, align 8
  %97 = icmp eq i64 %96, 0
  br i1 %97, label %98, label %116

; <label>:98:                                     ; preds = %95
  %99 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %100 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %99, i32 0, i32 3
  %101 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %100, align 8
  %102 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %103 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %101 to i64
  call void @__llvm_profile_instrument_target(i64 %103, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dri to i8*), i32 3)
  %104 = call i32 %101(%struct.jpeg_decompress_struct* %102)
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %108, label %106

; <label>:106:                                    ; preds = %98
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 8)
  %107 = add i64 %pgocount5, 1
  store i64 %107, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 8)
  store i32 0, i32* %2, align 4
  br label %183

; <label>:108:                                    ; preds = %98
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 4)
  %109 = add i64 %pgocount6, 1
  store i64 %109, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 4)
  %110 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %111 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %110, i32 0, i32 0
  %112 = load i8*, i8** %111, align 8
  store i8* %112, i8** %7, align 8
  %113 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %114 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %113, i32 0, i32 1
  %115 = load i64, i64* %114, align 8
  store i64 %115, i64* %8, align 8
  br label %116

; <label>:116:                                    ; preds = %108, %95
  %117 = load i64, i64* %8, align 8
  %118 = add i64 %117, -1
  store i64 %118, i64* %8, align 8
  %119 = load i8*, i8** %7, align 8
  %120 = getelementptr inbounds i8, i8* %119, i32 1
  store i8* %120, i8** %7, align 8
  %121 = load i8, i8* %119, align 1
  %122 = zext i8 %121 to i32
  %123 = shl i32 %122, 8
  store i32 %123, i32* %5, align 4
  %124 = load i64, i64* %8, align 8
  %125 = icmp eq i64 %124, 0
  br i1 %125, label %126, label %144

; <label>:126:                                    ; preds = %116
  %127 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %128 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %127, i32 0, i32 3
  %129 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %128, align 8
  %130 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %131 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %129 to i64
  call void @__llvm_profile_instrument_target(i64 %131, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dri to i8*), i32 4)
  %132 = call i32 %129(%struct.jpeg_decompress_struct* %130)
  %133 = icmp ne i32 %132, 0
  br i1 %133, label %136, label %134

; <label>:134:                                    ; preds = %126
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 9)
  %135 = add i64 %pgocount7, 1
  store i64 %135, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 9)
  store i32 0, i32* %2, align 4
  br label %183

; <label>:136:                                    ; preds = %126
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 5)
  %137 = add i64 %pgocount8, 1
  store i64 %137, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 5)
  %138 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %139 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %138, i32 0, i32 0
  %140 = load i8*, i8** %139, align 8
  store i8* %140, i8** %7, align 8
  %141 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %142 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %141, i32 0, i32 1
  %143 = load i64, i64* %142, align 8
  store i64 %143, i64* %8, align 8
  br label %144

; <label>:144:                                    ; preds = %136, %116
  %145 = load i64, i64* %8, align 8
  %146 = add i64 %145, -1
  store i64 %146, i64* %8, align 8
  %147 = load i8*, i8** %7, align 8
  %148 = getelementptr inbounds i8, i8* %147, i32 1
  store i8* %148, i8** %7, align 8
  %149 = load i8, i8* %147, align 1
  %150 = zext i8 %149 to i32
  %151 = load i32, i32* %5, align 4
  %152 = add i32 %151, %150
  store i32 %152, i32* %5, align 4
  br label %153

; <label>:153:                                    ; preds = %144
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 0)
  %154 = add i64 %pgocount9, 1
  store i64 %154, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_get_dri, i64 0, i64 0)
  %155 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %156 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %155, i32 0, i32 0
  %157 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %156, align 8
  %158 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %157, i32 0, i32 5
  store i32 81, i32* %158, align 8
  %159 = load i32, i32* %5, align 4
  %160 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %161 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %160, i32 0, i32 0
  %162 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %161, align 8
  %163 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %162, i32 0, i32 6
  %164 = bitcast %union.anon* %163 to [8 x i32]*
  %165 = getelementptr inbounds [8 x i32], [8 x i32]* %164, i64 0, i64 0
  store i32 %159, i32* %165, align 4
  %166 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %167 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %166, i32 0, i32 0
  %168 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %167, align 8
  %169 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %168, i32 0, i32 1
  %170 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %169, align 8
  %171 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %172 = bitcast %struct.jpeg_decompress_struct* %171 to %struct.jpeg_common_struct*
  %173 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %170 to i64
  call void @__llvm_profile_instrument_target(i64 %173, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_dri to i8*), i32 5)
  call void %170(%struct.jpeg_common_struct* %172, i32 1)
  %174 = load i32, i32* %5, align 4
  %175 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %176 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %175, i32 0, i32 49
  store i32 %174, i32* %176, align 8
  %177 = load i8*, i8** %7, align 8
  %178 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %179 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %178, i32 0, i32 0
  store i8* %177, i8** %179, align 8
  %180 = load i64, i64* %8, align 8
  %181 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %182 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %181, i32 0, i32 1
  store i64 %180, i64* %182, align 8
  store i32 1, i32* %2, align 4
  br label %183

; <label>:183:                                    ; preds = %153, %134, %106, %58, %29
  %184 = load i32, i32* %2, align 4
  ret i32 %184
}

declare %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

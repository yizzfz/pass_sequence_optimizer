; ModuleID = 'tmp1.ll'
source_filename = "jcphuff.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_compress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_destination_mgr*, i32, i32, i32, i32, double, i32, i32, i32, %struct.jpeg_component_info*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], [16 x i8], [16 x i8], [16 x i8], i32, %struct.jpeg_scan_info*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8, i16, i16, i32, i32, i32, i32, i32, i32, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, %struct.jpeg_comp_master*, %struct.jpeg_c_main_controller*, %struct.jpeg_c_prep_controller*, %struct.jpeg_c_coef_controller*, %struct.jpeg_marker_writer*, %struct.jpeg_color_converter*, %struct.jpeg_downsampler*, %struct.jpeg_forward_dct*, %struct.jpeg_entropy_encoder* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_destination_mgr = type { i8*, i64, {}*, i32 (%struct.jpeg_compress_struct*)*, {}* }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_scan_info = type { i32, [4 x i32], i32, i32, i32, i32 }
%struct.jpeg_comp_master = type { {}*, {}*, {}*, i32, i32 }
%struct.jpeg_c_main_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32)* }
%struct.jpeg_c_prep_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* }
%struct.jpeg_c_coef_controller = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, i8***)* }
%struct.jpeg_marker_writer = type { void (%struct.jpeg_compress_struct*, i32, i8*, i32)*, {}*, {}*, {}*, {}*, {}* }
%struct.jpeg_color_converter = type { {}*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* }
%struct.jpeg_downsampler = type { {}*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, i32 }
%struct.jpeg_forward_dct = type { {}*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* }
%struct.jpeg_entropy_encoder = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, {}* }
%struct.phuff_entropy_encoder = type { %struct.jpeg_entropy_encoder, i32, i8*, i64, i64, i32, %struct.jpeg_compress_struct*, [4 x i32], i32, i32, i32, i8*, i32, i32, [4 x %struct.c_derived_tbl*], [4 x i64*] }
%struct.c_derived_tbl = type { [256 x i32], [256 x i8] }

$__llvm_profile_raw_version = comdat any

@jpeg_natural_order = external constant [0 x i32], align 4
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_phuff_encoder = private constant [19 x i8] c"jinit_phuff_encoder"
@__profn_tmp1.ll_start_pass_phuff = private constant [24 x i8] c"tmp1.ll:start_pass_phuff"
@__profn_tmp1.ll_encode_mcu_DC_first = private constant [27 x i8] c"tmp1.ll:encode_mcu_DC_first"
@__profn_tmp1.ll_encode_mcu_AC_first = private constant [27 x i8] c"tmp1.ll:encode_mcu_AC_first"
@__profn_tmp1.ll_encode_mcu_DC_refine = private constant [28 x i8] c"tmp1.ll:encode_mcu_DC_refine"
@__profn_tmp1.ll_encode_mcu_AC_refine = private constant [28 x i8] c"tmp1.ll:encode_mcu_AC_refine"
@__profn_tmp1.ll_finish_pass_gather_phuff = private constant [32 x i8] c"tmp1.ll:finish_pass_gather_phuff"
@__profn_tmp1.ll_finish_pass_phuff = private constant [25 x i8] c"tmp1.ll:finish_pass_phuff"
@__profn_tmp1.ll_emit_restart = private constant [20 x i8] c"tmp1.ll:emit_restart"
@__profn_tmp1.ll_emit_symbol = private constant [19 x i8] c"tmp1.ll:emit_symbol"
@__profn_tmp1.ll_emit_bits = private constant [17 x i8] c"tmp1.ll:emit_bits"
@__profn_tmp1.ll_emit_eobrun = private constant [19 x i8] c"tmp1.ll:emit_eobrun"
@__profn_tmp1.ll_flush_bits = private constant [18 x i8] c"tmp1.ll:flush_bits"
@__profn_tmp1.ll_dump_buffer = private constant [19 x i8] c"tmp1.ll:dump_buffer"
@__profn_tmp1.ll_emit_buffered_bits = private constant [26 x i8] c"tmp1.ll:emit_buffered_bits"
@__profc_jinit_phuff_encoder = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_phuff_encoder = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_phuff_encoder = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2969627654045403470, i64 281509114370972, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_phuff_encoder, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @jinit_phuff_encoder to i8*), i8* bitcast ([1 x i64]* @__profvp_jinit_phuff_encoder to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass_phuff = private global [20 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_pass_phuff = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_pass_phuff = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2144099135173486410, i64 1126170002702577, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32)* @start_pass_phuff to i8*), i8* bitcast ([4 x i64]* @__profvp_tmp1.ll_start_pass_phuff to i8*), i32 20, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_encode_mcu_DC_first = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_encode_mcu_DC_first = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6259928637225448503, i64 127304073125, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_DC_first to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_encode_mcu_AC_first = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_encode_mcu_AC_first = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8928147214091443328, i64 199607156232, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_AC_first to i8*), i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_encode_mcu_DC_refine = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_encode_mcu_DC_refine = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8003896793457712022, i64 85490287483, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_encode_mcu_DC_refine, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_DC_refine to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_encode_mcu_AC_refine = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_encode_mcu_AC_refine = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2894658109008024905, i64 72057825138103756, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_AC_refine to i8*), i8* null, i32 18, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_pass_gather_phuff = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_finish_pass_gather_phuff = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -99595434364795322, i64 106897718915, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_pass_gather_phuff, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @finish_pass_gather_phuff to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_pass_phuff = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_finish_pass_phuff = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6408645350711936271, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_pass_phuff, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @finish_pass_phuff to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_restart = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_emit_restart = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4654246168033032694, i64 89568109395, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_restart, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_symbol = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_emit_symbol = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8124676279093566419, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_emit_symbol, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_bits = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_emit_bits = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_emit_bits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -54067658092618037, i64 281573410709062, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_bits, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_emit_bits to i8*), i32 7, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_eobrun = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_emit_eobrun = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7691459350263750031, i64 52707068901, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_eobrun, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_flush_bits = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_flush_bits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2686774352449403793, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_flush_bits, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_dump_buffer = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_dump_buffer = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_dump_buffer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 634905541345717099, i64 562972713248871, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_dump_buffer, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_dump_buffer to i8*), i32 2, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_buffered_bits = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_emit_buffered_bits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 639695017953154737, i64 39944959587, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_buffered_bits, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [16 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [365 x i8] c"\EA\02\00jinit_phuff_encoder\01tmp1.ll:start_pass_phuff\01tmp1.ll:encode_mcu_DC_first\01tmp1.ll:encode_mcu_AC_first\01tmp1.ll:encode_mcu_DC_refine\01tmp1.ll:encode_mcu_AC_refine\01tmp1.ll:finish_pass_gather_phuff\01tmp1.ll:finish_pass_phuff\01tmp1.ll:emit_restart\01tmp1.ll:emit_symbol\01tmp1.ll:emit_bits\01tmp1.ll:emit_eobrun\01tmp1.ll:flush_bits\01tmp1.ll:dump_buffer\01tmp1.ll:emit_buffered_bits", section "__llvm_prf_names"
@llvm.used = appending global [17 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_phuff_encoder to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_phuff to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_encode_mcu_DC_first to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_encode_mcu_AC_first to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_encode_mcu_DC_refine to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_encode_mcu_AC_refine to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_pass_gather_phuff to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_pass_phuff to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_restart to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_symbol to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_bits to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_eobrun to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_flush_bits to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_dump_buffer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_buffered_bits to i8*), i8* bitcast ([16 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([365 x i8], [365 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jinit_phuff_encoder(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.phuff_entropy_encoder*, align 8
  %4 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 1
  %7 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %7, i32 0, i32 0
  %9 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %8, align 8
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %11 = bitcast %struct.jpeg_compress_struct* %10 to %struct.jpeg_common_struct*
  %12 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %9 to i64
  call void @__llvm_profile_instrument_target(i64 %12, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_phuff_encoder to i8*), i32 0)
  %13 = call i8* %9(%struct.jpeg_common_struct* %11, i32 1, i64 184)
  %14 = bitcast i8* %13 to %struct.phuff_entropy_encoder*
  store %struct.phuff_entropy_encoder* %14, %struct.phuff_entropy_encoder** %3, align 8
  %15 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %16 = bitcast %struct.phuff_entropy_encoder* %15 to %struct.jpeg_entropy_encoder*
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %17, i32 0, i32 59
  store %struct.jpeg_entropy_encoder* %16, %struct.jpeg_entropy_encoder** %18, align 8
  %19 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %20 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %20, i32 0, i32 0
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_phuff, void (%struct.jpeg_compress_struct*, i32)** %21, align 8
  store i32 0, i32* %4, align 4
  br label %22

; <label>:22:                                     ; preds = %36, %1
  %23 = load i32, i32* %4, align 4
  %24 = icmp slt i32 %23, 4
  br i1 %24, label %25, label %40

; <label>:25:                                     ; preds = %22
  %26 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %27 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %26, i32 0, i32 14
  %28 = load i32, i32* %4, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [4 x %struct.c_derived_tbl*], [4 x %struct.c_derived_tbl*]* %27, i64 0, i64 %29
  store %struct.c_derived_tbl* null, %struct.c_derived_tbl** %30, align 8
  %31 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %32 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %31, i32 0, i32 15
  %33 = load i32, i32* %4, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [4 x i64*], [4 x i64*]* %32, i64 0, i64 %34
  store i64* null, i64** %35, align 8
  br label %36

; <label>:36:                                     ; preds = %25
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_phuff_encoder, i64 0, i64 0)
  %37 = add i64 %pgocount, 1
  store i64 %37, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_phuff_encoder, i64 0, i64 0)
  %38 = load i32, i32* %4, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %4, align 4
  br label %22

; <label>:40:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_phuff_encoder, i64 0, i64 1)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_phuff_encoder, i64 0, i64 1)
  %42 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %43 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %42, i32 0, i32 11
  store i8* null, i8** %43, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_phuff(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.phuff_entropy_encoder*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %10, i32 0, i32 59
  %12 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %11, align 8
  %13 = bitcast %struct.jpeg_entropy_encoder* %12 to %struct.phuff_entropy_encoder*
  store %struct.phuff_entropy_encoder* %13, %struct.phuff_entropy_encoder** %5, align 8
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %15 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %16 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %15, i32 0, i32 6
  store %struct.jpeg_compress_struct* %14, %struct.jpeg_compress_struct** %16, align 8
  %17 = load i32, i32* %4, align 4
  %18 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %19 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %18, i32 0, i32 1
  store i32 %17, i32* %19, align 8
  %20 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %20, i32 0, i32 47
  %22 = load i32, i32* %21, align 4
  %23 = icmp eq i32 %22, 0
  %24 = zext i1 %23 to i32
  store i32 %24, i32* %6, align 4
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 49
  %27 = load i32, i32* %26, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %43

; <label>:29:                                     ; preds = %2
  %30 = load i32, i32* %6, align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %37

; <label>:32:                                     ; preds = %29
  %pgocount = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 16)
  %33 = add i64 %pgocount, 1
  store i64 %33, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 16)
  %34 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %35 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %34, i32 0, i32 0
  %36 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %35, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_DC_first, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %36, align 8
  br label %42

; <label>:37:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 18)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 18)
  %39 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %40 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %39, i32 0, i32 0
  %41 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %40, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_AC_first, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %41, align 8
  br label %42

; <label>:42:                                     ; preds = %37, %32
  br label %75

; <label>:43:                                     ; preds = %2
  %44 = load i32, i32* %6, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %51

; <label>:46:                                     ; preds = %43
  %pgocount2 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 14)
  %47 = add i64 %pgocount2, 1
  store i64 %47, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 14)
  %48 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %49 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %48, i32 0, i32 0
  %50 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %49, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_DC_refine, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %50, align 8
  br label %74

; <label>:51:                                     ; preds = %43
  %52 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %53 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %52, i32 0, i32 0
  %54 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %53, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_AC_refine, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %54, align 8
  %55 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %56 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %55, i32 0, i32 11
  %57 = load i8*, i8** %56, align 8
  %58 = icmp eq i8* %57, null
  br i1 %58, label %59, label %72

; <label>:59:                                     ; preds = %51
  %pgocount3 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 19)
  %60 = add i64 %pgocount3, 1
  store i64 %60, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 19)
  %61 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %62 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %61, i32 0, i32 1
  %63 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %62, align 8
  %64 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %63, i32 0, i32 0
  %65 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %64, align 8
  %66 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %67 = bitcast %struct.jpeg_compress_struct* %66 to %struct.jpeg_common_struct*
  %68 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %65 to i64
  call void @__llvm_profile_instrument_target(i64 %68, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_phuff to i8*), i32 0)
  %69 = call i8* %65(%struct.jpeg_common_struct* %67, i32 1, i64 1000)
  %70 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %71 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %70, i32 0, i32 11
  store i8* %69, i8** %71, align 8
  br label %72

; <label>:72:                                     ; preds = %59, %51
  %pgocount4 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 17)
  %73 = add i64 %pgocount4, 1
  store i64 %73, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 17)
  br label %74

; <label>:74:                                     ; preds = %72, %46
  br label %75

; <label>:75:                                     ; preds = %74, %42
  %76 = load i32, i32* %4, align 4
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %83

; <label>:78:                                     ; preds = %75
  %79 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %80 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %79, i32 0, i32 0
  %81 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %80, i32 0, i32 2
  %82 = bitcast {}** %81 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @finish_pass_gather_phuff, void (%struct.jpeg_compress_struct*)** %82, align 8
  br label %89

; <label>:83:                                     ; preds = %75
  %pgocount5 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 15)
  %84 = add i64 %pgocount5, 1
  store i64 %84, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 15)
  %85 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %86 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %85, i32 0, i32 0
  %87 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %86, i32 0, i32 2
  %88 = bitcast {}** %87 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @finish_pass_phuff, void (%struct.jpeg_compress_struct*)** %88, align 8
  br label %89

; <label>:89:                                     ; preds = %83, %78
  store i32 0, i32* %7, align 4
  br label %90

; <label>:90:                                     ; preds = %280, %89
  %91 = load i32, i32* %7, align 4
  %92 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %93 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %92, i32 0, i32 41
  %94 = load i32, i32* %93, align 4
  %95 = icmp slt i32 %91, %94
  br i1 %95, label %96, label %283

; <label>:96:                                     ; preds = %90
  %97 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %98 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %97, i32 0, i32 42
  %99 = load i32, i32* %7, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %98, i64 0, i64 %100
  %102 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %101, align 8
  store %struct.jpeg_component_info* %102, %struct.jpeg_component_info** %9, align 8
  %103 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %104 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %103, i32 0, i32 7
  %105 = load i32, i32* %7, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [4 x i32], [4 x i32]* %104, i64 0, i64 %106
  store i32 0, i32* %107, align 4
  %108 = load i32, i32* %6, align 4
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %110, label %163

; <label>:110:                                    ; preds = %96
  %111 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %112 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %111, i32 0, i32 49
  %113 = load i32, i32* %112, align 4
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %115, label %117

; <label>:115:                                    ; preds = %110
  %pgocount6 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 0)
  %116 = add i64 %pgocount6, 1
  store i64 %116, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 0)
  br label %280

; <label>:117:                                    ; preds = %110
  %118 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %9, align 8
  %119 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %118, i32 0, i32 5
  %120 = load i32, i32* %119, align 4
  store i32 %120, i32* %8, align 4
  %121 = load i32, i32* %8, align 4
  %122 = icmp slt i32 %121, 0
  br i1 %122, label %140, label %123

; <label>:123:                                    ; preds = %117
  %pgocount7 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 6)
  %124 = add i64 %pgocount7, 1
  store i64 %124, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 6)
  %125 = load i32, i32* %8, align 4
  %126 = icmp sge i32 %125, 4
  br i1 %126, label %140, label %127

; <label>:127:                                    ; preds = %123
  %pgocount8 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 11)
  %128 = add i64 %pgocount8, 1
  store i64 %128, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 11)
  %129 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %130 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %129, i32 0, i32 16
  %131 = load i32, i32* %8, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %130, i64 0, i64 %132
  %134 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %133, align 8
  %135 = icmp eq %struct.JHUFF_TBL* %134, null
  br i1 %135, label %136, label %161

; <label>:136:                                    ; preds = %127
  %pgocount9 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 13)
  %137 = add i64 %pgocount9, 1
  store i64 %137, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 13)
  %138 = load i32, i32* %4, align 4
  %139 = icmp ne i32 %138, 0
  br i1 %139, label %161, label %140

; <label>:140:                                    ; preds = %136, %123, %117
  %pgocount10 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 5)
  %141 = add i64 %pgocount10, 1
  store i64 %141, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 5)
  %142 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %143 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %142, i32 0, i32 0
  %144 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %143, align 8
  %145 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %144, i32 0, i32 5
  store i32 49, i32* %145, align 8
  %146 = load i32, i32* %8, align 4
  %147 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %148 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %147, i32 0, i32 0
  %149 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %148, align 8
  %150 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %149, i32 0, i32 6
  %151 = bitcast %union.anon* %150 to [8 x i32]*
  %152 = getelementptr inbounds [8 x i32], [8 x i32]* %151, i64 0, i64 0
  store i32 %146, i32* %152, align 4
  %153 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %154 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %153, i32 0, i32 0
  %155 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %154, align 8
  %156 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %155, i32 0, i32 0
  %157 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %156, align 8
  %158 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %159 = bitcast %struct.jpeg_compress_struct* %158 to %struct.jpeg_common_struct*
  %160 = ptrtoint void (%struct.jpeg_common_struct*)* %157 to i64
  call void @__llvm_profile_instrument_target(i64 %160, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_phuff to i8*), i32 1)
  call void %157(%struct.jpeg_common_struct* %159)
  br label %161

; <label>:161:                                    ; preds = %140, %136, %127
  %pgocount11 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 3)
  %162 = add i64 %pgocount11, 1
  store i64 %162, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 3)
  br label %211

; <label>:163:                                    ; preds = %96
  %pgocount12 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 1)
  %164 = add i64 %pgocount12, 1
  store i64 %164, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 1)
  %165 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %9, align 8
  %166 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %165, i32 0, i32 6
  %167 = load i32, i32* %166, align 8
  store i32 %167, i32* %8, align 4
  %168 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %169 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %168, i32 0, i32 8
  store i32 %167, i32* %169, align 8
  %170 = load i32, i32* %8, align 4
  %171 = icmp slt i32 %170, 0
  br i1 %171, label %189, label %172

; <label>:172:                                    ; preds = %163
  %pgocount13 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 4)
  %173 = add i64 %pgocount13, 1
  store i64 %173, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 4)
  %174 = load i32, i32* %8, align 4
  %175 = icmp sge i32 %174, 4
  br i1 %175, label %189, label %176

; <label>:176:                                    ; preds = %172
  %pgocount14 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 9)
  %177 = add i64 %pgocount14, 1
  store i64 %177, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 9)
  %178 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %179 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %178, i32 0, i32 17
  %180 = load i32, i32* %8, align 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %179, i64 0, i64 %181
  %183 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %182, align 8
  %184 = icmp eq %struct.JHUFF_TBL* %183, null
  br i1 %184, label %185, label %210

; <label>:185:                                    ; preds = %176
  %pgocount15 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 12)
  %186 = add i64 %pgocount15, 1
  store i64 %186, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 12)
  %187 = load i32, i32* %4, align 4
  %188 = icmp ne i32 %187, 0
  br i1 %188, label %210, label %189

; <label>:189:                                    ; preds = %185, %172, %163
  %pgocount16 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 2)
  %190 = add i64 %pgocount16, 1
  store i64 %190, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 2)
  %191 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %192 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %191, i32 0, i32 0
  %193 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %192, align 8
  %194 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %193, i32 0, i32 5
  store i32 49, i32* %194, align 8
  %195 = load i32, i32* %8, align 4
  %196 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %197 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %196, i32 0, i32 0
  %198 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %197, align 8
  %199 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %198, i32 0, i32 6
  %200 = bitcast %union.anon* %199 to [8 x i32]*
  %201 = getelementptr inbounds [8 x i32], [8 x i32]* %200, i64 0, i64 0
  store i32 %195, i32* %201, align 4
  %202 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %203 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %202, i32 0, i32 0
  %204 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %203, align 8
  %205 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %204, i32 0, i32 0
  %206 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %205, align 8
  %207 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %208 = bitcast %struct.jpeg_compress_struct* %207 to %struct.jpeg_common_struct*
  %209 = ptrtoint void (%struct.jpeg_common_struct*)* %206 to i64
  call void @__llvm_profile_instrument_target(i64 %209, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_phuff to i8*), i32 2)
  call void %206(%struct.jpeg_common_struct* %208)
  br label %210

; <label>:210:                                    ; preds = %189, %185, %176
  br label %211

; <label>:211:                                    ; preds = %210, %161
  %212 = load i32, i32* %4, align 4
  %213 = icmp ne i32 %212, 0
  br i1 %213, label %214, label %247

; <label>:214:                                    ; preds = %211
  %215 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %216 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %215, i32 0, i32 15
  %217 = load i32, i32* %8, align 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [4 x i64*], [4 x i64*]* %216, i64 0, i64 %218
  %220 = load i64*, i64** %219, align 8
  %221 = icmp eq i64* %220, null
  br i1 %221, label %222, label %239

; <label>:222:                                    ; preds = %214
  %pgocount17 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 7)
  %223 = add i64 %pgocount17, 1
  store i64 %223, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 7)
  %224 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %225 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %224, i32 0, i32 1
  %226 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %225, align 8
  %227 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %226, i32 0, i32 0
  %228 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %227, align 8
  %229 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %230 = bitcast %struct.jpeg_compress_struct* %229 to %struct.jpeg_common_struct*
  %231 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %228 to i64
  call void @__llvm_profile_instrument_target(i64 %231, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_phuff to i8*), i32 3)
  %232 = call i8* %228(%struct.jpeg_common_struct* %230, i32 1, i64 2056)
  %233 = bitcast i8* %232 to i64*
  %234 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %235 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %234, i32 0, i32 15
  %236 = load i32, i32* %8, align 4
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds [4 x i64*], [4 x i64*]* %235, i64 0, i64 %237
  store i64* %233, i64** %238, align 8
  br label %239

; <label>:239:                                    ; preds = %222, %214
  %240 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %241 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %240, i32 0, i32 15
  %242 = load i32, i32* %8, align 4
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds [4 x i64*], [4 x i64*]* %241, i64 0, i64 %243
  %245 = load i64*, i64** %244, align 8
  %246 = bitcast i64* %245 to i8*
  call void @llvm.memset.p0i8.i64(i8* %246, i8 0, i64 2056, i32 1, i1 false)
  br label %279

; <label>:247:                                    ; preds = %211
  %248 = load i32, i32* %6, align 4
  %249 = icmp ne i32 %248, 0
  br i1 %249, label %250, label %264

; <label>:250:                                    ; preds = %247
  %pgocount18 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 8)
  %251 = add i64 %pgocount18, 1
  store i64 %251, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 8)
  %252 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %253 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %254 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %253, i32 0, i32 16
  %255 = load i32, i32* %8, align 4
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %254, i64 0, i64 %256
  %258 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %257, align 8
  %259 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %260 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %259, i32 0, i32 14
  %261 = load i32, i32* %8, align 4
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds [4 x %struct.c_derived_tbl*], [4 x %struct.c_derived_tbl*]* %260, i64 0, i64 %262
  call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* %252, %struct.JHUFF_TBL* %258, %struct.c_derived_tbl** %263)
  br label %278

; <label>:264:                                    ; preds = %247
  %pgocount19 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 10)
  %265 = add i64 %pgocount19, 1
  store i64 %265, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_tmp1.ll_start_pass_phuff, i64 0, i64 10)
  %266 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %267 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %268 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %267, i32 0, i32 17
  %269 = load i32, i32* %8, align 4
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %268, i64 0, i64 %270
  %272 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %271, align 8
  %273 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %274 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %273, i32 0, i32 14
  %275 = load i32, i32* %8, align 4
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds [4 x %struct.c_derived_tbl*], [4 x %struct.c_derived_tbl*]* %274, i64 0, i64 %276
  call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* %266, %struct.JHUFF_TBL* %272, %struct.c_derived_tbl** %277)
  br label %278

; <label>:278:                                    ; preds = %264, %250
  br label %279

; <label>:279:                                    ; preds = %278, %239
  br label %280

; <label>:280:                                    ; preds = %279, %115
  %281 = load i32, i32* %7, align 4
  %282 = add nsw i32 %281, 1
  store i32 %282, i32* %7, align 4
  br label %90

; <label>:283:                                    ; preds = %90
  %284 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %285 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %284, i32 0, i32 9
  store i32 0, i32* %285, align 4
  %286 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %287 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %286, i32 0, i32 10
  store i32 0, i32* %287, align 8
  %288 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %289 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %288, i32 0, i32 4
  store i64 0, i64* %289, align 8
  %290 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %291 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %290, i32 0, i32 5
  store i32 0, i32* %291, align 8
  %292 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %293 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %292, i32 0, i32 29
  %294 = load i32, i32* %293, align 8
  %295 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %296 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %295, i32 0, i32 12
  store i32 %294, i32* %296, align 8
  %297 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %298 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %297, i32 0, i32 13
  store i32 0, i32* %298, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @encode_mcu_DC_first(%struct.jpeg_compress_struct*, [64 x i16]**) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca [64 x i16]**, align 8
  %5 = alloca %struct.phuff_entropy_encoder*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [64 x i16]*, align 8
  %13 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store [64 x i16]** %1, [64 x i16]*** %4, align 8
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %14, i32 0, i32 59
  %16 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %15, align 8
  %17 = bitcast %struct.jpeg_entropy_encoder* %16 to %struct.phuff_entropy_encoder*
  store %struct.phuff_entropy_encoder* %17, %struct.phuff_entropy_encoder** %5, align 8
  %18 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %18, i32 0, i32 50
  %20 = load i32, i32* %19, align 8
  store i32 %20, i32* %11, align 4
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 5
  %23 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %23, i32 0, i32 0
  %25 = load i8*, i8** %24, align 8
  %26 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %27 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %26, i32 0, i32 2
  store i8* %25, i8** %27, align 8
  %28 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %28, i32 0, i32 5
  %30 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %30, i32 0, i32 1
  %32 = load i64, i64* %31, align 8
  %33 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %34 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %33, i32 0, i32 3
  store i64 %32, i64* %34, align 8
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %35, i32 0, i32 29
  %37 = load i32, i32* %36, align 8
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %52

; <label>:39:                                     ; preds = %2
  %40 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %41 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %40, i32 0, i32 12
  %42 = load i32, i32* %41, align 8
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %50

; <label>:44:                                     ; preds = %39
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 7)
  %45 = add i64 %pgocount, 1
  store i64 %45, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 7)
  %46 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %47 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %48 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %47, i32 0, i32 13
  %49 = load i32, i32* %48, align 4
  call void @emit_restart(%struct.phuff_entropy_encoder* %46, i32 %49)
  br label %50

; <label>:50:                                     ; preds = %44, %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 5)
  %51 = add i64 %pgocount1, 1
  store i64 %51, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 5)
  br label %52

; <label>:52:                                     ; preds = %50, %2
  store i32 0, i32* %9, align 4
  br label %53

; <label>:53:                                     ; preds = %131, %52
  %54 = load i32, i32* %9, align 4
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %55, i32 0, i32 45
  %57 = load i32, i32* %56, align 8
  %58 = icmp slt i32 %54, %57
  br i1 %58, label %59, label %134

; <label>:59:                                     ; preds = %53
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 1)
  %60 = add i64 %pgocount2, 1
  store i64 %60, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 1)
  %61 = load [64 x i16]**, [64 x i16]*** %4, align 8
  %62 = load i32, i32* %9, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [64 x i16]*, [64 x i16]** %61, i64 %63
  %65 = load [64 x i16]*, [64 x i16]** %64, align 8
  store [64 x i16]* %65, [64 x i16]** %12, align 8
  %66 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %67 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %66, i32 0, i32 46
  %68 = load i32, i32* %9, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [10 x i32], [10 x i32]* %67, i64 0, i64 %69
  %71 = load i32, i32* %70, align 4
  store i32 %71, i32* %10, align 4
  %72 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %73 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %72, i32 0, i32 42
  %74 = load i32, i32* %10, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %73, i64 0, i64 %75
  %77 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %76, align 8
  store %struct.jpeg_component_info* %77, %struct.jpeg_component_info** %13, align 8
  %78 = load [64 x i16]*, [64 x i16]** %12, align 8
  %79 = getelementptr inbounds [64 x i16], [64 x i16]* %78, i64 0, i64 0
  %80 = load i16, i16* %79, align 2
  %81 = sext i16 %80 to i32
  %82 = load i32, i32* %11, align 4
  %83 = ashr i32 %81, %82
  store i32 %83, i32* %7, align 4
  %84 = load i32, i32* %7, align 4
  %85 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %86 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %85, i32 0, i32 7
  %87 = load i32, i32* %10, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [4 x i32], [4 x i32]* %86, i64 0, i64 %88
  %90 = load i32, i32* %89, align 4
  %91 = sub nsw i32 %84, %90
  store i32 %91, i32* %6, align 4
  %92 = load i32, i32* %7, align 4
  %93 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %94 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %93, i32 0, i32 7
  %95 = load i32, i32* %10, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [4 x i32], [4 x i32]* %94, i64 0, i64 %96
  store i32 %92, i32* %97, align 4
  %98 = load i32, i32* %6, align 4
  store i32 %98, i32* %7, align 4
  %99 = load i32, i32* %6, align 4
  %100 = icmp slt i32 %99, 0
  br i1 %100, label %101, label %107

; <label>:101:                                    ; preds = %59
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 3)
  %102 = add i64 %pgocount3, 1
  store i64 %102, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 3)
  %103 = load i32, i32* %6, align 4
  %104 = sub nsw i32 0, %103
  store i32 %104, i32* %6, align 4
  %105 = load i32, i32* %7, align 4
  %106 = add nsw i32 %105, -1
  store i32 %106, i32* %7, align 4
  br label %107

; <label>:107:                                    ; preds = %101, %59
  store i32 0, i32* %8, align 4
  br label %108

; <label>:108:                                    ; preds = %111, %107
  %109 = load i32, i32* %6, align 4
  %110 = icmp ne i32 %109, 0
  br i1 %110, label %111, label %117

; <label>:111:                                    ; preds = %108
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 0)
  %112 = add i64 %pgocount4, 1
  store i64 %112, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 0)
  %113 = load i32, i32* %8, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, i32* %8, align 4
  %115 = load i32, i32* %6, align 4
  %116 = ashr i32 %115, 1
  store i32 %116, i32* %6, align 4
  br label %108

; <label>:117:                                    ; preds = %108
  %118 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %119 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %13, align 8
  %120 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %119, i32 0, i32 5
  %121 = load i32, i32* %120, align 4
  %122 = load i32, i32* %8, align 4
  call void @emit_symbol(%struct.phuff_entropy_encoder* %118, i32 %121, i32 %122)
  %123 = load i32, i32* %8, align 4
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %125, label %130

; <label>:125:                                    ; preds = %117
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 2)
  %126 = add i64 %pgocount5, 1
  store i64 %126, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 2)
  %127 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %128 = load i32, i32* %7, align 4
  %129 = load i32, i32* %8, align 4
  call void @emit_bits(%struct.phuff_entropy_encoder* %127, i32 %128, i32 %129)
  br label %130

; <label>:130:                                    ; preds = %125, %117
  br label %131

; <label>:131:                                    ; preds = %130
  %132 = load i32, i32* %9, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %9, align 4
  br label %53

; <label>:134:                                    ; preds = %53
  %135 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %136 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %135, i32 0, i32 2
  %137 = load i8*, i8** %136, align 8
  %138 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %139 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %138, i32 0, i32 5
  %140 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %139, align 8
  %141 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %140, i32 0, i32 0
  store i8* %137, i8** %141, align 8
  %142 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %143 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %142, i32 0, i32 3
  %144 = load i64, i64* %143, align 8
  %145 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %146 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %145, i32 0, i32 5
  %147 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %146, align 8
  %148 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %147, i32 0, i32 1
  store i64 %144, i64* %148, align 8
  %149 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %150 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %149, i32 0, i32 29
  %151 = load i32, i32* %150, align 8
  %152 = icmp ne i32 %151, 0
  br i1 %152, label %153, label %179

; <label>:153:                                    ; preds = %134
  %154 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %155 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %154, i32 0, i32 12
  %156 = load i32, i32* %155, align 8
  %157 = icmp eq i32 %156, 0
  br i1 %157, label %158, label %173

; <label>:158:                                    ; preds = %153
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 8)
  %159 = add i64 %pgocount6, 1
  store i64 %159, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 8)
  %160 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %161 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %160, i32 0, i32 29
  %162 = load i32, i32* %161, align 8
  %163 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %164 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %163, i32 0, i32 12
  store i32 %162, i32* %164, align 8
  %165 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %166 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %165, i32 0, i32 13
  %167 = load i32, i32* %166, align 4
  %168 = add nsw i32 %167, 1
  store i32 %168, i32* %166, align 4
  %169 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %170 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %169, i32 0, i32 13
  %171 = load i32, i32* %170, align 4
  %172 = and i32 %171, 7
  store i32 %172, i32* %170, align 4
  br label %173

; <label>:173:                                    ; preds = %158, %153
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 6)
  %174 = add i64 %pgocount7, 1
  store i64 %174, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 6)
  %175 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %176 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %175, i32 0, i32 12
  %177 = load i32, i32* %176, align 8
  %178 = add i32 %177, -1
  store i32 %178, i32* %176, align 8
  br label %179

; <label>:179:                                    ; preds = %173, %134
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 4)
  %180 = add i64 %pgocount8, 1
  store i64 %180, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_encode_mcu_DC_first, i64 0, i64 4)
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @encode_mcu_AC_first(%struct.jpeg_compress_struct*, [64 x i16]**) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca [64 x i16]**, align 8
  %5 = alloca %struct.phuff_entropy_encoder*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca [64 x i16]*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store [64 x i16]** %1, [64 x i16]*** %4, align 8
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %14, i32 0, i32 59
  %16 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %15, align 8
  %17 = bitcast %struct.jpeg_entropy_encoder* %16 to %struct.phuff_entropy_encoder*
  store %struct.phuff_entropy_encoder* %17, %struct.phuff_entropy_encoder** %5, align 8
  %18 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %18, i32 0, i32 48
  %20 = load i32, i32* %19, align 8
  store i32 %20, i32* %11, align 4
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 50
  %23 = load i32, i32* %22, align 8
  store i32 %23, i32* %12, align 4
  %24 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %24, i32 0, i32 5
  %26 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %26, i32 0, i32 0
  %28 = load i8*, i8** %27, align 8
  %29 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %30 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %29, i32 0, i32 2
  store i8* %28, i8** %30, align 8
  %31 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %31, i32 0, i32 5
  %33 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %33, i32 0, i32 1
  %35 = load i64, i64* %34, align 8
  %36 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %37 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %36, i32 0, i32 3
  store i64 %35, i64* %37, align 8
  %38 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %39 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %38, i32 0, i32 29
  %40 = load i32, i32* %39, align 8
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %55

; <label>:42:                                     ; preds = %2
  %43 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %44 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %43, i32 0, i32 12
  %45 = load i32, i32* %44, align 8
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %53

; <label>:47:                                     ; preds = %42
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 12)
  %48 = add i64 %pgocount, 1
  store i64 %48, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 12)
  %49 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %50 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %51 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %50, i32 0, i32 13
  %52 = load i32, i32* %51, align 4
  call void @emit_restart(%struct.phuff_entropy_encoder* %49, i32 %52)
  br label %53

; <label>:53:                                     ; preds = %47, %42
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 8)
  %54 = add i64 %pgocount1, 1
  store i64 %54, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 8)
  br label %55

; <label>:55:                                     ; preds = %53, %2
  %56 = load [64 x i16]**, [64 x i16]*** %4, align 8
  %57 = getelementptr inbounds [64 x i16]*, [64 x i16]** %56, i64 0
  %58 = load [64 x i16]*, [64 x i16]** %57, align 8
  store [64 x i16]* %58, [64 x i16]** %13, align 8
  store i32 0, i32* %9, align 4
  %59 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %59, i32 0, i32 47
  %61 = load i32, i32* %60, align 4
  store i32 %61, i32* %10, align 4
  br label %62

; <label>:62:                                     ; preds = %147, %55
  %63 = load i32, i32* %10, align 4
  %64 = load i32, i32* %11, align 4
  %65 = icmp sle i32 %63, %64
  br i1 %65, label %66, label %150

; <label>:66:                                     ; preds = %62
  %67 = load [64 x i16]*, [64 x i16]** %13, align 8
  %68 = load i32, i32* %10, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %69
  %71 = load i32, i32* %70, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [64 x i16], [64 x i16]* %67, i64 0, i64 %72
  %74 = load i16, i16* %73, align 2
  %75 = sext i16 %74 to i32
  store i32 %75, i32* %6, align 4
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %81

; <label>:77:                                     ; preds = %66
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 3)
  %78 = add i64 %pgocount2, 1
  store i64 %78, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 3)
  %79 = load i32, i32* %9, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %9, align 4
  br label %147

; <label>:81:                                     ; preds = %66
  %82 = load i32, i32* %6, align 4
  %83 = icmp slt i32 %82, 0
  br i1 %83, label %84, label %93

; <label>:84:                                     ; preds = %81
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 4)
  %85 = add i64 %pgocount3, 1
  store i64 %85, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 4)
  %86 = load i32, i32* %6, align 4
  %87 = sub nsw i32 0, %86
  store i32 %87, i32* %6, align 4
  %88 = load i32, i32* %12, align 4
  %89 = load i32, i32* %6, align 4
  %90 = ashr i32 %89, %88
  store i32 %90, i32* %6, align 4
  %91 = load i32, i32* %6, align 4
  %92 = xor i32 %91, -1
  store i32 %92, i32* %7, align 4
  br label %98

; <label>:93:                                     ; preds = %81
  %94 = load i32, i32* %12, align 4
  %95 = load i32, i32* %6, align 4
  %96 = ashr i32 %95, %94
  store i32 %96, i32* %6, align 4
  %97 = load i32, i32* %6, align 4
  store i32 %97, i32* %7, align 4
  br label %98

; <label>:98:                                     ; preds = %93, %84
  %99 = load i32, i32* %6, align 4
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %101, label %105

; <label>:101:                                    ; preds = %98
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 5)
  %102 = add i64 %pgocount4, 1
  store i64 %102, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 5)
  %103 = load i32, i32* %9, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, i32* %9, align 4
  br label %147

; <label>:105:                                    ; preds = %98
  %106 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %107 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %106, i32 0, i32 9
  %108 = load i32, i32* %107, align 4
  %109 = icmp ugt i32 %108, 0
  br i1 %109, label %110, label %113

; <label>:110:                                    ; preds = %105
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 6)
  %111 = add i64 %pgocount5, 1
  store i64 %111, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 6)
  %112 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  call void @emit_eobrun(%struct.phuff_entropy_encoder* %112)
  br label %113

; <label>:113:                                    ; preds = %110, %105
  br label %114

; <label>:114:                                    ; preds = %117, %113
  %115 = load i32, i32* %9, align 4
  %116 = icmp sgt i32 %115, 15
  br i1 %116, label %117, label %125

; <label>:117:                                    ; preds = %114
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 0)
  %118 = add i64 %pgocount6, 1
  store i64 %118, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 0)
  %119 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %120 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %121 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %120, i32 0, i32 8
  %122 = load i32, i32* %121, align 8
  call void @emit_symbol(%struct.phuff_entropy_encoder* %119, i32 %122, i32 240)
  %123 = load i32, i32* %9, align 4
  %124 = sub nsw i32 %123, 16
  store i32 %124, i32* %9, align 4
  br label %114

; <label>:125:                                    ; preds = %114
  store i32 1, i32* %8, align 4
  br label %126

; <label>:126:                                    ; preds = %130, %125
  %127 = load i32, i32* %6, align 4
  %128 = ashr i32 %127, 1
  store i32 %128, i32* %6, align 4
  %129 = icmp ne i32 %128, 0
  br i1 %129, label %130, label %134

; <label>:130:                                    ; preds = %126
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 1)
  %131 = add i64 %pgocount7, 1
  store i64 %131, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 1)
  %132 = load i32, i32* %8, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %8, align 4
  br label %126

; <label>:134:                                    ; preds = %126
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 2)
  %135 = add i64 %pgocount8, 1
  store i64 %135, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 2)
  %136 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %137 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %138 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %137, i32 0, i32 8
  %139 = load i32, i32* %138, align 8
  %140 = load i32, i32* %9, align 4
  %141 = shl i32 %140, 4
  %142 = load i32, i32* %8, align 4
  %143 = add nsw i32 %141, %142
  call void @emit_symbol(%struct.phuff_entropy_encoder* %136, i32 %139, i32 %143)
  %144 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %145 = load i32, i32* %7, align 4
  %146 = load i32, i32* %8, align 4
  call void @emit_bits(%struct.phuff_entropy_encoder* %144, i32 %145, i32 %146)
  store i32 0, i32* %9, align 4
  br label %147

; <label>:147:                                    ; preds = %134, %101, %77
  %148 = load i32, i32* %10, align 4
  %149 = add nsw i32 %148, 1
  store i32 %149, i32* %10, align 4
  br label %62

; <label>:150:                                    ; preds = %62
  %151 = load i32, i32* %9, align 4
  %152 = icmp sgt i32 %151, 0
  br i1 %152, label %153, label %167

; <label>:153:                                    ; preds = %150
  %154 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %155 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %154, i32 0, i32 9
  %156 = load i32, i32* %155, align 4
  %157 = add i32 %156, 1
  store i32 %157, i32* %155, align 4
  %158 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %159 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %158, i32 0, i32 9
  %160 = load i32, i32* %159, align 4
  %161 = icmp eq i32 %160, 32767
  br i1 %161, label %162, label %165

; <label>:162:                                    ; preds = %153
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 11)
  %163 = add i64 %pgocount9, 1
  store i64 %163, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 11)
  %164 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  call void @emit_eobrun(%struct.phuff_entropy_encoder* %164)
  br label %165

; <label>:165:                                    ; preds = %162, %153
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 9)
  %166 = add i64 %pgocount10, 1
  store i64 %166, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 9)
  br label %167

; <label>:167:                                    ; preds = %165, %150
  %168 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %169 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %168, i32 0, i32 2
  %170 = load i8*, i8** %169, align 8
  %171 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %172 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %171, i32 0, i32 5
  %173 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %172, align 8
  %174 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %173, i32 0, i32 0
  store i8* %170, i8** %174, align 8
  %175 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %176 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %175, i32 0, i32 3
  %177 = load i64, i64* %176, align 8
  %178 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %179 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %178, i32 0, i32 5
  %180 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %179, align 8
  %181 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %180, i32 0, i32 1
  store i64 %177, i64* %181, align 8
  %182 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %183 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %182, i32 0, i32 29
  %184 = load i32, i32* %183, align 8
  %185 = icmp ne i32 %184, 0
  br i1 %185, label %186, label %212

; <label>:186:                                    ; preds = %167
  %187 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %188 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %187, i32 0, i32 12
  %189 = load i32, i32* %188, align 8
  %190 = icmp eq i32 %189, 0
  br i1 %190, label %191, label %206

; <label>:191:                                    ; preds = %186
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 13)
  %192 = add i64 %pgocount11, 1
  store i64 %192, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 13)
  %193 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %194 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %193, i32 0, i32 29
  %195 = load i32, i32* %194, align 8
  %196 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %197 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %196, i32 0, i32 12
  store i32 %195, i32* %197, align 8
  %198 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %199 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %198, i32 0, i32 13
  %200 = load i32, i32* %199, align 4
  %201 = add nsw i32 %200, 1
  store i32 %201, i32* %199, align 4
  %202 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %203 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %202, i32 0, i32 13
  %204 = load i32, i32* %203, align 4
  %205 = and i32 %204, 7
  store i32 %205, i32* %203, align 4
  br label %206

; <label>:206:                                    ; preds = %191, %186
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 10)
  %207 = add i64 %pgocount12, 1
  store i64 %207, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 10)
  %208 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %209 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %208, i32 0, i32 12
  %210 = load i32, i32* %209, align 8
  %211 = add i32 %210, -1
  store i32 %211, i32* %209, align 8
  br label %212

; <label>:212:                                    ; preds = %206, %167
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 7)
  %213 = add i64 %pgocount13, 1
  store i64 %213, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_encode_mcu_AC_first, i64 0, i64 7)
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @encode_mcu_DC_refine(%struct.jpeg_compress_struct*, [64 x i16]**) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca [64 x i16]**, align 8
  %5 = alloca %struct.phuff_entropy_encoder*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [64 x i16]*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store [64 x i16]** %1, [64 x i16]*** %4, align 8
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %10, i32 0, i32 59
  %12 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %11, align 8
  %13 = bitcast %struct.jpeg_entropy_encoder* %12 to %struct.phuff_entropy_encoder*
  store %struct.phuff_entropy_encoder* %13, %struct.phuff_entropy_encoder** %5, align 8
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %14, i32 0, i32 50
  %16 = load i32, i32* %15, align 8
  store i32 %16, i32* %8, align 4
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %17, i32 0, i32 5
  %19 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %19, i32 0, i32 0
  %21 = load i8*, i8** %20, align 8
  %22 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %23 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %22, i32 0, i32 2
  store i8* %21, i8** %23, align 8
  %24 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %24, i32 0, i32 5
  %26 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %26, i32 0, i32 1
  %28 = load i64, i64* %27, align 8
  %29 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %30 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %29, i32 0, i32 3
  store i64 %28, i64* %30, align 8
  %31 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %31, i32 0, i32 29
  %33 = load i32, i32* %32, align 8
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %48

; <label>:35:                                     ; preds = %2
  %36 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %37 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %36, i32 0, i32 12
  %38 = load i32, i32* %37, align 8
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %46

; <label>:40:                                     ; preds = %35
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_encode_mcu_DC_refine, i64 0, i64 4)
  %41 = add i64 %pgocount, 1
  store i64 %41, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_encode_mcu_DC_refine, i64 0, i64 4)
  %42 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %43 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %44 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %43, i32 0, i32 13
  %45 = load i32, i32* %44, align 4
  call void @emit_restart(%struct.phuff_entropy_encoder* %42, i32 %45)
  br label %46

; <label>:46:                                     ; preds = %40, %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_encode_mcu_DC_refine, i64 0, i64 2)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_encode_mcu_DC_refine, i64 0, i64 2)
  br label %48

; <label>:48:                                     ; preds = %46, %2
  store i32 0, i32* %7, align 4
  br label %49

; <label>:49:                                     ; preds = %70, %48
  %50 = load i32, i32* %7, align 4
  %51 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %52 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %51, i32 0, i32 45
  %53 = load i32, i32* %52, align 8
  %54 = icmp slt i32 %50, %53
  br i1 %54, label %55, label %73

; <label>:55:                                     ; preds = %49
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_encode_mcu_DC_refine, i64 0, i64 0)
  %56 = add i64 %pgocount2, 1
  store i64 %56, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_encode_mcu_DC_refine, i64 0, i64 0)
  %57 = load [64 x i16]**, [64 x i16]*** %4, align 8
  %58 = load i32, i32* %7, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [64 x i16]*, [64 x i16]** %57, i64 %59
  %61 = load [64 x i16]*, [64 x i16]** %60, align 8
  store [64 x i16]* %61, [64 x i16]** %9, align 8
  %62 = load [64 x i16]*, [64 x i16]** %9, align 8
  %63 = getelementptr inbounds [64 x i16], [64 x i16]* %62, i64 0, i64 0
  %64 = load i16, i16* %63, align 2
  %65 = sext i16 %64 to i32
  store i32 %65, i32* %6, align 4
  %66 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %67 = load i32, i32* %6, align 4
  %68 = load i32, i32* %8, align 4
  %69 = ashr i32 %67, %68
  call void @emit_bits(%struct.phuff_entropy_encoder* %66, i32 %69, i32 1)
  br label %70

; <label>:70:                                     ; preds = %55
  %71 = load i32, i32* %7, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %7, align 4
  br label %49

; <label>:73:                                     ; preds = %49
  %74 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %75 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %74, i32 0, i32 2
  %76 = load i8*, i8** %75, align 8
  %77 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %78 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %77, i32 0, i32 5
  %79 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %78, align 8
  %80 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %79, i32 0, i32 0
  store i8* %76, i8** %80, align 8
  %81 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %82 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %81, i32 0, i32 3
  %83 = load i64, i64* %82, align 8
  %84 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %85 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %84, i32 0, i32 5
  %86 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %85, align 8
  %87 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %86, i32 0, i32 1
  store i64 %83, i64* %87, align 8
  %88 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %89 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %88, i32 0, i32 29
  %90 = load i32, i32* %89, align 8
  %91 = icmp ne i32 %90, 0
  br i1 %91, label %92, label %118

; <label>:92:                                     ; preds = %73
  %93 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %94 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %93, i32 0, i32 12
  %95 = load i32, i32* %94, align 8
  %96 = icmp eq i32 %95, 0
  br i1 %96, label %97, label %112

; <label>:97:                                     ; preds = %92
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_encode_mcu_DC_refine, i64 0, i64 5)
  %98 = add i64 %pgocount3, 1
  store i64 %98, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_encode_mcu_DC_refine, i64 0, i64 5)
  %99 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %100 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %99, i32 0, i32 29
  %101 = load i32, i32* %100, align 8
  %102 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %103 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %102, i32 0, i32 12
  store i32 %101, i32* %103, align 8
  %104 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %105 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %104, i32 0, i32 13
  %106 = load i32, i32* %105, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, i32* %105, align 4
  %108 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %109 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %108, i32 0, i32 13
  %110 = load i32, i32* %109, align 4
  %111 = and i32 %110, 7
  store i32 %111, i32* %109, align 4
  br label %112

; <label>:112:                                    ; preds = %97, %92
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_encode_mcu_DC_refine, i64 0, i64 3)
  %113 = add i64 %pgocount4, 1
  store i64 %113, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_encode_mcu_DC_refine, i64 0, i64 3)
  %114 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %115 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %114, i32 0, i32 12
  %116 = load i32, i32* %115, align 8
  %117 = add i32 %116, -1
  store i32 %117, i32* %115, align 8
  br label %118

; <label>:118:                                    ; preds = %112, %73
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_encode_mcu_DC_refine, i64 0, i64 1)
  %119 = add i64 %pgocount5, 1
  store i64 %119, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_encode_mcu_DC_refine, i64 0, i64 1)
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @encode_mcu_AC_refine(%struct.jpeg_compress_struct*, [64 x i16]**) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca [64 x i16]**, align 8
  %5 = alloca %struct.phuff_entropy_encoder*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca [64 x i16]*, align 8
  %15 = alloca [64 x i32], align 16
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store [64 x i16]** %1, [64 x i16]*** %4, align 8
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 59
  %18 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %17, align 8
  %19 = bitcast %struct.jpeg_entropy_encoder* %18 to %struct.phuff_entropy_encoder*
  store %struct.phuff_entropy_encoder* %19, %struct.phuff_entropy_encoder** %5, align 8
  %20 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %20, i32 0, i32 48
  %22 = load i32, i32* %21, align 8
  store i32 %22, i32* %12, align 4
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %23, i32 0, i32 50
  %25 = load i32, i32* %24, align 8
  store i32 %25, i32* %13, align 4
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %26, i32 0, i32 5
  %28 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %27, align 8
  %29 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %28, i32 0, i32 0
  %30 = load i8*, i8** %29, align 8
  %31 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %32 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %31, i32 0, i32 2
  store i8* %30, i8** %32, align 8
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %33, i32 0, i32 5
  %35 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %35, i32 0, i32 1
  %37 = load i64, i64* %36, align 8
  %38 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %39 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %38, i32 0, i32 3
  store i64 %37, i64* %39, align 8
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %40, i32 0, i32 29
  %42 = load i32, i32* %41, align 8
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %57

; <label>:44:                                     ; preds = %2
  %45 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %46 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %45, i32 0, i32 12
  %47 = load i32, i32* %46, align 8
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %55

; <label>:49:                                     ; preds = %44
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 15)
  %50 = add i64 %pgocount, 1
  store i64 %50, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 15)
  %51 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %52 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %53 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %52, i32 0, i32 13
  %54 = load i32, i32* %53, align 4
  call void @emit_restart(%struct.phuff_entropy_encoder* %51, i32 %54)
  br label %55

; <label>:55:                                     ; preds = %49, %44
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 10)
  %56 = add i64 %pgocount1, 1
  store i64 %56, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 10)
  br label %57

; <label>:57:                                     ; preds = %55, %2
  %58 = load [64 x i16]**, [64 x i16]*** %4, align 8
  %59 = getelementptr inbounds [64 x i16]*, [64 x i16]** %58, i64 0
  %60 = load [64 x i16]*, [64 x i16]** %59, align 8
  store [64 x i16]* %60, [64 x i16]** %14, align 8
  store i32 0, i32* %9, align 4
  %61 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %62 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %61, i32 0, i32 47
  %63 = load i32, i32* %62, align 4
  store i32 %63, i32* %8, align 4
  br label %64

; <label>:64:                                     ; preds = %99, %57
  %65 = load i32, i32* %8, align 4
  %66 = load i32, i32* %12, align 4
  %67 = icmp sle i32 %65, %66
  br i1 %67, label %68, label %102

; <label>:68:                                     ; preds = %64
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 2)
  %69 = add i64 %pgocount2, 1
  store i64 %69, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 2)
  %70 = load [64 x i16]*, [64 x i16]** %14, align 8
  %71 = load i32, i32* %8, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %72
  %74 = load i32, i32* %73, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [64 x i16], [64 x i16]* %70, i64 0, i64 %75
  %77 = load i16, i16* %76, align 2
  %78 = sext i16 %77 to i32
  store i32 %78, i32* %6, align 4
  %79 = load i32, i32* %6, align 4
  %80 = icmp slt i32 %79, 0
  br i1 %80, label %81, label %85

; <label>:81:                                     ; preds = %68
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 4)
  %82 = add i64 %pgocount3, 1
  store i64 %82, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 4)
  %83 = load i32, i32* %6, align 4
  %84 = sub nsw i32 0, %83
  store i32 %84, i32* %6, align 4
  br label %85

; <label>:85:                                     ; preds = %81, %68
  %86 = load i32, i32* %13, align 4
  %87 = load i32, i32* %6, align 4
  %88 = ashr i32 %87, %86
  store i32 %88, i32* %6, align 4
  %89 = load i32, i32* %6, align 4
  %90 = load i32, i32* %8, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [64 x i32], [64 x i32]* %15, i64 0, i64 %91
  store i32 %89, i32* %92, align 4
  %93 = load i32, i32* %6, align 4
  %94 = icmp eq i32 %93, 1
  br i1 %94, label %95, label %98

; <label>:95:                                     ; preds = %85
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 3)
  %96 = add i64 %pgocount4, 1
  store i64 %96, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 3)
  %97 = load i32, i32* %8, align 4
  store i32 %97, i32* %9, align 4
  br label %98

; <label>:98:                                     ; preds = %95, %85
  br label %99

; <label>:99:                                     ; preds = %98
  %100 = load i32, i32* %8, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, i32* %8, align 4
  br label %64

; <label>:102:                                    ; preds = %64
  store i32 0, i32* %7, align 4
  store i32 0, i32* %11, align 4
  %103 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %104 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %103, i32 0, i32 11
  %105 = load i8*, i8** %104, align 8
  %106 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %107 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %106, i32 0, i32 10
  %108 = load i32, i32* %107, align 8
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds i8, i8* %105, i64 %109
  store i8* %110, i8** %10, align 8
  %111 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %112 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %111, i32 0, i32 47
  %113 = load i32, i32* %112, align 4
  store i32 %113, i32* %8, align 4
  br label %114

; <label>:114:                                    ; preds = %198, %102
  %115 = load i32, i32* %8, align 4
  %116 = load i32, i32* %12, align 4
  %117 = icmp sle i32 %115, %116
  br i1 %117, label %118, label %201

; <label>:118:                                    ; preds = %114
  %119 = load i32, i32* %8, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [64 x i32], [64 x i32]* %15, i64 0, i64 %120
  %122 = load i32, i32* %121, align 4
  store i32 %122, i32* %6, align 4
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %124, label %128

; <label>:124:                                    ; preds = %118
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 5)
  %125 = add i64 %pgocount5, 1
  store i64 %125, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 5)
  %126 = load i32, i32* %7, align 4
  %127 = add nsw i32 %126, 1
  store i32 %127, i32* %7, align 4
  br label %198

; <label>:128:                                    ; preds = %118
  br label %129

; <label>:129:                                    ; preds = %139, %128
  %130 = load i32, i32* %7, align 4
  %131 = icmp sgt i32 %130, 15
  br i1 %131, label %132, label %137

; <label>:132:                                    ; preds = %129
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 1)
  %133 = add i64 %pgocount6, 1
  store i64 %133, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 1)
  %134 = load i32, i32* %8, align 4
  %135 = load i32, i32* %9, align 4
  %136 = icmp sle i32 %134, %135
  br label %137

; <label>:137:                                    ; preds = %132, %129
  %138 = phi i1 [ false, %129 ], [ %136, %132 ]
  br i1 %138, label %139, label %154

; <label>:139:                                    ; preds = %137
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 0)
  %140 = add i64 %pgocount7, 1
  store i64 %140, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 0)
  %141 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  call void @emit_eobrun(%struct.phuff_entropy_encoder* %141)
  %142 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %143 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %144 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %143, i32 0, i32 8
  %145 = load i32, i32* %144, align 8
  call void @emit_symbol(%struct.phuff_entropy_encoder* %142, i32 %145, i32 240)
  %146 = load i32, i32* %7, align 4
  %147 = sub nsw i32 %146, 16
  store i32 %147, i32* %7, align 4
  %148 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %149 = load i8*, i8** %10, align 8
  %150 = load i32, i32* %11, align 4
  call void @emit_buffered_bits(%struct.phuff_entropy_encoder* %148, i8* %149, i32 %150)
  %151 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %152 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %151, i32 0, i32 11
  %153 = load i8*, i8** %152, align 8
  store i8* %153, i8** %10, align 8
  store i32 0, i32* %11, align 4
  br label %129

; <label>:154:                                    ; preds = %137
  %155 = load i32, i32* %6, align 4
  %156 = icmp sgt i32 %155, 1
  br i1 %156, label %157, label %167

; <label>:157:                                    ; preds = %154
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 6)
  %158 = add i64 %pgocount8, 1
  store i64 %158, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 6)
  %159 = load i32, i32* %6, align 4
  %160 = and i32 %159, 1
  %161 = trunc i32 %160 to i8
  %162 = load i8*, i8** %10, align 8
  %163 = load i32, i32* %11, align 4
  %164 = add i32 %163, 1
  store i32 %164, i32* %11, align 4
  %165 = zext i32 %163 to i64
  %166 = getelementptr inbounds i8, i8* %162, i64 %165
  store i8 %161, i8* %166, align 1
  br label %198

; <label>:167:                                    ; preds = %154
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 7)
  %168 = add i64 %pgocount9, 1
  store i64 %168, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 7)
  %169 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  call void @emit_eobrun(%struct.phuff_entropy_encoder* %169)
  %170 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %171 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %172 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %171, i32 0, i32 8
  %173 = load i32, i32* %172, align 8
  %174 = load i32, i32* %7, align 4
  %175 = shl i32 %174, 4
  %176 = add nsw i32 %175, 1
  call void @emit_symbol(%struct.phuff_entropy_encoder* %170, i32 %173, i32 %176)
  %177 = load [64 x i16]*, [64 x i16]** %14, align 8
  %178 = load i32, i32* %8, align 4
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %179
  %181 = load i32, i32* %180, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [64 x i16], [64 x i16]* %177, i64 0, i64 %182
  %184 = load i16, i16* %183, align 2
  %185 = sext i16 %184 to i32
  %186 = icmp slt i32 %185, 0
  %187 = zext i1 %186 to i64
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 17)
  %188 = add i64 %pgocount10, %187
  store i64 %188, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 17)
  %189 = select i1 %186, i32 0, i32 1
  store i32 %189, i32* %6, align 4
  %190 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %191 = load i32, i32* %6, align 4
  call void @emit_bits(%struct.phuff_entropy_encoder* %190, i32 %191, i32 1)
  %192 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %193 = load i8*, i8** %10, align 8
  %194 = load i32, i32* %11, align 4
  call void @emit_buffered_bits(%struct.phuff_entropy_encoder* %192, i8* %193, i32 %194)
  %195 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %196 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %195, i32 0, i32 11
  %197 = load i8*, i8** %196, align 8
  store i8* %197, i8** %10, align 8
  store i32 0, i32* %11, align 4
  store i32 0, i32* %7, align 4
  br label %198

; <label>:198:                                    ; preds = %167, %157, %124
  %199 = load i32, i32* %8, align 4
  %200 = add nsw i32 %199, 1
  store i32 %200, i32* %8, align 4
  br label %114

; <label>:201:                                    ; preds = %114
  %202 = load i32, i32* %7, align 4
  %203 = icmp sgt i32 %202, 0
  br i1 %203, label %208, label %204

; <label>:204:                                    ; preds = %201
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 14)
  %205 = add i64 %pgocount11, 1
  store i64 %205, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 14)
  %206 = load i32, i32* %11, align 4
  %207 = icmp ugt i32 %206, 0
  br i1 %207, label %208, label %233

; <label>:208:                                    ; preds = %204, %201
  %209 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %210 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %209, i32 0, i32 9
  %211 = load i32, i32* %210, align 4
  %212 = add i32 %211, 1
  store i32 %212, i32* %210, align 4
  %213 = load i32, i32* %11, align 4
  %214 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %215 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %214, i32 0, i32 10
  %216 = load i32, i32* %215, align 8
  %217 = add i32 %216, %213
  store i32 %217, i32* %215, align 8
  %218 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %219 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %218, i32 0, i32 9
  %220 = load i32, i32* %219, align 4
  %221 = icmp eq i32 %220, 32767
  br i1 %221, label %228, label %222

; <label>:222:                                    ; preds = %208
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 13)
  %223 = add i64 %pgocount12, 1
  store i64 %223, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 13)
  %224 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %225 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %224, i32 0, i32 10
  %226 = load i32, i32* %225, align 8
  %227 = icmp ugt i32 %226, 937
  br i1 %227, label %228, label %231

; <label>:228:                                    ; preds = %222, %208
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 12)
  %229 = add i64 %pgocount13, 1
  store i64 %229, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 12)
  %230 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  call void @emit_eobrun(%struct.phuff_entropy_encoder* %230)
  br label %231

; <label>:231:                                    ; preds = %228, %222
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 9)
  %232 = add i64 %pgocount14, 1
  store i64 %232, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 9)
  br label %233

; <label>:233:                                    ; preds = %231, %204
  %234 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %235 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %234, i32 0, i32 2
  %236 = load i8*, i8** %235, align 8
  %237 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %238 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %237, i32 0, i32 5
  %239 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %238, align 8
  %240 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %239, i32 0, i32 0
  store i8* %236, i8** %240, align 8
  %241 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %242 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %241, i32 0, i32 3
  %243 = load i64, i64* %242, align 8
  %244 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %245 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %244, i32 0, i32 5
  %246 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %245, align 8
  %247 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %246, i32 0, i32 1
  store i64 %243, i64* %247, align 8
  %248 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %249 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %248, i32 0, i32 29
  %250 = load i32, i32* %249, align 8
  %251 = icmp ne i32 %250, 0
  br i1 %251, label %252, label %278

; <label>:252:                                    ; preds = %233
  %253 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %254 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %253, i32 0, i32 12
  %255 = load i32, i32* %254, align 8
  %256 = icmp eq i32 %255, 0
  br i1 %256, label %257, label %272

; <label>:257:                                    ; preds = %252
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 16)
  %258 = add i64 %pgocount15, 1
  store i64 %258, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 16)
  %259 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %260 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %259, i32 0, i32 29
  %261 = load i32, i32* %260, align 8
  %262 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %263 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %262, i32 0, i32 12
  store i32 %261, i32* %263, align 8
  %264 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %265 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %264, i32 0, i32 13
  %266 = load i32, i32* %265, align 4
  %267 = add nsw i32 %266, 1
  store i32 %267, i32* %265, align 4
  %268 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %269 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %268, i32 0, i32 13
  %270 = load i32, i32* %269, align 4
  %271 = and i32 %270, 7
  store i32 %271, i32* %269, align 4
  br label %272

; <label>:272:                                    ; preds = %257, %252
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 11)
  %273 = add i64 %pgocount16, 1
  store i64 %273, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 11)
  %274 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %275 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %274, i32 0, i32 12
  %276 = load i32, i32* %275, align 8
  %277 = add i32 %276, -1
  store i32 %277, i32* %275, align 8
  br label %278

; <label>:278:                                    ; preds = %272, %233
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 8)
  %279 = add i64 %pgocount17, 1
  store i64 %279, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_encode_mcu_AC_refine, i64 0, i64 8)
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_pass_gather_phuff(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.phuff_entropy_encoder*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.jpeg_component_info*, align 8
  %8 = alloca %struct.JHUFF_TBL**, align 8
  %9 = alloca [4 x i32], align 16
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %10, i32 0, i32 59
  %12 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %11, align 8
  %13 = bitcast %struct.jpeg_entropy_encoder* %12 to %struct.phuff_entropy_encoder*
  store %struct.phuff_entropy_encoder* %13, %struct.phuff_entropy_encoder** %3, align 8
  %14 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  call void @emit_eobrun(%struct.phuff_entropy_encoder* %14)
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %15, i32 0, i32 47
  %17 = load i32, i32* %16, align 4
  %18 = icmp eq i32 %17, 0
  %19 = zext i1 %18 to i32
  store i32 %19, i32* %4, align 4
  %20 = getelementptr inbounds [4 x i32], [4 x i32]* %9, i32 0, i32 0
  %21 = bitcast i32* %20 to i8*
  call void @llvm.memset.p0i8.i64(i8* %21, i8 0, i64 16, i32 16, i1 false)
  store i32 0, i32* %5, align 4
  br label %22

; <label>:22:                                     ; preds = %101, %1
  %23 = load i32, i32* %5, align 4
  %24 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %24, i32 0, i32 41
  %26 = load i32, i32* %25, align 4
  %27 = icmp slt i32 %23, %26
  br i1 %27, label %28, label %104

; <label>:28:                                     ; preds = %22
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i32 0, i32 42
  %31 = load i32, i32* %5, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %30, i64 0, i64 %32
  %34 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %33, align 8
  store %struct.jpeg_component_info* %34, %struct.jpeg_component_info** %7, align 8
  %35 = load i32, i32* %4, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %49

; <label>:37:                                     ; preds = %28
  %38 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %39 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %38, i32 0, i32 49
  %40 = load i32, i32* %39, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %44

; <label>:42:                                     ; preds = %37
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_pass_gather_phuff, i64 0, i64 0)
  %43 = add i64 %pgocount, 1
  store i64 %43, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_pass_gather_phuff, i64 0, i64 0)
  br label %101

; <label>:44:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_pass_gather_phuff, i64 0, i64 2)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_pass_gather_phuff, i64 0, i64 2)
  %46 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %47 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %46, i32 0, i32 5
  %48 = load i32, i32* %47, align 4
  store i32 %48, i32* %6, align 4
  br label %54

; <label>:49:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_pass_gather_phuff, i64 0, i64 1)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_pass_gather_phuff, i64 0, i64 1)
  %51 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %52 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %51, i32 0, i32 6
  %53 = load i32, i32* %52, align 8
  store i32 %53, i32* %6, align 4
  br label %54

; <label>:54:                                     ; preds = %49, %44
  %55 = load i32, i32* %6, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [4 x i32], [4 x i32]* %9, i64 0, i64 %56
  %58 = load i32, i32* %57, align 4
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %100, label %60

; <label>:60:                                     ; preds = %54
  %61 = load i32, i32* %4, align 4
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %70

; <label>:63:                                     ; preds = %60
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_pass_gather_phuff, i64 0, i64 3)
  %64 = add i64 %pgocount3, 1
  store i64 %64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_pass_gather_phuff, i64 0, i64 3)
  %65 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %65, i32 0, i32 16
  %67 = load i32, i32* %6, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %66, i64 0, i64 %68
  store %struct.JHUFF_TBL** %69, %struct.JHUFF_TBL*** %8, align 8
  br label %77

; <label>:70:                                     ; preds = %60
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_pass_gather_phuff, i64 0, i64 4)
  %71 = add i64 %pgocount4, 1
  store i64 %71, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_pass_gather_phuff, i64 0, i64 4)
  %72 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %73 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %72, i32 0, i32 17
  %74 = load i32, i32* %6, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %73, i64 0, i64 %75
  store %struct.JHUFF_TBL** %76, %struct.JHUFF_TBL*** %8, align 8
  br label %77

; <label>:77:                                     ; preds = %70, %63
  %78 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %8, align 8
  %79 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %78, align 8
  %80 = icmp eq %struct.JHUFF_TBL* %79, null
  br i1 %80, label %81, label %87

; <label>:81:                                     ; preds = %77
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_pass_gather_phuff, i64 0, i64 5)
  %82 = add i64 %pgocount5, 1
  store i64 %82, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_pass_gather_phuff, i64 0, i64 5)
  %83 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %84 = bitcast %struct.jpeg_compress_struct* %83 to %struct.jpeg_common_struct*
  %85 = call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* %84)
  %86 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %8, align 8
  store %struct.JHUFF_TBL* %85, %struct.JHUFF_TBL** %86, align 8
  br label %87

; <label>:87:                                     ; preds = %81, %77
  %88 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %89 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %8, align 8
  %90 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %89, align 8
  %91 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %92 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %91, i32 0, i32 15
  %93 = load i32, i32* %6, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [4 x i64*], [4 x i64*]* %92, i64 0, i64 %94
  %96 = load i64*, i64** %95, align 8
  call void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct* %88, %struct.JHUFF_TBL* %90, i64* %96)
  %97 = load i32, i32* %6, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [4 x i32], [4 x i32]* %9, i64 0, i64 %98
  store i32 1, i32* %99, align 4
  br label %100

; <label>:100:                                    ; preds = %87, %54
  br label %101

; <label>:101:                                    ; preds = %100, %42
  %102 = load i32, i32* %5, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, i32* %5, align 4
  br label %22

; <label>:104:                                    ; preds = %22
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_pass_gather_phuff, i64 0, i64 6)
  %105 = add i64 %pgocount6, 1
  store i64 %105, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_pass_gather_phuff, i64 0, i64 6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_pass_phuff(%struct.jpeg_compress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_pass_phuff, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_pass_phuff, i64 0, i64 0)
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.phuff_entropy_encoder*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 59
  %7 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %6, align 8
  %8 = bitcast %struct.jpeg_entropy_encoder* %7 to %struct.phuff_entropy_encoder*
  store %struct.phuff_entropy_encoder* %8, %struct.phuff_entropy_encoder** %4, align 8
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %9, i32 0, i32 5
  %11 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %11, i32 0, i32 0
  %13 = load i8*, i8** %12, align 8
  %14 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %15 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %14, i32 0, i32 2
  store i8* %13, i8** %15, align 8
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 5
  %18 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %18, i32 0, i32 1
  %20 = load i64, i64* %19, align 8
  %21 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %22 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %21, i32 0, i32 3
  store i64 %20, i64* %22, align 8
  %23 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  call void @emit_eobrun(%struct.phuff_entropy_encoder* %23)
  %24 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  call void @flush_bits(%struct.phuff_entropy_encoder* %24)
  %25 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %26 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %25, i32 0, i32 2
  %27 = load i8*, i8** %26, align 8
  %28 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %28, i32 0, i32 5
  %30 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %30, i32 0, i32 0
  store i8* %27, i8** %31, align 8
  %32 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %33 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %32, i32 0, i32 3
  %34 = load i64, i64* %33, align 8
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %35, i32 0, i32 5
  %37 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %37, i32 0, i32 1
  store i64 %34, i64* %38, align 8
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

declare void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct*, %struct.JHUFF_TBL*, %struct.c_derived_tbl**) #2

; Function Attrs: noinline nounwind uwtable
define internal void @emit_restart(%struct.phuff_entropy_encoder*, i32) #0 {
  %3 = alloca %struct.phuff_entropy_encoder*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct.phuff_entropy_encoder* %0, %struct.phuff_entropy_encoder** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  call void @emit_eobrun(%struct.phuff_entropy_encoder* %6)
  %7 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %8 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %7, i32 0, i32 1
  %9 = load i32, i32* %8, align 8
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %43, label %11

; <label>:11:                                     ; preds = %2
  %12 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  call void @flush_bits(%struct.phuff_entropy_encoder* %12)
  %13 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %14 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %13, i32 0, i32 2
  %15 = load i8*, i8** %14, align 8
  %16 = getelementptr inbounds i8, i8* %15, i32 1
  store i8* %16, i8** %14, align 8
  store i8 -1, i8* %15, align 1
  %17 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %18 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %17, i32 0, i32 3
  %19 = load i64, i64* %18, align 8
  %20 = add i64 %19, -1
  store i64 %20, i64* %18, align 8
  %21 = icmp eq i64 %20, 0
  br i1 %21, label %22, label %25

; <label>:22:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 4)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 4)
  %24 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  call void @dump_buffer(%struct.phuff_entropy_encoder* %24)
  br label %25

; <label>:25:                                     ; preds = %22, %11
  %26 = load i32, i32* %4, align 4
  %27 = add nsw i32 208, %26
  %28 = trunc i32 %27 to i8
  %29 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %30 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %29, i32 0, i32 2
  %31 = load i8*, i8** %30, align 8
  %32 = getelementptr inbounds i8, i8* %31, i32 1
  store i8* %32, i8** %30, align 8
  store i8 %28, i8* %31, align 1
  %33 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %34 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %33, i32 0, i32 3
  %35 = load i64, i64* %34, align 8
  %36 = add i64 %35, -1
  store i64 %36, i64* %34, align 8
  %37 = icmp eq i64 %36, 0
  br i1 %37, label %38, label %41

; <label>:38:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 5)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 5)
  %40 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  call void @dump_buffer(%struct.phuff_entropy_encoder* %40)
  br label %41

; <label>:41:                                     ; preds = %38, %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 2)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 2)
  br label %43

; <label>:43:                                     ; preds = %41, %2
  %44 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %45 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %44, i32 0, i32 6
  %46 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %45, align 8
  %47 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %46, i32 0, i32 47
  %48 = load i32, i32* %47, align 4
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %71

; <label>:50:                                     ; preds = %43
  store i32 0, i32* %5, align 4
  br label %51

; <label>:51:                                     ; preds = %66, %50
  %52 = load i32, i32* %5, align 4
  %53 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %54 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %53, i32 0, i32 6
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %54, align 8
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %55, i32 0, i32 41
  %57 = load i32, i32* %56, align 4
  %58 = icmp slt i32 %52, %57
  br i1 %58, label %59, label %69

; <label>:59:                                     ; preds = %51
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 0)
  %60 = add i64 %pgocount3, 1
  store i64 %60, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 0)
  %61 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %62 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %61, i32 0, i32 7
  %63 = load i32, i32* %5, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [4 x i32], [4 x i32]* %62, i64 0, i64 %64
  store i32 0, i32* %65, align 4
  br label %66

; <label>:66:                                     ; preds = %59
  %67 = load i32, i32* %5, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %5, align 4
  br label %51

; <label>:69:                                     ; preds = %51
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 3)
  %70 = add i64 %pgocount4, 1
  store i64 %70, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 3)
  br label %77

; <label>:71:                                     ; preds = %43
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 1)
  %72 = add i64 %pgocount5, 1
  store i64 %72, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 1)
  %73 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %74 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %73, i32 0, i32 9
  store i32 0, i32* %74, align 4
  %75 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %76 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %75, i32 0, i32 10
  store i32 0, i32* %76, align 8
  br label %77

; <label>:77:                                     ; preds = %71, %69
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @emit_symbol(%struct.phuff_entropy_encoder*, i32, i32) #0 {
  %4 = alloca %struct.phuff_entropy_encoder*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.c_derived_tbl*, align 8
  store %struct.phuff_entropy_encoder* %0, %struct.phuff_entropy_encoder** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %8 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %9 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %8, i32 0, i32 1
  %10 = load i32, i32* %9, align 8
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %25

; <label>:12:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_emit_symbol, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_emit_symbol, i64 0, i64 0)
  %14 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %15 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %14, i32 0, i32 15
  %16 = load i32, i32* %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [4 x i64*], [4 x i64*]* %15, i64 0, i64 %17
  %19 = load i64*, i64** %18, align 8
  %20 = load i32, i32* %6, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i64, i64* %19, i64 %21
  %23 = load i64, i64* %22, align 8
  %24 = add nsw i64 %23, 1
  store i64 %24, i64* %22, align 8
  br label %47

; <label>:25:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_emit_symbol, i64 0, i64 1)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_emit_symbol, i64 0, i64 1)
  %27 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %28 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %27, i32 0, i32 14
  %29 = load i32, i32* %5, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [4 x %struct.c_derived_tbl*], [4 x %struct.c_derived_tbl*]* %28, i64 0, i64 %30
  %32 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %31, align 8
  store %struct.c_derived_tbl* %32, %struct.c_derived_tbl** %7, align 8
  %33 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %34 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %7, align 8
  %35 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %34, i32 0, i32 0
  %36 = load i32, i32* %6, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [256 x i32], [256 x i32]* %35, i64 0, i64 %37
  %39 = load i32, i32* %38, align 4
  %40 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %7, align 8
  %41 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %40, i32 0, i32 1
  %42 = load i32, i32* %6, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [256 x i8], [256 x i8]* %41, i64 0, i64 %43
  %45 = load i8, i8* %44, align 1
  %46 = sext i8 %45 to i32
  call void @emit_bits(%struct.phuff_entropy_encoder* %33, i32 %39, i32 %46)
  br label %47

; <label>:47:                                     ; preds = %25, %12
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @emit_bits(%struct.phuff_entropy_encoder*, i32, i32) #0 {
  %4 = alloca %struct.phuff_entropy_encoder*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct.phuff_entropy_encoder* %0, %struct.phuff_entropy_encoder** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %10 = load i32, i32* %5, align 4
  %11 = zext i32 %10 to i64
  store i64 %11, i64* %7, align 8
  %12 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %13 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %12, i32 0, i32 5
  %14 = load i32, i32* %13, align 8
  store i32 %14, i32* %8, align 4
  %15 = load i32, i32* %6, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %37

; <label>:17:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 5)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 5)
  %19 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %20 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %19, i32 0, i32 6
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 0
  %23 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %23, i32 0, i32 5
  store i32 39, i32* %24, align 8
  %25 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %26 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %25, i32 0, i32 6
  %27 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %27, i32 0, i32 0
  %29 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %28, align 8
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %29, i32 0, i32 0
  %31 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %30, align 8
  %32 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %33 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %32, i32 0, i32 6
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %33, align 8
  %35 = bitcast %struct.jpeg_compress_struct* %34 to %struct.jpeg_common_struct*
  %36 = ptrtoint void (%struct.jpeg_common_struct*)* %31 to i64
  call void @__llvm_profile_instrument_target(i64 %36, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_bits to i8*), i32 0)
  call void %31(%struct.jpeg_common_struct* %35)
  br label %37

; <label>:37:                                     ; preds = %17, %3
  %38 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %39 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %38, i32 0, i32 1
  %40 = load i32, i32* %39, align 8
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %44

; <label>:42:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 4)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 4)
  br label %118

; <label>:44:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 6)
  %45 = add i64 %pgocount2, 1
  store i64 %45, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 6)
  %46 = load i32, i32* %6, align 4
  %47 = zext i32 %46 to i64
  %48 = shl i64 1, %47
  %49 = sub nsw i64 %48, 1
  %50 = load i64, i64* %7, align 8
  %51 = and i64 %50, %49
  store i64 %51, i64* %7, align 8
  %52 = load i32, i32* %6, align 4
  %53 = load i32, i32* %8, align 4
  %54 = add nsw i32 %53, %52
  store i32 %54, i32* %8, align 4
  %55 = load i32, i32* %8, align 4
  %56 = sub nsw i32 24, %55
  %57 = load i64, i64* %7, align 8
  %58 = zext i32 %56 to i64
  %59 = shl i64 %57, %58
  store i64 %59, i64* %7, align 8
  %60 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %61 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %60, i32 0, i32 4
  %62 = load i64, i64* %61, align 8
  %63 = load i64, i64* %7, align 8
  %64 = or i64 %63, %62
  store i64 %64, i64* %7, align 8
  br label %65

; <label>:65:                                     ; preds = %105, %44
  %66 = load i32, i32* %8, align 4
  %67 = icmp sge i32 %66, 8
  br i1 %67, label %68, label %111

; <label>:68:                                     ; preds = %65
  %69 = load i64, i64* %7, align 8
  %70 = ashr i64 %69, 16
  %71 = and i64 %70, 255
  %72 = trunc i64 %71 to i32
  store i32 %72, i32* %9, align 4
  %73 = load i32, i32* %9, align 4
  %74 = trunc i32 %73 to i8
  %75 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %76 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %75, i32 0, i32 2
  %77 = load i8*, i8** %76, align 8
  %78 = getelementptr inbounds i8, i8* %77, i32 1
  store i8* %78, i8** %76, align 8
  store i8 %74, i8* %77, align 1
  %79 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %80 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %79, i32 0, i32 3
  %81 = load i64, i64* %80, align 8
  %82 = add i64 %81, -1
  store i64 %82, i64* %80, align 8
  %83 = icmp eq i64 %82, 0
  br i1 %83, label %84, label %87

; <label>:84:                                     ; preds = %68
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 2)
  %85 = add i64 %pgocount3, 1
  store i64 %85, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 2)
  %86 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  call void @dump_buffer(%struct.phuff_entropy_encoder* %86)
  br label %87

; <label>:87:                                     ; preds = %84, %68
  %88 = load i32, i32* %9, align 4
  %89 = icmp eq i32 %88, 255
  br i1 %89, label %90, label %105

; <label>:90:                                     ; preds = %87
  %91 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %92 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %91, i32 0, i32 2
  %93 = load i8*, i8** %92, align 8
  %94 = getelementptr inbounds i8, i8* %93, i32 1
  store i8* %94, i8** %92, align 8
  store i8 0, i8* %93, align 1
  %95 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %96 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %95, i32 0, i32 3
  %97 = load i64, i64* %96, align 8
  %98 = add i64 %97, -1
  store i64 %98, i64* %96, align 8
  %99 = icmp eq i64 %98, 0
  br i1 %99, label %100, label %103

; <label>:100:                                    ; preds = %90
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 3)
  %101 = add i64 %pgocount4, 1
  store i64 %101, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 3)
  %102 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  call void @dump_buffer(%struct.phuff_entropy_encoder* %102)
  br label %103

; <label>:103:                                    ; preds = %100, %90
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 1)
  %104 = add i64 %pgocount5, 1
  store i64 %104, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 1)
  br label %105

; <label>:105:                                    ; preds = %103, %87
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 0)
  %106 = add i64 %pgocount6, 1
  store i64 %106, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 0)
  %107 = load i64, i64* %7, align 8
  %108 = shl i64 %107, 8
  store i64 %108, i64* %7, align 8
  %109 = load i32, i32* %8, align 4
  %110 = sub nsw i32 %109, 8
  store i32 %110, i32* %8, align 4
  br label %65

; <label>:111:                                    ; preds = %65
  %112 = load i64, i64* %7, align 8
  %113 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %114 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %113, i32 0, i32 4
  store i64 %112, i64* %114, align 8
  %115 = load i32, i32* %8, align 4
  %116 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %117 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %116, i32 0, i32 5
  store i32 %115, i32* %117, align 8
  br label %118

; <label>:118:                                    ; preds = %111, %42
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @emit_eobrun(%struct.phuff_entropy_encoder*) #0 {
  %2 = alloca %struct.phuff_entropy_encoder*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store %struct.phuff_entropy_encoder* %0, %struct.phuff_entropy_encoder** %2, align 8
  %5 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %6 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i32 0, i32 9
  %7 = load i32, i32* %6, align 4
  %8 = icmp ugt i32 %7, 0
  br i1 %8, label %9, label %50

; <label>:9:                                      ; preds = %1
  %10 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %11 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %10, i32 0, i32 9
  %12 = load i32, i32* %11, align 4
  store i32 %12, i32* %3, align 4
  store i32 0, i32* %4, align 4
  br label %13

; <label>:13:                                     ; preds = %17, %9
  %14 = load i32, i32* %3, align 4
  %15 = ashr i32 %14, 1
  store i32 %15, i32* %3, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %21

; <label>:17:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_eobrun, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_eobrun, i64 0, i64 0)
  %19 = load i32, i32* %4, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %4, align 4
  br label %13

; <label>:21:                                     ; preds = %13
  %22 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %23 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %24 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %23, i32 0, i32 8
  %25 = load i32, i32* %24, align 8
  %26 = load i32, i32* %4, align 4
  %27 = shl i32 %26, 4
  call void @emit_symbol(%struct.phuff_entropy_encoder* %22, i32 %25, i32 %27)
  %28 = load i32, i32* %4, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %37

; <label>:30:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_eobrun, i64 0, i64 3)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_eobrun, i64 0, i64 3)
  %32 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %33 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %34 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %33, i32 0, i32 9
  %35 = load i32, i32* %34, align 4
  %36 = load i32, i32* %4, align 4
  call void @emit_bits(%struct.phuff_entropy_encoder* %32, i32 %35, i32 %36)
  br label %37

; <label>:37:                                     ; preds = %30, %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_eobrun, i64 0, i64 2)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_eobrun, i64 0, i64 2)
  %39 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %40 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %39, i32 0, i32 9
  store i32 0, i32* %40, align 4
  %41 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %42 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %43 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %42, i32 0, i32 11
  %44 = load i8*, i8** %43, align 8
  %45 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %46 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %45, i32 0, i32 10
  %47 = load i32, i32* %46, align 8
  call void @emit_buffered_bits(%struct.phuff_entropy_encoder* %41, i8* %44, i32 %47)
  %48 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %49 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %48, i32 0, i32 10
  store i32 0, i32* %49, align 8
  br label %50

; <label>:50:                                     ; preds = %37, %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_eobrun, i64 0, i64 1)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_eobrun, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @flush_bits(%struct.phuff_entropy_encoder*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_flush_bits, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_flush_bits, i64 0, i64 0)
  %3 = alloca %struct.phuff_entropy_encoder*, align 8
  store %struct.phuff_entropy_encoder* %0, %struct.phuff_entropy_encoder** %3, align 8
  %4 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  call void @emit_bits(%struct.phuff_entropy_encoder* %4, i32 127, i32 7)
  %5 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %6 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i32 0, i32 4
  store i64 0, i64* %6, align 8
  %7 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %8 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %7, i32 0, i32 5
  store i32 0, i32* %8, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @dump_buffer(%struct.phuff_entropy_encoder*) #0 {
  %2 = alloca %struct.phuff_entropy_encoder*, align 8
  %3 = alloca %struct.jpeg_destination_mgr*, align 8
  store %struct.phuff_entropy_encoder* %0, %struct.phuff_entropy_encoder** %2, align 8
  %4 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %5 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %4, i32 0, i32 6
  %6 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %6, i32 0, i32 5
  %8 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %7, align 8
  store %struct.jpeg_destination_mgr* %8, %struct.jpeg_destination_mgr** %3, align 8
  %9 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %3, align 8
  %10 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %9, i32 0, i32 3
  %11 = load i32 (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)** %10, align 8
  %12 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %13 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %12, i32 0, i32 6
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %13, align 8
  %15 = ptrtoint i32 (%struct.jpeg_compress_struct*)* %11 to i64
  call void @__llvm_profile_instrument_target(i64 %15, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_dump_buffer to i8*), i32 0)
  %16 = call i32 %11(%struct.jpeg_compress_struct* %14)
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %38, label %18

; <label>:18:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_dump_buffer, i64 0, i64 1)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_dump_buffer, i64 0, i64 1)
  %20 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %21 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %20, i32 0, i32 6
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i32 0, i32 5
  store i32 22, i32* %25, align 8
  %26 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %27 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %26, i32 0, i32 6
  %28 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %27, align 8
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %28, i32 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i32 0, i32 0
  %32 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %31, align 8
  %33 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %34 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %33, i32 0, i32 6
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %34, align 8
  %36 = bitcast %struct.jpeg_compress_struct* %35 to %struct.jpeg_common_struct*
  %37 = ptrtoint void (%struct.jpeg_common_struct*)* %32 to i64
  call void @__llvm_profile_instrument_target(i64 %37, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_dump_buffer to i8*), i32 1)
  call void %32(%struct.jpeg_common_struct* %36)
  br label %38

; <label>:38:                                     ; preds = %18, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_dump_buffer, i64 0, i64 0)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_dump_buffer, i64 0, i64 0)
  %40 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %3, align 8
  %41 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %40, i32 0, i32 0
  %42 = load i8*, i8** %41, align 8
  %43 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %44 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %43, i32 0, i32 2
  store i8* %42, i8** %44, align 8
  %45 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %3, align 8
  %46 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %45, i32 0, i32 1
  %47 = load i64, i64* %46, align 8
  %48 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %2, align 8
  %49 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %48, i32 0, i32 3
  store i64 %47, i64* %49, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @emit_buffered_bits(%struct.phuff_entropy_encoder*, i8*, i32) #0 {
  %4 = alloca %struct.phuff_entropy_encoder*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %struct.phuff_entropy_encoder* %0, %struct.phuff_entropy_encoder** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %7 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %8 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %7, i32 0, i32 1
  %9 = load i32, i32* %8, align 8
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_buffered_bits, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_buffered_bits, i64 0, i64 1)
  br label %28

; <label>:13:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_buffered_bits, i64 0, i64 2)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_buffered_bits, i64 0, i64 2)
  br label %15

; <label>:15:                                     ; preds = %18, %13
  %16 = load i32, i32* %6, align 4
  %17 = icmp ugt i32 %16, 0
  br i1 %17, label %18, label %28

; <label>:18:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_buffered_bits, i64 0, i64 0)
  %19 = add i64 %pgocount2, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_buffered_bits, i64 0, i64 0)
  %20 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %21 = load i8*, i8** %5, align 8
  %22 = load i8, i8* %21, align 1
  %23 = sext i8 %22 to i32
  call void @emit_bits(%struct.phuff_entropy_encoder* %20, i32 %23, i32 1)
  %24 = load i8*, i8** %5, align 8
  %25 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %25, i8** %5, align 8
  %26 = load i32, i32* %6, align 4
  %27 = add i32 %26, -1
  store i32 %27, i32* %6, align 4
  br label %15

; <label>:28:                                     ; preds = %15, %11
  ret void
}

declare %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct*) #2

declare void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct*, %struct.JHUFF_TBL*, i64*) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

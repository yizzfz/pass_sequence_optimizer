; ModuleID = 'jdapimin.2.ll'
source_filename = "jdapimin.c"
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
%struct.jpeg_source_mgr = type { i8*, i64, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*)* }
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

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_CreateDecompress = private constant [21 x i8] c"jpeg_CreateDecompress"
@__profn_jpeg_destroy_decompress = private constant [23 x i8] c"jpeg_destroy_decompress"
@__profn_jpeg_abort_decompress = private constant [21 x i8] c"jpeg_abort_decompress"
@__profn_jpeg_set_marker_processor = private constant [25 x i8] c"jpeg_set_marker_processor"
@__profn_jpeg_read_header = private constant [16 x i8] c"jpeg_read_header"
@__profn_jpeg_consume_input = private constant [18 x i8] c"jpeg_consume_input"
@__profn_tmp1.ll_default_decompress_parms = private constant [32 x i8] c"tmp1.ll:default_decompress_parms"
@__profn_jpeg_input_complete = private constant [19 x i8] c"jpeg_input_complete"
@__profn_jpeg_has_multiple_scans = private constant [23 x i8] c"jpeg_has_multiple_scans"
@__profn_jpeg_finish_decompress = private constant [22 x i8] c"jpeg_finish_decompress"
@__profc_jpeg_CreateDecompress = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_CreateDecompress = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_CreateDecompress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3009094023718357009, i64 563029190709767, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateDecompress, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i32, i64)* @jpeg_CreateDecompress to i8*), i8* bitcast ([2 x i64]* @__profvp_jpeg_CreateDecompress to i8*), i32 5, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_jpeg_destroy_decompress = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_destroy_decompress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8116132481229221409, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_destroy_decompress, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @jpeg_destroy_decompress to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_abort_decompress = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_abort_decompress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2805787127573061346, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_abort_decompress, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @jpeg_abort_decompress to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_set_marker_processor = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_set_marker_processor = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_set_marker_processor = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1401850807043159362, i64 281530165423879, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_set_marker_processor, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i32, i32 (%struct.jpeg_decompress_struct*)*)* @jpeg_set_marker_processor to i8*), i8* bitcast ([1 x i64]* @__profvp_jpeg_set_marker_processor to i8*), i32 4, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_jpeg_read_header = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_read_header = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_read_header = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4587933989529798288, i64 563025743885544, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_read_header, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*, i32)* @jpeg_read_header to i8*), i8* bitcast ([2 x i64]* @__profvp_jpeg_read_header to i8*), i32 7, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_jpeg_consume_input = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_consume_input = private global [5 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_consume_input = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2181363094731925166, i64 1407467835128546, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*)* @jpeg_consume_input to i8*), i8* bitcast ([5 x i64]* @__profvp_jpeg_consume_input to i8*), i32 12, [1 x i16] [i16 5] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_default_decompress_parms = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_default_decompress_parms = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_default_decompress_parms = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5372795432487776252, i64 844650787785204, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i32 0, i32 0), i8* null, i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_default_decompress_parms to i8*), i32 17, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_jpeg_input_complete = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_input_complete = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_input_complete = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6140587601258840026, i64 281509139292478, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_input_complete, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*)* @jpeg_input_complete to i8*), i8* bitcast ([1 x i64]* @__profvp_jpeg_input_complete to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_jpeg_has_multiple_scans = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_has_multiple_scans = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_has_multiple_scans = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1195981117646732896, i64 281509139292478, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_has_multiple_scans, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*)* @jpeg_has_multiple_scans to i8*), i8* bitcast ([1 x i64]* @__profvp_jpeg_has_multiple_scans to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_jpeg_finish_decompress = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_finish_decompress = private global [5 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_finish_decompress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8001967565760278260, i64 1407498863623125, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*)* @jpeg_finish_decompress to i8*), i8* bitcast ([5 x i64]* @__profvp_jpeg_finish_decompress to i8*), i32 9, [1 x i16] [i16 5] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [20 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [232 x i8] c"\E5\01\00jpeg_CreateDecompress\01jpeg_destroy_decompress\01jpeg_abort_decompress\01jpeg_set_marker_processor\01jpeg_read_header\01jpeg_consume_input\01tmp1.ll:default_decompress_parms\01jpeg_input_complete\01jpeg_has_multiple_scans\01jpeg_finish_decompress", section "__llvm_prf_names"
@llvm.used = appending global [12 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_CreateDecompress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_destroy_decompress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_abort_decompress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_set_marker_processor to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_header to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_consume_input to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_default_decompress_parms to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_input_complete to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_has_multiple_scans to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_decompress to i8*), i8* bitcast ([20 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([232 x i8], [232 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jpeg_CreateDecompress(%struct.jpeg_decompress_struct*, i32, i64) #0 {
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.jpeg_error_mgr*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store i32 %1, i32* %5, align 4
  store i64 %2, i64* %6, align 8
  %9 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %9, i32 0, i32 1
  store %struct.jpeg_memory_mgr* null, %struct.jpeg_memory_mgr** %10, align 8
  %11 = load i32, i32* %5, align 4
  %12 = icmp ne i32 %11, 61
  br i1 %12, label %13, label %40

; <label>:13:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateDecompress, i64 0, i64 3)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateDecompress, i64 0, i64 3)
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 0
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i32 0, i32 5
  store i32 10, i32* %18, align 8
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 0
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i32 0, i32 6
  %23 = bitcast %union.anon* %22 to [8 x i32]*
  %24 = getelementptr inbounds [8 x i32], [8 x i32]* %23, i64 0, i64 0
  store i32 61, i32* %24, align 4
  %25 = load i32, i32* %5, align 4
  %26 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %26, i32 0, i32 0
  %28 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %27, align 8
  %29 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %28, i32 0, i32 6
  %30 = bitcast %union.anon* %29 to [8 x i32]*
  %31 = getelementptr inbounds [8 x i32], [8 x i32]* %30, i64 0, i64 1
  store i32 %25, i32* %31, align 4
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %32, i32 0, i32 0
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i32 0, i32 0
  %36 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %35, align 8
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %38 = bitcast %struct.jpeg_decompress_struct* %37 to %struct.jpeg_common_struct*
  %39 = ptrtoint void (%struct.jpeg_common_struct*)* %36 to i64
  call void @__llvm_profile_instrument_target(i64 %39, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_CreateDecompress to i8*), i32 0)
  call void %36(%struct.jpeg_common_struct* %38)
  br label %40

; <label>:40:                                     ; preds = %13, %3
  %41 = load i64, i64* %6, align 8
  %42 = icmp ne i64 %41, 616
  br i1 %42, label %43, label %71

; <label>:43:                                     ; preds = %40
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateDecompress, i64 0, i64 4)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateDecompress, i64 0, i64 4)
  %45 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %45, i32 0, i32 0
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i32 0, i32 5
  store i32 19, i32* %48, align 8
  %49 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %50 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %49, i32 0, i32 0
  %51 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %50, align 8
  %52 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %51, i32 0, i32 6
  %53 = bitcast %union.anon* %52 to [8 x i32]*
  %54 = getelementptr inbounds [8 x i32], [8 x i32]* %53, i64 0, i64 0
  store i32 616, i32* %54, align 4
  %55 = load i64, i64* %6, align 8
  %56 = trunc i64 %55 to i32
  %57 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %57, i32 0, i32 0
  %59 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %60 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %59, i32 0, i32 6
  %61 = bitcast %union.anon* %60 to [8 x i32]*
  %62 = getelementptr inbounds [8 x i32], [8 x i32]* %61, i64 0, i64 1
  store i32 %56, i32* %62, align 4
  %63 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %63, i32 0, i32 0
  %65 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %64, align 8
  %66 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %65, i32 0, i32 0
  %67 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %66, align 8
  %68 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %69 = bitcast %struct.jpeg_decompress_struct* %68 to %struct.jpeg_common_struct*
  %70 = ptrtoint void (%struct.jpeg_common_struct*)* %67 to i64
  call void @__llvm_profile_instrument_target(i64 %70, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_CreateDecompress to i8*), i32 1)
  call void %67(%struct.jpeg_common_struct* %69)
  br label %71

; <label>:71:                                     ; preds = %43, %40
  %72 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %72, i32 0, i32 0
  %74 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %73, align 8
  store %struct.jpeg_error_mgr* %74, %struct.jpeg_error_mgr** %8, align 8
  %75 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %76 = bitcast %struct.jpeg_decompress_struct* %75 to i8*
  call void @llvm.memset.p0i8.i64(i8* %76, i8 0, i64 616, i32 1, i1 false)
  %77 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %78 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %78, i32 0, i32 0
  store %struct.jpeg_error_mgr* %77, %struct.jpeg_error_mgr** %79, align 8
  %80 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %81 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %80, i32 0, i32 3
  store i32 1, i32* %81, align 8
  %82 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %83 = bitcast %struct.jpeg_decompress_struct* %82 to %struct.jpeg_common_struct*
  call void @jinit_memory_mgr(%struct.jpeg_common_struct* %83)
  %84 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %85 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %84, i32 0, i32 2
  store %struct.jpeg_progress_mgr* null, %struct.jpeg_progress_mgr** %85, align 8
  %86 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %87 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %86, i32 0, i32 5
  store %struct.jpeg_source_mgr* null, %struct.jpeg_source_mgr** %87, align 8
  store i32 0, i32* %7, align 4
  br label %88

; <label>:88:                                     ; preds = %97, %71
  %89 = load i32, i32* %7, align 4
  %90 = icmp slt i32 %89, 4
  br i1 %90, label %91, label %101

; <label>:91:                                     ; preds = %88
  %92 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %93 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %92, i32 0, i32 39
  %94 = load i32, i32* %7, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %93, i64 0, i64 %95
  store %struct.JQUANT_TBL* null, %struct.JQUANT_TBL** %96, align 8
  br label %97

; <label>:97:                                     ; preds = %91
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateDecompress, i64 0, i64 0)
  %98 = add i64 %pgocount2, 1
  store i64 %98, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateDecompress, i64 0, i64 0)
  %99 = load i32, i32* %7, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %7, align 4
  br label %88

; <label>:101:                                    ; preds = %88
  store i32 0, i32* %7, align 4
  br label %102

; <label>:102:                                    ; preds = %116, %101
  %103 = load i32, i32* %7, align 4
  %104 = icmp slt i32 %103, 4
  br i1 %104, label %105, label %120

; <label>:105:                                    ; preds = %102
  %106 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %107 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %106, i32 0, i32 40
  %108 = load i32, i32* %7, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %107, i64 0, i64 %109
  store %struct.JHUFF_TBL* null, %struct.JHUFF_TBL** %110, align 8
  %111 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %112 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %111, i32 0, i32 41
  %113 = load i32, i32* %7, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %112, i64 0, i64 %114
  store %struct.JHUFF_TBL* null, %struct.JHUFF_TBL** %115, align 8
  br label %116

; <label>:116:                                    ; preds = %105
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateDecompress, i64 0, i64 1)
  %117 = add i64 %pgocount3, 1
  store i64 %117, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateDecompress, i64 0, i64 1)
  %118 = load i32, i32* %7, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, i32* %7, align 4
  br label %102

; <label>:120:                                    ; preds = %102
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateDecompress, i64 0, i64 2)
  %121 = add i64 %pgocount4, 1
  store i64 %121, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateDecompress, i64 0, i64 2)
  %122 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  call void @jinit_marker_reader(%struct.jpeg_decompress_struct* %122)
  %123 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  call void @jinit_input_controller(%struct.jpeg_decompress_struct* %123)
  %124 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %125 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %124, i32 0, i32 4
  store i32 200, i32* %125, align 4
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

declare void @jinit_memory_mgr(%struct.jpeg_common_struct*) #2

declare void @jinit_marker_reader(%struct.jpeg_decompress_struct*) #2

declare void @jinit_input_controller(%struct.jpeg_decompress_struct*) #2

; Function Attrs: noinline nounwind uwtable
define void @jpeg_destroy_decompress(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_destroy_decompress, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_destroy_decompress, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %5 = bitcast %struct.jpeg_decompress_struct* %4 to %struct.jpeg_common_struct*
  call void @jpeg_destroy(%struct.jpeg_common_struct* %5)
  ret void
}

declare void @jpeg_destroy(%struct.jpeg_common_struct*) #2

; Function Attrs: noinline nounwind uwtable
define void @jpeg_abort_decompress(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_abort_decompress, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_abort_decompress, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %5 = bitcast %struct.jpeg_decompress_struct* %4 to %struct.jpeg_common_struct*
  call void @jpeg_abort(%struct.jpeg_common_struct* %5)
  ret void
}

declare void @jpeg_abort(%struct.jpeg_common_struct*) #2

; Function Attrs: noinline nounwind uwtable
define void @jpeg_set_marker_processor(%struct.jpeg_decompress_struct*, i32, i32 (%struct.jpeg_decompress_struct*)*) #0 {
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32 (%struct.jpeg_decompress_struct*)*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 (%struct.jpeg_decompress_struct*)* %2, i32 (%struct.jpeg_decompress_struct*)** %6, align 8
  %7 = load i32, i32* %5, align 4
  %8 = icmp eq i32 %7, 254
  br i1 %8, label %9, label %16

; <label>:9:                                      ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_set_marker_processor, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_set_marker_processor, i64 0, i64 0)
  %11 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %6, align 8
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %12, i32 0, i32 78
  %14 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %14, i32 0, i32 3
  store i32 (%struct.jpeg_decompress_struct*)* %11, i32 (%struct.jpeg_decompress_struct*)** %15, align 8
  br label %56

; <label>:16:                                     ; preds = %3
  %17 = load i32, i32* %5, align 4
  %18 = icmp sge i32 %17, 224
  br i1 %18, label %19, label %34

; <label>:19:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_set_marker_processor, i64 0, i64 2)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_set_marker_processor, i64 0, i64 2)
  %21 = load i32, i32* %5, align 4
  %22 = icmp sle i32 %21, 239
  br i1 %22, label %23, label %34

; <label>:23:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_set_marker_processor, i64 0, i64 3)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_set_marker_processor, i64 0, i64 3)
  %25 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %6, align 8
  %26 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %26, i32 0, i32 78
  %28 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %27, align 8
  %29 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %28, i32 0, i32 4
  %30 = load i32, i32* %5, align 4
  %31 = sub nsw i32 %30, 224
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [16 x i32 (%struct.jpeg_decompress_struct*)*], [16 x i32 (%struct.jpeg_decompress_struct*)*]* %29, i64 0, i64 %32
  store i32 (%struct.jpeg_decompress_struct*)* %25, i32 (%struct.jpeg_decompress_struct*)** %33, align 8
  br label %55

; <label>:34:                                     ; preds = %19, %16
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_set_marker_processor, i64 0, i64 1)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_set_marker_processor, i64 0, i64 1)
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 0
  %38 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %37, align 8
  %39 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %38, i32 0, i32 5
  store i32 67, i32* %39, align 8
  %40 = load i32, i32* %5, align 4
  %41 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %41, i32 0, i32 0
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i32 0, i32 6
  %45 = bitcast %union.anon* %44 to [8 x i32]*
  %46 = getelementptr inbounds [8 x i32], [8 x i32]* %45, i64 0, i64 0
  store i32 %40, i32* %46, align 4
  %47 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %47, i32 0, i32 0
  %49 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %48, align 8
  %50 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %49, i32 0, i32 0
  %51 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %50, align 8
  %52 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %53 = bitcast %struct.jpeg_decompress_struct* %52 to %struct.jpeg_common_struct*
  %54 = ptrtoint void (%struct.jpeg_common_struct*)* %51 to i64
  call void @__llvm_profile_instrument_target(i64 %54, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_set_marker_processor to i8*), i32 0)
  call void %51(%struct.jpeg_common_struct* %53)
  br label %55

; <label>:55:                                     ; preds = %34, %23
  br label %56

; <label>:56:                                     ; preds = %55, %9
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_read_header(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %6, i32 0, i32 4
  %8 = load i32, i32* %7, align 4
  %9 = icmp ne i32 %8, 200
  br i1 %9, label %10, label %39

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_read_header, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_read_header, i64 0, i64 1)
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %12, i32 0, i32 4
  %14 = load i32, i32* %13, align 4
  %15 = icmp ne i32 %14, 201
  br i1 %15, label %16, label %39

; <label>:16:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_read_header, i64 0, i64 2)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_read_header, i64 0, i64 2)
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i32 0, i32 5
  store i32 18, i32* %21, align 8
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 4
  %24 = load i32, i32* %23, align 4
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %25, i32 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i32 0, i32 6
  %29 = bitcast %union.anon* %28 to [8 x i32]*
  %30 = getelementptr inbounds [8 x i32], [8 x i32]* %29, i64 0, i64 0
  store i32 %24, i32* %30, align 4
  %31 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %31, i32 0, i32 0
  %33 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %33, i32 0, i32 0
  %35 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %34, align 8
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %37 = bitcast %struct.jpeg_decompress_struct* %36 to %struct.jpeg_common_struct*
  %38 = ptrtoint void (%struct.jpeg_common_struct*)* %35 to i64
  call void @__llvm_profile_instrument_target(i64 %38, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_header to i8*), i32 0)
  call void %35(%struct.jpeg_common_struct* %37)
  br label %39

; <label>:39:                                     ; preds = %16, %10, %2
  %40 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %41 = call i32 @jpeg_consume_input(%struct.jpeg_decompress_struct* %40)
  store i32 %41, i32* %5, align 4
  %42 = load i32, i32* %5, align 4
  switch i32 %42, label %68 [
    i32 1, label %43
    i32 2, label %45
    i32 0, label %66
  ]

; <label>:43:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_read_header, i64 0, i64 3)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_read_header, i64 0, i64 3)
  store i32 1, i32* %5, align 4
  br label %68

; <label>:45:                                     ; preds = %39
  %46 = load i32, i32* %4, align 4
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %62

; <label>:48:                                     ; preds = %45
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_read_header, i64 0, i64 6)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_read_header, i64 0, i64 6)
  %50 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %50, i32 0, i32 0
  %52 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %51, align 8
  %53 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %52, i32 0, i32 5
  store i32 50, i32* %53, align 8
  %54 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %55 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %54, i32 0, i32 0
  %56 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %55, align 8
  %57 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %56, i32 0, i32 0
  %58 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %57, align 8
  %59 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %60 = bitcast %struct.jpeg_decompress_struct* %59 to %struct.jpeg_common_struct*
  %61 = ptrtoint void (%struct.jpeg_common_struct*)* %58 to i64
  call void @__llvm_profile_instrument_target(i64 %61, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_header to i8*), i32 1)
  call void %58(%struct.jpeg_common_struct* %60)
  br label %62

; <label>:62:                                     ; preds = %48, %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_read_header, i64 0, i64 4)
  %63 = add i64 %pgocount4, 1
  store i64 %63, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_read_header, i64 0, i64 4)
  %64 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %65 = bitcast %struct.jpeg_decompress_struct* %64 to %struct.jpeg_common_struct*
  call void @jpeg_abort(%struct.jpeg_common_struct* %65)
  store i32 2, i32* %5, align 4
  br label %68

; <label>:66:                                     ; preds = %39
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_read_header, i64 0, i64 5)
  %67 = add i64 %pgocount5, 1
  store i64 %67, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_read_header, i64 0, i64 5)
  br label %68

; <label>:68:                                     ; preds = %66, %62, %43, %39
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_read_header, i64 0, i64 0)
  %69 = add i64 %pgocount6, 1
  store i64 %69, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_read_header, i64 0, i64 0)
  %70 = load i32, i32* %5, align 4
  ret i32 %70
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_consume_input(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  store i32 0, i32* %3, align 4
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 4
  %6 = load i32, i32* %5, align 4
  switch i32 %6, label %61 [
    i32 200, label %13
    i32 201, label %31
    i32 202, label %49
    i32 203, label %._crit_edge
    i32 204, label %._crit_edge1
    i32 205, label %._crit_edge2
    i32 206, label %._crit_edge3
    i32 207, label %._crit_edge4
    i32 208, label %._crit_edge5
    i32 210, label %51
  ]

._crit_edge5:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 5)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 5)
  br label %51

._crit_edge4:                                     ; preds = %1
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 4)
  %8 = add i64 %pgocount6, 1
  store i64 %8, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 4)
  br label %51

._crit_edge3:                                     ; preds = %1
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 3)
  %9 = add i64 %pgocount7, 1
  store i64 %9, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 3)
  br label %51

._crit_edge2:                                     ; preds = %1
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 2)
  %10 = add i64 %pgocount8, 1
  store i64 %10, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 2)
  br label %51

._crit_edge1:                                     ; preds = %1
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 1)
  %11 = add i64 %pgocount9, 1
  store i64 %11, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 1)
  br label %51

._crit_edge:                                      ; preds = %1
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 0)
  %12 = add i64 %pgocount10, 1
  store i64 %12, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 0)
  br label %51

; <label>:13:                                     ; preds = %1
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 10)
  %14 = add i64 %pgocount11, 1
  store i64 %14, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 10)
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 77
  %17 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %17, i32 0, i32 1
  %19 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %18, align 8
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %21 = ptrtoint void (%struct.jpeg_decompress_struct*)* %19 to i64
  call void @__llvm_profile_instrument_target(i64 %21, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_consume_input to i8*), i32 0)
  call void %19(%struct.jpeg_decompress_struct* %20)
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 5
  %24 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %24, i32 0, i32 2
  %26 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %25, align 8
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %28 = ptrtoint void (%struct.jpeg_decompress_struct*)* %26 to i64
  call void @__llvm_profile_instrument_target(i64 %28, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_consume_input to i8*), i32 1)
  call void %26(%struct.jpeg_decompress_struct* %27)
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %29, i32 0, i32 4
  store i32 201, i32* %30, align 4
  br label %31

; <label>:31:                                     ; preds = %13, %1
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %32, i32 0, i32 77
  %34 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %34, i32 0, i32 0
  %36 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %35, align 8
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %38 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %36 to i64
  call void @__llvm_profile_instrument_target(i64 %38, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_consume_input to i8*), i32 2)
  %39 = call i32 %36(%struct.jpeg_decompress_struct* %37)
  store i32 %39, i32* %3, align 4
  %40 = load i32, i32* %3, align 4
  %41 = icmp eq i32 %40, 1
  br i1 %41, label %42, label %47

; <label>:42:                                     ; preds = %31
  %pgocount12 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 8)
  %43 = add i64 %pgocount12, 1
  store i64 %43, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 8)
  %44 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @default_decompress_parms(%struct.jpeg_decompress_struct* %44)
  %45 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %45, i32 0, i32 4
  store i32 202, i32* %46, align 4
  br label %47

; <label>:47:                                     ; preds = %42, %31
  %pgocount13 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 7)
  %48 = add i64 %pgocount13, 1
  store i64 %48, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 7)
  br label %84

; <label>:49:                                     ; preds = %1
  %pgocount14 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 11)
  %50 = add i64 %pgocount14, 1
  store i64 %50, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 11)
  store i32 1, i32* %3, align 4
  br label %84

; <label>:51:                                     ; preds = %._crit_edge, %._crit_edge1, %._crit_edge2, %._crit_edge3, %._crit_edge4, %._crit_edge5, %1
  %pgocount15 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 6)
  %52 = add i64 %pgocount15, 1
  store i64 %52, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 6)
  %53 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %53, i32 0, i32 77
  %55 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %54, align 8
  %56 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %55, i32 0, i32 0
  %57 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %56, align 8
  %58 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %59 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %57 to i64
  call void @__llvm_profile_instrument_target(i64 %59, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_consume_input to i8*), i32 3)
  %60 = call i32 %57(%struct.jpeg_decompress_struct* %58)
  store i32 %60, i32* %3, align 4
  br label %84

; <label>:61:                                     ; preds = %1
  %pgocount16 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 9)
  %62 = add i64 %pgocount16, 1
  store i64 %62, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_consume_input, i64 0, i64 9)
  %63 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %63, i32 0, i32 0
  %65 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %64, align 8
  %66 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %65, i32 0, i32 5
  store i32 18, i32* %66, align 8
  %67 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %68 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %67, i32 0, i32 4
  %69 = load i32, i32* %68, align 4
  %70 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %71 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %70, i32 0, i32 0
  %72 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %71, align 8
  %73 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %72, i32 0, i32 6
  %74 = bitcast %union.anon* %73 to [8 x i32]*
  %75 = getelementptr inbounds [8 x i32], [8 x i32]* %74, i64 0, i64 0
  store i32 %69, i32* %75, align 4
  %76 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %76, i32 0, i32 0
  %78 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %77, align 8
  %79 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %78, i32 0, i32 0
  %80 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %79, align 8
  %81 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %82 = bitcast %struct.jpeg_decompress_struct* %81 to %struct.jpeg_common_struct*
  %83 = ptrtoint void (%struct.jpeg_common_struct*)* %80 to i64
  call void @__llvm_profile_instrument_target(i64 %83, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_consume_input to i8*), i32 4)
  call void %80(%struct.jpeg_common_struct* %82)
  br label %84

; <label>:84:                                     ; preds = %61, %51, %49, %47
  %85 = load i32, i32* %3, align 4
  ret i32 %85
}

; Function Attrs: noinline nounwind uwtable
define internal void @default_decompress_parms(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %7 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %7, i32 0, i32 8
  %9 = load i32, i32* %8, align 8
  switch i32 %9, label %209 [
    i32 1, label %10
    i32 3, label %16
    i32 4, label %157
  ]

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 0)
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %12, i32 0, i32 9
  store i32 1, i32* %13, align 4
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 10
  store i32 1, i32* %15, align 8
  br label %215

; <label>:16:                                     ; preds = %1
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 50
  %19 = load i32, i32* %18, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %25

; <label>:21:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 2)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 2)
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %23, i32 0, i32 9
  store i32 3, i32* %24, align 4
  br label %154

; <label>:25:                                     ; preds = %16
  %26 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %26, i32 0, i32 54
  %28 = load i32, i32* %27, align 8
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %70

; <label>:30:                                     ; preds = %25
  %31 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %31, i32 0, i32 55
  %33 = load i8, i8* %32, align 4
  %34 = zext i8 %33 to i32
  switch i32 %34, label %43 [
    i32 0, label %35
    i32 1, label %39
  ]

; <label>:35:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 8)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 8)
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %37, i32 0, i32 9
  store i32 2, i32* %38, align 4
  br label %69

; <label>:39:                                     ; preds = %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 9)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 9)
  %41 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %41, i32 0, i32 9
  store i32 3, i32* %42, align 4
  br label %69

; <label>:43:                                     ; preds = %30
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 10)
  %44 = add i64 %pgocount4, 1
  store i64 %44, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 10)
  %45 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %45, i32 0, i32 0
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i32 0, i32 5
  store i32 110, i32* %48, align 8
  %49 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %50 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %49, i32 0, i32 55
  %51 = load i8, i8* %50, align 4
  %52 = zext i8 %51 to i32
  %53 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %53, i32 0, i32 0
  %55 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %56 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %55, i32 0, i32 6
  %57 = bitcast %union.anon* %56 to [8 x i32]*
  %58 = getelementptr inbounds [8 x i32], [8 x i32]* %57, i64 0, i64 0
  store i32 %52, i32* %58, align 4
  %59 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %60 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %59, i32 0, i32 0
  %61 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %60, align 8
  %62 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %61, i32 0, i32 1
  %63 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %62, align 8
  %64 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %65 = bitcast %struct.jpeg_decompress_struct* %64 to %struct.jpeg_common_struct*
  %66 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %63 to i64
  call void @__llvm_profile_instrument_target(i64 %66, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_default_decompress_parms to i8*), i32 0)
  call void %63(%struct.jpeg_common_struct* %65, i32 -1)
  %67 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %68 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %67, i32 0, i32 9
  store i32 3, i32* %68, align 4
  br label %69

; <label>:69:                                     ; preds = %43, %39, %35
  br label %153

; <label>:70:                                     ; preds = %25
  %71 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %72 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %71, i32 0, i32 43
  %73 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %72, align 8
  %74 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %73, i64 0
  %75 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %74, i32 0, i32 0
  %76 = load i32, i32* %75, align 8
  store i32 %76, i32* %3, align 4
  %77 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %78 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %77, i32 0, i32 43
  %79 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %78, align 8
  %80 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %79, i64 1
  %81 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %80, i32 0, i32 0
  %82 = load i32, i32* %81, align 8
  store i32 %82, i32* %4, align 4
  %83 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %84 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %83, i32 0, i32 43
  %85 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %84, align 8
  %86 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %85, i64 2
  %87 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %86, i32 0, i32 0
  %88 = load i32, i32* %87, align 8
  store i32 %88, i32* %5, align 4
  %89 = load i32, i32* %3, align 4
  %90 = icmp eq i32 %89, 1
  br i1 %90, label %91, label %103

; <label>:91:                                     ; preds = %70
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 11)
  %92 = add i64 %pgocount5, 1
  store i64 %92, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 11)
  %93 = load i32, i32* %4, align 4
  %94 = icmp eq i32 %93, 2
  br i1 %94, label %95, label %103

; <label>:95:                                     ; preds = %91
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 13)
  %96 = add i64 %pgocount6, 1
  store i64 %96, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 13)
  %97 = load i32, i32* %5, align 4
  %98 = icmp eq i32 %97, 3
  br i1 %98, label %99, label %103

; <label>:99:                                     ; preds = %95
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 15)
  %100 = add i64 %pgocount7, 1
  store i64 %100, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 15)
  %101 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %102 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %101, i32 0, i32 9
  store i32 3, i32* %102, align 4
  br label %152

; <label>:103:                                    ; preds = %95, %91, %70
  %104 = load i32, i32* %3, align 4
  %105 = icmp eq i32 %104, 82
  br i1 %105, label %106, label %118

; <label>:106:                                    ; preds = %103
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 12)
  %107 = add i64 %pgocount8, 1
  store i64 %107, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 12)
  %108 = load i32, i32* %4, align 4
  %109 = icmp eq i32 %108, 71
  br i1 %109, label %110, label %118

; <label>:110:                                    ; preds = %106
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 14)
  %111 = add i64 %pgocount9, 1
  store i64 %111, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 14)
  %112 = load i32, i32* %5, align 4
  %113 = icmp eq i32 %112, 66
  br i1 %113, label %114, label %118

; <label>:114:                                    ; preds = %110
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 16)
  %115 = add i64 %pgocount10, 1
  store i64 %115, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 16)
  %116 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %117 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %116, i32 0, i32 9
  store i32 2, i32* %117, align 4
  br label %151

; <label>:118:                                    ; preds = %110, %106, %103
  br label %119

; <label>:119:                                    ; preds = %118
  %120 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %121 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %120, i32 0, i32 0
  %122 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %121, align 8
  %123 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %122, i32 0, i32 6
  %124 = bitcast %union.anon* %123 to [8 x i32]*
  %125 = getelementptr inbounds [8 x i32], [8 x i32]* %124, i32 0, i32 0
  store i32* %125, i32** %6, align 8
  %126 = load i32, i32* %3, align 4
  %127 = load i32*, i32** %6, align 8
  %128 = getelementptr inbounds i32, i32* %127, i64 0
  store i32 %126, i32* %128, align 4
  %129 = load i32, i32* %4, align 4
  %130 = load i32*, i32** %6, align 8
  %131 = getelementptr inbounds i32, i32* %130, i64 1
  store i32 %129, i32* %131, align 4
  %132 = load i32, i32* %5, align 4
  %133 = load i32*, i32** %6, align 8
  %134 = getelementptr inbounds i32, i32* %133, i64 2
  store i32 %132, i32* %134, align 4
  %135 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %136 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %135, i32 0, i32 0
  %137 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %136, align 8
  %138 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %137, i32 0, i32 5
  store i32 107, i32* %138, align 8
  %139 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %140 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %139, i32 0, i32 0
  %141 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %140, align 8
  %142 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %141, i32 0, i32 1
  %143 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %142, align 8
  %144 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %145 = bitcast %struct.jpeg_decompress_struct* %144 to %struct.jpeg_common_struct*
  %146 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %143 to i64
  call void @__llvm_profile_instrument_target(i64 %146, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_default_decompress_parms to i8*), i32 1)
  call void %143(%struct.jpeg_common_struct* %145, i32 1)
  br label %147

; <label>:147:                                    ; preds = %119
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 7)
  %148 = add i64 %pgocount11, 1
  store i64 %148, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 7)
  %149 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %150 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %149, i32 0, i32 9
  store i32 3, i32* %150, align 4
  br label %151

; <label>:151:                                    ; preds = %147, %114
  br label %152

; <label>:152:                                    ; preds = %151, %99
  br label %153

; <label>:153:                                    ; preds = %152, %69
  br label %154

; <label>:154:                                    ; preds = %153, %21
  %155 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %156 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %155, i32 0, i32 10
  store i32 2, i32* %156, align 8
  br label %215

; <label>:157:                                    ; preds = %1
  %158 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %159 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %158, i32 0, i32 54
  %160 = load i32, i32* %159, align 8
  %161 = icmp ne i32 %160, 0
  br i1 %161, label %162, label %202

; <label>:162:                                    ; preds = %157
  %163 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %164 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %163, i32 0, i32 55
  %165 = load i8, i8* %164, align 4
  %166 = zext i8 %165 to i32
  switch i32 %166, label %175 [
    i32 0, label %167
    i32 2, label %171
  ]

; <label>:167:                                    ; preds = %162
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 4)
  %168 = add i64 %pgocount12, 1
  store i64 %168, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 4)
  %169 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %170 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %169, i32 0, i32 9
  store i32 4, i32* %170, align 4
  br label %201

; <label>:171:                                    ; preds = %162
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 5)
  %172 = add i64 %pgocount13, 1
  store i64 %172, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 5)
  %173 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %174 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %173, i32 0, i32 9
  store i32 5, i32* %174, align 4
  br label %201

; <label>:175:                                    ; preds = %162
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 6)
  %176 = add i64 %pgocount14, 1
  store i64 %176, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 6)
  %177 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %178 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %177, i32 0, i32 0
  %179 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %178, align 8
  %180 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %179, i32 0, i32 5
  store i32 110, i32* %180, align 8
  %181 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %182 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %181, i32 0, i32 55
  %183 = load i8, i8* %182, align 4
  %184 = zext i8 %183 to i32
  %185 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %186 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %185, i32 0, i32 0
  %187 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %186, align 8
  %188 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %187, i32 0, i32 6
  %189 = bitcast %union.anon* %188 to [8 x i32]*
  %190 = getelementptr inbounds [8 x i32], [8 x i32]* %189, i64 0, i64 0
  store i32 %184, i32* %190, align 4
  %191 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %192 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %191, i32 0, i32 0
  %193 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %192, align 8
  %194 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %193, i32 0, i32 1
  %195 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %194, align 8
  %196 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %197 = bitcast %struct.jpeg_decompress_struct* %196 to %struct.jpeg_common_struct*
  %198 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %195 to i64
  call void @__llvm_profile_instrument_target(i64 %198, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_default_decompress_parms to i8*), i32 2)
  call void %195(%struct.jpeg_common_struct* %197, i32 -1)
  %199 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %200 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %199, i32 0, i32 9
  store i32 5, i32* %200, align 4
  br label %201

; <label>:201:                                    ; preds = %175, %171, %167
  br label %206

; <label>:202:                                    ; preds = %157
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 3)
  %203 = add i64 %pgocount15, 1
  store i64 %203, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 3)
  %204 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %205 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %204, i32 0, i32 9
  store i32 4, i32* %205, align 4
  br label %206

; <label>:206:                                    ; preds = %202, %201
  %207 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %208 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %207, i32 0, i32 10
  store i32 4, i32* %208, align 8
  br label %215

; <label>:209:                                    ; preds = %1
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 1)
  %210 = add i64 %pgocount16, 1
  store i64 %210, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_default_decompress_parms, i64 0, i64 1)
  %211 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %212 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %211, i32 0, i32 9
  store i32 0, i32* %212, align 4
  %213 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %214 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %213, i32 0, i32 10
  store i32 0, i32* %214, align 8
  br label %215

; <label>:215:                                    ; preds = %209, %206, %154, %10
  %216 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %217 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %216, i32 0, i32 11
  store i32 1, i32* %217, align 4
  %218 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %219 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %218, i32 0, i32 12
  store i32 1, i32* %219, align 8
  %220 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %221 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %220, i32 0, i32 13
  store double 1.000000e+00, double* %221, align 8
  %222 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %223 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %222, i32 0, i32 14
  store i32 0, i32* %223, align 8
  %224 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %225 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %224, i32 0, i32 15
  store i32 0, i32* %225, align 4
  %226 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %227 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %226, i32 0, i32 16
  store i32 0, i32* %227, align 8
  %228 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %229 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %228, i32 0, i32 17
  store i32 1, i32* %229, align 4
  %230 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %231 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %230, i32 0, i32 18
  store i32 1, i32* %231, align 8
  %232 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %233 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %232, i32 0, i32 19
  store i32 0, i32* %233, align 4
  %234 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %235 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %234, i32 0, i32 20
  store i32 2, i32* %235, align 8
  %236 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %237 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %236, i32 0, i32 21
  store i32 1, i32* %237, align 4
  %238 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %239 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %238, i32 0, i32 22
  store i32 256, i32* %239, align 8
  %240 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %241 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %240, i32 0, i32 32
  store i8** null, i8*** %241, align 8
  %242 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %243 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %242, i32 0, i32 23
  store i32 0, i32* %243, align 4
  %244 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %245 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %244, i32 0, i32 24
  store i32 0, i32* %245, align 8
  %246 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %247 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %246, i32 0, i32 25
  store i32 0, i32* %247, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_input_complete(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %3 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %3, i32 0, i32 4
  %5 = load i32, i32* %4, align 4
  %6 = icmp slt i32 %5, 200
  br i1 %6, label %13, label %7

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_input_complete, i64 0, i64 2)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_input_complete, i64 0, i64 2)
  %9 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %9, i32 0, i32 4
  %11 = load i32, i32* %10, align 4
  %12 = icmp sgt i32 %11, 210
  br i1 %12, label %13, label %36

; <label>:13:                                     ; preds = %7, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_input_complete, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_input_complete, i64 0, i64 1)
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 0
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i32 0, i32 5
  store i32 18, i32* %18, align 8
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 4
  %21 = load i32, i32* %20, align 4
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i32 0, i32 6
  %26 = bitcast %union.anon* %25 to [8 x i32]*
  %27 = getelementptr inbounds [8 x i32], [8 x i32]* %26, i64 0, i64 0
  store i32 %21, i32* %27, align 4
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %28, i32 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i32 0, i32 0
  %32 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %31, align 8
  %33 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %34 = bitcast %struct.jpeg_decompress_struct* %33 to %struct.jpeg_common_struct*
  %35 = ptrtoint void (%struct.jpeg_common_struct*)* %32 to i64
  call void @__llvm_profile_instrument_target(i64 %35, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_input_complete to i8*), i32 0)
  call void %32(%struct.jpeg_common_struct* %34)
  br label %36

; <label>:36:                                     ; preds = %13, %7
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_input_complete, i64 0, i64 0)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_input_complete, i64 0, i64 0)
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %38, i32 0, i32 77
  %40 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %40, i32 0, i32 5
  %42 = load i32, i32* %41, align 4
  ret i32 %42
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_has_multiple_scans(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %3 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %3, i32 0, i32 4
  %5 = load i32, i32* %4, align 4
  %6 = icmp slt i32 %5, 202
  br i1 %6, label %13, label %7

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_has_multiple_scans, i64 0, i64 2)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_has_multiple_scans, i64 0, i64 2)
  %9 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %9, i32 0, i32 4
  %11 = load i32, i32* %10, align 4
  %12 = icmp sgt i32 %11, 210
  br i1 %12, label %13, label %36

; <label>:13:                                     ; preds = %7, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_has_multiple_scans, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_has_multiple_scans, i64 0, i64 1)
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 0
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i32 0, i32 5
  store i32 18, i32* %18, align 8
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 4
  %21 = load i32, i32* %20, align 4
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i32 0, i32 6
  %26 = bitcast %union.anon* %25 to [8 x i32]*
  %27 = getelementptr inbounds [8 x i32], [8 x i32]* %26, i64 0, i64 0
  store i32 %21, i32* %27, align 4
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %28, i32 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i32 0, i32 0
  %32 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %31, align 8
  %33 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %34 = bitcast %struct.jpeg_decompress_struct* %33 to %struct.jpeg_common_struct*
  %35 = ptrtoint void (%struct.jpeg_common_struct*)* %32 to i64
  call void @__llvm_profile_instrument_target(i64 %35, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_has_multiple_scans to i8*), i32 0)
  call void %32(%struct.jpeg_common_struct* %34)
  br label %36

; <label>:36:                                     ; preds = %13, %7
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_has_multiple_scans, i64 0, i64 0)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jpeg_has_multiple_scans, i64 0, i64 0)
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %38, i32 0, i32 77
  %40 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %40, i32 0, i32 4
  %42 = load i32, i32* %41, align 8
  ret i32 %42
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_finish_decompress(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 4
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 205
  br i1 %7, label %15, label %8

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 2)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 2)
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %10, i32 0, i32 4
  %12 = load i32, i32* %11, align 4
  %13 = icmp eq i32 %12, 206
  br i1 %13, label %15, label %._crit_edge

._crit_edge:                                      ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 0)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 0)
  br label %53

; <label>:15:                                     ; preds = %8, %1
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 14
  %18 = load i32, i32* %17, align 8
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %53, label %20

; <label>:20:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 6)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 6)
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 33
  %24 = load i32, i32* %23, align 8
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %25, i32 0, i32 27
  %27 = load i32, i32* %26, align 4
  %28 = icmp ult i32 %24, %27
  br i1 %28, label %29, label %43

; <label>:29:                                     ; preds = %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 8)
  %30 = add i64 %pgocount3, 1
  store i64 %30, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 8)
  %31 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %31, i32 0, i32 0
  %33 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %33, i32 0, i32 5
  store i32 66, i32* %34, align 8
  %35 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %35, i32 0, i32 0
  %37 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %37, i32 0, i32 0
  %39 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %38, align 8
  %40 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %41 = bitcast %struct.jpeg_decompress_struct* %40 to %struct.jpeg_common_struct*
  %42 = ptrtoint void (%struct.jpeg_common_struct*)* %39 to i64
  call void @__llvm_profile_instrument_target(i64 %42, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_decompress to i8*), i32 0)
  call void %39(%struct.jpeg_common_struct* %41)
  br label %43

; <label>:43:                                     ; preds = %29, %20
  %44 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %44, i32 0, i32 73
  %46 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %45, align 8
  %47 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %46, i32 0, i32 1
  %48 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %47, align 8
  %49 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %50 = ptrtoint void (%struct.jpeg_decompress_struct*)* %48 to i64
  call void @__llvm_profile_instrument_target(i64 %50, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_decompress to i8*), i32 1)
  call void %48(%struct.jpeg_decompress_struct* %49)
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 4
  store i32 210, i32* %52, align 4
  br label %93

; <label>:53:                                     ; preds = %15, %._crit_edge
  %54 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %55 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %54, i32 0, i32 4
  %56 = load i32, i32* %55, align 4
  %57 = icmp eq i32 %56, 207
  br i1 %57, label %58, label %62

; <label>:58:                                     ; preds = %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 4)
  %59 = add i64 %pgocount4, 1
  store i64 %59, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 4)
  %60 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %61 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %60, i32 0, i32 4
  store i32 210, i32* %61, align 4
  br label %92

; <label>:62:                                     ; preds = %53
  %63 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %63, i32 0, i32 4
  %65 = load i32, i32* %64, align 4
  %66 = icmp ne i32 %65, 210
  br i1 %66, label %67, label %90

; <label>:67:                                     ; preds = %62
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 7)
  %68 = add i64 %pgocount5, 1
  store i64 %68, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 7)
  %69 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %70 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %69, i32 0, i32 0
  %71 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %71, i32 0, i32 5
  store i32 18, i32* %72, align 8
  %73 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %74 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %73, i32 0, i32 4
  %75 = load i32, i32* %74, align 4
  %76 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %76, i32 0, i32 0
  %78 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %77, align 8
  %79 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %78, i32 0, i32 6
  %80 = bitcast %union.anon* %79 to [8 x i32]*
  %81 = getelementptr inbounds [8 x i32], [8 x i32]* %80, i64 0, i64 0
  store i32 %75, i32* %81, align 4
  %82 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %83 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %82, i32 0, i32 0
  %84 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %83, align 8
  %85 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %84, i32 0, i32 0
  %86 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %85, align 8
  %87 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %88 = bitcast %struct.jpeg_decompress_struct* %87 to %struct.jpeg_common_struct*
  %89 = ptrtoint void (%struct.jpeg_common_struct*)* %86 to i64
  call void @__llvm_profile_instrument_target(i64 %89, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_decompress to i8*), i32 2)
  call void %86(%struct.jpeg_common_struct* %88)
  br label %90

; <label>:90:                                     ; preds = %67, %62
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 5)
  %91 = add i64 %pgocount6, 1
  store i64 %91, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 5)
  br label %92

; <label>:92:                                     ; preds = %90, %58
  br label %93

; <label>:93:                                     ; preds = %92, %43
  br label %94

; <label>:94:                                     ; preds = %114, %93
  %95 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %96 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %95, i32 0, i32 77
  %97 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %96, align 8
  %98 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %97, i32 0, i32 5
  %99 = load i32, i32* %98, align 4
  %100 = icmp ne i32 %99, 0
  %101 = xor i1 %100, true
  br i1 %101, label %102, label %116

; <label>:102:                                    ; preds = %94
  %103 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %104 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %103, i32 0, i32 77
  %105 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %104, align 8
  %106 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %105, i32 0, i32 0
  %107 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %106, align 8
  %108 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %109 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %107 to i64
  call void @__llvm_profile_instrument_target(i64 %109, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_decompress to i8*), i32 3)
  %110 = call i32 %107(%struct.jpeg_decompress_struct* %108)
  %111 = icmp eq i32 %110, 0
  br i1 %111, label %112, label %114

; <label>:112:                                    ; preds = %102
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 3)
  %113 = add i64 %pgocount7, 1
  store i64 %113, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 3)
  store i32 0, i32* %2, align 4
  br label %126

; <label>:114:                                    ; preds = %102
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 1)
  %115 = add i64 %pgocount8, 1
  store i64 %115, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_decompress, i64 0, i64 1)
  br label %94

; <label>:116:                                    ; preds = %94
  %117 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %118 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %117, i32 0, i32 5
  %119 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %118, align 8
  %120 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %119, i32 0, i32 6
  %121 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %120, align 8
  %122 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %123 = ptrtoint void (%struct.jpeg_decompress_struct*)* %121 to i64
  call void @__llvm_profile_instrument_target(i64 %123, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_decompress to i8*), i32 4)
  call void %121(%struct.jpeg_decompress_struct* %122)
  %124 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %125 = bitcast %struct.jpeg_decompress_struct* %124 to %struct.jpeg_common_struct*
  call void @jpeg_abort(%struct.jpeg_common_struct* %125)
  store i32 1, i32* %2, align 4
  br label %126

; <label>:126:                                    ; preds = %116, %112
  %127 = load i32, i32* %2, align 4
  ret i32 %127
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

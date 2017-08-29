; ModuleID = 'tmp1.ll'
source_filename = "jdmainct.c"
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
%struct.jpeg_color_quantizer = type { {}*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)* }
%struct.my_main_controller = type { %struct.jpeg_d_main_controller, [10 x i8**], i32, i32, [2 x i8***], i32, i32, i32, i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_d_main_controller = private constant [23 x i8] c"jinit_d_main_controller"
@__profn_tmp1.ll_start_pass_main = private constant [23 x i8] c"tmp1.ll:start_pass_main"
@__profn_tmp1.ll_alloc_funny_pointers = private constant [28 x i8] c"tmp1.ll:alloc_funny_pointers"
@__profn_tmp1.ll_process_data_context_main = private constant [33 x i8] c"tmp1.ll:process_data_context_main"
@__profn_tmp1.ll_make_funny_pointers = private constant [27 x i8] c"tmp1.ll:make_funny_pointers"
@__profn_tmp1.ll_process_data_simple_main = private constant [32 x i8] c"tmp1.ll:process_data_simple_main"
@__profn_tmp1.ll_process_data_crank_post = private constant [31 x i8] c"tmp1.ll:process_data_crank_post"
@__profn_tmp1.ll_set_bottom_pointers = private constant [27 x i8] c"tmp1.ll:set_bottom_pointers"
@__profn_tmp1.ll_set_wraparound_pointers = private constant [31 x i8] c"tmp1.ll:set_wraparound_pointers"
@__profc_jinit_d_main_controller = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_d_main_controller = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_d_main_controller = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3949854810262818340, i64 1125974604913397, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_main_controller, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i32)* @jinit_d_main_controller to i8*), i8* bitcast ([4 x i64]* @__profvp_jinit_d_main_controller to i8*), i32 5, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass_main = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_pass_main = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_pass_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6362297873878557579, i64 281527543841070, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_pass_main, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i32)* @start_pass_main to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_start_pass_main to i8*), i32 4, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_alloc_funny_pointers = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_alloc_funny_pointers = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_alloc_funny_pointers = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6955088042980715242, i64 562984091081628, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_alloc_funny_pointers, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_alloc_funny_pointers to i8*), i32 2, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_process_data_context_main = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_process_data_context_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_process_data_context_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5790323533633607973, i64 844554711742161, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* @process_data_context_main to i8*), i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_process_data_context_main to i8*), i32 11, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_make_funny_pointers = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_make_funny_pointers = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -472237549835342732, i64 95074289602, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_make_funny_pointers, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_process_data_simple_main = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_process_data_simple_main = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_process_data_simple_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5106865410986619261, i64 563000808170128, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_process_data_simple_main, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* @process_data_simple_main to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_process_data_simple_main to i8*), i32 4, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_process_data_crank_post = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_process_data_crank_post = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_process_data_crank_post = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4435925371546902489, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_process_data_crank_post, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* @process_data_crank_post to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_process_data_crank_post to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_set_bottom_pointers = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_set_bottom_pointers = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3518815762907482126, i64 79703496384, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_set_bottom_pointers, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_set_wraparound_pointers = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_set_wraparound_pointers = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1325100639890206496, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_set_wraparound_pointers, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [13 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [266 x i8] c"\87\02\00jinit_d_main_controller\01tmp1.ll:start_pass_main\01tmp1.ll:alloc_funny_pointers\01tmp1.ll:process_data_context_main\01tmp1.ll:make_funny_pointers\01tmp1.ll:process_data_simple_main\01tmp1.ll:process_data_crank_post\01tmp1.ll:set_bottom_pointers\01tmp1.ll:set_wraparound_pointers", section "__llvm_prf_names"
@llvm.used = appending global [11 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_d_main_controller to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_alloc_funny_pointers to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_data_context_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_make_funny_pointers to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_data_simple_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_data_crank_post to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_set_bottom_pointers to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_set_wraparound_pointers to i8*), i8* bitcast ([13 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([266 x i8], [266 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jinit_d_main_controller(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.my_main_controller*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.jpeg_component_info*, align 8
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
  call void @__llvm_profile_instrument_target(i64 %17, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_d_main_controller to i8*), i32 0)
  %18 = call i8* %14(%struct.jpeg_common_struct* %16, i32 1, i64 136)
  %19 = bitcast i8* %18 to %struct.my_main_controller*
  store %struct.my_main_controller* %19, %struct.my_main_controller** %5, align 8
  %20 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %21 = bitcast %struct.my_main_controller* %20 to %struct.jpeg_d_main_controller*
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 74
  store %struct.jpeg_d_main_controller* %21, %struct.jpeg_d_main_controller** %23, align 8
  %24 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %25 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %24, i32 0, i32 0
  %26 = getelementptr inbounds %struct.jpeg_d_main_controller, %struct.jpeg_d_main_controller* %25, i32 0, i32 0
  store void (%struct.jpeg_decompress_struct*, i32)* @start_pass_main, void (%struct.jpeg_decompress_struct*, i32)** %26, align 8
  %27 = load i32, i32* %4, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %43

; <label>:29:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_main_controller, i64 0, i64 1)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_main_controller, i64 0, i64 1)
  %31 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %31, i32 0, i32 0
  %33 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %33, i32 0, i32 5
  store i32 4, i32* %34, align 8
  %35 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %35, i32 0, i32 0
  %37 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %37, i32 0, i32 0
  %39 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %38, align 8
  %40 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %41 = bitcast %struct.jpeg_decompress_struct* %40 to %struct.jpeg_common_struct*
  %42 = ptrtoint void (%struct.jpeg_common_struct*)* %39 to i64
  call void @__llvm_profile_instrument_target(i64 %42, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_d_main_controller to i8*), i32 1)
  call void %39(%struct.jpeg_common_struct* %41)
  br label %43

; <label>:43:                                     ; preds = %29, %2
  %44 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %44, i32 0, i32 81
  %46 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %45, align 8
  %47 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %46, i32 0, i32 2
  %48 = load i32, i32* %47, align 8
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %76

; <label>:50:                                     ; preds = %43
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 59
  %53 = load i32, i32* %52, align 4
  %54 = icmp slt i32 %53, 2
  br i1 %54, label %55, label %69

; <label>:55:                                     ; preds = %50
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_main_controller, i64 0, i64 4)
  %56 = add i64 %pgocount1, 1
  store i64 %56, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_main_controller, i64 0, i64 4)
  %57 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %57, i32 0, i32 0
  %59 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %60 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %59, i32 0, i32 5
  store i32 46, i32* %60, align 8
  %61 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %62 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %61, i32 0, i32 0
  %63 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %62, align 8
  %64 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %63, i32 0, i32 0
  %65 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %64, align 8
  %66 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %67 = bitcast %struct.jpeg_decompress_struct* %66 to %struct.jpeg_common_struct*
  %68 = ptrtoint void (%struct.jpeg_common_struct*)* %65 to i64
  call void @__llvm_profile_instrument_target(i64 %68, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_d_main_controller to i8*), i32 2)
  call void %65(%struct.jpeg_common_struct* %67)
  br label %69

; <label>:69:                                     ; preds = %55, %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_main_controller, i64 0, i64 2)
  %70 = add i64 %pgocount2, 1
  store i64 %70, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_main_controller, i64 0, i64 2)
  %71 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  call void @alloc_funny_pointers(%struct.jpeg_decompress_struct* %71)
  %72 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %72, i32 0, i32 59
  %74 = load i32, i32* %73, align 4
  %75 = add nsw i32 %74, 2
  store i32 %75, i32* %8, align 4
  br label %81

; <label>:76:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_main_controller, i64 0, i64 3)
  %77 = add i64 %pgocount3, 1
  store i64 %77, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_main_controller, i64 0, i64 3)
  %78 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %78, i32 0, i32 59
  %80 = load i32, i32* %79, align 4
  store i32 %80, i32* %8, align 4
  br label %81

; <label>:81:                                     ; preds = %76, %69
  store i32 0, i32* %6, align 4
  %82 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %83 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %82, i32 0, i32 43
  %84 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %83, align 8
  store %struct.jpeg_component_info* %84, %struct.jpeg_component_info** %9, align 8
  br label %85

; <label>:85:                                     ; preds = %127, %81
  %86 = load i32, i32* %6, align 4
  %87 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %88 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %87, i32 0, i32 8
  %89 = load i32, i32* %88, align 8
  %90 = icmp slt i32 %86, %89
  br i1 %90, label %91, label %133

; <label>:91:                                     ; preds = %85
  %92 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %9, align 8
  %93 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %92, i32 0, i32 3
  %94 = load i32, i32* %93, align 4
  %95 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %9, align 8
  %96 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %95, i32 0, i32 9
  %97 = load i32, i32* %96, align 4
  %98 = mul nsw i32 %94, %97
  %99 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %100 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %99, i32 0, i32 59
  %101 = load i32, i32* %100, align 4
  %102 = sdiv i32 %98, %101
  store i32 %102, i32* %7, align 4
  %103 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %104 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %103, i32 0, i32 1
  %105 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %104, align 8
  %106 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %105, i32 0, i32 2
  %107 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %106, align 8
  %108 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %109 = bitcast %struct.jpeg_decompress_struct* %108 to %struct.jpeg_common_struct*
  %110 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %9, align 8
  %111 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %110, i32 0, i32 7
  %112 = load i32, i32* %111, align 4
  %113 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %9, align 8
  %114 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %113, i32 0, i32 9
  %115 = load i32, i32* %114, align 4
  %116 = mul i32 %112, %115
  %117 = load i32, i32* %7, align 4
  %118 = load i32, i32* %8, align 4
  %119 = mul nsw i32 %117, %118
  %120 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %107 to i64
  call void @__llvm_profile_instrument_target(i64 %120, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_d_main_controller to i8*), i32 3)
  %121 = call i8** %107(%struct.jpeg_common_struct* %109, i32 1, i32 %116, i32 %119)
  %122 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %123 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %122, i32 0, i32 1
  %124 = load i32, i32* %6, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [10 x i8**], [10 x i8**]* %123, i64 0, i64 %125
  store i8** %121, i8*** %126, align 8
  br label %127

; <label>:127:                                    ; preds = %91
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_main_controller, i64 0, i64 0)
  %128 = add i64 %pgocount4, 1
  store i64 %128, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_main_controller, i64 0, i64 0)
  %129 = load i32, i32* %6, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, i32* %6, align 4
  %131 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %9, align 8
  %132 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %131, i32 1
  store %struct.jpeg_component_info* %132, %struct.jpeg_component_info** %9, align 8
  br label %85

; <label>:133:                                    ; preds = %85
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_main(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.my_main_controller*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %6, i32 0, i32 74
  %8 = load %struct.jpeg_d_main_controller*, %struct.jpeg_d_main_controller** %7, align 8
  %9 = bitcast %struct.jpeg_d_main_controller* %8 to %struct.my_main_controller*
  store %struct.my_main_controller* %9, %struct.my_main_controller** %5, align 8
  %10 = load i32, i32* %4, align 4
  switch i32 %10, label %45 [
    i32 0, label %11
    i32 2, label %40
  ]

; <label>:11:                                     ; preds = %2
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %12, i32 0, i32 81
  %14 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %14, i32 0, i32 2
  %16 = load i32, i32* %15, align 8
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %30

; <label>:18:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_pass_main, i64 0, i64 2)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_pass_main, i64 0, i64 2)
  %20 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %21 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %20, i32 0, i32 0
  %22 = getelementptr inbounds %struct.jpeg_d_main_controller, %struct.jpeg_d_main_controller* %21, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* @process_data_context_main, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)** %22, align 8
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  call void @make_funny_pointers(%struct.jpeg_decompress_struct* %23)
  %24 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %25 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %24, i32 0, i32 5
  store i32 0, i32* %25, align 8
  %26 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %27 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %26, i32 0, i32 6
  store i32 0, i32* %27, align 4
  %28 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %29 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %28, i32 0, i32 8
  store i32 0, i32* %29, align 4
  br label %35

; <label>:30:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_pass_main, i64 0, i64 3)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_pass_main, i64 0, i64 3)
  %32 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %33 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %32, i32 0, i32 0
  %34 = getelementptr inbounds %struct.jpeg_d_main_controller, %struct.jpeg_d_main_controller* %33, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* @process_data_simple_main, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)** %34, align 8
  br label %35

; <label>:35:                                     ; preds = %30, %18
  %36 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %37 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %36, i32 0, i32 2
  store i32 0, i32* %37, align 8
  %38 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %39 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %38, i32 0, i32 3
  store i32 0, i32* %39, align 4
  br label %59

; <label>:40:                                     ; preds = %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_pass_main, i64 0, i64 0)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_pass_main, i64 0, i64 0)
  %42 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %43 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %42, i32 0, i32 0
  %44 = getelementptr inbounds %struct.jpeg_d_main_controller, %struct.jpeg_d_main_controller* %43, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* @process_data_crank_post, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)** %44, align 8
  br label %59

; <label>:45:                                     ; preds = %2
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_pass_main, i64 0, i64 1)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_pass_main, i64 0, i64 1)
  %47 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %47, i32 0, i32 0
  %49 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %48, align 8
  %50 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %49, i32 0, i32 5
  store i32 4, i32* %50, align 8
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 0
  %53 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %53, i32 0, i32 0
  %55 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %54, align 8
  %56 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %57 = bitcast %struct.jpeg_decompress_struct* %56 to %struct.jpeg_common_struct*
  %58 = ptrtoint void (%struct.jpeg_common_struct*)* %55 to i64
  call void @__llvm_profile_instrument_target(i64 %58, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_main to i8*), i32 0)
  call void %55(%struct.jpeg_common_struct* %57)
  br label %59

; <label>:59:                                     ; preds = %45, %40, %35
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @alloc_funny_pointers(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_main_controller*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.jpeg_component_info*, align 8
  %8 = alloca i8**, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %9 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %9, i32 0, i32 74
  %11 = load %struct.jpeg_d_main_controller*, %struct.jpeg_d_main_controller** %10, align 8
  %12 = bitcast %struct.jpeg_d_main_controller* %11 to %struct.my_main_controller*
  store %struct.my_main_controller* %12, %struct.my_main_controller** %3, align 8
  %13 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %13, i32 0, i32 59
  %15 = load i32, i32* %14, align 4
  store i32 %15, i32* %6, align 4
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 1
  %18 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %18, i32 0, i32 0
  %20 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %19, align 8
  %21 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %22 = bitcast %struct.jpeg_decompress_struct* %21 to %struct.jpeg_common_struct*
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %23, i32 0, i32 8
  %25 = load i32, i32* %24, align 8
  %26 = mul nsw i32 %25, 2
  %27 = sext i32 %26 to i64
  %28 = mul i64 %27, 8
  %29 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %20 to i64
  call void @__llvm_profile_instrument_target(i64 %29, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_alloc_funny_pointers to i8*), i32 0)
  %30 = call i8* %20(%struct.jpeg_common_struct* %22, i32 1, i64 %28)
  %31 = bitcast i8* %30 to i8***
  %32 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %33 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %32, i32 0, i32 4
  %34 = getelementptr inbounds [2 x i8***], [2 x i8***]* %33, i64 0, i64 0
  store i8*** %31, i8**** %34, align 8
  %35 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %36 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %35, i32 0, i32 4
  %37 = getelementptr inbounds [2 x i8***], [2 x i8***]* %36, i64 0, i64 0
  %38 = load i8***, i8**** %37, align 8
  %39 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %39, i32 0, i32 8
  %41 = load i32, i32* %40, align 8
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8**, i8*** %38, i64 %42
  %44 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %45 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %44, i32 0, i32 4
  %46 = getelementptr inbounds [2 x i8***], [2 x i8***]* %45, i64 0, i64 1
  store i8*** %43, i8**** %46, align 8
  store i32 0, i32* %4, align 4
  %47 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %47, i32 0, i32 43
  %49 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %48, align 8
  store %struct.jpeg_component_info* %49, %struct.jpeg_component_info** %7, align 8
  br label %50

; <label>:50:                                     ; preds = %112, %1
  %51 = load i32, i32* %4, align 4
  %52 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %52, i32 0, i32 8
  %54 = load i32, i32* %53, align 8
  %55 = icmp slt i32 %51, %54
  br i1 %55, label %56, label %118

; <label>:56:                                     ; preds = %50
  %57 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %58 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %57, i32 0, i32 3
  %59 = load i32, i32* %58, align 4
  %60 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %61 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %60, i32 0, i32 9
  %62 = load i32, i32* %61, align 4
  %63 = mul nsw i32 %59, %62
  %64 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %65 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %64, i32 0, i32 59
  %66 = load i32, i32* %65, align 4
  %67 = sdiv i32 %63, %66
  store i32 %67, i32* %5, align 4
  %68 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %69 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %68, i32 0, i32 1
  %70 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %69, align 8
  %71 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %70, i32 0, i32 0
  %72 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %71, align 8
  %73 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %74 = bitcast %struct.jpeg_decompress_struct* %73 to %struct.jpeg_common_struct*
  %75 = load i32, i32* %5, align 4
  %76 = load i32, i32* %6, align 4
  %77 = add nsw i32 %76, 4
  %78 = mul nsw i32 %75, %77
  %79 = mul nsw i32 2, %78
  %80 = sext i32 %79 to i64
  %81 = mul i64 %80, 8
  %82 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %72 to i64
  call void @__llvm_profile_instrument_target(i64 %82, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_alloc_funny_pointers to i8*), i32 1)
  %83 = call i8* %72(%struct.jpeg_common_struct* %74, i32 1, i64 %81)
  %84 = bitcast i8* %83 to i8**
  store i8** %84, i8*** %8, align 8
  %85 = load i32, i32* %5, align 4
  %86 = load i8**, i8*** %8, align 8
  %87 = sext i32 %85 to i64
  %88 = getelementptr inbounds i8*, i8** %86, i64 %87
  store i8** %88, i8*** %8, align 8
  %89 = load i8**, i8*** %8, align 8
  %90 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %91 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %90, i32 0, i32 4
  %92 = getelementptr inbounds [2 x i8***], [2 x i8***]* %91, i64 0, i64 0
  %93 = load i8***, i8**** %92, align 8
  %94 = load i32, i32* %4, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8**, i8*** %93, i64 %95
  store i8** %89, i8*** %96, align 8
  %97 = load i32, i32* %5, align 4
  %98 = load i32, i32* %6, align 4
  %99 = add nsw i32 %98, 4
  %100 = mul nsw i32 %97, %99
  %101 = load i8**, i8*** %8, align 8
  %102 = sext i32 %100 to i64
  %103 = getelementptr inbounds i8*, i8** %101, i64 %102
  store i8** %103, i8*** %8, align 8
  %104 = load i8**, i8*** %8, align 8
  %105 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %106 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %105, i32 0, i32 4
  %107 = getelementptr inbounds [2 x i8***], [2 x i8***]* %106, i64 0, i64 1
  %108 = load i8***, i8**** %107, align 8
  %109 = load i32, i32* %4, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8**, i8*** %108, i64 %110
  store i8** %104, i8*** %111, align 8
  br label %112

; <label>:112:                                    ; preds = %56
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_alloc_funny_pointers, i64 0, i64 0)
  %113 = add i64 %pgocount, 1
  store i64 %113, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_alloc_funny_pointers, i64 0, i64 0)
  %114 = load i32, i32* %4, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, i32* %4, align 4
  %116 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %117 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %116, i32 1
  store %struct.jpeg_component_info* %117, %struct.jpeg_component_info** %7, align 8
  br label %50

; <label>:118:                                    ; preds = %50
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_alloc_funny_pointers, i64 0, i64 1)
  %119 = add i64 %pgocount1, 1
  store i64 %119, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_alloc_funny_pointers, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @process_data_context_main(%struct.jpeg_decompress_struct*, i8**, i32*, i32) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.my_main_controller*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store i8** %1, i8*** %6, align 8
  store i32* %2, i32** %7, align 8
  store i32 %3, i32* %8, align 4
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %10, i32 0, i32 74
  %12 = load %struct.jpeg_d_main_controller*, %struct.jpeg_d_main_controller** %11, align 8
  %13 = bitcast %struct.jpeg_d_main_controller* %12 to %struct.my_main_controller*
  store %struct.my_main_controller* %13, %struct.my_main_controller** %9, align 8
  %14 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %15 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %14, i32 0, i32 2
  %16 = load i32, i32* %15, align 8
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %46, label %18

; <label>:18:                                     ; preds = %4
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 75
  %21 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %21, i32 0, i32 3
  %23 = load i32 (%struct.jpeg_decompress_struct*, i8***)*, i32 (%struct.jpeg_decompress_struct*, i8***)** %22, align 8
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %25 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %26 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %25, i32 0, i32 4
  %27 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %28 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %27, i32 0, i32 5
  %29 = load i32, i32* %28, align 8
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [2 x i8***], [2 x i8***]* %26, i64 0, i64 %30
  %32 = load i8***, i8**** %31, align 8
  %33 = ptrtoint i32 (%struct.jpeg_decompress_struct*, i8***)* %23 to i64
  call void @__llvm_profile_instrument_target(i64 %33, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_data_context_main to i8*), i32 0)
  %34 = call i32 %23(%struct.jpeg_decompress_struct* %24, i8*** %32)
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %38, label %36

; <label>:36:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 5)
  %37 = add i64 %pgocount, 1
  store i64 %37, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 5)
  br label %180

; <label>:38:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 4)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 4)
  %40 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %41 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %40, i32 0, i32 2
  store i32 1, i32* %41, align 8
  %42 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %43 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %42, i32 0, i32 8
  %44 = load i32, i32* %43, align 4
  %45 = add i32 %44, 1
  store i32 %45, i32* %43, align 4
  br label %46

; <label>:46:                                     ; preds = %38, %4
  %47 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %48 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %47, i32 0, i32 6
  %49 = load i32, i32* %48, align 4
  switch i32 %49, label %180 [
    i32 2, label %50
    i32 0, label %94
    i32 1, label %117
  ]

; <label>:50:                                     ; preds = %46
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 76
  %53 = load %struct.jpeg_d_post_controller*, %struct.jpeg_d_post_controller** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_d_post_controller, %struct.jpeg_d_post_controller* %53, i32 0, i32 1
  %55 = load void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %54, align 8
  %56 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %57 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %58 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %57, i32 0, i32 4
  %59 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %60 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %59, i32 0, i32 5
  %61 = load i32, i32* %60, align 8
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [2 x i8***], [2 x i8***]* %58, i64 0, i64 %62
  %64 = load i8***, i8**** %63, align 8
  %65 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %66 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %65, i32 0, i32 3
  %67 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %68 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %67, i32 0, i32 7
  %69 = load i32, i32* %68, align 8
  %70 = load i8**, i8*** %6, align 8
  %71 = load i32*, i32** %7, align 8
  %72 = load i32, i32* %8, align 4
  %73 = ptrtoint void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* %55 to i64
  call void @__llvm_profile_instrument_target(i64 %73, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_data_context_main to i8*), i32 1)
  call void %55(%struct.jpeg_decompress_struct* %56, i8*** %64, i32* %66, i32 %69, i8** %70, i32* %71, i32 %72)
  %74 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %75 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %74, i32 0, i32 3
  %76 = load i32, i32* %75, align 4
  %77 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %78 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %77, i32 0, i32 7
  %79 = load i32, i32* %78, align 8
  %80 = icmp ult i32 %76, %79
  br i1 %80, label %81, label %83

; <label>:81:                                     ; preds = %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 8)
  %82 = add i64 %pgocount2, 1
  store i64 %82, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 8)
  br label %180

; <label>:83:                                     ; preds = %50
  %84 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %85 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %84, i32 0, i32 6
  store i32 0, i32* %85, align 4
  %86 = load i32*, i32** %7, align 8
  %87 = load i32, i32* %86, align 4
  %88 = load i32, i32* %8, align 4
  %89 = icmp uge i32 %87, %88
  br i1 %89, label %90, label %92

; <label>:90:                                     ; preds = %83
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 9)
  %91 = add i64 %pgocount3, 1
  store i64 %91, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 9)
  br label %180

; <label>:92:                                     ; preds = %83
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 10)
  %93 = add i64 %pgocount4, 1
  store i64 %93, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 10)
  br label %94

; <label>:94:                                     ; preds = %92, %46
  %95 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %96 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %95, i32 0, i32 3
  store i32 0, i32* %96, align 4
  %97 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %98 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %97, i32 0, i32 59
  %99 = load i32, i32* %98, align 4
  %100 = sub nsw i32 %99, 1
  %101 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %102 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %101, i32 0, i32 7
  store i32 %100, i32* %102, align 8
  %103 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %104 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %103, i32 0, i32 8
  %105 = load i32, i32* %104, align 4
  %106 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %107 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %106, i32 0, i32 60
  %108 = load i32, i32* %107, align 8
  %109 = icmp eq i32 %105, %108
  br i1 %109, label %110, label %113

; <label>:110:                                    ; preds = %94
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 6)
  %111 = add i64 %pgocount5, 1
  store i64 %111, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 6)
  %112 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  call void @set_bottom_pointers(%struct.jpeg_decompress_struct* %112)
  br label %113

; <label>:113:                                    ; preds = %110, %94
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 1)
  %114 = add i64 %pgocount6, 1
  store i64 %114, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 1)
  %115 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %116 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %115, i32 0, i32 6
  store i32 1, i32* %116, align 4
  br label %117

; <label>:117:                                    ; preds = %113, %46
  %118 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %119 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %118, i32 0, i32 76
  %120 = load %struct.jpeg_d_post_controller*, %struct.jpeg_d_post_controller** %119, align 8
  %121 = getelementptr inbounds %struct.jpeg_d_post_controller, %struct.jpeg_d_post_controller* %120, i32 0, i32 1
  %122 = load void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %121, align 8
  %123 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %124 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %125 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %124, i32 0, i32 4
  %126 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %127 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %126, i32 0, i32 5
  %128 = load i32, i32* %127, align 8
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [2 x i8***], [2 x i8***]* %125, i64 0, i64 %129
  %131 = load i8***, i8**** %130, align 8
  %132 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %133 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %132, i32 0, i32 3
  %134 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %135 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %134, i32 0, i32 7
  %136 = load i32, i32* %135, align 8
  %137 = load i8**, i8*** %6, align 8
  %138 = load i32*, i32** %7, align 8
  %139 = load i32, i32* %8, align 4
  %140 = ptrtoint void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* %122 to i64
  call void @__llvm_profile_instrument_target(i64 %140, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_data_context_main to i8*), i32 2)
  call void %122(%struct.jpeg_decompress_struct* %123, i8*** %131, i32* %133, i32 %136, i8** %137, i32* %138, i32 %139)
  %141 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %142 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %141, i32 0, i32 3
  %143 = load i32, i32* %142, align 4
  %144 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %145 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %144, i32 0, i32 7
  %146 = load i32, i32* %145, align 8
  %147 = icmp ult i32 %143, %146
  br i1 %147, label %148, label %150

; <label>:148:                                    ; preds = %117
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 2)
  %149 = add i64 %pgocount7, 1
  store i64 %149, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 2)
  br label %180

; <label>:150:                                    ; preds = %117
  %151 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %152 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %151, i32 0, i32 8
  %153 = load i32, i32* %152, align 4
  %154 = icmp eq i32 %153, 1
  br i1 %154, label %155, label %158

; <label>:155:                                    ; preds = %150
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 7)
  %156 = add i64 %pgocount8, 1
  store i64 %156, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 7)
  %157 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  call void @set_wraparound_pointers(%struct.jpeg_decompress_struct* %157)
  br label %158

; <label>:158:                                    ; preds = %155, %150
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 3)
  %159 = add i64 %pgocount9, 1
  store i64 %159, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 3)
  %160 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %161 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %160, i32 0, i32 5
  %162 = load i32, i32* %161, align 8
  %163 = xor i32 %162, 1
  store i32 %163, i32* %161, align 8
  %164 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %165 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %164, i32 0, i32 2
  store i32 0, i32* %165, align 8
  %166 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %167 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %166, i32 0, i32 59
  %168 = load i32, i32* %167, align 4
  %169 = add nsw i32 %168, 1
  %170 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %171 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %170, i32 0, i32 3
  store i32 %169, i32* %171, align 4
  %172 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %173 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %172, i32 0, i32 59
  %174 = load i32, i32* %173, align 4
  %175 = add nsw i32 %174, 2
  %176 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %177 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %176, i32 0, i32 7
  store i32 %175, i32* %177, align 8
  %178 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %179 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %178, i32 0, i32 6
  store i32 2, i32* %179, align 4
  br label %180

; <label>:180:                                    ; preds = %158, %148, %90, %81, %46, %36
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 0)
  %181 = add i64 %pgocount10, 1
  store i64 %181, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_process_data_context_main, i64 0, i64 0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @make_funny_pointers(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_main_controller*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.jpeg_component_info*, align 8
  %9 = alloca i8**, align 8
  %10 = alloca i8**, align 8
  %11 = alloca i8**, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %12, i32 0, i32 74
  %14 = load %struct.jpeg_d_main_controller*, %struct.jpeg_d_main_controller** %13, align 8
  %15 = bitcast %struct.jpeg_d_main_controller* %14 to %struct.my_main_controller*
  store %struct.my_main_controller* %15, %struct.my_main_controller** %3, align 8
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 59
  %18 = load i32, i32* %17, align 4
  store i32 %18, i32* %7, align 4
  store i32 0, i32* %4, align 4
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 43
  %21 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  store %struct.jpeg_component_info* %21, %struct.jpeg_component_info** %8, align 8
  br label %22

; <label>:22:                                     ; preds = %154, %1
  %23 = load i32, i32* %4, align 4
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 8
  %26 = load i32, i32* %25, align 8
  %27 = icmp slt i32 %23, %26
  br i1 %27, label %28, label %160

; <label>:28:                                     ; preds = %22
  %29 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %30 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %29, i32 0, i32 3
  %31 = load i32, i32* %30, align 4
  %32 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %33 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %32, i32 0, i32 9
  %34 = load i32, i32* %33, align 4
  %35 = mul nsw i32 %31, %34
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 59
  %38 = load i32, i32* %37, align 4
  %39 = sdiv i32 %35, %38
  store i32 %39, i32* %6, align 4
  %40 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %41 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %40, i32 0, i32 4
  %42 = getelementptr inbounds [2 x i8***], [2 x i8***]* %41, i64 0, i64 0
  %43 = load i8***, i8**** %42, align 8
  %44 = load i32, i32* %4, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8**, i8*** %43, i64 %45
  %47 = load i8**, i8*** %46, align 8
  store i8** %47, i8*** %10, align 8
  %48 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %49 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %48, i32 0, i32 4
  %50 = getelementptr inbounds [2 x i8***], [2 x i8***]* %49, i64 0, i64 1
  %51 = load i8***, i8**** %50, align 8
  %52 = load i32, i32* %4, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8**, i8*** %51, i64 %53
  %55 = load i8**, i8*** %54, align 8
  store i8** %55, i8*** %11, align 8
  %56 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %57 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %56, i32 0, i32 1
  %58 = load i32, i32* %4, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [10 x i8**], [10 x i8**]* %57, i64 0, i64 %59
  %61 = load i8**, i8*** %60, align 8
  store i8** %61, i8*** %9, align 8
  store i32 0, i32* %5, align 4
  br label %62

; <label>:62:                                     ; preds = %83, %28
  %63 = load i32, i32* %5, align 4
  %64 = load i32, i32* %6, align 4
  %65 = load i32, i32* %7, align 4
  %66 = add nsw i32 %65, 2
  %67 = mul nsw i32 %64, %66
  %68 = icmp slt i32 %63, %67
  br i1 %68, label %69, label %87

; <label>:69:                                     ; preds = %62
  %70 = load i8**, i8*** %9, align 8
  %71 = load i32, i32* %5, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i8*, i8** %70, i64 %72
  %74 = load i8*, i8** %73, align 8
  %75 = load i8**, i8*** %11, align 8
  %76 = load i32, i32* %5, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i8*, i8** %75, i64 %77
  store i8* %74, i8** %78, align 8
  %79 = load i8**, i8*** %10, align 8
  %80 = load i32, i32* %5, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i8*, i8** %79, i64 %81
  store i8* %74, i8** %82, align 8
  br label %83

; <label>:83:                                     ; preds = %69
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_make_funny_pointers, i64 0, i64 0)
  %84 = add i64 %pgocount, 1
  store i64 %84, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_make_funny_pointers, i64 0, i64 0)
  %85 = load i32, i32* %5, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, i32* %5, align 4
  br label %62

; <label>:87:                                     ; preds = %62
  store i32 0, i32* %5, align 4
  br label %88

; <label>:88:                                     ; preds = %130, %87
  %89 = load i32, i32* %5, align 4
  %90 = load i32, i32* %6, align 4
  %91 = mul nsw i32 %90, 2
  %92 = icmp slt i32 %89, %91
  br i1 %92, label %93, label %134

; <label>:93:                                     ; preds = %88
  %94 = load i8**, i8*** %9, align 8
  %95 = load i32, i32* %6, align 4
  %96 = load i32, i32* %7, align 4
  %97 = mul nsw i32 %95, %96
  %98 = load i32, i32* %5, align 4
  %99 = add nsw i32 %97, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i8*, i8** %94, i64 %100
  %102 = load i8*, i8** %101, align 8
  %103 = load i8**, i8*** %11, align 8
  %104 = load i32, i32* %6, align 4
  %105 = load i32, i32* %7, align 4
  %106 = sub nsw i32 %105, 2
  %107 = mul nsw i32 %104, %106
  %108 = load i32, i32* %5, align 4
  %109 = add nsw i32 %107, %108
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8*, i8** %103, i64 %110
  store i8* %102, i8** %111, align 8
  %112 = load i8**, i8*** %9, align 8
  %113 = load i32, i32* %6, align 4
  %114 = load i32, i32* %7, align 4
  %115 = sub nsw i32 %114, 2
  %116 = mul nsw i32 %113, %115
  %117 = load i32, i32* %5, align 4
  %118 = add nsw i32 %116, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i8*, i8** %112, i64 %119
  %121 = load i8*, i8** %120, align 8
  %122 = load i8**, i8*** %11, align 8
  %123 = load i32, i32* %6, align 4
  %124 = load i32, i32* %7, align 4
  %125 = mul nsw i32 %123, %124
  %126 = load i32, i32* %5, align 4
  %127 = add nsw i32 %125, %126
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i8*, i8** %122, i64 %128
  store i8* %121, i8** %129, align 8
  br label %130

; <label>:130:                                    ; preds = %93
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_make_funny_pointers, i64 0, i64 1)
  %131 = add i64 %pgocount1, 1
  store i64 %131, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_make_funny_pointers, i64 0, i64 1)
  %132 = load i32, i32* %5, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %5, align 4
  br label %88

; <label>:134:                                    ; preds = %88
  store i32 0, i32* %5, align 4
  br label %135

; <label>:135:                                    ; preds = %149, %134
  %136 = load i32, i32* %5, align 4
  %137 = load i32, i32* %6, align 4
  %138 = icmp slt i32 %136, %137
  br i1 %138, label %139, label %153

; <label>:139:                                    ; preds = %135
  %140 = load i8**, i8*** %10, align 8
  %141 = getelementptr inbounds i8*, i8** %140, i64 0
  %142 = load i8*, i8** %141, align 8
  %143 = load i8**, i8*** %10, align 8
  %144 = load i32, i32* %5, align 4
  %145 = load i32, i32* %6, align 4
  %146 = sub nsw i32 %144, %145
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds i8*, i8** %143, i64 %147
  store i8* %142, i8** %148, align 8
  br label %149

; <label>:149:                                    ; preds = %139
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_make_funny_pointers, i64 0, i64 2)
  %150 = add i64 %pgocount2, 1
  store i64 %150, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_make_funny_pointers, i64 0, i64 2)
  %151 = load i32, i32* %5, align 4
  %152 = add nsw i32 %151, 1
  store i32 %152, i32* %5, align 4
  br label %135

; <label>:153:                                    ; preds = %135
  br label %154

; <label>:154:                                    ; preds = %153
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_make_funny_pointers, i64 0, i64 3)
  %155 = add i64 %pgocount3, 1
  store i64 %155, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_make_funny_pointers, i64 0, i64 3)
  %156 = load i32, i32* %4, align 4
  %157 = add nsw i32 %156, 1
  store i32 %157, i32* %4, align 4
  %158 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %159 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %158, i32 1
  store %struct.jpeg_component_info* %159, %struct.jpeg_component_info** %8, align 8
  br label %22

; <label>:160:                                    ; preds = %22
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_make_funny_pointers, i64 0, i64 4)
  %161 = add i64 %pgocount4, 1
  store i64 %161, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_make_funny_pointers, i64 0, i64 4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @process_data_simple_main(%struct.jpeg_decompress_struct*, i8**, i32*, i32) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.my_main_controller*, align 8
  %10 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store i8** %1, i8*** %6, align 8
  store i32* %2, i32** %7, align 8
  store i32 %3, i32* %8, align 4
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %11, i32 0, i32 74
  %13 = load %struct.jpeg_d_main_controller*, %struct.jpeg_d_main_controller** %12, align 8
  %14 = bitcast %struct.jpeg_d_main_controller* %13 to %struct.my_main_controller*
  store %struct.my_main_controller* %14, %struct.my_main_controller** %9, align 8
  %15 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %16 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %15, i32 0, i32 2
  %17 = load i32, i32* %16, align 8
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %38, label %19

; <label>:19:                                     ; preds = %4
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %20, i32 0, i32 75
  %22 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %22, i32 0, i32 3
  %24 = load i32 (%struct.jpeg_decompress_struct*, i8***)*, i32 (%struct.jpeg_decompress_struct*, i8***)** %23, align 8
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %26 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %27 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %26, i32 0, i32 1
  %28 = getelementptr inbounds [10 x i8**], [10 x i8**]* %27, i32 0, i32 0
  %29 = ptrtoint i32 (%struct.jpeg_decompress_struct*, i8***)* %24 to i64
  call void @__llvm_profile_instrument_target(i64 %29, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_data_simple_main to i8*), i32 0)
  %30 = call i32 %24(%struct.jpeg_decompress_struct* %25, i8*** %28)
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %34, label %32

; <label>:32:                                     ; preds = %19
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 3)
  %33 = add i64 %pgocount, 1
  store i64 %33, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 3)
  br label %69

; <label>:34:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 2)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 2)
  %36 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %37 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %36, i32 0, i32 2
  store i32 1, i32* %37, align 8
  br label %38

; <label>:38:                                     ; preds = %34, %4
  %39 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %39, i32 0, i32 59
  %41 = load i32, i32* %40, align 4
  store i32 %41, i32* %10, align 4
  %42 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %42, i32 0, i32 76
  %44 = load %struct.jpeg_d_post_controller*, %struct.jpeg_d_post_controller** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_d_post_controller, %struct.jpeg_d_post_controller* %44, i32 0, i32 1
  %46 = load void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %45, align 8
  %47 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %48 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %49 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %48, i32 0, i32 1
  %50 = getelementptr inbounds [10 x i8**], [10 x i8**]* %49, i32 0, i32 0
  %51 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %52 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %51, i32 0, i32 3
  %53 = load i32, i32* %10, align 4
  %54 = load i8**, i8*** %6, align 8
  %55 = load i32*, i32** %7, align 8
  %56 = load i32, i32* %8, align 4
  %57 = ptrtoint void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* %46 to i64
  call void @__llvm_profile_instrument_target(i64 %57, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_data_simple_main to i8*), i32 1)
  call void %46(%struct.jpeg_decompress_struct* %47, i8*** %50, i32* %52, i32 %53, i8** %54, i32* %55, i32 %56)
  %58 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %59 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %58, i32 0, i32 3
  %60 = load i32, i32* %59, align 4
  %61 = load i32, i32* %10, align 4
  %62 = icmp uge i32 %60, %61
  br i1 %62, label %63, label %69

; <label>:63:                                     ; preds = %38
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 1)
  %64 = add i64 %pgocount2, 1
  store i64 %64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 1)
  %65 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %66 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %65, i32 0, i32 2
  store i32 0, i32* %66, align 8
  %67 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %68 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %67, i32 0, i32 3
  store i32 0, i32* %68, align 4
  br label %69

; <label>:69:                                     ; preds = %63, %38, %32
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 0)
  %70 = add i64 %pgocount3, 1
  store i64 %70, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @process_data_crank_post(%struct.jpeg_decompress_struct*, i8**, i32*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_process_data_crank_post, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_process_data_crank_post, i64 0, i64 0)
  %6 = alloca %struct.jpeg_decompress_struct*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %6, align 8
  store i8** %1, i8*** %7, align 8
  store i32* %2, i32** %8, align 8
  store i32 %3, i32* %9, align 4
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %10, i32 0, i32 76
  %12 = load %struct.jpeg_d_post_controller*, %struct.jpeg_d_post_controller** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_d_post_controller, %struct.jpeg_d_post_controller* %12, i32 0, i32 1
  %14 = load void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %13, align 8
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %16 = load i8**, i8*** %7, align 8
  %17 = load i32*, i32** %8, align 8
  %18 = load i32, i32* %9, align 4
  %19 = ptrtoint void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* %14 to i64
  call void @__llvm_profile_instrument_target(i64 %19, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_data_crank_post to i8*), i32 0)
  call void %14(%struct.jpeg_decompress_struct* %15, i8*** null, i32* null, i32 0, i8** %16, i32* %17, i32 %18)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @set_bottom_pointers(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_main_controller*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.jpeg_component_info*, align 8
  %10 = alloca i8**, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %11, i32 0, i32 74
  %13 = load %struct.jpeg_d_main_controller*, %struct.jpeg_d_main_controller** %12, align 8
  %14 = bitcast %struct.jpeg_d_main_controller* %13 to %struct.my_main_controller*
  store %struct.my_main_controller* %14, %struct.my_main_controller** %3, align 8
  store i32 0, i32* %4, align 4
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 43
  %17 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  store %struct.jpeg_component_info* %17, %struct.jpeg_component_info** %9, align 8
  br label %18

; <label>:18:                                     ; preds = %95, %1
  %19 = load i32, i32* %4, align 4
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %20, i32 0, i32 8
  %22 = load i32, i32* %21, align 8
  %23 = icmp slt i32 %19, %22
  br i1 %23, label %24, label %101

; <label>:24:                                     ; preds = %18
  %25 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %9, align 8
  %26 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %25, i32 0, i32 3
  %27 = load i32, i32* %26, align 4
  %28 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %9, align 8
  %29 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %28, i32 0, i32 9
  %30 = load i32, i32* %29, align 4
  %31 = mul nsw i32 %27, %30
  store i32 %31, i32* %7, align 4
  %32 = load i32, i32* %7, align 4
  %33 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %33, i32 0, i32 59
  %35 = load i32, i32* %34, align 4
  %36 = sdiv i32 %32, %35
  store i32 %36, i32* %6, align 4
  %37 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %9, align 8
  %38 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %37, i32 0, i32 11
  %39 = load i32, i32* %38, align 4
  %40 = load i32, i32* %7, align 4
  %41 = urem i32 %39, %40
  store i32 %41, i32* %8, align 4
  %42 = load i32, i32* %8, align 4
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %47

; <label>:44:                                     ; preds = %24
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_set_bottom_pointers, i64 0, i64 2)
  %45 = add i64 %pgocount, 1
  store i64 %45, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_set_bottom_pointers, i64 0, i64 2)
  %46 = load i32, i32* %7, align 4
  store i32 %46, i32* %8, align 4
  br label %47

; <label>:47:                                     ; preds = %44, %24
  %48 = load i32, i32* %4, align 4
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %59

; <label>:50:                                     ; preds = %47
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_set_bottom_pointers, i64 0, i64 3)
  %51 = add i64 %pgocount1, 1
  store i64 %51, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_set_bottom_pointers, i64 0, i64 3)
  %52 = load i32, i32* %8, align 4
  %53 = sub nsw i32 %52, 1
  %54 = load i32, i32* %6, align 4
  %55 = sdiv i32 %53, %54
  %56 = add nsw i32 %55, 1
  %57 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %58 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %57, i32 0, i32 7
  store i32 %56, i32* %58, align 8
  br label %59

; <label>:59:                                     ; preds = %50, %47
  %60 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %61 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %60, i32 0, i32 4
  %62 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %63 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %62, i32 0, i32 5
  %64 = load i32, i32* %63, align 8
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [2 x i8***], [2 x i8***]* %61, i64 0, i64 %65
  %67 = load i8***, i8**** %66, align 8
  %68 = load i32, i32* %4, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8**, i8*** %67, i64 %69
  %71 = load i8**, i8*** %70, align 8
  store i8** %71, i8*** %10, align 8
  store i32 0, i32* %5, align 4
  br label %72

; <label>:72:                                     ; preds = %90, %59
  %73 = load i32, i32* %5, align 4
  %74 = load i32, i32* %6, align 4
  %75 = mul nsw i32 %74, 2
  %76 = icmp slt i32 %73, %75
  br i1 %76, label %77, label %94

; <label>:77:                                     ; preds = %72
  %78 = load i8**, i8*** %10, align 8
  %79 = load i32, i32* %8, align 4
  %80 = sub nsw i32 %79, 1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i8*, i8** %78, i64 %81
  %83 = load i8*, i8** %82, align 8
  %84 = load i8**, i8*** %10, align 8
  %85 = load i32, i32* %8, align 4
  %86 = load i32, i32* %5, align 4
  %87 = add nsw i32 %85, %86
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i8*, i8** %84, i64 %88
  store i8* %83, i8** %89, align 8
  br label %90

; <label>:90:                                     ; preds = %77
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_set_bottom_pointers, i64 0, i64 0)
  %91 = add i64 %pgocount2, 1
  store i64 %91, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_set_bottom_pointers, i64 0, i64 0)
  %92 = load i32, i32* %5, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %5, align 4
  br label %72

; <label>:94:                                     ; preds = %72
  br label %95

; <label>:95:                                     ; preds = %94
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_set_bottom_pointers, i64 0, i64 1)
  %96 = add i64 %pgocount3, 1
  store i64 %96, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_set_bottom_pointers, i64 0, i64 1)
  %97 = load i32, i32* %4, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %4, align 4
  %99 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %9, align 8
  %100 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %99, i32 1
  store %struct.jpeg_component_info* %100, %struct.jpeg_component_info** %9, align 8
  br label %18

; <label>:101:                                    ; preds = %18
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_set_bottom_pointers, i64 0, i64 4)
  %102 = add i64 %pgocount4, 1
  store i64 %102, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_set_bottom_pointers, i64 0, i64 4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @set_wraparound_pointers(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_main_controller*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.jpeg_component_info*, align 8
  %9 = alloca i8**, align 8
  %10 = alloca i8**, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %11, i32 0, i32 74
  %13 = load %struct.jpeg_d_main_controller*, %struct.jpeg_d_main_controller** %12, align 8
  %14 = bitcast %struct.jpeg_d_main_controller* %13 to %struct.my_main_controller*
  store %struct.my_main_controller* %14, %struct.my_main_controller** %3, align 8
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 59
  %17 = load i32, i32* %16, align 4
  store i32 %17, i32* %7, align 4
  store i32 0, i32* %4, align 4
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 43
  %20 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  store %struct.jpeg_component_info* %20, %struct.jpeg_component_info** %8, align 8
  br label %21

; <label>:21:                                     ; preds = %125, %1
  %22 = load i32, i32* %4, align 4
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %23, i32 0, i32 8
  %25 = load i32, i32* %24, align 8
  %26 = icmp slt i32 %22, %25
  br i1 %26, label %27, label %131

; <label>:27:                                     ; preds = %21
  %28 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %29 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %28, i32 0, i32 3
  %30 = load i32, i32* %29, align 4
  %31 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %32 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %31, i32 0, i32 9
  %33 = load i32, i32* %32, align 4
  %34 = mul nsw i32 %30, %33
  %35 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %35, i32 0, i32 59
  %37 = load i32, i32* %36, align 4
  %38 = sdiv i32 %34, %37
  store i32 %38, i32* %6, align 4
  %39 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %40 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %39, i32 0, i32 4
  %41 = getelementptr inbounds [2 x i8***], [2 x i8***]* %40, i64 0, i64 0
  %42 = load i8***, i8**** %41, align 8
  %43 = load i32, i32* %4, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8**, i8*** %42, i64 %44
  %46 = load i8**, i8*** %45, align 8
  store i8** %46, i8*** %9, align 8
  %47 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %48 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %47, i32 0, i32 4
  %49 = getelementptr inbounds [2 x i8***], [2 x i8***]* %48, i64 0, i64 1
  %50 = load i8***, i8**** %49, align 8
  %51 = load i32, i32* %4, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8**, i8*** %50, i64 %52
  %54 = load i8**, i8*** %53, align 8
  store i8** %54, i8*** %10, align 8
  store i32 0, i32* %5, align 4
  br label %55

; <label>:55:                                     ; preds = %120, %27
  %56 = load i32, i32* %5, align 4
  %57 = load i32, i32* %6, align 4
  %58 = icmp slt i32 %56, %57
  br i1 %58, label %59, label %124

; <label>:59:                                     ; preds = %55
  %60 = load i8**, i8*** %9, align 8
  %61 = load i32, i32* %6, align 4
  %62 = load i32, i32* %7, align 4
  %63 = add nsw i32 %62, 1
  %64 = mul nsw i32 %61, %63
  %65 = load i32, i32* %5, align 4
  %66 = add nsw i32 %64, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8*, i8** %60, i64 %67
  %69 = load i8*, i8** %68, align 8
  %70 = load i8**, i8*** %9, align 8
  %71 = load i32, i32* %5, align 4
  %72 = load i32, i32* %6, align 4
  %73 = sub nsw i32 %71, %72
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8*, i8** %70, i64 %74
  store i8* %69, i8** %75, align 8
  %76 = load i8**, i8*** %10, align 8
  %77 = load i32, i32* %6, align 4
  %78 = load i32, i32* %7, align 4
  %79 = add nsw i32 %78, 1
  %80 = mul nsw i32 %77, %79
  %81 = load i32, i32* %5, align 4
  %82 = add nsw i32 %80, %81
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8*, i8** %76, i64 %83
  %85 = load i8*, i8** %84, align 8
  %86 = load i8**, i8*** %10, align 8
  %87 = load i32, i32* %5, align 4
  %88 = load i32, i32* %6, align 4
  %89 = sub nsw i32 %87, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i8*, i8** %86, i64 %90
  store i8* %85, i8** %91, align 8
  %92 = load i8**, i8*** %9, align 8
  %93 = load i32, i32* %5, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i8*, i8** %92, i64 %94
  %96 = load i8*, i8** %95, align 8
  %97 = load i8**, i8*** %9, align 8
  %98 = load i32, i32* %6, align 4
  %99 = load i32, i32* %7, align 4
  %100 = add nsw i32 %99, 2
  %101 = mul nsw i32 %98, %100
  %102 = load i32, i32* %5, align 4
  %103 = add nsw i32 %101, %102
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i8*, i8** %97, i64 %104
  store i8* %96, i8** %105, align 8
  %106 = load i8**, i8*** %10, align 8
  %107 = load i32, i32* %5, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i8*, i8** %106, i64 %108
  %110 = load i8*, i8** %109, align 8
  %111 = load i8**, i8*** %10, align 8
  %112 = load i32, i32* %6, align 4
  %113 = load i32, i32* %7, align 4
  %114 = add nsw i32 %113, 2
  %115 = mul nsw i32 %112, %114
  %116 = load i32, i32* %5, align 4
  %117 = add nsw i32 %115, %116
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i8*, i8** %111, i64 %118
  store i8* %110, i8** %119, align 8
  br label %120

; <label>:120:                                    ; preds = %59
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_set_wraparound_pointers, i64 0, i64 0)
  %121 = add i64 %pgocount, 1
  store i64 %121, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_set_wraparound_pointers, i64 0, i64 0)
  %122 = load i32, i32* %5, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %5, align 4
  br label %55

; <label>:124:                                    ; preds = %55
  br label %125

; <label>:125:                                    ; preds = %124
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_set_wraparound_pointers, i64 0, i64 1)
  %126 = add i64 %pgocount1, 1
  store i64 %126, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_set_wraparound_pointers, i64 0, i64 1)
  %127 = load i32, i32* %4, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, i32* %4, align 4
  %129 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %130 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %129, i32 1
  store %struct.jpeg_component_info* %130, %struct.jpeg_component_info** %8, align 8
  br label %21

; <label>:131:                                    ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_set_wraparound_pointers, i64 0, i64 2)
  %132 = add i64 %pgocount2, 1
  store i64 %132, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_set_wraparound_pointers, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #1

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

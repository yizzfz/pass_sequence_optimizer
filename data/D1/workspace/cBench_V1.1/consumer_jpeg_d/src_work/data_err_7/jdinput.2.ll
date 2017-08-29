; ModuleID = 'tmp1.ll'
source_filename = "jdinput.c"
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
%struct.my_input_controller = type { %struct.jpeg_input_controller, i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_input_controller = private constant [22 x i8] c"jinit_input_controller"
@__profn_tmp1.ll_consume_markers = private constant [23 x i8] c"tmp1.ll:consume_markers"
@__profn_tmp1.ll_reset_input_controller = private constant [30 x i8] c"tmp1.ll:reset_input_controller"
@__profn_tmp1.ll_start_input_pass = private constant [24 x i8] c"tmp1.ll:start_input_pass"
@__profn_tmp1.ll_finish_input_pass = private constant [25 x i8] c"tmp1.ll:finish_input_pass"
@__profn_tmp1.ll_initial_setup = private constant [21 x i8] c"tmp1.ll:initial_setup"
@__profn_tmp1.ll_per_scan_setup = private constant [22 x i8] c"tmp1.ll:per_scan_setup"
@__profn_tmp1.ll_latch_quant_tables = private constant [26 x i8] c"tmp1.ll:latch_quant_tables"
@__profc_jinit_input_controller = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_input_controller = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_input_controller = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -845398651522021219, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_input_controller, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @jinit_input_controller to i8*), i8* bitcast ([1 x i64]* @__profvp_jinit_input_controller to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_consume_markers = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_consume_markers = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_consume_markers = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1965980691209706553, i64 844557698592195, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*)* @consume_markers to i8*), i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_consume_markers to i8*), i32 10, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_reset_input_controller = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_reset_input_controller = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_reset_input_controller = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1884797343180426701, i64 562962838323199, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_reset_input_controller, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @reset_input_controller to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_reset_input_controller to i8*), i32 1, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_input_pass = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_input_pass = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_input_pass = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8654036061110059940, i64 562962838323199, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_input_pass, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @start_input_pass to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_start_input_pass to i8*), i32 1, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_input_pass = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_finish_input_pass = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6691490969383419060, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_input_pass, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @finish_input_pass to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_initial_setup = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_initial_setup = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_initial_setup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7911921014449640895, i64 1126100793975787, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i32 0, i32 0), i8* null, i8* bitcast ([4 x i64]* @__profvp_tmp1.ll_initial_setup to i8*), i32 15, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_per_scan_setup = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_per_scan_setup = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_per_scan_setup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5859956703037387580, i64 563089449272881, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_per_scan_setup to i8*), i32 10, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_latch_quant_tables = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_latch_quant_tables = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_latch_quant_tables = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5861544412965211672, i64 563024323973641, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_latch_quant_tables, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_latch_quant_tables to i8*), i32 6, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [16 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [203 x i8] c"\C8\01\00jinit_input_controller\01tmp1.ll:consume_markers\01tmp1.ll:reset_input_controller\01tmp1.ll:start_input_pass\01tmp1.ll:finish_input_pass\01tmp1.ll:initial_setup\01tmp1.ll:per_scan_setup\01tmp1.ll:latch_quant_tables", section "__llvm_prf_names"
@llvm.used = appending global [10 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_input_controller to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_consume_markers to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_reset_input_controller to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_pass to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_input_pass to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_initial_setup to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_per_scan_setup to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_latch_quant_tables to i8*), i8* bitcast ([16 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([203 x i8], [203 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jinit_input_controller(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_input_controller, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_input_controller, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.my_input_controller*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 1
  %7 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %7, i32 0, i32 0
  %9 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %8, align 8
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %11 = bitcast %struct.jpeg_decompress_struct* %10 to %struct.jpeg_common_struct*
  %12 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %9 to i64
  call void @__llvm_profile_instrument_target(i64 %12, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_input_controller to i8*), i32 0)
  %13 = call i8* %9(%struct.jpeg_common_struct* %11, i32 0, i64 48)
  %14 = bitcast i8* %13 to %struct.my_input_controller*
  store %struct.my_input_controller* %14, %struct.my_input_controller** %4, align 8
  %15 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %16 = bitcast %struct.my_input_controller* %15 to %struct.jpeg_input_controller*
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 77
  store %struct.jpeg_input_controller* %16, %struct.jpeg_input_controller** %18, align 8
  %19 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %20 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %20, i32 0, i32 0
  store i32 (%struct.jpeg_decompress_struct*)* @consume_markers, i32 (%struct.jpeg_decompress_struct*)** %21, align 8
  %22 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %23 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %22, i32 0, i32 0
  %24 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %23, i32 0, i32 1
  %25 = bitcast {}** %24 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @reset_input_controller, void (%struct.jpeg_decompress_struct*)** %25, align 8
  %26 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %27 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %26, i32 0, i32 0
  %28 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %27, i32 0, i32 2
  %29 = bitcast {}** %28 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_input_pass, void (%struct.jpeg_decompress_struct*)** %29, align 8
  %30 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %31 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %30, i32 0, i32 0
  %32 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %31, i32 0, i32 3
  %33 = bitcast {}** %32 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @finish_input_pass, void (%struct.jpeg_decompress_struct*)** %33, align 8
  %34 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %35 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %34, i32 0, i32 0
  %36 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %35, i32 0, i32 4
  store i32 0, i32* %36, align 8
  %37 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %38 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %37, i32 0, i32 0
  %39 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %38, i32 0, i32 5
  store i32 0, i32* %39, align 4
  %40 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %41 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %40, i32 0, i32 1
  store i32 1, i32* %41, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @consume_markers(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.my_input_controller*, align 8
  %5 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %6, i32 0, i32 77
  %8 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %7, align 8
  %9 = bitcast %struct.jpeg_input_controller* %8 to %struct.my_input_controller*
  store %struct.my_input_controller* %9, %struct.my_input_controller** %4, align 8
  %10 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %11 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %10, i32 0, i32 0
  %12 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %11, i32 0, i32 5
  %13 = load i32, i32* %12, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 0)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 0)
  store i32 2, i32* %2, align 4
  br label %115

; <label>:17:                                     ; preds = %1
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 78
  %20 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %20, i32 0, i32 1
  %22 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %21, align 8
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %24 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %22 to i64
  call void @__llvm_profile_instrument_target(i64 %24, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_consume_markers to i8*), i32 0)
  %25 = call i32 %22(%struct.jpeg_decompress_struct* %23)
  store i32 %25, i32* %5, align 4
  %26 = load i32, i32* %5, align 4
  switch i32 %26, label %112 [
    i32 1, label %27
    i32 2, label %61
    i32 0, label %110
  ]

; <label>:27:                                     ; preds = %17
  %28 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %29 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %28, i32 0, i32 1
  %30 = load i32, i32* %29, align 8
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %37

; <label>:32:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 3)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 3)
  %34 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  call void @initial_setup(%struct.jpeg_decompress_struct* %34)
  %35 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %36 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %35, i32 0, i32 1
  store i32 0, i32* %36, align 8
  br label %60

; <label>:37:                                     ; preds = %27
  %38 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %39 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %38, i32 0, i32 0
  %40 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %39, i32 0, i32 4
  %41 = load i32, i32* %40, align 8
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %57, label %43

; <label>:43:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 9)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 9)
  %45 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %45, i32 0, i32 0
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i32 0, i32 5
  store i32 34, i32* %48, align 8
  %49 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %50 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %49, i32 0, i32 0
  %51 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %50, align 8
  %52 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %51, i32 0, i32 0
  %53 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %52, align 8
  %54 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %55 = bitcast %struct.jpeg_decompress_struct* %54 to %struct.jpeg_common_struct*
  %56 = ptrtoint void (%struct.jpeg_common_struct*)* %53 to i64
  call void @__llvm_profile_instrument_target(i64 %56, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_consume_markers to i8*), i32 1)
  call void %53(%struct.jpeg_common_struct* %55)
  br label %57

; <label>:57:                                     ; preds = %43, %37
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 5)
  %58 = add i64 %pgocount3, 1
  store i64 %58, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 5)
  %59 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  call void @start_input_pass(%struct.jpeg_decompress_struct* %59)
  br label %60

; <label>:60:                                     ; preds = %57, %32
  br label %112

; <label>:61:                                     ; preds = %17
  %62 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %63 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %62, i32 0, i32 0
  %64 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %63, i32 0, i32 5
  store i32 1, i32* %64, align 4
  %65 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %66 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %65, i32 0, i32 1
  %67 = load i32, i32* %66, align 8
  %68 = icmp ne i32 %67, 0
  br i1 %68, label %69, label %92

; <label>:69:                                     ; preds = %61
  %70 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %71 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %70, i32 0, i32 78
  %72 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %71, align 8
  %73 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %72, i32 0, i32 6
  %74 = load i32, i32* %73, align 4
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %90

; <label>:76:                                     ; preds = %69
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 6)
  %77 = add i64 %pgocount4, 1
  store i64 %77, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 6)
  %78 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %78, i32 0, i32 0
  %80 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %79, align 8
  %81 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %80, i32 0, i32 5
  store i32 58, i32* %81, align 8
  %82 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %83 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %82, i32 0, i32 0
  %84 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %83, align 8
  %85 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %84, i32 0, i32 0
  %86 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %85, align 8
  %87 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %88 = bitcast %struct.jpeg_decompress_struct* %87 to %struct.jpeg_common_struct*
  %89 = ptrtoint void (%struct.jpeg_common_struct*)* %86 to i64
  call void @__llvm_profile_instrument_target(i64 %89, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_consume_markers to i8*), i32 2)
  call void %86(%struct.jpeg_common_struct* %88)
  br label %90

; <label>:90:                                     ; preds = %76, %69
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 4)
  %91 = add i64 %pgocount5, 1
  store i64 %91, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 4)
  br label %109

; <label>:92:                                     ; preds = %61
  %93 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %94 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %93, i32 0, i32 36
  %95 = load i32, i32* %94, align 4
  %96 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %97 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %96, i32 0, i32 34
  %98 = load i32, i32* %97, align 4
  %99 = icmp sgt i32 %95, %98
  br i1 %99, label %100, label %107

; <label>:100:                                    ; preds = %92
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 8)
  %101 = add i64 %pgocount6, 1
  store i64 %101, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 8)
  %102 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %103 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %102, i32 0, i32 34
  %104 = load i32, i32* %103, align 4
  %105 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %106 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %105, i32 0, i32 36
  store i32 %104, i32* %106, align 4
  br label %107

; <label>:107:                                    ; preds = %100, %92
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 7)
  %108 = add i64 %pgocount7, 1
  store i64 %108, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 7)
  br label %109

; <label>:109:                                    ; preds = %107, %90
  br label %112

; <label>:110:                                    ; preds = %17
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 2)
  %111 = add i64 %pgocount8, 1
  store i64 %111, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 2)
  br label %112

; <label>:112:                                    ; preds = %110, %109, %60, %17
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 1)
  %113 = add i64 %pgocount9, 1
  store i64 %113, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_consume_markers, i64 0, i64 1)
  %114 = load i32, i32* %5, align 4
  store i32 %114, i32* %2, align 4
  br label %115

; <label>:115:                                    ; preds = %112, %15
  %116 = load i32, i32* %2, align 4
  ret i32 %116
}

; Function Attrs: noinline nounwind uwtable
define internal void @reset_input_controller(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_reset_input_controller, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_reset_input_controller, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.my_input_controller*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 77
  %7 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %6, align 8
  %8 = bitcast %struct.jpeg_input_controller* %7 to %struct.my_input_controller*
  store %struct.my_input_controller* %8, %struct.my_input_controller** %4, align 8
  %9 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %10 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %9, i32 0, i32 0
  %11 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %10, i32 0, i32 0
  store i32 (%struct.jpeg_decompress_struct*)* @consume_markers, i32 (%struct.jpeg_decompress_struct*)** %11, align 8
  %12 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %13 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %12, i32 0, i32 0
  %14 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %13, i32 0, i32 4
  store i32 0, i32* %14, align 8
  %15 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %16 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %15, i32 0, i32 0
  %17 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %16, i32 0, i32 5
  store i32 0, i32* %17, align 4
  %18 = load %struct.my_input_controller*, %struct.my_input_controller** %4, align 8
  %19 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %18, i32 0, i32 1
  store i32 1, i32* %19, align 8
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %20, i32 0, i32 0
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i32 0, i32 4
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %26 = bitcast %struct.jpeg_decompress_struct* %25 to %struct.jpeg_common_struct*
  %27 = ptrtoint void (%struct.jpeg_common_struct*)* %24 to i64
  call void @__llvm_profile_instrument_target(i64 %27, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_reset_input_controller to i8*), i32 0)
  call void %24(%struct.jpeg_common_struct* %26)
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %28, i32 0, i32 78
  %30 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %30, i32 0, i32 0
  %32 = bitcast {}** %31 to void (%struct.jpeg_decompress_struct*)**
  %33 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %32, align 8
  %34 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %35 = ptrtoint void (%struct.jpeg_decompress_struct*)* %33 to i64
  call void @__llvm_profile_instrument_target(i64 %35, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_reset_input_controller to i8*), i32 1)
  call void %33(%struct.jpeg_decompress_struct* %34)
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 38
  store [64 x i32]* null, [64 x i32]** %37, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_input_pass(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_input_pass, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_input_pass, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  call void @per_scan_setup(%struct.jpeg_decompress_struct* %4)
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  call void @latch_quant_tables(%struct.jpeg_decompress_struct* %5)
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %6, i32 0, i32 79
  %8 = load %struct.jpeg_entropy_decoder*, %struct.jpeg_entropy_decoder** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_entropy_decoder, %struct.jpeg_entropy_decoder* %8, i32 0, i32 0
  %10 = bitcast {}** %9 to void (%struct.jpeg_decompress_struct*)**
  %11 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %10, align 8
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %13 = ptrtoint void (%struct.jpeg_decompress_struct*)* %11 to i64
  call void @__llvm_profile_instrument_target(i64 %13, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_pass to i8*), i32 0)
  call void %11(%struct.jpeg_decompress_struct* %12)
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 75
  %16 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %16, i32 0, i32 0
  %18 = bitcast {}** %17 to void (%struct.jpeg_decompress_struct*)**
  %19 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %18, align 8
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %21 = ptrtoint void (%struct.jpeg_decompress_struct*)* %19 to i64
  call void @__llvm_profile_instrument_target(i64 %21, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_pass to i8*), i32 1)
  call void %19(%struct.jpeg_decompress_struct* %20)
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 75
  %24 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %24, i32 0, i32 1
  %26 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %25, align 8
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %27, i32 0, i32 77
  %29 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %28, align 8
  %30 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %29, i32 0, i32 0
  store i32 (%struct.jpeg_decompress_struct*)* %26, i32 (%struct.jpeg_decompress_struct*)** %30, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_input_pass(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_input_pass, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_input_pass, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 77
  %6 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %6, i32 0, i32 0
  store i32 (%struct.jpeg_decompress_struct*)* @consume_markers, i32 (%struct.jpeg_decompress_struct*)** %7, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @initial_setup(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 7
  %7 = load i32, i32* %6, align 4
  %8 = zext i32 %7 to i64
  %9 = icmp sgt i64 %8, 65500
  br i1 %9, label %17, label %10

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 10)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 10)
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %12, i32 0, i32 6
  %14 = load i32, i32* %13, align 8
  %15 = zext i32 %14 to i64
  %16 = icmp sgt i64 %15, 65500
  br i1 %16, label %17, label %37

; <label>:17:                                     ; preds = %10, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 9)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 9)
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 0
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i32 0, i32 5
  store i32 40, i32* %22, align 8
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %23, i32 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i32 0, i32 6
  %27 = bitcast %union.anon* %26 to [8 x i32]*
  %28 = getelementptr inbounds [8 x i32], [8 x i32]* %27, i64 0, i64 0
  store i32 65500, i32* %28, align 4
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %29, i32 0, i32 0
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i32 0, i32 0
  %33 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %32, align 8
  %34 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %35 = bitcast %struct.jpeg_decompress_struct* %34 to %struct.jpeg_common_struct*
  %36 = ptrtoint void (%struct.jpeg_common_struct*)* %33 to i64
  call void @__llvm_profile_instrument_target(i64 %36, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_initial_setup to i8*), i32 0)
  call void %33(%struct.jpeg_common_struct* %35)
  br label %37

; <label>:37:                                     ; preds = %17, %10
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %38, i32 0, i32 42
  %40 = load i32, i32* %39, align 8
  %41 = icmp ne i32 %40, 8
  br i1 %41, label %42, label %65

; <label>:42:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 11)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 11)
  %44 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %44, i32 0, i32 0
  %46 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %45, align 8
  %47 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %46, i32 0, i32 5
  store i32 13, i32* %47, align 8
  %48 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %49 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %48, i32 0, i32 42
  %50 = load i32, i32* %49, align 8
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 0
  %53 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %53, i32 0, i32 6
  %55 = bitcast %union.anon* %54 to [8 x i32]*
  %56 = getelementptr inbounds [8 x i32], [8 x i32]* %55, i64 0, i64 0
  store i32 %50, i32* %56, align 4
  %57 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %57, i32 0, i32 0
  %59 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %60 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %59, i32 0, i32 0
  %61 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %60, align 8
  %62 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %63 = bitcast %struct.jpeg_decompress_struct* %62 to %struct.jpeg_common_struct*
  %64 = ptrtoint void (%struct.jpeg_common_struct*)* %61 to i64
  call void @__llvm_profile_instrument_target(i64 %64, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_initial_setup to i8*), i32 1)
  call void %61(%struct.jpeg_common_struct* %63)
  br label %65

; <label>:65:                                     ; preds = %42, %37
  %66 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %67 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %66, i32 0, i32 8
  %68 = load i32, i32* %67, align 8
  %69 = icmp sgt i32 %68, 10
  br i1 %69, label %70, label %99

; <label>:70:                                     ; preds = %65
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 12)
  %71 = add i64 %pgocount3, 1
  store i64 %71, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 12)
  %72 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %72, i32 0, i32 0
  %74 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %73, align 8
  %75 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %74, i32 0, i32 5
  store i32 24, i32* %75, align 8
  %76 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %76, i32 0, i32 8
  %78 = load i32, i32* %77, align 8
  %79 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %80 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %79, i32 0, i32 0
  %81 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %82 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %81, i32 0, i32 6
  %83 = bitcast %union.anon* %82 to [8 x i32]*
  %84 = getelementptr inbounds [8 x i32], [8 x i32]* %83, i64 0, i64 0
  store i32 %78, i32* %84, align 4
  %85 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %86 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %85, i32 0, i32 0
  %87 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %86, align 8
  %88 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %87, i32 0, i32 6
  %89 = bitcast %union.anon* %88 to [8 x i32]*
  %90 = getelementptr inbounds [8 x i32], [8 x i32]* %89, i64 0, i64 1
  store i32 10, i32* %90, align 4
  %91 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %92 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %91, i32 0, i32 0
  %93 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %92, align 8
  %94 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %93, i32 0, i32 0
  %95 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %94, align 8
  %96 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %97 = bitcast %struct.jpeg_decompress_struct* %96 to %struct.jpeg_common_struct*
  %98 = ptrtoint void (%struct.jpeg_common_struct*)* %95 to i64
  call void @__llvm_profile_instrument_target(i64 %98, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_initial_setup to i8*), i32 2)
  call void %95(%struct.jpeg_common_struct* %97)
  br label %99

; <label>:99:                                     ; preds = %70, %65
  %100 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %101 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %100, i32 0, i32 57
  store i32 1, i32* %101, align 4
  %102 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %103 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %102, i32 0, i32 58
  store i32 1, i32* %103, align 8
  store i32 0, i32* %3, align 4
  %104 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %105 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %104, i32 0, i32 43
  %106 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %105, align 8
  store %struct.jpeg_component_info* %106, %struct.jpeg_component_info** %4, align 8
  br label %107

; <label>:107:                                    ; preds = %192, %99
  %108 = load i32, i32* %3, align 4
  %109 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %110 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %109, i32 0, i32 8
  %111 = load i32, i32* %110, align 8
  %112 = icmp slt i32 %108, %111
  br i1 %112, label %113, label %197

; <label>:113:                                    ; preds = %107
  %114 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %115 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %114, i32 0, i32 2
  %116 = load i32, i32* %115, align 8
  %117 = icmp sle i32 %116, 0
  br i1 %117, label %136, label %118

; <label>:118:                                    ; preds = %113
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 2)
  %119 = add i64 %pgocount4, 1
  store i64 %119, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 2)
  %120 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %121 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %120, i32 0, i32 2
  %122 = load i32, i32* %121, align 8
  %123 = icmp sgt i32 %122, 4
  br i1 %123, label %136, label %124

; <label>:124:                                    ; preds = %118
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 6)
  %125 = add i64 %pgocount5, 1
  store i64 %125, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 6)
  %126 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %127 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %126, i32 0, i32 3
  %128 = load i32, i32* %127, align 4
  %129 = icmp sle i32 %128, 0
  br i1 %129, label %136, label %130

; <label>:130:                                    ; preds = %124
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 7)
  %131 = add i64 %pgocount6, 1
  store i64 %131, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 7)
  %132 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %133 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %132, i32 0, i32 3
  %134 = load i32, i32* %133, align 4
  %135 = icmp sgt i32 %134, 4
  br i1 %135, label %136, label %150

; <label>:136:                                    ; preds = %130, %124, %118, %113
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 1)
  %137 = add i64 %pgocount7, 1
  store i64 %137, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 1)
  %138 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %139 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %138, i32 0, i32 0
  %140 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %139, align 8
  %141 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %140, i32 0, i32 5
  store i32 16, i32* %141, align 8
  %142 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %143 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %142, i32 0, i32 0
  %144 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %143, align 8
  %145 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %144, i32 0, i32 0
  %146 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %145, align 8
  %147 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %148 = bitcast %struct.jpeg_decompress_struct* %147 to %struct.jpeg_common_struct*
  %149 = ptrtoint void (%struct.jpeg_common_struct*)* %146 to i64
  call void @__llvm_profile_instrument_target(i64 %149, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_initial_setup to i8*), i32 3)
  call void %146(%struct.jpeg_common_struct* %148)
  br label %150

; <label>:150:                                    ; preds = %136, %130
  %151 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %152 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %151, i32 0, i32 57
  %153 = load i32, i32* %152, align 4
  %154 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %155 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %154, i32 0, i32 2
  %156 = load i32, i32* %155, align 8
  %157 = icmp sgt i32 %153, %156
  br i1 %157, label %158, label %162

; <label>:158:                                    ; preds = %150
  %159 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %160 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %159, i32 0, i32 57
  %161 = load i32, i32* %160, align 4
  br label %167

; <label>:162:                                    ; preds = %150
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 3)
  %163 = add i64 %pgocount8, 1
  store i64 %163, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 3)
  %164 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %165 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %164, i32 0, i32 2
  %166 = load i32, i32* %165, align 8
  br label %167

; <label>:167:                                    ; preds = %162, %158
  %168 = phi i32 [ %161, %158 ], [ %166, %162 ]
  %169 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %170 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %169, i32 0, i32 57
  store i32 %168, i32* %170, align 4
  %171 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %172 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %171, i32 0, i32 58
  %173 = load i32, i32* %172, align 8
  %174 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %175 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %174, i32 0, i32 3
  %176 = load i32, i32* %175, align 4
  %177 = icmp sgt i32 %173, %176
  br i1 %177, label %178, label %183

; <label>:178:                                    ; preds = %167
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 4)
  %179 = add i64 %pgocount9, 1
  store i64 %179, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 4)
  %180 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %181 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %180, i32 0, i32 58
  %182 = load i32, i32* %181, align 8
  br label %188

; <label>:183:                                    ; preds = %167
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 5)
  %184 = add i64 %pgocount10, 1
  store i64 %184, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 5)
  %185 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %186 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %185, i32 0, i32 3
  %187 = load i32, i32* %186, align 4
  br label %188

; <label>:188:                                    ; preds = %183, %178
  %189 = phi i32 [ %182, %178 ], [ %187, %183 ]
  %190 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %191 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %190, i32 0, i32 58
  store i32 %189, i32* %191, align 8
  br label %192

; <label>:192:                                    ; preds = %188
  %193 = load i32, i32* %3, align 4
  %194 = add nsw i32 %193, 1
  store i32 %194, i32* %3, align 4
  %195 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %196 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %195, i32 1
  store %struct.jpeg_component_info* %196, %struct.jpeg_component_info** %4, align 8
  br label %107

; <label>:197:                                    ; preds = %107
  %198 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %199 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %198, i32 0, i32 59
  store i32 8, i32* %199, align 4
  store i32 0, i32* %3, align 4
  %200 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %201 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %200, i32 0, i32 43
  %202 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %201, align 8
  store %struct.jpeg_component_info* %202, %struct.jpeg_component_info** %4, align 8
  br label %203

; <label>:203:                                    ; preds = %286, %197
  %204 = load i32, i32* %3, align 4
  %205 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %206 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %205, i32 0, i32 8
  %207 = load i32, i32* %206, align 8
  %208 = icmp slt i32 %204, %207
  br i1 %208, label %209, label %292

; <label>:209:                                    ; preds = %203
  %210 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %211 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %210, i32 0, i32 9
  store i32 8, i32* %211, align 4
  %212 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %213 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %212, i32 0, i32 6
  %214 = load i32, i32* %213, align 8
  %215 = zext i32 %214 to i64
  %216 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %217 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %216, i32 0, i32 2
  %218 = load i32, i32* %217, align 8
  %219 = sext i32 %218 to i64
  %220 = mul nsw i64 %215, %219
  %221 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %222 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %221, i32 0, i32 57
  %223 = load i32, i32* %222, align 4
  %224 = mul nsw i32 %223, 8
  %225 = sext i32 %224 to i64
  %226 = call i64 @jdiv_round_up(i64 %220, i64 %225)
  %227 = trunc i64 %226 to i32
  %228 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %229 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %228, i32 0, i32 7
  store i32 %227, i32* %229, align 4
  %230 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %231 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %230, i32 0, i32 7
  %232 = load i32, i32* %231, align 4
  %233 = zext i32 %232 to i64
  %234 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %235 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %234, i32 0, i32 3
  %236 = load i32, i32* %235, align 4
  %237 = sext i32 %236 to i64
  %238 = mul nsw i64 %233, %237
  %239 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %240 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %239, i32 0, i32 58
  %241 = load i32, i32* %240, align 8
  %242 = mul nsw i32 %241, 8
  %243 = sext i32 %242 to i64
  %244 = call i64 @jdiv_round_up(i64 %238, i64 %243)
  %245 = trunc i64 %244 to i32
  %246 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %247 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %246, i32 0, i32 8
  store i32 %245, i32* %247, align 8
  %248 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %249 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %248, i32 0, i32 6
  %250 = load i32, i32* %249, align 8
  %251 = zext i32 %250 to i64
  %252 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %253 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %252, i32 0, i32 2
  %254 = load i32, i32* %253, align 8
  %255 = sext i32 %254 to i64
  %256 = mul nsw i64 %251, %255
  %257 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %258 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %257, i32 0, i32 57
  %259 = load i32, i32* %258, align 4
  %260 = sext i32 %259 to i64
  %261 = call i64 @jdiv_round_up(i64 %256, i64 %260)
  %262 = trunc i64 %261 to i32
  %263 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %264 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %263, i32 0, i32 10
  store i32 %262, i32* %264, align 8
  %265 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %266 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %265, i32 0, i32 7
  %267 = load i32, i32* %266, align 4
  %268 = zext i32 %267 to i64
  %269 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %270 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %269, i32 0, i32 3
  %271 = load i32, i32* %270, align 4
  %272 = sext i32 %271 to i64
  %273 = mul nsw i64 %268, %272
  %274 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %275 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %274, i32 0, i32 58
  %276 = load i32, i32* %275, align 8
  %277 = sext i32 %276 to i64
  %278 = call i64 @jdiv_round_up(i64 %273, i64 %277)
  %279 = trunc i64 %278 to i32
  %280 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %281 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %280, i32 0, i32 11
  store i32 %279, i32* %281, align 4
  %282 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %283 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %282, i32 0, i32 12
  store i32 1, i32* %283, align 8
  %284 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %285 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %284, i32 0, i32 19
  store %struct.JQUANT_TBL* null, %struct.JQUANT_TBL** %285, align 8
  br label %286

; <label>:286:                                    ; preds = %209
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 0)
  %287 = add i64 %pgocount11, 1
  store i64 %287, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 0)
  %288 = load i32, i32* %3, align 4
  %289 = add nsw i32 %288, 1
  store i32 %289, i32* %3, align 4
  %290 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %291 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %290, i32 1
  store %struct.jpeg_component_info* %291, %struct.jpeg_component_info** %4, align 8
  br label %203

; <label>:292:                                    ; preds = %203
  %293 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %294 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %293, i32 0, i32 7
  %295 = load i32, i32* %294, align 4
  %296 = zext i32 %295 to i64
  %297 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %298 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %297, i32 0, i32 58
  %299 = load i32, i32* %298, align 8
  %300 = mul nsw i32 %299, 8
  %301 = sext i32 %300 to i64
  %302 = call i64 @jdiv_round_up(i64 %296, i64 %301)
  %303 = trunc i64 %302 to i32
  %304 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %305 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %304, i32 0, i32 60
  store i32 %303, i32* %305, align 8
  %306 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %307 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %306, i32 0, i32 62
  %308 = load i32, i32* %307, align 8
  %309 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %310 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %309, i32 0, i32 8
  %311 = load i32, i32* %310, align 8
  %312 = icmp slt i32 %308, %311
  br i1 %312, label %319, label %313

; <label>:313:                                    ; preds = %292
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 13)
  %314 = add i64 %pgocount12, 1
  store i64 %314, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 13)
  %315 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %316 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %315, i32 0, i32 44
  %317 = load i32, i32* %316, align 8
  %318 = icmp ne i32 %317, 0
  br i1 %318, label %319, label %325

; <label>:319:                                    ; preds = %313, %292
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 8)
  %320 = add i64 %pgocount13, 1
  store i64 %320, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 8)
  %321 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %322 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %321, i32 0, i32 77
  %323 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %322, align 8
  %324 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %323, i32 0, i32 4
  store i32 1, i32* %324, align 8
  br label %331

; <label>:325:                                    ; preds = %313
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 14)
  %326 = add i64 %pgocount14, 1
  store i64 %326, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 14)
  %327 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %328 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %327, i32 0, i32 77
  %329 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %328, align 8
  %330 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %329, i32 0, i32 4
  store i32 0, i32* %330, align 8
  br label %331

; <label>:331:                                    ; preds = %325, %319
  ret void
}

declare i64 @jdiv_round_up(i64, i64) #1

; Function Attrs: noinline nounwind uwtable
define internal void @per_scan_setup(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %7 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %7, i32 0, i32 62
  %9 = load i32, i32* %8, align 8
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %11, label %63

; <label>:11:                                     ; preds = %1
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %12, i32 0, i32 63
  %14 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %13, i64 0, i64 0
  %15 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %14, align 8
  store %struct.jpeg_component_info* %15, %struct.jpeg_component_info** %6, align 8
  %16 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %17 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %16, i32 0, i32 7
  %18 = load i32, i32* %17, align 4
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 64
  store i32 %18, i32* %20, align 8
  %21 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %22 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %21, i32 0, i32 8
  %23 = load i32, i32* %22, align 8
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 65
  store i32 %23, i32* %25, align 4
  %26 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %27 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %26, i32 0, i32 13
  store i32 1, i32* %27, align 4
  %28 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %29 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %28, i32 0, i32 14
  store i32 1, i32* %29, align 8
  %30 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %31 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %30, i32 0, i32 15
  store i32 1, i32* %31, align 4
  %32 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %33 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %32, i32 0, i32 9
  %34 = load i32, i32* %33, align 4
  %35 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %36 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %35, i32 0, i32 16
  store i32 %34, i32* %36, align 8
  %37 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %38 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %37, i32 0, i32 17
  store i32 1, i32* %38, align 4
  %39 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %40 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %39, i32 0, i32 8
  %41 = load i32, i32* %40, align 8
  %42 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %43 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %42, i32 0, i32 3
  %44 = load i32, i32* %43, align 4
  %45 = urem i32 %41, %44
  store i32 %45, i32* %5, align 4
  %46 = load i32, i32* %5, align 4
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %53

; <label>:48:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 9)
  %49 = add i64 %pgocount, 1
  store i64 %49, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 9)
  %50 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %51 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %50, i32 0, i32 3
  %52 = load i32, i32* %51, align 4
  store i32 %52, i32* %5, align 4
  br label %53

; <label>:53:                                     ; preds = %48, %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 5)
  %54 = add i64 %pgocount1, 1
  store i64 %54, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 5)
  %55 = load i32, i32* %5, align 4
  %56 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %57 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %56, i32 0, i32 18
  store i32 %55, i32* %57, align 8
  %58 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %58, i32 0, i32 66
  store i32 1, i32* %59, align 8
  %60 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %61 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %60, i32 0, i32 67
  %62 = getelementptr inbounds [10 x i32], [10 x i32]* %61, i64 0, i64 0
  store i32 0, i32* %62, align 4
  br label %255

; <label>:63:                                     ; preds = %1
  %64 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %65 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %64, i32 0, i32 62
  %66 = load i32, i32* %65, align 8
  %67 = icmp sle i32 %66, 0
  br i1 %67, label %74, label %68

; <label>:68:                                     ; preds = %63
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 8)
  %69 = add i64 %pgocount2, 1
  store i64 %69, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 8)
  %70 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %71 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %70, i32 0, i32 62
  %72 = load i32, i32* %71, align 8
  %73 = icmp sgt i32 %72, 4
  br i1 %73, label %74, label %103

; <label>:74:                                     ; preds = %68, %63
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 7)
  %75 = add i64 %pgocount3, 1
  store i64 %75, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 7)
  %76 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %76, i32 0, i32 0
  %78 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %77, align 8
  %79 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %78, i32 0, i32 5
  store i32 24, i32* %79, align 8
  %80 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %81 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %80, i32 0, i32 62
  %82 = load i32, i32* %81, align 8
  %83 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %84 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %83, i32 0, i32 0
  %85 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %84, align 8
  %86 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %85, i32 0, i32 6
  %87 = bitcast %union.anon* %86 to [8 x i32]*
  %88 = getelementptr inbounds [8 x i32], [8 x i32]* %87, i64 0, i64 0
  store i32 %82, i32* %88, align 4
  %89 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %90 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %89, i32 0, i32 0
  %91 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %90, align 8
  %92 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %91, i32 0, i32 6
  %93 = bitcast %union.anon* %92 to [8 x i32]*
  %94 = getelementptr inbounds [8 x i32], [8 x i32]* %93, i64 0, i64 1
  store i32 4, i32* %94, align 4
  %95 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %96 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %95, i32 0, i32 0
  %97 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %96, align 8
  %98 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %97, i32 0, i32 0
  %99 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %98, align 8
  %100 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %101 = bitcast %struct.jpeg_decompress_struct* %100 to %struct.jpeg_common_struct*
  %102 = ptrtoint void (%struct.jpeg_common_struct*)* %99 to i64
  call void @__llvm_profile_instrument_target(i64 %102, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_per_scan_setup to i8*), i32 0)
  call void %99(%struct.jpeg_common_struct* %101)
  br label %103

; <label>:103:                                    ; preds = %74, %68
  %104 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %105 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %104, i32 0, i32 6
  %106 = load i32, i32* %105, align 8
  %107 = zext i32 %106 to i64
  %108 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %109 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %108, i32 0, i32 57
  %110 = load i32, i32* %109, align 4
  %111 = mul nsw i32 %110, 8
  %112 = sext i32 %111 to i64
  %113 = call i64 @jdiv_round_up(i64 %107, i64 %112)
  %114 = trunc i64 %113 to i32
  %115 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %116 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %115, i32 0, i32 64
  store i32 %114, i32* %116, align 8
  %117 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %118 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %117, i32 0, i32 7
  %119 = load i32, i32* %118, align 4
  %120 = zext i32 %119 to i64
  %121 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %122 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %121, i32 0, i32 58
  %123 = load i32, i32* %122, align 8
  %124 = mul nsw i32 %123, 8
  %125 = sext i32 %124 to i64
  %126 = call i64 @jdiv_round_up(i64 %120, i64 %125)
  %127 = trunc i64 %126 to i32
  %128 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %129 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %128, i32 0, i32 65
  store i32 %127, i32* %129, align 4
  %130 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %131 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %130, i32 0, i32 66
  store i32 0, i32* %131, align 8
  store i32 0, i32* %3, align 4
  br label %132

; <label>:132:                                    ; preds = %250, %103
  %133 = load i32, i32* %3, align 4
  %134 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %135 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %134, i32 0, i32 62
  %136 = load i32, i32* %135, align 8
  %137 = icmp slt i32 %133, %136
  br i1 %137, label %138, label %253

; <label>:138:                                    ; preds = %132
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 1)
  %139 = add i64 %pgocount4, 1
  store i64 %139, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 1)
  %140 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %141 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %140, i32 0, i32 63
  %142 = load i32, i32* %3, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %141, i64 0, i64 %143
  %145 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %144, align 8
  store %struct.jpeg_component_info* %145, %struct.jpeg_component_info** %6, align 8
  %146 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %147 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %146, i32 0, i32 2
  %148 = load i32, i32* %147, align 8
  %149 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %150 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %149, i32 0, i32 13
  store i32 %148, i32* %150, align 4
  %151 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %152 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %151, i32 0, i32 3
  %153 = load i32, i32* %152, align 4
  %154 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %155 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %154, i32 0, i32 14
  store i32 %153, i32* %155, align 8
  %156 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %157 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %156, i32 0, i32 13
  %158 = load i32, i32* %157, align 4
  %159 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %160 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %159, i32 0, i32 14
  %161 = load i32, i32* %160, align 8
  %162 = mul nsw i32 %158, %161
  %163 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %164 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %163, i32 0, i32 15
  store i32 %162, i32* %164, align 4
  %165 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %166 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %165, i32 0, i32 13
  %167 = load i32, i32* %166, align 4
  %168 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %169 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %168, i32 0, i32 9
  %170 = load i32, i32* %169, align 4
  %171 = mul nsw i32 %167, %170
  %172 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %173 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %172, i32 0, i32 16
  store i32 %171, i32* %173, align 8
  %174 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %175 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %174, i32 0, i32 7
  %176 = load i32, i32* %175, align 4
  %177 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %178 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %177, i32 0, i32 13
  %179 = load i32, i32* %178, align 4
  %180 = urem i32 %176, %179
  store i32 %180, i32* %5, align 4
  %181 = load i32, i32* %5, align 4
  %182 = icmp eq i32 %181, 0
  br i1 %182, label %183, label %188

; <label>:183:                                    ; preds = %138
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 3)
  %184 = add i64 %pgocount5, 1
  store i64 %184, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 3)
  %185 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %186 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %185, i32 0, i32 13
  %187 = load i32, i32* %186, align 4
  store i32 %187, i32* %5, align 4
  br label %188

; <label>:188:                                    ; preds = %183, %138
  %189 = load i32, i32* %5, align 4
  %190 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %191 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %190, i32 0, i32 17
  store i32 %189, i32* %191, align 4
  %192 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %193 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %192, i32 0, i32 8
  %194 = load i32, i32* %193, align 8
  %195 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %196 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %195, i32 0, i32 14
  %197 = load i32, i32* %196, align 8
  %198 = urem i32 %194, %197
  store i32 %198, i32* %5, align 4
  %199 = load i32, i32* %5, align 4
  %200 = icmp eq i32 %199, 0
  br i1 %200, label %201, label %206

; <label>:201:                                    ; preds = %188
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 4)
  %202 = add i64 %pgocount6, 1
  store i64 %202, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 4)
  %203 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %204 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %203, i32 0, i32 14
  %205 = load i32, i32* %204, align 8
  store i32 %205, i32* %5, align 4
  br label %206

; <label>:206:                                    ; preds = %201, %188
  %207 = load i32, i32* %5, align 4
  %208 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %209 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %208, i32 0, i32 18
  store i32 %207, i32* %209, align 8
  %210 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %211 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %210, i32 0, i32 15
  %212 = load i32, i32* %211, align 4
  store i32 %212, i32* %4, align 4
  %213 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %214 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %213, i32 0, i32 66
  %215 = load i32, i32* %214, align 8
  %216 = load i32, i32* %4, align 4
  %217 = add nsw i32 %215, %216
  %218 = icmp sgt i32 %217, 10
  br i1 %218, label %219, label %233

; <label>:219:                                    ; preds = %206
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 2)
  %220 = add i64 %pgocount7, 1
  store i64 %220, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 2)
  %221 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %222 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %221, i32 0, i32 0
  %223 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %222, align 8
  %224 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %223, i32 0, i32 5
  store i32 11, i32* %224, align 8
  %225 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %226 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %225, i32 0, i32 0
  %227 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %226, align 8
  %228 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %227, i32 0, i32 0
  %229 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %228, align 8
  %230 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %231 = bitcast %struct.jpeg_decompress_struct* %230 to %struct.jpeg_common_struct*
  %232 = ptrtoint void (%struct.jpeg_common_struct*)* %229 to i64
  call void @__llvm_profile_instrument_target(i64 %232, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_per_scan_setup to i8*), i32 1)
  call void %229(%struct.jpeg_common_struct* %231)
  br label %233

; <label>:233:                                    ; preds = %219, %206
  br label %234

; <label>:234:                                    ; preds = %238, %233
  %235 = load i32, i32* %4, align 4
  %236 = add nsw i32 %235, -1
  store i32 %236, i32* %4, align 4
  %237 = icmp sgt i32 %235, 0
  br i1 %237, label %238, label %249

; <label>:238:                                    ; preds = %234
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 0)
  %239 = add i64 %pgocount8, 1
  store i64 %239, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 0)
  %240 = load i32, i32* %3, align 4
  %241 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %242 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %241, i32 0, i32 67
  %243 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %244 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %243, i32 0, i32 66
  %245 = load i32, i32* %244, align 8
  %246 = add nsw i32 %245, 1
  store i32 %246, i32* %244, align 8
  %247 = sext i32 %245 to i64
  %248 = getelementptr inbounds [10 x i32], [10 x i32]* %242, i64 0, i64 %247
  store i32 %240, i32* %248, align 4
  br label %234

; <label>:249:                                    ; preds = %234
  br label %250

; <label>:250:                                    ; preds = %249
  %251 = load i32, i32* %3, align 4
  %252 = add nsw i32 %251, 1
  store i32 %252, i32* %3, align 4
  br label %132

; <label>:253:                                    ; preds = %132
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 6)
  %254 = add i64 %pgocount9, 1
  store i64 %254, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 6)
  br label %255

; <label>:255:                                    ; preds = %253, %53
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @latch_quant_tables(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.jpeg_component_info*, align 8
  %6 = alloca %struct.JQUANT_TBL*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  store i32 0, i32* %3, align 4
  br label %7

; <label>:7:                                      ; preds = %90, %1
  %8 = load i32, i32* %3, align 4
  %9 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %9, i32 0, i32 62
  %11 = load i32, i32* %10, align 8
  %12 = icmp slt i32 %8, %11
  br i1 %12, label %13, label %93

; <label>:13:                                     ; preds = %7
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 63
  %16 = load i32, i32* %3, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %15, i64 0, i64 %17
  %19 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  store %struct.jpeg_component_info* %19, %struct.jpeg_component_info** %5, align 8
  %20 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %21 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %20, i32 0, i32 19
  %22 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %21, align 8
  %23 = icmp ne %struct.JQUANT_TBL* %22, null
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_latch_quant_tables, i64 0, i64 0)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_latch_quant_tables, i64 0, i64 0)
  br label %90

; <label>:26:                                     ; preds = %13
  %27 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %28 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i32 0, i32 4
  %29 = load i32, i32* %28, align 8
  store i32 %29, i32* %4, align 4
  %30 = load i32, i32* %4, align 4
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %45, label %32

; <label>:32:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_latch_quant_tables, i64 0, i64 3)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_latch_quant_tables, i64 0, i64 3)
  %34 = load i32, i32* %4, align 4
  %35 = icmp sge i32 %34, 4
  br i1 %35, label %45, label %36

; <label>:36:                                     ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_latch_quant_tables, i64 0, i64 4)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_latch_quant_tables, i64 0, i64 4)
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %38, i32 0, i32 39
  %40 = load i32, i32* %4, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %39, i64 0, i64 %41
  %43 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %42, align 8
  %44 = icmp eq %struct.JQUANT_TBL* %43, null
  br i1 %44, label %45, label %66

; <label>:45:                                     ; preds = %36, %32, %26
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_latch_quant_tables, i64 0, i64 2)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_latch_quant_tables, i64 0, i64 2)
  %47 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %47, i32 0, i32 0
  %49 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %48, align 8
  %50 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %49, i32 0, i32 5
  store i32 51, i32* %50, align 8
  %51 = load i32, i32* %4, align 4
  %52 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %52, i32 0, i32 0
  %54 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %53, align 8
  %55 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %54, i32 0, i32 6
  %56 = bitcast %union.anon* %55 to [8 x i32]*
  %57 = getelementptr inbounds [8 x i32], [8 x i32]* %56, i64 0, i64 0
  store i32 %51, i32* %57, align 4
  %58 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %58, i32 0, i32 0
  %60 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %59, align 8
  %61 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %60, i32 0, i32 0
  %62 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %61, align 8
  %63 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %64 = bitcast %struct.jpeg_decompress_struct* %63 to %struct.jpeg_common_struct*
  %65 = ptrtoint void (%struct.jpeg_common_struct*)* %62 to i64
  call void @__llvm_profile_instrument_target(i64 %65, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_latch_quant_tables to i8*), i32 0)
  call void %62(%struct.jpeg_common_struct* %64)
  br label %66

; <label>:66:                                     ; preds = %45, %36
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_latch_quant_tables, i64 0, i64 1)
  %67 = add i64 %pgocount4, 1
  store i64 %67, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_latch_quant_tables, i64 0, i64 1)
  %68 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %69 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %68, i32 0, i32 1
  %70 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %69, align 8
  %71 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %70, i32 0, i32 0
  %72 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %71, align 8
  %73 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %74 = bitcast %struct.jpeg_decompress_struct* %73 to %struct.jpeg_common_struct*
  %75 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %72 to i64
  call void @__llvm_profile_instrument_target(i64 %75, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_latch_quant_tables to i8*), i32 1)
  %76 = call i8* %72(%struct.jpeg_common_struct* %74, i32 1, i64 132)
  %77 = bitcast i8* %76 to %struct.JQUANT_TBL*
  store %struct.JQUANT_TBL* %77, %struct.JQUANT_TBL** %6, align 8
  %78 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %6, align 8
  %79 = bitcast %struct.JQUANT_TBL* %78 to i8*
  %80 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %81 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %80, i32 0, i32 39
  %82 = load i32, i32* %4, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %81, i64 0, i64 %83
  %85 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %84, align 8
  %86 = bitcast %struct.JQUANT_TBL* %85 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %79, i8* %86, i64 132, i32 1, i1 false)
  %87 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %6, align 8
  %88 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %89 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %88, i32 0, i32 19
  store %struct.JQUANT_TBL* %87, %struct.JQUANT_TBL** %89, align 8
  br label %90

; <label>:90:                                     ; preds = %66, %24
  %91 = load i32, i32* %3, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %3, align 4
  br label %7

; <label>:93:                                     ; preds = %7
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_latch_quant_tables, i64 0, i64 5)
  %94 = add i64 %pgocount5, 1
  store i64 %94, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_latch_quant_tables, i64 0, i64 5)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

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

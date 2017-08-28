; ModuleID = 'jddctmgr.2.ll'
source_filename = "jddctmgr.c"
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
%struct.my_idct_controller = type { %struct.jpeg_inverse_dct, [10 x i32] }

$__llvm_profile_raw_version = comdat any

@start_pass.aanscales = internal constant [64 x i16] [i16 16384, i16 22725, i16 21407, i16 19266, i16 16384, i16 12873, i16 8867, i16 4520, i16 22725, i16 31521, i16 29692, i16 26722, i16 22725, i16 17855, i16 12299, i16 6270, i16 21407, i16 29692, i16 27969, i16 25172, i16 21407, i16 16819, i16 11585, i16 5906, i16 19266, i16 26722, i16 25172, i16 22654, i16 19266, i16 15137, i16 10426, i16 5315, i16 16384, i16 22725, i16 21407, i16 19266, i16 16384, i16 12873, i16 8867, i16 4520, i16 12873, i16 17855, i16 16819, i16 15137, i16 12873, i16 10114, i16 6967, i16 3552, i16 8867, i16 12299, i16 11585, i16 10426, i16 8867, i16 6967, i16 4799, i16 2446, i16 4520, i16 6270, i16 5906, i16 5315, i16 4520, i16 3552, i16 2446, i16 1247], align 16
@start_pass.aanscalefactor = internal constant [8 x double] [double 1.000000e+00, double 0x3FF63150B14861EF, double 0x3FF4E7AE914D6FCA, double 0x3FF2D062EF6C11AA, double 1.000000e+00, double 0x3FE92469C0A7BF3B, double 5.411961e-01, double 0x3FD1A855DE72AB5D], align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_inverse_dct = private constant [17 x i8] c"jinit_inverse_dct"
@__profn_tmp1.ll_start_pass = private constant [18 x i8] c"tmp1.ll:start_pass"
@__profc_jinit_inverse_dct = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_inverse_dct = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_inverse_dct = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5627307708364454400, i64 562984091081628, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_inverse_dct, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @jinit_inverse_dct to i8*), i8* bitcast ([2 x i64]* @__profvp_jinit_inverse_dct to i8*), i32 2, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_pass = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_pass = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7879845592295994702, i64 844690363217387, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @start_pass to i8*), i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_start_pass to i8*), i32 19, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [38 x i8] c"$\00jinit_inverse_dct\01tmp1.ll:start_pass", section "__llvm_prf_names"
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_inverse_dct to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jinit_inverse_dct(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_idct_controller*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %6, i32 0, i32 1
  %8 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %8, i32 0, i32 0
  %10 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %9, align 8
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %12 = bitcast %struct.jpeg_decompress_struct* %11 to %struct.jpeg_common_struct*
  %13 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %10 to i64
  call void @__llvm_profile_instrument_target(i64 %13, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_inverse_dct to i8*), i32 0)
  %14 = call i8* %10(%struct.jpeg_common_struct* %12, i32 1, i64 128)
  %15 = bitcast i8* %14 to %struct.my_idct_controller*
  store %struct.my_idct_controller* %15, %struct.my_idct_controller** %3, align 8
  %16 = load %struct.my_idct_controller*, %struct.my_idct_controller** %3, align 8
  %17 = bitcast %struct.my_idct_controller* %16 to %struct.jpeg_inverse_dct*
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 80
  store %struct.jpeg_inverse_dct* %17, %struct.jpeg_inverse_dct** %19, align 8
  %20 = load %struct.my_idct_controller*, %struct.my_idct_controller** %3, align 8
  %21 = getelementptr inbounds %struct.my_idct_controller, %struct.my_idct_controller* %20, i32 0, i32 0
  %22 = getelementptr inbounds %struct.jpeg_inverse_dct, %struct.jpeg_inverse_dct* %21, i32 0, i32 0
  %23 = bitcast {}** %22 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_pass, void (%struct.jpeg_decompress_struct*)** %23, align 8
  store i32 0, i32* %4, align 4
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 43
  %26 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %25, align 8
  store %struct.jpeg_component_info* %26, %struct.jpeg_component_info** %5, align 8
  br label %27

; <label>:27:                                     ; preds = %53, %1
  %28 = load i32, i32* %4, align 4
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %29, i32 0, i32 8
  %31 = load i32, i32* %30, align 8
  %32 = icmp slt i32 %28, %31
  br i1 %32, label %33, label %59

; <label>:33:                                     ; preds = %27
  %34 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %34, i32 0, i32 1
  %36 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %35, align 8
  %37 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %36, i32 0, i32 0
  %38 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %37, align 8
  %39 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %40 = bitcast %struct.jpeg_decompress_struct* %39 to %struct.jpeg_common_struct*
  %41 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %38 to i64
  call void @__llvm_profile_instrument_target(i64 %41, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_inverse_dct to i8*), i32 1)
  %42 = call i8* %38(%struct.jpeg_common_struct* %40, i32 1, i64 256)
  %43 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %44 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %43, i32 0, i32 20
  store i8* %42, i8** %44, align 8
  %45 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %46 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %45, i32 0, i32 20
  %47 = load i8*, i8** %46, align 8
  call void @llvm.memset.p0i8.i64(i8* %47, i8 0, i64 256, i32 1, i1 false)
  %48 = load %struct.my_idct_controller*, %struct.my_idct_controller** %3, align 8
  %49 = getelementptr inbounds %struct.my_idct_controller, %struct.my_idct_controller* %48, i32 0, i32 1
  %50 = load i32, i32* %4, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [10 x i32], [10 x i32]* %49, i64 0, i64 %51
  store i32 -1, i32* %52, align 4
  br label %53

; <label>:53:                                     ; preds = %33
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_inverse_dct, i64 0, i64 0)
  %54 = add i64 %pgocount, 1
  store i64 %54, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_inverse_dct, i64 0, i64 0)
  %55 = load i32, i32* %4, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %4, align 4
  %57 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %58 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %57, i32 1
  store %struct.jpeg_component_info* %58, %struct.jpeg_component_info** %5, align 8
  br label %27

; <label>:59:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_inverse_dct, i64 0, i64 1)
  %60 = add i64 %pgocount1, 1
  store i64 %60, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_inverse_dct, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_idct_controller*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.jpeg_component_info*, align 8
  %7 = alloca i32, align 4
  %8 = alloca void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, align 8
  %9 = alloca %struct.JQUANT_TBL*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca float*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 80
  %17 = load %struct.jpeg_inverse_dct*, %struct.jpeg_inverse_dct** %16, align 8
  %18 = bitcast %struct.jpeg_inverse_dct* %17 to %struct.my_idct_controller*
  store %struct.my_idct_controller* %18, %struct.my_idct_controller** %3, align 8
  store i32 0, i32* %7, align 4
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* null, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %8, align 8
  store i32 0, i32* %4, align 4
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 43
  %21 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  store %struct.jpeg_component_info* %21, %struct.jpeg_component_info** %6, align 8
  br label %22

; <label>:22:                                     ; preds = %249, %1
  %23 = load i32, i32* %4, align 4
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 8
  %26 = load i32, i32* %25, align 8
  %27 = icmp slt i32 %23, %26
  br i1 %27, label %28, label %254

; <label>:28:                                     ; preds = %22
  %29 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %30 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %29, i32 0, i32 9
  %31 = load i32, i32* %30, align 4
  switch i32 %31, label %63 [
    i32 1, label %32
    i32 2, label %34
    i32 4, label %36
    i32 8, label %38
  ]

; <label>:32:                                     ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 5)
  %33 = add i64 %pgocount, 1
  store i64 %33, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 5)
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* @jpeg_idct_1x1, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %8, align 8
  store i32 0, i32* %7, align 4
  br label %86

; <label>:34:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 6)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 6)
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* @jpeg_idct_2x2, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %8, align 8
  store i32 0, i32* %7, align 4
  br label %86

; <label>:36:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 7)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 7)
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* @jpeg_idct_4x4, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %8, align 8
  store i32 0, i32* %7, align 4
  br label %86

; <label>:38:                                     ; preds = %28
  %39 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %39, i32 0, i32 16
  %41 = load i32, i32* %40, align 8
  switch i32 %41, label %48 [
    i32 0, label %42
    i32 1, label %44
    i32 2, label %46
  ]

; <label>:42:                                     ; preds = %38
  %pgocount3 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 10)
  %43 = add i64 %pgocount3, 1
  store i64 %43, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 10)
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* @jpeg_idct_islow, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %8, align 8
  store i32 0, i32* %7, align 4
  br label %62

; <label>:44:                                     ; preds = %38
  %pgocount4 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 11)
  %45 = add i64 %pgocount4, 1
  store i64 %45, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 11)
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* @jpeg_idct_ifast, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %8, align 8
  store i32 1, i32* %7, align 4
  br label %62

; <label>:46:                                     ; preds = %38
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 12)
  %47 = add i64 %pgocount5, 1
  store i64 %47, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 12)
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* @jpeg_idct_float, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %8, align 8
  store i32 2, i32* %7, align 4
  br label %62

; <label>:48:                                     ; preds = %38
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 13)
  %49 = add i64 %pgocount6, 1
  store i64 %49, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 13)
  %50 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %50, i32 0, i32 0
  %52 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %51, align 8
  %53 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %52, i32 0, i32 5
  store i32 47, i32* %53, align 8
  %54 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %55 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %54, i32 0, i32 0
  %56 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %55, align 8
  %57 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %56, i32 0, i32 0
  %58 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %57, align 8
  %59 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %60 = bitcast %struct.jpeg_decompress_struct* %59 to %struct.jpeg_common_struct*
  %61 = ptrtoint void (%struct.jpeg_common_struct*)* %58 to i64
  call void @__llvm_profile_instrument_target(i64 %61, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass to i8*), i32 0)
  call void %58(%struct.jpeg_common_struct* %60)
  br label %62

; <label>:62:                                     ; preds = %48, %46, %44, %42
  br label %86

; <label>:63:                                     ; preds = %28
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 8)
  %64 = add i64 %pgocount7, 1
  store i64 %64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 8)
  %65 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %66 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %65, i32 0, i32 0
  %67 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %68 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %67, i32 0, i32 5
  store i32 6, i32* %68, align 8
  %69 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %70 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %69, i32 0, i32 9
  %71 = load i32, i32* %70, align 4
  %72 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %72, i32 0, i32 0
  %74 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %73, align 8
  %75 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %74, i32 0, i32 6
  %76 = bitcast %union.anon* %75 to [8 x i32]*
  %77 = getelementptr inbounds [8 x i32], [8 x i32]* %76, i64 0, i64 0
  store i32 %71, i32* %77, align 4
  %78 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %78, i32 0, i32 0
  %80 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %79, align 8
  %81 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %80, i32 0, i32 0
  %82 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %81, align 8
  %83 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %84 = bitcast %struct.jpeg_decompress_struct* %83 to %struct.jpeg_common_struct*
  %85 = ptrtoint void (%struct.jpeg_common_struct*)* %82 to i64
  call void @__llvm_profile_instrument_target(i64 %85, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass to i8*), i32 1)
  call void %82(%struct.jpeg_common_struct* %84)
  br label %86

; <label>:86:                                     ; preds = %63, %62, %36, %34, %32
  %87 = load void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %8, align 8
  %88 = load %struct.my_idct_controller*, %struct.my_idct_controller** %3, align 8
  %89 = getelementptr inbounds %struct.my_idct_controller, %struct.my_idct_controller* %88, i32 0, i32 0
  %90 = getelementptr inbounds %struct.jpeg_inverse_dct, %struct.jpeg_inverse_dct* %89, i32 0, i32 1
  %91 = load i32, i32* %4, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*]* %90, i64 0, i64 %92
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* %87, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %93, align 8
  %94 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %95 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %94, i32 0, i32 12
  %96 = load i32, i32* %95, align 8
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %98, label %108

; <label>:98:                                     ; preds = %86
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 4)
  %99 = add i64 %pgocount8, 1
  store i64 %99, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 4)
  %100 = load %struct.my_idct_controller*, %struct.my_idct_controller** %3, align 8
  %101 = getelementptr inbounds %struct.my_idct_controller, %struct.my_idct_controller* %100, i32 0, i32 1
  %102 = load i32, i32* %4, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [10 x i32], [10 x i32]* %101, i64 0, i64 %103
  %105 = load i32, i32* %104, align 4
  %106 = load i32, i32* %7, align 4
  %107 = icmp eq i32 %105, %106
  br i1 %107, label %108, label %109

; <label>:108:                                    ; preds = %98, %86
  br label %249

; <label>:109:                                    ; preds = %98
  %110 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %111 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %110, i32 0, i32 19
  %112 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %111, align 8
  store %struct.JQUANT_TBL* %112, %struct.JQUANT_TBL** %9, align 8
  %113 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %114 = icmp eq %struct.JQUANT_TBL* %113, null
  br i1 %114, label %115, label %117

; <label>:115:                                    ; preds = %109
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 9)
  %116 = add i64 %pgocount9, 1
  store i64 %116, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 9)
  br label %249

; <label>:117:                                    ; preds = %109
  %118 = load i32, i32* %7, align 4
  %119 = load %struct.my_idct_controller*, %struct.my_idct_controller** %3, align 8
  %120 = getelementptr inbounds %struct.my_idct_controller, %struct.my_idct_controller* %119, i32 0, i32 1
  %121 = load i32, i32* %4, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [10 x i32], [10 x i32]* %120, i64 0, i64 %122
  store i32 %118, i32* %123, align 4
  %124 = load i32, i32* %7, align 4
  switch i32 %124, label %234 [
    i32 0, label %125
    i32 1, label %151
    i32 2, label %186
  ]

; <label>:125:                                    ; preds = %117
  %126 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %127 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %126, i32 0, i32 20
  %128 = load i8*, i8** %127, align 8
  %129 = bitcast i8* %128 to i32*
  store i32* %129, i32** %10, align 8
  store i32 0, i32* %5, align 4
  br label %130

; <label>:130:                                    ; preds = %146, %125
  %131 = load i32, i32* %5, align 4
  %132 = icmp slt i32 %131, 64
  br i1 %132, label %133, label %149

; <label>:133:                                    ; preds = %130
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 1)
  %134 = add i64 %pgocount10, 1
  store i64 %134, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 1)
  %135 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %136 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %135, i32 0, i32 0
  %137 = load i32, i32* %5, align 4
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds [64 x i16], [64 x i16]* %136, i64 0, i64 %138
  %140 = load i16, i16* %139, align 2
  %141 = zext i16 %140 to i32
  %142 = load i32*, i32** %10, align 8
  %143 = load i32, i32* %5, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32, i32* %142, i64 %144
  store i32 %141, i32* %145, align 4
  br label %146

; <label>:146:                                    ; preds = %133
  %147 = load i32, i32* %5, align 4
  %148 = add nsw i32 %147, 1
  store i32 %148, i32* %5, align 4
  br label %130

; <label>:149:                                    ; preds = %130
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 14)
  %150 = add i64 %pgocount11, 1
  store i64 %150, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 14)
  br label %248

; <label>:151:                                    ; preds = %117
  %152 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %153 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %152, i32 0, i32 20
  %154 = load i8*, i8** %153, align 8
  %155 = bitcast i8* %154 to i32*
  store i32* %155, i32** %11, align 8
  store i32 0, i32* %5, align 4
  br label %156

; <label>:156:                                    ; preds = %181, %151
  %157 = load i32, i32* %5, align 4
  %158 = icmp slt i32 %157, 64
  br i1 %158, label %159, label %184

; <label>:159:                                    ; preds = %156
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 2)
  %160 = add i64 %pgocount12, 1
  store i64 %160, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 2)
  %161 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %162 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %161, i32 0, i32 0
  %163 = load i32, i32* %5, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [64 x i16], [64 x i16]* %162, i64 0, i64 %164
  %166 = load i16, i16* %165, align 2
  %167 = zext i16 %166 to i64
  %168 = load i32, i32* %5, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [64 x i16], [64 x i16]* @start_pass.aanscales, i64 0, i64 %169
  %171 = load i16, i16* %170, align 2
  %172 = sext i16 %171 to i64
  %173 = mul nsw i64 %167, %172
  %174 = add nsw i64 %173, 2048
  %175 = ashr i64 %174, 12
  %176 = trunc i64 %175 to i32
  %177 = load i32*, i32** %11, align 8
  %178 = load i32, i32* %5, align 4
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds i32, i32* %177, i64 %179
  store i32 %176, i32* %180, align 4
  br label %181

; <label>:181:                                    ; preds = %159
  %182 = load i32, i32* %5, align 4
  %183 = add nsw i32 %182, 1
  store i32 %183, i32* %5, align 4
  br label %156

; <label>:184:                                    ; preds = %156
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 15)
  %185 = add i64 %pgocount13, 1
  store i64 %185, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 15)
  br label %248

; <label>:186:                                    ; preds = %117
  %187 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %188 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %187, i32 0, i32 20
  %189 = load i8*, i8** %188, align 8
  %190 = bitcast i8* %189 to float*
  store float* %190, float** %12, align 8
  store i32 0, i32* %5, align 4
  store i32 0, i32* %13, align 4
  br label %191

; <label>:191:                                    ; preds = %229, %186
  %192 = load i32, i32* %13, align 4
  %193 = icmp slt i32 %192, 8
  br i1 %193, label %194, label %232

; <label>:194:                                    ; preds = %191
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 3)
  %195 = add i64 %pgocount14, 1
  store i64 %195, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 3)
  store i32 0, i32* %14, align 4
  br label %196

; <label>:196:                                    ; preds = %225, %194
  %197 = load i32, i32* %14, align 4
  %198 = icmp slt i32 %197, 8
  br i1 %198, label %199, label %228

; <label>:199:                                    ; preds = %196
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 0)
  %200 = add i64 %pgocount15, 1
  store i64 %200, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 0)
  %201 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %202 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %201, i32 0, i32 0
  %203 = load i32, i32* %5, align 4
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [64 x i16], [64 x i16]* %202, i64 0, i64 %204
  %206 = load i16, i16* %205, align 2
  %207 = uitofp i16 %206 to double
  %208 = load i32, i32* %13, align 4
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [8 x double], [8 x double]* @start_pass.aanscalefactor, i64 0, i64 %209
  %211 = load double, double* %210, align 8
  %212 = fmul double %207, %211
  %213 = load i32, i32* %14, align 4
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [8 x double], [8 x double]* @start_pass.aanscalefactor, i64 0, i64 %214
  %216 = load double, double* %215, align 8
  %217 = fmul double %212, %216
  %218 = fptrunc double %217 to float
  %219 = load float*, float** %12, align 8
  %220 = load i32, i32* %5, align 4
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds float, float* %219, i64 %221
  store float %218, float* %222, align 4
  %223 = load i32, i32* %5, align 4
  %224 = add nsw i32 %223, 1
  store i32 %224, i32* %5, align 4
  br label %225

; <label>:225:                                    ; preds = %199
  %226 = load i32, i32* %14, align 4
  %227 = add nsw i32 %226, 1
  store i32 %227, i32* %14, align 4
  br label %196

; <label>:228:                                    ; preds = %196
  br label %229

; <label>:229:                                    ; preds = %228
  %230 = load i32, i32* %13, align 4
  %231 = add nsw i32 %230, 1
  store i32 %231, i32* %13, align 4
  br label %191

; <label>:232:                                    ; preds = %191
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 16)
  %233 = add i64 %pgocount16, 1
  store i64 %233, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 16)
  br label %248

; <label>:234:                                    ; preds = %117
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 17)
  %235 = add i64 %pgocount17, 1
  store i64 %235, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 17)
  %236 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %237 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %236, i32 0, i32 0
  %238 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %237, align 8
  %239 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %238, i32 0, i32 5
  store i32 47, i32* %239, align 8
  %240 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %241 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %240, i32 0, i32 0
  %242 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %241, align 8
  %243 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %242, i32 0, i32 0
  %244 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %243, align 8
  %245 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %246 = bitcast %struct.jpeg_decompress_struct* %245 to %struct.jpeg_common_struct*
  %247 = ptrtoint void (%struct.jpeg_common_struct*)* %244 to i64
  call void @__llvm_profile_instrument_target(i64 %247, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass to i8*), i32 2)
  call void %244(%struct.jpeg_common_struct* %246)
  br label %248

; <label>:248:                                    ; preds = %234, %232, %184, %149
  br label %249

; <label>:249:                                    ; preds = %248, %115, %108
  %250 = load i32, i32* %4, align 4
  %251 = add nsw i32 %250, 1
  store i32 %251, i32* %4, align 4
  %252 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %253 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %252, i32 1
  store %struct.jpeg_component_info* %253, %struct.jpeg_component_info** %6, align 8
  br label %22

; <label>:254:                                    ; preds = %22
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 18)
  %255 = add i64 %pgocount18, 1
  store i64 %255, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_start_pass, i64 0, i64 18)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

declare void @jpeg_idct_1x1(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #2

declare void @jpeg_idct_2x2(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #2

declare void @jpeg_idct_4x4(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #2

declare void @jpeg_idct_islow(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #2

declare void @jpeg_idct_ifast(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #2

declare void @jpeg_idct_float(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #2

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

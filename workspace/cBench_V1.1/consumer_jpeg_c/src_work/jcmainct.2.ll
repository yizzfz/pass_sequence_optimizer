; ModuleID = 'tmp1.ll'
source_filename = "jcmainct.c"
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
%struct.jpeg_destination_mgr = type { i8*, i64, void (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)* }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_scan_info = type { i32, [4 x i32], i32, i32, i32, i32 }
%struct.jpeg_comp_master = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, i32, i32 }
%struct.jpeg_c_main_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32)* }
%struct.jpeg_c_prep_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* }
%struct.jpeg_c_coef_controller = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, i8***)* }
%struct.jpeg_marker_writer = type { void (%struct.jpeg_compress_struct*, i32, i8*, i32)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)* }
%struct.jpeg_color_converter = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* }
%struct.jpeg_downsampler = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, i32 }
%struct.jpeg_forward_dct = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* }
%struct.jpeg_entropy_encoder = type { {}*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, void (%struct.jpeg_compress_struct*)* }
%struct.my_main_controller = type { %struct.jpeg_c_main_controller, i32, i32, i32, i32, [10 x i8**] }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_c_main_controller = private constant [23 x i8] c"jinit_c_main_controller"
@__profn_tmp1.ll_start_pass_main = private constant [23 x i8] c"tmp1.ll:start_pass_main"
@__profn_tmp1.ll_process_data_simple_main = private constant [32 x i8] c"tmp1.ll:process_data_simple_main"
@__profc_jinit_c_main_controller = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_c_main_controller = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_c_main_controller = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4912616423584359994, i64 844485671872726, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_main_controller, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32)* @jinit_c_main_controller to i8*), i8* bitcast ([3 x i64]* @__profvp_jinit_c_main_controller to i8*), i32 4, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_pass_main = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_pass_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6362297873878557579, i64 281517731074310, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_pass_main, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32)* @start_pass_main to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_start_pass_main to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_process_data_simple_main = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_process_data_simple_main = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_process_data_simple_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5106865410986619261, i64 563041365463438, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_process_data_simple_main, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i8**, i32*, i32)* @process_data_simple_main to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_process_data_simple_main to i8*), i32 7, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [12 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [71 x i8] c"PEx\DA=\CAK\0A\80@\08\00P\BAP\D0\B6\CB\888.\0C\7F\A8\F7\A7\98E\DB\C7{\C4e\80\C0P\1C(|*T\B9\8E\B1\BCN\D5\BB\07k \B1{\97\DF\B3\82\F8\C3\85\83\D0b\A9\BC\C3\0B\F0\D9\1F;", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_c_main_controller to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_data_simple_main to i8*), i8* bitcast ([12 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([71 x i8], [71 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jinit_c_main_controller(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.my_main_controller*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %8 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %8, i32 0, i32 1
  %10 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %10, i32 0, i32 0
  %12 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %11, align 8
  %13 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %14 = bitcast %struct.jpeg_compress_struct* %13 to %struct.jpeg_common_struct*
  %15 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %12 to i64
  call void @__llvm_profile_instrument_target(i64 %15, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_c_main_controller to i8*), i32 0)
  %16 = call i8* %12(%struct.jpeg_common_struct* %14, i32 1, i64 112)
  %17 = bitcast i8* %16 to %struct.my_main_controller*
  store %struct.my_main_controller* %17, %struct.my_main_controller** %5, align 8
  %18 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %19 = bitcast %struct.my_main_controller* %18 to %struct.jpeg_c_main_controller*
  %20 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %20, i32 0, i32 52
  store %struct.jpeg_c_main_controller* %19, %struct.jpeg_c_main_controller** %21, align 8
  %22 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %23 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %22, i32 0, i32 0
  %24 = getelementptr inbounds %struct.jpeg_c_main_controller, %struct.jpeg_c_main_controller* %23, i32 0, i32 0
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_main, void (%struct.jpeg_compress_struct*, i32)** %24, align 8
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 23
  %27 = load i32, i32* %26, align 8
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_main_controller, i64 0, i64 1)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_main_controller, i64 0, i64 1)
  br label %89

; <label>:31:                                     ; preds = %2
  %32 = load i32, i32* %4, align 4
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %48

; <label>:34:                                     ; preds = %31
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_main_controller, i64 0, i64 2)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_main_controller, i64 0, i64 2)
  %36 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %37 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %36, i32 0, i32 0
  %38 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %37, align 8
  %39 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %38, i32 0, i32 5
  store i32 4, i32* %39, align 8
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %40, i32 0, i32 0
  %42 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %41, align 8
  %43 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %42, i32 0, i32 0
  %44 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %43, align 8
  %45 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %46 = bitcast %struct.jpeg_compress_struct* %45 to %struct.jpeg_common_struct*
  %47 = ptrtoint void (%struct.jpeg_common_struct*)* %44 to i64
  call void @__llvm_profile_instrument_target(i64 %47, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_c_main_controller to i8*), i32 1)
  call void %44(%struct.jpeg_common_struct* %46)
  br label %89

; <label>:48:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_main_controller, i64 0, i64 3)
  %49 = add i64 %pgocount2, 1
  store i64 %49, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_main_controller, i64 0, i64 3)
  store i32 0, i32* %6, align 4
  %50 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %51 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %50, i32 0, i32 14
  %52 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %51, align 8
  store %struct.jpeg_component_info* %52, %struct.jpeg_component_info** %7, align 8
  br label %53

; <label>:53:                                     ; preds = %82, %48
  %54 = load i32, i32* %6, align 4
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %55, i32 0, i32 12
  %57 = load i32, i32* %56, align 4
  %58 = icmp slt i32 %54, %57
  br i1 %58, label %59, label %88

; <label>:59:                                     ; preds = %53
  %60 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %61 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %60, i32 0, i32 1
  %62 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %61, align 8
  %63 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %62, i32 0, i32 2
  %64 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %63, align 8
  %65 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %66 = bitcast %struct.jpeg_compress_struct* %65 to %struct.jpeg_common_struct*
  %67 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %68 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %67, i32 0, i32 7
  %69 = load i32, i32* %68, align 4
  %70 = mul i32 %69, 8
  %71 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %72 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %71, i32 0, i32 3
  %73 = load i32, i32* %72, align 4
  %74 = mul nsw i32 %73, 8
  %75 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %64 to i64
  call void @__llvm_profile_instrument_target(i64 %75, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_c_main_controller to i8*), i32 2)
  %76 = call i8** %64(%struct.jpeg_common_struct* %66, i32 1, i32 %70, i32 %74)
  %77 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %78 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %77, i32 0, i32 5
  %79 = load i32, i32* %6, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [10 x i8**], [10 x i8**]* %78, i64 0, i64 %80
  store i8** %76, i8*** %81, align 8
  br label %82

; <label>:82:                                     ; preds = %59
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_main_controller, i64 0, i64 0)
  %83 = add i64 %pgocount3, 1
  store i64 %83, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_main_controller, i64 0, i64 0)
  %84 = load i32, i32* %6, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %6, align 4
  %86 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %87 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %86, i32 1
  store %struct.jpeg_component_info* %87, %struct.jpeg_component_info** %7, align 8
  br label %53

; <label>:88:                                     ; preds = %53
  br label %89

; <label>:89:                                     ; preds = %88, %34, %29
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @start_pass_main(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.my_main_controller*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %6, i32 0, i32 52
  %8 = load %struct.jpeg_c_main_controller*, %struct.jpeg_c_main_controller** %7, align 8
  %9 = bitcast %struct.jpeg_c_main_controller* %8 to %struct.my_main_controller*
  store %struct.my_main_controller* %9, %struct.my_main_controller** %5, align 8
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %10, i32 0, i32 23
  %12 = load i32, i32* %11, align 8
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_pass_main, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_pass_main, i64 0, i64 0)
  br label %46

; <label>:16:                                     ; preds = %2
  %17 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %18 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %17, i32 0, i32 1
  store i32 0, i32* %18, align 8
  %19 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %20 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %19, i32 0, i32 2
  store i32 0, i32* %20, align 4
  %21 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %22 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %21, i32 0, i32 3
  store i32 0, i32* %22, align 8
  %23 = load i32, i32* %4, align 4
  %24 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %25 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %24, i32 0, i32 4
  store i32 %23, i32* %25, align 4
  %26 = load i32, i32* %4, align 4
  switch i32 %26, label %32 [
    i32 0, label %27
  ]

; <label>:27:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_pass_main, i64 0, i64 1)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_pass_main, i64 0, i64 1)
  %29 = load %struct.my_main_controller*, %struct.my_main_controller** %5, align 8
  %30 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %29, i32 0, i32 0
  %31 = getelementptr inbounds %struct.jpeg_c_main_controller, %struct.jpeg_c_main_controller* %30, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, i8**, i32*, i32)* @process_data_simple_main, void (%struct.jpeg_compress_struct*, i8**, i32*, i32)** %31, align 8
  br label %46

; <label>:32:                                     ; preds = %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_pass_main, i64 0, i64 2)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_pass_main, i64 0, i64 2)
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %34, i32 0, i32 0
  %36 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %35, align 8
  %37 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %36, i32 0, i32 5
  store i32 4, i32* %37, align 8
  %38 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %39 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %38, i32 0, i32 0
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i32 0, i32 0
  %42 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %41, align 8
  %43 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %44 = bitcast %struct.jpeg_compress_struct* %43 to %struct.jpeg_common_struct*
  %45 = ptrtoint void (%struct.jpeg_common_struct*)* %42 to i64
  call void @__llvm_profile_instrument_target(i64 %45, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_main to i8*), i32 0)
  call void %42(%struct.jpeg_common_struct* %44)
  br label %46

; <label>:46:                                     ; preds = %32, %27, %14
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @process_data_simple_main(%struct.jpeg_compress_struct*, i8**, i32*, i32) #0 {
  %5 = alloca %struct.jpeg_compress_struct*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.my_main_controller*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %5, align 8
  store i8** %1, i8*** %6, align 8
  store i32* %2, i32** %7, align 8
  store i32 %3, i32* %8, align 4
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %10, i32 0, i32 52
  %12 = load %struct.jpeg_c_main_controller*, %struct.jpeg_c_main_controller** %11, align 8
  %13 = bitcast %struct.jpeg_c_main_controller* %12 to %struct.my_main_controller*
  store %struct.my_main_controller* %13, %struct.my_main_controller** %9, align 8
  br label %14

; <label>:14:                                     ; preds = %91, %4
  %15 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %16 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %15, i32 0, i32 1
  %17 = load i32, i32* %16, align 8
  %18 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %18, i32 0, i32 40
  %20 = load i32, i32* %19, align 8
  %21 = icmp ult i32 %17, %20
  br i1 %21, label %22, label %98

; <label>:22:                                     ; preds = %14
  %23 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %24 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %23, i32 0, i32 2
  %25 = load i32, i32* %24, align 4
  %26 = icmp ult i32 %25, 8
  br i1 %26, label %27, label %44

; <label>:27:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 2)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 2)
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i32 0, i32 53
  %31 = load %struct.jpeg_c_prep_controller*, %struct.jpeg_c_prep_controller** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_c_prep_controller, %struct.jpeg_c_prep_controller* %31, i32 0, i32 1
  %33 = load void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)** %32, align 8
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %35 = load i8**, i8*** %6, align 8
  %36 = load i32*, i32** %7, align 8
  %37 = load i32, i32* %8, align 4
  %38 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %39 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %38, i32 0, i32 5
  %40 = getelementptr inbounds [10 x i8**], [10 x i8**]* %39, i32 0, i32 0
  %41 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %42 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %41, i32 0, i32 2
  %43 = ptrtoint void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* %33 to i64
  call void @__llvm_profile_instrument_target(i64 %43, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_data_simple_main to i8*), i32 0)
  call void %33(%struct.jpeg_compress_struct* %34, i8** %35, i32* %36, i32 %37, i8*** %40, i32* %42, i32 8)
  br label %44

; <label>:44:                                     ; preds = %27, %22
  %45 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %46 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %45, i32 0, i32 2
  %47 = load i32, i32* %46, align 4
  %48 = icmp ne i32 %47, 8
  br i1 %48, label %49, label %51

; <label>:49:                                     ; preds = %44
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 4)
  %50 = add i64 %pgocount1, 1
  store i64 %50, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 4)
  br label %98

; <label>:51:                                     ; preds = %44
  %52 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %53 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %52, i32 0, i32 54
  %54 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %53, align 8
  %55 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %54, i32 0, i32 1
  %56 = load i32 (%struct.jpeg_compress_struct*, i8***)*, i32 (%struct.jpeg_compress_struct*, i8***)** %55, align 8
  %57 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %58 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %59 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %58, i32 0, i32 5
  %60 = getelementptr inbounds [10 x i8**], [10 x i8**]* %59, i32 0, i32 0
  %61 = ptrtoint i32 (%struct.jpeg_compress_struct*, i8***)* %56 to i64
  call void @__llvm_profile_instrument_target(i64 %61, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_data_simple_main to i8*), i32 1)
  %62 = call i32 %56(%struct.jpeg_compress_struct* %57, i8*** %60)
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %78, label %64

; <label>:64:                                     ; preds = %51
  %65 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %66 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %65, i32 0, i32 3
  %67 = load i32, i32* %66, align 8
  %68 = icmp ne i32 %67, 0
  br i1 %68, label %76, label %69

; <label>:69:                                     ; preds = %64
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 6)
  %70 = add i64 %pgocount2, 1
  store i64 %70, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 6)
  %71 = load i32*, i32** %7, align 8
  %72 = load i32, i32* %71, align 4
  %73 = add i32 %72, -1
  store i32 %73, i32* %71, align 4
  %74 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %75 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %74, i32 0, i32 3
  store i32 1, i32* %75, align 8
  br label %76

; <label>:76:                                     ; preds = %69, %64
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 5)
  %77 = add i64 %pgocount3, 1
  store i64 %77, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 5)
  br label %98

; <label>:78:                                     ; preds = %51
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 0)
  %79 = add i64 %pgocount4, 1
  store i64 %79, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 0)
  %80 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %81 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %80, i32 0, i32 3
  %82 = load i32, i32* %81, align 8
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %84, label %91

; <label>:84:                                     ; preds = %78
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 1)
  %85 = add i64 %pgocount5, 1
  store i64 %85, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 1)
  %86 = load i32*, i32** %7, align 8
  %87 = load i32, i32* %86, align 4
  %88 = add i32 %87, 1
  store i32 %88, i32* %86, align 4
  %89 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %90 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %89, i32 0, i32 3
  store i32 0, i32* %90, align 8
  br label %91

; <label>:91:                                     ; preds = %84, %78
  %92 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %93 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %92, i32 0, i32 2
  store i32 0, i32* %93, align 4
  %94 = load %struct.my_main_controller*, %struct.my_main_controller** %9, align 8
  %95 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %94, i32 0, i32 1
  %96 = load i32, i32* %95, align 8
  %97 = add i32 %96, 1
  store i32 %97, i32* %95, align 8
  br label %14

; <label>:98:                                     ; preds = %76, %49, %14
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 3)
  %99 = add i64 %pgocount6, 1
  store i64 %99, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_process_data_simple_main, i64 0, i64 3)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #1

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

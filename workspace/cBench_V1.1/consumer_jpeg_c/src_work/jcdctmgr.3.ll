; ModuleID = 'jcdctmgr.2.ll'
source_filename = "jcdctmgr.c"
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
%struct.my_fdct_controller = type { %struct.jpeg_forward_dct, void (i32*)*, [4 x i32*], void (float*)*, [4 x float*] }

$__llvm_profile_raw_version = comdat any

@start_pass_fdctmgr.aanscales = internal constant [64 x i16] [i16 16384, i16 22725, i16 21407, i16 19266, i16 16384, i16 12873, i16 8867, i16 4520, i16 22725, i16 31521, i16 29692, i16 26722, i16 22725, i16 17855, i16 12299, i16 6270, i16 21407, i16 29692, i16 27969, i16 25172, i16 21407, i16 16819, i16 11585, i16 5906, i16 19266, i16 26722, i16 25172, i16 22654, i16 19266, i16 15137, i16 10426, i16 5315, i16 16384, i16 22725, i16 21407, i16 19266, i16 16384, i16 12873, i16 8867, i16 4520, i16 12873, i16 17855, i16 16819, i16 15137, i16 12873, i16 10114, i16 6967, i16 3552, i16 8867, i16 12299, i16 11585, i16 10426, i16 8867, i16 6967, i16 4799, i16 2446, i16 4520, i16 6270, i16 5906, i16 5315, i16 4520, i16 3552, i16 2446, i16 1247], align 16
@start_pass_fdctmgr.aanscalefactor = internal constant [8 x double] [double 1.000000e+00, double 0x3FF63150B14861EF, double 0x3FF4E7AE914D6FCA, double 0x3FF2D062EF6C11AA, double 1.000000e+00, double 0x3FE92469C0A7BF3B, double 5.411961e-01, double 0x3FD1A855DE72AB5D], align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_forward_dct = private constant [17 x i8] c"jinit_forward_dct"
@__profn_tmp1.ll_start_pass_fdctmgr = private constant [26 x i8] c"tmp1.ll:start_pass_fdctmgr"
@__profn_tmp1.ll_forward_DCT = private constant [19 x i8] c"tmp1.ll:forward_DCT"
@__profn_tmp1.ll_forward_DCT_float = private constant [25 x i8] c"tmp1.ll:forward_DCT_float"
@__profc_jinit_forward_dct = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_forward_dct = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_forward_dct = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8544393244066728348, i64 563015571052224, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_forward_dct, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @jinit_forward_dct to i8*), i8* bitcast ([2 x i64]* @__profvp_jinit_forward_dct to i8*), i32 5, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass_fdctmgr = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_pass_fdctmgr = private global [5 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_pass_fdctmgr = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8123219705971871692, i64 1407594143051944, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @start_pass_fdctmgr to i8*), i8* bitcast ([5 x i64]* @__profvp_tmp1.ll_start_pass_fdctmgr to i8*), i32 15, [1 x i16] [i16 5] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_forward_DCT = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_forward_DCT = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_forward_DCT = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6412547216645558283, i64 281603792911362, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_forward_DCT, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* @forward_DCT to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_forward_DCT to i8*), i32 7, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_forward_DCT_float = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_forward_DCT_float = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_forward_DCT_float = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 958602074468416200, i64 281551956113026, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forward_DCT_float, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* @forward_DCT_float to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_forward_DCT_float to i8*), i32 4, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [18 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [68 x i8] c"ZBx\DA\CB\CA\CC\CB,\89O\CB/*O,J\89OI.a,\C9-0\D4\CB\C9\B1*.I,*\89/H,.\8EO\03\8A\E7\A6\17\C1\A5`\CA]\9CC\B0\89\C5\A7\E5\E4'\96\00\00\17h!\B3", section "__llvm_prf_names"
@llvm.used = appending global [6 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_forward_dct to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_fdctmgr to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_forward_DCT to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_forward_DCT_float to i8*), i8* bitcast ([18 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jinit_forward_dct(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.my_fdct_controller*, align 8
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
  call void @__llvm_profile_instrument_target(i64 %12, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_forward_dct to i8*), i32 0)
  %13 = call i8* %9(%struct.jpeg_common_struct* %11, i32 1, i64 96)
  %14 = bitcast i8* %13 to %struct.my_fdct_controller*
  store %struct.my_fdct_controller* %14, %struct.my_fdct_controller** %3, align 8
  %15 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %16 = bitcast %struct.my_fdct_controller* %15 to %struct.jpeg_forward_dct*
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %17, i32 0, i32 58
  store %struct.jpeg_forward_dct* %16, %struct.jpeg_forward_dct** %18, align 8
  %19 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %20 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %20, i32 0, i32 0
  %22 = bitcast {}** %21 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @start_pass_fdctmgr, void (%struct.jpeg_compress_struct*)** %22, align 8
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %23, i32 0, i32 28
  %25 = load i32, i32* %24, align 4
  switch i32 %25, label %47 [
    i32 0, label %26
    i32 1, label %33
    i32 2, label %40
  ]

; <label>:26:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_forward_dct, i64 0, i64 3)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_forward_dct, i64 0, i64 3)
  %28 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %29 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %28, i32 0, i32 0
  %30 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %29, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* @forward_DCT, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %30, align 8
  %31 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %32 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %31, i32 0, i32 1
  store void (i32*)* @jpeg_fdct_islow, void (i32*)** %32, align 8
  br label %61

; <label>:33:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_forward_dct, i64 0, i64 1)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_forward_dct, i64 0, i64 1)
  %35 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %36 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %35, i32 0, i32 0
  %37 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %36, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* @forward_DCT, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %37, align 8
  %38 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %39 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %38, i32 0, i32 1
  store void (i32*)* @jpeg_fdct_ifast, void (i32*)** %39, align 8
  br label %61

; <label>:40:                                     ; preds = %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_forward_dct, i64 0, i64 2)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_forward_dct, i64 0, i64 2)
  %42 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %43 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %42, i32 0, i32 0
  %44 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %43, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* @forward_DCT_float, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %44, align 8
  %45 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %46 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %45, i32 0, i32 3
  store void (float*)* @jpeg_fdct_float, void (float*)** %46, align 8
  br label %61

; <label>:47:                                     ; preds = %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_forward_dct, i64 0, i64 4)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_forward_dct, i64 0, i64 4)
  %49 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %50 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %49, i32 0, i32 0
  %51 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %50, align 8
  %52 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %51, i32 0, i32 5
  store i32 47, i32* %52, align 8
  %53 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %54 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %53, i32 0, i32 0
  %55 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %56 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %55, i32 0, i32 0
  %57 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %56, align 8
  %58 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %59 = bitcast %struct.jpeg_compress_struct* %58 to %struct.jpeg_common_struct*
  %60 = ptrtoint void (%struct.jpeg_common_struct*)* %57 to i64
  call void @__llvm_profile_instrument_target(i64 %60, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_forward_dct to i8*), i32 1)
  call void %57(%struct.jpeg_common_struct* %59)
  br label %61

; <label>:61:                                     ; preds = %47, %40, %33, %26
  store i32 0, i32* %4, align 4
  br label %62

; <label>:62:                                     ; preds = %76, %61
  %63 = load i32, i32* %4, align 4
  %64 = icmp slt i32 %63, 4
  br i1 %64, label %65, label %80

; <label>:65:                                     ; preds = %62
  %66 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %67 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %66, i32 0, i32 2
  %68 = load i32, i32* %4, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [4 x i32*], [4 x i32*]* %67, i64 0, i64 %69
  store i32* null, i32** %70, align 8
  %71 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %72 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %71, i32 0, i32 4
  %73 = load i32, i32* %4, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [4 x float*], [4 x float*]* %72, i64 0, i64 %74
  store float* null, float** %75, align 8
  br label %76

; <label>:76:                                     ; preds = %65
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_forward_dct, i64 0, i64 0)
  %77 = add i64 %pgocount4, 1
  store i64 %77, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_forward_dct, i64 0, i64 0)
  %78 = load i32, i32* %4, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* %4, align 4
  br label %62

; <label>:80:                                     ; preds = %62
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @start_pass_fdctmgr(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.my_fdct_controller*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.jpeg_component_info*, align 8
  %8 = alloca %struct.JQUANT_TBL*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca float*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %13 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %13, i32 0, i32 58
  %15 = load %struct.jpeg_forward_dct*, %struct.jpeg_forward_dct** %14, align 8
  %16 = bitcast %struct.jpeg_forward_dct* %15 to %struct.my_fdct_controller*
  store %struct.my_fdct_controller* %16, %struct.my_fdct_controller** %3, align 8
  store i32 0, i32* %4, align 4
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %17, i32 0, i32 14
  %19 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  store %struct.jpeg_component_info* %19, %struct.jpeg_component_info** %7, align 8
  br label %20

; <label>:20:                                     ; preds = %284, %1
  %21 = load i32, i32* %4, align 4
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 12
  %24 = load i32, i32* %23, align 4
  %25 = icmp slt i32 %21, %24
  br i1 %25, label %26, label %289

; <label>:26:                                     ; preds = %20
  %27 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %28 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i32 0, i32 4
  %29 = load i32, i32* %28, align 8
  store i32 %29, i32* %5, align 4
  %30 = load i32, i32* %5, align 4
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %45, label %32

; <label>:32:                                     ; preds = %26
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 5)
  %33 = add i64 %pgocount, 1
  store i64 %33, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 5)
  %34 = load i32, i32* %5, align 4
  %35 = icmp sge i32 %34, 4
  br i1 %35, label %45, label %36

; <label>:36:                                     ; preds = %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 6)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 6)
  %38 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %39 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %38, i32 0, i32 15
  %40 = load i32, i32* %5, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %39, i64 0, i64 %41
  %43 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %42, align 8
  %44 = icmp eq %struct.JQUANT_TBL* %43, null
  br i1 %44, label %45, label %66

; <label>:45:                                     ; preds = %36, %32, %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 4)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 4)
  %47 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %48 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %47, i32 0, i32 0
  %49 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %48, align 8
  %50 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %49, i32 0, i32 5
  store i32 51, i32* %50, align 8
  %51 = load i32, i32* %5, align 4
  %52 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %53 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %52, i32 0, i32 0
  %54 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %53, align 8
  %55 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %54, i32 0, i32 6
  %56 = bitcast %union.anon* %55 to [8 x i32]*
  %57 = getelementptr inbounds [8 x i32], [8 x i32]* %56, i64 0, i64 0
  store i32 %51, i32* %57, align 4
  %58 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %59 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %58, i32 0, i32 0
  %60 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %59, align 8
  %61 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %60, i32 0, i32 0
  %62 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %61, align 8
  %63 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %64 = bitcast %struct.jpeg_compress_struct* %63 to %struct.jpeg_common_struct*
  %65 = ptrtoint void (%struct.jpeg_common_struct*)* %62 to i64
  call void @__llvm_profile_instrument_target(i64 %65, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_fdctmgr to i8*), i32 0)
  call void %62(%struct.jpeg_common_struct* %64)
  br label %66

; <label>:66:                                     ; preds = %45, %36
  %67 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %68 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %67, i32 0, i32 15
  %69 = load i32, i32* %5, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %68, i64 0, i64 %70
  %72 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %71, align 8
  store %struct.JQUANT_TBL* %72, %struct.JQUANT_TBL** %8, align 8
  %73 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %74 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %73, i32 0, i32 28
  %75 = load i32, i32* %74, align 4
  switch i32 %75, label %269 [
    i32 0, label %76
    i32 1, label %130
    i32 2, label %192
  ]

; <label>:76:                                     ; preds = %66
  %77 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %78 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %77, i32 0, i32 2
  %79 = load i32, i32* %5, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [4 x i32*], [4 x i32*]* %78, i64 0, i64 %80
  %82 = load i32*, i32** %81, align 8
  %83 = icmp eq i32* %82, null
  br i1 %83, label %84, label %101

; <label>:84:                                     ; preds = %76
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 13)
  %85 = add i64 %pgocount3, 1
  store i64 %85, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 13)
  %86 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %87 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %86, i32 0, i32 1
  %88 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %87, align 8
  %89 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %88, i32 0, i32 0
  %90 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %89, align 8
  %91 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %92 = bitcast %struct.jpeg_compress_struct* %91 to %struct.jpeg_common_struct*
  %93 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %90 to i64
  call void @__llvm_profile_instrument_target(i64 %93, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_fdctmgr to i8*), i32 1)
  %94 = call i8* %90(%struct.jpeg_common_struct* %92, i32 1, i64 256)
  %95 = bitcast i8* %94 to i32*
  %96 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %97 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %96, i32 0, i32 2
  %98 = load i32, i32* %5, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [4 x i32*], [4 x i32*]* %97, i64 0, i64 %99
  store i32* %95, i32** %100, align 8
  br label %101

; <label>:101:                                    ; preds = %84, %76
  %102 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %103 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %102, i32 0, i32 2
  %104 = load i32, i32* %5, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [4 x i32*], [4 x i32*]* %103, i64 0, i64 %105
  %107 = load i32*, i32** %106, align 8
  store i32* %107, i32** %9, align 8
  store i32 0, i32* %6, align 4
  br label %108

; <label>:108:                                    ; preds = %124, %101
  %109 = load i32, i32* %6, align 4
  %110 = icmp slt i32 %109, 64
  br i1 %110, label %111, label %128

; <label>:111:                                    ; preds = %108
  %112 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %8, align 8
  %113 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %112, i32 0, i32 0
  %114 = load i32, i32* %6, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [64 x i16], [64 x i16]* %113, i64 0, i64 %115
  %117 = load i16, i16* %116, align 2
  %118 = zext i16 %117 to i32
  %119 = shl i32 %118, 3
  %120 = load i32*, i32** %9, align 8
  %121 = load i32, i32* %6, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32* %120, i64 %122
  store i32 %119, i32* %123, align 4
  br label %124

; <label>:124:                                    ; preds = %111
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 3)
  %125 = add i64 %pgocount4, 1
  store i64 %125, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 3)
  %126 = load i32, i32* %6, align 4
  %127 = add nsw i32 %126, 1
  store i32 %127, i32* %6, align 4
  br label %108

; <label>:128:                                    ; preds = %108
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 9)
  %129 = add i64 %pgocount5, 1
  store i64 %129, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 9)
  br label %283

; <label>:130:                                    ; preds = %66
  %131 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %132 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %131, i32 0, i32 2
  %133 = load i32, i32* %5, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [4 x i32*], [4 x i32*]* %132, i64 0, i64 %134
  %136 = load i32*, i32** %135, align 8
  %137 = icmp eq i32* %136, null
  br i1 %137, label %138, label %155

; <label>:138:                                    ; preds = %130
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 11)
  %139 = add i64 %pgocount6, 1
  store i64 %139, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 11)
  %140 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %141 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %140, i32 0, i32 1
  %142 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %141, align 8
  %143 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %142, i32 0, i32 0
  %144 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %143, align 8
  %145 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %146 = bitcast %struct.jpeg_compress_struct* %145 to %struct.jpeg_common_struct*
  %147 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %144 to i64
  call void @__llvm_profile_instrument_target(i64 %147, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_fdctmgr to i8*), i32 2)
  %148 = call i8* %144(%struct.jpeg_common_struct* %146, i32 1, i64 256)
  %149 = bitcast i8* %148 to i32*
  %150 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %151 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %150, i32 0, i32 2
  %152 = load i32, i32* %5, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [4 x i32*], [4 x i32*]* %151, i64 0, i64 %153
  store i32* %149, i32** %154, align 8
  br label %155

; <label>:155:                                    ; preds = %138, %130
  %156 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %157 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %156, i32 0, i32 2
  %158 = load i32, i32* %5, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [4 x i32*], [4 x i32*]* %157, i64 0, i64 %159
  %161 = load i32*, i32** %160, align 8
  store i32* %161, i32** %9, align 8
  store i32 0, i32* %6, align 4
  br label %162

; <label>:162:                                    ; preds = %186, %155
  %163 = load i32, i32* %6, align 4
  %164 = icmp slt i32 %163, 64
  br i1 %164, label %165, label %190

; <label>:165:                                    ; preds = %162
  %166 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %8, align 8
  %167 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %166, i32 0, i32 0
  %168 = load i32, i32* %6, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [64 x i16], [64 x i16]* %167, i64 0, i64 %169
  %171 = load i16, i16* %170, align 2
  %172 = zext i16 %171 to i64
  %173 = load i32, i32* %6, align 4
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [64 x i16], [64 x i16]* @start_pass_fdctmgr.aanscales, i64 0, i64 %174
  %176 = load i16, i16* %175, align 2
  %177 = sext i16 %176 to i64
  %178 = mul nsw i64 %172, %177
  %179 = add nsw i64 %178, 1024
  %180 = ashr i64 %179, 11
  %181 = trunc i64 %180 to i32
  %182 = load i32*, i32** %9, align 8
  %183 = load i32, i32* %6, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds i32, i32* %182, i64 %184
  store i32 %181, i32* %185, align 4
  br label %186

; <label>:186:                                    ; preds = %165
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 1)
  %187 = add i64 %pgocount7, 1
  store i64 %187, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 1)
  %188 = load i32, i32* %6, align 4
  %189 = add nsw i32 %188, 1
  store i32 %189, i32* %6, align 4
  br label %162

; <label>:190:                                    ; preds = %162
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 7)
  %191 = add i64 %pgocount8, 1
  store i64 %191, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 7)
  br label %283

; <label>:192:                                    ; preds = %66
  %193 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %194 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %193, i32 0, i32 4
  %195 = load i32, i32* %5, align 4
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds [4 x float*], [4 x float*]* %194, i64 0, i64 %196
  %198 = load float*, float** %197, align 8
  %199 = icmp eq float* %198, null
  br i1 %199, label %200, label %217

; <label>:200:                                    ; preds = %192
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 12)
  %201 = add i64 %pgocount9, 1
  store i64 %201, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 12)
  %202 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %203 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %202, i32 0, i32 1
  %204 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %203, align 8
  %205 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %204, i32 0, i32 0
  %206 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %205, align 8
  %207 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %208 = bitcast %struct.jpeg_compress_struct* %207 to %struct.jpeg_common_struct*
  %209 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %206 to i64
  call void @__llvm_profile_instrument_target(i64 %209, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_fdctmgr to i8*), i32 3)
  %210 = call i8* %206(%struct.jpeg_common_struct* %208, i32 1, i64 256)
  %211 = bitcast i8* %210 to float*
  %212 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %213 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %212, i32 0, i32 4
  %214 = load i32, i32* %5, align 4
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds [4 x float*], [4 x float*]* %213, i64 0, i64 %215
  store float* %211, float** %216, align 8
  br label %217

; <label>:217:                                    ; preds = %200, %192
  %218 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %219 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %218, i32 0, i32 4
  %220 = load i32, i32* %5, align 4
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [4 x float*], [4 x float*]* %219, i64 0, i64 %221
  %223 = load float*, float** %222, align 8
  store float* %223, float** %10, align 8
  store i32 0, i32* %6, align 4
  store i32 0, i32* %11, align 4
  br label %224

; <label>:224:                                    ; preds = %263, %217
  %225 = load i32, i32* %11, align 4
  %226 = icmp slt i32 %225, 8
  br i1 %226, label %227, label %267

; <label>:227:                                    ; preds = %224
  store i32 0, i32* %12, align 4
  br label %228

; <label>:228:                                    ; preds = %258, %227
  %229 = load i32, i32* %12, align 4
  %230 = icmp slt i32 %229, 8
  br i1 %230, label %231, label %262

; <label>:231:                                    ; preds = %228
  %232 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %8, align 8
  %233 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %232, i32 0, i32 0
  %234 = load i32, i32* %6, align 4
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [64 x i16], [64 x i16]* %233, i64 0, i64 %235
  %237 = load i16, i16* %236, align 2
  %238 = uitofp i16 %237 to double
  %239 = load i32, i32* %11, align 4
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [8 x double], [8 x double]* @start_pass_fdctmgr.aanscalefactor, i64 0, i64 %240
  %242 = load double, double* %241, align 8
  %243 = fmul double %238, %242
  %244 = load i32, i32* %12, align 4
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds [8 x double], [8 x double]* @start_pass_fdctmgr.aanscalefactor, i64 0, i64 %245
  %247 = load double, double* %246, align 8
  %248 = fmul double %243, %247
  %249 = fmul double %248, 8.000000e+00
  %250 = fdiv double 1.000000e+00, %249
  %251 = fptrunc double %250 to float
  %252 = load float*, float** %10, align 8
  %253 = load i32, i32* %6, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds float, float* %252, i64 %254
  store float %251, float* %255, align 4
  %256 = load i32, i32* %6, align 4
  %257 = add nsw i32 %256, 1
  store i32 %257, i32* %6, align 4
  br label %258

; <label>:258:                                    ; preds = %231
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 0)
  %259 = add i64 %pgocount10, 1
  store i64 %259, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 0)
  %260 = load i32, i32* %12, align 4
  %261 = add nsw i32 %260, 1
  store i32 %261, i32* %12, align 4
  br label %228

; <label>:262:                                    ; preds = %228
  br label %263

; <label>:263:                                    ; preds = %262
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 2)
  %264 = add i64 %pgocount11, 1
  store i64 %264, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 2)
  %265 = load i32, i32* %11, align 4
  %266 = add nsw i32 %265, 1
  store i32 %266, i32* %11, align 4
  br label %224

; <label>:267:                                    ; preds = %224
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 8)
  %268 = add i64 %pgocount12, 1
  store i64 %268, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 8)
  br label %283

; <label>:269:                                    ; preds = %66
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 10)
  %270 = add i64 %pgocount13, 1
  store i64 %270, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 10)
  %271 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %272 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %271, i32 0, i32 0
  %273 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %272, align 8
  %274 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %273, i32 0, i32 5
  store i32 47, i32* %274, align 8
  %275 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %276 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %275, i32 0, i32 0
  %277 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %276, align 8
  %278 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %277, i32 0, i32 0
  %279 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %278, align 8
  %280 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %281 = bitcast %struct.jpeg_compress_struct* %280 to %struct.jpeg_common_struct*
  %282 = ptrtoint void (%struct.jpeg_common_struct*)* %279 to i64
  call void @__llvm_profile_instrument_target(i64 %282, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_fdctmgr to i8*), i32 4)
  call void %279(%struct.jpeg_common_struct* %281)
  br label %283

; <label>:283:                                    ; preds = %269, %267, %190, %128
  br label %284

; <label>:284:                                    ; preds = %283
  %285 = load i32, i32* %4, align 4
  %286 = add nsw i32 %285, 1
  store i32 %286, i32* %4, align 4
  %287 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %288 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %287, i32 1
  store %struct.jpeg_component_info* %288, %struct.jpeg_component_info** %7, align 8
  br label %20

; <label>:289:                                    ; preds = %20
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 14)
  %290 = add i64 %pgocount14, 1
  store i64 %290, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_start_pass_fdctmgr, i64 0, i64 14)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @forward_DCT(%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32) #0 {
  %8 = alloca %struct.jpeg_compress_struct*, align 8
  %9 = alloca %struct.jpeg_component_info*, align 8
  %10 = alloca i8**, align 8
  %11 = alloca [64 x i16]*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca %struct.my_fdct_controller*, align 8
  %16 = alloca void (i32*)*, align 8
  %17 = alloca i32*, align 8
  %18 = alloca [64 x i32], align 16
  %19 = alloca i32, align 4
  %20 = alloca i32*, align 8
  %21 = alloca i8*, align 8
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i16*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %8, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %9, align 8
  store i8** %2, i8*** %10, align 8
  store [64 x i16]* %3, [64 x i16]** %11, align 8
  store i32 %4, i32* %12, align 4
  store i32 %5, i32* %13, align 4
  store i32 %6, i32* %14, align 4
  %27 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %27, i32 0, i32 58
  %29 = load %struct.jpeg_forward_dct*, %struct.jpeg_forward_dct** %28, align 8
  %30 = bitcast %struct.jpeg_forward_dct* %29 to %struct.my_fdct_controller*
  store %struct.my_fdct_controller* %30, %struct.my_fdct_controller** %15, align 8
  %31 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %15, align 8
  %32 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %31, i32 0, i32 1
  %33 = load void (i32*)*, void (i32*)** %32, align 8
  store void (i32*)* %33, void (i32*)** %16, align 8
  %34 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %15, align 8
  %35 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %34, i32 0, i32 2
  %36 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %9, align 8
  %37 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %36, i32 0, i32 4
  %38 = load i32, i32* %37, align 8
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [4 x i32*], [4 x i32*]* %35, i64 0, i64 %39
  %41 = load i32*, i32** %40, align 8
  store i32* %41, i32** %17, align 8
  %42 = load i32, i32* %12, align 4
  %43 = load i8**, i8*** %10, align 8
  %44 = zext i32 %42 to i64
  %45 = getelementptr inbounds i8*, i8** %43, i64 %44
  store i8** %45, i8*** %10, align 8
  store i32 0, i32* %19, align 4
  br label %46

; <label>:46:                                     ; preds = %195, %7
  %47 = load i32, i32* %19, align 4
  %48 = load i32, i32* %14, align 4
  %49 = icmp ult i32 %47, %48
  br i1 %49, label %50, label %201

; <label>:50:                                     ; preds = %46
  %51 = getelementptr inbounds [64 x i32], [64 x i32]* %18, i32 0, i32 0
  store i32* %51, i32** %20, align 8
  store i32 0, i32* %22, align 4
  br label %52

; <label>:52:                                     ; preds = %120, %50
  %53 = load i32, i32* %22, align 4
  %54 = icmp slt i32 %53, 8
  br i1 %54, label %55, label %124

; <label>:55:                                     ; preds = %52
  %56 = load i8**, i8*** %10, align 8
  %57 = load i32, i32* %22, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8*, i8** %56, i64 %58
  %60 = load i8*, i8** %59, align 8
  %61 = load i32, i32* %13, align 4
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8* %60, i64 %62
  store i8* %63, i8** %21, align 8
  %64 = load i8*, i8** %21, align 8
  %65 = getelementptr inbounds i8, i8* %64, i32 1
  store i8* %65, i8** %21, align 8
  %66 = load i8, i8* %64, align 1
  %67 = zext i8 %66 to i32
  %68 = sub nsw i32 %67, 128
  %69 = load i32*, i32** %20, align 8
  %70 = getelementptr inbounds i32, i32* %69, i32 1
  store i32* %70, i32** %20, align 8
  store i32 %68, i32* %69, align 4
  %71 = load i8*, i8** %21, align 8
  %72 = getelementptr inbounds i8, i8* %71, i32 1
  store i8* %72, i8** %21, align 8
  %73 = load i8, i8* %71, align 1
  %74 = zext i8 %73 to i32
  %75 = sub nsw i32 %74, 128
  %76 = load i32*, i32** %20, align 8
  %77 = getelementptr inbounds i32, i32* %76, i32 1
  store i32* %77, i32** %20, align 8
  store i32 %75, i32* %76, align 4
  %78 = load i8*, i8** %21, align 8
  %79 = getelementptr inbounds i8, i8* %78, i32 1
  store i8* %79, i8** %21, align 8
  %80 = load i8, i8* %78, align 1
  %81 = zext i8 %80 to i32
  %82 = sub nsw i32 %81, 128
  %83 = load i32*, i32** %20, align 8
  %84 = getelementptr inbounds i32, i32* %83, i32 1
  store i32* %84, i32** %20, align 8
  store i32 %82, i32* %83, align 4
  %85 = load i8*, i8** %21, align 8
  %86 = getelementptr inbounds i8, i8* %85, i32 1
  store i8* %86, i8** %21, align 8
  %87 = load i8, i8* %85, align 1
  %88 = zext i8 %87 to i32
  %89 = sub nsw i32 %88, 128
  %90 = load i32*, i32** %20, align 8
  %91 = getelementptr inbounds i32, i32* %90, i32 1
  store i32* %91, i32** %20, align 8
  store i32 %89, i32* %90, align 4
  %92 = load i8*, i8** %21, align 8
  %93 = getelementptr inbounds i8, i8* %92, i32 1
  store i8* %93, i8** %21, align 8
  %94 = load i8, i8* %92, align 1
  %95 = zext i8 %94 to i32
  %96 = sub nsw i32 %95, 128
  %97 = load i32*, i32** %20, align 8
  %98 = getelementptr inbounds i32, i32* %97, i32 1
  store i32* %98, i32** %20, align 8
  store i32 %96, i32* %97, align 4
  %99 = load i8*, i8** %21, align 8
  %100 = getelementptr inbounds i8, i8* %99, i32 1
  store i8* %100, i8** %21, align 8
  %101 = load i8, i8* %99, align 1
  %102 = zext i8 %101 to i32
  %103 = sub nsw i32 %102, 128
  %104 = load i32*, i32** %20, align 8
  %105 = getelementptr inbounds i32, i32* %104, i32 1
  store i32* %105, i32** %20, align 8
  store i32 %103, i32* %104, align 4
  %106 = load i8*, i8** %21, align 8
  %107 = getelementptr inbounds i8, i8* %106, i32 1
  store i8* %107, i8** %21, align 8
  %108 = load i8, i8* %106, align 1
  %109 = zext i8 %108 to i32
  %110 = sub nsw i32 %109, 128
  %111 = load i32*, i32** %20, align 8
  %112 = getelementptr inbounds i32, i32* %111, i32 1
  store i32* %112, i32** %20, align 8
  store i32 %110, i32* %111, align 4
  %113 = load i8*, i8** %21, align 8
  %114 = getelementptr inbounds i8, i8* %113, i32 1
  store i8* %114, i8** %21, align 8
  %115 = load i8, i8* %113, align 1
  %116 = zext i8 %115 to i32
  %117 = sub nsw i32 %116, 128
  %118 = load i32*, i32** %20, align 8
  %119 = getelementptr inbounds i32, i32* %118, i32 1
  store i32* %119, i32** %20, align 8
  store i32 %117, i32* %118, align 4
  br label %120

; <label>:120:                                    ; preds = %55
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_forward_DCT, i64 0, i64 0)
  %121 = add i64 %pgocount, 1
  store i64 %121, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_forward_DCT, i64 0, i64 0)
  %122 = load i32, i32* %22, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %22, align 4
  br label %52

; <label>:124:                                    ; preds = %52
  %125 = load void (i32*)*, void (i32*)** %16, align 8
  %126 = getelementptr inbounds [64 x i32], [64 x i32]* %18, i32 0, i32 0
  %127 = ptrtoint void (i32*)* %125 to i64
  call void @__llvm_profile_instrument_target(i64 %127, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_forward_DCT to i8*), i32 0)
  call void %125(i32* %126)
  %128 = load [64 x i16]*, [64 x i16]** %11, align 8
  %129 = load i32, i32* %19, align 4
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds [64 x i16], [64 x i16]* %128, i64 %130
  %132 = getelementptr inbounds [64 x i16], [64 x i16]* %131, i32 0, i32 0
  store i16* %132, i16** %26, align 8
  store i32 0, i32* %25, align 4
  br label %133

; <label>:133:                                    ; preds = %191, %124
  %134 = load i32, i32* %25, align 4
  %135 = icmp slt i32 %134, 64
  br i1 %135, label %136, label %194

; <label>:136:                                    ; preds = %133
  %137 = load i32*, i32** %17, align 8
  %138 = load i32, i32* %25, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i32, i32* %137, i64 %139
  %141 = load i32, i32* %140, align 4
  store i32 %141, i32* %24, align 4
  %142 = load i32, i32* %25, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [64 x i32], [64 x i32]* %18, i64 0, i64 %143
  %145 = load i32, i32* %144, align 4
  store i32 %145, i32* %23, align 4
  %146 = load i32, i32* %23, align 4
  %147 = icmp slt i32 %146, 0
  br i1 %147, label %148, label %168

; <label>:148:                                    ; preds = %136
  %149 = load i32, i32* %23, align 4
  %150 = sub nsw i32 0, %149
  store i32 %150, i32* %23, align 4
  %151 = load i32, i32* %24, align 4
  %152 = ashr i32 %151, 1
  %153 = load i32, i32* %23, align 4
  %154 = add nsw i32 %153, %152
  store i32 %154, i32* %23, align 4
  %155 = load i32, i32* %23, align 4
  %156 = load i32, i32* %24, align 4
  %157 = icmp sge i32 %155, %156
  br i1 %157, label %158, label %163

; <label>:158:                                    ; preds = %148
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_forward_DCT, i64 0, i64 3)
  %159 = add i64 %pgocount1, 1
  store i64 %159, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_forward_DCT, i64 0, i64 3)
  %160 = load i32, i32* %24, align 4
  %161 = load i32, i32* %23, align 4
  %162 = sdiv i32 %161, %160
  store i32 %162, i32* %23, align 4
  br label %165

; <label>:163:                                    ; preds = %148
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_forward_DCT, i64 0, i64 4)
  %164 = add i64 %pgocount2, 1
  store i64 %164, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_forward_DCT, i64 0, i64 4)
  store i32 0, i32* %23, align 4
  br label %165

; <label>:165:                                    ; preds = %163, %158
  %166 = load i32, i32* %23, align 4
  %167 = sub nsw i32 0, %166
  store i32 %167, i32* %23, align 4
  br label %184

; <label>:168:                                    ; preds = %136
  %169 = load i32, i32* %24, align 4
  %170 = ashr i32 %169, 1
  %171 = load i32, i32* %23, align 4
  %172 = add nsw i32 %171, %170
  store i32 %172, i32* %23, align 4
  %173 = load i32, i32* %23, align 4
  %174 = load i32, i32* %24, align 4
  %175 = icmp sge i32 %173, %174
  br i1 %175, label %176, label %181

; <label>:176:                                    ; preds = %168
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_forward_DCT, i64 0, i64 1)
  %177 = add i64 %pgocount3, 1
  store i64 %177, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_forward_DCT, i64 0, i64 1)
  %178 = load i32, i32* %24, align 4
  %179 = load i32, i32* %23, align 4
  %180 = sdiv i32 %179, %178
  store i32 %180, i32* %23, align 4
  br label %183

; <label>:181:                                    ; preds = %168
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_forward_DCT, i64 0, i64 2)
  %182 = add i64 %pgocount4, 1
  store i64 %182, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_forward_DCT, i64 0, i64 2)
  store i32 0, i32* %23, align 4
  br label %183

; <label>:183:                                    ; preds = %181, %176
  br label %184

; <label>:184:                                    ; preds = %183, %165
  %185 = load i32, i32* %23, align 4
  %186 = trunc i32 %185 to i16
  %187 = load i16*, i16** %26, align 8
  %188 = load i32, i32* %25, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds i16, i16* %187, i64 %189
  store i16 %186, i16* %190, align 2
  br label %191

; <label>:191:                                    ; preds = %184
  %192 = load i32, i32* %25, align 4
  %193 = add nsw i32 %192, 1
  store i32 %193, i32* %25, align 4
  br label %133

; <label>:194:                                    ; preds = %133
  br label %195

; <label>:195:                                    ; preds = %194
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_forward_DCT, i64 0, i64 5)
  %196 = add i64 %pgocount5, 1
  store i64 %196, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_forward_DCT, i64 0, i64 5)
  %197 = load i32, i32* %19, align 4
  %198 = add i32 %197, 1
  store i32 %198, i32* %19, align 4
  %199 = load i32, i32* %13, align 4
  %200 = add i32 %199, 8
  store i32 %200, i32* %13, align 4
  br label %46

; <label>:201:                                    ; preds = %46
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_forward_DCT, i64 0, i64 6)
  %202 = add i64 %pgocount6, 1
  store i64 %202, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_forward_DCT, i64 0, i64 6)
  ret void
}

declare void @jpeg_fdct_islow(i32*) #1

declare void @jpeg_fdct_ifast(i32*) #1

; Function Attrs: nounwind uwtable
define internal void @forward_DCT_float(%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32) #0 {
  %8 = alloca %struct.jpeg_compress_struct*, align 8
  %9 = alloca %struct.jpeg_component_info*, align 8
  %10 = alloca i8**, align 8
  %11 = alloca [64 x i16]*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca %struct.my_fdct_controller*, align 8
  %16 = alloca void (float*)*, align 8
  %17 = alloca float*, align 8
  %18 = alloca [64 x float], align 16
  %19 = alloca i32, align 4
  %20 = alloca float*, align 8
  %21 = alloca i8*, align 8
  %22 = alloca i32, align 4
  %23 = alloca float, align 4
  %24 = alloca i32, align 4
  %25 = alloca i16*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %8, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %9, align 8
  store i8** %2, i8*** %10, align 8
  store [64 x i16]* %3, [64 x i16]** %11, align 8
  store i32 %4, i32* %12, align 4
  store i32 %5, i32* %13, align 4
  store i32 %6, i32* %14, align 4
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %26, i32 0, i32 58
  %28 = load %struct.jpeg_forward_dct*, %struct.jpeg_forward_dct** %27, align 8
  %29 = bitcast %struct.jpeg_forward_dct* %28 to %struct.my_fdct_controller*
  store %struct.my_fdct_controller* %29, %struct.my_fdct_controller** %15, align 8
  %30 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %15, align 8
  %31 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %30, i32 0, i32 3
  %32 = load void (float*)*, void (float*)** %31, align 8
  store void (float*)* %32, void (float*)** %16, align 8
  %33 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %15, align 8
  %34 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %33, i32 0, i32 4
  %35 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %9, align 8
  %36 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %35, i32 0, i32 4
  %37 = load i32, i32* %36, align 8
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [4 x float*], [4 x float*]* %34, i64 0, i64 %38
  %40 = load float*, float** %39, align 8
  store float* %40, float** %17, align 8
  %41 = load i32, i32* %12, align 4
  %42 = load i8**, i8*** %10, align 8
  %43 = zext i32 %41 to i64
  %44 = getelementptr inbounds i8*, i8** %42, i64 %43
  store i8** %44, i8*** %10, align 8
  store i32 0, i32* %19, align 4
  br label %45

; <label>:45:                                     ; preds = %168, %7
  %46 = load i32, i32* %19, align 4
  %47 = load i32, i32* %14, align 4
  %48 = icmp ult i32 %46, %47
  br i1 %48, label %49, label %174

; <label>:49:                                     ; preds = %45
  %50 = getelementptr inbounds [64 x float], [64 x float]* %18, i32 0, i32 0
  store float* %50, float** %20, align 8
  store i32 0, i32* %22, align 4
  br label %51

; <label>:51:                                     ; preds = %127, %49
  %52 = load i32, i32* %22, align 4
  %53 = icmp slt i32 %52, 8
  br i1 %53, label %54, label %131

; <label>:54:                                     ; preds = %51
  %55 = load i8**, i8*** %10, align 8
  %56 = load i32, i32* %22, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8*, i8** %55, i64 %57
  %59 = load i8*, i8** %58, align 8
  %60 = load i32, i32* %13, align 4
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8* %59, i64 %61
  store i8* %62, i8** %21, align 8
  %63 = load i8*, i8** %21, align 8
  %64 = getelementptr inbounds i8, i8* %63, i32 1
  store i8* %64, i8** %21, align 8
  %65 = load i8, i8* %63, align 1
  %66 = zext i8 %65 to i32
  %67 = sub nsw i32 %66, 128
  %68 = sitofp i32 %67 to float
  %69 = load float*, float** %20, align 8
  %70 = getelementptr inbounds float, float* %69, i32 1
  store float* %70, float** %20, align 8
  store float %68, float* %69, align 4
  %71 = load i8*, i8** %21, align 8
  %72 = getelementptr inbounds i8, i8* %71, i32 1
  store i8* %72, i8** %21, align 8
  %73 = load i8, i8* %71, align 1
  %74 = zext i8 %73 to i32
  %75 = sub nsw i32 %74, 128
  %76 = sitofp i32 %75 to float
  %77 = load float*, float** %20, align 8
  %78 = getelementptr inbounds float, float* %77, i32 1
  store float* %78, float** %20, align 8
  store float %76, float* %77, align 4
  %79 = load i8*, i8** %21, align 8
  %80 = getelementptr inbounds i8, i8* %79, i32 1
  store i8* %80, i8** %21, align 8
  %81 = load i8, i8* %79, align 1
  %82 = zext i8 %81 to i32
  %83 = sub nsw i32 %82, 128
  %84 = sitofp i32 %83 to float
  %85 = load float*, float** %20, align 8
  %86 = getelementptr inbounds float, float* %85, i32 1
  store float* %86, float** %20, align 8
  store float %84, float* %85, align 4
  %87 = load i8*, i8** %21, align 8
  %88 = getelementptr inbounds i8, i8* %87, i32 1
  store i8* %88, i8** %21, align 8
  %89 = load i8, i8* %87, align 1
  %90 = zext i8 %89 to i32
  %91 = sub nsw i32 %90, 128
  %92 = sitofp i32 %91 to float
  %93 = load float*, float** %20, align 8
  %94 = getelementptr inbounds float, float* %93, i32 1
  store float* %94, float** %20, align 8
  store float %92, float* %93, align 4
  %95 = load i8*, i8** %21, align 8
  %96 = getelementptr inbounds i8, i8* %95, i32 1
  store i8* %96, i8** %21, align 8
  %97 = load i8, i8* %95, align 1
  %98 = zext i8 %97 to i32
  %99 = sub nsw i32 %98, 128
  %100 = sitofp i32 %99 to float
  %101 = load float*, float** %20, align 8
  %102 = getelementptr inbounds float, float* %101, i32 1
  store float* %102, float** %20, align 8
  store float %100, float* %101, align 4
  %103 = load i8*, i8** %21, align 8
  %104 = getelementptr inbounds i8, i8* %103, i32 1
  store i8* %104, i8** %21, align 8
  %105 = load i8, i8* %103, align 1
  %106 = zext i8 %105 to i32
  %107 = sub nsw i32 %106, 128
  %108 = sitofp i32 %107 to float
  %109 = load float*, float** %20, align 8
  %110 = getelementptr inbounds float, float* %109, i32 1
  store float* %110, float** %20, align 8
  store float %108, float* %109, align 4
  %111 = load i8*, i8** %21, align 8
  %112 = getelementptr inbounds i8, i8* %111, i32 1
  store i8* %112, i8** %21, align 8
  %113 = load i8, i8* %111, align 1
  %114 = zext i8 %113 to i32
  %115 = sub nsw i32 %114, 128
  %116 = sitofp i32 %115 to float
  %117 = load float*, float** %20, align 8
  %118 = getelementptr inbounds float, float* %117, i32 1
  store float* %118, float** %20, align 8
  store float %116, float* %117, align 4
  %119 = load i8*, i8** %21, align 8
  %120 = getelementptr inbounds i8, i8* %119, i32 1
  store i8* %120, i8** %21, align 8
  %121 = load i8, i8* %119, align 1
  %122 = zext i8 %121 to i32
  %123 = sub nsw i32 %122, 128
  %124 = sitofp i32 %123 to float
  %125 = load float*, float** %20, align 8
  %126 = getelementptr inbounds float, float* %125, i32 1
  store float* %126, float** %20, align 8
  store float %124, float* %125, align 4
  br label %127

; <label>:127:                                    ; preds = %54
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forward_DCT_float, i64 0, i64 0)
  %128 = add i64 %pgocount, 1
  store i64 %128, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forward_DCT_float, i64 0, i64 0)
  %129 = load i32, i32* %22, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, i32* %22, align 4
  br label %51

; <label>:131:                                    ; preds = %51
  %132 = load void (float*)*, void (float*)** %16, align 8
  %133 = getelementptr inbounds [64 x float], [64 x float]* %18, i32 0, i32 0
  %134 = ptrtoint void (float*)* %132 to i64
  call void @__llvm_profile_instrument_target(i64 %134, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_forward_DCT_float to i8*), i32 0)
  call void %132(float* %133)
  %135 = load [64 x i16]*, [64 x i16]** %11, align 8
  %136 = load i32, i32* %19, align 4
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds [64 x i16], [64 x i16]* %135, i64 %137
  %139 = getelementptr inbounds [64 x i16], [64 x i16]* %138, i32 0, i32 0
  store i16* %139, i16** %25, align 8
  store i32 0, i32* %24, align 4
  br label %140

; <label>:140:                                    ; preds = %163, %131
  %141 = load i32, i32* %24, align 4
  %142 = icmp slt i32 %141, 64
  br i1 %142, label %143, label %167

; <label>:143:                                    ; preds = %140
  %144 = load i32, i32* %24, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [64 x float], [64 x float]* %18, i64 0, i64 %145
  %147 = load float, float* %146, align 4
  %148 = load float*, float** %17, align 8
  %149 = load i32, i32* %24, align 4
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float* %148, i64 %150
  %152 = load float, float* %151, align 4
  %153 = fmul float %147, %152
  store float %153, float* %23, align 4
  %154 = load float, float* %23, align 4
  %155 = fadd float %154, 1.638450e+04
  %156 = fptosi float %155 to i32
  %157 = sub nsw i32 %156, 16384
  %158 = trunc i32 %157 to i16
  %159 = load i16*, i16** %25, align 8
  %160 = load i32, i32* %24, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds i16, i16* %159, i64 %161
  store i16 %158, i16* %162, align 2
  br label %163

; <label>:163:                                    ; preds = %143
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forward_DCT_float, i64 0, i64 1)
  %164 = add i64 %pgocount1, 1
  store i64 %164, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forward_DCT_float, i64 0, i64 1)
  %165 = load i32, i32* %24, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, i32* %24, align 4
  br label %140

; <label>:167:                                    ; preds = %140
  br label %168

; <label>:168:                                    ; preds = %167
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forward_DCT_float, i64 0, i64 2)
  %169 = add i64 %pgocount2, 1
  store i64 %169, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forward_DCT_float, i64 0, i64 2)
  %170 = load i32, i32* %19, align 4
  %171 = add i32 %170, 1
  store i32 %171, i32* %19, align 4
  %172 = load i32, i32* %13, align 4
  %173 = add i32 %172, 8
  store i32 %173, i32* %13, align 4
  br label %45

; <label>:174:                                    ; preds = %45
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forward_DCT_float, i64 0, i64 3)
  %175 = add i64 %pgocount3, 1
  store i64 %175, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_forward_DCT_float, i64 0, i64 3)
  ret void
}

declare void @jpeg_fdct_float(float*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

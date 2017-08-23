; ModuleID = 'tmp1.ll'
source_filename = "jccolor.c"
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
%struct.my_color_converter = type { %struct.jpeg_color_converter, i64* }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_color_converter = private constant [21 x i8] c"jinit_color_converter"
@__profn_tmp1.ll_null_method = private constant [19 x i8] c"tmp1.ll:null_method"
@__profn_tmp1.ll_grayscale_convert = private constant [25 x i8] c"tmp1.ll:grayscale_convert"
@__profn_tmp1.ll_rgb_ycc_start = private constant [21 x i8] c"tmp1.ll:rgb_ycc_start"
@__profn_tmp1.ll_rgb_gray_convert = private constant [24 x i8] c"tmp1.ll:rgb_gray_convert"
@__profn_tmp1.ll_null_convert = private constant [20 x i8] c"tmp1.ll:null_convert"
@__profn_tmp1.ll_rgb_ycc_convert = private constant [23 x i8] c"tmp1.ll:rgb_ycc_convert"
@__profn_tmp1.ll_cmyk_ycck_convert = private constant [25 x i8] c"tmp1.ll:cmyk_ycck_convert"
@__profc_jinit_color_converter = private global [31 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_color_converter = private global [16 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_color_converter = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -882500084000100671, i64 4503997521814079, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @jinit_color_converter to i8*), i8* bitcast ([16 x i64]* @__profvp_jinit_color_converter to i8*), i32 31, [1 x i16] [i16 16] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_null_method = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_null_method = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7258165466471657268, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_null_method, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @null_method to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_grayscale_convert = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_grayscale_convert = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1075889409965712259, i64 50970046531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_grayscale_convert, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* @grayscale_convert to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_rgb_ycc_start = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_rgb_ycc_start = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_rgb_ycc_start = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5645930342834766509, i64 281509114370972, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_rgb_ycc_start, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @rgb_ycc_start to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_rgb_ycc_start to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_rgb_gray_convert = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_rgb_gray_convert = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9206116717755477550, i64 50970046531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_rgb_gray_convert, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* @rgb_gray_convert to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_null_convert = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_null_convert = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3040314690916655055, i64 71176556453, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* @null_convert to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_rgb_ycc_convert = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_rgb_ycc_convert = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4421178911497307498, i64 50970046531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_rgb_ycc_convert, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* @rgb_ycc_convert to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_cmyk_ycck_convert = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_cmyk_ycck_convert = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -792263404728725456, i64 50970046531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_cmyk_ycck_convert, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* @cmyk_ycck_convert to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [17 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [97 x i8] c"\B9\01^x\DA\CB\CA\CC\CB,\89O\CE\CF\C9/\02\92ye\A9E%\A9E\8C%\B9\05\86z99Vy\A599\F1\B9\A9%\19\F9)p\B1\F4\A2\C4\CA\E2\E4\C4\9CT\98z\B8LQzR|err|qI\22\9A(H\0F\86r\B0\E1\B8\CC@\17O\CE\AD\CC\06Id\C3d\00\99_Fc", section "__llvm_prf_names"
@llvm.used = appending global [10 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_converter to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_null_method to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_grayscale_convert to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_rgb_ycc_start to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_rgb_gray_convert to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_null_convert to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_rgb_ycc_convert to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_cmyk_ycck_convert to i8*), i8* bitcast ([17 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([97 x i8], [97 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jinit_color_converter(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.my_color_converter*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %4, i32 0, i32 1
  %6 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %6, i32 0, i32 0
  %8 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %7, align 8
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %10 = bitcast %struct.jpeg_compress_struct* %9 to %struct.jpeg_common_struct*
  %11 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %8 to i64
  call void @__llvm_profile_instrument_target(i64 %11, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_converter to i8*), i32 0)
  %12 = call i8* %8(%struct.jpeg_common_struct* %10, i32 1, i64 24)
  %13 = bitcast i8* %12 to %struct.my_color_converter*
  store %struct.my_color_converter* %13, %struct.my_color_converter** %3, align 8
  %14 = load %struct.my_color_converter*, %struct.my_color_converter** %3, align 8
  %15 = bitcast %struct.my_color_converter* %14 to %struct.jpeg_color_converter*
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 56
  store %struct.jpeg_color_converter* %15, %struct.jpeg_color_converter** %17, align 8
  %18 = load %struct.my_color_converter*, %struct.my_color_converter** %3, align 8
  %19 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %18, i32 0, i32 0
  %20 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %19, i32 0, i32 0
  %21 = bitcast {}** %20 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @null_method, void (%struct.jpeg_compress_struct*)** %21, align 8
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 9
  %24 = load i32, i32* %23, align 4
  switch i32 %24, label %89 [
    i32 1, label %27
    i32 2, label %._crit_edge
    i32 3, label %48
    i32 4, label %._crit_edge1
    i32 5, label %68
  ]

._crit_edge1:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 1)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 1)
  br label %68

._crit_edge:                                      ; preds = %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 0)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 0)
  br label %48

; <label>:27:                                     ; preds = %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 6)
  %28 = add i64 %pgocount3, 1
  store i64 %28, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 6)
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i32 0, i32 8
  %31 = load i32, i32* %30, align 8
  %32 = icmp ne i32 %31, 1
  br i1 %32, label %33, label %47

; <label>:33:                                     ; preds = %27
  %pgocount4 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 9)
  %34 = add i64 %pgocount4, 1
  store i64 %34, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 9)
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %35, i32 0, i32 0
  %37 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %37, i32 0, i32 5
  store i32 7, i32* %38, align 8
  %39 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %40 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %39, i32 0, i32 0
  %41 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %42 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %41, i32 0, i32 0
  %43 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %42, align 8
  %44 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %45 = bitcast %struct.jpeg_compress_struct* %44 to %struct.jpeg_common_struct*
  %46 = ptrtoint void (%struct.jpeg_common_struct*)* %43 to i64
  call void @__llvm_profile_instrument_target(i64 %46, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_converter to i8*), i32 1)
  call void %43(%struct.jpeg_common_struct* %45)
  br label %47

; <label>:47:                                     ; preds = %33, %27
  br label %110

; <label>:48:                                     ; preds = %._crit_edge, %1
  %49 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %50 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %49, i32 0, i32 8
  %51 = load i32, i32* %50, align 8
  %52 = icmp ne i32 %51, 3
  br i1 %52, label %53, label %67

; <label>:53:                                     ; preds = %48
  %pgocount5 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 3)
  %54 = add i64 %pgocount5, 1
  store i64 %54, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 3)
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %55, i32 0, i32 0
  %57 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %56, align 8
  %58 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %57, i32 0, i32 5
  store i32 7, i32* %58, align 8
  %59 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %59, i32 0, i32 0
  %61 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %60, align 8
  %62 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %61, i32 0, i32 0
  %63 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %62, align 8
  %64 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %65 = bitcast %struct.jpeg_compress_struct* %64 to %struct.jpeg_common_struct*
  %66 = ptrtoint void (%struct.jpeg_common_struct*)* %63 to i64
  call void @__llvm_profile_instrument_target(i64 %66, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_converter to i8*), i32 2)
  call void %63(%struct.jpeg_common_struct* %65)
  br label %67

; <label>:67:                                     ; preds = %53, %48
  br label %110

; <label>:68:                                     ; preds = %._crit_edge1, %1
  %69 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %70 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %69, i32 0, i32 8
  %71 = load i32, i32* %70, align 8
  %72 = icmp ne i32 %71, 4
  br i1 %72, label %73, label %87

; <label>:73:                                     ; preds = %68
  %pgocount6 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 4)
  %74 = add i64 %pgocount6, 1
  store i64 %74, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 4)
  %75 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %76 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %75, i32 0, i32 0
  %77 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %76, align 8
  %78 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %77, i32 0, i32 5
  store i32 7, i32* %78, align 8
  %79 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %80 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %79, i32 0, i32 0
  %81 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %82 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %81, i32 0, i32 0
  %83 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %82, align 8
  %84 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %85 = bitcast %struct.jpeg_compress_struct* %84 to %struct.jpeg_common_struct*
  %86 = ptrtoint void (%struct.jpeg_common_struct*)* %83 to i64
  call void @__llvm_profile_instrument_target(i64 %86, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_converter to i8*), i32 3)
  call void %83(%struct.jpeg_common_struct* %85)
  br label %87

; <label>:87:                                     ; preds = %73, %68
  %pgocount7 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 2)
  %88 = add i64 %pgocount7, 1
  store i64 %88, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 2)
  br label %110

; <label>:89:                                     ; preds = %1
  %pgocount8 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 5)
  %90 = add i64 %pgocount8, 1
  store i64 %90, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 5)
  %91 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %92 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %91, i32 0, i32 8
  %93 = load i32, i32* %92, align 8
  %94 = icmp slt i32 %93, 1
  br i1 %94, label %95, label %109

; <label>:95:                                     ; preds = %89
  %pgocount9 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 23)
  %96 = add i64 %pgocount9, 1
  store i64 %96, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 23)
  %97 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %98 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %97, i32 0, i32 0
  %99 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %98, align 8
  %100 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %99, i32 0, i32 5
  store i32 7, i32* %100, align 8
  %101 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %102 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %101, i32 0, i32 0
  %103 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %102, align 8
  %104 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %103, i32 0, i32 0
  %105 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %104, align 8
  %106 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %107 = bitcast %struct.jpeg_compress_struct* %106 to %struct.jpeg_common_struct*
  %108 = ptrtoint void (%struct.jpeg_common_struct*)* %105 to i64
  call void @__llvm_profile_instrument_target(i64 %108, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_converter to i8*), i32 4)
  call void %105(%struct.jpeg_common_struct* %107)
  br label %109

; <label>:109:                                    ; preds = %95, %89
  br label %110

; <label>:110:                                    ; preds = %109, %87, %67, %47
  %111 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %112 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %111, i32 0, i32 13
  %113 = load i32, i32* %112, align 8
  switch i32 %113, label %390 [
    i32 1, label %114
    i32 2, label %184
    i32 3, label %228
    i32 4, label %287
    i32 5, label %331
  ]

; <label>:114:                                    ; preds = %110
  %115 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %116 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %115, i32 0, i32 12
  %117 = load i32, i32* %116, align 4
  %118 = icmp ne i32 %117, 1
  br i1 %118, label %119, label %133

; <label>:119:                                    ; preds = %114
  %pgocount10 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 10)
  %120 = add i64 %pgocount10, 1
  store i64 %120, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 10)
  %121 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %122 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %121, i32 0, i32 0
  %123 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %122, align 8
  %124 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %123, i32 0, i32 5
  store i32 8, i32* %124, align 8
  %125 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %126 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %125, i32 0, i32 0
  %127 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %126, align 8
  %128 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %127, i32 0, i32 0
  %129 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %128, align 8
  %130 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %131 = bitcast %struct.jpeg_compress_struct* %130 to %struct.jpeg_common_struct*
  %132 = ptrtoint void (%struct.jpeg_common_struct*)* %129 to i64
  call void @__llvm_profile_instrument_target(i64 %132, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_converter to i8*), i32 5)
  call void %129(%struct.jpeg_common_struct* %131)
  br label %133

; <label>:133:                                    ; preds = %119, %114
  %134 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %135 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %134, i32 0, i32 9
  %136 = load i32, i32* %135, align 4
  %137 = icmp eq i32 %136, 1
  br i1 %137, label %138, label %143

; <label>:138:                                    ; preds = %133
  %pgocount11 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 11)
  %139 = add i64 %pgocount11, 1
  store i64 %139, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 11)
  %140 = load %struct.my_color_converter*, %struct.my_color_converter** %3, align 8
  %141 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %140, i32 0, i32 0
  %142 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %141, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* @grayscale_convert, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %142, align 8
  br label %183

; <label>:143:                                    ; preds = %133
  %144 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %145 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %144, i32 0, i32 9
  %146 = load i32, i32* %145, align 4
  %147 = icmp eq i32 %146, 2
  br i1 %147, label %148, label %157

; <label>:148:                                    ; preds = %143
  %pgocount12 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 24)
  %149 = add i64 %pgocount12, 1
  store i64 %149, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 24)
  %150 = load %struct.my_color_converter*, %struct.my_color_converter** %3, align 8
  %151 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %150, i32 0, i32 0
  %152 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %151, i32 0, i32 0
  %153 = bitcast {}** %152 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @rgb_ycc_start, void (%struct.jpeg_compress_struct*)** %153, align 8
  %154 = load %struct.my_color_converter*, %struct.my_color_converter** %3, align 8
  %155 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %154, i32 0, i32 0
  %156 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %155, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* @rgb_gray_convert, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %156, align 8
  br label %182

; <label>:157:                                    ; preds = %143
  %158 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %159 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %158, i32 0, i32 9
  %160 = load i32, i32* %159, align 4
  %161 = icmp eq i32 %160, 3
  br i1 %161, label %162, label %167

; <label>:162:                                    ; preds = %157
  %pgocount13 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 29)
  %163 = add i64 %pgocount13, 1
  store i64 %163, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 29)
  %164 = load %struct.my_color_converter*, %struct.my_color_converter** %3, align 8
  %165 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %164, i32 0, i32 0
  %166 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %165, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* @grayscale_convert, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %166, align 8
  br label %181

; <label>:167:                                    ; preds = %157
  %pgocount14 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 30)
  %168 = add i64 %pgocount14, 1
  store i64 %168, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 30)
  %169 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %170 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %169, i32 0, i32 0
  %171 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %170, align 8
  %172 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %171, i32 0, i32 5
  store i32 25, i32* %172, align 8
  %173 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %174 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %173, i32 0, i32 0
  %175 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %174, align 8
  %176 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %175, i32 0, i32 0
  %177 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %176, align 8
  %178 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %179 = bitcast %struct.jpeg_compress_struct* %178 to %struct.jpeg_common_struct*
  %180 = ptrtoint void (%struct.jpeg_common_struct*)* %177 to i64
  call void @__llvm_profile_instrument_target(i64 %180, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_converter to i8*), i32 6)
  call void %177(%struct.jpeg_common_struct* %179)
  br label %181

; <label>:181:                                    ; preds = %167, %162
  br label %182

; <label>:182:                                    ; preds = %181, %148
  br label %183

; <label>:183:                                    ; preds = %182, %138
  br label %426

; <label>:184:                                    ; preds = %110
  %185 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %186 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %185, i32 0, i32 12
  %187 = load i32, i32* %186, align 4
  %188 = icmp ne i32 %187, 3
  br i1 %188, label %189, label %203

; <label>:189:                                    ; preds = %184
  %pgocount15 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 12)
  %190 = add i64 %pgocount15, 1
  store i64 %190, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 12)
  %191 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %192 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %191, i32 0, i32 0
  %193 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %192, align 8
  %194 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %193, i32 0, i32 5
  store i32 8, i32* %194, align 8
  %195 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %196 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %195, i32 0, i32 0
  %197 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %196, align 8
  %198 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %197, i32 0, i32 0
  %199 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %198, align 8
  %200 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %201 = bitcast %struct.jpeg_compress_struct* %200 to %struct.jpeg_common_struct*
  %202 = ptrtoint void (%struct.jpeg_common_struct*)* %199 to i64
  call void @__llvm_profile_instrument_target(i64 %202, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_converter to i8*), i32 7)
  call void %199(%struct.jpeg_common_struct* %201)
  br label %203

; <label>:203:                                    ; preds = %189, %184
  %204 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %205 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %204, i32 0, i32 9
  %206 = load i32, i32* %205, align 4
  %207 = icmp eq i32 %206, 2
  br i1 %207, label %208, label %213

; <label>:208:                                    ; preds = %203
  %pgocount16 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 13)
  %209 = add i64 %pgocount16, 1
  store i64 %209, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 13)
  %210 = load %struct.my_color_converter*, %struct.my_color_converter** %3, align 8
  %211 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %210, i32 0, i32 0
  %212 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %211, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* @null_convert, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %212, align 8
  br label %227

; <label>:213:                                    ; preds = %203
  %pgocount17 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 14)
  %214 = add i64 %pgocount17, 1
  store i64 %214, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 14)
  %215 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %216 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %215, i32 0, i32 0
  %217 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %216, align 8
  %218 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %217, i32 0, i32 5
  store i32 25, i32* %218, align 8
  %219 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %220 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %219, i32 0, i32 0
  %221 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %220, align 8
  %222 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %221, i32 0, i32 0
  %223 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %222, align 8
  %224 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %225 = bitcast %struct.jpeg_compress_struct* %224 to %struct.jpeg_common_struct*
  %226 = ptrtoint void (%struct.jpeg_common_struct*)* %223 to i64
  call void @__llvm_profile_instrument_target(i64 %226, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_converter to i8*), i32 8)
  call void %223(%struct.jpeg_common_struct* %225)
  br label %227

; <label>:227:                                    ; preds = %213, %208
  br label %426

; <label>:228:                                    ; preds = %110
  %229 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %230 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %229, i32 0, i32 12
  %231 = load i32, i32* %230, align 4
  %232 = icmp ne i32 %231, 3
  br i1 %232, label %233, label %247

; <label>:233:                                    ; preds = %228
  %pgocount18 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 15)
  %234 = add i64 %pgocount18, 1
  store i64 %234, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 15)
  %235 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %236 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %235, i32 0, i32 0
  %237 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %236, align 8
  %238 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %237, i32 0, i32 5
  store i32 8, i32* %238, align 8
  %239 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %240 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %239, i32 0, i32 0
  %241 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %240, align 8
  %242 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %241, i32 0, i32 0
  %243 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %242, align 8
  %244 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %245 = bitcast %struct.jpeg_compress_struct* %244 to %struct.jpeg_common_struct*
  %246 = ptrtoint void (%struct.jpeg_common_struct*)* %243 to i64
  call void @__llvm_profile_instrument_target(i64 %246, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_converter to i8*), i32 9)
  call void %243(%struct.jpeg_common_struct* %245)
  br label %247

; <label>:247:                                    ; preds = %233, %228
  %248 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %249 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %248, i32 0, i32 9
  %250 = load i32, i32* %249, align 4
  %251 = icmp eq i32 %250, 2
  br i1 %251, label %252, label %261

; <label>:252:                                    ; preds = %247
  %pgocount19 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 16)
  %253 = add i64 %pgocount19, 1
  store i64 %253, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 16)
  %254 = load %struct.my_color_converter*, %struct.my_color_converter** %3, align 8
  %255 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %254, i32 0, i32 0
  %256 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %255, i32 0, i32 0
  %257 = bitcast {}** %256 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @rgb_ycc_start, void (%struct.jpeg_compress_struct*)** %257, align 8
  %258 = load %struct.my_color_converter*, %struct.my_color_converter** %3, align 8
  %259 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %258, i32 0, i32 0
  %260 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %259, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* @rgb_ycc_convert, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %260, align 8
  br label %286

; <label>:261:                                    ; preds = %247
  %262 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %263 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %262, i32 0, i32 9
  %264 = load i32, i32* %263, align 4
  %265 = icmp eq i32 %264, 3
  br i1 %265, label %266, label %271

; <label>:266:                                    ; preds = %261
  %pgocount20 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 25)
  %267 = add i64 %pgocount20, 1
  store i64 %267, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 25)
  %268 = load %struct.my_color_converter*, %struct.my_color_converter** %3, align 8
  %269 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %268, i32 0, i32 0
  %270 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %269, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* @null_convert, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %270, align 8
  br label %285

; <label>:271:                                    ; preds = %261
  %pgocount21 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 26)
  %272 = add i64 %pgocount21, 1
  store i64 %272, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 26)
  %273 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %274 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %273, i32 0, i32 0
  %275 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %274, align 8
  %276 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %275, i32 0, i32 5
  store i32 25, i32* %276, align 8
  %277 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %278 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %277, i32 0, i32 0
  %279 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %278, align 8
  %280 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %279, i32 0, i32 0
  %281 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %280, align 8
  %282 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %283 = bitcast %struct.jpeg_compress_struct* %282 to %struct.jpeg_common_struct*
  %284 = ptrtoint void (%struct.jpeg_common_struct*)* %281 to i64
  call void @__llvm_profile_instrument_target(i64 %284, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_converter to i8*), i32 10)
  call void %281(%struct.jpeg_common_struct* %283)
  br label %285

; <label>:285:                                    ; preds = %271, %266
  br label %286

; <label>:286:                                    ; preds = %285, %252
  br label %426

; <label>:287:                                    ; preds = %110
  %288 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %289 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %288, i32 0, i32 12
  %290 = load i32, i32* %289, align 4
  %291 = icmp ne i32 %290, 4
  br i1 %291, label %292, label %306

; <label>:292:                                    ; preds = %287
  %pgocount22 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 17)
  %293 = add i64 %pgocount22, 1
  store i64 %293, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 17)
  %294 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %295 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %294, i32 0, i32 0
  %296 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %295, align 8
  %297 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %296, i32 0, i32 5
  store i32 8, i32* %297, align 8
  %298 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %299 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %298, i32 0, i32 0
  %300 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %299, align 8
  %301 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %300, i32 0, i32 0
  %302 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %301, align 8
  %303 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %304 = bitcast %struct.jpeg_compress_struct* %303 to %struct.jpeg_common_struct*
  %305 = ptrtoint void (%struct.jpeg_common_struct*)* %302 to i64
  call void @__llvm_profile_instrument_target(i64 %305, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_converter to i8*), i32 11)
  call void %302(%struct.jpeg_common_struct* %304)
  br label %306

; <label>:306:                                    ; preds = %292, %287
  %307 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %308 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %307, i32 0, i32 9
  %309 = load i32, i32* %308, align 4
  %310 = icmp eq i32 %309, 4
  br i1 %310, label %311, label %316

; <label>:311:                                    ; preds = %306
  %pgocount23 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 18)
  %312 = add i64 %pgocount23, 1
  store i64 %312, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 18)
  %313 = load %struct.my_color_converter*, %struct.my_color_converter** %3, align 8
  %314 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %313, i32 0, i32 0
  %315 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %314, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* @null_convert, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %315, align 8
  br label %330

; <label>:316:                                    ; preds = %306
  %pgocount24 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 19)
  %317 = add i64 %pgocount24, 1
  store i64 %317, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 19)
  %318 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %319 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %318, i32 0, i32 0
  %320 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %319, align 8
  %321 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %320, i32 0, i32 5
  store i32 25, i32* %321, align 8
  %322 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %323 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %322, i32 0, i32 0
  %324 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %323, align 8
  %325 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %324, i32 0, i32 0
  %326 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %325, align 8
  %327 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %328 = bitcast %struct.jpeg_compress_struct* %327 to %struct.jpeg_common_struct*
  %329 = ptrtoint void (%struct.jpeg_common_struct*)* %326 to i64
  call void @__llvm_profile_instrument_target(i64 %329, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_converter to i8*), i32 12)
  call void %326(%struct.jpeg_common_struct* %328)
  br label %330

; <label>:330:                                    ; preds = %316, %311
  br label %426

; <label>:331:                                    ; preds = %110
  %332 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %333 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %332, i32 0, i32 12
  %334 = load i32, i32* %333, align 4
  %335 = icmp ne i32 %334, 4
  br i1 %335, label %336, label %350

; <label>:336:                                    ; preds = %331
  %pgocount25 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 21)
  %337 = add i64 %pgocount25, 1
  store i64 %337, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 21)
  %338 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %339 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %338, i32 0, i32 0
  %340 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %339, align 8
  %341 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %340, i32 0, i32 5
  store i32 8, i32* %341, align 8
  %342 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %343 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %342, i32 0, i32 0
  %344 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %343, align 8
  %345 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %344, i32 0, i32 0
  %346 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %345, align 8
  %347 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %348 = bitcast %struct.jpeg_compress_struct* %347 to %struct.jpeg_common_struct*
  %349 = ptrtoint void (%struct.jpeg_common_struct*)* %346 to i64
  call void @__llvm_profile_instrument_target(i64 %349, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_converter to i8*), i32 13)
  call void %346(%struct.jpeg_common_struct* %348)
  br label %350

; <label>:350:                                    ; preds = %336, %331
  %351 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %352 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %351, i32 0, i32 9
  %353 = load i32, i32* %352, align 4
  %354 = icmp eq i32 %353, 4
  br i1 %354, label %355, label %364

; <label>:355:                                    ; preds = %350
  %pgocount26 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 22)
  %356 = add i64 %pgocount26, 1
  store i64 %356, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 22)
  %357 = load %struct.my_color_converter*, %struct.my_color_converter** %3, align 8
  %358 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %357, i32 0, i32 0
  %359 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %358, i32 0, i32 0
  %360 = bitcast {}** %359 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @rgb_ycc_start, void (%struct.jpeg_compress_struct*)** %360, align 8
  %361 = load %struct.my_color_converter*, %struct.my_color_converter** %3, align 8
  %362 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %361, i32 0, i32 0
  %363 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %362, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* @cmyk_ycck_convert, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %363, align 8
  br label %389

; <label>:364:                                    ; preds = %350
  %365 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %366 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %365, i32 0, i32 9
  %367 = load i32, i32* %366, align 4
  %368 = icmp eq i32 %367, 5
  br i1 %368, label %369, label %374

; <label>:369:                                    ; preds = %364
  %pgocount27 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 27)
  %370 = add i64 %pgocount27, 1
  store i64 %370, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 27)
  %371 = load %struct.my_color_converter*, %struct.my_color_converter** %3, align 8
  %372 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %371, i32 0, i32 0
  %373 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %372, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* @null_convert, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %373, align 8
  br label %388

; <label>:374:                                    ; preds = %364
  %pgocount28 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 28)
  %375 = add i64 %pgocount28, 1
  store i64 %375, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 28)
  %376 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %377 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %376, i32 0, i32 0
  %378 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %377, align 8
  %379 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %378, i32 0, i32 5
  store i32 25, i32* %379, align 8
  %380 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %381 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %380, i32 0, i32 0
  %382 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %381, align 8
  %383 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %382, i32 0, i32 0
  %384 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %383, align 8
  %385 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %386 = bitcast %struct.jpeg_compress_struct* %385 to %struct.jpeg_common_struct*
  %387 = ptrtoint void (%struct.jpeg_common_struct*)* %384 to i64
  call void @__llvm_profile_instrument_target(i64 %387, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_converter to i8*), i32 14)
  call void %384(%struct.jpeg_common_struct* %386)
  br label %388

; <label>:388:                                    ; preds = %374, %369
  br label %389

; <label>:389:                                    ; preds = %388, %355
  br label %426

; <label>:390:                                    ; preds = %110
  %pgocount29 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 7)
  %391 = add i64 %pgocount29, 1
  store i64 %391, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 7)
  %392 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %393 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %392, i32 0, i32 13
  %394 = load i32, i32* %393, align 8
  %395 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %396 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %395, i32 0, i32 9
  %397 = load i32, i32* %396, align 4
  %398 = icmp ne i32 %394, %397
  br i1 %398, label %408, label %399

; <label>:399:                                    ; preds = %390
  %pgocount30 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 20)
  %400 = add i64 %pgocount30, 1
  store i64 %400, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 20)
  %401 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %402 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %401, i32 0, i32 12
  %403 = load i32, i32* %402, align 4
  %404 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %405 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %404, i32 0, i32 8
  %406 = load i32, i32* %405, align 8
  %407 = icmp ne i32 %403, %406
  br i1 %407, label %408, label %422

; <label>:408:                                    ; preds = %399, %390
  %pgocount31 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 8)
  %409 = add i64 %pgocount31, 1
  store i64 %409, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_jinit_color_converter, i64 0, i64 8)
  %410 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %411 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %410, i32 0, i32 0
  %412 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %411, align 8
  %413 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %412, i32 0, i32 5
  store i32 25, i32* %413, align 8
  %414 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %415 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %414, i32 0, i32 0
  %416 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %415, align 8
  %417 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %416, i32 0, i32 0
  %418 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %417, align 8
  %419 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %420 = bitcast %struct.jpeg_compress_struct* %419 to %struct.jpeg_common_struct*
  %421 = ptrtoint void (%struct.jpeg_common_struct*)* %418 to i64
  call void @__llvm_profile_instrument_target(i64 %421, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_converter to i8*), i32 15)
  call void %418(%struct.jpeg_common_struct* %420)
  br label %422

; <label>:422:                                    ; preds = %408, %399
  %423 = load %struct.my_color_converter*, %struct.my_color_converter** %3, align 8
  %424 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %423, i32 0, i32 0
  %425 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %424, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* @null_convert, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %425, align 8
  br label %426

; <label>:426:                                    ; preds = %422, %389, %330, %286, %227, %183
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @null_method(%struct.jpeg_compress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_null_method, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_null_method, i64 0, i64 0)
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @grayscale_convert(%struct.jpeg_compress_struct*, i8**, i8***, i32, i32) #0 {
  %6 = alloca %struct.jpeg_compress_struct*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8***, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %6, align 8
  store i8** %1, i8*** %7, align 8
  store i8*** %2, i8**** %8, align 8
  store i32 %3, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 6
  %18 = load i32, i32* %17, align 8
  store i32 %18, i32* %14, align 4
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 8
  %21 = load i32, i32* %20, align 8
  store i32 %21, i32* %15, align 4
  br label %22

; <label>:22:                                     ; preds = %59, %5
  %23 = load i32, i32* %10, align 4
  %24 = add nsw i32 %23, -1
  store i32 %24, i32* %10, align 4
  %25 = icmp sge i32 %24, 0
  br i1 %25, label %26, label %61

; <label>:26:                                     ; preds = %22
  %27 = load i8**, i8*** %7, align 8
  %28 = getelementptr inbounds i8*, i8** %27, i32 1
  store i8** %28, i8*** %7, align 8
  %29 = load i8*, i8** %27, align 8
  store i8* %29, i8** %11, align 8
  %30 = load i8***, i8**** %8, align 8
  %31 = getelementptr inbounds i8**, i8*** %30, i64 0
  %32 = load i8**, i8*** %31, align 8
  %33 = load i32, i32* %9, align 4
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds i8*, i8** %32, i64 %34
  %36 = load i8*, i8** %35, align 8
  store i8* %36, i8** %12, align 8
  %37 = load i32, i32* %9, align 4
  %38 = add i32 %37, 1
  store i32 %38, i32* %9, align 4
  store i32 0, i32* %13, align 4
  br label %39

; <label>:39:                                     ; preds = %55, %26
  %40 = load i32, i32* %13, align 4
  %41 = load i32, i32* %14, align 4
  %42 = icmp ult i32 %40, %41
  br i1 %42, label %43, label %59

; <label>:43:                                     ; preds = %39
  %44 = load i8*, i8** %11, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 0
  %46 = load i8, i8* %45, align 1
  %47 = load i8*, i8** %12, align 8
  %48 = load i32, i32* %13, align 4
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8* %47, i64 %49
  store i8 %46, i8* %50, align 1
  %51 = load i32, i32* %15, align 4
  %52 = load i8*, i8** %11, align 8
  %53 = sext i32 %51 to i64
  %54 = getelementptr inbounds i8, i8* %52, i64 %53
  store i8* %54, i8** %11, align 8
  br label %55

; <label>:55:                                     ; preds = %43
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_grayscale_convert, i64 0, i64 0)
  %56 = add i64 %pgocount, 1
  store i64 %56, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_grayscale_convert, i64 0, i64 0)
  %57 = load i32, i32* %13, align 4
  %58 = add i32 %57, 1
  store i32 %58, i32* %13, align 4
  br label %39

; <label>:59:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_grayscale_convert, i64 0, i64 1)
  %60 = add i64 %pgocount1, 1
  store i64 %60, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_grayscale_convert, i64 0, i64 1)
  br label %22

; <label>:61:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_grayscale_convert, i64 0, i64 2)
  %62 = add i64 %pgocount2, 1
  store i64 %62, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_grayscale_convert, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @rgb_ycc_start(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.my_color_converter*, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i64, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %6 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %6, i32 0, i32 56
  %8 = load %struct.jpeg_color_converter*, %struct.jpeg_color_converter** %7, align 8
  %9 = bitcast %struct.jpeg_color_converter* %8 to %struct.my_color_converter*
  store %struct.my_color_converter* %9, %struct.my_color_converter** %3, align 8
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %10, i32 0, i32 1
  %12 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %12, i32 0, i32 0
  %14 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %13, align 8
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %16 = bitcast %struct.jpeg_compress_struct* %15 to %struct.jpeg_common_struct*
  %17 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %14 to i64
  call void @__llvm_profile_instrument_target(i64 %17, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_rgb_ycc_start to i8*), i32 0)
  %18 = call i8* %14(%struct.jpeg_common_struct* %16, i32 1, i64 16384)
  %19 = bitcast i8* %18 to i64*
  store i64* %19, i64** %4, align 8
  %20 = load %struct.my_color_converter*, %struct.my_color_converter** %3, align 8
  %21 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %20, i32 0, i32 1
  store i64* %19, i64** %21, align 8
  store i64 0, i64* %5, align 8
  br label %22

; <label>:22:                                     ; preds = %78, %1
  %23 = load i64, i64* %5, align 8
  %24 = icmp sle i64 %23, 255
  br i1 %24, label %25, label %82

; <label>:25:                                     ; preds = %22
  %26 = load i64, i64* %5, align 8
  %27 = mul nsw i64 19595, %26
  %28 = load i64*, i64** %4, align 8
  %29 = load i64, i64* %5, align 8
  %30 = add nsw i64 %29, 0
  %31 = getelementptr inbounds i64, i64* %28, i64 %30
  store i64 %27, i64* %31, align 8
  %32 = load i64, i64* %5, align 8
  %33 = mul nsw i64 38470, %32
  %34 = load i64*, i64** %4, align 8
  %35 = load i64, i64* %5, align 8
  %36 = add nsw i64 %35, 256
  %37 = getelementptr inbounds i64, i64* %34, i64 %36
  store i64 %33, i64* %37, align 8
  %38 = load i64, i64* %5, align 8
  %39 = mul nsw i64 7471, %38
  %40 = add nsw i64 %39, 32768
  %41 = load i64*, i64** %4, align 8
  %42 = load i64, i64* %5, align 8
  %43 = add nsw i64 %42, 512
  %44 = getelementptr inbounds i64, i64* %41, i64 %43
  store i64 %40, i64* %44, align 8
  %45 = load i64, i64* %5, align 8
  %46 = mul nsw i64 -11059, %45
  %47 = load i64*, i64** %4, align 8
  %48 = load i64, i64* %5, align 8
  %49 = add nsw i64 %48, 768
  %50 = getelementptr inbounds i64, i64* %47, i64 %49
  store i64 %46, i64* %50, align 8
  %51 = load i64, i64* %5, align 8
  %52 = mul nsw i64 -21709, %51
  %53 = load i64*, i64** %4, align 8
  %54 = load i64, i64* %5, align 8
  %55 = add nsw i64 %54, 1024
  %56 = getelementptr inbounds i64, i64* %53, i64 %55
  store i64 %52, i64* %56, align 8
  %57 = load i64, i64* %5, align 8
  %58 = mul nsw i64 32768, %57
  %59 = add nsw i64 %58, 8388608
  %60 = add nsw i64 %59, 32768
  %61 = sub nsw i64 %60, 1
  %62 = load i64*, i64** %4, align 8
  %63 = load i64, i64* %5, align 8
  %64 = add nsw i64 %63, 1280
  %65 = getelementptr inbounds i64, i64* %62, i64 %64
  store i64 %61, i64* %65, align 8
  %66 = load i64, i64* %5, align 8
  %67 = mul nsw i64 -27439, %66
  %68 = load i64*, i64** %4, align 8
  %69 = load i64, i64* %5, align 8
  %70 = add nsw i64 %69, 1536
  %71 = getelementptr inbounds i64, i64* %68, i64 %70
  store i64 %67, i64* %71, align 8
  %72 = load i64, i64* %5, align 8
  %73 = mul nsw i64 -5329, %72
  %74 = load i64*, i64** %4, align 8
  %75 = load i64, i64* %5, align 8
  %76 = add nsw i64 %75, 1792
  %77 = getelementptr inbounds i64, i64* %74, i64 %76
  store i64 %73, i64* %77, align 8
  br label %78

; <label>:78:                                     ; preds = %25
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_rgb_ycc_start, i64 0, i64 0)
  %79 = add i64 %pgocount, 1
  store i64 %79, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_rgb_ycc_start, i64 0, i64 0)
  %80 = load i64, i64* %5, align 8
  %81 = add nsw i64 %80, 1
  store i64 %81, i64* %5, align 8
  br label %22

; <label>:82:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_rgb_ycc_start, i64 0, i64 1)
  %83 = add i64 %pgocount1, 1
  store i64 %83, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_rgb_ycc_start, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @rgb_gray_convert(%struct.jpeg_compress_struct*, i8**, i8***, i32, i32) #0 {
  %6 = alloca %struct.jpeg_compress_struct*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8***, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.my_color_converter*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i64*, align 8
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %6, align 8
  store i8** %1, i8*** %7, align 8
  store i8*** %2, i8**** %8, align 8
  store i32 %3, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  %20 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %20, i32 0, i32 56
  %22 = load %struct.jpeg_color_converter*, %struct.jpeg_color_converter** %21, align 8
  %23 = bitcast %struct.jpeg_color_converter* %22 to %struct.my_color_converter*
  store %struct.my_color_converter* %23, %struct.my_color_converter** %11, align 8
  %24 = load %struct.my_color_converter*, %struct.my_color_converter** %11, align 8
  %25 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %24, i32 0, i32 1
  %26 = load i64*, i64** %25, align 8
  store i64* %26, i64** %15, align 8
  %27 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %27, i32 0, i32 6
  %29 = load i32, i32* %28, align 8
  store i32 %29, i32* %19, align 4
  br label %30

; <label>:30:                                     ; preds = %96, %5
  %31 = load i32, i32* %10, align 4
  %32 = add nsw i32 %31, -1
  store i32 %32, i32* %10, align 4
  %33 = icmp sge i32 %32, 0
  br i1 %33, label %34, label %98

; <label>:34:                                     ; preds = %30
  %35 = load i8**, i8*** %7, align 8
  %36 = getelementptr inbounds i8*, i8** %35, i32 1
  store i8** %36, i8*** %7, align 8
  %37 = load i8*, i8** %35, align 8
  store i8* %37, i8** %16, align 8
  %38 = load i8***, i8**** %8, align 8
  %39 = getelementptr inbounds i8**, i8*** %38, i64 0
  %40 = load i8**, i8*** %39, align 8
  %41 = load i32, i32* %9, align 4
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i8*, i8** %40, i64 %42
  %44 = load i8*, i8** %43, align 8
  store i8* %44, i8** %17, align 8
  %45 = load i32, i32* %9, align 4
  %46 = add i32 %45, 1
  store i32 %46, i32* %9, align 4
  store i32 0, i32* %18, align 4
  br label %47

; <label>:47:                                     ; preds = %92, %34
  %48 = load i32, i32* %18, align 4
  %49 = load i32, i32* %19, align 4
  %50 = icmp ult i32 %48, %49
  br i1 %50, label %51, label %96

; <label>:51:                                     ; preds = %47
  %52 = load i8*, i8** %16, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 0
  %54 = load i8, i8* %53, align 1
  %55 = zext i8 %54 to i32
  store i32 %55, i32* %12, align 4
  %56 = load i8*, i8** %16, align 8
  %57 = getelementptr inbounds i8, i8* %56, i64 1
  %58 = load i8, i8* %57, align 1
  %59 = zext i8 %58 to i32
  store i32 %59, i32* %13, align 4
  %60 = load i8*, i8** %16, align 8
  %61 = getelementptr inbounds i8, i8* %60, i64 2
  %62 = load i8, i8* %61, align 1
  %63 = zext i8 %62 to i32
  store i32 %63, i32* %14, align 4
  %64 = load i8*, i8** %16, align 8
  %65 = getelementptr inbounds i8, i8* %64, i64 3
  store i8* %65, i8** %16, align 8
  %66 = load i64*, i64** %15, align 8
  %67 = load i32, i32* %12, align 4
  %68 = add nsw i32 %67, 0
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i64, i64* %66, i64 %69
  %71 = load i64, i64* %70, align 8
  %72 = load i64*, i64** %15, align 8
  %73 = load i32, i32* %13, align 4
  %74 = add nsw i32 %73, 256
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i64, i64* %72, i64 %75
  %77 = load i64, i64* %76, align 8
  %78 = add nsw i64 %71, %77
  %79 = load i64*, i64** %15, align 8
  %80 = load i32, i32* %14, align 4
  %81 = add nsw i32 %80, 512
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i64, i64* %79, i64 %82
  %84 = load i64, i64* %83, align 8
  %85 = add nsw i64 %78, %84
  %86 = ashr i64 %85, 16
  %87 = trunc i64 %86 to i8
  %88 = load i8*, i8** %17, align 8
  %89 = load i32, i32* %18, align 4
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds i8, i8* %88, i64 %90
  store i8 %87, i8* %91, align 1
  br label %92

; <label>:92:                                     ; preds = %51
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_rgb_gray_convert, i64 0, i64 0)
  %93 = add i64 %pgocount, 1
  store i64 %93, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_rgb_gray_convert, i64 0, i64 0)
  %94 = load i32, i32* %18, align 4
  %95 = add i32 %94, 1
  store i32 %95, i32* %18, align 4
  br label %47

; <label>:96:                                     ; preds = %47
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_rgb_gray_convert, i64 0, i64 1)
  %97 = add i64 %pgocount1, 1
  store i64 %97, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_rgb_gray_convert, i64 0, i64 1)
  br label %30

; <label>:98:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_rgb_gray_convert, i64 0, i64 2)
  %99 = add i64 %pgocount2, 1
  store i64 %99, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_rgb_gray_convert, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @null_convert(%struct.jpeg_compress_struct*, i8**, i8***, i32, i32) #0 {
  %6 = alloca %struct.jpeg_compress_struct*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8***, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %6, align 8
  store i8** %1, i8*** %7, align 8
  store i8*** %2, i8**** %8, align 8
  store i32 %3, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %17, i32 0, i32 12
  %19 = load i32, i32* %18, align 4
  store i32 %19, i32* %15, align 4
  %20 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %20, i32 0, i32 6
  %22 = load i32, i32* %21, align 8
  store i32 %22, i32* %16, align 4
  br label %23

; <label>:23:                                     ; preds = %71, %5
  %24 = load i32, i32* %10, align 4
  %25 = add nsw i32 %24, -1
  store i32 %25, i32* %10, align 4
  %26 = icmp sge i32 %25, 0
  br i1 %26, label %27, label %77

; <label>:27:                                     ; preds = %23
  store i32 0, i32* %14, align 4
  br label %28

; <label>:28:                                     ; preds = %67, %27
  %29 = load i32, i32* %14, align 4
  %30 = load i32, i32* %15, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %71

; <label>:32:                                     ; preds = %28
  %33 = load i8**, i8*** %7, align 8
  %34 = load i8*, i8** %33, align 8
  store i8* %34, i8** %11, align 8
  %35 = load i8***, i8**** %8, align 8
  %36 = load i32, i32* %14, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8**, i8*** %35, i64 %37
  %39 = load i8**, i8*** %38, align 8
  %40 = load i32, i32* %9, align 4
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i8*, i8** %39, i64 %41
  %43 = load i8*, i8** %42, align 8
  store i8* %43, i8** %12, align 8
  store i32 0, i32* %13, align 4
  br label %44

; <label>:44:                                     ; preds = %62, %32
  %45 = load i32, i32* %13, align 4
  %46 = load i32, i32* %16, align 4
  %47 = icmp ult i32 %45, %46
  br i1 %47, label %48, label %66

; <label>:48:                                     ; preds = %44
  %49 = load i8*, i8** %11, align 8
  %50 = load i32, i32* %14, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8* %49, i64 %51
  %53 = load i8, i8* %52, align 1
  %54 = load i8*, i8** %12, align 8
  %55 = load i32, i32* %13, align 4
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8* %54, i64 %56
  store i8 %53, i8* %57, align 1
  %58 = load i32, i32* %15, align 4
  %59 = load i8*, i8** %11, align 8
  %60 = sext i32 %58 to i64
  %61 = getelementptr inbounds i8, i8* %59, i64 %60
  store i8* %61, i8** %11, align 8
  br label %62

; <label>:62:                                     ; preds = %48
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i64 0, i64 0)
  %63 = add i64 %pgocount, 1
  store i64 %63, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i64 0, i64 0)
  %64 = load i32, i32* %13, align 4
  %65 = add i32 %64, 1
  store i32 %65, i32* %13, align 4
  br label %44

; <label>:66:                                     ; preds = %44
  br label %67

; <label>:67:                                     ; preds = %66
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i64 0, i64 1)
  %68 = add i64 %pgocount1, 1
  store i64 %68, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i64 0, i64 1)
  %69 = load i32, i32* %14, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %14, align 4
  br label %28

; <label>:71:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i64 0, i64 2)
  %72 = add i64 %pgocount2, 1
  store i64 %72, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i64 0, i64 2)
  %73 = load i8**, i8*** %7, align 8
  %74 = getelementptr inbounds i8*, i8** %73, i32 1
  store i8** %74, i8*** %7, align 8
  %75 = load i32, i32* %9, align 4
  %76 = add i32 %75, 1
  store i32 %76, i32* %9, align 4
  br label %23

; <label>:77:                                     ; preds = %23
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i64 0, i64 3)
  %78 = add i64 %pgocount3, 1
  store i64 %78, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i64 0, i64 3)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @rgb_ycc_convert(%struct.jpeg_compress_struct*, i8**, i8***, i32, i32) #0 {
  %6 = alloca %struct.jpeg_compress_struct*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8***, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.my_color_converter*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i64*, align 8
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i8*, align 8
  %19 = alloca i8*, align 8
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %6, align 8
  store i8** %1, i8*** %7, align 8
  store i8*** %2, i8**** %8, align 8
  store i32 %3, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 56
  %24 = load %struct.jpeg_color_converter*, %struct.jpeg_color_converter** %23, align 8
  %25 = bitcast %struct.jpeg_color_converter* %24 to %struct.my_color_converter*
  store %struct.my_color_converter* %25, %struct.my_color_converter** %11, align 8
  %26 = load %struct.my_color_converter*, %struct.my_color_converter** %11, align 8
  %27 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %26, i32 0, i32 1
  %28 = load i64*, i64** %27, align 8
  store i64* %28, i64** %15, align 8
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i32 0, i32 6
  %31 = load i32, i32* %30, align 8
  store i32 %31, i32* %21, align 4
  br label %32

; <label>:32:                                     ; preds = %164, %5
  %33 = load i32, i32* %10, align 4
  %34 = add nsw i32 %33, -1
  store i32 %34, i32* %10, align 4
  %35 = icmp sge i32 %34, 0
  br i1 %35, label %36, label %166

; <label>:36:                                     ; preds = %32
  %37 = load i8**, i8*** %7, align 8
  %38 = getelementptr inbounds i8*, i8** %37, i32 1
  store i8** %38, i8*** %7, align 8
  %39 = load i8*, i8** %37, align 8
  store i8* %39, i8** %16, align 8
  %40 = load i8***, i8**** %8, align 8
  %41 = getelementptr inbounds i8**, i8*** %40, i64 0
  %42 = load i8**, i8*** %41, align 8
  %43 = load i32, i32* %9, align 4
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i8*, i8** %42, i64 %44
  %46 = load i8*, i8** %45, align 8
  store i8* %46, i8** %17, align 8
  %47 = load i8***, i8**** %8, align 8
  %48 = getelementptr inbounds i8**, i8*** %47, i64 1
  %49 = load i8**, i8*** %48, align 8
  %50 = load i32, i32* %9, align 4
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i8*, i8** %49, i64 %51
  %53 = load i8*, i8** %52, align 8
  store i8* %53, i8** %18, align 8
  %54 = load i8***, i8**** %8, align 8
  %55 = getelementptr inbounds i8**, i8*** %54, i64 2
  %56 = load i8**, i8*** %55, align 8
  %57 = load i32, i32* %9, align 4
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i8*, i8** %56, i64 %58
  %60 = load i8*, i8** %59, align 8
  store i8* %60, i8** %19, align 8
  %61 = load i32, i32* %9, align 4
  %62 = add i32 %61, 1
  store i32 %62, i32* %9, align 4
  store i32 0, i32* %20, align 4
  br label %63

; <label>:63:                                     ; preds = %160, %36
  %64 = load i32, i32* %20, align 4
  %65 = load i32, i32* %21, align 4
  %66 = icmp ult i32 %64, %65
  br i1 %66, label %67, label %164

; <label>:67:                                     ; preds = %63
  %68 = load i8*, i8** %16, align 8
  %69 = getelementptr inbounds i8, i8* %68, i64 0
  %70 = load i8, i8* %69, align 1
  %71 = zext i8 %70 to i32
  store i32 %71, i32* %12, align 4
  %72 = load i8*, i8** %16, align 8
  %73 = getelementptr inbounds i8, i8* %72, i64 1
  %74 = load i8, i8* %73, align 1
  %75 = zext i8 %74 to i32
  store i32 %75, i32* %13, align 4
  %76 = load i8*, i8** %16, align 8
  %77 = getelementptr inbounds i8, i8* %76, i64 2
  %78 = load i8, i8* %77, align 1
  %79 = zext i8 %78 to i32
  store i32 %79, i32* %14, align 4
  %80 = load i8*, i8** %16, align 8
  %81 = getelementptr inbounds i8, i8* %80, i64 3
  store i8* %81, i8** %16, align 8
  %82 = load i64*, i64** %15, align 8
  %83 = load i32, i32* %12, align 4
  %84 = add nsw i32 %83, 0
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i64, i64* %82, i64 %85
  %87 = load i64, i64* %86, align 8
  %88 = load i64*, i64** %15, align 8
  %89 = load i32, i32* %13, align 4
  %90 = add nsw i32 %89, 256
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i64, i64* %88, i64 %91
  %93 = load i64, i64* %92, align 8
  %94 = add nsw i64 %87, %93
  %95 = load i64*, i64** %15, align 8
  %96 = load i32, i32* %14, align 4
  %97 = add nsw i32 %96, 512
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i64, i64* %95, i64 %98
  %100 = load i64, i64* %99, align 8
  %101 = add nsw i64 %94, %100
  %102 = ashr i64 %101, 16
  %103 = trunc i64 %102 to i8
  %104 = load i8*, i8** %17, align 8
  %105 = load i32, i32* %20, align 4
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds i8, i8* %104, i64 %106
  store i8 %103, i8* %107, align 1
  %108 = load i64*, i64** %15, align 8
  %109 = load i32, i32* %12, align 4
  %110 = add nsw i32 %109, 768
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i64, i64* %108, i64 %111
  %113 = load i64, i64* %112, align 8
  %114 = load i64*, i64** %15, align 8
  %115 = load i32, i32* %13, align 4
  %116 = add nsw i32 %115, 1024
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i64, i64* %114, i64 %117
  %119 = load i64, i64* %118, align 8
  %120 = add nsw i64 %113, %119
  %121 = load i64*, i64** %15, align 8
  %122 = load i32, i32* %14, align 4
  %123 = add nsw i32 %122, 1280
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i64, i64* %121, i64 %124
  %126 = load i64, i64* %125, align 8
  %127 = add nsw i64 %120, %126
  %128 = ashr i64 %127, 16
  %129 = trunc i64 %128 to i8
  %130 = load i8*, i8** %18, align 8
  %131 = load i32, i32* %20, align 4
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds i8, i8* %130, i64 %132
  store i8 %129, i8* %133, align 1
  %134 = load i64*, i64** %15, align 8
  %135 = load i32, i32* %12, align 4
  %136 = add nsw i32 %135, 1280
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i64, i64* %134, i64 %137
  %139 = load i64, i64* %138, align 8
  %140 = load i64*, i64** %15, align 8
  %141 = load i32, i32* %13, align 4
  %142 = add nsw i32 %141, 1536
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i64, i64* %140, i64 %143
  %145 = load i64, i64* %144, align 8
  %146 = add nsw i64 %139, %145
  %147 = load i64*, i64** %15, align 8
  %148 = load i32, i32* %14, align 4
  %149 = add nsw i32 %148, 1792
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i64, i64* %147, i64 %150
  %152 = load i64, i64* %151, align 8
  %153 = add nsw i64 %146, %152
  %154 = ashr i64 %153, 16
  %155 = trunc i64 %154 to i8
  %156 = load i8*, i8** %19, align 8
  %157 = load i32, i32* %20, align 4
  %158 = zext i32 %157 to i64
  %159 = getelementptr inbounds i8, i8* %156, i64 %158
  store i8 %155, i8* %159, align 1
  br label %160

; <label>:160:                                    ; preds = %67
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_rgb_ycc_convert, i64 0, i64 0)
  %161 = add i64 %pgocount, 1
  store i64 %161, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_rgb_ycc_convert, i64 0, i64 0)
  %162 = load i32, i32* %20, align 4
  %163 = add i32 %162, 1
  store i32 %163, i32* %20, align 4
  br label %63

; <label>:164:                                    ; preds = %63
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_rgb_ycc_convert, i64 0, i64 1)
  %165 = add i64 %pgocount1, 1
  store i64 %165, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_rgb_ycc_convert, i64 0, i64 1)
  br label %32

; <label>:166:                                    ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_rgb_ycc_convert, i64 0, i64 2)
  %167 = add i64 %pgocount2, 1
  store i64 %167, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_rgb_ycc_convert, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @cmyk_ycck_convert(%struct.jpeg_compress_struct*, i8**, i8***, i32, i32) #0 {
  %6 = alloca %struct.jpeg_compress_struct*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8***, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.my_color_converter*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i64*, align 8
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i8*, align 8
  %19 = alloca i8*, align 8
  %20 = alloca i8*, align 8
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %6, align 8
  store i8** %1, i8*** %7, align 8
  store i8*** %2, i8**** %8, align 8
  store i32 %3, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %23, i32 0, i32 56
  %25 = load %struct.jpeg_color_converter*, %struct.jpeg_color_converter** %24, align 8
  %26 = bitcast %struct.jpeg_color_converter* %25 to %struct.my_color_converter*
  store %struct.my_color_converter* %26, %struct.my_color_converter** %11, align 8
  %27 = load %struct.my_color_converter*, %struct.my_color_converter** %11, align 8
  %28 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %27, i32 0, i32 1
  %29 = load i64*, i64** %28, align 8
  store i64* %29, i64** %15, align 8
  %30 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %31 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %30, i32 0, i32 6
  %32 = load i32, i32* %31, align 8
  store i32 %32, i32* %22, align 4
  br label %33

; <label>:33:                                     ; preds = %182, %5
  %34 = load i32, i32* %10, align 4
  %35 = add nsw i32 %34, -1
  store i32 %35, i32* %10, align 4
  %36 = icmp sge i32 %35, 0
  br i1 %36, label %37, label %184

; <label>:37:                                     ; preds = %33
  %38 = load i8**, i8*** %7, align 8
  %39 = getelementptr inbounds i8*, i8** %38, i32 1
  store i8** %39, i8*** %7, align 8
  %40 = load i8*, i8** %38, align 8
  store i8* %40, i8** %16, align 8
  %41 = load i8***, i8**** %8, align 8
  %42 = getelementptr inbounds i8**, i8*** %41, i64 0
  %43 = load i8**, i8*** %42, align 8
  %44 = load i32, i32* %9, align 4
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i8*, i8** %43, i64 %45
  %47 = load i8*, i8** %46, align 8
  store i8* %47, i8** %17, align 8
  %48 = load i8***, i8**** %8, align 8
  %49 = getelementptr inbounds i8**, i8*** %48, i64 1
  %50 = load i8**, i8*** %49, align 8
  %51 = load i32, i32* %9, align 4
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i8*, i8** %50, i64 %52
  %54 = load i8*, i8** %53, align 8
  store i8* %54, i8** %18, align 8
  %55 = load i8***, i8**** %8, align 8
  %56 = getelementptr inbounds i8**, i8*** %55, i64 2
  %57 = load i8**, i8*** %56, align 8
  %58 = load i32, i32* %9, align 4
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i8*, i8** %57, i64 %59
  %61 = load i8*, i8** %60, align 8
  store i8* %61, i8** %19, align 8
  %62 = load i8***, i8**** %8, align 8
  %63 = getelementptr inbounds i8**, i8*** %62, i64 3
  %64 = load i8**, i8*** %63, align 8
  %65 = load i32, i32* %9, align 4
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i8*, i8** %64, i64 %66
  %68 = load i8*, i8** %67, align 8
  store i8* %68, i8** %20, align 8
  %69 = load i32, i32* %9, align 4
  %70 = add i32 %69, 1
  store i32 %70, i32* %9, align 4
  store i32 0, i32* %21, align 4
  br label %71

; <label>:71:                                     ; preds = %178, %37
  %72 = load i32, i32* %21, align 4
  %73 = load i32, i32* %22, align 4
  %74 = icmp ult i32 %72, %73
  br i1 %74, label %75, label %182

; <label>:75:                                     ; preds = %71
  %76 = load i8*, i8** %16, align 8
  %77 = getelementptr inbounds i8, i8* %76, i64 0
  %78 = load i8, i8* %77, align 1
  %79 = zext i8 %78 to i32
  %80 = sub nsw i32 255, %79
  store i32 %80, i32* %12, align 4
  %81 = load i8*, i8** %16, align 8
  %82 = getelementptr inbounds i8, i8* %81, i64 1
  %83 = load i8, i8* %82, align 1
  %84 = zext i8 %83 to i32
  %85 = sub nsw i32 255, %84
  store i32 %85, i32* %13, align 4
  %86 = load i8*, i8** %16, align 8
  %87 = getelementptr inbounds i8, i8* %86, i64 2
  %88 = load i8, i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = sub nsw i32 255, %89
  store i32 %90, i32* %14, align 4
  %91 = load i8*, i8** %16, align 8
  %92 = getelementptr inbounds i8, i8* %91, i64 3
  %93 = load i8, i8* %92, align 1
  %94 = load i8*, i8** %20, align 8
  %95 = load i32, i32* %21, align 4
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds i8, i8* %94, i64 %96
  store i8 %93, i8* %97, align 1
  %98 = load i8*, i8** %16, align 8
  %99 = getelementptr inbounds i8, i8* %98, i64 4
  store i8* %99, i8** %16, align 8
  %100 = load i64*, i64** %15, align 8
  %101 = load i32, i32* %12, align 4
  %102 = add nsw i32 %101, 0
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i64, i64* %100, i64 %103
  %105 = load i64, i64* %104, align 8
  %106 = load i64*, i64** %15, align 8
  %107 = load i32, i32* %13, align 4
  %108 = add nsw i32 %107, 256
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i64, i64* %106, i64 %109
  %111 = load i64, i64* %110, align 8
  %112 = add nsw i64 %105, %111
  %113 = load i64*, i64** %15, align 8
  %114 = load i32, i32* %14, align 4
  %115 = add nsw i32 %114, 512
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i64, i64* %113, i64 %116
  %118 = load i64, i64* %117, align 8
  %119 = add nsw i64 %112, %118
  %120 = ashr i64 %119, 16
  %121 = trunc i64 %120 to i8
  %122 = load i8*, i8** %17, align 8
  %123 = load i32, i32* %21, align 4
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds i8, i8* %122, i64 %124
  store i8 %121, i8* %125, align 1
  %126 = load i64*, i64** %15, align 8
  %127 = load i32, i32* %12, align 4
  %128 = add nsw i32 %127, 768
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i64, i64* %126, i64 %129
  %131 = load i64, i64* %130, align 8
  %132 = load i64*, i64** %15, align 8
  %133 = load i32, i32* %13, align 4
  %134 = add nsw i32 %133, 1024
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i64, i64* %132, i64 %135
  %137 = load i64, i64* %136, align 8
  %138 = add nsw i64 %131, %137
  %139 = load i64*, i64** %15, align 8
  %140 = load i32, i32* %14, align 4
  %141 = add nsw i32 %140, 1280
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i64, i64* %139, i64 %142
  %144 = load i64, i64* %143, align 8
  %145 = add nsw i64 %138, %144
  %146 = ashr i64 %145, 16
  %147 = trunc i64 %146 to i8
  %148 = load i8*, i8** %18, align 8
  %149 = load i32, i32* %21, align 4
  %150 = zext i32 %149 to i64
  %151 = getelementptr inbounds i8, i8* %148, i64 %150
  store i8 %147, i8* %151, align 1
  %152 = load i64*, i64** %15, align 8
  %153 = load i32, i32* %12, align 4
  %154 = add nsw i32 %153, 1280
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i64, i64* %152, i64 %155
  %157 = load i64, i64* %156, align 8
  %158 = load i64*, i64** %15, align 8
  %159 = load i32, i32* %13, align 4
  %160 = add nsw i32 %159, 1536
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds i64, i64* %158, i64 %161
  %163 = load i64, i64* %162, align 8
  %164 = add nsw i64 %157, %163
  %165 = load i64*, i64** %15, align 8
  %166 = load i32, i32* %14, align 4
  %167 = add nsw i32 %166, 1792
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i64, i64* %165, i64 %168
  %170 = load i64, i64* %169, align 8
  %171 = add nsw i64 %164, %170
  %172 = ashr i64 %171, 16
  %173 = trunc i64 %172 to i8
  %174 = load i8*, i8** %19, align 8
  %175 = load i32, i32* %21, align 4
  %176 = zext i32 %175 to i64
  %177 = getelementptr inbounds i8, i8* %174, i64 %176
  store i8 %173, i8* %177, align 1
  br label %178

; <label>:178:                                    ; preds = %75
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_cmyk_ycck_convert, i64 0, i64 0)
  %179 = add i64 %pgocount, 1
  store i64 %179, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_cmyk_ycck_convert, i64 0, i64 0)
  %180 = load i32, i32* %21, align 4
  %181 = add i32 %180, 1
  store i32 %181, i32* %21, align 4
  br label %71

; <label>:182:                                    ; preds = %71
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_cmyk_ycck_convert, i64 0, i64 1)
  %183 = add i64 %pgocount1, 1
  store i64 %183, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_cmyk_ycck_convert, i64 0, i64 1)
  br label %33

; <label>:184:                                    ; preds = %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_cmyk_ycck_convert, i64 0, i64 2)
  %185 = add i64 %pgocount2, 1
  store i64 %185, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_cmyk_ycck_convert, i64 0, i64 2)
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

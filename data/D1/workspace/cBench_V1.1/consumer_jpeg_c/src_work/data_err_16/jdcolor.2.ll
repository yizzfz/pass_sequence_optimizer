; ModuleID = 'tmp1.ll'
source_filename = "jdcolor.c"
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
%struct.my_color_deconverter = type { %struct.jpeg_color_deconverter, i32*, i32*, i64*, i64* }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_color_deconverter = private constant [23 x i8] c"jinit_color_deconverter"
@__profn_tmp1.ll_start_pass_dcolor = private constant [25 x i8] c"tmp1.ll:start_pass_dcolor"
@__profn_tmp1.ll_grayscale_convert = private constant [25 x i8] c"tmp1.ll:grayscale_convert"
@__profn_tmp1.ll_ycc_rgb_convert = private constant [23 x i8] c"tmp1.ll:ycc_rgb_convert"
@__profn_tmp1.ll_build_ycc_rgb_table = private constant [27 x i8] c"tmp1.ll:build_ycc_rgb_table"
@__profn_tmp1.ll_null_convert = private constant [20 x i8] c"tmp1.ll:null_convert"
@__profn_tmp1.ll_ycck_cmyk_convert = private constant [25 x i8] c"tmp1.ll:ycck_cmyk_convert"
@__profc_jinit_color_deconverter = private global [22 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_color_deconverter = private global [9 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_color_deconverter = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2326292836165008970, i64 2533562715916474, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @jinit_color_deconverter to i8*), i8* bitcast ([9 x i64]* @__profvp_jinit_color_deconverter to i8*), i32 22, [1 x i16] [i16 9] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass_dcolor = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_start_pass_dcolor = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8382262521497027379, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_pass_dcolor, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @start_pass_dcolor to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_grayscale_convert = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_grayscale_convert = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1075889409965712259, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_grayscale_convert, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @grayscale_convert to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_ycc_rgb_convert = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_ycc_rgb_convert = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6811807323137797762, i64 50970046531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ycc_rgb_convert, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @ycc_rgb_convert to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_build_ycc_rgb_table = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_build_ycc_rgb_table = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_build_ycc_rgb_table = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5273068293917428044, i64 1125934044502940, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_build_ycc_rgb_table, i32 0, i32 0), i8* null, i8* bitcast ([4 x i64]* @__profvp_tmp1.ll_build_ycc_rgb_table to i8*), i32 2, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_null_convert = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_null_convert = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3040314690916655055, i64 71176556453, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @null_convert to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_ycck_cmyk_convert = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_ycck_cmyk_convert = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 902694168921896017, i64 50970046531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ycck_cmyk_convert, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @ycck_cmyk_convert to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [13 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [177 x i8] c"\AE\01\00jinit_color_deconverter\01tmp1.ll:start_pass_dcolor\01tmp1.ll:grayscale_convert\01tmp1.ll:ycc_rgb_convert\01tmp1.ll:build_ycc_rgb_table\01tmp1.ll:null_convert\01tmp1.ll:ycck_cmyk_convert", section "__llvm_prf_names"
@llvm.used = appending global [9 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_deconverter to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_dcolor to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_grayscale_convert to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_ycc_rgb_convert to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_build_ycc_rgb_table to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_null_convert to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_ycck_cmyk_convert to i8*), i8* bitcast ([13 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([177 x i8], [177 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jinit_color_deconverter(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_color_deconverter*, align 8
  %4 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 1
  %7 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %7, i32 0, i32 0
  %9 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %8, align 8
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %11 = bitcast %struct.jpeg_decompress_struct* %10 to %struct.jpeg_common_struct*
  %12 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %9 to i64
  call void @__llvm_profile_instrument_target(i64 %12, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_deconverter to i8*), i32 0)
  %13 = call i8* %9(%struct.jpeg_common_struct* %11, i32 1, i64 48)
  %14 = bitcast i8* %13 to %struct.my_color_deconverter*
  store %struct.my_color_deconverter* %14, %struct.my_color_deconverter** %3, align 8
  %15 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %16 = bitcast %struct.my_color_deconverter* %15 to %struct.jpeg_color_deconverter*
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 82
  store %struct.jpeg_color_deconverter* %16, %struct.jpeg_color_deconverter** %18, align 8
  %19 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %20 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.jpeg_color_deconverter, %struct.jpeg_color_deconverter* %20, i32 0, i32 0
  %22 = bitcast {}** %21 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_pass_dcolor, void (%struct.jpeg_decompress_struct*)** %22, align 8
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %23, i32 0, i32 9
  %25 = load i32, i32* %24, align 4
  switch i32 %25, label %90 [
    i32 1, label %28
    i32 2, label %._crit_edge
    i32 3, label %49
    i32 4, label %._crit_edge1
    i32 5, label %69
  ]

._crit_edge1:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 1)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 1)
  br label %69

._crit_edge:                                      ; preds = %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 0)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 0)
  br label %49

; <label>:28:                                     ; preds = %1
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %29, i32 0, i32 8
  %31 = load i32, i32* %30, align 8
  %32 = icmp ne i32 %31, 1
  br i1 %32, label %33, label %47

; <label>:33:                                     ; preds = %28
  %pgocount3 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 15)
  %34 = add i64 %pgocount3, 1
  store i64 %34, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 15)
  %35 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %35, i32 0, i32 0
  %37 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %37, i32 0, i32 5
  store i32 8, i32* %38, align 8
  %39 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %39, i32 0, i32 0
  %41 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %42 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %41, i32 0, i32 0
  %43 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %42, align 8
  %44 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %45 = bitcast %struct.jpeg_decompress_struct* %44 to %struct.jpeg_common_struct*
  %46 = ptrtoint void (%struct.jpeg_common_struct*)* %43 to i64
  call void @__llvm_profile_instrument_target(i64 %46, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_deconverter to i8*), i32 1)
  call void %43(%struct.jpeg_common_struct* %45)
  br label %47

; <label>:47:                                     ; preds = %33, %28
  %pgocount4 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 6)
  %48 = add i64 %pgocount4, 1
  store i64 %48, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 6)
  br label %111

; <label>:49:                                     ; preds = %._crit_edge, %1
  %50 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %50, i32 0, i32 8
  %52 = load i32, i32* %51, align 8
  %53 = icmp ne i32 %52, 3
  br i1 %53, label %54, label %68

; <label>:54:                                     ; preds = %49
  %pgocount5 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 7)
  %55 = add i64 %pgocount5, 1
  store i64 %55, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 7)
  %56 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %56, i32 0, i32 0
  %58 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %59 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %58, i32 0, i32 5
  store i32 8, i32* %59, align 8
  %60 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %61 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %60, i32 0, i32 0
  %62 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %61, align 8
  %63 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %62, i32 0, i32 0
  %64 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %63, align 8
  %65 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %66 = bitcast %struct.jpeg_decompress_struct* %65 to %struct.jpeg_common_struct*
  %67 = ptrtoint void (%struct.jpeg_common_struct*)* %64 to i64
  call void @__llvm_profile_instrument_target(i64 %67, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_deconverter to i8*), i32 2)
  call void %64(%struct.jpeg_common_struct* %66)
  br label %68

; <label>:68:                                     ; preds = %54, %49
  br label %111

; <label>:69:                                     ; preds = %._crit_edge1, %1
  %70 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %71 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %70, i32 0, i32 8
  %72 = load i32, i32* %71, align 8
  %73 = icmp ne i32 %72, 4
  br i1 %73, label %74, label %88

; <label>:74:                                     ; preds = %69
  %pgocount6 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 8)
  %75 = add i64 %pgocount6, 1
  store i64 %75, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 8)
  %76 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %76, i32 0, i32 0
  %78 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %77, align 8
  %79 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %78, i32 0, i32 5
  store i32 8, i32* %79, align 8
  %80 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %81 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %80, i32 0, i32 0
  %82 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %81, align 8
  %83 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %82, i32 0, i32 0
  %84 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %83, align 8
  %85 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %86 = bitcast %struct.jpeg_decompress_struct* %85 to %struct.jpeg_common_struct*
  %87 = ptrtoint void (%struct.jpeg_common_struct*)* %84 to i64
  call void @__llvm_profile_instrument_target(i64 %87, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_deconverter to i8*), i32 3)
  call void %84(%struct.jpeg_common_struct* %86)
  br label %88

; <label>:88:                                     ; preds = %74, %69
  %pgocount7 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 4)
  %89 = add i64 %pgocount7, 1
  store i64 %89, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 4)
  br label %111

; <label>:90:                                     ; preds = %1
  %91 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %92 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %91, i32 0, i32 8
  %93 = load i32, i32* %92, align 8
  %94 = icmp slt i32 %93, 1
  br i1 %94, label %95, label %109

; <label>:95:                                     ; preds = %90
  %pgocount8 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 20)
  %96 = add i64 %pgocount8, 1
  store i64 %96, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 20)
  %97 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %98 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %97, i32 0, i32 0
  %99 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %98, align 8
  %100 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %99, i32 0, i32 5
  store i32 8, i32* %100, align 8
  %101 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %102 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %101, i32 0, i32 0
  %103 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %102, align 8
  %104 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %103, i32 0, i32 0
  %105 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %104, align 8
  %106 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %107 = bitcast %struct.jpeg_decompress_struct* %106 to %struct.jpeg_common_struct*
  %108 = ptrtoint void (%struct.jpeg_common_struct*)* %105 to i64
  call void @__llvm_profile_instrument_target(i64 %108, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_deconverter to i8*), i32 4)
  call void %105(%struct.jpeg_common_struct* %107)
  br label %109

; <label>:109:                                    ; preds = %95, %90
  %pgocount9 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 9)
  %110 = add i64 %pgocount9, 1
  store i64 %110, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 9)
  br label %111

; <label>:111:                                    ; preds = %109, %88, %68, %47
  %112 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %113 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %112, i32 0, i32 10
  %114 = load i32, i32* %113, align 8
  switch i32 %114, label %245 [
    i32 1, label %115
    i32 2, label %167
    i32 4, label %206
  ]

; <label>:115:                                    ; preds = %111
  %116 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %117 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %116, i32 0, i32 28
  store i32 1, i32* %117, align 8
  %118 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %119 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %118, i32 0, i32 9
  %120 = load i32, i32* %119, align 4
  %121 = icmp eq i32 %120, 1
  br i1 %121, label %128, label %122

; <label>:122:                                    ; preds = %115
  %pgocount10 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 12)
  %123 = add i64 %pgocount10, 1
  store i64 %123, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 12)
  %124 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %125 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %124, i32 0, i32 9
  %126 = load i32, i32* %125, align 4
  %127 = icmp eq i32 %126, 3
  br i1 %127, label %128, label %152

; <label>:128:                                    ; preds = %122, %115
  %129 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %130 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %129, i32 0, i32 0
  %131 = getelementptr inbounds %struct.jpeg_color_deconverter, %struct.jpeg_color_deconverter* %130, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @grayscale_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %131, align 8
  store i32 1, i32* %4, align 4
  br label %132

; <label>:132:                                    ; preds = %146, %128
  %133 = load i32, i32* %4, align 4
  %134 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %135 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %134, i32 0, i32 8
  %136 = load i32, i32* %135, align 8
  %137 = icmp slt i32 %133, %136
  br i1 %137, label %138, label %150

; <label>:138:                                    ; preds = %132
  %139 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %140 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %139, i32 0, i32 43
  %141 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %140, align 8
  %142 = load i32, i32* %4, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %141, i64 %143
  %145 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %144, i32 0, i32 12
  store i32 0, i32* %145, align 8
  br label %146

; <label>:146:                                    ; preds = %138
  %pgocount11 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 2)
  %147 = add i64 %pgocount11, 1
  store i64 %147, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 2)
  %148 = load i32, i32* %4, align 4
  %149 = add nsw i32 %148, 1
  store i32 %149, i32* %4, align 4
  br label %132

; <label>:150:                                    ; preds = %132
  %pgocount12 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 5)
  %151 = add i64 %pgocount12, 1
  store i64 %151, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 5)
  br label %166

; <label>:152:                                    ; preds = %122
  %pgocount13 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 21)
  %153 = add i64 %pgocount13, 1
  store i64 %153, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 21)
  %154 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %155 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %154, i32 0, i32 0
  %156 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %155, align 8
  %157 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %156, i32 0, i32 5
  store i32 25, i32* %157, align 8
  %158 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %159 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %158, i32 0, i32 0
  %160 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %159, align 8
  %161 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %160, i32 0, i32 0
  %162 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %161, align 8
  %163 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %164 = bitcast %struct.jpeg_decompress_struct* %163 to %struct.jpeg_common_struct*
  %165 = ptrtoint void (%struct.jpeg_common_struct*)* %162 to i64
  call void @__llvm_profile_instrument_target(i64 %165, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_deconverter to i8*), i32 5)
  call void %162(%struct.jpeg_common_struct* %164)
  br label %166

; <label>:166:                                    ; preds = %152, %150
  br label %278

; <label>:167:                                    ; preds = %111
  %168 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %169 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %168, i32 0, i32 28
  store i32 3, i32* %169, align 8
  %170 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %171 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %170, i32 0, i32 9
  %172 = load i32, i32* %171, align 4
  %173 = icmp eq i32 %172, 3
  br i1 %173, label %174, label %180

; <label>:174:                                    ; preds = %167
  %pgocount14 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 10)
  %175 = add i64 %pgocount14, 1
  store i64 %175, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 10)
  %176 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %177 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %176, i32 0, i32 0
  %178 = getelementptr inbounds %struct.jpeg_color_deconverter, %struct.jpeg_color_deconverter* %177, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @ycc_rgb_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %178, align 8
  %179 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @build_ycc_rgb_table(%struct.jpeg_decompress_struct* %179)
  br label %205

; <label>:180:                                    ; preds = %167
  %181 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %182 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %181, i32 0, i32 9
  %183 = load i32, i32* %182, align 4
  %184 = icmp eq i32 %183, 2
  br i1 %184, label %185, label %190

; <label>:185:                                    ; preds = %180
  %pgocount15 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 16)
  %186 = add i64 %pgocount15, 1
  store i64 %186, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 16)
  %187 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %188 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %187, i32 0, i32 0
  %189 = getelementptr inbounds %struct.jpeg_color_deconverter, %struct.jpeg_color_deconverter* %188, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @null_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %189, align 8
  br label %204

; <label>:190:                                    ; preds = %180
  %pgocount16 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 17)
  %191 = add i64 %pgocount16, 1
  store i64 %191, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 17)
  %192 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %193 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %192, i32 0, i32 0
  %194 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %193, align 8
  %195 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %194, i32 0, i32 5
  store i32 25, i32* %195, align 8
  %196 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %197 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %196, i32 0, i32 0
  %198 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %197, align 8
  %199 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %198, i32 0, i32 0
  %200 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %199, align 8
  %201 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %202 = bitcast %struct.jpeg_decompress_struct* %201 to %struct.jpeg_common_struct*
  %203 = ptrtoint void (%struct.jpeg_common_struct*)* %200 to i64
  call void @__llvm_profile_instrument_target(i64 %203, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_deconverter to i8*), i32 6)
  call void %200(%struct.jpeg_common_struct* %202)
  br label %204

; <label>:204:                                    ; preds = %190, %185
  br label %205

; <label>:205:                                    ; preds = %204, %174
  br label %278

; <label>:206:                                    ; preds = %111
  %207 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %208 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %207, i32 0, i32 28
  store i32 4, i32* %208, align 8
  %209 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %210 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %209, i32 0, i32 9
  %211 = load i32, i32* %210, align 4
  %212 = icmp eq i32 %211, 5
  br i1 %212, label %213, label %219

; <label>:213:                                    ; preds = %206
  %pgocount17 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 11)
  %214 = add i64 %pgocount17, 1
  store i64 %214, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 11)
  %215 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %216 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %215, i32 0, i32 0
  %217 = getelementptr inbounds %struct.jpeg_color_deconverter, %struct.jpeg_color_deconverter* %216, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @ycck_cmyk_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %217, align 8
  %218 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @build_ycc_rgb_table(%struct.jpeg_decompress_struct* %218)
  br label %244

; <label>:219:                                    ; preds = %206
  %220 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %221 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %220, i32 0, i32 9
  %222 = load i32, i32* %221, align 4
  %223 = icmp eq i32 %222, 4
  br i1 %223, label %224, label %229

; <label>:224:                                    ; preds = %219
  %pgocount18 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 18)
  %225 = add i64 %pgocount18, 1
  store i64 %225, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 18)
  %226 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %227 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %226, i32 0, i32 0
  %228 = getelementptr inbounds %struct.jpeg_color_deconverter, %struct.jpeg_color_deconverter* %227, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @null_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %228, align 8
  br label %243

; <label>:229:                                    ; preds = %219
  %pgocount19 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 19)
  %230 = add i64 %pgocount19, 1
  store i64 %230, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 19)
  %231 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %232 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %231, i32 0, i32 0
  %233 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %232, align 8
  %234 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %233, i32 0, i32 5
  store i32 25, i32* %234, align 8
  %235 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %236 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %235, i32 0, i32 0
  %237 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %236, align 8
  %238 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %237, i32 0, i32 0
  %239 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %238, align 8
  %240 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %241 = bitcast %struct.jpeg_decompress_struct* %240 to %struct.jpeg_common_struct*
  %242 = ptrtoint void (%struct.jpeg_common_struct*)* %239 to i64
  call void @__llvm_profile_instrument_target(i64 %242, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_deconverter to i8*), i32 7)
  call void %239(%struct.jpeg_common_struct* %241)
  br label %243

; <label>:243:                                    ; preds = %229, %224
  br label %244

; <label>:244:                                    ; preds = %243, %213
  br label %278

; <label>:245:                                    ; preds = %111
  %246 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %247 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %246, i32 0, i32 10
  %248 = load i32, i32* %247, align 8
  %249 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %250 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %249, i32 0, i32 9
  %251 = load i32, i32* %250, align 4
  %252 = icmp eq i32 %248, %251
  br i1 %252, label %253, label %263

; <label>:253:                                    ; preds = %245
  %pgocount20 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 13)
  %254 = add i64 %pgocount20, 1
  store i64 %254, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 13)
  %255 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %256 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %255, i32 0, i32 8
  %257 = load i32, i32* %256, align 8
  %258 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %259 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %258, i32 0, i32 28
  store i32 %257, i32* %259, align 8
  %260 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %261 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %260, i32 0, i32 0
  %262 = getelementptr inbounds %struct.jpeg_color_deconverter, %struct.jpeg_color_deconverter* %261, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @null_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %262, align 8
  br label %277

; <label>:263:                                    ; preds = %245
  %pgocount21 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 14)
  %264 = add i64 %pgocount21, 1
  store i64 %264, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 14)
  %265 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %266 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %265, i32 0, i32 0
  %267 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %266, align 8
  %268 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %267, i32 0, i32 5
  store i32 25, i32* %268, align 8
  %269 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %270 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %269, i32 0, i32 0
  %271 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %270, align 8
  %272 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %271, i32 0, i32 0
  %273 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %272, align 8
  %274 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %275 = bitcast %struct.jpeg_decompress_struct* %274 to %struct.jpeg_common_struct*
  %276 = ptrtoint void (%struct.jpeg_common_struct*)* %273 to i64
  call void @__llvm_profile_instrument_target(i64 %276, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_color_deconverter to i8*), i32 8)
  call void %273(%struct.jpeg_common_struct* %275)
  br label %277

; <label>:277:                                    ; preds = %263, %253
  br label %278

; <label>:278:                                    ; preds = %277, %244, %205, %166
  %279 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %280 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %279, i32 0, i32 19
  %281 = load i32, i32* %280, align 4
  %282 = icmp ne i32 %281, 0
  br i1 %282, label %283, label %286

; <label>:283:                                    ; preds = %278
  %284 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %285 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %284, i32 0, i32 29
  store i32 1, i32* %285, align 4
  br label %293

; <label>:286:                                    ; preds = %278
  %pgocount22 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 3)
  %287 = add i64 %pgocount22, 1
  store i64 %287, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jinit_color_deconverter, i64 0, i64 3)
  %288 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %289 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %288, i32 0, i32 28
  %290 = load i32, i32* %289, align 8
  %291 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %292 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %291, i32 0, i32 29
  store i32 %290, i32* %292, align 4
  br label %293

; <label>:293:                                    ; preds = %286, %283
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_dcolor(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_pass_dcolor, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_pass_dcolor, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @grayscale_convert(%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_grayscale_convert, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_grayscale_convert, i64 0, i64 0)
  %7 = alloca %struct.jpeg_decompress_struct*, align 8
  %8 = alloca i8***, align 8
  %9 = alloca i32, align 4
  %10 = alloca i8**, align 8
  %11 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %7, align 8
  store i8*** %1, i8**** %8, align 8
  store i32 %2, i32* %9, align 4
  store i8** %3, i8*** %10, align 8
  store i32 %4, i32* %11, align 4
  %12 = load i8***, i8**** %8, align 8
  %13 = getelementptr inbounds i8**, i8*** %12, i64 0
  %14 = load i8**, i8*** %13, align 8
  %15 = load i32, i32* %9, align 4
  %16 = load i8**, i8*** %10, align 8
  %17 = load i32, i32* %11, align 4
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %7, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 26
  %20 = load i32, i32* %19, align 8
  call void @jcopy_sample_rows(i8** %14, i32 %15, i8** %16, i32 0, i32 %17, i32 %20)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @ycc_rgb_convert(%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32) #0 {
  %6 = alloca %struct.jpeg_decompress_struct*, align 8
  %7 = alloca i8***, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8**, align 8
  %10 = alloca i32, align 4
  %11 = alloca %struct.my_color_deconverter*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i8*, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i8*, align 8
  %22 = alloca i32*, align 8
  %23 = alloca i32*, align 8
  %24 = alloca i64*, align 8
  %25 = alloca i64*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %6, align 8
  store i8*** %1, i8**** %7, align 8
  store i32 %2, i32* %8, align 4
  store i8** %3, i8*** %9, align 8
  store i32 %4, i32* %10, align 4
  %26 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %26, i32 0, i32 82
  %28 = load %struct.jpeg_color_deconverter*, %struct.jpeg_color_deconverter** %27, align 8
  %29 = bitcast %struct.jpeg_color_deconverter* %28 to %struct.my_color_deconverter*
  store %struct.my_color_deconverter* %29, %struct.my_color_deconverter** %11, align 8
  %30 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %30, i32 0, i32 26
  %32 = load i32, i32* %31, align 8
  store i32 %32, i32* %20, align 4
  %33 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %33, i32 0, i32 61
  %35 = load i8*, i8** %34, align 8
  store i8* %35, i8** %21, align 8
  %36 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %11, align 8
  %37 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %36, i32 0, i32 1
  %38 = load i32*, i32** %37, align 8
  store i32* %38, i32** %22, align 8
  %39 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %11, align 8
  %40 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %39, i32 0, i32 2
  %41 = load i32*, i32** %40, align 8
  store i32* %41, i32** %23, align 8
  %42 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %11, align 8
  %43 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %42, i32 0, i32 3
  %44 = load i64*, i64** %43, align 8
  store i64* %44, i64** %24, align 8
  %45 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %11, align 8
  %46 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %45, i32 0, i32 4
  %47 = load i64*, i64** %46, align 8
  store i64* %47, i64** %25, align 8
  br label %48

; <label>:48:                                     ; preds = %155, %5
  %49 = load i32, i32* %10, align 4
  %50 = add nsw i32 %49, -1
  store i32 %50, i32* %10, align 4
  %51 = icmp sge i32 %50, 0
  br i1 %51, label %52, label %157

; <label>:52:                                     ; preds = %48
  %53 = load i8***, i8**** %7, align 8
  %54 = getelementptr inbounds i8**, i8*** %53, i64 0
  %55 = load i8**, i8*** %54, align 8
  %56 = load i32, i32* %8, align 4
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i8*, i8** %55, i64 %57
  %59 = load i8*, i8** %58, align 8
  store i8* %59, i8** %16, align 8
  %60 = load i8***, i8**** %7, align 8
  %61 = getelementptr inbounds i8**, i8*** %60, i64 1
  %62 = load i8**, i8*** %61, align 8
  %63 = load i32, i32* %8, align 4
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i8*, i8** %62, i64 %64
  %66 = load i8*, i8** %65, align 8
  store i8* %66, i8** %17, align 8
  %67 = load i8***, i8**** %7, align 8
  %68 = getelementptr inbounds i8**, i8*** %67, i64 2
  %69 = load i8**, i8*** %68, align 8
  %70 = load i32, i32* %8, align 4
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i8*, i8** %69, i64 %71
  %73 = load i8*, i8** %72, align 8
  store i8* %73, i8** %18, align 8
  %74 = load i32, i32* %8, align 4
  %75 = add i32 %74, 1
  store i32 %75, i32* %8, align 4
  %76 = load i8**, i8*** %9, align 8
  %77 = getelementptr inbounds i8*, i8** %76, i32 1
  store i8** %77, i8*** %9, align 8
  %78 = load i8*, i8** %76, align 8
  store i8* %78, i8** %15, align 8
  store i32 0, i32* %19, align 4
  br label %79

; <label>:79:                                     ; preds = %151, %52
  %80 = load i32, i32* %19, align 4
  %81 = load i32, i32* %20, align 4
  %82 = icmp ult i32 %80, %81
  br i1 %82, label %83, label %155

; <label>:83:                                     ; preds = %79
  %84 = load i8*, i8** %16, align 8
  %85 = load i32, i32* %19, align 4
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds i8, i8* %84, i64 %86
  %88 = load i8, i8* %87, align 1
  %89 = zext i8 %88 to i32
  store i32 %89, i32* %12, align 4
  %90 = load i8*, i8** %17, align 8
  %91 = load i32, i32* %19, align 4
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i8, i8* %90, i64 %92
  %94 = load i8, i8* %93, align 1
  %95 = zext i8 %94 to i32
  store i32 %95, i32* %13, align 4
  %96 = load i8*, i8** %18, align 8
  %97 = load i32, i32* %19, align 4
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds i8, i8* %96, i64 %98
  %100 = load i8, i8* %99, align 1
  %101 = zext i8 %100 to i32
  store i32 %101, i32* %14, align 4
  %102 = load i8*, i8** %21, align 8
  %103 = load i32, i32* %12, align 4
  %104 = load i32*, i32** %22, align 8
  %105 = load i32, i32* %14, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32* %104, i64 %106
  %108 = load i32, i32* %107, align 4
  %109 = add nsw i32 %103, %108
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8, i8* %102, i64 %110
  %112 = load i8, i8* %111, align 1
  %113 = load i8*, i8** %15, align 8
  %114 = getelementptr inbounds i8, i8* %113, i64 0
  store i8 %112, i8* %114, align 1
  %115 = load i8*, i8** %21, align 8
  %116 = load i32, i32* %12, align 4
  %117 = load i64*, i64** %25, align 8
  %118 = load i32, i32* %13, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i64, i64* %117, i64 %119
  %121 = load i64, i64* %120, align 8
  %122 = load i64*, i64** %24, align 8
  %123 = load i32, i32* %14, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i64, i64* %122, i64 %124
  %126 = load i64, i64* %125, align 8
  %127 = add nsw i64 %121, %126
  %128 = ashr i64 %127, 16
  %129 = trunc i64 %128 to i32
  %130 = add nsw i32 %116, %129
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i8, i8* %115, i64 %131
  %133 = load i8, i8* %132, align 1
  %134 = load i8*, i8** %15, align 8
  %135 = getelementptr inbounds i8, i8* %134, i64 1
  store i8 %133, i8* %135, align 1
  %136 = load i8*, i8** %21, align 8
  %137 = load i32, i32* %12, align 4
  %138 = load i32*, i32** %23, align 8
  %139 = load i32, i32* %13, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, i32* %138, i64 %140
  %142 = load i32, i32* %141, align 4
  %143 = add nsw i32 %137, %142
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i8, i8* %136, i64 %144
  %146 = load i8, i8* %145, align 1
  %147 = load i8*, i8** %15, align 8
  %148 = getelementptr inbounds i8, i8* %147, i64 2
  store i8 %146, i8* %148, align 1
  %149 = load i8*, i8** %15, align 8
  %150 = getelementptr inbounds i8, i8* %149, i64 3
  store i8* %150, i8** %15, align 8
  br label %151

; <label>:151:                                    ; preds = %83
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ycc_rgb_convert, i64 0, i64 0)
  %152 = add i64 %pgocount, 1
  store i64 %152, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ycc_rgb_convert, i64 0, i64 0)
  %153 = load i32, i32* %19, align 4
  %154 = add i32 %153, 1
  store i32 %154, i32* %19, align 4
  br label %79

; <label>:155:                                    ; preds = %79
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ycc_rgb_convert, i64 0, i64 1)
  %156 = add i64 %pgocount1, 1
  store i64 %156, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ycc_rgb_convert, i64 0, i64 1)
  br label %48

; <label>:157:                                    ; preds = %48
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ycc_rgb_convert, i64 0, i64 2)
  %158 = add i64 %pgocount2, 1
  store i64 %158, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ycc_rgb_convert, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @build_ycc_rgb_table(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_color_deconverter*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %6, i32 0, i32 82
  %8 = load %struct.jpeg_color_deconverter*, %struct.jpeg_color_deconverter** %7, align 8
  %9 = bitcast %struct.jpeg_color_deconverter* %8 to %struct.my_color_deconverter*
  store %struct.my_color_deconverter* %9, %struct.my_color_deconverter** %3, align 8
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %10, i32 0, i32 1
  %12 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %12, i32 0, i32 0
  %14 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %13, align 8
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %16 = bitcast %struct.jpeg_decompress_struct* %15 to %struct.jpeg_common_struct*
  %17 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %14 to i64
  call void @__llvm_profile_instrument_target(i64 %17, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_build_ycc_rgb_table to i8*), i32 0)
  %18 = call i8* %14(%struct.jpeg_common_struct* %16, i32 1, i64 1024)
  %19 = bitcast i8* %18 to i32*
  %20 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %21 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %20, i32 0, i32 1
  store i32* %19, i32** %21, align 8
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 1
  %24 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %24, i32 0, i32 0
  %26 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %25, align 8
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %28 = bitcast %struct.jpeg_decompress_struct* %27 to %struct.jpeg_common_struct*
  %29 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %26 to i64
  call void @__llvm_profile_instrument_target(i64 %29, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_build_ycc_rgb_table to i8*), i32 1)
  %30 = call i8* %26(%struct.jpeg_common_struct* %28, i32 1, i64 1024)
  %31 = bitcast i8* %30 to i32*
  %32 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %33 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %32, i32 0, i32 2
  store i32* %31, i32** %33, align 8
  %34 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %34, i32 0, i32 1
  %36 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %35, align 8
  %37 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %36, i32 0, i32 0
  %38 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %37, align 8
  %39 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %40 = bitcast %struct.jpeg_decompress_struct* %39 to %struct.jpeg_common_struct*
  %41 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %38 to i64
  call void @__llvm_profile_instrument_target(i64 %41, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_build_ycc_rgb_table to i8*), i32 2)
  %42 = call i8* %38(%struct.jpeg_common_struct* %40, i32 1, i64 2048)
  %43 = bitcast i8* %42 to i64*
  %44 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %45 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %44, i32 0, i32 3
  store i64* %43, i64** %45, align 8
  %46 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %46, i32 0, i32 1
  %48 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %48, i32 0, i32 0
  %50 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %49, align 8
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %52 = bitcast %struct.jpeg_decompress_struct* %51 to %struct.jpeg_common_struct*
  %53 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %50 to i64
  call void @__llvm_profile_instrument_target(i64 %53, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_build_ycc_rgb_table to i8*), i32 3)
  %54 = call i8* %50(%struct.jpeg_common_struct* %52, i32 1, i64 2048)
  %55 = bitcast i8* %54 to i64*
  %56 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %57 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %56, i32 0, i32 4
  store i64* %55, i64** %57, align 8
  store i32 0, i32* %4, align 4
  store i64 -128, i64* %5, align 8
  br label %58

; <label>:58:                                     ; preds = %101, %1
  %59 = load i32, i32* %4, align 4
  %60 = icmp sle i32 %59, 255
  br i1 %60, label %61, label %107

; <label>:61:                                     ; preds = %58
  %62 = load i64, i64* %5, align 8
  %63 = mul nsw i64 91881, %62
  %64 = add nsw i64 %63, 32768
  %65 = ashr i64 %64, 16
  %66 = trunc i64 %65 to i32
  %67 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %68 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %67, i32 0, i32 1
  %69 = load i32*, i32** %68, align 8
  %70 = load i32, i32* %4, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32* %69, i64 %71
  store i32 %66, i32* %72, align 4
  %73 = load i64, i64* %5, align 8
  %74 = mul nsw i64 116130, %73
  %75 = add nsw i64 %74, 32768
  %76 = ashr i64 %75, 16
  %77 = trunc i64 %76 to i32
  %78 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %79 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %78, i32 0, i32 2
  %80 = load i32*, i32** %79, align 8
  %81 = load i32, i32* %4, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32* %80, i64 %82
  store i32 %77, i32* %83, align 4
  %84 = load i64, i64* %5, align 8
  %85 = mul nsw i64 -46802, %84
  %86 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %87 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %86, i32 0, i32 3
  %88 = load i64*, i64** %87, align 8
  %89 = load i32, i32* %4, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i64, i64* %88, i64 %90
  store i64 %85, i64* %91, align 8
  %92 = load i64, i64* %5, align 8
  %93 = mul nsw i64 -22554, %92
  %94 = add nsw i64 %93, 32768
  %95 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %96 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %95, i32 0, i32 4
  %97 = load i64*, i64** %96, align 8
  %98 = load i32, i32* %4, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i64, i64* %97, i64 %99
  store i64 %94, i64* %100, align 8
  br label %101

; <label>:101:                                    ; preds = %61
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_build_ycc_rgb_table, i64 0, i64 0)
  %102 = add i64 %pgocount, 1
  store i64 %102, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_build_ycc_rgb_table, i64 0, i64 0)
  %103 = load i32, i32* %4, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, i32* %4, align 4
  %105 = load i64, i64* %5, align 8
  %106 = add nsw i64 %105, 1
  store i64 %106, i64* %5, align 8
  br label %58

; <label>:107:                                    ; preds = %58
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_build_ycc_rgb_table, i64 0, i64 1)
  %108 = add i64 %pgocount1, 1
  store i64 %108, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_build_ycc_rgb_table, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @null_convert(%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32) #0 {
  %6 = alloca %struct.jpeg_decompress_struct*, align 8
  %7 = alloca i8***, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8**, align 8
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %6, align 8
  store i8*** %1, i8**** %7, align 8
  store i32 %2, i32* %8, align 4
  store i8** %3, i8*** %9, align 8
  store i32 %4, i32* %10, align 4
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 8
  %19 = load i32, i32* %18, align 8
  store i32 %19, i32* %14, align 4
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %20, i32 0, i32 26
  %22 = load i32, i32* %21, align 8
  store i32 %22, i32* %15, align 4
  br label %23

; <label>:23:                                     ; preds = %70, %5
  %24 = load i32, i32* %10, align 4
  %25 = add nsw i32 %24, -1
  store i32 %25, i32* %10, align 4
  %26 = icmp sge i32 %25, 0
  br i1 %26, label %27, label %76

; <label>:27:                                     ; preds = %23
  store i32 0, i32* %16, align 4
  br label %28

; <label>:28:                                     ; preds = %66, %27
  %29 = load i32, i32* %16, align 4
  %30 = load i32, i32* %14, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %70

; <label>:32:                                     ; preds = %28
  %33 = load i8***, i8**** %7, align 8
  %34 = load i32, i32* %16, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8**, i8*** %33, i64 %35
  %37 = load i8**, i8*** %36, align 8
  %38 = load i32, i32* %8, align 4
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i8*, i8** %37, i64 %39
  %41 = load i8*, i8** %40, align 8
  store i8* %41, i8** %11, align 8
  %42 = load i8**, i8*** %9, align 8
  %43 = getelementptr inbounds i8*, i8** %42, i64 0
  %44 = load i8*, i8** %43, align 8
  %45 = load i32, i32* %16, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8* %44, i64 %46
  store i8* %47, i8** %12, align 8
  %48 = load i32, i32* %15, align 4
  store i32 %48, i32* %13, align 4
  br label %49

; <label>:49:                                     ; preds = %61, %32
  %50 = load i32, i32* %13, align 4
  %51 = icmp ugt i32 %50, 0
  br i1 %51, label %52, label %65

; <label>:52:                                     ; preds = %49
  %53 = load i8*, i8** %11, align 8
  %54 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %54, i8** %11, align 8
  %55 = load i8, i8* %53, align 1
  %56 = load i8*, i8** %12, align 8
  store i8 %55, i8* %56, align 1
  %57 = load i32, i32* %14, align 4
  %58 = load i8*, i8** %12, align 8
  %59 = sext i32 %57 to i64
  %60 = getelementptr inbounds i8, i8* %58, i64 %59
  store i8* %60, i8** %12, align 8
  br label %61

; <label>:61:                                     ; preds = %52
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i64 0, i64 0)
  %62 = add i64 %pgocount, 1
  store i64 %62, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i64 0, i64 0)
  %63 = load i32, i32* %13, align 4
  %64 = add i32 %63, -1
  store i32 %64, i32* %13, align 4
  br label %49

; <label>:65:                                     ; preds = %49
  br label %66

; <label>:66:                                     ; preds = %65
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i64 0, i64 1)
  %67 = add i64 %pgocount1, 1
  store i64 %67, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i64 0, i64 1)
  %68 = load i32, i32* %16, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %16, align 4
  br label %28

; <label>:70:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i64 0, i64 2)
  %71 = add i64 %pgocount2, 1
  store i64 %71, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i64 0, i64 2)
  %72 = load i32, i32* %8, align 4
  %73 = add i32 %72, 1
  store i32 %73, i32* %8, align 4
  %74 = load i8**, i8*** %9, align 8
  %75 = getelementptr inbounds i8*, i8** %74, i32 1
  store i8** %75, i8*** %9, align 8
  br label %23

; <label>:76:                                     ; preds = %23
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i64 0, i64 3)
  %77 = add i64 %pgocount3, 1
  store i64 %77, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_null_convert, i64 0, i64 3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @ycck_cmyk_convert(%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32) #0 {
  %6 = alloca %struct.jpeg_decompress_struct*, align 8
  %7 = alloca i8***, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8**, align 8
  %10 = alloca i32, align 4
  %11 = alloca %struct.my_color_deconverter*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i8*, align 8
  %19 = alloca i8*, align 8
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i8*, align 8
  %23 = alloca i32*, align 8
  %24 = alloca i32*, align 8
  %25 = alloca i64*, align 8
  %26 = alloca i64*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %6, align 8
  store i8*** %1, i8**** %7, align 8
  store i32 %2, i32* %8, align 4
  store i8** %3, i8*** %9, align 8
  store i32 %4, i32* %10, align 4
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %27, i32 0, i32 82
  %29 = load %struct.jpeg_color_deconverter*, %struct.jpeg_color_deconverter** %28, align 8
  %30 = bitcast %struct.jpeg_color_deconverter* %29 to %struct.my_color_deconverter*
  store %struct.my_color_deconverter* %30, %struct.my_color_deconverter** %11, align 8
  %31 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %31, i32 0, i32 26
  %33 = load i32, i32* %32, align 8
  store i32 %33, i32* %21, align 4
  %34 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %6, align 8
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %34, i32 0, i32 61
  %36 = load i8*, i8** %35, align 8
  store i8* %36, i8** %22, align 8
  %37 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %11, align 8
  %38 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %37, i32 0, i32 1
  %39 = load i32*, i32** %38, align 8
  store i32* %39, i32** %23, align 8
  %40 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %11, align 8
  %41 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %40, i32 0, i32 2
  %42 = load i32*, i32** %41, align 8
  store i32* %42, i32** %24, align 8
  %43 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %11, align 8
  %44 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %43, i32 0, i32 3
  %45 = load i64*, i64** %44, align 8
  store i64* %45, i64** %25, align 8
  %46 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %11, align 8
  %47 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %46, i32 0, i32 4
  %48 = load i64*, i64** %47, align 8
  store i64* %48, i64** %26, align 8
  br label %49

; <label>:49:                                     ; preds = %173, %5
  %50 = load i32, i32* %10, align 4
  %51 = add nsw i32 %50, -1
  store i32 %51, i32* %10, align 4
  %52 = icmp sge i32 %51, 0
  br i1 %52, label %53, label %175

; <label>:53:                                     ; preds = %49
  %54 = load i8***, i8**** %7, align 8
  %55 = getelementptr inbounds i8**, i8*** %54, i64 0
  %56 = load i8**, i8*** %55, align 8
  %57 = load i32, i32* %8, align 4
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i8*, i8** %56, i64 %58
  %60 = load i8*, i8** %59, align 8
  store i8* %60, i8** %16, align 8
  %61 = load i8***, i8**** %7, align 8
  %62 = getelementptr inbounds i8**, i8*** %61, i64 1
  %63 = load i8**, i8*** %62, align 8
  %64 = load i32, i32* %8, align 4
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds i8*, i8** %63, i64 %65
  %67 = load i8*, i8** %66, align 8
  store i8* %67, i8** %17, align 8
  %68 = load i8***, i8**** %7, align 8
  %69 = getelementptr inbounds i8**, i8*** %68, i64 2
  %70 = load i8**, i8*** %69, align 8
  %71 = load i32, i32* %8, align 4
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds i8*, i8** %70, i64 %72
  %74 = load i8*, i8** %73, align 8
  store i8* %74, i8** %18, align 8
  %75 = load i8***, i8**** %7, align 8
  %76 = getelementptr inbounds i8**, i8*** %75, i64 3
  %77 = load i8**, i8*** %76, align 8
  %78 = load i32, i32* %8, align 4
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i8*, i8** %77, i64 %79
  %81 = load i8*, i8** %80, align 8
  store i8* %81, i8** %19, align 8
  %82 = load i32, i32* %8, align 4
  %83 = add i32 %82, 1
  store i32 %83, i32* %8, align 4
  %84 = load i8**, i8*** %9, align 8
  %85 = getelementptr inbounds i8*, i8** %84, i32 1
  store i8** %85, i8*** %9, align 8
  %86 = load i8*, i8** %84, align 8
  store i8* %86, i8** %15, align 8
  store i32 0, i32* %20, align 4
  br label %87

; <label>:87:                                     ; preds = %169, %53
  %88 = load i32, i32* %20, align 4
  %89 = load i32, i32* %21, align 4
  %90 = icmp ult i32 %88, %89
  br i1 %90, label %91, label %173

; <label>:91:                                     ; preds = %87
  %92 = load i8*, i8** %16, align 8
  %93 = load i32, i32* %20, align 4
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds i8, i8* %92, i64 %94
  %96 = load i8, i8* %95, align 1
  %97 = zext i8 %96 to i32
  store i32 %97, i32* %12, align 4
  %98 = load i8*, i8** %17, align 8
  %99 = load i32, i32* %20, align 4
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds i8, i8* %98, i64 %100
  %102 = load i8, i8* %101, align 1
  %103 = zext i8 %102 to i32
  store i32 %103, i32* %13, align 4
  %104 = load i8*, i8** %18, align 8
  %105 = load i32, i32* %20, align 4
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds i8, i8* %104, i64 %106
  %108 = load i8, i8* %107, align 1
  %109 = zext i8 %108 to i32
  store i32 %109, i32* %14, align 4
  %110 = load i8*, i8** %22, align 8
  %111 = load i32, i32* %12, align 4
  %112 = load i32*, i32** %23, align 8
  %113 = load i32, i32* %14, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32* %112, i64 %114
  %116 = load i32, i32* %115, align 4
  %117 = add nsw i32 %111, %116
  %118 = sub nsw i32 255, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i8, i8* %110, i64 %119
  %121 = load i8, i8* %120, align 1
  %122 = load i8*, i8** %15, align 8
  %123 = getelementptr inbounds i8, i8* %122, i64 0
  store i8 %121, i8* %123, align 1
  %124 = load i8*, i8** %22, align 8
  %125 = load i32, i32* %12, align 4
  %126 = load i64*, i64** %26, align 8
  %127 = load i32, i32* %13, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i64, i64* %126, i64 %128
  %130 = load i64, i64* %129, align 8
  %131 = load i64*, i64** %25, align 8
  %132 = load i32, i32* %14, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i64, i64* %131, i64 %133
  %135 = load i64, i64* %134, align 8
  %136 = add nsw i64 %130, %135
  %137 = ashr i64 %136, 16
  %138 = trunc i64 %137 to i32
  %139 = add nsw i32 %125, %138
  %140 = sub nsw i32 255, %139
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i8, i8* %124, i64 %141
  %143 = load i8, i8* %142, align 1
  %144 = load i8*, i8** %15, align 8
  %145 = getelementptr inbounds i8, i8* %144, i64 1
  store i8 %143, i8* %145, align 1
  %146 = load i8*, i8** %22, align 8
  %147 = load i32, i32* %12, align 4
  %148 = load i32*, i32** %24, align 8
  %149 = load i32, i32* %13, align 4
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i32, i32* %148, i64 %150
  %152 = load i32, i32* %151, align 4
  %153 = add nsw i32 %147, %152
  %154 = sub nsw i32 255, %153
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i8, i8* %146, i64 %155
  %157 = load i8, i8* %156, align 1
  %158 = load i8*, i8** %15, align 8
  %159 = getelementptr inbounds i8, i8* %158, i64 2
  store i8 %157, i8* %159, align 1
  %160 = load i8*, i8** %19, align 8
  %161 = load i32, i32* %20, align 4
  %162 = zext i32 %161 to i64
  %163 = getelementptr inbounds i8, i8* %160, i64 %162
  %164 = load i8, i8* %163, align 1
  %165 = load i8*, i8** %15, align 8
  %166 = getelementptr inbounds i8, i8* %165, i64 3
  store i8 %164, i8* %166, align 1
  %167 = load i8*, i8** %15, align 8
  %168 = getelementptr inbounds i8, i8* %167, i64 4
  store i8* %168, i8** %15, align 8
  br label %169

; <label>:169:                                    ; preds = %91
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ycck_cmyk_convert, i64 0, i64 0)
  %170 = add i64 %pgocount, 1
  store i64 %170, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ycck_cmyk_convert, i64 0, i64 0)
  %171 = load i32, i32* %20, align 4
  %172 = add i32 %171, 1
  store i32 %172, i32* %20, align 4
  br label %87

; <label>:173:                                    ; preds = %87
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ycck_cmyk_convert, i64 0, i64 1)
  %174 = add i64 %pgocount1, 1
  store i64 %174, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ycck_cmyk_convert, i64 0, i64 1)
  br label %49

; <label>:175:                                    ; preds = %49
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ycck_cmyk_convert, i64 0, i64 2)
  %176 = add i64 %pgocount2, 1
  store i64 %176, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ycck_cmyk_convert, i64 0, i64 2)
  ret void
}

declare void @jcopy_sample_rows(i8**, i32, i8**, i32, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

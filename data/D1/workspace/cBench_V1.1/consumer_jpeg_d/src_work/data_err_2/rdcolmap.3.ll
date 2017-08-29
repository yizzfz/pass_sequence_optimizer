; ModuleID = 'rdcolmap.2.ll'
source_filename = "rdcolmap.c"
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
%struct.jpeg_decomp_master = type opaque
%struct.jpeg_d_main_controller = type opaque
%struct.jpeg_d_coef_controller = type opaque
%struct.jpeg_d_post_controller = type opaque
%struct.jpeg_input_controller = type opaque
%struct.jpeg_marker_reader = type opaque
%struct.jpeg_entropy_decoder = type opaque
%struct.jpeg_inverse_dct = type opaque
%struct.jpeg_upsampler = type opaque
%struct.jpeg_color_deconverter = type opaque
%struct.jpeg_color_quantizer = type opaque
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_read_color_map = private constant [14 x i8] c"read_color_map"
@__profn_tmp1.ll_read_gif_map = private constant [20 x i8] c"tmp1.ll:read_gif_map"
@__profn_tmp1.ll_read_ppm_map = private constant [20 x i8] c"tmp1.ll:read_ppm_map"
@__profn_tmp1.ll_add_map_entry = private constant [21 x i8] c"tmp1.ll:add_map_entry"
@__profn_tmp1.ll_read_pbm_integer = private constant [24 x i8] c"tmp1.ll:read_pbm_integer"
@__profn_tmp1.ll_pbm_getc = private constant [16 x i8] c"tmp1.ll:pbm_getc"
@__profc_read_color_map = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_read_color_map = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_read_color_map = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5022959948409417018, i64 562984732619227, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_read_color_map, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct._IO_FILE*)* @read_color_map to i8*), i8* bitcast ([2 x i64]* @__profvp_read_color_map to i8*), i32 3, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_gif_map = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_read_gif_map = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_read_gif_map = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -426300855731683591, i64 1126029842774622, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i32 0, i32 0), i8* null, i8* bitcast ([4 x i64]* @__profvp_tmp1.ll_read_gif_map to i8*), i32 10, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_ppm_map = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_read_ppm_map = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_read_ppm_map = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8148721559536795684, i64 1126093327615303, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i32 0, i32 0), i8* null, i8* bitcast ([4 x i64]* @__profvp_tmp1.ll_read_ppm_map to i8*), i32 14, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_add_map_entry = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_add_map_entry = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_add_map_entry = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2030516963314567101, i64 281552953588352, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_add_map_entry, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_add_map_entry to i8*), i32 6, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_pbm_integer = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_read_pbm_integer = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_read_pbm_integer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3332487691971482653, i64 563071106159886, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_read_pbm_integer to i8*), i32 10, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pbm_getc = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pbm_getc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2193738823236291509, i64 55552838574, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pbm_getc, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [13 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [122 x i8] c"x\00read_color_map\01tmp1.ll:read_gif_map\01tmp1.ll:read_ppm_map\01tmp1.ll:add_map_entry\01tmp1.ll:read_pbm_integer\01tmp1.ll:pbm_getc", section "__llvm_prf_names"
@llvm.used = appending global [8 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_read_color_map to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_gif_map to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_ppm_map to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_add_map_entry to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_pbm_integer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pbm_getc to i8*), i8* bitcast ([13 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([122 x i8], [122 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @read_color_map(%struct.jpeg_decompress_struct*, %struct._IO_FILE*) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %4, align 8
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 1
  %7 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %7, i32 0, i32 2
  %9 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %8, align 8
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %11 = bitcast %struct.jpeg_decompress_struct* %10 to %struct.jpeg_common_struct*
  %12 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %9 to i64
  call void @__llvm_profile_instrument_target(i64 %12, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_read_color_map to i8*), i32 0)
  %13 = call i8** %9(%struct.jpeg_common_struct* %11, i32 1, i32 256, i32 3)
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 32
  store i8** %13, i8*** %15, align 8
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 31
  store i32 0, i32* %17, align 4
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %19 = call i32 @_IO_getc(%struct._IO_FILE* %18)
  switch i32 %19, label %28 [
    i32 71, label %20
    i32 80, label %24
  ]

; <label>:20:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_read_color_map, i64 0, i64 1)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_read_color_map, i64 0, i64 1)
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  call void @read_gif_map(%struct.jpeg_decompress_struct* %22, %struct._IO_FILE* %23)
  br label %42

; <label>:24:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_read_color_map, i64 0, i64 0)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_read_color_map, i64 0, i64 0)
  %26 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  call void @read_ppm_map(%struct.jpeg_decompress_struct* %26, %struct._IO_FILE* %27)
  br label %42

; <label>:28:                                     ; preds = %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_read_color_map, i64 0, i64 2)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_read_color_map, i64 0, i64 2)
  %30 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %30, i32 0, i32 0
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i32 0, i32 5
  store i32 1038, i32* %33, align 8
  %34 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %34, i32 0, i32 0
  %36 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %35, align 8
  %37 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %36, i32 0, i32 0
  %38 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %37, align 8
  %39 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %40 = bitcast %struct.jpeg_decompress_struct* %39 to %struct.jpeg_common_struct*
  %41 = ptrtoint void (%struct.jpeg_common_struct*)* %38 to i64
  call void @__llvm_profile_instrument_target(i64 %41, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_read_color_map to i8*), i32 1)
  call void %38(%struct.jpeg_common_struct* %40)
  br label %42

; <label>:42:                                     ; preds = %28, %24, %20
  ret void
}

declare i32 @_IO_getc(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @read_gif_map(%struct.jpeg_decompress_struct*, %struct._IO_FILE*) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca [13 x i32], align 16
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %4, align 8
  store i32 1, i32* %6, align 4
  br label %11

; <label>:11:                                     ; preds = %36, %2
  %12 = load i32, i32* %6, align 4
  %13 = icmp slt i32 %12, 13
  br i1 %13, label %14, label %40

; <label>:14:                                     ; preds = %11
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %16 = call i32 @_IO_getc(%struct._IO_FILE* %15)
  %17 = load i32, i32* %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [13 x i32], [13 x i32]* %5, i64 0, i64 %18
  store i32 %16, i32* %19, align 4
  %20 = icmp eq i32 %16, -1
  br i1 %20, label %21, label %35

; <label>:21:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 5)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 5)
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %23, i32 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i32 0, i32 5
  store i32 1038, i32* %26, align 8
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %27, i32 0, i32 0
  %29 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %28, align 8
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %29, i32 0, i32 0
  %31 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %30, align 8
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %33 = bitcast %struct.jpeg_decompress_struct* %32 to %struct.jpeg_common_struct*
  %34 = ptrtoint void (%struct.jpeg_common_struct*)* %31 to i64
  call void @__llvm_profile_instrument_target(i64 %34, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_gif_map to i8*), i32 0)
  call void %31(%struct.jpeg_common_struct* %33)
  br label %35

; <label>:35:                                     ; preds = %21, %14
  br label %36

; <label>:36:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 0)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 0)
  %38 = load i32, i32* %6, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %6, align 4
  br label %11

; <label>:40:                                     ; preds = %11
  %41 = getelementptr inbounds [13 x i32], [13 x i32]* %5, i64 0, i64 1
  %42 = load i32, i32* %41, align 4
  %43 = icmp ne i32 %42, 73
  br i1 %43, label %49, label %44

; <label>:44:                                     ; preds = %40
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 8)
  %45 = add i64 %pgocount2, 1
  store i64 %45, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 8)
  %46 = getelementptr inbounds [13 x i32], [13 x i32]* %5, i64 0, i64 2
  %47 = load i32, i32* %46, align 8
  %48 = icmp ne i32 %47, 70
  br i1 %48, label %49, label %63

; <label>:49:                                     ; preds = %44, %40
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 7)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 7)
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 0
  %53 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %53, i32 0, i32 5
  store i32 1038, i32* %54, align 8
  %55 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %56 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %55, i32 0, i32 0
  %57 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %56, align 8
  %58 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %57, i32 0, i32 0
  %59 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %58, align 8
  %60 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %61 = bitcast %struct.jpeg_decompress_struct* %60 to %struct.jpeg_common_struct*
  %62 = ptrtoint void (%struct.jpeg_common_struct*)* %59 to i64
  call void @__llvm_profile_instrument_target(i64 %62, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_gif_map to i8*), i32 1)
  call void %59(%struct.jpeg_common_struct* %61)
  br label %63

; <label>:63:                                     ; preds = %49, %44
  %64 = getelementptr inbounds [13 x i32], [13 x i32]* %5, i64 0, i64 10
  %65 = load i32, i32* %64, align 8
  %66 = and i32 %65, 128
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %82

; <label>:68:                                     ; preds = %63
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 9)
  %69 = add i64 %pgocount4, 1
  store i64 %69, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 9)
  %70 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %71 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %70, i32 0, i32 0
  %72 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %71, align 8
  %73 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %72, i32 0, i32 5
  store i32 1038, i32* %73, align 8
  %74 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %75 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %74, i32 0, i32 0
  %76 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %75, align 8
  %77 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %76, i32 0, i32 0
  %78 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %77, align 8
  %79 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %80 = bitcast %struct.jpeg_decompress_struct* %79 to %struct.jpeg_common_struct*
  %81 = ptrtoint void (%struct.jpeg_common_struct*)* %78 to i64
  call void @__llvm_profile_instrument_target(i64 %81, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_gif_map to i8*), i32 2)
  call void %78(%struct.jpeg_common_struct* %80)
  br label %82

; <label>:82:                                     ; preds = %68, %63
  %83 = getelementptr inbounds [13 x i32], [13 x i32]* %5, i64 0, i64 10
  %84 = load i32, i32* %83, align 8
  %85 = and i32 %84, 7
  %86 = shl i32 2, %85
  store i32 %86, i32* %7, align 4
  store i32 0, i32* %6, align 4
  br label %87

; <label>:87:                                     ; preds = %130, %82
  %88 = load i32, i32* %6, align 4
  %89 = load i32, i32* %7, align 4
  %90 = icmp slt i32 %88, %89
  br i1 %90, label %91, label %134

; <label>:91:                                     ; preds = %87
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %93 = call i32 @_IO_getc(%struct._IO_FILE* %92)
  store i32 %93, i32* %8, align 4
  %94 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %95 = call i32 @_IO_getc(%struct._IO_FILE* %94)
  store i32 %95, i32* %9, align 4
  %96 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %97 = call i32 @_IO_getc(%struct._IO_FILE* %96)
  store i32 %97, i32* %10, align 4
  %98 = load i32, i32* %8, align 4
  %99 = icmp eq i32 %98, -1
  br i1 %99, label %108, label %100

; <label>:100:                                    ; preds = %91
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 3)
  %101 = add i64 %pgocount5, 1
  store i64 %101, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 3)
  %102 = load i32, i32* %9, align 4
  %103 = icmp eq i32 %102, -1
  br i1 %103, label %108, label %104

; <label>:104:                                    ; preds = %100
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 4)
  %105 = add i64 %pgocount6, 1
  store i64 %105, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 4)
  %106 = load i32, i32* %10, align 4
  %107 = icmp eq i32 %106, -1
  br i1 %107, label %108, label %122

; <label>:108:                                    ; preds = %104, %100, %91
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 2)
  %109 = add i64 %pgocount7, 1
  store i64 %109, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 2)
  %110 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %111 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %110, i32 0, i32 0
  %112 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %111, align 8
  %113 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %112, i32 0, i32 5
  store i32 1038, i32* %113, align 8
  %114 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %115 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %114, i32 0, i32 0
  %116 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %115, align 8
  %117 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %116, i32 0, i32 0
  %118 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %117, align 8
  %119 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %120 = bitcast %struct.jpeg_decompress_struct* %119 to %struct.jpeg_common_struct*
  %121 = ptrtoint void (%struct.jpeg_common_struct*)* %118 to i64
  call void @__llvm_profile_instrument_target(i64 %121, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_gif_map to i8*), i32 3)
  call void %118(%struct.jpeg_common_struct* %120)
  br label %122

; <label>:122:                                    ; preds = %108, %104
  %123 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %124 = load i32, i32* %8, align 4
  %125 = shl i32 %124, 0
  %126 = load i32, i32* %9, align 4
  %127 = shl i32 %126, 0
  %128 = load i32, i32* %10, align 4
  %129 = shl i32 %128, 0
  call void @add_map_entry(%struct.jpeg_decompress_struct* %123, i32 %125, i32 %127, i32 %129)
  br label %130

; <label>:130:                                    ; preds = %122
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 1)
  %131 = add i64 %pgocount8, 1
  store i64 %131, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 1)
  %132 = load i32, i32* %6, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %6, align 4
  br label %87

; <label>:134:                                    ; preds = %87
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 6)
  %135 = add i64 %pgocount9, 1
  store i64 %135, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_gif_map, i64 0, i64 6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @read_ppm_map(%struct.jpeg_decompress_struct*, %struct._IO_FILE*) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %4, align 8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %15 = call i32 @_IO_getc(%struct._IO_FILE* %14)
  store i32 %15, i32* %5, align 4
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %18 = call i32 @read_pbm_integer(%struct.jpeg_decompress_struct* %16, %struct._IO_FILE* %17)
  store i32 %18, i32* %6, align 4
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %21 = call i32 @read_pbm_integer(%struct.jpeg_decompress_struct* %19, %struct._IO_FILE* %20)
  store i32 %21, i32* %7, align 4
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %24 = call i32 @read_pbm_integer(%struct.jpeg_decompress_struct* %22, %struct._IO_FILE* %23)
  store i32 %24, i32* %8, align 4
  %25 = load i32, i32* %6, align 4
  %26 = icmp ule i32 %25, 0
  br i1 %26, label %35, label %27

; <label>:27:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 8)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 8)
  %29 = load i32, i32* %7, align 4
  %30 = icmp ule i32 %29, 0
  br i1 %30, label %35, label %31

; <label>:31:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 13)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 13)
  %33 = load i32, i32* %8, align 4
  %34 = icmp ule i32 %33, 0
  br i1 %34, label %35, label %49

; <label>:35:                                     ; preds = %31, %27, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 7)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 7)
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %37, i32 0, i32 0
  %39 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %40 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %39, i32 0, i32 5
  store i32 1038, i32* %40, align 8
  %41 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %41, i32 0, i32 0
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i32 0, i32 0
  %45 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %44, align 8
  %46 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %47 = bitcast %struct.jpeg_decompress_struct* %46 to %struct.jpeg_common_struct*
  %48 = ptrtoint void (%struct.jpeg_common_struct*)* %45 to i64
  call void @__llvm_profile_instrument_target(i64 %48, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_ppm_map to i8*), i32 0)
  call void %45(%struct.jpeg_common_struct* %47)
  br label %49

; <label>:49:                                     ; preds = %35, %31
  %50 = load i32, i32* %8, align 4
  %51 = icmp ne i32 %50, 255
  br i1 %51, label %52, label %66

; <label>:52:                                     ; preds = %49
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 9)
  %53 = add i64 %pgocount3, 1
  store i64 %53, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 9)
  %54 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %55 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %54, i32 0, i32 0
  %56 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %55, align 8
  %57 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %56, i32 0, i32 5
  store i32 1038, i32* %57, align 8
  %58 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %58, i32 0, i32 0
  %60 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %59, align 8
  %61 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %60, i32 0, i32 0
  %62 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %61, align 8
  %63 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %64 = bitcast %struct.jpeg_decompress_struct* %63 to %struct.jpeg_common_struct*
  %65 = ptrtoint void (%struct.jpeg_common_struct*)* %62 to i64
  call void @__llvm_profile_instrument_target(i64 %65, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_ppm_map to i8*), i32 1)
  call void %62(%struct.jpeg_common_struct* %64)
  br label %66

; <label>:66:                                     ; preds = %52, %49
  %67 = load i32, i32* %5, align 4
  switch i32 %67, label %160 [
    i32 51, label %68
    i32 54, label %103
  ]

; <label>:68:                                     ; preds = %66
  store i32 0, i32* %9, align 4
  br label %69

; <label>:69:                                     ; preds = %97, %68
  %70 = load i32, i32* %9, align 4
  %71 = load i32, i32* %7, align 4
  %72 = icmp ult i32 %70, %71
  br i1 %72, label %73, label %101

; <label>:73:                                     ; preds = %69
  store i32 0, i32* %10, align 4
  br label %74

; <label>:74:                                     ; preds = %92, %73
  %75 = load i32, i32* %10, align 4
  %76 = load i32, i32* %6, align 4
  %77 = icmp ult i32 %75, %76
  br i1 %77, label %78, label %96

; <label>:78:                                     ; preds = %74
  %79 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %80 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %81 = call i32 @read_pbm_integer(%struct.jpeg_decompress_struct* %79, %struct._IO_FILE* %80)
  store i32 %81, i32* %11, align 4
  %82 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %83 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %84 = call i32 @read_pbm_integer(%struct.jpeg_decompress_struct* %82, %struct._IO_FILE* %83)
  store i32 %84, i32* %12, align 4
  %85 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %86 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %87 = call i32 @read_pbm_integer(%struct.jpeg_decompress_struct* %85, %struct._IO_FILE* %86)
  store i32 %87, i32* %13, align 4
  %88 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %89 = load i32, i32* %11, align 4
  %90 = load i32, i32* %12, align 4
  %91 = load i32, i32* %13, align 4
  call void @add_map_entry(%struct.jpeg_decompress_struct* %88, i32 %89, i32 %90, i32 %91)
  br label %92

; <label>:92:                                     ; preds = %78
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 0)
  %93 = add i64 %pgocount4, 1
  store i64 %93, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 0)
  %94 = load i32, i32* %10, align 4
  %95 = add i32 %94, 1
  store i32 %95, i32* %10, align 4
  br label %74

; <label>:96:                                     ; preds = %74
  br label %97

; <label>:97:                                     ; preds = %96
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 5)
  %98 = add i64 %pgocount5, 1
  store i64 %98, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 5)
  %99 = load i32, i32* %9, align 4
  %100 = add i32 %99, 1
  store i32 %100, i32* %9, align 4
  br label %69

; <label>:101:                                    ; preds = %69
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 10)
  %102 = add i64 %pgocount6, 1
  store i64 %102, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 10)
  br label %174

; <label>:103:                                    ; preds = %66
  store i32 0, i32* %9, align 4
  br label %104

; <label>:104:                                    ; preds = %154, %103
  %105 = load i32, i32* %9, align 4
  %106 = load i32, i32* %7, align 4
  %107 = icmp ult i32 %105, %106
  br i1 %107, label %108, label %158

; <label>:108:                                    ; preds = %104
  store i32 0, i32* %10, align 4
  br label %109

; <label>:109:                                    ; preds = %149, %108
  %110 = load i32, i32* %10, align 4
  %111 = load i32, i32* %6, align 4
  %112 = icmp ult i32 %110, %111
  br i1 %112, label %113, label %153

; <label>:113:                                    ; preds = %109
  %114 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %115 = call i32 @pbm_getc(%struct._IO_FILE* %114)
  store i32 %115, i32* %11, align 4
  %116 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %117 = call i32 @pbm_getc(%struct._IO_FILE* %116)
  store i32 %117, i32* %12, align 4
  %118 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %119 = call i32 @pbm_getc(%struct._IO_FILE* %118)
  store i32 %119, i32* %13, align 4
  %120 = load i32, i32* %11, align 4
  %121 = icmp eq i32 %120, -1
  br i1 %121, label %130, label %122

; <label>:122:                                    ; preds = %113
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 3)
  %123 = add i64 %pgocount7, 1
  store i64 %123, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 3)
  %124 = load i32, i32* %12, align 4
  %125 = icmp eq i32 %124, -1
  br i1 %125, label %130, label %126

; <label>:126:                                    ; preds = %122
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 4)
  %127 = add i64 %pgocount8, 1
  store i64 %127, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 4)
  %128 = load i32, i32* %13, align 4
  %129 = icmp eq i32 %128, -1
  br i1 %129, label %130, label %144

; <label>:130:                                    ; preds = %126, %122, %113
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 2)
  %131 = add i64 %pgocount9, 1
  store i64 %131, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 2)
  %132 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %133 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %132, i32 0, i32 0
  %134 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %133, align 8
  %135 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %134, i32 0, i32 5
  store i32 1038, i32* %135, align 8
  %136 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %137 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %136, i32 0, i32 0
  %138 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %137, align 8
  %139 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %138, i32 0, i32 0
  %140 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %139, align 8
  %141 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %142 = bitcast %struct.jpeg_decompress_struct* %141 to %struct.jpeg_common_struct*
  %143 = ptrtoint void (%struct.jpeg_common_struct*)* %140 to i64
  call void @__llvm_profile_instrument_target(i64 %143, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_ppm_map to i8*), i32 2)
  call void %140(%struct.jpeg_common_struct* %142)
  br label %144

; <label>:144:                                    ; preds = %130, %126
  %145 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %146 = load i32, i32* %11, align 4
  %147 = load i32, i32* %12, align 4
  %148 = load i32, i32* %13, align 4
  call void @add_map_entry(%struct.jpeg_decompress_struct* %145, i32 %146, i32 %147, i32 %148)
  br label %149

; <label>:149:                                    ; preds = %144
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 1)
  %150 = add i64 %pgocount10, 1
  store i64 %150, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 1)
  %151 = load i32, i32* %10, align 4
  %152 = add i32 %151, 1
  store i32 %152, i32* %10, align 4
  br label %109

; <label>:153:                                    ; preds = %109
  br label %154

; <label>:154:                                    ; preds = %153
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 6)
  %155 = add i64 %pgocount11, 1
  store i64 %155, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 6)
  %156 = load i32, i32* %9, align 4
  %157 = add i32 %156, 1
  store i32 %157, i32* %9, align 4
  br label %104

; <label>:158:                                    ; preds = %104
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 11)
  %159 = add i64 %pgocount12, 1
  store i64 %159, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 11)
  br label %174

; <label>:160:                                    ; preds = %66
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 12)
  %161 = add i64 %pgocount13, 1
  store i64 %161, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_read_ppm_map, i64 0, i64 12)
  %162 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %163 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %162, i32 0, i32 0
  %164 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %163, align 8
  %165 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %164, i32 0, i32 5
  store i32 1038, i32* %165, align 8
  %166 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %167 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %166, i32 0, i32 0
  %168 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %167, align 8
  %169 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %168, i32 0, i32 0
  %170 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %169, align 8
  %171 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %172 = bitcast %struct.jpeg_decompress_struct* %171 to %struct.jpeg_common_struct*
  %173 = ptrtoint void (%struct.jpeg_common_struct*)* %170 to i64
  call void @__llvm_profile_instrument_target(i64 %173, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_ppm_map to i8*), i32 3)
  call void %170(%struct.jpeg_common_struct* %172)
  br label %174

; <label>:174:                                    ; preds = %160, %158, %101
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @add_map_entry(%struct.jpeg_decompress_struct*, i32, i32, i32) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 32
  %16 = load i8**, i8*** %15, align 8
  %17 = getelementptr inbounds i8*, i8** %16, i64 0
  %18 = load i8*, i8** %17, align 8
  store i8* %18, i8** %9, align 8
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 32
  %21 = load i8**, i8*** %20, align 8
  %22 = getelementptr inbounds i8*, i8** %21, i64 1
  %23 = load i8*, i8** %22, align 8
  store i8* %23, i8** %10, align 8
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 32
  %26 = load i8**, i8*** %25, align 8
  %27 = getelementptr inbounds i8*, i8** %26, i64 2
  %28 = load i8*, i8** %27, align 8
  store i8* %28, i8** %11, align 8
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %29, i32 0, i32 31
  %31 = load i32, i32* %30, align 4
  store i32 %31, i32* %12, align 4
  store i32 0, i32* %13, align 4
  br label %32

; <label>:32:                                     ; preds = %68, %4
  %33 = load i32, i32* %13, align 4
  %34 = load i32, i32* %12, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %72

; <label>:36:                                     ; preds = %32
  %37 = load i8*, i8** %9, align 8
  %38 = load i32, i32* %13, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8, i8* %37, i64 %39
  %41 = load i8, i8* %40, align 1
  %42 = zext i8 %41 to i32
  %43 = load i32, i32* %6, align 4
  %44 = icmp eq i32 %42, %43
  br i1 %44, label %45, label %67

; <label>:45:                                     ; preds = %36
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_add_map_entry, i64 0, i64 1)
  %46 = add i64 %pgocount, 1
  store i64 %46, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_add_map_entry, i64 0, i64 1)
  %47 = load i8*, i8** %10, align 8
  %48 = load i32, i32* %13, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8* %47, i64 %49
  %51 = load i8, i8* %50, align 1
  %52 = zext i8 %51 to i32
  %53 = load i32, i32* %7, align 4
  %54 = icmp eq i32 %52, %53
  br i1 %54, label %55, label %67

; <label>:55:                                     ; preds = %45
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_add_map_entry, i64 0, i64 2)
  %56 = add i64 %pgocount1, 1
  store i64 %56, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_add_map_entry, i64 0, i64 2)
  %57 = load i8*, i8** %11, align 8
  %58 = load i32, i32* %13, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8* %57, i64 %59
  %61 = load i8, i8* %60, align 1
  %62 = zext i8 %61 to i32
  %63 = load i32, i32* %8, align 4
  %64 = icmp eq i32 %62, %63
  br i1 %64, label %65, label %67

; <label>:65:                                     ; preds = %55
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_add_map_entry, i64 0, i64 5)
  %66 = add i64 %pgocount2, 1
  store i64 %66, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_add_map_entry, i64 0, i64 5)
  br label %119

; <label>:67:                                     ; preds = %55, %45, %36
  br label %68

; <label>:68:                                     ; preds = %67
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_add_map_entry, i64 0, i64 0)
  %69 = add i64 %pgocount3, 1
  store i64 %69, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_add_map_entry, i64 0, i64 0)
  %70 = load i32, i32* %13, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %13, align 4
  br label %32

; <label>:72:                                     ; preds = %32
  %73 = load i32, i32* %12, align 4
  %74 = icmp sge i32 %73, 256
  br i1 %74, label %75, label %95

; <label>:75:                                     ; preds = %72
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_add_map_entry, i64 0, i64 4)
  %76 = add i64 %pgocount4, 1
  store i64 %76, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_add_map_entry, i64 0, i64 4)
  %77 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %78 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %77, i32 0, i32 0
  %79 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %78, align 8
  %80 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %79, i32 0, i32 5
  store i32 56, i32* %80, align 8
  %81 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %82 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %81, i32 0, i32 0
  %83 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %82, align 8
  %84 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %83, i32 0, i32 6
  %85 = bitcast %union.anon* %84 to [8 x i32]*
  %86 = getelementptr inbounds [8 x i32], [8 x i32]* %85, i64 0, i64 0
  store i32 256, i32* %86, align 4
  %87 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %88 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %87, i32 0, i32 0
  %89 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %88, align 8
  %90 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %89, i32 0, i32 0
  %91 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %90, align 8
  %92 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %93 = bitcast %struct.jpeg_decompress_struct* %92 to %struct.jpeg_common_struct*
  %94 = ptrtoint void (%struct.jpeg_common_struct*)* %91 to i64
  call void @__llvm_profile_instrument_target(i64 %94, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_add_map_entry to i8*), i32 0)
  call void %91(%struct.jpeg_common_struct* %93)
  br label %95

; <label>:95:                                     ; preds = %75, %72
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_add_map_entry, i64 0, i64 3)
  %96 = add i64 %pgocount5, 1
  store i64 %96, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_add_map_entry, i64 0, i64 3)
  %97 = load i32, i32* %6, align 4
  %98 = trunc i32 %97 to i8
  %99 = load i8*, i8** %9, align 8
  %100 = load i32, i32* %12, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i8, i8* %99, i64 %101
  store i8 %98, i8* %102, align 1
  %103 = load i32, i32* %7, align 4
  %104 = trunc i32 %103 to i8
  %105 = load i8*, i8** %10, align 8
  %106 = load i32, i32* %12, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i8, i8* %105, i64 %107
  store i8 %104, i8* %108, align 1
  %109 = load i32, i32* %8, align 4
  %110 = trunc i32 %109 to i8
  %111 = load i8*, i8** %11, align 8
  %112 = load i32, i32* %12, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i8, i8* %111, i64 %113
  store i8 %110, i8* %114, align 1
  %115 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %116 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %115, i32 0, i32 31
  %117 = load i32, i32* %116, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, i32* %116, align 4
  br label %119

; <label>:119:                                    ; preds = %95, %65
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @read_pbm_integer(%struct.jpeg_decompress_struct*, %struct._IO_FILE*) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %4, align 8
  br label %7

; <label>:7:                                      ; preds = %43, %2
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %9 = call i32 @pbm_getc(%struct._IO_FILE* %8)
  store i32 %9, i32* %5, align 4
  %10 = load i32, i32* %5, align 4
  %11 = icmp eq i32 %10, -1
  br i1 %11, label %12, label %26

; <label>:12:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 4)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 4)
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 0
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i32 0, i32 5
  store i32 1038, i32* %17, align 8
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i32 0, i32 0
  %22 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %21, align 8
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %24 = bitcast %struct.jpeg_decompress_struct* %23 to %struct.jpeg_common_struct*
  %25 = ptrtoint void (%struct.jpeg_common_struct*)* %22 to i64
  call void @__llvm_profile_instrument_target(i64 %25, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_pbm_integer to i8*), i32 0)
  call void %22(%struct.jpeg_common_struct* %24)
  br label %26

; <label>:26:                                     ; preds = %12, %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 0)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 0)
  br label %28

; <label>:28:                                     ; preds = %26
  %29 = load i32, i32* %5, align 4
  %30 = icmp eq i32 %29, 32
  br i1 %30, label %43, label %31

; <label>:31:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 3)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 3)
  %33 = load i32, i32* %5, align 4
  %34 = icmp eq i32 %33, 9
  br i1 %34, label %43, label %35

; <label>:35:                                     ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 5)
  %36 = add i64 %pgocount3, 1
  store i64 %36, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 5)
  %37 = load i32, i32* %5, align 4
  %38 = icmp eq i32 %37, 10
  br i1 %38, label %43, label %39

; <label>:39:                                     ; preds = %35
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 6)
  %40 = add i64 %pgocount4, 1
  store i64 %40, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 6)
  %41 = load i32, i32* %5, align 4
  %42 = icmp eq i32 %41, 13
  br label %43

; <label>:43:                                     ; preds = %39, %35, %31, %28
  %44 = phi i1 [ true, %35 ], [ true, %31 ], [ true, %28 ], [ %42, %39 ]
  br i1 %44, label %7, label %45

; <label>:45:                                     ; preds = %43
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 7)
  %46 = add i64 %pgocount5, 1
  store i64 %46, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 7)
  %47 = load i32, i32* %5, align 4
  %48 = icmp slt i32 %47, 48
  br i1 %48, label %53, label %49

; <label>:49:                                     ; preds = %45
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 9)
  %50 = add i64 %pgocount6, 1
  store i64 %50, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 9)
  %51 = load i32, i32* %5, align 4
  %52 = icmp sgt i32 %51, 57
  br i1 %52, label %53, label %67

; <label>:53:                                     ; preds = %49, %45
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 8)
  %54 = add i64 %pgocount7, 1
  store i64 %54, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 8)
  %55 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %56 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %55, i32 0, i32 0
  %57 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %56, align 8
  %58 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %57, i32 0, i32 5
  store i32 1038, i32* %58, align 8
  %59 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %60 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %59, i32 0, i32 0
  %61 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %60, align 8
  %62 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %61, i32 0, i32 0
  %63 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %62, align 8
  %64 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %65 = bitcast %struct.jpeg_decompress_struct* %64 to %struct.jpeg_common_struct*
  %66 = ptrtoint void (%struct.jpeg_common_struct*)* %63 to i64
  call void @__llvm_profile_instrument_target(i64 %66, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_pbm_integer to i8*), i32 1)
  call void %63(%struct.jpeg_common_struct* %65)
  br label %67

; <label>:67:                                     ; preds = %53, %49
  %68 = load i32, i32* %5, align 4
  %69 = sub nsw i32 %68, 48
  store i32 %69, i32* %6, align 4
  br label %70

; <label>:70:                                     ; preds = %80, %67
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %72 = call i32 @pbm_getc(%struct._IO_FILE* %71)
  store i32 %72, i32* %5, align 4
  %73 = icmp sge i32 %72, 48
  br i1 %73, label %74, label %78

; <label>:74:                                     ; preds = %70
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 2)
  %75 = add i64 %pgocount8, 1
  store i64 %75, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 2)
  %76 = load i32, i32* %5, align 4
  %77 = icmp sle i32 %76, 57
  br label %78

; <label>:78:                                     ; preds = %74, %70
  %79 = phi i1 [ false, %70 ], [ %77, %74 ]
  br i1 %79, label %80, label %88

; <label>:80:                                     ; preds = %78
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 1)
  %81 = add i64 %pgocount9, 1
  store i64 %81, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i64 0, i64 1)
  %82 = load i32, i32* %6, align 4
  %83 = mul i32 %82, 10
  store i32 %83, i32* %6, align 4
  %84 = load i32, i32* %5, align 4
  %85 = sub nsw i32 %84, 48
  %86 = load i32, i32* %6, align 4
  %87 = add i32 %86, %85
  store i32 %87, i32* %6, align 4
  br label %70

; <label>:88:                                     ; preds = %78
  %89 = load i32, i32* %6, align 4
  ret i32 %89
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @pbm_getc(%struct._IO_FILE*) #0 {
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %5 = call i32 @_IO_getc(%struct._IO_FILE* %4)
  store i32 %5, i32* %3, align 4
  %6 = load i32, i32* %3, align 4
  %7 = icmp eq i32 %6, 35
  br i1 %7, label %8, label %24

; <label>:8:                                      ; preds = %1
  br label %9

; <label>:9:                                      ; preds = %20, %8
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pbm_getc, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pbm_getc, i64 0, i64 0)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %12 = call i32 @_IO_getc(%struct._IO_FILE* %11)
  store i32 %12, i32* %3, align 4
  br label %13

; <label>:13:                                     ; preds = %9
  %14 = load i32, i32* %3, align 4
  %15 = icmp ne i32 %14, 10
  br i1 %15, label %16, label %20

; <label>:16:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pbm_getc, i64 0, i64 1)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pbm_getc, i64 0, i64 1)
  %18 = load i32, i32* %3, align 4
  %19 = icmp ne i32 %18, -1
  br label %20

; <label>:20:                                     ; preds = %16, %13
  %21 = phi i1 [ false, %13 ], [ %19, %16 ]
  br i1 %21, label %9, label %22

; <label>:22:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pbm_getc, i64 0, i64 3)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pbm_getc, i64 0, i64 3)
  br label %24

; <label>:24:                                     ; preds = %22, %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pbm_getc, i64 0, i64 2)
  %25 = add i64 %pgocount3, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pbm_getc, i64 0, i64 2)
  %26 = load i32, i32* %3, align 4
  ret i32 %26
}

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

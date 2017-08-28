; ModuleID = 'tmp1.ll'
source_filename = "rdppm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.cjpeg_source_struct = type { void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, %struct._IO_FILE*, i8**, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
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
%struct.jpeg_comp_master = type opaque
%struct.jpeg_c_main_controller = type opaque
%struct.jpeg_c_prep_controller = type opaque
%struct.jpeg_c_coef_controller = type opaque
%struct.jpeg_marker_writer = type opaque
%struct.jpeg_color_converter = type opaque
%struct.jpeg_downsampler = type opaque
%struct.jpeg_forward_dct = type opaque
%struct.jpeg_entropy_encoder = type opaque
%struct.ppm_source_struct = type { %struct.cjpeg_source_struct, i8*, i8*, i64, i8* }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_read_ppm = private constant [14 x i8] c"jinit_read_ppm"
@__profn_tmp1.ll_start_input_ppm = private constant [23 x i8] c"tmp1.ll:start_input_ppm"
@__profn_tmp1.ll_finish_input_ppm = private constant [24 x i8] c"tmp1.ll:finish_input_ppm"
@__profn_tmp1.ll_read_pbm_integer = private constant [24 x i8] c"tmp1.ll:read_pbm_integer"
@__profn_tmp1.ll_get_text_gray_row = private constant [25 x i8] c"tmp1.ll:get_text_gray_row"
@__profn_tmp1.ll_get_text_rgb_row = private constant [24 x i8] c"tmp1.ll:get_text_rgb_row"
@__profn_tmp1.ll_get_word_gray_row = private constant [25 x i8] c"tmp1.ll:get_word_gray_row"
@__profn_tmp1.ll_get_raw_row = private constant [19 x i8] c"tmp1.ll:get_raw_row"
@__profn_tmp1.ll_get_scaled_gray_row = private constant [27 x i8] c"tmp1.ll:get_scaled_gray_row"
@__profn_tmp1.ll_get_word_rgb_row = private constant [24 x i8] c"tmp1.ll:get_word_rgb_row"
@__profn_tmp1.ll_get_scaled_rgb_row = private constant [26 x i8] c"tmp1.ll:get_scaled_rgb_row"
@__profn_tmp1.ll_pbm_getc = private constant [16 x i8] c"tmp1.ll:pbm_getc"
@__profc_jinit_read_ppm = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_read_ppm = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_read_ppm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8001735282602455329, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_read_ppm, i32 0, i32 0), i8* bitcast (%struct.cjpeg_source_struct* (%struct.jpeg_compress_struct*)* @jinit_read_ppm to i8*), i8* bitcast ([1 x i64]* @__profvp_jinit_read_ppm to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_input_ppm = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_input_ppm = private global [10 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_input_ppm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8352651597952098131, i64 74872574042123281, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @start_input_ppm to i8*), i8* bitcast ([10 x i64]* @__profvp_tmp1.ll_start_input_ppm to i8*), i32 18, [1 x i16] [i16 10] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_input_ppm = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_finish_input_ppm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7647591817665226951, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_input_ppm, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @finish_input_ppm to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_pbm_integer = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_read_pbm_integer = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_read_pbm_integer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3332487691971482653, i64 563071106159886, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_read_pbm_integer, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_read_pbm_integer to i8*), i32 10, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_text_gray_row = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_get_text_gray_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1914689721007966038, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_text_gray_row, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_text_gray_row to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_text_rgb_row = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_get_text_rgb_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6811900750336009567, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_text_rgb_row, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_text_rgb_row to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_word_gray_row = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_word_gray_row = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_word_gray_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1137368350225116559, i64 281519469584782, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_word_gray_row, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_word_gray_row to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_get_word_gray_row to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_raw_row = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_raw_row = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_raw_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4537618084998814460, i64 281497736538215, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_raw_row, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_raw_row to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_get_raw_row to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_scaled_gray_row = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_scaled_gray_row = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_scaled_gray_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3623497441116976863, i64 281519469584782, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_scaled_gray_row, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_scaled_gray_row to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_get_scaled_gray_row to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_word_rgb_row = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_word_rgb_row = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_word_rgb_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6577826187063921840, i64 281519469584782, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_word_rgb_row, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_word_rgb_row to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_get_word_rgb_row to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_scaled_rgb_row = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_scaled_rgb_row = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_scaled_rgb_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8438778814680761369, i64 281519469584782, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_scaled_rgb_row, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_scaled_rgb_row to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_get_scaled_rgb_row to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pbm_getc = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pbm_getc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2193738823236291509, i64 55552838574, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_pbm_getc, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [18 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [285 x i8] c"\9A\02\00jinit_read_ppm\01tmp1.ll:start_input_ppm\01tmp1.ll:finish_input_ppm\01tmp1.ll:read_pbm_integer\01tmp1.ll:get_text_gray_row\01tmp1.ll:get_text_rgb_row\01tmp1.ll:get_word_gray_row\01tmp1.ll:get_raw_row\01tmp1.ll:get_scaled_gray_row\01tmp1.ll:get_word_rgb_row\01tmp1.ll:get_scaled_rgb_row\01tmp1.ll:pbm_getc", section "__llvm_prf_names"
@llvm.used = appending global [14 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_read_ppm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_ppm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_input_ppm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_pbm_integer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_text_gray_row to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_text_rgb_row to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_word_gray_row to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_raw_row to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_scaled_gray_row to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_word_rgb_row to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_scaled_rgb_row to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pbm_getc to i8*), i8* bitcast ([18 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([285 x i8], [285 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define %struct.cjpeg_source_struct* @jinit_read_ppm(%struct.jpeg_compress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_read_ppm, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_read_ppm, i64 0, i64 0)
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.ppm_source_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 1
  %7 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %7, i32 0, i32 0
  %9 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %8, align 8
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %11 = bitcast %struct.jpeg_compress_struct* %10 to %struct.jpeg_common_struct*
  %12 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %9 to i64
  call void @__llvm_profile_instrument_target(i64 %12, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_read_ppm to i8*), i32 0)
  %13 = call i8* %9(%struct.jpeg_common_struct* %11, i32 1, i64 80)
  %14 = bitcast i8* %13 to %struct.ppm_source_struct*
  store %struct.ppm_source_struct* %14, %struct.ppm_source_struct** %4, align 8
  %15 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %4, align 8
  %16 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %15, i32 0, i32 0
  %17 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %16, i32 0, i32 0
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @start_input_ppm, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %17, align 8
  %18 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %4, align 8
  %19 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %18, i32 0, i32 0
  %20 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %19, i32 0, i32 2
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @finish_input_ppm, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %20, align 8
  %21 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %4, align 8
  %22 = bitcast %struct.ppm_source_struct* %21 to %struct.cjpeg_source_struct*
  ret %struct.cjpeg_source_struct* %22
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_input_ppm(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct.ppm_source_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %15 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %16 = bitcast %struct.cjpeg_source_struct* %15 to %struct.ppm_source_struct*
  store %struct.ppm_source_struct* %16, %struct.ppm_source_struct** %5, align 8
  %17 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %18 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %17, i32 0, i32 0
  %19 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %18, i32 0, i32 3
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %21 = call i32 @_IO_getc(%struct._IO_FILE* %20)
  %22 = icmp ne i32 %21, 80
  br i1 %22, label %23, label %37

; <label>:23:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 4)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 4)
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i32 0, i32 5
  store i32 1027, i32* %28, align 8
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i32 0, i32 0
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i32 0, i32 0
  %33 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %32, align 8
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %35 = bitcast %struct.jpeg_compress_struct* %34 to %struct.jpeg_common_struct*
  %36 = ptrtoint void (%struct.jpeg_common_struct*)* %33 to i64
  call void @__llvm_profile_instrument_target(i64 %36, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_ppm to i8*), i32 0)
  call void %33(%struct.jpeg_common_struct* %35)
  br label %37

; <label>:37:                                     ; preds = %23, %2
  %38 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %39 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %38, i32 0, i32 0
  %40 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %39, i32 0, i32 3
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** %40, align 8
  %42 = call i32 @_IO_getc(%struct._IO_FILE* %41)
  store i32 %42, i32* %6, align 4
  %43 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %44 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %45 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %44, i32 0, i32 0
  %46 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %45, i32 0, i32 3
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** %46, align 8
  %48 = call i32 @read_pbm_integer(%struct.jpeg_compress_struct* %43, %struct._IO_FILE* %47)
  store i32 %48, i32* %7, align 4
  %49 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %50 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %51 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %50, i32 0, i32 0
  %52 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %51, i32 0, i32 3
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** %52, align 8
  %54 = call i32 @read_pbm_integer(%struct.jpeg_compress_struct* %49, %struct._IO_FILE* %53)
  store i32 %54, i32* %8, align 4
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %56 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %57 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %56, i32 0, i32 0
  %58 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %57, i32 0, i32 3
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** %58, align 8
  %60 = call i32 @read_pbm_integer(%struct.jpeg_compress_struct* %55, %struct._IO_FILE* %59)
  store i32 %60, i32* %9, align 4
  %61 = load i32, i32* %7, align 4
  %62 = icmp ule i32 %61, 0
  br i1 %62, label %71, label %63

; <label>:63:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 5)
  %64 = add i64 %pgocount1, 1
  store i64 %64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 5)
  %65 = load i32, i32* %8, align 4
  %66 = icmp ule i32 %65, 0
  br i1 %66, label %71, label %67

; <label>:67:                                     ; preds = %63
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 7)
  %68 = add i64 %pgocount2, 1
  store i64 %68, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 7)
  %69 = load i32, i32* %9, align 4
  %70 = icmp ule i32 %69, 0
  br i1 %70, label %71, label %85

; <label>:71:                                     ; preds = %67, %63, %37
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 1)
  %72 = add i64 %pgocount3, 1
  store i64 %72, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 1)
  %73 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %74 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %73, i32 0, i32 0
  %75 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %74, align 8
  %76 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %75, i32 0, i32 5
  store i32 1027, i32* %76, align 8
  %77 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %78 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %77, i32 0, i32 0
  %79 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %78, align 8
  %80 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %79, i32 0, i32 0
  %81 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %80, align 8
  %82 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %83 = bitcast %struct.jpeg_compress_struct* %82 to %struct.jpeg_common_struct*
  %84 = ptrtoint void (%struct.jpeg_common_struct*)* %81 to i64
  call void @__llvm_profile_instrument_target(i64 %84, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_ppm to i8*), i32 1)
  call void %81(%struct.jpeg_common_struct* %83)
  br label %85

; <label>:85:                                     ; preds = %71, %67
  %86 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %87 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %86, i32 0, i32 11
  store i32 8, i32* %87, align 8
  %88 = load i32, i32* %7, align 4
  %89 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %90 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %89, i32 0, i32 6
  store i32 %88, i32* %90, align 8
  %91 = load i32, i32* %8, align 4
  %92 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %93 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %92, i32 0, i32 7
  store i32 %91, i32* %93, align 4
  store i32 1, i32* %10, align 4
  store i32 0, i32* %11, align 4
  store i32 1, i32* %12, align 4
  %94 = load i32, i32* %6, align 4
  switch i32 %94, label %271 [
    i32 50, label %95
    i32 51, label %130
    i32 53, label %165
    i32 54, label %218
  ]

; <label>:95:                                     ; preds = %85
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 9)
  %96 = add i64 %pgocount4, 1
  store i64 %96, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 9)
  %97 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %98 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %97, i32 0, i32 8
  store i32 1, i32* %98, align 8
  %99 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %100 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %99, i32 0, i32 9
  store i32 1, i32* %100, align 4
  %101 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %102 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %101, i32 0, i32 0
  %103 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %102, align 8
  %104 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %103, i32 0, i32 5
  store i32 1029, i32* %104, align 8
  %105 = load i32, i32* %7, align 4
  %106 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %107 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %106, i32 0, i32 0
  %108 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %107, align 8
  %109 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %108, i32 0, i32 6
  %110 = bitcast %union.anon* %109 to [8 x i32]*
  %111 = getelementptr inbounds [8 x i32], [8 x i32]* %110, i64 0, i64 0
  store i32 %105, i32* %111, align 4
  %112 = load i32, i32* %8, align 4
  %113 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %114 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %113, i32 0, i32 0
  %115 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %114, align 8
  %116 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %115, i32 0, i32 6
  %117 = bitcast %union.anon* %116 to [8 x i32]*
  %118 = getelementptr inbounds [8 x i32], [8 x i32]* %117, i64 0, i64 1
  store i32 %112, i32* %118, align 4
  %119 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %120 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %119, i32 0, i32 0
  %121 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %120, align 8
  %122 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %121, i32 0, i32 1
  %123 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %122, align 8
  %124 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %125 = bitcast %struct.jpeg_compress_struct* %124 to %struct.jpeg_common_struct*
  %126 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %123 to i64
  call void @__llvm_profile_instrument_target(i64 %126, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_ppm to i8*), i32 2)
  call void %123(%struct.jpeg_common_struct* %125, i32 1)
  %127 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %128 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %127, i32 0, i32 0
  %129 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %128, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_text_gray_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %129, align 8
  store i32 0, i32* %10, align 4
  br label %285

; <label>:130:                                    ; preds = %85
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 8)
  %131 = add i64 %pgocount5, 1
  store i64 %131, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 8)
  %132 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %133 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %132, i32 0, i32 8
  store i32 3, i32* %133, align 8
  %134 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %135 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %134, i32 0, i32 9
  store i32 2, i32* %135, align 4
  %136 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %137 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %136, i32 0, i32 0
  %138 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %137, align 8
  %139 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %138, i32 0, i32 5
  store i32 1031, i32* %139, align 8
  %140 = load i32, i32* %7, align 4
  %141 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %142 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %141, i32 0, i32 0
  %143 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %142, align 8
  %144 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %143, i32 0, i32 6
  %145 = bitcast %union.anon* %144 to [8 x i32]*
  %146 = getelementptr inbounds [8 x i32], [8 x i32]* %145, i64 0, i64 0
  store i32 %140, i32* %146, align 4
  %147 = load i32, i32* %8, align 4
  %148 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %149 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %148, i32 0, i32 0
  %150 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %149, align 8
  %151 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %150, i32 0, i32 6
  %152 = bitcast %union.anon* %151 to [8 x i32]*
  %153 = getelementptr inbounds [8 x i32], [8 x i32]* %152, i64 0, i64 1
  store i32 %147, i32* %153, align 4
  %154 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %155 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %154, i32 0, i32 0
  %156 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %155, align 8
  %157 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %156, i32 0, i32 1
  %158 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %157, align 8
  %159 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %160 = bitcast %struct.jpeg_compress_struct* %159 to %struct.jpeg_common_struct*
  %161 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %158 to i64
  call void @__llvm_profile_instrument_target(i64 %161, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_ppm to i8*), i32 3)
  call void %158(%struct.jpeg_common_struct* %160, i32 1)
  %162 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %163 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %162, i32 0, i32 0
  %164 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %163, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_text_rgb_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %164, align 8
  store i32 0, i32* %10, align 4
  br label %285

; <label>:165:                                    ; preds = %85
  %166 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %167 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %166, i32 0, i32 8
  store i32 1, i32* %167, align 8
  %168 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %169 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %168, i32 0, i32 9
  store i32 1, i32* %169, align 4
  %170 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %171 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %170, i32 0, i32 0
  %172 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %171, align 8
  %173 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %172, i32 0, i32 5
  store i32 1028, i32* %173, align 8
  %174 = load i32, i32* %7, align 4
  %175 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %176 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %175, i32 0, i32 0
  %177 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %176, align 8
  %178 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %177, i32 0, i32 6
  %179 = bitcast %union.anon* %178 to [8 x i32]*
  %180 = getelementptr inbounds [8 x i32], [8 x i32]* %179, i64 0, i64 0
  store i32 %174, i32* %180, align 4
  %181 = load i32, i32* %8, align 4
  %182 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %183 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %182, i32 0, i32 0
  %184 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %183, align 8
  %185 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %184, i32 0, i32 6
  %186 = bitcast %union.anon* %185 to [8 x i32]*
  %187 = getelementptr inbounds [8 x i32], [8 x i32]* %186, i64 0, i64 1
  store i32 %181, i32* %187, align 4
  %188 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %189 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %188, i32 0, i32 0
  %190 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %189, align 8
  %191 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %190, i32 0, i32 1
  %192 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %191, align 8
  %193 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %194 = bitcast %struct.jpeg_compress_struct* %193 to %struct.jpeg_common_struct*
  %195 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %192 to i64
  call void @__llvm_profile_instrument_target(i64 %195, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_ppm to i8*), i32 4)
  call void %192(%struct.jpeg_common_struct* %194, i32 1)
  %196 = load i32, i32* %9, align 4
  %197 = icmp ugt i32 %196, 255
  br i1 %197, label %198, label %203

; <label>:198:                                    ; preds = %165
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 12)
  %199 = add i64 %pgocount6, 1
  store i64 %199, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 12)
  %200 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %201 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %200, i32 0, i32 0
  %202 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %201, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_word_gray_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %202, align 8
  br label %217

; <label>:203:                                    ; preds = %165
  %204 = load i32, i32* %9, align 4
  %205 = icmp eq i32 %204, 255
  br i1 %205, label %206, label %211

; <label>:206:                                    ; preds = %203
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 15)
  %207 = add i64 %pgocount7, 1
  store i64 %207, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 15)
  %208 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %209 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %208, i32 0, i32 0
  %210 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %209, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_raw_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %210, align 8
  store i32 1, i32* %11, align 4
  store i32 0, i32* %12, align 4
  br label %216

; <label>:211:                                    ; preds = %203
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 16)
  %212 = add i64 %pgocount8, 1
  store i64 %212, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 16)
  %213 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %214 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %213, i32 0, i32 0
  %215 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %214, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_scaled_gray_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %215, align 8
  br label %216

; <label>:216:                                    ; preds = %211, %206
  br label %217

; <label>:217:                                    ; preds = %216, %198
  br label %285

; <label>:218:                                    ; preds = %85
  %219 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %220 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %219, i32 0, i32 8
  store i32 3, i32* %220, align 8
  %221 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %222 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %221, i32 0, i32 9
  store i32 2, i32* %222, align 4
  %223 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %224 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %223, i32 0, i32 0
  %225 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %224, align 8
  %226 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %225, i32 0, i32 5
  store i32 1030, i32* %226, align 8
  %227 = load i32, i32* %7, align 4
  %228 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %229 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %228, i32 0, i32 0
  %230 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %229, align 8
  %231 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %230, i32 0, i32 6
  %232 = bitcast %union.anon* %231 to [8 x i32]*
  %233 = getelementptr inbounds [8 x i32], [8 x i32]* %232, i64 0, i64 0
  store i32 %227, i32* %233, align 4
  %234 = load i32, i32* %8, align 4
  %235 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %236 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %235, i32 0, i32 0
  %237 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %236, align 8
  %238 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %237, i32 0, i32 6
  %239 = bitcast %union.anon* %238 to [8 x i32]*
  %240 = getelementptr inbounds [8 x i32], [8 x i32]* %239, i64 0, i64 1
  store i32 %234, i32* %240, align 4
  %241 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %242 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %241, i32 0, i32 0
  %243 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %242, align 8
  %244 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %243, i32 0, i32 1
  %245 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %244, align 8
  %246 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %247 = bitcast %struct.jpeg_compress_struct* %246 to %struct.jpeg_common_struct*
  %248 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %245 to i64
  call void @__llvm_profile_instrument_target(i64 %248, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_ppm to i8*), i32 5)
  call void %245(%struct.jpeg_common_struct* %247, i32 1)
  %249 = load i32, i32* %9, align 4
  %250 = icmp ugt i32 %249, 255
  br i1 %250, label %251, label %256

; <label>:251:                                    ; preds = %218
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 11)
  %252 = add i64 %pgocount9, 1
  store i64 %252, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 11)
  %253 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %254 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %253, i32 0, i32 0
  %255 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %254, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_word_rgb_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %255, align 8
  br label %270

; <label>:256:                                    ; preds = %218
  %257 = load i32, i32* %9, align 4
  %258 = icmp eq i32 %257, 255
  br i1 %258, label %259, label %264

; <label>:259:                                    ; preds = %256
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 13)
  %260 = add i64 %pgocount10, 1
  store i64 %260, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 13)
  %261 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %262 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %261, i32 0, i32 0
  %263 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %262, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_raw_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %263, align 8
  store i32 1, i32* %11, align 4
  store i32 0, i32* %12, align 4
  br label %269

; <label>:264:                                    ; preds = %256
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 14)
  %265 = add i64 %pgocount11, 1
  store i64 %265, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 14)
  %266 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %267 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %266, i32 0, i32 0
  %268 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %267, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_scaled_rgb_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %268, align 8
  br label %269

; <label>:269:                                    ; preds = %264, %259
  br label %270

; <label>:270:                                    ; preds = %269, %251
  br label %285

; <label>:271:                                    ; preds = %85
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 10)
  %272 = add i64 %pgocount12, 1
  store i64 %272, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 10)
  %273 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %274 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %273, i32 0, i32 0
  %275 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %274, align 8
  %276 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %275, i32 0, i32 5
  store i32 1027, i32* %276, align 8
  %277 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %278 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %277, i32 0, i32 0
  %279 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %278, align 8
  %280 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %279, i32 0, i32 0
  %281 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %280, align 8
  %282 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %283 = bitcast %struct.jpeg_compress_struct* %282 to %struct.jpeg_common_struct*
  %284 = ptrtoint void (%struct.jpeg_common_struct*)* %281 to i64
  call void @__llvm_profile_instrument_target(i64 %284, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_ppm to i8*), i32 6)
  call void %281(%struct.jpeg_common_struct* %283)
  br label %285

; <label>:285:                                    ; preds = %271, %270, %217, %130, %95
  %286 = load i32, i32* %10, align 4
  %287 = icmp ne i32 %286, 0
  br i1 %287, label %288, label %319

; <label>:288:                                    ; preds = %285
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 2)
  %289 = add i64 %pgocount13, 1
  store i64 %289, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 2)
  %290 = load i32, i32* %7, align 4
  %291 = zext i32 %290 to i64
  %292 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %293 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %292, i32 0, i32 8
  %294 = load i32, i32* %293, align 8
  %295 = sext i32 %294 to i64
  %296 = mul i64 %291, %295
  %297 = load i32, i32* %9, align 4
  %298 = icmp ule i32 %297, 255
  %299 = zext i1 %298 to i64
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 17)
  %300 = add i64 %pgocount14, %299
  store i64 %300, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 17)
  %301 = select i1 %298, i64 1, i64 2
  %302 = mul i64 %296, %301
  %303 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %304 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %303, i32 0, i32 3
  store i64 %302, i64* %304, align 8
  %305 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %306 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %305, i32 0, i32 1
  %307 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %306, align 8
  %308 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %307, i32 0, i32 0
  %309 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %308, align 8
  %310 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %311 = bitcast %struct.jpeg_compress_struct* %310 to %struct.jpeg_common_struct*
  %312 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %313 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %312, i32 0, i32 3
  %314 = load i64, i64* %313, align 8
  %315 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %309 to i64
  call void @__llvm_profile_instrument_target(i64 %315, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_ppm to i8*), i32 7)
  %316 = call i8* %309(%struct.jpeg_common_struct* %311, i32 1, i64 %314)
  %317 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %318 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %317, i32 0, i32 1
  store i8* %316, i8** %318, align 8
  br label %319

; <label>:319:                                    ; preds = %288, %285
  %320 = load i32, i32* %11, align 4
  %321 = icmp ne i32 %320, 0
  br i1 %321, label %322, label %336

; <label>:322:                                    ; preds = %319
  %323 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %324 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %323, i32 0, i32 1
  %325 = load i8*, i8** %324, align 8
  %326 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %327 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %326, i32 0, i32 2
  store i8* %325, i8** %327, align 8
  %328 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %329 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %328, i32 0, i32 2
  %330 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %331 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %330, i32 0, i32 0
  %332 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %331, i32 0, i32 4
  store i8** %329, i8*** %332, align 8
  %333 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %334 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %333, i32 0, i32 0
  %335 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %334, i32 0, i32 5
  store i32 1, i32* %335, align 8
  br label %358

; <label>:336:                                    ; preds = %319
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 6)
  %337 = add i64 %pgocount15, 1
  store i64 %337, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 6)
  %338 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %339 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %338, i32 0, i32 1
  %340 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %339, align 8
  %341 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %340, i32 0, i32 2
  %342 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %341, align 8
  %343 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %344 = bitcast %struct.jpeg_compress_struct* %343 to %struct.jpeg_common_struct*
  %345 = load i32, i32* %7, align 4
  %346 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %347 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %346, i32 0, i32 8
  %348 = load i32, i32* %347, align 8
  %349 = mul i32 %345, %348
  %350 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %342 to i64
  call void @__llvm_profile_instrument_target(i64 %350, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_ppm to i8*), i32 8)
  %351 = call i8** %342(%struct.jpeg_common_struct* %344, i32 1, i32 %349, i32 1)
  %352 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %353 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %352, i32 0, i32 0
  %354 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %353, i32 0, i32 4
  store i8** %351, i8*** %354, align 8
  %355 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %356 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %355, i32 0, i32 0
  %357 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %356, i32 0, i32 5
  store i32 1, i32* %357, align 8
  br label %358

; <label>:358:                                    ; preds = %336, %322
  %359 = load i32, i32* %12, align 4
  %360 = icmp ne i32 %359, 0
  br i1 %360, label %361, label %405

; <label>:361:                                    ; preds = %358
  %362 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %363 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %362, i32 0, i32 1
  %364 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %363, align 8
  %365 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %364, i32 0, i32 0
  %366 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %365, align 8
  %367 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %368 = bitcast %struct.jpeg_compress_struct* %367 to %struct.jpeg_common_struct*
  %369 = load i32, i32* %9, align 4
  %370 = zext i32 %369 to i64
  %371 = add nsw i64 %370, 1
  %372 = mul i64 %371, 1
  %373 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %366 to i64
  call void @__llvm_profile_instrument_target(i64 %373, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_ppm to i8*), i32 9)
  %374 = call i8* %366(%struct.jpeg_common_struct* %368, i32 1, i64 %372)
  %375 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %376 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %375, i32 0, i32 4
  store i8* %374, i8** %376, align 8
  %377 = load i32, i32* %9, align 4
  %378 = udiv i32 %377, 2
  %379 = zext i32 %378 to i64
  store i64 %379, i64* %14, align 8
  store i64 0, i64* %13, align 8
  br label %380

; <label>:380:                                    ; preds = %399, %361
  %381 = load i64, i64* %13, align 8
  %382 = load i32, i32* %9, align 4
  %383 = zext i32 %382 to i64
  %384 = icmp sle i64 %381, %383
  br i1 %384, label %385, label %403

; <label>:385:                                    ; preds = %380
  %386 = load i64, i64* %13, align 8
  %387 = mul nsw i64 %386, 255
  %388 = load i64, i64* %14, align 8
  %389 = add nsw i64 %387, %388
  %390 = load i32, i32* %9, align 4
  %391 = zext i32 %390 to i64
  %392 = sdiv i64 %389, %391
  %393 = trunc i64 %392 to i8
  %394 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %395 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %394, i32 0, i32 4
  %396 = load i8*, i8** %395, align 8
  %397 = load i64, i64* %13, align 8
  %398 = getelementptr inbounds i8, i8* %396, i64 %397
  store i8 %393, i8* %398, align 1
  br label %399

; <label>:399:                                    ; preds = %385
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 0)
  %400 = add i64 %pgocount16, 1
  store i64 %400, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 0)
  %401 = load i64, i64* %13, align 8
  %402 = add nsw i64 %401, 1
  store i64 %402, i64* %13, align 8
  br label %380

; <label>:403:                                    ; preds = %380
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 3)
  %404 = add i64 %pgocount17, 1
  store i64 %404, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_start_input_ppm, i64 0, i64 3)
  br label %405

; <label>:405:                                    ; preds = %403, %358
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_input_ppm(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_input_ppm, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_input_ppm, i64 0, i64 0)
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca %struct.cjpeg_source_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %5, align 8
  ret void
}

declare i32 @_IO_getc(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @read_pbm_integer(%struct.jpeg_compress_struct*, %struct._IO_FILE*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
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
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %14, i32 0, i32 0
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i32 0, i32 5
  store i32 42, i32* %17, align 8
  %18 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %18, i32 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i32 0, i32 0
  %22 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %21, align 8
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %24 = bitcast %struct.jpeg_compress_struct* %23 to %struct.jpeg_common_struct*
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
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %55, i32 0, i32 0
  %57 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %56, align 8
  %58 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %57, i32 0, i32 5
  store i32 1026, i32* %58, align 8
  %59 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %59, i32 0, i32 0
  %61 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %60, align 8
  %62 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %61, i32 0, i32 0
  %63 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %62, align 8
  %64 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %65 = bitcast %struct.jpeg_compress_struct* %64 to %struct.jpeg_common_struct*
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
define internal i32 @get_text_gray_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct.ppm_source_struct*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %10 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %11 = bitcast %struct.cjpeg_source_struct* %10 to %struct.ppm_source_struct*
  store %struct.ppm_source_struct* %11, %struct.ppm_source_struct** %5, align 8
  %12 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %13 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %12, i32 0, i32 0
  %14 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %13, i32 0, i32 3
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %14, align 8
  store %struct._IO_FILE* %15, %struct._IO_FILE** %6, align 8
  %16 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %17 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %16, i32 0, i32 4
  %18 = load i8*, i8** %17, align 8
  store i8* %18, i8** %8, align 8
  %19 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %20 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %20, i32 0, i32 4
  %22 = load i8**, i8*** %21, align 8
  %23 = getelementptr inbounds i8*, i8** %22, i64 0
  %24 = load i8*, i8** %23, align 8
  store i8* %24, i8** %7, align 8
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 6
  %27 = load i32, i32* %26, align 8
  store i32 %27, i32* %9, align 4
  br label %28

; <label>:28:                                     ; preds = %41, %2
  %29 = load i32, i32* %9, align 4
  %30 = icmp ugt i32 %29, 0
  br i1 %30, label %31, label %45

; <label>:31:                                     ; preds = %28
  %32 = load i8*, i8** %8, align 8
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %35 = call i32 @read_pbm_integer(%struct.jpeg_compress_struct* %33, %struct._IO_FILE* %34)
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8* %32, i64 %36
  %38 = load i8, i8* %37, align 1
  %39 = load i8*, i8** %7, align 8
  %40 = getelementptr inbounds i8, i8* %39, i32 1
  store i8* %40, i8** %7, align 8
  store i8 %38, i8* %39, align 1
  br label %41

; <label>:41:                                     ; preds = %31
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_text_gray_row, i64 0, i64 0)
  %42 = add i64 %pgocount, 1
  store i64 %42, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_text_gray_row, i64 0, i64 0)
  %43 = load i32, i32* %9, align 4
  %44 = add i32 %43, -1
  store i32 %44, i32* %9, align 4
  br label %28

; <label>:45:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_text_gray_row, i64 0, i64 1)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_text_gray_row, i64 0, i64 1)
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_text_rgb_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct.ppm_source_struct*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %10 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %11 = bitcast %struct.cjpeg_source_struct* %10 to %struct.ppm_source_struct*
  store %struct.ppm_source_struct* %11, %struct.ppm_source_struct** %5, align 8
  %12 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %13 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %12, i32 0, i32 0
  %14 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %13, i32 0, i32 3
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %14, align 8
  store %struct._IO_FILE* %15, %struct._IO_FILE** %6, align 8
  %16 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %17 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %16, i32 0, i32 4
  %18 = load i8*, i8** %17, align 8
  store i8* %18, i8** %8, align 8
  %19 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %20 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %20, i32 0, i32 4
  %22 = load i8**, i8*** %21, align 8
  %23 = getelementptr inbounds i8*, i8** %22, i64 0
  %24 = load i8*, i8** %23, align 8
  store i8* %24, i8** %7, align 8
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 6
  %27 = load i32, i32* %26, align 8
  store i32 %27, i32* %9, align 4
  br label %28

; <label>:28:                                     ; preds = %59, %2
  %29 = load i32, i32* %9, align 4
  %30 = icmp ugt i32 %29, 0
  br i1 %30, label %31, label %63

; <label>:31:                                     ; preds = %28
  %32 = load i8*, i8** %8, align 8
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %35 = call i32 @read_pbm_integer(%struct.jpeg_compress_struct* %33, %struct._IO_FILE* %34)
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8* %32, i64 %36
  %38 = load i8, i8* %37, align 1
  %39 = load i8*, i8** %7, align 8
  %40 = getelementptr inbounds i8, i8* %39, i32 1
  store i8* %40, i8** %7, align 8
  store i8 %38, i8* %39, align 1
  %41 = load i8*, i8** %8, align 8
  %42 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %44 = call i32 @read_pbm_integer(%struct.jpeg_compress_struct* %42, %struct._IO_FILE* %43)
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i8, i8* %41, i64 %45
  %47 = load i8, i8* %46, align 1
  %48 = load i8*, i8** %7, align 8
  %49 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %49, i8** %7, align 8
  store i8 %47, i8* %48, align 1
  %50 = load i8*, i8** %8, align 8
  %51 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %53 = call i32 @read_pbm_integer(%struct.jpeg_compress_struct* %51, %struct._IO_FILE* %52)
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i8, i8* %50, i64 %54
  %56 = load i8, i8* %55, align 1
  %57 = load i8*, i8** %7, align 8
  %58 = getelementptr inbounds i8, i8* %57, i32 1
  store i8* %58, i8** %7, align 8
  store i8 %56, i8* %57, align 1
  br label %59

; <label>:59:                                     ; preds = %31
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_text_rgb_row, i64 0, i64 0)
  %60 = add i64 %pgocount, 1
  store i64 %60, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_text_rgb_row, i64 0, i64 0)
  %61 = load i32, i32* %9, align 4
  %62 = add i32 %61, -1
  store i32 %62, i32* %9, align 4
  br label %28

; <label>:63:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_text_rgb_row, i64 0, i64 1)
  %64 = add i64 %pgocount1, 1
  store i64 %64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_text_rgb_row, i64 0, i64 1)
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_word_gray_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct.ppm_source_struct*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %11 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %12 = bitcast %struct.cjpeg_source_struct* %11 to %struct.ppm_source_struct*
  store %struct.ppm_source_struct* %12, %struct.ppm_source_struct** %5, align 8
  %13 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %14 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %13, i32 0, i32 4
  %15 = load i8*, i8** %14, align 8
  store i8* %15, i8** %8, align 8
  %16 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %17 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %16, i32 0, i32 1
  %18 = load i8*, i8** %17, align 8
  %19 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %20 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %19, i32 0, i32 3
  %21 = load i64, i64* %20, align 8
  %22 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %23 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %22, i32 0, i32 0
  %24 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %23, i32 0, i32 3
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %24, align 8
  %26 = call i64 @fread(i8* %18, i64 1, i64 %21, %struct._IO_FILE* %25)
  %27 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %28 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %27, i32 0, i32 3
  %29 = load i64, i64* %28, align 8
  %30 = icmp eq i64 %26, %29
  br i1 %30, label %45, label %31

; <label>:31:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_word_gray_row, i64 0, i64 2)
  %32 = add i64 %pgocount, 1
  store i64 %32, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_word_gray_row, i64 0, i64 2)
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %33, i32 0, i32 0
  %35 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %35, i32 0, i32 5
  store i32 42, i32* %36, align 8
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %37, i32 0, i32 0
  %39 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %40 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %39, i32 0, i32 0
  %41 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %40, align 8
  %42 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %43 = bitcast %struct.jpeg_compress_struct* %42 to %struct.jpeg_common_struct*
  %44 = ptrtoint void (%struct.jpeg_common_struct*)* %41 to i64
  call void @__llvm_profile_instrument_target(i64 %44, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_word_gray_row to i8*), i32 0)
  call void %41(%struct.jpeg_common_struct* %43)
  br label %45

; <label>:45:                                     ; preds = %31, %2
  %46 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %47 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %46, i32 0, i32 0
  %48 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %47, i32 0, i32 4
  %49 = load i8**, i8*** %48, align 8
  %50 = getelementptr inbounds i8*, i8** %49, i64 0
  %51 = load i8*, i8** %50, align 8
  store i8* %51, i8** %6, align 8
  %52 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %53 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %52, i32 0, i32 1
  %54 = load i8*, i8** %53, align 8
  store i8* %54, i8** %7, align 8
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %55, i32 0, i32 6
  %57 = load i32, i32* %56, align 8
  store i32 %57, i32* %9, align 4
  br label %58

; <label>:58:                                     ; preds = %80, %45
  %59 = load i32, i32* %9, align 4
  %60 = icmp ugt i32 %59, 0
  br i1 %60, label %61, label %84

; <label>:61:                                     ; preds = %58
  %62 = load i8*, i8** %7, align 8
  %63 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %63, i8** %7, align 8
  %64 = load i8, i8* %62, align 1
  %65 = zext i8 %64 to i32
  store i32 %65, i32* %10, align 4
  %66 = load i8*, i8** %7, align 8
  %67 = getelementptr inbounds i8, i8* %66, i32 1
  store i8* %67, i8** %7, align 8
  %68 = load i8, i8* %66, align 1
  %69 = zext i8 %68 to i32
  %70 = shl i32 %69, 8
  %71 = load i32, i32* %10, align 4
  %72 = or i32 %71, %70
  store i32 %72, i32* %10, align 4
  %73 = load i8*, i8** %8, align 8
  %74 = load i32, i32* %10, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8* %73, i64 %75
  %77 = load i8, i8* %76, align 1
  %78 = load i8*, i8** %6, align 8
  %79 = getelementptr inbounds i8, i8* %78, i32 1
  store i8* %79, i8** %6, align 8
  store i8 %77, i8* %78, align 1
  br label %80

; <label>:80:                                     ; preds = %61
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_word_gray_row, i64 0, i64 0)
  %81 = add i64 %pgocount1, 1
  store i64 %81, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_word_gray_row, i64 0, i64 0)
  %82 = load i32, i32* %9, align 4
  %83 = add i32 %82, -1
  store i32 %83, i32* %9, align 4
  br label %58

; <label>:84:                                     ; preds = %58
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_word_gray_row, i64 0, i64 1)
  %85 = add i64 %pgocount2, 1
  store i64 %85, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_word_gray_row, i64 0, i64 1)
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_raw_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct.ppm_source_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %6 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %7 = bitcast %struct.cjpeg_source_struct* %6 to %struct.ppm_source_struct*
  store %struct.ppm_source_struct* %7, %struct.ppm_source_struct** %5, align 8
  %8 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %9 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %8, i32 0, i32 1
  %10 = load i8*, i8** %9, align 8
  %11 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %12 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %11, i32 0, i32 3
  %13 = load i64, i64* %12, align 8
  %14 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %15 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %14, i32 0, i32 0
  %16 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %15, i32 0, i32 3
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %18 = call i64 @fread(i8* %10, i64 1, i64 %13, %struct._IO_FILE* %17)
  %19 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %20 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %19, i32 0, i32 3
  %21 = load i64, i64* %20, align 8
  %22 = icmp eq i64 %18, %21
  br i1 %22, label %37, label %23

; <label>:23:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_raw_row, i64 0, i64 1)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_raw_row, i64 0, i64 1)
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i32 0, i32 5
  store i32 42, i32* %28, align 8
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i32 0, i32 0
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i32 0, i32 0
  %33 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %32, align 8
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %35 = bitcast %struct.jpeg_compress_struct* %34 to %struct.jpeg_common_struct*
  %36 = ptrtoint void (%struct.jpeg_common_struct*)* %33 to i64
  call void @__llvm_profile_instrument_target(i64 %36, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_raw_row to i8*), i32 0)
  call void %33(%struct.jpeg_common_struct* %35)
  br label %37

; <label>:37:                                     ; preds = %23, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_raw_row, i64 0, i64 0)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_raw_row, i64 0, i64 0)
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_scaled_gray_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct.ppm_source_struct*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %10 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %11 = bitcast %struct.cjpeg_source_struct* %10 to %struct.ppm_source_struct*
  store %struct.ppm_source_struct* %11, %struct.ppm_source_struct** %5, align 8
  %12 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %13 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %12, i32 0, i32 4
  %14 = load i8*, i8** %13, align 8
  store i8* %14, i8** %8, align 8
  %15 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %16 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %15, i32 0, i32 1
  %17 = load i8*, i8** %16, align 8
  %18 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %19 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %18, i32 0, i32 3
  %20 = load i64, i64* %19, align 8
  %21 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %22 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %21, i32 0, i32 0
  %23 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %22, i32 0, i32 3
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %23, align 8
  %25 = call i64 @fread(i8* %17, i64 1, i64 %20, %struct._IO_FILE* %24)
  %26 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %27 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %26, i32 0, i32 3
  %28 = load i64, i64* %27, align 8
  %29 = icmp eq i64 %25, %28
  br i1 %29, label %44, label %30

; <label>:30:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_scaled_gray_row, i64 0, i64 2)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_scaled_gray_row, i64 0, i64 2)
  %32 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %32, i32 0, i32 0
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i32 0, i32 5
  store i32 42, i32* %35, align 8
  %36 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %37 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %36, i32 0, i32 0
  %38 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %37, align 8
  %39 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %38, i32 0, i32 0
  %40 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %39, align 8
  %41 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %42 = bitcast %struct.jpeg_compress_struct* %41 to %struct.jpeg_common_struct*
  %43 = ptrtoint void (%struct.jpeg_common_struct*)* %40 to i64
  call void @__llvm_profile_instrument_target(i64 %43, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_scaled_gray_row to i8*), i32 0)
  call void %40(%struct.jpeg_common_struct* %42)
  br label %44

; <label>:44:                                     ; preds = %30, %2
  %45 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %46 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %45, i32 0, i32 0
  %47 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %46, i32 0, i32 4
  %48 = load i8**, i8*** %47, align 8
  %49 = getelementptr inbounds i8*, i8** %48, i64 0
  %50 = load i8*, i8** %49, align 8
  store i8* %50, i8** %6, align 8
  %51 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %52 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %51, i32 0, i32 1
  %53 = load i8*, i8** %52, align 8
  store i8* %53, i8** %7, align 8
  %54 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %55 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %54, i32 0, i32 6
  %56 = load i32, i32* %55, align 8
  store i32 %56, i32* %9, align 4
  br label %57

; <label>:57:                                     ; preds = %71, %44
  %58 = load i32, i32* %9, align 4
  %59 = icmp ugt i32 %58, 0
  br i1 %59, label %60, label %75

; <label>:60:                                     ; preds = %57
  %61 = load i8*, i8** %8, align 8
  %62 = load i8*, i8** %7, align 8
  %63 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %63, i8** %7, align 8
  %64 = load i8, i8* %62, align 1
  %65 = zext i8 %64 to i32
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8* %61, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = load i8*, i8** %6, align 8
  %70 = getelementptr inbounds i8, i8* %69, i32 1
  store i8* %70, i8** %6, align 8
  store i8 %68, i8* %69, align 1
  br label %71

; <label>:71:                                     ; preds = %60
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_scaled_gray_row, i64 0, i64 0)
  %72 = add i64 %pgocount1, 1
  store i64 %72, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_scaled_gray_row, i64 0, i64 0)
  %73 = load i32, i32* %9, align 4
  %74 = add i32 %73, -1
  store i32 %74, i32* %9, align 4
  br label %57

; <label>:75:                                     ; preds = %57
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_scaled_gray_row, i64 0, i64 1)
  %76 = add i64 %pgocount2, 1
  store i64 %76, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_scaled_gray_row, i64 0, i64 1)
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_word_rgb_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct.ppm_source_struct*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %11 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %12 = bitcast %struct.cjpeg_source_struct* %11 to %struct.ppm_source_struct*
  store %struct.ppm_source_struct* %12, %struct.ppm_source_struct** %5, align 8
  %13 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %14 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %13, i32 0, i32 4
  %15 = load i8*, i8** %14, align 8
  store i8* %15, i8** %8, align 8
  %16 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %17 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %16, i32 0, i32 1
  %18 = load i8*, i8** %17, align 8
  %19 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %20 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %19, i32 0, i32 3
  %21 = load i64, i64* %20, align 8
  %22 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %23 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %22, i32 0, i32 0
  %24 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %23, i32 0, i32 3
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %24, align 8
  %26 = call i64 @fread(i8* %18, i64 1, i64 %21, %struct._IO_FILE* %25)
  %27 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %28 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %27, i32 0, i32 3
  %29 = load i64, i64* %28, align 8
  %30 = icmp eq i64 %26, %29
  br i1 %30, label %45, label %31

; <label>:31:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_word_rgb_row, i64 0, i64 2)
  %32 = add i64 %pgocount, 1
  store i64 %32, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_word_rgb_row, i64 0, i64 2)
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %33, i32 0, i32 0
  %35 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %35, i32 0, i32 5
  store i32 42, i32* %36, align 8
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %37, i32 0, i32 0
  %39 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %40 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %39, i32 0, i32 0
  %41 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %40, align 8
  %42 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %43 = bitcast %struct.jpeg_compress_struct* %42 to %struct.jpeg_common_struct*
  %44 = ptrtoint void (%struct.jpeg_common_struct*)* %41 to i64
  call void @__llvm_profile_instrument_target(i64 %44, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_word_rgb_row to i8*), i32 0)
  call void %41(%struct.jpeg_common_struct* %43)
  br label %45

; <label>:45:                                     ; preds = %31, %2
  %46 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %47 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %46, i32 0, i32 0
  %48 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %47, i32 0, i32 4
  %49 = load i8**, i8*** %48, align 8
  %50 = getelementptr inbounds i8*, i8** %49, i64 0
  %51 = load i8*, i8** %50, align 8
  store i8* %51, i8** %6, align 8
  %52 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %53 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %52, i32 0, i32 1
  %54 = load i8*, i8** %53, align 8
  store i8* %54, i8** %7, align 8
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %55, i32 0, i32 6
  %57 = load i32, i32* %56, align 8
  store i32 %57, i32* %9, align 4
  br label %58

; <label>:58:                                     ; preds = %116, %45
  %59 = load i32, i32* %9, align 4
  %60 = icmp ugt i32 %59, 0
  br i1 %60, label %61, label %120

; <label>:61:                                     ; preds = %58
  %62 = load i8*, i8** %7, align 8
  %63 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %63, i8** %7, align 8
  %64 = load i8, i8* %62, align 1
  %65 = zext i8 %64 to i32
  store i32 %65, i32* %10, align 4
  %66 = load i8*, i8** %7, align 8
  %67 = getelementptr inbounds i8, i8* %66, i32 1
  store i8* %67, i8** %7, align 8
  %68 = load i8, i8* %66, align 1
  %69 = zext i8 %68 to i32
  %70 = shl i32 %69, 8
  %71 = load i32, i32* %10, align 4
  %72 = or i32 %71, %70
  store i32 %72, i32* %10, align 4
  %73 = load i8*, i8** %8, align 8
  %74 = load i32, i32* %10, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8* %73, i64 %75
  %77 = load i8, i8* %76, align 1
  %78 = load i8*, i8** %6, align 8
  %79 = getelementptr inbounds i8, i8* %78, i32 1
  store i8* %79, i8** %6, align 8
  store i8 %77, i8* %78, align 1
  %80 = load i8*, i8** %7, align 8
  %81 = getelementptr inbounds i8, i8* %80, i32 1
  store i8* %81, i8** %7, align 8
  %82 = load i8, i8* %80, align 1
  %83 = zext i8 %82 to i32
  store i32 %83, i32* %10, align 4
  %84 = load i8*, i8** %7, align 8
  %85 = getelementptr inbounds i8, i8* %84, i32 1
  store i8* %85, i8** %7, align 8
  %86 = load i8, i8* %84, align 1
  %87 = zext i8 %86 to i32
  %88 = shl i32 %87, 8
  %89 = load i32, i32* %10, align 4
  %90 = or i32 %89, %88
  store i32 %90, i32* %10, align 4
  %91 = load i8*, i8** %8, align 8
  %92 = load i32, i32* %10, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8* %91, i64 %93
  %95 = load i8, i8* %94, align 1
  %96 = load i8*, i8** %6, align 8
  %97 = getelementptr inbounds i8, i8* %96, i32 1
  store i8* %97, i8** %6, align 8
  store i8 %95, i8* %96, align 1
  %98 = load i8*, i8** %7, align 8
  %99 = getelementptr inbounds i8, i8* %98, i32 1
  store i8* %99, i8** %7, align 8
  %100 = load i8, i8* %98, align 1
  %101 = zext i8 %100 to i32
  store i32 %101, i32* %10, align 4
  %102 = load i8*, i8** %7, align 8
  %103 = getelementptr inbounds i8, i8* %102, i32 1
  store i8* %103, i8** %7, align 8
  %104 = load i8, i8* %102, align 1
  %105 = zext i8 %104 to i32
  %106 = shl i32 %105, 8
  %107 = load i32, i32* %10, align 4
  %108 = or i32 %107, %106
  store i32 %108, i32* %10, align 4
  %109 = load i8*, i8** %8, align 8
  %110 = load i32, i32* %10, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i8, i8* %109, i64 %111
  %113 = load i8, i8* %112, align 1
  %114 = load i8*, i8** %6, align 8
  %115 = getelementptr inbounds i8, i8* %114, i32 1
  store i8* %115, i8** %6, align 8
  store i8 %113, i8* %114, align 1
  br label %116

; <label>:116:                                    ; preds = %61
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_word_rgb_row, i64 0, i64 0)
  %117 = add i64 %pgocount1, 1
  store i64 %117, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_word_rgb_row, i64 0, i64 0)
  %118 = load i32, i32* %9, align 4
  %119 = add i32 %118, -1
  store i32 %119, i32* %9, align 4
  br label %58

; <label>:120:                                    ; preds = %58
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_word_rgb_row, i64 0, i64 1)
  %121 = add i64 %pgocount2, 1
  store i64 %121, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_word_rgb_row, i64 0, i64 1)
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_scaled_rgb_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct.ppm_source_struct*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %10 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %11 = bitcast %struct.cjpeg_source_struct* %10 to %struct.ppm_source_struct*
  store %struct.ppm_source_struct* %11, %struct.ppm_source_struct** %5, align 8
  %12 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %13 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %12, i32 0, i32 4
  %14 = load i8*, i8** %13, align 8
  store i8* %14, i8** %8, align 8
  %15 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %16 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %15, i32 0, i32 1
  %17 = load i8*, i8** %16, align 8
  %18 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %19 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %18, i32 0, i32 3
  %20 = load i64, i64* %19, align 8
  %21 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %22 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %21, i32 0, i32 0
  %23 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %22, i32 0, i32 3
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %23, align 8
  %25 = call i64 @fread(i8* %17, i64 1, i64 %20, %struct._IO_FILE* %24)
  %26 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %27 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %26, i32 0, i32 3
  %28 = load i64, i64* %27, align 8
  %29 = icmp eq i64 %25, %28
  br i1 %29, label %44, label %30

; <label>:30:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_scaled_rgb_row, i64 0, i64 2)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_scaled_rgb_row, i64 0, i64 2)
  %32 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %32, i32 0, i32 0
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i32 0, i32 5
  store i32 42, i32* %35, align 8
  %36 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %37 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %36, i32 0, i32 0
  %38 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %37, align 8
  %39 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %38, i32 0, i32 0
  %40 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %39, align 8
  %41 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %42 = bitcast %struct.jpeg_compress_struct* %41 to %struct.jpeg_common_struct*
  %43 = ptrtoint void (%struct.jpeg_common_struct*)* %40 to i64
  call void @__llvm_profile_instrument_target(i64 %43, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_scaled_rgb_row to i8*), i32 0)
  call void %40(%struct.jpeg_common_struct* %42)
  br label %44

; <label>:44:                                     ; preds = %30, %2
  %45 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %46 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %45, i32 0, i32 0
  %47 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %46, i32 0, i32 4
  %48 = load i8**, i8*** %47, align 8
  %49 = getelementptr inbounds i8*, i8** %48, i64 0
  %50 = load i8*, i8** %49, align 8
  store i8* %50, i8** %6, align 8
  %51 = load %struct.ppm_source_struct*, %struct.ppm_source_struct** %5, align 8
  %52 = getelementptr inbounds %struct.ppm_source_struct, %struct.ppm_source_struct* %51, i32 0, i32 1
  %53 = load i8*, i8** %52, align 8
  store i8* %53, i8** %7, align 8
  %54 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %55 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %54, i32 0, i32 6
  %56 = load i32, i32* %55, align 8
  store i32 %56, i32* %9, align 4
  br label %57

; <label>:57:                                     ; preds = %91, %44
  %58 = load i32, i32* %9, align 4
  %59 = icmp ugt i32 %58, 0
  br i1 %59, label %60, label %95

; <label>:60:                                     ; preds = %57
  %61 = load i8*, i8** %8, align 8
  %62 = load i8*, i8** %7, align 8
  %63 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %63, i8** %7, align 8
  %64 = load i8, i8* %62, align 1
  %65 = zext i8 %64 to i32
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8* %61, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = load i8*, i8** %6, align 8
  %70 = getelementptr inbounds i8, i8* %69, i32 1
  store i8* %70, i8** %6, align 8
  store i8 %68, i8* %69, align 1
  %71 = load i8*, i8** %8, align 8
  %72 = load i8*, i8** %7, align 8
  %73 = getelementptr inbounds i8, i8* %72, i32 1
  store i8* %73, i8** %7, align 8
  %74 = load i8, i8* %72, align 1
  %75 = zext i8 %74 to i32
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i8, i8* %71, i64 %76
  %78 = load i8, i8* %77, align 1
  %79 = load i8*, i8** %6, align 8
  %80 = getelementptr inbounds i8, i8* %79, i32 1
  store i8* %80, i8** %6, align 8
  store i8 %78, i8* %79, align 1
  %81 = load i8*, i8** %8, align 8
  %82 = load i8*, i8** %7, align 8
  %83 = getelementptr inbounds i8, i8* %82, i32 1
  store i8* %83, i8** %7, align 8
  %84 = load i8, i8* %82, align 1
  %85 = zext i8 %84 to i32
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i8, i8* %81, i64 %86
  %88 = load i8, i8* %87, align 1
  %89 = load i8*, i8** %6, align 8
  %90 = getelementptr inbounds i8, i8* %89, i32 1
  store i8* %90, i8** %6, align 8
  store i8 %88, i8* %89, align 1
  br label %91

; <label>:91:                                     ; preds = %60
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_scaled_rgb_row, i64 0, i64 0)
  %92 = add i64 %pgocount1, 1
  store i64 %92, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_scaled_rgb_row, i64 0, i64 0)
  %93 = load i32, i32* %9, align 4
  %94 = add i32 %93, -1
  store i32 %94, i32* %9, align 4
  br label %57

; <label>:95:                                     ; preds = %57
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_scaled_rgb_row, i64 0, i64 1)
  %96 = add i64 %pgocount2, 1
  store i64 %96, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_get_scaled_rgb_row, i64 0, i64 1)
  ret i32 1
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

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

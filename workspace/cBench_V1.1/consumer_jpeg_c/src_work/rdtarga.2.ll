; ModuleID = 'tmp1.ll'
source_filename = "rdtarga.c"
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
%struct._tga_source_struct = type { %struct.cjpeg_source_struct, %struct.jpeg_compress_struct*, i8**, %struct.jvirt_sarray_control*, i32, void (%struct._tga_source_struct*)*, [4 x i8], i32, i32, i32, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* }
%struct.cdjpeg_progress_mgr = type { %struct.jpeg_progress_mgr, i32, i32, i32 }

$__llvm_profile_raw_version = comdat any

@c5to8bits = internal constant [32 x i8] c"\00\08\10\19!)1:BJRZcks{\84\8C\94\9C\A5\AD\B5\BD\C5\CE\D6\DE\E6\EF\F7\FF", align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_read_targa = private constant [16 x i8] c"jinit_read_targa"
@__profn_tmp1.ll_start_input_tga = private constant [23 x i8] c"tmp1.ll:start_input_tga"
@__profn_tmp1.ll_finish_input_tga = private constant [24 x i8] c"tmp1.ll:finish_input_tga"
@__profn_tmp1.ll_read_rle_pixel = private constant [22 x i8] c"tmp1.ll:read_rle_pixel"
@__profn_tmp1.ll_read_non_rle_pixel = private constant [26 x i8] c"tmp1.ll:read_non_rle_pixel"
@__profn_tmp1.ll_get_8bit_row = private constant [20 x i8] c"tmp1.ll:get_8bit_row"
@__profn_tmp1.ll_get_16bit_row = private constant [21 x i8] c"tmp1.ll:get_16bit_row"
@__profn_tmp1.ll_get_24bit_row = private constant [21 x i8] c"tmp1.ll:get_24bit_row"
@__profn_tmp1.ll_get_8bit_gray_row = private constant [25 x i8] c"tmp1.ll:get_8bit_gray_row"
@__profn_tmp1.ll_preload_image = private constant [21 x i8] c"tmp1.ll:preload_image"
@__profn_tmp1.ll_read_byte = private constant [17 x i8] c"tmp1.ll:read_byte"
@__profn_tmp1.ll_read_colormap = private constant [21 x i8] c"tmp1.ll:read_colormap"
@__profn_tmp1.ll_get_memory_row = private constant [22 x i8] c"tmp1.ll:get_memory_row"
@__profc_jinit_read_targa = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_read_targa = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_read_targa = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8526528080127782971, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_read_targa, i32 0, i32 0), i8* bitcast (%struct.cjpeg_source_struct* (%struct.jpeg_compress_struct*)* @jinit_read_targa to i8*), i8* bitcast ([1 x i64]* @__profvp_jinit_read_targa to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_input_tga = private global [25 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_input_tga = private global [14 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_input_tga = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9203313533397237258, i64 3940959082723691, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @start_input_tga to i8*), i8* bitcast ([14 x i64]* @__profvp_tmp1.ll_start_input_tga to i8*), i32 25, [1 x i16] [i16 14] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_input_tga = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_finish_input_tga = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3125771032987185281, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_input_tga, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @finish_input_tga to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_rle_pixel = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_read_rle_pixel = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2020730080329221496, i64 76419043505, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_rle_pixel, i32 0, i32 0), i8* bitcast (void (%struct._tga_source_struct*)* @read_rle_pixel to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_non_rle_pixel = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_read_non_rle_pixel = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6717920418856405459, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_read_non_rle_pixel, i32 0, i32 0), i8* bitcast (void (%struct._tga_source_struct*)* @read_non_rle_pixel to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_8bit_row = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_8bit_row = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_8bit_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1940018763341248205, i64 281509114370972, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_8bit_row, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_8bit_row to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_get_8bit_row to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_16bit_row = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_16bit_row = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_16bit_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3583749833090420879, i64 281509114370972, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_16bit_row, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_16bit_row to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_get_16bit_row to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_24bit_row = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_24bit_row = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_24bit_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8515631507367133068, i64 281509114370972, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_24bit_row, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_24bit_row to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_get_24bit_row to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_8bit_gray_row = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_8bit_gray_row = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_8bit_gray_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7309716735919622277, i64 281509114370972, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_8bit_gray_row, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_8bit_gray_row to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_get_8bit_gray_row to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_preload_image = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_preload_image = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_preload_image = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2134364156400756284, i64 844480984507145, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_preload_image, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @preload_image to i8*), i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_preload_image to i8*), i32 4, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_byte = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_read_byte = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_read_byte = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1755714165626662955, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_read_byte, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_read_byte to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_colormap = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_read_colormap = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_read_colormap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4592192535881140357, i64 281521598366889, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_colormap, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_read_colormap to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_memory_row = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_memory_row = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_memory_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5331858471149560195, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_get_memory_row, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_memory_row to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_get_memory_row to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [25 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [128 x i8] c"\A3\02}x\DAm\8EQ\0A\021\0CD\F1B\C2\8A\88x\99\90\D5X+IS\B2\11\DD\DBo\ED\97\91~\E6\0D\F3&\CF\5C\B2\83\11\DE\C0\D1\12\EE\5C\EA\B4g\BE,\EDt\C8\A5\BE\1C\FC\87\DF[ay\0C\82\EE0&\A8\F9C\1Cq\D12\88\129\9C\E7\EF\BC\BE\03\9CN#z8\8Eh\17$\C35$\D5\88\B5\0Dg\C1D\F1\97y\F5?rUV\13\AC\C1+$j]\BA\01\AC\F1k\B9", section "__llvm_prf_names"
@llvm.used = appending global [15 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_read_targa to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_tga to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_input_tga to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_rle_pixel to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_non_rle_pixel to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_8bit_row to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_16bit_row to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_24bit_row to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_8bit_gray_row to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_preload_image to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_byte to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_colormap to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_memory_row to i8*), i8* bitcast ([25 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([128 x i8], [128 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define %struct.cjpeg_source_struct* @jinit_read_targa(%struct.jpeg_compress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_read_targa, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_read_targa, i64 0, i64 0)
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct._tga_source_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 1
  %7 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %7, i32 0, i32 0
  %9 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %8, align 8
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %11 = bitcast %struct.jpeg_compress_struct* %10 to %struct.jpeg_common_struct*
  %12 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %9 to i64
  call void @__llvm_profile_instrument_target(i64 %12, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_read_targa to i8*), i32 0)
  %13 = call i8* %9(%struct.jpeg_common_struct* %11, i32 1, i64 112)
  %14 = bitcast i8* %13 to %struct._tga_source_struct*
  store %struct._tga_source_struct* %14, %struct._tga_source_struct** %4, align 8
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %16 = load %struct._tga_source_struct*, %struct._tga_source_struct** %4, align 8
  %17 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %16, i32 0, i32 1
  store %struct.jpeg_compress_struct* %15, %struct.jpeg_compress_struct** %17, align 8
  %18 = load %struct._tga_source_struct*, %struct._tga_source_struct** %4, align 8
  %19 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %18, i32 0, i32 0
  %20 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %19, i32 0, i32 0
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @start_input_tga, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %20, align 8
  %21 = load %struct._tga_source_struct*, %struct._tga_source_struct** %4, align 8
  %22 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %21, i32 0, i32 0
  %23 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %22, i32 0, i32 2
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @finish_input_tga, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %23, align 8
  %24 = load %struct._tga_source_struct*, %struct._tga_source_struct** %4, align 8
  %25 = bitcast %struct._tga_source_struct* %24 to %struct.cjpeg_source_struct*
  ret %struct.cjpeg_source_struct* %25
}

; Function Attrs: nounwind uwtable
define internal void @start_input_tga(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct._tga_source_struct*, align 8
  %6 = alloca [18 x i8], align 16
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca %struct.cdjpeg_progress_mgr*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %18 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %19 = bitcast %struct.cjpeg_source_struct* %18 to %struct._tga_source_struct*
  store %struct._tga_source_struct* %19, %struct._tga_source_struct** %5, align 8
  %20 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i32 0, i32 0
  %21 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %22 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %21, i32 0, i32 0
  %23 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %22, i32 0, i32 3
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %23, align 8
  %25 = call i64 @fread(i8* %20, i64 1, i64 18, %struct._IO_FILE* %24)
  %26 = icmp eq i64 %25, 18
  br i1 %26, label %41, label %27

; <label>:27:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 2)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 2)
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i32 0, i32 0
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i32 0, i32 5
  store i32 42, i32* %32, align 8
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %33, i32 0, i32 0
  %35 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %35, i32 0, i32 0
  %37 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %36, align 8
  %38 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %39 = bitcast %struct.jpeg_compress_struct* %38 to %struct.jpeg_common_struct*
  %40 = ptrtoint void (%struct.jpeg_common_struct*)* %37 to i64
  call void @__llvm_profile_instrument_target(i64 %40, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_tga to i8*), i32 0)
  call void %37(%struct.jpeg_common_struct* %39)
  br label %41

; <label>:41:                                     ; preds = %27, %2
  %42 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i64 0, i64 16
  %43 = load i8, i8* %42, align 16
  %44 = zext i8 %43 to i32
  %45 = icmp eq i32 %44, 15
  br i1 %45, label %46, label %49

; <label>:46:                                     ; preds = %41
  %pgocount1 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 3)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 3)
  %48 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i64 0, i64 16
  store i8 16, i8* %48, align 16
  br label %49

; <label>:49:                                     ; preds = %46, %41
  %50 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i64 0, i64 0
  %51 = load i8, i8* %50, align 16
  %52 = zext i8 %51 to i32
  store i32 %52, i32* %7, align 4
  %53 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i64 0, i64 1
  %54 = load i8, i8* %53, align 1
  %55 = zext i8 %54 to i32
  store i32 %55, i32* %8, align 4
  %56 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i64 0, i64 2
  %57 = load i8, i8* %56, align 2
  %58 = zext i8 %57 to i32
  store i32 %58, i32* %9, align 4
  %59 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i64 0, i64 5
  %60 = load i8, i8* %59, align 1
  %61 = zext i8 %60 to i32
  %62 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i64 0, i64 6
  %63 = load i8, i8* %62, align 2
  %64 = zext i8 %63 to i32
  %65 = shl i32 %64, 8
  %66 = add i32 %61, %65
  store i32 %66, i32* %15, align 4
  %67 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i64 0, i64 12
  %68 = load i8, i8* %67, align 4
  %69 = zext i8 %68 to i32
  %70 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i64 0, i64 13
  %71 = load i8, i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = shl i32 %72, 8
  %74 = add i32 %69, %73
  store i32 %74, i32* %13, align 4
  %75 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i64 0, i64 14
  %76 = load i8, i8* %75, align 2
  %77 = zext i8 %76 to i32
  %78 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i64 0, i64 15
  %79 = load i8, i8* %78, align 1
  %80 = zext i8 %79 to i32
  %81 = shl i32 %80, 8
  %82 = add i32 %77, %81
  store i32 %82, i32* %14, align 4
  %83 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i64 0, i64 16
  %84 = load i8, i8* %83, align 16
  %85 = zext i8 %84 to i32
  %86 = ashr i32 %85, 3
  %87 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %88 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %87, i32 0, i32 7
  store i32 %86, i32* %88, align 4
  %89 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i64 0, i64 17
  %90 = load i8, i8* %89, align 1
  %91 = zext i8 %90 to i32
  store i32 %91, i32* %10, align 4
  %92 = load i32, i32* %10, align 4
  %93 = and i32 %92, 32
  %94 = icmp eq i32 %93, 0
  %95 = zext i1 %94 to i32
  store i32 %95, i32* %16, align 4
  %96 = load i32, i32* %10, align 4
  %97 = ashr i32 %96, 6
  store i32 %97, i32* %11, align 4
  %98 = load i32, i32* %8, align 4
  %99 = icmp sgt i32 %98, 1
  br i1 %99, label %123, label %100

; <label>:100:                                    ; preds = %49
  %pgocount2 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 4)
  %101 = add i64 %pgocount2, 1
  store i64 %101, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 4)
  %102 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %103 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %102, i32 0, i32 7
  %104 = load i32, i32* %103, align 4
  %105 = icmp slt i32 %104, 1
  br i1 %105, label %123, label %106

; <label>:106:                                    ; preds = %100
  %pgocount3 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 10)
  %107 = add i64 %pgocount3, 1
  store i64 %107, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 10)
  %108 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %109 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %108, i32 0, i32 7
  %110 = load i32, i32* %109, align 4
  %111 = icmp sgt i32 %110, 4
  br i1 %111, label %123, label %112

; <label>:112:                                    ; preds = %106
  %pgocount4 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 15)
  %113 = add i64 %pgocount4, 1
  store i64 %113, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 15)
  %114 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i64 0, i64 16
  %115 = load i8, i8* %114, align 16
  %116 = zext i8 %115 to i32
  %117 = and i32 %116, 7
  %118 = icmp ne i32 %117, 0
  br i1 %118, label %123, label %119

; <label>:119:                                    ; preds = %112
  %pgocount5 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 24)
  %120 = add i64 %pgocount5, 1
  store i64 %120, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 24)
  %121 = load i32, i32* %11, align 4
  %122 = icmp ne i32 %121, 0
  br i1 %122, label %123, label %137

; <label>:123:                                    ; preds = %119, %112, %106, %100, %49
  %pgocount6 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 1)
  %124 = add i64 %pgocount6, 1
  store i64 %124, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 1)
  %125 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %126 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %125, i32 0, i32 0
  %127 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %126, align 8
  %128 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %127, i32 0, i32 5
  store i32 1033, i32* %128, align 8
  %129 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %130 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %129, i32 0, i32 0
  %131 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %130, align 8
  %132 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %131, i32 0, i32 0
  %133 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %132, align 8
  %134 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %135 = bitcast %struct.jpeg_compress_struct* %134 to %struct.jpeg_common_struct*
  %136 = ptrtoint void (%struct.jpeg_common_struct*)* %133 to i64
  call void @__llvm_profile_instrument_target(i64 %136, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_tga to i8*), i32 1)
  call void %133(%struct.jpeg_common_struct* %135)
  br label %137

; <label>:137:                                    ; preds = %123, %119
  %138 = load i32, i32* %9, align 4
  %139 = icmp sgt i32 %138, 8
  br i1 %139, label %140, label %149

; <label>:140:                                    ; preds = %137
  %141 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %142 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %141, i32 0, i32 5
  store void (%struct._tga_source_struct*)* @read_rle_pixel, void (%struct._tga_source_struct*)** %142, align 8
  %143 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %144 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %143, i32 0, i32 9
  store i32 0, i32* %144, align 4
  %145 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %146 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %145, i32 0, i32 8
  store i32 0, i32* %146, align 8
  %147 = load i32, i32* %9, align 4
  %148 = sub nsw i32 %147, 8
  store i32 %148, i32* %9, align 4
  br label %153

; <label>:149:                                    ; preds = %137
  %pgocount7 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 5)
  %150 = add i64 %pgocount7, 1
  store i64 %150, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 5)
  %151 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %152 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %151, i32 0, i32 5
  store void (%struct._tga_source_struct*)* @read_non_rle_pixel, void (%struct._tga_source_struct*)** %152, align 8
  br label %153

; <label>:153:                                    ; preds = %149, %140
  store i32 3, i32* %12, align 4
  %154 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %155 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %154, i32 0, i32 9
  store i32 2, i32* %155, align 4
  %156 = load i32, i32* %9, align 4
  switch i32 %156, label %320 [
    i32 1, label %157
    i32 2, label %211
    i32 3, label %268
  ]

; <label>:157:                                    ; preds = %153
  %158 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %159 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %158, i32 0, i32 7
  %160 = load i32, i32* %159, align 4
  %161 = icmp eq i32 %160, 1
  br i1 %161, label %162, label %170

; <label>:162:                                    ; preds = %157
  %pgocount8 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 16)
  %163 = add i64 %pgocount8, 1
  store i64 %163, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 16)
  %164 = load i32, i32* %8, align 4
  %165 = icmp eq i32 %164, 1
  br i1 %165, label %166, label %170

; <label>:166:                                    ; preds = %162
  %pgocount9 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 19)
  %167 = add i64 %pgocount9, 1
  store i64 %167, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 19)
  %168 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %169 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %168, i32 0, i32 10
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_8bit_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %169, align 8
  br label %184

; <label>:170:                                    ; preds = %162, %157
  %pgocount10 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 14)
  %171 = add i64 %pgocount10, 1
  store i64 %171, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 14)
  %172 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %173 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %172, i32 0, i32 0
  %174 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %173, align 8
  %175 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %174, i32 0, i32 5
  store i32 1033, i32* %175, align 8
  %176 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %177 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %176, i32 0, i32 0
  %178 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %177, align 8
  %179 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %178, i32 0, i32 0
  %180 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %179, align 8
  %181 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %182 = bitcast %struct.jpeg_compress_struct* %181 to %struct.jpeg_common_struct*
  %183 = ptrtoint void (%struct.jpeg_common_struct*)* %180 to i64
  call void @__llvm_profile_instrument_target(i64 %183, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_tga to i8*), i32 2)
  call void %180(%struct.jpeg_common_struct* %182)
  br label %184

; <label>:184:                                    ; preds = %170, %166
  %185 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %186 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %185, i32 0, i32 0
  %187 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %186, align 8
  %188 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %187, i32 0, i32 5
  store i32 1037, i32* %188, align 8
  %189 = load i32, i32* %13, align 4
  %190 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %191 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %190, i32 0, i32 0
  %192 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %191, align 8
  %193 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %192, i32 0, i32 6
  %194 = bitcast %union.anon* %193 to [8 x i32]*
  %195 = getelementptr inbounds [8 x i32], [8 x i32]* %194, i64 0, i64 0
  store i32 %189, i32* %195, align 4
  %196 = load i32, i32* %14, align 4
  %197 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %198 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %197, i32 0, i32 0
  %199 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %198, align 8
  %200 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %199, i32 0, i32 6
  %201 = bitcast %union.anon* %200 to [8 x i32]*
  %202 = getelementptr inbounds [8 x i32], [8 x i32]* %201, i64 0, i64 1
  store i32 %196, i32* %202, align 4
  %203 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %204 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %203, i32 0, i32 0
  %205 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %204, align 8
  %206 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %205, i32 0, i32 1
  %207 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %206, align 8
  %208 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %209 = bitcast %struct.jpeg_compress_struct* %208 to %struct.jpeg_common_struct*
  %210 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %207 to i64
  call void @__llvm_profile_instrument_target(i64 %210, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_tga to i8*), i32 3)
  call void %207(%struct.jpeg_common_struct* %209, i32 1)
  br label %334

; <label>:211:                                    ; preds = %153
  %212 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %213 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %212, i32 0, i32 7
  %214 = load i32, i32* %213, align 4
  switch i32 %214, label %227 [
    i32 2, label %215
    i32 3, label %219
    i32 4, label %223
  ]

; <label>:215:                                    ; preds = %211
  %pgocount11 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 20)
  %216 = add i64 %pgocount11, 1
  store i64 %216, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 20)
  %217 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %218 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %217, i32 0, i32 10
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_16bit_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %218, align 8
  br label %241

; <label>:219:                                    ; preds = %211
  %pgocount12 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 21)
  %220 = add i64 %pgocount12, 1
  store i64 %220, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 21)
  %221 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %222 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %221, i32 0, i32 10
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_24bit_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %222, align 8
  br label %241

; <label>:223:                                    ; preds = %211
  %pgocount13 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 22)
  %224 = add i64 %pgocount13, 1
  store i64 %224, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 22)
  %225 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %226 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %225, i32 0, i32 10
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_24bit_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %226, align 8
  br label %241

; <label>:227:                                    ; preds = %211
  %pgocount14 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 23)
  %228 = add i64 %pgocount14, 1
  store i64 %228, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 23)
  %229 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %230 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %229, i32 0, i32 0
  %231 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %230, align 8
  %232 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %231, i32 0, i32 5
  store i32 1033, i32* %232, align 8
  %233 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %234 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %233, i32 0, i32 0
  %235 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %234, align 8
  %236 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %235, i32 0, i32 0
  %237 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %236, align 8
  %238 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %239 = bitcast %struct.jpeg_compress_struct* %238 to %struct.jpeg_common_struct*
  %240 = ptrtoint void (%struct.jpeg_common_struct*)* %237 to i64
  call void @__llvm_profile_instrument_target(i64 %240, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_tga to i8*), i32 4)
  call void %237(%struct.jpeg_common_struct* %239)
  br label %241

; <label>:241:                                    ; preds = %227, %223, %219, %215
  %242 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %243 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %242, i32 0, i32 0
  %244 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %243, align 8
  %245 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %244, i32 0, i32 5
  store i32 1035, i32* %245, align 8
  %246 = load i32, i32* %13, align 4
  %247 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %248 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %247, i32 0, i32 0
  %249 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %248, align 8
  %250 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %249, i32 0, i32 6
  %251 = bitcast %union.anon* %250 to [8 x i32]*
  %252 = getelementptr inbounds [8 x i32], [8 x i32]* %251, i64 0, i64 0
  store i32 %246, i32* %252, align 4
  %253 = load i32, i32* %14, align 4
  %254 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %255 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %254, i32 0, i32 0
  %256 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %255, align 8
  %257 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %256, i32 0, i32 6
  %258 = bitcast %union.anon* %257 to [8 x i32]*
  %259 = getelementptr inbounds [8 x i32], [8 x i32]* %258, i64 0, i64 1
  store i32 %253, i32* %259, align 4
  %260 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %261 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %260, i32 0, i32 0
  %262 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %261, align 8
  %263 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %262, i32 0, i32 1
  %264 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %263, align 8
  %265 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %266 = bitcast %struct.jpeg_compress_struct* %265 to %struct.jpeg_common_struct*
  %267 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %264 to i64
  call void @__llvm_profile_instrument_target(i64 %267, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_tga to i8*), i32 5)
  call void %264(%struct.jpeg_common_struct* %266, i32 1)
  br label %334

; <label>:268:                                    ; preds = %153
  store i32 1, i32* %12, align 4
  %269 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %270 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %269, i32 0, i32 9
  store i32 1, i32* %270, align 4
  %271 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %272 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %271, i32 0, i32 7
  %273 = load i32, i32* %272, align 4
  %274 = icmp eq i32 %273, 1
  br i1 %274, label %275, label %279

; <label>:275:                                    ; preds = %268
  %pgocount15 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 17)
  %276 = add i64 %pgocount15, 1
  store i64 %276, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 17)
  %277 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %278 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %277, i32 0, i32 10
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_8bit_gray_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %278, align 8
  br label %293

; <label>:279:                                    ; preds = %268
  %pgocount16 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 18)
  %280 = add i64 %pgocount16, 1
  store i64 %280, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 18)
  %281 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %282 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %281, i32 0, i32 0
  %283 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %282, align 8
  %284 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %283, i32 0, i32 5
  store i32 1033, i32* %284, align 8
  %285 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %286 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %285, i32 0, i32 0
  %287 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %286, align 8
  %288 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %287, i32 0, i32 0
  %289 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %288, align 8
  %290 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %291 = bitcast %struct.jpeg_compress_struct* %290 to %struct.jpeg_common_struct*
  %292 = ptrtoint void (%struct.jpeg_common_struct*)* %289 to i64
  call void @__llvm_profile_instrument_target(i64 %292, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_tga to i8*), i32 6)
  call void %289(%struct.jpeg_common_struct* %291)
  br label %293

; <label>:293:                                    ; preds = %279, %275
  %294 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %295 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %294, i32 0, i32 0
  %296 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %295, align 8
  %297 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %296, i32 0, i32 5
  store i32 1036, i32* %297, align 8
  %298 = load i32, i32* %13, align 4
  %299 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %300 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %299, i32 0, i32 0
  %301 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %300, align 8
  %302 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %301, i32 0, i32 6
  %303 = bitcast %union.anon* %302 to [8 x i32]*
  %304 = getelementptr inbounds [8 x i32], [8 x i32]* %303, i64 0, i64 0
  store i32 %298, i32* %304, align 4
  %305 = load i32, i32* %14, align 4
  %306 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %307 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %306, i32 0, i32 0
  %308 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %307, align 8
  %309 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %308, i32 0, i32 6
  %310 = bitcast %union.anon* %309 to [8 x i32]*
  %311 = getelementptr inbounds [8 x i32], [8 x i32]* %310, i64 0, i64 1
  store i32 %305, i32* %311, align 4
  %312 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %313 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %312, i32 0, i32 0
  %314 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %313, align 8
  %315 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %314, i32 0, i32 1
  %316 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %315, align 8
  %317 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %318 = bitcast %struct.jpeg_compress_struct* %317 to %struct.jpeg_common_struct*
  %319 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %316 to i64
  call void @__llvm_profile_instrument_target(i64 %319, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_tga to i8*), i32 7)
  call void %316(%struct.jpeg_common_struct* %318, i32 1)
  br label %334

; <label>:320:                                    ; preds = %153
  %pgocount17 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 12)
  %321 = add i64 %pgocount17, 1
  store i64 %321, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 12)
  %322 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %323 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %322, i32 0, i32 0
  %324 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %323, align 8
  %325 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %324, i32 0, i32 5
  store i32 1033, i32* %325, align 8
  %326 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %327 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %326, i32 0, i32 0
  %328 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %327, align 8
  %329 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %328, i32 0, i32 0
  %330 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %329, align 8
  %331 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %332 = bitcast %struct.jpeg_compress_struct* %331 to %struct.jpeg_common_struct*
  %333 = ptrtoint void (%struct.jpeg_common_struct*)* %330 to i64
  call void @__llvm_profile_instrument_target(i64 %333, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_tga to i8*), i32 8)
  call void %330(%struct.jpeg_common_struct* %332)
  br label %334

; <label>:334:                                    ; preds = %320, %293, %241, %184
  %335 = load i32, i32* %16, align 4
  %336 = icmp ne i32 %335, 0
  br i1 %336, label %337, label %374

; <label>:337:                                    ; preds = %334
  %338 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %339 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %338, i32 0, i32 1
  %340 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %339, align 8
  %341 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %340, i32 0, i32 4
  %342 = load %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %341, align 8
  %343 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %344 = bitcast %struct.jpeg_compress_struct* %343 to %struct.jpeg_common_struct*
  %345 = load i32, i32* %13, align 4
  %346 = load i32, i32* %12, align 4
  %347 = mul i32 %345, %346
  %348 = load i32, i32* %14, align 4
  %349 = ptrtoint %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)* %342 to i64
  call void @__llvm_profile_instrument_target(i64 %349, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_tga to i8*), i32 9)
  %350 = call %struct.jvirt_sarray_control* %342(%struct.jpeg_common_struct* %344, i32 1, i32 0, i32 %347, i32 %348, i32 1)
  %351 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %352 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %351, i32 0, i32 3
  store %struct.jvirt_sarray_control* %350, %struct.jvirt_sarray_control** %352, align 8
  %353 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %354 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %353, i32 0, i32 2
  %355 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %354, align 8
  %356 = icmp ne %struct.jpeg_progress_mgr* %355, null
  br i1 %356, label %357, label %367

; <label>:357:                                    ; preds = %337
  %pgocount18 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 8)
  %358 = add i64 %pgocount18, 1
  store i64 %358, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 8)
  %359 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %360 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %359, i32 0, i32 2
  %361 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %360, align 8
  %362 = bitcast %struct.jpeg_progress_mgr* %361 to %struct.cdjpeg_progress_mgr*
  store %struct.cdjpeg_progress_mgr* %362, %struct.cdjpeg_progress_mgr** %17, align 8
  %363 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %17, align 8
  %364 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %363, i32 0, i32 2
  %365 = load i32, i32* %364, align 4
  %366 = add nsw i32 %365, 1
  store i32 %366, i32* %364, align 4
  br label %367

; <label>:367:                                    ; preds = %357, %337
  %368 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %369 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %368, i32 0, i32 0
  %370 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %369, i32 0, i32 5
  store i32 1, i32* %370, align 8
  %371 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %372 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %371, i32 0, i32 0
  %373 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %372, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @preload_image, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %373, align 8
  br label %402

; <label>:374:                                    ; preds = %334
  %pgocount19 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 9)
  %375 = add i64 %pgocount19, 1
  store i64 %375, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 9)
  %376 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %377 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %376, i32 0, i32 3
  store %struct.jvirt_sarray_control* null, %struct.jvirt_sarray_control** %377, align 8
  %378 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %379 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %378, i32 0, i32 1
  %380 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %379, align 8
  %381 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %380, i32 0, i32 2
  %382 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %381, align 8
  %383 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %384 = bitcast %struct.jpeg_compress_struct* %383 to %struct.jpeg_common_struct*
  %385 = load i32, i32* %13, align 4
  %386 = load i32, i32* %12, align 4
  %387 = mul i32 %385, %386
  %388 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %382 to i64
  call void @__llvm_profile_instrument_target(i64 %388, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_tga to i8*), i32 10)
  %389 = call i8** %382(%struct.jpeg_common_struct* %384, i32 1, i32 %387, i32 1)
  %390 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %391 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %390, i32 0, i32 0
  %392 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %391, i32 0, i32 4
  store i8** %389, i8*** %392, align 8
  %393 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %394 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %393, i32 0, i32 0
  %395 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %394, i32 0, i32 5
  store i32 1, i32* %395, align 8
  %396 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %397 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %396, i32 0, i32 10
  %398 = load i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %397, align 8
  %399 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %400 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %399, i32 0, i32 0
  %401 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %400, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* %398, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %401, align 8
  br label %402

; <label>:402:                                    ; preds = %374, %367
  br label %403

; <label>:403:                                    ; preds = %407, %402
  %404 = load i32, i32* %7, align 4
  %405 = add nsw i32 %404, -1
  store i32 %405, i32* %7, align 4
  %406 = icmp ne i32 %404, 0
  br i1 %406, label %407, label %411

; <label>:407:                                    ; preds = %403
  %pgocount20 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 0)
  %408 = add i64 %pgocount20, 1
  store i64 %408, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 0)
  %409 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %410 = call i32 @read_byte(%struct._tga_source_struct* %409)
  br label %403

; <label>:411:                                    ; preds = %403
  %412 = load i32, i32* %15, align 4
  %413 = icmp ugt i32 %412, 0
  br i1 %413, label %414, label %460

; <label>:414:                                    ; preds = %411
  %415 = load i32, i32* %15, align 4
  %416 = icmp ugt i32 %415, 256
  br i1 %416, label %428, label %417

; <label>:417:                                    ; preds = %414
  %pgocount21 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 13)
  %418 = add i64 %pgocount21, 1
  store i64 %418, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 13)
  %419 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i64 0, i64 3
  %420 = load i8, i8* %419, align 1
  %421 = zext i8 %420 to i32
  %422 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i64 0, i64 4
  %423 = load i8, i8* %422, align 4
  %424 = zext i8 %423 to i32
  %425 = shl i32 %424, 8
  %426 = add i32 %421, %425
  %427 = icmp ne i32 %426, 0
  br i1 %427, label %428, label %442

; <label>:428:                                    ; preds = %417, %414
  %pgocount22 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 7)
  %429 = add i64 %pgocount22, 1
  store i64 %429, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 7)
  %430 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %431 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %430, i32 0, i32 0
  %432 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %431, align 8
  %433 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %432, i32 0, i32 5
  store i32 1032, i32* %433, align 8
  %434 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %435 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %434, i32 0, i32 0
  %436 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %435, align 8
  %437 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %436, i32 0, i32 0
  %438 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %437, align 8
  %439 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %440 = bitcast %struct.jpeg_compress_struct* %439 to %struct.jpeg_common_struct*
  %441 = ptrtoint void (%struct.jpeg_common_struct*)* %438 to i64
  call void @__llvm_profile_instrument_target(i64 %441, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_tga to i8*), i32 11)
  call void %438(%struct.jpeg_common_struct* %440)
  br label %442

; <label>:442:                                    ; preds = %428, %417
  %443 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %444 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %443, i32 0, i32 1
  %445 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %444, align 8
  %446 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %445, i32 0, i32 2
  %447 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %446, align 8
  %448 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %449 = bitcast %struct.jpeg_compress_struct* %448 to %struct.jpeg_common_struct*
  %450 = load i32, i32* %15, align 4
  %451 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %447 to i64
  call void @__llvm_profile_instrument_target(i64 %451, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_tga to i8*), i32 12)
  %452 = call i8** %447(%struct.jpeg_common_struct* %449, i32 1, i32 %450, i32 3)
  %453 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %454 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %453, i32 0, i32 2
  store i8** %452, i8*** %454, align 8
  %455 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %456 = load i32, i32* %15, align 4
  %457 = getelementptr inbounds [18 x i8], [18 x i8]* %6, i64 0, i64 7
  %458 = load i8, i8* %457, align 1
  %459 = zext i8 %458 to i32
  call void @read_colormap(%struct._tga_source_struct* %455, i32 %456, i32 %459)
  br label %481

; <label>:460:                                    ; preds = %411
  %461 = load i32, i32* %8, align 4
  %462 = icmp ne i32 %461, 0
  br i1 %462, label %463, label %477

; <label>:463:                                    ; preds = %460
  %pgocount23 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 11)
  %464 = add i64 %pgocount23, 1
  store i64 %464, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 11)
  %465 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %466 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %465, i32 0, i32 0
  %467 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %466, align 8
  %468 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %467, i32 0, i32 5
  store i32 1033, i32* %468, align 8
  %469 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %470 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %469, i32 0, i32 0
  %471 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %470, align 8
  %472 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %471, i32 0, i32 0
  %473 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %472, align 8
  %474 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %475 = bitcast %struct.jpeg_compress_struct* %474 to %struct.jpeg_common_struct*
  %476 = ptrtoint void (%struct.jpeg_common_struct*)* %473 to i64
  call void @__llvm_profile_instrument_target(i64 %476, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_tga to i8*), i32 13)
  call void %473(%struct.jpeg_common_struct* %475)
  br label %477

; <label>:477:                                    ; preds = %463, %460
  %pgocount24 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 6)
  %478 = add i64 %pgocount24, 1
  store i64 %478, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_start_input_tga, i64 0, i64 6)
  %479 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %480 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %479, i32 0, i32 2
  store i8** null, i8*** %480, align 8
  br label %481

; <label>:481:                                    ; preds = %477, %442
  %482 = load i32, i32* %12, align 4
  %483 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %484 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %483, i32 0, i32 8
  store i32 %482, i32* %484, align 8
  %485 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %486 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %485, i32 0, i32 11
  store i32 8, i32* %486, align 8
  %487 = load i32, i32* %13, align 4
  %488 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %489 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %488, i32 0, i32 6
  store i32 %487, i32* %489, align 8
  %490 = load i32, i32* %14, align 4
  %491 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %492 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %491, i32 0, i32 7
  store i32 %490, i32* %492, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @finish_input_tga(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_input_tga, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_input_tga, i64 0, i64 0)
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca %struct.cjpeg_source_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %5, align 8
  ret void
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define internal void @read_rle_pixel(%struct._tga_source_struct*) #0 {
  %2 = alloca %struct._tga_source_struct*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i32, align 4
  store %struct._tga_source_struct* %0, %struct._tga_source_struct** %2, align 8
  %5 = load %struct._tga_source_struct*, %struct._tga_source_struct** %2, align 8
  %6 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %5, i32 0, i32 0
  %7 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %6, i32 0, i32 3
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  store %struct._IO_FILE* %8, %struct._IO_FILE** %3, align 8
  %9 = load %struct._tga_source_struct*, %struct._tga_source_struct** %2, align 8
  %10 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %9, i32 0, i32 9
  %11 = load i32, i32* %10, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %19

; <label>:13:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_rle_pixel, i64 0, i64 1)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_rle_pixel, i64 0, i64 1)
  %15 = load %struct._tga_source_struct*, %struct._tga_source_struct** %2, align 8
  %16 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %15, i32 0, i32 9
  %17 = load i32, i32* %16, align 4
  %18 = add nsw i32 %17, -1
  store i32 %18, i32* %16, align 4
  br label %67

; <label>:19:                                     ; preds = %1
  %20 = load %struct._tga_source_struct*, %struct._tga_source_struct** %2, align 8
  %21 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %20, i32 0, i32 8
  %22 = load i32, i32* %21, align 8
  %23 = add nsw i32 %22, -1
  store i32 %23, i32* %21, align 8
  %24 = icmp slt i32 %23, 0
  br i1 %24, label %25, label %46

; <label>:25:                                     ; preds = %19
  %26 = load %struct._tga_source_struct*, %struct._tga_source_struct** %2, align 8
  %27 = call i32 @read_byte(%struct._tga_source_struct* %26)
  store i32 %27, i32* %4, align 4
  %28 = load i32, i32* %4, align 4
  %29 = and i32 %28, 128
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %31, label %39

; <label>:31:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_rle_pixel, i64 0, i64 3)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_rle_pixel, i64 0, i64 3)
  %33 = load i32, i32* %4, align 4
  %34 = and i32 %33, 127
  %35 = load %struct._tga_source_struct*, %struct._tga_source_struct** %2, align 8
  %36 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %35, i32 0, i32 9
  store i32 %34, i32* %36, align 4
  %37 = load %struct._tga_source_struct*, %struct._tga_source_struct** %2, align 8
  %38 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %37, i32 0, i32 8
  store i32 0, i32* %38, align 8
  br label %45

; <label>:39:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_rle_pixel, i64 0, i64 4)
  %40 = add i64 %pgocount2, 1
  store i64 %40, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_rle_pixel, i64 0, i64 4)
  %41 = load i32, i32* %4, align 4
  %42 = and i32 %41, 127
  %43 = load %struct._tga_source_struct*, %struct._tga_source_struct** %2, align 8
  %44 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %43, i32 0, i32 8
  store i32 %42, i32* %44, align 8
  br label %45

; <label>:45:                                     ; preds = %39, %31
  br label %46

; <label>:46:                                     ; preds = %45, %19
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_rle_pixel, i64 0, i64 2)
  %47 = add i64 %pgocount3, 1
  store i64 %47, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_rle_pixel, i64 0, i64 2)
  store i32 0, i32* %4, align 4
  br label %48

; <label>:48:                                     ; preds = %63, %46
  %49 = load i32, i32* %4, align 4
  %50 = load %struct._tga_source_struct*, %struct._tga_source_struct** %2, align 8
  %51 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %50, i32 0, i32 7
  %52 = load i32, i32* %51, align 4
  %53 = icmp slt i32 %49, %52
  br i1 %53, label %54, label %67

; <label>:54:                                     ; preds = %48
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %56 = call i32 @_IO_getc(%struct._IO_FILE* %55)
  %57 = trunc i32 %56 to i8
  %58 = load %struct._tga_source_struct*, %struct._tga_source_struct** %2, align 8
  %59 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %58, i32 0, i32 6
  %60 = load i32, i32* %4, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [4 x i8], [4 x i8]* %59, i64 0, i64 %61
  store i8 %57, i8* %62, align 1
  br label %63

; <label>:63:                                     ; preds = %54
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_rle_pixel, i64 0, i64 0)
  %64 = add i64 %pgocount4, 1
  store i64 %64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_rle_pixel, i64 0, i64 0)
  %65 = load i32, i32* %4, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* %4, align 4
  br label %48

; <label>:67:                                     ; preds = %48, %13
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @read_non_rle_pixel(%struct._tga_source_struct*) #0 {
  %2 = alloca %struct._tga_source_struct*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i32, align 4
  store %struct._tga_source_struct* %0, %struct._tga_source_struct** %2, align 8
  %5 = load %struct._tga_source_struct*, %struct._tga_source_struct** %2, align 8
  %6 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %5, i32 0, i32 0
  %7 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %6, i32 0, i32 3
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  store %struct._IO_FILE* %8, %struct._IO_FILE** %3, align 8
  store i32 0, i32* %4, align 4
  br label %9

; <label>:9:                                      ; preds = %24, %1
  %10 = load i32, i32* %4, align 4
  %11 = load %struct._tga_source_struct*, %struct._tga_source_struct** %2, align 8
  %12 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %11, i32 0, i32 7
  %13 = load i32, i32* %12, align 4
  %14 = icmp slt i32 %10, %13
  br i1 %14, label %15, label %28

; <label>:15:                                     ; preds = %9
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %17 = call i32 @_IO_getc(%struct._IO_FILE* %16)
  %18 = trunc i32 %17 to i8
  %19 = load %struct._tga_source_struct*, %struct._tga_source_struct** %2, align 8
  %20 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %19, i32 0, i32 6
  %21 = load i32, i32* %4, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [4 x i8], [4 x i8]* %20, i64 0, i64 %22
  store i8 %18, i8* %23, align 1
  br label %24

; <label>:24:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_read_non_rle_pixel, i64 0, i64 0)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_read_non_rle_pixel, i64 0, i64 0)
  %26 = load i32, i32* %4, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %4, align 4
  br label %9

; <label>:28:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_read_non_rle_pixel, i64 0, i64 1)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_read_non_rle_pixel, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @get_8bit_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct._tga_source_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8**, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %10 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %11 = bitcast %struct.cjpeg_source_struct* %10 to %struct._tga_source_struct*
  store %struct._tga_source_struct* %11, %struct._tga_source_struct** %5, align 8
  %12 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %13 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %12, i32 0, i32 2
  %14 = load i8**, i8*** %13, align 8
  store i8** %14, i8*** %9, align 8
  %15 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %16 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %15, i32 0, i32 0
  %17 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %16, i32 0, i32 4
  %18 = load i8**, i8*** %17, align 8
  %19 = getelementptr inbounds i8*, i8** %18, i64 0
  %20 = load i8*, i8** %19, align 8
  store i8* %20, i8** %7, align 8
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 6
  %23 = load i32, i32* %22, align 8
  store i32 %23, i32* %8, align 4
  br label %24

; <label>:24:                                     ; preds = %65, %2
  %25 = load i32, i32* %8, align 4
  %26 = icmp ugt i32 %25, 0
  br i1 %26, label %27, label %69

; <label>:27:                                     ; preds = %24
  %28 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %29 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %28, i32 0, i32 5
  %30 = load void (%struct._tga_source_struct*)*, void (%struct._tga_source_struct*)** %29, align 8
  %31 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %32 = ptrtoint void (%struct._tga_source_struct*)* %30 to i64
  call void @__llvm_profile_instrument_target(i64 %32, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_8bit_row to i8*), i32 0)
  call void %30(%struct._tga_source_struct* %31)
  %33 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %34 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %33, i32 0, i32 6
  %35 = getelementptr inbounds [4 x i8], [4 x i8]* %34, i64 0, i64 0
  %36 = load i8, i8* %35, align 8
  %37 = zext i8 %36 to i32
  store i32 %37, i32* %6, align 4
  %38 = load i8**, i8*** %9, align 8
  %39 = getelementptr inbounds i8*, i8** %38, i64 0
  %40 = load i8*, i8** %39, align 8
  %41 = load i32, i32* %6, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8* %40, i64 %42
  %44 = load i8, i8* %43, align 1
  %45 = load i8*, i8** %7, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %7, align 8
  store i8 %44, i8* %45, align 1
  %47 = load i8**, i8*** %9, align 8
  %48 = getelementptr inbounds i8*, i8** %47, i64 1
  %49 = load i8*, i8** %48, align 8
  %50 = load i32, i32* %6, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8* %49, i64 %51
  %53 = load i8, i8* %52, align 1
  %54 = load i8*, i8** %7, align 8
  %55 = getelementptr inbounds i8, i8* %54, i32 1
  store i8* %55, i8** %7, align 8
  store i8 %53, i8* %54, align 1
  %56 = load i8**, i8*** %9, align 8
  %57 = getelementptr inbounds i8*, i8** %56, i64 2
  %58 = load i8*, i8** %57, align 8
  %59 = load i32, i32* %6, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8* %58, i64 %60
  %62 = load i8, i8* %61, align 1
  %63 = load i8*, i8** %7, align 8
  %64 = getelementptr inbounds i8, i8* %63, i32 1
  store i8* %64, i8** %7, align 8
  store i8 %62, i8* %63, align 1
  br label %65

; <label>:65:                                     ; preds = %27
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_8bit_row, i64 0, i64 0)
  %66 = add i64 %pgocount, 1
  store i64 %66, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_8bit_row, i64 0, i64 0)
  %67 = load i32, i32* %8, align 4
  %68 = add i32 %67, -1
  store i32 %68, i32* %8, align 4
  br label %24

; <label>:69:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_8bit_row, i64 0, i64 1)
  %70 = add i64 %pgocount1, 1
  store i64 %70, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_8bit_row, i64 0, i64 1)
  ret i32 1
}

; Function Attrs: nounwind uwtable
define internal i32 @get_16bit_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct._tga_source_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %9 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %10 = bitcast %struct.cjpeg_source_struct* %9 to %struct._tga_source_struct*
  store %struct._tga_source_struct* %10, %struct._tga_source_struct** %5, align 8
  %11 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %12 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %11, i32 0, i32 0
  %13 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %12, i32 0, i32 4
  %14 = load i8**, i8*** %13, align 8
  %15 = getelementptr inbounds i8*, i8** %14, i64 0
  %16 = load i8*, i8** %15, align 8
  store i8* %16, i8** %7, align 8
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %17, i32 0, i32 6
  %19 = load i32, i32* %18, align 8
  store i32 %19, i32* %8, align 4
  br label %20

; <label>:20:                                     ; preds = %69, %2
  %21 = load i32, i32* %8, align 4
  %22 = icmp ugt i32 %21, 0
  br i1 %22, label %23, label %73

; <label>:23:                                     ; preds = %20
  %24 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %25 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %24, i32 0, i32 5
  %26 = load void (%struct._tga_source_struct*)*, void (%struct._tga_source_struct*)** %25, align 8
  %27 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %28 = ptrtoint void (%struct._tga_source_struct*)* %26 to i64
  call void @__llvm_profile_instrument_target(i64 %28, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_16bit_row to i8*), i32 0)
  call void %26(%struct._tga_source_struct* %27)
  %29 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %30 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %29, i32 0, i32 6
  %31 = getelementptr inbounds [4 x i8], [4 x i8]* %30, i64 0, i64 0
  %32 = load i8, i8* %31, align 8
  %33 = zext i8 %32 to i32
  store i32 %33, i32* %6, align 4
  %34 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %35 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %34, i32 0, i32 6
  %36 = getelementptr inbounds [4 x i8], [4 x i8]* %35, i64 0, i64 1
  %37 = load i8, i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = shl i32 %38, 8
  %40 = load i32, i32* %6, align 4
  %41 = add nsw i32 %40, %39
  store i32 %41, i32* %6, align 4
  %42 = load i32, i32* %6, align 4
  %43 = and i32 %42, 31
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [32 x i8], [32 x i8]* @c5to8bits, i64 0, i64 %44
  %46 = load i8, i8* %45, align 1
  %47 = load i8*, i8** %7, align 8
  %48 = getelementptr inbounds i8, i8* %47, i64 2
  store i8 %46, i8* %48, align 1
  %49 = load i32, i32* %6, align 4
  %50 = ashr i32 %49, 5
  store i32 %50, i32* %6, align 4
  %51 = load i32, i32* %6, align 4
  %52 = and i32 %51, 31
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [32 x i8], [32 x i8]* @c5to8bits, i64 0, i64 %53
  %55 = load i8, i8* %54, align 1
  %56 = load i8*, i8** %7, align 8
  %57 = getelementptr inbounds i8, i8* %56, i64 1
  store i8 %55, i8* %57, align 1
  %58 = load i32, i32* %6, align 4
  %59 = ashr i32 %58, 5
  store i32 %59, i32* %6, align 4
  %60 = load i32, i32* %6, align 4
  %61 = and i32 %60, 31
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [32 x i8], [32 x i8]* @c5to8bits, i64 0, i64 %62
  %64 = load i8, i8* %63, align 1
  %65 = load i8*, i8** %7, align 8
  %66 = getelementptr inbounds i8, i8* %65, i64 0
  store i8 %64, i8* %66, align 1
  %67 = load i8*, i8** %7, align 8
  %68 = getelementptr inbounds i8, i8* %67, i64 3
  store i8* %68, i8** %7, align 8
  br label %69

; <label>:69:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_16bit_row, i64 0, i64 0)
  %70 = add i64 %pgocount, 1
  store i64 %70, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_16bit_row, i64 0, i64 0)
  %71 = load i32, i32* %8, align 4
  %72 = add i32 %71, -1
  store i32 %72, i32* %8, align 4
  br label %20

; <label>:73:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_16bit_row, i64 0, i64 1)
  %74 = add i64 %pgocount1, 1
  store i64 %74, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_16bit_row, i64 0, i64 1)
  ret i32 1
}

; Function Attrs: nounwind uwtable
define internal i32 @get_24bit_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct._tga_source_struct*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %8 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %9 = bitcast %struct.cjpeg_source_struct* %8 to %struct._tga_source_struct*
  store %struct._tga_source_struct* %9, %struct._tga_source_struct** %5, align 8
  %10 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %11 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %10, i32 0, i32 0
  %12 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %11, i32 0, i32 4
  %13 = load i8**, i8*** %12, align 8
  %14 = getelementptr inbounds i8*, i8** %13, i64 0
  %15 = load i8*, i8** %14, align 8
  store i8* %15, i8** %6, align 8
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 6
  %18 = load i32, i32* %17, align 8
  store i32 %18, i32* %7, align 4
  br label %19

; <label>:19:                                     ; preds = %52, %2
  %20 = load i32, i32* %7, align 4
  %21 = icmp ugt i32 %20, 0
  br i1 %21, label %22, label %56

; <label>:22:                                     ; preds = %19
  %23 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %24 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %23, i32 0, i32 5
  %25 = load void (%struct._tga_source_struct*)*, void (%struct._tga_source_struct*)** %24, align 8
  %26 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %27 = ptrtoint void (%struct._tga_source_struct*)* %25 to i64
  call void @__llvm_profile_instrument_target(i64 %27, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_24bit_row to i8*), i32 0)
  call void %25(%struct._tga_source_struct* %26)
  %28 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %29 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %28, i32 0, i32 6
  %30 = getelementptr inbounds [4 x i8], [4 x i8]* %29, i64 0, i64 2
  %31 = load i8, i8* %30, align 2
  %32 = zext i8 %31 to i32
  %33 = trunc i32 %32 to i8
  %34 = load i8*, i8** %6, align 8
  %35 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %35, i8** %6, align 8
  store i8 %33, i8* %34, align 1
  %36 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %37 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %36, i32 0, i32 6
  %38 = getelementptr inbounds [4 x i8], [4 x i8]* %37, i64 0, i64 1
  %39 = load i8, i8* %38, align 1
  %40 = zext i8 %39 to i32
  %41 = trunc i32 %40 to i8
  %42 = load i8*, i8** %6, align 8
  %43 = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %43, i8** %6, align 8
  store i8 %41, i8* %42, align 1
  %44 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %45 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %44, i32 0, i32 6
  %46 = getelementptr inbounds [4 x i8], [4 x i8]* %45, i64 0, i64 0
  %47 = load i8, i8* %46, align 8
  %48 = zext i8 %47 to i32
  %49 = trunc i32 %48 to i8
  %50 = load i8*, i8** %6, align 8
  %51 = getelementptr inbounds i8, i8* %50, i32 1
  store i8* %51, i8** %6, align 8
  store i8 %49, i8* %50, align 1
  br label %52

; <label>:52:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_24bit_row, i64 0, i64 0)
  %53 = add i64 %pgocount, 1
  store i64 %53, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_24bit_row, i64 0, i64 0)
  %54 = load i32, i32* %7, align 4
  %55 = add i32 %54, -1
  store i32 %55, i32* %7, align 4
  br label %19

; <label>:56:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_24bit_row, i64 0, i64 1)
  %57 = add i64 %pgocount1, 1
  store i64 %57, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_24bit_row, i64 0, i64 1)
  ret i32 1
}

; Function Attrs: nounwind uwtable
define internal i32 @get_8bit_gray_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct._tga_source_struct*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %8 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %9 = bitcast %struct.cjpeg_source_struct* %8 to %struct._tga_source_struct*
  store %struct._tga_source_struct* %9, %struct._tga_source_struct** %5, align 8
  %10 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %11 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %10, i32 0, i32 0
  %12 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %11, i32 0, i32 4
  %13 = load i8**, i8*** %12, align 8
  %14 = getelementptr inbounds i8*, i8** %13, i64 0
  %15 = load i8*, i8** %14, align 8
  store i8* %15, i8** %6, align 8
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 6
  %18 = load i32, i32* %17, align 8
  store i32 %18, i32* %7, align 4
  br label %19

; <label>:19:                                     ; preds = %36, %2
  %20 = load i32, i32* %7, align 4
  %21 = icmp ugt i32 %20, 0
  br i1 %21, label %22, label %40

; <label>:22:                                     ; preds = %19
  %23 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %24 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %23, i32 0, i32 5
  %25 = load void (%struct._tga_source_struct*)*, void (%struct._tga_source_struct*)** %24, align 8
  %26 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %27 = ptrtoint void (%struct._tga_source_struct*)* %25 to i64
  call void @__llvm_profile_instrument_target(i64 %27, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_8bit_gray_row to i8*), i32 0)
  call void %25(%struct._tga_source_struct* %26)
  %28 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %29 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %28, i32 0, i32 6
  %30 = getelementptr inbounds [4 x i8], [4 x i8]* %29, i64 0, i64 0
  %31 = load i8, i8* %30, align 8
  %32 = zext i8 %31 to i32
  %33 = trunc i32 %32 to i8
  %34 = load i8*, i8** %6, align 8
  %35 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %35, i8** %6, align 8
  store i8 %33, i8* %34, align 1
  br label %36

; <label>:36:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_8bit_gray_row, i64 0, i64 0)
  %37 = add i64 %pgocount, 1
  store i64 %37, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_8bit_gray_row, i64 0, i64 0)
  %38 = load i32, i32* %7, align 4
  %39 = add i32 %38, -1
  store i32 %39, i32* %7, align 4
  br label %19

; <label>:40:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_8bit_gray_row, i64 0, i64 1)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_8bit_gray_row, i64 0, i64 1)
  ret i32 1
}

; Function Attrs: nounwind uwtable
define internal i32 @preload_image(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct._tga_source_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.cdjpeg_progress_mgr*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %8 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %9 = bitcast %struct.cjpeg_source_struct* %8 to %struct._tga_source_struct*
  store %struct._tga_source_struct* %9, %struct._tga_source_struct** %5, align 8
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %10, i32 0, i32 2
  %12 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %11, align 8
  %13 = bitcast %struct.jpeg_progress_mgr* %12 to %struct.cdjpeg_progress_mgr*
  store %struct.cdjpeg_progress_mgr* %13, %struct.cdjpeg_progress_mgr** %7, align 8
  store i32 0, i32* %6, align 4
  br label %14

; <label>:14:                                     ; preds = %69, %2
  %15 = load i32, i32* %6, align 4
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 7
  %18 = load i32, i32* %17, align 4
  %19 = icmp ult i32 %15, %18
  br i1 %19, label %20, label %73

; <label>:20:                                     ; preds = %14
  %21 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %7, align 8
  %22 = icmp ne %struct.cdjpeg_progress_mgr* %21, null
  br i1 %22, label %23, label %45

; <label>:23:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 1)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 1)
  %25 = load i32, i32* %6, align 4
  %26 = zext i32 %25 to i64
  %27 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %7, align 8
  %28 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %27, i32 0, i32 0
  %29 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %28, i32 0, i32 1
  store i64 %26, i64* %29, align 8
  %30 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %31 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %30, i32 0, i32 7
  %32 = load i32, i32* %31, align 4
  %33 = zext i32 %32 to i64
  %34 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %7, align 8
  %35 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %34, i32 0, i32 0
  %36 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %35, i32 0, i32 2
  store i64 %33, i64* %36, align 8
  %37 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %7, align 8
  %38 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %37, i32 0, i32 0
  %39 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %38, i32 0, i32 0
  %40 = bitcast {}** %39 to void (%struct.jpeg_common_struct*)**
  %41 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %40, align 8
  %42 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %43 = bitcast %struct.jpeg_compress_struct* %42 to %struct.jpeg_common_struct*
  %44 = ptrtoint void (%struct.jpeg_common_struct*)* %41 to i64
  call void @__llvm_profile_instrument_target(i64 %44, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_preload_image to i8*), i32 0)
  call void %41(%struct.jpeg_common_struct* %43)
  br label %45

; <label>:45:                                     ; preds = %23, %20
  %46 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %47 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %46, i32 0, i32 1
  %48 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %48, i32 0, i32 7
  %50 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %49, align 8
  %51 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %52 = bitcast %struct.jpeg_compress_struct* %51 to %struct.jpeg_common_struct*
  %53 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %54 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %53, i32 0, i32 3
  %55 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %54, align 8
  %56 = load i32, i32* %6, align 4
  %57 = ptrtoint i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)* %50 to i64
  call void @__llvm_profile_instrument_target(i64 %57, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_preload_image to i8*), i32 1)
  %58 = call i8** %50(%struct.jpeg_common_struct* %52, %struct.jvirt_sarray_control* %55, i32 %56, i32 1, i32 1)
  %59 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %60 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %59, i32 0, i32 0
  %61 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %60, i32 0, i32 4
  store i8** %58, i8*** %61, align 8
  %62 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %63 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %62, i32 0, i32 10
  %64 = load i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %63, align 8
  %65 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %66 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %67 = ptrtoint i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* %64 to i64
  call void @__llvm_profile_instrument_target(i64 %67, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_preload_image to i8*), i32 2)
  %68 = call i32 %64(%struct.jpeg_compress_struct* %65, %struct.cjpeg_source_struct* %66)
  br label %69

; <label>:69:                                     ; preds = %45
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 0)
  %70 = add i64 %pgocount1, 1
  store i64 %70, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 0)
  %71 = load i32, i32* %6, align 4
  %72 = add i32 %71, 1
  store i32 %72, i32* %6, align 4
  br label %14

; <label>:73:                                     ; preds = %14
  %74 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %7, align 8
  %75 = icmp ne %struct.cdjpeg_progress_mgr* %74, null
  br i1 %75, label %76, label %82

; <label>:76:                                     ; preds = %73
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 3)
  %77 = add i64 %pgocount2, 1
  store i64 %77, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 3)
  %78 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %7, align 8
  %79 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %78, i32 0, i32 1
  %80 = load i32, i32* %79, align 8
  %81 = add nsw i32 %80, 1
  store i32 %81, i32* %79, align 8
  br label %82

; <label>:82:                                     ; preds = %76, %73
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 2)
  %83 = add i64 %pgocount3, 1
  store i64 %83, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 2)
  %84 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %85 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %84, i32 0, i32 0
  %86 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %85, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_memory_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %86, align 8
  %87 = load %struct._tga_source_struct*, %struct._tga_source_struct** %5, align 8
  %88 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %87, i32 0, i32 4
  store i32 0, i32* %88, align 8
  %89 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %90 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %91 = call i32 @get_memory_row(%struct.jpeg_compress_struct* %89, %struct.cjpeg_source_struct* %90)
  ret i32 %91
}

; Function Attrs: nounwind uwtable
define internal i32 @read_byte(%struct._tga_source_struct*) #0 {
  %2 = alloca %struct._tga_source_struct*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i32, align 4
  store %struct._tga_source_struct* %0, %struct._tga_source_struct** %2, align 8
  %5 = load %struct._tga_source_struct*, %struct._tga_source_struct** %2, align 8
  %6 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %5, i32 0, i32 0
  %7 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %6, i32 0, i32 3
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  store %struct._IO_FILE* %8, %struct._IO_FILE** %3, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %10 = call i32 @_IO_getc(%struct._IO_FILE* %9)
  store i32 %10, i32* %4, align 4
  %11 = icmp eq i32 %10, -1
  br i1 %11, label %12, label %32

; <label>:12:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_read_byte, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_read_byte, i64 0, i64 1)
  %14 = load %struct._tga_source_struct*, %struct._tga_source_struct** %2, align 8
  %15 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %14, i32 0, i32 1
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 0
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i32 0, i32 5
  store i32 42, i32* %19, align 8
  %20 = load %struct._tga_source_struct*, %struct._tga_source_struct** %2, align 8
  %21 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %20, i32 0, i32 1
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i32 0, i32 0
  %26 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %25, align 8
  %27 = load %struct._tga_source_struct*, %struct._tga_source_struct** %2, align 8
  %28 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %27, i32 0, i32 1
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %28, align 8
  %30 = bitcast %struct.jpeg_compress_struct* %29 to %struct.jpeg_common_struct*
  %31 = ptrtoint void (%struct.jpeg_common_struct*)* %26 to i64
  call void @__llvm_profile_instrument_target(i64 %31, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_byte to i8*), i32 0)
  call void %26(%struct.jpeg_common_struct* %30)
  br label %32

; <label>:32:                                     ; preds = %12, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_read_byte, i64 0, i64 0)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_read_byte, i64 0, i64 0)
  %34 = load i32, i32* %4, align 4
  ret i32 %34
}

; Function Attrs: nounwind uwtable
define internal void @read_colormap(%struct._tga_source_struct*, i32, i32) #0 {
  %4 = alloca %struct._tga_source_struct*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct._tga_source_struct* %0, %struct._tga_source_struct** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %8 = load i32, i32* %6, align 4
  %9 = icmp ne i32 %8, 24
  br i1 %9, label %10, label %30

; <label>:10:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_colormap, i64 0, i64 2)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_colormap, i64 0, i64 2)
  %12 = load %struct._tga_source_struct*, %struct._tga_source_struct** %4, align 8
  %13 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %12, i32 0, i32 1
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %14, i32 0, i32 0
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i32 0, i32 5
  store i32 1032, i32* %17, align 8
  %18 = load %struct._tga_source_struct*, %struct._tga_source_struct** %4, align 8
  %19 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %18, i32 0, i32 1
  %20 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %20, i32 0, i32 0
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i32 0, i32 0
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  %25 = load %struct._tga_source_struct*, %struct._tga_source_struct** %4, align 8
  %26 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %25, i32 0, i32 1
  %27 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %26, align 8
  %28 = bitcast %struct.jpeg_compress_struct* %27 to %struct.jpeg_common_struct*
  %29 = ptrtoint void (%struct.jpeg_common_struct*)* %24 to i64
  call void @__llvm_profile_instrument_target(i64 %29, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_colormap to i8*), i32 0)
  call void %24(%struct.jpeg_common_struct* %28)
  br label %30

; <label>:30:                                     ; preds = %10, %3
  store i32 0, i32* %7, align 4
  br label %31

; <label>:31:                                     ; preds = %69, %30
  %32 = load i32, i32* %7, align 4
  %33 = load i32, i32* %5, align 4
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %73

; <label>:35:                                     ; preds = %31
  %36 = load %struct._tga_source_struct*, %struct._tga_source_struct** %4, align 8
  %37 = call i32 @read_byte(%struct._tga_source_struct* %36)
  %38 = trunc i32 %37 to i8
  %39 = load %struct._tga_source_struct*, %struct._tga_source_struct** %4, align 8
  %40 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %39, i32 0, i32 2
  %41 = load i8**, i8*** %40, align 8
  %42 = getelementptr inbounds i8*, i8** %41, i64 2
  %43 = load i8*, i8** %42, align 8
  %44 = load i32, i32* %7, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8, i8* %43, i64 %45
  store i8 %38, i8* %46, align 1
  %47 = load %struct._tga_source_struct*, %struct._tga_source_struct** %4, align 8
  %48 = call i32 @read_byte(%struct._tga_source_struct* %47)
  %49 = trunc i32 %48 to i8
  %50 = load %struct._tga_source_struct*, %struct._tga_source_struct** %4, align 8
  %51 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %50, i32 0, i32 2
  %52 = load i8**, i8*** %51, align 8
  %53 = getelementptr inbounds i8*, i8** %52, i64 1
  %54 = load i8*, i8** %53, align 8
  %55 = load i32, i32* %7, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8* %54, i64 %56
  store i8 %49, i8* %57, align 1
  %58 = load %struct._tga_source_struct*, %struct._tga_source_struct** %4, align 8
  %59 = call i32 @read_byte(%struct._tga_source_struct* %58)
  %60 = trunc i32 %59 to i8
  %61 = load %struct._tga_source_struct*, %struct._tga_source_struct** %4, align 8
  %62 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %61, i32 0, i32 2
  %63 = load i8**, i8*** %62, align 8
  %64 = getelementptr inbounds i8*, i8** %63, i64 0
  %65 = load i8*, i8** %64, align 8
  %66 = load i32, i32* %7, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, i8* %65, i64 %67
  store i8 %60, i8* %68, align 1
  br label %69

; <label>:69:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_colormap, i64 0, i64 0)
  %70 = add i64 %pgocount1, 1
  store i64 %70, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_colormap, i64 0, i64 0)
  %71 = load i32, i32* %7, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %7, align 4
  br label %31

; <label>:73:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_colormap, i64 0, i64 1)
  %74 = add i64 %pgocount2, 1
  store i64 %74, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_colormap, i64 0, i64 1)
  ret void
}

declare i32 @_IO_getc(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define internal i32 @get_memory_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_get_memory_row, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_get_memory_row, i64 0, i64 0)
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca %struct.cjpeg_source_struct*, align 8
  %6 = alloca %struct._tga_source_struct*, align 8
  %7 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %5, align 8
  %8 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %5, align 8
  %9 = bitcast %struct.cjpeg_source_struct* %8 to %struct._tga_source_struct*
  store %struct._tga_source_struct* %9, %struct._tga_source_struct** %6, align 8
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %10, i32 0, i32 7
  %12 = load i32, i32* %11, align 4
  %13 = load %struct._tga_source_struct*, %struct._tga_source_struct** %6, align 8
  %14 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %13, i32 0, i32 4
  %15 = load i32, i32* %14, align 8
  %16 = sub i32 %12, %15
  %17 = sub i32 %16, 1
  store i32 %17, i32* %7, align 4
  %18 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %18, i32 0, i32 1
  %20 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %20, i32 0, i32 7
  %22 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %21, align 8
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %24 = bitcast %struct.jpeg_compress_struct* %23 to %struct.jpeg_common_struct*
  %25 = load %struct._tga_source_struct*, %struct._tga_source_struct** %6, align 8
  %26 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %25, i32 0, i32 3
  %27 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %26, align 8
  %28 = load i32, i32* %7, align 4
  %29 = ptrtoint i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)* %22 to i64
  call void @__llvm_profile_instrument_target(i64 %29, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_memory_row to i8*), i32 0)
  %30 = call i8** %22(%struct.jpeg_common_struct* %24, %struct.jvirt_sarray_control* %27, i32 %28, i32 1, i32 0)
  %31 = load %struct._tga_source_struct*, %struct._tga_source_struct** %6, align 8
  %32 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %31, i32 0, i32 0
  %33 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %32, i32 0, i32 4
  store i8** %30, i8*** %33, align 8
  %34 = load %struct._tga_source_struct*, %struct._tga_source_struct** %6, align 8
  %35 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %34, i32 0, i32 4
  %36 = load i32, i32* %35, align 8
  %37 = add i32 %36, 1
  store i32 %37, i32* %35, align 8
  ret i32 1
}

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

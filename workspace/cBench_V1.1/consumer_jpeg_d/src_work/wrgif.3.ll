; ModuleID = 'wrgif.2.ll'
source_filename = "wrgif.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.djpeg_dest_struct = type { void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)*, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)*, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)*, %struct._IO_FILE*, i8**, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
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
%struct.gif_dest_struct = type { %struct.djpeg_dest_struct, %struct.jpeg_decompress_struct*, i32, i16, i32, i64, i32, i16, i32, i16, i16, i16, i16*, i64*, i32, [256 x i8] }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_write_gif = private constant [15 x i8] c"jinit_write_gif"
@__profn_tmp1.ll_start_output_gif = private constant [24 x i8] c"tmp1.ll:start_output_gif"
@__profn_tmp1.ll_put_pixel_rows = private constant [22 x i8] c"tmp1.ll:put_pixel_rows"
@__profn_tmp1.ll_finish_output_gif = private constant [25 x i8] c"tmp1.ll:finish_output_gif"
@__profn_tmp1.ll_emit_header = private constant [19 x i8] c"tmp1.ll:emit_header"
@__profn_tmp1.ll_put_word = private constant [16 x i8] c"tmp1.ll:put_word"
@__profn_tmp1.ll_put_3bytes = private constant [18 x i8] c"tmp1.ll:put_3bytes"
@__profn_tmp1.ll_compress_init = private constant [21 x i8] c"tmp1.ll:compress_init"
@__profn_tmp1.ll_clear_hash = private constant [18 x i8] c"tmp1.ll:clear_hash"
@__profn_tmp1.ll_output = private constant [14 x i8] c"tmp1.ll:output"
@__profn_tmp1.ll_flush_packet = private constant [20 x i8] c"tmp1.ll:flush_packet"
@__profn_tmp1.ll_compress_byte = private constant [21 x i8] c"tmp1.ll:compress_byte"
@__profn_tmp1.ll_clear_block = private constant [19 x i8] c"tmp1.ll:clear_block"
@__profn_tmp1.ll_compress_term = private constant [21 x i8] c"tmp1.ll:compress_term"
@__profc_jinit_write_gif = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_write_gif = private global [6 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_write_gif = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8504349765981132082, i64 1688930263358454, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jinit_write_gif, i32 0, i32 0), i8* bitcast (%struct.djpeg_dest_struct* (%struct.jpeg_decompress_struct*)* @jinit_write_gif to i8*), i8* bitcast ([6 x i64]* @__profvp_jinit_write_gif to i8*), i32 7, [1 x i16] [i16 6] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_output_gif = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_start_output_gif = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5076217761554611355, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_start_output_gif, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @start_output_gif to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put_pixel_rows = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_put_pixel_rows = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7264417600277484566, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_pixel_rows, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_pixel_rows to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_output_gif = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_finish_output_gif = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_finish_output_gif = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7324854810297729983, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_gif, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @finish_output_gif to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_finish_output_gif to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_header = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_emit_header = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_emit_header = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1573013686348000999, i64 281603840813243, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_header, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_emit_header to i8*), i32 8, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put_word = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_put_word = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2238368753104307120, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_put_word, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put_3bytes = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_put_3bytes = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4545183275079103099, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_put_3bytes, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_compress_init = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_compress_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2372852886909468134, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_compress_init, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_clear_hash = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_clear_hash = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -959850426964866679, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_clear_hash, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_output = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_output = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2124609546817397435, i64 70032064750, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_output, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_flush_packet = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_flush_packet = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_flush_packet = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9068375194470142985, i64 281510350106119, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_flush_packet, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_flush_packet to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_compress_byte = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_compress_byte = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1992507343531462442, i64 147341954745, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i32 0, i32 0), i8* null, i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_clear_block = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_clear_block = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4458403589871332242, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_clear_block, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_compress_term = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_compress_term = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7579683135500918270, i64 51375187908, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_compress_term, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [18 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [289 x i8] c"\9E\02\00jinit_write_gif\01tmp1.ll:start_output_gif\01tmp1.ll:put_pixel_rows\01tmp1.ll:finish_output_gif\01tmp1.ll:emit_header\01tmp1.ll:put_word\01tmp1.ll:put_3bytes\01tmp1.ll:compress_init\01tmp1.ll:clear_hash\01tmp1.ll:output\01tmp1.ll:flush_packet\01tmp1.ll:compress_byte\01tmp1.ll:clear_block\01tmp1.ll:compress_term", section "__llvm_prf_names"
@llvm.used = appending global [16 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_gif to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_output_gif to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put_pixel_rows to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_output_gif to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_header to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put_word to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put_3bytes to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compress_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_clear_hash to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_output to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_flush_packet to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compress_byte to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_clear_block to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compress_term to i8*), i8* bitcast ([18 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([289 x i8], [289 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define %struct.djpeg_dest_struct* @jinit_write_gif(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.gif_dest_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 1
  %6 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %6, i32 0, i32 0
  %8 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %7, align 8
  %9 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %10 = bitcast %struct.jpeg_decompress_struct* %9 to %struct.jpeg_common_struct*
  %11 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %8 to i64
  call void @__llvm_profile_instrument_target(i64 %11, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_gif to i8*), i32 0)
  %12 = call i8* %8(%struct.jpeg_common_struct* %10, i32 1, i64 384)
  %13 = bitcast i8* %12 to %struct.gif_dest_struct*
  store %struct.gif_dest_struct* %13, %struct.gif_dest_struct** %3, align 8
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %15 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %16 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %15, i32 0, i32 1
  store %struct.jpeg_decompress_struct* %14, %struct.jpeg_decompress_struct** %16, align 8
  %17 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %18 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %17, i32 0, i32 0
  %19 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %18, i32 0, i32 0
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @start_output_gif, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %19, align 8
  %20 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %21 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %20, i32 0, i32 0
  %22 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %21, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_pixel_rows, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %22, align 8
  %23 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %24 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %23, i32 0, i32 0
  %25 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %24, i32 0, i32 2
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @finish_output_gif, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %25, align 8
  %26 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %26, i32 0, i32 10
  %28 = load i32, i32* %27, align 8
  %29 = icmp ne i32 %28, 1
  br i1 %29, label %30, label %50

; <label>:30:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jinit_write_gif, i64 0, i64 2)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jinit_write_gif, i64 0, i64 2)
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %32, i32 0, i32 10
  %34 = load i32, i32* %33, align 8
  %35 = icmp ne i32 %34, 2
  br i1 %35, label %36, label %50

; <label>:36:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jinit_write_gif, i64 0, i64 6)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jinit_write_gif, i64 0, i64 6)
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %38, i32 0, i32 0
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i32 0, i32 5
  store i32 1014, i32* %41, align 8
  %42 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %42, i32 0, i32 0
  %44 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %44, i32 0, i32 0
  %46 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %45, align 8
  %47 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %48 = bitcast %struct.jpeg_decompress_struct* %47 to %struct.jpeg_common_struct*
  %49 = ptrtoint void (%struct.jpeg_common_struct*)* %46 to i64
  call void @__llvm_profile_instrument_target(i64 %49, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_gif to i8*), i32 1)
  call void %46(%struct.jpeg_common_struct* %48)
  br label %50

; <label>:50:                                     ; preds = %36, %30, %1
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 10
  %53 = load i32, i32* %52, align 8
  %54 = icmp ne i32 %53, 1
  br i1 %54, label %61, label %55

; <label>:55:                                     ; preds = %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jinit_write_gif, i64 0, i64 3)
  %56 = add i64 %pgocount2, 1
  store i64 %56, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jinit_write_gif, i64 0, i64 3)
  %57 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %57, i32 0, i32 42
  %59 = load i32, i32* %58, align 8
  %60 = icmp sgt i32 %59, 8
  br i1 %60, label %61, label %74

; <label>:61:                                     ; preds = %55, %50
  %62 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %62, i32 0, i32 19
  store i32 1, i32* %63, align 4
  %64 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %65 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %64, i32 0, i32 22
  %66 = load i32, i32* %65, align 8
  %67 = icmp sgt i32 %66, 256
  br i1 %67, label %68, label %72

; <label>:68:                                     ; preds = %61
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jinit_write_gif, i64 0, i64 5)
  %69 = add i64 %pgocount3, 1
  store i64 %69, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jinit_write_gif, i64 0, i64 5)
  %70 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %71 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %70, i32 0, i32 22
  store i32 256, i32* %71, align 8
  br label %72

; <label>:72:                                     ; preds = %68, %61
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jinit_write_gif, i64 0, i64 1)
  %73 = add i64 %pgocount4, 1
  store i64 %73, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jinit_write_gif, i64 0, i64 1)
  br label %74

; <label>:74:                                     ; preds = %72, %55
  %75 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct* %75)
  %76 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %76, i32 0, i32 29
  %78 = load i32, i32* %77, align 4
  %79 = icmp ne i32 %78, 1
  br i1 %79, label %80, label %94

; <label>:80:                                     ; preds = %74
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jinit_write_gif, i64 0, i64 4)
  %81 = add i64 %pgocount5, 1
  store i64 %81, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jinit_write_gif, i64 0, i64 4)
  %82 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %83 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %82, i32 0, i32 0
  %84 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %83, align 8
  %85 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %84, i32 0, i32 5
  store i32 1012, i32* %85, align 8
  %86 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %87 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %86, i32 0, i32 0
  %88 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %87, align 8
  %89 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %88, i32 0, i32 0
  %90 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %89, align 8
  %91 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %92 = bitcast %struct.jpeg_decompress_struct* %91 to %struct.jpeg_common_struct*
  %93 = ptrtoint void (%struct.jpeg_common_struct*)* %90 to i64
  call void @__llvm_profile_instrument_target(i64 %93, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_gif to i8*), i32 2)
  call void %90(%struct.jpeg_common_struct* %92)
  br label %94

; <label>:94:                                     ; preds = %80, %74
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jinit_write_gif, i64 0, i64 0)
  %95 = add i64 %pgocount6, 1
  store i64 %95, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jinit_write_gif, i64 0, i64 0)
  %96 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %97 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %96, i32 0, i32 1
  %98 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %97, align 8
  %99 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %98, i32 0, i32 2
  %100 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %99, align 8
  %101 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %102 = bitcast %struct.jpeg_decompress_struct* %101 to %struct.jpeg_common_struct*
  %103 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %104 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %103, i32 0, i32 26
  %105 = load i32, i32* %104, align 8
  %106 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %100 to i64
  call void @__llvm_profile_instrument_target(i64 %106, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_gif to i8*), i32 3)
  %107 = call i8** %100(%struct.jpeg_common_struct* %102, i32 1, i32 %105, i32 1)
  %108 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %109 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %108, i32 0, i32 0
  %110 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %109, i32 0, i32 4
  store i8** %107, i8*** %110, align 8
  %111 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %112 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %111, i32 0, i32 0
  %113 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %112, i32 0, i32 5
  store i32 1, i32* %113, align 8
  %114 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %115 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %114, i32 0, i32 1
  %116 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %115, align 8
  %117 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %116, i32 0, i32 0
  %118 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %117, align 8
  %119 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %120 = bitcast %struct.jpeg_decompress_struct* %119 to %struct.jpeg_common_struct*
  %121 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %118 to i64
  call void @__llvm_profile_instrument_target(i64 %121, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_gif to i8*), i32 4)
  %122 = call i8* %118(%struct.jpeg_common_struct* %120, i32 1, i64 10006)
  %123 = bitcast i8* %122 to i16*
  %124 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %125 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %124, i32 0, i32 12
  store i16* %123, i16** %125, align 8
  %126 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %127 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %126, i32 0, i32 1
  %128 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %127, align 8
  %129 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %128, i32 0, i32 1
  %130 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %129, align 8
  %131 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %132 = bitcast %struct.jpeg_decompress_struct* %131 to %struct.jpeg_common_struct*
  %133 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %130 to i64
  call void @__llvm_profile_instrument_target(i64 %133, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_gif to i8*), i32 5)
  %134 = call i8* %130(%struct.jpeg_common_struct* %132, i32 1, i64 40024)
  %135 = bitcast i8* %134 to i64*
  %136 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %137 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %136, i32 0, i32 13
  store i64* %135, i64** %137, align 8
  %138 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %139 = bitcast %struct.gif_dest_struct* %138 to %struct.djpeg_dest_struct*
  ret %struct.djpeg_dest_struct* %139
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_output_gif(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.djpeg_dest_struct*, align 8
  %5 = alloca %struct.gif_dest_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %4, align 8
  %6 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %4, align 8
  %7 = bitcast %struct.djpeg_dest_struct* %6 to %struct.gif_dest_struct*
  store %struct.gif_dest_struct* %7, %struct.gif_dest_struct** %5, align 8
  %8 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %8, i32 0, i32 19
  %10 = load i32, i32* %9, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %21

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_start_output_gif, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_start_output_gif, i64 0, i64 0)
  %14 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %5, align 8
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 31
  %17 = load i32, i32* %16, align 4
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 32
  %20 = load i8**, i8*** %19, align 8
  call void @emit_header(%struct.gif_dest_struct* %14, i32 %17, i8** %20)
  br label %24

; <label>:21:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_start_output_gif, i64 0, i64 1)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_start_output_gif, i64 0, i64 1)
  %23 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %5, align 8
  call void @emit_header(%struct.gif_dest_struct* %23, i32 256, i8** null)
  br label %24

; <label>:24:                                     ; preds = %21, %12
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put_pixel_rows(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32) #0 {
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca %struct.djpeg_dest_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.gif_dest_struct*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %5, align 8
  store i32 %2, i32* %6, align 4
  %10 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %5, align 8
  %11 = bitcast %struct.djpeg_dest_struct* %10 to %struct.gif_dest_struct*
  store %struct.gif_dest_struct* %11, %struct.gif_dest_struct** %7, align 8
  %12 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %7, align 8
  %13 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %12, i32 0, i32 0
  %14 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %13, i32 0, i32 4
  %15 = load i8**, i8*** %14, align 8
  %16 = getelementptr inbounds i8*, i8** %15, i64 0
  %17 = load i8*, i8** %16, align 8
  store i8* %17, i8** %8, align 8
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 26
  %20 = load i32, i32* %19, align 8
  store i32 %20, i32* %9, align 4
  br label %21

; <label>:21:                                     ; preds = %30, %3
  %22 = load i32, i32* %9, align 4
  %23 = icmp ugt i32 %22, 0
  br i1 %23, label %24, label %34

; <label>:24:                                     ; preds = %21
  %25 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %7, align 8
  %26 = load i8*, i8** %8, align 8
  %27 = getelementptr inbounds i8, i8* %26, i32 1
  store i8* %27, i8** %8, align 8
  %28 = load i8, i8* %26, align 1
  %29 = zext i8 %28 to i32
  call void @compress_byte(%struct.gif_dest_struct* %25, i32 %29)
  br label %30

; <label>:30:                                     ; preds = %24
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_pixel_rows, i64 0, i64 0)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_pixel_rows, i64 0, i64 0)
  %32 = load i32, i32* %9, align 4
  %33 = add i32 %32, -1
  store i32 %33, i32* %9, align 4
  br label %21

; <label>:34:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_pixel_rows, i64 0, i64 1)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_pixel_rows, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_output_gif(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.djpeg_dest_struct*, align 8
  %5 = alloca %struct.gif_dest_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %4, align 8
  %6 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %4, align 8
  %7 = bitcast %struct.djpeg_dest_struct* %6 to %struct.gif_dest_struct*
  store %struct.gif_dest_struct* %7, %struct.gif_dest_struct** %5, align 8
  %8 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %5, align 8
  call void @compress_term(%struct.gif_dest_struct* %8)
  %9 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %5, align 8
  %10 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %9, i32 0, i32 0
  %11 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %10, i32 0, i32 3
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %13 = call i32 @_IO_putc(i32 0, %struct._IO_FILE* %12)
  %14 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %5, align 8
  %15 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %14, i32 0, i32 0
  %16 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %15, i32 0, i32 3
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %18 = call i32 @_IO_putc(i32 59, %struct._IO_FILE* %17)
  %19 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %5, align 8
  %20 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %20, i32 0, i32 3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %21, align 8
  %23 = call i32 @fflush(%struct._IO_FILE* %22)
  %24 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %5, align 8
  %25 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %24, i32 0, i32 0
  %26 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %25, i32 0, i32 3
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %26, align 8
  %28 = call i32 @ferror(%struct._IO_FILE* %27) #4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %44

; <label>:30:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_gif, i64 0, i64 1)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_gif, i64 0, i64 1)
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %32, i32 0, i32 0
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i32 0, i32 5
  store i32 36, i32* %35, align 8
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 0
  %38 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %37, align 8
  %39 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %38, i32 0, i32 0
  %40 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %39, align 8
  %41 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %42 = bitcast %struct.jpeg_decompress_struct* %41 to %struct.jpeg_common_struct*
  %43 = ptrtoint void (%struct.jpeg_common_struct*)* %40 to i64
  call void @__llvm_profile_instrument_target(i64 %43, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_output_gif to i8*), i32 0)
  call void %40(%struct.jpeg_common_struct* %42)
  br label %44

; <label>:44:                                     ; preds = %30, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_gif, i64 0, i64 0)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_gif, i64 0, i64 0)
  ret void
}

declare void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @emit_header(%struct.gif_dest_struct*, i32, i8**) #0 {
  %4 = alloca %struct.gif_dest_struct*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8**, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store %struct.gif_dest_struct* %0, %struct.gif_dest_struct** %4, align 8
  store i32 %1, i32* %5, align 4
  store i8** %2, i8*** %6, align 8
  %13 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %14 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %13, i32 0, i32 1
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %14, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 42
  %17 = load i32, i32* %16, align 8
  %18 = sub nsw i32 %17, 8
  store i32 %18, i32* %11, align 4
  %19 = load i32, i32* %5, align 4
  %20 = icmp sgt i32 %19, 256
  br i1 %20, label %21, label %50

; <label>:21:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_header, i64 0, i64 5)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_header, i64 0, i64 5)
  %23 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %24 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %23, i32 0, i32 1
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %25, i32 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i32 0, i32 5
  store i32 1039, i32* %28, align 8
  %29 = load i32, i32* %5, align 4
  %30 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %31 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %30, i32 0, i32 1
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %32, i32 0, i32 0
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i32 0, i32 6
  %36 = bitcast %union.anon* %35 to [8 x i32]*
  %37 = getelementptr inbounds [8 x i32], [8 x i32]* %36, i64 0, i64 0
  store i32 %29, i32* %37, align 4
  %38 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %39 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %38, i32 0, i32 1
  %40 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %40, i32 0, i32 0
  %42 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %41, align 8
  %43 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %42, i32 0, i32 0
  %44 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %43, align 8
  %45 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %46 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %45, i32 0, i32 1
  %47 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %46, align 8
  %48 = bitcast %struct.jpeg_decompress_struct* %47 to %struct.jpeg_common_struct*
  %49 = ptrtoint void (%struct.jpeg_common_struct*)* %44 to i64
  call void @__llvm_profile_instrument_target(i64 %49, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_header to i8*), i32 0)
  call void %44(%struct.jpeg_common_struct* %48)
  br label %50

; <label>:50:                                     ; preds = %21, %3
  store i32 1, i32* %7, align 4
  br label %51

; <label>:51:                                     ; preds = %56, %50
  %52 = load i32, i32* %5, align 4
  %53 = load i32, i32* %7, align 4
  %54 = shl i32 1, %53
  %55 = icmp sgt i32 %52, %54
  br i1 %55, label %56, label %60

; <label>:56:                                     ; preds = %51
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_header, i64 0, i64 0)
  %57 = add i64 %pgocount1, 1
  store i64 %57, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_header, i64 0, i64 0)
  %58 = load i32, i32* %7, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %7, align 4
  br label %51

; <label>:60:                                     ; preds = %51
  %61 = load i32, i32* %7, align 4
  %62 = shl i32 1, %61
  store i32 %62, i32* %8, align 4
  %63 = load i32, i32* %7, align 4
  %64 = icmp sle i32 %63, 1
  br i1 %64, label %65, label %67

; <label>:65:                                     ; preds = %60
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_header, i64 0, i64 6)
  %66 = add i64 %pgocount2, 1
  store i64 %66, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_header, i64 0, i64 6)
  store i32 2, i32* %9, align 4
  br label %70

; <label>:67:                                     ; preds = %60
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_header, i64 0, i64 7)
  %68 = add i64 %pgocount3, 1
  store i64 %68, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_header, i64 0, i64 7)
  %69 = load i32, i32* %7, align 4
  store i32 %69, i32* %9, align 4
  br label %70

; <label>:70:                                     ; preds = %67, %65
  %71 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %72 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %71, i32 0, i32 0
  %73 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %72, i32 0, i32 3
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** %73, align 8
  %75 = call i32 @_IO_putc(i32 71, %struct._IO_FILE* %74)
  %76 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %77 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %76, i32 0, i32 0
  %78 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %77, i32 0, i32 3
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** %78, align 8
  %80 = call i32 @_IO_putc(i32 73, %struct._IO_FILE* %79)
  %81 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %82 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %81, i32 0, i32 0
  %83 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %82, i32 0, i32 3
  %84 = load %struct._IO_FILE*, %struct._IO_FILE** %83, align 8
  %85 = call i32 @_IO_putc(i32 70, %struct._IO_FILE* %84)
  %86 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %87 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %86, i32 0, i32 0
  %88 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %87, i32 0, i32 3
  %89 = load %struct._IO_FILE*, %struct._IO_FILE** %88, align 8
  %90 = call i32 @_IO_putc(i32 56, %struct._IO_FILE* %89)
  %91 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %92 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %91, i32 0, i32 0
  %93 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %92, i32 0, i32 3
  %94 = load %struct._IO_FILE*, %struct._IO_FILE** %93, align 8
  %95 = call i32 @_IO_putc(i32 55, %struct._IO_FILE* %94)
  %96 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %97 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %96, i32 0, i32 0
  %98 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %97, i32 0, i32 3
  %99 = load %struct._IO_FILE*, %struct._IO_FILE** %98, align 8
  %100 = call i32 @_IO_putc(i32 97, %struct._IO_FILE* %99)
  %101 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %102 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %103 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %102, i32 0, i32 1
  %104 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %103, align 8
  %105 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %104, i32 0, i32 26
  %106 = load i32, i32* %105, align 8
  call void @put_word(%struct.gif_dest_struct* %101, i32 %106)
  %107 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %108 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %109 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %108, i32 0, i32 1
  %110 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %109, align 8
  %111 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %110, i32 0, i32 27
  %112 = load i32, i32* %111, align 4
  call void @put_word(%struct.gif_dest_struct* %107, i32 %112)
  store i32 128, i32* %10, align 4
  %113 = load i32, i32* %7, align 4
  %114 = sub nsw i32 %113, 1
  %115 = shl i32 %114, 4
  %116 = load i32, i32* %10, align 4
  %117 = or i32 %116, %115
  store i32 %117, i32* %10, align 4
  %118 = load i32, i32* %7, align 4
  %119 = sub nsw i32 %118, 1
  %120 = load i32, i32* %10, align 4
  %121 = or i32 %120, %119
  store i32 %121, i32* %10, align 4
  %122 = load i32, i32* %10, align 4
  %123 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %124 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %123, i32 0, i32 0
  %125 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %124, i32 0, i32 3
  %126 = load %struct._IO_FILE*, %struct._IO_FILE** %125, align 8
  %127 = call i32 @_IO_putc(i32 %122, %struct._IO_FILE* %126)
  %128 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %129 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %128, i32 0, i32 0
  %130 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %129, i32 0, i32 3
  %131 = load %struct._IO_FILE*, %struct._IO_FILE** %130, align 8
  %132 = call i32 @_IO_putc(i32 0, %struct._IO_FILE* %131)
  %133 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %134 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %133, i32 0, i32 0
  %135 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %134, i32 0, i32 3
  %136 = load %struct._IO_FILE*, %struct._IO_FILE** %135, align 8
  %137 = call i32 @_IO_putc(i32 0, %struct._IO_FILE* %136)
  store i32 0, i32* %12, align 4
  br label %138

; <label>:138:                                    ; preds = %234, %70
  %139 = load i32, i32* %12, align 4
  %140 = load i32, i32* %8, align 4
  %141 = icmp slt i32 %139, %140
  br i1 %141, label %142, label %237

; <label>:142:                                    ; preds = %138
  %143 = load i32, i32* %12, align 4
  %144 = load i32, i32* %5, align 4
  %145 = icmp slt i32 %143, %144
  br i1 %145, label %146, label %230

; <label>:146:                                    ; preds = %142
  %147 = load i8**, i8*** %6, align 8
  %148 = icmp ne i8** %147, null
  br i1 %148, label %149, label %217

; <label>:149:                                    ; preds = %146
  %150 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %151 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %150, i32 0, i32 1
  %152 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %151, align 8
  %153 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %152, i32 0, i32 10
  %154 = load i32, i32* %153, align 8
  %155 = icmp eq i32 %154, 2
  br i1 %155, label %156, label %203

; <label>:156:                                    ; preds = %149
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_header, i64 0, i64 3)
  %157 = add i64 %pgocount4, 1
  store i64 %157, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_header, i64 0, i64 3)
  %158 = load i8**, i8*** %6, align 8
  %159 = getelementptr inbounds i8*, i8** %158, i64 0
  %160 = load i8*, i8** %159, align 8
  %161 = load i32, i32* %12, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i8, i8* %160, i64 %162
  %164 = load i8, i8* %163, align 1
  %165 = zext i8 %164 to i32
  %166 = load i32, i32* %11, align 4
  %167 = ashr i32 %165, %166
  %168 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %169 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %168, i32 0, i32 0
  %170 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %169, i32 0, i32 3
  %171 = load %struct._IO_FILE*, %struct._IO_FILE** %170, align 8
  %172 = call i32 @_IO_putc(i32 %167, %struct._IO_FILE* %171)
  %173 = load i8**, i8*** %6, align 8
  %174 = getelementptr inbounds i8*, i8** %173, i64 1
  %175 = load i8*, i8** %174, align 8
  %176 = load i32, i32* %12, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds i8, i8* %175, i64 %177
  %179 = load i8, i8* %178, align 1
  %180 = zext i8 %179 to i32
  %181 = load i32, i32* %11, align 4
  %182 = ashr i32 %180, %181
  %183 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %184 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %183, i32 0, i32 0
  %185 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %184, i32 0, i32 3
  %186 = load %struct._IO_FILE*, %struct._IO_FILE** %185, align 8
  %187 = call i32 @_IO_putc(i32 %182, %struct._IO_FILE* %186)
  %188 = load i8**, i8*** %6, align 8
  %189 = getelementptr inbounds i8*, i8** %188, i64 2
  %190 = load i8*, i8** %189, align 8
  %191 = load i32, i32* %12, align 4
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds i8, i8* %190, i64 %192
  %194 = load i8, i8* %193, align 1
  %195 = zext i8 %194 to i32
  %196 = load i32, i32* %11, align 4
  %197 = ashr i32 %195, %196
  %198 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %199 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %198, i32 0, i32 0
  %200 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %199, i32 0, i32 3
  %201 = load %struct._IO_FILE*, %struct._IO_FILE** %200, align 8
  %202 = call i32 @_IO_putc(i32 %197, %struct._IO_FILE* %201)
  br label %216

; <label>:203:                                    ; preds = %149
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_header, i64 0, i64 4)
  %204 = add i64 %pgocount5, 1
  store i64 %204, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_header, i64 0, i64 4)
  %205 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %206 = load i8**, i8*** %6, align 8
  %207 = getelementptr inbounds i8*, i8** %206, i64 0
  %208 = load i8*, i8** %207, align 8
  %209 = load i32, i32* %12, align 4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds i8, i8* %208, i64 %210
  %212 = load i8, i8* %211, align 1
  %213 = zext i8 %212 to i32
  %214 = load i32, i32* %11, align 4
  %215 = ashr i32 %213, %214
  call void @put_3bytes(%struct.gif_dest_struct* %205, i32 %215)
  br label %216

; <label>:216:                                    ; preds = %203, %156
  br label %229

; <label>:217:                                    ; preds = %146
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_header, i64 0, i64 2)
  %218 = add i64 %pgocount6, 1
  store i64 %218, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_header, i64 0, i64 2)
  %219 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %220 = load i32, i32* %12, align 4
  %221 = mul nsw i32 %220, 255
  %222 = load i32, i32* %5, align 4
  %223 = sub nsw i32 %222, 1
  %224 = sdiv i32 %223, 2
  %225 = add nsw i32 %221, %224
  %226 = load i32, i32* %5, align 4
  %227 = sub nsw i32 %226, 1
  %228 = sdiv i32 %225, %227
  call void @put_3bytes(%struct.gif_dest_struct* %219, i32 %228)
  br label %229

; <label>:229:                                    ; preds = %217, %216
  br label %233

; <label>:230:                                    ; preds = %142
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_header, i64 0, i64 1)
  %231 = add i64 %pgocount7, 1
  store i64 %231, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_header, i64 0, i64 1)
  %232 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  call void @put_3bytes(%struct.gif_dest_struct* %232, i32 0)
  br label %233

; <label>:233:                                    ; preds = %230, %229
  br label %234

; <label>:234:                                    ; preds = %233
  %235 = load i32, i32* %12, align 4
  %236 = add nsw i32 %235, 1
  store i32 %236, i32* %12, align 4
  br label %138

; <label>:237:                                    ; preds = %138
  %238 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %239 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %238, i32 0, i32 0
  %240 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %239, i32 0, i32 3
  %241 = load %struct._IO_FILE*, %struct._IO_FILE** %240, align 8
  %242 = call i32 @_IO_putc(i32 44, %struct._IO_FILE* %241)
  %243 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  call void @put_word(%struct.gif_dest_struct* %243, i32 0)
  %244 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  call void @put_word(%struct.gif_dest_struct* %244, i32 0)
  %245 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %246 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %247 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %246, i32 0, i32 1
  %248 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %247, align 8
  %249 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %248, i32 0, i32 26
  %250 = load i32, i32* %249, align 8
  call void @put_word(%struct.gif_dest_struct* %245, i32 %250)
  %251 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %252 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %253 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %252, i32 0, i32 1
  %254 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %253, align 8
  %255 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %254, i32 0, i32 27
  %256 = load i32, i32* %255, align 4
  call void @put_word(%struct.gif_dest_struct* %251, i32 %256)
  %257 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %258 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %257, i32 0, i32 0
  %259 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %258, i32 0, i32 3
  %260 = load %struct._IO_FILE*, %struct._IO_FILE** %259, align 8
  %261 = call i32 @_IO_putc(i32 0, %struct._IO_FILE* %260)
  %262 = load i32, i32* %9, align 4
  %263 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %264 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %263, i32 0, i32 0
  %265 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %264, i32 0, i32 3
  %266 = load %struct._IO_FILE*, %struct._IO_FILE** %265, align 8
  %267 = call i32 @_IO_putc(i32 %262, %struct._IO_FILE* %266)
  %268 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %269 = load i32, i32* %9, align 4
  %270 = add nsw i32 %269, 1
  call void @compress_init(%struct.gif_dest_struct* %268, i32 %270)
  ret void
}

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @put_word(%struct.gif_dest_struct*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_put_word, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_put_word, i64 0, i64 0)
  %4 = alloca %struct.gif_dest_struct*, align 8
  %5 = alloca i32, align 4
  store %struct.gif_dest_struct* %0, %struct.gif_dest_struct** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = and i32 %6, 255
  %8 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %9 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %8, i32 0, i32 0
  %10 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %9, i32 0, i32 3
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %12 = call i32 @_IO_putc(i32 %7, %struct._IO_FILE* %11)
  %13 = load i32, i32* %5, align 4
  %14 = lshr i32 %13, 8
  %15 = and i32 %14, 255
  %16 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %17 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %16, i32 0, i32 0
  %18 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %17, i32 0, i32 3
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %18, align 8
  %20 = call i32 @_IO_putc(i32 %15, %struct._IO_FILE* %19)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put_3bytes(%struct.gif_dest_struct*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_put_3bytes, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_put_3bytes, i64 0, i64 0)
  %4 = alloca %struct.gif_dest_struct*, align 8
  %5 = alloca i32, align 4
  store %struct.gif_dest_struct* %0, %struct.gif_dest_struct** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %8 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %7, i32 0, i32 0
  %9 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %8, i32 0, i32 3
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %11 = call i32 @_IO_putc(i32 %6, %struct._IO_FILE* %10)
  %12 = load i32, i32* %5, align 4
  %13 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %14 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %13, i32 0, i32 0
  %15 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %14, i32 0, i32 3
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %17 = call i32 @_IO_putc(i32 %12, %struct._IO_FILE* %16)
  %18 = load i32, i32* %5, align 4
  %19 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %20 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %20, i32 0, i32 3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %21, align 8
  %23 = call i32 @_IO_putc(i32 %18, %struct._IO_FILE* %22)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @compress_init(%struct.gif_dest_struct*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_compress_init, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_compress_init, i64 0, i64 0)
  %4 = alloca %struct.gif_dest_struct*, align 8
  %5 = alloca i32, align 4
  store %struct.gif_dest_struct* %0, %struct.gif_dest_struct** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %8 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %7, i32 0, i32 4
  store i32 %6, i32* %8, align 8
  %9 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %10 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %9, i32 0, i32 2
  store i32 %6, i32* %10, align 8
  %11 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %12 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %11, i32 0, i32 2
  %13 = load i32, i32* %12, align 8
  %14 = shl i32 1, %13
  %15 = sub nsw i32 %14, 1
  %16 = trunc i32 %15 to i16
  %17 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %18 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %17, i32 0, i32 3
  store i16 %16, i16* %18, align 4
  %19 = load i32, i32* %5, align 4
  %20 = sub nsw i32 %19, 1
  %21 = shl i32 1, %20
  %22 = trunc i32 %21 to i16
  %23 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %24 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %23, i32 0, i32 9
  store i16 %22, i16* %24, align 4
  %25 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %26 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %25, i32 0, i32 9
  %27 = load i16, i16* %26, align 4
  %28 = sext i16 %27 to i32
  %29 = add nsw i32 %28, 1
  %30 = trunc i32 %29 to i16
  %31 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %32 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %31, i32 0, i32 10
  store i16 %30, i16* %32, align 2
  %33 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %34 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %33, i32 0, i32 9
  %35 = load i16, i16* %34, align 4
  %36 = sext i16 %35 to i32
  %37 = add nsw i32 %36, 2
  %38 = trunc i32 %37 to i16
  %39 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %40 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %39, i32 0, i32 11
  store i16 %38, i16* %40, align 8
  %41 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %42 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %41, i32 0, i32 8
  store i32 1, i32* %42, align 8
  %43 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %44 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %43, i32 0, i32 14
  store i32 0, i32* %44, align 8
  %45 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %46 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %45, i32 0, i32 5
  store i64 0, i64* %46, align 8
  %47 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %48 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %47, i32 0, i32 6
  store i32 0, i32* %48, align 8
  %49 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  call void @clear_hash(%struct.gif_dest_struct* %49)
  %50 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %51 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %4, align 8
  %52 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %51, i32 0, i32 9
  %53 = load i16, i16* %52, align 4
  call void @output(%struct.gif_dest_struct* %50, i16 signext %53)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @clear_hash(%struct.gif_dest_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_clear_hash, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_clear_hash, i64 0, i64 0)
  %3 = alloca %struct.gif_dest_struct*, align 8
  store %struct.gif_dest_struct* %0, %struct.gif_dest_struct** %3, align 8
  %4 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %5 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %4, i32 0, i32 12
  %6 = load i16*, i16** %5, align 8
  %7 = bitcast i16* %6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 10006, i32 1, i1 false)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @output(%struct.gif_dest_struct*, i16 signext) #0 {
  %3 = alloca %struct.gif_dest_struct*, align 8
  %4 = alloca i16, align 2
  store %struct.gif_dest_struct* %0, %struct.gif_dest_struct** %3, align 8
  store i16 %1, i16* %4, align 2
  %5 = load i16, i16* %4, align 2
  %6 = sext i16 %5 to i64
  %7 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %8 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %7, i32 0, i32 6
  %9 = load i32, i32* %8, align 8
  %10 = zext i32 %9 to i64
  %11 = shl i64 %6, %10
  %12 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %13 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %12, i32 0, i32 5
  %14 = load i64, i64* %13, align 8
  %15 = or i64 %14, %11
  store i64 %15, i64* %13, align 8
  %16 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %17 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %16, i32 0, i32 2
  %18 = load i32, i32* %17, align 8
  %19 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %20 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %19, i32 0, i32 6
  %21 = load i32, i32* %20, align 8
  %22 = add nsw i32 %21, %18
  store i32 %22, i32* %20, align 8
  br label %23

; <label>:23:                                     ; preds = %49, %2
  %24 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %25 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %24, i32 0, i32 6
  %26 = load i32, i32* %25, align 8
  %27 = icmp sge i32 %26, 8
  br i1 %27, label %28, label %59

; <label>:28:                                     ; preds = %23
  %29 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %30 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %29, i32 0, i32 5
  %31 = load i64, i64* %30, align 8
  %32 = and i64 %31, 255
  %33 = trunc i64 %32 to i8
  %34 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %35 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %34, i32 0, i32 15
  %36 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %37 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %36, i32 0, i32 14
  %38 = load i32, i32* %37, align 8
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %37, align 8
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [256 x i8], [256 x i8]* %35, i64 0, i64 %40
  store i8 %33, i8* %41, align 1
  %42 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %43 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %42, i32 0, i32 14
  %44 = load i32, i32* %43, align 8
  %45 = icmp sge i32 %44, 255
  br i1 %45, label %46, label %49

; <label>:46:                                     ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_output, i64 0, i64 1)
  %47 = add i64 %pgocount, 1
  store i64 %47, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_output, i64 0, i64 1)
  %48 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  call void @flush_packet(%struct.gif_dest_struct* %48)
  br label %49

; <label>:49:                                     ; preds = %46, %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_output, i64 0, i64 0)
  %50 = add i64 %pgocount1, 1
  store i64 %50, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_output, i64 0, i64 0)
  %51 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %52 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %51, i32 0, i32 5
  %53 = load i64, i64* %52, align 8
  %54 = ashr i64 %53, 8
  store i64 %54, i64* %52, align 8
  %55 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %56 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %55, i32 0, i32 6
  %57 = load i32, i32* %56, align 8
  %58 = sub nsw i32 %57, 8
  store i32 %58, i32* %56, align 8
  br label %23

; <label>:59:                                     ; preds = %23
  %60 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %61 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %60, i32 0, i32 11
  %62 = load i16, i16* %61, align 8
  %63 = sext i16 %62 to i32
  %64 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %65 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %64, i32 0, i32 3
  %66 = load i16, i16* %65, align 4
  %67 = sext i16 %66 to i32
  %68 = icmp sgt i32 %63, %67
  br i1 %68, label %69, label %93

; <label>:69:                                     ; preds = %59
  %70 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %71 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %70, i32 0, i32 2
  %72 = load i32, i32* %71, align 8
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* %71, align 8
  %74 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %75 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %74, i32 0, i32 2
  %76 = load i32, i32* %75, align 8
  %77 = icmp eq i32 %76, 12
  br i1 %77, label %78, label %82

; <label>:78:                                     ; preds = %69
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_output, i64 0, i64 3)
  %79 = add i64 %pgocount2, 1
  store i64 %79, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_output, i64 0, i64 3)
  %80 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %81 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %80, i32 0, i32 3
  store i16 4096, i16* %81, align 4
  br label %92

; <label>:82:                                     ; preds = %69
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_output, i64 0, i64 4)
  %83 = add i64 %pgocount3, 1
  store i64 %83, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_output, i64 0, i64 4)
  %84 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %85 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %84, i32 0, i32 2
  %86 = load i32, i32* %85, align 8
  %87 = shl i32 1, %86
  %88 = sub nsw i32 %87, 1
  %89 = trunc i32 %88 to i16
  %90 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %91 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %90, i32 0, i32 3
  store i16 %89, i16* %91, align 4
  br label %92

; <label>:92:                                     ; preds = %82, %78
  br label %93

; <label>:93:                                     ; preds = %92, %59
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_output, i64 0, i64 2)
  %94 = add i64 %pgocount4, 1
  store i64 %94, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_output, i64 0, i64 2)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

; Function Attrs: noinline nounwind uwtable
define internal void @flush_packet(%struct.gif_dest_struct*) #0 {
  %2 = alloca %struct.gif_dest_struct*, align 8
  store %struct.gif_dest_struct* %0, %struct.gif_dest_struct** %2, align 8
  %3 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %4 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %3, i32 0, i32 14
  %5 = load i32, i32* %4, align 8
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %57

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_flush_packet, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_flush_packet, i64 0, i64 1)
  %9 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %10 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %9, i32 0, i32 14
  %11 = load i32, i32* %10, align 8
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %10, align 8
  %13 = trunc i32 %11 to i8
  %14 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %15 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %14, i32 0, i32 15
  %16 = getelementptr inbounds [256 x i8], [256 x i8]* %15, i64 0, i64 0
  store i8 %13, i8* %16, align 4
  %17 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %18 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %17, i32 0, i32 15
  %19 = getelementptr inbounds [256 x i8], [256 x i8]* %18, i32 0, i32 0
  %20 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %21 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %20, i32 0, i32 14
  %22 = load i32, i32* %21, align 8
  %23 = sext i32 %22 to i64
  %24 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %25 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %24, i32 0, i32 0
  %26 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %25, i32 0, i32 3
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %26, align 8
  %28 = call i64 @fwrite(i8* %19, i64 1, i64 %23, %struct._IO_FILE* %27)
  %29 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %30 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %29, i32 0, i32 14
  %31 = load i32, i32* %30, align 8
  %32 = sext i32 %31 to i64
  %33 = icmp ne i64 %28, %32
  br i1 %33, label %34, label %54

; <label>:34:                                     ; preds = %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_flush_packet, i64 0, i64 2)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_flush_packet, i64 0, i64 2)
  %36 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %37 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %36, i32 0, i32 1
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %37, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %38, i32 0, i32 0
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i32 0, i32 5
  store i32 36, i32* %41, align 8
  %42 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %43 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %42, i32 0, i32 1
  %44 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %44, i32 0, i32 0
  %46 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %45, align 8
  %47 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %46, i32 0, i32 0
  %48 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %47, align 8
  %49 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %50 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %49, i32 0, i32 1
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %50, align 8
  %52 = bitcast %struct.jpeg_decompress_struct* %51 to %struct.jpeg_common_struct*
  %53 = ptrtoint void (%struct.jpeg_common_struct*)* %48 to i64
  call void @__llvm_profile_instrument_target(i64 %53, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_flush_packet to i8*), i32 0)
  call void %48(%struct.jpeg_common_struct* %52)
  br label %54

; <label>:54:                                     ; preds = %34, %7
  %55 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %56 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %55, i32 0, i32 14
  store i32 0, i32* %56, align 8
  br label %57

; <label>:57:                                     ; preds = %54, %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_flush_packet, i64 0, i64 0)
  %58 = add i64 %pgocount2, 1
  store i64 %58, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_flush_packet, i64 0, i64 0)
  ret void
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @compress_byte(%struct.gif_dest_struct*, i32) #0 {
  %3 = alloca %struct.gif_dest_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  store %struct.gif_dest_struct* %0, %struct.gif_dest_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %8 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %9 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %8, i32 0, i32 8
  %10 = load i32, i32* %9, align 8
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %20

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 2)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 2)
  %14 = load i32, i32* %4, align 4
  %15 = trunc i32 %14 to i16
  %16 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %17 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %16, i32 0, i32 7
  store i16 %15, i16* %17, align 4
  %18 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %19 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %18, i32 0, i32 8
  store i32 0, i32* %19, align 8
  br label %165

; <label>:20:                                     ; preds = %2
  %21 = load i32, i32* %4, align 4
  %22 = shl i32 %21, 4
  %23 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %24 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %23, i32 0, i32 7
  %25 = load i16, i16* %24, align 4
  %26 = sext i16 %25 to i32
  %27 = add nsw i32 %22, %26
  store i32 %27, i32* %5, align 4
  %28 = load i32, i32* %5, align 4
  %29 = icmp sge i32 %28, 5003
  br i1 %29, label %30, label %34

; <label>:30:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 3)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 3)
  %32 = load i32, i32* %5, align 4
  %33 = sub nsw i32 %32, 5003
  store i32 %33, i32* %5, align 4
  br label %34

; <label>:34:                                     ; preds = %30, %20
  %35 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %36 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %35, i32 0, i32 7
  %37 = load i16, i16* %36, align 4
  %38 = sext i16 %37 to i64
  %39 = shl i64 %38, 8
  %40 = load i32, i32* %4, align 4
  %41 = sext i32 %40 to i64
  %42 = or i64 %39, %41
  store i64 %42, i64* %7, align 8
  %43 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %44 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %43, i32 0, i32 12
  %45 = load i16*, i16** %44, align 8
  %46 = load i32, i32* %5, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i16, i16* %45, i64 %47
  %49 = load i16, i16* %48, align 2
  %50 = sext i16 %49 to i32
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %128

; <label>:52:                                     ; preds = %34
  %53 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %54 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %53, i32 0, i32 13
  %55 = load i64*, i64** %54, align 8
  %56 = load i32, i32* %5, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i64, i64* %55, i64 %57
  %59 = load i64, i64* %58, align 8
  %60 = load i64, i64* %7, align 8
  %61 = icmp eq i64 %59, %60
  br i1 %61, label %62, label %73

; <label>:62:                                     ; preds = %52
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 4)
  %63 = add i64 %pgocount2, 1
  store i64 %63, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 4)
  %64 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %65 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %64, i32 0, i32 12
  %66 = load i16*, i16** %65, align 8
  %67 = load i32, i32* %5, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i16, i16* %66, i64 %68
  %70 = load i16, i16* %69, align 2
  %71 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %72 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %71, i32 0, i32 7
  store i16 %70, i16* %72, align 4
  br label %165

; <label>:73:                                     ; preds = %52
  %74 = load i32, i32* %5, align 4
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %78

; <label>:76:                                     ; preds = %73
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 9)
  %77 = add i64 %pgocount3, 1
  store i64 %77, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 9)
  store i32 1, i32* %6, align 4
  br label %81

; <label>:78:                                     ; preds = %73
  %79 = load i32, i32* %5, align 4
  %80 = sub nsw i32 5003, %79
  store i32 %80, i32* %6, align 4
  br label %81

; <label>:81:                                     ; preds = %78, %76
  br label %82

; <label>:82:                                     ; preds = %124, %81
  %83 = load i32, i32* %6, align 4
  %84 = load i32, i32* %5, align 4
  %85 = sub nsw i32 %84, %83
  store i32 %85, i32* %5, align 4
  %86 = load i32, i32* %5, align 4
  %87 = icmp slt i32 %86, 0
  br i1 %87, label %88, label %92

; <label>:88:                                     ; preds = %82
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 1)
  %89 = add i64 %pgocount4, 1
  store i64 %89, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 1)
  %90 = load i32, i32* %5, align 4
  %91 = add nsw i32 %90, 5003
  store i32 %91, i32* %5, align 4
  br label %92

; <label>:92:                                     ; preds = %88, %82
  %93 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %94 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %93, i32 0, i32 12
  %95 = load i16*, i16** %94, align 8
  %96 = load i32, i32* %5, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i16, i16* %95, i64 %97
  %99 = load i16, i16* %98, align 2
  %100 = sext i16 %99 to i32
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %102, label %103

; <label>:102:                                    ; preds = %92
  br label %126

; <label>:103:                                    ; preds = %92
  %104 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %105 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %104, i32 0, i32 13
  %106 = load i64*, i64** %105, align 8
  %107 = load i32, i32* %5, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i64, i64* %106, i64 %108
  %110 = load i64, i64* %109, align 8
  %111 = load i64, i64* %7, align 8
  %112 = icmp eq i64 %110, %111
  br i1 %112, label %113, label %124

; <label>:113:                                    ; preds = %103
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 7)
  %114 = add i64 %pgocount5, 1
  store i64 %114, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 7)
  %115 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %116 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %115, i32 0, i32 12
  %117 = load i16*, i16** %116, align 8
  %118 = load i32, i32* %5, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i16, i16* %117, i64 %119
  %121 = load i16, i16* %120, align 2
  %122 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %123 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %122, i32 0, i32 7
  store i16 %121, i16* %123, align 4
  br label %165

; <label>:124:                                    ; preds = %103
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 0)
  %125 = add i64 %pgocount6, 1
  store i64 %125, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 0)
  br label %82

; <label>:126:                                    ; preds = %102
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 8)
  %127 = add i64 %pgocount7, 1
  store i64 %127, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 8)
  br label %128

; <label>:128:                                    ; preds = %126, %34
  %129 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %130 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %131 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %130, i32 0, i32 7
  %132 = load i16, i16* %131, align 4
  call void @output(%struct.gif_dest_struct* %129, i16 signext %132)
  %133 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %134 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %133, i32 0, i32 11
  %135 = load i16, i16* %134, align 8
  %136 = sext i16 %135 to i32
  %137 = icmp slt i32 %136, 4096
  br i1 %137, label %138, label %157

; <label>:138:                                    ; preds = %128
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 5)
  %139 = add i64 %pgocount8, 1
  store i64 %139, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 5)
  %140 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %141 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %140, i32 0, i32 11
  %142 = load i16, i16* %141, align 8
  %143 = add i16 %142, 1
  store i16 %143, i16* %141, align 8
  %144 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %145 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %144, i32 0, i32 12
  %146 = load i16*, i16** %145, align 8
  %147 = load i32, i32* %5, align 4
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i16, i16* %146, i64 %148
  store i16 %142, i16* %149, align 2
  %150 = load i64, i64* %7, align 8
  %151 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %152 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %151, i32 0, i32 13
  %153 = load i64*, i64** %152, align 8
  %154 = load i32, i32* %5, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i64, i64* %153, i64 %155
  store i64 %150, i64* %156, align 8
  br label %160

; <label>:157:                                    ; preds = %128
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 6)
  %158 = add i64 %pgocount9, 1
  store i64 %158, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_compress_byte, i64 0, i64 6)
  %159 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  call void @clear_block(%struct.gif_dest_struct* %159)
  br label %160

; <label>:160:                                    ; preds = %157, %138
  %161 = load i32, i32* %4, align 4
  %162 = trunc i32 %161 to i16
  %163 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %164 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %163, i32 0, i32 7
  store i16 %162, i16* %164, align 4
  br label %165

; <label>:165:                                    ; preds = %160, %113, %62, %12
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @clear_block(%struct.gif_dest_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_clear_block, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_clear_block, i64 0, i64 0)
  %3 = alloca %struct.gif_dest_struct*, align 8
  store %struct.gif_dest_struct* %0, %struct.gif_dest_struct** %3, align 8
  %4 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  call void @clear_hash(%struct.gif_dest_struct* %4)
  %5 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %6 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %5, i32 0, i32 9
  %7 = load i16, i16* %6, align 4
  %8 = sext i16 %7 to i32
  %9 = add nsw i32 %8, 2
  %10 = trunc i32 %9 to i16
  %11 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %12 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %11, i32 0, i32 11
  store i16 %10, i16* %12, align 8
  %13 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %14 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %15 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %14, i32 0, i32 9
  %16 = load i16, i16* %15, align 4
  call void @output(%struct.gif_dest_struct* %13, i16 signext %16)
  %17 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %18 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %17, i32 0, i32 4
  %19 = load i32, i32* %18, align 8
  %20 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %21 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %20, i32 0, i32 2
  store i32 %19, i32* %21, align 8
  %22 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %23 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %22, i32 0, i32 2
  %24 = load i32, i32* %23, align 8
  %25 = shl i32 1, %24
  %26 = sub nsw i32 %25, 1
  %27 = trunc i32 %26 to i16
  %28 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %3, align 8
  %29 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %28, i32 0, i32 3
  store i16 %27, i16* %29, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @compress_term(%struct.gif_dest_struct*) #0 {
  %2 = alloca %struct.gif_dest_struct*, align 8
  store %struct.gif_dest_struct* %0, %struct.gif_dest_struct** %2, align 8
  %3 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %4 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %3, i32 0, i32 8
  %5 = load i32, i32* %4, align 8
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %13, label %7

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_compress_term, i64 0, i64 2)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_compress_term, i64 0, i64 2)
  %9 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %10 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %11 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %10, i32 0, i32 7
  %12 = load i16, i16* %11, align 4
  call void @output(%struct.gif_dest_struct* %9, i16 signext %12)
  br label %13

; <label>:13:                                     ; preds = %7, %1
  %14 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %15 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %16 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %15, i32 0, i32 10
  %17 = load i16, i16* %16, align 2
  call void @output(%struct.gif_dest_struct* %14, i16 signext %17)
  %18 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %19 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %18, i32 0, i32 6
  %20 = load i32, i32* %19, align 8
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %22, label %45

; <label>:22:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_compress_term, i64 0, i64 1)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_compress_term, i64 0, i64 1)
  %24 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %25 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %24, i32 0, i32 5
  %26 = load i64, i64* %25, align 8
  %27 = and i64 %26, 255
  %28 = trunc i64 %27 to i8
  %29 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %30 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %29, i32 0, i32 15
  %31 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %32 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %31, i32 0, i32 14
  %33 = load i32, i32* %32, align 8
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %32, align 8
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [256 x i8], [256 x i8]* %30, i64 0, i64 %35
  store i8 %28, i8* %36, align 1
  %37 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  %38 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %37, i32 0, i32 14
  %39 = load i32, i32* %38, align 8
  %40 = icmp sge i32 %39, 255
  br i1 %40, label %41, label %44

; <label>:41:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_compress_term, i64 0, i64 3)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_compress_term, i64 0, i64 3)
  %43 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  call void @flush_packet(%struct.gif_dest_struct* %43)
  br label %44

; <label>:44:                                     ; preds = %41, %22
  br label %45

; <label>:45:                                     ; preds = %44, %13
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_compress_term, i64 0, i64 0)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_compress_term, i64 0, i64 0)
  %47 = load %struct.gif_dest_struct*, %struct.gif_dest_struct** %2, align 8
  call void @flush_packet(%struct.gif_dest_struct* %47)
  ret void
}

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #4

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

; ModuleID = 'rdgif.2.ll'
source_filename = "rdgif.c"
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
%struct.gif_source_struct = type { %struct.cjpeg_source_struct, %struct.jpeg_compress_struct*, i8**, [260 x i8], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i16*, i8*, i8*, i8*, i32, %struct.jvirt_sarray_control*, i32, i32, i32, i32 }
%struct.cdjpeg_progress_mgr = type { %struct.jpeg_progress_mgr, i32, i32, i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_read_gif = private constant [14 x i8] c"jinit_read_gif"
@__profn_tmp1.ll_start_input_gif = private constant [23 x i8] c"tmp1.ll:start_input_gif"
@__profn_tmp1.ll_finish_input_gif = private constant [24 x i8] c"tmp1.ll:finish_input_gif"
@__profn_tmp1.ll_ReadColorMap = private constant [20 x i8] c"tmp1.ll:ReadColorMap"
@__profn_tmp1.ll_ReadByte = private constant [16 x i8] c"tmp1.ll:ReadByte"
@__profn_tmp1.ll_DoExtension = private constant [19 x i8] c"tmp1.ll:DoExtension"
@__profn_tmp1.ll_InitLZWCode = private constant [19 x i8] c"tmp1.ll:InitLZWCode"
@__profn_tmp1.ll_load_interlaced_image = private constant [29 x i8] c"tmp1.ll:load_interlaced_image"
@__profn_tmp1.ll_get_pixel_rows = private constant [22 x i8] c"tmp1.ll:get_pixel_rows"
@__profn_tmp1.ll_SkipDataBlocks = private constant [22 x i8] c"tmp1.ll:SkipDataBlocks"
@__profn_tmp1.ll_GetDataBlock = private constant [20 x i8] c"tmp1.ll:GetDataBlock"
@__profn_tmp1.ll_ReInitLZW = private constant [17 x i8] c"tmp1.ll:ReInitLZW"
@__profn_tmp1.ll_LZWReadByte = private constant [19 x i8] c"tmp1.ll:LZWReadByte"
@__profn_tmp1.ll_get_interlaced_row = private constant [26 x i8] c"tmp1.ll:get_interlaced_row"
@__profn_tmp1.ll_GetCode = private constant [15 x i8] c"tmp1.ll:GetCode"
@__profc_jinit_read_gif = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_read_gif = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_read_gif = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -682251662960783022, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_read_gif, i32 0, i32 0), i8* bitcast (%struct.cjpeg_source_struct* (%struct.jpeg_compress_struct*)* @jinit_read_gif to i8*), i8* bitcast ([1 x i64]* @__profvp_jinit_read_gif to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_input_gif = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_input_gif = private global [16 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_input_gif = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 414224315035287957, i64 4503898185231515, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @start_input_gif to i8*), i8* bitcast ([16 x i64]* @__profvp_tmp1.ll_start_input_gif to i8*), i32 24, [1 x i16] [i16 16] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_input_gif = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_finish_input_gif = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8624819646608373862, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_input_gif, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @finish_input_gif to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_ReadColorMap = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_ReadColorMap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2708714781773292981, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_ReadColorMap, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_ReadByte = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_ReadByte = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_ReadByte = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7566691694266907758, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_ReadByte, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_ReadByte to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_DoExtension = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_DoExtension = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_DoExtension = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8988966987576228184, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_DoExtension, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_DoExtension to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_InitLZWCode = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_InitLZWCode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1055405963111082745, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_InitLZWCode, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_load_interlaced_image = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_load_interlaced_image = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_load_interlaced_image = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7857280964718392917, i64 563030078947942, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_load_interlaced_image, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @load_interlaced_image to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_load_interlaced_image to i8*), i32 5, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_pixel_rows = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_get_pixel_rows = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8261022567341666131, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_pixel_rows, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_pixel_rows to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_SkipDataBlocks = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_SkipDataBlocks = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9196974279318751041, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_SkipDataBlocks, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_GetDataBlock = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_GetDataBlock = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_GetDataBlock = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7516607760931779757, i64 281513375641241, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_GetDataBlock, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_GetDataBlock to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_ReInitLZW = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_ReInitLZW = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1058062648477697083, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_ReInitLZW, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LZWReadByte = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_LZWReadByte = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_LZWReadByte = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2163061749021158692, i64 844616814838101, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i32 0, i32 0), i8* null, i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_LZWReadByte to i8*), i32 14, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_interlaced_row = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_interlaced_row = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_interlaced_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1685546829641442028, i64 281546114554348, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_get_interlaced_row, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_interlaced_row to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_get_interlaced_row to i8*), i32 6, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_GetCode = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_GetCode = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_GetCode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1101625294154738935, i64 563007488338342, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_GetCode, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_GetCode to i8*), i32 4, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [28 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [322 x i8] c"\BF\02\00jinit_read_gif\01tmp1.ll:start_input_gif\01tmp1.ll:finish_input_gif\01tmp1.ll:ReadColorMap\01tmp1.ll:ReadByte\01tmp1.ll:DoExtension\01tmp1.ll:InitLZWCode\01tmp1.ll:load_interlaced_image\01tmp1.ll:get_pixel_rows\01tmp1.ll:SkipDataBlocks\01tmp1.ll:GetDataBlock\01tmp1.ll:ReInitLZW\01tmp1.ll:LZWReadByte\01tmp1.ll:get_interlaced_row\01tmp1.ll:GetCode", section "__llvm_prf_names"
@llvm.used = appending global [17 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_read_gif to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_gif to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_input_gif to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_ReadColorMap to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_ReadByte to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_DoExtension to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_InitLZWCode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_load_interlaced_image to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_pixel_rows to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_SkipDataBlocks to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_GetDataBlock to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_ReInitLZW to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LZWReadByte to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_interlaced_row to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_GetCode to i8*), i8* bitcast ([28 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([322 x i8], [322 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define %struct.cjpeg_source_struct* @jinit_read_gif(%struct.jpeg_compress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_read_gif, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_read_gif, i64 0, i64 0)
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.gif_source_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 1
  %7 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %7, i32 0, i32 0
  %9 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %8, align 8
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %11 = bitcast %struct.jpeg_compress_struct* %10 to %struct.jpeg_common_struct*
  %12 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %9 to i64
  call void @__llvm_profile_instrument_target(i64 %12, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_read_gif to i8*), i32 0)
  %13 = call i8* %9(%struct.jpeg_common_struct* %11, i32 1, i64 440)
  %14 = bitcast i8* %13 to %struct.gif_source_struct*
  store %struct.gif_source_struct* %14, %struct.gif_source_struct** %4, align 8
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %16 = load %struct.gif_source_struct*, %struct.gif_source_struct** %4, align 8
  %17 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %16, i32 0, i32 1
  store %struct.jpeg_compress_struct* %15, %struct.jpeg_compress_struct** %17, align 8
  %18 = load %struct.gif_source_struct*, %struct.gif_source_struct** %4, align 8
  %19 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %18, i32 0, i32 0
  %20 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %19, i32 0, i32 0
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @start_input_gif, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %20, align 8
  %21 = load %struct.gif_source_struct*, %struct.gif_source_struct** %4, align 8
  %22 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %21, i32 0, i32 0
  %23 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %22, i32 0, i32 2
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @finish_input_gif, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %23, align 8
  %24 = load %struct.gif_source_struct*, %struct.gif_source_struct** %4, align 8
  %25 = bitcast %struct.gif_source_struct* %24 to %struct.cjpeg_source_struct*
  ret %struct.cjpeg_source_struct* %25
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_input_gif(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct.gif_source_struct*, align 8
  %6 = alloca [10 x i8], align 1
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32*, align 8
  %13 = alloca %struct.cdjpeg_progress_mgr*, align 8
  %14 = alloca i32*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %15 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %16 = bitcast %struct.cjpeg_source_struct* %15 to %struct.gif_source_struct*
  store %struct.gif_source_struct* %16, %struct.gif_source_struct** %5, align 8
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %17, i32 0, i32 1
  %19 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %19, i32 0, i32 2
  %21 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %20, align 8
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %23 = bitcast %struct.jpeg_compress_struct* %22 to %struct.jpeg_common_struct*
  %24 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %21 to i64
  call void @__llvm_profile_instrument_target(i64 %24, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_gif to i8*), i32 0)
  %25 = call i8** %21(%struct.jpeg_common_struct* %23, i32 1, i32 256, i32 3)
  %26 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %27 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %26, i32 0, i32 2
  store i8** %25, i8*** %27, align 8
  %28 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i32 0, i32 0
  %29 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %30 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %29, i32 0, i32 0
  %31 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %30, i32 0, i32 3
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %31, align 8
  %33 = call i64 @fread(i8* %28, i64 1, i64 6, %struct._IO_FILE* %32)
  %34 = icmp eq i64 %33, 6
  br i1 %34, label %49, label %35

; <label>:35:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 9)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 9)
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %37, i32 0, i32 0
  %39 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %40 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %39, i32 0, i32 5
  store i32 1016, i32* %40, align 8
  %41 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %41, i32 0, i32 0
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i32 0, i32 0
  %45 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %44, align 8
  %46 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %47 = bitcast %struct.jpeg_compress_struct* %46 to %struct.jpeg_common_struct*
  %48 = ptrtoint void (%struct.jpeg_common_struct*)* %45 to i64
  call void @__llvm_profile_instrument_target(i64 %48, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_gif to i8*), i32 1)
  call void %45(%struct.jpeg_common_struct* %47)
  br label %49

; <label>:49:                                     ; preds = %35, %2
  %50 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 0
  %51 = load i8, i8* %50, align 1
  %52 = sext i8 %51 to i32
  %53 = icmp ne i32 %52, 71
  br i1 %53, label %66, label %54

; <label>:54:                                     ; preds = %49
  %pgocount1 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 10)
  %55 = add i64 %pgocount1, 1
  store i64 %55, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 10)
  %56 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 1
  %57 = load i8, i8* %56, align 1
  %58 = sext i8 %57 to i32
  %59 = icmp ne i32 %58, 73
  br i1 %59, label %66, label %60

; <label>:60:                                     ; preds = %54
  %pgocount2 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 21)
  %61 = add i64 %pgocount2, 1
  store i64 %61, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 21)
  %62 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 2
  %63 = load i8, i8* %62, align 1
  %64 = sext i8 %63 to i32
  %65 = icmp ne i32 %64, 70
  br i1 %65, label %66, label %80

; <label>:66:                                     ; preds = %60, %54, %49
  %pgocount3 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 4)
  %67 = add i64 %pgocount3, 1
  store i64 %67, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 4)
  %68 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %69 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %68, i32 0, i32 0
  %70 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %69, align 8
  %71 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %70, i32 0, i32 5
  store i32 1016, i32* %71, align 8
  %72 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %73 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %72, i32 0, i32 0
  %74 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %73, align 8
  %75 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %74, i32 0, i32 0
  %76 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %75, align 8
  %77 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %78 = bitcast %struct.jpeg_compress_struct* %77 to %struct.jpeg_common_struct*
  %79 = ptrtoint void (%struct.jpeg_common_struct*)* %76 to i64
  call void @__llvm_profile_instrument_target(i64 %79, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_gif to i8*), i32 2)
  call void %76(%struct.jpeg_common_struct* %78)
  br label %80

; <label>:80:                                     ; preds = %66, %60
  %81 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 3
  %82 = load i8, i8* %81, align 1
  %83 = sext i8 %82 to i32
  %84 = icmp ne i32 %83, 56
  br i1 %84, label %97, label %85

; <label>:85:                                     ; preds = %80
  %pgocount4 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 11)
  %86 = add i64 %pgocount4, 1
  store i64 %86, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 11)
  %87 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 4
  %88 = load i8, i8* %87, align 1
  %89 = sext i8 %88 to i32
  %90 = icmp ne i32 %89, 55
  br i1 %90, label %97, label %91

; <label>:91:                                     ; preds = %85
  %pgocount5 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 22)
  %92 = add i64 %pgocount5, 1
  store i64 %92, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 22)
  %93 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 5
  %94 = load i8, i8* %93, align 1
  %95 = sext i8 %94 to i32
  %96 = icmp ne i32 %95, 97
  br i1 %96, label %97, label %152

; <label>:97:                                     ; preds = %91, %85, %80
  %98 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 3
  %99 = load i8, i8* %98, align 1
  %100 = sext i8 %99 to i32
  %101 = icmp ne i32 %100, 56
  br i1 %101, label %115, label %102

; <label>:102:                                    ; preds = %97
  %pgocount6 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 17)
  %103 = add i64 %pgocount6, 1
  store i64 %103, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 17)
  %104 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 4
  %105 = load i8, i8* %104, align 1
  %106 = sext i8 %105 to i32
  %107 = icmp ne i32 %106, 57
  br i1 %107, label %115, label %108

; <label>:108:                                    ; preds = %102
  %pgocount7 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 23)
  %109 = add i64 %pgocount7, 1
  store i64 %109, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 23)
  %110 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 5
  %111 = load i8, i8* %110, align 1
  %112 = sext i8 %111 to i32
  %113 = icmp ne i32 %112, 97
  br i1 %113, label %115, label %._crit_edge

._crit_edge:                                      ; preds = %108
  %pgocount8 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 0)
  %114 = add i64 %pgocount8, 1
  store i64 %114, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 0)
  br label %152

; <label>:115:                                    ; preds = %108, %102, %97
  br label %116

; <label>:116:                                    ; preds = %115
  %117 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %118 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %117, i32 0, i32 0
  %119 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %118, align 8
  %120 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %119, i32 0, i32 6
  %121 = bitcast %union.anon* %120 to [8 x i32]*
  %122 = getelementptr inbounds [8 x i32], [8 x i32]* %121, i32 0, i32 0
  store i32* %122, i32** %12, align 8
  %123 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 3
  %124 = load i8, i8* %123, align 1
  %125 = sext i8 %124 to i32
  %126 = load i32*, i32** %12, align 8
  %127 = getelementptr inbounds i32, i32* %126, i64 0
  store i32 %125, i32* %127, align 4
  %128 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 4
  %129 = load i8, i8* %128, align 1
  %130 = sext i8 %129 to i32
  %131 = load i32*, i32** %12, align 8
  %132 = getelementptr inbounds i32, i32* %131, i64 1
  store i32 %130, i32* %132, align 4
  %133 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 5
  %134 = load i8, i8* %133, align 1
  %135 = sext i8 %134 to i32
  %136 = load i32*, i32** %12, align 8
  %137 = getelementptr inbounds i32, i32* %136, i64 2
  store i32 %135, i32* %137, align 4
  %138 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %139 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %138, i32 0, i32 0
  %140 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %139, align 8
  %141 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %140, i32 0, i32 5
  store i32 1018, i32* %141, align 8
  %142 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %143 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %142, i32 0, i32 0
  %144 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %143, align 8
  %145 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %144, i32 0, i32 1
  %146 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %145, align 8
  %147 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %148 = bitcast %struct.jpeg_compress_struct* %147 to %struct.jpeg_common_struct*
  %149 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %146 to i64
  call void @__llvm_profile_instrument_target(i64 %149, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_gif to i8*), i32 3)
  call void %146(%struct.jpeg_common_struct* %148, i32 1)
  br label %150

; <label>:150:                                    ; preds = %116
  %pgocount9 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 5)
  %151 = add i64 %pgocount9, 1
  store i64 %151, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 5)
  br label %152

; <label>:152:                                    ; preds = %150, %._crit_edge, %91
  %153 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i32 0, i32 0
  %154 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %155 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %154, i32 0, i32 0
  %156 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %155, i32 0, i32 3
  %157 = load %struct._IO_FILE*, %struct._IO_FILE** %156, align 8
  %158 = call i64 @fread(i8* %153, i64 1, i64 7, %struct._IO_FILE* %157)
  %159 = icmp eq i64 %158, 7
  br i1 %159, label %174, label %160

; <label>:160:                                    ; preds = %152
  %pgocount10 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 12)
  %161 = add i64 %pgocount10, 1
  store i64 %161, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 12)
  %162 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %163 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %162, i32 0, i32 0
  %164 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %163, align 8
  %165 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %164, i32 0, i32 5
  store i32 42, i32* %165, align 8
  %166 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %167 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %166, i32 0, i32 0
  %168 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %167, align 8
  %169 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %168, i32 0, i32 0
  %170 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %169, align 8
  %171 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %172 = bitcast %struct.jpeg_compress_struct* %171 to %struct.jpeg_common_struct*
  %173 = ptrtoint void (%struct.jpeg_common_struct*)* %170 to i64
  call void @__llvm_profile_instrument_target(i64 %173, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_gif to i8*), i32 4)
  call void %170(%struct.jpeg_common_struct* %172)
  br label %174

; <label>:174:                                    ; preds = %160, %152
  %175 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 1
  %176 = load i8, i8* %175, align 1
  %177 = sext i8 %176 to i32
  %178 = and i32 %177, 255
  %179 = shl i32 %178, 8
  %180 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 0
  %181 = load i8, i8* %180, align 1
  %182 = sext i8 %181 to i32
  %183 = and i32 %182, 255
  %184 = or i32 %179, %183
  store i32 %184, i32* %7, align 4
  %185 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 3
  %186 = load i8, i8* %185, align 1
  %187 = sext i8 %186 to i32
  %188 = and i32 %187, 255
  %189 = shl i32 %188, 8
  %190 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 2
  %191 = load i8, i8* %190, align 1
  %192 = sext i8 %191 to i32
  %193 = and i32 %192, 255
  %194 = or i32 %189, %193
  store i32 %194, i32* %8, align 4
  %195 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 4
  %196 = load i8, i8* %195, align 1
  %197 = sext i8 %196 to i32
  %198 = and i32 %197, 7
  %199 = shl i32 2, %198
  store i32 %199, i32* %9, align 4
  %200 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 6
  %201 = load i8, i8* %200, align 1
  %202 = sext i8 %201 to i32
  %203 = and i32 %202, 255
  store i32 %203, i32* %10, align 4
  %204 = load i32, i32* %10, align 4
  %205 = icmp ne i32 %204, 0
  br i1 %205, label %206, label %224

; <label>:206:                                    ; preds = %174
  %pgocount11 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 7)
  %207 = add i64 %pgocount11, 1
  store i64 %207, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 7)
  %208 = load i32, i32* %10, align 4
  %209 = icmp ne i32 %208, 49
  br i1 %209, label %210, label %224

; <label>:210:                                    ; preds = %206
  %pgocount12 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 20)
  %211 = add i64 %pgocount12, 1
  store i64 %211, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 20)
  %212 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %213 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %212, i32 0, i32 0
  %214 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %213, align 8
  %215 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %214, i32 0, i32 5
  store i32 1020, i32* %215, align 8
  %216 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %217 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %216, i32 0, i32 0
  %218 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %217, align 8
  %219 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %218, i32 0, i32 1
  %220 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %219, align 8
  %221 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %222 = bitcast %struct.jpeg_compress_struct* %221 to %struct.jpeg_common_struct*
  %223 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %220 to i64
  call void @__llvm_profile_instrument_target(i64 %223, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_gif to i8*), i32 5)
  call void %220(%struct.jpeg_common_struct* %222, i32 1)
  br label %224

; <label>:224:                                    ; preds = %210, %206, %174
  %225 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 4
  %226 = load i8, i8* %225, align 1
  %227 = sext i8 %226 to i32
  %228 = and i32 %227, 128
  %229 = icmp ne i32 %228, 0
  br i1 %229, label %230, label %237

; <label>:230:                                    ; preds = %224
  %pgocount13 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 13)
  %231 = add i64 %pgocount13, 1
  store i64 %231, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 13)
  %232 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %233 = load i32, i32* %9, align 4
  %234 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %235 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %234, i32 0, i32 2
  %236 = load i8**, i8*** %235, align 8
  call void @ReadColorMap(%struct.gif_source_struct* %232, i32 %233, i8** %236)
  br label %237

; <label>:237:                                    ; preds = %230, %224
  br label %238

; <label>:238:                                    ; preds = %266, %260, %237
  %239 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %240 = call i32 @ReadByte(%struct.gif_source_struct* %239)
  store i32 %240, i32* %11, align 4
  %241 = load i32, i32* %11, align 4
  %242 = icmp eq i32 %241, 59
  br i1 %242, label %243, label %257

; <label>:243:                                    ; preds = %238
  %pgocount14 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 1)
  %244 = add i64 %pgocount14, 1
  store i64 %244, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 1)
  %245 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %246 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %245, i32 0, i32 0
  %247 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %246, align 8
  %248 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %247, i32 0, i32 5
  store i32 1015, i32* %248, align 8
  %249 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %250 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %249, i32 0, i32 0
  %251 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %250, align 8
  %252 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %251, i32 0, i32 0
  %253 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %252, align 8
  %254 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %255 = bitcast %struct.jpeg_compress_struct* %254 to %struct.jpeg_common_struct*
  %256 = ptrtoint void (%struct.jpeg_common_struct*)* %253 to i64
  call void @__llvm_profile_instrument_target(i64 %256, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_gif to i8*), i32 6)
  call void %253(%struct.jpeg_common_struct* %255)
  br label %257

; <label>:257:                                    ; preds = %243, %238
  %258 = load i32, i32* %11, align 4
  %259 = icmp eq i32 %258, 33
  br i1 %259, label %260, label %263

; <label>:260:                                    ; preds = %257
  %pgocount15 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 2)
  %261 = add i64 %pgocount15, 1
  store i64 %261, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 2)
  %262 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  call void @DoExtension(%struct.gif_source_struct* %262)
  br label %238

; <label>:263:                                    ; preds = %257
  %264 = load i32, i32* %11, align 4
  %265 = icmp ne i32 %264, 44
  br i1 %265, label %266, label %287

; <label>:266:                                    ; preds = %263
  %pgocount16 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 3)
  %267 = add i64 %pgocount16, 1
  store i64 %267, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 3)
  %268 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %269 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %268, i32 0, i32 0
  %270 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %269, align 8
  %271 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %270, i32 0, i32 5
  store i32 1022, i32* %271, align 8
  %272 = load i32, i32* %11, align 4
  %273 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %274 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %273, i32 0, i32 0
  %275 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %274, align 8
  %276 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %275, i32 0, i32 6
  %277 = bitcast %union.anon* %276 to [8 x i32]*
  %278 = getelementptr inbounds [8 x i32], [8 x i32]* %277, i64 0, i64 0
  store i32 %272, i32* %278, align 4
  %279 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %280 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %279, i32 0, i32 0
  %281 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %280, align 8
  %282 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %281, i32 0, i32 1
  %283 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %282, align 8
  %284 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %285 = bitcast %struct.jpeg_compress_struct* %284 to %struct.jpeg_common_struct*
  %286 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %283 to i64
  call void @__llvm_profile_instrument_target(i64 %286, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_gif to i8*), i32 7)
  call void %283(%struct.jpeg_common_struct* %285, i32 -1)
  br label %238

; <label>:287:                                    ; preds = %263
  %288 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i32 0, i32 0
  %289 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %290 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %289, i32 0, i32 0
  %291 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %290, i32 0, i32 3
  %292 = load %struct._IO_FILE*, %struct._IO_FILE** %291, align 8
  %293 = call i64 @fread(i8* %288, i64 1, i64 9, %struct._IO_FILE* %292)
  %294 = icmp eq i64 %293, 9
  br i1 %294, label %309, label %295

; <label>:295:                                    ; preds = %287
  %pgocount17 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 14)
  %296 = add i64 %pgocount17, 1
  store i64 %296, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 14)
  %297 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %298 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %297, i32 0, i32 0
  %299 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %298, align 8
  %300 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %299, i32 0, i32 5
  store i32 42, i32* %300, align 8
  %301 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %302 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %301, i32 0, i32 0
  %303 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %302, align 8
  %304 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %303, i32 0, i32 0
  %305 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %304, align 8
  %306 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %307 = bitcast %struct.jpeg_compress_struct* %306 to %struct.jpeg_common_struct*
  %308 = ptrtoint void (%struct.jpeg_common_struct*)* %305 to i64
  call void @__llvm_profile_instrument_target(i64 %308, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_gif to i8*), i32 8)
  call void %305(%struct.jpeg_common_struct* %307)
  br label %309

; <label>:309:                                    ; preds = %295, %287
  %310 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 5
  %311 = load i8, i8* %310, align 1
  %312 = sext i8 %311 to i32
  %313 = and i32 %312, 255
  %314 = shl i32 %313, 8
  %315 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 4
  %316 = load i8, i8* %315, align 1
  %317 = sext i8 %316 to i32
  %318 = and i32 %317, 255
  %319 = or i32 %314, %318
  store i32 %319, i32* %7, align 4
  %320 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 7
  %321 = load i8, i8* %320, align 1
  %322 = sext i8 %321 to i32
  %323 = and i32 %322, 255
  %324 = shl i32 %323, 8
  %325 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 6
  %326 = load i8, i8* %325, align 1
  %327 = sext i8 %326 to i32
  %328 = and i32 %327, 255
  %329 = or i32 %324, %328
  store i32 %329, i32* %8, align 4
  %330 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 8
  %331 = load i8, i8* %330, align 1
  %332 = sext i8 %331 to i32
  %333 = and i32 %332, 64
  %334 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %335 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %334, i32 0, i32 21
  store i32 %333, i32* %335, align 8
  %336 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 8
  %337 = load i8, i8* %336, align 1
  %338 = sext i8 %337 to i32
  %339 = and i32 %338, 128
  %340 = icmp ne i32 %339, 0
  br i1 %340, label %341, label %353

; <label>:341:                                    ; preds = %309
  %pgocount18 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 15)
  %342 = add i64 %pgocount18, 1
  store i64 %342, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 15)
  %343 = getelementptr inbounds [10 x i8], [10 x i8]* %6, i64 0, i64 8
  %344 = load i8, i8* %343, align 1
  %345 = sext i8 %344 to i32
  %346 = and i32 %345, 7
  %347 = shl i32 2, %346
  store i32 %347, i32* %9, align 4
  %348 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %349 = load i32, i32* %9, align 4
  %350 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %351 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %350, i32 0, i32 2
  %352 = load i8**, i8*** %351, align 8
  call void @ReadColorMap(%struct.gif_source_struct* %348, i32 %349, i8** %352)
  br label %353

; <label>:353:                                    ; preds = %341, %309
  %354 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %355 = call i32 @ReadByte(%struct.gif_source_struct* %354)
  %356 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %357 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %356, i32 0, i32 8
  store i32 %355, i32* %357, align 4
  %358 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %359 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %358, i32 0, i32 8
  %360 = load i32, i32* %359, align 4
  %361 = icmp slt i32 %360, 2
  br i1 %361, label %368, label %362

; <label>:362:                                    ; preds = %353
  %pgocount19 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 16)
  %363 = add i64 %pgocount19, 1
  store i64 %363, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 16)
  %364 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %365 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %364, i32 0, i32 8
  %366 = load i32, i32* %365, align 4
  %367 = icmp sge i32 %366, 12
  br i1 %367, label %368, label %391

; <label>:368:                                    ; preds = %362, %353
  %pgocount20 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 6)
  %369 = add i64 %pgocount20, 1
  store i64 %369, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 6)
  %370 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %371 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %370, i32 0, i32 0
  %372 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %371, align 8
  %373 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %372, i32 0, i32 5
  store i32 1013, i32* %373, align 8
  %374 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %375 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %374, i32 0, i32 8
  %376 = load i32, i32* %375, align 4
  %377 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %378 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %377, i32 0, i32 0
  %379 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %378, align 8
  %380 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %379, i32 0, i32 6
  %381 = bitcast %union.anon* %380 to [8 x i32]*
  %382 = getelementptr inbounds [8 x i32], [8 x i32]* %381, i64 0, i64 0
  store i32 %376, i32* %382, align 4
  %383 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %384 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %383, i32 0, i32 0
  %385 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %384, align 8
  %386 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %385, i32 0, i32 0
  %387 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %386, align 8
  %388 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %389 = bitcast %struct.jpeg_compress_struct* %388 to %struct.jpeg_common_struct*
  %390 = ptrtoint void (%struct.jpeg_common_struct*)* %387 to i64
  call void @__llvm_profile_instrument_target(i64 %390, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_gif to i8*), i32 9)
  call void %387(%struct.jpeg_common_struct* %389)
  br label %391

; <label>:391:                                    ; preds = %368, %362
  br label %392

; <label>:392:                                    ; preds = %391
  %393 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %394 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %393, i32 0, i32 1
  %395 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %394, align 8
  %396 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %395, i32 0, i32 1
  %397 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %396, align 8
  %398 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %399 = bitcast %struct.jpeg_compress_struct* %398 to %struct.jpeg_common_struct*
  %400 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %397 to i64
  call void @__llvm_profile_instrument_target(i64 %400, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_gif to i8*), i32 10)
  %401 = call i8* %397(%struct.jpeg_common_struct* %399, i32 1, i64 8192)
  %402 = bitcast i8* %401 to i16*
  %403 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %404 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %403, i32 0, i32 17
  store i16* %402, i16** %404, align 8
  %405 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %406 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %405, i32 0, i32 1
  %407 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %406, align 8
  %408 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %407, i32 0, i32 1
  %409 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %408, align 8
  %410 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %411 = bitcast %struct.jpeg_compress_struct* %410 to %struct.jpeg_common_struct*
  %412 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %409 to i64
  call void @__llvm_profile_instrument_target(i64 %412, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_gif to i8*), i32 11)
  %413 = call i8* %409(%struct.jpeg_common_struct* %411, i32 1, i64 4096)
  %414 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %415 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %414, i32 0, i32 18
  store i8* %413, i8** %415, align 8
  %416 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %417 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %416, i32 0, i32 1
  %418 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %417, align 8
  %419 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %418, i32 0, i32 1
  %420 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %419, align 8
  %421 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %422 = bitcast %struct.jpeg_compress_struct* %421 to %struct.jpeg_common_struct*
  %423 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %420 to i64
  call void @__llvm_profile_instrument_target(i64 %423, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_gif to i8*), i32 12)
  %424 = call i8* %420(%struct.jpeg_common_struct* %422, i32 1, i64 4096)
  %425 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %426 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %425, i32 0, i32 19
  store i8* %424, i8** %426, align 8
  %427 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  call void @InitLZWCode(%struct.gif_source_struct* %427)
  %428 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %429 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %428, i32 0, i32 21
  %430 = load i32, i32* %429, align 8
  %431 = icmp ne i32 %430, 0
  br i1 %431, label %432, label %465

; <label>:432:                                    ; preds = %392
  %433 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %434 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %433, i32 0, i32 1
  %435 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %434, align 8
  %436 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %435, i32 0, i32 4
  %437 = load %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %436, align 8
  %438 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %439 = bitcast %struct.jpeg_compress_struct* %438 to %struct.jpeg_common_struct*
  %440 = load i32, i32* %7, align 4
  %441 = load i32, i32* %8, align 4
  %442 = ptrtoint %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)* %437 to i64
  call void @__llvm_profile_instrument_target(i64 %442, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_gif to i8*), i32 13)
  %443 = call %struct.jvirt_sarray_control* %437(%struct.jpeg_common_struct* %439, i32 1, i32 0, i32 %440, i32 %441, i32 1)
  %444 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %445 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %444, i32 0, i32 22
  store %struct.jvirt_sarray_control* %443, %struct.jvirt_sarray_control** %445, align 8
  %446 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %447 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %446, i32 0, i32 2
  %448 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %447, align 8
  %449 = icmp ne %struct.jpeg_progress_mgr* %448, null
  br i1 %449, label %450, label %460

; <label>:450:                                    ; preds = %432
  %pgocount21 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 18)
  %451 = add i64 %pgocount21, 1
  store i64 %451, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 18)
  %452 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %453 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %452, i32 0, i32 2
  %454 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %453, align 8
  %455 = bitcast %struct.jpeg_progress_mgr* %454 to %struct.cdjpeg_progress_mgr*
  store %struct.cdjpeg_progress_mgr* %455, %struct.cdjpeg_progress_mgr** %13, align 8
  %456 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %13, align 8
  %457 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %456, i32 0, i32 2
  %458 = load i32, i32* %457, align 4
  %459 = add nsw i32 %458, 1
  store i32 %459, i32* %457, align 4
  br label %460

; <label>:460:                                    ; preds = %450, %432
  %pgocount22 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 8)
  %461 = add i64 %pgocount22, 1
  store i64 %461, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 8)
  %462 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %463 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %462, i32 0, i32 0
  %464 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %463, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @load_interlaced_image, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %464, align 8
  br label %470

; <label>:465:                                    ; preds = %392
  %pgocount23 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 19)
  %466 = add i64 %pgocount23, 1
  store i64 %466, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_start_input_gif, i64 0, i64 19)
  %467 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %468 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %467, i32 0, i32 0
  %469 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %468, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_pixel_rows, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %469, align 8
  br label %470

; <label>:470:                                    ; preds = %465, %460
  %471 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %472 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %471, i32 0, i32 1
  %473 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %472, align 8
  %474 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %473, i32 0, i32 2
  %475 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %474, align 8
  %476 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %477 = bitcast %struct.jpeg_compress_struct* %476 to %struct.jpeg_common_struct*
  %478 = load i32, i32* %7, align 4
  %479 = mul i32 %478, 3
  %480 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %475 to i64
  call void @__llvm_profile_instrument_target(i64 %480, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_gif to i8*), i32 14)
  %481 = call i8** %475(%struct.jpeg_common_struct* %477, i32 1, i32 %479, i32 1)
  %482 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %483 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %482, i32 0, i32 0
  %484 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %483, i32 0, i32 4
  store i8** %481, i8*** %484, align 8
  %485 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %486 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %485, i32 0, i32 0
  %487 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %486, i32 0, i32 5
  store i32 1, i32* %487, align 8
  %488 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %489 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %488, i32 0, i32 9
  store i32 2, i32* %489, align 4
  %490 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %491 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %490, i32 0, i32 8
  store i32 3, i32* %491, align 8
  %492 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %493 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %492, i32 0, i32 11
  store i32 8, i32* %493, align 8
  %494 = load i32, i32* %7, align 4
  %495 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %496 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %495, i32 0, i32 6
  store i32 %494, i32* %496, align 8
  %497 = load i32, i32* %8, align 4
  %498 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %499 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %498, i32 0, i32 7
  store i32 %497, i32* %499, align 4
  br label %500

; <label>:500:                                    ; preds = %470
  %501 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %502 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %501, i32 0, i32 0
  %503 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %502, align 8
  %504 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %503, i32 0, i32 6
  %505 = bitcast %union.anon* %504 to [8 x i32]*
  %506 = getelementptr inbounds [8 x i32], [8 x i32]* %505, i32 0, i32 0
  store i32* %506, i32** %14, align 8
  %507 = load i32, i32* %7, align 4
  %508 = load i32*, i32** %14, align 8
  %509 = getelementptr inbounds i32, i32* %508, i64 0
  store i32 %507, i32* %509, align 4
  %510 = load i32, i32* %8, align 4
  %511 = load i32*, i32** %14, align 8
  %512 = getelementptr inbounds i32, i32* %511, i64 1
  store i32 %510, i32* %512, align 4
  %513 = load i32, i32* %9, align 4
  %514 = load i32*, i32** %14, align 8
  %515 = getelementptr inbounds i32, i32* %514, i64 2
  store i32 %513, i32* %515, align 4
  %516 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %517 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %516, i32 0, i32 0
  %518 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %517, align 8
  %519 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %518, i32 0, i32 5
  store i32 1017, i32* %519, align 8
  %520 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %521 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %520, i32 0, i32 0
  %522 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %521, align 8
  %523 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %522, i32 0, i32 1
  %524 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %523, align 8
  %525 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %526 = bitcast %struct.jpeg_compress_struct* %525 to %struct.jpeg_common_struct*
  %527 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %524 to i64
  call void @__llvm_profile_instrument_target(i64 %527, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_gif to i8*), i32 15)
  call void %524(%struct.jpeg_common_struct* %526, i32 1)
  br label %528

; <label>:528:                                    ; preds = %500
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_input_gif(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_input_gif, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_input_gif, i64 0, i64 0)
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca %struct.cjpeg_source_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %5, align 8
  ret void
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @ReadColorMap(%struct.gif_source_struct*, i32, i8**) #0 {
  %4 = alloca %struct.gif_source_struct*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8**, align 8
  %7 = alloca i32, align 4
  store %struct.gif_source_struct* %0, %struct.gif_source_struct** %4, align 8
  store i32 %1, i32* %5, align 4
  store i8** %2, i8*** %6, align 8
  store i32 0, i32* %7, align 4
  br label %8

; <label>:8:                                      ; preds = %40, %3
  %9 = load i32, i32* %7, align 4
  %10 = load i32, i32* %5, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %44

; <label>:12:                                     ; preds = %8
  %13 = load %struct.gif_source_struct*, %struct.gif_source_struct** %4, align 8
  %14 = call i32 @ReadByte(%struct.gif_source_struct* %13)
  %15 = trunc i32 %14 to i8
  %16 = load i8**, i8*** %6, align 8
  %17 = getelementptr inbounds i8*, i8** %16, i64 0
  %18 = load i8*, i8** %17, align 8
  %19 = load i32, i32* %7, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i8, i8* %18, i64 %20
  store i8 %15, i8* %21, align 1
  %22 = load %struct.gif_source_struct*, %struct.gif_source_struct** %4, align 8
  %23 = call i32 @ReadByte(%struct.gif_source_struct* %22)
  %24 = trunc i32 %23 to i8
  %25 = load i8**, i8*** %6, align 8
  %26 = getelementptr inbounds i8*, i8** %25, i64 1
  %27 = load i8*, i8** %26, align 8
  %28 = load i32, i32* %7, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8* %27, i64 %29
  store i8 %24, i8* %30, align 1
  %31 = load %struct.gif_source_struct*, %struct.gif_source_struct** %4, align 8
  %32 = call i32 @ReadByte(%struct.gif_source_struct* %31)
  %33 = trunc i32 %32 to i8
  %34 = load i8**, i8*** %6, align 8
  %35 = getelementptr inbounds i8*, i8** %34, i64 2
  %36 = load i8*, i8** %35, align 8
  %37 = load i32, i32* %7, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8* %36, i64 %38
  store i8 %33, i8* %39, align 1
  br label %40

; <label>:40:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_ReadColorMap, i64 0, i64 0)
  %41 = add i64 %pgocount, 1
  store i64 %41, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_ReadColorMap, i64 0, i64 0)
  %42 = load i32, i32* %7, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %7, align 4
  br label %8

; <label>:44:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_ReadColorMap, i64 0, i64 1)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_ReadColorMap, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @ReadByte(%struct.gif_source_struct*) #0 {
  %2 = alloca %struct.gif_source_struct*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i32, align 4
  store %struct.gif_source_struct* %0, %struct.gif_source_struct** %2, align 8
  %5 = load %struct.gif_source_struct*, %struct.gif_source_struct** %2, align 8
  %6 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %5, i32 0, i32 0
  %7 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %6, i32 0, i32 3
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  store %struct._IO_FILE* %8, %struct._IO_FILE** %3, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %10 = call i32 @_IO_getc(%struct._IO_FILE* %9)
  store i32 %10, i32* %4, align 4
  %11 = icmp eq i32 %10, -1
  br i1 %11, label %12, label %32

; <label>:12:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_ReadByte, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_ReadByte, i64 0, i64 1)
  %14 = load %struct.gif_source_struct*, %struct.gif_source_struct** %2, align 8
  %15 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %14, i32 0, i32 1
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 0
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i32 0, i32 5
  store i32 42, i32* %19, align 8
  %20 = load %struct.gif_source_struct*, %struct.gif_source_struct** %2, align 8
  %21 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %20, i32 0, i32 1
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i32 0, i32 0
  %26 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %25, align 8
  %27 = load %struct.gif_source_struct*, %struct.gif_source_struct** %2, align 8
  %28 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %27, i32 0, i32 1
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %28, align 8
  %30 = bitcast %struct.jpeg_compress_struct* %29 to %struct.jpeg_common_struct*
  %31 = ptrtoint void (%struct.jpeg_common_struct*)* %26 to i64
  call void @__llvm_profile_instrument_target(i64 %31, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_ReadByte to i8*), i32 0)
  call void %26(%struct.jpeg_common_struct* %30)
  br label %32

; <label>:32:                                     ; preds = %12, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_ReadByte, i64 0, i64 0)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_ReadByte, i64 0, i64 0)
  %34 = load i32, i32* %4, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind uwtable
define internal void @DoExtension(%struct.gif_source_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_DoExtension, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_DoExtension, i64 0, i64 0)
  %3 = alloca %struct.gif_source_struct*, align 8
  %4 = alloca i32, align 4
  store %struct.gif_source_struct* %0, %struct.gif_source_struct** %3, align 8
  %5 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %6 = call i32 @ReadByte(%struct.gif_source_struct* %5)
  store i32 %6, i32* %4, align 4
  %7 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %8 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %7, i32 0, i32 1
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %9, i32 0, i32 0
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i32 0, i32 5
  store i32 1019, i32* %12, align 8
  %13 = load i32, i32* %4, align 4
  %14 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %15 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %14, i32 0, i32 1
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 0
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i32 0, i32 6
  %20 = bitcast %union.anon* %19 to [8 x i32]*
  %21 = getelementptr inbounds [8 x i32], [8 x i32]* %20, i64 0, i64 0
  store i32 %13, i32* %21, align 4
  %22 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %23 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %22, i32 0, i32 1
  %24 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %24, i32 0, i32 0
  %26 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %26, i32 0, i32 1
  %28 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %27, align 8
  %29 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %30 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %29, i32 0, i32 1
  %31 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %30, align 8
  %32 = bitcast %struct.jpeg_compress_struct* %31 to %struct.jpeg_common_struct*
  %33 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %28 to i64
  call void @__llvm_profile_instrument_target(i64 %33, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_DoExtension to i8*), i32 0)
  call void %28(%struct.jpeg_common_struct* %32, i32 1)
  %34 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  call void @SkipDataBlocks(%struct.gif_source_struct* %34)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @InitLZWCode(%struct.gif_source_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_InitLZWCode, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_InitLZWCode, i64 0, i64 0)
  %3 = alloca %struct.gif_source_struct*, align 8
  store %struct.gif_source_struct* %0, %struct.gif_source_struct** %3, align 8
  %4 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %5 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %4, i32 0, i32 4
  store i32 2, i32* %5, align 4
  %6 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %7 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %6, i32 0, i32 5
  store i32 0, i32* %7, align 8
  %8 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %9 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %8, i32 0, i32 6
  store i32 0, i32* %9, align 4
  %10 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %11 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %10, i32 0, i32 7
  store i32 0, i32* %11, align 8
  %12 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %13 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %12, i32 0, i32 8
  %14 = load i32, i32* %13, align 4
  %15 = shl i32 1, %14
  %16 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %17 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %16, i32 0, i32 9
  store i32 %15, i32* %17, align 8
  %18 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %19 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %18, i32 0, i32 9
  %20 = load i32, i32* %19, align 8
  %21 = add nsw i32 %20, 1
  %22 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %23 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %22, i32 0, i32 10
  store i32 %21, i32* %23, align 4
  %24 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %25 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %24, i32 0, i32 14
  store i32 1, i32* %25, align 4
  %26 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  call void @ReInitLZW(%struct.gif_source_struct* %26)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @load_interlaced_image(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct.gif_source_struct*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.cdjpeg_progress_mgr*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %11 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %12 = bitcast %struct.cjpeg_source_struct* %11 to %struct.gif_source_struct*
  store %struct.gif_source_struct* %12, %struct.gif_source_struct** %5, align 8
  %13 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %13, i32 0, i32 2
  %15 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %14, align 8
  %16 = bitcast %struct.jpeg_progress_mgr* %15 to %struct.cdjpeg_progress_mgr*
  store %struct.cdjpeg_progress_mgr* %16, %struct.cdjpeg_progress_mgr** %10, align 8
  store i32 0, i32* %9, align 4
  br label %17

; <label>:17:                                     ; preds = %82, %2
  %18 = load i32, i32* %9, align 4
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 7
  %21 = load i32, i32* %20, align 4
  %22 = icmp ult i32 %18, %21
  br i1 %22, label %23, label %86

; <label>:23:                                     ; preds = %17
  %24 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %10, align 8
  %25 = icmp ne %struct.cdjpeg_progress_mgr* %24, null
  br i1 %25, label %26, label %48

; <label>:26:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_load_interlaced_image, i64 0, i64 2)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_load_interlaced_image, i64 0, i64 2)
  %28 = load i32, i32* %9, align 4
  %29 = zext i32 %28 to i64
  %30 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %10, align 8
  %31 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %30, i32 0, i32 0
  %32 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %31, i32 0, i32 1
  store i64 %29, i64* %32, align 8
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %33, i32 0, i32 7
  %35 = load i32, i32* %34, align 4
  %36 = zext i32 %35 to i64
  %37 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %10, align 8
  %38 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %37, i32 0, i32 0
  %39 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %38, i32 0, i32 2
  store i64 %36, i64* %39, align 8
  %40 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %10, align 8
  %41 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %40, i32 0, i32 0
  %42 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %41, i32 0, i32 0
  %43 = bitcast {}** %42 to void (%struct.jpeg_common_struct*)**
  %44 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %43, align 8
  %45 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %46 = bitcast %struct.jpeg_compress_struct* %45 to %struct.jpeg_common_struct*
  %47 = ptrtoint void (%struct.jpeg_common_struct*)* %44 to i64
  call void @__llvm_profile_instrument_target(i64 %47, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_load_interlaced_image to i8*), i32 0)
  call void %44(%struct.jpeg_common_struct* %46)
  br label %48

; <label>:48:                                     ; preds = %26, %23
  %49 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %50 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %49, i32 0, i32 1
  %51 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %50, align 8
  %52 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %51, i32 0, i32 7
  %53 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %52, align 8
  %54 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %55 = bitcast %struct.jpeg_compress_struct* %54 to %struct.jpeg_common_struct*
  %56 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %57 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %56, i32 0, i32 22
  %58 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %57, align 8
  %59 = load i32, i32* %9, align 4
  %60 = ptrtoint i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)* %53 to i64
  call void @__llvm_profile_instrument_target(i64 %60, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_load_interlaced_image to i8*), i32 1)
  %61 = call i8** %53(%struct.jpeg_common_struct* %55, %struct.jvirt_sarray_control* %58, i32 %59, i32 1, i32 1)
  store i8** %61, i8*** %6, align 8
  %62 = load i8**, i8*** %6, align 8
  %63 = getelementptr inbounds i8*, i8** %62, i64 0
  %64 = load i8*, i8** %63, align 8
  store i8* %64, i8** %7, align 8
  %65 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %65, i32 0, i32 6
  %67 = load i32, i32* %66, align 8
  store i32 %67, i32* %8, align 4
  br label %68

; <label>:68:                                     ; preds = %77, %48
  %69 = load i32, i32* %8, align 4
  %70 = icmp ugt i32 %69, 0
  br i1 %70, label %71, label %81

; <label>:71:                                     ; preds = %68
  %72 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %73 = call i32 @LZWReadByte(%struct.gif_source_struct* %72)
  %74 = trunc i32 %73 to i8
  %75 = load i8*, i8** %7, align 8
  %76 = getelementptr inbounds i8, i8* %75, i32 1
  store i8* %76, i8** %7, align 8
  store i8 %74, i8* %75, align 1
  br label %77

; <label>:77:                                     ; preds = %71
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_load_interlaced_image, i64 0, i64 0)
  %78 = add i64 %pgocount1, 1
  store i64 %78, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_load_interlaced_image, i64 0, i64 0)
  %79 = load i32, i32* %8, align 4
  %80 = add i32 %79, -1
  store i32 %80, i32* %8, align 4
  br label %68

; <label>:81:                                     ; preds = %68
  br label %82

; <label>:82:                                     ; preds = %81
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_load_interlaced_image, i64 0, i64 1)
  %83 = add i64 %pgocount2, 1
  store i64 %83, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_load_interlaced_image, i64 0, i64 1)
  %84 = load i32, i32* %9, align 4
  %85 = add i32 %84, 1
  store i32 %85, i32* %9, align 4
  br label %17

; <label>:86:                                     ; preds = %17
  %87 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %10, align 8
  %88 = icmp ne %struct.cdjpeg_progress_mgr* %87, null
  br i1 %88, label %89, label %95

; <label>:89:                                     ; preds = %86
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_load_interlaced_image, i64 0, i64 4)
  %90 = add i64 %pgocount3, 1
  store i64 %90, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_load_interlaced_image, i64 0, i64 4)
  %91 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %10, align 8
  %92 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %91, i32 0, i32 1
  %93 = load i32, i32* %92, align 8
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %92, align 8
  br label %95

; <label>:95:                                     ; preds = %89, %86
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_load_interlaced_image, i64 0, i64 3)
  %96 = add i64 %pgocount4, 1
  store i64 %96, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_load_interlaced_image, i64 0, i64 3)
  %97 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %98 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %97, i32 0, i32 0
  %99 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %98, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_interlaced_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %99, align 8
  %100 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %101 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %100, i32 0, i32 23
  store i32 0, i32* %101, align 8
  %102 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %103 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %102, i32 0, i32 7
  %104 = load i32, i32* %103, align 4
  %105 = add i32 %104, 7
  %106 = udiv i32 %105, 8
  %107 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %108 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %107, i32 0, i32 24
  store i32 %106, i32* %108, align 4
  %109 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %110 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %109, i32 0, i32 24
  %111 = load i32, i32* %110, align 4
  %112 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %113 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %112, i32 0, i32 7
  %114 = load i32, i32* %113, align 4
  %115 = add i32 %114, 3
  %116 = udiv i32 %115, 8
  %117 = add i32 %111, %116
  %118 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %119 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %118, i32 0, i32 25
  store i32 %117, i32* %119, align 8
  %120 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %121 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %120, i32 0, i32 25
  %122 = load i32, i32* %121, align 8
  %123 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %124 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %123, i32 0, i32 7
  %125 = load i32, i32* %124, align 4
  %126 = add i32 %125, 1
  %127 = udiv i32 %126, 4
  %128 = add i32 %122, %127
  %129 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %130 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %129, i32 0, i32 26
  store i32 %128, i32* %130, align 4
  %131 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %132 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %133 = call i32 @get_interlaced_row(%struct.jpeg_compress_struct* %131, %struct.cjpeg_source_struct* %132)
  ret i32 %133
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_pixel_rows(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct.gif_source_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8**, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %10 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %11 = bitcast %struct.cjpeg_source_struct* %10 to %struct.gif_source_struct*
  store %struct.gif_source_struct* %11, %struct.gif_source_struct** %5, align 8
  %12 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %13 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %12, i32 0, i32 2
  %14 = load i8**, i8*** %13, align 8
  store i8** %14, i8*** %9, align 8
  %15 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %16 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %15, i32 0, i32 0
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

; <label>:24:                                     ; preds = %57, %2
  %25 = load i32, i32* %8, align 4
  %26 = icmp ugt i32 %25, 0
  br i1 %26, label %27, label %61

; <label>:27:                                     ; preds = %24
  %28 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %29 = call i32 @LZWReadByte(%struct.gif_source_struct* %28)
  store i32 %29, i32* %6, align 4
  %30 = load i8**, i8*** %9, align 8
  %31 = getelementptr inbounds i8*, i8** %30, i64 0
  %32 = load i8*, i8** %31, align 8
  %33 = load i32, i32* %6, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8* %32, i64 %34
  %36 = load i8, i8* %35, align 1
  %37 = load i8*, i8** %7, align 8
  %38 = getelementptr inbounds i8, i8* %37, i32 1
  store i8* %38, i8** %7, align 8
  store i8 %36, i8* %37, align 1
  %39 = load i8**, i8*** %9, align 8
  %40 = getelementptr inbounds i8*, i8** %39, i64 1
  %41 = load i8*, i8** %40, align 8
  %42 = load i32, i32* %6, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i8, i8* %41, i64 %43
  %45 = load i8, i8* %44, align 1
  %46 = load i8*, i8** %7, align 8
  %47 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %47, i8** %7, align 8
  store i8 %45, i8* %46, align 1
  %48 = load i8**, i8*** %9, align 8
  %49 = getelementptr inbounds i8*, i8** %48, i64 2
  %50 = load i8*, i8** %49, align 8
  %51 = load i32, i32* %6, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8, i8* %50, i64 %52
  %54 = load i8, i8* %53, align 1
  %55 = load i8*, i8** %7, align 8
  %56 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %56, i8** %7, align 8
  store i8 %54, i8* %55, align 1
  br label %57

; <label>:57:                                     ; preds = %27
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_pixel_rows, i64 0, i64 0)
  %58 = add i64 %pgocount, 1
  store i64 %58, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_pixel_rows, i64 0, i64 0)
  %59 = load i32, i32* %8, align 4
  %60 = add i32 %59, -1
  store i32 %60, i32* %8, align 4
  br label %24

; <label>:61:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_pixel_rows, i64 0, i64 1)
  %62 = add i64 %pgocount1, 1
  store i64 %62, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_pixel_rows, i64 0, i64 1)
  ret i32 1
}

declare i32 @_IO_getc(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @SkipDataBlocks(%struct.gif_source_struct*) #0 {
  %2 = alloca %struct.gif_source_struct*, align 8
  %3 = alloca [256 x i8], align 16
  store %struct.gif_source_struct* %0, %struct.gif_source_struct** %2, align 8
  br label %4

; <label>:4:                                      ; preds = %9, %1
  %5 = load %struct.gif_source_struct*, %struct.gif_source_struct** %2, align 8
  %6 = getelementptr inbounds [256 x i8], [256 x i8]* %3, i32 0, i32 0
  %7 = call i32 @GetDataBlock(%struct.gif_source_struct* %5, i8* %6)
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_SkipDataBlocks, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_SkipDataBlocks, i64 0, i64 0)
  br label %4

; <label>:11:                                     ; preds = %4
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_SkipDataBlocks, i64 0, i64 1)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_SkipDataBlocks, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @GetDataBlock(%struct.gif_source_struct*, i8*) #0 {
  %3 = alloca %struct.gif_source_struct*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  store %struct.gif_source_struct* %0, %struct.gif_source_struct** %3, align 8
  store i8* %1, i8** %4, align 8
  %6 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %7 = call i32 @ReadByte(%struct.gif_source_struct* %6)
  store i32 %7, i32* %5, align 4
  %8 = load i32, i32* %5, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %44

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_GetDataBlock, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_GetDataBlock, i64 0, i64 1)
  %12 = load i8*, i8** %4, align 8
  %13 = load i32, i32* %5, align 4
  %14 = sext i32 %13 to i64
  %15 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %16 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %15, i32 0, i32 0
  %17 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %16, i32 0, i32 3
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %19 = call i64 @fread(i8* %12, i64 1, i64 %14, %struct._IO_FILE* %18)
  %20 = load i32, i32* %5, align 4
  %21 = sext i32 %20 to i64
  %22 = icmp eq i64 %19, %21
  br i1 %22, label %43, label %23

; <label>:23:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_GetDataBlock, i64 0, i64 2)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_GetDataBlock, i64 0, i64 2)
  %25 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %26 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %25, i32 0, i32 1
  %27 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %27, i32 0, i32 0
  %29 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %28, align 8
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %29, i32 0, i32 5
  store i32 42, i32* %30, align 8
  %31 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %32 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %31, i32 0, i32 1
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %33, i32 0, i32 0
  %35 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %35, i32 0, i32 0
  %37 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %36, align 8
  %38 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %39 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %38, i32 0, i32 1
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %39, align 8
  %41 = bitcast %struct.jpeg_compress_struct* %40 to %struct.jpeg_common_struct*
  %42 = ptrtoint void (%struct.jpeg_common_struct*)* %37 to i64
  call void @__llvm_profile_instrument_target(i64 %42, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_GetDataBlock to i8*), i32 0)
  call void %37(%struct.jpeg_common_struct* %41)
  br label %43

; <label>:43:                                     ; preds = %23, %10
  br label %44

; <label>:44:                                     ; preds = %43, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_GetDataBlock, i64 0, i64 0)
  %45 = add i64 %pgocount2, 1
  store i64 %45, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_GetDataBlock, i64 0, i64 0)
  %46 = load i32, i32* %5, align 4
  ret i32 %46
}

; Function Attrs: noinline nounwind uwtable
define internal void @ReInitLZW(%struct.gif_source_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_ReInitLZW, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_ReInitLZW, i64 0, i64 0)
  %3 = alloca %struct.gif_source_struct*, align 8
  store %struct.gif_source_struct* %0, %struct.gif_source_struct** %3, align 8
  %4 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %5 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %4, i32 0, i32 8
  %6 = load i32, i32* %5, align 4
  %7 = add nsw i32 %6, 1
  %8 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %9 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %8, i32 0, i32 11
  store i32 %7, i32* %9, align 8
  %10 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %11 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %10, i32 0, i32 9
  %12 = load i32, i32* %11, align 8
  %13 = shl i32 %12, 1
  %14 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %15 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %14, i32 0, i32 12
  store i32 %13, i32* %15, align 4
  %16 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %17 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %16, i32 0, i32 9
  %18 = load i32, i32* %17, align 8
  %19 = add nsw i32 %18, 2
  %20 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %21 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %20, i32 0, i32 13
  store i32 %19, i32* %21, align 8
  %22 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %23 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %22, i32 0, i32 19
  %24 = load i8*, i8** %23, align 8
  %25 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %26 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %25, i32 0, i32 20
  store i8* %24, i8** %26, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LZWReadByte(%struct.gif_source_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.gif_source_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct.gif_source_struct* %0, %struct.gif_source_struct** %3, align 8
  %6 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %7 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %6, i32 0, i32 14
  %8 = load i32, i32* %7, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %16

; <label>:10:                                     ; preds = %1
  %11 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %12 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %11, i32 0, i32 14
  store i32 0, i32* %12, align 4
  %13 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %14 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %13, i32 0, i32 9
  %15 = load i32, i32* %14, align 8
  store i32 %15, i32* %4, align 4
  br label %36

; <label>:16:                                     ; preds = %1
  %17 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %18 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %17, i32 0, i32 20
  %19 = load i8*, i8** %18, align 8
  %20 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %21 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %20, i32 0, i32 19
  %22 = load i8*, i8** %21, align 8
  %23 = icmp ugt i8* %19, %22
  br i1 %23, label %24, label %32

; <label>:24:                                     ; preds = %16
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 6)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 6)
  %26 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %27 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %26, i32 0, i32 20
  %28 = load i8*, i8** %27, align 8
  %29 = getelementptr inbounds i8, i8* %28, i32 -1
  store i8* %29, i8** %27, align 8
  %30 = load i8, i8* %29, align 1
  %31 = zext i8 %30 to i32
  store i32 %31, i32* %2, align 4
  br label %264

; <label>:32:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 7)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 7)
  %34 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %35 = call i32 @GetCode(%struct.gif_source_struct* %34)
  store i32 %35, i32* %4, align 4
  br label %36

; <label>:36:                                     ; preds = %32, %10
  %37 = load i32, i32* %4, align 4
  %38 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %39 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %38, i32 0, i32 9
  %40 = load i32, i32* %39, align 8
  %41 = icmp eq i32 %37, %40
  br i1 %41, label %42, label %88

; <label>:42:                                     ; preds = %36
  %43 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  call void @ReInitLZW(%struct.gif_source_struct* %43)
  br label %44

; <label>:44:                                     ; preds = %48, %42
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 0)
  %45 = add i64 %pgocount2, 1
  store i64 %45, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 0)
  %46 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %47 = call i32 @GetCode(%struct.gif_source_struct* %46)
  store i32 %47, i32* %4, align 4
  br label %48

; <label>:48:                                     ; preds = %44
  %49 = load i32, i32* %4, align 4
  %50 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %51 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %50, i32 0, i32 9
  %52 = load i32, i32* %51, align 8
  %53 = icmp eq i32 %49, %52
  br i1 %53, label %44, label %54

; <label>:54:                                     ; preds = %48
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 2)
  %55 = add i64 %pgocount3, 1
  store i64 %55, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 2)
  %56 = load i32, i32* %4, align 4
  %57 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %58 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %57, i32 0, i32 9
  %59 = load i32, i32* %58, align 8
  %60 = icmp sgt i32 %56, %59
  br i1 %60, label %61, label %81

; <label>:61:                                     ; preds = %54
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 3)
  %62 = add i64 %pgocount4, 1
  store i64 %62, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 3)
  %63 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %64 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %63, i32 0, i32 1
  %65 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %64, align 8
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %65, i32 0, i32 0
  %67 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %68 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %67, i32 0, i32 5
  store i32 1021, i32* %68, align 8
  %69 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %70 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %69, i32 0, i32 1
  %71 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %71, i32 0, i32 0
  %73 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %72, align 8
  %74 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %73, i32 0, i32 1
  %75 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %74, align 8
  %76 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %77 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %76, i32 0, i32 1
  %78 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %77, align 8
  %79 = bitcast %struct.jpeg_compress_struct* %78 to %struct.jpeg_common_struct*
  %80 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %75 to i64
  call void @__llvm_profile_instrument_target(i64 %80, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LZWReadByte to i8*), i32 0)
  call void %75(%struct.jpeg_common_struct* %79, i32 -1)
  store i32 0, i32* %4, align 4
  br label %81

; <label>:81:                                     ; preds = %61, %54
  %82 = load i32, i32* %4, align 4
  %83 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %84 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %83, i32 0, i32 15
  store i32 %82, i32* %84, align 8
  %85 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %86 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %85, i32 0, i32 16
  store i32 %82, i32* %86, align 4
  %87 = load i32, i32* %4, align 4
  store i32 %87, i32* %2, align 4
  br label %264

; <label>:88:                                     ; preds = %36
  %89 = load i32, i32* %4, align 4
  %90 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %91 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %90, i32 0, i32 10
  %92 = load i32, i32* %91, align 4
  %93 = icmp eq i32 %89, %92
  br i1 %93, label %94, label %124

; <label>:94:                                     ; preds = %88
  %95 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %96 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %95, i32 0, i32 7
  %97 = load i32, i32* %96, align 8
  %98 = icmp ne i32 %97, 0
  br i1 %98, label %104, label %99

; <label>:99:                                     ; preds = %94
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 10)
  %100 = add i64 %pgocount5, 1
  store i64 %100, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 10)
  %101 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  call void @SkipDataBlocks(%struct.gif_source_struct* %101)
  %102 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %103 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %102, i32 0, i32 7
  store i32 1, i32* %103, align 8
  br label %104

; <label>:104:                                    ; preds = %99, %94
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 4)
  %105 = add i64 %pgocount6, 1
  store i64 %105, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 4)
  %106 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %107 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %106, i32 0, i32 1
  %108 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %107, align 8
  %109 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %108, i32 0, i32 0
  %110 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %109, align 8
  %111 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %110, i32 0, i32 5
  store i32 1023, i32* %111, align 8
  %112 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %113 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %112, i32 0, i32 1
  %114 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %113, align 8
  %115 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %114, i32 0, i32 0
  %116 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %115, align 8
  %117 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %116, i32 0, i32 1
  %118 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %117, align 8
  %119 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %120 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %119, i32 0, i32 1
  %121 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %120, align 8
  %122 = bitcast %struct.jpeg_compress_struct* %121 to %struct.jpeg_common_struct*
  %123 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %118 to i64
  call void @__llvm_profile_instrument_target(i64 %123, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LZWReadByte to i8*), i32 1)
  call void %118(%struct.jpeg_common_struct* %122, i32 -1)
  store i32 0, i32* %2, align 4
  br label %264

; <label>:124:                                    ; preds = %88
  %125 = load i32, i32* %4, align 4
  store i32 %125, i32* %5, align 4
  %126 = load i32, i32* %4, align 4
  %127 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %128 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %127, i32 0, i32 13
  %129 = load i32, i32* %128, align 8
  %130 = icmp sge i32 %126, %129
  br i1 %130, label %131, label %170

; <label>:131:                                    ; preds = %124
  %132 = load i32, i32* %4, align 4
  %133 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %134 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %133, i32 0, i32 13
  %135 = load i32, i32* %134, align 8
  %136 = icmp sgt i32 %132, %135
  br i1 %136, label %137, label %157

; <label>:137:                                    ; preds = %131
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 11)
  %138 = add i64 %pgocount7, 1
  store i64 %138, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 11)
  %139 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %140 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %139, i32 0, i32 1
  %141 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %140, align 8
  %142 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %141, i32 0, i32 0
  %143 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %142, align 8
  %144 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %143, i32 0, i32 5
  store i32 1021, i32* %144, align 8
  %145 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %146 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %145, i32 0, i32 1
  %147 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %146, align 8
  %148 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %147, i32 0, i32 0
  %149 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %148, align 8
  %150 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %149, i32 0, i32 1
  %151 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %150, align 8
  %152 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %153 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %152, i32 0, i32 1
  %154 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %153, align 8
  %155 = bitcast %struct.jpeg_compress_struct* %154 to %struct.jpeg_common_struct*
  %156 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %151 to i64
  call void @__llvm_profile_instrument_target(i64 %156, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LZWReadByte to i8*), i32 2)
  call void %151(%struct.jpeg_common_struct* %155, i32 -1)
  store i32 0, i32* %5, align 4
  br label %157

; <label>:157:                                    ; preds = %137, %131
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 8)
  %158 = add i64 %pgocount8, 1
  store i64 %158, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 8)
  %159 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %160 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %159, i32 0, i32 16
  %161 = load i32, i32* %160, align 4
  %162 = trunc i32 %161 to i8
  %163 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %164 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %163, i32 0, i32 20
  %165 = load i8*, i8** %164, align 8
  %166 = getelementptr inbounds i8, i8* %165, i32 1
  store i8* %166, i8** %164, align 8
  store i8 %162, i8* %165, align 1
  %167 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %168 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %167, i32 0, i32 15
  %169 = load i32, i32* %168, align 8
  store i32 %169, i32* %4, align 4
  br label %170

; <label>:170:                                    ; preds = %157, %124
  br label %171

; <label>:171:                                    ; preds = %177, %170
  %172 = load i32, i32* %4, align 4
  %173 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %174 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %173, i32 0, i32 9
  %175 = load i32, i32* %174, align 8
  %176 = icmp sge i32 %172, %175
  br i1 %176, label %177, label %198

; <label>:177:                                    ; preds = %171
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 1)
  %178 = add i64 %pgocount9, 1
  store i64 %178, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 1)
  %179 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %180 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %179, i32 0, i32 18
  %181 = load i8*, i8** %180, align 8
  %182 = load i32, i32* %4, align 4
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds i8, i8* %181, i64 %183
  %185 = load i8, i8* %184, align 1
  %186 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %187 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %186, i32 0, i32 20
  %188 = load i8*, i8** %187, align 8
  %189 = getelementptr inbounds i8, i8* %188, i32 1
  store i8* %189, i8** %187, align 8
  store i8 %185, i8* %188, align 1
  %190 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %191 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %190, i32 0, i32 17
  %192 = load i16*, i16** %191, align 8
  %193 = load i32, i32* %4, align 4
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds i16, i16* %192, i64 %194
  %196 = load i16, i16* %195, align 2
  %197 = zext i16 %196 to i32
  store i32 %197, i32* %4, align 4
  br label %171

; <label>:198:                                    ; preds = %171
  %199 = load i32, i32* %4, align 4
  %200 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %201 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %200, i32 0, i32 16
  store i32 %199, i32* %201, align 4
  %202 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %203 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %202, i32 0, i32 13
  %204 = load i32, i32* %203, align 8
  store i32 %204, i32* %4, align 4
  %205 = icmp slt i32 %204, 4096
  br i1 %205, label %206, label %256

; <label>:206:                                    ; preds = %198
  %207 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %208 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %207, i32 0, i32 15
  %209 = load i32, i32* %208, align 8
  %210 = trunc i32 %209 to i16
  %211 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %212 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %211, i32 0, i32 17
  %213 = load i16*, i16** %212, align 8
  %214 = load i32, i32* %4, align 4
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds i16, i16* %213, i64 %215
  store i16 %210, i16* %216, align 2
  %217 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %218 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %217, i32 0, i32 16
  %219 = load i32, i32* %218, align 4
  %220 = trunc i32 %219 to i8
  %221 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %222 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %221, i32 0, i32 18
  %223 = load i8*, i8** %222, align 8
  %224 = load i32, i32* %4, align 4
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds i8, i8* %223, i64 %225
  store i8 %220, i8* %226, align 1
  %227 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %228 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %227, i32 0, i32 13
  %229 = load i32, i32* %228, align 8
  %230 = add nsw i32 %229, 1
  store i32 %230, i32* %228, align 8
  %231 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %232 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %231, i32 0, i32 13
  %233 = load i32, i32* %232, align 8
  %234 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %235 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %234, i32 0, i32 12
  %236 = load i32, i32* %235, align 4
  %237 = icmp sge i32 %233, %236
  br i1 %237, label %238, label %254

; <label>:238:                                    ; preds = %206
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 12)
  %239 = add i64 %pgocount10, 1
  store i64 %239, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 12)
  %240 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %241 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %240, i32 0, i32 11
  %242 = load i32, i32* %241, align 8
  %243 = icmp slt i32 %242, 12
  br i1 %243, label %244, label %254

; <label>:244:                                    ; preds = %238
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 13)
  %245 = add i64 %pgocount11, 1
  store i64 %245, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 13)
  %246 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %247 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %246, i32 0, i32 11
  %248 = load i32, i32* %247, align 8
  %249 = add nsw i32 %248, 1
  store i32 %249, i32* %247, align 8
  %250 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %251 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %250, i32 0, i32 12
  %252 = load i32, i32* %251, align 4
  %253 = shl i32 %252, 1
  store i32 %253, i32* %251, align 4
  br label %254

; <label>:254:                                    ; preds = %244, %238, %206
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 9)
  %255 = add i64 %pgocount12, 1
  store i64 %255, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 9)
  br label %256

; <label>:256:                                    ; preds = %254, %198
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 5)
  %257 = add i64 %pgocount13, 1
  store i64 %257, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_LZWReadByte, i64 0, i64 5)
  %258 = load i32, i32* %5, align 4
  %259 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %260 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %259, i32 0, i32 15
  store i32 %258, i32* %260, align 8
  %261 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %262 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %261, i32 0, i32 16
  %263 = load i32, i32* %262, align 4
  store i32 %263, i32* %2, align 4
  br label %264

; <label>:264:                                    ; preds = %256, %104, %81, %24
  %265 = load i32, i32* %2, align 4
  ret i32 %265
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_interlaced_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct.gif_source_struct*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i8**, align 8
  %12 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %13 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %14 = bitcast %struct.cjpeg_source_struct* %13 to %struct.gif_source_struct*
  store %struct.gif_source_struct* %14, %struct.gif_source_struct** %5, align 8
  %15 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %16 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %15, i32 0, i32 2
  %17 = load i8**, i8*** %16, align 8
  store i8** %17, i8*** %11, align 8
  %18 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %19 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %18, i32 0, i32 23
  %20 = load i32, i32* %19, align 8
  %21 = and i32 %20, 7
  switch i32 %21, label %49 [
    i32 0, label %23
    i32 4, label %29
    i32 2, label %._crit_edge
    i32 6, label %39
  ]

._crit_edge:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_get_interlaced_row, i64 0, i64 0)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_get_interlaced_row, i64 0, i64 0)
  br label %39

; <label>:23:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_get_interlaced_row, i64 0, i64 3)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_get_interlaced_row, i64 0, i64 3)
  %25 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %26 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %25, i32 0, i32 23
  %27 = load i32, i32* %26, align 8
  %28 = lshr i32 %27, 3
  store i32 %28, i32* %12, align 4
  br label %59

; <label>:29:                                     ; preds = %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_get_interlaced_row, i64 0, i64 4)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_get_interlaced_row, i64 0, i64 4)
  %31 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %32 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %31, i32 0, i32 23
  %33 = load i32, i32* %32, align 8
  %34 = lshr i32 %33, 3
  %35 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %36 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %35, i32 0, i32 24
  %37 = load i32, i32* %36, align 4
  %38 = add i32 %34, %37
  store i32 %38, i32* %12, align 4
  br label %59

; <label>:39:                                     ; preds = %._crit_edge, %2
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_get_interlaced_row, i64 0, i64 2)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_get_interlaced_row, i64 0, i64 2)
  %41 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %42 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %41, i32 0, i32 23
  %43 = load i32, i32* %42, align 8
  %44 = lshr i32 %43, 2
  %45 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %46 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %45, i32 0, i32 25
  %47 = load i32, i32* %46, align 8
  %48 = add i32 %44, %47
  store i32 %48, i32* %12, align 4
  br label %59

; <label>:49:                                     ; preds = %2
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_get_interlaced_row, i64 0, i64 5)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_get_interlaced_row, i64 0, i64 5)
  %51 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %52 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %51, i32 0, i32 23
  %53 = load i32, i32* %52, align 8
  %54 = lshr i32 %53, 1
  %55 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %56 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %55, i32 0, i32 26
  %57 = load i32, i32* %56, align 4
  %58 = add i32 %54, %57
  store i32 %58, i32* %12, align 4
  br label %59

; <label>:59:                                     ; preds = %49, %39, %29, %23
  %60 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %61 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %60, i32 0, i32 1
  %62 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %61, align 8
  %63 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %62, i32 0, i32 7
  %64 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %63, align 8
  %65 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %66 = bitcast %struct.jpeg_compress_struct* %65 to %struct.jpeg_common_struct*
  %67 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %68 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %67, i32 0, i32 22
  %69 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %68, align 8
  %70 = load i32, i32* %12, align 4
  %71 = ptrtoint i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)* %64 to i64
  call void @__llvm_profile_instrument_target(i64 %71, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_interlaced_row to i8*), i32 0)
  %72 = call i8** %64(%struct.jpeg_common_struct* %66, %struct.jvirt_sarray_control* %69, i32 %70, i32 1, i32 0)
  store i8** %72, i8*** %6, align 8
  %73 = load i8**, i8*** %6, align 8
  %74 = getelementptr inbounds i8*, i8** %73, i64 0
  %75 = load i8*, i8** %74, align 8
  store i8* %75, i8** %8, align 8
  %76 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %77 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %76, i32 0, i32 0
  %78 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %77, i32 0, i32 4
  %79 = load i8**, i8*** %78, align 8
  %80 = getelementptr inbounds i8*, i8** %79, i64 0
  %81 = load i8*, i8** %80, align 8
  store i8* %81, i8** %9, align 8
  %82 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %83 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %82, i32 0, i32 6
  %84 = load i32, i32* %83, align 8
  store i32 %84, i32* %10, align 4
  br label %85

; <label>:85:                                     ; preds = %120, %59
  %86 = load i32, i32* %10, align 4
  %87 = icmp ugt i32 %86, 0
  br i1 %87, label %88, label %124

; <label>:88:                                     ; preds = %85
  %89 = load i8*, i8** %8, align 8
  %90 = getelementptr inbounds i8, i8* %89, i32 1
  store i8* %90, i8** %8, align 8
  %91 = load i8, i8* %89, align 1
  %92 = zext i8 %91 to i32
  store i32 %92, i32* %7, align 4
  %93 = load i8**, i8*** %11, align 8
  %94 = getelementptr inbounds i8*, i8** %93, i64 0
  %95 = load i8*, i8** %94, align 8
  %96 = load i32, i32* %7, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i8, i8* %95, i64 %97
  %99 = load i8, i8* %98, align 1
  %100 = load i8*, i8** %9, align 8
  %101 = getelementptr inbounds i8, i8* %100, i32 1
  store i8* %101, i8** %9, align 8
  store i8 %99, i8* %100, align 1
  %102 = load i8**, i8*** %11, align 8
  %103 = getelementptr inbounds i8*, i8** %102, i64 1
  %104 = load i8*, i8** %103, align 8
  %105 = load i32, i32* %7, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i8, i8* %104, i64 %106
  %108 = load i8, i8* %107, align 1
  %109 = load i8*, i8** %9, align 8
  %110 = getelementptr inbounds i8, i8* %109, i32 1
  store i8* %110, i8** %9, align 8
  store i8 %108, i8* %109, align 1
  %111 = load i8**, i8*** %11, align 8
  %112 = getelementptr inbounds i8*, i8** %111, i64 2
  %113 = load i8*, i8** %112, align 8
  %114 = load i32, i32* %7, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i8, i8* %113, i64 %115
  %117 = load i8, i8* %116, align 1
  %118 = load i8*, i8** %9, align 8
  %119 = getelementptr inbounds i8, i8* %118, i32 1
  store i8* %119, i8** %9, align 8
  store i8 %117, i8* %118, align 1
  br label %120

; <label>:120:                                    ; preds = %88
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_get_interlaced_row, i64 0, i64 1)
  %121 = add i64 %pgocount5, 1
  store i64 %121, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_get_interlaced_row, i64 0, i64 1)
  %122 = load i32, i32* %10, align 4
  %123 = add i32 %122, -1
  store i32 %123, i32* %10, align 4
  br label %85

; <label>:124:                                    ; preds = %85
  %125 = load %struct.gif_source_struct*, %struct.gif_source_struct** %5, align 8
  %126 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %125, i32 0, i32 23
  %127 = load i32, i32* %126, align 8
  %128 = add i32 %127, 1
  store i32 %128, i32* %126, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @GetCode(%struct.gif_source_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.gif_source_struct*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.gif_source_struct* %0, %struct.gif_source_struct** %3, align 8
  br label %8

; <label>:8:                                      ; preds = %104, %1
  %9 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %10 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %9, i32 0, i32 6
  %11 = load i32, i32* %10, align 4
  %12 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %13 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %12, i32 0, i32 11
  %14 = load i32, i32* %13, align 8
  %15 = add nsw i32 %11, %14
  %16 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %17 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %16, i32 0, i32 5
  %18 = load i32, i32* %17, align 8
  %19 = icmp sgt i32 %15, %18
  br i1 %19, label %20, label %126

; <label>:20:                                     ; preds = %8
  %21 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %22 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %21, i32 0, i32 7
  %23 = load i32, i32* %22, align 8
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %48

; <label>:25:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_GetCode, i64 0, i64 1)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_GetCode, i64 0, i64 1)
  %27 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %28 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %27, i32 0, i32 1
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %28, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i32 0, i32 0
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i32 0, i32 5
  store i32 1024, i32* %32, align 8
  %33 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %34 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %33, i32 0, i32 1
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %35, i32 0, i32 0
  %37 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %37, i32 0, i32 1
  %39 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %38, align 8
  %40 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %41 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %40, i32 0, i32 1
  %42 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %41, align 8
  %43 = bitcast %struct.jpeg_compress_struct* %42 to %struct.jpeg_common_struct*
  %44 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %39 to i64
  call void @__llvm_profile_instrument_target(i64 %44, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_GetCode to i8*), i32 0)
  call void %39(%struct.jpeg_common_struct* %43, i32 -1)
  %45 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %46 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %45, i32 0, i32 10
  %47 = load i32, i32* %46, align 4
  store i32 %47, i32* %2, align 4
  br label %192

; <label>:48:                                     ; preds = %20
  %49 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %50 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %49, i32 0, i32 3
  %51 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %52 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %51, i32 0, i32 4
  %53 = load i32, i32* %52, align 4
  %54 = sub nsw i32 %53, 2
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [260 x i8], [260 x i8]* %50, i64 0, i64 %55
  %57 = load i8, i8* %56, align 1
  %58 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %59 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %58, i32 0, i32 3
  %60 = getelementptr inbounds [260 x i8], [260 x i8]* %59, i64 0, i64 0
  store i8 %57, i8* %60, align 8
  %61 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %62 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %61, i32 0, i32 3
  %63 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %64 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %63, i32 0, i32 4
  %65 = load i32, i32* %64, align 4
  %66 = sub nsw i32 %65, 1
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [260 x i8], [260 x i8]* %62, i64 0, i64 %67
  %69 = load i8, i8* %68, align 1
  %70 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %71 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %70, i32 0, i32 3
  %72 = getelementptr inbounds [260 x i8], [260 x i8]* %71, i64 0, i64 1
  store i8 %69, i8* %72, align 1
  %73 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %74 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %75 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %74, i32 0, i32 3
  %76 = getelementptr inbounds [260 x i8], [260 x i8]* %75, i64 0, i64 2
  %77 = call i32 @GetDataBlock(%struct.gif_source_struct* %73, i8* %76)
  store i32 %77, i32* %7, align 4
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %104

; <label>:79:                                     ; preds = %48
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_GetCode, i64 0, i64 3)
  %80 = add i64 %pgocount1, 1
  store i64 %80, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_GetCode, i64 0, i64 3)
  %81 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %82 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %81, i32 0, i32 7
  store i32 1, i32* %82, align 8
  %83 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %84 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %83, i32 0, i32 1
  %85 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %84, align 8
  %86 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %85, i32 0, i32 0
  %87 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %86, align 8
  %88 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %87, i32 0, i32 5
  store i32 1024, i32* %88, align 8
  %89 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %90 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %89, i32 0, i32 1
  %91 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %90, align 8
  %92 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %91, i32 0, i32 0
  %93 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %92, align 8
  %94 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %93, i32 0, i32 1
  %95 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %94, align 8
  %96 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %97 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %96, i32 0, i32 1
  %98 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %97, align 8
  %99 = bitcast %struct.jpeg_compress_struct* %98 to %struct.jpeg_common_struct*
  %100 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %95 to i64
  call void @__llvm_profile_instrument_target(i64 %100, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_GetCode to i8*), i32 1)
  call void %95(%struct.jpeg_common_struct* %99, i32 -1)
  %101 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %102 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %101, i32 0, i32 10
  %103 = load i32, i32* %102, align 4
  store i32 %103, i32* %2, align 4
  br label %192

; <label>:104:                                    ; preds = %48
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_GetCode, i64 0, i64 0)
  %105 = add i64 %pgocount2, 1
  store i64 %105, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_GetCode, i64 0, i64 0)
  %106 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %107 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %106, i32 0, i32 6
  %108 = load i32, i32* %107, align 4
  %109 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %110 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %109, i32 0, i32 5
  %111 = load i32, i32* %110, align 8
  %112 = sub nsw i32 %108, %111
  %113 = add nsw i32 %112, 16
  %114 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %115 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %114, i32 0, i32 6
  store i32 %113, i32* %115, align 4
  %116 = load i32, i32* %7, align 4
  %117 = add nsw i32 2, %116
  %118 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %119 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %118, i32 0, i32 4
  store i32 %117, i32* %119, align 4
  %120 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %121 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %120, i32 0, i32 4
  %122 = load i32, i32* %121, align 4
  %123 = mul nsw i32 %122, 8
  %124 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %125 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %124, i32 0, i32 5
  store i32 %123, i32* %125, align 8
  br label %8

; <label>:126:                                    ; preds = %8
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_GetCode, i64 0, i64 2)
  %127 = add i64 %pgocount3, 1
  store i64 %127, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_GetCode, i64 0, i64 2)
  %128 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %129 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %128, i32 0, i32 6
  %130 = load i32, i32* %129, align 4
  %131 = ashr i32 %130, 3
  store i32 %131, i32* %5, align 4
  %132 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %133 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %132, i32 0, i32 3
  %134 = load i32, i32* %5, align 4
  %135 = add nsw i32 %134, 2
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [260 x i8], [260 x i8]* %133, i64 0, i64 %136
  %138 = load i8, i8* %137, align 1
  %139 = sext i8 %138 to i32
  %140 = and i32 %139, 255
  %141 = sext i32 %140 to i64
  store i64 %141, i64* %4, align 8
  %142 = load i64, i64* %4, align 8
  %143 = shl i64 %142, 8
  store i64 %143, i64* %4, align 8
  %144 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %145 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %144, i32 0, i32 3
  %146 = load i32, i32* %5, align 4
  %147 = add nsw i32 %146, 1
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [260 x i8], [260 x i8]* %145, i64 0, i64 %148
  %150 = load i8, i8* %149, align 1
  %151 = sext i8 %150 to i32
  %152 = and i32 %151, 255
  %153 = sext i32 %152 to i64
  %154 = load i64, i64* %4, align 8
  %155 = or i64 %154, %153
  store i64 %155, i64* %4, align 8
  %156 = load i64, i64* %4, align 8
  %157 = shl i64 %156, 8
  store i64 %157, i64* %4, align 8
  %158 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %159 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %158, i32 0, i32 3
  %160 = load i32, i32* %5, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [260 x i8], [260 x i8]* %159, i64 0, i64 %161
  %163 = load i8, i8* %162, align 1
  %164 = sext i8 %163 to i32
  %165 = and i32 %164, 255
  %166 = sext i32 %165 to i64
  %167 = load i64, i64* %4, align 8
  %168 = or i64 %167, %166
  store i64 %168, i64* %4, align 8
  %169 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %170 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %169, i32 0, i32 6
  %171 = load i32, i32* %170, align 4
  %172 = and i32 %171, 7
  %173 = load i64, i64* %4, align 8
  %174 = zext i32 %172 to i64
  %175 = ashr i64 %173, %174
  store i64 %175, i64* %4, align 8
  %176 = load i64, i64* %4, align 8
  %177 = trunc i64 %176 to i32
  %178 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %179 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %178, i32 0, i32 11
  %180 = load i32, i32* %179, align 8
  %181 = shl i32 1, %180
  %182 = sub nsw i32 %181, 1
  %183 = and i32 %177, %182
  store i32 %183, i32* %6, align 4
  %184 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %185 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %184, i32 0, i32 11
  %186 = load i32, i32* %185, align 8
  %187 = load %struct.gif_source_struct*, %struct.gif_source_struct** %3, align 8
  %188 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %187, i32 0, i32 6
  %189 = load i32, i32* %188, align 4
  %190 = add nsw i32 %189, %186
  store i32 %190, i32* %188, align 4
  %191 = load i32, i32* %6, align 4
  store i32 %191, i32* %2, align 4
  br label %192

; <label>:192:                                    ; preds = %126, %79, %25
  %193 = load i32, i32* %2, align 4
  ret i32 %193
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

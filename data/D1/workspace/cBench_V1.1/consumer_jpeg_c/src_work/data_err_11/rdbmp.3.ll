; ModuleID = 'rdbmp.2.ll'
source_filename = "rdbmp.c"
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
%struct._bmp_source_struct = type { %struct.cjpeg_source_struct, %struct.jpeg_compress_struct*, i8**, %struct.jvirt_sarray_control*, i32, i32, i32 }
%struct.cdjpeg_progress_mgr = type { %struct.jpeg_progress_mgr, i32, i32, i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_read_bmp = private constant [14 x i8] c"jinit_read_bmp"
@__profn_tmp1.ll_start_input_bmp = private constant [23 x i8] c"tmp1.ll:start_input_bmp"
@__profn_tmp1.ll_finish_input_bmp = private constant [24 x i8] c"tmp1.ll:finish_input_bmp"
@__profn_tmp1.ll_read_colormap = private constant [21 x i8] c"tmp1.ll:read_colormap"
@__profn_tmp1.ll_read_byte = private constant [17 x i8] c"tmp1.ll:read_byte"
@__profn_tmp1.ll_preload_image = private constant [21 x i8] c"tmp1.ll:preload_image"
@__profn_tmp1.ll_get_8bit_row = private constant [20 x i8] c"tmp1.ll:get_8bit_row"
@__profn_tmp1.ll_get_24bit_row = private constant [21 x i8] c"tmp1.ll:get_24bit_row"
@__profc_jinit_read_bmp = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_read_bmp = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_read_bmp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7636799955726748151, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_read_bmp, i32 0, i32 0), i8* bitcast (%struct.cjpeg_source_struct* (%struct.jpeg_compress_struct*)* @jinit_read_bmp to i8*), i8* bitcast ([1 x i64]* @__profvp_jinit_read_bmp to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_input_bmp = private global [27 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_input_bmp = private global [20 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_input_bmp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -375489919046332694, i64 5629844718448362, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @start_input_bmp to i8*), i8* bitcast ([20 x i64]* @__profvp_tmp1.ll_start_input_bmp to i8*), i32 27, [1 x i16] [i16 20] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_input_bmp = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_finish_input_bmp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3980722897582250436, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_input_bmp, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @finish_input_bmp to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_colormap = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_read_colormap = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_read_colormap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4592192535881140357, i64 281556053437061, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_colormap, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_read_colormap to i8*), i32 5, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_byte = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_read_byte = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_read_byte = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1755714165626662955, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_read_byte, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_read_byte to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_preload_image = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_preload_image = private global [5 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_preload_image = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2134364156400756284, i64 1407493924863914, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_preload_image, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @preload_image to i8*), i8* bitcast ([5 x i64]* @__profvp_tmp1.ll_preload_image to i8*), i32 8, [1 x i16] [i16 5] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_8bit_row = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_8bit_row = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_8bit_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1940018763341248205, i64 281509114370972, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_8bit_row, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_8bit_row to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_get_8bit_row to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_24bit_row = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_get_24bit_row = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_get_24bit_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8515631507367133068, i64 281509114370972, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_24bit_row, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_24bit_row to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_get_24bit_row to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [30 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [171 x i8] c"\A8\01\00jinit_read_bmp\01tmp1.ll:start_input_bmp\01tmp1.ll:finish_input_bmp\01tmp1.ll:read_colormap\01tmp1.ll:read_byte\01tmp1.ll:preload_image\01tmp1.ll:get_8bit_row\01tmp1.ll:get_24bit_row", section "__llvm_prf_names"
@llvm.used = appending global [10 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_read_bmp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_input_bmp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_colormap to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_byte to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_preload_image to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_8bit_row to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_24bit_row to i8*), i8* bitcast ([30 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([171 x i8], [171 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define %struct.cjpeg_source_struct* @jinit_read_bmp(%struct.jpeg_compress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_read_bmp, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_read_bmp, i64 0, i64 0)
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct._bmp_source_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 1
  %7 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %7, i32 0, i32 0
  %9 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %8, align 8
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %11 = bitcast %struct.jpeg_compress_struct* %10 to %struct.jpeg_common_struct*
  %12 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %9 to i64
  call void @__llvm_profile_instrument_target(i64 %12, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_read_bmp to i8*), i32 0)
  %13 = call i8* %9(%struct.jpeg_common_struct* %11, i32 1, i64 88)
  %14 = bitcast i8* %13 to %struct._bmp_source_struct*
  store %struct._bmp_source_struct* %14, %struct._bmp_source_struct** %4, align 8
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %16 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %17 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %16, i32 0, i32 1
  store %struct.jpeg_compress_struct* %15, %struct.jpeg_compress_struct** %17, align 8
  %18 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %19 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %18, i32 0, i32 0
  %20 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %19, i32 0, i32 0
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @start_input_bmp, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %20, align 8
  %21 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %22 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %21, i32 0, i32 0
  %23 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %22, i32 0, i32 2
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @finish_input_bmp, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %23, align 8
  %24 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %25 = bitcast %struct._bmp_source_struct* %24 to %struct.cjpeg_source_struct*
  ret %struct.cjpeg_source_struct* %25
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_input_bmp(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct._bmp_source_struct*, align 8
  %6 = alloca [14 x i8], align 1
  %7 = alloca [64 x i8], align 16
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i32, align 4
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i32, align 4
  %18 = alloca i64, align 8
  %19 = alloca i32, align 4
  %20 = alloca %struct.cdjpeg_progress_mgr*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %21 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %22 = bitcast %struct.cjpeg_source_struct* %21 to %struct._bmp_source_struct*
  store %struct._bmp_source_struct* %22, %struct._bmp_source_struct** %5, align 8
  store i64 0, i64* %10, align 8
  store i64 0, i64* %11, align 8
  store i64 0, i64* %16, align 8
  store i32 0, i32* %17, align 4
  %23 = getelementptr inbounds [14 x i8], [14 x i8]* %6, i32 0, i32 0
  %24 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %25 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %24, i32 0, i32 0
  %26 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %25, i32 0, i32 3
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %26, align 8
  %28 = call i64 @fread(i8* %23, i64 1, i64 14, %struct._IO_FILE* %27)
  %29 = icmp eq i64 %28, 14
  br i1 %29, label %44, label %30

; <label>:30:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 5)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 5)
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
  call void @__llvm_profile_instrument_target(i64 %43, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 0)
  call void %40(%struct.jpeg_common_struct* %42)
  br label %44

; <label>:44:                                     ; preds = %30, %2
  %45 = getelementptr inbounds [14 x i8], [14 x i8]* %6, i64 0, i64 0
  %46 = load i8, i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = getelementptr inbounds [14 x i8], [14 x i8]* %6, i64 0, i64 1
  %49 = load i8, i8* %48, align 1
  %50 = zext i8 %49 to i32
  %51 = shl i32 %50, 8
  %52 = add i32 %47, %51
  %53 = icmp ne i32 %52, 19778
  br i1 %53, label %54, label %68

; <label>:54:                                     ; preds = %44
  %pgocount1 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 6)
  %55 = add i64 %pgocount1, 1
  store i64 %55, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 6)
  %56 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %57 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %56, i32 0, i32 0
  %58 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %59 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %58, i32 0, i32 5
  store i32 1007, i32* %59, align 8
  %60 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %61 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %60, i32 0, i32 0
  %62 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %61, align 8
  %63 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %62, i32 0, i32 0
  %64 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %63, align 8
  %65 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %66 = bitcast %struct.jpeg_compress_struct* %65 to %struct.jpeg_common_struct*
  %67 = ptrtoint void (%struct.jpeg_common_struct*)* %64 to i64
  call void @__llvm_profile_instrument_target(i64 %67, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 1)
  call void %64(%struct.jpeg_common_struct* %66)
  br label %68

; <label>:68:                                     ; preds = %54, %44
  %69 = getelementptr inbounds [14 x i8], [14 x i8]* %6, i64 0, i64 10
  %70 = load i8, i8* %69, align 1
  %71 = zext i8 %70 to i32
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [14 x i8], [14 x i8]* %6, i64 0, i64 11
  %74 = load i8, i8* %73, align 1
  %75 = zext i8 %74 to i32
  %76 = sext i32 %75 to i64
  %77 = shl i64 %76, 8
  %78 = add nsw i64 %72, %77
  %79 = getelementptr inbounds [14 x i8], [14 x i8]* %6, i64 0, i64 12
  %80 = load i8, i8* %79, align 1
  %81 = zext i8 %80 to i32
  %82 = sext i32 %81 to i64
  %83 = shl i64 %82, 16
  %84 = add nsw i64 %78, %83
  %85 = getelementptr inbounds [14 x i8], [14 x i8]* %6, i64 0, i64 13
  %86 = load i8, i8* %85, align 1
  %87 = zext i8 %86 to i32
  %88 = sext i32 %87 to i64
  %89 = shl i64 %88, 24
  %90 = add nsw i64 %84, %89
  store i64 %90, i64* %8, align 8
  %91 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i32 0, i32 0
  %92 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %93 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %92, i32 0, i32 0
  %94 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %93, i32 0, i32 3
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** %94, align 8
  %96 = call i64 @fread(i8* %91, i64 1, i64 4, %struct._IO_FILE* %95)
  %97 = icmp eq i64 %96, 4
  br i1 %97, label %112, label %98

; <label>:98:                                     ; preds = %68
  %pgocount2 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 7)
  %99 = add i64 %pgocount2, 1
  store i64 %99, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 7)
  %100 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %101 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %100, i32 0, i32 0
  %102 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %101, align 8
  %103 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %102, i32 0, i32 5
  store i32 42, i32* %103, align 8
  %104 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %105 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %104, i32 0, i32 0
  %106 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %105, align 8
  %107 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %106, i32 0, i32 0
  %108 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %107, align 8
  %109 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %110 = bitcast %struct.jpeg_compress_struct* %109 to %struct.jpeg_common_struct*
  %111 = ptrtoint void (%struct.jpeg_common_struct*)* %108 to i64
  call void @__llvm_profile_instrument_target(i64 %111, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 2)
  call void %108(%struct.jpeg_common_struct* %110)
  br label %112

; <label>:112:                                    ; preds = %98, %68
  %113 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 0
  %114 = load i8, i8* %113, align 16
  %115 = zext i8 %114 to i32
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 1
  %118 = load i8, i8* %117, align 1
  %119 = zext i8 %118 to i32
  %120 = sext i32 %119 to i64
  %121 = shl i64 %120, 8
  %122 = add nsw i64 %116, %121
  %123 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 2
  %124 = load i8, i8* %123, align 2
  %125 = zext i8 %124 to i32
  %126 = sext i32 %125 to i64
  %127 = shl i64 %126, 16
  %128 = add nsw i64 %122, %127
  %129 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 3
  %130 = load i8, i8* %129, align 1
  %131 = zext i8 %130 to i32
  %132 = sext i32 %131 to i64
  %133 = shl i64 %132, 24
  %134 = add nsw i64 %128, %133
  store i64 %134, i64* %9, align 8
  %135 = load i64, i64* %9, align 8
  %136 = icmp slt i64 %135, 12
  br i1 %136, label %141, label %137

; <label>:137:                                    ; preds = %112
  %pgocount3 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 8)
  %138 = add i64 %pgocount3, 1
  store i64 %138, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 8)
  %139 = load i64, i64* %9, align 8
  %140 = icmp sgt i64 %139, 64
  br i1 %140, label %141, label %155

; <label>:141:                                    ; preds = %137, %112
  %pgocount4 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 3)
  %142 = add i64 %pgocount4, 1
  store i64 %142, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 3)
  %143 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %144 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %143, i32 0, i32 0
  %145 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %144, align 8
  %146 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %145, i32 0, i32 5
  store i32 1003, i32* %146, align 8
  %147 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %148 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %147, i32 0, i32 0
  %149 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %148, align 8
  %150 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %149, i32 0, i32 0
  %151 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %150, align 8
  %152 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %153 = bitcast %struct.jpeg_compress_struct* %152 to %struct.jpeg_common_struct*
  %154 = ptrtoint void (%struct.jpeg_common_struct*)* %151 to i64
  call void @__llvm_profile_instrument_target(i64 %154, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 3)
  call void %151(%struct.jpeg_common_struct* %153)
  br label %155

; <label>:155:                                    ; preds = %141, %137
  %156 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i32 0, i32 0
  %157 = getelementptr inbounds i8, i8* %156, i64 4
  %158 = load i64, i64* %9, align 8
  %159 = sub nsw i64 %158, 4
  %160 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %161 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %160, i32 0, i32 0
  %162 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %161, i32 0, i32 3
  %163 = load %struct._IO_FILE*, %struct._IO_FILE** %162, align 8
  %164 = call i64 @fread(i8* %157, i64 1, i64 %159, %struct._IO_FILE* %163)
  %165 = load i64, i64* %9, align 8
  %166 = sub nsw i64 %165, 4
  %167 = icmp eq i64 %164, %166
  br i1 %167, label %182, label %168

; <label>:168:                                    ; preds = %155
  %pgocount5 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 9)
  %169 = add i64 %pgocount5, 1
  store i64 %169, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 9)
  %170 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %171 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %170, i32 0, i32 0
  %172 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %171, align 8
  %173 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %172, i32 0, i32 5
  store i32 42, i32* %173, align 8
  %174 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %175 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %174, i32 0, i32 0
  %176 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %175, align 8
  %177 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %176, i32 0, i32 0
  %178 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %177, align 8
  %179 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %180 = bitcast %struct.jpeg_compress_struct* %179 to %struct.jpeg_common_struct*
  %181 = ptrtoint void (%struct.jpeg_common_struct*)* %178 to i64
  call void @__llvm_profile_instrument_target(i64 %181, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 4)
  call void %178(%struct.jpeg_common_struct* %180)
  br label %182

; <label>:182:                                    ; preds = %168, %155
  %183 = load i64, i64* %9, align 8
  %184 = trunc i64 %183 to i32
  switch i32 %184, label %602 [
    i32 12, label %186
    i32 40, label %._crit_edge
    i32 64, label %318
  ]

._crit_edge:                                      ; preds = %182
  %pgocount6 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 0)
  %185 = add i64 %pgocount6, 1
  store i64 %185, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 0)
  br label %318

; <label>:186:                                    ; preds = %182
  %187 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 4
  %188 = load i8, i8* %187, align 4
  %189 = zext i8 %188 to i32
  %190 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 5
  %191 = load i8, i8* %190, align 1
  %192 = zext i8 %191 to i32
  %193 = shl i32 %192, 8
  %194 = add i32 %189, %193
  %195 = zext i32 %194 to i64
  store i64 %195, i64* %10, align 8
  %196 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 6
  %197 = load i8, i8* %196, align 2
  %198 = zext i8 %197 to i32
  %199 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 7
  %200 = load i8, i8* %199, align 1
  %201 = zext i8 %200 to i32
  %202 = shl i32 %201, 8
  %203 = add i32 %198, %202
  %204 = zext i32 %203 to i64
  store i64 %204, i64* %11, align 8
  %205 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 8
  %206 = load i8, i8* %205, align 8
  %207 = zext i8 %206 to i32
  %208 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 9
  %209 = load i8, i8* %208, align 1
  %210 = zext i8 %209 to i32
  %211 = shl i32 %210, 8
  %212 = add i32 %207, %211
  store i32 %212, i32* %12, align 4
  %213 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 10
  %214 = load i8, i8* %213, align 2
  %215 = zext i8 %214 to i32
  %216 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 11
  %217 = load i8, i8* %216, align 1
  %218 = zext i8 %217 to i32
  %219 = shl i32 %218, 8
  %220 = add i32 %215, %219
  %221 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %222 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %221, i32 0, i32 6
  store i32 %220, i32* %222, align 8
  %223 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %224 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %223, i32 0, i32 6
  %225 = load i32, i32* %224, align 8
  switch i32 %225, label %286 [
    i32 8, label %226
    i32 24, label %256
  ]

; <label>:226:                                    ; preds = %186
  %pgocount7 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 24)
  %227 = add i64 %pgocount7, 1
  store i64 %227, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 24)
  store i32 3, i32* %17, align 4
  %228 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %229 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %228, i32 0, i32 0
  %230 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %229, align 8
  %231 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %230, i32 0, i32 5
  store i32 1011, i32* %231, align 8
  %232 = load i64, i64* %10, align 8
  %233 = trunc i64 %232 to i32
  %234 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %235 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %234, i32 0, i32 0
  %236 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %235, align 8
  %237 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %236, i32 0, i32 6
  %238 = bitcast %union.anon* %237 to [8 x i32]*
  %239 = getelementptr inbounds [8 x i32], [8 x i32]* %238, i64 0, i64 0
  store i32 %233, i32* %239, align 4
  %240 = load i64, i64* %11, align 8
  %241 = trunc i64 %240 to i32
  %242 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %243 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %242, i32 0, i32 0
  %244 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %243, align 8
  %245 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %244, i32 0, i32 6
  %246 = bitcast %union.anon* %245 to [8 x i32]*
  %247 = getelementptr inbounds [8 x i32], [8 x i32]* %246, i64 0, i64 1
  store i32 %241, i32* %247, align 4
  %248 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %249 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %248, i32 0, i32 0
  %250 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %249, align 8
  %251 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %250, i32 0, i32 1
  %252 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %251, align 8
  %253 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %254 = bitcast %struct.jpeg_compress_struct* %253 to %struct.jpeg_common_struct*
  %255 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %252 to i64
  call void @__llvm_profile_instrument_target(i64 %255, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 5)
  call void %252(%struct.jpeg_common_struct* %254, i32 1)
  br label %300

; <label>:256:                                    ; preds = %186
  %pgocount8 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 25)
  %257 = add i64 %pgocount8, 1
  store i64 %257, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 25)
  %258 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %259 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %258, i32 0, i32 0
  %260 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %259, align 8
  %261 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %260, i32 0, i32 5
  store i32 1010, i32* %261, align 8
  %262 = load i64, i64* %10, align 8
  %263 = trunc i64 %262 to i32
  %264 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %265 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %264, i32 0, i32 0
  %266 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %265, align 8
  %267 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %266, i32 0, i32 6
  %268 = bitcast %union.anon* %267 to [8 x i32]*
  %269 = getelementptr inbounds [8 x i32], [8 x i32]* %268, i64 0, i64 0
  store i32 %263, i32* %269, align 4
  %270 = load i64, i64* %11, align 8
  %271 = trunc i64 %270 to i32
  %272 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %273 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %272, i32 0, i32 0
  %274 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %273, align 8
  %275 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %274, i32 0, i32 6
  %276 = bitcast %union.anon* %275 to [8 x i32]*
  %277 = getelementptr inbounds [8 x i32], [8 x i32]* %276, i64 0, i64 1
  store i32 %271, i32* %277, align 4
  %278 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %279 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %278, i32 0, i32 0
  %280 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %279, align 8
  %281 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %280, i32 0, i32 1
  %282 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %281, align 8
  %283 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %284 = bitcast %struct.jpeg_compress_struct* %283 to %struct.jpeg_common_struct*
  %285 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %282 to i64
  call void @__llvm_profile_instrument_target(i64 %285, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 6)
  call void %282(%struct.jpeg_common_struct* %284, i32 1)
  br label %300

; <label>:286:                                    ; preds = %186
  %pgocount9 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 26)
  %287 = add i64 %pgocount9, 1
  store i64 %287, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 26)
  %288 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %289 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %288, i32 0, i32 0
  %290 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %289, align 8
  %291 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %290, i32 0, i32 5
  store i32 1002, i32* %291, align 8
  %292 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %293 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %292, i32 0, i32 0
  %294 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %293, align 8
  %295 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %294, i32 0, i32 0
  %296 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %295, align 8
  %297 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %298 = bitcast %struct.jpeg_compress_struct* %297 to %struct.jpeg_common_struct*
  %299 = ptrtoint void (%struct.jpeg_common_struct*)* %296 to i64
  call void @__llvm_profile_instrument_target(i64 %299, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 7)
  call void %296(%struct.jpeg_common_struct* %298)
  br label %300

; <label>:300:                                    ; preds = %286, %256, %226
  %301 = load i32, i32* %12, align 4
  %302 = icmp ne i32 %301, 1
  br i1 %302, label %303, label %317

; <label>:303:                                    ; preds = %300
  %pgocount10 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 23)
  %304 = add i64 %pgocount10, 1
  store i64 %304, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 23)
  %305 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %306 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %305, i32 0, i32 0
  %307 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %306, align 8
  %308 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %307, i32 0, i32 5
  store i32 1004, i32* %308, align 8
  %309 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %310 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %309, i32 0, i32 0
  %311 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %310, align 8
  %312 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %311, i32 0, i32 0
  %313 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %312, align 8
  %314 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %315 = bitcast %struct.jpeg_compress_struct* %314 to %struct.jpeg_common_struct*
  %316 = ptrtoint void (%struct.jpeg_common_struct*)* %313 to i64
  call void @__llvm_profile_instrument_target(i64 %316, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 8)
  call void %313(%struct.jpeg_common_struct* %315)
  br label %317

; <label>:317:                                    ; preds = %303, %300
  br label %616

; <label>:318:                                    ; preds = %._crit_edge, %182
  %319 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 4
  %320 = load i8, i8* %319, align 4
  %321 = zext i8 %320 to i32
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 5
  %324 = load i8, i8* %323, align 1
  %325 = zext i8 %324 to i32
  %326 = sext i32 %325 to i64
  %327 = shl i64 %326, 8
  %328 = add nsw i64 %322, %327
  %329 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 6
  %330 = load i8, i8* %329, align 2
  %331 = zext i8 %330 to i32
  %332 = sext i32 %331 to i64
  %333 = shl i64 %332, 16
  %334 = add nsw i64 %328, %333
  %335 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 7
  %336 = load i8, i8* %335, align 1
  %337 = zext i8 %336 to i32
  %338 = sext i32 %337 to i64
  %339 = shl i64 %338, 24
  %340 = add nsw i64 %334, %339
  store i64 %340, i64* %10, align 8
  %341 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 8
  %342 = load i8, i8* %341, align 8
  %343 = zext i8 %342 to i32
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 9
  %346 = load i8, i8* %345, align 1
  %347 = zext i8 %346 to i32
  %348 = sext i32 %347 to i64
  %349 = shl i64 %348, 8
  %350 = add nsw i64 %344, %349
  %351 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 10
  %352 = load i8, i8* %351, align 2
  %353 = zext i8 %352 to i32
  %354 = sext i32 %353 to i64
  %355 = shl i64 %354, 16
  %356 = add nsw i64 %350, %355
  %357 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 11
  %358 = load i8, i8* %357, align 1
  %359 = zext i8 %358 to i32
  %360 = sext i32 %359 to i64
  %361 = shl i64 %360, 24
  %362 = add nsw i64 %356, %361
  store i64 %362, i64* %11, align 8
  %363 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 12
  %364 = load i8, i8* %363, align 4
  %365 = zext i8 %364 to i32
  %366 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 13
  %367 = load i8, i8* %366, align 1
  %368 = zext i8 %367 to i32
  %369 = shl i32 %368, 8
  %370 = add i32 %365, %369
  store i32 %370, i32* %12, align 4
  %371 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 14
  %372 = load i8, i8* %371, align 2
  %373 = zext i8 %372 to i32
  %374 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 15
  %375 = load i8, i8* %374, align 1
  %376 = zext i8 %375 to i32
  %377 = shl i32 %376, 8
  %378 = add i32 %373, %377
  %379 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %380 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %379, i32 0, i32 6
  store i32 %378, i32* %380, align 8
  %381 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 16
  %382 = load i8, i8* %381, align 16
  %383 = zext i8 %382 to i32
  %384 = sext i32 %383 to i64
  %385 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 17
  %386 = load i8, i8* %385, align 1
  %387 = zext i8 %386 to i32
  %388 = sext i32 %387 to i64
  %389 = shl i64 %388, 8
  %390 = add nsw i64 %384, %389
  %391 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 18
  %392 = load i8, i8* %391, align 2
  %393 = zext i8 %392 to i32
  %394 = sext i32 %393 to i64
  %395 = shl i64 %394, 16
  %396 = add nsw i64 %390, %395
  %397 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 19
  %398 = load i8, i8* %397, align 1
  %399 = zext i8 %398 to i32
  %400 = sext i32 %399 to i64
  %401 = shl i64 %400, 24
  %402 = add nsw i64 %396, %401
  store i64 %402, i64* %13, align 8
  %403 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 24
  %404 = load i8, i8* %403, align 8
  %405 = zext i8 %404 to i32
  %406 = sext i32 %405 to i64
  %407 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 25
  %408 = load i8, i8* %407, align 1
  %409 = zext i8 %408 to i32
  %410 = sext i32 %409 to i64
  %411 = shl i64 %410, 8
  %412 = add nsw i64 %406, %411
  %413 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 26
  %414 = load i8, i8* %413, align 2
  %415 = zext i8 %414 to i32
  %416 = sext i32 %415 to i64
  %417 = shl i64 %416, 16
  %418 = add nsw i64 %412, %417
  %419 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 27
  %420 = load i8, i8* %419, align 1
  %421 = zext i8 %420 to i32
  %422 = sext i32 %421 to i64
  %423 = shl i64 %422, 24
  %424 = add nsw i64 %418, %423
  store i64 %424, i64* %14, align 8
  %425 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 28
  %426 = load i8, i8* %425, align 4
  %427 = zext i8 %426 to i32
  %428 = sext i32 %427 to i64
  %429 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 29
  %430 = load i8, i8* %429, align 1
  %431 = zext i8 %430 to i32
  %432 = sext i32 %431 to i64
  %433 = shl i64 %432, 8
  %434 = add nsw i64 %428, %433
  %435 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 30
  %436 = load i8, i8* %435, align 2
  %437 = zext i8 %436 to i32
  %438 = sext i32 %437 to i64
  %439 = shl i64 %438, 16
  %440 = add nsw i64 %434, %439
  %441 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 31
  %442 = load i8, i8* %441, align 1
  %443 = zext i8 %442 to i32
  %444 = sext i32 %443 to i64
  %445 = shl i64 %444, 24
  %446 = add nsw i64 %440, %445
  store i64 %446, i64* %15, align 8
  %447 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 32
  %448 = load i8, i8* %447, align 16
  %449 = zext i8 %448 to i32
  %450 = sext i32 %449 to i64
  %451 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 33
  %452 = load i8, i8* %451, align 1
  %453 = zext i8 %452 to i32
  %454 = sext i32 %453 to i64
  %455 = shl i64 %454, 8
  %456 = add nsw i64 %450, %455
  %457 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 34
  %458 = load i8, i8* %457, align 2
  %459 = zext i8 %458 to i32
  %460 = sext i32 %459 to i64
  %461 = shl i64 %460, 16
  %462 = add nsw i64 %456, %461
  %463 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 35
  %464 = load i8, i8* %463, align 1
  %465 = zext i8 %464 to i32
  %466 = sext i32 %465 to i64
  %467 = shl i64 %466, 24
  %468 = add nsw i64 %462, %467
  store i64 %468, i64* %16, align 8
  %469 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %470 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %469, i32 0, i32 6
  %471 = load i32, i32* %470, align 8
  switch i32 %471, label %532 [
    i32 8, label %472
    i32 24, label %502
  ]

; <label>:472:                                    ; preds = %318
  %pgocount11 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 20)
  %473 = add i64 %pgocount11, 1
  store i64 %473, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 20)
  store i32 4, i32* %17, align 4
  %474 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %475 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %474, i32 0, i32 0
  %476 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %475, align 8
  %477 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %476, i32 0, i32 5
  store i32 1009, i32* %477, align 8
  %478 = load i64, i64* %10, align 8
  %479 = trunc i64 %478 to i32
  %480 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %481 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %480, i32 0, i32 0
  %482 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %481, align 8
  %483 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %482, i32 0, i32 6
  %484 = bitcast %union.anon* %483 to [8 x i32]*
  %485 = getelementptr inbounds [8 x i32], [8 x i32]* %484, i64 0, i64 0
  store i32 %479, i32* %485, align 4
  %486 = load i64, i64* %11, align 8
  %487 = trunc i64 %486 to i32
  %488 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %489 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %488, i32 0, i32 0
  %490 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %489, align 8
  %491 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %490, i32 0, i32 6
  %492 = bitcast %union.anon* %491 to [8 x i32]*
  %493 = getelementptr inbounds [8 x i32], [8 x i32]* %492, i64 0, i64 1
  store i32 %487, i32* %493, align 4
  %494 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %495 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %494, i32 0, i32 0
  %496 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %495, align 8
  %497 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %496, i32 0, i32 1
  %498 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %497, align 8
  %499 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %500 = bitcast %struct.jpeg_compress_struct* %499 to %struct.jpeg_common_struct*
  %501 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %498 to i64
  call void @__llvm_profile_instrument_target(i64 %501, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 9)
  call void %498(%struct.jpeg_common_struct* %500, i32 1)
  br label %546

; <label>:502:                                    ; preds = %318
  %pgocount12 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 19)
  %503 = add i64 %pgocount12, 1
  store i64 %503, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 19)
  %504 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %505 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %504, i32 0, i32 0
  %506 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %505, align 8
  %507 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %506, i32 0, i32 5
  store i32 1008, i32* %507, align 8
  %508 = load i64, i64* %10, align 8
  %509 = trunc i64 %508 to i32
  %510 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %511 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %510, i32 0, i32 0
  %512 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %511, align 8
  %513 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %512, i32 0, i32 6
  %514 = bitcast %union.anon* %513 to [8 x i32]*
  %515 = getelementptr inbounds [8 x i32], [8 x i32]* %514, i64 0, i64 0
  store i32 %509, i32* %515, align 4
  %516 = load i64, i64* %11, align 8
  %517 = trunc i64 %516 to i32
  %518 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %519 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %518, i32 0, i32 0
  %520 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %519, align 8
  %521 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %520, i32 0, i32 6
  %522 = bitcast %union.anon* %521 to [8 x i32]*
  %523 = getelementptr inbounds [8 x i32], [8 x i32]* %522, i64 0, i64 1
  store i32 %517, i32* %523, align 4
  %524 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %525 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %524, i32 0, i32 0
  %526 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %525, align 8
  %527 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %526, i32 0, i32 1
  %528 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %527, align 8
  %529 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %530 = bitcast %struct.jpeg_compress_struct* %529 to %struct.jpeg_common_struct*
  %531 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %528 to i64
  call void @__llvm_profile_instrument_target(i64 %531, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 10)
  call void %528(%struct.jpeg_common_struct* %530, i32 1)
  br label %546

; <label>:532:                                    ; preds = %318
  %pgocount13 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 21)
  %533 = add i64 %pgocount13, 1
  store i64 %533, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 21)
  %534 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %535 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %534, i32 0, i32 0
  %536 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %535, align 8
  %537 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %536, i32 0, i32 5
  store i32 1002, i32* %537, align 8
  %538 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %539 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %538, i32 0, i32 0
  %540 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %539, align 8
  %541 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %540, i32 0, i32 0
  %542 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %541, align 8
  %543 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %544 = bitcast %struct.jpeg_compress_struct* %543 to %struct.jpeg_common_struct*
  %545 = ptrtoint void (%struct.jpeg_common_struct*)* %542 to i64
  call void @__llvm_profile_instrument_target(i64 %545, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 11)
  call void %542(%struct.jpeg_common_struct* %544)
  br label %546

; <label>:546:                                    ; preds = %532, %502, %472
  %547 = load i32, i32* %12, align 4
  %548 = icmp ne i32 %547, 1
  br i1 %548, label %549, label %563

; <label>:549:                                    ; preds = %546
  %pgocount14 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 16)
  %550 = add i64 %pgocount14, 1
  store i64 %550, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 16)
  %551 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %552 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %551, i32 0, i32 0
  %553 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %552, align 8
  %554 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %553, i32 0, i32 5
  store i32 1004, i32* %554, align 8
  %555 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %556 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %555, i32 0, i32 0
  %557 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %556, align 8
  %558 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %557, i32 0, i32 0
  %559 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %558, align 8
  %560 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %561 = bitcast %struct.jpeg_compress_struct* %560 to %struct.jpeg_common_struct*
  %562 = ptrtoint void (%struct.jpeg_common_struct*)* %559 to i64
  call void @__llvm_profile_instrument_target(i64 %562, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 12)
  call void %559(%struct.jpeg_common_struct* %561)
  br label %563

; <label>:563:                                    ; preds = %549, %546
  %564 = load i64, i64* %13, align 8
  %565 = icmp ne i64 %564, 0
  br i1 %565, label %566, label %580

; <label>:566:                                    ; preds = %563
  %pgocount15 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 12)
  %567 = add i64 %pgocount15, 1
  store i64 %567, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 12)
  %568 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %569 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %568, i32 0, i32 0
  %570 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %569, align 8
  %571 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %570, i32 0, i32 5
  store i32 1006, i32* %571, align 8
  %572 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %573 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %572, i32 0, i32 0
  %574 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %573, align 8
  %575 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %574, i32 0, i32 0
  %576 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %575, align 8
  %577 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %578 = bitcast %struct.jpeg_compress_struct* %577 to %struct.jpeg_common_struct*
  %579 = ptrtoint void (%struct.jpeg_common_struct*)* %576 to i64
  call void @__llvm_profile_instrument_target(i64 %579, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 13)
  call void %576(%struct.jpeg_common_struct* %578)
  br label %580

; <label>:580:                                    ; preds = %566, %563
  %581 = load i64, i64* %14, align 8
  %582 = icmp sgt i64 %581, 0
  br i1 %582, label %583, label %601

; <label>:583:                                    ; preds = %580
  %pgocount16 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 13)
  %584 = add i64 %pgocount16, 1
  store i64 %584, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 13)
  %585 = load i64, i64* %15, align 8
  %586 = icmp sgt i64 %585, 0
  br i1 %586, label %587, label %601

; <label>:587:                                    ; preds = %583
  %pgocount17 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 18)
  %588 = add i64 %pgocount17, 1
  store i64 %588, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 18)
  %589 = load i64, i64* %14, align 8
  %590 = sdiv i64 %589, 100
  %591 = trunc i64 %590 to i16
  %592 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %593 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %592, i32 0, i32 33
  store i16 %591, i16* %593, align 2
  %594 = load i64, i64* %15, align 8
  %595 = sdiv i64 %594, 100
  %596 = trunc i64 %595 to i16
  %597 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %598 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %597, i32 0, i32 34
  store i16 %596, i16* %598, align 8
  %599 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %600 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %599, i32 0, i32 32
  store i8 2, i8* %600, align 4
  br label %601

; <label>:601:                                    ; preds = %587, %583, %580
  br label %616

; <label>:602:                                    ; preds = %182
  %pgocount18 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 17)
  %603 = add i64 %pgocount18, 1
  store i64 %603, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 17)
  %604 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %605 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %604, i32 0, i32 0
  %606 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %605, align 8
  %607 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %606, i32 0, i32 5
  store i32 1003, i32* %607, align 8
  %608 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %609 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %608, i32 0, i32 0
  %610 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %609, align 8
  %611 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %610, i32 0, i32 0
  %612 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %611, align 8
  %613 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %614 = bitcast %struct.jpeg_compress_struct* %613 to %struct.jpeg_common_struct*
  %615 = ptrtoint void (%struct.jpeg_common_struct*)* %612 to i64
  call void @__llvm_profile_instrument_target(i64 %615, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 14)
  call void %612(%struct.jpeg_common_struct* %614)
  br label %616

; <label>:616:                                    ; preds = %602, %601, %317
  %617 = load i64, i64* %8, align 8
  %618 = load i64, i64* %9, align 8
  %619 = add nsw i64 %618, 14
  %620 = sub nsw i64 %617, %619
  store i64 %620, i64* %18, align 8
  %621 = load i32, i32* %17, align 4
  %622 = icmp sgt i32 %621, 0
  br i1 %622, label %623, label %671

; <label>:623:                                    ; preds = %616
  %624 = load i64, i64* %16, align 8
  %625 = icmp sle i64 %624, 0
  br i1 %625, label %626, label %628

; <label>:626:                                    ; preds = %623
  %pgocount19 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 14)
  %627 = add i64 %pgocount19, 1
  store i64 %627, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 14)
  store i64 256, i64* %16, align 8
  br label %647

; <label>:628:                                    ; preds = %623
  %629 = load i64, i64* %16, align 8
  %630 = icmp sgt i64 %629, 256
  br i1 %630, label %631, label %645

; <label>:631:                                    ; preds = %628
  %pgocount20 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 22)
  %632 = add i64 %pgocount20, 1
  store i64 %632, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 22)
  %633 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %634 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %633, i32 0, i32 0
  %635 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %634, align 8
  %636 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %635, i32 0, i32 5
  store i32 1001, i32* %636, align 8
  %637 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %638 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %637, i32 0, i32 0
  %639 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %638, align 8
  %640 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %639, i32 0, i32 0
  %641 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %640, align 8
  %642 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %643 = bitcast %struct.jpeg_compress_struct* %642 to %struct.jpeg_common_struct*
  %644 = ptrtoint void (%struct.jpeg_common_struct*)* %641 to i64
  call void @__llvm_profile_instrument_target(i64 %644, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 15)
  call void %641(%struct.jpeg_common_struct* %643)
  br label %645

; <label>:645:                                    ; preds = %631, %628
  %pgocount21 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 15)
  %646 = add i64 %pgocount21, 1
  store i64 %646, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 15)
  br label %647

; <label>:647:                                    ; preds = %645, %626
  %648 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %649 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %648, i32 0, i32 1
  %650 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %649, align 8
  %651 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %650, i32 0, i32 2
  %652 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %651, align 8
  %653 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %654 = bitcast %struct.jpeg_compress_struct* %653 to %struct.jpeg_common_struct*
  %655 = load i64, i64* %16, align 8
  %656 = trunc i64 %655 to i32
  %657 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %652 to i64
  call void @__llvm_profile_instrument_target(i64 %657, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 16)
  %658 = call i8** %652(%struct.jpeg_common_struct* %654, i32 1, i32 %656, i32 3)
  %659 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %660 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %659, i32 0, i32 2
  store i8** %658, i8*** %660, align 8
  %661 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %662 = load i64, i64* %16, align 8
  %663 = trunc i64 %662 to i32
  %664 = load i32, i32* %17, align 4
  call void @read_colormap(%struct._bmp_source_struct* %661, i32 %663, i32 %664)
  %665 = load i64, i64* %16, align 8
  %666 = load i32, i32* %17, align 4
  %667 = sext i32 %666 to i64
  %668 = mul nsw i64 %665, %667
  %669 = load i64, i64* %18, align 8
  %670 = sub nsw i64 %669, %668
  store i64 %670, i64* %18, align 8
  br label %671

; <label>:671:                                    ; preds = %647, %616
  %672 = load i64, i64* %18, align 8
  %673 = icmp slt i64 %672, 0
  br i1 %673, label %674, label %688

; <label>:674:                                    ; preds = %671
  %pgocount22 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 11)
  %675 = add i64 %pgocount22, 1
  store i64 %675, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 11)
  %676 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %677 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %676, i32 0, i32 0
  %678 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %677, align 8
  %679 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %678, i32 0, i32 5
  store i32 1003, i32* %679, align 8
  %680 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %681 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %680, i32 0, i32 0
  %682 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %681, align 8
  %683 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %682, i32 0, i32 0
  %684 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %683, align 8
  %685 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %686 = bitcast %struct.jpeg_compress_struct* %685 to %struct.jpeg_common_struct*
  %687 = ptrtoint void (%struct.jpeg_common_struct*)* %684 to i64
  call void @__llvm_profile_instrument_target(i64 %687, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 17)
  call void %684(%struct.jpeg_common_struct* %686)
  br label %688

; <label>:688:                                    ; preds = %674, %671
  br label %689

; <label>:689:                                    ; preds = %693, %688
  %690 = load i64, i64* %18, align 8
  %691 = add nsw i64 %690, -1
  store i64 %691, i64* %18, align 8
  %692 = icmp sge i64 %691, 0
  br i1 %692, label %693, label %697

; <label>:693:                                    ; preds = %689
  %pgocount23 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 1)
  %694 = add i64 %pgocount23, 1
  store i64 %694, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 1)
  %695 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %696 = call i32 @read_byte(%struct._bmp_source_struct* %695)
  br label %689

; <label>:697:                                    ; preds = %689
  %698 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %699 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %698, i32 0, i32 6
  %700 = load i32, i32* %699, align 8
  %701 = icmp eq i32 %700, 24
  br i1 %701, label %702, label %706

; <label>:702:                                    ; preds = %697
  %703 = load i64, i64* %10, align 8
  %704 = mul nsw i64 %703, 3
  %705 = trunc i64 %704 to i32
  store i32 %705, i32* %19, align 4
  br label %710

; <label>:706:                                    ; preds = %697
  %pgocount24 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 10)
  %707 = add i64 %pgocount24, 1
  store i64 %707, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 10)
  %708 = load i64, i64* %10, align 8
  %709 = trunc i64 %708 to i32
  store i32 %709, i32* %19, align 4
  br label %710

; <label>:710:                                    ; preds = %706, %702
  br label %711

; <label>:711:                                    ; preds = %715, %710
  %712 = load i32, i32* %19, align 4
  %713 = and i32 %712, 3
  %714 = icmp ne i32 %713, 0
  br i1 %714, label %715, label %719

; <label>:715:                                    ; preds = %711
  %pgocount25 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 2)
  %716 = add i64 %pgocount25, 1
  store i64 %716, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 2)
  %717 = load i32, i32* %19, align 4
  %718 = add i32 %717, 1
  store i32 %718, i32* %19, align 4
  br label %711

; <label>:719:                                    ; preds = %711
  %720 = load i32, i32* %19, align 4
  %721 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %722 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %721, i32 0, i32 5
  store i32 %720, i32* %722, align 4
  %723 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %724 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %723, i32 0, i32 1
  %725 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %724, align 8
  %726 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %725, i32 0, i32 4
  %727 = load %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %726, align 8
  %728 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %729 = bitcast %struct.jpeg_compress_struct* %728 to %struct.jpeg_common_struct*
  %730 = load i32, i32* %19, align 4
  %731 = load i64, i64* %11, align 8
  %732 = trunc i64 %731 to i32
  %733 = ptrtoint %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)* %727 to i64
  call void @__llvm_profile_instrument_target(i64 %733, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 18)
  %734 = call %struct.jvirt_sarray_control* %727(%struct.jpeg_common_struct* %729, i32 1, i32 0, i32 %730, i32 %732, i32 1)
  %735 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %736 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %735, i32 0, i32 3
  store %struct.jvirt_sarray_control* %734, %struct.jvirt_sarray_control** %736, align 8
  %737 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %738 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %737, i32 0, i32 0
  %739 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %738, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @preload_image, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %739, align 8
  %740 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %741 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %740, i32 0, i32 2
  %742 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %741, align 8
  %743 = icmp ne %struct.jpeg_progress_mgr* %742, null
  br i1 %743, label %744, label %754

; <label>:744:                                    ; preds = %719
  %pgocount26 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 4)
  %745 = add i64 %pgocount26, 1
  store i64 %745, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_tmp1.ll_start_input_bmp, i64 0, i64 4)
  %746 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %747 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %746, i32 0, i32 2
  %748 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %747, align 8
  %749 = bitcast %struct.jpeg_progress_mgr* %748 to %struct.cdjpeg_progress_mgr*
  store %struct.cdjpeg_progress_mgr* %749, %struct.cdjpeg_progress_mgr** %20, align 8
  %750 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %20, align 8
  %751 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %750, i32 0, i32 2
  %752 = load i32, i32* %751, align 4
  %753 = add nsw i32 %752, 1
  store i32 %753, i32* %751, align 4
  br label %754

; <label>:754:                                    ; preds = %744, %719
  %755 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %756 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %755, i32 0, i32 1
  %757 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %756, align 8
  %758 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %757, i32 0, i32 2
  %759 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %758, align 8
  %760 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %761 = bitcast %struct.jpeg_compress_struct* %760 to %struct.jpeg_common_struct*
  %762 = load i64, i64* %10, align 8
  %763 = mul nsw i64 %762, 3
  %764 = trunc i64 %763 to i32
  %765 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %759 to i64
  call void @__llvm_profile_instrument_target(i64 %765, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_bmp to i8*), i32 19)
  %766 = call i8** %759(%struct.jpeg_common_struct* %761, i32 1, i32 %764, i32 1)
  %767 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %768 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %767, i32 0, i32 0
  %769 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %768, i32 0, i32 4
  store i8** %766, i8*** %769, align 8
  %770 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %771 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %770, i32 0, i32 0
  %772 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %771, i32 0, i32 5
  store i32 1, i32* %772, align 8
  %773 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %774 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %773, i32 0, i32 9
  store i32 2, i32* %774, align 4
  %775 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %776 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %775, i32 0, i32 8
  store i32 3, i32* %776, align 8
  %777 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %778 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %777, i32 0, i32 11
  store i32 8, i32* %778, align 8
  %779 = load i64, i64* %10, align 8
  %780 = trunc i64 %779 to i32
  %781 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %782 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %781, i32 0, i32 6
  store i32 %780, i32* %782, align 8
  %783 = load i64, i64* %11, align 8
  %784 = trunc i64 %783 to i32
  %785 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %786 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %785, i32 0, i32 7
  store i32 %784, i32* %786, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_input_bmp(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_input_bmp, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish_input_bmp, i64 0, i64 0)
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca %struct.cjpeg_source_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %5, align 8
  ret void
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @read_colormap(%struct._bmp_source_struct*, i32, i32) #0 {
  %4 = alloca %struct._bmp_source_struct*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct._bmp_source_struct* %0, %struct._bmp_source_struct** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %8 = load i32, i32* %6, align 4
  switch i32 %8, label %101 [
    i32 3, label %9
    i32 4, label %54
  ]

; <label>:9:                                      ; preds = %3
  store i32 0, i32* %7, align 4
  br label %10

; <label>:10:                                     ; preds = %49, %9
  %11 = load i32, i32* %7, align 4
  %12 = load i32, i32* %5, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %52

; <label>:14:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_colormap, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_colormap, i64 0, i64 1)
  %16 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %17 = call i32 @read_byte(%struct._bmp_source_struct* %16)
  %18 = trunc i32 %17 to i8
  %19 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %20 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %19, i32 0, i32 2
  %21 = load i8**, i8*** %20, align 8
  %22 = getelementptr inbounds i8*, i8** %21, i64 2
  %23 = load i8*, i8** %22, align 8
  %24 = load i32, i32* %7, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i8, i8* %23, i64 %25
  store i8 %18, i8* %26, align 1
  %27 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %28 = call i32 @read_byte(%struct._bmp_source_struct* %27)
  %29 = trunc i32 %28 to i8
  %30 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %31 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %30, i32 0, i32 2
  %32 = load i8**, i8*** %31, align 8
  %33 = getelementptr inbounds i8*, i8** %32, i64 1
  %34 = load i8*, i8** %33, align 8
  %35 = load i32, i32* %7, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8* %34, i64 %36
  store i8 %29, i8* %37, align 1
  %38 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %39 = call i32 @read_byte(%struct._bmp_source_struct* %38)
  %40 = trunc i32 %39 to i8
  %41 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %42 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %41, i32 0, i32 2
  %43 = load i8**, i8*** %42, align 8
  %44 = getelementptr inbounds i8*, i8** %43, i64 0
  %45 = load i8*, i8** %44, align 8
  %46 = load i32, i32* %7, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i8, i8* %45, i64 %47
  store i8 %40, i8* %48, align 1
  br label %49

; <label>:49:                                     ; preds = %14
  %50 = load i32, i32* %7, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %7, align 4
  br label %10

; <label>:52:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_colormap, i64 0, i64 3)
  %53 = add i64 %pgocount1, 1
  store i64 %53, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_colormap, i64 0, i64 3)
  br label %121

; <label>:54:                                     ; preds = %3
  store i32 0, i32* %7, align 4
  br label %55

; <label>:55:                                     ; preds = %95, %54
  %56 = load i32, i32* %7, align 4
  %57 = load i32, i32* %5, align 4
  %58 = icmp slt i32 %56, %57
  br i1 %58, label %59, label %99

; <label>:59:                                     ; preds = %55
  %60 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %61 = call i32 @read_byte(%struct._bmp_source_struct* %60)
  %62 = trunc i32 %61 to i8
  %63 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %64 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %63, i32 0, i32 2
  %65 = load i8**, i8*** %64, align 8
  %66 = getelementptr inbounds i8*, i8** %65, i64 2
  %67 = load i8*, i8** %66, align 8
  %68 = load i32, i32* %7, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8* %67, i64 %69
  store i8 %62, i8* %70, align 1
  %71 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %72 = call i32 @read_byte(%struct._bmp_source_struct* %71)
  %73 = trunc i32 %72 to i8
  %74 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %75 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %74, i32 0, i32 2
  %76 = load i8**, i8*** %75, align 8
  %77 = getelementptr inbounds i8*, i8** %76, i64 1
  %78 = load i8*, i8** %77, align 8
  %79 = load i32, i32* %7, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8* %78, i64 %80
  store i8 %73, i8* %81, align 1
  %82 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %83 = call i32 @read_byte(%struct._bmp_source_struct* %82)
  %84 = trunc i32 %83 to i8
  %85 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %86 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %85, i32 0, i32 2
  %87 = load i8**, i8*** %86, align 8
  %88 = getelementptr inbounds i8*, i8** %87, i64 0
  %89 = load i8*, i8** %88, align 8
  %90 = load i32, i32* %7, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8* %89, i64 %91
  store i8 %84, i8* %92, align 1
  %93 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %94 = call i32 @read_byte(%struct._bmp_source_struct* %93)
  br label %95

; <label>:95:                                     ; preds = %59
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_colormap, i64 0, i64 0)
  %96 = add i64 %pgocount2, 1
  store i64 %96, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_colormap, i64 0, i64 0)
  %97 = load i32, i32* %7, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %7, align 4
  br label %55

; <label>:99:                                     ; preds = %55
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_colormap, i64 0, i64 2)
  %100 = add i64 %pgocount3, 1
  store i64 %100, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_colormap, i64 0, i64 2)
  br label %121

; <label>:101:                                    ; preds = %3
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_colormap, i64 0, i64 4)
  %102 = add i64 %pgocount4, 1
  store i64 %102, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_read_colormap, i64 0, i64 4)
  %103 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %104 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %103, i32 0, i32 1
  %105 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %104, align 8
  %106 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %105, i32 0, i32 0
  %107 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %106, align 8
  %108 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %107, i32 0, i32 5
  store i32 1001, i32* %108, align 8
  %109 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %110 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %109, i32 0, i32 1
  %111 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %110, align 8
  %112 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %111, i32 0, i32 0
  %113 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %112, align 8
  %114 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %113, i32 0, i32 0
  %115 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %114, align 8
  %116 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %4, align 8
  %117 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %116, i32 0, i32 1
  %118 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %117, align 8
  %119 = bitcast %struct.jpeg_compress_struct* %118 to %struct.jpeg_common_struct*
  %120 = ptrtoint void (%struct.jpeg_common_struct*)* %115 to i64
  call void @__llvm_profile_instrument_target(i64 %120, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_colormap to i8*), i32 0)
  call void %115(%struct.jpeg_common_struct* %119)
  br label %121

; <label>:121:                                    ; preds = %101, %99, %52
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @read_byte(%struct._bmp_source_struct*) #0 {
  %2 = alloca %struct._bmp_source_struct*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i32, align 4
  store %struct._bmp_source_struct* %0, %struct._bmp_source_struct** %2, align 8
  %5 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %2, align 8
  %6 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %5, i32 0, i32 0
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
  %14 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %2, align 8
  %15 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %14, i32 0, i32 1
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 0
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i32 0, i32 5
  store i32 42, i32* %19, align 8
  %20 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %2, align 8
  %21 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %20, i32 0, i32 1
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i32 0, i32 0
  %26 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %25, align 8
  %27 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %2, align 8
  %28 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %27, i32 0, i32 1
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

; Function Attrs: noinline nounwind uwtable
define internal i32 @preload_image(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct._bmp_source_struct*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i8**, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.cdjpeg_progress_mgr*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %13 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %14 = bitcast %struct.cjpeg_source_struct* %13 to %struct._bmp_source_struct*
  store %struct._bmp_source_struct* %14, %struct._bmp_source_struct** %5, align 8
  %15 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %16 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %15, i32 0, i32 0
  %17 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %16, i32 0, i32 3
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  store %struct._IO_FILE* %18, %struct._IO_FILE** %6, align 8
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 2
  %21 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %20, align 8
  %22 = bitcast %struct.jpeg_progress_mgr* %21 to %struct.cdjpeg_progress_mgr*
  store %struct.cdjpeg_progress_mgr* %22, %struct.cdjpeg_progress_mgr** %12, align 8
  store i32 0, i32* %10, align 4
  br label %23

; <label>:23:                                     ; preds = %105, %2
  %24 = load i32, i32* %10, align 4
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 7
  %27 = load i32, i32* %26, align 4
  %28 = icmp ult i32 %24, %27
  br i1 %28, label %29, label %109

; <label>:29:                                     ; preds = %23
  %30 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %12, align 8
  %31 = icmp ne %struct.cdjpeg_progress_mgr* %30, null
  br i1 %31, label %32, label %54

; <label>:32:                                     ; preds = %29
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 3)
  %33 = add i64 %pgocount, 1
  store i64 %33, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 3)
  %34 = load i32, i32* %10, align 4
  %35 = zext i32 %34 to i64
  %36 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %12, align 8
  %37 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %36, i32 0, i32 0
  %38 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %37, i32 0, i32 1
  store i64 %35, i64* %38, align 8
  %39 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %40 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %39, i32 0, i32 7
  %41 = load i32, i32* %40, align 4
  %42 = zext i32 %41 to i64
  %43 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %12, align 8
  %44 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %43, i32 0, i32 0
  %45 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %44, i32 0, i32 2
  store i64 %42, i64* %45, align 8
  %46 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %12, align 8
  %47 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %46, i32 0, i32 0
  %48 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %47, i32 0, i32 0
  %49 = bitcast {}** %48 to void (%struct.jpeg_common_struct*)**
  %50 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %49, align 8
  %51 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %52 = bitcast %struct.jpeg_compress_struct* %51 to %struct.jpeg_common_struct*
  %53 = ptrtoint void (%struct.jpeg_common_struct*)* %50 to i64
  call void @__llvm_profile_instrument_target(i64 %53, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_preload_image to i8*), i32 0)
  call void %50(%struct.jpeg_common_struct* %52)
  br label %54

; <label>:54:                                     ; preds = %32, %29
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %55, i32 0, i32 1
  %57 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %56, align 8
  %58 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %57, i32 0, i32 7
  %59 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %58, align 8
  %60 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %61 = bitcast %struct.jpeg_compress_struct* %60 to %struct.jpeg_common_struct*
  %62 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %63 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %62, i32 0, i32 3
  %64 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %63, align 8
  %65 = load i32, i32* %10, align 4
  %66 = ptrtoint i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)* %59 to i64
  call void @__llvm_profile_instrument_target(i64 %66, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_preload_image to i8*), i32 1)
  %67 = call i8** %59(%struct.jpeg_common_struct* %61, %struct.jvirt_sarray_control* %64, i32 %65, i32 1, i32 1)
  store i8** %67, i8*** %9, align 8
  %68 = load i8**, i8*** %9, align 8
  %69 = getelementptr inbounds i8*, i8** %68, i64 0
  %70 = load i8*, i8** %69, align 8
  store i8* %70, i8** %8, align 8
  %71 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %72 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %71, i32 0, i32 5
  %73 = load i32, i32* %72, align 4
  store i32 %73, i32* %11, align 4
  br label %74

; <label>:74:                                     ; preds = %100, %54
  %75 = load i32, i32* %11, align 4
  %76 = icmp ugt i32 %75, 0
  br i1 %76, label %77, label %104

; <label>:77:                                     ; preds = %74
  %78 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %79 = call i32 @_IO_getc(%struct._IO_FILE* %78)
  store i32 %79, i32* %7, align 4
  %80 = icmp eq i32 %79, -1
  br i1 %80, label %81, label %95

; <label>:81:                                     ; preds = %77
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 1)
  %82 = add i64 %pgocount1, 1
  store i64 %82, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 1)
  %83 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %84 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %83, i32 0, i32 0
  %85 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %84, align 8
  %86 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %85, i32 0, i32 5
  store i32 42, i32* %86, align 8
  %87 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %88 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %87, i32 0, i32 0
  %89 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %88, align 8
  %90 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %89, i32 0, i32 0
  %91 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %90, align 8
  %92 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %93 = bitcast %struct.jpeg_compress_struct* %92 to %struct.jpeg_common_struct*
  %94 = ptrtoint void (%struct.jpeg_common_struct*)* %91 to i64
  call void @__llvm_profile_instrument_target(i64 %94, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_preload_image to i8*), i32 2)
  call void %91(%struct.jpeg_common_struct* %93)
  br label %95

; <label>:95:                                     ; preds = %81, %77
  %96 = load i32, i32* %7, align 4
  %97 = trunc i32 %96 to i8
  %98 = load i8*, i8** %8, align 8
  %99 = getelementptr inbounds i8, i8* %98, i32 1
  store i8* %99, i8** %8, align 8
  store i8 %97, i8* %98, align 1
  br label %100

; <label>:100:                                    ; preds = %95
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 0)
  %101 = add i64 %pgocount2, 1
  store i64 %101, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 0)
  %102 = load i32, i32* %11, align 4
  %103 = add i32 %102, -1
  store i32 %103, i32* %11, align 4
  br label %74

; <label>:104:                                    ; preds = %74
  br label %105

; <label>:105:                                    ; preds = %104
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 2)
  %106 = add i64 %pgocount3, 1
  store i64 %106, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 2)
  %107 = load i32, i32* %10, align 4
  %108 = add i32 %107, 1
  store i32 %108, i32* %10, align 4
  br label %23

; <label>:109:                                    ; preds = %23
  %110 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %12, align 8
  %111 = icmp ne %struct.cdjpeg_progress_mgr* %110, null
  br i1 %111, label %112, label %118

; <label>:112:                                    ; preds = %109
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 4)
  %113 = add i64 %pgocount4, 1
  store i64 %113, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 4)
  %114 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %12, align 8
  %115 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %114, i32 0, i32 1
  %116 = load i32, i32* %115, align 8
  %117 = add nsw i32 %116, 1
  store i32 %117, i32* %115, align 8
  br label %118

; <label>:118:                                    ; preds = %112, %109
  %119 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %120 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %119, i32 0, i32 6
  %121 = load i32, i32* %120, align 8
  switch i32 %121, label %132 [
    i32 8, label %122
    i32 24, label %127
  ]

; <label>:122:                                    ; preds = %118
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 6)
  %123 = add i64 %pgocount5, 1
  store i64 %123, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 6)
  %124 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %125 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %124, i32 0, i32 0
  %126 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %125, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_8bit_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %126, align 8
  br label %146

; <label>:127:                                    ; preds = %118
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 5)
  %128 = add i64 %pgocount6, 1
  store i64 %128, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 5)
  %129 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %130 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %129, i32 0, i32 0
  %131 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %130, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_24bit_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %131, align 8
  br label %146

; <label>:132:                                    ; preds = %118
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 7)
  %133 = add i64 %pgocount7, 1
  store i64 %133, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_preload_image, i64 0, i64 7)
  %134 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %135 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %134, i32 0, i32 0
  %136 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %135, align 8
  %137 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i32 0, i32 5
  store i32 1002, i32* %137, align 8
  %138 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %139 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %138, i32 0, i32 0
  %140 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %139, align 8
  %141 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %140, i32 0, i32 0
  %142 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %141, align 8
  %143 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %144 = bitcast %struct.jpeg_compress_struct* %143 to %struct.jpeg_common_struct*
  %145 = ptrtoint void (%struct.jpeg_common_struct*)* %142 to i64
  call void @__llvm_profile_instrument_target(i64 %145, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_preload_image to i8*), i32 3)
  call void %142(%struct.jpeg_common_struct* %144)
  br label %146

; <label>:146:                                    ; preds = %132, %127, %122
  %147 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %148 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %147, i32 0, i32 7
  %149 = load i32, i32* %148, align 4
  %150 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %151 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %150, i32 0, i32 4
  store i32 %149, i32* %151, align 8
  %152 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %153 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %152, i32 0, i32 0
  %154 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %153, i32 0, i32 1
  %155 = load i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %154, align 8
  %156 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %157 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %158 = ptrtoint i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* %155 to i64
  call void @__llvm_profile_instrument_target(i64 %158, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_preload_image to i8*), i32 4)
  %159 = call i32 %155(%struct.jpeg_compress_struct* %156, %struct.cjpeg_source_struct* %157)
  ret i32 %159
}

declare i32 @_IO_getc(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_8bit_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct._bmp_source_struct*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %12 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %13 = bitcast %struct.cjpeg_source_struct* %12 to %struct._bmp_source_struct*
  store %struct._bmp_source_struct* %13, %struct._bmp_source_struct** %5, align 8
  %14 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %15 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %14, i32 0, i32 2
  %16 = load i8**, i8*** %15, align 8
  store i8** %16, i8*** %6, align 8
  %17 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %18 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %17, i32 0, i32 4
  %19 = load i32, i32* %18, align 8
  %20 = add i32 %19, -1
  store i32 %20, i32* %18, align 8
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 1
  %23 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %23, i32 0, i32 7
  %25 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %24, align 8
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %27 = bitcast %struct.jpeg_compress_struct* %26 to %struct.jpeg_common_struct*
  %28 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %29 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %28, i32 0, i32 3
  %30 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %29, align 8
  %31 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %32 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %31, i32 0, i32 4
  %33 = load i32, i32* %32, align 8
  %34 = ptrtoint i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)* %25 to i64
  call void @__llvm_profile_instrument_target(i64 %34, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_8bit_row to i8*), i32 0)
  %35 = call i8** %25(%struct.jpeg_common_struct* %27, %struct.jvirt_sarray_control* %30, i32 %33, i32 1, i32 0)
  store i8** %35, i8*** %7, align 8
  %36 = load i8**, i8*** %7, align 8
  %37 = getelementptr inbounds i8*, i8** %36, i64 0
  %38 = load i8*, i8** %37, align 8
  store i8* %38, i8** %9, align 8
  %39 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %40 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %39, i32 0, i32 0
  %41 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %40, i32 0, i32 4
  %42 = load i8**, i8*** %41, align 8
  %43 = getelementptr inbounds i8*, i8** %42, i64 0
  %44 = load i8*, i8** %43, align 8
  store i8* %44, i8** %10, align 8
  %45 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %46 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %45, i32 0, i32 6
  %47 = load i32, i32* %46, align 8
  store i32 %47, i32* %11, align 4
  br label %48

; <label>:48:                                     ; preds = %83, %2
  %49 = load i32, i32* %11, align 4
  %50 = icmp ugt i32 %49, 0
  br i1 %50, label %51, label %87

; <label>:51:                                     ; preds = %48
  %52 = load i8*, i8** %9, align 8
  %53 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %53, i8** %9, align 8
  %54 = load i8, i8* %52, align 1
  %55 = zext i8 %54 to i32
  store i32 %55, i32* %8, align 4
  %56 = load i8**, i8*** %6, align 8
  %57 = getelementptr inbounds i8*, i8** %56, i64 0
  %58 = load i8*, i8** %57, align 8
  %59 = load i32, i32* %8, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8* %58, i64 %60
  %62 = load i8, i8* %61, align 1
  %63 = load i8*, i8** %10, align 8
  %64 = getelementptr inbounds i8, i8* %63, i32 1
  store i8* %64, i8** %10, align 8
  store i8 %62, i8* %63, align 1
  %65 = load i8**, i8*** %6, align 8
  %66 = getelementptr inbounds i8*, i8** %65, i64 1
  %67 = load i8*, i8** %66, align 8
  %68 = load i32, i32* %8, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8* %67, i64 %69
  %71 = load i8, i8* %70, align 1
  %72 = load i8*, i8** %10, align 8
  %73 = getelementptr inbounds i8, i8* %72, i32 1
  store i8* %73, i8** %10, align 8
  store i8 %71, i8* %72, align 1
  %74 = load i8**, i8*** %6, align 8
  %75 = getelementptr inbounds i8*, i8** %74, i64 2
  %76 = load i8*, i8** %75, align 8
  %77 = load i32, i32* %8, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8* %76, i64 %78
  %80 = load i8, i8* %79, align 1
  %81 = load i8*, i8** %10, align 8
  %82 = getelementptr inbounds i8, i8* %81, i32 1
  store i8* %82, i8** %10, align 8
  store i8 %80, i8* %81, align 1
  br label %83

; <label>:83:                                     ; preds = %51
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_8bit_row, i64 0, i64 0)
  %84 = add i64 %pgocount, 1
  store i64 %84, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_8bit_row, i64 0, i64 0)
  %85 = load i32, i32* %11, align 4
  %86 = add i32 %85, -1
  store i32 %86, i32* %11, align 4
  br label %48

; <label>:87:                                     ; preds = %48
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_8bit_row, i64 0, i64 1)
  %88 = add i64 %pgocount1, 1
  store i64 %88, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_8bit_row, i64 0, i64 1)
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_24bit_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.cjpeg_source_struct*, align 8
  %5 = alloca %struct._bmp_source_struct*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.cjpeg_source_struct* %1, %struct.cjpeg_source_struct** %4, align 8
  %10 = load %struct.cjpeg_source_struct*, %struct.cjpeg_source_struct** %4, align 8
  %11 = bitcast %struct.cjpeg_source_struct* %10 to %struct._bmp_source_struct*
  store %struct._bmp_source_struct* %11, %struct._bmp_source_struct** %5, align 8
  %12 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %13 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %12, i32 0, i32 4
  %14 = load i32, i32* %13, align 8
  %15 = add i32 %14, -1
  store i32 %15, i32* %13, align 8
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 1
  %18 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %18, i32 0, i32 7
  %20 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %19, align 8
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %22 = bitcast %struct.jpeg_compress_struct* %21 to %struct.jpeg_common_struct*
  %23 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %24 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %23, i32 0, i32 3
  %25 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %24, align 8
  %26 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %27 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %26, i32 0, i32 4
  %28 = load i32, i32* %27, align 8
  %29 = ptrtoint i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)* %20 to i64
  call void @__llvm_profile_instrument_target(i64 %29, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_24bit_row to i8*), i32 0)
  %30 = call i8** %20(%struct.jpeg_common_struct* %22, %struct.jvirt_sarray_control* %25, i32 %28, i32 1, i32 0)
  store i8** %30, i8*** %6, align 8
  %31 = load i8**, i8*** %6, align 8
  %32 = getelementptr inbounds i8*, i8** %31, i64 0
  %33 = load i8*, i8** %32, align 8
  store i8* %33, i8** %7, align 8
  %34 = load %struct._bmp_source_struct*, %struct._bmp_source_struct** %5, align 8
  %35 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %34, i32 0, i32 0
  %36 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %35, i32 0, i32 4
  %37 = load i8**, i8*** %36, align 8
  %38 = getelementptr inbounds i8*, i8** %37, i64 0
  %39 = load i8*, i8** %38, align 8
  store i8* %39, i8** %8, align 8
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %40, i32 0, i32 6
  %42 = load i32, i32* %41, align 8
  store i32 %42, i32* %9, align 4
  br label %43

; <label>:43:                                     ; preds = %64, %2
  %44 = load i32, i32* %9, align 4
  %45 = icmp ugt i32 %44, 0
  br i1 %45, label %46, label %68

; <label>:46:                                     ; preds = %43
  %47 = load i8*, i8** %7, align 8
  %48 = getelementptr inbounds i8, i8* %47, i32 1
  store i8* %48, i8** %7, align 8
  %49 = load i8, i8* %47, align 1
  %50 = load i8*, i8** %8, align 8
  %51 = getelementptr inbounds i8, i8* %50, i64 2
  store i8 %49, i8* %51, align 1
  %52 = load i8*, i8** %7, align 8
  %53 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %53, i8** %7, align 8
  %54 = load i8, i8* %52, align 1
  %55 = load i8*, i8** %8, align 8
  %56 = getelementptr inbounds i8, i8* %55, i64 1
  store i8 %54, i8* %56, align 1
  %57 = load i8*, i8** %7, align 8
  %58 = getelementptr inbounds i8, i8* %57, i32 1
  store i8* %58, i8** %7, align 8
  %59 = load i8, i8* %57, align 1
  %60 = load i8*, i8** %8, align 8
  %61 = getelementptr inbounds i8, i8* %60, i64 0
  store i8 %59, i8* %61, align 1
  %62 = load i8*, i8** %8, align 8
  %63 = getelementptr inbounds i8, i8* %62, i64 3
  store i8* %63, i8** %8, align 8
  br label %64

; <label>:64:                                     ; preds = %46
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_24bit_row, i64 0, i64 0)
  %65 = add i64 %pgocount, 1
  store i64 %65, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_24bit_row, i64 0, i64 0)
  %66 = load i32, i32* %9, align 4
  %67 = add i32 %66, -1
  store i32 %67, i32* %9, align 4
  br label %43

; <label>:68:                                     ; preds = %43
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_24bit_row, i64 0, i64 1)
  %69 = add i64 %pgocount1, 1
  store i64 %69, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_get_24bit_row, i64 0, i64 1)
  ret i32 1
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

; ModuleID = 'tmp1.ll'
source_filename = "jdatasrc.c"
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
%struct.my_source_mgr = type { %struct.jpeg_source_mgr, %struct._IO_FILE*, i8*, i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_stdio_src = private constant [14 x i8] c"jpeg_stdio_src"
@__profn_tmp1.ll_init_source = private constant [19 x i8] c"tmp1.ll:init_source"
@__profn_tmp1.ll_fill_input_buffer = private constant [25 x i8] c"tmp1.ll:fill_input_buffer"
@__profn_tmp1.ll_skip_input_data = private constant [23 x i8] c"tmp1.ll:skip_input_data"
@__profn_tmp1.ll_term_source = private constant [19 x i8] c"tmp1.ll:term_source"
@__profc_jpeg_stdio_src = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_stdio_src = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_stdio_src = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6205073455138880666, i64 562975524720386, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_stdio_src, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct._IO_FILE*)* @jpeg_stdio_src to i8*), i8* bitcast ([2 x i64]* @__profvp_jpeg_stdio_src to i8*), i32 2, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_init_source = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_init_source = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5670046804246430410, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_init_source, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @init_source to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_fill_input_buffer = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_fill_input_buffer = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_fill_input_buffer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7706109975212722076, i64 562985326816775, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fill_input_buffer, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*)* @fill_input_buffer to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_fill_input_buffer to i8*), i32 3, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_skip_input_data = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_skip_input_data = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7204863507242715020, i64 40425548223, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_skip_input_data, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i64)* @skip_input_data to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_term_source = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_term_source = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5295560776477429522, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_term_source, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @term_source to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [79 x i8] c"hMx\DA=\CCK\0A\C0 \0C\00Qz\A1B\B7^&X\8D%m\D4\90\CF\FD\BB\11\B7\F3`^\C1\07\CC+M0-\87w\B9N\E6D\83\1Cl\86\16\DC\AD\113\D0\90p\B8\A35\D4-\F6\91,\A9\D9\F3\EE\8E\DA\D7\E5\07\15\B2'v", section "__llvm_prf_names"
@llvm.used = appending global [7 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_stdio_src to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_init_source to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_fill_input_buffer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_skip_input_data to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_term_source to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([79 x i8], [79 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jpeg_stdio_src(%struct.jpeg_decompress_struct*, %struct._IO_FILE*) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca %struct.my_source_mgr*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %4, align 8
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %6, i32 0, i32 5
  %8 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %9 = icmp eq %struct.jpeg_source_mgr* %8, null
  br i1 %9, label %10, label %39

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_stdio_src, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_stdio_src, i64 0, i64 1)
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %12, i32 0, i32 1
  %14 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %14, i32 0, i32 0
  %16 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %15, align 8
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %18 = bitcast %struct.jpeg_decompress_struct* %17 to %struct.jpeg_common_struct*
  %19 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %16 to i64
  call void @__llvm_profile_instrument_target(i64 %19, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_stdio_src to i8*), i32 0)
  %20 = call i8* %16(%struct.jpeg_common_struct* %18, i32 0, i64 80)
  %21 = bitcast i8* %20 to %struct.jpeg_source_mgr*
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 5
  store %struct.jpeg_source_mgr* %21, %struct.jpeg_source_mgr** %23, align 8
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 5
  %26 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %25, align 8
  %27 = bitcast %struct.jpeg_source_mgr* %26 to %struct.my_source_mgr*
  store %struct.my_source_mgr* %27, %struct.my_source_mgr** %5, align 8
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %28, i32 0, i32 1
  %30 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %30, i32 0, i32 0
  %32 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %31, align 8
  %33 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %34 = bitcast %struct.jpeg_decompress_struct* %33 to %struct.jpeg_common_struct*
  %35 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %32 to i64
  call void @__llvm_profile_instrument_target(i64 %35, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_stdio_src to i8*), i32 1)
  %36 = call i8* %32(%struct.jpeg_common_struct* %34, i32 0, i64 4096)
  %37 = load %struct.my_source_mgr*, %struct.my_source_mgr** %5, align 8
  %38 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %37, i32 0, i32 2
  store i8* %36, i8** %38, align 8
  br label %39

; <label>:39:                                     ; preds = %10, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_stdio_src, i64 0, i64 0)
  %40 = add i64 %pgocount1, 1
  store i64 %40, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_stdio_src, i64 0, i64 0)
  %41 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %41, i32 0, i32 5
  %43 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %42, align 8
  %44 = bitcast %struct.jpeg_source_mgr* %43 to %struct.my_source_mgr*
  store %struct.my_source_mgr* %44, %struct.my_source_mgr** %5, align 8
  %45 = load %struct.my_source_mgr*, %struct.my_source_mgr** %5, align 8
  %46 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %45, i32 0, i32 0
  %47 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %46, i32 0, i32 2
  store void (%struct.jpeg_decompress_struct*)* @init_source, void (%struct.jpeg_decompress_struct*)** %47, align 8
  %48 = load %struct.my_source_mgr*, %struct.my_source_mgr** %5, align 8
  %49 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %48, i32 0, i32 0
  %50 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %49, i32 0, i32 3
  store i32 (%struct.jpeg_decompress_struct*)* @fill_input_buffer, i32 (%struct.jpeg_decompress_struct*)** %50, align 8
  %51 = load %struct.my_source_mgr*, %struct.my_source_mgr** %5, align 8
  %52 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %51, i32 0, i32 0
  %53 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %52, i32 0, i32 4
  store void (%struct.jpeg_decompress_struct*, i64)* @skip_input_data, void (%struct.jpeg_decompress_struct*, i64)** %53, align 8
  %54 = load %struct.my_source_mgr*, %struct.my_source_mgr** %5, align 8
  %55 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %54, i32 0, i32 0
  %56 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %55, i32 0, i32 5
  store i32 (%struct.jpeg_decompress_struct*, i32)* @jpeg_resync_to_restart, i32 (%struct.jpeg_decompress_struct*, i32)** %56, align 8
  %57 = load %struct.my_source_mgr*, %struct.my_source_mgr** %5, align 8
  %58 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %57, i32 0, i32 0
  %59 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %58, i32 0, i32 6
  store void (%struct.jpeg_decompress_struct*)* @term_source, void (%struct.jpeg_decompress_struct*)** %59, align 8
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %61 = load %struct.my_source_mgr*, %struct.my_source_mgr** %5, align 8
  %62 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %61, i32 0, i32 1
  store %struct._IO_FILE* %60, %struct._IO_FILE** %62, align 8
  %63 = load %struct.my_source_mgr*, %struct.my_source_mgr** %5, align 8
  %64 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %63, i32 0, i32 0
  %65 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %64, i32 0, i32 1
  store i64 0, i64* %65, align 8
  %66 = load %struct.my_source_mgr*, %struct.my_source_mgr** %5, align 8
  %67 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %66, i32 0, i32 0
  %68 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %67, i32 0, i32 0
  store i8* null, i8** %68, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @init_source(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_init_source, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_init_source, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.my_source_mgr*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 5
  %7 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %8 = bitcast %struct.jpeg_source_mgr* %7 to %struct.my_source_mgr*
  store %struct.my_source_mgr* %8, %struct.my_source_mgr** %4, align 8
  %9 = load %struct.my_source_mgr*, %struct.my_source_mgr** %4, align 8
  %10 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %9, i32 0, i32 3
  store i32 1, i32* %10, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @fill_input_buffer(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_source_mgr*, align 8
  %4 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 5
  %7 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %6, align 8
  %8 = bitcast %struct.jpeg_source_mgr* %7 to %struct.my_source_mgr*
  store %struct.my_source_mgr* %8, %struct.my_source_mgr** %3, align 8
  %9 = load %struct.my_source_mgr*, %struct.my_source_mgr** %3, align 8
  %10 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %9, i32 0, i32 2
  %11 = load i8*, i8** %10, align 8
  %12 = load %struct.my_source_mgr*, %struct.my_source_mgr** %3, align 8
  %13 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %12, i32 0, i32 1
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8
  %15 = call i64 @fread(i8* %11, i64 1, i64 4096, %struct._IO_FILE* %14)
  store i64 %15, i64* %4, align 8
  %16 = load i64, i64* %4, align 8
  %17 = icmp ule i64 %16, 0
  br i1 %17, label %18, label %59

; <label>:18:                                     ; preds = %1
  %19 = load %struct.my_source_mgr*, %struct.my_source_mgr** %3, align 8
  %20 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %19, i32 0, i32 3
  %21 = load i32, i32* %20, align 8
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %37

; <label>:23:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fill_input_buffer, i64 0, i64 2)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fill_input_buffer, i64 0, i64 2)
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %25, i32 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i32 0, i32 5
  store i32 41, i32* %28, align 8
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %29, i32 0, i32 0
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i32 0, i32 0
  %33 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %32, align 8
  %34 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %35 = bitcast %struct.jpeg_decompress_struct* %34 to %struct.jpeg_common_struct*
  %36 = ptrtoint void (%struct.jpeg_common_struct*)* %33 to i64
  call void @__llvm_profile_instrument_target(i64 %36, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_fill_input_buffer to i8*), i32 0)
  call void %33(%struct.jpeg_common_struct* %35)
  br label %37

; <label>:37:                                     ; preds = %23, %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fill_input_buffer, i64 0, i64 1)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fill_input_buffer, i64 0, i64 1)
  %39 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %39, i32 0, i32 0
  %41 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %42 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %41, i32 0, i32 5
  store i32 116, i32* %42, align 8
  %43 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %43, i32 0, i32 0
  %45 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %44, align 8
  %46 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %45, i32 0, i32 1
  %47 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %46, align 8
  %48 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %49 = bitcast %struct.jpeg_decompress_struct* %48 to %struct.jpeg_common_struct*
  %50 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %47 to i64
  call void @__llvm_profile_instrument_target(i64 %50, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_fill_input_buffer to i8*), i32 1)
  call void %47(%struct.jpeg_common_struct* %49, i32 -1)
  %51 = load %struct.my_source_mgr*, %struct.my_source_mgr** %3, align 8
  %52 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %51, i32 0, i32 2
  %53 = load i8*, i8** %52, align 8
  %54 = getelementptr inbounds i8, i8* %53, i64 0
  store i8 -1, i8* %54, align 1
  %55 = load %struct.my_source_mgr*, %struct.my_source_mgr** %3, align 8
  %56 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %55, i32 0, i32 2
  %57 = load i8*, i8** %56, align 8
  %58 = getelementptr inbounds i8, i8* %57, i64 1
  store i8 -39, i8* %58, align 1
  store i64 2, i64* %4, align 8
  br label %59

; <label>:59:                                     ; preds = %37, %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fill_input_buffer, i64 0, i64 0)
  %60 = add i64 %pgocount2, 1
  store i64 %60, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fill_input_buffer, i64 0, i64 0)
  %61 = load %struct.my_source_mgr*, %struct.my_source_mgr** %3, align 8
  %62 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %61, i32 0, i32 2
  %63 = load i8*, i8** %62, align 8
  %64 = load %struct.my_source_mgr*, %struct.my_source_mgr** %3, align 8
  %65 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %64, i32 0, i32 0
  %66 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %65, i32 0, i32 0
  store i8* %63, i8** %66, align 8
  %67 = load i64, i64* %4, align 8
  %68 = load %struct.my_source_mgr*, %struct.my_source_mgr** %3, align 8
  %69 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %68, i32 0, i32 0
  %70 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %69, i32 0, i32 1
  store i64 %67, i64* %70, align 8
  %71 = load %struct.my_source_mgr*, %struct.my_source_mgr** %3, align 8
  %72 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %71, i32 0, i32 3
  store i32 0, i32* %72, align 8
  ret i32 1
}

; Function Attrs: nounwind uwtable
define internal void @skip_input_data(%struct.jpeg_decompress_struct*, i64) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.my_source_mgr*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store i64 %1, i64* %4, align 8
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %6, i32 0, i32 5
  %8 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %7, align 8
  %9 = bitcast %struct.jpeg_source_mgr* %8 to %struct.my_source_mgr*
  store %struct.my_source_mgr* %9, %struct.my_source_mgr** %5, align 8
  %10 = load i64, i64* %4, align 8
  %11 = icmp sgt i64 %10, 0
  br i1 %11, label %12, label %44

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_skip_input_data, i64 0, i64 2)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_skip_input_data, i64 0, i64 2)
  br label %14

; <label>:14:                                     ; preds = %21, %12
  %15 = load i64, i64* %4, align 8
  %16 = load %struct.my_source_mgr*, %struct.my_source_mgr** %5, align 8
  %17 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %16, i32 0, i32 0
  %18 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %17, i32 0, i32 1
  %19 = load i64, i64* %18, align 8
  %20 = icmp sgt i64 %15, %19
  br i1 %20, label %21, label %31

; <label>:21:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_skip_input_data, i64 0, i64 0)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_skip_input_data, i64 0, i64 0)
  %23 = load %struct.my_source_mgr*, %struct.my_source_mgr** %5, align 8
  %24 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %23, i32 0, i32 0
  %25 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %24, i32 0, i32 1
  %26 = load i64, i64* %25, align 8
  %27 = load i64, i64* %4, align 8
  %28 = sub nsw i64 %27, %26
  store i64 %28, i64* %4, align 8
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %30 = call i32 @fill_input_buffer(%struct.jpeg_decompress_struct* %29)
  br label %14

; <label>:31:                                     ; preds = %14
  %32 = load i64, i64* %4, align 8
  %33 = load %struct.my_source_mgr*, %struct.my_source_mgr** %5, align 8
  %34 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %33, i32 0, i32 0
  %35 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %34, i32 0, i32 0
  %36 = load i8*, i8** %35, align 8
  %37 = getelementptr inbounds i8, i8* %36, i64 %32
  store i8* %37, i8** %35, align 8
  %38 = load i64, i64* %4, align 8
  %39 = load %struct.my_source_mgr*, %struct.my_source_mgr** %5, align 8
  %40 = getelementptr inbounds %struct.my_source_mgr, %struct.my_source_mgr* %39, i32 0, i32 0
  %41 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %40, i32 0, i32 1
  %42 = load i64, i64* %41, align 8
  %43 = sub i64 %42, %38
  store i64 %43, i64* %41, align 8
  br label %44

; <label>:44:                                     ; preds = %31, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_skip_input_data, i64 0, i64 1)
  %45 = add i64 %pgocount2, 1
  store i64 %45, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_skip_input_data, i64 0, i64 1)
  ret void
}

declare i32 @jpeg_resync_to_restart(%struct.jpeg_decompress_struct*, i32) #1

; Function Attrs: nounwind uwtable
define internal void @term_source(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_term_source, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_term_source, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  ret void
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

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

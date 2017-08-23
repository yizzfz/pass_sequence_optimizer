; ModuleID = 'tmp1.ll'
source_filename = "jdatadst.c"
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
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.my_destination_mgr = type { %struct.jpeg_destination_mgr, %struct._IO_FILE*, i8* }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_stdio_dest = private constant [15 x i8] c"jpeg_stdio_dest"
@__profn_tmp1.ll_init_destination = private constant [24 x i8] c"tmp1.ll:init_destination"
@__profn_tmp1.ll_empty_output_buffer = private constant [27 x i8] c"tmp1.ll:empty_output_buffer"
@__profn_tmp1.ll_term_destination = private constant [24 x i8] c"tmp1.ll:term_destination"
@__profc_jpeg_stdio_dest = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_stdio_dest = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_stdio_dest = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2037777983584507696, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_stdio_dest, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct._IO_FILE*)* @jpeg_stdio_dest to i8*), i8* bitcast ([1 x i64]* @__profvp_jpeg_stdio_dest to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_init_destination = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_init_destination = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_init_destination = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4501957512433171232, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_init_destination, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @init_destination to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_init_destination to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_empty_output_buffer = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_empty_output_buffer = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_empty_output_buffer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8143339133740457737, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_empty_output_buffer, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*)* @empty_output_buffer to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_empty_output_buffer to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_term_destination = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_term_destination = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_term_destination = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7735235114227659962, i64 562998160594271, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_term_destination, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @term_destination to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_term_destination to i8*), i32 4, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [75 x i8] c"]Ix\DA\CB*HM\8F/.I\C9\CC\8FOI-.a,\C9-0\D4\CB\C9\B1\CA\CC\CB,\01\8Bd\E6%\96d\E6\E7\C1%Rs\0BJ*\E3\F3KK\0AJK\E2\93J\D3\D2R\8B\E0r%\A9E\B9\C8\9A\00\94\1B$\07", section "__llvm_prf_names"
@llvm.used = appending global [6 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_stdio_dest to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_init_destination to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_empty_output_buffer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_term_destination to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jpeg_stdio_dest(%struct.jpeg_compress_struct*, %struct._IO_FILE*) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca %struct.my_destination_mgr*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %4, align 8
  %6 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %6, i32 0, i32 5
  %8 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %7, align 8
  %9 = icmp eq %struct.jpeg_destination_mgr* %8, null
  br i1 %9, label %10, label %24

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_stdio_dest, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_stdio_dest, i64 0, i64 1)
  %12 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %12, i32 0, i32 1
  %14 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %14, i32 0, i32 0
  %16 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %15, align 8
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %18 = bitcast %struct.jpeg_compress_struct* %17 to %struct.jpeg_common_struct*
  %19 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %16 to i64
  call void @__llvm_profile_instrument_target(i64 %19, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_stdio_dest to i8*), i32 0)
  %20 = call i8* %16(%struct.jpeg_common_struct* %18, i32 0, i64 56)
  %21 = bitcast i8* %20 to %struct.jpeg_destination_mgr*
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 5
  store %struct.jpeg_destination_mgr* %21, %struct.jpeg_destination_mgr** %23, align 8
  br label %24

; <label>:24:                                     ; preds = %10, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_stdio_dest, i64 0, i64 0)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_stdio_dest, i64 0, i64 0)
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %26, i32 0, i32 5
  %28 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %27, align 8
  %29 = bitcast %struct.jpeg_destination_mgr* %28 to %struct.my_destination_mgr*
  store %struct.my_destination_mgr* %29, %struct.my_destination_mgr** %5, align 8
  %30 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %5, align 8
  %31 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %30, i32 0, i32 0
  %32 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %31, i32 0, i32 2
  store void (%struct.jpeg_compress_struct*)* @init_destination, void (%struct.jpeg_compress_struct*)** %32, align 8
  %33 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %5, align 8
  %34 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %33, i32 0, i32 0
  %35 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %34, i32 0, i32 3
  store i32 (%struct.jpeg_compress_struct*)* @empty_output_buffer, i32 (%struct.jpeg_compress_struct*)** %35, align 8
  %36 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %5, align 8
  %37 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %36, i32 0, i32 0
  %38 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %37, i32 0, i32 4
  store void (%struct.jpeg_compress_struct*)* @term_destination, void (%struct.jpeg_compress_struct*)** %38, align 8
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %40 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %5, align 8
  %41 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %40, i32 0, i32 1
  store %struct._IO_FILE* %39, %struct._IO_FILE** %41, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @init_destination(%struct.jpeg_compress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_init_destination, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_init_destination, i64 0, i64 0)
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.my_destination_mgr*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 5
  %7 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %6, align 8
  %8 = bitcast %struct.jpeg_destination_mgr* %7 to %struct.my_destination_mgr*
  store %struct.my_destination_mgr* %8, %struct.my_destination_mgr** %4, align 8
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %9, i32 0, i32 1
  %11 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %11, i32 0, i32 0
  %13 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %12, align 8
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %15 = bitcast %struct.jpeg_compress_struct* %14 to %struct.jpeg_common_struct*
  %16 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %13 to i64
  call void @__llvm_profile_instrument_target(i64 %16, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_init_destination to i8*), i32 0)
  %17 = call i8* %13(%struct.jpeg_common_struct* %15, i32 1, i64 4096)
  %18 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %4, align 8
  %19 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %18, i32 0, i32 2
  store i8* %17, i8** %19, align 8
  %20 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %4, align 8
  %21 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %20, i32 0, i32 2
  %22 = load i8*, i8** %21, align 8
  %23 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %4, align 8
  %24 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %23, i32 0, i32 0
  %25 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %24, i32 0, i32 0
  store i8* %22, i8** %25, align 8
  %26 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %4, align 8
  %27 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %26, i32 0, i32 0
  %28 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %27, i32 0, i32 1
  store i64 4096, i64* %28, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @empty_output_buffer(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.my_destination_mgr*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %4, i32 0, i32 5
  %6 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %5, align 8
  %7 = bitcast %struct.jpeg_destination_mgr* %6 to %struct.my_destination_mgr*
  store %struct.my_destination_mgr* %7, %struct.my_destination_mgr** %3, align 8
  %8 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %3, align 8
  %9 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %8, i32 0, i32 2
  %10 = load i8*, i8** %9, align 8
  %11 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %3, align 8
  %12 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %11, i32 0, i32 1
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %14 = call i64 @fwrite(i8* %10, i64 1, i64 4096, %struct._IO_FILE* %13)
  %15 = icmp ne i64 %14, 4096
  br i1 %15, label %16, label %30

; <label>:16:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_empty_output_buffer, i64 0, i64 1)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_empty_output_buffer, i64 0, i64 1)
  %18 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %18, i32 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i32 0, i32 5
  store i32 36, i32* %21, align 8
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i32 0, i32 0
  %26 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %25, align 8
  %27 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %28 = bitcast %struct.jpeg_compress_struct* %27 to %struct.jpeg_common_struct*
  %29 = ptrtoint void (%struct.jpeg_common_struct*)* %26 to i64
  call void @__llvm_profile_instrument_target(i64 %29, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_empty_output_buffer to i8*), i32 0)
  call void %26(%struct.jpeg_common_struct* %28)
  br label %30

; <label>:30:                                     ; preds = %16, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_empty_output_buffer, i64 0, i64 0)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_empty_output_buffer, i64 0, i64 0)
  %32 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %3, align 8
  %33 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %32, i32 0, i32 2
  %34 = load i8*, i8** %33, align 8
  %35 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %3, align 8
  %36 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %35, i32 0, i32 0
  %37 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %36, i32 0, i32 0
  store i8* %34, i8** %37, align 8
  %38 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %3, align 8
  %39 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %38, i32 0, i32 0
  %40 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %39, i32 0, i32 1
  store i64 4096, i64* %40, align 8
  ret i32 1
}

; Function Attrs: nounwind uwtable
define internal void @term_destination(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.my_destination_mgr*, align 8
  %4 = alloca i64, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 5
  %7 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %6, align 8
  %8 = bitcast %struct.jpeg_destination_mgr* %7 to %struct.my_destination_mgr*
  store %struct.my_destination_mgr* %8, %struct.my_destination_mgr** %3, align 8
  %9 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %3, align 8
  %10 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %9, i32 0, i32 0
  %11 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %10, i32 0, i32 1
  %12 = load i64, i64* %11, align 8
  %13 = sub i64 4096, %12
  store i64 %13, i64* %4, align 8
  %14 = load i64, i64* %4, align 8
  %15 = icmp ugt i64 %14, 0
  br i1 %15, label %16, label %43

; <label>:16:                                     ; preds = %1
  %17 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %3, align 8
  %18 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %17, i32 0, i32 2
  %19 = load i8*, i8** %18, align 8
  %20 = load i64, i64* %4, align 8
  %21 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %3, align 8
  %22 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %21, i32 0, i32 1
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %22, align 8
  %24 = call i64 @fwrite(i8* %19, i64 1, i64 %20, %struct._IO_FILE* %23)
  %25 = load i64, i64* %4, align 8
  %26 = icmp ne i64 %24, %25
  br i1 %26, label %27, label %41

; <label>:27:                                     ; preds = %16
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_term_destination, i64 0, i64 3)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_term_destination, i64 0, i64 3)
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i32 0, i32 0
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i32 0, i32 5
  store i32 36, i32* %32, align 8
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %33, i32 0, i32 0
  %35 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %35, i32 0, i32 0
  %37 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %36, align 8
  %38 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %39 = bitcast %struct.jpeg_compress_struct* %38 to %struct.jpeg_common_struct*
  %40 = ptrtoint void (%struct.jpeg_common_struct*)* %37 to i64
  call void @__llvm_profile_instrument_target(i64 %40, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_term_destination to i8*), i32 0)
  call void %37(%struct.jpeg_common_struct* %39)
  br label %41

; <label>:41:                                     ; preds = %27, %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_term_destination, i64 0, i64 2)
  %42 = add i64 %pgocount1, 1
  store i64 %42, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_term_destination, i64 0, i64 2)
  br label %43

; <label>:43:                                     ; preds = %41, %1
  %44 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %3, align 8
  %45 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %44, i32 0, i32 1
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** %45, align 8
  %47 = call i32 @fflush(%struct._IO_FILE* %46)
  %48 = load %struct.my_destination_mgr*, %struct.my_destination_mgr** %3, align 8
  %49 = getelementptr inbounds %struct.my_destination_mgr, %struct.my_destination_mgr* %48, i32 0, i32 1
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** %49, align 8
  %51 = call i32 @ferror(%struct._IO_FILE* %50) #3
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %67

; <label>:53:                                     ; preds = %43
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_term_destination, i64 0, i64 1)
  %54 = add i64 %pgocount2, 1
  store i64 %54, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_term_destination, i64 0, i64 1)
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %55, i32 0, i32 0
  %57 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %56, align 8
  %58 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %57, i32 0, i32 5
  store i32 36, i32* %58, align 8
  %59 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %59, i32 0, i32 0
  %61 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %60, align 8
  %62 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %61, i32 0, i32 0
  %63 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %62, align 8
  %64 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %65 = bitcast %struct.jpeg_compress_struct* %64 to %struct.jpeg_common_struct*
  %66 = ptrtoint void (%struct.jpeg_common_struct*)* %63 to i64
  call void @__llvm_profile_instrument_target(i64 %66, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_term_destination to i8*), i32 1)
  call void %63(%struct.jpeg_common_struct* %65)
  br label %67

; <label>:67:                                     ; preds = %53, %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_term_destination, i64 0, i64 0)
  %68 = add i64 %pgocount3, 1
  store i64 %68, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_term_destination, i64 0, i64 0)
  ret void
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

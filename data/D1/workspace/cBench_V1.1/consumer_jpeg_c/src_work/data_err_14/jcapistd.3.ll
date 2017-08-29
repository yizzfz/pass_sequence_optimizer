; ModuleID = 'jcapistd.2.ll'
source_filename = "jcapistd.c"
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
%struct.jpeg_comp_master = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, i32, i32 }
%struct.jpeg_c_main_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32)* }
%struct.jpeg_c_prep_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* }
%struct.jpeg_c_coef_controller = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, i8***)* }
%struct.jpeg_marker_writer = type { void (%struct.jpeg_compress_struct*, i32, i8*, i32)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)* }
%struct.jpeg_color_converter = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* }
%struct.jpeg_downsampler = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, i32 }
%struct.jpeg_forward_dct = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* }
%struct.jpeg_entropy_encoder = type { {}*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, void (%struct.jpeg_compress_struct*)* }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_start_compress = private constant [19 x i8] c"jpeg_start_compress"
@__profn_jpeg_write_scanlines = private constant [20 x i8] c"jpeg_write_scanlines"
@__profn_jpeg_write_raw_data = private constant [19 x i8] c"jpeg_write_raw_data"
@__profc_jpeg_start_compress = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_start_compress = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_start_compress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9025008435502592245, i64 73183530441295297, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_start_compress, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32)* @jpeg_start_compress to i8*), i8* bitcast ([4 x i64]* @__profvp_jpeg_start_compress to i8*), i32 4, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_jpeg_write_scanlines = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_write_scanlines = private global [5 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_write_scanlines = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4320030840350367323, i64 1407451128749148, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_write_scanlines, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, i8**, i32)* @jpeg_write_scanlines to i8*), i8* bitcast ([5 x i64]* @__profvp_jpeg_write_scanlines to i8*), i32 6, [1 x i16] [i16 5] }, section "__llvm_prf_data", align 8
@__profc_jpeg_write_raw_data = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_write_raw_data = private global [6 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_write_raw_data = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1703011655255750941, i64 1688942275713123, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_write_raw_data, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, i8***, i32)* @jpeg_write_raw_data to i8*), i8* bitcast ([6 x i64]* @__profvp_jpeg_write_raw_data to i8*), i32 7, [1 x i16] [i16 6] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [15 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [62 x i8] c"<\00jpeg_start_compress\01jpeg_write_scanlines\01jpeg_write_raw_data", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_start_compress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_scanlines to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_raw_data to i8*), i8* bitcast ([15 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jpeg_start_compress(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 4
  %7 = load i32, i32* %6, align 4
  %8 = icmp ne i32 %7, 100
  br i1 %8, label %9, label %32

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_start_compress, i64 0, i64 2)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_start_compress, i64 0, i64 2)
  %11 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %11, i32 0, i32 0
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i32 0, i32 5
  store i32 18, i32* %14, align 8
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %15, i32 0, i32 4
  %17 = load i32, i32* %16, align 4
  %18 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %18, i32 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i32 0, i32 6
  %22 = bitcast %union.anon* %21 to [8 x i32]*
  %23 = getelementptr inbounds [8 x i32], [8 x i32]* %22, i64 0, i64 0
  store i32 %17, i32* %23, align 4
  %24 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %24, i32 0, i32 0
  %26 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %26, i32 0, i32 0
  %28 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %27, align 8
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %30 = bitcast %struct.jpeg_compress_struct* %29 to %struct.jpeg_common_struct*
  %31 = ptrtoint void (%struct.jpeg_common_struct*)* %28 to i64
  call void @__llvm_profile_instrument_target(i64 %31, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_start_compress to i8*), i32 0)
  call void %28(%struct.jpeg_common_struct* %30)
  br label %32

; <label>:32:                                     ; preds = %9, %2
  %33 = load i32, i32* %4, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %38

; <label>:35:                                     ; preds = %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_start_compress, i64 0, i64 1)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_start_compress, i64 0, i64 1)
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @jpeg_suppress_tables(%struct.jpeg_compress_struct* %37, i32 0)
  br label %38

; <label>:38:                                     ; preds = %35, %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_start_compress, i64 0, i64 0)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_start_compress, i64 0, i64 0)
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %40, i32 0, i32 0
  %42 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %41, align 8
  %43 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %42, i32 0, i32 4
  %44 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %43, align 8
  %45 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %46 = bitcast %struct.jpeg_compress_struct* %45 to %struct.jpeg_common_struct*
  %47 = ptrtoint void (%struct.jpeg_common_struct*)* %44 to i64
  call void @__llvm_profile_instrument_target(i64 %47, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_start_compress to i8*), i32 1)
  call void %44(%struct.jpeg_common_struct* %46)
  %48 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %49 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %48, i32 0, i32 5
  %50 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %49, align 8
  %51 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %50, i32 0, i32 2
  %52 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %51, align 8
  %53 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %54 = ptrtoint void (%struct.jpeg_compress_struct*)* %52 to i64
  call void @__llvm_profile_instrument_target(i64 %54, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_start_compress to i8*), i32 2)
  call void %52(%struct.jpeg_compress_struct* %53)
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @jinit_compress_master(%struct.jpeg_compress_struct* %55)
  %56 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %57 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %56, i32 0, i32 51
  %58 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %57, align 8
  %59 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %58, i32 0, i32 0
  %60 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %59, align 8
  %61 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %62 = ptrtoint void (%struct.jpeg_compress_struct*)* %60 to i64
  call void @__llvm_profile_instrument_target(i64 %62, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_start_compress to i8*), i32 3)
  call void %60(%struct.jpeg_compress_struct* %61)
  %63 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %64 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %63, i32 0, i32 36
  store i32 0, i32* %64, align 8
  %65 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %65, i32 0, i32 23
  %67 = load i32, i32* %66, align 8
  %68 = icmp ne i32 %67, 0
  %69 = zext i1 %68 to i64
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_start_compress, i64 0, i64 3)
  %70 = add i64 %pgocount3, %69
  store i64 %70, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_start_compress, i64 0, i64 3)
  %71 = select i1 %68, i32 102, i32 101
  %72 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %73 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %72, i32 0, i32 4
  store i32 %71, i32* %73, align 4
  ret void
}

declare void @jpeg_suppress_tables(%struct.jpeg_compress_struct*, i32) #1

declare void @jinit_compress_master(%struct.jpeg_compress_struct*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_write_scanlines(%struct.jpeg_compress_struct*, i8**, i32) #0 {
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store i8** %1, i8*** %5, align 8
  store i32 %2, i32* %6, align 4
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %9, i32 0, i32 4
  %11 = load i32, i32* %10, align 4
  %12 = icmp ne i32 %11, 101
  br i1 %12, label %13, label %36

; <label>:13:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_write_scanlines, i64 0, i64 3)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_write_scanlines, i64 0, i64 3)
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %15, i32 0, i32 0
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i32 0, i32 5
  store i32 18, i32* %18, align 8
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 4
  %21 = load i32, i32* %20, align 4
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i32 0, i32 6
  %26 = bitcast %union.anon* %25 to [8 x i32]*
  %27 = getelementptr inbounds [8 x i32], [8 x i32]* %26, i64 0, i64 0
  store i32 %21, i32* %27, align 4
  %28 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %28, i32 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i32 0, i32 0
  %32 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %31, align 8
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %34 = bitcast %struct.jpeg_compress_struct* %33 to %struct.jpeg_common_struct*
  %35 = ptrtoint void (%struct.jpeg_common_struct*)* %32 to i64
  call void @__llvm_profile_instrument_target(i64 %35, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_scanlines to i8*), i32 0)
  call void %32(%struct.jpeg_common_struct* %34)
  br label %36

; <label>:36:                                     ; preds = %13, %3
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %37, i32 0, i32 36
  %39 = load i32, i32* %38, align 8
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %40, i32 0, i32 7
  %42 = load i32, i32* %41, align 4
  %43 = icmp uge i32 %39, %42
  br i1 %43, label %44, label %58

; <label>:44:                                     ; preds = %36
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_write_scanlines, i64 0, i64 4)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_write_scanlines, i64 0, i64 4)
  %46 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %47 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %46, i32 0, i32 0
  %48 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %48, i32 0, i32 5
  store i32 119, i32* %49, align 8
  %50 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %51 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %50, i32 0, i32 0
  %52 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %51, align 8
  %53 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %52, i32 0, i32 1
  %54 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %53, align 8
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %56 = bitcast %struct.jpeg_compress_struct* %55 to %struct.jpeg_common_struct*
  %57 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %54 to i64
  call void @__llvm_profile_instrument_target(i64 %57, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_scanlines to i8*), i32 1)
  call void %54(%struct.jpeg_common_struct* %56, i32 -1)
  br label %58

; <label>:58:                                     ; preds = %44, %36
  %59 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %59, i32 0, i32 2
  %61 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %60, align 8
  %62 = icmp ne %struct.jpeg_progress_mgr* %61, null
  br i1 %62, label %63, label %90

; <label>:63:                                     ; preds = %58
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_write_scanlines, i64 0, i64 1)
  %64 = add i64 %pgocount2, 1
  store i64 %64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_write_scanlines, i64 0, i64 1)
  %65 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %65, i32 0, i32 36
  %67 = load i32, i32* %66, align 8
  %68 = zext i32 %67 to i64
  %69 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %70 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %69, i32 0, i32 2
  %71 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %71, i32 0, i32 1
  store i64 %68, i64* %72, align 8
  %73 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %74 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %73, i32 0, i32 7
  %75 = load i32, i32* %74, align 4
  %76 = zext i32 %75 to i64
  %77 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %78 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %77, i32 0, i32 2
  %79 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %78, align 8
  %80 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %79, i32 0, i32 2
  store i64 %76, i64* %80, align 8
  %81 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %82 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %81, i32 0, i32 2
  %83 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %82, align 8
  %84 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %83, i32 0, i32 0
  %85 = bitcast {}** %84 to void (%struct.jpeg_common_struct*)**
  %86 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %85, align 8
  %87 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %88 = bitcast %struct.jpeg_compress_struct* %87 to %struct.jpeg_common_struct*
  %89 = ptrtoint void (%struct.jpeg_common_struct*)* %86 to i64
  call void @__llvm_profile_instrument_target(i64 %89, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_scanlines to i8*), i32 2)
  call void %86(%struct.jpeg_common_struct* %88)
  br label %90

; <label>:90:                                     ; preds = %63, %58
  %91 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %92 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %91, i32 0, i32 51
  %93 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %92, align 8
  %94 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %93, i32 0, i32 3
  %95 = load i32, i32* %94, align 8
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %106

; <label>:97:                                     ; preds = %90
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_write_scanlines, i64 0, i64 2)
  %98 = add i64 %pgocount3, 1
  store i64 %98, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_write_scanlines, i64 0, i64 2)
  %99 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %100 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %99, i32 0, i32 51
  %101 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %100, align 8
  %102 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %101, i32 0, i32 1
  %103 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %102, align 8
  %104 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %105 = ptrtoint void (%struct.jpeg_compress_struct*)* %103 to i64
  call void @__llvm_profile_instrument_target(i64 %105, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_scanlines to i8*), i32 3)
  call void %103(%struct.jpeg_compress_struct* %104)
  br label %106

; <label>:106:                                    ; preds = %97, %90
  %107 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %108 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %107, i32 0, i32 7
  %109 = load i32, i32* %108, align 4
  %110 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %111 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %110, i32 0, i32 36
  %112 = load i32, i32* %111, align 8
  %113 = sub i32 %109, %112
  store i32 %113, i32* %8, align 4
  %114 = load i32, i32* %6, align 4
  %115 = load i32, i32* %8, align 4
  %116 = icmp ugt i32 %114, %115
  br i1 %116, label %117, label %120

; <label>:117:                                    ; preds = %106
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_write_scanlines, i64 0, i64 5)
  %118 = add i64 %pgocount4, 1
  store i64 %118, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_write_scanlines, i64 0, i64 5)
  %119 = load i32, i32* %8, align 4
  store i32 %119, i32* %6, align 4
  br label %120

; <label>:120:                                    ; preds = %117, %106
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_write_scanlines, i64 0, i64 0)
  %121 = add i64 %pgocount5, 1
  store i64 %121, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_write_scanlines, i64 0, i64 0)
  store i32 0, i32* %7, align 4
  %122 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %123 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %122, i32 0, i32 52
  %124 = load %struct.jpeg_c_main_controller*, %struct.jpeg_c_main_controller** %123, align 8
  %125 = getelementptr inbounds %struct.jpeg_c_main_controller, %struct.jpeg_c_main_controller* %124, i32 0, i32 1
  %126 = load void (%struct.jpeg_compress_struct*, i8**, i32*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32)** %125, align 8
  %127 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %128 = load i8**, i8*** %5, align 8
  %129 = load i32, i32* %6, align 4
  %130 = ptrtoint void (%struct.jpeg_compress_struct*, i8**, i32*, i32)* %126 to i64
  call void @__llvm_profile_instrument_target(i64 %130, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_scanlines to i8*), i32 4)
  call void %126(%struct.jpeg_compress_struct* %127, i8** %128, i32* %7, i32 %129)
  %131 = load i32, i32* %7, align 4
  %132 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %133 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %132, i32 0, i32 36
  %134 = load i32, i32* %133, align 8
  %135 = add i32 %134, %131
  store i32 %135, i32* %133, align 8
  %136 = load i32, i32* %7, align 4
  ret i32 %136
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_write_raw_data(%struct.jpeg_compress_struct*, i8***, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.jpeg_compress_struct*, align 8
  %6 = alloca i8***, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %5, align 8
  store i8*** %1, i8**** %6, align 8
  store i32 %2, i32* %7, align 4
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %9, i32 0, i32 4
  %11 = load i32, i32* %10, align 4
  %12 = icmp ne i32 %11, 102
  br i1 %12, label %13, label %36

; <label>:13:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_write_raw_data, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_write_raw_data, i64 0, i64 0)
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %15, i32 0, i32 0
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i32 0, i32 5
  store i32 18, i32* %18, align 8
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 4
  %21 = load i32, i32* %20, align 4
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i32 0, i32 6
  %26 = bitcast %union.anon* %25 to [8 x i32]*
  %27 = getelementptr inbounds [8 x i32], [8 x i32]* %26, i64 0, i64 0
  store i32 %21, i32* %27, align 4
  %28 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %28, i32 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i32 0, i32 0
  %32 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %31, align 8
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %34 = bitcast %struct.jpeg_compress_struct* %33 to %struct.jpeg_common_struct*
  %35 = ptrtoint void (%struct.jpeg_common_struct*)* %32 to i64
  call void @__llvm_profile_instrument_target(i64 %35, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_raw_data to i8*), i32 0)
  call void %32(%struct.jpeg_common_struct* %34)
  br label %36

; <label>:36:                                     ; preds = %13, %3
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %37, i32 0, i32 36
  %39 = load i32, i32* %38, align 8
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %40, i32 0, i32 7
  %42 = load i32, i32* %41, align 4
  %43 = icmp uge i32 %39, %42
  br i1 %43, label %44, label %58

; <label>:44:                                     ; preds = %36
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_write_raw_data, i64 0, i64 1)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_write_raw_data, i64 0, i64 1)
  %46 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %47 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %46, i32 0, i32 0
  %48 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %48, i32 0, i32 5
  store i32 119, i32* %49, align 8
  %50 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %51 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %50, i32 0, i32 0
  %52 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %51, align 8
  %53 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %52, i32 0, i32 1
  %54 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %53, align 8
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %56 = bitcast %struct.jpeg_compress_struct* %55 to %struct.jpeg_common_struct*
  %57 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %54 to i64
  call void @__llvm_profile_instrument_target(i64 %57, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_raw_data to i8*), i32 1)
  call void %54(%struct.jpeg_common_struct* %56, i32 -1)
  store i32 0, i32* %4, align 4
  br label %149

; <label>:58:                                     ; preds = %36
  %59 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %59, i32 0, i32 2
  %61 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %60, align 8
  %62 = icmp ne %struct.jpeg_progress_mgr* %61, null
  br i1 %62, label %63, label %90

; <label>:63:                                     ; preds = %58
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_write_raw_data, i64 0, i64 2)
  %64 = add i64 %pgocount2, 1
  store i64 %64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_write_raw_data, i64 0, i64 2)
  %65 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %65, i32 0, i32 36
  %67 = load i32, i32* %66, align 8
  %68 = zext i32 %67 to i64
  %69 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %70 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %69, i32 0, i32 2
  %71 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %71, i32 0, i32 1
  store i64 %68, i64* %72, align 8
  %73 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %74 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %73, i32 0, i32 7
  %75 = load i32, i32* %74, align 4
  %76 = zext i32 %75 to i64
  %77 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %78 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %77, i32 0, i32 2
  %79 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %78, align 8
  %80 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %79, i32 0, i32 2
  store i64 %76, i64* %80, align 8
  %81 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %82 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %81, i32 0, i32 2
  %83 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %82, align 8
  %84 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %83, i32 0, i32 0
  %85 = bitcast {}** %84 to void (%struct.jpeg_common_struct*)**
  %86 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %85, align 8
  %87 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %88 = bitcast %struct.jpeg_compress_struct* %87 to %struct.jpeg_common_struct*
  %89 = ptrtoint void (%struct.jpeg_common_struct*)* %86 to i64
  call void @__llvm_profile_instrument_target(i64 %89, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_raw_data to i8*), i32 2)
  call void %86(%struct.jpeg_common_struct* %88)
  br label %90

; <label>:90:                                     ; preds = %63, %58
  %91 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %92 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %91, i32 0, i32 51
  %93 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %92, align 8
  %94 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %93, i32 0, i32 3
  %95 = load i32, i32* %94, align 8
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %106

; <label>:97:                                     ; preds = %90
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_write_raw_data, i64 0, i64 3)
  %98 = add i64 %pgocount3, 1
  store i64 %98, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_write_raw_data, i64 0, i64 3)
  %99 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %100 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %99, i32 0, i32 51
  %101 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %100, align 8
  %102 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %101, i32 0, i32 1
  %103 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %102, align 8
  %104 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %105 = ptrtoint void (%struct.jpeg_compress_struct*)* %103 to i64
  call void @__llvm_profile_instrument_target(i64 %105, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_raw_data to i8*), i32 3)
  call void %103(%struct.jpeg_compress_struct* %104)
  br label %106

; <label>:106:                                    ; preds = %97, %90
  %107 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %108 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %107, i32 0, i32 39
  %109 = load i32, i32* %108, align 4
  %110 = mul nsw i32 %109, 8
  store i32 %110, i32* %8, align 4
  %111 = load i32, i32* %7, align 4
  %112 = load i32, i32* %8, align 4
  %113 = icmp ult i32 %111, %112
  br i1 %113, label %114, label %128

; <label>:114:                                    ; preds = %106
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_write_raw_data, i64 0, i64 5)
  %115 = add i64 %pgocount4, 1
  store i64 %115, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_write_raw_data, i64 0, i64 5)
  %116 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %117 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %116, i32 0, i32 0
  %118 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %117, align 8
  %119 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %118, i32 0, i32 5
  store i32 21, i32* %119, align 8
  %120 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %121 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %120, i32 0, i32 0
  %122 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %121, align 8
  %123 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %122, i32 0, i32 0
  %124 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %123, align 8
  %125 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %126 = bitcast %struct.jpeg_compress_struct* %125 to %struct.jpeg_common_struct*
  %127 = ptrtoint void (%struct.jpeg_common_struct*)* %124 to i64
  call void @__llvm_profile_instrument_target(i64 %127, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_raw_data to i8*), i32 4)
  call void %124(%struct.jpeg_common_struct* %126)
  br label %128

; <label>:128:                                    ; preds = %114, %106
  %129 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %130 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %129, i32 0, i32 54
  %131 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %130, align 8
  %132 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %131, i32 0, i32 1
  %133 = load i32 (%struct.jpeg_compress_struct*, i8***)*, i32 (%struct.jpeg_compress_struct*, i8***)** %132, align 8
  %134 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %135 = load i8***, i8**** %6, align 8
  %136 = ptrtoint i32 (%struct.jpeg_compress_struct*, i8***)* %133 to i64
  call void @__llvm_profile_instrument_target(i64 %136, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_raw_data to i8*), i32 5)
  %137 = call i32 %133(%struct.jpeg_compress_struct* %134, i8*** %135)
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %141, label %139

; <label>:139:                                    ; preds = %128
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_write_raw_data, i64 0, i64 6)
  %140 = add i64 %pgocount5, 1
  store i64 %140, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_write_raw_data, i64 0, i64 6)
  store i32 0, i32* %4, align 4
  br label %149

; <label>:141:                                    ; preds = %128
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_write_raw_data, i64 0, i64 4)
  %142 = add i64 %pgocount6, 1
  store i64 %142, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_write_raw_data, i64 0, i64 4)
  %143 = load i32, i32* %8, align 4
  %144 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %145 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %144, i32 0, i32 36
  %146 = load i32, i32* %145, align 8
  %147 = add i32 %146, %143
  store i32 %147, i32* %145, align 8
  %148 = load i32, i32* %8, align 4
  store i32 %148, i32* %4, align 4
  br label %149

; <label>:149:                                    ; preds = %141, %139, %44
  %150 = load i32, i32* %4, align 4
  ret i32 %150
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

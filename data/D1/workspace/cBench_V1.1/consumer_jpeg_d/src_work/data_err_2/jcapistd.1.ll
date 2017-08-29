; ModuleID = 'jcapistd.ll'
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

; Function Attrs: noinline nounwind uwtable
define void @jpeg_start_compress(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 4
  %4 = load i32, i32* %3, align 4
  %5 = icmp eq i32 %4, 100
  br i1 %5, label %17, label %6

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %8 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %8, i64 0, i32 5
  store i32 18, i32* %9, align 8
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr8 = add i64 %sunkaddr, 28
  %sunkaddr9 = inttoptr i64 %sunkaddr8 to i32*
  %10 = load i32, i32* %sunkaddr9, align 4
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %12 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 6, i32 0, i64 0
  store i32 %10, i32* %12, align 4
  %13 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %14 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %13, align 8
  %15 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %14, align 8
  %16 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %15(%struct.jpeg_common_struct* %16) #2
  br label %17

; <label>:17:                                     ; preds = %2, %6
  %18 = icmp eq i32 %1, 0
  br i1 %18, label %20, label %19

; <label>:19:                                     ; preds = %17
  tail call void @jpeg_suppress_tables(%struct.jpeg_compress_struct* nonnull %0, i32 0) #2
  br label %20

; <label>:20:                                     ; preds = %17, %19
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i64 0, i32 4
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %24(%struct.jpeg_common_struct* %.cast) #2
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %26 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %26, i64 0, i32 2
  %28 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %27, align 8
  tail call void %28(%struct.jpeg_compress_struct* nonnull %0) #2
  tail call void @jinit_compress_master(%struct.jpeg_compress_struct* nonnull %0) #2
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 51
  %30 = bitcast %struct.jpeg_comp_master** %29 to void (%struct.jpeg_compress_struct*)***
  %31 = load void (%struct.jpeg_compress_struct*)**, void (%struct.jpeg_compress_struct*)*** %30, align 8
  %32 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %31, align 8
  tail call void %32(%struct.jpeg_compress_struct* nonnull %0) #2
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 36
  store i32 0, i32* %33, align 8
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 23
  %35 = load i32, i32* %34, align 8
  %36 = icmp ne i32 %35, 0
  %37 = select i1 %36, i32 102, i32 101
  %sunkaddr10 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr11 = add i64 %sunkaddr10, 28
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to i32*
  store i32 %37, i32* %sunkaddr12, align 4
  ret void
}

declare void @jpeg_suppress_tables(%struct.jpeg_compress_struct*, i32) #1

declare void @jinit_compress_master(%struct.jpeg_compress_struct*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_write_scanlines(%struct.jpeg_compress_struct*, i8**, i32) #0 {
  %4 = alloca i32, align 4
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 4
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 101
  br i1 %7, label %19, label %8

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 5
  store i32 18, i32* %11, align 8
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr18 = add i64 %sunkaddr, 28
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to i32*
  %12 = load i32, i32* %sunkaddr19, align 4
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 6, i32 0, i64 0
  store i32 %12, i32* %14, align 4
  %15 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %16 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %15, align 8
  %17 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %16, align 8
  %18 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %17(%struct.jpeg_common_struct* %18) #2
  br label %19

; <label>:19:                                     ; preds = %3, %8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 36
  %21 = load i32, i32* %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  %23 = load i32, i32* %22, align 4
  %24 = icmp ult i32 %21, %23
  br i1 %24, label %33, label %25

; <label>:25:                                     ; preds = %19
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i64 0, i32 5
  store i32 119, i32* %28, align 8
  %29 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %29, i64 0, i32 1
  %31 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %30, align 8
  %32 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %31(%struct.jpeg_common_struct* %32, i32 -1) #2
  br label %33

; <label>:33:                                     ; preds = %19, %25
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 2
  %35 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %34, align 8
  %36 = icmp eq %struct.jpeg_progress_mgr* %35, null
  br i1 %36, label %47, label %37

; <label>:37:                                     ; preds = %33
  %sunkaddr20 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr21 = add i64 %sunkaddr20, 296
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i32*
  %38 = load i32, i32* %sunkaddr22, align 8
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %35, i64 0, i32 1
  store i64 %39, i64* %40, align 8
  %sunkaddr23 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr24 = add i64 %sunkaddr23, 44
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to i32*
  %41 = load i32, i32* %sunkaddr25, align 4
  %42 = zext i32 %41 to i64
  %sunkaddr26 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr27 = add i64 %sunkaddr26, 16
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to %struct.jpeg_progress_mgr**
  %43 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr28, align 8
  %44 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %43, i64 0, i32 2
  store i64 %42, i64* %44, align 8
  %sunkaddr29 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr30 = add i64 %sunkaddr29, 16
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to void (%struct.jpeg_common_struct*)***
  %45 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %sunkaddr31, align 8
  %46 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %45, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %46(%struct.jpeg_common_struct* %.cast) #2
  br label %47

; <label>:47:                                     ; preds = %33, %37
  %48 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 51
  %49 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %48, align 8
  %50 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %49, i64 0, i32 3
  %51 = load i32, i32* %50, align 8
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %56, label %53

; <label>:53:                                     ; preds = %47
  %54 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %49, i64 0, i32 1
  %55 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %54, align 8
  tail call void %55(%struct.jpeg_compress_struct* nonnull %0) #2
  br label %56

; <label>:56:                                     ; preds = %47, %53
  %sunkaddr32 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr33 = add i64 %sunkaddr32, 44
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i32*
  %57 = load i32, i32* %sunkaddr34, align 4
  %sunkaddr35 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr36 = add i64 %sunkaddr35, 296
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to i32*
  %58 = load i32, i32* %sunkaddr37, align 8
  %59 = sub i32 %57, %58
  %60 = icmp ult i32 %59, %2
  %. = select i1 %60, i32 %59, i32 %2
  store i32 0, i32* %4, align 4
  %61 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 52
  %62 = load %struct.jpeg_c_main_controller*, %struct.jpeg_c_main_controller** %61, align 8
  %63 = getelementptr inbounds %struct.jpeg_c_main_controller, %struct.jpeg_c_main_controller* %62, i64 0, i32 1
  %64 = load void (%struct.jpeg_compress_struct*, i8**, i32*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32)** %63, align 8
  call void %64(%struct.jpeg_compress_struct* nonnull %0, i8** %1, i32* nonnull %4, i32 %.) #2
  %65 = load i32, i32* %4, align 4
  %66 = load i32, i32* %sunkaddr37, align 8
  %67 = add i32 %66, %65
  store i32 %67, i32* %sunkaddr37, align 8
  ret i32 %65
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_write_raw_data(%struct.jpeg_compress_struct*, i8***, i32) #0 {
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 4
  %5 = load i32, i32* %4, align 4
  %6 = icmp eq i32 %5, 102
  br i1 %6, label %18, label %7

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %9 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %9, i64 0, i32 5
  store i32 18, i32* %10, align 8
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr19 = add i64 %sunkaddr, 28
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  %11 = load i32, i32* %sunkaddr20, align 4
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 6, i32 0, i64 0
  store i32 %11, i32* %13, align 4
  %14 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %15 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %14, align 8
  %16 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %15, align 8
  %17 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %16(%struct.jpeg_common_struct* %17) #2
  br label %18

; <label>:18:                                     ; preds = %3, %7
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 36
  %20 = load i32, i32* %19, align 8
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  %23 = load i32, i32* %22, align 4
  %24 = icmp ult i32 %20, %23
  br i1 %24, label %33, label %25

; <label>:25:                                     ; preds = %18
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i64 0, i32 5
  store i32 119, i32* %28, align 8
  %29 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %29, i64 0, i32 1
  %31 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %30, align 8
  %32 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %31(%struct.jpeg_common_struct* %32, i32 -1) #2
  br label %77

; <label>:33:                                     ; preds = %18
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 2
  %35 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %34, align 8
  %36 = icmp eq %struct.jpeg_progress_mgr* %35, null
  br i1 %36, label %45, label %37

; <label>:37:                                     ; preds = %33
  %38 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %35, i64 0, i32 1
  store i64 %21, i64* %38, align 8
  %sunkaddr21 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 44
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i32*
  %39 = load i32, i32* %sunkaddr23, align 4
  %40 = zext i32 %39 to i64
  %sunkaddr24 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr25 = add i64 %sunkaddr24, 16
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to %struct.jpeg_progress_mgr**
  %41 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr26, align 8
  %42 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %41, i64 0, i32 2
  store i64 %40, i64* %42, align 8
  %sunkaddr27 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr28 = add i64 %sunkaddr27, 16
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to void (%struct.jpeg_common_struct*)***
  %43 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %sunkaddr29, align 8
  %44 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %43, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %44(%struct.jpeg_common_struct* %.cast) #2
  br label %45

; <label>:45:                                     ; preds = %33, %37
  %46 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 51
  %47 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %47, i64 0, i32 3
  %49 = load i32, i32* %48, align 8
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %54, label %51

; <label>:51:                                     ; preds = %45
  %52 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %47, i64 0, i32 1
  %53 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %52, align 8
  tail call void %53(%struct.jpeg_compress_struct* nonnull %0) #2
  br label %54

; <label>:54:                                     ; preds = %45, %51
  %55 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %56 = load i32, i32* %55, align 4
  %57 = shl nsw i32 %56, 3
  %58 = icmp ugt i32 %57, %2
  br i1 %58, label %59, label %67

; <label>:59:                                     ; preds = %54
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %61 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %60, align 8
  %62 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %61, i64 0, i32 5
  store i32 21, i32* %62, align 8
  %63 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %64 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %63, align 8
  %65 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %64, align 8
  %66 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %65(%struct.jpeg_common_struct* %66) #2
  br label %67

; <label>:67:                                     ; preds = %59, %54
  %68 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %69 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %68, align 8
  %70 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %69, i64 0, i32 1
  %71 = load i32 (%struct.jpeg_compress_struct*, i8***)*, i32 (%struct.jpeg_compress_struct*, i8***)** %70, align 8
  %72 = tail call i32 %71(%struct.jpeg_compress_struct* nonnull %0, i8*** %1) #2
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %77, label %74

; <label>:74:                                     ; preds = %67
  %sunkaddr30 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr31 = add i64 %sunkaddr30, 296
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to i32*
  %75 = load i32, i32* %sunkaddr32, align 8
  %76 = add i32 %75, %57
  store i32 %76, i32* %sunkaddr32, align 8
  br label %77

; <label>:77:                                     ; preds = %67, %74, %25
  %.0 = phi i32 [ %57, %74 ], [ 0, %25 ], [ 0, %67 ]
  ret i32 %.0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

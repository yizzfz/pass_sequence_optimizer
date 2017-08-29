; ModuleID = 'jcapimin.ll'
source_filename = "jcapimin.c"
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
%struct.jpeg_entropy_encoder = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, void (%struct.jpeg_compress_struct*)* }

; Function Attrs: noinline nounwind uwtable
define void @jpeg_CreateCompress(%struct.jpeg_compress_struct*, i32, i64) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  store %struct.jpeg_memory_mgr* null, %struct.jpeg_memory_mgr** %4, align 8
  %5 = icmp eq i32 %1, 61
  br i1 %5, label %18, label %6

; <label>:6:                                      ; preds = %3
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %8 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %8, i64 0, i32 5
  store i32 10, i32* %9, align 8
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 6, i32 0, i64 0
  store i32 61, i32* %11, align 4
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 6, i32 0, i64 1
  store i32 %1, i32* %13, align 4
  %14 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %15 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %14, align 8
  %16 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %15, align 8
  %17 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %16(%struct.jpeg_common_struct* %17) #4
  br label %18

; <label>:18:                                     ; preds = %3, %6
  %19 = icmp eq i64 %2, 496
  br i1 %19, label %.preheader, label %20

; <label>:20:                                     ; preds = %18
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i64 0, i32 5
  store i32 19, i32* %23, align 8
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i64 0, i32 6, i32 0, i64 0
  store i32 496, i32* %25, align 4
  %26 = trunc i64 %2 to i32
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i64 0, i32 6, i32 0, i64 1
  store i32 %26, i32* %28, align 4
  %29 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %30 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %29, align 8
  %31 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %30, align 8
  %32 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %31(%struct.jpeg_common_struct* %32) #4
  br label %.preheader

.preheader:                                       ; preds = %18, %20
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %34 = bitcast %struct.jpeg_memory_mgr** %33 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %34, i8 0, i64 488, i32 1, i1 false)
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 3
  store i32 0, i32* %35, align 8
  %36 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void @jinit_memory_mgr(%struct.jpeg_common_struct* %36) #4
  %37 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 2
  store %struct.jpeg_progress_mgr* null, %struct.jpeg_progress_mgr** %37, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  store %struct.jpeg_destination_mgr* null, %struct.jpeg_destination_mgr** %38, align 8
  %39 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %40 = bitcast %struct.jpeg_component_info** %39 to i8*
  call void @llvm.memset.p0i8.i64(i8* %40, i8 0, i64 40, i32 8, i1 false)
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 0
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 10
  %43 = bitcast %struct.JHUFF_TBL** %41 to i8*
  call void @llvm.memset.p0i8.i64(i8* %43, i8 0, i64 64, i32 8, i1 false)
  store double 1.000000e+00, double* %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 4
  store i32 100, i32* %44, align 4
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

declare void @jinit_memory_mgr(%struct.jpeg_common_struct*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define void @jpeg_destroy_compress(%struct.jpeg_compress_struct*) local_unnamed_addr #0 {
  %2 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void @jpeg_destroy(%struct.jpeg_common_struct* %2) #4
  ret void
}

declare void @jpeg_destroy(%struct.jpeg_common_struct*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define void @jpeg_abort_compress(%struct.jpeg_compress_struct*) local_unnamed_addr #0 {
  %2 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void @jpeg_abort(%struct.jpeg_common_struct* %2) #4
  ret void
}

declare void @jpeg_abort(%struct.jpeg_common_struct*) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define void @jpeg_suppress_tables(%struct.jpeg_compress_struct* nocapture readonly, i32) local_unnamed_addr #3 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 15, i64 0
  %4 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %3, align 8
  %5 = icmp eq %struct.JQUANT_TBL* %4, null
  br i1 %5, label %8, label %6

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %4, i64 0, i32 1
  store i32 %1, i32* %7, align 4
  br label %8

; <label>:8:                                      ; preds = %2, %6
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 15, i64 1
  %10 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %11 = icmp eq %struct.JQUANT_TBL* %10, null
  br i1 %11, label %59, label %57

.preheader:                                       ; preds = %65, %69
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 0
  %13 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %12, align 8
  %14 = icmp eq %struct.JHUFF_TBL* %13, null
  br i1 %14, label %17, label %15

; <label>:15:                                     ; preds = %.preheader
  %16 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %13, i64 0, i32 2
  store i32 %1, i32* %16, align 4
  br label %17

; <label>:17:                                     ; preds = %.preheader, %15
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 0
  %19 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %18, align 8
  %20 = icmp eq %struct.JHUFF_TBL* %19, null
  br i1 %20, label %.preheader.13, label %21

; <label>:21:                                     ; preds = %17
  %22 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %19, i64 0, i32 2
  store i32 %1, i32* %22, align 4
  br label %.preheader.13

.preheader.13:                                    ; preds = %17, %21
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 1
  %24 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %23, align 8
  %25 = icmp eq %struct.JHUFF_TBL* %24, null
  br i1 %25, label %28, label %26

; <label>:26:                                     ; preds = %.preheader.13
  %27 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %24, i64 0, i32 2
  store i32 %1, i32* %27, align 4
  br label %28

; <label>:28:                                     ; preds = %.preheader.13, %26
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 1
  %30 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %29, align 8
  %31 = icmp eq %struct.JHUFF_TBL* %30, null
  br i1 %31, label %.preheader.24, label %32

; <label>:32:                                     ; preds = %28
  %33 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %30, i64 0, i32 2
  store i32 %1, i32* %33, align 4
  br label %.preheader.24

.preheader.24:                                    ; preds = %28, %32
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 2
  %35 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %34, align 8
  %36 = icmp eq %struct.JHUFF_TBL* %35, null
  br i1 %36, label %39, label %37

; <label>:37:                                     ; preds = %.preheader.24
  %38 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %35, i64 0, i32 2
  store i32 %1, i32* %38, align 4
  br label %39

; <label>:39:                                     ; preds = %.preheader.24, %37
  %40 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 2
  %41 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %40, align 8
  %42 = icmp eq %struct.JHUFF_TBL* %41, null
  br i1 %42, label %.preheader.35, label %43

; <label>:43:                                     ; preds = %39
  %44 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %41, i64 0, i32 2
  store i32 %1, i32* %44, align 4
  br label %.preheader.35

.preheader.35:                                    ; preds = %39, %43
  %45 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 3
  %46 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %45, align 8
  %47 = icmp eq %struct.JHUFF_TBL* %46, null
  br i1 %47, label %50, label %48

; <label>:48:                                     ; preds = %.preheader.35
  %49 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %46, i64 0, i32 2
  store i32 %1, i32* %49, align 4
  br label %50

; <label>:50:                                     ; preds = %.preheader.35, %48
  %51 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 3
  %52 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %51, align 8
  %53 = icmp eq %struct.JHUFF_TBL* %52, null
  br i1 %53, label %56, label %54

; <label>:54:                                     ; preds = %50
  %55 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %52, i64 0, i32 2
  store i32 %1, i32* %55, align 4
  br label %56

; <label>:56:                                     ; preds = %50, %54
  ret void

; <label>:57:                                     ; preds = %8
  %58 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %10, i64 0, i32 1
  store i32 %1, i32* %58, align 4
  br label %59

; <label>:59:                                     ; preds = %8, %57
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 15, i64 2
  %61 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %60, align 8
  %62 = icmp eq %struct.JQUANT_TBL* %61, null
  br i1 %62, label %65, label %63

; <label>:63:                                     ; preds = %59
  %64 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %61, i64 0, i32 1
  store i32 %1, i32* %64, align 4
  br label %65

; <label>:65:                                     ; preds = %59, %63
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 15, i64 3
  %67 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %66, align 8
  %68 = icmp eq %struct.JQUANT_TBL* %67, null
  br i1 %68, label %.preheader, label %69

; <label>:69:                                     ; preds = %65
  %70 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %67, i64 0, i32 1
  store i32 %1, i32* %70, align 4
  br label %.preheader
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_finish_compress(%struct.jpeg_compress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  switch i32 %3, label %23 [
    i32 101, label %4
    i32 102, label %4
    i32 103, label %.preheader
  ]

; <label>:4:                                      ; preds = %1, %1
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 36
  %6 = load i32, i32* %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  %8 = load i32, i32* %7, align 4
  %9 = icmp ult i32 %6, %8
  br i1 %9, label %10, label %18

; <label>:10:                                     ; preds = %4
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 5
  store i32 66, i32* %13, align 8
  %14 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %15 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %14, align 8
  %16 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %15, align 8
  %17 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %16(%struct.jpeg_common_struct* %17) #4
  br label %18

; <label>:18:                                     ; preds = %4, %10
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 51
  %20 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %20, i64 0, i32 2
  %22 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %21, align 8
  tail call void %22(%struct.jpeg_compress_struct* nonnull %0) #4
  br label %.preheader

; <label>:23:                                     ; preds = %1
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i64 0, i32 5
  store i32 18, i32* %26, align 8
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr4 = add i64 %sunkaddr, 28
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  %27 = load i32, i32* %sunkaddr5, align 4
  %28 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %29 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %28, i64 0, i32 6, i32 0, i64 0
  store i32 %27, i32* %29, align 4
  %30 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %31 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %30, align 8
  %32 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %31, align 8
  %33 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %32(%struct.jpeg_common_struct* %33) #4
  br label %.preheader

.preheader:                                       ; preds = %1, %23, %18
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 51
  %35 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %35, i64 0, i32 4
  %37 = load i32, i32* %36, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %.lr.ph2.preheader, label %._crit_edge3

.lr.ph2.preheader:                                ; preds = %.preheader
  %sunkaddr36 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr37 = add i64 %sunkaddr36, 312
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to i32*
  %sunkaddr57 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr58 = add i64 %sunkaddr57, 424
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to %struct.jpeg_comp_master**
  %sunkaddr39 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr40 = add i64 %sunkaddr39, 16
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to %struct.jpeg_progress_mgr**
  %sunkaddr51 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr52 = add i64 %sunkaddr51, 448
  %sunkaddr53 = inttoptr i64 %sunkaddr52 to %struct.jpeg_c_coef_controller**
  %39 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %40 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %41 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr54 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr55 = add i64 %sunkaddr54, 312
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to i32*
  %42 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr42 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr43 = add i64 %sunkaddr42, 312
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to i32*
  %sunkaddr45 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr46 = add i64 %sunkaddr45, 16
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to %struct.jpeg_progress_mgr**
  %sunkaddr48 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr49 = add i64 %sunkaddr48, 16
  %sunkaddr50 = inttoptr i64 %sunkaddr49 to void (%struct.jpeg_common_struct*)***
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %.lr.ph2.preheader, %._crit_edge
  %43 = phi %struct.jpeg_comp_master* [ %77, %._crit_edge ], [ %35, %.lr.ph2.preheader ]
  %44 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %43, i64 0, i32 0
  %45 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %44, align 8
  tail call void %45(%struct.jpeg_compress_struct* nonnull %0) #4
  %46 = load i32, i32* %sunkaddr38, align 8
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %70
  %.01 = phi i32 [ %71, %70 ], [ 0, %.lr.ph.preheader ]
  %48 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr41, align 8
  %49 = icmp eq %struct.jpeg_progress_mgr* %48, null
  br i1 %49, label %59, label %50

; <label>:50:                                     ; preds = %.lr.ph
  %51 = zext i32 %.01 to i64
  %52 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %48, i64 0, i32 1
  store i64 %51, i64* %52, align 8
  %53 = load i32, i32* %sunkaddr44, align 8
  %54 = zext i32 %53 to i64
  %55 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr47, align 8
  %56 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %55, i64 0, i32 2
  store i64 %54, i64* %56, align 8
  %57 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %sunkaddr50, align 8
  %58 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %57, align 8
  tail call void %58(%struct.jpeg_common_struct* nonnull %42) #4
  br label %59

; <label>:59:                                     ; preds = %.lr.ph, %50
  %60 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %sunkaddr53, align 8
  %61 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %60, i64 0, i32 1
  %62 = load i32 (%struct.jpeg_compress_struct*, i8***)*, i32 (%struct.jpeg_compress_struct*, i8***)** %61, align 8
  %63 = tail call i32 %62(%struct.jpeg_compress_struct* nonnull %0, i8*** null) #4
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %65, label %70

; <label>:65:                                     ; preds = %59
  %66 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %67 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %66, i64 0, i32 5
  store i32 22, i32* %67, align 8
  %68 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %41, align 8
  %69 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %68, align 8
  tail call void %69(%struct.jpeg_common_struct* nonnull %40) #4
  br label %70

; <label>:70:                                     ; preds = %59, %65
  %71 = add i32 %.01, 1
  %72 = load i32, i32* %sunkaddr56, align 8
  %73 = icmp ult i32 %71, %72
  br i1 %73, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %70
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph2
  %74 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %sunkaddr59, align 8
  %75 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %74, i64 0, i32 2
  %76 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %75, align 8
  tail call void %76(%struct.jpeg_compress_struct* nonnull %0) #4
  %77 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %sunkaddr59, align 8
  %78 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %77, i64 0, i32 4
  %79 = load i32, i32* %78, align 4
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %.lr.ph2, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %.preheader
  %81 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 55
  %82 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %81, align 8
  %83 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %82, i64 0, i32 4
  %84 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %83, align 8
  tail call void %84(%struct.jpeg_compress_struct* nonnull %0) #4
  %85 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %86 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %85, align 8
  %87 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %86, i64 0, i32 4
  %88 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %87, align 8
  tail call void %88(%struct.jpeg_compress_struct* nonnull %0) #4
  %89 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void @jpeg_abort(%struct.jpeg_common_struct* %89) #4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_write_marker(%struct.jpeg_compress_struct*, i32, i8*, i32) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 36
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %11

; <label>:8:                                      ; preds = %4
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 4
  %10 = load i32, i32* %9, align 4
  %.off = add i32 %10, -101
  %switch = icmp ult i32 %.off, 3
  br i1 %switch, label %23, label %11

; <label>:11:                                     ; preds = %8, %4
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 5
  store i32 18, i32* %14, align 8
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 4
  %16 = load i32, i32* %15, align 4
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i64 0, i32 6, i32 0, i64 0
  store i32 %16, i32* %18, align 4
  %19 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %20 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %19, align 8
  %21 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %20, align 8
  %22 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %21(%struct.jpeg_common_struct* %22) #4
  br label %23

; <label>:23:                                     ; preds = %8, %11
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 55
  %25 = bitcast %struct.jpeg_marker_writer** %24 to void (%struct.jpeg_compress_struct*, i32, i8*, i32)***
  %26 = load void (%struct.jpeg_compress_struct*, i32, i8*, i32)**, void (%struct.jpeg_compress_struct*, i32, i8*, i32)*** %25, align 8
  %27 = load void (%struct.jpeg_compress_struct*, i32, i8*, i32)*, void (%struct.jpeg_compress_struct*, i32, i8*, i32)** %26, align 8
  tail call void %27(%struct.jpeg_compress_struct* nonnull %0, i32 %1, i8* %2, i32 %3) #4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_write_tables(%struct.jpeg_compress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 100
  br i1 %4, label %16, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %7 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %7, i64 0, i32 5
  store i32 18, i32* %8, align 8
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr1 = add i64 %sunkaddr, 28
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  %9 = load i32, i32* %sunkaddr2, align 4
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 6, i32 0, i64 0
  store i32 %9, i32* %11, align 4
  %12 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %13 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %12, align 8
  %14 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %13, align 8
  %15 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %14(%struct.jpeg_common_struct* %15) #4
  br label %16

; <label>:16:                                     ; preds = %1, %5
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i64 0, i32 4
  %20 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %19, align 8
  %21 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %20(%struct.jpeg_common_struct* %21) #4
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %23 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %23, i64 0, i32 2
  %25 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %24, align 8
  tail call void %25(%struct.jpeg_compress_struct* nonnull %0) #4
  tail call void @jinit_marker_writer(%struct.jpeg_compress_struct* nonnull %0) #4
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 55
  %27 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %27, i64 0, i32 5
  %29 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %28, align 8
  tail call void %29(%struct.jpeg_compress_struct* nonnull %0) #4
  %30 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %22, align 8
  %31 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %30, i64 0, i32 4
  %32 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %31, align 8
  tail call void %32(%struct.jpeg_compress_struct* nonnull %0) #4
  tail call void @jpeg_abort(%struct.jpeg_common_struct* %21) #4
  ret void
}

declare void @jinit_marker_writer(%struct.jpeg_compress_struct*) local_unnamed_addr #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

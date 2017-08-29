; ModuleID = 'jdmerge.ll'
source_filename = "jdmerge.c"
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
%struct.jpeg_source_mgr = type { i8*, i64, {}*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, {}* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.jpeg_decomp_master = type { {}*, {}*, i32 }
%struct.jpeg_d_main_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* }
%struct.jpeg_d_coef_controller = type { {}*, i32 (%struct.jpeg_decompress_struct*)*, {}*, i32 (%struct.jpeg_decompress_struct*, i8***)*, %struct.jvirt_barray_control** }
%struct.jpeg_d_post_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* }
%struct.jpeg_input_controller = type { i32 (%struct.jpeg_decompress_struct*)*, {}*, {}*, {}*, i32, i32 }
%struct.jpeg_marker_reader = type { {}*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, [16 x i32 (%struct.jpeg_decompress_struct*)*], i32, i32, i32, i32 }
%struct.jpeg_entropy_decoder = type { {}*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* }
%struct.jpeg_inverse_dct = type { {}*, [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*] }
%struct.jpeg_upsampler = type { {}*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, i32 }
%struct.jpeg_color_deconverter = type { {}*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* }
%struct.jpeg_color_quantizer = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, {}*, {}* }
%struct.my_upsampler = type { %struct.jpeg_upsampler, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)*, i32*, i32*, i64*, i64*, i8*, i32, i32, i32 }

; Function Attrs: noinline nounwind uwtable
define void @jinit_merged_upsampler(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %3, i64 0, i32 0
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 88) #3
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %9 = bitcast %struct.jpeg_upsampler** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_pass_merged_upsample, void (%struct.jpeg_decompress_struct*)** %10, align 8
  %11 = getelementptr inbounds i8, i8* %7, i64 16
  %12 = bitcast i8* %11 to i32*
  store i32 0, i32* %12, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %14 = load i32, i32* %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %16 = load i32, i32* %15, align 8
  %17 = mul i32 %16, %14
  %18 = getelementptr inbounds i8, i8* %7, i64 76
  %19 = bitcast i8* %18 to i32*
  store i32 %17, i32* %19, align 4
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %21 = load i32, i32* %20, align 8
  %22 = icmp eq i32 %21, 2
  %23 = getelementptr inbounds i8, i8* %7, i64 8
  %24 = bitcast i8* %23 to void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)**
  br i1 %22, label %25, label %34

; <label>:25:                                     ; preds = %1
  store void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @merged_2v_upsample, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %24, align 8
  %26 = getelementptr inbounds i8, i8* %7, i64 24
  %27 = bitcast i8* %26 to void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)* @h2v2_merged_upsample, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)** %27, align 8
  %28 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %29 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %28, i64 0, i32 1
  %30 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %29, align 8
  %31 = load i32, i32* %19, align 4
  %32 = zext i32 %31 to i64
  %33 = tail call i8* %30(%struct.jpeg_common_struct* %6, i32 1, i64 %32) #3
  br label %37

; <label>:34:                                     ; preds = %1
  store void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @merged_1v_upsample, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %24, align 8
  %35 = getelementptr inbounds i8, i8* %7, i64 24
  %36 = bitcast i8* %35 to void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)* @h2v1_merged_upsample, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)** %36, align 8
  br label %37

; <label>:37:                                     ; preds = %34, %25
  %.sink = phi i8* [ null, %34 ], [ %33, %25 ]
  %38 = getelementptr inbounds i8, i8* %7, i64 64
  %39 = bitcast i8* %38 to i8**
  store i8* %.sink, i8** %39, align 8
  tail call void @build_ycc_rgb_table(%struct.jpeg_decompress_struct* nonnull %0)
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @start_pass_merged_upsample(%struct.jpeg_decompress_struct* nocapture readonly) #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %3 = bitcast %struct.jpeg_upsampler** %2 to %struct.my_upsampler**
  %4 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %5 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %4, i64 0, i32 7
  store i32 0, i32* %5, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %7 = load i32, i32* %6, align 4
  %8 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %4, i64 0, i32 9
  store i32 %7, i32* %8, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @merged_2v_upsample(%struct.jpeg_decompress_struct*, i8***, i32* nocapture, i32, i8**, i32* nocapture, i32) #0 {
  %8 = alloca [2 x i8*], align 16
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %10 = bitcast %struct.jpeg_upsampler** %9 to %struct.my_upsampler**
  %11 = load %struct.my_upsampler*, %struct.my_upsampler** %10, align 8
  %12 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %11, i64 0, i32 7
  %13 = load i32, i32* %12, align 8
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %22, label %15

; <label>:15:                                     ; preds = %7
  %16 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %11, i64 0, i32 6
  %17 = load i32, i32* %5, align 4
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds i8*, i8** %4, i64 %18
  %20 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %11, i64 0, i32 8
  %21 = load i32, i32* %20, align 4
  tail call void @jcopy_sample_rows(i8** %16, i32 0, i8** %19, i32 0, i32 1, i32 %21) #3
  store i32 0, i32* %12, align 8
  br label %55

; <label>:22:                                     ; preds = %7
  %23 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %11, i64 0, i32 9
  %24 = load i32, i32* %23, align 8
  %25 = icmp ult i32 %24, 2
  %. = select i1 %25, i32 %24, i32 2
  %26 = load i32, i32* %5, align 4
  %27 = sub i32 %6, %26
  %28 = icmp ugt i32 %., %27
  %..0 = select i1 %28, i32 %27, i32 %.
  %29 = zext i32 %26 to i64
  %30 = getelementptr inbounds i8*, i8** %4, i64 %29
  %31 = bitcast i8** %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = bitcast [2 x i8*]* %8 to i64*
  store i64 %32, i64* %33, align 16
  %34 = icmp ugt i32 %..0, 1
  br i1 %34, label %35, label %44

; <label>:35:                                     ; preds = %22
  %36 = load i32, i32* %5, align 4
  %37 = add i32 %36, 1
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i8*, i8** %4, i64 %38
  %40 = bitcast i8** %39 to i64*
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds [2 x i8*], [2 x i8*]* %8, i64 0, i64 1
  %43 = bitcast i8** %42 to i64*
  store i64 %41, i64* %43, align 8
  br label %50

; <label>:44:                                     ; preds = %22
  %45 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %11, i64 0, i32 6
  %46 = bitcast i8** %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds [2 x i8*], [2 x i8*]* %8, i64 0, i64 1
  %49 = bitcast i8** %48 to i64*
  store i64 %47, i64* %49, align 8
  store i32 1, i32* %12, align 8
  br label %50

; <label>:50:                                     ; preds = %44, %35
  %51 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %11, i64 0, i32 1
  %52 = load void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)** %51, align 8
  %53 = load i32, i32* %2, align 4
  %54 = getelementptr inbounds [2 x i8*], [2 x i8*]* %8, i64 0, i64 0
  call void %52(%struct.jpeg_decompress_struct* nonnull %0, i8*** %1, i32 %53, i8** nonnull %54) #3
  br label %55

; <label>:55:                                     ; preds = %50, %15
  %.2 = phi i32 [ 1, %15 ], [ %..0, %50 ]
  %56 = load i32, i32* %5, align 4
  %57 = add i32 %56, %.2
  store i32 %57, i32* %5, align 4
  %58 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %11, i64 0, i32 9
  %59 = load i32, i32* %58, align 8
  %60 = sub i32 %59, %.2
  store i32 %60, i32* %58, align 8
  %61 = load i32, i32* %12, align 8
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %63, label %66

; <label>:63:                                     ; preds = %55
  %64 = load i32, i32* %2, align 4
  %65 = add i32 %64, 1
  store i32 %65, i32* %2, align 4
  br label %66

; <label>:66:                                     ; preds = %55, %63
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @h2v2_merged_upsample(%struct.jpeg_decompress_struct* nocapture readonly, i8*** nocapture readonly, i32, i8** nocapture readonly) #1 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %6 = bitcast %struct.jpeg_upsampler** %5 to %struct.my_upsampler**
  %7 = load %struct.my_upsampler*, %struct.my_upsampler** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %9 = load i8*, i8** %8, align 8
  %10 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %7, i64 0, i32 2
  %11 = load i32*, i32** %10, align 8
  %12 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %7, i64 0, i32 3
  %13 = load i32*, i32** %12, align 8
  %14 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %7, i64 0, i32 4
  %15 = load i64*, i64** %14, align 8
  %16 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %7, i64 0, i32 5
  %17 = load i64*, i64** %16, align 8
  %18 = load i8**, i8*** %1, align 8
  %19 = shl i32 %2, 1
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds i8*, i8** %18, i64 %20
  %22 = load i8*, i8** %21, align 8
  %23 = or i32 %19, 1
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i8*, i8** %18, i64 %24
  %26 = load i8*, i8** %25, align 8
  %27 = getelementptr inbounds i8**, i8*** %1, i64 1
  %28 = load i8**, i8*** %27, align 8
  %29 = zext i32 %2 to i64
  %30 = getelementptr inbounds i8*, i8** %28, i64 %29
  %31 = load i8*, i8** %30, align 8
  %32 = getelementptr inbounds i8**, i8*** %1, i64 2
  %33 = load i8**, i8*** %32, align 8
  %34 = getelementptr inbounds i8*, i8** %33, i64 %29
  %35 = load i8*, i8** %34, align 8
  %36 = load i8*, i8** %3, align 8
  %37 = getelementptr inbounds i8*, i8** %3, i64 1
  %38 = load i8*, i8** %37, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %40 = load i32, i32* %39, align 8
  %41 = lshr i32 %40, 1
  %42 = zext i32 %41 to i64
  %43 = mul nuw nsw i64 %42, 6
  %scevgep = getelementptr i8, i8* %38, i64 %43
  %44 = shl nuw i32 %41, 1
  %45 = zext i32 %44 to i64
  %scevgep8 = getelementptr i8, i8* %22, i64 %45
  %scevgep10 = getelementptr i8, i8* %31, i64 %42
  %46 = icmp eq i32 %41, 0
  br i1 %46, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %4
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.018 = phi i32 [ %136, %.lr.ph ], [ %41, %.lr.ph.preheader ]
  %.0117 = phi i8* [ %49, %.lr.ph ], [ %35, %.lr.ph.preheader ]
  %.0216 = phi i8* [ %47, %.lr.ph ], [ %31, %.lr.ph.preheader ]
  %.0315 = phi i8* [ %118, %.lr.ph ], [ %26, %.lr.ph.preheader ]
  %.0414 = phi i8* [ %82, %.lr.ph ], [ %22, %.lr.ph.preheader ]
  %.0513 = phi i8* [ %99, %.lr.ph ], [ %36, %.lr.ph.preheader ]
  %.0612 = phi i8* [ %135, %.lr.ph ], [ %38, %.lr.ph.preheader ]
  %47 = getelementptr inbounds i8, i8* %.0216, i64 1
  %48 = load i8, i8* %.0216, align 1
  %49 = getelementptr inbounds i8, i8* %.0117, i64 1
  %50 = load i8, i8* %.0117, align 1
  %51 = zext i8 %50 to i64
  %52 = getelementptr inbounds i32, i32* %11, i64 %51
  %53 = load i32, i32* %52, align 4
  %54 = zext i8 %48 to i64
  %55 = getelementptr inbounds i64, i64* %17, i64 %54
  %56 = load i64, i64* %55, align 8
  %57 = getelementptr inbounds i64, i64* %15, i64 %51
  %58 = load i64, i64* %57, align 8
  %59 = add nsw i64 %58, %56
  %60 = lshr i64 %59, 16
  %61 = trunc i64 %60 to i32
  %62 = getelementptr inbounds i32, i32* %13, i64 %54
  %63 = load i32, i32* %62, align 4
  %64 = getelementptr inbounds i8, i8* %.0414, i64 1
  %65 = load i8, i8* %.0414, align 1
  %66 = zext i8 %65 to i32
  %67 = add nsw i32 %66, %53
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i8, i8* %9, i64 %68
  %70 = load i8, i8* %69, align 1
  store i8 %70, i8* %.0513, align 1
  %71 = add nsw i32 %66, %61
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i8, i8* %9, i64 %72
  %74 = load i8, i8* %73, align 1
  %75 = getelementptr inbounds i8, i8* %.0513, i64 1
  store i8 %74, i8* %75, align 1
  %76 = add nsw i32 %66, %63
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i8, i8* %9, i64 %77
  %79 = load i8, i8* %78, align 1
  %80 = getelementptr inbounds i8, i8* %.0513, i64 2
  store i8 %79, i8* %80, align 1
  %81 = getelementptr inbounds i8, i8* %.0513, i64 3
  %82 = getelementptr inbounds i8, i8* %.0414, i64 2
  %83 = load i8, i8* %64, align 1
  %84 = zext i8 %83 to i32
  %85 = add nsw i32 %84, %53
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i8, i8* %9, i64 %86
  %88 = load i8, i8* %87, align 1
  store i8 %88, i8* %81, align 1
  %89 = add nsw i32 %84, %61
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i8, i8* %9, i64 %90
  %92 = load i8, i8* %91, align 1
  %93 = getelementptr inbounds i8, i8* %.0513, i64 4
  store i8 %92, i8* %93, align 1
  %94 = add nsw i32 %84, %63
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8* %9, i64 %95
  %97 = load i8, i8* %96, align 1
  %98 = getelementptr inbounds i8, i8* %.0513, i64 5
  store i8 %97, i8* %98, align 1
  %99 = getelementptr inbounds i8, i8* %.0513, i64 6
  %100 = getelementptr inbounds i8, i8* %.0315, i64 1
  %101 = load i8, i8* %.0315, align 1
  %102 = zext i8 %101 to i32
  %103 = add nsw i32 %102, %53
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i8, i8* %9, i64 %104
  %106 = load i8, i8* %105, align 1
  store i8 %106, i8* %.0612, align 1
  %107 = add nsw i32 %102, %61
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i8, i8* %9, i64 %108
  %110 = load i8, i8* %109, align 1
  %111 = getelementptr inbounds i8, i8* %.0612, i64 1
  store i8 %110, i8* %111, align 1
  %112 = add nsw i32 %102, %63
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i8, i8* %9, i64 %113
  %115 = load i8, i8* %114, align 1
  %116 = getelementptr inbounds i8, i8* %.0612, i64 2
  store i8 %115, i8* %116, align 1
  %117 = getelementptr inbounds i8, i8* %.0612, i64 3
  %118 = getelementptr inbounds i8, i8* %.0315, i64 2
  %119 = load i8, i8* %100, align 1
  %120 = zext i8 %119 to i32
  %121 = add nsw i32 %120, %53
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i8, i8* %9, i64 %122
  %124 = load i8, i8* %123, align 1
  store i8 %124, i8* %117, align 1
  %125 = add nsw i32 %120, %61
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i8, i8* %9, i64 %126
  %128 = load i8, i8* %127, align 1
  %129 = getelementptr inbounds i8, i8* %.0612, i64 4
  store i8 %128, i8* %129, align 1
  %130 = add nsw i32 %120, %63
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i8, i8* %9, i64 %131
  %133 = load i8, i8* %132, align 1
  %134 = getelementptr inbounds i8, i8* %.0612, i64 5
  store i8 %133, i8* %134, align 1
  %135 = getelementptr inbounds i8, i8* %.0612, i64 6
  %136 = add nsw i32 %.018, -1
  %137 = icmp eq i32 %136, 0
  br i1 %137, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  %scevgep7 = getelementptr i8, i8* %36, i64 %43
  %138 = load i32, i32* %39, align 8
  %139 = and i32 %138, 1
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %189, label %141

; <label>:141:                                    ; preds = %._crit_edge
  %scevgep11 = getelementptr i8, i8* %35, i64 %42
  %scevgep9 = getelementptr i8, i8* %26, i64 %45
  %142 = load i8, i8* %scevgep10, align 1
  %143 = load i8, i8* %scevgep11, align 1
  %144 = zext i8 %143 to i64
  %145 = getelementptr inbounds i32, i32* %11, i64 %144
  %146 = load i32, i32* %145, align 4
  %147 = zext i8 %142 to i64
  %148 = getelementptr inbounds i64, i64* %17, i64 %147
  %149 = load i64, i64* %148, align 8
  %150 = getelementptr inbounds i64, i64* %15, i64 %144
  %151 = load i64, i64* %150, align 8
  %152 = add nsw i64 %151, %149
  %153 = lshr i64 %152, 16
  %154 = trunc i64 %153 to i32
  %155 = getelementptr inbounds i32, i32* %13, i64 %147
  %156 = load i32, i32* %155, align 4
  %157 = load i8, i8* %scevgep8, align 1
  %158 = zext i8 %157 to i32
  %159 = add nsw i32 %158, %146
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i8, i8* %9, i64 %160
  %162 = load i8, i8* %161, align 1
  store i8 %162, i8* %scevgep7, align 1
  %163 = add nsw i32 %158, %154
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i8, i8* %9, i64 %164
  %166 = load i8, i8* %165, align 1
  %167 = getelementptr inbounds i8, i8* %scevgep7, i64 1
  store i8 %166, i8* %167, align 1
  %168 = add nsw i32 %158, %156
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds i8, i8* %9, i64 %169
  %171 = load i8, i8* %170, align 1
  %172 = getelementptr inbounds i8, i8* %scevgep7, i64 2
  store i8 %171, i8* %172, align 1
  %173 = load i8, i8* %scevgep9, align 1
  %174 = zext i8 %173 to i32
  %175 = add nsw i32 %174, %146
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i8, i8* %9, i64 %176
  %178 = load i8, i8* %177, align 1
  store i8 %178, i8* %scevgep, align 1
  %179 = add nsw i32 %174, %154
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds i8, i8* %9, i64 %180
  %182 = load i8, i8* %181, align 1
  %183 = getelementptr inbounds i8, i8* %scevgep, i64 1
  store i8 %182, i8* %183, align 1
  %184 = add nsw i32 %174, %156
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i8, i8* %9, i64 %185
  %187 = load i8, i8* %186, align 1
  %188 = getelementptr inbounds i8, i8* %scevgep, i64 2
  store i8 %187, i8* %188, align 1
  br label %189

; <label>:189:                                    ; preds = %._crit_edge, %141
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @merged_1v_upsample(%struct.jpeg_decompress_struct*, i8***, i32* nocapture, i32, i8**, i32* nocapture, i32) #0 {
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %9 = bitcast %struct.jpeg_upsampler** %8 to %struct.my_upsampler**
  %10 = load %struct.my_upsampler*, %struct.my_upsampler** %9, align 8
  %11 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %10, i64 0, i32 1
  %12 = load void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)** %11, align 8
  %13 = load i32, i32* %2, align 4
  %14 = load i32, i32* %5, align 4
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds i8*, i8** %4, i64 %15
  tail call void %12(%struct.jpeg_decompress_struct* %0, i8*** %1, i32 %13, i8** %16) #3
  %17 = load i32, i32* %5, align 4
  %18 = add i32 %17, 1
  store i32 %18, i32* %5, align 4
  %19 = load i32, i32* %2, align 4
  %20 = add i32 %19, 1
  store i32 %20, i32* %2, align 4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @h2v1_merged_upsample(%struct.jpeg_decompress_struct* nocapture readonly, i8*** nocapture readonly, i32, i8** nocapture readonly) #1 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %6 = bitcast %struct.jpeg_upsampler** %5 to %struct.my_upsampler**
  %7 = load %struct.my_upsampler*, %struct.my_upsampler** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %9 = load i8*, i8** %8, align 8
  %10 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %7, i64 0, i32 2
  %11 = load i32*, i32** %10, align 8
  %12 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %7, i64 0, i32 3
  %13 = load i32*, i32** %12, align 8
  %14 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %7, i64 0, i32 4
  %15 = load i64*, i64** %14, align 8
  %16 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %7, i64 0, i32 5
  %17 = load i64*, i64** %16, align 8
  %18 = load i8**, i8*** %1, align 8
  %19 = zext i32 %2 to i64
  %20 = getelementptr inbounds i8*, i8** %18, i64 %19
  %21 = load i8*, i8** %20, align 8
  %22 = getelementptr inbounds i8**, i8*** %1, i64 1
  %23 = load i8**, i8*** %22, align 8
  %24 = getelementptr inbounds i8*, i8** %23, i64 %19
  %25 = load i8*, i8** %24, align 8
  %26 = getelementptr inbounds i8**, i8*** %1, i64 2
  %27 = load i8**, i8*** %26, align 8
  %28 = getelementptr inbounds i8*, i8** %27, i64 %19
  %29 = load i8*, i8** %28, align 8
  %30 = load i8*, i8** %3, align 8
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %32 = load i32, i32* %31, align 8
  %33 = lshr i32 %32, 1
  %34 = zext i32 %33 to i64
  %35 = mul nuw nsw i64 %34, 6
  %36 = shl nuw i32 %33, 1
  %37 = zext i32 %36 to i64
  %scevgep6 = getelementptr i8, i8* %25, i64 %34
  %38 = icmp eq i32 %33, 0
  br i1 %38, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %4
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.012 = phi i32 [ %92, %.lr.ph ], [ %33, %.lr.ph.preheader ]
  %.0111 = phi i8* [ %41, %.lr.ph ], [ %29, %.lr.ph.preheader ]
  %.0210 = phi i8* [ %39, %.lr.ph ], [ %25, %.lr.ph.preheader ]
  %.039 = phi i8* [ %74, %.lr.ph ], [ %21, %.lr.ph.preheader ]
  %.048 = phi i8* [ %91, %.lr.ph ], [ %30, %.lr.ph.preheader ]
  %39 = getelementptr inbounds i8, i8* %.0210, i64 1
  %40 = load i8, i8* %.0210, align 1
  %41 = getelementptr inbounds i8, i8* %.0111, i64 1
  %42 = load i8, i8* %.0111, align 1
  %43 = zext i8 %42 to i64
  %44 = getelementptr inbounds i32, i32* %11, i64 %43
  %45 = load i32, i32* %44, align 4
  %46 = zext i8 %40 to i64
  %47 = getelementptr inbounds i64, i64* %17, i64 %46
  %48 = load i64, i64* %47, align 8
  %49 = getelementptr inbounds i64, i64* %15, i64 %43
  %50 = load i64, i64* %49, align 8
  %51 = add nsw i64 %50, %48
  %52 = lshr i64 %51, 16
  %53 = trunc i64 %52 to i32
  %54 = getelementptr inbounds i32, i32* %13, i64 %46
  %55 = load i32, i32* %54, align 4
  %56 = getelementptr inbounds i8, i8* %.039, i64 1
  %57 = load i8, i8* %.039, align 1
  %58 = zext i8 %57 to i32
  %59 = add nsw i32 %58, %45
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8* %9, i64 %60
  %62 = load i8, i8* %61, align 1
  store i8 %62, i8* %.048, align 1
  %63 = add nsw i32 %58, %53
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i8, i8* %9, i64 %64
  %66 = load i8, i8* %65, align 1
  %67 = getelementptr inbounds i8, i8* %.048, i64 1
  store i8 %66, i8* %67, align 1
  %68 = add nsw i32 %58, %55
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8* %9, i64 %69
  %71 = load i8, i8* %70, align 1
  %72 = getelementptr inbounds i8, i8* %.048, i64 2
  store i8 %71, i8* %72, align 1
  %73 = getelementptr inbounds i8, i8* %.048, i64 3
  %74 = getelementptr inbounds i8, i8* %.039, i64 2
  %75 = load i8, i8* %56, align 1
  %76 = zext i8 %75 to i32
  %77 = add nsw i32 %76, %45
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8* %9, i64 %78
  %80 = load i8, i8* %79, align 1
  store i8 %80, i8* %73, align 1
  %81 = add nsw i32 %76, %53
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i8, i8* %9, i64 %82
  %84 = load i8, i8* %83, align 1
  %85 = getelementptr inbounds i8, i8* %.048, i64 4
  store i8 %84, i8* %85, align 1
  %86 = add nsw i32 %76, %55
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i8, i8* %9, i64 %87
  %89 = load i8, i8* %88, align 1
  %90 = getelementptr inbounds i8, i8* %.048, i64 5
  store i8 %89, i8* %90, align 1
  %91 = getelementptr inbounds i8, i8* %.048, i64 6
  %92 = add nsw i32 %.012, -1
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  %scevgep = getelementptr i8, i8* %30, i64 %35
  %94 = load i32, i32* %31, align 8
  %95 = and i32 %94, 1
  %96 = icmp eq i32 %95, 0
  br i1 %96, label %129, label %97

; <label>:97:                                     ; preds = %._crit_edge
  %scevgep7 = getelementptr i8, i8* %29, i64 %34
  %scevgep5 = getelementptr i8, i8* %21, i64 %37
  %98 = load i8, i8* %scevgep6, align 1
  %99 = load i8, i8* %scevgep7, align 1
  %100 = zext i8 %99 to i64
  %101 = getelementptr inbounds i32, i32* %11, i64 %100
  %102 = load i32, i32* %101, align 4
  %103 = zext i8 %98 to i64
  %104 = getelementptr inbounds i64, i64* %17, i64 %103
  %105 = load i64, i64* %104, align 8
  %106 = getelementptr inbounds i64, i64* %15, i64 %100
  %107 = load i64, i64* %106, align 8
  %108 = add nsw i64 %107, %105
  %109 = lshr i64 %108, 16
  %110 = trunc i64 %109 to i32
  %111 = getelementptr inbounds i32, i32* %13, i64 %103
  %112 = load i32, i32* %111, align 4
  %113 = load i8, i8* %scevgep5, align 1
  %114 = zext i8 %113 to i32
  %115 = add nsw i32 %114, %102
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i8, i8* %9, i64 %116
  %118 = load i8, i8* %117, align 1
  store i8 %118, i8* %scevgep, align 1
  %119 = add nsw i32 %114, %110
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i8, i8* %9, i64 %120
  %122 = load i8, i8* %121, align 1
  %123 = getelementptr inbounds i8, i8* %scevgep, i64 1
  store i8 %122, i8* %123, align 1
  %124 = add nsw i32 %114, %112
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i8, i8* %9, i64 %125
  %127 = load i8, i8* %126, align 1
  %128 = getelementptr inbounds i8, i8* %scevgep, i64 2
  store i8 %127, i8* %128, align 1
  br label %129

; <label>:129:                                    ; preds = %._crit_edge, %97
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @build_ycc_rgb_table(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %3 = bitcast %struct.jpeg_upsampler** %2 to %struct.my_upsampler**
  %4 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %6 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %6, i64 0, i32 0
  %8 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %7, align 8
  %9 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %10 = tail call i8* %8(%struct.jpeg_common_struct* %9, i32 1, i64 1024) #3
  %11 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %4, i64 0, i32 2
  %12 = bitcast i32** %11 to i8**
  store i8* %10, i8** %12, align 8
  %13 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %14 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %13, i64 0, i32 0
  %15 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %14, align 8
  %16 = tail call i8* %15(%struct.jpeg_common_struct* %9, i32 1, i64 1024) #3
  %17 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %4, i64 0, i32 3
  %18 = bitcast i32** %17 to i8**
  store i8* %16, i8** %18, align 8
  %19 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %20 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %19, i64 0, i32 0
  %21 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %20, align 8
  %22 = tail call i8* %21(%struct.jpeg_common_struct* %9, i32 1, i64 2048) #3
  %23 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %4, i64 0, i32 4
  %24 = bitcast i64** %23 to i8**
  store i8* %22, i8** %24, align 8
  %25 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %26 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %25, i64 0, i32 0
  %27 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %26, align 8
  %28 = tail call i8* %27(%struct.jpeg_common_struct* %9, i32 1, i64 2048) #3
  %29 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %4, i64 0, i32 5
  %30 = bitcast i64** %29 to i8**
  store i8* %28, i8** %30, align 8
  br label %31

; <label>:31:                                     ; preds = %1, %31
  %.03 = phi i64 [ -128, %1 ], [ %51, %31 ]
  %indvars.iv2 = phi i64 [ 0, %1 ], [ %indvars.iv.next, %31 ]
  %32 = mul nsw i64 %.03, 91881
  %33 = add nsw i64 %32, 32768
  %34 = lshr i64 %33, 16
  %35 = trunc i64 %34 to i32
  %36 = load i32*, i32** %11, align 8
  %37 = getelementptr inbounds i32, i32* %36, i64 %indvars.iv2
  store i32 %35, i32* %37, align 4
  %38 = mul nsw i64 %.03, 116130
  %39 = add nsw i64 %38, 32768
  %40 = lshr i64 %39, 16
  %41 = trunc i64 %40 to i32
  %42 = load i32*, i32** %17, align 8
  %43 = getelementptr inbounds i32, i32* %42, i64 %indvars.iv2
  store i32 %41, i32* %43, align 4
  %44 = mul nsw i64 %.03, -46802
  %45 = load i64*, i64** %23, align 8
  %46 = getelementptr inbounds i64, i64* %45, i64 %indvars.iv2
  store i64 %44, i64* %46, align 8
  %47 = mul nsw i64 %.03, -22554
  %48 = add nsw i64 %47, 32768
  %49 = load i64*, i64** %29, align 8
  %50 = getelementptr inbounds i64, i64* %49, i64 %indvars.iv2
  store i64 %48, i64* %50, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %51 = add nsw i64 %.03, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 256
  br i1 %exitcond, label %52, label %31

; <label>:52:                                     ; preds = %31
  ret void
}

declare void @jcopy_sample_rows(i8**, i32, i8**, i32, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

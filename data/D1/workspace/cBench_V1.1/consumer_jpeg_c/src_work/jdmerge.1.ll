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
define void @jinit_merged_upsampler(%struct.jpeg_decompress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
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
  br i1 %22, label %23, label %33

; <label>:23:                                     ; preds = %1
  %24 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr = ptrtoint i8* %7 to i64
  %sunkaddr3 = add i64 %sunkaddr, 8
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @merged_2v_upsample, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %sunkaddr4, align 8
  %25 = getelementptr inbounds i8, i8* %7, i64 24
  %26 = bitcast i8* %25 to void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)* @h2v2_merged_upsample, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)** %26, align 8
  %sunkaddr5 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr6 = add i64 %sunkaddr5, 8
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to %struct.jpeg_memory_mgr**
  %27 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr7, align 8
  %28 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %27, i64 0, i32 1
  %29 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %28, align 8
  %sunkaddr8 = ptrtoint i8* %7 to i64
  %sunkaddr9 = add i64 %sunkaddr8, 76
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to i32*
  %30 = load i32, i32* %sunkaddr10, align 4
  %31 = zext i32 %30 to i64
  %32 = tail call i8* %29(%struct.jpeg_common_struct* %24, i32 1, i64 %31) #3
  br label %36

; <label>:33:                                     ; preds = %1
  %sunkaddr11 = ptrtoint i8* %7 to i64
  %sunkaddr12 = add i64 %sunkaddr11, 8
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @merged_1v_upsample, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %sunkaddr13, align 8
  %34 = getelementptr inbounds i8, i8* %7, i64 24
  %35 = bitcast i8* %34 to void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)* @h2v1_merged_upsample, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)** %35, align 8
  br label %36

; <label>:36:                                     ; preds = %33, %23
  %.sink = phi i8* [ null, %33 ], [ %32, %23 ]
  %37 = getelementptr inbounds i8, i8* %7, i64 64
  %38 = bitcast i8* %37 to i8**
  store i8* %.sink, i8** %38, align 8
  tail call fastcc void @build_ycc_rgb_table(%struct.jpeg_decompress_struct* nonnull %0)
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
  %sunkaddr = ptrtoint %struct.my_upsampler* %11 to i64
  %sunkaddr1 = add i64 %sunkaddr, 72
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  store i32 0, i32* %sunkaddr2, align 8
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
  %sunkaddr3 = ptrtoint %struct.my_upsampler* %11 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 72
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  store i32 1, i32* %sunkaddr5, align 8
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
  %sunkaddr6 = ptrtoint %struct.my_upsampler* %11 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 72
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  %61 = load i32, i32* %sunkaddr8, align 8
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
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %4
  %43 = add nsw i32 %41, -1
  %44 = zext i32 %43 to i64
  %45 = mul nuw nsw i64 %44, 6
  %46 = shl nuw nsw i64 %44, 1
  %47 = add nuw nsw i64 %46, 2
  %48 = add nuw nsw i64 %44, 1
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %.013 = phi i32 [ %121, %.lr.ph ], [ %41, %.lr.ph.preheader ]
  %.0112 = phi i8* [ %119, %.lr.ph ], [ %35, %.lr.ph.preheader ]
  %.0211 = phi i8* [ %120, %.lr.ph ], [ %31, %.lr.ph.preheader ]
  %.0310 = phi i8* [ %116, %.lr.ph ], [ %26, %.lr.ph.preheader ]
  %.049 = phi i8* [ %118, %.lr.ph ], [ %22, %.lr.ph.preheader ]
  %.058 = phi i8* [ %117, %.lr.ph ], [ %36, %.lr.ph.preheader ]
  %.067 = phi i8* [ %115, %.lr.ph ], [ %38, %.lr.ph.preheader ]
  %49 = load i8, i8* %.0211, align 1
  %50 = load i8, i8* %.0112, align 1
  %51 = zext i8 %50 to i64
  %52 = getelementptr inbounds i32, i32* %11, i64 %51
  %53 = load i32, i32* %52, align 4
  %54 = zext i8 %49 to i64
  %55 = getelementptr inbounds i64, i64* %17, i64 %54
  %56 = load i64, i64* %55, align 8
  %57 = getelementptr inbounds i64, i64* %15, i64 %51
  %58 = load i64, i64* %57, align 8
  %59 = add nsw i64 %58, %56
  %60 = lshr i64 %59, 16
  %61 = getelementptr inbounds i32, i32* %13, i64 %54
  %62 = load i32, i32* %61, align 4
  %63 = getelementptr inbounds i8, i8* %.049, i64 1
  %64 = load i8, i8* %.049, align 1
  %promoted33 = zext i8 %64 to i64
  %promoted31 = zext i8 %64 to i64
  %promoted29 = zext i8 %64 to i64
  %promoted = sext i32 %53 to i64
  %65 = add nsw i64 %promoted29, %promoted
  %66 = getelementptr inbounds i8, i8* %9, i64 %65
  %67 = load i8, i8* %66, align 1
  store i8 %67, i8* %.058, align 1
  %sext = shl i64 %60, 32
  %promoted30 = ashr exact i64 %sext, 32
  %68 = add nsw i64 %promoted31, %promoted30
  %69 = getelementptr inbounds i8, i8* %9, i64 %68
  %70 = load i8, i8* %69, align 1
  %71 = getelementptr inbounds i8, i8* %.058, i64 1
  store i8 %70, i8* %71, align 1
  %promoted32 = sext i32 %62 to i64
  %72 = add nsw i64 %promoted33, %promoted32
  %73 = getelementptr inbounds i8, i8* %9, i64 %72
  %74 = load i8, i8* %73, align 1
  %75 = getelementptr inbounds i8, i8* %.058, i64 2
  store i8 %74, i8* %75, align 1
  %76 = getelementptr inbounds i8, i8* %.058, i64 3
  %77 = load i8, i8* %63, align 1
  %promoted39 = zext i8 %77 to i64
  %promoted37 = zext i8 %77 to i64
  %promoted35 = zext i8 %77 to i64
  %promoted34 = sext i32 %53 to i64
  %78 = add nsw i64 %promoted35, %promoted34
  %79 = getelementptr inbounds i8, i8* %9, i64 %78
  %80 = load i8, i8* %79, align 1
  store i8 %80, i8* %76, align 1
  %sext66 = shl i64 %60, 32
  %promoted36 = ashr exact i64 %sext66, 32
  %81 = add nsw i64 %promoted37, %promoted36
  %82 = getelementptr inbounds i8, i8* %9, i64 %81
  %83 = load i8, i8* %82, align 1
  %84 = getelementptr inbounds i8, i8* %.058, i64 4
  store i8 %83, i8* %84, align 1
  %promoted38 = sext i32 %62 to i64
  %85 = add nsw i64 %promoted39, %promoted38
  %86 = getelementptr inbounds i8, i8* %9, i64 %85
  %87 = load i8, i8* %86, align 1
  %88 = getelementptr inbounds i8, i8* %.058, i64 5
  store i8 %87, i8* %88, align 1
  %89 = getelementptr inbounds i8, i8* %.0310, i64 1
  %90 = load i8, i8* %.0310, align 1
  %promoted45 = zext i8 %90 to i64
  %promoted43 = zext i8 %90 to i64
  %promoted41 = zext i8 %90 to i64
  %promoted40 = sext i32 %53 to i64
  %91 = add nsw i64 %promoted41, %promoted40
  %92 = getelementptr inbounds i8, i8* %9, i64 %91
  %93 = load i8, i8* %92, align 1
  store i8 %93, i8* %.067, align 1
  %sext67 = shl i64 %60, 32
  %promoted42 = ashr exact i64 %sext67, 32
  %94 = add nsw i64 %promoted43, %promoted42
  %95 = getelementptr inbounds i8, i8* %9, i64 %94
  %96 = load i8, i8* %95, align 1
  %97 = getelementptr inbounds i8, i8* %.067, i64 1
  store i8 %96, i8* %97, align 1
  %promoted44 = sext i32 %62 to i64
  %98 = add nsw i64 %promoted45, %promoted44
  %99 = getelementptr inbounds i8, i8* %9, i64 %98
  %100 = load i8, i8* %99, align 1
  %101 = getelementptr inbounds i8, i8* %.067, i64 2
  store i8 %100, i8* %101, align 1
  %102 = getelementptr inbounds i8, i8* %.067, i64 3
  %103 = load i8, i8* %89, align 1
  %promoted51 = zext i8 %103 to i64
  %promoted49 = zext i8 %103 to i64
  %promoted47 = zext i8 %103 to i64
  %promoted46 = sext i32 %53 to i64
  %104 = add nsw i64 %promoted47, %promoted46
  %105 = getelementptr inbounds i8, i8* %9, i64 %104
  %106 = load i8, i8* %105, align 1
  store i8 %106, i8* %102, align 1
  %sext68 = shl i64 %60, 32
  %promoted48 = ashr exact i64 %sext68, 32
  %107 = add nsw i64 %promoted49, %promoted48
  %108 = getelementptr inbounds i8, i8* %9, i64 %107
  %109 = load i8, i8* %108, align 1
  %110 = getelementptr inbounds i8, i8* %.067, i64 4
  store i8 %109, i8* %110, align 1
  %promoted50 = sext i32 %62 to i64
  %111 = add nsw i64 %promoted51, %promoted50
  %112 = getelementptr inbounds i8, i8* %9, i64 %111
  %113 = load i8, i8* %112, align 1
  %114 = getelementptr inbounds i8, i8* %.067, i64 5
  store i8 %113, i8* %114, align 1
  %115 = getelementptr inbounds i8, i8* %.067, i64 6
  %116 = getelementptr inbounds i8, i8* %.0310, i64 2
  %117 = getelementptr inbounds i8, i8* %.058, i64 6
  %118 = getelementptr inbounds i8, i8* %.049, i64 2
  %119 = getelementptr inbounds i8, i8* %.0112, i64 1
  %120 = getelementptr inbounds i8, i8* %.0211, i64 1
  %121 = add nsw i32 %.013, -1
  %122 = icmp eq i32 %121, 0
  br i1 %122, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %123 = add nuw nsw i64 %45, 6
  %scevgep25 = getelementptr i8, i8* %36, i64 %123
  %scevgep27 = getelementptr i8, i8* %35, i64 %48
  %scevgep = getelementptr i8, i8* %38, i64 %123
  %scevgep24 = getelementptr i8, i8* %26, i64 %47
  %scevgep26 = getelementptr i8, i8* %22, i64 %47
  %scevgep28 = getelementptr i8, i8* %31, i64 %48
  br label %._crit_edge

._crit_edge:                                      ; preds = %4, %._crit_edge.loopexit
  %.06.lcssa = phi i8* [ %scevgep, %._crit_edge.loopexit ], [ %38, %4 ]
  %.05.lcssa = phi i8* [ %scevgep25, %._crit_edge.loopexit ], [ %36, %4 ]
  %.04.lcssa = phi i8* [ %scevgep26, %._crit_edge.loopexit ], [ %22, %4 ]
  %.03.lcssa = phi i8* [ %scevgep24, %._crit_edge.loopexit ], [ %26, %4 ]
  %.02.lcssa = phi i8* [ %scevgep28, %._crit_edge.loopexit ], [ %31, %4 ]
  %.01.lcssa = phi i8* [ %scevgep27, %._crit_edge.loopexit ], [ %35, %4 ]
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr52 = add i64 %sunkaddr, 128
  %sunkaddr53 = inttoptr i64 %sunkaddr52 to i32*
  %124 = load i32, i32* %sunkaddr53, align 8
  %125 = and i32 %124, 1
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %166, label %127

; <label>:127:                                    ; preds = %._crit_edge
  %128 = load i8, i8* %.02.lcssa, align 1
  %129 = load i8, i8* %.01.lcssa, align 1
  %130 = zext i8 %129 to i64
  %131 = getelementptr inbounds i32, i32* %11, i64 %130
  %132 = load i32, i32* %131, align 4
  %133 = zext i8 %128 to i64
  %134 = getelementptr inbounds i64, i64* %17, i64 %133
  %135 = load i64, i64* %134, align 8
  %136 = getelementptr inbounds i64, i64* %15, i64 %130
  %137 = load i64, i64* %136, align 8
  %138 = add nsw i64 %137, %135
  %139 = lshr i64 %138, 16
  %140 = getelementptr inbounds i32, i32* %13, i64 %133
  %141 = load i32, i32* %140, align 4
  %142 = load i8, i8* %.04.lcssa, align 1
  %promoted59 = zext i8 %142 to i64
  %promoted57 = zext i8 %142 to i64
  %promoted55 = zext i8 %142 to i64
  %promoted54 = sext i32 %132 to i64
  %143 = add nsw i64 %promoted55, %promoted54
  %144 = getelementptr inbounds i8, i8* %9, i64 %143
  %145 = load i8, i8* %144, align 1
  store i8 %145, i8* %.05.lcssa, align 1
  %sext69 = shl i64 %139, 32
  %promoted56 = ashr exact i64 %sext69, 32
  %146 = add nsw i64 %promoted57, %promoted56
  %147 = getelementptr inbounds i8, i8* %9, i64 %146
  %148 = load i8, i8* %147, align 1
  %149 = getelementptr inbounds i8, i8* %.05.lcssa, i64 1
  store i8 %148, i8* %149, align 1
  %promoted58 = sext i32 %141 to i64
  %150 = add nsw i64 %promoted59, %promoted58
  %151 = getelementptr inbounds i8, i8* %9, i64 %150
  %152 = load i8, i8* %151, align 1
  %153 = getelementptr inbounds i8, i8* %.05.lcssa, i64 2
  store i8 %152, i8* %153, align 1
  %154 = load i8, i8* %.03.lcssa, align 1
  %promoted65 = zext i8 %154 to i64
  %promoted63 = zext i8 %154 to i64
  %promoted61 = zext i8 %154 to i64
  %promoted60 = sext i32 %132 to i64
  %155 = add nsw i64 %promoted61, %promoted60
  %156 = getelementptr inbounds i8, i8* %9, i64 %155
  %157 = load i8, i8* %156, align 1
  store i8 %157, i8* %.06.lcssa, align 1
  %sext70 = shl i64 %139, 32
  %promoted62 = ashr exact i64 %sext70, 32
  %158 = add nsw i64 %promoted63, %promoted62
  %159 = getelementptr inbounds i8, i8* %9, i64 %158
  %160 = load i8, i8* %159, align 1
  %161 = getelementptr inbounds i8, i8* %.06.lcssa, i64 1
  store i8 %160, i8* %161, align 1
  %promoted64 = sext i32 %141 to i64
  %162 = add nsw i64 %promoted65, %promoted64
  %163 = getelementptr inbounds i8, i8* %9, i64 %162
  %164 = load i8, i8* %163, align 1
  %165 = getelementptr inbounds i8, i8* %.06.lcssa, i64 2
  store i8 %164, i8* %165, align 1
  br label %166

; <label>:166:                                    ; preds = %._crit_edge, %127
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
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %4
  %35 = add nsw i32 %33, -1
  %36 = zext i32 %35 to i64
  %37 = mul nuw nsw i64 %36, 6
  %38 = shl nuw nsw i64 %36, 1
  %39 = add nuw nsw i64 %36, 1
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %.09 = phi i32 [ %84, %.lr.ph ], [ %33, %.lr.ph.preheader ]
  %.018 = phi i8* [ %82, %.lr.ph ], [ %29, %.lr.ph.preheader ]
  %.027 = phi i8* [ %83, %.lr.ph ], [ %25, %.lr.ph.preheader ]
  %.036 = phi i8* [ %81, %.lr.ph ], [ %21, %.lr.ph.preheader ]
  %.045 = phi i8* [ %80, %.lr.ph ], [ %30, %.lr.ph.preheader ]
  %40 = load i8, i8* %.027, align 1
  %41 = load i8, i8* %.018, align 1
  %42 = zext i8 %41 to i64
  %43 = getelementptr inbounds i32, i32* %11, i64 %42
  %44 = load i32, i32* %43, align 4
  %45 = zext i8 %40 to i64
  %46 = getelementptr inbounds i64, i64* %17, i64 %45
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds i64, i64* %15, i64 %42
  %49 = load i64, i64* %48, align 8
  %50 = add nsw i64 %49, %47
  %51 = lshr i64 %50, 16
  %52 = getelementptr inbounds i32, i32* %13, i64 %45
  %53 = load i32, i32* %52, align 4
  %54 = getelementptr inbounds i8, i8* %.036, i64 1
  %55 = load i8, i8* %.036, align 1
  %promoted23 = zext i8 %55 to i64
  %promoted21 = zext i8 %55 to i64
  %promoted19 = zext i8 %55 to i64
  %promoted = sext i32 %44 to i64
  %56 = add nsw i64 %promoted19, %promoted
  %57 = getelementptr inbounds i8, i8* %9, i64 %56
  %58 = load i8, i8* %57, align 1
  store i8 %58, i8* %.045, align 1
  %sext = shl i64 %51, 32
  %promoted20 = ashr exact i64 %sext, 32
  %59 = add nsw i64 %promoted21, %promoted20
  %60 = getelementptr inbounds i8, i8* %9, i64 %59
  %61 = load i8, i8* %60, align 1
  %62 = getelementptr inbounds i8, i8* %.045, i64 1
  store i8 %61, i8* %62, align 1
  %promoted22 = sext i32 %53 to i64
  %63 = add nsw i64 %promoted23, %promoted22
  %64 = getelementptr inbounds i8, i8* %9, i64 %63
  %65 = load i8, i8* %64, align 1
  %66 = getelementptr inbounds i8, i8* %.045, i64 2
  store i8 %65, i8* %66, align 1
  %67 = getelementptr inbounds i8, i8* %.045, i64 3
  %68 = load i8, i8* %54, align 1
  %promoted29 = zext i8 %68 to i64
  %promoted27 = zext i8 %68 to i64
  %promoted25 = zext i8 %68 to i64
  %promoted24 = sext i32 %44 to i64
  %69 = add nsw i64 %promoted25, %promoted24
  %70 = getelementptr inbounds i8, i8* %9, i64 %69
  %71 = load i8, i8* %70, align 1
  store i8 %71, i8* %67, align 1
  %sext38 = shl i64 %51, 32
  %promoted26 = ashr exact i64 %sext38, 32
  %72 = add nsw i64 %promoted27, %promoted26
  %73 = getelementptr inbounds i8, i8* %9, i64 %72
  %74 = load i8, i8* %73, align 1
  %75 = getelementptr inbounds i8, i8* %.045, i64 4
  store i8 %74, i8* %75, align 1
  %promoted28 = sext i32 %53 to i64
  %76 = add nsw i64 %promoted29, %promoted28
  %77 = getelementptr inbounds i8, i8* %9, i64 %76
  %78 = load i8, i8* %77, align 1
  %79 = getelementptr inbounds i8, i8* %.045, i64 5
  store i8 %78, i8* %79, align 1
  %80 = getelementptr inbounds i8, i8* %.045, i64 6
  %81 = getelementptr inbounds i8, i8* %.036, i64 2
  %82 = getelementptr inbounds i8, i8* %.018, i64 1
  %83 = getelementptr inbounds i8, i8* %.027, i64 1
  %84 = add nsw i32 %.09, -1
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %86 = add nuw nsw i64 %37, 6
  %87 = add nuw nsw i64 %38, 2
  %scevgep17 = getelementptr i8, i8* %29, i64 %39
  %scevgep = getelementptr i8, i8* %30, i64 %86
  %scevgep16 = getelementptr i8, i8* %21, i64 %87
  %scevgep18 = getelementptr i8, i8* %25, i64 %39
  br label %._crit_edge

._crit_edge:                                      ; preds = %4, %._crit_edge.loopexit
  %.04.lcssa = phi i8* [ %scevgep, %._crit_edge.loopexit ], [ %30, %4 ]
  %.03.lcssa = phi i8* [ %scevgep16, %._crit_edge.loopexit ], [ %21, %4 ]
  %.02.lcssa = phi i8* [ %scevgep18, %._crit_edge.loopexit ], [ %25, %4 ]
  %.01.lcssa = phi i8* [ %scevgep17, %._crit_edge.loopexit ], [ %29, %4 ]
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr30 = add i64 %sunkaddr, 128
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to i32*
  %88 = load i32, i32* %sunkaddr31, align 8
  %89 = and i32 %88, 1
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %118, label %91

; <label>:91:                                     ; preds = %._crit_edge
  %92 = load i8, i8* %.02.lcssa, align 1
  %93 = load i8, i8* %.01.lcssa, align 1
  %94 = zext i8 %93 to i64
  %95 = getelementptr inbounds i32, i32* %11, i64 %94
  %96 = load i32, i32* %95, align 4
  %97 = zext i8 %92 to i64
  %98 = getelementptr inbounds i64, i64* %17, i64 %97
  %99 = load i64, i64* %98, align 8
  %100 = getelementptr inbounds i64, i64* %15, i64 %94
  %101 = load i64, i64* %100, align 8
  %102 = add nsw i64 %101, %99
  %103 = getelementptr inbounds i32, i32* %13, i64 %97
  %104 = load i32, i32* %103, align 4
  %105 = load i8, i8* %.03.lcssa, align 1
  %promoted37 = zext i8 %105 to i64
  %promoted35 = zext i8 %105 to i64
  %promoted33 = zext i8 %105 to i64
  %promoted32 = sext i32 %96 to i64
  %106 = add nsw i64 %promoted33, %promoted32
  %107 = getelementptr inbounds i8, i8* %9, i64 %106
  %108 = load i8, i8* %107, align 1
  store i8 %108, i8* %.04.lcssa, align 1
  %109 = shl i64 %102, 16
  %promoted34 = ashr i64 %109, 32
  %110 = add nsw i64 %promoted35, %promoted34
  %111 = getelementptr inbounds i8, i8* %9, i64 %110
  %112 = load i8, i8* %111, align 1
  %113 = getelementptr inbounds i8, i8* %.04.lcssa, i64 1
  store i8 %112, i8* %113, align 1
  %promoted36 = sext i32 %104 to i64
  %114 = add nsw i64 %promoted37, %promoted36
  %115 = getelementptr inbounds i8, i8* %9, i64 %114
  %116 = load i8, i8* %115, align 1
  %117 = getelementptr inbounds i8, i8* %.04.lcssa, i64 2
  store i8 %116, i8* %117, align 1
  br label %118

; <label>:118:                                    ; preds = %._crit_edge, %91
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @build_ycc_rgb_table(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %3 = bitcast %struct.jpeg_upsampler** %2 to %struct.my_upsampler**
  %4 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %6 = bitcast %struct.jpeg_memory_mgr** %5 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %7 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %6, align 8
  %8 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %7, align 8
  %9 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %10 = tail call i8* %8(%struct.jpeg_common_struct* %9, i32 1, i64 1024) #3
  %11 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %4, i64 0, i32 2
  %12 = bitcast i32** %11 to i8**
  store i8* %10, i8** %12, align 8
  %13 = bitcast %struct.jpeg_memory_mgr** %5 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %14 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %13, align 8
  %15 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %14, align 8
  %16 = tail call i8* %15(%struct.jpeg_common_struct* %9, i32 1, i64 1024) #3
  %17 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %4, i64 0, i32 3
  %18 = bitcast i32** %17 to i8**
  store i8* %16, i8** %18, align 8
  %19 = bitcast %struct.jpeg_memory_mgr** %5 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %20 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %19, align 8
  %21 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %20, align 8
  %22 = tail call i8* %21(%struct.jpeg_common_struct* %9, i32 1, i64 2048) #3
  %23 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %4, i64 0, i32 4
  %24 = bitcast i64** %23 to i8**
  store i8* %22, i8** %24, align 8
  %25 = bitcast %struct.jpeg_memory_mgr** %5 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %26 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %25, align 8
  %27 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %26, align 8
  %28 = tail call i8* %27(%struct.jpeg_common_struct* %9, i32 1, i64 2048) #3
  %29 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %4, i64 0, i32 5
  %30 = bitcast i64** %29 to i8**
  store i8* %28, i8** %30, align 8
  %sunkaddr15 = ptrtoint %struct.my_upsampler* %4 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 32
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32**
  %sunkaddr = ptrtoint %struct.my_upsampler* %4 to i64
  %sunkaddr18 = add i64 %sunkaddr, 40
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to i32**
  %sunkaddr20 = ptrtoint %struct.my_upsampler* %4 to i64
  %sunkaddr21 = add i64 %sunkaddr20, 48
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i64**
  %sunkaddr23 = ptrtoint %struct.my_upsampler* %4 to i64
  %sunkaddr24 = add i64 %sunkaddr23, 56
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to i64**
  br label %31

; <label>:31:                                     ; preds = %31, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %31 ]
  %.03 = phi i64 [ -128, %1 ], [ %51, %31 ]
  %32 = mul nsw i64 %.03, 91881
  %33 = add nsw i64 %32, 32768
  %34 = lshr i64 %33, 16
  %35 = trunc i64 %34 to i32
  %36 = load i32*, i32** %sunkaddr17, align 8
  %37 = getelementptr inbounds i32, i32* %36, i64 %indvars.iv
  store i32 %35, i32* %37, align 4
  %38 = mul nsw i64 %.03, 116130
  %39 = add nsw i64 %38, 32768
  %40 = lshr i64 %39, 16
  %41 = trunc i64 %40 to i32
  %42 = load i32*, i32** %sunkaddr19, align 8
  %43 = getelementptr inbounds i32, i32* %42, i64 %indvars.iv
  store i32 %41, i32* %43, align 4
  %44 = mul nsw i64 %.03, -46802
  %45 = load i64*, i64** %sunkaddr22, align 8
  %46 = getelementptr inbounds i64, i64* %45, i64 %indvars.iv
  store i64 %44, i64* %46, align 8
  %47 = mul nsw i64 %.03, -22554
  %48 = add nsw i64 %47, 32768
  %49 = load i64*, i64** %sunkaddr25, align 8
  %50 = getelementptr inbounds i64, i64* %49, i64 %indvars.iv
  store i64 %48, i64* %50, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %51 = add nsw i64 %.03, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 256
  br i1 %exitcond, label %52, label %31

; <label>:52:                                     ; preds = %31
  ret void
}

declare void @jcopy_sample_rows(i8**, i32, i8**, i32, i32, i32) local_unnamed_addr #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

; ModuleID = 'jdmarker.ll'
source_filename = "jdmarker.c"
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
%struct.jpeg_source_mgr = type { i8*, i64, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, {}*, void (%struct.jpeg_decompress_struct*)* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.jpeg_decomp_master = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32 }
%struct.jpeg_d_main_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* }
%struct.jpeg_d_coef_controller = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, i8***)*, %struct.jvirt_barray_control** }
%struct.jpeg_d_post_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* }
%struct.jpeg_input_controller = type { i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32, i32 }
%struct.jpeg_marker_reader = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, [16 x i32 (%struct.jpeg_decompress_struct*)*], i32, i32, i32, i32 }
%struct.jpeg_entropy_decoder = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* }
%struct.jpeg_inverse_dct = type { void (%struct.jpeg_decompress_struct*)*, [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*] }
%struct.jpeg_upsampler = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, i32 }
%struct.jpeg_color_deconverter = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* }
%struct.jpeg_color_quantizer = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)* }

@jpeg_natural_order = external local_unnamed_addr constant [0 x i32], align 4

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_resync_to_restart(%struct.jpeg_decompress_struct*, i32) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  %4 = load i32, i32* %3, align 4
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %6 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %6, i64 0, i32 5
  store i32 117, i32* %7, align 8
  %8 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %9 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %8, i64 0, i32 6, i32 0, i64 0
  store i32 %4, i32* %9, align 4
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 6, i32 0, i64 1
  store i32 %1, i32* %11, align 4
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 1
  %14 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %13, align 8
  %15 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %14(%struct.jpeg_common_struct* %15, i32 -1) #4
  %16 = add nsw i32 %1, 1
  %17 = and i32 %16, 7
  %18 = or i32 %17, 208
  %19 = add nsw i32 %1, 2
  %20 = and i32 %19, 7
  %21 = or i32 %20, 208
  %22 = add i32 %1, 7
  %23 = and i32 %22, 7
  %24 = or i32 %23, 208
  %25 = add i32 %1, 6
  %26 = and i32 %25, 7
  %27 = or i32 %26, 208
  br label %.outer

.outer:                                           ; preds = %66, %2
  %.02.ph = phi i32 [ %67, %66 ], [ %4, %2 ]
  %28 = icmp slt i32 %.02.ph, 192
  %29 = icmp eq i32 %.02.ph, %18
  %30 = icmp eq i32 %.02.ph, %21
  %31 = icmp eq i32 %.02.ph, %24
  %32 = icmp eq i32 %.02.ph, %27
  %33 = or i1 %31, %32
  %.. = select i1 %33, i32 2, i32 1
  br i1 %28, label %.outer.split.us, label %.outer.split

.outer.split.us:                                  ; preds = %.outer
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i64 0, i32 5
  store i32 96, i32* %35, align 8
  %36 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %37 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %36, i64 0, i32 6, i32 0, i64 0
  store i32 %.02.ph, i32* %37, align 4
  %38 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %39 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %38, i64 0, i32 6, i32 0, i64 1
  store i32 2, i32* %39, align 4
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i64 0, i32 1
  %42 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %41, align 8
  tail call void %42(%struct.jpeg_common_struct* %15, i32 4) #4
  br label %.us-lcssa5.us

.outer.split:                                     ; preds = %.outer
  %43 = and i32 %.02.ph, -8
  %44 = icmp eq i32 %43, 208
  br i1 %44, label %.outer.split.split.us.preheader, label %.outer.split.split

.outer.split.split.us.preheader:                  ; preds = %.outer.split
  %45 = or i1 %29, %30
  %.3.us6 = select i1 %45, i32 3, i32 %..
  %trunc.us7 = trunc i32 %.3.us6 to i2
  br label %.outer.split.split.us

.outer.split.split.us:                            ; preds = %.outer.split.split.us.preheader, %.outer.split.split.us
  %46 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %47 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %46, i64 0, i32 5
  store i32 96, i32* %47, align 8
  %48 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %49 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %48, i64 0, i32 6, i32 0, i64 0
  store i32 %.02.ph, i32* %49, align 4
  %50 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %51 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %50, i64 0, i32 6, i32 0, i64 1
  store i32 %.3.us6, i32* %51, align 4
  %52 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %53 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %52, i64 0, i32 1
  %54 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %53, align 8
  tail call void %54(%struct.jpeg_common_struct* %15, i32 4) #4
  switch i2 %trunc.us7, label %.outer.split.split.us [
    i2 1, label %.us-lcssa.us
    i2 -2, label %.us-lcssa5.us.loopexit
    i2 -1, label %.loopexit.loopexit
  ]

.outer.split.split:                               ; preds = %.outer.split
  %55 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %56 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %55, i64 0, i32 5
  store i32 96, i32* %56, align 8
  %57 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %58 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %57, i64 0, i32 6, i32 0, i64 0
  store i32 %.02.ph, i32* %58, align 4
  %59 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %60 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %59, i64 0, i32 6, i32 0, i64 1
  store i32 3, i32* %60, align 4
  %61 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %62 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %61, i64 0, i32 1
  %63 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %62, align 8
  tail call void %63(%struct.jpeg_common_struct* %15, i32 4) #4
  br label %.loopexit

.us-lcssa.us:                                     ; preds = %.outer.split.split.us
  store i32 0, i32* %3, align 4
  br label %.loopexit

.us-lcssa5.us.loopexit:                           ; preds = %.outer.split.split.us
  br label %.us-lcssa5.us

.us-lcssa5.us:                                    ; preds = %.us-lcssa5.us.loopexit, %.outer.split.us
  %64 = tail call fastcc i32 @next_marker(%struct.jpeg_decompress_struct* nonnull %0)
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %.loopexit.loopexit23, label %66

; <label>:66:                                     ; preds = %.us-lcssa5.us
  %67 = load i32, i32* %3, align 4
  br label %.outer

.loopexit.loopexit:                               ; preds = %.outer.split.split.us
  br label %.loopexit

.loopexit.loopexit23:                             ; preds = %.us-lcssa5.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit23, %.loopexit.loopexit, %.outer.split.split, %.us-lcssa.us
  %.0 = phi i32 [ 1, %.us-lcssa.us ], [ 1, %.outer.split.split ], [ 1, %.loopexit.loopexit ], [ 0, %.loopexit.loopexit23 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @next_marker(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %3 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 0
  %5 = load i8*, i8** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 1
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %9 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %12 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  br label %13

; <label>:13:                                     ; preds = %48, %1
  %.03 = phi i8* [ %5, %1 ], [ %46, %48 ]
  %.01 = phi i64 [ %7, %1 ], [ %45, %48 ]
  %14 = icmp eq i64 %.01, 0
  br i1 %14, label %15, label %.preheader9

; <label>:15:                                     ; preds = %13
  %16 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %8, align 8
  %17 = tail call i32 %16(%struct.jpeg_decompress_struct* nonnull %0) #4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %.loopexit.loopexit48, label %19

; <label>:19:                                     ; preds = %15
  %20 = load i8*, i8** %4, align 8
  %21 = load i64, i64* %6, align 8
  br label %.preheader9

.preheader9:                                      ; preds = %13, %19
  %.14.pn.ph = phi i8* [ %.03, %13 ], [ %20, %19 ]
  %.2.in.ph = phi i64 [ %.01, %13 ], [ %21, %19 ]
  %.02.in19 = load i8, i8* %.14.pn.ph, align 1
  %.2520 = getelementptr inbounds i8, i8* %.14.pn.ph, i64 1
  %.221 = add i64 %.2.in.ph, -1
  %22 = icmp eq i8 %.02.in19, -1
  br i1 %22, label %.preheader.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader9
  br label %.lr.ph

.preheader.preheader.loopexit:                    ; preds = %.backedge
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit, %.preheader9
  %.47.ph = phi i8* [ %.2520, %.preheader9 ], [ %.25, %.preheader.preheader.loopexit ]
  %.4.ph = phi i64 [ %.221, %.preheader9 ], [ %.2, %.preheader.preheader.loopexit ]
  br label %.preheader

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.backedge
  %.223 = phi i64 [ %.2, %.backedge ], [ %.221, %.lr.ph.preheader ]
  %.2522 = phi i8* [ %.25, %.backedge ], [ %.2520, %.lr.ph.preheader ]
  %23 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %11, align 8
  %24 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %23, i64 0, i32 8
  %25 = load i32, i32* %24, align 4
  %26 = add i32 %25, 1
  store i32 %26, i32* %24, align 4
  store i8* %.2522, i8** %4, align 8
  store i64 %.223, i64* %6, align 8
  %27 = icmp eq i64 %.223, 0
  br i1 %27, label %29, label %.backedge

.backedge:                                        ; preds = %.lr.ph, %33
  %.14.pn.be = phi i8* [ %34, %33 ], [ %.2522, %.lr.ph ]
  %.2.in.be = phi i64 [ %35, %33 ], [ %.223, %.lr.ph ]
  %.02.in = load i8, i8* %.14.pn.be, align 1
  %.25 = getelementptr inbounds i8, i8* %.14.pn.be, i64 1
  %.2 = add i64 %.2.in.be, -1
  %28 = icmp eq i8 %.02.in, -1
  br i1 %28, label %.preheader.preheader.loopexit, label %.lr.ph

; <label>:29:                                     ; preds = %.lr.ph
  %30 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %12, align 8
  %31 = tail call i32 %30(%struct.jpeg_decompress_struct* nonnull %0) #4
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %.loopexit.loopexit47, label %33

; <label>:33:                                     ; preds = %29
  %34 = load i8*, i8** %4, align 8
  %35 = load i64, i64* %6, align 8
  br label %.backedge

.preheader:                                       ; preds = %.preheader.preheader, %44
  %.47 = phi i8* [ %46, %44 ], [ %.47.ph, %.preheader.preheader ]
  %.4 = phi i64 [ %45, %44 ], [ %.4.ph, %.preheader.preheader ]
  %36 = icmp eq i64 %.4, 0
  br i1 %36, label %37, label %44

; <label>:37:                                     ; preds = %.preheader
  %38 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %9, align 8
  %39 = tail call i32 %38(%struct.jpeg_decompress_struct* %0) #4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %.loopexit.loopexit, label %41

; <label>:41:                                     ; preds = %37
  %42 = load i8*, i8** %4, align 8
  %43 = load i64, i64* %6, align 8
  br label %44

; <label>:44:                                     ; preds = %41, %.preheader
  %.58 = phi i8* [ %42, %41 ], [ %.47, %.preheader ]
  %.5 = phi i64 [ %43, %41 ], [ %.4, %.preheader ]
  %45 = add i64 %.5, -1
  %46 = getelementptr inbounds i8, i8* %.58, i64 1
  %47 = load i8, i8* %.58, align 1
  switch i8 %47, label %53 [
    i8 -1, label %.preheader
    i8 0, label %48
  ]

; <label>:48:                                     ; preds = %44
  %49 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %10, align 8
  %50 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %49, i64 0, i32 8
  %51 = load i32, i32* %50, align 4
  %52 = add i32 %51, 2
  store i32 %52, i32* %50, align 4
  store i8* %46, i8** %4, align 8
  store i64 %45, i64* %6, align 8
  br label %13

; <label>:53:                                     ; preds = %44
  %54 = zext i8 %47 to i32
  %55 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %56 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %55, align 8
  %57 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %56, i64 0, i32 8
  %58 = load i32, i32* %57, align 4
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %77, label %60

; <label>:60:                                     ; preds = %53
  %61 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %62 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %61, align 8
  %63 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %62, i64 0, i32 5
  store i32 112, i32* %63, align 8
  %64 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %55, align 8
  %65 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %64, i64 0, i32 8
  %66 = load i32, i32* %65, align 4
  %67 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %61, align 8
  %68 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %67, i64 0, i32 6, i32 0, i64 0
  store i32 %66, i32* %68, align 4
  %69 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %61, align 8
  %70 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %69, i64 0, i32 6, i32 0, i64 1
  store i32 %54, i32* %70, align 4
  %71 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %61, align 8
  %72 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %71, i64 0, i32 1
  %73 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %72, align 8
  %74 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %73(%struct.jpeg_common_struct* %74, i32 -1) #4
  %75 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %55, align 8
  %76 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %75, i64 0, i32 8
  store i32 0, i32* %76, align 4
  br label %77

; <label>:77:                                     ; preds = %53, %60
  %78 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  store i32 %54, i32* %78, align 4
  store i8* %46, i8** %4, align 8
  store i64 %45, i64* %6, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %37
  br label %.loopexit

.loopexit.loopexit47:                             ; preds = %29
  br label %.loopexit

.loopexit.loopexit48:                             ; preds = %15
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit48, %.loopexit.loopexit47, %.loopexit.loopexit, %77
  %.0 = phi i32 [ 1, %77 ], [ 0, %.loopexit.loopexit ], [ 0, %.loopexit.loopexit47 ], [ 0, %.loopexit.loopexit48 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define void @jinit_marker_reader(%struct.jpeg_decompress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %3, i64 0, i32 0
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 0, i64 176) #4
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %9 = bitcast %struct.jpeg_marker_reader** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @reset_marker_reader, void (%struct.jpeg_decompress_struct*)** %10, align 8
  %11 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %12 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %11, i64 0, i32 1
  store i32 (%struct.jpeg_decompress_struct*)* @read_markers, i32 (%struct.jpeg_decompress_struct*)** %12, align 8
  %13 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %14 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %13, i64 0, i32 2
  store i32 (%struct.jpeg_decompress_struct*)* @read_restart_marker, i32 (%struct.jpeg_decompress_struct*)** %14, align 8
  %15 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %16 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %15, i64 0, i32 3
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %16, align 8
  %17 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %18 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %17, i64 0, i32 4, i64 0
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %18, align 8
  %19 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %20 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %19, i64 0, i32 4, i64 1
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %20, align 8
  %21 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %22 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %21, i64 0, i32 4, i64 2
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %22, align 8
  %23 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %24 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %23, i64 0, i32 4, i64 3
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %24, align 8
  %25 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %26 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %25, i64 0, i32 4, i64 4
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %26, align 8
  %27 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %28 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %27, i64 0, i32 4, i64 5
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %28, align 8
  %29 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %30 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %29, i64 0, i32 4, i64 6
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %30, align 8
  %31 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %32 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %31, i64 0, i32 4, i64 7
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %32, align 8
  %33 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %34 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %33, i64 0, i32 4, i64 8
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %34, align 8
  %35 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %36 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %35, i64 0, i32 4, i64 9
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %36, align 8
  %37 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %38 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %37, i64 0, i32 4, i64 10
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %38, align 8
  %39 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %40 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %39, i64 0, i32 4, i64 11
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %40, align 8
  %41 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %42 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %41, i64 0, i32 4, i64 12
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %42, align 8
  %43 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %44 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %43, i64 0, i32 4, i64 13
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %44, align 8
  %45 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %46 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %45, i64 0, i32 4, i64 14
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %46, align 8
  %47 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %48 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %47, i64 0, i32 4, i64 15
  store i32 (%struct.jpeg_decompress_struct*)* @skip_variable, i32 (%struct.jpeg_decompress_struct*)** %48, align 8
  %49 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %50 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %49, i64 0, i32 4, i64 0
  store i32 (%struct.jpeg_decompress_struct*)* @get_app0, i32 (%struct.jpeg_decompress_struct*)** %50, align 8
  %51 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %52 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %51, i64 0, i32 4, i64 14
  store i32 (%struct.jpeg_decompress_struct*)* @get_app14, i32 (%struct.jpeg_decompress_struct*)** %52, align 8
  tail call void @reset_marker_reader(%struct.jpeg_decompress_struct* nonnull %0)
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @reset_marker_reader(%struct.jpeg_decompress_struct* nocapture) #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  store %struct.jpeg_component_info* null, %struct.jpeg_component_info** %2, align 8
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 34
  store i32 0, i32* %3, align 4
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %6 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %6, i64 0, i32 5
  store i32 0, i32* %7, align 8
  %8 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %5, align 8
  %9 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %8, i64 0, i32 6
  store i32 0, i32* %9, align 4
  %10 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %5, align 8
  %11 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %10, i64 0, i32 8
  store i32 0, i32* %11, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @read_markers(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %5 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %7 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %11 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %.pr3 = load i32, i32* %2, align 4
  br label %12

; <label>:12:                                     ; preds = %110, %1
  %13 = phi i32 [ 0, %110 ], [ %.pr3, %1 ]
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %26

; <label>:15:                                     ; preds = %12
  %16 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %16, i64 0, i32 5
  %18 = load i32, i32* %17, align 8
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %23

; <label>:20:                                     ; preds = %15
  %21 = tail call fastcc i32 @first_marker(%struct.jpeg_decompress_struct* nonnull %0)
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %.loopexit.loopexit, label %thread-pre-split

; <label>:23:                                     ; preds = %15
  %24 = tail call fastcc i32 @next_marker(%struct.jpeg_decompress_struct* nonnull %0)
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %.loopexit.loopexit, label %thread-pre-split

thread-pre-split:                                 ; preds = %23, %20
  %.pr = load i32, i32* %2, align 4
  br label %26

; <label>:26:                                     ; preds = %thread-pre-split, %12
  %27 = phi i32 [ %.pr, %thread-pre-split ], [ %13, %12 ]
  switch i32 %27, label %101 [
    i32 216, label %28
    i32 192, label %29
    i32 193, label %29
    i32 194, label %32
    i32 201, label %35
    i32 202, label %38
    i32 195, label %41
    i32 197, label %41
    i32 198, label %41
    i32 199, label %41
    i32 200, label %41
    i32 203, label %41
    i32 205, label %41
    i32 206, label %41
    i32 207, label %41
    i32 218, label %50
    i32 217, label %54
    i32 204, label %62
    i32 196, label %65
    i32 219, label %68
    i32 221, label %71
    i32 224, label %74
    i32 225, label %74
    i32 226, label %74
    i32 227, label %74
    i32 228, label %74
    i32 229, label %74
    i32 230, label %74
    i32 231, label %74
    i32 232, label %74
    i32 233, label %74
    i32 234, label %74
    i32 235, label %74
    i32 236, label %74
    i32 237, label %74
    i32 238, label %74
    i32 239, label %74
    i32 254, label %83
    i32 208, label %89
    i32 209, label %89
    i32 210, label %89
    i32 211, label %89
    i32 212, label %89
    i32 213, label %89
    i32 214, label %89
    i32 215, label %89
    i32 1, label %89
    i32 220, label %98
  ]

; <label>:28:                                     ; preds = %26
  tail call fastcc void @get_soi(%struct.jpeg_decompress_struct* nonnull %0)
  br label %110

; <label>:29:                                     ; preds = %26, %26
  %30 = tail call fastcc i32 @get_sof(%struct.jpeg_decompress_struct* nonnull %0, i32 0, i32 0)
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %.loopexit.loopexit, label %110

; <label>:32:                                     ; preds = %26
  %33 = tail call fastcc i32 @get_sof(%struct.jpeg_decompress_struct* nonnull %0, i32 1, i32 0)
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %.loopexit.loopexit, label %110

; <label>:35:                                     ; preds = %26
  %36 = tail call fastcc i32 @get_sof(%struct.jpeg_decompress_struct* nonnull %0, i32 0, i32 1)
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %.loopexit.loopexit, label %110

; <label>:38:                                     ; preds = %26
  %39 = tail call fastcc i32 @get_sof(%struct.jpeg_decompress_struct* nonnull %0, i32 1, i32 1)
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %.loopexit.loopexit, label %110

; <label>:41:                                     ; preds = %26, %26, %26, %26, %26, %26, %26, %26, %26
  %42 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %43 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %42, i64 0, i32 5
  store i32 59, i32* %43, align 8
  %44 = load i32, i32* %2, align 4
  %45 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %46 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %45, i64 0, i32 6, i32 0, i64 0
  store i32 %44, i32* %46, align 4
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i64 0, i32 0
  %49 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %48, align 8
  tail call void %49(%struct.jpeg_common_struct* %7) #4
  br label %110

; <label>:50:                                     ; preds = %26
  %51 = tail call fastcc i32 @get_sos(%struct.jpeg_decompress_struct* nonnull %0)
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %.loopexit, label %53

; <label>:53:                                     ; preds = %50
  store i32 0, i32* %2, align 4
  br label %.loopexit

; <label>:54:                                     ; preds = %26
  %55 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %56 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %55, align 8
  %57 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %56, i64 0, i32 5
  store i32 84, i32* %57, align 8
  %58 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %55, align 8
  %59 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %58, i64 0, i32 1
  %60 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %59, align 8
  %61 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %60(%struct.jpeg_common_struct* %61, i32 1) #4
  store i32 0, i32* %2, align 4
  br label %.loopexit

; <label>:62:                                     ; preds = %26
  %63 = tail call fastcc i32 @get_dac(%struct.jpeg_decompress_struct* nonnull %0)
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %.loopexit.loopexit, label %110

; <label>:65:                                     ; preds = %26
  %66 = tail call fastcc i32 @get_dht(%struct.jpeg_decompress_struct* nonnull %0)
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %.loopexit.loopexit, label %110

; <label>:68:                                     ; preds = %26
  %69 = tail call fastcc i32 @get_dqt(%struct.jpeg_decompress_struct* nonnull %0)
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %.loopexit.loopexit, label %110

; <label>:71:                                     ; preds = %26
  %72 = tail call fastcc i32 @get_dri(%struct.jpeg_decompress_struct* nonnull %0)
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %.loopexit.loopexit, label %110

; <label>:74:                                     ; preds = %26, %26, %26, %26, %26, %26, %26, %26, %26, %26, %26, %26, %26, %26, %26, %26
  %75 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %76 = load i32, i32* %2, align 4
  %77 = add nsw i32 %76, -224
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %75, i64 0, i32 4, i64 %78
  %80 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %79, align 8
  %81 = tail call i32 %80(%struct.jpeg_decompress_struct* nonnull %0) #4
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %.loopexit.loopexit, label %110

; <label>:83:                                     ; preds = %26
  %84 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %9, align 8
  %85 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %84, i64 0, i32 3
  %86 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %85, align 8
  %87 = tail call i32 %86(%struct.jpeg_decompress_struct* nonnull %0) #4
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %.loopexit.loopexit, label %110

; <label>:89:                                     ; preds = %26, %26, %26, %26, %26, %26, %26, %26, %26
  %90 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %91 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %90, i64 0, i32 5
  store i32 91, i32* %91, align 8
  %92 = load i32, i32* %2, align 4
  %93 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %94 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %93, i64 0, i32 6, i32 0, i64 0
  store i32 %92, i32* %94, align 4
  %95 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %96 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %95, i64 0, i32 1
  %97 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %96, align 8
  tail call void %97(%struct.jpeg_common_struct* %11, i32 1) #4
  br label %110

; <label>:98:                                     ; preds = %26
  %99 = tail call i32 @skip_variable(%struct.jpeg_decompress_struct* nonnull %0)
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %.loopexit.loopexit, label %110

; <label>:101:                                    ; preds = %26
  %102 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %4, align 8
  %103 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %102, i64 0, i32 5
  store i32 67, i32* %103, align 8
  %104 = load i32, i32* %2, align 4
  %105 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %4, align 8
  %106 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %105, i64 0, i32 6, i32 0, i64 0
  store i32 %104, i32* %106, align 4
  %107 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %4, align 8
  %108 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %107, i64 0, i32 0
  %109 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %108, align 8
  tail call void %109(%struct.jpeg_common_struct* %5) #4
  br label %110

; <label>:110:                                    ; preds = %98, %83, %74, %71, %68, %65, %62, %38, %35, %32, %29, %101, %89, %41, %28
  store i32 0, i32* %2, align 4
  br label %12

.loopexit.loopexit:                               ; preds = %20, %23, %29, %32, %35, %38, %62, %65, %68, %71, %74, %83, %98
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %50, %54, %53
  %.0 = phi i32 [ 2, %54 ], [ 1, %53 ], [ 0, %50 ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @read_restart_marker(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %8

; <label>:5:                                      ; preds = %1
  %6 = tail call fastcc i32 @next_marker(%struct.jpeg_decompress_struct* nonnull %0)
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %43, label %8

; <label>:8:                                      ; preds = %5, %1
  %9 = load i32, i32* %2, align 4
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %11 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %11, i64 0, i32 7
  %13 = load i32, i32* %12, align 8
  %14 = add nsw i32 %13, 208
  %15 = icmp eq i32 %9, %14
  br i1 %15, label %16, label %29

; <label>:16:                                     ; preds = %8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i64 0, i32 5
  store i32 97, i32* %19, align 8
  %20 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %10, align 8
  %21 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %20, i64 0, i32 7
  %22 = load i32, i32* %21, align 8
  %23 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %24 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %23, i64 0, i32 6, i32 0, i64 0
  store i32 %22, i32* %24, align 4
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i64 0, i32 1
  %27 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %26, align 8
  %28 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %27(%struct.jpeg_common_struct* %28, i32 3) #4
  store i32 0, i32* %2, align 4
  br label %37

; <label>:29:                                     ; preds = %8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %31 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %31, i64 0, i32 5
  %33 = bitcast {}** %32 to i32 (%struct.jpeg_decompress_struct*, i32)**
  %34 = load i32 (%struct.jpeg_decompress_struct*, i32)*, i32 (%struct.jpeg_decompress_struct*, i32)** %33, align 8
  %35 = tail call i32 %34(%struct.jpeg_decompress_struct* nonnull %0, i32 %13) #4
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %43, label %37

; <label>:37:                                     ; preds = %29, %16
  %38 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %10, align 8
  %39 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %38, i64 0, i32 7
  %40 = load i32, i32* %39, align 8
  %41 = add nsw i32 %40, 1
  %42 = and i32 %41, 7
  store i32 %42, i32* %39, align 8
  br label %43

; <label>:43:                                     ; preds = %29, %5, %37
  %.0 = phi i32 [ 1, %37 ], [ 0, %5 ], [ 0, %29 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @skip_variable(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %3 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 1
  %5 = load i64, i64* %4, align 8
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %7, label %14

; <label>:7:                                      ; preds = %1
  %8 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %9 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %8, align 8
  %10 = tail call i32 %9(%struct.jpeg_decompress_struct* nonnull %0) #4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %53, label %12

; <label>:12:                                     ; preds = %7
  %13 = load i64, i64* %4, align 8
  br label %14

; <label>:14:                                     ; preds = %12, %1
  %.01 = phi i64 [ %13, %12 ], [ %5, %1 ]
  %.02.in = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 0
  %.02 = load i8*, i8** %.02.in, align 8
  %15 = add i64 %.01, -1
  %16 = getelementptr inbounds i8, i8* %.02, i64 1
  %17 = load i8, i8* %.02, align 1
  %18 = zext i8 %17 to i64
  %19 = shl nuw nsw i64 %18, 8
  %20 = icmp eq i64 %15, 0
  br i1 %20, label %21, label %29

; <label>:21:                                     ; preds = %14
  %22 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %23 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %22, align 8
  %24 = tail call i32 %23(%struct.jpeg_decompress_struct* nonnull %0) #4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %53, label %26

; <label>:26:                                     ; preds = %21
  %27 = load i8*, i8** %.02.in, align 8
  %28 = load i64, i64* %4, align 8
  br label %29

; <label>:29:                                     ; preds = %26, %14
  %.13 = phi i8* [ %27, %26 ], [ %16, %14 ]
  %.1 = phi i64 [ %28, %26 ], [ %15, %14 ]
  %30 = load i8, i8* %.13, align 1
  %31 = zext i8 %30 to i64
  %32 = or i64 %31, %19
  %33 = getelementptr inbounds i8, i8* %.13, i64 1
  %34 = add i64 %.1, -1
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %36 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %35, align 8
  %37 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %36, i64 0, i32 5
  store i32 90, i32* %37, align 8
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  %39 = load i32, i32* %38, align 4
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %35, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i64 0, i32 6, i32 0, i64 0
  store i32 %39, i32* %41, align 4
  %42 = trunc i64 %32 to i32
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %35, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i64 0, i32 6, i32 0, i64 1
  store i32 %42, i32* %44, align 4
  %45 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %35, align 8
  %46 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %45, i64 0, i32 1
  %47 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %46, align 8
  %48 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %47(%struct.jpeg_common_struct* %48, i32 1) #4
  store i8* %33, i8** %.02.in, align 8
  store i64 %34, i64* %4, align 8
  %49 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %2, align 8
  %50 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %49, i64 0, i32 4
  %51 = load void (%struct.jpeg_decompress_struct*, i64)*, void (%struct.jpeg_decompress_struct*, i64)** %50, align 8
  %52 = add nsw i64 %32, -2
  tail call void %51(%struct.jpeg_decompress_struct* nonnull %0, i64 %52) #4
  br label %53

; <label>:53:                                     ; preds = %21, %7, %29
  %.0 = phi i32 [ 1, %29 ], [ 0, %7 ], [ 0, %21 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_app0(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca [14 x i8], align 1
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %4 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %4, i64 0, i32 1
  %6 = load i64, i64* %5, align 8
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %15

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %4, i64 0, i32 3
  %10 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %9, align 8
  %11 = tail call i32 %10(%struct.jpeg_decompress_struct* nonnull %0) #4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %.loopexit, label %13

; <label>:13:                                     ; preds = %8
  %14 = load i64, i64* %5, align 8
  br label %15

; <label>:15:                                     ; preds = %13, %1
  %.01 = phi i64 [ %14, %13 ], [ %6, %1 ]
  %.04.in = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %4, i64 0, i32 0
  %.04 = load i8*, i8** %.04.in, align 8
  %16 = add i64 %.01, -1
  %17 = getelementptr inbounds i8, i8* %.04, i64 1
  %18 = load i8, i8* %.04, align 1
  %19 = zext i8 %18 to i64
  %20 = shl nuw nsw i64 %19, 8
  %21 = icmp eq i64 %16, 0
  br i1 %21, label %22, label %30

; <label>:22:                                     ; preds = %15
  %23 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %4, i64 0, i32 3
  %24 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %23, align 8
  %25 = tail call i32 %24(%struct.jpeg_decompress_struct* nonnull %0) #4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %.loopexit, label %27

; <label>:27:                                     ; preds = %22
  %28 = load i8*, i8** %.04.in, align 8
  %29 = load i64, i64* %5, align 8
  br label %30

; <label>:30:                                     ; preds = %27, %15
  %.15 = phi i8* [ %28, %27 ], [ %17, %15 ]
  %.1 = phi i64 [ %29, %27 ], [ %16, %15 ]
  %31 = add i64 %.1, -1
  %32 = getelementptr inbounds i8, i8* %.15, i64 1
  %33 = load i8, i8* %.15, align 1
  %34 = zext i8 %33 to i64
  %35 = or i64 %34, %20
  %36 = add nsw i64 %35, -2
  %37 = icmp sgt i64 %36, 13
  br i1 %37, label %.preheader, label %205

.preheader:                                       ; preds = %30
  %38 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %4, i64 0, i32 3
  br label %39

; <label>:39:                                     ; preds = %.preheader, %48
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %48 ]
  %.213 = phi i64 [ %31, %.preheader ], [ %49, %48 ]
  %.2611 = phi i8* [ %32, %.preheader ], [ %50, %48 ]
  %40 = icmp eq i64 %.213, 0
  br i1 %40, label %41, label %48

; <label>:41:                                     ; preds = %39
  %42 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %38, align 8
  %43 = tail call i32 %42(%struct.jpeg_decompress_struct* %0) #4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %.loopexit.loopexit, label %45

; <label>:45:                                     ; preds = %41
  %46 = load i8*, i8** %.04.in, align 8
  %47 = load i64, i64* %5, align 8
  br label %48

; <label>:48:                                     ; preds = %45, %39
  %.37 = phi i8* [ %46, %45 ], [ %.2611, %39 ]
  %.3 = phi i64 [ %47, %45 ], [ %.213, %39 ]
  %49 = add i64 %.3, -1
  %50 = getelementptr inbounds i8, i8* %.37, i64 1
  %51 = load i8, i8* %.37, align 1
  %52 = getelementptr inbounds [14 x i8], [14 x i8]* %2, i64 0, i64 %indvars.iv
  store i8 %51, i8* %52, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %53 = icmp slt i64 %indvars.iv.next, 14
  br i1 %53, label %39, label %54

; <label>:54:                                     ; preds = %48
  %55 = add nsw i64 %35, -16
  %56 = getelementptr inbounds [14 x i8], [14 x i8]* %2, i64 0, i64 0
  %57 = load i8, i8* %56, align 1
  %58 = icmp eq i8 %57, 74
  br i1 %58, label %59, label %193

; <label>:59:                                     ; preds = %54
  %60 = getelementptr inbounds [14 x i8], [14 x i8]* %2, i64 0, i64 1
  %61 = load i8, i8* %60, align 1
  %62 = icmp eq i8 %61, 70
  br i1 %62, label %63, label %193

; <label>:63:                                     ; preds = %59
  %64 = getelementptr inbounds [14 x i8], [14 x i8]* %2, i64 0, i64 2
  %65 = load i8, i8* %64, align 1
  %66 = icmp eq i8 %65, 73
  br i1 %66, label %67, label %193

; <label>:67:                                     ; preds = %63
  %68 = getelementptr inbounds [14 x i8], [14 x i8]* %2, i64 0, i64 3
  %69 = load i8, i8* %68, align 1
  %70 = icmp eq i8 %69, 70
  br i1 %70, label %71, label %193

; <label>:71:                                     ; preds = %67
  %72 = getelementptr inbounds [14 x i8], [14 x i8]* %2, i64 0, i64 4
  %73 = load i8, i8* %72, align 1
  %74 = icmp eq i8 %73, 0
  br i1 %74, label %75, label %193

; <label>:75:                                     ; preds = %71
  %76 = getelementptr inbounds [14 x i8], [14 x i8]* %2, i64 0, i64 5
  %77 = load i8, i8* %76, align 1
  %78 = icmp eq i8 %77, 1
  br i1 %78, label %96, label %79

; <label>:79:                                     ; preds = %75
  %80 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %81 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %82 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %81, i64 0, i32 5
  store i32 115, i32* %82, align 8
  %83 = load i8, i8* %76, align 1
  %84 = zext i8 %83 to i32
  %85 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %86 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %85, i64 0, i32 6, i32 0, i64 0
  store i32 %84, i32* %86, align 4
  %87 = getelementptr inbounds [14 x i8], [14 x i8]* %2, i64 0, i64 6
  %88 = load i8, i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %91 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %90, i64 0, i32 6, i32 0, i64 1
  store i32 %89, i32* %91, align 4
  %92 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %93 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %92, i64 0, i32 1
  %94 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %93, align 8
  %95 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %94(%struct.jpeg_common_struct* %95, i32 -1) #4
  br label %116

; <label>:96:                                     ; preds = %75
  %97 = getelementptr inbounds [14 x i8], [14 x i8]* %2, i64 0, i64 6
  %98 = load i8, i8* %97, align 1
  %99 = icmp ugt i8 %98, 2
  br i1 %99, label %100, label %116

; <label>:100:                                    ; preds = %96
  %101 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %102 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %101, align 8
  %103 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %102, i64 0, i32 5
  store i32 88, i32* %103, align 8
  %104 = load i8, i8* %76, align 1
  %105 = zext i8 %104 to i32
  %106 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %101, align 8
  %107 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %106, i64 0, i32 6, i32 0, i64 0
  store i32 %105, i32* %107, align 4
  %108 = load i8, i8* %97, align 1
  %109 = zext i8 %108 to i32
  %110 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %101, align 8
  %111 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %110, i64 0, i32 6, i32 0, i64 1
  store i32 %109, i32* %111, align 4
  %112 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %101, align 8
  %113 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %112, i64 0, i32 1
  %114 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %113, align 8
  %115 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %114(%struct.jpeg_common_struct* %115, i32 1) #4
  br label %116

; <label>:116:                                    ; preds = %96, %100, %79
  %117 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 50
  store i32 1, i32* %117, align 4
  %118 = getelementptr inbounds [14 x i8], [14 x i8]* %2, i64 0, i64 7
  %119 = load i8, i8* %118, align 1
  %120 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 51
  store i8 %119, i8* %120, align 8
  %121 = getelementptr inbounds [14 x i8], [14 x i8]* %2, i64 0, i64 8
  %122 = load i8, i8* %121, align 1
  %123 = zext i8 %122 to i16
  %124 = shl nuw i16 %123, 8
  %125 = getelementptr inbounds [14 x i8], [14 x i8]* %2, i64 0, i64 9
  %126 = load i8, i8* %125, align 1
  %127 = zext i8 %126 to i16
  %128 = or i16 %124, %127
  %129 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 52
  store i16 %128, i16* %129, align 2
  %130 = getelementptr inbounds [14 x i8], [14 x i8]* %2, i64 0, i64 10
  %131 = load i8, i8* %130, align 1
  %132 = zext i8 %131 to i16
  %133 = shl nuw i16 %132, 8
  %134 = getelementptr inbounds [14 x i8], [14 x i8]* %2, i64 0, i64 11
  %135 = load i8, i8* %134, align 1
  %136 = zext i8 %135 to i16
  %137 = or i16 %133, %136
  %138 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 53
  store i16 %137, i16* %138, align 4
  %139 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %140 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %139, align 8
  %141 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %140, i64 0, i32 6, i32 0, i64 0
  %142 = load i16, i16* %129, align 2
  %143 = zext i16 %142 to i32
  store i32 %143, i32* %141, align 4
  %144 = load i16, i16* %138, align 4
  %145 = zext i16 %144 to i32
  %146 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %140, i64 0, i32 6, i32 0, i64 1
  store i32 %145, i32* %146, align 4
  %147 = load i8, i8* %120, align 8
  %148 = zext i8 %147 to i32
  %149 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %140, i64 0, i32 6, i32 0, i64 2
  store i32 %148, i32* %149, align 4
  %150 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %139, align 8
  %151 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %150, i64 0, i32 5
  store i32 86, i32* %151, align 8
  %152 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %139, align 8
  %153 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %152, i64 0, i32 1
  %154 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %153, align 8
  %155 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %154(%struct.jpeg_common_struct* %155, i32 1) #4
  %156 = getelementptr inbounds [14 x i8], [14 x i8]* %2, i64 0, i64 12
  %157 = load i8, i8* %156, align 1
  %158 = getelementptr inbounds [14 x i8], [14 x i8]* %2, i64 0, i64 13
  %159 = load i8, i8* %158, align 1
  %160 = or i8 %159, %157
  %161 = icmp eq i8 %160, 0
  br i1 %161, label %176, label %162

; <label>:162:                                    ; preds = %116
  %163 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %139, align 8
  %164 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %163, i64 0, i32 5
  store i32 89, i32* %164, align 8
  %165 = load i8, i8* %156, align 1
  %166 = zext i8 %165 to i32
  %167 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %139, align 8
  %168 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %167, i64 0, i32 6, i32 0, i64 0
  store i32 %166, i32* %168, align 4
  %169 = load i8, i8* %158, align 1
  %170 = zext i8 %169 to i32
  %171 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %139, align 8
  %172 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %171, i64 0, i32 6, i32 0, i64 1
  store i32 %170, i32* %172, align 4
  %173 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %139, align 8
  %174 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %173, i64 0, i32 1
  %175 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %174, align 8
  tail call void %175(%struct.jpeg_common_struct* %155, i32 1) #4
  br label %176

; <label>:176:                                    ; preds = %116, %162
  %177 = load i8, i8* %156, align 1
  %178 = zext i8 %177 to i64
  %179 = load i8, i8* %158, align 1
  %180 = zext i8 %179 to i64
  %181 = mul nuw nsw i64 %178, 3
  %182 = mul nuw nsw i64 %181, %180
  %183 = icmp eq i64 %55, %182
  br i1 %183, label %216, label %184

; <label>:184:                                    ; preds = %176
  %185 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %139, align 8
  %186 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %185, i64 0, i32 5
  store i32 87, i32* %186, align 8
  %187 = trunc i64 %55 to i32
  %188 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %139, align 8
  %189 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %188, i64 0, i32 6, i32 0, i64 0
  store i32 %187, i32* %189, align 4
  %190 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %139, align 8
  %191 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %190, i64 0, i32 1
  %192 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %191, align 8
  tail call void %192(%struct.jpeg_common_struct* %155, i32 1) #4
  br label %216

; <label>:193:                                    ; preds = %71, %67, %63, %59, %54
  %194 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %195 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %194, align 8
  %196 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %195, i64 0, i32 5
  store i32 76, i32* %196, align 8
  %197 = trunc i64 %55 to i32
  %198 = add nsw i32 %197, 14
  %199 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %194, align 8
  %200 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %199, i64 0, i32 6, i32 0, i64 0
  store i32 %198, i32* %200, align 4
  %201 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %194, align 8
  %202 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %201, i64 0, i32 1
  %203 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %202, align 8
  %204 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %203(%struct.jpeg_common_struct* %204, i32 1) #4
  br label %216

; <label>:205:                                    ; preds = %30
  %206 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %207 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %206, align 8
  %208 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %207, i64 0, i32 5
  store i32 76, i32* %208, align 8
  %209 = trunc i64 %36 to i32
  %210 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %206, align 8
  %211 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %210, i64 0, i32 6, i32 0, i64 0
  store i32 %209, i32* %211, align 4
  %212 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %206, align 8
  %213 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %212, i64 0, i32 1
  %214 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %213, align 8
  %215 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %214(%struct.jpeg_common_struct* %215, i32 1) #4
  br label %216

; <label>:216:                                    ; preds = %193, %176, %184, %205
  %.48 = phi i8* [ %32, %205 ], [ %50, %184 ], [ %50, %176 ], [ %50, %193 ]
  %.02 = phi i64 [ %36, %205 ], [ %55, %184 ], [ %55, %176 ], [ %55, %193 ]
  %.4 = phi i64 [ %31, %205 ], [ %49, %184 ], [ %49, %176 ], [ %49, %193 ]
  store i8* %.48, i8** %.04.in, align 8
  store i64 %.4, i64* %5, align 8
  %217 = icmp sgt i64 %.02, 0
  br i1 %217, label %218, label %.loopexit

; <label>:218:                                    ; preds = %216
  %219 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %3, align 8
  %220 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %219, i64 0, i32 4
  %221 = load void (%struct.jpeg_decompress_struct*, i64)*, void (%struct.jpeg_decompress_struct*, i64)** %220, align 8
  tail call void %221(%struct.jpeg_decompress_struct* nonnull %0, i64 %.02) #4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %41
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %216, %218, %22, %8
  %.0 = phi i32 [ 0, %8 ], [ 0, %22 ], [ 1, %218 ], [ 1, %216 ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_app14(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca [12 x i8], align 1
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %4 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %4, i64 0, i32 1
  %6 = load i64, i64* %5, align 8
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %15

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %4, i64 0, i32 3
  %10 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %9, align 8
  %11 = tail call i32 %10(%struct.jpeg_decompress_struct* nonnull %0) #4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %.loopexit, label %13

; <label>:13:                                     ; preds = %8
  %14 = load i64, i64* %5, align 8
  br label %15

; <label>:15:                                     ; preds = %13, %1
  %.01 = phi i64 [ %14, %13 ], [ %6, %1 ]
  %.04.in = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %4, i64 0, i32 0
  %.04 = load i8*, i8** %.04.in, align 8
  %16 = add i64 %.01, -1
  %17 = getelementptr inbounds i8, i8* %.04, i64 1
  %18 = load i8, i8* %.04, align 1
  %19 = zext i8 %18 to i64
  %20 = shl nuw nsw i64 %19, 8
  %21 = icmp eq i64 %16, 0
  br i1 %21, label %22, label %30

; <label>:22:                                     ; preds = %15
  %23 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %4, i64 0, i32 3
  %24 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %23, align 8
  %25 = tail call i32 %24(%struct.jpeg_decompress_struct* nonnull %0) #4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %.loopexit, label %27

; <label>:27:                                     ; preds = %22
  %28 = load i8*, i8** %.04.in, align 8
  %29 = load i64, i64* %5, align 8
  br label %30

; <label>:30:                                     ; preds = %27, %15
  %.15 = phi i8* [ %28, %27 ], [ %17, %15 ]
  %.1 = phi i64 [ %29, %27 ], [ %16, %15 ]
  %31 = add i64 %.1, -1
  %32 = getelementptr inbounds i8, i8* %.15, i64 1
  %33 = load i8, i8* %.15, align 1
  %34 = zext i8 %33 to i64
  %35 = or i64 %34, %20
  %36 = add nsw i64 %35, -2
  %37 = icmp sgt i64 %36, 11
  br i1 %37, label %.preheader, label %129

.preheader:                                       ; preds = %30
  %38 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %4, i64 0, i32 3
  br label %39

; <label>:39:                                     ; preds = %.preheader, %48
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %48 ]
  %.213 = phi i64 [ %31, %.preheader ], [ %49, %48 ]
  %.2611 = phi i8* [ %32, %.preheader ], [ %50, %48 ]
  %40 = icmp eq i64 %.213, 0
  br i1 %40, label %41, label %48

; <label>:41:                                     ; preds = %39
  %42 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %38, align 8
  %43 = tail call i32 %42(%struct.jpeg_decompress_struct* %0) #4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %.loopexit.loopexit, label %45

; <label>:45:                                     ; preds = %41
  %46 = load i8*, i8** %.04.in, align 8
  %47 = load i64, i64* %5, align 8
  br label %48

; <label>:48:                                     ; preds = %45, %39
  %.37 = phi i8* [ %46, %45 ], [ %.2611, %39 ]
  %.3 = phi i64 [ %47, %45 ], [ %.213, %39 ]
  %49 = add i64 %.3, -1
  %50 = getelementptr inbounds i8, i8* %.37, i64 1
  %51 = load i8, i8* %.37, align 1
  %52 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 %indvars.iv
  store i8 %51, i8* %52, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %53 = icmp slt i64 %indvars.iv.next, 12
  br i1 %53, label %39, label %54

; <label>:54:                                     ; preds = %48
  %55 = add nsw i64 %35, -14
  %56 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 0
  %57 = load i8, i8* %56, align 1
  %58 = icmp eq i8 %57, 65
  br i1 %58, label %59, label %117

; <label>:59:                                     ; preds = %54
  %60 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 1
  %61 = load i8, i8* %60, align 1
  %62 = icmp eq i8 %61, 100
  br i1 %62, label %63, label %117

; <label>:63:                                     ; preds = %59
  %64 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 2
  %65 = load i8, i8* %64, align 1
  %66 = icmp eq i8 %65, 111
  br i1 %66, label %67, label %117

; <label>:67:                                     ; preds = %63
  %68 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 3
  %69 = load i8, i8* %68, align 1
  %70 = icmp eq i8 %69, 98
  br i1 %70, label %71, label %117

; <label>:71:                                     ; preds = %67
  %72 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 4
  %73 = load i8, i8* %72, align 1
  %74 = icmp eq i8 %73, 101
  br i1 %74, label %75, label %117

; <label>:75:                                     ; preds = %71
  %76 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 11
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 9
  %80 = load i8, i8* %79, align 1
  %81 = zext i8 %80 to i32
  %82 = shl nuw nsw i32 %81, 8
  %83 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 10
  %84 = load i8, i8* %83, align 1
  %85 = zext i8 %84 to i32
  %86 = or i32 %82, %85
  %87 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 7
  %88 = load i8, i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = shl nuw nsw i32 %89, 8
  %91 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 8
  %92 = load i8, i8* %91, align 1
  %93 = zext i8 %92 to i32
  %94 = or i32 %90, %93
  %95 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 5
  %96 = load i8, i8* %95, align 1
  %97 = zext i8 %96 to i32
  %98 = shl nuw nsw i32 %97, 8
  %99 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 6
  %100 = load i8, i8* %99, align 1
  %101 = zext i8 %100 to i32
  %102 = or i32 %98, %101
  %103 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %104 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %103, align 8
  %105 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %104, i64 0, i32 6, i32 0, i64 0
  store i32 %102, i32* %105, align 4
  %106 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %104, i64 0, i32 6, i32 0, i64 1
  store i32 %94, i32* %106, align 4
  %107 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %104, i64 0, i32 6, i32 0, i64 2
  store i32 %86, i32* %107, align 4
  %108 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %104, i64 0, i32 6, i32 0, i64 3
  store i32 %78, i32* %108, align 4
  %109 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %103, align 8
  %110 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %109, i64 0, i32 5
  store i32 75, i32* %110, align 8
  %111 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %103, align 8
  %112 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %111, i64 0, i32 1
  %113 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %112, align 8
  %114 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %113(%struct.jpeg_common_struct* %114, i32 1) #4
  %115 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 54
  store i32 1, i32* %115, align 8
  %116 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 55
  store i8 %77, i8* %116, align 4
  br label %140

; <label>:117:                                    ; preds = %71, %67, %63, %59, %54
  %118 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %119 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %118, align 8
  %120 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %119, i64 0, i32 5
  store i32 77, i32* %120, align 8
  %121 = trunc i64 %55 to i32
  %122 = add nsw i32 %121, 12
  %123 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %118, align 8
  %124 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %123, i64 0, i32 6, i32 0, i64 0
  store i32 %122, i32* %124, align 4
  %125 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %118, align 8
  %126 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %125, i64 0, i32 1
  %127 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %126, align 8
  %128 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %127(%struct.jpeg_common_struct* %128, i32 1) #4
  br label %140

; <label>:129:                                    ; preds = %30
  %130 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %131 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %130, align 8
  %132 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %131, i64 0, i32 5
  store i32 77, i32* %132, align 8
  %133 = trunc i64 %36 to i32
  %134 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %130, align 8
  %135 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %134, i64 0, i32 6, i32 0, i64 0
  store i32 %133, i32* %135, align 4
  %136 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %130, align 8
  %137 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 1
  %138 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %137, align 8
  %139 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %138(%struct.jpeg_common_struct* %139, i32 1) #4
  br label %140

; <label>:140:                                    ; preds = %75, %117, %129
  %.48 = phi i8* [ %32, %129 ], [ %50, %117 ], [ %50, %75 ]
  %.02 = phi i64 [ %36, %129 ], [ %55, %117 ], [ %55, %75 ]
  %.4 = phi i64 [ %31, %129 ], [ %49, %117 ], [ %49, %75 ]
  store i8* %.48, i8** %.04.in, align 8
  store i64 %.4, i64* %5, align 8
  %141 = icmp sgt i64 %.02, 0
  br i1 %141, label %142, label %.loopexit

; <label>:142:                                    ; preds = %140
  %143 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %3, align 8
  %144 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %143, i64 0, i32 4
  %145 = load void (%struct.jpeg_decompress_struct*, i64)*, void (%struct.jpeg_decompress_struct*, i64)** %144, align 8
  tail call void %145(%struct.jpeg_decompress_struct* nonnull %0, i64 %.02) #4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %41
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %140, %142, %22, %8
  %.0 = phi i32 [ 0, %8 ], [ 0, %22 ], [ 1, %142 ], [ 1, %140 ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @first_marker(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %3 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 1
  %5 = load i64, i64* %4, align 8
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %7, label %14

; <label>:7:                                      ; preds = %1
  %8 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %9 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %8, align 8
  %10 = tail call i32 %9(%struct.jpeg_decompress_struct* nonnull %0) #4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %49, label %12

; <label>:12:                                     ; preds = %7
  %13 = load i64, i64* %4, align 8
  br label %14

; <label>:14:                                     ; preds = %12, %1
  %.01 = phi i64 [ %13, %12 ], [ %5, %1 ]
  %.02.in = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 0
  %.02 = load i8*, i8** %.02.in, align 8
  %15 = add i64 %.01, -1
  %16 = getelementptr inbounds i8, i8* %.02, i64 1
  %17 = load i8, i8* %.02, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp eq i64 %15, 0
  br i1 %19, label %20, label %28

; <label>:20:                                     ; preds = %14
  %21 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %22 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %21, align 8
  %23 = tail call i32 %22(%struct.jpeg_decompress_struct* nonnull %0) #4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %49, label %25

; <label>:25:                                     ; preds = %20
  %26 = load i8*, i8** %.02.in, align 8
  %27 = load i64, i64* %4, align 8
  br label %28

; <label>:28:                                     ; preds = %25, %14
  %.13 = phi i8* [ %26, %25 ], [ %16, %14 ]
  %.1 = phi i64 [ %27, %25 ], [ %15, %14 ]
  %29 = add i64 %.1, -1
  %30 = getelementptr inbounds i8, i8* %.13, i64 1
  %31 = load i8, i8* %.13, align 1
  %32 = zext i8 %31 to i32
  %33 = icmp eq i8 %17, -1
  %34 = icmp eq i8 %31, -40
  %or.cond = and i1 %33, %34
  br i1 %or.cond, label %47, label %35

; <label>:35:                                     ; preds = %28
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %37 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %37, i64 0, i32 5
  store i32 52, i32* %38, align 8
  %39 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %40 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %39, i64 0, i32 6, i32 0, i64 0
  store i32 %18, i32* %40, align 4
  %41 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %42 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %41, i64 0, i32 6, i32 0, i64 1
  store i32 %32, i32* %42, align 4
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i64 0, i32 0
  %45 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %44, align 8
  %46 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %45(%struct.jpeg_common_struct* %46) #4
  br label %47

; <label>:47:                                     ; preds = %28, %35
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  store i32 %32, i32* %48, align 4
  store i8* %30, i8** %.02.in, align 8
  store i64 %29, i64* %4, align 8
  br label %49

; <label>:49:                                     ; preds = %20, %7, %47
  %.0 = phi i32 [ 1, %47 ], [ 0, %7 ], [ 0, %20 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @get_soi(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %3 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %3, i64 0, i32 5
  store i32 101, i32* %4, align 8
  %5 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %2, align 8
  %6 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %5, i64 0, i32 1
  %7 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %6, align 8
  %8 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %7(%struct.jpeg_common_struct* %8, i32 1) #4
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %10 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %10, i64 0, i32 5
  %12 = load i32, i32* %11, align 8
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %.preheader, label %14

; <label>:14:                                     ; preds = %1
  %15 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %2, align 8
  %16 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %15, i64 0, i32 5
  store i32 60, i32* %16, align 8
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %2, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i64 0, i32 0
  %19 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %18, align 8
  tail call void %19(%struct.jpeg_common_struct* %8) #4
  br label %.preheader

.preheader:                                       ; preds = %14, %1
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 0
  store i8 0, i8* %20, align 1
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 0
  store i8 1, i8* %21, align 1
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 0
  store i8 5, i8* %22, align 1
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 1
  store i8 0, i8* %23, align 1
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 1
  store i8 1, i8* %24, align 1
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 1
  store i8 5, i8* %25, align 1
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 2
  store i8 0, i8* %26, align 1
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 2
  store i8 1, i8* %27, align 1
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 2
  store i8 5, i8* %28, align 1
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 3
  store i8 0, i8* %29, align 1
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 3
  store i8 1, i8* %30, align 1
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 3
  store i8 5, i8* %31, align 1
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 4
  store i8 0, i8* %32, align 1
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 4
  store i8 1, i8* %33, align 1
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 4
  store i8 5, i8* %34, align 1
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 5
  store i8 0, i8* %35, align 1
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 5
  store i8 1, i8* %36, align 1
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 5
  store i8 5, i8* %37, align 1
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 6
  store i8 0, i8* %38, align 1
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 6
  store i8 1, i8* %39, align 1
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 6
  store i8 5, i8* %40, align 1
  %41 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 7
  store i8 0, i8* %41, align 1
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 7
  store i8 1, i8* %42, align 1
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 7
  store i8 5, i8* %43, align 1
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 8
  store i8 0, i8* %44, align 1
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 8
  store i8 1, i8* %45, align 1
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 8
  store i8 5, i8* %46, align 1
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 9
  store i8 0, i8* %47, align 1
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 9
  store i8 1, i8* %48, align 1
  %49 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 9
  store i8 5, i8* %49, align 1
  %50 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 10
  store i8 0, i8* %50, align 1
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 10
  store i8 1, i8* %51, align 1
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 10
  store i8 5, i8* %52, align 1
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 11
  store i8 0, i8* %53, align 1
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 11
  store i8 1, i8* %54, align 1
  %55 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 11
  store i8 5, i8* %55, align 1
  %56 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 12
  store i8 0, i8* %56, align 1
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 12
  store i8 1, i8* %57, align 1
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 12
  store i8 5, i8* %58, align 1
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 13
  store i8 0, i8* %59, align 1
  %60 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 13
  store i8 1, i8* %60, align 1
  %61 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 13
  store i8 5, i8* %61, align 1
  %62 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 14
  store i8 0, i8* %62, align 1
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 14
  store i8 1, i8* %63, align 1
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 14
  store i8 5, i8* %64, align 1
  %65 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 15
  store i8 0, i8* %65, align 1
  %66 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 15
  store i8 1, i8* %66, align 1
  %67 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 15
  store i8 5, i8* %67, align 1
  %68 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 49
  %69 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 9
  store i32 0, i32* %69, align 4
  %70 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 56
  store i32 0, i32* %70, align 8
  %71 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 52
  %72 = bitcast i32* %68 to i8*
  call void @llvm.memset.p0i8.i64(i8* %72, i8 0, i64 9, i32 8, i1 false)
  store i16 1, i16* %71, align 2
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 53
  store i16 1, i16* %73, align 4
  %74 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 54
  store i32 0, i32* %74, align 8
  %75 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 55
  store i8 0, i8* %75, align 4
  %76 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %9, align 8
  %77 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %76, i64 0, i32 5
  store i32 1, i32* %77, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @get_sof(%struct.jpeg_decompress_struct*, i32, i32) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %5 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 0
  %7 = load i8*, i8** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 1
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 44
  store i32 %1, i32* %10, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 45
  store i32 %2, i32* %11, align 4
  %12 = icmp eq i64 %9, 0
  br i1 %12, label %13, label %21

; <label>:13:                                     ; preds = %3
  %14 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 3
  %15 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %14, align 8
  %16 = tail call i32 %15(%struct.jpeg_decompress_struct* nonnull %0) #4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %.loopexit, label %18

; <label>:18:                                     ; preds = %13
  %19 = load i8*, i8** %6, align 8
  %20 = load i64, i64* %8, align 8
  br label %21

; <label>:21:                                     ; preds = %18, %3
  %.02 = phi i8* [ %19, %18 ], [ %7, %3 ]
  %.01 = phi i64 [ %20, %18 ], [ %9, %3 ]
  %22 = add i64 %.01, -1
  %23 = getelementptr inbounds i8, i8* %.02, i64 1
  %24 = load i8, i8* %.02, align 1
  %25 = zext i8 %24 to i64
  %26 = shl nuw nsw i64 %25, 8
  %27 = icmp eq i64 %22, 0
  br i1 %27, label %28, label %36

; <label>:28:                                     ; preds = %21
  %29 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 3
  %30 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %29, align 8
  %31 = tail call i32 %30(%struct.jpeg_decompress_struct* nonnull %0) #4
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %.loopexit, label %33

; <label>:33:                                     ; preds = %28
  %34 = load i8*, i8** %6, align 8
  %35 = load i64, i64* %8, align 8
  br label %36

; <label>:36:                                     ; preds = %33, %21
  %.13 = phi i8* [ %34, %33 ], [ %23, %21 ]
  %.1 = phi i64 [ %35, %33 ], [ %22, %21 ]
  %37 = add i64 %.1, -1
  %38 = getelementptr inbounds i8, i8* %.13, i64 1
  %39 = load i8, i8* %.13, align 1
  %40 = zext i8 %39 to i64
  %41 = or i64 %40, %26
  %42 = icmp eq i64 %37, 0
  br i1 %42, label %43, label %51

; <label>:43:                                     ; preds = %36
  %44 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 3
  %45 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %44, align 8
  %46 = tail call i32 %45(%struct.jpeg_decompress_struct* nonnull %0) #4
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %.loopexit, label %48

; <label>:48:                                     ; preds = %43
  %49 = load i8*, i8** %6, align 8
  %50 = load i64, i64* %8, align 8
  br label %51

; <label>:51:                                     ; preds = %48, %36
  %.24 = phi i8* [ %49, %48 ], [ %38, %36 ]
  %.2 = phi i64 [ %50, %48 ], [ %37, %36 ]
  %52 = add i64 %.2, -1
  %53 = getelementptr inbounds i8, i8* %.24, i64 1
  %54 = load i8, i8* %.24, align 1
  %55 = zext i8 %54 to i32
  %56 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 42
  store i32 %55, i32* %56, align 8
  %57 = icmp eq i64 %52, 0
  br i1 %57, label %58, label %66

; <label>:58:                                     ; preds = %51
  %59 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 3
  %60 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %59, align 8
  %61 = tail call i32 %60(%struct.jpeg_decompress_struct* nonnull %0) #4
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %.loopexit, label %63

; <label>:63:                                     ; preds = %58
  %64 = load i8*, i8** %6, align 8
  %65 = load i64, i64* %8, align 8
  br label %66

; <label>:66:                                     ; preds = %63, %51
  %.35 = phi i8* [ %64, %63 ], [ %53, %51 ]
  %.3 = phi i64 [ %65, %63 ], [ %52, %51 ]
  %67 = add i64 %.3, -1
  %68 = getelementptr inbounds i8, i8* %.35, i64 1
  %69 = load i8, i8* %.35, align 1
  %70 = zext i8 %69 to i32
  %71 = shl nuw nsw i32 %70, 8
  %72 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 7
  store i32 %71, i32* %72, align 4
  %73 = icmp eq i64 %67, 0
  br i1 %73, label %74, label %82

; <label>:74:                                     ; preds = %66
  %75 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 3
  %76 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %75, align 8
  %77 = tail call i32 %76(%struct.jpeg_decompress_struct* nonnull %0) #4
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %.loopexit, label %79

; <label>:79:                                     ; preds = %74
  %80 = load i8*, i8** %6, align 8
  %81 = load i64, i64* %8, align 8
  br label %82

; <label>:82:                                     ; preds = %79, %66
  %.46 = phi i8* [ %80, %79 ], [ %68, %66 ]
  %.4 = phi i64 [ %81, %79 ], [ %67, %66 ]
  %83 = add i64 %.4, -1
  %84 = getelementptr inbounds i8, i8* %.46, i64 1
  %85 = load i8, i8* %.46, align 1
  %86 = zext i8 %85 to i32
  %87 = load i32, i32* %72, align 4
  %88 = add i32 %87, %86
  store i32 %88, i32* %72, align 4
  %89 = icmp eq i64 %83, 0
  br i1 %89, label %90, label %98

; <label>:90:                                     ; preds = %82
  %91 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 3
  %92 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %91, align 8
  %93 = tail call i32 %92(%struct.jpeg_decompress_struct* nonnull %0) #4
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %.loopexit, label %95

; <label>:95:                                     ; preds = %90
  %96 = load i8*, i8** %6, align 8
  %97 = load i64, i64* %8, align 8
  br label %98

; <label>:98:                                     ; preds = %95, %82
  %.57 = phi i8* [ %96, %95 ], [ %84, %82 ]
  %.5 = phi i64 [ %97, %95 ], [ %83, %82 ]
  %99 = add i64 %.5, -1
  %100 = getelementptr inbounds i8, i8* %.57, i64 1
  %101 = load i8, i8* %.57, align 1
  %102 = zext i8 %101 to i32
  %103 = shl nuw nsw i32 %102, 8
  %104 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 6
  store i32 %103, i32* %104, align 8
  %105 = icmp eq i64 %99, 0
  br i1 %105, label %106, label %114

; <label>:106:                                    ; preds = %98
  %107 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 3
  %108 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %107, align 8
  %109 = tail call i32 %108(%struct.jpeg_decompress_struct* nonnull %0) #4
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %.loopexit, label %111

; <label>:111:                                    ; preds = %106
  %112 = load i8*, i8** %6, align 8
  %113 = load i64, i64* %8, align 8
  br label %114

; <label>:114:                                    ; preds = %111, %98
  %.68 = phi i8* [ %112, %111 ], [ %100, %98 ]
  %.6 = phi i64 [ %113, %111 ], [ %99, %98 ]
  %115 = add i64 %.6, -1
  %116 = getelementptr inbounds i8, i8* %.68, i64 1
  %117 = load i8, i8* %.68, align 1
  %118 = zext i8 %117 to i32
  %119 = load i32, i32* %104, align 8
  %120 = add i32 %119, %118
  store i32 %120, i32* %104, align 8
  %121 = icmp eq i64 %115, 0
  br i1 %121, label %122, label %130

; <label>:122:                                    ; preds = %114
  %123 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 3
  %124 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %123, align 8
  %125 = tail call i32 %124(%struct.jpeg_decompress_struct* nonnull %0) #4
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %.loopexit, label %127

; <label>:127:                                    ; preds = %122
  %128 = load i8*, i8** %6, align 8
  %129 = load i64, i64* %8, align 8
  br label %130

; <label>:130:                                    ; preds = %127, %114
  %.79 = phi i8* [ %128, %127 ], [ %116, %114 ]
  %.7 = phi i64 [ %129, %127 ], [ %115, %114 ]
  %131 = load i8, i8* %.79, align 1
  %132 = zext i8 %131 to i32
  %133 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  store i32 %132, i32* %133, align 8
  %134 = add nsw i64 %41, -8
  %135 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %136 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %135, align 8
  %137 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 6, i32 0, i64 0
  %138 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  %139 = load i32, i32* %138, align 4
  store i32 %139, i32* %137, align 4
  %140 = load i32, i32* %104, align 8
  %141 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 6, i32 0, i64 1
  store i32 %140, i32* %141, align 4
  %142 = load i32, i32* %72, align 4
  %143 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 6, i32 0, i64 2
  store i32 %142, i32* %143, align 4
  %144 = load i32, i32* %133, align 8
  %145 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 6, i32 0, i64 3
  store i32 %144, i32* %145, align 4
  %146 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %135, align 8
  %147 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %146, i64 0, i32 5
  store i32 99, i32* %147, align 8
  %148 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %135, align 8
  %149 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %148, i64 0, i32 1
  %150 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %149, align 8
  %151 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %150(%struct.jpeg_common_struct* %151, i32 1) #4
  %152 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %153 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %152, align 8
  %154 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %153, i64 0, i32 6
  %155 = load i32, i32* %154, align 4
  %156 = icmp eq i32 %155, 0
  br i1 %156, label %163, label %157

; <label>:157:                                    ; preds = %130
  %158 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %135, align 8
  %159 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %158, i64 0, i32 5
  store i32 57, i32* %159, align 8
  %160 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %135, align 8
  %161 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %160, i64 0, i32 0
  %162 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %161, align 8
  tail call void %162(%struct.jpeg_common_struct* %151) #4
  br label %163

; <label>:163:                                    ; preds = %130, %157
  %164 = load i32, i32* %72, align 4
  %165 = icmp eq i32 %164, 0
  br i1 %165, label %172, label %166

; <label>:166:                                    ; preds = %163
  %167 = load i32, i32* %104, align 8
  %168 = icmp eq i32 %167, 0
  br i1 %168, label %172, label %169

; <label>:169:                                    ; preds = %166
  %170 = load i32, i32* %133, align 8
  %171 = icmp slt i32 %170, 1
  br i1 %171, label %172, label %178

; <label>:172:                                    ; preds = %169, %166, %163
  %173 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %135, align 8
  %174 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %173, i64 0, i32 5
  store i32 31, i32* %174, align 8
  %175 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %135, align 8
  %176 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %175, i64 0, i32 0
  %177 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %176, align 8
  tail call void %177(%struct.jpeg_common_struct* nonnull %151) #4
  br label %178

; <label>:178:                                    ; preds = %172, %169
  %179 = load i32, i32* %133, align 8
  %180 = mul nsw i32 %179, 3
  %181 = sext i32 %180 to i64
  %182 = icmp eq i64 %134, %181
  br i1 %182, label %189, label %183

; <label>:183:                                    ; preds = %178
  %184 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %135, align 8
  %185 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %184, i64 0, i32 5
  store i32 9, i32* %185, align 8
  %186 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %135, align 8
  %187 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %186, i64 0, i32 0
  %188 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %187, align 8
  tail call void %188(%struct.jpeg_common_struct* nonnull %151) #4
  br label %189

; <label>:189:                                    ; preds = %178, %183
  %190 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %191 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %190, align 8
  %192 = icmp eq %struct.jpeg_component_info* %191, null
  br i1 %192, label %193, label %203

; <label>:193:                                    ; preds = %189
  %194 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %195 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %194, align 8
  %196 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %195, i64 0, i32 0
  %197 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %196, align 8
  %198 = load i32, i32* %133, align 8
  %199 = sext i32 %198 to i64
  %200 = mul nsw i64 %199, 96
  %201 = tail call i8* %197(%struct.jpeg_common_struct* nonnull %151, i32 1, i64 %200) #4
  %202 = bitcast %struct.jpeg_component_info** %190 to i8**
  store i8* %201, i8** %202, align 8
  br label %203

; <label>:203:                                    ; preds = %193, %189
  %.81018 = getelementptr inbounds i8, i8* %.79, i64 1
  %.819 = add i64 %.7, -1
  %204 = load i32, i32* %133, align 8
  %205 = icmp sgt i32 %204, 0
  br i1 %205, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %203
  %206 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %190, align 8
  %207 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 3
  %208 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 3
  %209 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 3
  br label %210

; <label>:210:                                    ; preds = %.lr.ph, %251
  %.823 = phi i64 [ %.819, %.lr.ph ], [ %.8, %251 ]
  %.81022 = phi i8* [ %.81018, %.lr.ph ], [ %.810, %251 ]
  %.01421 = phi %struct.jpeg_component_info* [ %206, %.lr.ph ], [ %270, %251 ]
  %.01520 = phi i32 [ 0, %.lr.ph ], [ %269, %251 ]
  %211 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.01421, i64 0, i32 1
  store i32 %.01520, i32* %211, align 4
  %212 = icmp eq i64 %.823, 0
  br i1 %212, label %213, label %220

; <label>:213:                                    ; preds = %210
  %214 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %207, align 8
  %215 = tail call i32 %214(%struct.jpeg_decompress_struct* nonnull %0) #4
  %216 = icmp eq i32 %215, 0
  br i1 %216, label %.loopexit.loopexit, label %217

; <label>:217:                                    ; preds = %213
  %218 = load i8*, i8** %6, align 8
  %219 = load i64, i64* %8, align 8
  br label %220

; <label>:220:                                    ; preds = %217, %210
  %.911 = phi i8* [ %218, %217 ], [ %.81022, %210 ]
  %.9 = phi i64 [ %219, %217 ], [ %.823, %210 ]
  %221 = add i64 %.9, -1
  %222 = getelementptr inbounds i8, i8* %.911, i64 1
  %223 = load i8, i8* %.911, align 1
  %224 = zext i8 %223 to i32
  %225 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.01421, i64 0, i32 0
  store i32 %224, i32* %225, align 8
  %226 = icmp eq i64 %221, 0
  br i1 %226, label %227, label %234

; <label>:227:                                    ; preds = %220
  %228 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %208, align 8
  %229 = tail call i32 %228(%struct.jpeg_decompress_struct* nonnull %0) #4
  %230 = icmp eq i32 %229, 0
  br i1 %230, label %.loopexit.loopexit, label %231

; <label>:231:                                    ; preds = %227
  %232 = load i8*, i8** %6, align 8
  %233 = load i64, i64* %8, align 8
  br label %234

; <label>:234:                                    ; preds = %231, %220
  %.1012 = phi i8* [ %232, %231 ], [ %222, %220 ]
  %.10 = phi i64 [ %233, %231 ], [ %221, %220 ]
  %235 = add i64 %.10, -1
  %236 = getelementptr inbounds i8, i8* %.1012, i64 1
  %237 = load i8, i8* %.1012, align 1
  %238 = zext i8 %237 to i32
  %239 = lshr i32 %238, 4
  %240 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.01421, i64 0, i32 2
  store i32 %239, i32* %240, align 8
  %241 = and i32 %238, 15
  %242 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.01421, i64 0, i32 3
  store i32 %241, i32* %242, align 4
  %243 = icmp eq i64 %235, 0
  br i1 %243, label %244, label %251

; <label>:244:                                    ; preds = %234
  %245 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %209, align 8
  %246 = tail call i32 %245(%struct.jpeg_decompress_struct* %0) #4
  %247 = icmp eq i32 %246, 0
  br i1 %247, label %.loopexit.loopexit, label %248

; <label>:248:                                    ; preds = %244
  %249 = load i8*, i8** %6, align 8
  %250 = load i64, i64* %8, align 8
  br label %251

; <label>:251:                                    ; preds = %248, %234
  %.1113 = phi i8* [ %249, %248 ], [ %236, %234 ]
  %.11 = phi i64 [ %250, %248 ], [ %235, %234 ]
  %252 = load i8, i8* %.1113, align 1
  %253 = zext i8 %252 to i32
  %254 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.01421, i64 0, i32 4
  store i32 %253, i32* %254, align 8
  %255 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %135, align 8
  %256 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %255, i64 0, i32 6, i32 0, i64 0
  %257 = load i32, i32* %225, align 8
  store i32 %257, i32* %256, align 4
  %258 = load i32, i32* %240, align 8
  %259 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %255, i64 0, i32 6, i32 0, i64 1
  store i32 %258, i32* %259, align 4
  %260 = load i32, i32* %242, align 4
  %261 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %255, i64 0, i32 6, i32 0, i64 2
  store i32 %260, i32* %261, align 4
  %262 = load i32, i32* %254, align 8
  %263 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %255, i64 0, i32 6, i32 0, i64 3
  store i32 %262, i32* %263, align 4
  %264 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %135, align 8
  %265 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %264, i64 0, i32 5
  store i32 100, i32* %265, align 8
  %266 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %135, align 8
  %267 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %266, i64 0, i32 1
  %268 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %267, align 8
  tail call void %268(%struct.jpeg_common_struct* nonnull %151, i32 1) #4
  %269 = add nuw nsw i32 %.01520, 1
  %270 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.01421, i64 1
  %.810 = getelementptr inbounds i8, i8* %.1113, i64 1
  %.8 = add i64 %.11, -1
  %271 = load i32, i32* %133, align 8
  %272 = icmp slt i32 %269, %271
  br i1 %272, label %210, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %251
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %203
  %.810.lcssa = phi i8* [ %.81018, %203 ], [ %.810, %._crit_edge.loopexit ]
  %.8.lcssa = phi i64 [ %.819, %203 ], [ %.8, %._crit_edge.loopexit ]
  %273 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %152, align 8
  %274 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %273, i64 0, i32 6
  store i32 1, i32* %274, align 4
  store i8* %.810.lcssa, i8** %6, align 8
  store i64 %.8.lcssa, i64* %8, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %213, %227, %244
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %122, %106, %90, %74, %58, %43, %28, %13, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %13 ], [ 0, %28 ], [ 0, %43 ], [ 0, %58 ], [ 0, %74 ], [ 0, %90 ], [ 0, %106 ], [ 0, %122 ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @get_sos(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %3 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 0
  %5 = load i8*, i8** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 1
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %9 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %9, i64 0, i32 6
  %11 = load i32, i32* %10, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %21

; <label>:13:                                     ; preds = %1
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %15 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %14, align 8
  %16 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %15, i64 0, i32 5
  store i32 61, i32* %16, align 8
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %14, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i64 0, i32 0
  %19 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %18, align 8
  %20 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %19(%struct.jpeg_common_struct* %20) #4
  br label %21

; <label>:21:                                     ; preds = %13, %1
  %22 = icmp eq i64 %7, 0
  br i1 %22, label %23, label %31

; <label>:23:                                     ; preds = %21
  %24 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %25 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %24, align 8
  %26 = tail call i32 %25(%struct.jpeg_decompress_struct* nonnull %0) #4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %.loopexit15, label %28

; <label>:28:                                     ; preds = %23
  %29 = load i8*, i8** %4, align 8
  %30 = load i64, i64* %6, align 8
  br label %31

; <label>:31:                                     ; preds = %28, %21
  %.04 = phi i8* [ %29, %28 ], [ %5, %21 ]
  %.01 = phi i64 [ %30, %28 ], [ %7, %21 ]
  %32 = add i64 %.01, -1
  %33 = getelementptr inbounds i8, i8* %.04, i64 1
  %34 = load i8, i8* %.04, align 1
  %35 = zext i8 %34 to i64
  %36 = shl nuw nsw i64 %35, 8
  %37 = icmp eq i64 %32, 0
  br i1 %37, label %38, label %46

; <label>:38:                                     ; preds = %31
  %39 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %40 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %39, align 8
  %41 = tail call i32 %40(%struct.jpeg_decompress_struct* nonnull %0) #4
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %.loopexit15, label %43

; <label>:43:                                     ; preds = %38
  %44 = load i8*, i8** %4, align 8
  %45 = load i64, i64* %6, align 8
  br label %46

; <label>:46:                                     ; preds = %43, %31
  %.15 = phi i8* [ %44, %43 ], [ %33, %31 ]
  %.1 = phi i64 [ %45, %43 ], [ %32, %31 ]
  %47 = add i64 %.1, -1
  %48 = getelementptr inbounds i8, i8* %.15, i64 1
  %49 = load i8, i8* %.15, align 1
  %50 = zext i8 %49 to i64
  %51 = or i64 %50, %36
  %52 = icmp eq i64 %47, 0
  br i1 %52, label %53, label %61

; <label>:53:                                     ; preds = %46
  %54 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %55 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %54, align 8
  %56 = tail call i32 %55(%struct.jpeg_decompress_struct* nonnull %0) #4
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %.loopexit15, label %58

; <label>:58:                                     ; preds = %53
  %59 = load i8*, i8** %4, align 8
  %60 = load i64, i64* %6, align 8
  br label %61

; <label>:61:                                     ; preds = %58, %46
  %.26 = phi i8* [ %59, %58 ], [ %48, %46 ]
  %.2 = phi i64 [ %60, %58 ], [ %47, %46 ]
  %62 = load i8, i8* %.26, align 1
  %63 = zext i8 %62 to i32
  %64 = shl nuw nsw i32 %63, 1
  %65 = add nuw nsw i32 %64, 6
  %66 = zext i32 %65 to i64
  %67 = icmp ne i64 %51, %66
  %68 = add i8 %62, -1
  %69 = icmp ugt i8 %68, 3
  %70 = or i1 %69, %67
  br i1 %70, label %71, label %79

; <label>:71:                                     ; preds = %61
  %72 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %73 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %72, align 8
  %74 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %73, i64 0, i32 5
  store i32 9, i32* %74, align 8
  %75 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %72, align 8
  %76 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %75, i64 0, i32 0
  %77 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %76, align 8
  %78 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %77(%struct.jpeg_common_struct* %78) #4
  br label %79

; <label>:79:                                     ; preds = %61, %71
  %80 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %81 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %82 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %81, i64 0, i32 5
  store i32 102, i32* %82, align 8
  %83 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %84 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %83, i64 0, i32 6, i32 0, i64 0
  store i32 %63, i32* %84, align 4
  %85 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %86 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %85, i64 0, i32 1
  %87 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %86, align 8
  %88 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %87(%struct.jpeg_common_struct* %88, i32 1) #4
  %89 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 62
  store i32 %63, i32* %89, align 8
  %.3723 = getelementptr inbounds i8, i8* %.26, i64 1
  %.324 = add i64 %.2, -1
  %90 = icmp eq i8 %62, 0
  %91 = icmp eq i64 %.324, 0
  br i1 %90, label %._crit_edge30, label %.lr.ph29

.lr.ph29:                                         ; preds = %79
  %92 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %93 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %94 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %95 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %96 = zext i8 %62 to i64
  br label %97

; <label>:97:                                     ; preds = %.lr.ph29, %.loopexit
  %indvars.iv = phi i64 [ 0, %.lr.ph29 ], [ %indvars.iv.next, %.loopexit ]
  %98 = phi i1 [ %91, %.lr.ph29 ], [ %157, %.loopexit ]
  %.327 = phi i64 [ %.324, %.lr.ph29 ], [ %.3, %.loopexit ]
  %.3726 = phi i8* [ %.3723, %.lr.ph29 ], [ %.37, %.loopexit ]
  br i1 %98, label %99, label %106

; <label>:99:                                     ; preds = %97
  %100 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %92, align 8
  %101 = tail call i32 %100(%struct.jpeg_decompress_struct* nonnull %0) #4
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %.loopexit15.loopexit, label %103

; <label>:103:                                    ; preds = %99
  %104 = load i8*, i8** %4, align 8
  %105 = load i64, i64* %6, align 8
  br label %106

; <label>:106:                                    ; preds = %103, %97
  %.48 = phi i8* [ %104, %103 ], [ %.3726, %97 ]
  %.4 = phi i64 [ %105, %103 ], [ %.327, %97 ]
  %107 = add i64 %.4, -1
  %108 = getelementptr inbounds i8, i8* %.48, i64 1
  %109 = load i8, i8* %.48, align 1
  %110 = zext i8 %109 to i32
  %111 = icmp eq i64 %107, 0
  br i1 %111, label %112, label %119

; <label>:112:                                    ; preds = %106
  %113 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %93, align 8
  %114 = tail call i32 %113(%struct.jpeg_decompress_struct* nonnull %0) #4
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %.loopexit15.loopexit, label %116

; <label>:116:                                    ; preds = %112
  %117 = load i8*, i8** %4, align 8
  %118 = load i64, i64* %6, align 8
  br label %119

; <label>:119:                                    ; preds = %116, %106
  %.59 = phi i8* [ %117, %116 ], [ %108, %106 ]
  %.5 = phi i64 [ %118, %116 ], [ %107, %106 ]
  %120 = load i8, i8* %.59, align 1
  %121 = zext i8 %120 to i32
  %122 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %94, align 8
  %123 = load i32, i32* %95, align 8
  %124 = icmp sgt i32 %123, 0
  br i1 %124, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %119
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %128
  %.0322 = phi i32 [ %129, %128 ], [ 0, %.lr.ph.preheader ]
  %.01321 = phi %struct.jpeg_component_info* [ %130, %128 ], [ %122, %.lr.ph.preheader ]
  %125 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.01321, i64 0, i32 0
  %126 = load i32, i32* %125, align 8
  %127 = icmp eq i32 %110, %126
  br i1 %127, label %.loopexit.loopexit, label %128

; <label>:128:                                    ; preds = %.lr.ph
  %129 = add nuw nsw i32 %.0322, 1
  %130 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.01321, i64 1
  %131 = load i32, i32* %95, align 8
  %132 = icmp slt i32 %129, %131
  br i1 %132, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %128
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %119
  %.013.lcssa = phi %struct.jpeg_component_info* [ %122, %119 ], [ %130, %._crit_edge.loopexit ]
  %133 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %134 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %133, i64 0, i32 5
  store i32 5, i32* %134, align 8
  %135 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %136 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %135, i64 0, i32 6, i32 0, i64 0
  store i32 %110, i32* %136, align 4
  %137 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %138 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %137, i64 0, i32 0
  %139 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %138, align 8
  tail call void %139(%struct.jpeg_common_struct* nonnull %88) #4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge
  %.01317 = phi %struct.jpeg_component_info* [ %.013.lcssa, %._crit_edge ], [ %.01321, %.loopexit.loopexit ]
  %140 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv
  store %struct.jpeg_component_info* %.01317, %struct.jpeg_component_info** %140, align 8
  %141 = lshr i32 %121, 4
  %142 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.01317, i64 0, i32 5
  store i32 %141, i32* %142, align 4
  %143 = and i32 %121, 15
  %144 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.01317, i64 0, i32 6
  store i32 %143, i32* %144, align 8
  %145 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %146 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %145, i64 0, i32 6, i32 0, i64 0
  store i32 %110, i32* %146, align 4
  %147 = load i32, i32* %142, align 4
  %148 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %145, i64 0, i32 6, i32 0, i64 1
  store i32 %147, i32* %148, align 4
  %149 = load i32, i32* %144, align 8
  %150 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %145, i64 0, i32 6, i32 0, i64 2
  store i32 %149, i32* %150, align 4
  %151 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %152 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %151, i64 0, i32 5
  store i32 103, i32* %152, align 8
  %153 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %154 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %153, i64 0, i32 1
  %155 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %154, align 8
  tail call void %155(%struct.jpeg_common_struct* nonnull %88, i32 1) #4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %.37 = getelementptr inbounds i8, i8* %.59, i64 1
  %.3 = add i64 %.5, -1
  %156 = icmp slt i64 %indvars.iv.next, %96
  %157 = icmp eq i64 %.3, 0
  br i1 %156, label %97, label %._crit_edge30.loopexit

._crit_edge30.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %79
  %.37.lcssa = phi i8* [ %.3723, %79 ], [ %.37, %._crit_edge30.loopexit ]
  %.3.lcssa = phi i64 [ %.324, %79 ], [ %.3, %._crit_edge30.loopexit ]
  %.lcssa = phi i1 [ %91, %79 ], [ %157, %._crit_edge30.loopexit ]
  br i1 %.lcssa, label %158, label %166

; <label>:158:                                    ; preds = %._crit_edge30
  %159 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %160 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %159, align 8
  %161 = tail call i32 %160(%struct.jpeg_decompress_struct* nonnull %0) #4
  %162 = icmp eq i32 %161, 0
  br i1 %162, label %.loopexit15, label %163

; <label>:163:                                    ; preds = %158
  %164 = load i8*, i8** %4, align 8
  %165 = load i64, i64* %6, align 8
  br label %166

; <label>:166:                                    ; preds = %163, %._crit_edge30
  %.610 = phi i8* [ %164, %163 ], [ %.37.lcssa, %._crit_edge30 ]
  %.6 = phi i64 [ %165, %163 ], [ %.3.lcssa, %._crit_edge30 ]
  %167 = add i64 %.6, -1
  %168 = getelementptr inbounds i8, i8* %.610, i64 1
  %169 = load i8, i8* %.610, align 1
  %170 = zext i8 %169 to i32
  %171 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 68
  store i32 %170, i32* %171, align 4
  %172 = icmp eq i64 %167, 0
  br i1 %172, label %173, label %181

; <label>:173:                                    ; preds = %166
  %174 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %175 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %174, align 8
  %176 = tail call i32 %175(%struct.jpeg_decompress_struct* nonnull %0) #4
  %177 = icmp eq i32 %176, 0
  br i1 %177, label %.loopexit15, label %178

; <label>:178:                                    ; preds = %173
  %179 = load i8*, i8** %4, align 8
  %180 = load i64, i64* %6, align 8
  br label %181

; <label>:181:                                    ; preds = %178, %166
  %.711 = phi i8* [ %179, %178 ], [ %168, %166 ]
  %.7 = phi i64 [ %180, %178 ], [ %167, %166 ]
  %182 = add i64 %.7, -1
  %183 = getelementptr inbounds i8, i8* %.711, i64 1
  %184 = load i8, i8* %.711, align 1
  %185 = zext i8 %184 to i32
  %186 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 69
  store i32 %185, i32* %186, align 8
  %187 = icmp eq i64 %182, 0
  br i1 %187, label %188, label %196

; <label>:188:                                    ; preds = %181
  %189 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %190 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %189, align 8
  %191 = tail call i32 %190(%struct.jpeg_decompress_struct* nonnull %0) #4
  %192 = icmp eq i32 %191, 0
  br i1 %192, label %.loopexit15, label %193

; <label>:193:                                    ; preds = %188
  %194 = load i8*, i8** %4, align 8
  %195 = load i64, i64* %6, align 8
  br label %196

; <label>:196:                                    ; preds = %193, %181
  %.812 = phi i8* [ %194, %193 ], [ %183, %181 ]
  %.8 = phi i64 [ %195, %193 ], [ %182, %181 ]
  %197 = add i64 %.8, -1
  %198 = getelementptr inbounds i8, i8* %.812, i64 1
  %199 = load i8, i8* %.812, align 1
  %200 = zext i8 %199 to i32
  %201 = lshr i32 %200, 4
  %202 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 70
  store i32 %201, i32* %202, align 4
  %203 = and i32 %200, 15
  %204 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 71
  store i32 %203, i32* %204, align 8
  %205 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %206 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %205, i64 0, i32 6, i32 0, i64 0
  %207 = load i32, i32* %171, align 4
  store i32 %207, i32* %206, align 4
  %208 = load i32, i32* %186, align 8
  %209 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %205, i64 0, i32 6, i32 0, i64 1
  store i32 %208, i32* %209, align 4
  %210 = load i32, i32* %202, align 4
  %211 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %205, i64 0, i32 6, i32 0, i64 2
  store i32 %210, i32* %211, align 4
  %212 = load i32, i32* %204, align 8
  %213 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %205, i64 0, i32 6, i32 0, i64 3
  store i32 %212, i32* %213, align 4
  %214 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %215 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %214, i64 0, i32 5
  store i32 104, i32* %215, align 8
  %216 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %217 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %216, i64 0, i32 1
  %218 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %217, align 8
  tail call void %218(%struct.jpeg_common_struct* nonnull %88, i32 1) #4
  %219 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %220 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %219, i64 0, i32 7
  store i32 0, i32* %220, align 8
  %221 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 34
  %222 = load i32, i32* %221, align 4
  %223 = add nsw i32 %222, 1
  store i32 %223, i32* %221, align 4
  store i8* %198, i8** %4, align 8
  store i64 %197, i64* %6, align 8
  br label %.loopexit15

.loopexit15.loopexit:                             ; preds = %99, %112
  br label %.loopexit15

.loopexit15:                                      ; preds = %.loopexit15.loopexit, %188, %173, %158, %53, %38, %23, %196
  %.0 = phi i32 [ 1, %196 ], [ 0, %23 ], [ 0, %38 ], [ 0, %53 ], [ 0, %158 ], [ 0, %173 ], [ 0, %188 ], [ 0, %.loopexit15.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @get_dac(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %3 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 1
  %5 = load i64, i64* %4, align 8
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %7, label %14

; <label>:7:                                      ; preds = %1
  %8 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %9 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %8, align 8
  %10 = tail call i32 %9(%struct.jpeg_decompress_struct* nonnull %0) #4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %.loopexit, label %12

; <label>:12:                                     ; preds = %7
  %13 = load i64, i64* %4, align 8
  br label %14

; <label>:14:                                     ; preds = %12, %1
  %.01 = phi i64 [ %13, %12 ], [ %5, %1 ]
  %.03.in = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 0
  %.03 = load i8*, i8** %.03.in, align 8
  %15 = add i64 %.01, -1
  %16 = getelementptr inbounds i8, i8* %.03, i64 1
  %17 = load i8, i8* %.03, align 1
  %18 = zext i8 %17 to i64
  %19 = shl nuw nsw i64 %18, 8
  %20 = icmp eq i64 %15, 0
  br i1 %20, label %21, label %29

; <label>:21:                                     ; preds = %14
  %22 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %23 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %22, align 8
  %24 = tail call i32 %23(%struct.jpeg_decompress_struct* nonnull %0) #4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %.loopexit, label %26

; <label>:26:                                     ; preds = %21
  %27 = load i8*, i8** %.03.in, align 8
  %28 = load i64, i64* %4, align 8
  br label %29

; <label>:29:                                     ; preds = %14, %26
  %.14 = phi i8* [ %27, %26 ], [ %16, %14 ]
  %.1 = phi i64 [ %28, %26 ], [ %15, %14 ]
  %30 = load i8, i8* %.14, align 1
  %31 = zext i8 %30 to i64
  %32 = or i64 %31, %19
  %.2511 = getelementptr inbounds i8, i8* %.14, i64 1
  %.212 = add i64 %.1, -1
  %33 = icmp ugt i64 %32, 2
  br i1 %33, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %29
  %34 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %35 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %37 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  br label %38

; <label>:38:                                     ; preds = %.lr.ph, %.backedge
  %.215 = phi i64 [ %.212, %.lr.ph ], [ %.2, %.backedge ]
  %.2514 = phi i8* [ %.2511, %.lr.ph ], [ %.25, %.backedge ]
  %.0213.in = phi i64 [ %32, %.lr.ph ], [ %.0213, %.backedge ]
  %.0213 = add nsw i64 %.0213.in, -2
  %39 = icmp eq i64 %.215, 0
  br i1 %39, label %40, label %47

; <label>:40:                                     ; preds = %38
  %41 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %34, align 8
  %42 = tail call i32 %41(%struct.jpeg_decompress_struct* nonnull %0) #4
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %.loopexit.loopexit, label %44

; <label>:44:                                     ; preds = %40
  %45 = load i8*, i8** %.03.in, align 8
  %46 = load i64, i64* %4, align 8
  br label %47

; <label>:47:                                     ; preds = %44, %38
  %.36 = phi i8* [ %45, %44 ], [ %.2514, %38 ]
  %.3 = phi i64 [ %46, %44 ], [ %.215, %38 ]
  %48 = add i64 %.3, -1
  %49 = getelementptr inbounds i8, i8* %.36, i64 1
  %50 = load i8, i8* %.36, align 1
  %51 = zext i8 %50 to i32
  %52 = icmp eq i64 %48, 0
  br i1 %52, label %53, label %60

; <label>:53:                                     ; preds = %47
  %54 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %35, align 8
  %55 = tail call i32 %54(%struct.jpeg_decompress_struct* %0) #4
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %.loopexit.loopexit, label %57

; <label>:57:                                     ; preds = %53
  %58 = load i8*, i8** %.03.in, align 8
  %59 = load i64, i64* %4, align 8
  br label %60

; <label>:60:                                     ; preds = %57, %47
  %.47 = phi i8* [ %58, %57 ], [ %49, %47 ]
  %.4 = phi i64 [ %59, %57 ], [ %48, %47 ]
  %61 = load i8, i8* %.47, align 1
  %62 = zext i8 %61 to i32
  %63 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %64 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %63, i64 0, i32 5
  store i32 78, i32* %64, align 8
  %65 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %66 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %65, i64 0, i32 6, i32 0, i64 0
  store i32 %51, i32* %66, align 4
  %67 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %68 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %67, i64 0, i32 6, i32 0, i64 1
  store i32 %62, i32* %68, align 4
  %69 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %70 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %69, i64 0, i32 1
  %71 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %70, align 8
  tail call void %71(%struct.jpeg_common_struct* %37, i32 1) #4
  %72 = icmp ugt i8 %50, 31
  br i1 %72, label %.thread, label %80

.thread:                                          ; preds = %60
  %73 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %74 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %73, i64 0, i32 5
  store i32 26, i32* %74, align 8
  %75 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %76 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %75, i64 0, i32 6, i32 0, i64 0
  store i32 %51, i32* %76, align 4
  %77 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %78 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %77, i64 0, i32 0
  %79 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %78, align 8
  tail call void %79(%struct.jpeg_common_struct* nonnull %37) #4
  br label %82

; <label>:80:                                     ; preds = %60
  %81 = icmp ugt i8 %50, 15
  br i1 %81, label %82, label %86

; <label>:82:                                     ; preds = %.thread, %80
  %83 = add nsw i32 %51, -16
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 48, i64 %84
  store i8 %61, i8* %85, align 1
  br label %.backedge

; <label>:86:                                     ; preds = %80
  %87 = and i8 %61, 15
  %88 = zext i8 %50 to i64
  %89 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 46, i64 %88
  store i8 %87, i8* %89, align 1
  %90 = lshr i8 %61, 4
  %91 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 47, i64 %88
  store i8 %90, i8* %91, align 1
  %92 = icmp ugt i8 %87, %90
  br i1 %92, label %94, label %.backedge

.backedge:                                        ; preds = %86, %94, %82
  %.25 = getelementptr inbounds i8, i8* %.47, i64 1
  %.2 = add i64 %.4, -1
  %93 = icmp sgt i64 %.0213, 2
  br i1 %93, label %38, label %._crit_edge.loopexit

; <label>:94:                                     ; preds = %86
  %95 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %96 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %95, i64 0, i32 5
  store i32 27, i32* %96, align 8
  %97 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %98 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %97, i64 0, i32 6, i32 0, i64 0
  store i32 %62, i32* %98, align 4
  %99 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %100 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %99, i64 0, i32 0
  %101 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %100, align 8
  tail call void %101(%struct.jpeg_common_struct* nonnull %37) #4
  br label %.backedge

._crit_edge.loopexit:                             ; preds = %.backedge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %29
  %.25.lcssa = phi i8* [ %.2511, %29 ], [ %.25, %._crit_edge.loopexit ]
  %.2.lcssa = phi i64 [ %.212, %29 ], [ %.2, %._crit_edge.loopexit ]
  store i8* %.25.lcssa, i8** %.03.in, align 8
  store i64 %.2.lcssa, i64* %4, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %40, %53
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %21, %7, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %7 ], [ 0, %21 ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @get_dht(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = alloca [17 x i8], align 16
  %3 = alloca [256 x i8], align 16
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %5 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 1
  %7 = load i64, i64* %6, align 8
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %9, label %16

; <label>:9:                                      ; preds = %1
  %10 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 3
  %11 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %10, align 8
  %12 = tail call i32 %11(%struct.jpeg_decompress_struct* nonnull %0) #4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %.loopexit, label %14

; <label>:14:                                     ; preds = %9
  %15 = load i64, i64* %6, align 8
  br label %16

; <label>:16:                                     ; preds = %14, %1
  %.01 = phi i64 [ %15, %14 ], [ %7, %1 ]
  %.08.in = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 0
  %.08 = load i8*, i8** %.08.in, align 8
  %17 = add i64 %.01, -1
  %18 = getelementptr inbounds i8, i8* %.08, i64 1
  %19 = load i8, i8* %.08, align 1
  %20 = zext i8 %19 to i64
  %21 = shl nuw nsw i64 %20, 8
  %22 = icmp eq i64 %17, 0
  br i1 %22, label %23, label %31

; <label>:23:                                     ; preds = %16
  %24 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 3
  %25 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %24, align 8
  %26 = tail call i32 %25(%struct.jpeg_decompress_struct* nonnull %0) #4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %.loopexit, label %28

; <label>:28:                                     ; preds = %23
  %29 = load i8*, i8** %.08.in, align 8
  %30 = load i64, i64* %6, align 8
  br label %31

; <label>:31:                                     ; preds = %16, %28
  %.19 = phi i8* [ %29, %28 ], [ %18, %16 ]
  %.1 = phi i64 [ %30, %28 ], [ %17, %16 ]
  %32 = load i8, i8* %.19, align 1
  %33 = zext i8 %32 to i64
  %34 = or i64 %33, %21
  %35 = getelementptr inbounds i8, i8* %.19, i64 1
  %36 = add i64 %.1, -1
  %37 = icmp ugt i64 %34, 2
  br i1 %37, label %.lr.ph45, label %._crit_edge46

.lr.ph45:                                         ; preds = %31
  %38 = add nsw i64 %34, -2
  %39 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 3
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %41 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %42 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 0
  %43 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 3
  %44 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 1
  %45 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 2
  %46 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 3
  %47 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 4
  %48 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 5
  %49 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 6
  %50 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 7
  %51 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 8
  %52 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 9
  %53 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 10
  %54 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 11
  %55 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 12
  %56 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 13
  %57 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 14
  %58 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 15
  %59 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 16
  %60 = getelementptr inbounds [256 x i8], [256 x i8]* %3, i64 0, i64 0
  %61 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %5, i64 0, i32 3
  br label %62

; <label>:62:                                     ; preds = %.lr.ph45, %205
  %.243 = phi i64 [ %36, %.lr.ph45 ], [ %.6.lcssa, %205 ]
  %.0242 = phi i64 [ %38, %.lr.ph45 ], [ %183, %205 ]
  %.21041 = phi i8* [ %35, %.lr.ph45 ], [ %.614.lcssa, %205 ]
  %63 = icmp eq i64 %.243, 0
  br i1 %63, label %64, label %71

; <label>:64:                                     ; preds = %62
  %65 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %39, align 8
  %66 = tail call i32 %65(%struct.jpeg_decompress_struct* %0) #4
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %.loopexit.loopexit64, label %68

; <label>:68:                                     ; preds = %64
  %69 = load i8*, i8** %.08.in, align 8
  %70 = load i64, i64* %6, align 8
  br label %71

; <label>:71:                                     ; preds = %68, %62
  %.311 = phi i8* [ %69, %68 ], [ %.21041, %62 ]
  %.3 = phi i64 [ %70, %68 ], [ %.243, %62 ]
  %72 = load i8, i8* %.311, align 1
  %73 = zext i8 %72 to i32
  %74 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %75 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %74, i64 0, i32 5
  store i32 79, i32* %75, align 8
  %76 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %77 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %76, i64 0, i32 6, i32 0, i64 0
  store i32 %73, i32* %77, align 4
  %78 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %79 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %78, i64 0, i32 1
  %80 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %79, align 8
  tail call void %80(%struct.jpeg_common_struct* %41, i32 1) #4
  store i8 0, i8* %42, align 16
  %.41231 = getelementptr inbounds i8, i8* %.311, i64 1
  %.432 = add i64 %.3, -1
  br label %81

; <label>:81:                                     ; preds = %71, %90
  %indvars.iv = phi i64 [ 1, %71 ], [ %indvars.iv.next, %90 ]
  %.436 = phi i64 [ %.432, %71 ], [ %.4, %90 ]
  %.41235 = phi i8* [ %.41231, %71 ], [ %.412, %90 ]
  %.0633 = phi i32 [ 0, %71 ], [ %94, %90 ]
  %82 = icmp eq i64 %.436, 0
  br i1 %82, label %83, label %90

; <label>:83:                                     ; preds = %81
  %84 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %43, align 8
  %85 = tail call i32 %84(%struct.jpeg_decompress_struct* %0) #4
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %.loopexit.loopexit63, label %87

; <label>:87:                                     ; preds = %83
  %88 = load i8*, i8** %.08.in, align 8
  %89 = load i64, i64* %6, align 8
  br label %90

; <label>:90:                                     ; preds = %87, %81
  %.513 = phi i8* [ %88, %87 ], [ %.41235, %81 ]
  %.5 = phi i64 [ %89, %87 ], [ %.436, %81 ]
  %91 = load i8, i8* %.513, align 1
  %92 = getelementptr inbounds [17 x i8], [17 x i8]* %2, i64 0, i64 %indvars.iv
  store i8 %91, i8* %92, align 1
  %93 = zext i8 %91 to i32
  %94 = add nsw i32 %93, %.0633
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %.412 = getelementptr inbounds i8, i8* %.513, i64 1
  %.4 = add i64 %.5, -1
  %95 = icmp slt i64 %indvars.iv.next, 17
  br i1 %95, label %81, label %96

; <label>:96:                                     ; preds = %90
  %97 = add nsw i64 %.0242, -17
  %98 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %99 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i64 0, i32 6, i32 0, i64 0
  %100 = load i8, i8* %44, align 1
  %101 = zext i8 %100 to i32
  store i32 %101, i32* %99, align 4
  %102 = load i8, i8* %45, align 2
  %103 = zext i8 %102 to i32
  %104 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i64 0, i32 6, i32 0, i64 1
  store i32 %103, i32* %104, align 4
  %105 = load i8, i8* %46, align 1
  %106 = zext i8 %105 to i32
  %107 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i64 0, i32 6, i32 0, i64 2
  store i32 %106, i32* %107, align 4
  %108 = load i8, i8* %47, align 4
  %109 = zext i8 %108 to i32
  %110 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i64 0, i32 6, i32 0, i64 3
  store i32 %109, i32* %110, align 4
  %111 = load i8, i8* %48, align 1
  %112 = zext i8 %111 to i32
  %113 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i64 0, i32 6, i32 0, i64 4
  store i32 %112, i32* %113, align 4
  %114 = load i8, i8* %49, align 2
  %115 = zext i8 %114 to i32
  %116 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i64 0, i32 6, i32 0, i64 5
  store i32 %115, i32* %116, align 4
  %117 = load i8, i8* %50, align 1
  %118 = zext i8 %117 to i32
  %119 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i64 0, i32 6, i32 0, i64 6
  store i32 %118, i32* %119, align 4
  %120 = load i8, i8* %51, align 8
  %121 = zext i8 %120 to i32
  %122 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i64 0, i32 6, i32 0, i64 7
  store i32 %121, i32* %122, align 4
  %123 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %124 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %123, i64 0, i32 5
  store i32 85, i32* %124, align 8
  %125 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %126 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %125, i64 0, i32 1
  %127 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %126, align 8
  tail call void %127(%struct.jpeg_common_struct* %41, i32 2) #4
  %128 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %129 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %128, i64 0, i32 6, i32 0, i64 0
  %130 = load i8, i8* %52, align 1
  %131 = zext i8 %130 to i32
  store i32 %131, i32* %129, align 4
  %132 = load i8, i8* %53, align 2
  %133 = zext i8 %132 to i32
  %134 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %128, i64 0, i32 6, i32 0, i64 1
  store i32 %133, i32* %134, align 4
  %135 = load i8, i8* %54, align 1
  %136 = zext i8 %135 to i32
  %137 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %128, i64 0, i32 6, i32 0, i64 2
  store i32 %136, i32* %137, align 4
  %138 = load i8, i8* %55, align 4
  %139 = zext i8 %138 to i32
  %140 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %128, i64 0, i32 6, i32 0, i64 3
  store i32 %139, i32* %140, align 4
  %141 = load i8, i8* %56, align 1
  %142 = zext i8 %141 to i32
  %143 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %128, i64 0, i32 6, i32 0, i64 4
  store i32 %142, i32* %143, align 4
  %144 = load i8, i8* %57, align 2
  %145 = zext i8 %144 to i32
  %146 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %128, i64 0, i32 6, i32 0, i64 5
  store i32 %145, i32* %146, align 4
  %147 = load i8, i8* %58, align 1
  %148 = zext i8 %147 to i32
  %149 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %128, i64 0, i32 6, i32 0, i64 6
  store i32 %148, i32* %149, align 4
  %150 = load i8, i8* %59, align 16
  %151 = zext i8 %150 to i32
  %152 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %128, i64 0, i32 6, i32 0, i64 7
  store i32 %151, i32* %152, align 4
  %153 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %154 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %153, i64 0, i32 5
  store i32 85, i32* %154, align 8
  %155 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %156 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %155, i64 0, i32 1
  %157 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %156, align 8
  tail call void %157(%struct.jpeg_common_struct* %41, i32 2) #4
  %158 = icmp sgt i32 %94, 256
  %159 = sext i32 %94 to i64
  %160 = icmp slt i64 %97, %159
  %or.cond = or i1 %158, %160
  br i1 %or.cond, label %161, label %.preheader

; <label>:161:                                    ; preds = %96
  %162 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %163 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %162, i64 0, i32 5
  store i32 28, i32* %163, align 8
  %164 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %165 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %164, i64 0, i32 0
  %166 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %165, align 8
  tail call void %166(%struct.jpeg_common_struct* nonnull %41) #4
  br label %.preheader

.preheader:                                       ; preds = %96, %161
  %167 = icmp sgt i32 %94, 0
  br i1 %167, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %168 = sext i32 %94 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %177
  %indvars.iv53 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next54, %177 ]
  %.639 = phi i64 [ %.4, %.lr.ph.preheader ], [ %178, %177 ]
  %.61437 = phi i8* [ %.412, %.lr.ph.preheader ], [ %179, %177 ]
  %169 = icmp eq i64 %.639, 0
  br i1 %169, label %170, label %177

; <label>:170:                                    ; preds = %.lr.ph
  %171 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %61, align 8
  %172 = tail call i32 %171(%struct.jpeg_decompress_struct* %0) #4
  %173 = icmp eq i32 %172, 0
  br i1 %173, label %.loopexit.loopexit, label %174

; <label>:174:                                    ; preds = %170
  %175 = load i8*, i8** %.08.in, align 8
  %176 = load i64, i64* %6, align 8
  br label %177

; <label>:177:                                    ; preds = %174, %.lr.ph
  %.715 = phi i8* [ %175, %174 ], [ %.61437, %.lr.ph ]
  %.7 = phi i64 [ %176, %174 ], [ %.639, %.lr.ph ]
  %178 = add i64 %.7, -1
  %179 = getelementptr inbounds i8, i8* %.715, i64 1
  %180 = load i8, i8* %.715, align 1
  %181 = getelementptr inbounds [256 x i8], [256 x i8]* %3, i64 0, i64 %indvars.iv53
  store i8 %180, i8* %181, align 1
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %182 = icmp slt i64 %indvars.iv.next54, %168
  br i1 %182, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %177
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.614.lcssa = phi i8* [ %.412, %.preheader ], [ %179, %._crit_edge.loopexit ]
  %.6.lcssa = phi i64 [ %.4, %.preheader ], [ %178, %._crit_edge.loopexit ]
  %183 = sub nsw i64 %97, %159
  %184 = and i32 %73, 16
  %185 = icmp eq i32 %184, 0
  %186 = add nsw i32 %73, -16
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 41, i64 %187
  %189 = zext i8 %72 to i64
  %190 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 40, i64 %189
  %.07 = select i1 %185, %struct.JHUFF_TBL** %190, %struct.JHUFF_TBL** %188
  %.05 = select i1 %185, i32 %73, i32 %186
  %191 = icmp ugt i32 %.05, 3
  br i1 %191, label %192, label %200

; <label>:192:                                    ; preds = %._crit_edge
  %193 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %194 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %193, i64 0, i32 5
  store i32 29, i32* %194, align 8
  %195 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %196 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %195, i64 0, i32 6, i32 0, i64 0
  store i32 %.05, i32* %196, align 4
  %197 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %198 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %197, i64 0, i32 0
  %199 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %198, align 8
  tail call void %199(%struct.jpeg_common_struct* %41) #4
  br label %200

; <label>:200:                                    ; preds = %._crit_edge, %192
  %201 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %.07, align 8
  %202 = icmp eq %struct.JHUFF_TBL* %201, null
  br i1 %202, label %203, label %205

; <label>:203:                                    ; preds = %200
  %204 = tail call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* %41) #4
  store %struct.JHUFF_TBL* %204, %struct.JHUFF_TBL** %.07, align 8
  br label %205

; <label>:205:                                    ; preds = %203, %200
  %206 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %.07, align 8
  %207 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %206, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %207, i8* nonnull %42, i64 17, i32 4, i1 false)
  %208 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %.07, align 8
  %209 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %208, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %209, i8* nonnull %60, i64 256, i32 1, i1 false)
  %210 = icmp sgt i64 %183, 0
  br i1 %210, label %62, label %._crit_edge46.loopexit

._crit_edge46.loopexit:                           ; preds = %205
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %31
  %.210.lcssa = phi i8* [ %35, %31 ], [ %.614.lcssa, %._crit_edge46.loopexit ]
  %.2.lcssa = phi i64 [ %36, %31 ], [ %.6.lcssa, %._crit_edge46.loopexit ]
  store i8* %.210.lcssa, i8** %.08.in, align 8
  store i64 %.2.lcssa, i64* %6, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %170
  br label %.loopexit

.loopexit.loopexit63:                             ; preds = %83
  br label %.loopexit

.loopexit.loopexit64:                             ; preds = %64
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit64, %.loopexit.loopexit63, %.loopexit.loopexit, %23, %9, %._crit_edge46
  %.0 = phi i32 [ 1, %._crit_edge46 ], [ 0, %9 ], [ 0, %23 ], [ 0, %.loopexit.loopexit ], [ 0, %.loopexit.loopexit63 ], [ 0, %.loopexit.loopexit64 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @get_dqt(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %3 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 1
  %5 = load i64, i64* %4, align 8
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %7, label %14

; <label>:7:                                      ; preds = %1
  %8 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %9 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %8, align 8
  %10 = tail call i32 %9(%struct.jpeg_decompress_struct* nonnull %0) #4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %.loopexit16, label %12

; <label>:12:                                     ; preds = %7
  %13 = load i64, i64* %4, align 8
  br label %14

; <label>:14:                                     ; preds = %12, %1
  %.01 = phi i64 [ %13, %12 ], [ %5, %1 ]
  %.06.in = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 0
  %.06 = load i8*, i8** %.06.in, align 8
  %15 = add i64 %.01, -1
  %16 = getelementptr inbounds i8, i8* %.06, i64 1
  %17 = load i8, i8* %.06, align 1
  %18 = zext i8 %17 to i64
  %19 = shl nuw nsw i64 %18, 8
  %20 = icmp eq i64 %15, 0
  br i1 %20, label %21, label %29

; <label>:21:                                     ; preds = %14
  %22 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %23 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %22, align 8
  %24 = tail call i32 %23(%struct.jpeg_decompress_struct* nonnull %0) #4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %.loopexit16, label %26

; <label>:26:                                     ; preds = %21
  %27 = load i8*, i8** %.06.in, align 8
  %28 = load i64, i64* %4, align 8
  br label %29

; <label>:29:                                     ; preds = %14, %26
  %.17 = phi i8* [ %27, %26 ], [ %16, %14 ]
  %.1 = phi i64 [ %28, %26 ], [ %15, %14 ]
  %30 = load i8, i8* %.17, align 1
  %31 = zext i8 %30 to i64
  %32 = or i64 %31, %19
  %33 = getelementptr inbounds i8, i8* %.17, i64 1
  %34 = add i64 %.1, -1
  %35 = icmp ugt i64 %32, 2
  br i1 %35, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %29
  %36 = add nsw i64 %32, -2
  %37 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %39 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %40 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %41 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %42 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  br label %43

; <label>:43:                                     ; preds = %.lr.ph, %.loopexit
  %.232 = phi i64 [ %34, %.lr.ph ], [ %.4.lcssa, %.loopexit ]
  %.0231 = phi i64 [ %36, %.lr.ph ], [ %., %.loopexit ]
  %.2830 = phi i8* [ %33, %.lr.ph ], [ %.410.lcssa, %.loopexit ]
  %44 = icmp eq i64 %.232, 0
  br i1 %44, label %45, label %52

; <label>:45:                                     ; preds = %43
  %46 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %37, align 8
  %47 = tail call i32 %46(%struct.jpeg_decompress_struct* nonnull %0) #4
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %.loopexit16.loopexit55, label %49

; <label>:49:                                     ; preds = %45
  %50 = load i8*, i8** %.06.in, align 8
  %51 = load i64, i64* %4, align 8
  br label %52

; <label>:52:                                     ; preds = %49, %43
  %.39 = phi i8* [ %50, %49 ], [ %.2830, %43 ]
  %.3 = phi i64 [ %51, %49 ], [ %.232, %43 ]
  %53 = load i8, i8* %.39, align 1
  %54 = zext i8 %53 to i32
  %55 = lshr i32 %54, 4
  %56 = and i32 %54, 15
  %57 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %58 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %57, i64 0, i32 5
  store i32 80, i32* %58, align 8
  %59 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %60 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %59, i64 0, i32 6, i32 0, i64 0
  store i32 %56, i32* %60, align 4
  %61 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %62 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %61, i64 0, i32 6, i32 0, i64 1
  store i32 %55, i32* %62, align 4
  %63 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %64 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %63, i64 0, i32 1
  %65 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %64, align 8
  tail call void %65(%struct.jpeg_common_struct* %39, i32 1) #4
  %66 = icmp ugt i32 %56, 3
  br i1 %66, label %67, label %75

; <label>:67:                                     ; preds = %52
  %68 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %69 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %68, i64 0, i32 5
  store i32 30, i32* %69, align 8
  %70 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %71 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %70, i64 0, i32 6, i32 0, i64 0
  store i32 %56, i32* %71, align 4
  %72 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %73 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %72, i64 0, i32 0
  %74 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %73, align 8
  tail call void %74(%struct.jpeg_common_struct* nonnull %39) #4
  br label %75

; <label>:75:                                     ; preds = %67, %52
  %76 = zext i32 %56 to i64
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 39, i64 %76
  %78 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %77, align 8
  %79 = icmp eq %struct.JQUANT_TBL* %78, null
  br i1 %79, label %80, label %82

; <label>:80:                                     ; preds = %75
  %81 = tail call %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct* nonnull %39) #4
  store %struct.JQUANT_TBL* %81, %struct.JQUANT_TBL** %77, align 8
  br label %82

; <label>:82:                                     ; preds = %80, %75
  %83 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %77, align 8
  %.41024 = getelementptr inbounds i8, i8* %.39, i64 1
  %.425 = add i64 %.3, -1
  %84 = icmp eq i32 %55, 0
  br i1 %84, label %.split.us.preheader, label %.split.preheader

.split.preheader:                                 ; preds = %82
  br label %.split

.split.us.preheader:                              ; preds = %82
  br label %.split.us

.split.us:                                        ; preds = %.split.us.preheader, %93
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %93 ], [ 0, %.split.us.preheader ]
  %.428.us = phi i64 [ %.4.us, %93 ], [ %.425, %.split.us.preheader ]
  %.41027.us = phi i8* [ %.410.us, %93 ], [ %.41024, %.split.us.preheader ]
  %85 = icmp eq i64 %.428.us, 0
  br i1 %85, label %86, label %93

; <label>:86:                                     ; preds = %.split.us
  %87 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %40, align 8
  %88 = tail call i32 %87(%struct.jpeg_decompress_struct* %0) #4
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %.loopexit16.loopexit, label %90

; <label>:90:                                     ; preds = %86
  %91 = load i8*, i8** %.06.in, align 8
  %92 = load i64, i64* %4, align 8
  br label %93

; <label>:93:                                     ; preds = %90, %.split.us
  %.713.us = phi i8* [ %91, %90 ], [ %.41027.us, %.split.us ]
  %.7.us = phi i64 [ %92, %90 ], [ %.428.us, %.split.us ]
  %94 = load i8, i8* %.713.us, align 1
  %95 = zext i8 %94 to i16
  %96 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv39
  %97 = load i32, i32* %96, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %83, i64 0, i32 0, i64 %98
  store i16 %95, i16* %99, align 2
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %.410.us = getelementptr inbounds i8, i8* %.713.us, i64 1
  %.4.us = add i64 %.7.us, -1
  %100 = icmp slt i64 %indvars.iv.next40, 64
  br i1 %100, label %.split.us, label %.us-lcssa.us.loopexit

.split:                                           ; preds = %.split.preheader, %123
  %indvars.iv = phi i64 [ %indvars.iv.next, %123 ], [ 0, %.split.preheader ]
  %.428 = phi i64 [ %.4, %123 ], [ %.425, %.split.preheader ]
  %.41027 = phi i8* [ %.410, %123 ], [ %.41024, %.split.preheader ]
  %101 = icmp eq i64 %.428, 0
  br i1 %101, label %102, label %109

; <label>:102:                                    ; preds = %.split
  %103 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %41, align 8
  %104 = tail call i32 %103(%struct.jpeg_decompress_struct* %0) #4
  %105 = icmp eq i32 %104, 0
  br i1 %105, label %.loopexit16.loopexit53, label %106

; <label>:106:                                    ; preds = %102
  %107 = load i8*, i8** %.06.in, align 8
  %108 = load i64, i64* %4, align 8
  br label %109

; <label>:109:                                    ; preds = %106, %.split
  %.511 = phi i8* [ %107, %106 ], [ %.41027, %.split ]
  %.5 = phi i64 [ %108, %106 ], [ %.428, %.split ]
  %110 = add i64 %.5, -1
  %111 = getelementptr inbounds i8, i8* %.511, i64 1
  %112 = load i8, i8* %.511, align 1
  %113 = zext i8 %112 to i16
  %114 = shl nuw i16 %113, 8
  %115 = icmp eq i64 %110, 0
  br i1 %115, label %116, label %123

; <label>:116:                                    ; preds = %109
  %117 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %42, align 8
  %118 = tail call i32 %117(%struct.jpeg_decompress_struct* %0) #4
  %119 = icmp eq i32 %118, 0
  br i1 %119, label %.loopexit16.loopexit53, label %120

; <label>:120:                                    ; preds = %116
  %121 = load i8*, i8** %.06.in, align 8
  %122 = load i64, i64* %4, align 8
  br label %123

; <label>:123:                                    ; preds = %109, %120
  %.612 = phi i8* [ %121, %120 ], [ %111, %109 ]
  %.6 = phi i64 [ %122, %120 ], [ %110, %109 ]
  %124 = load i8, i8* %.612, align 1
  %125 = zext i8 %124 to i16
  %126 = or i16 %125, %114
  %127 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv
  %128 = load i32, i32* %127, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %83, i64 0, i32 0, i64 %129
  store i16 %126, i16* %130, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %.410 = getelementptr inbounds i8, i8* %.612, i64 1
  %.4 = add i64 %.6, -1
  %131 = icmp slt i64 %indvars.iv.next, 64
  br i1 %131, label %.split, label %.us-lcssa.us.loopexit54

.us-lcssa.us.loopexit:                            ; preds = %93
  br label %.us-lcssa.us

.us-lcssa.us.loopexit54:                          ; preds = %123
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit54, %.us-lcssa.us.loopexit
  %.410.lcssa = phi i8* [ %.410.us, %.us-lcssa.us.loopexit ], [ %.410, %.us-lcssa.us.loopexit54 ]
  %.4.lcssa = phi i64 [ %.4.us, %.us-lcssa.us.loopexit ], [ %.4, %.us-lcssa.us.loopexit54 ]
  %132 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %133 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %132, i64 0, i32 7
  %134 = load i32, i32* %133, align 4
  %135 = icmp sgt i32 %134, 1
  br i1 %135, label %.preheader.preheader, label %.loopexit

.preheader.preheader:                             ; preds = %.us-lcssa.us
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %.preheader ], [ 0, %.preheader.preheader ]
  %136 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %137 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 6, i32 0, i64 0
  %138 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %83, i64 0, i32 0, i64 %indvars.iv41
  %139 = load i16, i16* %138, align 2
  %140 = zext i16 %139 to i32
  store i32 %140, i32* %137, align 4
  %141 = or i64 %indvars.iv41, 1
  %142 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %83, i64 0, i32 0, i64 %141
  %143 = load i16, i16* %142, align 2
  %144 = zext i16 %143 to i32
  %145 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 6, i32 0, i64 1
  store i32 %144, i32* %145, align 4
  %146 = or i64 %indvars.iv41, 2
  %147 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %83, i64 0, i32 0, i64 %146
  %148 = load i16, i16* %147, align 2
  %149 = zext i16 %148 to i32
  %150 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 6, i32 0, i64 2
  store i32 %149, i32* %150, align 4
  %151 = or i64 %indvars.iv41, 3
  %152 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %83, i64 0, i32 0, i64 %151
  %153 = load i16, i16* %152, align 2
  %154 = zext i16 %153 to i32
  %155 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 6, i32 0, i64 3
  store i32 %154, i32* %155, align 4
  %156 = or i64 %indvars.iv41, 4
  %157 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %83, i64 0, i32 0, i64 %156
  %158 = load i16, i16* %157, align 2
  %159 = zext i16 %158 to i32
  %160 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 6, i32 0, i64 4
  store i32 %159, i32* %160, align 4
  %161 = or i64 %indvars.iv41, 5
  %162 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %83, i64 0, i32 0, i64 %161
  %163 = load i16, i16* %162, align 2
  %164 = zext i16 %163 to i32
  %165 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 6, i32 0, i64 5
  store i32 %164, i32* %165, align 4
  %166 = or i64 %indvars.iv41, 6
  %167 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %83, i64 0, i32 0, i64 %166
  %168 = load i16, i16* %167, align 2
  %169 = zext i16 %168 to i32
  %170 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 6, i32 0, i64 6
  store i32 %169, i32* %170, align 4
  %171 = or i64 %indvars.iv41, 7
  %172 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %83, i64 0, i32 0, i64 %171
  %173 = load i16, i16* %172, align 2
  %174 = zext i16 %173 to i32
  %175 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 6, i32 0, i64 7
  store i32 %174, i32* %175, align 4
  %176 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %177 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %176, i64 0, i32 5
  store i32 92, i32* %177, align 8
  %178 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %179 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %178, i64 0, i32 1
  %180 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %179, align 8
  tail call void %180(%struct.jpeg_common_struct* nonnull %39, i32 2) #4
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 8
  %181 = icmp slt i64 %indvars.iv.next42, 64
  br i1 %181, label %.preheader, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.us-lcssa.us
  %182 = icmp eq i32 %55, 0
  %..v = select i1 %182, i64 -65, i64 -129
  %. = add i64 %..v, %.0231
  %183 = icmp sgt i64 %., 0
  br i1 %183, label %43, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %29
  %.28.lcssa = phi i8* [ %33, %29 ], [ %.410.lcssa, %._crit_edge.loopexit ]
  %.2.lcssa = phi i64 [ %34, %29 ], [ %.4.lcssa, %._crit_edge.loopexit ]
  store i8* %.28.lcssa, i8** %.06.in, align 8
  store i64 %.2.lcssa, i64* %4, align 8
  br label %.loopexit16

.loopexit16.loopexit:                             ; preds = %86
  br label %.loopexit16

.loopexit16.loopexit53:                           ; preds = %102, %116
  br label %.loopexit16

.loopexit16.loopexit55:                           ; preds = %45
  br label %.loopexit16

.loopexit16:                                      ; preds = %.loopexit16.loopexit55, %.loopexit16.loopexit53, %.loopexit16.loopexit, %21, %7, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %7 ], [ 0, %21 ], [ 0, %.loopexit16.loopexit ], [ 0, %.loopexit16.loopexit53 ], [ 0, %.loopexit16.loopexit55 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @get_dri(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %3 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 1
  %5 = load i64, i64* %4, align 8
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %7, label %14

; <label>:7:                                      ; preds = %1
  %8 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %9 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %8, align 8
  %10 = tail call i32 %9(%struct.jpeg_decompress_struct* nonnull %0) #4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %85, label %12

; <label>:12:                                     ; preds = %7
  %13 = load i64, i64* %4, align 8
  br label %14

; <label>:14:                                     ; preds = %12, %1
  %.01 = phi i64 [ %13, %12 ], [ %5, %1 ]
  %.02.in = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 0
  %.02 = load i8*, i8** %.02.in, align 8
  %15 = add i64 %.01, -1
  %16 = getelementptr inbounds i8, i8* %.02, i64 1
  %17 = load i8, i8* %.02, align 1
  %18 = zext i8 %17 to i64
  %19 = shl nuw nsw i64 %18, 8
  %20 = icmp eq i64 %15, 0
  br i1 %20, label %21, label %29

; <label>:21:                                     ; preds = %14
  %22 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %23 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %22, align 8
  %24 = tail call i32 %23(%struct.jpeg_decompress_struct* nonnull %0) #4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %85, label %26

; <label>:26:                                     ; preds = %21
  %27 = load i8*, i8** %.02.in, align 8
  %28 = load i64, i64* %4, align 8
  br label %29

; <label>:29:                                     ; preds = %26, %14
  %.13 = phi i8* [ %27, %26 ], [ %16, %14 ]
  %.1 = phi i64 [ %28, %26 ], [ %15, %14 ]
  %30 = add i64 %.1, -1
  %31 = getelementptr inbounds i8, i8* %.13, i64 1
  %32 = load i8, i8* %.13, align 1
  %33 = zext i8 %32 to i64
  %34 = or i64 %33, %19
  %35 = icmp eq i64 %34, 4
  br i1 %35, label %44, label %36

; <label>:36:                                     ; preds = %29
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %38 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %37, align 8
  %39 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %38, i64 0, i32 5
  store i32 9, i32* %39, align 8
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %37, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i64 0, i32 0
  %42 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %41, align 8
  %43 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %42(%struct.jpeg_common_struct* %43) #4
  br label %44

; <label>:44:                                     ; preds = %36, %29
  %45 = icmp eq i64 %30, 0
  br i1 %45, label %46, label %54

; <label>:46:                                     ; preds = %44
  %47 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %48 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %47, align 8
  %49 = tail call i32 %48(%struct.jpeg_decompress_struct* nonnull %0) #4
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %85, label %51

; <label>:51:                                     ; preds = %46
  %52 = load i8*, i8** %.02.in, align 8
  %53 = load i64, i64* %4, align 8
  br label %54

; <label>:54:                                     ; preds = %51, %44
  %.24 = phi i8* [ %52, %51 ], [ %31, %44 ]
  %.2 = phi i64 [ %53, %51 ], [ %30, %44 ]
  %55 = add i64 %.2, -1
  %56 = getelementptr inbounds i8, i8* %.24, i64 1
  %57 = load i8, i8* %.24, align 1
  %58 = zext i8 %57 to i32
  %59 = shl nuw nsw i32 %58, 8
  %60 = icmp eq i64 %55, 0
  br i1 %60, label %61, label %69

; <label>:61:                                     ; preds = %54
  %62 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %3, i64 0, i32 3
  %63 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %62, align 8
  %64 = tail call i32 %63(%struct.jpeg_decompress_struct* nonnull %0) #4
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %85, label %66

; <label>:66:                                     ; preds = %61
  %67 = load i8*, i8** %.02.in, align 8
  %68 = load i64, i64* %4, align 8
  br label %69

; <label>:69:                                     ; preds = %66, %54
  %.35 = phi i8* [ %67, %66 ], [ %56, %54 ]
  %.3 = phi i64 [ %68, %66 ], [ %55, %54 ]
  %70 = load i8, i8* %.35, align 1
  %71 = zext i8 %70 to i32
  %72 = or i32 %71, %59
  %73 = getelementptr inbounds i8, i8* %.35, i64 1
  %74 = add i64 %.3, -1
  %75 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %76 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %75, align 8
  %77 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %76, i64 0, i32 5
  store i32 81, i32* %77, align 8
  %78 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %75, align 8
  %79 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %78, i64 0, i32 6, i32 0, i64 0
  store i32 %72, i32* %79, align 4
  %80 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %75, align 8
  %81 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %80, i64 0, i32 1
  %82 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %81, align 8
  %83 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %82(%struct.jpeg_common_struct* %83, i32 1) #4
  %84 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 49
  store i32 %72, i32* %84, align 8
  store i8* %73, i8** %.02.in, align 8
  store i64 %74, i64* %4, align 8
  br label %85

; <label>:85:                                     ; preds = %61, %46, %21, %7, %69
  %.0 = phi i32 [ 1, %69 ], [ 0, %7 ], [ 0, %21 ], [ 0, %46 ], [ 0, %61 ]
  ret i32 %.0
}

declare %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct*) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

declare %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct*) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

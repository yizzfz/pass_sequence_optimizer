; ModuleID = 'jdapistd.ll'
source_filename = "jdapistd.c"
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
%struct.jpeg_source_mgr = type { i8*, i64, void (%struct.jpeg_decompress_struct*)*, {}*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*)* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.jpeg_decomp_master = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32 }
%struct.jpeg_d_main_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* }
%struct.jpeg_d_coef_controller = type { void (%struct.jpeg_decompress_struct*)*, {}*, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, i8***)*, %struct.jvirt_barray_control** }
%struct.jpeg_d_post_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* }
%struct.jpeg_input_controller = type { {}*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32, i32 }
%struct.jpeg_marker_reader = type { void (%struct.jpeg_decompress_struct*)*, {}*, {}*, {}*, [16 x {}*], i32, i32, i32, i32 }
%struct.jpeg_entropy_decoder = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* }
%struct.jpeg_inverse_dct = type { void (%struct.jpeg_decompress_struct*)*, [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*] }
%struct.jpeg_upsampler = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, i32 }
%struct.jpeg_color_deconverter = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* }
%struct.jpeg_color_quantizer = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)* }

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_start_decompress(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  switch i32 %3, label %48 [
    i32 202, label %4
    i32 203, label %9
    i32 204, label %59
  ]

; <label>:4:                                      ; preds = %1
  tail call void @jinit_master_decompress(%struct.jpeg_decompress_struct* nonnull %0) #2
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 14
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %.thread, label %8

; <label>:8:                                      ; preds = %4
  store i32 207, i32* %2, align 4
  br label %.loopexit

.thread:                                          ; preds = %4
  store i32 203, i32* %2, align 4
  br label %9

; <label>:9:                                      ; preds = %1, %.thread
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %11 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %11, i64 0, i32 4
  %13 = load i32, i32* %12, align 8
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %.loopexit1, label %.preheader

.preheader:                                       ; preds = %9
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 2
  %16 = bitcast %struct.jpeg_input_controller** %10 to i32 (%struct.jpeg_decompress_struct*)***
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 60
  %18 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  br label %.backedgethread-pre-split

.backedgethread-pre-split.loopexit:               ; preds = %31
  br label %.backedgethread-pre-split.backedge

.backedgethread-pre-split:                        ; preds = %.backedgethread-pre-split.backedge, %.preheader
  %.pr = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %15, align 8
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %.backedgethread-pre-split
  %19 = phi %struct.jpeg_progress_mgr* [ %.pr, %.backedgethread-pre-split ], [ %.be, %.backedge.backedge ]
  %20 = icmp eq %struct.jpeg_progress_mgr* %19, null
  br i1 %20, label %24, label %21

; <label>:21:                                     ; preds = %.backedge
  %22 = bitcast %struct.jpeg_progress_mgr* %19 to void (%struct.jpeg_common_struct*)**
  %23 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %22, align 8
  tail call void %23(%struct.jpeg_common_struct* nonnull %18) #2
  br label %24

; <label>:24:                                     ; preds = %.backedge, %21
  %25 = load i32 (%struct.jpeg_decompress_struct*)**, i32 (%struct.jpeg_decompress_struct*)*** %16, align 8
  %26 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %25, align 8
  %27 = tail call i32 %26(%struct.jpeg_decompress_struct* nonnull %0) #2
  switch i32 %27, label %28 [
    i32 0, label %.loopexit.loopexit
    i32 2, label %.loopexit1.loopexit
  ]

; <label>:28:                                     ; preds = %24
  %29 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %15, align 8
  %30 = icmp eq %struct.jpeg_progress_mgr* %29, null
  br i1 %30, label %.backedge.backedge, label %31

.backedge.backedge:                               ; preds = %28, %32
  %.be = phi %struct.jpeg_progress_mgr* [ %37, %32 ], [ null, %28 ]
  br label %.backedge

; <label>:31:                                     ; preds = %28
  switch i32 %27, label %.backedgethread-pre-split.loopexit [
    i32 3, label %32
    i32 1, label %32
  ]

; <label>:32:                                     ; preds = %31, %31
  %33 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %15, align 8
  %34 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %33, i64 0, i32 1
  %35 = load i64, i64* %34, align 8
  %36 = add nsw i64 %35, 1
  store i64 %36, i64* %34, align 8
  %37 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %15, align 8
  %38 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %37, i64 0, i32 2
  %39 = load i64, i64* %38, align 8
  %40 = icmp slt i64 %36, %39
  br i1 %40, label %.backedge.backedge, label %41

; <label>:41:                                     ; preds = %32
  %42 = load i32, i32* %17, align 8
  %43 = zext i32 %42 to i64
  %44 = add nsw i64 %43, %39
  store i64 %44, i64* %38, align 8
  br label %.backedgethread-pre-split.backedge

.backedgethread-pre-split.backedge:               ; preds = %41, %.backedgethread-pre-split.loopexit
  br label %.backedgethread-pre-split

.loopexit1.loopexit:                              ; preds = %24
  br label %.loopexit1

.loopexit1:                                       ; preds = %.loopexit1.loopexit, %9
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 34
  %46 = load i32, i32* %45, align 4
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 36
  store i32 %46, i32* %47, align 4
  br label %59

; <label>:48:                                     ; preds = %1
  %49 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %50 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %49, align 8
  %51 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %50, i64 0, i32 5
  store i32 18, i32* %51, align 8
  %52 = load i32, i32* %2, align 4
  %53 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %49, align 8
  %54 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %53, i64 0, i32 6, i32 0, i64 0
  store i32 %52, i32* %54, align 4
  %55 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %49, align 8
  %56 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %55, i64 0, i32 0
  %57 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %56, align 8
  %58 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %57(%struct.jpeg_common_struct* %58) #2
  br label %59

; <label>:59:                                     ; preds = %1, %48, %.loopexit1
  %60 = tail call i32 @output_pass_setup(%struct.jpeg_decompress_struct* nonnull %0)
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %24
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %59, %8
  %.0 = phi i32 [ 1, %8 ], [ %60, %59 ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

declare void @jinit_master_decompress(%struct.jpeg_decompress_struct*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @output_pass_setup(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 204
  br i1 %4, label %.preheader1, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 73
  %7 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %7, i64 0, i32 0
  %9 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %8, align 8
  tail call void %9(%struct.jpeg_decompress_struct* nonnull %0) #2
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 33
  store i32 0, i32* %10, align 8
  store i32 204, i32* %2, align 4
  br label %.preheader1

.preheader1:                                      ; preds = %5, %1
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 73
  %12 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %12, i64 0, i32 2
  %14 = load i32, i32* %13, align 8
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %._crit_edge, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader1
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 33
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 2
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %20 = bitcast %struct.jpeg_progress_mgr** %18 to void (%struct.jpeg_common_struct*)***
  %21 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %45
  br label %22

; <label>:22:                                     ; preds = %.preheader, %38
  %23 = load i32, i32* %16, align 8
  %24 = load i32, i32* %17, align 4
  %25 = icmp ult i32 %23, %24
  br i1 %25, label %26, label %45

; <label>:26:                                     ; preds = %22
  %27 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %18, align 8
  %28 = icmp eq %struct.jpeg_progress_mgr* %27, null
  br i1 %28, label %38, label %29

; <label>:29:                                     ; preds = %26
  %30 = zext i32 %23 to i64
  %31 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %27, i64 0, i32 1
  store i64 %30, i64* %31, align 8
  %32 = load i32, i32* %17, align 4
  %33 = zext i32 %32 to i64
  %34 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %18, align 8
  %35 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %34, i64 0, i32 2
  store i64 %33, i64* %35, align 8
  %36 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %20, align 8
  %37 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %36, align 8
  tail call void %37(%struct.jpeg_common_struct* nonnull %21) #2
  br label %38

; <label>:38:                                     ; preds = %26, %29
  %39 = load i32, i32* %16, align 8
  %40 = load %struct.jpeg_d_main_controller*, %struct.jpeg_d_main_controller** %19, align 8
  %41 = getelementptr inbounds %struct.jpeg_d_main_controller, %struct.jpeg_d_main_controller* %40, i64 0, i32 1
  %42 = load void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)** %41, align 8
  tail call void %42(%struct.jpeg_decompress_struct* nonnull %0, i8** null, i32* nonnull %16, i32 0) #2
  %43 = load i32, i32* %16, align 8
  %44 = icmp eq i32 %43, %39
  br i1 %44, label %.loopexit.loopexit, label %22

; <label>:45:                                     ; preds = %22
  %46 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %11, align 8
  %47 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %46, i64 0, i32 1
  %48 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %47, align 8
  tail call void %48(%struct.jpeg_decompress_struct* nonnull %0) #2
  %49 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %11, align 8
  %50 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %49, i64 0, i32 0
  %51 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %50, align 8
  tail call void %51(%struct.jpeg_decompress_struct* nonnull %0) #2
  store i32 0, i32* %16, align 8
  %52 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %11, align 8
  %53 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %52, i64 0, i32 2
  %54 = load i32, i32* %53, align 8
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %._crit_edge.loopexit, label %.preheader

._crit_edge.loopexit:                             ; preds = %45
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader1
  %56 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 15
  %57 = load i32, i32* %56, align 4
  %58 = icmp ne i32 %57, 0
  %59 = select i1 %58, i32 206, i32 205
  store i32 %59, i32* %2, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %38
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_read_scanlines(%struct.jpeg_decompress_struct*, i8**, i32) #0 {
  %4 = alloca i32, align 4
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 205
  br i1 %7, label %19, label %8

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 5
  store i32 18, i32* %11, align 8
  %12 = load i32, i32* %5, align 4
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 6, i32 0, i64 0
  store i32 %12, i32* %14, align 4
  %15 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %16 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %15, i64 0, i32 0
  %17 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %16, align 8
  %18 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %17(%struct.jpeg_common_struct* %18) #2
  br label %19

; <label>:19:                                     ; preds = %3, %8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 33
  %21 = load i32, i32* %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %23 = load i32, i32* %22, align 4
  %24 = icmp ult i32 %21, %23
  br i1 %24, label %33, label %25

; <label>:25:                                     ; preds = %19
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i64 0, i32 5
  store i32 119, i32* %28, align 8
  %29 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %29, i64 0, i32 1
  %31 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %30, align 8
  %32 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %31(%struct.jpeg_common_struct* %32, i32 -1) #2
  br label %56

; <label>:33:                                     ; preds = %19
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 2
  %35 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %34, align 8
  %36 = icmp eq %struct.jpeg_progress_mgr* %35, null
  br i1 %36, label %48, label %37

; <label>:37:                                     ; preds = %33
  %38 = zext i32 %21 to i64
  %39 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %35, i64 0, i32 1
  store i64 %38, i64* %39, align 8
  %40 = load i32, i32* %22, align 4
  %41 = zext i32 %40 to i64
  %42 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %34, align 8
  %43 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %42, i64 0, i32 2
  store i64 %41, i64* %43, align 8
  %44 = bitcast %struct.jpeg_progress_mgr** %34 to void (%struct.jpeg_common_struct*)***
  %45 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %44, align 8
  %46 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %45, align 8
  %47 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %46(%struct.jpeg_common_struct* %47) #2
  br label %48

; <label>:48:                                     ; preds = %33, %37
  store i32 0, i32* %4, align 4
  %49 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %50 = load %struct.jpeg_d_main_controller*, %struct.jpeg_d_main_controller** %49, align 8
  %51 = getelementptr inbounds %struct.jpeg_d_main_controller, %struct.jpeg_d_main_controller* %50, i64 0, i32 1
  %52 = load void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)** %51, align 8
  call void %52(%struct.jpeg_decompress_struct* nonnull %0, i8** %1, i32* nonnull %4, i32 %2) #2
  %53 = load i32, i32* %4, align 4
  %54 = load i32, i32* %20, align 8
  %55 = add i32 %54, %53
  store i32 %55, i32* %20, align 8
  br label %56

; <label>:56:                                     ; preds = %48, %25
  %.0 = phi i32 [ 0, %25 ], [ %53, %48 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_read_raw_data(%struct.jpeg_decompress_struct*, i8***, i32) #0 {
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %5 = load i32, i32* %4, align 4
  %6 = icmp eq i32 %5, 206
  br i1 %6, label %18, label %7

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %9 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %9, i64 0, i32 5
  store i32 18, i32* %10, align 8
  %11 = load i32, i32* %4, align 4
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 6, i32 0, i64 0
  store i32 %11, i32* %13, align 4
  %14 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %15 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %14, i64 0, i32 0
  %16 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %15, align 8
  %17 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %16(%struct.jpeg_common_struct* %17) #2
  br label %18

; <label>:18:                                     ; preds = %3, %7
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 33
  %20 = load i32, i32* %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %22 = load i32, i32* %21, align 4
  %23 = icmp ult i32 %20, %22
  br i1 %23, label %32, label %24

; <label>:24:                                     ; preds = %18
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %26 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %26, i64 0, i32 5
  store i32 119, i32* %27, align 8
  %28 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %25, align 8
  %29 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %28, i64 0, i32 1
  %30 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %29, align 8
  %31 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %30(%struct.jpeg_common_struct* %31, i32 -1) #2
  br label %72

; <label>:32:                                     ; preds = %18
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 2
  %34 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %33, align 8
  %35 = icmp eq %struct.jpeg_progress_mgr* %34, null
  br i1 %35, label %47, label %36

; <label>:36:                                     ; preds = %32
  %37 = zext i32 %20 to i64
  %38 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %34, i64 0, i32 1
  store i64 %37, i64* %38, align 8
  %39 = load i32, i32* %21, align 4
  %40 = zext i32 %39 to i64
  %41 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %33, align 8
  %42 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %41, i64 0, i32 2
  store i64 %40, i64* %42, align 8
  %43 = bitcast %struct.jpeg_progress_mgr** %33 to void (%struct.jpeg_common_struct*)***
  %44 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %43, align 8
  %45 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %44, align 8
  %46 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %45(%struct.jpeg_common_struct* %46) #2
  br label %47

; <label>:47:                                     ; preds = %32, %36
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %49 = load i32, i32* %48, align 8
  %50 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %51 = load i32, i32* %50, align 4
  %52 = mul nsw i32 %51, %49
  %53 = icmp ugt i32 %52, %2
  br i1 %53, label %54, label %62

; <label>:54:                                     ; preds = %47
  %55 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %56 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %55, align 8
  %57 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %56, i64 0, i32 5
  store i32 21, i32* %57, align 8
  %58 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %55, align 8
  %59 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %58, i64 0, i32 0
  %60 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %59, align 8
  %61 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %60(%struct.jpeg_common_struct* %61) #2
  br label %62

; <label>:62:                                     ; preds = %54, %47
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %64 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %63, align 8
  %65 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %64, i64 0, i32 3
  %66 = load i32 (%struct.jpeg_decompress_struct*, i8***)*, i32 (%struct.jpeg_decompress_struct*, i8***)** %65, align 8
  %67 = tail call i32 %66(%struct.jpeg_decompress_struct* nonnull %0, i8*** %1) #2
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %72, label %69

; <label>:69:                                     ; preds = %62
  %70 = load i32, i32* %19, align 8
  %71 = add i32 %70, %52
  store i32 %71, i32* %19, align 8
  br label %72

; <label>:72:                                     ; preds = %62, %69, %24
  %.0 = phi i32 [ 0, %24 ], [ %52, %69 ], [ 0, %62 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_start_output(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %4 = load i32, i32* %3, align 4
  switch i32 %4, label %5 [
    i32 207, label %16
    i32 204, label %16
  ]

; <label>:5:                                      ; preds = %2
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %7 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %7, i64 0, i32 5
  store i32 18, i32* %8, align 8
  %9 = load i32, i32* %3, align 4
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 6, i32 0, i64 0
  store i32 %9, i32* %11, align 4
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 0
  %14 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %13, align 8
  %15 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %14(%struct.jpeg_common_struct* %15) #2
  br label %16

; <label>:16:                                     ; preds = %2, %2, %5
  %17 = icmp sgt i32 %1, 1
  %. = select i1 %17, i32 %1, i32 1
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %19 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %19, i64 0, i32 5
  %21 = load i32, i32* %20, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %27, label %23

; <label>:23:                                     ; preds = %16
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 34
  %25 = load i32, i32* %24, align 4
  %26 = icmp sgt i32 %., %25
  %.. = select i1 %26, i32 %25, i32 %.
  br label %27

; <label>:27:                                     ; preds = %16, %23
  %.1 = phi i32 [ %., %16 ], [ %.., %23 ]
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 36
  store i32 %.1, i32* %28, align 4
  %29 = tail call i32 @output_pass_setup(%struct.jpeg_decompress_struct* nonnull %0)
  ret i32 %29
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_finish_output(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  %.off = add i32 %3, -205
  %switch = icmp ult i32 %.off, 2
  br i1 %switch, label %4, label %13

; <label>:4:                                      ; preds = %1
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 14
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %thread-pre-split, label %8

; <label>:8:                                      ; preds = %4
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 73
  %10 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %10, i64 0, i32 1
  %12 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %11, align 8
  tail call void %12(%struct.jpeg_decompress_struct* nonnull %0) #2
  store i32 208, i32* %2, align 4
  br label %.preheader

thread-pre-split:                                 ; preds = %4
  %.pr = load i32, i32* %2, align 4
  br label %13

; <label>:13:                                     ; preds = %thread-pre-split, %1
  %14 = phi i32 [ %.pr, %thread-pre-split ], [ %3, %1 ]
  %15 = icmp eq i32 %14, 208
  br i1 %15, label %.preheader, label %16

; <label>:16:                                     ; preds = %13
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i64 0, i32 5
  store i32 18, i32* %19, align 8
  %20 = load i32, i32* %2, align 4
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i64 0, i32 6, i32 0, i64 0
  store i32 %20, i32* %22, align 4
  %23 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %24 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %23, i64 0, i32 0
  %25 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %24, align 8
  %26 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %25(%struct.jpeg_common_struct* %26) #2
  br label %.preheader

.preheader:                                       ; preds = %16, %8, %13
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 34
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 36
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  br label %30

; <label>:30:                                     ; preds = %.preheader, %39
  %31 = load i32, i32* %27, align 4
  %32 = load i32, i32* %28, align 4
  %33 = icmp sgt i32 %31, %32
  br i1 %33, label %.critedge, label %34

; <label>:34:                                     ; preds = %30
  %35 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %29, align 8
  %36 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %35, i64 0, i32 5
  %37 = load i32, i32* %36, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %.critedge

; <label>:39:                                     ; preds = %34
  %40 = bitcast %struct.jpeg_input_controller* %35 to i32 (%struct.jpeg_decompress_struct*)**
  %41 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %40, align 8
  %42 = tail call i32 %41(%struct.jpeg_decompress_struct* nonnull %0) #2
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %.loopexit.loopexit, label %30

.critedge:                                        ; preds = %30, %34
  store i32 207, i32* %2, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %39
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.critedge
  %.0 = phi i32 [ 1, %.critedge ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

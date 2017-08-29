; ModuleID = 'rdcolmap.ll'
source_filename = "rdcolmap.c"
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

; Function Attrs: noinline nounwind uwtable
define void @read_color_map(%struct.jpeg_decompress_struct*, %struct._IO_FILE* nocapture) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %4 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %4, i64 0, i32 2
  %6 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %5, align 8
  %7 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %8 = tail call i8** %6(%struct.jpeg_common_struct* %7, i32 1, i32 256, i32 3) #2
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  store i8** %8, i8*** %9, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 31
  store i32 0, i32* %10, align 4
  %11 = tail call i32 @_IO_getc(%struct._IO_FILE* %1)
  switch i32 %11, label %14 [
    i32 71, label %12
    i32 80, label %13
  ]

; <label>:12:                                     ; preds = %2
  tail call void @read_gif_map(%struct.jpeg_decompress_struct* nonnull %0, %struct._IO_FILE* %1)
  br label %21

; <label>:13:                                     ; preds = %2
  tail call void @read_ppm_map(%struct.jpeg_decompress_struct* nonnull %0, %struct._IO_FILE* %1)
  br label %21

; <label>:14:                                     ; preds = %2
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i64 0, i32 5
  store i32 1038, i32* %17, align 8
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i64 0, i32 0
  %20 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %19, align 8
  tail call void %20(%struct.jpeg_common_struct* %7) #2
  br label %21

; <label>:21:                                     ; preds = %14, %13, %12
  ret void
}

; Function Attrs: nounwind
declare i32 @_IO_getc(%struct._IO_FILE* nocapture) #1

; Function Attrs: noinline nounwind uwtable
define internal void @read_gif_map(%struct.jpeg_decompress_struct*, %struct._IO_FILE* nocapture) #0 {
  %3 = alloca [13 x i32], align 16
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %5 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  br label %6

; <label>:6:                                      ; preds = %2, %16
  %indvars.iv3 = phi i64 [ 1, %2 ], [ %indvars.iv.next, %16 ]
  %7 = tail call i32 @_IO_getc(%struct._IO_FILE* %1)
  %8 = getelementptr inbounds [13 x i32], [13 x i32]* %3, i64 0, i64 %indvars.iv3
  store i32 %7, i32* %8, align 4
  %9 = icmp eq i32 %7, -1
  br i1 %9, label %10, label %16

; <label>:10:                                     ; preds = %6
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %4, align 8
  %12 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 5
  store i32 1038, i32* %12, align 8
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %4, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 0
  %15 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %14, align 8
  tail call void %15(%struct.jpeg_common_struct* %5) #2
  br label %16

; <label>:16:                                     ; preds = %6, %10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 13
  br i1 %exitcond, label %17, label %6

; <label>:17:                                     ; preds = %16
  %18 = getelementptr inbounds [13 x i32], [13 x i32]* %3, i64 0, i64 1
  %19 = load i32, i32* %18, align 4
  %20 = icmp eq i32 %19, 73
  br i1 %20, label %21, label %25

; <label>:21:                                     ; preds = %17
  %22 = getelementptr inbounds [13 x i32], [13 x i32]* %3, i64 0, i64 2
  %23 = load i32, i32* %22, align 8
  %24 = icmp eq i32 %23, 70
  br i1 %24, label %33, label %25

; <label>:25:                                     ; preds = %21, %17
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i64 0, i32 5
  store i32 1038, i32* %28, align 8
  %29 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %29, i64 0, i32 0
  %31 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %30, align 8
  %32 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %31(%struct.jpeg_common_struct* %32) #2
  br label %33

; <label>:33:                                     ; preds = %21, %25
  %34 = getelementptr inbounds [13 x i32], [13 x i32]* %3, i64 0, i64 10
  %35 = load i32, i32* %34, align 8
  %36 = trunc i32 %35 to i8
  %37 = icmp sgt i8 %36, -1
  br i1 %37, label %38, label %46

; <label>:38:                                     ; preds = %33
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i64 0, i32 5
  store i32 1038, i32* %41, align 8
  %42 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %43 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %42, i64 0, i32 0
  %44 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %43, align 8
  %45 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %44(%struct.jpeg_common_struct* %45) #2
  br label %46

; <label>:46:                                     ; preds = %38, %33
  %47 = load i32, i32* %34, align 8
  %48 = and i32 %47, 7
  %49 = shl i32 2, %48
  %50 = icmp sgt i32 %49, 0
  br i1 %50, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %46
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %52 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  br label %53

; <label>:53:                                     ; preds = %66, %.lr.ph
  %.12 = phi i32 [ 0, %.lr.ph ], [ %67, %66 ]
  %54 = tail call i32 @_IO_getc(%struct._IO_FILE* %1)
  %55 = tail call i32 @_IO_getc(%struct._IO_FILE* %1)
  %56 = tail call i32 @_IO_getc(%struct._IO_FILE* %1)
  %57 = icmp eq i32 %54, -1
  %58 = icmp eq i32 %55, -1
  %or.cond = or i1 %57, %58
  %59 = icmp eq i32 %56, -1
  %or.cond1 = or i1 %or.cond, %59
  br i1 %or.cond1, label %60, label %66

; <label>:60:                                     ; preds = %53
  %61 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %51, align 8
  %62 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %61, i64 0, i32 5
  store i32 1038, i32* %62, align 8
  %63 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %51, align 8
  %64 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %63, i64 0, i32 0
  %65 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %64, align 8
  tail call void %65(%struct.jpeg_common_struct* %52) #2
  br label %66

; <label>:66:                                     ; preds = %53, %60
  tail call void @add_map_entry(%struct.jpeg_decompress_struct* %0, i32 %54, i32 %55, i32 %56)
  %67 = add nuw nsw i32 %.12, 1
  %exitcond4 = icmp eq i32 %67, %49
  br i1 %exitcond4, label %._crit_edge.loopexit, label %53

._crit_edge.loopexit:                             ; preds = %66
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %46
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @read_ppm_map(%struct.jpeg_decompress_struct*, %struct._IO_FILE* nocapture) #0 {
  %3 = tail call i32 @_IO_getc(%struct._IO_FILE* %1)
  %4 = tail call i32 @read_pbm_integer(%struct.jpeg_decompress_struct* %0, %struct._IO_FILE* %1)
  %5 = tail call i32 @read_pbm_integer(%struct.jpeg_decompress_struct* %0, %struct._IO_FILE* %1)
  %6 = tail call i32 @read_pbm_integer(%struct.jpeg_decompress_struct* %0, %struct._IO_FILE* %1)
  %7 = icmp eq i32 %4, 0
  %8 = icmp eq i32 %5, 0
  %or.cond = or i1 %7, %8
  %9 = icmp eq i32 %6, 0
  %or.cond6 = or i1 %or.cond, %9
  br i1 %or.cond6, label %10, label %18

; <label>:10:                                     ; preds = %2
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 5
  store i32 1038, i32* %13, align 8
  %14 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %15 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %14, i64 0, i32 0
  %16 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %15, align 8
  %17 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %16(%struct.jpeg_common_struct* %17) #2
  br label %18

; <label>:18:                                     ; preds = %2, %10
  %19 = icmp eq i32 %6, 255
  br i1 %19, label %28, label %20

; <label>:20:                                     ; preds = %18
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i64 0, i32 5
  store i32 1038, i32* %23, align 8
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i64 0, i32 0
  %26 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %25, align 8
  %27 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %26(%struct.jpeg_common_struct* %27) #2
  br label %28

; <label>:28:                                     ; preds = %18, %20
  switch i32 %3, label %53 [
    i32 51, label %.preheader9
    i32 54, label %.preheader11
  ]

.preheader11:                                     ; preds = %28
  %exitcond521 = icmp eq i32 %5, 0
  br i1 %exitcond521, label %.loopexit, label %.preheader10.lr.ph

.preheader10.lr.ph:                               ; preds = %.preheader11
  %exitcond417 = icmp eq i32 %4, 0
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %30 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  br i1 %exitcond417, label %.loopexit, label %.preheader10.preheader

.preheader10.preheader:                           ; preds = %.preheader10.lr.ph
  br label %.preheader10

.preheader9:                                      ; preds = %28
  %exitcond315 = icmp eq i32 %5, 0
  %exitcond13 = icmp eq i32 %4, 0
  %or.cond27 = or i1 %exitcond315, %exitcond13
  br i1 %or.cond27, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader9
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %.0116 = phi i32 [ %36, %._crit_edge ], [ 0, %.preheader.preheader ]
  br label %31

; <label>:31:                                     ; preds = %.preheader, %31
  %.014 = phi i32 [ 0, %.preheader ], [ %35, %31 ]
  %32 = tail call i32 @read_pbm_integer(%struct.jpeg_decompress_struct* %0, %struct._IO_FILE* %1)
  %33 = tail call i32 @read_pbm_integer(%struct.jpeg_decompress_struct* %0, %struct._IO_FILE* %1)
  %34 = tail call i32 @read_pbm_integer(%struct.jpeg_decompress_struct* %0, %struct._IO_FILE* %1)
  tail call void @add_map_entry(%struct.jpeg_decompress_struct* %0, i32 %32, i32 %33, i32 %34)
  %35 = add nuw i32 %.014, 1
  %exitcond = icmp eq i32 %35, %4
  br i1 %exitcond, label %._crit_edge, label %31

._crit_edge:                                      ; preds = %31
  %36 = add nuw i32 %.0116, 1
  %exitcond3 = icmp eq i32 %36, %5
  br i1 %exitcond3, label %.loopexit.loopexit, label %.preheader

.preheader10:                                     ; preds = %.preheader10.preheader, %._crit_edge20
  %.1222 = phi i32 [ %52, %._crit_edge20 ], [ 0, %.preheader10.preheader ]
  br label %37

; <label>:37:                                     ; preds = %.preheader10, %50
  %.118 = phi i32 [ 0, %.preheader10 ], [ %51, %50 ]
  %38 = tail call i32 @pbm_getc(%struct._IO_FILE* %1)
  %39 = tail call i32 @pbm_getc(%struct._IO_FILE* %1)
  %40 = tail call i32 @pbm_getc(%struct._IO_FILE* %1)
  %41 = icmp eq i32 %38, -1
  %42 = icmp eq i32 %39, -1
  %or.cond7 = or i1 %41, %42
  %43 = icmp eq i32 %40, -1
  %or.cond8 = or i1 %or.cond7, %43
  br i1 %or.cond8, label %44, label %50

; <label>:44:                                     ; preds = %37
  %45 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %46 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %45, i64 0, i32 5
  store i32 1038, i32* %46, align 8
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i64 0, i32 0
  %49 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %48, align 8
  tail call void %49(%struct.jpeg_common_struct* %30) #2
  br label %50

; <label>:50:                                     ; preds = %37, %44
  tail call void @add_map_entry(%struct.jpeg_decompress_struct* %0, i32 %38, i32 %39, i32 %40)
  %51 = add nuw i32 %.118, 1
  %exitcond4 = icmp eq i32 %51, %4
  br i1 %exitcond4, label %._crit_edge20, label %37

._crit_edge20:                                    ; preds = %50
  %52 = add nuw i32 %.1222, 1
  %exitcond5 = icmp eq i32 %52, %5
  br i1 %exitcond5, label %.loopexit.loopexit29, label %.preheader10

; <label>:53:                                     ; preds = %28
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %55 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %56 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %55, i64 0, i32 5
  store i32 1038, i32* %56, align 8
  %57 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %58 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %57, i64 0, i32 0
  %59 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %58, align 8
  %60 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %59(%struct.jpeg_common_struct* %60) #2
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit.loopexit29:                             ; preds = %._crit_edge20
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit29, %.loopexit.loopexit, %.preheader10.lr.ph, %.preheader11, %.preheader9, %53
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @add_map_entry(%struct.jpeg_decompress_struct*, i32, i32, i32) #0 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %6 = load i8**, i8*** %5, align 8
  %7 = load i8*, i8** %6, align 8
  %8 = getelementptr inbounds i8*, i8** %6, i64 1
  %9 = load i8*, i8** %8, align 8
  %10 = getelementptr inbounds i8*, i8** %6, i64 2
  %11 = load i8*, i8** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 31
  %13 = load i32, i32* %12, align 4
  %14 = sext i32 %13 to i64
  %15 = icmp sgt i32 %13, 0
  br i1 %15, label %.lr.ph.preheader, label %._crit_edge.thread

.lr.ph.preheader:                                 ; preds = %4
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %30
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %30 ], [ 0, %.lr.ph.preheader ]
  %16 = getelementptr inbounds i8, i8* %7, i64 %indvars.iv1
  %17 = load i8, i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp eq i32 %18, %1
  br i1 %19, label %20, label %30

; <label>:20:                                     ; preds = %.lr.ph
  %21 = getelementptr inbounds i8, i8* %9, i64 %indvars.iv1
  %22 = load i8, i8* %21, align 1
  %23 = zext i8 %22 to i32
  %24 = icmp eq i32 %23, %2
  br i1 %24, label %25, label %30

; <label>:25:                                     ; preds = %20
  %26 = getelementptr inbounds i8, i8* %11, i64 %indvars.iv1
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = icmp eq i32 %28, %3
  br i1 %29, label %.loopexit.loopexit, label %30

; <label>:30:                                     ; preds = %.lr.ph, %20, %25
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %31 = icmp slt i64 %indvars.iv.next, %14
  br i1 %31, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %30
  %32 = icmp sgt i32 %13, 255
  br i1 %32, label %33, label %._crit_edge.thread

; <label>:33:                                     ; preds = %._crit_edge
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %35 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %35, i64 0, i32 5
  store i32 56, i32* %36, align 8
  %37 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %38 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %37, i64 0, i32 6, i32 0, i64 0
  store i32 256, i32* %38, align 4
  %39 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %40 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %39, i64 0, i32 0
  %41 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %40, align 8
  %42 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %41(%struct.jpeg_common_struct* %42) #2
  br label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %4, %33, %._crit_edge
  %43 = trunc i32 %1 to i8
  %44 = getelementptr inbounds i8, i8* %7, i64 %14
  store i8 %43, i8* %44, align 1
  %45 = trunc i32 %2 to i8
  %46 = getelementptr inbounds i8, i8* %9, i64 %14
  store i8 %45, i8* %46, align 1
  %47 = trunc i32 %3 to i8
  %48 = getelementptr inbounds i8, i8* %11, i64 %14
  store i8 %47, i8* %48, align 1
  %49 = load i32, i32* %12, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %12, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %25
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge.thread
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @read_pbm_integer(%struct.jpeg_decompress_struct*, %struct._IO_FILE* nocapture) #0 {
  br label %.critedge

.critedge:                                        ; preds = %.critedge.backedge, %2
  %3 = tail call i32 @pbm_getc(%struct._IO_FILE* %1)
  switch i32 %3, label %11 [
    i32 -1, label %.thread
    i32 32, label %.critedge.backedge
    i32 9, label %.critedge.backedge
    i32 10, label %.critedge.backedge
    i32 13, label %.critedge.backedge
  ]

.critedge.backedge:                               ; preds = %.critedge, %.critedge, %.critedge, %.critedge
  br label %.critedge

.thread:                                          ; preds = %.critedge
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %5 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %5, i64 0, i32 5
  store i32 1038, i32* %6, align 8
  %7 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %4, align 8
  %8 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %7, i64 0, i32 0
  %9 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %8, align 8
  %10 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %9(%struct.jpeg_common_struct* %10) #2
  br label %13

; <label>:11:                                     ; preds = %.critedge
  %.off3 = add i32 %3, -48
  %12 = icmp ugt i32 %.off3, 9
  br i1 %12, label %13, label %21

; <label>:13:                                     ; preds = %.thread, %11
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %15 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %14, align 8
  %16 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %15, i64 0, i32 5
  store i32 1038, i32* %16, align 8
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %14, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i64 0, i32 0
  %19 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %18, align 8
  %20 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %19(%struct.jpeg_common_struct* %20) #2
  br label %21

; <label>:21:                                     ; preds = %11, %13
  %22 = add nsw i32 %3, -48
  %23 = tail call i32 @pbm_getc(%struct._IO_FILE* %1)
  %.off5 = add i32 %23, -48
  %24 = icmp ult i32 %.off5, 10
  br i1 %24, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %21
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %25 = phi i32 [ %29, %.lr.ph ], [ %23, %.lr.ph.preheader ]
  %.06 = phi i32 [ %28, %.lr.ph ], [ %22, %.lr.ph.preheader ]
  %26 = mul i32 %.06, 10
  %27 = add nsw i32 %25, -48
  %28 = add i32 %27, %26
  %29 = tail call i32 @pbm_getc(%struct._IO_FILE* %1)
  %.off = add i32 %29, -48
  %30 = icmp ult i32 %.off, 10
  br i1 %30, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %21
  %.0.lcssa = phi i32 [ %22, %21 ], [ %28, %._crit_edge.loopexit ]
  ret i32 %.0.lcssa
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @pbm_getc(%struct._IO_FILE* nocapture) #0 {
  %2 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  %3 = icmp eq i32 %2, 35
  br i1 %3, label %.preheader.preheader, label %.loopexit

.preheader.preheader:                             ; preds = %1
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %4 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  switch i32 %4, label %.preheader [
    i32 -1, label %.loopexit.loopexit
    i32 10, label %.loopexit.loopexit
  ]

.loopexit.loopexit:                               ; preds = %.preheader, %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %1
  %.0 = phi i32 [ %2, %1 ], [ %4, %.loopexit.loopexit ]
  ret i32 %.0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

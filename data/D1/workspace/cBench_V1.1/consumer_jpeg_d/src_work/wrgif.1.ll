; ModuleID = 'wrgif.ll'
source_filename = "wrgif.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.djpeg_dest_struct = type { void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)*, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)*, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)*, %struct._IO_FILE*, i8**, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
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
%struct.gif_dest_struct = type { %struct.djpeg_dest_struct, %struct.jpeg_decompress_struct*, i32, i16, i32, i64, i32, i16, i32, i16, i16, i16, i16*, i64*, i32, [256 x i8] }

; Function Attrs: noinline nounwind uwtable
define %struct.djpeg_dest_struct* @jinit_write_gif(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %3, i64 0, i32 0
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 384) #5
  %8 = getelementptr inbounds i8, i8* %7, i64 48
  %9 = bitcast i8* %8 to %struct.jpeg_decompress_struct**
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)**
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @start_output_gif, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %10, align 8
  %11 = getelementptr inbounds i8, i8* %7, i64 8
  %12 = bitcast i8* %11 to void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)**
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_pixel_rows, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %12, align 8
  %13 = getelementptr inbounds i8, i8* %7, i64 16
  %14 = bitcast i8* %13 to void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)**
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @finish_output_gif, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %14, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 10
  %16 = load i32, i32* %15, align 8
  switch i32 %16, label %17 [
    i32 1, label %.thread
    i32 2, label %.thread1
  ]

; <label>:17:                                     ; preds = %1
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i64 0, i32 5
  store i32 1014, i32* %20, align 8
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i64 0, i32 0
  %23 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %22, align 8
  tail call void %23(%struct.jpeg_common_struct* %6) #5
  %.pr.pr = load i32, i32* %15, align 8
  %24 = icmp eq i32 %.pr.pr, 1
  br i1 %24, label %.thread, label %.thread1

.thread:                                          ; preds = %17, %1
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 42
  %26 = load i32, i32* %25, align 8
  %27 = icmp sgt i32 %26, 8
  br i1 %27, label %.thread1, label %33

.thread1:                                         ; preds = %1, %17, %.thread
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  store i32 1, i32* %28, align 4
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 22
  %30 = load i32, i32* %29, align 8
  %31 = icmp sgt i32 %30, 256
  br i1 %31, label %32, label %33

; <label>:32:                                     ; preds = %.thread1
  store i32 256, i32* %29, align 8
  br label %33

; <label>:33:                                     ; preds = %.thread1, %32, %.thread
  tail call void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct* nonnull %0) #5
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 29
  %35 = load i32, i32* %34, align 4
  %36 = icmp eq i32 %35, 1
  br i1 %36, label %44, label %37

; <label>:37:                                     ; preds = %33
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %39 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %40 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %39, i64 0, i32 5
  store i32 1012, i32* %40, align 8
  %41 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %42 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %41, i64 0, i32 0
  %43 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %42, align 8
  tail call void %43(%struct.jpeg_common_struct* nonnull %6) #5
  br label %44

; <label>:44:                                     ; preds = %33, %37
  %45 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %46 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %45, i64 0, i32 2
  %47 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %49 = load i32, i32* %48, align 8
  %50 = tail call i8** %47(%struct.jpeg_common_struct* nonnull %6, i32 1, i32 %49, i32 1) #5
  %51 = getelementptr inbounds i8, i8* %7, i64 32
  %52 = bitcast i8* %51 to i8***
  store i8** %50, i8*** %52, align 8
  %53 = getelementptr inbounds i8, i8* %7, i64 40
  %54 = bitcast i8* %53 to i32*
  store i32 1, i32* %54, align 8
  %55 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %56 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %55, i64 0, i32 0
  %57 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %56, align 8
  %58 = tail call i8* %57(%struct.jpeg_common_struct* nonnull %6, i32 1, i64 10006) #5
  %59 = getelementptr inbounds i8, i8* %7, i64 104
  %60 = bitcast i8* %59 to i8**
  store i8* %58, i8** %60, align 8
  %61 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %62 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %61, i64 0, i32 1
  %63 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %62, align 8
  %64 = tail call i8* %63(%struct.jpeg_common_struct* nonnull %6, i32 1, i64 40024) #5
  %65 = getelementptr inbounds i8, i8* %7, i64 112
  %66 = bitcast i8* %65 to i8**
  store i8* %64, i8** %66, align 8
  %67 = bitcast i8* %7 to %struct.djpeg_dest_struct*
  ret %struct.djpeg_dest_struct* %67
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_output_gif(%struct.jpeg_decompress_struct* nocapture readonly, %struct.djpeg_dest_struct* nocapture) #0 {
  %3 = bitcast %struct.djpeg_dest_struct* %1 to %struct.gif_dest_struct*
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %5 = load i32, i32* %4, align 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %12, label %7

; <label>:7:                                      ; preds = %2
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 31
  %9 = load i32, i32* %8, align 4
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %11 = load i8**, i8*** %10, align 8
  tail call void @emit_header(%struct.gif_dest_struct* %3, i32 %9, i8** %11)
  br label %13

; <label>:12:                                     ; preds = %2
  tail call void @emit_header(%struct.gif_dest_struct* %3, i32 256, i8** null)
  br label %13

; <label>:13:                                     ; preds = %12, %7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put_pixel_rows(%struct.jpeg_decompress_struct* nocapture readonly, %struct.djpeg_dest_struct* nocapture, i32) #0 {
  %4 = bitcast %struct.djpeg_dest_struct* %1 to %struct.gif_dest_struct*
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %3
  %8 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 4
  %9 = load i8**, i8*** %8, align 8
  %10 = load i8*, i8** %9, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.03 = phi i32 [ %14, %.lr.ph ], [ %6, %.lr.ph.preheader ]
  %.012 = phi i8* [ %11, %.lr.ph ], [ %10, %.lr.ph.preheader ]
  %11 = getelementptr inbounds i8, i8* %.012, i64 1
  %12 = load i8, i8* %.012, align 1
  %13 = zext i8 %12 to i32
  tail call void @compress_byte(%struct.gif_dest_struct* %4, i32 %13)
  %14 = add i32 %.03, -1
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_output_gif(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct* nocapture) #0 {
  %3 = bitcast %struct.djpeg_dest_struct* %1 to %struct.gif_dest_struct*
  tail call void @compress_term(%struct.gif_dest_struct* %3)
  %4 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 3
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %6 = tail call i32 @_IO_putc(i32 0, %struct._IO_FILE* %5)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %8 = tail call i32 @_IO_putc(i32 59, %struct._IO_FILE* %7)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %10 = tail call i32 @fflush(%struct._IO_FILE* %9)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %12 = tail call i32 @ferror(%struct._IO_FILE* %11) #5
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %22, label %14

; <label>:14:                                     ; preds = %2
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i64 0, i32 5
  store i32 36, i32* %17, align 8
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i64 0, i32 0
  %20 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %19, align 8
  %21 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %20(%struct.jpeg_common_struct* %21) #5
  br label %22

; <label>:22:                                     ; preds = %2, %14
  ret void
}

declare void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @emit_header(%struct.gif_dest_struct* nocapture, i32, i8** readonly) #0 {
  %4 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 1
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i64 0, i32 42
  %7 = load i32, i32* %6, align 8
  %8 = add nsw i32 %7, -8
  %9 = icmp sgt i32 %1, 256
  br i1 %9, label %10, label %.preheader.preheader

; <label>:10:                                     ; preds = %3
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i64 0, i32 0
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 5
  store i32 1039, i32* %13, align 8
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i64 0, i32 0
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i64 0, i32 6, i32 0, i64 0
  store i32 %1, i32* %17, align 4
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i64 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 0
  %22 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %21, align 8
  %23 = bitcast %struct.jpeg_decompress_struct* %18 to %struct.jpeg_common_struct*
  tail call void %22(%struct.jpeg_common_struct* %23) #5
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %10, %3
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %.02 = phi i32 [ %26, %.preheader ], [ 1, %.preheader.preheader ]
  %24 = shl i32 1, %.02
  %25 = icmp slt i32 %24, %1
  %26 = add nuw nsw i32 %.02, 1
  br i1 %25, label %.preheader, label %27

; <label>:27:                                     ; preds = %.preheader
  %28 = icmp sgt i32 %.02, 2
  %..02.lcssa = select i1 %28, i32 %.02, i32 2
  %29 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 0, i32 3
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %29, align 8
  %31 = tail call i32 @_IO_putc(i32 71, %struct._IO_FILE* %30)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %29, align 8
  %33 = tail call i32 @_IO_putc(i32 73, %struct._IO_FILE* %32)
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** %29, align 8
  %35 = tail call i32 @_IO_putc(i32 70, %struct._IO_FILE* %34)
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %29, align 8
  %37 = tail call i32 @_IO_putc(i32 56, %struct._IO_FILE* %36)
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** %29, align 8
  %39 = tail call i32 @_IO_putc(i32 55, %struct._IO_FILE* %38)
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** %29, align 8
  %41 = tail call i32 @_IO_putc(i32 97, %struct._IO_FILE* %40)
  %42 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %42, i64 0, i32 26
  %44 = load i32, i32* %43, align 8
  tail call void @put_word(%struct.gif_dest_struct* %0, i32 %44)
  %45 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %45, i64 0, i32 27
  %47 = load i32, i32* %46, align 4
  tail call void @put_word(%struct.gif_dest_struct* %0, i32 %47)
  %48 = add nsw i32 %.02, -1
  %49 = shl i32 %48, 4
  %50 = or i32 %48, %49
  %51 = or i32 %50, 128
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** %29, align 8
  %53 = tail call i32 @_IO_putc(i32 %51, %struct._IO_FILE* %52)
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** %29, align 8
  %55 = tail call i32 @_IO_putc(i32 0, %struct._IO_FILE* %54)
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** %29, align 8
  %57 = tail call i32 @_IO_putc(i32 0, %struct._IO_FILE* %56)
  %58 = sext i32 %24 to i64
  %59 = sext i32 %1 to i64
  %60 = icmp eq i32 %.02, 31
  br i1 %60, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %27
  %61 = icmp eq i8** %2, null
  %62 = add nsw i32 %1, -1
  %63 = sdiv i32 %62, 2
  %64 = getelementptr inbounds i8*, i8** %2, i64 1
  %65 = getelementptr inbounds i8*, i8** %2, i64 2
  br i1 %61, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %73
  %indvars.iv3.us = phi i64 [ %indvars.iv.next.us, %73 ], [ 0, %.lr.ph.split.us.preheader ]
  %66 = icmp slt i64 %indvars.iv3.us, %59
  br i1 %66, label %68, label %67

; <label>:67:                                     ; preds = %.lr.ph.split.us
  tail call void @put_3bytes(%struct.gif_dest_struct* %0, i32 0)
  br label %73

; <label>:68:                                     ; preds = %.lr.ph.split.us
  %69 = mul nuw nsw i64 %indvars.iv3.us, 255
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, %63
  %72 = sdiv i32 %71, %62
  tail call void @put_3bytes(%struct.gif_dest_struct* %0, i32 %72)
  br label %73

; <label>:73:                                     ; preds = %68, %67
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv3.us, 1
  %74 = icmp slt i64 %indvars.iv.next.us, %58
  br i1 %74, label %.lr.ph.split.us, label %._crit_edge.loopexit

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %105
  %indvars.iv3 = phi i64 [ %indvars.iv.next, %105 ], [ 0, %.lr.ph.split.preheader ]
  %75 = icmp slt i64 %indvars.iv3, %59
  br i1 %75, label %76, label %104

; <label>:76:                                     ; preds = %.lr.ph.split
  %77 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %78 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %77, i64 0, i32 10
  %79 = load i32, i32* %78, align 8
  %80 = icmp eq i32 %79, 2
  %81 = load i8*, i8** %2, align 8
  %82 = getelementptr inbounds i8, i8* %81, i64 %indvars.iv3
  %83 = load i8, i8* %82, align 1
  %84 = zext i8 %83 to i32
  %85 = lshr i32 %84, %8
  br i1 %80, label %86, label %103

; <label>:86:                                     ; preds = %76
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** %29, align 8
  %88 = tail call i32 @_IO_putc(i32 %85, %struct._IO_FILE* %87)
  %89 = load i8*, i8** %64, align 8
  %90 = getelementptr inbounds i8, i8* %89, i64 %indvars.iv3
  %91 = load i8, i8* %90, align 1
  %92 = zext i8 %91 to i32
  %93 = lshr i32 %92, %8
  %94 = load %struct._IO_FILE*, %struct._IO_FILE** %29, align 8
  %95 = tail call i32 @_IO_putc(i32 %93, %struct._IO_FILE* %94)
  %96 = load i8*, i8** %65, align 8
  %97 = getelementptr inbounds i8, i8* %96, i64 %indvars.iv3
  %98 = load i8, i8* %97, align 1
  %99 = zext i8 %98 to i32
  %100 = lshr i32 %99, %8
  %101 = load %struct._IO_FILE*, %struct._IO_FILE** %29, align 8
  %102 = tail call i32 @_IO_putc(i32 %100, %struct._IO_FILE* %101)
  br label %105

; <label>:103:                                    ; preds = %76
  tail call void @put_3bytes(%struct.gif_dest_struct* nonnull %0, i32 %85)
  br label %105

; <label>:104:                                    ; preds = %.lr.ph.split
  tail call void @put_3bytes(%struct.gif_dest_struct* %0, i32 0)
  br label %105

; <label>:105:                                    ; preds = %104, %86, %103
  %indvars.iv.next = add nuw nsw i64 %indvars.iv3, 1
  %106 = icmp slt i64 %indvars.iv.next, %58
  br i1 %106, label %.lr.ph.split, label %._crit_edge.loopexit7

._crit_edge.loopexit:                             ; preds = %73
  br label %._crit_edge

._crit_edge.loopexit7:                            ; preds = %105
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit7, %._crit_edge.loopexit, %27
  %107 = load %struct._IO_FILE*, %struct._IO_FILE** %29, align 8
  %108 = tail call i32 @_IO_putc(i32 44, %struct._IO_FILE* %107)
  tail call void @put_word(%struct.gif_dest_struct* %0, i32 0)
  tail call void @put_word(%struct.gif_dest_struct* %0, i32 0)
  %109 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %110 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %109, i64 0, i32 26
  %111 = load i32, i32* %110, align 8
  tail call void @put_word(%struct.gif_dest_struct* %0, i32 %111)
  %112 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %113 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %112, i64 0, i32 27
  %114 = load i32, i32* %113, align 4
  tail call void @put_word(%struct.gif_dest_struct* %0, i32 %114)
  %115 = load %struct._IO_FILE*, %struct._IO_FILE** %29, align 8
  %116 = tail call i32 @_IO_putc(i32 0, %struct._IO_FILE* %115)
  %117 = load %struct._IO_FILE*, %struct._IO_FILE** %29, align 8
  %118 = tail call i32 @_IO_putc(i32 %..02.lcssa, %struct._IO_FILE* %117)
  %119 = add nuw nsw i32 %..02.lcssa, 1
  tail call void @compress_init(%struct.gif_dest_struct* %0, i32 %119)
  ret void
}

; Function Attrs: nounwind
declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) #2

; Function Attrs: noinline nounwind uwtable
define internal void @put_word(%struct.gif_dest_struct* nocapture readonly, i32) #0 {
  %3 = and i32 %1, 255
  %4 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 0, i32 3
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %6 = tail call i32 @_IO_putc(i32 %3, %struct._IO_FILE* %5)
  %7 = lshr i32 %1, 8
  %8 = and i32 %7, 255
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %10 = tail call i32 @_IO_putc(i32 %8, %struct._IO_FILE* %9)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put_3bytes(%struct.gif_dest_struct* nocapture readonly, i32) #0 {
  %3 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 0, i32 3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %5 = tail call i32 @_IO_putc(i32 %1, %struct._IO_FILE* %4)
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %7 = tail call i32 @_IO_putc(i32 %1, %struct._IO_FILE* %6)
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %9 = tail call i32 @_IO_putc(i32 %1, %struct._IO_FILE* %8)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @compress_init(%struct.gif_dest_struct* nocapture, i32) #0 {
  %3 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 4
  store i32 %1, i32* %3, align 8
  %4 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 2
  store i32 %1, i32* %4, align 8
  %5 = shl i32 1, %1
  %6 = add i32 %5, 65535
  %7 = trunc i32 %6 to i16
  %8 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 3
  store i16 %7, i16* %8, align 4
  %9 = add nsw i32 %1, -1
  %10 = shl i32 1, %9
  %11 = trunc i32 %10 to i16
  %12 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 9
  store i16 %11, i16* %12, align 4
  %13 = add i32 %10, 1
  %14 = trunc i32 %13 to i16
  %15 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 10
  store i16 %14, i16* %15, align 2
  %16 = add i16 %11, 2
  %17 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 11
  store i16 %16, i16* %17, align 8
  %18 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 8
  store i32 1, i32* %18, align 8
  %19 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 14
  store i32 0, i32* %19, align 8
  %20 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 5
  store i64 0, i64* %20, align 8
  %21 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 6
  store i32 0, i32* %21, align 8
  tail call void @clear_hash(%struct.gif_dest_struct* %0)
  %22 = load i16, i16* %12, align 4
  tail call void @output(%struct.gif_dest_struct* %0, i16 signext %22)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @clear_hash(%struct.gif_dest_struct* nocapture readonly) #0 {
  %2 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 12
  %3 = bitcast i16** %2 to i8**
  %4 = load i8*, i8** %3, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 10006, i32 1, i1 false)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @output(%struct.gif_dest_struct* nocapture, i16 signext) #0 {
  %3 = sext i16 %1 to i64
  %4 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 6
  %5 = load i32, i32* %4, align 8
  %6 = zext i32 %5 to i64
  %7 = shl i64 %3, %6
  %8 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 5
  %9 = load i64, i64* %8, align 8
  %10 = or i64 %7, %9
  store i64 %10, i64* %8, align 8
  %11 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 2
  %12 = load i32, i32* %11, align 8
  %13 = load i32, i32* %4, align 8
  %14 = add nsw i32 %13, %12
  store i32 %14, i32* %4, align 8
  %15 = icmp sgt i32 %14, 7
  br i1 %15, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %16 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 14
  br label %17

; <label>:17:                                     ; preds = %.lr.ph, %27
  %18 = load i64, i64* %8, align 8
  %19 = trunc i64 %18 to i8
  %20 = load i32, i32* %16, align 8
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %16, align 8
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 15, i64 %22
  store i8 %19, i8* %23, align 1
  %24 = load i32, i32* %16, align 8
  %25 = icmp sgt i32 %24, 254
  br i1 %25, label %26, label %27

; <label>:26:                                     ; preds = %17
  tail call void @flush_packet(%struct.gif_dest_struct* nonnull %0)
  br label %27

; <label>:27:                                     ; preds = %26, %17
  %28 = load i64, i64* %8, align 8
  %29 = ashr i64 %28, 8
  store i64 %29, i64* %8, align 8
  %30 = load i32, i32* %4, align 8
  %31 = add nsw i32 %30, -8
  store i32 %31, i32* %4, align 8
  %32 = icmp sgt i32 %31, 7
  br i1 %32, label %17, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %27
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %33 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 11
  %34 = load i16, i16* %33, align 8
  %35 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 3
  %36 = load i16, i16* %35, align 4
  %37 = icmp sgt i16 %34, %36
  br i1 %37, label %38, label %45

; <label>:38:                                     ; preds = %._crit_edge
  %39 = load i32, i32* %11, align 8
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %11, align 8
  %41 = icmp eq i32 %40, 12
  %42 = shl i32 1, %40
  %43 = add i32 %42, 65535
  %44 = trunc i32 %43 to i16
  %.sink = select i1 %41, i16 4096, i16 %44
  store i16 %.sink, i16* %35, align 4
  br label %45

; <label>:45:                                     ; preds = %38, %._crit_edge
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: noinline nounwind uwtable
define internal void @flush_packet(%struct.gif_dest_struct* nocapture) #0 {
  %2 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 14
  %3 = load i32, i32* %2, align 8
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %31

; <label>:5:                                      ; preds = %1
  %6 = add nsw i32 %3, 1
  store i32 %6, i32* %2, align 8
  %7 = trunc i32 %3 to i8
  %8 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 15
  %9 = getelementptr inbounds [256 x i8], [256 x i8]* %8, i64 0, i64 0
  store i8 %7, i8* %9, align 4
  %10 = getelementptr inbounds [256 x i8], [256 x i8]* %8, i64 0, i64 0
  %11 = sext i32 %6 to i64
  %12 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 0, i32 3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %14 = tail call i64 @fwrite(i8* %10, i64 1, i64 %11, %struct._IO_FILE* %13)
  %15 = load i32, i32* %2, align 8
  %16 = sext i32 %15 to i64
  %17 = icmp eq i64 %14, %16
  br i1 %17, label %30, label %18

; <label>:18:                                     ; preds = %5
  %19 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 1
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %20, i64 0, i32 0
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i64 0, i32 5
  store i32 36, i32* %23, align 8
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %19, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i64 0, i32 0
  %26 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %26, i64 0, i32 0
  %28 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %27, align 8
  %29 = bitcast %struct.jpeg_decompress_struct* %24 to %struct.jpeg_common_struct*
  tail call void %28(%struct.jpeg_common_struct* %29) #5
  br label %30

; <label>:30:                                     ; preds = %5, %18
  store i32 0, i32* %2, align 8
  br label %31

; <label>:31:                                     ; preds = %30, %1
  ret void
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #2

; Function Attrs: noinline nounwind uwtable
define internal void @compress_byte(%struct.gif_dest_struct* nocapture, i32) #0 {
  %3 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 8
  %4 = load i32, i32* %3, align 8
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %9, label %6

; <label>:6:                                      ; preds = %2
  %7 = trunc i32 %1 to i16
  %8 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 7
  store i16 %7, i16* %8, align 4
  store i32 0, i32* %3, align 8
  br label %67

; <label>:9:                                      ; preds = %2
  %10 = shl i32 %1, 4
  %11 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 7
  %12 = load i16, i16* %11, align 4
  %13 = sext i16 %12 to i32
  %14 = add nsw i32 %13, %10
  %15 = icmp sgt i32 %14, 5002
  %16 = add nsw i32 %14, -5003
  %. = select i1 %15, i32 %16, i32 %14
  %17 = sext i16 %12 to i64
  %18 = shl nsw i64 %17, 8
  %19 = sext i32 %1 to i64
  %20 = or i64 %18, %19
  %21 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 12
  %22 = load i16*, i16** %21, align 8
  %23 = sext i32 %. to i64
  %24 = getelementptr inbounds i16, i16* %22, i64 %23
  %25 = load i16, i16* %24, align 2
  %26 = icmp eq i16 %25, 0
  br i1 %26, label %.loopexit, label %27

; <label>:27:                                     ; preds = %9
  %28 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 13
  %29 = load i64*, i64** %28, align 8
  %30 = getelementptr inbounds i64, i64* %29, i64 %23
  %31 = load i64, i64* %30, align 8
  %32 = icmp eq i64 %31, %20
  br i1 %32, label %33, label %34

; <label>:33:                                     ; preds = %27
  store i16 %25, i16* %11, align 4
  br label %67

; <label>:34:                                     ; preds = %27
  %35 = icmp eq i32 %., 0
  %36 = sub nsw i32 5003, %.
  %.0 = select i1 %35, i32 1, i32 %36
  %37 = load i16*, i16** %21, align 8
  br label %38

; <label>:38:                                     ; preds = %46, %34
  %.1 = phi i32 [ %., %34 ], [ %.4, %46 ]
  %39 = sub nsw i32 %.1, %.0
  %40 = icmp slt i32 %39, 0
  %41 = add nsw i32 %39, 5003
  %.4 = select i1 %40, i32 %41, i32 %39
  %42 = sext i32 %.4 to i64
  %43 = getelementptr inbounds i16, i16* %37, i64 %42
  %44 = load i16, i16* %43, align 2
  %45 = icmp eq i16 %44, 0
  br i1 %45, label %.loopexit.loopexit, label %46

; <label>:46:                                     ; preds = %38
  %47 = load i64*, i64** %28, align 8
  %48 = getelementptr inbounds i64, i64* %47, i64 %42
  %49 = load i64, i64* %48, align 8
  %50 = icmp eq i64 %49, %20
  br i1 %50, label %51, label %38

; <label>:51:                                     ; preds = %46
  store i16 %44, i16* %11, align 4
  br label %67

.loopexit.loopexit:                               ; preds = %38
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %9
  %.3 = phi i32 [ %., %9 ], [ %.4, %.loopexit.loopexit ]
  %52 = load i16, i16* %11, align 4
  tail call void @output(%struct.gif_dest_struct* nonnull %0, i16 signext %52)
  %53 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 11
  %54 = load i16, i16* %53, align 8
  %55 = icmp slt i16 %54, 4096
  br i1 %55, label %56, label %64

; <label>:56:                                     ; preds = %.loopexit
  %57 = add i16 %54, 1
  store i16 %57, i16* %53, align 8
  %58 = load i16*, i16** %21, align 8
  %59 = sext i32 %.3 to i64
  %60 = getelementptr inbounds i16, i16* %58, i64 %59
  store i16 %54, i16* %60, align 2
  %61 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 13
  %62 = load i64*, i64** %61, align 8
  %63 = getelementptr inbounds i64, i64* %62, i64 %59
  store i64 %20, i64* %63, align 8
  br label %65

; <label>:64:                                     ; preds = %.loopexit
  tail call void @clear_block(%struct.gif_dest_struct* nonnull %0)
  br label %65

; <label>:65:                                     ; preds = %64, %56
  %66 = trunc i32 %1 to i16
  store i16 %66, i16* %11, align 4
  br label %67

; <label>:67:                                     ; preds = %65, %51, %33, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @clear_block(%struct.gif_dest_struct* nocapture) #0 {
  tail call void @clear_hash(%struct.gif_dest_struct* %0)
  %2 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 9
  %3 = load i16, i16* %2, align 4
  %4 = add i16 %3, 2
  %5 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 11
  store i16 %4, i16* %5, align 8
  tail call void @output(%struct.gif_dest_struct* %0, i16 signext %3)
  %6 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 4
  %7 = load i32, i32* %6, align 8
  %8 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 2
  store i32 %7, i32* %8, align 8
  %9 = shl i32 1, %7
  %10 = add i32 %9, 65535
  %11 = trunc i32 %10 to i16
  %12 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 3
  store i16 %11, i16* %12, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @compress_term(%struct.gif_dest_struct* nocapture) #0 {
  %2 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 8
  %3 = load i32, i32* %2, align 8
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %8

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 7
  %7 = load i16, i16* %6, align 4
  tail call void @output(%struct.gif_dest_struct* nonnull %0, i16 signext %7)
  br label %8

; <label>:8:                                      ; preds = %1, %5
  %9 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 10
  %10 = load i16, i16* %9, align 2
  tail call void @output(%struct.gif_dest_struct* nonnull %0, i16 signext %10)
  %11 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 6
  %12 = load i32, i32* %11, align 8
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %26

; <label>:14:                                     ; preds = %8
  %15 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 5
  %16 = load i64, i64* %15, align 8
  %17 = trunc i64 %16 to i8
  %18 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 14
  %19 = load i32, i32* %18, align 8
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %18, align 8
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds %struct.gif_dest_struct, %struct.gif_dest_struct* %0, i64 0, i32 15, i64 %21
  store i8 %17, i8* %22, align 1
  %23 = load i32, i32* %18, align 8
  %24 = icmp sgt i32 %23, 254
  br i1 %24, label %25, label %26

; <label>:25:                                     ; preds = %14
  tail call void @flush_packet(%struct.gif_dest_struct* nonnull %0)
  br label %26

; <label>:26:                                     ; preds = %14, %25, %8
  tail call void @flush_packet(%struct.gif_dest_struct* nonnull %0)
  ret void
}

; Function Attrs: nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind readonly
declare i32 @ferror(%struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

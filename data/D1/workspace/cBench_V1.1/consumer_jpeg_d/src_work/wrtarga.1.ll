; ModuleID = 'wrtarga.ll'
source_filename = "wrtarga.c"
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

; Function Attrs: noinline nounwind uwtable
define %struct.djpeg_dest_struct* @jinit_write_targa(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %3, i64 0, i32 0
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 64) #5
  %8 = bitcast i8* %7 to void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)**
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @start_output_tga, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %8, align 8
  %9 = getelementptr inbounds i8, i8* %7, i64 16
  %10 = bitcast i8* %9 to void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)**
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @finish_output_tga, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %10, align 8
  tail call void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct* %0) #5
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %12 = load i32, i32* %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 29
  %14 = load i32, i32* %13, align 4
  %15 = mul i32 %14, %12
  %16 = getelementptr inbounds i8, i8* %7, i64 56
  %17 = bitcast i8* %16 to i32*
  store i32 %15, i32* %17, align 8
  %18 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %19 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %18, i64 0, i32 0
  %20 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %19, align 8
  %21 = zext i32 %15 to i64
  %22 = tail call i8* %20(%struct.jpeg_common_struct* %6, i32 1, i64 %21) #5
  %23 = getelementptr inbounds i8, i8* %7, i64 48
  %24 = bitcast i8* %23 to i8**
  store i8* %22, i8** %24, align 8
  %25 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %26 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %25, i64 0, i32 2
  %27 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %26, align 8
  %28 = load i32, i32* %17, align 8
  %29 = tail call i8** %27(%struct.jpeg_common_struct* %6, i32 1, i32 %28, i32 1) #5
  %30 = getelementptr inbounds i8, i8* %7, i64 32
  %31 = bitcast i8* %30 to i8***
  store i8** %29, i8*** %31, align 8
  %32 = getelementptr inbounds i8, i8* %7, i64 40
  %33 = bitcast i8* %32 to i32*
  store i32 1, i32* %33, align 8
  %34 = bitcast i8* %7 to %struct.djpeg_dest_struct*
  ret %struct.djpeg_dest_struct* %34
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_output_tga(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct* nocapture) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 10
  %4 = load i32, i32* %3, align 8
  switch i32 %4, label %57 [
    i32 1, label %5
    i32 2, label %10
  ]

; <label>:5:                                      ; preds = %2
  tail call void @write_header(%struct.jpeg_decompress_struct* nonnull %0, %struct.djpeg_dest_struct* %1, i32 0)
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %7 = load i32, i32* %6, align 4
  %8 = icmp ne i32 %7, 0
  %9 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 1
  %put_gray_rows.sink = select i1 %8, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_demapped_gray, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_gray_rows
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* %put_gray_rows.sink, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %9, align 8
  br label %65

; <label>:10:                                     ; preds = %2
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %12 = load i32, i32* %11, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %55, label %14

; <label>:14:                                     ; preds = %10
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 31
  %16 = load i32, i32* %15, align 4
  %17 = icmp sgt i32 %16, 256
  br i1 %17, label %18, label %28

; <label>:18:                                     ; preds = %14
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 5
  store i32 1039, i32* %21, align 8
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i64 0, i32 6, i32 0, i64 0
  store i32 %16, i32* %23, align 4
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i64 0, i32 0
  %26 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %25, align 8
  %27 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %26(%struct.jpeg_common_struct* %27) #5
  br label %28

; <label>:28:                                     ; preds = %18, %14
  tail call void @write_header(%struct.jpeg_decompress_struct* nonnull %0, %struct.djpeg_dest_struct* %1, i32 %16)
  %29 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 3
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %29, align 8
  %31 = sext i32 %16 to i64
  %32 = icmp sgt i32 %16, 0
  br i1 %32, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %28
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  br label %34

; <label>:34:                                     ; preds = %34, %.lr.ph
  %indvars.iv2 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %34 ]
  %35 = load i8**, i8*** %33, align 8
  %36 = getelementptr inbounds i8*, i8** %35, i64 2
  %37 = load i8*, i8** %36, align 8
  %38 = getelementptr inbounds i8, i8* %37, i64 %indvars.iv2
  %39 = load i8, i8* %38, align 1
  %40 = zext i8 %39 to i32
  %41 = tail call i32 @_IO_putc(i32 %40, %struct._IO_FILE* %30)
  %42 = load i8**, i8*** %33, align 8
  %43 = getelementptr inbounds i8*, i8** %42, i64 1
  %44 = load i8*, i8** %43, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 %indvars.iv2
  %46 = load i8, i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = tail call i32 @_IO_putc(i32 %47, %struct._IO_FILE* %30)
  %49 = load i8**, i8*** %33, align 8
  %50 = load i8*, i8** %49, align 8
  %51 = getelementptr inbounds i8, i8* %50, i64 %indvars.iv2
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = tail call i32 @_IO_putc(i32 %53, %struct._IO_FILE* %30)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %31
  br i1 %exitcond, label %.loopexit.loopexit, label %34

; <label>:55:                                     ; preds = %10
  tail call void @write_header(%struct.jpeg_decompress_struct* nonnull %0, %struct.djpeg_dest_struct* %1, i32 0)
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %34
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %28, %55
  %put_pixel_rows.sink = phi void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* [ @put_pixel_rows, %55 ], [ @put_gray_rows, %28 ], [ @put_gray_rows, %.loopexit.loopexit ]
  %56 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 1
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* %put_pixel_rows.sink, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %56, align 8
  br label %65

; <label>:57:                                     ; preds = %2
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %59 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %60 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %59, i64 0, i32 5
  store i32 1034, i32* %60, align 8
  %61 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %62 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %61, i64 0, i32 0
  %63 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %62, align 8
  %64 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %63(%struct.jpeg_common_struct* %64) #5
  br label %65

; <label>:65:                                     ; preds = %.loopexit, %57, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_output_tga(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct* nocapture readonly) #0 {
  %3 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %5 = tail call i32 @fflush(%struct._IO_FILE* %4)
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %7 = tail call i32 @ferror(%struct._IO_FILE* %6) #5
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %17, label %9

; <label>:9:                                      ; preds = %2
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 5
  store i32 36, i32* %12, align 8
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 0
  %15 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %14, align 8
  %16 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %15(%struct.jpeg_common_struct* %16) #5
  br label %17

; <label>:17:                                     ; preds = %2, %9
  ret void
}

declare void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @write_header(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct* nocapture readonly, i32) #0 {
  %4 = alloca [18 x i8], align 16
  %5 = getelementptr inbounds [18 x i8], [18 x i8]* %4, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* nonnull %5, i8 0, i64 18, i32 16, i1 false)
  %6 = icmp sgt i32 %2, 0
  br i1 %6, label %7, label %15

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds [18 x i8], [18 x i8]* %4, i64 0, i64 1
  store i8 1, i8* %8, align 1
  %9 = trunc i32 %2 to i8
  %10 = getelementptr inbounds [18 x i8], [18 x i8]* %4, i64 0, i64 5
  store i8 %9, i8* %10, align 1
  %11 = lshr i32 %2, 8
  %12 = trunc i32 %11 to i8
  %13 = getelementptr inbounds [18 x i8], [18 x i8]* %4, i64 0, i64 6
  store i8 %12, i8* %13, align 2
  %14 = getelementptr inbounds [18 x i8], [18 x i8]* %4, i64 0, i64 7
  store i8 24, i8* %14, align 1
  br label %15

; <label>:15:                                     ; preds = %7, %3
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %17 = load i32, i32* %16, align 8
  %18 = trunc i32 %17 to i8
  %19 = getelementptr inbounds [18 x i8], [18 x i8]* %4, i64 0, i64 12
  store i8 %18, i8* %19, align 4
  %20 = lshr i32 %17, 8
  %21 = trunc i32 %20 to i8
  %22 = getelementptr inbounds [18 x i8], [18 x i8]* %4, i64 0, i64 13
  store i8 %21, i8* %22, align 1
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %24 = load i32, i32* %23, align 4
  %25 = trunc i32 %24 to i8
  %26 = getelementptr inbounds [18 x i8], [18 x i8]* %4, i64 0, i64 14
  store i8 %25, i8* %26, align 2
  %27 = lshr i32 %24, 8
  %28 = trunc i32 %27 to i8
  %29 = getelementptr inbounds [18 x i8], [18 x i8]* %4, i64 0, i64 15
  store i8 %28, i8* %29, align 1
  %30 = getelementptr inbounds [18 x i8], [18 x i8]* %4, i64 0, i64 17
  store i8 32, i8* %30, align 1
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 10
  %32 = load i32, i32* %31, align 8
  %33 = icmp eq i32 %32, 1
  %34 = getelementptr inbounds [18 x i8], [18 x i8]* %4, i64 0, i64 2
  %.sink2 = select i1 %6, i8 1, i8 2
  %.sink2.sink = select i1 %33, i8 3, i8 %.sink2
  %35 = or i1 %6, %33
  %.sink.sink = select i1 %35, i8 8, i8 24
  store i8 %.sink2.sink, i8* %34, align 2
  %36 = getelementptr inbounds [18 x i8], [18 x i8]* %4, i64 0, i64 16
  store i8 %.sink.sink, i8* %36, align 16
  %37 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 3
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** %37, align 8
  %39 = call i64 @fwrite(i8* nonnull %5, i64 1, i64 18, %struct._IO_FILE* %38)
  %40 = icmp eq i64 %39, 18
  br i1 %40, label %49, label %41

; <label>:41:                                     ; preds = %15
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i64 0, i32 5
  store i32 36, i32* %44, align 8
  %45 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %46 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %45, i64 0, i32 0
  %47 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %46, align 8
  %48 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %47(%struct.jpeg_common_struct* %48) #5
  br label %49

; <label>:49:                                     ; preds = %15, %41
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put_demapped_gray(%struct.jpeg_decompress_struct* nocapture readonly, %struct.djpeg_dest_struct* nocapture readonly, i32) #0 {
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %5 = load i8**, i8*** %4, align 8
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 4
  %8 = load i8**, i8*** %7, align 8
  %9 = load i8*, i8** %8, align 8
  %10 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1
  %11 = bitcast %struct.djpeg_dest_struct* %10 to i8**
  %12 = load i8*, i8** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %14 = load i32, i32* %13, align 8
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %3
  %16 = add i32 %14, -1
  %xtraiter = and i32 %14, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.05.prol = phi i32 [ %23, %.lr.ph.prol ], [ %14, %.lr.ph.prol.preheader ]
  %.014.prol = phi i8* [ %22, %.lr.ph.prol ], [ %12, %.lr.ph.prol.preheader ]
  %.023.prol = phi i8* [ %17, %.lr.ph.prol ], [ %9, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %17 = getelementptr inbounds i8, i8* %.023.prol, i64 1
  %18 = load i8, i8* %.023.prol, align 1
  %19 = zext i8 %18 to i64
  %20 = getelementptr inbounds i8, i8* %6, i64 %19
  %21 = load i8, i8* %20, align 1
  %22 = getelementptr inbounds i8, i8* %.014.prol, i64 1
  store i8 %21, i8* %.014.prol, align 1
  %23 = add i32 %.05.prol, -1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.05.unr = phi i32 [ %14, %.lr.ph.preheader ], [ %23, %.lr.ph.prol.loopexit.loopexit ]
  %.014.unr = phi i8* [ %12, %.lr.ph.preheader ], [ %22, %.lr.ph.prol.loopexit.loopexit ]
  %.023.unr = phi i8* [ %9, %.lr.ph.preheader ], [ %17, %.lr.ph.prol.loopexit.loopexit ]
  %24 = icmp ult i32 %16, 3
  br i1 %24, label %._crit_edge, label %.lr.ph.preheader12

.lr.ph.preheader12:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader12, %.lr.ph
  %.05 = phi i32 [ %49, %.lr.ph ], [ %.05.unr, %.lr.ph.preheader12 ]
  %.014 = phi i8* [ %48, %.lr.ph ], [ %.014.unr, %.lr.ph.preheader12 ]
  %.023 = phi i8* [ %43, %.lr.ph ], [ %.023.unr, %.lr.ph.preheader12 ]
  %25 = getelementptr inbounds i8, i8* %.023, i64 1
  %26 = load i8, i8* %.023, align 1
  %27 = zext i8 %26 to i64
  %28 = getelementptr inbounds i8, i8* %6, i64 %27
  %29 = load i8, i8* %28, align 1
  %30 = getelementptr inbounds i8, i8* %.014, i64 1
  store i8 %29, i8* %.014, align 1
  %31 = getelementptr inbounds i8, i8* %.023, i64 2
  %32 = load i8, i8* %25, align 1
  %33 = zext i8 %32 to i64
  %34 = getelementptr inbounds i8, i8* %6, i64 %33
  %35 = load i8, i8* %34, align 1
  %36 = getelementptr inbounds i8, i8* %.014, i64 2
  store i8 %35, i8* %30, align 1
  %37 = getelementptr inbounds i8, i8* %.023, i64 3
  %38 = load i8, i8* %31, align 1
  %39 = zext i8 %38 to i64
  %40 = getelementptr inbounds i8, i8* %6, i64 %39
  %41 = load i8, i8* %40, align 1
  %42 = getelementptr inbounds i8, i8* %.014, i64 3
  store i8 %41, i8* %36, align 1
  %43 = getelementptr inbounds i8, i8* %.023, i64 4
  %44 = load i8, i8* %37, align 1
  %45 = zext i8 %44 to i64
  %46 = getelementptr inbounds i8, i8* %6, i64 %45
  %47 = load i8, i8* %46, align 1
  %48 = getelementptr inbounds i8, i8* %.014, i64 4
  store i8 %47, i8* %42, align 1
  %49 = add i32 %.05, -4
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %3
  %51 = load i8*, i8** %11, align 8
  %52 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1, i32 1
  %53 = bitcast void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %52 to i32*
  %54 = load i32, i32* %53, align 8
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 3
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** %56, align 8
  %58 = tail call i64 @fwrite(i8* %51, i64 1, i64 %55, %struct._IO_FILE* %57)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put_gray_rows(%struct.jpeg_decompress_struct* nocapture readonly, %struct.djpeg_dest_struct* nocapture readonly, i32) #0 {
  %4 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 4
  %5 = load i8**, i8*** %4, align 8
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1
  %8 = bitcast %struct.djpeg_dest_struct* %7 to i8**
  %9 = load i8*, i8** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %11 = load i32, i32* %10, align 8
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %3
  %13 = add i32 %11, -1
  %xtraiter = and i32 %11, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.05.prol = phi i32 [ %17, %.lr.ph.prol ], [ %11, %.lr.ph.prol.preheader ]
  %.014.prol = phi i8* [ %16, %.lr.ph.prol ], [ %9, %.lr.ph.prol.preheader ]
  %.023.prol = phi i8* [ %14, %.lr.ph.prol ], [ %6, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %14 = getelementptr inbounds i8, i8* %.023.prol, i64 1
  %15 = load i8, i8* %.023.prol, align 1
  %16 = getelementptr inbounds i8, i8* %.014.prol, i64 1
  store i8 %15, i8* %.014.prol, align 1
  %17 = add i32 %.05.prol, -1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.05.unr = phi i32 [ %11, %.lr.ph.preheader ], [ %17, %.lr.ph.prol.loopexit.loopexit ]
  %.014.unr = phi i8* [ %9, %.lr.ph.preheader ], [ %16, %.lr.ph.prol.loopexit.loopexit ]
  %.023.unr = phi i8* [ %6, %.lr.ph.preheader ], [ %14, %.lr.ph.prol.loopexit.loopexit ]
  %18 = icmp ult i32 %13, 7
  br i1 %18, label %._crit_edge, label %.lr.ph.preheader12

.lr.ph.preheader12:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader12, %.lr.ph
  %.05 = phi i32 [ %43, %.lr.ph ], [ %.05.unr, %.lr.ph.preheader12 ]
  %.014 = phi i8* [ %42, %.lr.ph ], [ %.014.unr, %.lr.ph.preheader12 ]
  %.023 = phi i8* [ %40, %.lr.ph ], [ %.023.unr, %.lr.ph.preheader12 ]
  %19 = getelementptr inbounds i8, i8* %.023, i64 1
  %20 = load i8, i8* %.023, align 1
  %21 = getelementptr inbounds i8, i8* %.014, i64 1
  store i8 %20, i8* %.014, align 1
  %22 = getelementptr inbounds i8, i8* %.023, i64 2
  %23 = load i8, i8* %19, align 1
  %24 = getelementptr inbounds i8, i8* %.014, i64 2
  store i8 %23, i8* %21, align 1
  %25 = getelementptr inbounds i8, i8* %.023, i64 3
  %26 = load i8, i8* %22, align 1
  %27 = getelementptr inbounds i8, i8* %.014, i64 3
  store i8 %26, i8* %24, align 1
  %28 = getelementptr inbounds i8, i8* %.023, i64 4
  %29 = load i8, i8* %25, align 1
  %30 = getelementptr inbounds i8, i8* %.014, i64 4
  store i8 %29, i8* %27, align 1
  %31 = getelementptr inbounds i8, i8* %.023, i64 5
  %32 = load i8, i8* %28, align 1
  %33 = getelementptr inbounds i8, i8* %.014, i64 5
  store i8 %32, i8* %30, align 1
  %34 = getelementptr inbounds i8, i8* %.023, i64 6
  %35 = load i8, i8* %31, align 1
  %36 = getelementptr inbounds i8, i8* %.014, i64 6
  store i8 %35, i8* %33, align 1
  %37 = getelementptr inbounds i8, i8* %.023, i64 7
  %38 = load i8, i8* %34, align 1
  %39 = getelementptr inbounds i8, i8* %.014, i64 7
  store i8 %38, i8* %36, align 1
  %40 = getelementptr inbounds i8, i8* %.023, i64 8
  %41 = load i8, i8* %37, align 1
  %42 = getelementptr inbounds i8, i8* %.014, i64 8
  store i8 %41, i8* %39, align 1
  %43 = add i32 %.05, -8
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %3
  %45 = load i8*, i8** %8, align 8
  %46 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1, i32 1
  %47 = bitcast void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %46 to i32*
  %48 = load i32, i32* %47, align 8
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 3
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** %50, align 8
  %52 = tail call i64 @fwrite(i8* %45, i64 1, i64 %49, %struct._IO_FILE* %51)
  ret void
}

; Function Attrs: nounwind
declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) #2

; Function Attrs: noinline nounwind uwtable
define internal void @put_pixel_rows(%struct.jpeg_decompress_struct* nocapture readonly, %struct.djpeg_dest_struct* nocapture readonly, i32) #0 {
  %4 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 4
  %5 = load i8**, i8*** %4, align 8
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1
  %8 = bitcast %struct.djpeg_dest_struct* %7 to i8**
  %9 = load i8*, i8** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %11 = load i32, i32* %10, align 8
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %3
  %xtraiter = and i32 %11, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %13 = getelementptr inbounds i8, i8* %6, i64 2
  %14 = load i8, i8* %13, align 1
  store i8 %14, i8* %9, align 1
  %15 = getelementptr inbounds i8, i8* %6, i64 1
  %16 = load i8, i8* %15, align 1
  %17 = getelementptr inbounds i8, i8* %9, i64 1
  store i8 %16, i8* %17, align 1
  %18 = load i8, i8* %6, align 1
  %19 = getelementptr inbounds i8, i8* %9, i64 2
  store i8 %18, i8* %19, align 1
  %20 = getelementptr inbounds i8, i8* %6, i64 3
  %21 = getelementptr inbounds i8, i8* %9, i64 3
  %22 = add i32 %11, -1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.05.unr = phi i32 [ %11, %.lr.ph.preheader ], [ %22, %.lr.ph.prol ]
  %.014.unr = phi i8* [ %9, %.lr.ph.preheader ], [ %21, %.lr.ph.prol ]
  %.023.unr = phi i8* [ %6, %.lr.ph.preheader ], [ %20, %.lr.ph.prol ]
  %23 = icmp eq i32 %11, 1
  br i1 %23, label %._crit_edge, label %.lr.ph.preheader8

.lr.ph.preheader8:                                ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader8, %.lr.ph
  %.05 = phi i32 [ %42, %.lr.ph ], [ %.05.unr, %.lr.ph.preheader8 ]
  %.014 = phi i8* [ %41, %.lr.ph ], [ %.014.unr, %.lr.ph.preheader8 ]
  %.023 = phi i8* [ %40, %.lr.ph ], [ %.023.unr, %.lr.ph.preheader8 ]
  %24 = getelementptr inbounds i8, i8* %.023, i64 2
  %25 = load i8, i8* %24, align 1
  store i8 %25, i8* %.014, align 1
  %26 = getelementptr inbounds i8, i8* %.023, i64 1
  %27 = load i8, i8* %26, align 1
  %28 = getelementptr inbounds i8, i8* %.014, i64 1
  store i8 %27, i8* %28, align 1
  %29 = load i8, i8* %.023, align 1
  %30 = getelementptr inbounds i8, i8* %.014, i64 2
  store i8 %29, i8* %30, align 1
  %31 = getelementptr inbounds i8, i8* %.023, i64 3
  %32 = getelementptr inbounds i8, i8* %.014, i64 3
  %33 = getelementptr inbounds i8, i8* %.023, i64 5
  %34 = load i8, i8* %33, align 1
  store i8 %34, i8* %32, align 1
  %35 = getelementptr inbounds i8, i8* %.023, i64 4
  %36 = load i8, i8* %35, align 1
  %37 = getelementptr inbounds i8, i8* %.014, i64 4
  store i8 %36, i8* %37, align 1
  %38 = load i8, i8* %31, align 1
  %39 = getelementptr inbounds i8, i8* %.014, i64 5
  store i8 %38, i8* %39, align 1
  %40 = getelementptr inbounds i8, i8* %.023, i64 6
  %41 = getelementptr inbounds i8, i8* %.014, i64 6
  %42 = add i32 %.05, -2
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %3
  %44 = load i8*, i8** %8, align 8
  %45 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1, i32 1
  %46 = bitcast void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %45 to i32*
  %47 = load i32, i32* %46, align 8
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 3
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** %49, align 8
  %51 = tail call i64 @fwrite(i8* %44, i64 1, i64 %48, %struct._IO_FILE* %50)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #2

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}

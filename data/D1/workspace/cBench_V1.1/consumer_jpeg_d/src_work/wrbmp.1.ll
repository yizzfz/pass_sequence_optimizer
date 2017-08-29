; ModuleID = 'wrbmp.ll'
source_filename = "wrbmp.c"
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
%struct.cdjpeg_progress_mgr = type { %struct.jpeg_progress_mgr, i32, i32, i32 }
%struct.bmp_dest_struct = type { %struct.djpeg_dest_struct, i32, %struct.jvirt_sarray_control*, i32, i32, i32, i32 }

; Function Attrs: noinline nounwind uwtable
define %struct.djpeg_dest_struct* @jinit_write_bmp(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %4 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %4, i64 0, i32 0
  %6 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %5, align 8
  %7 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %8 = tail call i8* %6(%struct.jpeg_common_struct* %7, i32 1, i64 80) #6
  %9 = bitcast i8* %8 to void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)**
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @start_output_bmp, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %9, align 8
  %10 = getelementptr inbounds i8, i8* %8, i64 16
  %11 = bitcast i8* %10 to void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)**
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @finish_output_bmp, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %11, align 8
  %12 = getelementptr inbounds i8, i8* %8, i64 48
  %13 = bitcast i8* %12 to i32*
  store i32 %1, i32* %13, align 8
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 10
  %15 = load i32, i32* %14, align 8
  switch i32 %15, label %25 [
    i32 1, label %16
    i32 2, label %19
  ]

; <label>:16:                                     ; preds = %2
  %17 = getelementptr inbounds i8, i8* %8, i64 8
  %18 = bitcast i8* %17 to void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)**
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_gray_rows, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %18, align 8
  br label %32

; <label>:19:                                     ; preds = %2
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %21 = load i32, i32* %20, align 4
  %22 = icmp ne i32 %21, 0
  %23 = getelementptr inbounds i8, i8* %8, i64 8
  %24 = bitcast i8* %23 to void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)**
  %put_pixel_rows.sink = select i1 %22, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_gray_rows, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_pixel_rows
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* %put_pixel_rows.sink, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %24, align 8
  br label %32

; <label>:25:                                     ; preds = %2
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i64 0, i32 5
  store i32 1005, i32* %28, align 8
  %29 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %29, i64 0, i32 0
  %31 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %30, align 8
  tail call void %31(%struct.jpeg_common_struct* %7) #6
  br label %32

; <label>:32:                                     ; preds = %19, %25, %16
  tail call void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct* nonnull %0) #6
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %34 = load i32, i32* %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 29
  %36 = load i32, i32* %35, align 4
  %37 = mul i32 %36, %34
  %38 = getelementptr inbounds i8, i8* %8, i64 64
  %39 = bitcast i8* %38 to i32*
  store i32 %37, i32* %39, align 8
  br label %40

; <label>:40:                                     ; preds = %40, %32
  %.0 = phi i32 [ %37, %32 ], [ %43, %40 ]
  %41 = and i32 %.0, 3
  %42 = icmp eq i32 %41, 0
  %43 = add i32 %.0, 1
  br i1 %42, label %44, label %40

; <label>:44:                                     ; preds = %40
  %45 = getelementptr inbounds i8, i8* %8, i64 68
  %46 = bitcast i8* %45 to i32*
  store i32 %.0, i32* %46, align 4
  %47 = load i32, i32* %39, align 8
  %48 = sub i32 %.0, %47
  %49 = getelementptr inbounds i8, i8* %8, i64 72
  %50 = bitcast i8* %49 to i32*
  store i32 %48, i32* %50, align 8
  %51 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %3, align 8
  %52 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %51, i64 0, i32 4
  %53 = load %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %55 = load i32, i32* %54, align 4
  %56 = tail call %struct.jvirt_sarray_control* %53(%struct.jpeg_common_struct* %7, i32 1, i32 0, i32 %.0, i32 %55, i32 1) #6
  %57 = getelementptr inbounds i8, i8* %8, i64 56
  %58 = bitcast i8* %57 to %struct.jvirt_sarray_control**
  store %struct.jvirt_sarray_control* %56, %struct.jvirt_sarray_control** %58, align 8
  %59 = getelementptr inbounds i8, i8* %8, i64 76
  %60 = bitcast i8* %59 to i32*
  store i32 0, i32* %60, align 4
  %61 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 2
  %62 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %61, align 8
  %63 = icmp eq %struct.jpeg_progress_mgr* %62, null
  br i1 %63, label %69, label %64

; <label>:64:                                     ; preds = %44
  %65 = bitcast %struct.jpeg_progress_mgr* %62 to %struct.cdjpeg_progress_mgr*
  %66 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %65, i64 0, i32 2
  %67 = load i32, i32* %66, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %66, align 4
  br label %69

; <label>:69:                                     ; preds = %44, %64
  %70 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %3, align 8
  %71 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %70, i64 0, i32 2
  %72 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %71, align 8
  %73 = tail call i8** %72(%struct.jpeg_common_struct* nonnull %7, i32 1, i32 %.0, i32 1) #6
  %74 = getelementptr inbounds i8, i8* %8, i64 32
  %75 = bitcast i8* %74 to i8***
  store i8** %73, i8*** %75, align 8
  %76 = getelementptr inbounds i8, i8* %8, i64 40
  %77 = bitcast i8* %76 to i32*
  store i32 1, i32* %77, align 8
  %78 = bitcast i8* %8 to %struct.djpeg_dest_struct*
  ret %struct.djpeg_dest_struct* %78
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal void @start_output_bmp(%struct.jpeg_decompress_struct* nocapture, %struct.djpeg_dest_struct* nocapture) #1 {
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_output_bmp(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct* nocapture readonly) #0 {
  %3 = bitcast %struct.djpeg_dest_struct* %1 to %struct.bmp_dest_struct*
  %4 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 3
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 2
  %7 = bitcast %struct.jpeg_progress_mgr** %6 to %struct.cdjpeg_progress_mgr**
  %8 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %7, align 8
  %9 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1
  %10 = bitcast %struct.djpeg_dest_struct* %9 to i32*
  %11 = load i32, i32* %10, align 8
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %14, label %13

; <label>:13:                                     ; preds = %2
  tail call void @write_os2_header(%struct.jpeg_decompress_struct* nonnull %0, %struct.bmp_dest_struct* %3)
  br label %15

; <label>:14:                                     ; preds = %2
  tail call void @write_bmp_header(%struct.jpeg_decompress_struct* nonnull %0, %struct.bmp_dest_struct* %3)
  br label %15

; <label>:15:                                     ; preds = %14, %13
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %17 = load i32, i32* %16, align 4
  %18 = icmp eq i32 %17, 0
  %19 = icmp ne %struct.cdjpeg_progress_mgr* %8, null
  br i1 %18, label %._crit_edge8, label %.lr.ph7

.lr.ph7:                                          ; preds = %15
  %20 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %8, i64 0, i32 0, i32 1
  %21 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %8, i64 0, i32 0, i32 2
  %22 = bitcast %struct.cdjpeg_progress_mgr* %8 to void (%struct.jpeg_common_struct*)**
  %23 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %25 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %26 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1, i32 1
  %27 = bitcast void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %26 to %struct.jvirt_sarray_control**
  %28 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %3, i64 0, i32 4
  br i1 %19, label %.lr.ph7.split.us.preheader, label %.lr.ph7.split.preheader

.lr.ph7.split.preheader:                          ; preds = %.lr.ph7
  br label %.lr.ph7.split

.lr.ph7.split.us.preheader:                       ; preds = %.lr.ph7
  br label %.lr.ph7.split.us

.lr.ph7.split.us:                                 ; preds = %.lr.ph7.split.us.preheader, %._crit_edge.us
  %.015.us = phi i32 [ %50, %._crit_edge.us ], [ %17, %.lr.ph7.split.us.preheader ]
  %29 = load i32, i32* %16, align 4
  %30 = sub i32 %29, %.015.us
  %31 = zext i32 %30 to i64
  store i64 %31, i64* %20, align 8
  %32 = load i32, i32* %16, align 4
  %33 = zext i32 %32 to i64
  store i64 %33, i64* %21, align 8
  %34 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %22, align 8
  tail call void %34(%struct.jpeg_common_struct* %23) #6
  %35 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %24, align 8
  %36 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %35, i64 0, i32 7
  %37 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %36, align 8
  %38 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %27, align 8
  %39 = add i32 %.015.us, -1
  %40 = tail call i8** %37(%struct.jpeg_common_struct* %25, %struct.jvirt_sarray_control* %38, i32 %39, i32 1, i32 0) #6
  %41 = load i32, i32* %28, align 4
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %._crit_edge.us, label %.lr.ph.us.preheader

.lr.ph.us.preheader:                              ; preds = %.lr.ph7.split.us
  %43 = load i8*, i8** %40, align 8
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %.lr.ph.us
  %.04.us = phi i32 [ %48, %.lr.ph.us ], [ %41, %.lr.ph.us.preheader ]
  %.023.us = phi i8* [ %47, %.lr.ph.us ], [ %43, %.lr.ph.us.preheader ]
  %44 = load i8, i8* %.023.us, align 1
  %45 = zext i8 %44 to i32
  %46 = tail call i32 @_IO_putc(i32 %45, %struct._IO_FILE* %5)
  %47 = getelementptr inbounds i8, i8* %.023.us, i64 1
  %48 = add i32 %.04.us, -1
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %._crit_edge.us.loopexit, label %.lr.ph.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.lr.ph7.split.us
  %50 = add i32 %.015.us, -1
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %._crit_edge8.loopexit, label %.lr.ph7.split.us

.lr.ph7.split:                                    ; preds = %.lr.ph7.split.preheader, %._crit_edge
  %.015 = phi i32 [ %67, %._crit_edge ], [ %17, %.lr.ph7.split.preheader ]
  %52 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %24, align 8
  %53 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %52, i64 0, i32 7
  %54 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %53, align 8
  %55 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %27, align 8
  %56 = add i32 %.015, -1
  %57 = tail call i8** %54(%struct.jpeg_common_struct* %25, %struct.jvirt_sarray_control* %55, i32 %56, i32 1, i32 0) #6
  %58 = load i32, i32* %28, align 4
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph7.split
  %60 = load i8*, i8** %57, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.04 = phi i32 [ %65, %.lr.ph ], [ %58, %.lr.ph.preheader ]
  %.023 = phi i8* [ %64, %.lr.ph ], [ %60, %.lr.ph.preheader ]
  %61 = load i8, i8* %.023, align 1
  %62 = zext i8 %61 to i32
  %63 = tail call i32 @_IO_putc(i32 %62, %struct._IO_FILE* %5)
  %64 = getelementptr inbounds i8, i8* %.023, i64 1
  %65 = add i32 %.04, -1
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph7.split
  %67 = add i32 %.015, -1
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %._crit_edge8.loopexit12, label %.lr.ph7.split

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8.loopexit12:                          ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit12, %._crit_edge8.loopexit, %15
  br i1 %19, label %69, label %73

; <label>:69:                                     ; preds = %._crit_edge8
  %70 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %8, i64 0, i32 1
  %71 = load i32, i32* %70, align 8
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %70, align 8
  br label %73

; <label>:73:                                     ; preds = %69, %._crit_edge8
  %74 = tail call i32 @fflush(%struct._IO_FILE* %5)
  %75 = tail call i32 @ferror(%struct._IO_FILE* %5) #6
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %85, label %77

; <label>:77:                                     ; preds = %73
  %78 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %79 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %78, align 8
  %80 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %79, i64 0, i32 5
  store i32 36, i32* %80, align 8
  %81 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %78, align 8
  %82 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %81, i64 0, i32 0
  %83 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %82, align 8
  %84 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %83(%struct.jpeg_common_struct* %84) #6
  br label %85

; <label>:85:                                     ; preds = %73, %77
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put_gray_rows(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct* nocapture, i32) #0 {
  %4 = bitcast %struct.djpeg_dest_struct* %1 to %struct.bmp_dest_struct*
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %6 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %6, i64 0, i32 7
  %8 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %7, align 8
  %9 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %10 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1, i32 1
  %11 = bitcast void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %10 to %struct.jvirt_sarray_control**
  %12 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %11, align 8
  %13 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %4, i64 0, i32 6
  %14 = load i32, i32* %13, align 4
  %15 = tail call i8** %8(%struct.jpeg_common_struct* %9, %struct.jvirt_sarray_control* %12, i32 %14, i32 1, i32 1) #6
  %16 = load i32, i32* %13, align 4
  %17 = add i32 %16, 1
  store i32 %17, i32* %13, align 4
  %18 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 4
  %19 = load i8**, i8*** %18, align 8
  %20 = load i8*, i8** %19, align 8
  %21 = load i8*, i8** %15, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %23 = load i32, i32* %22, align 8
  %24 = zext i32 %23 to i64
  %25 = icmp eq i32 %23, 0
  br i1 %25, label %._crit_edge11, label %.lr.ph10.preheader

.lr.ph10.preheader:                               ; preds = %3
  %26 = add i32 %23, -1
  %xtraiter = and i32 %23, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph10.prol.loopexit, label %.lr.ph10.prol.preheader

.lr.ph10.prol.preheader:                          ; preds = %.lr.ph10.preheader
  br label %.lr.ph10.prol

.lr.ph10.prol:                                    ; preds = %.lr.ph10.prol.preheader, %.lr.ph10.prol
  %.018.prol = phi i32 [ %30, %.lr.ph10.prol ], [ %23, %.lr.ph10.prol.preheader ]
  %.027.prol = phi i8* [ %29, %.lr.ph10.prol ], [ %21, %.lr.ph10.prol.preheader ]
  %.036.prol = phi i8* [ %27, %.lr.ph10.prol ], [ %20, %.lr.ph10.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph10.prol ], [ %xtraiter, %.lr.ph10.prol.preheader ]
  %27 = getelementptr inbounds i8, i8* %.036.prol, i64 1
  %28 = load i8, i8* %.036.prol, align 1
  %29 = getelementptr inbounds i8, i8* %.027.prol, i64 1
  store i8 %28, i8* %.027.prol, align 1
  %30 = add i32 %.018.prol, -1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph10.prol.loopexit.loopexit, label %.lr.ph10.prol, !llvm.loop !1

.lr.ph10.prol.loopexit.loopexit:                  ; preds = %.lr.ph10.prol
  br label %.lr.ph10.prol.loopexit

.lr.ph10.prol.loopexit:                           ; preds = %.lr.ph10.prol.loopexit.loopexit, %.lr.ph10.preheader
  %.018.unr = phi i32 [ %23, %.lr.ph10.preheader ], [ %30, %.lr.ph10.prol.loopexit.loopexit ]
  %.027.unr = phi i8* [ %21, %.lr.ph10.preheader ], [ %29, %.lr.ph10.prol.loopexit.loopexit ]
  %.036.unr = phi i8* [ %20, %.lr.ph10.preheader ], [ %27, %.lr.ph10.prol.loopexit.loopexit ]
  %31 = icmp ult i32 %26, 7
  br i1 %31, label %._crit_edge11, label %.lr.ph10.preheader18

.lr.ph10.preheader18:                             ; preds = %.lr.ph10.prol.loopexit
  br label %.lr.ph10

.lr.ph10:                                         ; preds = %.lr.ph10.preheader18, %.lr.ph10
  %.018 = phi i32 [ %56, %.lr.ph10 ], [ %.018.unr, %.lr.ph10.preheader18 ]
  %.027 = phi i8* [ %55, %.lr.ph10 ], [ %.027.unr, %.lr.ph10.preheader18 ]
  %.036 = phi i8* [ %53, %.lr.ph10 ], [ %.036.unr, %.lr.ph10.preheader18 ]
  %32 = getelementptr inbounds i8, i8* %.036, i64 1
  %33 = load i8, i8* %.036, align 1
  %34 = getelementptr inbounds i8, i8* %.027, i64 1
  store i8 %33, i8* %.027, align 1
  %35 = getelementptr inbounds i8, i8* %.036, i64 2
  %36 = load i8, i8* %32, align 1
  %37 = getelementptr inbounds i8, i8* %.027, i64 2
  store i8 %36, i8* %34, align 1
  %38 = getelementptr inbounds i8, i8* %.036, i64 3
  %39 = load i8, i8* %35, align 1
  %40 = getelementptr inbounds i8, i8* %.027, i64 3
  store i8 %39, i8* %37, align 1
  %41 = getelementptr inbounds i8, i8* %.036, i64 4
  %42 = load i8, i8* %38, align 1
  %43 = getelementptr inbounds i8, i8* %.027, i64 4
  store i8 %42, i8* %40, align 1
  %44 = getelementptr inbounds i8, i8* %.036, i64 5
  %45 = load i8, i8* %41, align 1
  %46 = getelementptr inbounds i8, i8* %.027, i64 5
  store i8 %45, i8* %43, align 1
  %47 = getelementptr inbounds i8, i8* %.036, i64 6
  %48 = load i8, i8* %44, align 1
  %49 = getelementptr inbounds i8, i8* %.027, i64 6
  store i8 %48, i8* %46, align 1
  %50 = getelementptr inbounds i8, i8* %.036, i64 7
  %51 = load i8, i8* %47, align 1
  %52 = getelementptr inbounds i8, i8* %.027, i64 7
  store i8 %51, i8* %49, align 1
  %53 = getelementptr inbounds i8, i8* %.036, i64 8
  %54 = load i8, i8* %50, align 1
  %55 = getelementptr inbounds i8, i8* %.027, i64 8
  store i8 %54, i8* %52, align 1
  %56 = add i32 %.018, -8
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %._crit_edge11.loopexit, label %.lr.ph10

._crit_edge11.loopexit:                           ; preds = %.lr.ph10
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.lr.ph10.prol.loopexit, %3
  %58 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1, i32 3
  %59 = bitcast %struct._IO_FILE** %58 to i32*
  %60 = load i32, i32* %59, align 8
  %61 = icmp sgt i32 %60, 0
  br i1 %61, label %._crit_edge.loopexit, label %._crit_edge

._crit_edge.loopexit:                             ; preds = %._crit_edge11
  %scevgep = getelementptr i8, i8* %21, i64 %24
  %62 = xor i32 %60, -1
  %63 = icmp sgt i32 %62, -2
  %smax = select i1 %63, i32 %62, i32 -2
  %64 = add i32 %60, %smax
  %65 = add i32 %64, 1
  %66 = zext i32 %65 to i64
  %67 = add nuw nsw i64 %66, 1
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %67, i32 1, i1 false)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge11
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put_pixel_rows(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct* nocapture, i32) #0 {
  %4 = bitcast %struct.djpeg_dest_struct* %1 to %struct.bmp_dest_struct*
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %6 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %6, i64 0, i32 7
  %8 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %7, align 8
  %9 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %10 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1, i32 1
  %11 = bitcast void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %10 to %struct.jvirt_sarray_control**
  %12 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %11, align 8
  %13 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %4, i64 0, i32 6
  %14 = load i32, i32* %13, align 4
  %15 = tail call i8** %8(%struct.jpeg_common_struct* %9, %struct.jvirt_sarray_control* %12, i32 %14, i32 1, i32 1) #6
  %16 = load i32, i32* %13, align 4
  %17 = add i32 %16, 1
  store i32 %17, i32* %13, align 4
  %18 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 4
  %19 = load i8**, i8*** %18, align 8
  %20 = load i8*, i8** %19, align 8
  %21 = load i8*, i8** %15, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %23 = load i32, i32* %22, align 8
  %24 = zext i32 %23 to i64
  %25 = mul nuw nsw i64 %24, 3
  %26 = icmp eq i32 %23, 0
  br i1 %26, label %._crit_edge11, label %.lr.ph10.preheader

.lr.ph10.preheader:                               ; preds = %3
  %xtraiter = and i32 %23, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph10.prol.loopexit, label %.lr.ph10.prol

.lr.ph10.prol:                                    ; preds = %.lr.ph10.preheader
  %27 = getelementptr inbounds i8, i8* %20, i64 1
  %28 = load i8, i8* %20, align 1
  %29 = getelementptr inbounds i8, i8* %21, i64 2
  store i8 %28, i8* %29, align 1
  %30 = getelementptr inbounds i8, i8* %20, i64 2
  %31 = load i8, i8* %27, align 1
  %32 = getelementptr inbounds i8, i8* %21, i64 1
  store i8 %31, i8* %32, align 1
  %33 = getelementptr inbounds i8, i8* %20, i64 3
  %34 = load i8, i8* %30, align 1
  store i8 %34, i8* %21, align 1
  %35 = getelementptr inbounds i8, i8* %21, i64 3
  %36 = add i32 %23, -1
  br label %.lr.ph10.prol.loopexit

.lr.ph10.prol.loopexit:                           ; preds = %.lr.ph10.preheader, %.lr.ph10.prol
  %.018.unr = phi i32 [ %23, %.lr.ph10.preheader ], [ %36, %.lr.ph10.prol ]
  %.027.unr = phi i8* [ %21, %.lr.ph10.preheader ], [ %35, %.lr.ph10.prol ]
  %.036.unr = phi i8* [ %20, %.lr.ph10.preheader ], [ %33, %.lr.ph10.prol ]
  %37 = icmp eq i32 %23, 1
  br i1 %37, label %._crit_edge11, label %.lr.ph10.preheader14

.lr.ph10.preheader14:                             ; preds = %.lr.ph10.prol.loopexit
  br label %.lr.ph10

.lr.ph10:                                         ; preds = %.lr.ph10.preheader14, %.lr.ph10
  %.018 = phi i32 [ %56, %.lr.ph10 ], [ %.018.unr, %.lr.ph10.preheader14 ]
  %.027 = phi i8* [ %55, %.lr.ph10 ], [ %.027.unr, %.lr.ph10.preheader14 ]
  %.036 = phi i8* [ %53, %.lr.ph10 ], [ %.036.unr, %.lr.ph10.preheader14 ]
  %38 = getelementptr inbounds i8, i8* %.036, i64 1
  %39 = load i8, i8* %.036, align 1
  %40 = getelementptr inbounds i8, i8* %.027, i64 2
  store i8 %39, i8* %40, align 1
  %41 = getelementptr inbounds i8, i8* %.036, i64 2
  %42 = load i8, i8* %38, align 1
  %43 = getelementptr inbounds i8, i8* %.027, i64 1
  store i8 %42, i8* %43, align 1
  %44 = getelementptr inbounds i8, i8* %.036, i64 3
  %45 = load i8, i8* %41, align 1
  store i8 %45, i8* %.027, align 1
  %46 = getelementptr inbounds i8, i8* %.027, i64 3
  %47 = getelementptr inbounds i8, i8* %.036, i64 4
  %48 = load i8, i8* %44, align 1
  %49 = getelementptr inbounds i8, i8* %.027, i64 5
  store i8 %48, i8* %49, align 1
  %50 = getelementptr inbounds i8, i8* %.036, i64 5
  %51 = load i8, i8* %47, align 1
  %52 = getelementptr inbounds i8, i8* %.027, i64 4
  store i8 %51, i8* %52, align 1
  %53 = getelementptr inbounds i8, i8* %.036, i64 6
  %54 = load i8, i8* %50, align 1
  store i8 %54, i8* %46, align 1
  %55 = getelementptr inbounds i8, i8* %.027, i64 6
  %56 = add i32 %.018, -2
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %._crit_edge11.loopexit, label %.lr.ph10

._crit_edge11.loopexit:                           ; preds = %.lr.ph10
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.lr.ph10.prol.loopexit, %3
  %58 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1, i32 3
  %59 = bitcast %struct._IO_FILE** %58 to i32*
  %60 = load i32, i32* %59, align 8
  %61 = icmp sgt i32 %60, 0
  br i1 %61, label %._crit_edge.loopexit, label %._crit_edge

._crit_edge.loopexit:                             ; preds = %._crit_edge11
  %scevgep = getelementptr i8, i8* %21, i64 %25
  %62 = xor i32 %60, -1
  %63 = icmp sgt i32 %62, -2
  %smax = select i1 %63, i32 %62, i32 -2
  %64 = add i32 %60, %smax
  %65 = add i32 %64, 1
  %66 = zext i32 %65 to i64
  %67 = add nuw nsw i64 %66, 1
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %67, i32 1, i1 false)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge11
  ret void
}

declare void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @write_os2_header(%struct.jpeg_decompress_struct*, %struct.bmp_dest_struct* nocapture readonly) #0 {
  %3 = alloca [14 x i8], align 1
  %4 = alloca [12 x i8], align 1
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 10
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 2
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %10 = load i32, i32* %9, align 4
  %11 = icmp ne i32 %10, 0
  %.3 = select i1 %11, i32 256, i32 0
  %phitmp = select i1 %11, i8 8, i8 24
  br label %12

; <label>:12:                                     ; preds = %2, %8
  %.12 = phi i8 [ %phitmp, %8 ], [ 8, %2 ]
  %.1 = phi i32 [ %.3, %8 ], [ 256, %2 ]
  %13 = mul nuw nsw i32 %.1, 3
  %14 = or i32 %13, 26
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %1, i64 0, i32 4
  %17 = load i32, i32* %16, align 4
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %20 = load i32, i32* %19, align 4
  %21 = zext i32 %20 to i64
  %22 = mul nuw nsw i64 %21, %18
  %23 = add nuw nsw i64 %22, %15
  %24 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 0
  %25 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 6
  %26 = bitcast i8* %25 to i32*
  store i32 0, i32* %26, align 1
  %27 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 0
  %28 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 2
  %29 = bitcast i8* %28 to i16*
  store i16 0, i16* %29, align 1
  %30 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 0
  store i8 66, i8* %30, align 1
  %31 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 1
  store i8 77, i8* %31, align 1
  %32 = trunc i64 %23 to i8
  %33 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 2
  store i8 %32, i8* %33, align 1
  %34 = lshr i64 %23, 8
  %35 = trunc i64 %34 to i8
  %36 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 3
  store i8 %35, i8* %36, align 1
  %37 = lshr i64 %23, 16
  %38 = trunc i64 %37 to i8
  %39 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 4
  store i8 %38, i8* %39, align 1
  %40 = lshr i64 %23, 24
  %41 = trunc i64 %40 to i8
  %42 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 5
  store i8 %41, i8* %42, align 1
  %43 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 10
  store i8 26, i8* %43, align 1
  %44 = lshr exact i32 %13, 8
  %45 = trunc i32 %44 to i8
  %46 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 11
  store i8 %45, i8* %46, align 1
  %47 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 12
  store i8 0, i8* %47, align 1
  %48 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 13
  store i8 0, i8* %48, align 1
  %49 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 0
  store i8 12, i8* %49, align 1
  %50 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 1
  store i8 0, i8* %50, align 1
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %52 = load i32, i32* %51, align 8
  %53 = trunc i32 %52 to i8
  %54 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 4
  store i8 %53, i8* %54, align 1
  %55 = lshr i32 %52, 8
  %56 = trunc i32 %55 to i8
  %57 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 5
  store i8 %56, i8* %57, align 1
  %58 = load i32, i32* %19, align 4
  %59 = trunc i32 %58 to i8
  %60 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 6
  store i8 %59, i8* %60, align 1
  %61 = lshr i32 %58, 8
  %62 = trunc i32 %61 to i8
  %63 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 7
  store i8 %62, i8* %63, align 1
  %64 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 8
  store i8 1, i8* %64, align 1
  %65 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 9
  store i8 0, i8* %65, align 1
  %66 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 10
  store i8 %.12, i8* %66, align 1
  %67 = getelementptr inbounds [12 x i8], [12 x i8]* %4, i64 0, i64 11
  store i8 0, i8* %67, align 1
  %68 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %1, i64 0, i32 0, i32 3
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** %68, align 8
  %70 = call i64 @fwrite(i8* nonnull %24, i64 1, i64 14, %struct._IO_FILE* %69)
  %71 = icmp eq i64 %70, 14
  br i1 %71, label %80, label %72

; <label>:72:                                     ; preds = %12
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %74 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %73, align 8
  %75 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %74, i64 0, i32 5
  store i32 36, i32* %75, align 8
  %76 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %73, align 8
  %77 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %76, i64 0, i32 0
  %78 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %77, align 8
  %79 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %78(%struct.jpeg_common_struct* %79) #6
  br label %80

; <label>:80:                                     ; preds = %12, %72
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** %68, align 8
  %82 = call i64 @fwrite(i8* nonnull %27, i64 1, i64 12, %struct._IO_FILE* %81)
  %83 = icmp eq i64 %82, 12
  br i1 %83, label %92, label %84

; <label>:84:                                     ; preds = %80
  %85 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %86 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %85, align 8
  %87 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %86, i64 0, i32 5
  store i32 36, i32* %87, align 8
  %88 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %85, align 8
  %89 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %88, i64 0, i32 0
  %90 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %89, align 8
  %91 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %90(%struct.jpeg_common_struct* %91) #6
  br label %92

; <label>:92:                                     ; preds = %80, %84
  %93 = icmp eq i32 %.1, 0
  br i1 %93, label %95, label %94

; <label>:94:                                     ; preds = %92
  tail call void @write_colormap(%struct.jpeg_decompress_struct* nonnull %0, %struct.bmp_dest_struct* nonnull %1, i32 %.1, i32 3)
  br label %95

; <label>:95:                                     ; preds = %92, %94
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @write_bmp_header(%struct.jpeg_decompress_struct*, %struct.bmp_dest_struct* nocapture readonly) #0 {
  %3 = alloca [14 x i8], align 1
  %4 = alloca [40 x i8], align 16
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 10
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 2
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %10 = load i32, i32* %9, align 4
  %11 = icmp ne i32 %10, 0
  %.3 = select i1 %11, i32 256, i32 0
  %phitmp = select i1 %11, i8 8, i8 24
  br label %12

; <label>:12:                                     ; preds = %2, %8
  %.12 = phi i8 [ %phitmp, %8 ], [ 8, %2 ]
  %.1 = phi i32 [ %.3, %8 ], [ 256, %2 ]
  %13 = shl nuw nsw i32 %.1, 2
  %14 = or i32 %13, 54
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %1, i64 0, i32 4
  %17 = load i32, i32* %16, align 4
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %20 = load i32, i32* %19, align 4
  %21 = zext i32 %20 to i64
  %22 = mul nuw nsw i64 %21, %18
  %23 = add nuw nsw i64 %22, %15
  %24 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 0
  %25 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 6
  %26 = bitcast i8* %25 to i32*
  store i32 0, i32* %26, align 1
  %27 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* nonnull %27, i8 0, i64 40, i32 16, i1 false)
  %28 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 0
  store i8 66, i8* %28, align 1
  %29 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 1
  store i8 77, i8* %29, align 1
  %30 = trunc i64 %23 to i8
  %31 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 2
  store i8 %30, i8* %31, align 1
  %32 = lshr i64 %23, 8
  %33 = trunc i64 %32 to i8
  %34 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 3
  store i8 %33, i8* %34, align 1
  %35 = lshr i64 %23, 16
  %36 = trunc i64 %35 to i8
  %37 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 4
  store i8 %36, i8* %37, align 1
  %38 = lshr i64 %23, 24
  %39 = trunc i64 %38 to i8
  %40 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 5
  store i8 %39, i8* %40, align 1
  %41 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 10
  store i8 54, i8* %41, align 1
  %42 = lshr exact i32 %.1, 6
  %43 = trunc i32 %42 to i8
  %44 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 11
  store i8 %43, i8* %44, align 1
  %45 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 12
  store i8 0, i8* %45, align 1
  %46 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 13
  store i8 0, i8* %46, align 1
  %47 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 0
  store i8 40, i8* %47, align 16
  %48 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 1
  store i8 0, i8* %48, align 1
  %49 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %50 = load i32, i32* %49, align 8
  %51 = trunc i32 %50 to i8
  %52 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 4
  store i8 %51, i8* %52, align 4
  %53 = lshr i32 %50, 8
  %54 = trunc i32 %53 to i8
  %55 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 5
  store i8 %54, i8* %55, align 1
  %56 = load i32, i32* %49, align 8
  %57 = lshr i32 %56, 16
  %58 = trunc i32 %57 to i8
  %59 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 6
  store i8 %58, i8* %59, align 2
  %60 = lshr i32 %56, 24
  %61 = trunc i32 %60 to i8
  %62 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 7
  store i8 %61, i8* %62, align 1
  %63 = load i32, i32* %19, align 4
  %64 = trunc i32 %63 to i8
  %65 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 8
  store i8 %64, i8* %65, align 8
  %66 = lshr i32 %63, 8
  %67 = trunc i32 %66 to i8
  %68 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 9
  store i8 %67, i8* %68, align 1
  %69 = load i32, i32* %19, align 4
  %70 = lshr i32 %69, 16
  %71 = trunc i32 %70 to i8
  %72 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 10
  store i8 %71, i8* %72, align 2
  %73 = lshr i32 %69, 24
  %74 = trunc i32 %73 to i8
  %75 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 11
  store i8 %74, i8* %75, align 1
  %76 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 12
  store i8 1, i8* %76, align 4
  %77 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 13
  store i8 0, i8* %77, align 1
  %78 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 14
  store i8 %.12, i8* %78, align 2
  %79 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 15
  store i8 0, i8* %79, align 1
  %80 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 51
  %81 = load i8, i8* %80, align 8
  %82 = icmp eq i8 %81, 2
  br i1 %82, label %83, label %118

; <label>:83:                                     ; preds = %12
  %84 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 52
  %85 = load i16, i16* %84, align 2
  %86 = trunc i16 %85 to i8
  %87 = mul i8 %86, 100
  %88 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 24
  store i8 %87, i8* %88, align 8
  %89 = zext i16 %85 to i64
  %90 = mul nuw nsw i64 %89, 100
  %91 = lshr i64 %90, 8
  %92 = trunc i64 %91 to i8
  %93 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 25
  store i8 %92, i8* %93, align 1
  %94 = load i16, i16* %84, align 2
  %95 = zext i16 %94 to i64
  %96 = mul nuw nsw i64 %95, 100
  %97 = lshr i64 %96, 16
  %98 = trunc i64 %97 to i8
  %99 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 26
  store i8 %98, i8* %99, align 2
  %100 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 27
  store i8 0, i8* %100, align 1
  %101 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 53
  %102 = load i16, i16* %101, align 4
  %103 = trunc i16 %102 to i8
  %104 = mul i8 %103, 100
  %105 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 28
  store i8 %104, i8* %105, align 4
  %106 = zext i16 %102 to i64
  %107 = mul nuw nsw i64 %106, 100
  %108 = lshr i64 %107, 8
  %109 = trunc i64 %108 to i8
  %110 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 29
  store i8 %109, i8* %110, align 1
  %111 = load i16, i16* %101, align 4
  %112 = zext i16 %111 to i64
  %113 = mul nuw nsw i64 %112, 100
  %114 = lshr i64 %113, 16
  %115 = trunc i64 %114 to i8
  %116 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 30
  store i8 %115, i8* %116, align 2
  %117 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 31
  store i8 0, i8* %117, align 1
  br label %118

; <label>:118:                                    ; preds = %83, %12
  %119 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 32
  store i8 0, i8* %119, align 16
  %120 = lshr exact i32 %.1, 8
  %121 = trunc i32 %120 to i8
  %122 = getelementptr inbounds [40 x i8], [40 x i8]* %4, i64 0, i64 33
  store i8 %121, i8* %122, align 1
  %123 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %1, i64 0, i32 0, i32 3
  %124 = load %struct._IO_FILE*, %struct._IO_FILE** %123, align 8
  %125 = call i64 @fwrite(i8* nonnull %24, i64 1, i64 14, %struct._IO_FILE* %124)
  %126 = icmp eq i64 %125, 14
  br i1 %126, label %135, label %127

; <label>:127:                                    ; preds = %118
  %128 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %129 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %128, align 8
  %130 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %129, i64 0, i32 5
  store i32 36, i32* %130, align 8
  %131 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %128, align 8
  %132 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %131, i64 0, i32 0
  %133 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %132, align 8
  %134 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %133(%struct.jpeg_common_struct* %134) #6
  br label %135

; <label>:135:                                    ; preds = %118, %127
  %136 = load %struct._IO_FILE*, %struct._IO_FILE** %123, align 8
  %137 = call i64 @fwrite(i8* nonnull %27, i64 1, i64 40, %struct._IO_FILE* %136)
  %138 = icmp eq i64 %137, 40
  br i1 %138, label %147, label %139

; <label>:139:                                    ; preds = %135
  %140 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %141 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %140, align 8
  %142 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %141, i64 0, i32 5
  store i32 36, i32* %142, align 8
  %143 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %140, align 8
  %144 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %143, i64 0, i32 0
  %145 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %144, align 8
  %146 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %145(%struct.jpeg_common_struct* %146) #6
  br label %147

; <label>:147:                                    ; preds = %135, %139
  %148 = icmp eq i32 %.1, 0
  br i1 %148, label %150, label %149

; <label>:149:                                    ; preds = %147
  tail call void @write_colormap(%struct.jpeg_decompress_struct* nonnull %0, %struct.bmp_dest_struct* nonnull %1, i32 %.1, i32 4)
  br label %150

; <label>:150:                                    ; preds = %147, %149
  ret void
}

; Function Attrs: nounwind
declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind readonly
declare i32 @ferror(%struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: noinline nounwind uwtable
define internal void @write_colormap(%struct.jpeg_decompress_struct*, %struct.bmp_dest_struct* nocapture readonly, i32, i32) #0 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %6 = load i8**, i8*** %5, align 8
  %7 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %1, i64 0, i32 0, i32 3
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %9 = icmp eq i8** %6, null
  br i1 %9, label %.preheader3, label %16

.preheader3:                                      ; preds = %4
  %10 = icmp eq i32 %3, 4
  br i1 %10, label %.preheader3.split.us.preheader, label %.preheader3.split.preheader

.preheader3.split.preheader:                      ; preds = %.preheader3
  br label %.preheader3.split

.preheader3.split.us.preheader:                   ; preds = %.preheader3
  br label %.preheader3.split.us

.preheader3.split.us:                             ; preds = %.preheader3.split.us.preheader, %.preheader3.split.us
  %.39.us = phi i32 [ %15, %.preheader3.split.us ], [ 0, %.preheader3.split.us.preheader ]
  %11 = tail call i32 @_IO_putc(i32 %.39.us, %struct._IO_FILE* %8)
  %12 = tail call i32 @_IO_putc(i32 %.39.us, %struct._IO_FILE* %8)
  %13 = tail call i32 @_IO_putc(i32 %.39.us, %struct._IO_FILE* %8)
  %14 = tail call i32 @_IO_putc(i32 0, %struct._IO_FILE* %8)
  %15 = add nuw nsw i32 %.39.us, 1
  %exitcond.us = icmp eq i32 %15, 256
  br i1 %exitcond.us, label %.loopexit.loopexit, label %.preheader3.split.us

; <label>:16:                                     ; preds = %4
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 31
  %18 = load i32, i32* %17, align 4
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %20 = load i32, i32* %19, align 8
  %21 = icmp eq i32 %20, 3
  %22 = sext i32 %18 to i64
  %23 = icmp sgt i32 %18, 0
  br i1 %21, label %.preheader4, label %.preheader6

.preheader6:                                      ; preds = %16
  br i1 %23, label %.lr.ph13, label %.loopexit

.lr.ph13:                                         ; preds = %.preheader6
  %24 = icmp eq i32 %3, 4
  br i1 %24, label %.lr.ph13.split.us.preheader, label %.lr.ph13.split.preheader

.lr.ph13.split.preheader:                         ; preds = %.lr.ph13
  br label %.lr.ph13.split

.lr.ph13.split.us.preheader:                      ; preds = %.lr.ph13
  br label %.lr.ph13.split.us

.lr.ph13.split.us:                                ; preds = %.lr.ph13.split.us.preheader, %.lr.ph13.split.us
  %indvars.iv112.us = phi i64 [ %indvars.iv.next2.us, %.lr.ph13.split.us ], [ 0, %.lr.ph13.split.us.preheader ]
  %25 = load i8*, i8** %6, align 8
  %26 = getelementptr inbounds i8, i8* %25, i64 %indvars.iv112.us
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = tail call i32 @_IO_putc(i32 %28, %struct._IO_FILE* %8)
  %30 = load i8*, i8** %6, align 8
  %31 = getelementptr inbounds i8, i8* %30, i64 %indvars.iv112.us
  %32 = load i8, i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = tail call i32 @_IO_putc(i32 %33, %struct._IO_FILE* %8)
  %35 = load i8*, i8** %6, align 8
  %36 = getelementptr inbounds i8, i8* %35, i64 %indvars.iv112.us
  %37 = load i8, i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = tail call i32 @_IO_putc(i32 %38, %struct._IO_FILE* %8)
  %40 = tail call i32 @_IO_putc(i32 0, %struct._IO_FILE* %8)
  %indvars.iv.next2.us = add nuw nsw i64 %indvars.iv112.us, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next2.us, %22
  br i1 %exitcond24, label %.loopexit.loopexit42, label %.lr.ph13.split.us

.preheader4:                                      ; preds = %16
  br i1 %23, label %.lr.ph11, label %.loopexit

.lr.ph11:                                         ; preds = %.preheader4
  %41 = getelementptr inbounds i8*, i8** %6, i64 2
  %42 = getelementptr inbounds i8*, i8** %6, i64 1
  %43 = icmp eq i32 %3, 4
  br i1 %43, label %.lr.ph11.split.us.preheader, label %.lr.ph11.split.preheader

.lr.ph11.split.preheader:                         ; preds = %.lr.ph11
  br label %.lr.ph11.split

.lr.ph11.split.us.preheader:                      ; preds = %.lr.ph11
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %.lr.ph11.split.us.preheader, %.lr.ph11.split.us
  %indvars.iv10.us = phi i64 [ %indvars.iv.next.us, %.lr.ph11.split.us ], [ 0, %.lr.ph11.split.us.preheader ]
  %44 = load i8*, i8** %41, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 %indvars.iv10.us
  %46 = load i8, i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = tail call i32 @_IO_putc(i32 %47, %struct._IO_FILE* %8)
  %49 = load i8*, i8** %42, align 8
  %50 = getelementptr inbounds i8, i8* %49, i64 %indvars.iv10.us
  %51 = load i8, i8* %50, align 1
  %52 = zext i8 %51 to i32
  %53 = tail call i32 @_IO_putc(i32 %52, %struct._IO_FILE* %8)
  %54 = load i8*, i8** %6, align 8
  %55 = getelementptr inbounds i8, i8* %54, i64 %indvars.iv10.us
  %56 = load i8, i8* %55, align 1
  %57 = zext i8 %56 to i32
  %58 = tail call i32 @_IO_putc(i32 %57, %struct._IO_FILE* %8)
  %59 = tail call i32 @_IO_putc(i32 0, %struct._IO_FILE* %8)
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv10.us, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next.us, %22
  br i1 %exitcond22, label %.loopexit.loopexit40, label %.lr.ph11.split.us

.lr.ph11.split:                                   ; preds = %.lr.ph11.split.preheader, %.lr.ph11.split
  %indvars.iv10 = phi i64 [ %indvars.iv.next, %.lr.ph11.split ], [ 0, %.lr.ph11.split.preheader ]
  %60 = load i8*, i8** %41, align 8
  %61 = getelementptr inbounds i8, i8* %60, i64 %indvars.iv10
  %62 = load i8, i8* %61, align 1
  %63 = zext i8 %62 to i32
  %64 = tail call i32 @_IO_putc(i32 %63, %struct._IO_FILE* %8)
  %65 = load i8*, i8** %42, align 8
  %66 = getelementptr inbounds i8, i8* %65, i64 %indvars.iv10
  %67 = load i8, i8* %66, align 1
  %68 = zext i8 %67 to i32
  %69 = tail call i32 @_IO_putc(i32 %68, %struct._IO_FILE* %8)
  %70 = load i8*, i8** %6, align 8
  %71 = getelementptr inbounds i8, i8* %70, i64 %indvars.iv10
  %72 = load i8, i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = tail call i32 @_IO_putc(i32 %73, %struct._IO_FILE* %8)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv10, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next, %22
  br i1 %exitcond23, label %.loopexit.loopexit41, label %.lr.ph11.split

.lr.ph13.split:                                   ; preds = %.lr.ph13.split.preheader, %.lr.ph13.split
  %indvars.iv112 = phi i64 [ %indvars.iv.next2, %.lr.ph13.split ], [ 0, %.lr.ph13.split.preheader ]
  %75 = load i8*, i8** %6, align 8
  %76 = getelementptr inbounds i8, i8* %75, i64 %indvars.iv112
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = tail call i32 @_IO_putc(i32 %78, %struct._IO_FILE* %8)
  %80 = load i8*, i8** %6, align 8
  %81 = getelementptr inbounds i8, i8* %80, i64 %indvars.iv112
  %82 = load i8, i8* %81, align 1
  %83 = zext i8 %82 to i32
  %84 = tail call i32 @_IO_putc(i32 %83, %struct._IO_FILE* %8)
  %85 = load i8*, i8** %6, align 8
  %86 = getelementptr inbounds i8, i8* %85, i64 %indvars.iv112
  %87 = load i8, i8* %86, align 1
  %88 = zext i8 %87 to i32
  %89 = tail call i32 @_IO_putc(i32 %88, %struct._IO_FILE* %8)
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next2, %22
  br i1 %exitcond25, label %.loopexit.loopexit43, label %.lr.ph13.split

.preheader3.split:                                ; preds = %.preheader3.split.preheader, %.preheader3.split
  %.39 = phi i32 [ %93, %.preheader3.split ], [ 0, %.preheader3.split.preheader ]
  %90 = tail call i32 @_IO_putc(i32 %.39, %struct._IO_FILE* %8)
  %91 = tail call i32 @_IO_putc(i32 %.39, %struct._IO_FILE* %8)
  %92 = tail call i32 @_IO_putc(i32 %.39, %struct._IO_FILE* %8)
  %93 = add nuw nsw i32 %.39, 1
  %exitcond = icmp eq i32 %93, 256
  br i1 %exitcond, label %.loopexit.loopexit39, label %.preheader3.split

.loopexit.loopexit:                               ; preds = %.preheader3.split.us
  br label %.loopexit

.loopexit.loopexit39:                             ; preds = %.preheader3.split
  br label %.loopexit

.loopexit.loopexit40:                             ; preds = %.lr.ph11.split.us
  br label %.loopexit

.loopexit.loopexit41:                             ; preds = %.lr.ph11.split
  br label %.loopexit

.loopexit.loopexit42:                             ; preds = %.lr.ph13.split.us
  br label %.loopexit

.loopexit.loopexit43:                             ; preds = %.lr.ph13.split
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit43, %.loopexit.loopexit42, %.loopexit.loopexit41, %.loopexit.loopexit40, %.loopexit.loopexit39, %.loopexit.loopexit, %.preheader4, %.preheader6
  %.4 = phi i32 [ 0, %.preheader4 ], [ 0, %.preheader6 ], [ 256, %.loopexit.loopexit ], [ 256, %.loopexit.loopexit39 ], [ %18, %.loopexit.loopexit40 ], [ %18, %.loopexit.loopexit41 ], [ %18, %.loopexit.loopexit42 ], [ %18, %.loopexit.loopexit43 ]
  %94 = icmp sgt i32 %.4, %2
  br i1 %94, label %95, label %.preheader

; <label>:95:                                     ; preds = %.loopexit
  %96 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %97 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %96, align 8
  %98 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %97, i64 0, i32 5
  store i32 1039, i32* %98, align 8
  %99 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %96, align 8
  %100 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %99, i64 0, i32 6, i32 0, i64 0
  store i32 %.4, i32* %100, align 4
  %101 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %96, align 8
  %102 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %101, i64 0, i32 0
  %103 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %102, align 8
  %104 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %103(%struct.jpeg_common_struct* %104) #6
  br label %.preheader

.preheader:                                       ; preds = %95, %.loopexit
  %105 = icmp slt i32 %.4, %2
  br i1 %105, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %106 = icmp eq i32 %3, 4
  br i1 %106, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %.lr.ph.split.us
  %.58.us = phi i32 [ %111, %.lr.ph.split.us ], [ %.4, %.lr.ph.split.us.preheader ]
  %107 = tail call i32 @_IO_putc(i32 0, %struct._IO_FILE* %8)
  %108 = tail call i32 @_IO_putc(i32 0, %struct._IO_FILE* %8)
  %109 = tail call i32 @_IO_putc(i32 0, %struct._IO_FILE* %8)
  %110 = tail call i32 @_IO_putc(i32 0, %struct._IO_FILE* %8)
  %111 = add nsw i32 %.58.us, 1
  %exitcond20 = icmp eq i32 %111, %2
  br i1 %exitcond20, label %._crit_edge.loopexit, label %.lr.ph.split.us

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %.lr.ph.split
  %.58 = phi i32 [ %115, %.lr.ph.split ], [ %.4, %.lr.ph.split.preheader ]
  %112 = tail call i32 @_IO_putc(i32 0, %struct._IO_FILE* %8)
  %113 = tail call i32 @_IO_putc(i32 0, %struct._IO_FILE* %8)
  %114 = tail call i32 @_IO_putc(i32 0, %struct._IO_FILE* %8)
  %115 = add nsw i32 %.58, 1
  %exitcond21 = icmp eq i32 %115, %2
  br i1 %exitcond21, label %._crit_edge.loopexit38, label %.lr.ph.split

._crit_edge.loopexit:                             ; preds = %.lr.ph.split.us
  br label %._crit_edge

._crit_edge.loopexit38:                           ; preds = %.lr.ph.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit38, %._crit_edge.loopexit, %.preheader
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind }
attributes #6 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}

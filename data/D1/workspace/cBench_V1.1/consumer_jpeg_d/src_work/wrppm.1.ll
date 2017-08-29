; ModuleID = 'wrppm.ll'
source_filename = "wrppm.c"
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

@.str = private unnamed_addr constant [15 x i8] c"P5\0A%ld %ld\0A%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"P6\0A%ld %ld\0A%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define %struct.djpeg_dest_struct* @jinit_write_ppm(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %.cast = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %6 = tail call i8* %5(%struct.jpeg_common_struct* %.cast, i32 1, i64 80) #3
  %7 = bitcast i8* %6 to void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)**
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @start_output_ppm, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %7, align 8
  %8 = getelementptr inbounds i8, i8* %6, i64 16
  %9 = bitcast i8* %8 to void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)**
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @finish_output_ppm, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %9, align 8
  tail call void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct* %0) #3
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %11 = load i32, i32* %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %13 = load i32, i32* %12, align 8
  %14 = mul i32 %13, %11
  %15 = getelementptr inbounds i8, i8* %6, i64 72
  %16 = bitcast i8* %15 to i32*
  store i32 %14, i32* %16, align 8
  %17 = zext i32 %14 to i64
  %18 = getelementptr inbounds i8, i8* %6, i64 64
  %19 = bitcast i8* %18 to i64*
  store i64 %17, i64* %19, align 8
  %20 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %21 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %20, align 8
  %22 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %21, align 8
  %23 = tail call i8* %22(%struct.jpeg_common_struct* %.cast, i32 1, i64 %17) #3
  %24 = getelementptr inbounds i8, i8* %6, i64 48
  %25 = bitcast i8* %24 to i8**
  store i8* %23, i8** %25, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %27 = load i32, i32* %26, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %54, label %29

; <label>:29:                                     ; preds = %1
  %30 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr19 = add i64 %sunkaddr, 8
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to %struct.jpeg_memory_mgr**
  %31 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr20, align 8
  %32 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %31, i64 0, i32 2
  %33 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %32, align 8
  %sunkaddr21 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 128
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i32*
  %34 = load i32, i32* %sunkaddr23, align 8
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 29
  %36 = load i32, i32* %35, align 4
  %37 = mul i32 %36, %34
  %38 = tail call i8** %33(%struct.jpeg_common_struct* %30, i32 1, i32 %37, i32 1) #3
  %39 = getelementptr inbounds i8, i8* %6, i64 32
  %40 = bitcast i8* %39 to i8***
  store i8** %38, i8*** %40, align 8
  %41 = getelementptr inbounds i8, i8* %6, i64 40
  %42 = bitcast i8* %41 to i32*
  store i32 1, i32* %42, align 8
  %sunkaddr24 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr25 = add i64 %sunkaddr24, 100
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to i32*
  %43 = load i32, i32* %sunkaddr26, align 4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %48

; <label>:45:                                     ; preds = %29
  %46 = getelementptr inbounds i8, i8* %6, i64 8
  %47 = bitcast i8* %46 to void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)**
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @copy_pixel_rows, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %47, align 8
  br label %64

; <label>:48:                                     ; preds = %29
  %49 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 10
  %50 = load i32, i32* %49, align 8
  %51 = icmp eq i32 %50, 1
  %52 = getelementptr inbounds i8, i8* %6, i64 8
  %53 = bitcast i8* %52 to void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)**
  %put_demapped_rgb.sink = select i1 %51, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_demapped_gray, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_demapped_rgb
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* %put_demapped_rgb.sink, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %53, align 8
  br label %64

; <label>:54:                                     ; preds = %1
  %sunkaddr27 = ptrtoint i8* %6 to i64
  %sunkaddr28 = add i64 %sunkaddr27, 48
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to i64*
  %55 = load i64, i64* %sunkaddr29, align 8
  %56 = getelementptr inbounds i8, i8* %6, i64 56
  %57 = bitcast i8* %56 to i64*
  store i64 %55, i64* %57, align 8
  %58 = getelementptr inbounds i8, i8* %6, i64 32
  %59 = bitcast i8* %58 to i8**
  store i8* %56, i8** %59, align 8
  %60 = getelementptr inbounds i8, i8* %6, i64 40
  %61 = bitcast i8* %60 to i32*
  store i32 1, i32* %61, align 8
  %62 = getelementptr inbounds i8, i8* %6, i64 8
  %63 = bitcast i8* %62 to void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)**
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_pixel_rows, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %63, align 8
  br label %64

; <label>:64:                                     ; preds = %45, %48, %54
  %65 = bitcast i8* %6 to %struct.djpeg_dest_struct*
  ret %struct.djpeg_dest_struct* %65
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_output_ppm(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 10
  %4 = load i32, i32* %3, align 8
  switch i32 %4, label %25 [
    i32 1, label %5
    i32 2, label %15
  ]

; <label>:5:                                      ; preds = %2
  %6 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 3
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %9 = load i32, i32* %8, align 8
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %12 = load i32, i32* %11, align 4
  %13 = zext i32 %12 to i64
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i64 %10, i64 %13, i32 255) #3
  ret void

; <label>:15:                                     ; preds = %2
  %16 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 3
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %19 = load i32, i32* %18, align 8
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %22 = load i32, i32* %21, align 4
  %23 = zext i32 %22 to i64
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i64 %20, i64 %23, i32 255) #3
  ret void

; <label>:25:                                     ; preds = %2
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i64 0, i32 5
  store i32 1025, i32* %28, align 8
  %29 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %30 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %29, align 8
  %31 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %30, align 8
  %32 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %31(%struct.jpeg_common_struct* %32) #3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_output_ppm(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct* nocapture readonly) #0 {
  %3 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %5 = tail call i32 @fflush(%struct._IO_FILE* %4) #3
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %7 = tail call i32 @ferror(%struct._IO_FILE* %6) #3
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %17, label %9

; <label>:9:                                      ; preds = %2
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 5
  store i32 36, i32* %12, align 8
  %13 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %14 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %13, align 8
  %15 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %14, align 8
  %16 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %15(%struct.jpeg_common_struct* %16) #3
  ret void

; <label>:17:                                     ; preds = %2
  ret void
}

declare void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @copy_pixel_rows(%struct.jpeg_decompress_struct* nocapture readnone, %struct.djpeg_dest_struct*, i32) #0 {
  %4 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 4
  %5 = bitcast i8*** %4 to i64**
  %6 = load i64*, i64** %5, align 8
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1
  %9 = bitcast %struct.djpeg_dest_struct* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1, i32 3
  %12 = bitcast %struct._IO_FILE** %11 to i32*
  %13 = load i32, i32* %12, align 8
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %3
  %15 = add i32 %13, -1
  %xtraiter = and i32 %13, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.sroa.02.08.prol = phi i64 [ %22, %.lr.ph.prol ], [ %10, %.lr.ph.prol.preheader ]
  %.sroa.0.07.prol = phi i64 [ %18, %.lr.ph.prol ], [ %7, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %16 = inttoptr i64 %.sroa.0.07.prol to i8*
  %17 = getelementptr inbounds i8, i8* %16, i64 1
  %18 = ptrtoint i8* %17 to i64
  %19 = load i8, i8* %16, align 1
  %20 = inttoptr i64 %.sroa.02.08.prol to i8*
  %21 = getelementptr inbounds i8, i8* %20, i64 1
  %22 = ptrtoint i8* %21 to i64
  store i8 %19, i8* %20, align 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  %23 = sub i32 %13, %xtraiter
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %storemerge9.unr = phi i32 [ %13, %.lr.ph.preheader ], [ %23, %.lr.ph.prol.loopexit.loopexit ]
  %.sroa.02.08.unr = phi i64 [ %10, %.lr.ph.preheader ], [ %22, %.lr.ph.prol.loopexit.loopexit ]
  %.sroa.0.07.unr = phi i64 [ %7, %.lr.ph.preheader ], [ %18, %.lr.ph.prol.loopexit.loopexit ]
  %24 = icmp ult i32 %15, 7
  br i1 %24, label %._crit_edge, label %.lr.ph.preheader16

.lr.ph.preheader16:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader16, %.lr.ph
  %storemerge9 = phi i32 [ %53, %.lr.ph ], [ %storemerge9.unr, %.lr.ph.preheader16 ]
  %.sroa.02.08 = phi i64 [ %52, %.lr.ph ], [ %.sroa.02.08.unr, %.lr.ph.preheader16 ]
  %.sroa.0.07 = phi i64 [ %49, %.lr.ph ], [ %.sroa.0.07.unr, %.lr.ph.preheader16 ]
  %25 = inttoptr i64 %.sroa.0.07 to i8*
  %26 = getelementptr inbounds i8, i8* %25, i64 1
  %27 = load i8, i8* %25, align 1
  %28 = inttoptr i64 %.sroa.02.08 to i8*
  %29 = getelementptr inbounds i8, i8* %28, i64 1
  store i8 %27, i8* %28, align 1
  %30 = getelementptr inbounds i8, i8* %25, i64 2
  %31 = load i8, i8* %26, align 1
  %32 = getelementptr inbounds i8, i8* %28, i64 2
  store i8 %31, i8* %29, align 1
  %33 = getelementptr inbounds i8, i8* %25, i64 3
  %34 = load i8, i8* %30, align 1
  %35 = getelementptr inbounds i8, i8* %28, i64 3
  store i8 %34, i8* %32, align 1
  %36 = getelementptr inbounds i8, i8* %25, i64 4
  %37 = load i8, i8* %33, align 1
  %38 = getelementptr inbounds i8, i8* %28, i64 4
  store i8 %37, i8* %35, align 1
  %39 = getelementptr inbounds i8, i8* %25, i64 5
  %40 = load i8, i8* %36, align 1
  %41 = getelementptr inbounds i8, i8* %28, i64 5
  store i8 %40, i8* %38, align 1
  %42 = getelementptr inbounds i8, i8* %25, i64 6
  %43 = load i8, i8* %39, align 1
  %44 = getelementptr inbounds i8, i8* %28, i64 6
  store i8 %43, i8* %41, align 1
  %45 = getelementptr inbounds i8, i8* %25, i64 7
  %46 = load i8, i8* %42, align 1
  %47 = getelementptr inbounds i8, i8* %28, i64 7
  store i8 %46, i8* %44, align 1
  %48 = getelementptr inbounds i8, i8* %25, i64 8
  %49 = ptrtoint i8* %48 to i64
  %50 = load i8, i8* %45, align 1
  %51 = getelementptr inbounds i8, i8* %28, i64 8
  %52 = ptrtoint i8* %51 to i64
  store i8 %50, i8* %47, align 1
  %53 = add i32 %storemerge9, -8
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %3
  %sunkaddr = ptrtoint %struct.djpeg_dest_struct* %1 to i64
  %sunkaddr5 = add i64 %sunkaddr, 48
  %sunkaddr6 = inttoptr i64 %sunkaddr5 to i8**
  %55 = load i8*, i8** %sunkaddr6, align 8
  %56 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1, i32 2
  %57 = bitcast void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 3
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** %59, align 8
  %61 = tail call i64 @fwrite(i8* %55, i64 1, i64 %58, %struct._IO_FILE* %60) #3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put_demapped_gray(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32) #0 {
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %5 = load i8**, i8*** %4, align 8
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 4
  %8 = bitcast i8*** %7 to i64**
  %9 = load i64*, i64** %8, align 8
  %10 = load i64, i64* %9, align 8
  %11 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1
  %12 = bitcast %struct.djpeg_dest_struct* %11 to i64*
  %13 = load i64, i64* %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %15 = load i32, i32* %14, align 8
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %3
  %17 = add i32 %15, -1
  %xtraiter = and i32 %15, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.sroa.02.09.prol = phi i64 [ %27, %.lr.ph.prol ], [ %13, %.lr.ph.prol.preheader ]
  %.sroa.01.08.prol = phi i64 [ %20, %.lr.ph.prol ], [ %10, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %18 = inttoptr i64 %.sroa.01.08.prol to i8*
  %19 = getelementptr inbounds i8, i8* %18, i64 1
  %20 = ptrtoint i8* %19 to i64
  %21 = load i8, i8* %18, align 1
  %22 = zext i8 %21 to i64
  %23 = getelementptr inbounds i8, i8* %6, i64 %22
  %24 = load i8, i8* %23, align 1
  %25 = inttoptr i64 %.sroa.02.09.prol to i8*
  %26 = getelementptr inbounds i8, i8* %25, i64 1
  %27 = ptrtoint i8* %26 to i64
  store i8 %24, i8* %25, align 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  %28 = sub i32 %15, %xtraiter
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %storemerge10.unr = phi i32 [ %15, %.lr.ph.preheader ], [ %28, %.lr.ph.prol.loopexit.loopexit ]
  %.sroa.02.09.unr = phi i64 [ %13, %.lr.ph.preheader ], [ %27, %.lr.ph.prol.loopexit.loopexit ]
  %.sroa.01.08.unr = phi i64 [ %10, %.lr.ph.preheader ], [ %20, %.lr.ph.prol.loopexit.loopexit ]
  %29 = icmp ult i32 %17, 3
  br i1 %29, label %._crit_edge, label %.lr.ph.preheader17

.lr.ph.preheader17:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader17, %.lr.ph
  %storemerge10 = phi i32 [ %58, %.lr.ph ], [ %storemerge10.unr, %.lr.ph.preheader17 ]
  %.sroa.02.09 = phi i64 [ %57, %.lr.ph ], [ %.sroa.02.09.unr, %.lr.ph.preheader17 ]
  %.sroa.01.08 = phi i64 [ %51, %.lr.ph ], [ %.sroa.01.08.unr, %.lr.ph.preheader17 ]
  %30 = inttoptr i64 %.sroa.01.08 to i8*
  %31 = getelementptr inbounds i8, i8* %30, i64 1
  %32 = load i8, i8* %30, align 1
  %33 = zext i8 %32 to i64
  %34 = getelementptr inbounds i8, i8* %6, i64 %33
  %35 = load i8, i8* %34, align 1
  %36 = inttoptr i64 %.sroa.02.09 to i8*
  %37 = getelementptr inbounds i8, i8* %36, i64 1
  store i8 %35, i8* %36, align 1
  %38 = getelementptr inbounds i8, i8* %30, i64 2
  %39 = load i8, i8* %31, align 1
  %40 = zext i8 %39 to i64
  %41 = getelementptr inbounds i8, i8* %6, i64 %40
  %42 = load i8, i8* %41, align 1
  %43 = getelementptr inbounds i8, i8* %36, i64 2
  store i8 %42, i8* %37, align 1
  %44 = getelementptr inbounds i8, i8* %30, i64 3
  %45 = load i8, i8* %38, align 1
  %46 = zext i8 %45 to i64
  %47 = getelementptr inbounds i8, i8* %6, i64 %46
  %48 = load i8, i8* %47, align 1
  %49 = getelementptr inbounds i8, i8* %36, i64 3
  store i8 %48, i8* %43, align 1
  %50 = getelementptr inbounds i8, i8* %30, i64 4
  %51 = ptrtoint i8* %50 to i64
  %52 = load i8, i8* %44, align 1
  %53 = zext i8 %52 to i64
  %54 = getelementptr inbounds i8, i8* %6, i64 %53
  %55 = load i8, i8* %54, align 1
  %56 = getelementptr inbounds i8, i8* %36, i64 4
  %57 = ptrtoint i8* %56 to i64
  store i8 %55, i8* %49, align 1
  %58 = add i32 %storemerge10, -4
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %3
  %sunkaddr = ptrtoint %struct.djpeg_dest_struct* %1 to i64
  %sunkaddr6 = add i64 %sunkaddr, 48
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to i8**
  %60 = load i8*, i8** %sunkaddr7, align 8
  %61 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1, i32 2
  %62 = bitcast void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 3
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** %64, align 8
  %66 = tail call i64 @fwrite(i8* %60, i64 1, i64 %63, %struct._IO_FILE* %65) #3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put_demapped_rgb(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32) #0 {
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %5 = load i8**, i8*** %4, align 8
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds i8*, i8** %5, i64 1
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds i8*, i8** %5, i64 2
  %10 = load i8*, i8** %9, align 8
  %11 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 4
  %12 = bitcast i8*** %11 to i64**
  %13 = load i64*, i64** %12, align 8
  %14 = load i64, i64* %13, align 8
  %15 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1
  %16 = bitcast %struct.djpeg_dest_struct* %15 to i64*
  %17 = load i64, i64* %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %19 = load i32, i32* %18, align 8
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %3
  %xtraiter = and i32 %19, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %21 = inttoptr i64 %14 to i8*
  %22 = getelementptr inbounds i8, i8* %21, i64 1
  %23 = ptrtoint i8* %22 to i64
  %24 = load i8, i8* %21, align 1
  %25 = zext i8 %24 to i64
  %26 = getelementptr inbounds i8, i8* %6, i64 %25
  %27 = load i8, i8* %26, align 1
  %28 = inttoptr i64 %17 to i8*
  %29 = getelementptr inbounds i8, i8* %28, i64 1
  store i8 %27, i8* %28, align 1
  %30 = zext i8 %24 to i64
  %31 = getelementptr inbounds i8, i8* %8, i64 %30
  %32 = load i8, i8* %31, align 1
  %33 = getelementptr inbounds i8, i8* %28, i64 2
  store i8 %32, i8* %29, align 1
  %34 = getelementptr inbounds i8, i8* %10, i64 %30
  %35 = load i8, i8* %34, align 1
  %36 = getelementptr inbounds i8, i8* %28, i64 3
  %37 = ptrtoint i8* %36 to i64
  store i8 %35, i8* %33, align 1
  %38 = add i32 %19, -1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %storemerge18.unr = phi i32 [ %19, %.lr.ph.preheader ], [ %38, %.lr.ph.prol ]
  %.sroa.06.017.unr = phi i64 [ %17, %.lr.ph.preheader ], [ %37, %.lr.ph.prol ]
  %.sroa.03.016.unr = phi i64 [ %14, %.lr.ph.preheader ], [ %23, %.lr.ph.prol ]
  %39 = icmp eq i32 %19, 1
  br i1 %39, label %._crit_edge, label %.lr.ph.preheader21

.lr.ph.preheader21:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader21, %.lr.ph
  %storemerge18 = phi i32 [ %70, %.lr.ph ], [ %storemerge18.unr, %.lr.ph.preheader21 ]
  %.sroa.06.017 = phi i64 [ %69, %.lr.ph ], [ %.sroa.06.017.unr, %.lr.ph.preheader21 ]
  %.sroa.03.016 = phi i64 [ %56, %.lr.ph ], [ %.sroa.03.016.unr, %.lr.ph.preheader21 ]
  %40 = inttoptr i64 %.sroa.03.016 to i8*
  %41 = getelementptr inbounds i8, i8* %40, i64 1
  %42 = load i8, i8* %40, align 1
  %43 = zext i8 %42 to i64
  %44 = getelementptr inbounds i8, i8* %6, i64 %43
  %45 = load i8, i8* %44, align 1
  %46 = inttoptr i64 %.sroa.06.017 to i8*
  %47 = getelementptr inbounds i8, i8* %46, i64 1
  store i8 %45, i8* %46, align 1
  %48 = zext i8 %42 to i64
  %49 = getelementptr inbounds i8, i8* %8, i64 %48
  %50 = load i8, i8* %49, align 1
  %51 = getelementptr inbounds i8, i8* %46, i64 2
  store i8 %50, i8* %47, align 1
  %52 = getelementptr inbounds i8, i8* %10, i64 %48
  %53 = load i8, i8* %52, align 1
  %54 = getelementptr inbounds i8, i8* %46, i64 3
  store i8 %53, i8* %51, align 1
  %55 = getelementptr inbounds i8, i8* %40, i64 2
  %56 = ptrtoint i8* %55 to i64
  %57 = load i8, i8* %41, align 1
  %58 = zext i8 %57 to i64
  %59 = getelementptr inbounds i8, i8* %6, i64 %58
  %60 = load i8, i8* %59, align 1
  %61 = getelementptr inbounds i8, i8* %46, i64 4
  store i8 %60, i8* %54, align 1
  %62 = zext i8 %57 to i64
  %63 = getelementptr inbounds i8, i8* %8, i64 %62
  %64 = load i8, i8* %63, align 1
  %65 = getelementptr inbounds i8, i8* %46, i64 5
  store i8 %64, i8* %61, align 1
  %66 = getelementptr inbounds i8, i8* %10, i64 %62
  %67 = load i8, i8* %66, align 1
  %68 = getelementptr inbounds i8, i8* %46, i64 6
  %69 = ptrtoint i8* %68 to i64
  store i8 %67, i8* %65, align 1
  %70 = add i32 %storemerge18, -2
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %3
  %sunkaddr = ptrtoint %struct.djpeg_dest_struct* %1 to i64
  %sunkaddr14 = add i64 %sunkaddr, 48
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i8**
  %72 = load i8*, i8** %sunkaddr15, align 8
  %73 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1, i32 2
  %74 = bitcast void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %73 to i64*
  %75 = load i64, i64* %74, align 8
  %76 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 3
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** %76, align 8
  %78 = tail call i64 @fwrite(i8* %72, i64 1, i64 %75, %struct._IO_FILE* %77) #3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put_pixel_rows(%struct.jpeg_decompress_struct* nocapture readnone, %struct.djpeg_dest_struct*, i32) #0 {
  %4 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1
  %5 = bitcast %struct.djpeg_dest_struct* %4 to i8**
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 1, i32 2
  %8 = bitcast void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %1, i64 0, i32 3
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %12 = tail call i64 @fwrite(i8* %6, i64 1, i64 %9, %struct._IO_FILE* %11) #3
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #2

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}

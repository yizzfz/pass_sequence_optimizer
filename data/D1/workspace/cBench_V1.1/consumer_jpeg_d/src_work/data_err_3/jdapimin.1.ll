; ModuleID = 'jdapimin.ll'
source_filename = "jdapimin.c"
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

; Function Attrs: noinline nounwind uwtable
define void @jpeg_CreateDecompress(%struct.jpeg_decompress_struct*, i32, i64) #0 {
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  store %struct.jpeg_memory_mgr* null, %struct.jpeg_memory_mgr** %4, align 8
  %5 = icmp eq i32 %1, 61
  br i1 %5, label %18, label %6

; <label>:6:                                      ; preds = %3
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %8 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %8, i64 0, i32 5
  store i32 10, i32* %9, align 8
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 6, i32 0, i64 0
  store i32 61, i32* %11, align 4
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 6, i32 0, i64 1
  store i32 %1, i32* %13, align 4
  %14 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %15 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %14, align 8
  %16 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %15, align 8
  %17 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %16(%struct.jpeg_common_struct* %17) #3
  br label %18

; <label>:18:                                     ; preds = %3, %6
  %19 = icmp eq i64 %2, 616
  br i1 %19, label %.preheader, label %20

; <label>:20:                                     ; preds = %18
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i64 0, i32 5
  store i32 19, i32* %23, align 8
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i64 0, i32 6, i32 0, i64 0
  store i32 616, i32* %25, align 4
  %26 = trunc i64 %2 to i32
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i64 0, i32 6, i32 0, i64 1
  store i32 %26, i32* %28, align 4
  %29 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %30 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %29, align 8
  %31 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %30, align 8
  %32 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %31(%struct.jpeg_common_struct* %32) #3
  br label %.preheader

.preheader:                                       ; preds = %18, %20
  %33 = bitcast %struct.jpeg_decompress_struct* %0 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %36 = bitcast %struct.jpeg_memory_mgr** %35 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %36, i8 0, i64 608, i32 1, i1 false)
  store i64 %34, i64* %33, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 3
  store i32 1, i32* %37, align 8
  %.cast2 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void @jinit_memory_mgr(%struct.jpeg_common_struct* %.cast2) #3
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 2
  store %struct.jpeg_progress_mgr* null, %struct.jpeg_progress_mgr** %38, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  store %struct.jpeg_source_mgr* null, %struct.jpeg_source_mgr** %39, align 8
  %scevgep = getelementptr %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 39, i64 0
  %scevgep24 = bitcast %struct.JQUANT_TBL** %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep24, i8 0, i64 32, i32 8, i1 false)
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 40, i64 0
  %41 = bitcast %struct.JHUFF_TBL** %40 to i8*
  call void @llvm.memset.p0i8.i64(i8* %41, i8 0, i64 64, i32 8, i1 false)
  tail call void @jinit_marker_reader(%struct.jpeg_decompress_struct* nonnull %0) #3
  tail call void @jinit_input_controller(%struct.jpeg_decompress_struct* nonnull %0) #3
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  store i32 200, i32* %42, align 4
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

declare void @jinit_memory_mgr(%struct.jpeg_common_struct*) #2

declare void @jinit_marker_reader(%struct.jpeg_decompress_struct*) #2

declare void @jinit_input_controller(%struct.jpeg_decompress_struct*) #2

; Function Attrs: noinline nounwind uwtable
define void @jpeg_destroy_decompress(%struct.jpeg_decompress_struct*) #0 {
  %.cast = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void @jpeg_destroy(%struct.jpeg_common_struct* %.cast) #3
  ret void
}

declare void @jpeg_destroy(%struct.jpeg_common_struct*) #2

; Function Attrs: noinline nounwind uwtable
define void @jpeg_abort_decompress(%struct.jpeg_decompress_struct*) #0 {
  %.cast = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void @jpeg_abort(%struct.jpeg_common_struct* %.cast) #3
  ret void
}

declare void @jpeg_abort(%struct.jpeg_common_struct*) #2

; Function Attrs: noinline nounwind uwtable
define void @jpeg_set_marker_processor(%struct.jpeg_decompress_struct*, i32, i32 (%struct.jpeg_decompress_struct*)*) #0 {
  %4 = icmp eq i32 %1, 254
  br i1 %4, label %5, label %9

; <label>:5:                                      ; preds = %3
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %7 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %7, i64 0, i32 3
  br label %27

; <label>:9:                                      ; preds = %3
  %10 = and i32 %1, -16
  %11 = icmp eq i32 %10, 224
  br i1 %11, label %12, label %18

; <label>:12:                                     ; preds = %9
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %14 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %13, align 8
  %15 = add nsw i32 %1, -224
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %14, i64 0, i32 4, i64 %16
  br label %27

; <label>:18:                                     ; preds = %9
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 5
  store i32 67, i32* %21, align 8
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i64 0, i32 6, i32 0, i64 0
  store i32 %1, i32* %23, align 4
  %24 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %25 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %24, align 8
  %26 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %25, align 8
  %.cast = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %26(%struct.jpeg_common_struct* %.cast) #3
  ret void

; <label>:27:                                     ; preds = %12, %5
  %.sink10 = phi i32 (%struct.jpeg_decompress_struct*)** [ %17, %12 ], [ %8, %5 ]
  %.sink = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %2 to i64
  %28 = bitcast i32 (%struct.jpeg_decompress_struct*)** %.sink10 to i64*
  store i64 %.sink, i64* %28, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_read_header(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %4 = load i32, i32* %3, align 4
  %5 = and i32 %4, -2
  %switch = icmp eq i32 %5, 200
  br i1 %switch, label %17, label %6

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %8 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %8, i64 0, i32 5
  store i32 18, i32* %9, align 8
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr9 = add i64 %sunkaddr, 28
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to i32*
  %10 = load i32, i32* %sunkaddr10, align 4
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %12 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 6, i32 0, i64 0
  store i32 %10, i32* %12, align 4
  %13 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %14 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %13, align 8
  %15 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %14, align 8
  %16 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %15(%struct.jpeg_common_struct* %16) #3
  br label %17

; <label>:17:                                     ; preds = %2, %6
  %18 = tail call i32 @jpeg_consume_input(%struct.jpeg_decompress_struct* nonnull %0)
  switch i32 %18, label %32 [
    i32 1, label %19
    i32 2, label %20
  ]

; <label>:19:                                     ; preds = %17
  br label %32

; <label>:20:                                     ; preds = %17
  %21 = icmp eq i32 %1, 0
  br i1 %21, label %30, label %22

; <label>:22:                                     ; preds = %20
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i64 0, i32 5
  store i32 50, i32* %25, align 8
  %26 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %27 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %26, align 8
  %28 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %27, align 8
  %29 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %28(%struct.jpeg_common_struct* %29) #3
  br label %30

; <label>:30:                                     ; preds = %20, %22
  %31 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void @jpeg_abort(%struct.jpeg_common_struct* %31) #3
  br label %32

; <label>:32:                                     ; preds = %30, %19, %17
  %.0 = phi i32 [ %18, %17 ], [ 2, %30 ], [ 1, %19 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_consume_input(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  switch i32 %3, label %27 [
    i32 200, label %4
    i32 201, label %13
    i32 202, label %38
    i32 203, label %21
    i32 204, label %21
    i32 205, label %21
    i32 206, label %21
    i32 207, label %21
    i32 208, label %21
    i32 210, label %21
  ]

; <label>:4:                                      ; preds = %1
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %6 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %6, i64 0, i32 1
  %8 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %7, align 8
  tail call void %8(%struct.jpeg_decompress_struct* nonnull %0) #3
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %10 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %10, i64 0, i32 2
  %12 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %11, align 8
  tail call void %12(%struct.jpeg_decompress_struct* nonnull %0) #3
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr8 = add i64 %sunkaddr, 28
  %sunkaddr9 = inttoptr i64 %sunkaddr8 to i32*
  store i32 201, i32* %sunkaddr9, align 4
  br label %13

; <label>:13:                                     ; preds = %4, %1
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %15 = bitcast %struct.jpeg_input_controller** %14 to i32 (%struct.jpeg_decompress_struct*)***
  %16 = load i32 (%struct.jpeg_decompress_struct*)**, i32 (%struct.jpeg_decompress_struct*)*** %15, align 8
  %17 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %16, align 8
  %18 = tail call i32 %17(%struct.jpeg_decompress_struct* nonnull %0) #3
  %19 = icmp eq i32 %18, 1
  br i1 %19, label %20, label %38

; <label>:20:                                     ; preds = %13
  tail call void @default_decompress_parms(%struct.jpeg_decompress_struct* nonnull %0)
  %sunkaddr10 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr11 = add i64 %sunkaddr10, 28
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to i32*
  store i32 202, i32* %sunkaddr12, align 4
  br label %38

; <label>:21:                                     ; preds = %1, %1, %1, %1, %1, %1, %1
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %23 = bitcast %struct.jpeg_input_controller** %22 to i32 (%struct.jpeg_decompress_struct*)***
  %24 = load i32 (%struct.jpeg_decompress_struct*)**, i32 (%struct.jpeg_decompress_struct*)*** %23, align 8
  %25 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %24, align 8
  %26 = tail call i32 %25(%struct.jpeg_decompress_struct* nonnull %0) #3
  ret i32 %26

; <label>:27:                                     ; preds = %1
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %29 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %28, align 8
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %29, i64 0, i32 5
  store i32 18, i32* %30, align 8
  %sunkaddr13 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr14 = add i64 %sunkaddr13, 28
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i32*
  %31 = load i32, i32* %sunkaddr15, align 4
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %28, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i64 0, i32 6, i32 0, i64 0
  store i32 %31, i32* %33, align 4
  %34 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %35 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %34, align 8
  %36 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %35, align 8
  %37 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %36(%struct.jpeg_common_struct* %37) #3
  br label %38

; <label>:38:                                     ; preds = %1, %13, %20, %27
  %.0 = phi i32 [ 0, %27 ], [ 1, %20 ], [ %18, %13 ], [ 1, %1 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal void @default_decompress_parms(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %3 = load i32, i32* %2, align 8
  switch i32 %3, label %77 [
    i32 1, label %4
    i32 3, label %5
    i32 4, label %57
  ]

; <label>:4:                                      ; preds = %1
  br label %77

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 50
  %7 = load i32, i32* %6, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %77

; <label>:9:                                      ; preds = %5
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 54
  %11 = load i32, i32* %10, align 8
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %29, label %13

; <label>:13:                                     ; preds = %9
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 55
  %15 = load i8, i8* %14, align 4
  switch i8 %15, label %17 [
    i8 0, label %77
    i8 1, label %16
  ]

; <label>:16:                                     ; preds = %13
  br label %77

; <label>:17:                                     ; preds = %13
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i64 0, i32 5
  store i32 110, i32* %20, align 8
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr68 = add i64 %sunkaddr, 380
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to i8*
  %21 = load i8, i8* %sunkaddr69, align 4
  %22 = zext i8 %21 to i32
  %23 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %24 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %23, i64 0, i32 6, i32 0, i64 0
  store i32 %22, i32* %24, align 4
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i64 0, i32 1
  %27 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %26, align 8
  %28 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %27(%struct.jpeg_common_struct* %28, i32 -1) #3
  br label %77

; <label>:29:                                     ; preds = %9
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %31 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %31, i64 0, i32 0
  %33 = load i32, i32* %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %31, i64 1, i32 0
  %35 = load i32, i32* %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %31, i64 2, i32 0
  %37 = load i32, i32* %36, align 8
  %38 = icmp eq i32 %33, 1
  %39 = icmp eq i32 %35, 2
  %or.cond = and i1 %38, %39
  %40 = icmp eq i32 %37, 3
  %or.cond8 = and i1 %or.cond, %40
  br i1 %or.cond8, label %77, label %41

; <label>:41:                                     ; preds = %29
  %42 = icmp eq i32 %33, 82
  %43 = icmp eq i32 %35, 71
  %or.cond10 = and i1 %42, %43
  %44 = icmp eq i32 %37, 66
  %or.cond12 = and i1 %or.cond10, %44
  br i1 %or.cond12, label %77, label %45

; <label>:45:                                     ; preds = %41
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i64 0, i32 6, i32 0, i64 0
  store i32 %33, i32* %48, align 4
  %49 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i64 0, i32 6, i32 0, i64 1
  store i32 %35, i32* %49, align 4
  %50 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i64 0, i32 6, i32 0, i64 2
  store i32 %37, i32* %50, align 4
  %51 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %52 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %51, i64 0, i32 5
  store i32 107, i32* %52, align 8
  %53 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %54 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %53, i64 0, i32 1
  %55 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %54, align 8
  %56 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %55(%struct.jpeg_common_struct* %56, i32 1) #3
  br label %77

; <label>:57:                                     ; preds = %1
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 54
  %59 = load i32, i32* %58, align 8
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %77, label %61

; <label>:61:                                     ; preds = %57
  %62 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 55
  %63 = load i8, i8* %62, align 4
  switch i8 %63, label %65 [
    i8 0, label %77
    i8 2, label %64
  ]

; <label>:64:                                     ; preds = %61
  br label %77

; <label>:65:                                     ; preds = %61
  %66 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %67 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %68 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %67, i64 0, i32 5
  store i32 110, i32* %68, align 8
  %sunkaddr70 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr71 = add i64 %sunkaddr70, 380
  %sunkaddr72 = inttoptr i64 %sunkaddr71 to i8*
  %69 = load i8, i8* %sunkaddr72, align 4
  %70 = zext i8 %69 to i32
  %71 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %72 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %71, i64 0, i32 6, i32 0, i64 0
  store i32 %70, i32* %72, align 4
  %73 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %74 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %73, i64 0, i32 1
  %75 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %74, align 8
  %76 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %75(%struct.jpeg_common_struct* %76, i32 -1) #3
  br label %77

; <label>:77:                                     ; preds = %1, %57, %65, %64, %61, %5, %41, %45, %16, %17, %13, %29, %4
  %.sink66 = phi i32 [ 1, %4 ], [ 3, %5 ], [ 3, %17 ], [ 3, %16 ], [ 3, %45 ], [ 2, %41 ], [ 2, %13 ], [ 3, %29 ], [ 4, %57 ], [ 5, %65 ], [ 5, %64 ], [ 4, %61 ], [ 0, %1 ]
  %.sink = phi i32 [ 1, %4 ], [ 2, %5 ], [ 2, %17 ], [ 2, %16 ], [ 2, %45 ], [ 2, %41 ], [ 2, %13 ], [ 2, %29 ], [ 4, %57 ], [ 4, %65 ], [ 4, %64 ], [ 4, %61 ], [ 0, %1 ]
  %78 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 9
  store i32 %.sink66, i32* %78, align 4
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 10
  store i32 %.sink, i32* %79, align 8
  %80 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 11
  store i32 1, i32* %80, align 4
  %81 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 12
  store i32 1, i32* %81, align 8
  %82 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 13
  store double 1.000000e+00, double* %82, align 8
  %83 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 14
  store i32 0, i32* %83, align 8
  %84 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 15
  store i32 0, i32* %84, align 4
  %85 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 16
  store i32 0, i32* %85, align 8
  %86 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 17
  store i32 1, i32* %86, align 4
  %87 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 18
  store i32 1, i32* %87, align 8
  %88 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  store i32 0, i32* %88, align 4
  %89 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 20
  store i32 2, i32* %89, align 8
  %90 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 21
  store i32 1, i32* %90, align 4
  %91 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 22
  store i32 256, i32* %91, align 8
  %92 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  store i8** null, i8*** %92, align 8
  %93 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 23
  store i32 0, i32* %93, align 4
  %94 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 24
  store i32 0, i32* %94, align 8
  %95 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 25
  store i32 0, i32* %95, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_input_complete(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  %.off = add i32 %3, -200
  %4 = icmp ugt i32 %.off, 10
  br i1 %4, label %5, label %16

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %7 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %7, i64 0, i32 5
  store i32 18, i32* %8, align 8
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr5 = add i64 %sunkaddr, 28
  %sunkaddr6 = inttoptr i64 %sunkaddr5 to i32*
  %9 = load i32, i32* %sunkaddr6, align 4
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 6, i32 0, i64 0
  store i32 %9, i32* %11, align 4
  %12 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %13 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %12, align 8
  %14 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %13, align 8
  %15 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %14(%struct.jpeg_common_struct* %15) #3
  br label %16

; <label>:16:                                     ; preds = %1, %5
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %18 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %18, i64 0, i32 5
  %20 = load i32, i32* %19, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_has_multiple_scans(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  %.off = add i32 %3, -202
  %4 = icmp ugt i32 %.off, 8
  br i1 %4, label %5, label %16

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %7 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %7, i64 0, i32 5
  store i32 18, i32* %8, align 8
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr5 = add i64 %sunkaddr, 28
  %sunkaddr6 = inttoptr i64 %sunkaddr5 to i32*
  %9 = load i32, i32* %sunkaddr6, align 4
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 6, i32 0, i64 0
  store i32 %9, i32* %11, align 4
  %12 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %13 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %12, align 8
  %14 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %13, align 8
  %15 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %14(%struct.jpeg_common_struct* %15) #3
  br label %16

; <label>:16:                                     ; preds = %1, %5
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %18 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %18, i64 0, i32 4
  %20 = load i32, i32* %19, align 8
  ret i32 %20
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_finish_decompress(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  %.off = add i32 %3, -205
  %switch = icmp ult i32 %.off, 2
  br i1 %switch, label %4, label %27

; <label>:4:                                      ; preds = %1
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 14
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %27

; <label>:8:                                      ; preds = %4
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 33
  %10 = load i32, i32* %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %12 = load i32, i32* %11, align 4
  %13 = icmp ult i32 %10, %12
  br i1 %13, label %14, label %22

; <label>:14:                                     ; preds = %8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i64 0, i32 5
  store i32 66, i32* %17, align 8
  %18 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %19 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %18, align 8
  %20 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %19, align 8
  %21 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %20(%struct.jpeg_common_struct* %21) #3
  br label %22

; <label>:22:                                     ; preds = %14, %8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 73
  %24 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %24, i64 0, i32 1
  %26 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %25, align 8
  tail call void %26(%struct.jpeg_decompress_struct* nonnull %0) #3
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr14 = add i64 %sunkaddr, 28
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i32*
  store i32 210, i32* %sunkaddr15, align 4
  br label %.preheader

; <label>:27:                                     ; preds = %1, %4
  %sunkaddr16 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr17 = add i64 %sunkaddr16, 28
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to i32*
  %28 = load i32, i32* %sunkaddr18, align 4
  switch i32 %28, label %30 [
    i32 207, label %29
    i32 210, label %.preheader
  ]

; <label>:29:                                     ; preds = %27
  %sunkaddr19 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr20 = add i64 %sunkaddr19, 28
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to i32*
  store i32 210, i32* %sunkaddr21, align 4
  br label %.preheader

; <label>:30:                                     ; preds = %27
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i64 0, i32 5
  store i32 18, i32* %33, align 8
  %sunkaddr22 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr23 = add i64 %sunkaddr22, 28
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to i32*
  %34 = load i32, i32* %sunkaddr24, align 4
  %35 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %36 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %35, i64 0, i32 6, i32 0, i64 0
  store i32 %34, i32* %36, align 4
  %37 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %38 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %37, align 8
  %39 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %38, align 8
  %40 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %39(%struct.jpeg_common_struct* %40) #3
  br label %.preheader

.preheader:                                       ; preds = %29, %30, %22, %27
  %41 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  br label %42

; <label>:42:                                     ; preds = %.preheader, %47
  %43 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %41, align 8
  %44 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %43, i64 0, i32 5
  %45 = load i32, i32* %44, align 4
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %52

; <label>:47:                                     ; preds = %42
  %48 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %43, i64 0, i32 0
  %49 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %48, align 8
  %50 = tail call i32 %49(%struct.jpeg_decompress_struct* nonnull %0) #3
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %.loopexit.loopexit, label %42

; <label>:52:                                     ; preds = %42
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %54 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %53, align 8
  %55 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %54, i64 0, i32 6
  %56 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %55, align 8
  tail call void %56(%struct.jpeg_decompress_struct* nonnull %0) #3
  %57 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void @jpeg_abort(%struct.jpeg_common_struct* %57) #3
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %47
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %52
  %storemerge = phi i32 [ 1, %52 ], [ 0, %.loopexit.loopexit ]
  ret i32 %storemerge
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

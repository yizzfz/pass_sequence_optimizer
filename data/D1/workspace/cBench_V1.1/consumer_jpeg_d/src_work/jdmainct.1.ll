; ModuleID = 'jdmainct.ll'
source_filename = "jdmainct.c"
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
%struct.jpeg_color_quantizer = type { {}*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)* }
%struct.my_main_controller = type { %struct.jpeg_d_main_controller, [10 x i8**], i32, i32, [2 x i8***], i32, i32, i32, i32 }

; Function Attrs: noinline nounwind uwtable
define void @jinit_d_main_controller(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %4 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %4, i64 0, i32 0
  %6 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %5, align 8
  %7 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %8 = tail call i8* %6(%struct.jpeg_common_struct* %7, i32 1, i64 136) #2
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %10 = bitcast %struct.jpeg_d_main_controller** %9 to i8**
  store i8* %8, i8** %10, align 8
  %11 = bitcast i8* %8 to void (%struct.jpeg_decompress_struct*, i32)**
  store void (%struct.jpeg_decompress_struct*, i32)* @start_pass_main, void (%struct.jpeg_decompress_struct*, i32)** %11, align 8
  %12 = icmp eq i32 %1, 0
  br i1 %12, label %20, label %13

; <label>:13:                                     ; preds = %2
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %15 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %14, align 8
  %16 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %15, i64 0, i32 5
  store i32 4, i32* %16, align 8
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %14, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i64 0, i32 0
  %19 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %18, align 8
  tail call void %19(%struct.jpeg_common_struct* %7) #2
  br label %20

; <label>:20:                                     ; preds = %2, %13
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %22 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %22, i64 0, i32 2
  %24 = load i32, i32* %23, align 8
  %25 = icmp eq i32 %24, 0
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %27 = load i32, i32* %26, align 4
  br i1 %25, label %40, label %28

; <label>:28:                                     ; preds = %20
  %29 = icmp slt i32 %27, 2
  br i1 %29, label %30, label %37

; <label>:30:                                     ; preds = %28
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i64 0, i32 5
  store i32 46, i32* %33, align 8
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i64 0, i32 0
  %36 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %35, align 8
  tail call void %36(%struct.jpeg_common_struct* nonnull %7) #2
  br label %37

; <label>:37:                                     ; preds = %30, %28
  tail call void @alloc_funny_pointers(%struct.jpeg_decompress_struct* nonnull %0)
  %38 = load i32, i32* %26, align 4
  %39 = add nsw i32 %38, 2
  br label %40

; <label>:40:                                     ; preds = %20, %37
  %.01 = phi i32 [ %39, %37 ], [ %27, %20 ]
  %41 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %42 = load i32, i32* %41, align 8
  %43 = icmp sgt i32 %42, 0
  br i1 %43, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %40
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %45 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %44, align 8
  %46 = getelementptr inbounds i8, i8* %8, i64 16
  %47 = bitcast i8* %46 to [10 x i8**]*
  br label %48

; <label>:48:                                     ; preds = %.lr.ph, %48
  %.04 = phi %struct.jpeg_component_info* [ %45, %.lr.ph ], [ %65, %48 ]
  %indvars.iv3 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %48 ]
  %49 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.04, i64 0, i32 3
  %50 = load i32, i32* %49, align 4
  %51 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.04, i64 0, i32 9
  %52 = load i32, i32* %51, align 4
  %53 = mul nsw i32 %52, %50
  %54 = load i32, i32* %26, align 4
  %55 = sdiv i32 %53, %54
  %56 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %3, align 8
  %57 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %56, i64 0, i32 2
  %58 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %57, align 8
  %59 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.04, i64 0, i32 7
  %60 = load i32, i32* %59, align 4
  %61 = mul i32 %60, %52
  %62 = mul nsw i32 %55, %.01
  %63 = tail call i8** %58(%struct.jpeg_common_struct* nonnull %7, i32 1, i32 %61, i32 %62) #2
  %64 = getelementptr inbounds [10 x i8**], [10 x i8**]* %47, i64 0, i64 %indvars.iv3
  store i8** %63, i8*** %64, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv3, 1
  %65 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.04, i64 1
  %66 = load i32, i32* %41, align 8
  %67 = sext i32 %66 to i64
  %68 = icmp slt i64 %indvars.iv.next, %67
  br i1 %68, label %48, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %48
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %40
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_main(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %4 = bitcast %struct.jpeg_d_main_controller** %3 to %struct.my_main_controller**
  %5 = load %struct.my_main_controller*, %struct.my_main_controller** %4, align 8
  switch i32 %1, label %23 [
    i32 0, label %6
    i32 2, label %21
  ]

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %8 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %8, i64 0, i32 2
  %10 = load i32, i32* %9, align 8
  %11 = icmp eq i32 %10, 0
  %12 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 0, i32 1
  br i1 %11, label %17, label %13

; <label>:13:                                     ; preds = %6
  store void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* @process_data_context_main, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)** %12, align 8
  tail call void @make_funny_pointers(%struct.jpeg_decompress_struct* nonnull %0)
  %14 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 5
  store i32 0, i32* %14, align 8
  %15 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 6
  store i32 0, i32* %15, align 4
  %16 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 8
  store i32 0, i32* %16, align 4
  br label %18

; <label>:17:                                     ; preds = %6
  store void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* @process_data_simple_main, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)** %12, align 8
  br label %18

; <label>:18:                                     ; preds = %17, %13
  %19 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 2
  store i32 0, i32* %19, align 8
  %20 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 3
  store i32 0, i32* %20, align 4
  br label %31

; <label>:21:                                     ; preds = %2
  %22 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* @process_data_crank_post, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)** %22, align 8
  br label %31

; <label>:23:                                     ; preds = %2
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i64 0, i32 5
  store i32 4, i32* %26, align 8
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i64 0, i32 0
  %29 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %28, align 8
  %30 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %29(%struct.jpeg_common_struct* %30) #2
  br label %31

; <label>:31:                                     ; preds = %23, %21, %18
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @alloc_funny_pointers(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %3 = bitcast %struct.jpeg_d_main_controller** %2 to %struct.my_main_controller**
  %4 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %8 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %8, i64 0, i32 0
  %10 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %9, align 8
  %11 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %13 = load i32, i32* %12, align 8
  %14 = shl nsw i32 %13, 1
  %15 = sext i32 %14 to i64
  %16 = shl nsw i64 %15, 3
  %17 = tail call i8* %10(%struct.jpeg_common_struct* %11, i32 1, i64 %16) #2
  %18 = bitcast i8* %17 to i8***
  %19 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %4, i64 0, i32 4
  %20 = getelementptr inbounds [2 x i8***], [2 x i8***]* %19, i64 0, i64 0
  %21 = bitcast [2 x i8***]* %19 to i8**
  store i8* %17, i8** %21, align 8
  %22 = load i32, i32* %12, align 8
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i8**, i8*** %18, i64 %23
  %25 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %4, i64 0, i32 4, i64 1
  store i8*** %24, i8**** %25, align 8
  %26 = load i32, i32* %12, align 8
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %29 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %28, align 8
  %30 = add nsw i32 %6, 4
  br label %31

; <label>:31:                                     ; preds = %.lr.ph, %31
  %.03 = phi %struct.jpeg_component_info* [ %29, %.lr.ph ], [ %56, %31 ]
  %indvars.iv2 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %31 ]
  %32 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 3
  %33 = load i32, i32* %32, align 4
  %34 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 9
  %35 = load i32, i32* %34, align 4
  %36 = mul nsw i32 %35, %33
  %37 = load i32, i32* %5, align 4
  %38 = sdiv i32 %36, %37
  %39 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %7, align 8
  %40 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %39, i64 0, i32 0
  %41 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %40, align 8
  %42 = mul nsw i32 %38, %30
  %43 = shl nsw i32 %42, 1
  %44 = sext i32 %43 to i64
  %45 = shl nsw i64 %44, 3
  %46 = tail call i8* %41(%struct.jpeg_common_struct* nonnull %11, i32 1, i64 %45) #2
  %47 = bitcast i8* %46 to i8**
  %48 = sext i32 %38 to i64
  %49 = getelementptr inbounds i8*, i8** %47, i64 %48
  %50 = load i8***, i8**** %20, align 8
  %51 = getelementptr inbounds i8**, i8*** %50, i64 %indvars.iv2
  store i8** %49, i8*** %51, align 8
  %52 = sext i32 %42 to i64
  %53 = getelementptr inbounds i8*, i8** %49, i64 %52
  %54 = load i8***, i8**** %25, align 8
  %55 = getelementptr inbounds i8**, i8*** %54, i64 %indvars.iv2
  store i8** %53, i8*** %55, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv2, 1
  %56 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 1
  %57 = load i32, i32* %12, align 8
  %58 = sext i32 %57 to i64
  %59 = icmp slt i64 %indvars.iv.next, %58
  br i1 %59, label %31, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %31
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @process_data_context_main(%struct.jpeg_decompress_struct*, i8**, i32*, i32) #0 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %6 = bitcast %struct.jpeg_d_main_controller** %5 to %struct.my_main_controller**
  %7 = load %struct.my_main_controller*, %struct.my_main_controller** %6, align 8
  %8 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 2
  %9 = load i32, i32* %8, align 8
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %27

; <label>:11:                                     ; preds = %4
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %13 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %13, i64 0, i32 3
  %15 = load i32 (%struct.jpeg_decompress_struct*, i8***)*, i32 (%struct.jpeg_decompress_struct*, i8***)** %14, align 8
  %16 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 5
  %17 = load i32, i32* %16, align 8
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 4, i64 %18
  %20 = load i8***, i8**** %19, align 8
  %21 = tail call i32 %15(%struct.jpeg_decompress_struct* nonnull %0, i8*** %20) #2
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %91, label %23

; <label>:23:                                     ; preds = %11
  store i32 1, i32* %8, align 8
  %24 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 8
  %25 = load i32, i32* %24, align 4
  %26 = add i32 %25, 1
  store i32 %26, i32* %24, align 4
  br label %27

; <label>:27:                                     ; preds = %4, %23
  %28 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 6
  %29 = load i32, i32* %28, align 4
  switch i32 %29, label %91 [
    i32 2, label %30
    i32 0, label %49
    i32 1, label %62
  ]

; <label>:30:                                     ; preds = %27
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 76
  %32 = load %struct.jpeg_d_post_controller*, %struct.jpeg_d_post_controller** %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_d_post_controller, %struct.jpeg_d_post_controller* %32, i64 0, i32 1
  %34 = load void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %33, align 8
  %35 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 5
  %36 = load i32, i32* %35, align 8
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 4, i64 %37
  %39 = load i8***, i8**** %38, align 8
  %40 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 3
  %41 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 7
  %42 = load i32, i32* %41, align 8
  tail call void %34(%struct.jpeg_decompress_struct* nonnull %0, i8*** %39, i32* %40, i32 %42, i8** %1, i32* %2, i32 %3) #2
  %43 = load i32, i32* %40, align 4
  %44 = load i32, i32* %41, align 8
  %45 = icmp ult i32 %43, %44
  br i1 %45, label %91, label %46

; <label>:46:                                     ; preds = %30
  store i32 0, i32* %28, align 4
  %47 = load i32, i32* %2, align 4
  %48 = icmp ult i32 %47, %3
  br i1 %48, label %49, label %91

; <label>:49:                                     ; preds = %46, %27
  %50 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 3
  store i32 0, i32* %50, align 4
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %52 = load i32, i32* %51, align 4
  %53 = add nsw i32 %52, -1
  %54 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 7
  store i32 %53, i32* %54, align 8
  %55 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 8
  %56 = load i32, i32* %55, align 4
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 60
  %58 = load i32, i32* %57, align 8
  %59 = icmp eq i32 %56, %58
  br i1 %59, label %60, label %61

; <label>:60:                                     ; preds = %49
  tail call void @set_bottom_pointers(%struct.jpeg_decompress_struct* nonnull %0)
  br label %61

; <label>:61:                                     ; preds = %60, %49
  store i32 1, i32* %28, align 4
  br label %62

; <label>:62:                                     ; preds = %61, %27
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 76
  %64 = load %struct.jpeg_d_post_controller*, %struct.jpeg_d_post_controller** %63, align 8
  %65 = getelementptr inbounds %struct.jpeg_d_post_controller, %struct.jpeg_d_post_controller* %64, i64 0, i32 1
  %66 = load void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %65, align 8
  %67 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 5
  %68 = load i32, i32* %67, align 8
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 4, i64 %69
  %71 = load i8***, i8**** %70, align 8
  %72 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 3
  %73 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 7
  %74 = load i32, i32* %73, align 8
  tail call void %66(%struct.jpeg_decompress_struct* nonnull %0, i8*** %71, i32* %72, i32 %74, i8** %1, i32* %2, i32 %3) #2
  %75 = load i32, i32* %72, align 4
  %76 = load i32, i32* %73, align 8
  %77 = icmp ult i32 %75, %76
  br i1 %77, label %91, label %78

; <label>:78:                                     ; preds = %62
  %79 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 8
  %80 = load i32, i32* %79, align 4
  %81 = icmp eq i32 %80, 1
  br i1 %81, label %82, label %83

; <label>:82:                                     ; preds = %78
  tail call void @set_wraparound_pointers(%struct.jpeg_decompress_struct* nonnull %0)
  br label %83

; <label>:83:                                     ; preds = %82, %78
  %84 = load i32, i32* %67, align 8
  %85 = xor i32 %84, 1
  store i32 %85, i32* %67, align 8
  store i32 0, i32* %8, align 8
  %86 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %87 = load i32, i32* %86, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %72, align 4
  %89 = load i32, i32* %86, align 4
  %90 = add nsw i32 %89, 2
  store i32 %90, i32* %73, align 8
  store i32 2, i32* %28, align 4
  br label %91

; <label>:91:                                     ; preds = %46, %11, %62, %30, %83, %27
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @make_funny_pointers(%struct.jpeg_decompress_struct* nocapture readonly) #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %3 = bitcast %struct.jpeg_d_main_controller** %2 to %struct.my_main_controller**
  %4 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %8 = load i32, i32* %7, align 8
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %.lr.ph19, label %._crit_edge20

.lr.ph19:                                         ; preds = %1
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %11 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %10, align 8
  %12 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %4, i64 0, i32 4, i64 0
  %13 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %4, i64 0, i32 4, i64 1
  %14 = add nsw i32 %6, 2
  %15 = add nsw i32 %6, -2
  br label %16

; <label>:16:                                     ; preds = %.lr.ph19, %._crit_edge15
  %.017 = phi %struct.jpeg_component_info* [ %11, %.lr.ph19 ], [ %178, %._crit_edge15 ]
  %indvars.iv716 = phi i64 [ 0, %.lr.ph19 ], [ %indvars.iv.next8, %._crit_edge15 ]
  %17 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.017, i64 0, i32 3
  %18 = load i32, i32* %17, align 4
  %19 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.017, i64 0, i32 9
  %20 = load i32, i32* %19, align 4
  %21 = mul nsw i32 %20, %18
  %22 = load i32, i32* %5, align 4
  %23 = sdiv i32 %21, %22
  %24 = load i8***, i8**** %12, align 8
  %25 = getelementptr inbounds i8**, i8*** %24, i64 %indvars.iv716
  %26 = load i8**, i8*** %25, align 8
  %27 = load i8***, i8**** %13, align 8
  %28 = getelementptr inbounds i8**, i8*** %27, i64 %indvars.iv716
  %29 = load i8**, i8*** %28, align 8
  %30 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %4, i64 0, i32 1, i64 %indvars.iv716
  %31 = load i8**, i8*** %30, align 8
  %32 = mul nsw i32 %23, %14
  %33 = sext i32 %32 to i64
  %34 = icmp sgt i32 %32, 0
  br i1 %34, label %.lr.ph.preheader, label %.preheader

.lr.ph.preheader:                                 ; preds = %16
  %35 = add nsw i64 %33, -1
  %xtraiter = and i64 %33, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv9.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %36 = getelementptr inbounds i8*, i8** %31, i64 %indvars.iv9.prol
  %37 = bitcast i8** %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds i8*, i8** %29, i64 %indvars.iv9.prol
  %40 = bitcast i8** %39 to i64*
  store i64 %38, i64* %40, align 8
  %41 = getelementptr inbounds i8*, i8** %26, i64 %indvars.iv9.prol
  %42 = bitcast i8** %41 to i64*
  store i64 %38, i64* %42, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv9.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv9.unr = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next.prol, %.lr.ph.prol.loopexit.loopexit ]
  %43 = icmp ult i64 %35, 3
  br i1 %43, label %.preheader, label %.lr.ph.preheader65

.lr.ph.preheader65:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.preheader.loopexit:                              ; preds = %.lr.ph
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.lr.ph.prol.loopexit, %16
  %44 = shl nsw i32 %23, 1
  %45 = sext i32 %44 to i64
  %46 = icmp sgt i32 %23, 0
  br i1 %46, label %.lr.ph11, label %._crit_edge15

.lr.ph11:                                         ; preds = %.preheader
  %47 = mul nsw i32 %23, %6
  %48 = sext i32 %47 to i64
  %49 = mul nsw i32 %23, %15
  %50 = sext i32 %49 to i64
  %51 = icmp sgt i64 %45, 1
  %smax = select i1 %51, i64 %45, i64 1
  %min.iters.check = icmp ult i64 %smax, 4
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph11
  %indvars.iv310.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph11 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

min.iters.checked:                                ; preds = %.lr.ph11
  %n.vec = and i64 %smax, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i8*, i8** %29, i64 %50
  %52 = icmp sgt i64 %45, 1
  %smax31 = select i1 %52, i64 %45, i64 1
  %53 = add nsw i64 %smax31, %50
  %scevgep32 = getelementptr i8*, i8** %29, i64 %53
  %scevgep34 = getelementptr i8*, i8** %29, i64 %48
  %54 = add nsw i64 %smax31, %48
  %scevgep36 = getelementptr i8*, i8** %29, i64 %54
  %scevgep38 = getelementptr i8*, i8** %31, i64 %48
  %scevgep40 = getelementptr i8*, i8** %31, i64 %54
  %scevgep42 = getelementptr i8*, i8** %31, i64 %50
  %scevgep44 = getelementptr i8*, i8** %31, i64 %53
  %bound0 = icmp ult i8** %scevgep, %scevgep36
  %bound1 = icmp ult i8** %scevgep34, %scevgep32
  %found.conflict = and i1 %bound0, %bound1
  %bound046 = icmp ult i8** %scevgep, %scevgep40
  %bound147 = icmp ult i8** %scevgep38, %scevgep32
  %found.conflict48 = and i1 %bound046, %bound147
  %conflict.rdx = or i1 %found.conflict, %found.conflict48
  %bound049 = icmp ult i8** %scevgep, %scevgep44
  %bound150 = icmp ult i8** %scevgep42, %scevgep32
  %found.conflict51 = and i1 %bound049, %bound150
  %conflict.rdx52 = or i1 %conflict.rdx, %found.conflict51
  %bound053 = icmp ult i8** %scevgep34, %scevgep40
  %bound154 = icmp ult i8** %scevgep38, %scevgep36
  %found.conflict55 = and i1 %bound053, %bound154
  %conflict.rdx56 = or i1 %conflict.rdx52, %found.conflict55
  %bound057 = icmp ult i8** %scevgep34, %scevgep44
  %bound158 = icmp ult i8** %scevgep42, %scevgep36
  %found.conflict59 = and i1 %bound057, %bound158
  %conflict.rdx60 = or i1 %conflict.rdx56, %found.conflict59
  br i1 %conflict.rdx60, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %55 = add nsw i64 %n.vec, -4
  %56 = lshr exact i64 %55, 2
  %57 = and i64 %56, 1
  %lcmp.mod67 = icmp eq i64 %57, 0
  br i1 %lcmp.mod67, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %58 = getelementptr inbounds i8*, i8** %31, i64 %48
  %59 = bitcast i8** %58 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %59, align 8, !alias.scope !3
  %60 = getelementptr i8*, i8** %58, i64 2
  %61 = bitcast i8** %60 to <2 x i64>*
  %wide.load62.prol = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !3
  %62 = getelementptr inbounds i8*, i8** %29, i64 %50
  %63 = bitcast i8** %62 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %63, align 8, !alias.scope !6, !noalias !8
  %64 = getelementptr i8*, i8** %62, i64 2
  %65 = bitcast i8** %64 to <2 x i64>*
  store <2 x i64> %wide.load62.prol, <2 x i64>* %65, align 8, !alias.scope !6, !noalias !8
  %66 = getelementptr inbounds i8*, i8** %31, i64 %50
  %67 = bitcast i8** %66 to <2 x i64>*
  %wide.load63.prol = load <2 x i64>, <2 x i64>* %67, align 8, !alias.scope !11
  %68 = getelementptr i8*, i8** %66, i64 2
  %69 = bitcast i8** %68 to <2 x i64>*
  %wide.load64.prol = load <2 x i64>, <2 x i64>* %69, align 8, !alias.scope !11
  %70 = getelementptr inbounds i8*, i8** %29, i64 %48
  %71 = bitcast i8** %70 to <2 x i64>*
  store <2 x i64> %wide.load63.prol, <2 x i64>* %71, align 8, !alias.scope !12, !noalias !13
  %72 = getelementptr i8*, i8** %70, i64 2
  %73 = bitcast i8** %72 to <2 x i64>*
  store <2 x i64> %wide.load64.prol, <2 x i64>* %73, align 8, !alias.scope !12, !noalias !13
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %74 = icmp eq i64 %56, 0
  br i1 %74, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %75 = add nsw i64 %index, %48
  %76 = getelementptr inbounds i8*, i8** %31, i64 %75
  %77 = bitcast i8** %76 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !3
  %78 = getelementptr i8*, i8** %76, i64 2
  %79 = bitcast i8** %78 to <2 x i64>*
  %wide.load62 = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !3
  %80 = add nsw i64 %index, %50
  %81 = getelementptr inbounds i8*, i8** %29, i64 %80
  %82 = bitcast i8** %81 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %82, align 8, !alias.scope !6, !noalias !8
  %83 = getelementptr i8*, i8** %81, i64 2
  %84 = bitcast i8** %83 to <2 x i64>*
  store <2 x i64> %wide.load62, <2 x i64>* %84, align 8, !alias.scope !6, !noalias !8
  %85 = getelementptr inbounds i8*, i8** %31, i64 %80
  %86 = bitcast i8** %85 to <2 x i64>*
  %wide.load63 = load <2 x i64>, <2 x i64>* %86, align 8, !alias.scope !11
  %87 = getelementptr i8*, i8** %85, i64 2
  %88 = bitcast i8** %87 to <2 x i64>*
  %wide.load64 = load <2 x i64>, <2 x i64>* %88, align 8, !alias.scope !11
  %89 = getelementptr inbounds i8*, i8** %29, i64 %75
  %90 = bitcast i8** %89 to <2 x i64>*
  store <2 x i64> %wide.load63, <2 x i64>* %90, align 8, !alias.scope !12, !noalias !13
  %91 = getelementptr i8*, i8** %89, i64 2
  %92 = bitcast i8** %91 to <2 x i64>*
  store <2 x i64> %wide.load64, <2 x i64>* %92, align 8, !alias.scope !12, !noalias !13
  %index.next = add i64 %index, 4
  %93 = add nsw i64 %index.next, %48
  %94 = getelementptr inbounds i8*, i8** %31, i64 %93
  %95 = bitcast i8** %94 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !3
  %96 = getelementptr i8*, i8** %94, i64 2
  %97 = bitcast i8** %96 to <2 x i64>*
  %wide.load62.1 = load <2 x i64>, <2 x i64>* %97, align 8, !alias.scope !3
  %98 = add nsw i64 %index.next, %50
  %99 = getelementptr inbounds i8*, i8** %29, i64 %98
  %100 = bitcast i8** %99 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %100, align 8, !alias.scope !6, !noalias !8
  %101 = getelementptr i8*, i8** %99, i64 2
  %102 = bitcast i8** %101 to <2 x i64>*
  store <2 x i64> %wide.load62.1, <2 x i64>* %102, align 8, !alias.scope !6, !noalias !8
  %103 = getelementptr inbounds i8*, i8** %31, i64 %98
  %104 = bitcast i8** %103 to <2 x i64>*
  %wide.load63.1 = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !11
  %105 = getelementptr i8*, i8** %103, i64 2
  %106 = bitcast i8** %105 to <2 x i64>*
  %wide.load64.1 = load <2 x i64>, <2 x i64>* %106, align 8, !alias.scope !11
  %107 = getelementptr inbounds i8*, i8** %29, i64 %93
  %108 = bitcast i8** %107 to <2 x i64>*
  store <2 x i64> %wide.load63.1, <2 x i64>* %108, align 8, !alias.scope !12, !noalias !13
  %109 = getelementptr i8*, i8** %107, i64 2
  %110 = bitcast i8** %109 to <2 x i64>*
  store <2 x i64> %wide.load64.1, <2 x i64>* %110, align 8, !alias.scope !12, !noalias !13
  %index.next.1 = add i64 %index, 8
  %111 = icmp eq i64 %index.next.1, %n.vec
  br i1 %111, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !14

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %smax, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

.lr.ph:                                           ; preds = %.lr.ph.preheader65, %.lr.ph
  %indvars.iv9 = phi i64 [ %indvars.iv.next.3, %.lr.ph ], [ %indvars.iv9.unr, %.lr.ph.preheader65 ]
  %112 = getelementptr inbounds i8*, i8** %31, i64 %indvars.iv9
  %113 = bitcast i8** %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds i8*, i8** %29, i64 %indvars.iv9
  %116 = bitcast i8** %115 to i64*
  store i64 %114, i64* %116, align 8
  %117 = getelementptr inbounds i8*, i8** %26, i64 %indvars.iv9
  %118 = bitcast i8** %117 to i64*
  store i64 %114, i64* %118, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv9, 1
  %119 = getelementptr inbounds i8*, i8** %31, i64 %indvars.iv.next
  %120 = bitcast i8** %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds i8*, i8** %29, i64 %indvars.iv.next
  %123 = bitcast i8** %122 to i64*
  store i64 %121, i64* %123, align 8
  %124 = getelementptr inbounds i8*, i8** %26, i64 %indvars.iv.next
  %125 = bitcast i8** %124 to i64*
  store i64 %121, i64* %125, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv9, 2
  %126 = getelementptr inbounds i8*, i8** %31, i64 %indvars.iv.next.1
  %127 = bitcast i8** %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds i8*, i8** %29, i64 %indvars.iv.next.1
  %130 = bitcast i8** %129 to i64*
  store i64 %128, i64* %130, align 8
  %131 = getelementptr inbounds i8*, i8** %26, i64 %indvars.iv.next.1
  %132 = bitcast i8** %131 to i64*
  store i64 %128, i64* %132, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv9, 3
  %133 = getelementptr inbounds i8*, i8** %31, i64 %indvars.iv.next.2
  %134 = bitcast i8** %133 to i64*
  %135 = load i64, i64* %134, align 8
  %136 = getelementptr inbounds i8*, i8** %29, i64 %indvars.iv.next.2
  %137 = bitcast i8** %136 to i64*
  store i64 %135, i64* %137, align 8
  %138 = getelementptr inbounds i8*, i8** %26, i64 %indvars.iv.next.2
  %139 = bitcast i8** %138 to i64*
  store i64 %135, i64* %139, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv9, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %33
  br i1 %exitcond.3, label %.preheader.loopexit, label %.lr.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv310 = phi i64 [ %indvars.iv.next4, %scalar.ph ], [ %indvars.iv310.ph, %scalar.ph.preheader ]
  %140 = add nsw i64 %indvars.iv310, %48
  %141 = getelementptr inbounds i8*, i8** %31, i64 %140
  %142 = bitcast i8** %141 to i64*
  %143 = load i64, i64* %142, align 8
  %144 = add nsw i64 %indvars.iv310, %50
  %145 = getelementptr inbounds i8*, i8** %29, i64 %144
  %146 = bitcast i8** %145 to i64*
  store i64 %143, i64* %146, align 8
  %147 = getelementptr inbounds i8*, i8** %31, i64 %144
  %148 = bitcast i8** %147 to i64*
  %149 = load i64, i64* %148, align 8
  %150 = getelementptr inbounds i8*, i8** %29, i64 %140
  %151 = bitcast i8** %150 to i64*
  store i64 %149, i64* %151, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv310, 1
  %152 = icmp slt i64 %indvars.iv.next4, %45
  br i1 %152, label %scalar.ph, label %._crit_edge.loopexit, !llvm.loop !17

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block
  %153 = sext i32 %23 to i64
  %154 = icmp sgt i32 %23, 0
  br i1 %154, label %.lr.ph14, label %._crit_edge15

.lr.ph14:                                         ; preds = %._crit_edge
  %155 = bitcast i8** %26 to i64*
  %156 = add nsw i64 %153, -1
  %xtraiter23 = and i64 %153, 3
  %lcmp.mod24 = icmp eq i64 %xtraiter23, 0
  br i1 %lcmp.mod24, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph14
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv512.prol = phi i64 [ %indvars.iv.next6.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter26 = phi i64 [ %prol.iter26.sub, %.prol.preheader ], [ %xtraiter23, %.prol.preheader.preheader ]
  %157 = load i64, i64* %155, align 8
  %158 = sub nsw i64 %indvars.iv512.prol, %153
  %159 = getelementptr inbounds i8*, i8** %26, i64 %158
  %160 = bitcast i8** %159 to i64*
  store i64 %157, i64* %160, align 8
  %indvars.iv.next6.prol = add nuw nsw i64 %indvars.iv512.prol, 1
  %prol.iter26.sub = add i64 %prol.iter26, -1
  %prol.iter26.cmp = icmp eq i64 %prol.iter26.sub, 0
  br i1 %prol.iter26.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !18

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph14
  %indvars.iv512.unr = phi i64 [ 0, %.lr.ph14 ], [ %indvars.iv.next6.prol, %.prol.loopexit.loopexit ]
  %161 = icmp ult i64 %156, 3
  br i1 %161, label %._crit_edge15, label %.lr.ph14.new.preheader

.lr.ph14.new.preheader:                           ; preds = %.prol.loopexit
  br label %.lr.ph14.new

.lr.ph14.new:                                     ; preds = %.lr.ph14.new.preheader, %.lr.ph14.new
  %indvars.iv512 = phi i64 [ %indvars.iv.next6.3, %.lr.ph14.new ], [ %indvars.iv512.unr, %.lr.ph14.new.preheader ]
  %162 = load i64, i64* %155, align 8
  %163 = sub nsw i64 %indvars.iv512, %153
  %164 = getelementptr inbounds i8*, i8** %26, i64 %163
  %165 = bitcast i8** %164 to i64*
  store i64 %162, i64* %165, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv512, 1
  %166 = load i64, i64* %155, align 8
  %167 = sub nsw i64 %indvars.iv.next6, %153
  %168 = getelementptr inbounds i8*, i8** %26, i64 %167
  %169 = bitcast i8** %168 to i64*
  store i64 %166, i64* %169, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv512, 2
  %170 = load i64, i64* %155, align 8
  %171 = sub nsw i64 %indvars.iv.next6.1, %153
  %172 = getelementptr inbounds i8*, i8** %26, i64 %171
  %173 = bitcast i8** %172 to i64*
  store i64 %170, i64* %173, align 8
  %indvars.iv.next6.2 = add nsw i64 %indvars.iv512, 3
  %174 = load i64, i64* %155, align 8
  %175 = sub nsw i64 %indvars.iv.next6.2, %153
  %176 = getelementptr inbounds i8*, i8** %26, i64 %175
  %177 = bitcast i8** %176 to i64*
  store i64 %174, i64* %177, align 8
  %indvars.iv.next6.3 = add nsw i64 %indvars.iv512, 4
  %exitcond.327 = icmp eq i64 %indvars.iv.next6.3, %153
  br i1 %exitcond.327, label %._crit_edge15.loopexit, label %.lr.ph14.new

._crit_edge15.loopexit:                           ; preds = %.lr.ph14.new
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %.preheader, %.prol.loopexit, %._crit_edge
  %indvars.iv.next8 = add nuw i64 %indvars.iv716, 1
  %178 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.017, i64 1
  %179 = load i32, i32* %7, align 8
  %180 = sext i32 %179 to i64
  %181 = icmp slt i64 %indvars.iv.next8, %180
  br i1 %181, label %16, label %._crit_edge20.loopexit

._crit_edge20.loopexit:                           ; preds = %._crit_edge15
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @process_data_simple_main(%struct.jpeg_decompress_struct*, i8**, i32*, i32) #0 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %6 = bitcast %struct.jpeg_d_main_controller** %5 to %struct.my_main_controller**
  %7 = load %struct.my_main_controller*, %struct.my_main_controller** %6, align 8
  %8 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 2
  %9 = load i32, i32* %8, align 8
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %20

; <label>:11:                                     ; preds = %4
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %13 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %13, i64 0, i32 3
  %15 = load i32 (%struct.jpeg_decompress_struct*, i8***)*, i32 (%struct.jpeg_decompress_struct*, i8***)** %14, align 8
  %16 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 1, i64 0
  %17 = tail call i32 %15(%struct.jpeg_decompress_struct* nonnull %0, i8*** %16) #2
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %32, label %19

; <label>:19:                                     ; preds = %11
  store i32 1, i32* %8, align 8
  br label %20

; <label>:20:                                     ; preds = %4, %19
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %22 = load i32, i32* %21, align 4
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 76
  %24 = load %struct.jpeg_d_post_controller*, %struct.jpeg_d_post_controller** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_d_post_controller, %struct.jpeg_d_post_controller* %24, i64 0, i32 1
  %26 = load void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %25, align 8
  %27 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 1, i64 0
  %28 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %7, i64 0, i32 3
  tail call void %26(%struct.jpeg_decompress_struct* nonnull %0, i8*** %27, i32* %28, i32 %22, i8** %1, i32* %2, i32 %3) #2
  %29 = load i32, i32* %28, align 4
  %30 = icmp ult i32 %29, %22
  br i1 %30, label %32, label %31

; <label>:31:                                     ; preds = %20
  store i32 0, i32* %8, align 8
  store i32 0, i32* %28, align 4
  br label %32

; <label>:32:                                     ; preds = %20, %11, %31
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @process_data_crank_post(%struct.jpeg_decompress_struct*, i8**, i32*, i32) #0 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 76
  %6 = load %struct.jpeg_d_post_controller*, %struct.jpeg_d_post_controller** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_d_post_controller, %struct.jpeg_d_post_controller* %6, i64 0, i32 1
  %8 = load void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %7, align 8
  tail call void %8(%struct.jpeg_decompress_struct* %0, i8*** null, i32* null, i32 0, i8** %1, i32* %2, i32 %3) #2
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @set_bottom_pointers(%struct.jpeg_decompress_struct* nocapture readonly) #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %3 = bitcast %struct.jpeg_d_main_controller** %2 to %struct.my_main_controller**
  %4 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %6 = load i32, i32* %5, align 8
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %.lr.ph10, label %._crit_edge11

.lr.ph10:                                         ; preds = %1
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %9 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %11 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %4, i64 0, i32 7
  %12 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %4, i64 0, i32 5
  br label %13

; <label>:13:                                     ; preds = %.lr.ph10, %._crit_edge
  %.08 = phi %struct.jpeg_component_info* [ %9, %.lr.ph10 ], [ %51, %._crit_edge ]
  %indvars.iv47 = phi i64 [ 0, %.lr.ph10 ], [ %indvars.iv.next5, %._crit_edge ]
  %14 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.08, i64 0, i32 3
  %15 = load i32, i32* %14, align 4
  %16 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.08, i64 0, i32 9
  %17 = load i32, i32* %16, align 4
  %18 = mul nsw i32 %17, %15
  %19 = load i32, i32* %10, align 4
  %20 = sdiv i32 %18, %19
  %21 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.08, i64 0, i32 11
  %22 = load i32, i32* %21, align 4
  %23 = urem i32 %22, %18
  %24 = icmp eq i32 %23, 0
  %. = select i1 %24, i32 %18, i32 %23
  %25 = icmp eq i64 %indvars.iv47, 0
  br i1 %25, label %26, label %30

; <label>:26:                                     ; preds = %13
  %27 = add nsw i32 %., -1
  %28 = sdiv i32 %27, %20
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %11, align 8
  br label %30

; <label>:30:                                     ; preds = %26, %13
  %31 = load i32, i32* %12, align 8
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %4, i64 0, i32 4, i64 %32
  %34 = load i8***, i8**** %33, align 8
  %35 = getelementptr inbounds i8**, i8*** %34, i64 %indvars.iv47
  %36 = load i8**, i8*** %35, align 8
  %37 = sext i32 %. to i64
  %38 = shl nsw i32 %20, 1
  %39 = sext i32 %38 to i64
  %40 = icmp sgt i32 %20, 0
  br i1 %40, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %30
  %41 = add nsw i32 %., -1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8*, i8** %36, i64 %42
  %44 = bitcast i8** %43 to i64*
  br label %45

; <label>:45:                                     ; preds = %.lr.ph, %45
  %indvars.iv6 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %45 ]
  %46 = load i64, i64* %44, align 8
  %47 = add nsw i64 %indvars.iv6, %37
  %48 = getelementptr inbounds i8*, i8** %36, i64 %47
  %49 = bitcast i8** %48 to i64*
  store i64 %46, i64* %49, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %50 = icmp slt i64 %indvars.iv.next, %39
  br i1 %50, label %45, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %45
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %30
  %indvars.iv.next5 = add nuw i64 %indvars.iv47, 1
  %51 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.08, i64 1
  %52 = load i32, i32* %5, align 8
  %53 = sext i32 %52 to i64
  %54 = icmp slt i64 %indvars.iv.next5, %53
  br i1 %54, label %13, label %._crit_edge11.loopexit

._crit_edge11.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %1
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @set_wraparound_pointers(%struct.jpeg_decompress_struct* nocapture readonly) #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %3 = bitcast %struct.jpeg_d_main_controller** %2 to %struct.my_main_controller**
  %4 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %8 = load i32, i32* %7, align 8
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %.lr.ph9, label %._crit_edge10

.lr.ph9:                                          ; preds = %1
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %11 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %10, align 8
  %12 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %4, i64 0, i32 4, i64 0
  %13 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %4, i64 0, i32 4, i64 1
  %14 = add nsw i32 %6, 1
  %15 = add nsw i32 %6, 2
  br label %16

; <label>:16:                                     ; preds = %.lr.ph9, %._crit_edge
  %.07 = phi %struct.jpeg_component_info* [ %11, %.lr.ph9 ], [ %102, %._crit_edge ]
  %indvars.iv36 = phi i64 [ 0, %.lr.ph9 ], [ %indvars.iv.next4, %._crit_edge ]
  %17 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.07, i64 0, i32 3
  %18 = load i32, i32* %17, align 4
  %19 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.07, i64 0, i32 9
  %20 = load i32, i32* %19, align 4
  %21 = mul nsw i32 %20, %18
  %22 = load i32, i32* %5, align 4
  %23 = sdiv i32 %21, %22
  %24 = load i8***, i8**** %12, align 8
  %25 = getelementptr inbounds i8**, i8*** %24, i64 %indvars.iv36
  %26 = load i8**, i8*** %25, align 8
  %27 = load i8***, i8**** %13, align 8
  %28 = getelementptr inbounds i8**, i8*** %27, i64 %indvars.iv36
  %29 = load i8**, i8*** %28, align 8
  %30 = sext i32 %23 to i64
  %31 = icmp sgt i32 %23, 0
  br i1 %31, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %16
  %32 = mul nsw i32 %23, %14
  %33 = sext i32 %32 to i64
  %34 = mul nsw i32 %23, %15
  %35 = sext i32 %34 to i64
  %xtraiter = and i64 %30, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %36 = getelementptr inbounds i8*, i8** %26, i64 %33
  %37 = bitcast i8** %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = sub nsw i64 0, %30
  %40 = getelementptr inbounds i8*, i8** %26, i64 %39
  %41 = bitcast i8** %40 to i64*
  store i64 %38, i64* %41, align 8
  %42 = getelementptr inbounds i8*, i8** %29, i64 %33
  %43 = bitcast i8** %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds i8*, i8** %29, i64 %39
  %46 = bitcast i8** %45 to i64*
  store i64 %44, i64* %46, align 8
  %47 = bitcast i8** %26 to i64*
  %48 = load i64, i64* %47, align 8
  %49 = getelementptr inbounds i8*, i8** %26, i64 %35
  %50 = bitcast i8** %49 to i64*
  store i64 %48, i64* %50, align 8
  %51 = bitcast i8** %29 to i64*
  %52 = load i64, i64* %51, align 8
  %53 = getelementptr inbounds i8*, i8** %29, i64 %35
  %54 = bitcast i8** %53 to i64*
  store i64 %52, i64* %54, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv5.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %55 = icmp eq i32 %23, 1
  br i1 %55, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv5 = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv5.unr.ph, %.lr.ph.new.preheader ]
  %56 = add nsw i64 %indvars.iv5, %33
  %57 = getelementptr inbounds i8*, i8** %26, i64 %56
  %58 = bitcast i8** %57 to i64*
  %59 = load i64, i64* %58, align 8
  %60 = sub nsw i64 %indvars.iv5, %30
  %61 = getelementptr inbounds i8*, i8** %26, i64 %60
  %62 = bitcast i8** %61 to i64*
  store i64 %59, i64* %62, align 8
  %63 = getelementptr inbounds i8*, i8** %29, i64 %56
  %64 = bitcast i8** %63 to i64*
  %65 = load i64, i64* %64, align 8
  %66 = getelementptr inbounds i8*, i8** %29, i64 %60
  %67 = bitcast i8** %66 to i64*
  store i64 %65, i64* %67, align 8
  %68 = getelementptr inbounds i8*, i8** %26, i64 %indvars.iv5
  %69 = bitcast i8** %68 to i64*
  %70 = load i64, i64* %69, align 8
  %71 = add nsw i64 %indvars.iv5, %35
  %72 = getelementptr inbounds i8*, i8** %26, i64 %71
  %73 = bitcast i8** %72 to i64*
  store i64 %70, i64* %73, align 8
  %74 = getelementptr inbounds i8*, i8** %29, i64 %indvars.iv5
  %75 = bitcast i8** %74 to i64*
  %76 = load i64, i64* %75, align 8
  %77 = getelementptr inbounds i8*, i8** %29, i64 %71
  %78 = bitcast i8** %77 to i64*
  store i64 %76, i64* %78, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %79 = add nsw i64 %indvars.iv.next, %33
  %80 = getelementptr inbounds i8*, i8** %26, i64 %79
  %81 = bitcast i8** %80 to i64*
  %82 = load i64, i64* %81, align 8
  %83 = sub nsw i64 %indvars.iv.next, %30
  %84 = getelementptr inbounds i8*, i8** %26, i64 %83
  %85 = bitcast i8** %84 to i64*
  store i64 %82, i64* %85, align 8
  %86 = getelementptr inbounds i8*, i8** %29, i64 %79
  %87 = bitcast i8** %86 to i64*
  %88 = load i64, i64* %87, align 8
  %89 = getelementptr inbounds i8*, i8** %29, i64 %83
  %90 = bitcast i8** %89 to i64*
  store i64 %88, i64* %90, align 8
  %91 = getelementptr inbounds i8*, i8** %26, i64 %indvars.iv.next
  %92 = bitcast i8** %91 to i64*
  %93 = load i64, i64* %92, align 8
  %94 = add nsw i64 %indvars.iv.next, %35
  %95 = getelementptr inbounds i8*, i8** %26, i64 %94
  %96 = bitcast i8** %95 to i64*
  store i64 %93, i64* %96, align 8
  %97 = getelementptr inbounds i8*, i8** %29, i64 %indvars.iv.next
  %98 = bitcast i8** %97 to i64*
  %99 = load i64, i64* %98, align 8
  %100 = getelementptr inbounds i8*, i8** %29, i64 %94
  %101 = bitcast i8** %100 to i64*
  store i64 %99, i64* %101, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv5, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %30
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %16
  %indvars.iv.next4 = add nuw i64 %indvars.iv36, 1
  %102 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.07, i64 1
  %103 = load i32, i32* %7, align 8
  %104 = sext i32 %103 to i64
  %105 = icmp slt i64 %indvars.iv.next4, %104
  br i1 %105, label %16, label %._crit_edge10.loopexit

._crit_edge10.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %1
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9, !4, !10}
!9 = distinct !{!9, !5}
!10 = distinct !{!10, !5}
!11 = !{!10}
!12 = !{!9}
!13 = !{!4, !10}
!14 = distinct !{!14, !15, !16}
!15 = !{!"llvm.loop.vectorize.width", i32 1}
!16 = !{!"llvm.loop.interleave.count", i32 1}
!17 = distinct !{!17, !15, !16}
!18 = distinct !{!18, !2}

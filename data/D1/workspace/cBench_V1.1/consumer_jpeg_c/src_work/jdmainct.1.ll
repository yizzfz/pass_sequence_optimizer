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
define void @jinit_d_main_controller(%struct.jpeg_decompress_struct*, i32) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %4 = bitcast %struct.jpeg_memory_mgr** %3 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %4, align 8
  %6 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %5, align 8
  %7 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %8 = tail call i8* %6(%struct.jpeg_common_struct* %7, i32 1, i64 136) #2
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %10 = bitcast %struct.jpeg_d_main_controller** %9 to i8**
  store i8* %8, i8** %10, align 8
  %11 = bitcast i8* %8 to void (%struct.jpeg_decompress_struct*, i32)**
  store void (%struct.jpeg_decompress_struct*, i32)* @start_pass_main, void (%struct.jpeg_decompress_struct*, i32)** %11, align 8
  %12 = icmp eq i32 %1, 0
  br i1 %12, label %21, label %13

; <label>:13:                                     ; preds = %2
  %14 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i64 0, i32 5
  store i32 4, i32* %17, align 8
  %18 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %19 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %18, align 8
  %20 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %19, align 8
  tail call void %20(%struct.jpeg_common_struct* %14) #2
  br label %21

; <label>:21:                                     ; preds = %2, %13
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %23 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %23, i64 0, i32 2
  %25 = load i32, i32* %24, align 8
  %26 = icmp eq i32 %25, 0
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %28 = load i32, i32* %27, align 4
  br i1 %26, label %42, label %29

; <label>:29:                                     ; preds = %21
  %30 = icmp slt i32 %28, 2
  br i1 %30, label %31, label %39

; <label>:31:                                     ; preds = %29
  %32 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i64 0, i32 5
  store i32 46, i32* %35, align 8
  %36 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %37 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %36, align 8
  %38 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %37, align 8
  tail call void %38(%struct.jpeg_common_struct* nonnull %32) #2
  br label %39

; <label>:39:                                     ; preds = %29, %31
  tail call fastcc void @alloc_funny_pointers(%struct.jpeg_decompress_struct* nonnull %0)
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr5 = add i64 %sunkaddr, 396
  %sunkaddr6 = inttoptr i64 %sunkaddr5 to i32*
  %40 = load i32, i32* %sunkaddr6, align 4
  %41 = add nsw i32 %40, 2
  br label %42

; <label>:42:                                     ; preds = %21, %39
  %.01 = phi i32 [ %41, %39 ], [ %28, %21 ]
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %44 = load i32, i32* %43, align 8
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %42
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %47 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %46, align 8
  %48 = ptrtoint i8* %8 to i64
  %49 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr26 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr27 = add i64 %sunkaddr26, 396
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i32*
  %sunkaddr29 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr30 = add i64 %sunkaddr29, 8
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to %struct.jpeg_memory_mgr**
  %sunkaddr32 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr33 = add i64 %sunkaddr32, 48
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i32*
  br label %50

; <label>:50:                                     ; preds = %50, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %50 ]
  %.04 = phi %struct.jpeg_component_info* [ %47, %.lr.ph ], [ %66, %50 ]
  %51 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.04, i64 0, i32 3
  %52 = load i32, i32* %51, align 4
  %53 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.04, i64 0, i32 9
  %54 = load i32, i32* %53, align 4
  %55 = mul nsw i32 %54, %52
  %56 = load i32, i32* %sunkaddr28, align 4
  %57 = sdiv i32 %55, %56
  %58 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr31, align 8
  %59 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %58, i64 0, i32 2
  %60 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %59, align 8
  %61 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.04, i64 0, i32 7
  %62 = load i32, i32* %61, align 4
  %63 = mul i32 %62, %54
  %64 = mul nsw i32 %57, %.01
  %65 = tail call i8** %60(%struct.jpeg_common_struct* nonnull %49, i32 1, i32 %63, i32 %64) #2
  %sunkaddr14 = shl i64 %indvars.iv, 3
  %sunkaddr15 = add i64 %48, %sunkaddr14
  %sunkaddr16 = add i64 %sunkaddr15, 16
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i8***
  store i8** %65, i8*** %sunkaddr17, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %66 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.04, i64 1
  %67 = load i32, i32* %sunkaddr34, align 8
  %68 = sext i32 %67 to i64
  %69 = icmp slt i64 %indvars.iv.next, %68
  br i1 %69, label %50, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %50
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %42
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_main(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %4 = bitcast %struct.jpeg_d_main_controller** %3 to %struct.my_main_controller**
  %5 = load %struct.my_main_controller*, %struct.my_main_controller** %4, align 8
  switch i32 %1, label %22 [
    i32 0, label %6
    i32 2, label %20
  ]

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %8 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %8, i64 0, i32 2
  %10 = load i32, i32* %9, align 8
  %11 = icmp eq i32 %10, 0
  %sunkaddr8 = ptrtoint %struct.my_main_controller* %5 to i64
  %sunkaddr9 = add i64 %sunkaddr8, 8
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)**
  br i1 %11, label %16, label %12

; <label>:12:                                     ; preds = %6
  store void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* @process_data_context_main, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)** %sunkaddr10, align 8
  tail call fastcc void @make_funny_pointers(%struct.jpeg_decompress_struct* nonnull %0)
  %13 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 5
  store i32 0, i32* %13, align 8
  %14 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 6
  store i32 0, i32* %14, align 4
  %15 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 8
  store i32 0, i32* %15, align 4
  br label %17

; <label>:16:                                     ; preds = %6
  store void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* @process_data_simple_main, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)** %sunkaddr10, align 8
  br label %17

; <label>:17:                                     ; preds = %16, %12
  %18 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 2
  store i32 0, i32* %18, align 8
  %19 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 3
  store i32 0, i32* %19, align 4
  br label %30

; <label>:20:                                     ; preds = %2
  %21 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %5, i64 0, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* @process_data_crank_post, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)** %21, align 8
  br label %30

; <label>:22:                                     ; preds = %2
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i64 0, i32 5
  store i32 4, i32* %25, align 8
  %26 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %27 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %26, align 8
  %28 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %27, align 8
  %29 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %28(%struct.jpeg_common_struct* %29) #2
  ret void

; <label>:30:                                     ; preds = %20, %17
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @alloc_funny_pointers(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %3 = bitcast %struct.jpeg_d_main_controller** %2 to %struct.my_main_controller**
  %4 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %8 = bitcast %struct.jpeg_memory_mgr** %7 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %9 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %8, align 8
  %10 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %9, align 8
  %11 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %13 = load i32, i32* %12, align 8
  %14 = sext i32 %13 to i64
  %15 = shl nsw i64 %14, 4
  %16 = tail call i8* %10(%struct.jpeg_common_struct* %11, i32 1, i64 %15) #2
  %17 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %4, i64 0, i32 4, i64 0
  %18 = bitcast i8**** %17 to i8**
  store i8* %16, i8** %18, align 8
  %.cast = bitcast i8* %16 to i8***
  %19 = load i32, i32* %12, align 8
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i8**, i8*** %.cast, i64 %20
  %22 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %4, i64 0, i32 4, i64 1
  store i8*** %21, i8**** %22, align 8
  %23 = load i32, i32* %12, align 8
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1
  %promoted9 = sext i32 %6 to i64
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %26 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %25, align 8
  %27 = add nsw i64 %promoted9, 4
  %28 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr21 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 396
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i32*
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr24 = add i64 %sunkaddr, 8
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %sunkaddr26 = ptrtoint %struct.my_main_controller* %4 to i64
  %sunkaddr27 = add i64 %sunkaddr26, 104
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i8****
  %sunkaddr29 = ptrtoint %struct.my_main_controller* %4 to i64
  %sunkaddr30 = add i64 %sunkaddr29, 112
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to i8****
  %sunkaddr32 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr33 = add i64 %sunkaddr32, 48
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i32*
  br label %29

; <label>:29:                                     ; preds = %29, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %29 ]
  %.03 = phi %struct.jpeg_component_info* [ %26, %.lr.ph ], [ %52, %29 ]
  %30 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 3
  %31 = load i32, i32* %30, align 4
  %32 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 9
  %33 = load i32, i32* %32, align 4
  %34 = mul nsw i32 %33, %31
  %35 = load i32, i32* %sunkaddr23, align 4
  %36 = sdiv i32 %34, %35
  %37 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %sunkaddr25, align 8
  %38 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %37, align 8
  %39 = sext i32 %36 to i64
  %40 = mul nsw i64 %39, %27
  %41 = shl i64 %40, 4
  %42 = tail call i8* %38(%struct.jpeg_common_struct* nonnull %28, i32 1, i64 %41) #2
  %43 = bitcast i8* %42 to i8**
  %44 = sext i32 %36 to i64
  %45 = getelementptr inbounds i8*, i8** %43, i64 %44
  %46 = load i8***, i8**** %sunkaddr28, align 8
  %47 = getelementptr inbounds i8**, i8*** %46, i64 %indvars.iv
  store i8** %45, i8*** %47, align 8
  %sext = shl i64 %40, 32
  %48 = ashr exact i64 %sext, 32
  %49 = getelementptr inbounds i8*, i8** %45, i64 %48
  %50 = load i8***, i8**** %sunkaddr31, align 8
  %51 = getelementptr inbounds i8**, i8*** %50, i64 %indvars.iv
  store i8** %49, i8*** %51, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %52 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 1
  %53 = load i32, i32* %sunkaddr34, align 8
  %54 = sext i32 %53 to i64
  %55 = icmp slt i64 %indvars.iv.next, %54
  br i1 %55, label %29, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %29
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
  %sunkaddr = ptrtoint %struct.my_main_controller* %7 to i64
  %sunkaddr1 = add i64 %sunkaddr, 96
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  store i32 1, i32* %sunkaddr2, align 8
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
  %sunkaddr3 = ptrtoint %struct.my_main_controller* %7 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 124
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  store i32 0, i32* %sunkaddr5, align 4
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
  tail call fastcc void @set_bottom_pointers(%struct.jpeg_decompress_struct* nonnull %0)
  br label %61

; <label>:61:                                     ; preds = %49, %60
  %sunkaddr6 = ptrtoint %struct.my_main_controller* %7 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 124
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  store i32 1, i32* %sunkaddr8, align 4
  br label %62

; <label>:62:                                     ; preds = %27, %61
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
  tail call fastcc void @set_wraparound_pointers(%struct.jpeg_decompress_struct* nonnull %0)
  br label %83

; <label>:83:                                     ; preds = %78, %82
  %sunkaddr9 = ptrtoint %struct.my_main_controller* %7 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 120
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i32*
  %84 = load i32, i32* %sunkaddr11, align 8
  %85 = xor i32 %84, 1
  store i32 %85, i32* %sunkaddr11, align 8
  %sunkaddr12 = ptrtoint %struct.my_main_controller* %7 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 96
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i32*
  store i32 0, i32* %sunkaddr14, align 8
  %86 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %87 = load i32, i32* %86, align 4
  %88 = add nsw i32 %87, 1
  %sunkaddr15 = ptrtoint %struct.my_main_controller* %7 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 100
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32*
  store i32 %88, i32* %sunkaddr17, align 4
  %89 = load i32, i32* %86, align 4
  %90 = add nsw i32 %89, 2
  %sunkaddr18 = ptrtoint %struct.my_main_controller* %7 to i64
  %sunkaddr19 = add i64 %sunkaddr18, 128
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  store i32 %90, i32* %sunkaddr20, align 8
  %sunkaddr21 = ptrtoint %struct.my_main_controller* %7 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 124
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i32*
  store i32 2, i32* %sunkaddr23, align 4
  br label %91

; <label>:91:                                     ; preds = %62, %46, %30, %27, %11, %83
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @make_funny_pointers(%struct.jpeg_decompress_struct* nocapture readonly) unnamed_addr #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %3 = bitcast %struct.jpeg_d_main_controller** %2 to %struct.my_main_controller**
  %4 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %8 = load i32, i32* %7, align 8
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %.lr.ph12, label %._crit_edge13

.lr.ph12:                                         ; preds = %1
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %11 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %10, align 8
  %12 = add nsw i32 %6, 2
  %13 = add nsw i32 %6, -2
  %sunkaddr41 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr42 = add i64 %sunkaddr41, 396
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to i32*
  %sunkaddr = ptrtoint %struct.my_main_controller* %4 to i64
  %sunkaddr44 = add i64 %sunkaddr, 104
  %sunkaddr45 = inttoptr i64 %sunkaddr44 to i8****
  %sunkaddr46 = ptrtoint %struct.my_main_controller* %4 to i64
  %sunkaddr47 = add i64 %sunkaddr46, 112
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to i8****
  %sunkaddr49 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr50 = add i64 %sunkaddr49, 48
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to i32*
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %.lr.ph12
  %indvars.iv26 = phi i64 [ 0, %.lr.ph12 ], [ %indvars.iv.next27, %._crit_edge ]
  %.010 = phi %struct.jpeg_component_info* [ %11, %.lr.ph12 ], [ %182, %._crit_edge ]
  %15 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.010, i64 0, i32 3
  %16 = load i32, i32* %15, align 4
  %17 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.010, i64 0, i32 9
  %18 = load i32, i32* %17, align 4
  %19 = mul nsw i32 %18, %16
  %20 = load i32, i32* %sunkaddr43, align 4
  %21 = sdiv i32 %19, %20
  %22 = load i8***, i8**** %sunkaddr45, align 8
  %23 = getelementptr inbounds i8**, i8*** %22, i64 %indvars.iv26
  %24 = load i8**, i8*** %23, align 8
  %25 = load i8***, i8**** %sunkaddr48, align 8
  %26 = getelementptr inbounds i8**, i8*** %25, i64 %indvars.iv26
  %27 = load i8**, i8*** %26, align 8
  %28 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %4, i64 0, i32 1, i64 %indvars.iv26
  %29 = load i8**, i8*** %28, align 8
  %30 = mul nsw i32 %21, %12
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %.lr.ph.preheader, label %.preheader3

.lr.ph.preheader:                                 ; preds = %14
  %32 = add i32 %30, -1
  %xtraiter = and i32 %30, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.preheader..lr.ph.prol_crit_edge

.lr.ph.preheader..lr.ph.prol_crit_edge:           ; preds = %.lr.ph.preheader
  %33 = add nsw i32 %xtraiter, -1
  %34 = zext i32 %33 to i64
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.preheader..lr.ph.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph.prol ], [ 0, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %35 = getelementptr inbounds i8*, i8** %29, i64 %indvars.iv.prol
  %36 = bitcast i8** %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds i8*, i8** %27, i64 %indvars.iv.prol
  %39 = bitcast i8** %38 to i64*
  store i64 %37, i64* %39, align 8
  %40 = getelementptr inbounds i8*, i8** %24, i64 %indvars.iv.prol
  %41 = bitcast i8** %40 to i64*
  store i64 %37, i64* %41, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol..lr.ph.prol.loopexit_crit_edge:       ; preds = %.lr.ph.prol
  %42 = add nuw nsw i64 %34, 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge
  %indvars.iv.unr = phi i64 [ %42, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ 0, %.lr.ph.preheader ]
  %43 = icmp ult i32 %32, 3
  br i1 %43, label %.preheader3, label %.lr.ph.preheader28

.lr.ph.preheader28:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count.3 = zext i32 %30 to i64
  br label %.lr.ph

.preheader3.loopexit:                             ; preds = %.lr.ph
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %.lr.ph.prol.loopexit, %14
  %44 = icmp sgt i32 %21, 0
  br i1 %44, label %.lr.ph6, label %._crit_edge

.lr.ph6:                                          ; preds = %.preheader3
  %45 = shl nsw i32 %21, 1
  %46 = mul nsw i32 %21, %6
  %47 = mul nsw i32 %21, %13
  %48 = sext i32 %47 to i64
  %49 = sext i32 %46 to i64
  %50 = sext i32 %45 to i64
  %51 = icmp sgt i64 %50, 1
  %smax = select i1 %51, i64 %50, i64 1
  %min.iters.check = icmp ult i64 %smax, 4
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph6
  %indvars.iv14.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph6 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

min.iters.checked:                                ; preds = %.lr.ph6
  %n.vec = and i64 %smax, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i8*, i8** %27, i64 %48
  %52 = icmp sgt i64 %50, 1
  %smax53 = select i1 %52, i64 %50, i64 1
  %53 = add nsw i64 %smax53, %48
  %scevgep54 = getelementptr i8*, i8** %27, i64 %53
  %scevgep56 = getelementptr i8*, i8** %27, i64 %49
  %54 = add nsw i64 %smax53, %49
  %scevgep58 = getelementptr i8*, i8** %27, i64 %54
  %scevgep60 = getelementptr i8*, i8** %29, i64 %49
  %scevgep62 = getelementptr i8*, i8** %29, i64 %54
  %scevgep64 = getelementptr i8*, i8** %29, i64 %48
  %scevgep66 = getelementptr i8*, i8** %29, i64 %53
  %bound0 = icmp ult i8** %scevgep, %scevgep58
  %bound1 = icmp ult i8** %scevgep56, %scevgep54
  %found.conflict = and i1 %bound0, %bound1
  %bound068 = icmp ult i8** %scevgep, %scevgep62
  %bound169 = icmp ult i8** %scevgep60, %scevgep54
  %found.conflict70 = and i1 %bound068, %bound169
  %conflict.rdx = or i1 %found.conflict, %found.conflict70
  %bound071 = icmp ult i8** %scevgep, %scevgep66
  %bound172 = icmp ult i8** %scevgep64, %scevgep54
  %found.conflict73 = and i1 %bound071, %bound172
  %conflict.rdx74 = or i1 %conflict.rdx, %found.conflict73
  %bound075 = icmp ult i8** %scevgep56, %scevgep62
  %bound176 = icmp ult i8** %scevgep60, %scevgep58
  %found.conflict77 = and i1 %bound075, %bound176
  %conflict.rdx78 = or i1 %conflict.rdx74, %found.conflict77
  %bound079 = icmp ult i8** %scevgep56, %scevgep66
  %bound180 = icmp ult i8** %scevgep64, %scevgep58
  %found.conflict81 = and i1 %bound079, %bound180
  %conflict.rdx82 = or i1 %conflict.rdx78, %found.conflict81
  br i1 %conflict.rdx82, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %55 = add nsw i64 %n.vec, -4
  %56 = lshr exact i64 %55, 2
  %57 = and i64 %56, 1
  %lcmp.mod88 = icmp eq i64 %57, 0
  br i1 %lcmp.mod88, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %58 = getelementptr inbounds i8*, i8** %29, i64 %49
  %59 = bitcast i8** %58 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %59, align 8, !alias.scope !3
  %60 = getelementptr i8*, i8** %58, i64 2
  %61 = bitcast i8** %60 to <2 x i64>*
  %wide.load84.prol = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !3
  %62 = getelementptr inbounds i8*, i8** %27, i64 %48
  %63 = bitcast i8** %62 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %63, align 8, !alias.scope !6, !noalias !8
  %64 = getelementptr i8*, i8** %62, i64 2
  %65 = bitcast i8** %64 to <2 x i64>*
  store <2 x i64> %wide.load84.prol, <2 x i64>* %65, align 8, !alias.scope !6, !noalias !8
  %66 = getelementptr inbounds i8*, i8** %29, i64 %48
  %67 = bitcast i8** %66 to <2 x i64>*
  %wide.load85.prol = load <2 x i64>, <2 x i64>* %67, align 8, !alias.scope !11
  %68 = getelementptr i8*, i8** %66, i64 2
  %69 = bitcast i8** %68 to <2 x i64>*
  %wide.load86.prol = load <2 x i64>, <2 x i64>* %69, align 8, !alias.scope !11
  %70 = getelementptr inbounds i8*, i8** %27, i64 %49
  %71 = bitcast i8** %70 to <2 x i64>*
  store <2 x i64> %wide.load85.prol, <2 x i64>* %71, align 8, !alias.scope !12, !noalias !13
  %72 = getelementptr i8*, i8** %70, i64 2
  %73 = bitcast i8** %72 to <2 x i64>*
  store <2 x i64> %wide.load86.prol, <2 x i64>* %73, align 8, !alias.scope !12, !noalias !13
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
  %75 = add nsw i64 %index, %49
  %76 = getelementptr inbounds i8*, i8** %29, i64 %75
  %77 = bitcast i8** %76 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !3
  %78 = getelementptr i8*, i8** %76, i64 2
  %79 = bitcast i8** %78 to <2 x i64>*
  %wide.load84 = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !3
  %80 = add nsw i64 %index, %48
  %81 = getelementptr inbounds i8*, i8** %27, i64 %80
  %82 = bitcast i8** %81 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %82, align 8, !alias.scope !6, !noalias !8
  %83 = getelementptr i8*, i8** %81, i64 2
  %84 = bitcast i8** %83 to <2 x i64>*
  store <2 x i64> %wide.load84, <2 x i64>* %84, align 8, !alias.scope !6, !noalias !8
  %85 = getelementptr inbounds i8*, i8** %29, i64 %80
  %86 = bitcast i8** %85 to <2 x i64>*
  %wide.load85 = load <2 x i64>, <2 x i64>* %86, align 8, !alias.scope !11
  %87 = getelementptr i8*, i8** %85, i64 2
  %88 = bitcast i8** %87 to <2 x i64>*
  %wide.load86 = load <2 x i64>, <2 x i64>* %88, align 8, !alias.scope !11
  %89 = getelementptr inbounds i8*, i8** %27, i64 %75
  %90 = bitcast i8** %89 to <2 x i64>*
  store <2 x i64> %wide.load85, <2 x i64>* %90, align 8, !alias.scope !12, !noalias !13
  %91 = getelementptr i8*, i8** %89, i64 2
  %92 = bitcast i8** %91 to <2 x i64>*
  store <2 x i64> %wide.load86, <2 x i64>* %92, align 8, !alias.scope !12, !noalias !13
  %index.next = add i64 %index, 4
  %93 = add nsw i64 %index.next, %49
  %94 = getelementptr inbounds i8*, i8** %29, i64 %93
  %95 = bitcast i8** %94 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !3
  %96 = getelementptr i8*, i8** %94, i64 2
  %97 = bitcast i8** %96 to <2 x i64>*
  %wide.load84.1 = load <2 x i64>, <2 x i64>* %97, align 8, !alias.scope !3
  %98 = add nsw i64 %index.next, %48
  %99 = getelementptr inbounds i8*, i8** %27, i64 %98
  %100 = bitcast i8** %99 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %100, align 8, !alias.scope !6, !noalias !8
  %101 = getelementptr i8*, i8** %99, i64 2
  %102 = bitcast i8** %101 to <2 x i64>*
  store <2 x i64> %wide.load84.1, <2 x i64>* %102, align 8, !alias.scope !6, !noalias !8
  %103 = getelementptr inbounds i8*, i8** %29, i64 %98
  %104 = bitcast i8** %103 to <2 x i64>*
  %wide.load85.1 = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !11
  %105 = getelementptr i8*, i8** %103, i64 2
  %106 = bitcast i8** %105 to <2 x i64>*
  %wide.load86.1 = load <2 x i64>, <2 x i64>* %106, align 8, !alias.scope !11
  %107 = getelementptr inbounds i8*, i8** %27, i64 %93
  %108 = bitcast i8** %107 to <2 x i64>*
  store <2 x i64> %wide.load85.1, <2 x i64>* %108, align 8, !alias.scope !12, !noalias !13
  %109 = getelementptr i8*, i8** %107, i64 2
  %110 = bitcast i8** %109 to <2 x i64>*
  store <2 x i64> %wide.load86.1, <2 x i64>* %110, align 8, !alias.scope !12, !noalias !13
  %index.next.1 = add i64 %index, 8
  %111 = icmp eq i64 %index.next.1, %n.vec
  br i1 %111, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !14

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %smax, %n.vec
  br i1 %cmp.n, label %.preheader, label %scalar.ph.preheader

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader28
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph ], [ %indvars.iv.unr, %.lr.ph.preheader28 ]
  %112 = getelementptr inbounds i8*, i8** %29, i64 %indvars.iv
  %113 = bitcast i8** %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds i8*, i8** %27, i64 %indvars.iv
  %116 = bitcast i8** %115 to i64*
  store i64 %114, i64* %116, align 8
  %117 = getelementptr inbounds i8*, i8** %24, i64 %indvars.iv
  %118 = bitcast i8** %117 to i64*
  store i64 %114, i64* %118, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %119 = getelementptr inbounds i8*, i8** %29, i64 %indvars.iv.next
  %120 = bitcast i8** %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds i8*, i8** %27, i64 %indvars.iv.next
  %123 = bitcast i8** %122 to i64*
  store i64 %121, i64* %123, align 8
  %124 = getelementptr inbounds i8*, i8** %24, i64 %indvars.iv.next
  %125 = bitcast i8** %124 to i64*
  store i64 %121, i64* %125, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %126 = getelementptr inbounds i8*, i8** %29, i64 %indvars.iv.next.1
  %127 = bitcast i8** %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds i8*, i8** %27, i64 %indvars.iv.next.1
  %130 = bitcast i8** %129 to i64*
  store i64 %128, i64* %130, align 8
  %131 = getelementptr inbounds i8*, i8** %24, i64 %indvars.iv.next.1
  %132 = bitcast i8** %131 to i64*
  store i64 %128, i64* %132, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %133 = getelementptr inbounds i8*, i8** %29, i64 %indvars.iv.next.2
  %134 = bitcast i8** %133 to i64*
  %135 = load i64, i64* %134, align 8
  %136 = getelementptr inbounds i8*, i8** %27, i64 %indvars.iv.next.2
  %137 = bitcast i8** %136 to i64*
  store i64 %135, i64* %137, align 8
  %138 = getelementptr inbounds i8*, i8** %24, i64 %indvars.iv.next.2
  %139 = bitcast i8** %138 to i64*
  store i64 %135, i64* %139, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %.preheader3.loopexit, label %.lr.ph

.preheader.loopexit:                              ; preds = %scalar.ph
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %middle.block
  %140 = icmp sgt i32 %21, 0
  br i1 %140, label %.lr.ph8, label %._crit_edge

.lr.ph8:                                          ; preds = %.preheader
  %141 = sext i32 %21 to i64
  %142 = add i32 %21, -1
  %xtraiter21 = and i32 %21, 3
  %lcmp.mod22 = icmp eq i32 %xtraiter21, 0
  br i1 %lcmp.mod22, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph8
  %143 = add nsw i32 %xtraiter21, -1
  %144 = zext i32 %143 to i64
  %145 = bitcast i8** %24 to i64*
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader, %.prol.preheader.preheader
  %indvars.iv18.prol = phi i64 [ %indvars.iv.next19.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter24 = phi i32 [ %prol.iter24.sub, %.prol.preheader ], [ %xtraiter21, %.prol.preheader.preheader ]
  %146 = load i64, i64* %145, align 8
  %147 = sub nsw i64 %indvars.iv18.prol, %141
  %148 = getelementptr inbounds i8*, i8** %24, i64 %147
  %149 = bitcast i8** %148 to i64*
  store i64 %146, i64* %149, align 8
  %indvars.iv.next19.prol = add nuw nsw i64 %indvars.iv18.prol, 1
  %prol.iter24.sub = add nsw i32 %prol.iter24, -1
  %prol.iter24.cmp = icmp eq i32 %prol.iter24.sub, 0
  br i1 %prol.iter24.cmp, label %.prol.preheader..prol.loopexit_crit_edge, label %.prol.preheader, !llvm.loop !17

.prol.preheader..prol.loopexit_crit_edge:         ; preds = %.prol.preheader
  %150 = add nuw nsw i64 %144, 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph8, %.prol.preheader..prol.loopexit_crit_edge
  %indvars.iv18.unr = phi i64 [ %150, %.prol.preheader..prol.loopexit_crit_edge ], [ 0, %.lr.ph8 ]
  %151 = icmp ult i32 %142, 3
  br i1 %151, label %._crit_edge, label %.lr.ph8.new.preheader

.lr.ph8.new.preheader:                            ; preds = %.prol.loopexit
  %wide.trip.count20.3 = zext i32 %21 to i64
  %152 = bitcast i8** %24 to i64*
  br label %.lr.ph8.new

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %scalar.ph ], [ %indvars.iv14.ph, %scalar.ph.preheader ]
  %153 = add nsw i64 %indvars.iv14, %49
  %154 = getelementptr inbounds i8*, i8** %29, i64 %153
  %155 = bitcast i8** %154 to i64*
  %156 = load i64, i64* %155, align 8
  %157 = add nsw i64 %indvars.iv14, %48
  %158 = getelementptr inbounds i8*, i8** %27, i64 %157
  %159 = bitcast i8** %158 to i64*
  store i64 %156, i64* %159, align 8
  %160 = getelementptr inbounds i8*, i8** %29, i64 %157
  %161 = bitcast i8** %160 to i64*
  %162 = load i64, i64* %161, align 8
  %163 = getelementptr inbounds i8*, i8** %27, i64 %153
  %164 = bitcast i8** %163 to i64*
  store i64 %162, i64* %164, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %165 = icmp slt i64 %indvars.iv.next15, %50
  br i1 %165, label %scalar.ph, label %.preheader.loopexit, !llvm.loop !18

.lr.ph8.new:                                      ; preds = %.lr.ph8.new, %.lr.ph8.new.preheader
  %indvars.iv18 = phi i64 [ %indvars.iv.next19.3, %.lr.ph8.new ], [ %indvars.iv18.unr, %.lr.ph8.new.preheader ]
  %166 = load i64, i64* %152, align 8
  %167 = sub nsw i64 %indvars.iv18, %141
  %168 = getelementptr inbounds i8*, i8** %24, i64 %167
  %169 = bitcast i8** %168 to i64*
  store i64 %166, i64* %169, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %170 = load i64, i64* %152, align 8
  %171 = sub nsw i64 %indvars.iv.next19, %141
  %172 = getelementptr inbounds i8*, i8** %24, i64 %171
  %173 = bitcast i8** %172 to i64*
  store i64 %170, i64* %173, align 8
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  %174 = load i64, i64* %152, align 8
  %175 = sub nsw i64 %indvars.iv.next19.1, %141
  %176 = getelementptr inbounds i8*, i8** %24, i64 %175
  %177 = bitcast i8** %176 to i64*
  store i64 %174, i64* %177, align 8
  %indvars.iv.next19.2 = add nsw i64 %indvars.iv18, 3
  %178 = load i64, i64* %152, align 8
  %179 = sub nsw i64 %indvars.iv.next19.2, %141
  %180 = getelementptr inbounds i8*, i8** %24, i64 %179
  %181 = bitcast i8** %180 to i64*
  store i64 %178, i64* %181, align 8
  %indvars.iv.next19.3 = add nsw i64 %indvars.iv18, 4
  %exitcond.325 = icmp eq i64 %indvars.iv.next19.3, %wide.trip.count20.3
  br i1 %exitcond.325, label %._crit_edge.loopexit, label %.lr.ph8.new

._crit_edge.loopexit:                             ; preds = %.lr.ph8.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader, %.preheader3
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %182 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.010, i64 1
  %183 = load i32, i32* %sunkaddr51, align 8
  %184 = sext i32 %183 to i64
  %185 = icmp slt i64 %indvars.iv.next27, %184
  br i1 %185, label %14, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %1
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
  %sunkaddr = ptrtoint %struct.my_main_controller* %7 to i64
  %sunkaddr1 = add i64 %sunkaddr, 96
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  store i32 1, i32* %sunkaddr2, align 8
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
  %sunkaddr3 = ptrtoint %struct.my_main_controller* %7 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 96
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  store i32 0, i32* %sunkaddr5, align 8
  %sunkaddr6 = ptrtoint %struct.my_main_controller* %7 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 100
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  store i32 0, i32* %sunkaddr8, align 4
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
define internal fastcc void @set_bottom_pointers(%struct.jpeg_decompress_struct* nocapture readonly) unnamed_addr #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %3 = bitcast %struct.jpeg_d_main_controller** %2 to %struct.my_main_controller**
  %4 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %6 = load i32, i32* %5, align 8
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %.lr.ph8, label %._crit_edge9

.lr.ph8:                                          ; preds = %1
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %9 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %sunkaddr30 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr31 = add i64 %sunkaddr30, 396
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to i32*
  %sunkaddr = ptrtoint %struct.my_main_controller* %4 to i64
  %sunkaddr33 = add i64 %sunkaddr, 128
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i32*
  %sunkaddr35 = ptrtoint %struct.my_main_controller* %4 to i64
  %sunkaddr36 = add i64 %sunkaddr35, 120
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to i32*
  %sunkaddr42 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr43 = add i64 %sunkaddr42, 48
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to i32*
  br label %10

; <label>:10:                                     ; preds = %._crit_edge, %.lr.ph8
  %indvars.iv10 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next11, %._crit_edge ]
  %.06 = phi %struct.jpeg_component_info* [ %9, %.lr.ph8 ], [ %46, %._crit_edge ]
  %11 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.06, i64 0, i32 3
  %12 = load i32, i32* %11, align 4
  %13 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.06, i64 0, i32 9
  %14 = load i32, i32* %13, align 4
  %15 = mul nsw i32 %14, %12
  %16 = load i32, i32* %sunkaddr32, align 4
  %17 = sdiv i32 %15, %16
  %18 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.06, i64 0, i32 11
  %19 = load i32, i32* %18, align 4
  %20 = urem i32 %19, %15
  %21 = icmp eq i32 %20, 0
  %. = select i1 %21, i32 %15, i32 %20
  %22 = icmp eq i64 %indvars.iv10, 0
  br i1 %22, label %23, label %27

; <label>:23:                                     ; preds = %10
  %24 = add nsw i32 %., -1
  %25 = sdiv i32 %24, %17
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %sunkaddr34, align 8
  br label %27

; <label>:27:                                     ; preds = %10, %23
  %28 = load i32, i32* %sunkaddr37, align 8
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds %struct.my_main_controller, %struct.my_main_controller* %4, i64 0, i32 4, i64 %29
  %31 = load i8***, i8**** %30, align 8
  %32 = getelementptr inbounds i8**, i8*** %31, i64 %indvars.iv10
  %33 = load i8**, i8*** %32, align 8
  %34 = icmp sgt i32 %17, 0
  br i1 %34, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %27
  %35 = shl nsw i32 %17, 1
  %36 = add nsw i32 %., -1
  %37 = sext i32 %36 to i64
  %38 = sext i32 %. to i64
  %39 = sext i32 %35 to i64
  %sunkaddr38 = ptrtoint i8** %33 to i64
  %sunkaddr39 = shl nsw i64 %37, 3
  %sunkaddr40 = add i64 %sunkaddr38, %sunkaddr39
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to i64*
  br label %40

; <label>:40:                                     ; preds = %40, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %40 ]
  %41 = load i64, i64* %sunkaddr41, align 8
  %42 = add nsw i64 %indvars.iv, %38
  %43 = getelementptr inbounds i8*, i8** %33, i64 %42
  %44 = bitcast i8** %43 to i64*
  store i64 %41, i64* %44, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %45 = icmp slt i64 %indvars.iv.next, %39
  br i1 %45, label %40, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %40
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %27
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %46 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.06, i64 1
  %47 = load i32, i32* %sunkaddr44, align 8
  %48 = sext i32 %47 to i64
  %49 = icmp slt i64 %indvars.iv.next11, %48
  br i1 %49, label %10, label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %1
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @set_wraparound_pointers(%struct.jpeg_decompress_struct* nocapture readonly) unnamed_addr #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %3 = bitcast %struct.jpeg_d_main_controller** %2 to %struct.my_main_controller**
  %4 = load %struct.my_main_controller*, %struct.my_main_controller** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %8 = load i32, i32* %7, align 8
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %.lr.ph7, label %._crit_edge8

.lr.ph7:                                          ; preds = %1
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %11 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %10, align 8
  %12 = add nsw i32 %6, 1
  %13 = add nsw i32 %6, 2
  %sunkaddr26 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr27 = add i64 %sunkaddr26, 396
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i32*
  %sunkaddr = ptrtoint %struct.my_main_controller* %4 to i64
  %sunkaddr29 = add i64 %sunkaddr, 104
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i8****
  %sunkaddr31 = ptrtoint %struct.my_main_controller* %4 to i64
  %sunkaddr32 = add i64 %sunkaddr31, 112
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to i8****
  %sunkaddr34 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr35 = add i64 %sunkaddr34, 48
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to i32*
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %.lr.ph7
  %indvars.iv13 = phi i64 [ 0, %.lr.ph7 ], [ %indvars.iv.next14, %._crit_edge ]
  %.05 = phi %struct.jpeg_component_info* [ %11, %.lr.ph7 ], [ %100, %._crit_edge ]
  %15 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.05, i64 0, i32 3
  %16 = load i32, i32* %15, align 4
  %17 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.05, i64 0, i32 9
  %18 = load i32, i32* %17, align 4
  %19 = mul nsw i32 %18, %16
  %20 = load i32, i32* %sunkaddr28, align 4
  %21 = sdiv i32 %19, %20
  %22 = load i8***, i8**** %sunkaddr30, align 8
  %23 = getelementptr inbounds i8**, i8*** %22, i64 %indvars.iv13
  %24 = load i8**, i8*** %23, align 8
  %25 = load i8***, i8**** %sunkaddr33, align 8
  %26 = getelementptr inbounds i8**, i8*** %25, i64 %indvars.iv13
  %27 = load i8**, i8*** %26, align 8
  %28 = icmp sgt i32 %21, 0
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %14
  %29 = mul nsw i32 %21, %12
  %30 = mul nsw i32 %21, %13
  %31 = sext i32 %30 to i64
  %32 = sext i32 %29 to i64
  %33 = sext i32 %21 to i64
  %xtraiter = and i32 %21, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %34 = getelementptr inbounds i8*, i8** %24, i64 %32
  %35 = bitcast i8** %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = sub nsw i64 0, %33
  %38 = getelementptr inbounds i8*, i8** %24, i64 %37
  %39 = bitcast i8** %38 to i64*
  store i64 %36, i64* %39, align 8
  %40 = getelementptr inbounds i8*, i8** %27, i64 %32
  %41 = bitcast i8** %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds i8*, i8** %27, i64 %37
  %44 = bitcast i8** %43 to i64*
  store i64 %42, i64* %44, align 8
  %45 = bitcast i8** %24 to i64*
  %46 = load i64, i64* %45, align 8
  %47 = getelementptr inbounds i8*, i8** %24, i64 %31
  %48 = bitcast i8** %47 to i64*
  store i64 %46, i64* %48, align 8
  %49 = bitcast i8** %27 to i64*
  %50 = load i64, i64* %49, align 8
  %51 = getelementptr inbounds i8*, i8** %27, i64 %31
  %52 = bitcast i8** %51 to i64*
  store i64 %50, i64* %52, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %53 = icmp eq i32 %21, 1
  br i1 %53, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %wide.trip.count.1 = zext i32 %21 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %54 = add nsw i64 %indvars.iv, %32
  %55 = getelementptr inbounds i8*, i8** %24, i64 %54
  %56 = bitcast i8** %55 to i64*
  %57 = load i64, i64* %56, align 8
  %58 = sub nsw i64 %indvars.iv, %33
  %59 = getelementptr inbounds i8*, i8** %24, i64 %58
  %60 = bitcast i8** %59 to i64*
  store i64 %57, i64* %60, align 8
  %61 = getelementptr inbounds i8*, i8** %27, i64 %54
  %62 = bitcast i8** %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds i8*, i8** %27, i64 %58
  %65 = bitcast i8** %64 to i64*
  store i64 %63, i64* %65, align 8
  %66 = getelementptr inbounds i8*, i8** %24, i64 %indvars.iv
  %67 = bitcast i8** %66 to i64*
  %68 = load i64, i64* %67, align 8
  %69 = add nsw i64 %indvars.iv, %31
  %70 = getelementptr inbounds i8*, i8** %24, i64 %69
  %71 = bitcast i8** %70 to i64*
  store i64 %68, i64* %71, align 8
  %72 = getelementptr inbounds i8*, i8** %27, i64 %indvars.iv
  %73 = bitcast i8** %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = getelementptr inbounds i8*, i8** %27, i64 %69
  %76 = bitcast i8** %75 to i64*
  store i64 %74, i64* %76, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %77 = add nsw i64 %indvars.iv.next, %32
  %78 = getelementptr inbounds i8*, i8** %24, i64 %77
  %79 = bitcast i8** %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = sub nsw i64 %indvars.iv.next, %33
  %82 = getelementptr inbounds i8*, i8** %24, i64 %81
  %83 = bitcast i8** %82 to i64*
  store i64 %80, i64* %83, align 8
  %84 = getelementptr inbounds i8*, i8** %27, i64 %77
  %85 = bitcast i8** %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = getelementptr inbounds i8*, i8** %27, i64 %81
  %88 = bitcast i8** %87 to i64*
  store i64 %86, i64* %88, align 8
  %89 = getelementptr inbounds i8*, i8** %24, i64 %indvars.iv.next
  %90 = bitcast i8** %89 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = add nsw i64 %indvars.iv.next, %31
  %93 = getelementptr inbounds i8*, i8** %24, i64 %92
  %94 = bitcast i8** %93 to i64*
  store i64 %91, i64* %94, align 8
  %95 = getelementptr inbounds i8*, i8** %27, i64 %indvars.iv.next
  %96 = bitcast i8** %95 to i64*
  %97 = load i64, i64* %96, align 8
  %98 = getelementptr inbounds i8*, i8** %27, i64 %92
  %99 = bitcast i8** %98 to i64*
  store i64 %97, i64* %99, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %14
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %100 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.05, i64 1
  %101 = load i32, i32* %sunkaddr36, align 8
  %102 = sext i32 %101 to i64
  %103 = icmp slt i64 %indvars.iv.next14, %102
  br i1 %103, label %14, label %._crit_edge8.loopexit

._crit_edge8.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %1
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
!17 = distinct !{!17, !2}
!18 = distinct !{!18, !15, !16}

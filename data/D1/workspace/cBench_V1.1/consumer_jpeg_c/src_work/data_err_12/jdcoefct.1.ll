; ModuleID = 'jdcoefct.ll'
source_filename = "jdcoefct.c"
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
%struct.my_coef_controller = type { %struct.jpeg_d_coef_controller, i32, i32, i32, [10 x [64 x i16]*], [10 x %struct.jvirt_barray_control*], i32* }

; Function Attrs: noinline nounwind uwtable
define void @jinit_d_coef_controller(%struct.jpeg_decompress_struct*, i32) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %4 = bitcast %struct.jpeg_memory_mgr** %3 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %4, align 8
  %6 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %5, align 8
  %7 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %8 = tail call i8* %6(%struct.jpeg_common_struct* %7, i32 1, i64 224) #4
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %10 = bitcast %struct.jpeg_d_coef_controller** %9 to i8**
  store i8* %8, i8** %10, align 8
  %11 = bitcast i8* %8 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_input_pass, void (%struct.jpeg_decompress_struct*)** %11, align 8
  %12 = getelementptr inbounds i8, i8* %8, i64 16
  %13 = bitcast i8* %12 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_output_pass, void (%struct.jpeg_decompress_struct*)** %13, align 8
  %14 = getelementptr inbounds i8, i8* %8, i64 216
  %15 = bitcast i8* %14 to i32**
  store i32* null, i32** %15, align 8
  %16 = icmp eq i32 %1, 0
  br i1 %16, label %60, label %17

; <label>:17:                                     ; preds = %2
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %19 = load i32, i32* %18, align 8
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %17
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %22 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %21, align 8
  %23 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr12 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 304
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i32*
  %sunkaddr15 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 8
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to %struct.jpeg_memory_mgr**
  %sunkaddr = ptrtoint i8* %8 to i64
  %sunkaddr22 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr23 = add i64 %sunkaddr22, 48
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to i32*
  br label %24

; <label>:24:                                     ; preds = %.lr.ph, %24
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %24 ]
  %.0111 = phi %struct.jpeg_component_info* [ %22, %.lr.ph ], [ %49, %24 ]
  %25 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0111, i64 0, i32 3
  %26 = load i32, i32* %25, align 4
  %27 = load i32, i32* %sunkaddr14, align 8
  %28 = icmp eq i32 %27, 0
  %29 = mul nsw i32 %26, 3
  %. = select i1 %28, i32 %26, i32 %29
  %30 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr17, align 8
  %31 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %30, i64 0, i32 5
  %32 = load %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0111, i64 0, i32 7
  %34 = load i32, i32* %33, align 4
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0111, i64 0, i32 2
  %37 = load i32, i32* %36, align 8
  %38 = sext i32 %37 to i64
  %39 = tail call i64 @jround_up(i64 %35, i64 %38) #4
  %40 = trunc i64 %39 to i32
  %41 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0111, i64 0, i32 8
  %42 = load i32, i32* %41, align 8
  %43 = zext i32 %42 to i64
  %44 = load i32, i32* %25, align 4
  %45 = sext i32 %44 to i64
  %46 = tail call i64 @jround_up(i64 %43, i64 %45) #4
  %47 = trunc i64 %46 to i32
  %48 = tail call %struct.jvirt_barray_control* %32(%struct.jpeg_common_struct* nonnull %23, i32 1, i32 1, i32 %40, i32 %47, i32 %.) #4
  %sunkaddr18 = shl i64 %indvars.iv, 3
  %sunkaddr19 = add i64 %sunkaddr, %sunkaddr18
  %sunkaddr20 = add i64 %sunkaddr19, 136
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to %struct.jvirt_barray_control**
  store %struct.jvirt_barray_control* %48, %struct.jvirt_barray_control** %sunkaddr21, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %49 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0111, i64 1
  %50 = load i32, i32* %sunkaddr24, align 8
  %51 = sext i32 %50 to i64
  %52 = icmp slt i64 %indvars.iv.next, %51
  br i1 %52, label %24, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %24
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %17
  %53 = getelementptr inbounds i8, i8* %8, i64 8
  %54 = bitcast i8* %53 to i32 (%struct.jpeg_decompress_struct*)**
  store i32 (%struct.jpeg_decompress_struct*)* @consume_data, i32 (%struct.jpeg_decompress_struct*)** %54, align 8
  %55 = getelementptr inbounds i8, i8* %8, i64 24
  %56 = bitcast i8* %55 to i32 (%struct.jpeg_decompress_struct*, i8***)**
  store i32 (%struct.jpeg_decompress_struct*, i8***)* @decompress_data, i32 (%struct.jpeg_decompress_struct*, i8***)** %56, align 8
  %57 = getelementptr inbounds i8, i8* %8, i64 136
  %58 = getelementptr inbounds i8, i8* %8, i64 32
  %59 = bitcast i8* %58 to i8**
  store i8* %57, i8** %59, align 8
  br label %101

; <label>:60:                                     ; preds = %2
  %61 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr6 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 8
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to %struct.jpeg_memory_mgr**
  %62 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr8, align 8
  %63 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %62, i64 0, i32 1
  %64 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %63, align 8
  %65 = tail call i8* %64(%struct.jpeg_common_struct* %61, i32 1, i64 1280) #4
  %66 = getelementptr inbounds i8, i8* %8, i64 56
  %67 = bitcast i8* %66 to i8**
  store i8* %65, i8** %67, align 8
  %68 = getelementptr inbounds i8, i8* %65, i64 128
  %69 = getelementptr inbounds i8, i8* %8, i64 64
  %70 = bitcast i8* %69 to i8**
  store i8* %68, i8** %70, align 8
  %71 = getelementptr inbounds i8, i8* %65, i64 256
  %72 = getelementptr inbounds i8, i8* %8, i64 72
  %73 = bitcast i8* %72 to i8**
  store i8* %71, i8** %73, align 8
  %74 = getelementptr inbounds i8, i8* %65, i64 384
  %75 = getelementptr inbounds i8, i8* %8, i64 80
  %76 = bitcast i8* %75 to i8**
  store i8* %74, i8** %76, align 8
  %77 = getelementptr inbounds i8, i8* %65, i64 512
  %78 = getelementptr inbounds i8, i8* %8, i64 88
  %79 = bitcast i8* %78 to i8**
  store i8* %77, i8** %79, align 8
  %80 = getelementptr inbounds i8, i8* %65, i64 640
  %81 = getelementptr inbounds i8, i8* %8, i64 96
  %82 = bitcast i8* %81 to i8**
  store i8* %80, i8** %82, align 8
  %83 = getelementptr inbounds i8, i8* %65, i64 768
  %84 = getelementptr inbounds i8, i8* %8, i64 104
  %85 = bitcast i8* %84 to i8**
  store i8* %83, i8** %85, align 8
  %86 = getelementptr inbounds i8, i8* %65, i64 896
  %87 = getelementptr inbounds i8, i8* %8, i64 112
  %88 = bitcast i8* %87 to i8**
  store i8* %86, i8** %88, align 8
  %89 = getelementptr inbounds i8, i8* %65, i64 1024
  %90 = getelementptr inbounds i8, i8* %8, i64 120
  %91 = bitcast i8* %90 to i8**
  store i8* %89, i8** %91, align 8
  %92 = getelementptr inbounds i8, i8* %65, i64 1152
  %93 = getelementptr inbounds i8, i8* %8, i64 128
  %94 = bitcast i8* %93 to i8**
  store i8* %92, i8** %94, align 8
  %95 = getelementptr inbounds i8, i8* %8, i64 8
  %96 = bitcast i8* %95 to i32 (%struct.jpeg_decompress_struct*)**
  store i32 (%struct.jpeg_decompress_struct*)* @dummy_consume_data, i32 (%struct.jpeg_decompress_struct*)** %96, align 8
  %97 = getelementptr inbounds i8, i8* %8, i64 24
  %98 = bitcast i8* %97 to i32 (%struct.jpeg_decompress_struct*, i8***)**
  store i32 (%struct.jpeg_decompress_struct*, i8***)* @decompress_onepass, i32 (%struct.jpeg_decompress_struct*, i8***)** %98, align 8
  %99 = getelementptr inbounds i8, i8* %8, i64 32
  %100 = bitcast i8* %99 to %struct.jvirt_barray_control***
  store %struct.jvirt_barray_control** null, %struct.jvirt_barray_control*** %100, align 8
  br label %101

; <label>:101:                                    ; preds = %60, %._crit_edge
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @start_input_pass(%struct.jpeg_decompress_struct* nocapture) #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 35
  store i32 0, i32* %2, align 8
  tail call fastcc void @start_iMCU_row(%struct.jpeg_decompress_struct* %0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_output_pass(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %3 = bitcast %struct.jpeg_d_coef_controller** %2 to %struct.my_coef_controller**
  %4 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %5 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %4, i64 0, i32 0, i32 4
  %6 = load %struct.jvirt_barray_control**, %struct.jvirt_barray_control*** %5, align 8
  %7 = icmp eq %struct.jvirt_barray_control** %6, null
  br i1 %7, label %17, label %8

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 18
  %10 = load i32, i32* %9, align 8
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %15, label %12

; <label>:12:                                     ; preds = %8
  %13 = tail call fastcc i32 @smoothing_ok(%struct.jpeg_decompress_struct* nonnull %0)
  %14 = icmp eq i32 %13, 0
  %decompress_data.decompress_smooth_data = select i1 %14, i32 (%struct.jpeg_decompress_struct*, i8***)* @decompress_data, i32 (%struct.jpeg_decompress_struct*, i8***)* @decompress_smooth_data
  br label %15

; <label>:15:                                     ; preds = %12, %8
  %decompress_data.sink = phi i32 (%struct.jpeg_decompress_struct*, i8***)* [ @decompress_data, %8 ], [ %decompress_data.decompress_smooth_data, %12 ]
  %16 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %4, i64 0, i32 0, i32 3
  store i32 (%struct.jpeg_decompress_struct*, i8***)* %decompress_data.sink, i32 (%struct.jpeg_decompress_struct*, i8***)** %16, align 8
  br label %17

; <label>:17:                                     ; preds = %1, %15
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 37
  store i32 0, i32* %18, align 8
  ret void
}

declare i64 @jround_up(i64, i64) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @consume_data(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca [4 x [64 x i16]**], align 16
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %4 = bitcast %struct.jpeg_d_coef_controller** %3 to %struct.my_coef_controller**
  %5 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 62
  %7 = load i32, i32* %6, align 8
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %.lr.ph47.preheader, label %._crit_edge48

.lr.ph47.preheader:                               ; preds = %1
  %9 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr61 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr62 = add i64 %sunkaddr61, 8
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to %struct.jpeg_memory_mgr**
  %sunkaddr64 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr65 = add i64 %sunkaddr64, 168
  %sunkaddr66 = inttoptr i64 %sunkaddr65 to i32*
  %sunkaddr67 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr68 = add i64 %sunkaddr67, 416
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to i32*
  br label %.lr.ph47

.lr.ph47:                                         ; preds = %.lr.ph47.preheader, %.lr.ph47
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %.lr.ph47 ], [ 0, %.lr.ph47.preheader ]
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv57
  %11 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %10, align 8
  %12 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr63, align 8
  %13 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %12, i64 0, i32 8
  %14 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %11, i64 0, i32 1
  %16 = load i32, i32* %15, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %17
  %19 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %18, align 8
  %20 = load i32, i32* %sunkaddr66, align 8
  %21 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %11, i64 0, i32 3
  %22 = load i32, i32* %21, align 4
  %23 = mul i32 %22, %20
  %24 = tail call [64 x i16]** %14(%struct.jpeg_common_struct* %9, %struct.jvirt_barray_control* %19, i32 %23, i32 %22, i32 1) #4
  %25 = getelementptr inbounds [4 x [64 x i16]**], [4 x [64 x i16]**]* %2, i64 0, i64 %indvars.iv57
  store [64 x i16]** %24, [64 x i16]*** %25, align 8
  %indvars.iv.next58 = add nuw i64 %indvars.iv57, 1
  %26 = load i32, i32* %sunkaddr69, align 8
  %27 = sext i32 %26 to i64
  %28 = icmp slt i64 %indvars.iv.next58, %27
  br i1 %28, label %.lr.ph47, label %._crit_edge48.loopexit

._crit_edge48.loopexit:                           ; preds = %.lr.ph47
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge48.loopexit, %1
  %29 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 2
  %30 = load i32, i32* %29, align 4
  %31 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 3
  %32 = load i32, i32* %31, align 8
  %33 = icmp slt i32 %30, %32
  br i1 %33, label %.lr.ph43, label %._crit_edge44

.lr.ph43:                                         ; preds = %._crit_edge48
  %34 = sext i32 %30 to i64
  %35 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 4, i64 0
  %sunkaddr70 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr71 = add i64 %sunkaddr70, 40
  %sunkaddr72 = inttoptr i64 %sunkaddr71 to i32*
  %sunkaddr73 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr74 = add i64 %sunkaddr73, 456
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to i32*
  %sunkaddr100 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr101 = add i64 %sunkaddr100, 40
  %sunkaddr102 = inttoptr i64 %sunkaddr101 to i32*
  %sunkaddr103 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr104 = add i64 %sunkaddr103, 48
  %sunkaddr105 = inttoptr i64 %sunkaddr104 to i32*
  %sunkaddr76 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr77 = add i64 %sunkaddr76, 416
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to i32*
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr95 = add i64 %sunkaddr, 576
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to %struct.jpeg_entropy_decoder**
  %sunkaddr97 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr98 = add i64 %sunkaddr97, 456
  %sunkaddr99 = inttoptr i64 %sunkaddr98 to i32*
  %sunkaddr82 = ptrtoint [4 x [64 x i16]**]* %2 to i64
  %sunkaddr92 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr93 = add i64 %sunkaddr92, 416
  %sunkaddr94 = inttoptr i64 %sunkaddr93 to i32*
  br label %36

; <label>:36:                                     ; preds = %.lr.ph43, %._crit_edge39
  %indvars.iv55 = phi i64 [ %34, %.lr.ph43 ], [ %indvars.iv.next56, %._crit_edge39 ]
  %37 = load i32, i32* %sunkaddr72, align 8
  %38 = load i32, i32* %sunkaddr75, align 8
  %39 = icmp ult i32 %37, %38
  br i1 %39, label %.preheader.preheader, label %._crit_edge39

.preheader.preheader:                             ; preds = %36
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %79
  %.0238 = phi i32 [ %80, %79 ], [ %37, %.preheader.preheader ]
  %40 = load i32, i32* %sunkaddr78, align 8
  %41 = icmp sgt i32 %40, 0
  br i1 %41, label %.lr.ph36.preheader, label %._crit_edge37

.lr.ph36.preheader:                               ; preds = %.preheader
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %.lr.ph36.preheader, %._crit_edge32
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge32 ], [ 0, %.lr.ph36.preheader ]
  %.0335 = phi i32 [ %.1.lcssa, %._crit_edge32 ], [ 0, %.lr.ph36.preheader ]
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv53
  %43 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %43, i64 0, i32 14
  %45 = load i32, i32* %44, align 8
  %46 = icmp sgt i32 %45, 0
  br i1 %46, label %.lr.ph31, label %._crit_edge32

.lr.ph31:                                         ; preds = %.lr.ph36
  %47 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %43, i64 0, i32 13
  %48 = load i32, i32* %47, align 4
  %49 = mul i32 %48, %.0238
  %50 = zext i32 %49 to i64
  %sunkaddr79 = ptrtoint %struct.jpeg_component_info* %43 to i64
  %sunkaddr80 = add i64 %sunkaddr79, 52
  %sunkaddr81 = inttoptr i64 %sunkaddr80 to i32*
  %sunkaddr83 = shl i64 %indvars.iv53, 3
  %sunkaddr84 = add i64 %sunkaddr82, %sunkaddr83
  %sunkaddr85 = inttoptr i64 %sunkaddr84 to [64 x i16]***
  %sunkaddr86 = ptrtoint %struct.jpeg_component_info* %43 to i64
  %sunkaddr87 = add i64 %sunkaddr86, 52
  %sunkaddr88 = inttoptr i64 %sunkaddr87 to i32*
  %sunkaddr89 = ptrtoint %struct.jpeg_component_info* %43 to i64
  %sunkaddr90 = add i64 %sunkaddr89, 56
  %sunkaddr91 = inttoptr i64 %sunkaddr90 to i32*
  br label %51

; <label>:51:                                     ; preds = %.lr.ph31, %._crit_edge
  %indvars.iv51 = phi i64 [ 0, %.lr.ph31 ], [ %indvars.iv.next52, %._crit_edge ]
  %.129 = phi i32 [ %.0335, %.lr.ph31 ], [ %.2.lcssa, %._crit_edge ]
  %52 = load i32, i32* %sunkaddr81, align 4
  %53 = icmp sgt i32 %52, 0
  br i1 %53, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %51
  %54 = load [64 x i16]**, [64 x i16]*** %sunkaddr85, align 8
  %55 = add nsw i64 %indvars.iv51, %indvars.iv55
  %56 = getelementptr inbounds [64 x i16]*, [64 x i16]** %54, i64 %55
  %57 = load [64 x i16]*, [64 x i16]** %56, align 8
  %58 = getelementptr inbounds [64 x i16], [64 x i16]* %57, i64 %50
  %59 = sext i32 %.129 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %59, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %.0127 = phi [64 x i16]* [ %58, %.lr.ph.preheader ], [ %61, %.lr.ph ]
  %.0625 = phi i32 [ 0, %.lr.ph.preheader ], [ %62, %.lr.ph ]
  %60 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 4, i64 %indvars.iv
  store [64 x i16]* %.0127, [64 x i16]** %60, align 8
  %indvars.iv.next = add i64 %indvars.iv, 1
  %61 = getelementptr inbounds [64 x i16], [64 x i16]* %.0127, i64 1
  %62 = add nuw nsw i32 %.0625, 1
  %63 = load i32, i32* %sunkaddr88, align 4
  %64 = icmp slt i32 %62, %63
  br i1 %64, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %65 = trunc i64 %indvars.iv.next to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %51
  %.2.lcssa = phi i32 [ %.129, %51 ], [ %65, %._crit_edge.loopexit ]
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %66 = load i32, i32* %sunkaddr91, align 8
  %67 = sext i32 %66 to i64
  %68 = icmp slt i64 %indvars.iv.next52, %67
  br i1 %68, label %51, label %._crit_edge32.loopexit

._crit_edge32.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %.lr.ph36
  %.1.lcssa = phi i32 [ %.0335, %.lr.ph36 ], [ %.2.lcssa, %._crit_edge32.loopexit ]
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %69 = load i32, i32* %sunkaddr94, align 8
  %70 = sext i32 %69 to i64
  %71 = icmp slt i64 %indvars.iv.next54, %70
  br i1 %71, label %.lr.ph36, label %._crit_edge37.loopexit

._crit_edge37.loopexit:                           ; preds = %._crit_edge32
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37.loopexit, %.preheader
  %72 = load %struct.jpeg_entropy_decoder*, %struct.jpeg_entropy_decoder** %sunkaddr96, align 8
  %73 = getelementptr inbounds %struct.jpeg_entropy_decoder, %struct.jpeg_entropy_decoder* %72, i64 0, i32 1
  %74 = load i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)** %73, align 8
  %75 = tail call i32 %74(%struct.jpeg_decompress_struct* nonnull %0, [64 x i16]** %35) #4
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %79

; <label>:77:                                     ; preds = %._crit_edge37
  %78 = trunc i64 %indvars.iv55 to i32
  %sunkaddr14 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr15 = add i64 %sunkaddr14, 44
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to i32*
  store i32 %78, i32* %sunkaddr16, align 4
  %sunkaddr17 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr18 = add i64 %sunkaddr17, 40
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to i32*
  store i32 %.0238, i32* %sunkaddr19, align 8
  br label %98

; <label>:79:                                     ; preds = %._crit_edge37
  %80 = add i32 %.0238, 1
  %81 = load i32, i32* %sunkaddr99, align 8
  %82 = icmp ult i32 %80, %81
  br i1 %82, label %.preheader, label %._crit_edge39.loopexit

._crit_edge39.loopexit:                           ; preds = %79
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %36
  store i32 0, i32* %sunkaddr102, align 8
  %indvars.iv.next56 = add i64 %indvars.iv55, 1
  %83 = load i32, i32* %sunkaddr105, align 8
  %84 = sext i32 %83 to i64
  %85 = icmp slt i64 %indvars.iv.next56, %84
  br i1 %85, label %36, label %._crit_edge44.loopexit

._crit_edge44.loopexit:                           ; preds = %._crit_edge39
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.loopexit, %._crit_edge48
  %86 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 35
  %87 = load i32, i32* %86, align 8
  %88 = add i32 %87, 1
  store i32 %88, i32* %86, align 8
  %89 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 60
  %90 = load i32, i32* %89, align 8
  %91 = icmp ult i32 %88, %90
  br i1 %91, label %92, label %93

; <label>:92:                                     ; preds = %._crit_edge44
  tail call fastcc void @start_iMCU_row(%struct.jpeg_decompress_struct* nonnull %0)
  br label %98

; <label>:93:                                     ; preds = %._crit_edge44
  %94 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %95 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %94, align 8
  %96 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %95, i64 0, i32 3
  %97 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %96, align 8
  tail call void %97(%struct.jpeg_decompress_struct* nonnull %0) #4
  br label %98

; <label>:98:                                     ; preds = %93, %92, %77
  %.0 = phi i32 [ 0, %77 ], [ 3, %92 ], [ 4, %93 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @decompress_data(%struct.jpeg_decompress_struct*, i8*** nocapture readonly) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %4 = bitcast %struct.jpeg_d_coef_controller** %3 to %struct.my_coef_controller**
  %5 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 60
  %7 = load i32, i32* %6, align 8
  %8 = add i32 %7, -1
  %sunkaddr34 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr35 = add i64 %sunkaddr34, 164
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to i32*
  %sunkaddr37 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr38 = add i64 %sunkaddr37, 172
  %sunkaddr39 = inttoptr i64 %sunkaddr38 to i32*
  %sunkaddr46 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr47 = add i64 %sunkaddr46, 560
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to i32 (%struct.jpeg_decompress_struct*)***
  %sunkaddr40 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr41 = add i64 %sunkaddr40, 168
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to i32*
  %sunkaddr43 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr44 = add i64 %sunkaddr43, 176
  %sunkaddr45 = inttoptr i64 %sunkaddr44 to i32*
  br label %9

; <label>:9:                                      ; preds = %.critedge, %2
  %10 = load i32, i32* %sunkaddr36, align 4
  %11 = load i32, i32* %sunkaddr39, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %.critedge, label %13

; <label>:13:                                     ; preds = %9
  %14 = icmp eq i32 %10, %11
  br i1 %14, label %15, label %.critedge9

; <label>:15:                                     ; preds = %13
  %16 = load i32, i32* %sunkaddr42, align 8
  %17 = load i32, i32* %sunkaddr45, align 8
  %18 = icmp ugt i32 %16, %17
  br i1 %18, label %.critedge9, label %.critedge

.critedge:                                        ; preds = %15, %9
  %19 = load i32 (%struct.jpeg_decompress_struct*)**, i32 (%struct.jpeg_decompress_struct*)*** %sunkaddr48, align 8
  %20 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %19, align 8
  %21 = tail call i32 %20(%struct.jpeg_decompress_struct* nonnull %0) #4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %.loopexit18.loopexit, label %9

.critedge9:                                       ; preds = %15, %13
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %24 = load i32, i32* %23, align 8
  %25 = icmp sgt i32 %24, 0
  br i1 %25, label %.lr.ph30, label %._crit_edge31

.lr.ph30:                                         ; preds = %.critedge9
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %27 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %26, align 8
  %sunkaddr70 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr71 = add i64 %sunkaddr70, 48
  %sunkaddr72 = inttoptr i64 %sunkaddr71 to i32*
  %28 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr49 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr50 = add i64 %sunkaddr49, 8
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to %struct.jpeg_memory_mgr**
  %sunkaddr52 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr53 = add i64 %sunkaddr52, 176
  %sunkaddr54 = inttoptr i64 %sunkaddr53 to i32*
  %sunkaddr55 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr56 = add i64 %sunkaddr55, 584
  %sunkaddr57 = inttoptr i64 %sunkaddr56 to %struct.jpeg_inverse_dct**
  br label %29

; <label>:29:                                     ; preds = %.lr.ph30, %.loopexit
  %indvars.iv32 = phi i64 [ 0, %.lr.ph30 ], [ %indvars.iv.next33, %.loopexit ]
  %.0127 = phi %struct.jpeg_component_info* [ %27, %.lr.ph30 ], [ %75, %.loopexit ]
  %30 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0127, i64 0, i32 12
  %31 = load i32, i32* %30, align 8
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %.loopexit, label %33

; <label>:33:                                     ; preds = %29
  %34 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr51, align 8
  %35 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %34, i64 0, i32 8
  %36 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %35, align 8
  %37 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %indvars.iv32
  %38 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %37, align 8
  %39 = load i32, i32* %sunkaddr54, align 8
  %40 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0127, i64 0, i32 3
  %41 = load i32, i32* %40, align 4
  %42 = mul i32 %41, %39
  %43 = tail call [64 x i16]** %36(%struct.jpeg_common_struct* %28, %struct.jvirt_barray_control* %38, i32 %42, i32 %41, i32 0) #4
  %44 = load i32, i32* %sunkaddr54, align 8
  %45 = icmp ult i32 %44, %8
  br i1 %45, label %.sink.split, label %46

; <label>:46:                                     ; preds = %33
  %47 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0127, i64 0, i32 8
  %48 = load i32, i32* %47, align 8
  %sunkaddr = ptrtoint %struct.jpeg_component_info* %.0127 to i64
  %sunkaddr10 = add i64 %sunkaddr, 12
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i32*
  %49 = load i32, i32* %sunkaddr11, align 4
  %50 = urem i32 %48, %49
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %.sink.split, label %53

.sink.split:                                      ; preds = %33, %46
  %sunkaddr12 = ptrtoint %struct.jpeg_component_info* %.0127 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 12
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i32*
  %52 = load i32, i32* %sunkaddr14, align 4
  br label %53

; <label>:53:                                     ; preds = %.sink.split, %46
  %.1 = phi i32 [ %50, %46 ], [ %52, %.sink.split ]
  %54 = load %struct.jpeg_inverse_dct*, %struct.jpeg_inverse_dct** %sunkaddr57, align 8
  %55 = getelementptr inbounds %struct.jpeg_inverse_dct, %struct.jpeg_inverse_dct* %54, i64 0, i32 1, i64 %indvars.iv32
  %56 = load void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %55, align 8
  %57 = icmp sgt i32 %.1, 0
  br i1 %57, label %.lr.ph25, label %.loopexit

.lr.ph25:                                         ; preds = %53
  %58 = getelementptr inbounds i8**, i8*** %1, i64 %indvars.iv32
  %59 = load i8**, i8*** %58, align 8
  %wide.trip.count = zext i32 %.1 to i64
  %sunkaddr58 = ptrtoint %struct.jpeg_component_info* %.0127 to i64
  %sunkaddr59 = add i64 %sunkaddr58, 28
  %sunkaddr60 = inttoptr i64 %sunkaddr59 to i32*
  %sunkaddr67 = ptrtoint %struct.jpeg_component_info* %.0127 to i64
  %sunkaddr68 = add i64 %sunkaddr67, 36
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to i32*
  %sunkaddr61 = ptrtoint %struct.jpeg_component_info* %.0127 to i64
  %sunkaddr62 = add i64 %sunkaddr61, 36
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to i32*
  %sunkaddr64 = ptrtoint %struct.jpeg_component_info* %.0127 to i64
  %sunkaddr65 = add i64 %sunkaddr64, 28
  %sunkaddr66 = inttoptr i64 %sunkaddr65 to i32*
  br label %60

; <label>:60:                                     ; preds = %._crit_edge, %.lr.ph25
  %indvars.iv = phi i64 [ 0, %.lr.ph25 ], [ %indvars.iv.next, %._crit_edge ]
  %.0323 = phi i8** [ %59, %.lr.ph25 ], [ %74, %._crit_edge ]
  %61 = load i32, i32* %sunkaddr60, align 4
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %60
  %63 = getelementptr inbounds [64 x i16]*, [64 x i16]** %43, i64 %indvars.iv
  %64 = load [64 x i16]*, [64 x i16]** %63, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.0221 = phi i32 [ %67, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %.0420 = phi [64 x i16]* [ %68, %.lr.ph ], [ %64, %.lr.ph.preheader ]
  %.0519 = phi i32 [ %69, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %65 = getelementptr inbounds [64 x i16], [64 x i16]* %.0420, i64 0, i64 0
  tail call void %56(%struct.jpeg_decompress_struct* %0, %struct.jpeg_component_info* nonnull %.0127, i16* %65, i8** %.0323, i32 %.0221) #4
  %66 = load i32, i32* %sunkaddr63, align 4
  %67 = add i32 %66, %.0221
  %68 = getelementptr inbounds [64 x i16], [64 x i16]* %.0420, i64 1
  %69 = add i32 %.0519, 1
  %70 = load i32, i32* %sunkaddr66, align 4
  %71 = icmp ult i32 %69, %70
  br i1 %71, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %60
  %72 = load i32, i32* %sunkaddr69, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i8*, i8** %.0323, i64 %73
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.loopexit.loopexit, label %60

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %53, %29
  %indvars.iv.next33 = add nuw i64 %indvars.iv32, 1
  %75 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0127, i64 1
  %76 = load i32, i32* %sunkaddr72, align 8
  %77 = sext i32 %76 to i64
  %78 = icmp slt i64 %indvars.iv.next33, %77
  br i1 %78, label %29, label %._crit_edge31.loopexit

._crit_edge31.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %.critedge9
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 37
  %80 = load i32, i32* %79, align 8
  %81 = add i32 %80, 1
  store i32 %81, i32* %79, align 8
  %sunkaddr15 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 400
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32*
  %82 = load i32, i32* %sunkaddr17, align 8
  %83 = icmp ult i32 %81, %82
  %. = select i1 %83, i32 3, i32 4
  br label %.loopexit18

.loopexit18.loopexit:                             ; preds = %.critedge
  br label %.loopexit18

.loopexit18:                                      ; preds = %.loopexit18.loopexit, %._crit_edge31
  %.0 = phi i32 [ %., %._crit_edge31 ], [ 0, %.loopexit18.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal i32 @dummy_consume_data(%struct.jpeg_decompress_struct* nocapture readnone) #3 {
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @decompress_onepass(%struct.jpeg_decompress_struct*, i8*** nocapture readonly) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %4 = bitcast %struct.jpeg_d_coef_controller** %3 to %struct.my_coef_controller**
  %5 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 64
  %7 = load i32, i32* %6, align 8
  %8 = add i32 %7, -1
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 60
  %10 = load i32, i32* %9, align 8
  %11 = add i32 %10, -1
  %12 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 3
  %15 = load i32, i32* %14, align 8
  %16 = icmp slt i32 %13, %15
  br i1 %16, label %.lr.ph54, label %._crit_edge55

.lr.ph54:                                         ; preds = %2
  %17 = sext i32 %13 to i64
  %18 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 4, i64 0
  %sunkaddr68 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr69 = add i64 %sunkaddr68, 40
  %sunkaddr70 = inttoptr i64 %sunkaddr69 to i32*
  %sunkaddr110 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr111 = add i64 %sunkaddr110, 40
  %sunkaddr112 = inttoptr i64 %sunkaddr111 to i32*
  %sunkaddr113 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr114 = add i64 %sunkaddr113, 48
  %sunkaddr115 = inttoptr i64 %sunkaddr114 to i32*
  %19 = bitcast [64 x i16]** %18 to i8**
  %sunkaddr71 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr72 = add i64 %sunkaddr71, 464
  %sunkaddr73 = inttoptr i64 %sunkaddr72 to i32*
  %sunkaddr74 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr75 = add i64 %sunkaddr74, 576
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to %struct.jpeg_entropy_decoder**
  %sunkaddr77 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr78 = add i64 %sunkaddr77, 416
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to i32*
  %sunkaddr107 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr108 = add i64 %sunkaddr107, 416
  %sunkaddr109 = inttoptr i64 %sunkaddr108 to i32*
  %sunkaddr80 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr81 = add i64 %sunkaddr80, 584
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to %struct.jpeg_inverse_dct**
  %sunkaddr89 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr90 = add i64 %sunkaddr89, 168
  %sunkaddr91 = inttoptr i64 %sunkaddr90 to i32*
  br label %20

; <label>:20:                                     ; preds = %.lr.ph54, %._crit_edge50
  %indvars.iv62 = phi i64 [ %17, %.lr.ph54 ], [ %indvars.iv.next63, %._crit_edge50 ]
  %21 = load i32, i32* %sunkaddr70, align 8
  %22 = icmp ugt i32 %21, %8
  br i1 %22, label %._crit_edge50, label %.lr.ph49.preheader

.lr.ph49.preheader:                               ; preds = %20
  %23 = trunc i64 %indvars.iv62 to i32
  br label %.lr.ph49

.lr.ph49:                                         ; preds = %.lr.ph49.preheader, %._crit_edge
  %.0446 = phi i32 [ %126, %._crit_edge ], [ %21, %.lr.ph49.preheader ]
  %24 = load i8*, i8** %19, align 8
  %25 = load i32, i32* %sunkaddr73, align 8
  %26 = sext i32 %25 to i64
  %27 = shl nsw i64 %26, 7
  tail call void @jzero_far(i8* %24, i64 %27) #4
  %28 = load %struct.jpeg_entropy_decoder*, %struct.jpeg_entropy_decoder** %sunkaddr76, align 8
  %29 = getelementptr inbounds %struct.jpeg_entropy_decoder, %struct.jpeg_entropy_decoder* %28, i64 0, i32 1
  %30 = load i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)** %29, align 8
  %31 = tail call i32 %30(%struct.jpeg_decompress_struct* %0, [64 x i16]** %18) #4
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %36, label %.preheader32

.preheader32:                                     ; preds = %.lr.ph49
  %33 = load i32, i32* %sunkaddr79, align 8
  %34 = icmp sgt i32 %33, 0
  br i1 %34, label %.lr.ph45.preheader, label %._crit_edge

.lr.ph45.preheader:                               ; preds = %.preheader32
  %35 = icmp ult i32 %.0446, %8
  br label %.lr.ph45

; <label>:36:                                     ; preds = %.lr.ph49
  %37 = trunc i64 %indvars.iv62 to i32
  %sunkaddr = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr9 = add i64 %sunkaddr, 44
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to i32*
  store i32 %37, i32* %sunkaddr10, align 4
  %sunkaddr11 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr12 = add i64 %sunkaddr11, 40
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to i32*
  store i32 %.0446, i32* %sunkaddr13, align 8
  br label %145

.lr.ph45:                                         ; preds = %.lr.ph45.preheader, %.loopexit31
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %.loopexit31 ], [ 0, %.lr.ph45.preheader ]
  %.0744 = phi i32 [ %.2, %.loopexit31 ], [ 0, %.lr.ph45.preheader ]
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv60
  %39 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %38, align 8
  %40 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %39, i64 0, i32 12
  %41 = load i32, i32* %40, align 8
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %43, label %47

; <label>:43:                                     ; preds = %.lr.ph45
  %44 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %39, i64 0, i32 15
  %45 = load i32, i32* %44, align 4
  %46 = add nsw i32 %45, %.0744
  br label %.loopexit31

; <label>:47:                                     ; preds = %.lr.ph45
  %48 = load %struct.jpeg_inverse_dct*, %struct.jpeg_inverse_dct** %sunkaddr82, align 8
  %49 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %39, i64 0, i32 1
  %50 = load i32, i32* %49, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds %struct.jpeg_inverse_dct, %struct.jpeg_inverse_dct* %48, i64 0, i32 1, i64 %51
  %53 = load void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %39, i64 0, i32 13
  %55 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %39, i64 0, i32 17
  %.in = select i1 %35, i32* %54, i32* %55
  %56 = load i32, i32* %.in, align 4
  %wide.trip.count = zext i32 %56 to i64
  %57 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %39, i64 0, i32 16
  %58 = load i32, i32* %57, align 8
  %59 = mul i32 %58, %.0446
  %60 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %39, i64 0, i32 14
  %61 = load i32, i32* %60, align 8
  %62 = icmp sgt i32 %61, 0
  br i1 %62, label %.lr.ph42, label %.loopexit31

.lr.ph42:                                         ; preds = %47
  %63 = icmp sgt i32 %56, 0
  br i1 %63, label %.lr.ph42.split.us.preheader, label %.lr.ph42.split.preheader

.lr.ph42.split.preheader:                         ; preds = %.lr.ph42
  %sunkaddr83 = ptrtoint %struct.jpeg_component_info* %39 to i64
  %sunkaddr84 = add i64 %sunkaddr83, 52
  %sunkaddr85 = inttoptr i64 %sunkaddr84 to i32*
  %64 = load i32, i32* %sunkaddr85, align 4
  %sunkaddr86 = ptrtoint %struct.jpeg_component_info* %39 to i64
  %sunkaddr87 = add i64 %sunkaddr86, 56
  %sunkaddr88 = inttoptr i64 %sunkaddr87 to i32*
  %65 = load i32, i32* %sunkaddr88, align 8
  %66 = icmp sgt i32 %65, 1
  %smax = select i1 %66, i32 %65, i32 1
  %min.iters.check = icmp ult i32 %smax, 8
  br i1 %min.iters.check, label %.lr.ph42.split.preheader127, label %min.iters.checked

.lr.ph42.split.preheader127:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph42.split.preheader
  %.0540.ph = phi i32 [ 0, %min.iters.checked ], [ 0, %.lr.ph42.split.preheader ], [ %n.vec, %middle.block ]
  %.137.ph = phi i32 [ %.0744, %min.iters.checked ], [ %.0744, %.lr.ph42.split.preheader ], [ %91, %middle.block ]
  br label %.lr.ph42.split

min.iters.checked:                                ; preds = %.lr.ph42.split.preheader
  %n.vec = and i32 %smax, 2147483640
  %cmp.zero = icmp eq i32 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph42.split.preheader127, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %67 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %.0744, i32 0
  %broadcast.splatinsert122 = insertelement <4 x i32> undef, i32 %64, i32 0
  %broadcast.splat123 = shufflevector <4 x i32> %broadcast.splatinsert122, <4 x i32> undef, <4 x i32> zeroinitializer
  %68 = add nsw i32 %n.vec, -8
  %69 = lshr exact i32 %68, 3
  %70 = add nuw nsw i32 %69, 1
  %xtraiter = and i32 %70, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i32 [ 0, %vector.body.prol.preheader ], [ %index.next.prol, %vector.body.prol ]
  %vec.phi.prol = phi <4 x i32> [ %67, %vector.body.prol.preheader ], [ %71, %vector.body.prol ]
  %vec.phi121.prol = phi <4 x i32> [ zeroinitializer, %vector.body.prol.preheader ], [ %72, %vector.body.prol ]
  %prol.iter = phi i32 [ %xtraiter, %vector.body.prol.preheader ], [ %prol.iter.sub, %vector.body.prol ]
  %71 = add nsw <4 x i32> %broadcast.splat123, %vec.phi.prol
  %72 = add nsw <4 x i32> %broadcast.splat123, %vec.phi121.prol
  %index.next.prol = add i32 %index.prol, 8
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.ph, %vector.body.prol.loopexit.unr-lcssa
  %.lcssa129.unr = phi <4 x i32> [ undef, %vector.ph ], [ %71, %vector.body.prol.loopexit.unr-lcssa ]
  %.lcssa.unr = phi <4 x i32> [ undef, %vector.ph ], [ %72, %vector.body.prol.loopexit.unr-lcssa ]
  %index.unr = phi i32 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %vec.phi.unr = phi <4 x i32> [ %67, %vector.ph ], [ %71, %vector.body.prol.loopexit.unr-lcssa ]
  %vec.phi121.unr = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %72, %vector.body.prol.loopexit.unr-lcssa ]
  %73 = icmp ult i32 %68, 56
  br i1 %73, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i32 [ %index.unr, %vector.ph.new ], [ %index.next.7, %vector.body ]
  %vec.phi = phi <4 x i32> [ %vec.phi.unr, %vector.ph.new ], [ %88, %vector.body ]
  %vec.phi121 = phi <4 x i32> [ %vec.phi121.unr, %vector.ph.new ], [ %89, %vector.body ]
  %74 = add nsw <4 x i32> %broadcast.splat123, %vec.phi
  %75 = add nsw <4 x i32> %broadcast.splat123, %vec.phi121
  %76 = add nsw <4 x i32> %broadcast.splat123, %74
  %77 = add nsw <4 x i32> %broadcast.splat123, %75
  %78 = add nsw <4 x i32> %broadcast.splat123, %76
  %79 = add nsw <4 x i32> %broadcast.splat123, %77
  %80 = add nsw <4 x i32> %broadcast.splat123, %78
  %81 = add nsw <4 x i32> %broadcast.splat123, %79
  %82 = add nsw <4 x i32> %broadcast.splat123, %80
  %83 = add nsw <4 x i32> %broadcast.splat123, %81
  %84 = add nsw <4 x i32> %broadcast.splat123, %82
  %85 = add nsw <4 x i32> %broadcast.splat123, %83
  %86 = add nsw <4 x i32> %broadcast.splat123, %84
  %87 = add nsw <4 x i32> %broadcast.splat123, %85
  %88 = add nsw <4 x i32> %broadcast.splat123, %86
  %89 = add nsw <4 x i32> %broadcast.splat123, %87
  %index.next.7 = add i32 %index, 64
  %90 = icmp eq i32 %index.next.7, %n.vec
  br i1 %90, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %.lcssa129 = phi <4 x i32> [ %.lcssa129.unr, %vector.body.prol.loopexit ], [ %88, %middle.block.unr-lcssa ]
  %.lcssa = phi <4 x i32> [ %.lcssa.unr, %vector.body.prol.loopexit ], [ %89, %middle.block.unr-lcssa ]
  %bin.rdx = add <4 x i32> %.lcssa, %.lcssa129
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx124 = add <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf125 = shufflevector <4 x i32> %bin.rdx124, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx126 = add <4 x i32> %bin.rdx124, %rdx.shuf125
  %91 = extractelement <4 x i32> %bin.rdx126, i32 0
  %cmp.n = icmp eq i32 %smax, %n.vec
  br i1 %cmp.n, label %.loopexit31, label %.lr.ph42.split.preheader127

.lr.ph42.split.us.preheader:                      ; preds = %.lr.ph42
  %92 = getelementptr inbounds i8**, i8*** %1, i64 %indvars.iv60
  %93 = load i8**, i8*** %92, align 8
  %94 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %39, i64 0, i32 9
  %95 = load i32, i32* %94, align 4
  %96 = sext i32 %95 to i64
  %97 = mul nsw i64 %96, %indvars.iv62
  %98 = getelementptr inbounds i8*, i8** %93, i64 %97
  %sunkaddr104 = ptrtoint %struct.jpeg_component_info* %39 to i64
  %sunkaddr105 = add i64 %sunkaddr104, 36
  %sunkaddr106 = inttoptr i64 %sunkaddr105 to i32*
  %sunkaddr95 = ptrtoint %struct.jpeg_component_info* %39 to i64
  %sunkaddr96 = add i64 %sunkaddr95, 36
  %sunkaddr97 = inttoptr i64 %sunkaddr96 to i32*
  %sunkaddr98 = ptrtoint %struct.jpeg_component_info* %39 to i64
  %sunkaddr99 = add i64 %sunkaddr98, 52
  %sunkaddr100 = inttoptr i64 %sunkaddr99 to i32*
  %sunkaddr101 = ptrtoint %struct.jpeg_component_info* %39 to i64
  %sunkaddr102 = add i64 %sunkaddr101, 56
  %sunkaddr103 = inttoptr i64 %sunkaddr102 to i32*
  %sunkaddr92 = ptrtoint %struct.jpeg_component_info* %39 to i64
  %sunkaddr93 = add i64 %sunkaddr92, 72
  %sunkaddr94 = inttoptr i64 %sunkaddr93 to i32*
  br label %.lr.ph42.split.us

.lr.ph42.split.us:                                ; preds = %.lr.ph42.split.us.preheader, %..loopexit_crit_edge.us
  %.0241.us = phi i8** [ %108, %..loopexit_crit_edge.us ], [ %98, %.lr.ph42.split.us.preheader ]
  %.0540.us = phi i32 [ %111, %..loopexit_crit_edge.us ], [ 0, %.lr.ph42.split.us.preheader ]
  %.137.us = phi i32 [ %110, %..loopexit_crit_edge.us ], [ %.0744, %.lr.ph42.split.us.preheader ]
  %99 = load i32, i32* %sunkaddr91, align 8
  %100 = icmp ult i32 %99, %11
  br i1 %100, label %.lr.ph.us.preheader, label %101

; <label>:101:                                    ; preds = %.lr.ph42.split.us
  %102 = add nsw i32 %.0540.us, %23
  %103 = load i32, i32* %sunkaddr94, align 8
  %104 = icmp slt i32 %102, %103
  br i1 %104, label %.lr.ph.us.preheader, label %..loopexit_crit_edge.us

.lr.ph.us.preheader:                              ; preds = %.lr.ph42.split.us, %101
  %105 = sext i32 %.137.us to i64
  br label %.lr.ph.us

..loopexit_crit_edge.us.loopexit:                 ; preds = %.lr.ph.us
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit, %101
  %106 = load i32, i32* %sunkaddr97, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i8*, i8** %.0241.us, i64 %107
  %109 = load i32, i32* %sunkaddr100, align 4
  %110 = add nsw i32 %109, %.137.us
  %111 = add nuw nsw i32 %.0540.us, 1
  %112 = load i32, i32* %sunkaddr103, align 8
  %113 = icmp slt i32 %111, %112
  br i1 %113, label %.lr.ph42.split.us, label %.loopexit31.loopexit

.lr.ph.us:                                        ; preds = %.lr.ph.us, %.lr.ph.us.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next, %.lr.ph.us ]
  %.0136.us = phi i32 [ %59, %.lr.ph.us.preheader ], [ %119, %.lr.ph.us ]
  %114 = add nsw i64 %indvars.iv, %105
  %115 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 4, i64 %114
  %116 = bitcast [64 x i16]** %115 to i16**
  %117 = load i16*, i16** %116, align 8
  tail call void %53(%struct.jpeg_decompress_struct* %0, %struct.jpeg_component_info* nonnull %39, i16* %117, i8** %.0241.us, i32 %.0136.us) #4
  %118 = load i32, i32* %sunkaddr106, align 4
  %119 = add i32 %118, %.0136.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %..loopexit_crit_edge.us.loopexit, label %.lr.ph.us

.lr.ph42.split:                                   ; preds = %.lr.ph42.split.preheader127, %.lr.ph42.split
  %.0540 = phi i32 [ %121, %.lr.ph42.split ], [ %.0540.ph, %.lr.ph42.split.preheader127 ]
  %.137 = phi i32 [ %120, %.lr.ph42.split ], [ %.137.ph, %.lr.ph42.split.preheader127 ]
  %120 = add nsw i32 %64, %.137
  %121 = add nuw nsw i32 %.0540, 1
  %122 = icmp slt i32 %121, %65
  br i1 %122, label %.lr.ph42.split, label %.loopexit31.loopexit128, !llvm.loop !6

.loopexit31.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %.loopexit31

.loopexit31.loopexit128:                          ; preds = %.lr.ph42.split
  br label %.loopexit31

.loopexit31:                                      ; preds = %.loopexit31.loopexit128, %.loopexit31.loopexit, %middle.block, %47, %43
  %.2 = phi i32 [ %46, %43 ], [ %.0744, %47 ], [ %91, %middle.block ], [ %110, %.loopexit31.loopexit ], [ %120, %.loopexit31.loopexit128 ]
  %indvars.iv.next61 = add nuw i64 %indvars.iv60, 1
  %123 = load i32, i32* %sunkaddr109, align 8
  %124 = sext i32 %123 to i64
  %125 = icmp slt i64 %indvars.iv.next61, %124
  br i1 %125, label %.lr.ph45, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit31
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader32
  %126 = add i32 %.0446, 1
  %127 = icmp ugt i32 %126, %8
  br i1 %127, label %._crit_edge50.loopexit, label %.lr.ph49

._crit_edge50.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50.loopexit, %20
  store i32 0, i32* %sunkaddr112, align 8
  %indvars.iv.next63 = add i64 %indvars.iv62, 1
  %128 = load i32, i32* %sunkaddr115, align 8
  %129 = sext i32 %128 to i64
  %130 = icmp slt i64 %indvars.iv.next63, %129
  br i1 %130, label %20, label %._crit_edge55.loopexit

._crit_edge55.loopexit:                           ; preds = %._crit_edge50
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %2
  %131 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 37
  %132 = load i32, i32* %131, align 8
  %133 = add i32 %132, 1
  store i32 %133, i32* %131, align 8
  %134 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 35
  %135 = load i32, i32* %134, align 8
  %136 = add i32 %135, 1
  store i32 %136, i32* %134, align 8
  %sunkaddr27 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr28 = add i64 %sunkaddr27, 400
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to i32*
  %137 = load i32, i32* %sunkaddr29, align 8
  %138 = icmp ult i32 %136, %137
  br i1 %138, label %139, label %140

; <label>:139:                                    ; preds = %._crit_edge55
  tail call fastcc void @start_iMCU_row(%struct.jpeg_decompress_struct* nonnull %0)
  br label %145

; <label>:140:                                    ; preds = %._crit_edge55
  %141 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %142 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %141, align 8
  %143 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %142, i64 0, i32 3
  %144 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %143, align 8
  tail call void %144(%struct.jpeg_decompress_struct* nonnull %0) #4
  br label %145

; <label>:145:                                    ; preds = %140, %139, %36
  %.0 = phi i32 [ 0, %36 ], [ 3, %139 ], [ 4, %140 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @start_iMCU_row(%struct.jpeg_decompress_struct* nocapture readonly) unnamed_addr #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %3 = bitcast %struct.jpeg_d_coef_controller** %2 to %struct.my_coef_controller**
  %4 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 62
  %6 = load i32, i32* %5, align 8
  %7 = icmp sgt i32 %6, 1
  br i1 %7, label %23, label %8

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 35
  %10 = load i32, i32* %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 60
  %12 = load i32, i32* %11, align 8
  %13 = add i32 %12, -1
  %14 = icmp ult i32 %10, %13
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 0
  %16 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %15, align 8
  br i1 %14, label %17, label %20

; <label>:17:                                     ; preds = %8
  %18 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %16, i64 0, i32 3
  %19 = load i32, i32* %18, align 4
  br label %23

; <label>:20:                                     ; preds = %8
  %21 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %16, i64 0, i32 18
  %22 = load i32, i32* %21, align 8
  br label %23

; <label>:23:                                     ; preds = %17, %20, %1
  %.sink.sink = phi i32 [ 1, %1 ], [ %22, %20 ], [ %19, %17 ]
  %24 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %4, i64 0, i32 3
  store i32 %.sink.sink, i32* %24, align 8
  %25 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %4, i64 0, i32 1
  store i32 0, i32* %25, align 8
  %26 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %4, i64 0, i32 2
  store i32 0, i32* %26, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @smoothing_ok(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %3 = bitcast %struct.jpeg_d_coef_controller** %2 to %struct.my_coef_controller**
  %4 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 44
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %.loopexit, label %8

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 38
  %10 = load [64 x i32]*, [64 x i32]** %9, align 8
  %11 = icmp eq [64 x i32]* %10, null
  br i1 %11, label %.loopexit, label %12

; <label>:12:                                     ; preds = %8
  %13 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %4, i64 0, i32 6
  %14 = load i32*, i32** %13, align 8
  %15 = icmp eq i32* %14, null
  br i1 %15, label %16, label %27

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %18 = bitcast %struct.jpeg_memory_mgr** %17 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %19 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %18, align 8
  %20 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %19, align 8
  %21 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %23 = load i32, i32* %22, align 8
  %24 = sext i32 %23 to i64
  %25 = mul nsw i64 %24, 24
  %26 = tail call i8* %20(%struct.jpeg_common_struct* %21, i32 1, i64 %25) #4
  %sunkaddr = ptrtoint %struct.my_coef_controller* %4 to i64
  %sunkaddr6 = add i64 %sunkaddr, 216
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to i8**
  store i8* %26, i8** %sunkaddr7, align 8
  br label %27

; <label>:27:                                     ; preds = %16, %12
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %29 = load i32, i32* %28, align 8
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %27
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %32 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %31, align 8
  %sunkaddr8 = ptrtoint %struct.my_coef_controller* %4 to i64
  %sunkaddr9 = add i64 %sunkaddr8, 216
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to i32**
  %33 = load i32*, i32** %sunkaddr10, align 8
  %sunkaddr37 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr38 = add i64 %sunkaddr37, 184
  %sunkaddr39 = inttoptr i64 %sunkaddr38 to [64 x i32]**
  %sunkaddr40 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr41 = add i64 %sunkaddr40, 48
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.preheader ]
  %.0119 = phi i32* [ %33, %.lr.ph.preheader ], [ %91, %.preheader ]
  %.0218 = phi %struct.jpeg_component_info* [ %32, %.lr.ph.preheader ], [ %92, %.preheader ]
  %.0317 = phi i32 [ 0, %.lr.ph.preheader ], [ %.1..4, %.preheader ]
  %34 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0218, i64 0, i32 19
  %35 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %34, align 8
  %36 = icmp eq %struct.JQUANT_TBL* %35, null
  br i1 %36, label %.loopexit.loopexit, label %37

; <label>:37:                                     ; preds = %.lr.ph
  %38 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %35, i64 0, i32 0, i64 0
  %39 = load i16, i16* %38, align 4
  %40 = icmp eq i16 %39, 0
  br i1 %40, label %.loopexit.loopexit, label %41

; <label>:41:                                     ; preds = %37
  %42 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %35, i64 0, i32 0, i64 1
  %43 = load i16, i16* %42, align 2
  %44 = icmp eq i16 %43, 0
  br i1 %44, label %.loopexit.loopexit, label %45

; <label>:45:                                     ; preds = %41
  %46 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %35, i64 0, i32 0, i64 8
  %47 = load i16, i16* %46, align 4
  %48 = icmp eq i16 %47, 0
  br i1 %48, label %.loopexit.loopexit, label %49

; <label>:49:                                     ; preds = %45
  %50 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %35, i64 0, i32 0, i64 16
  %51 = load i16, i16* %50, align 4
  %52 = icmp eq i16 %51, 0
  br i1 %52, label %.loopexit.loopexit, label %53

; <label>:53:                                     ; preds = %49
  %54 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %35, i64 0, i32 0, i64 9
  %55 = load i16, i16* %54, align 2
  %56 = icmp eq i16 %55, 0
  br i1 %56, label %.loopexit.loopexit, label %57

; <label>:57:                                     ; preds = %53
  %58 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %35, i64 0, i32 0, i64 2
  %59 = load i16, i16* %58, align 4
  %60 = icmp eq i16 %59, 0
  br i1 %60, label %.loopexit.loopexit, label %61

; <label>:61:                                     ; preds = %57
  %62 = load [64 x i32]*, [64 x i32]** %sunkaddr39, align 8
  %63 = getelementptr inbounds [64 x i32], [64 x i32]* %62, i64 %indvars.iv, i64 0
  %64 = load i32, i32* %63, align 4
  %65 = icmp slt i32 %64, 0
  br i1 %65, label %.loopexit.loopexit, label %.preheader

.preheader:                                       ; preds = %61
  %66 = getelementptr inbounds [64 x i32], [64 x i32]* %62, i64 %indvars.iv, i64 1
  %67 = load i32, i32* %66, align 4
  %68 = getelementptr inbounds i32, i32* %.0119, i64 1
  store i32 %67, i32* %68, align 4
  %69 = load i32, i32* %66, align 4
  %70 = getelementptr inbounds [64 x i32], [64 x i32]* %62, i64 %indvars.iv, i64 2
  %71 = load i32, i32* %70, align 4
  %72 = getelementptr inbounds i32, i32* %.0119, i64 2
  store i32 %71, i32* %72, align 4
  %73 = load i32, i32* %70, align 4
  %74 = or i32 %73, %69
  %75 = getelementptr inbounds [64 x i32], [64 x i32]* %62, i64 %indvars.iv, i64 3
  %76 = load i32, i32* %75, align 4
  %77 = getelementptr inbounds i32, i32* %.0119, i64 3
  store i32 %76, i32* %77, align 4
  %78 = load i32, i32* %75, align 4
  %79 = or i32 %78, %74
  %80 = getelementptr inbounds [64 x i32], [64 x i32]* %62, i64 %indvars.iv, i64 4
  %81 = load i32, i32* %80, align 4
  %82 = getelementptr inbounds i32, i32* %.0119, i64 4
  store i32 %81, i32* %82, align 4
  %83 = load i32, i32* %80, align 4
  %84 = or i32 %83, %79
  %85 = getelementptr inbounds [64 x i32], [64 x i32]* %62, i64 %indvars.iv, i64 5
  %86 = load i32, i32* %85, align 4
  %87 = getelementptr inbounds i32, i32* %.0119, i64 5
  store i32 %86, i32* %87, align 4
  %88 = load i32, i32* %85, align 4
  %89 = or i32 %88, %84
  %90 = icmp eq i32 %89, 0
  %.1..4 = select i1 %90, i32 %.0317, i32 1
  %91 = getelementptr inbounds i32, i32* %.0119, i64 6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %92 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0218, i64 1
  %93 = load i32, i32* %sunkaddr42, align 8
  %94 = sext i32 %93 to i64
  %95 = icmp slt i64 %indvars.iv.next, %94
  br i1 %95, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.preheader, %61, %37, %41, %45, %49, %53, %57, %.lr.ph
  %.0.ph = phi i32 [ 0, %.lr.ph ], [ 0, %57 ], [ 0, %53 ], [ 0, %49 ], [ 0, %45 ], [ 0, %41 ], [ 0, %37 ], [ 0, %61 ], [ %.1..4, %.preheader ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %27, %8, %1
  %.0 = phi i32 [ 0, %1 ], [ 0, %8 ], [ 0, %27 ], [ %.0.ph, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @decompress_smooth_data(%struct.jpeg_decompress_struct*, i8*** nocapture readonly) #0 {
  %3 = alloca [64 x i16], align 16
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %5 = bitcast %struct.jpeg_d_coef_controller** %4 to %struct.my_coef_controller**
  %6 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 60
  %8 = load i32, i32* %7, align 8
  %9 = add i32 %8, -1
  %sunkaddr136 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr137 = add i64 %sunkaddr136, 164
  %sunkaddr138 = inttoptr i64 %sunkaddr137 to i32*
  %sunkaddr139 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr140 = add i64 %sunkaddr139, 172
  %sunkaddr141 = inttoptr i64 %sunkaddr140 to i32*
  %sunkaddr142 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr143 = add i64 %sunkaddr142, 560
  %sunkaddr144 = inttoptr i64 %sunkaddr143 to %struct.jpeg_input_controller**
  %sunkaddr145 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr146 = add i64 %sunkaddr145, 508
  %sunkaddr147 = inttoptr i64 %sunkaddr146 to i32*
  %sunkaddr148 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr149 = add i64 %sunkaddr148, 168
  %sunkaddr150 = inttoptr i64 %sunkaddr149 to i32*
  %sunkaddr151 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr152 = add i64 %sunkaddr151, 176
  %sunkaddr153 = inttoptr i64 %sunkaddr152 to i32*
  %sunkaddr154 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr155 = add i64 %sunkaddr154, 560
  %sunkaddr156 = inttoptr i64 %sunkaddr155 to i32 (%struct.jpeg_decompress_struct*)***
  br label %10

; <label>:10:                                     ; preds = %29, %2
  %11 = load i32, i32* %sunkaddr138, align 4
  %12 = load i32, i32* %sunkaddr141, align 4
  %13 = icmp sgt i32 %11, %12
  br i1 %13, label %.critedge, label %14

; <label>:14:                                     ; preds = %10
  %15 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %sunkaddr144, align 8
  %16 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %15, i64 0, i32 5
  %17 = load i32, i32* %16, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %.critedge

; <label>:19:                                     ; preds = %14
  %20 = icmp eq i32 %11, %12
  br i1 %20, label %21, label %29

; <label>:21:                                     ; preds = %19
  %22 = load i32, i32* %sunkaddr147, align 4
  %23 = icmp eq i32 %22, 0
  %24 = zext i1 %23 to i32
  %25 = load i32, i32* %sunkaddr150, align 8
  %26 = load i32, i32* %sunkaddr153, align 8
  %27 = add i32 %26, %24
  %28 = icmp ugt i32 %25, %27
  br i1 %28, label %.critedge, label %29

; <label>:29:                                     ; preds = %21, %19
  %30 = load i32 (%struct.jpeg_decompress_struct*)**, i32 (%struct.jpeg_decompress_struct*)*** %sunkaddr156, align 8
  %31 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %30, align 8
  %32 = tail call i32 %31(%struct.jpeg_decompress_struct* nonnull %0) #4
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %.loopexit106.loopexit, label %10

.critedge:                                        ; preds = %10, %21, %14
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %35 = load i32, i32* %34, align 8
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %.lr.ph123, label %._crit_edge

.lr.ph123:                                        ; preds = %.critedge
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %38 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %37, align 8
  %sunkaddr100 = ptrtoint [64 x i16]* %3 to i64
  %sunkaddr101 = or i64 %sunkaddr100, 4
  %sunkaddr68 = ptrtoint [64 x i16]* %3 to i64
  %sunkaddr69 = or i64 %sunkaddr68, 2
  %sunkaddr227 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr228 = add i64 %sunkaddr227, 48
  %sunkaddr229 = inttoptr i64 %sunkaddr228 to i32*
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr157 = add i64 %sunkaddr, 176
  %sunkaddr158 = inttoptr i64 %sunkaddr157 to i32*
  %sunkaddr159 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr160 = add i64 %sunkaddr159, 176
  %sunkaddr161 = inttoptr i64 %sunkaddr160 to i32*
  %39 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr165 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr166 = add i64 %sunkaddr165, 8
  %sunkaddr167 = inttoptr i64 %sunkaddr166 to %struct.jpeg_memory_mgr**
  %sunkaddr168 = ptrtoint %struct.my_coef_controller* %6 to i64
  %sunkaddr169 = add i64 %sunkaddr168, 216
  %sunkaddr170 = inttoptr i64 %sunkaddr169 to i32**
  %sunkaddr171 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr172 = add i64 %sunkaddr171, 584
  %sunkaddr173 = inttoptr i64 %sunkaddr172 to %struct.jpeg_inverse_dct**
  %sunkaddr181 = ptrtoint [64 x i16]* %3 to i64
  %sunkaddr182 = or i64 %sunkaddr181, 2
  %sunkaddr183 = inttoptr i64 %sunkaddr182 to i16*
  %40 = inttoptr i64 %sunkaddr69 to i16*
  %sunkaddr188 = ptrtoint [64 x i16]* %3 to i64
  %sunkaddr189 = add i64 %sunkaddr188, 16
  %sunkaddr190 = inttoptr i64 %sunkaddr189 to i16*
  %sunkaddr191 = ptrtoint [64 x i16]* %3 to i64
  %sunkaddr192 = add i64 %sunkaddr191, 16
  %sunkaddr193 = inttoptr i64 %sunkaddr192 to i16*
  %sunkaddr198 = ptrtoint [64 x i16]* %3 to i64
  %sunkaddr199 = add i64 %sunkaddr198, 32
  %sunkaddr200 = inttoptr i64 %sunkaddr199 to i16*
  %sunkaddr201 = ptrtoint [64 x i16]* %3 to i64
  %sunkaddr202 = add i64 %sunkaddr201, 32
  %sunkaddr203 = inttoptr i64 %sunkaddr202 to i16*
  %sunkaddr208 = ptrtoint [64 x i16]* %3 to i64
  %sunkaddr209 = add i64 %sunkaddr208, 18
  %sunkaddr210 = inttoptr i64 %sunkaddr209 to i16*
  %sunkaddr211 = ptrtoint [64 x i16]* %3 to i64
  %sunkaddr212 = add i64 %sunkaddr211, 18
  %sunkaddr213 = inttoptr i64 %sunkaddr212 to i16*
  %sunkaddr218 = ptrtoint [64 x i16]* %3 to i64
  %sunkaddr219 = or i64 %sunkaddr218, 4
  %sunkaddr220 = inttoptr i64 %sunkaddr219 to i16*
  %41 = inttoptr i64 %sunkaddr101 to i16*
  %42 = getelementptr inbounds [64 x i16], [64 x i16]* %3, i64 0, i64 0
  %sunkaddr162 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr163 = add i64 %sunkaddr162, 8
  %sunkaddr164 = inttoptr i64 %sunkaddr163 to %struct.jpeg_memory_mgr**
  br label %43

; <label>:43:                                     ; preds = %.lr.ph123, %.loopexit
  %indvars.iv134 = phi i64 [ 0, %.lr.ph123 ], [ %indvars.iv.next135, %.loopexit ]
  %.022120 = phi %struct.jpeg_component_info* [ %38, %.lr.ph123 ], [ %339, %.loopexit ]
  %44 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.022120, i64 0, i32 12
  %45 = load i32, i32* %44, align 8
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %.loopexit, label %47

; <label>:47:                                     ; preds = %43
  %48 = load i32, i32* %sunkaddr158, align 8
  %49 = icmp ult i32 %48, %9
  br i1 %49, label %50, label %54

; <label>:50:                                     ; preds = %47
  %51 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.022120, i64 0, i32 3
  %52 = load i32, i32* %51, align 4
  %53 = shl nsw i32 %52, 1
  br label %61

; <label>:54:                                     ; preds = %47
  %55 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.022120, i64 0, i32 8
  %56 = load i32, i32* %55, align 8
  %57 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.022120, i64 0, i32 3
  %58 = load i32, i32* %57, align 4
  %59 = urem i32 %56, %58
  %60 = icmp eq i32 %59, 0
  %.55 = select i1 %60, i32 %58, i32 %59
  %.56 = select i1 %60, i32 %58, i32 %59
  br label %61

; <label>:61:                                     ; preds = %54, %50
  %.026 = phi i32 [ 0, %50 ], [ 1, %54 ]
  %.013 = phi i32 [ %53, %50 ], [ %.55, %54 ]
  %.112 = phi i32 [ %52, %50 ], [ %.56, %54 ]
  %62 = load i32, i32* %sunkaddr161, align 8
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %79, label %64

; <label>:64:                                     ; preds = %61
  %65 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.022120, i64 0, i32 3
  %66 = load i32, i32* %65, align 4
  %67 = add nsw i32 %66, %.013
  %68 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr164, align 8
  %69 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %68, i64 0, i32 8
  %70 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %69, align 8
  %71 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %6, i64 0, i32 5, i64 %indvars.iv134
  %72 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %71, align 8
  %73 = add i32 %62, -1
  %74 = mul i32 %66, %73
  %75 = call [64 x i16]** %70(%struct.jpeg_common_struct* nonnull %39, %struct.jvirt_barray_control* %72, i32 %74, i32 %67, i32 0) #4
  %76 = load i32, i32* %65, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [64 x i16]*, [64 x i16]** %75, i64 %77
  br label %86

; <label>:79:                                     ; preds = %61
  %80 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr167, align 8
  %81 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %80, i64 0, i32 8
  %82 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %81, align 8
  %83 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %6, i64 0, i32 5, i64 %indvars.iv134
  %84 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %83, align 8
  %85 = call [64 x i16]** %82(%struct.jpeg_common_struct* nonnull %39, %struct.jvirt_barray_control* %84, i32 0, i32 %.013, i32 0) #4
  br label %86

; <label>:86:                                     ; preds = %79, %64
  %.025 = phi i32 [ 0, %64 ], [ 1, %79 ]
  %.014 = phi [64 x i16]** [ %78, %64 ], [ %85, %79 ]
  %87 = load i32*, i32** %sunkaddr170, align 8
  %88 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.022120, i64 0, i32 19
  %89 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %88, align 8
  %90 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %89, i64 0, i32 0, i64 0
  %91 = load i16, i16* %90, align 4
  %92 = zext i16 %91 to i64
  %93 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %89, i64 0, i32 0, i64 1
  %94 = load i16, i16* %93, align 2
  %95 = zext i16 %94 to i64
  %96 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %89, i64 0, i32 0, i64 8
  %97 = load i16, i16* %96, align 4
  %98 = zext i16 %97 to i64
  %99 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %89, i64 0, i32 0, i64 16
  %100 = load i16, i16* %99, align 4
  %101 = zext i16 %100 to i64
  %102 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %89, i64 0, i32 0, i64 9
  %103 = load i16, i16* %102, align 2
  %104 = zext i16 %103 to i64
  %105 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %89, i64 0, i32 0, i64 2
  %106 = load i16, i16* %105, align 4
  %107 = zext i16 %106 to i64
  %108 = load %struct.jpeg_inverse_dct*, %struct.jpeg_inverse_dct** %sunkaddr173, align 8
  %109 = getelementptr inbounds %struct.jpeg_inverse_dct, %struct.jpeg_inverse_dct* %108, i64 0, i32 1, i64 %indvars.iv134
  %110 = load void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %109, align 8
  %111 = icmp sgt i32 %.112, 0
  br i1 %111, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %86
  %112 = getelementptr inbounds i8**, i8*** %1, i64 %indvars.iv134
  %113 = load i8**, i8*** %112, align 8
  %114 = add nsw i32 %.112, -1
  %sunkaddr64 = mul i64 %indvars.iv134, 24
  %sunkaddr72 = mul i64 %indvars.iv134, 24
  %sunkaddr80 = mul i64 %indvars.iv134, 24
  %sunkaddr88 = mul i64 %indvars.iv134, 24
  %sunkaddr96 = mul i64 %indvars.iv134, 24
  %115 = mul nuw nsw i64 %92, 9
  %116 = shl nuw nsw i64 %107, 7
  %117 = shl nuw nsw i64 %107, 8
  %118 = shl nuw nsw i64 %107, 8
  %119 = mul nuw nsw i64 %92, 5
  %120 = shl nuw nsw i64 %104, 7
  %121 = shl nuw nsw i64 %104, 8
  %122 = shl nuw nsw i64 %104, 8
  %123 = mul nuw nsw i64 %92, 9
  %124 = shl nuw nsw i64 %101, 7
  %125 = shl nuw nsw i64 %101, 8
  %126 = shl nuw nsw i64 %101, 8
  %127 = mul nuw nsw i64 %92, 36
  %128 = shl nuw nsw i64 %98, 7
  %129 = shl nuw nsw i64 %98, 8
  %130 = shl nuw nsw i64 %98, 8
  %131 = mul nuw nsw i64 %92, 36
  %132 = shl nuw nsw i64 %95, 7
  %133 = shl nuw nsw i64 %95, 8
  %134 = shl nuw nsw i64 %95, 8
  %135 = zext i32 %114 to i64
  %wide.trip.count = zext i32 %.112 to i64
  %sunkaddr224 = ptrtoint %struct.jpeg_component_info* %.022120 to i64
  %sunkaddr225 = add i64 %sunkaddr224, 36
  %sunkaddr226 = inttoptr i64 %sunkaddr225 to i32*
  %136 = icmp ne i32 %.025, 0
  %137 = icmp ne i32 %.026, 0
  %sunkaddr174 = ptrtoint %struct.jpeg_component_info* %.022120 to i64
  %sunkaddr175 = add i64 %sunkaddr174, 28
  %sunkaddr176 = inttoptr i64 %sunkaddr175 to i32*
  %sunkaddr177 = ptrtoint i32* %87 to i64
  %sunkaddr178 = add i64 %sunkaddr64, %sunkaddr177
  %sunkaddr179 = add i64 %sunkaddr178, 4
  %sunkaddr180 = inttoptr i64 %sunkaddr179 to i32*
  %sunkaddr184 = ptrtoint i32* %87 to i64
  %sunkaddr185 = add i64 %sunkaddr72, %sunkaddr184
  %sunkaddr186 = add i64 %sunkaddr185, 8
  %sunkaddr187 = inttoptr i64 %sunkaddr186 to i32*
  %sunkaddr194 = ptrtoint i32* %87 to i64
  %sunkaddr195 = add i64 %sunkaddr80, %sunkaddr194
  %sunkaddr196 = add i64 %sunkaddr195, 12
  %sunkaddr197 = inttoptr i64 %sunkaddr196 to i32*
  %sunkaddr204 = ptrtoint i32* %87 to i64
  %sunkaddr205 = add i64 %sunkaddr88, %sunkaddr204
  %sunkaddr206 = add i64 %sunkaddr205, 16
  %sunkaddr207 = inttoptr i64 %sunkaddr206 to i32*
  %sunkaddr214 = ptrtoint i32* %87 to i64
  %sunkaddr215 = add i64 %sunkaddr96, %sunkaddr214
  %sunkaddr216 = add i64 %sunkaddr215, 20
  %sunkaddr217 = inttoptr i64 %sunkaddr216 to i32*
  %sunkaddr221 = ptrtoint %struct.jpeg_component_info* %.022120 to i64
  %sunkaddr222 = add i64 %sunkaddr221, 36
  %sunkaddr223 = inttoptr i64 %sunkaddr222 to i32*
  br label %138

; <label>:138:                                    ; preds = %335, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %335 ]
  %.020118 = phi i8** [ %113, %.lr.ph ], [ %338, %335 ]
  %139 = getelementptr inbounds [64 x i16]*, [64 x i16]** %.014, i64 %indvars.iv
  %140 = load [64 x i16]*, [64 x i16]** %139, align 8
  %141 = icmp eq i64 %indvars.iv, 0
  %or.cond = and i1 %136, %141
  br i1 %or.cond, label %146, label %142

; <label>:142:                                    ; preds = %138
  %143 = add nsw i64 %indvars.iv, -1
  %144 = getelementptr inbounds [64 x i16]*, [64 x i16]** %.014, i64 %143
  %145 = load [64 x i16]*, [64 x i16]** %144, align 8
  br label %146

; <label>:146:                                    ; preds = %138, %142
  %.016 = phi [64 x i16]* [ %145, %142 ], [ %140, %138 ]
  %147 = icmp eq i64 %indvars.iv, %135
  %or.cond34 = and i1 %137, %147
  br i1 %or.cond34, label %152, label %148

; <label>:148:                                    ; preds = %146
  %149 = add nuw nsw i64 %indvars.iv, 1
  %150 = getelementptr inbounds [64 x i16]*, [64 x i16]** %.014, i64 %149
  %151 = load [64 x i16]*, [64 x i16]** %150, align 8
  br label %152

; <label>:152:                                    ; preds = %146, %148
  %.018 = phi [64 x i16]* [ %151, %148 ], [ %140, %146 ]
  %153 = getelementptr inbounds [64 x i16], [64 x i16]* %.016, i64 0, i64 0
  %154 = load i16, i16* %153, align 2
  %155 = sext i16 %154 to i32
  %156 = getelementptr inbounds [64 x i16], [64 x i16]* %140, i64 0, i64 0
  %157 = load i16, i16* %156, align 2
  %158 = sext i16 %157 to i32
  %159 = getelementptr inbounds [64 x i16], [64 x i16]* %.018, i64 0, i64 0
  %160 = load i16, i16* %159, align 2
  %161 = sext i16 %160 to i32
  %162 = load i32, i32* %sunkaddr176, align 4
  %163 = add i32 %162, -1
  br label %164

; <label>:164:                                    ; preds = %152, %327
  %.06117 = phi i32 [ %161, %152 ], [ %.15, %327 ]
  %.07116 = phi i32 [ 0, %152 ], [ %333, %327 ]
  %.08115 = phi i32 [ %161, %152 ], [ %.06117, %327 ]
  %.015114 = phi [64 x i16]* [ %140, %152 ], [ %332, %327 ]
  %.117113 = phi [64 x i16]* [ %.016, %152 ], [ %331, %327 ]
  %.119112 = phi [64 x i16]* [ %.018, %152 ], [ %330, %327 ]
  %.021111 = phi i32 [ 0, %152 ], [ %329, %327 ]
  %.027110 = phi i32 [ %158, %152 ], [ %.124, %327 ]
  %.028109 = phi i32 [ %158, %152 ], [ %.027110, %327 ]
  %.031108 = phi i32 [ %155, %152 ], [ %.130, %327 ]
  %.032107 = phi i32 [ %155, %152 ], [ %.031108, %327 ]
  call void @jcopy_block_row([64 x i16]* %.015114, [64 x i16]* nonnull %3, i32 1) #4
  %165 = icmp ult i32 %.07116, %163
  br i1 %165, label %166, label %176

; <label>:166:                                    ; preds = %164
  %167 = getelementptr inbounds [64 x i16], [64 x i16]* %.117113, i64 1, i64 0
  %168 = load i16, i16* %167, align 2
  %169 = sext i16 %168 to i32
  %170 = getelementptr inbounds [64 x i16], [64 x i16]* %.015114, i64 1, i64 0
  %171 = load i16, i16* %170, align 2
  %172 = sext i16 %171 to i32
  %173 = getelementptr inbounds [64 x i16], [64 x i16]* %.119112, i64 1, i64 0
  %174 = load i16, i16* %173, align 2
  %175 = sext i16 %174 to i32
  br label %176

; <label>:176:                                    ; preds = %166, %164
  %.130 = phi i32 [ %169, %166 ], [ %.031108, %164 ]
  %.124 = phi i32 [ %172, %166 ], [ %.027110, %164 ]
  %.15 = phi i32 [ %175, %166 ], [ %.06117, %164 ]
  %177 = load i32, i32* %sunkaddr180, align 4
  %178 = icmp ne i32 %177, 0
  %179 = load i16, i16* %sunkaddr183, align 2
  %180 = icmp eq i16 %179, 0
  %or.cond125 = and i1 %178, %180
  br i1 %or.cond125, label %181, label %205

; <label>:181:                                    ; preds = %176
  %182 = sub nsw i32 %.028109, %.124
  %183 = sext i32 %182 to i64
  %184 = mul nsw i64 %131, %183
  %185 = icmp sgt i64 %184, -1
  br i1 %185, label %186, label %194

; <label>:186:                                    ; preds = %181
  %187 = add nsw i64 %184, %132
  %188 = sdiv i64 %187, %133
  %189 = trunc i64 %188 to i32
  %190 = icmp slt i32 %177, 1
  %191 = shl i32 1, %177
  %192 = icmp slt i32 %189, %191
  %or.cond36 = or i1 %190, %192
  %193 = add nsw i32 %191, -1
  %.01 = select i1 %or.cond36, i32 %189, i32 %193
  br label %203

; <label>:194:                                    ; preds = %181
  %195 = sub nsw i64 %132, %184
  %196 = sdiv i64 %195, %134
  %197 = trunc i64 %196 to i32
  %198 = icmp slt i32 %177, 1
  %199 = shl i32 1, %177
  %200 = icmp slt i32 %197, %199
  %or.cond38 = or i1 %198, %200
  %201 = add nsw i32 %199, -1
  %.1 = select i1 %or.cond38, i32 %197, i32 %201
  %202 = sub nsw i32 0, %.1
  br label %203

; <label>:203:                                    ; preds = %186, %194
  %.2 = phi i32 [ %202, %194 ], [ %.01, %186 ]
  %204 = trunc i32 %.2 to i16
  store i16 %204, i16* %40, align 2
  br label %205

; <label>:205:                                    ; preds = %176, %203
  %206 = load i32, i32* %sunkaddr187, align 4
  %207 = icmp ne i32 %206, 0
  %208 = load i16, i16* %sunkaddr190, align 16
  %209 = icmp eq i16 %208, 0
  %or.cond127 = and i1 %207, %209
  br i1 %or.cond127, label %210, label %234

; <label>:210:                                    ; preds = %205
  %211 = sub nsw i32 %.031108, %.06117
  %212 = sext i32 %211 to i64
  %213 = mul nsw i64 %127, %212
  %214 = icmp sgt i64 %213, -1
  br i1 %214, label %215, label %223

; <label>:215:                                    ; preds = %210
  %216 = add nsw i64 %213, %128
  %217 = sdiv i64 %216, %129
  %218 = trunc i64 %217 to i32
  %219 = icmp slt i32 %206, 1
  %220 = shl i32 1, %206
  %221 = icmp slt i32 %218, %220
  %or.cond40 = or i1 %219, %221
  %222 = add nsw i32 %220, -1
  %.3 = select i1 %or.cond40, i32 %218, i32 %222
  br label %232

; <label>:223:                                    ; preds = %210
  %224 = sub nsw i64 %128, %213
  %225 = sdiv i64 %224, %130
  %226 = trunc i64 %225 to i32
  %227 = icmp slt i32 %206, 1
  %228 = shl i32 1, %206
  %229 = icmp slt i32 %226, %228
  %or.cond42 = or i1 %227, %229
  %230 = add nsw i32 %228, -1
  %.4 = select i1 %or.cond42, i32 %226, i32 %230
  %231 = sub nsw i32 0, %.4
  br label %232

; <label>:232:                                    ; preds = %215, %223
  %.5 = phi i32 [ %231, %223 ], [ %.3, %215 ]
  %233 = trunc i32 %.5 to i16
  store i16 %233, i16* %sunkaddr193, align 16
  br label %234

; <label>:234:                                    ; preds = %205, %232
  %235 = load i32, i32* %sunkaddr197, align 4
  %236 = icmp ne i32 %235, 0
  %237 = load i16, i16* %sunkaddr200, align 16
  %238 = icmp eq i16 %237, 0
  %or.cond129 = and i1 %236, %238
  br i1 %or.cond129, label %239, label %265

; <label>:239:                                    ; preds = %234
  %240 = shl nsw i32 %.027110, 1
  %241 = sub i32 %.031108, %240
  %242 = add i32 %241, %.06117
  %243 = sext i32 %242 to i64
  %244 = mul nsw i64 %123, %243
  %245 = icmp sgt i64 %244, -1
  br i1 %245, label %246, label %254

; <label>:246:                                    ; preds = %239
  %247 = add nsw i64 %244, %124
  %248 = sdiv i64 %247, %125
  %249 = trunc i64 %248 to i32
  %250 = icmp slt i32 %235, 1
  %251 = shl i32 1, %235
  %252 = icmp slt i32 %249, %251
  %or.cond44 = or i1 %250, %252
  %253 = add nsw i32 %251, -1
  %.6 = select i1 %or.cond44, i32 %249, i32 %253
  br label %263

; <label>:254:                                    ; preds = %239
  %255 = sub nsw i64 %124, %244
  %256 = sdiv i64 %255, %126
  %257 = trunc i64 %256 to i32
  %258 = icmp slt i32 %235, 1
  %259 = shl i32 1, %235
  %260 = icmp slt i32 %257, %259
  %or.cond46 = or i1 %258, %260
  %261 = add nsw i32 %259, -1
  %.7 = select i1 %or.cond46, i32 %257, i32 %261
  %262 = sub nsw i32 0, %.7
  br label %263

; <label>:263:                                    ; preds = %246, %254
  %.8 = phi i32 [ %262, %254 ], [ %.6, %246 ]
  %264 = trunc i32 %.8 to i16
  store i16 %264, i16* %sunkaddr203, align 16
  br label %265

; <label>:265:                                    ; preds = %234, %263
  %266 = load i32, i32* %sunkaddr207, align 4
  %267 = icmp ne i32 %266, 0
  %268 = load i16, i16* %sunkaddr210, align 2
  %269 = icmp eq i16 %268, 0
  %or.cond131 = and i1 %267, %269
  br i1 %or.cond131, label %270, label %296

; <label>:270:                                    ; preds = %265
  %271 = sub i32 %.032107, %.08115
  %272 = sub i32 %271, %.130
  %273 = add i32 %272, %.15
  %274 = sext i32 %273 to i64
  %275 = mul nsw i64 %119, %274
  %276 = icmp sgt i64 %275, -1
  br i1 %276, label %277, label %285

; <label>:277:                                    ; preds = %270
  %278 = add nsw i64 %275, %120
  %279 = sdiv i64 %278, %121
  %280 = trunc i64 %279 to i32
  %281 = icmp slt i32 %266, 1
  %282 = shl i32 1, %266
  %283 = icmp slt i32 %280, %282
  %or.cond48 = or i1 %281, %283
  %284 = add nsw i32 %282, -1
  %.9 = select i1 %or.cond48, i32 %280, i32 %284
  br label %294

; <label>:285:                                    ; preds = %270
  %286 = sub nsw i64 %120, %275
  %287 = sdiv i64 %286, %122
  %288 = trunc i64 %287 to i32
  %289 = icmp slt i32 %266, 1
  %290 = shl i32 1, %266
  %291 = icmp slt i32 %288, %290
  %or.cond50 = or i1 %289, %291
  %292 = add nsw i32 %290, -1
  %.10 = select i1 %or.cond50, i32 %288, i32 %292
  %293 = sub nsw i32 0, %.10
  br label %294

; <label>:294:                                    ; preds = %277, %285
  %.11 = phi i32 [ %293, %285 ], [ %.9, %277 ]
  %295 = trunc i32 %.11 to i16
  store i16 %295, i16* %sunkaddr213, align 2
  br label %296

; <label>:296:                                    ; preds = %265, %294
  %297 = load i32, i32* %sunkaddr217, align 4
  %298 = icmp ne i32 %297, 0
  %299 = load i16, i16* %sunkaddr220, align 4
  %300 = icmp eq i16 %299, 0
  %or.cond133 = and i1 %298, %300
  br i1 %or.cond133, label %301, label %327

; <label>:301:                                    ; preds = %296
  %302 = shl nsw i32 %.027110, 1
  %303 = sub i32 %.028109, %302
  %304 = add i32 %303, %.124
  %305 = sext i32 %304 to i64
  %306 = mul nsw i64 %115, %305
  %307 = icmp sgt i64 %306, -1
  br i1 %307, label %308, label %316

; <label>:308:                                    ; preds = %301
  %309 = add nsw i64 %306, %116
  %310 = sdiv i64 %309, %117
  %311 = trunc i64 %310 to i32
  %312 = icmp slt i32 %297, 1
  %313 = shl i32 1, %297
  %314 = icmp slt i32 %311, %313
  %or.cond52 = or i1 %312, %314
  %315 = add nsw i32 %313, -1
  %.12 = select i1 %or.cond52, i32 %311, i32 %315
  br label %325

; <label>:316:                                    ; preds = %301
  %317 = sub nsw i64 %116, %306
  %318 = sdiv i64 %317, %118
  %319 = trunc i64 %318 to i32
  %320 = icmp slt i32 %297, 1
  %321 = shl i32 1, %297
  %322 = icmp slt i32 %319, %321
  %or.cond54 = or i1 %320, %322
  %323 = add nsw i32 %321, -1
  %.13 = select i1 %or.cond54, i32 %319, i32 %323
  %324 = sub nsw i32 0, %.13
  br label %325

; <label>:325:                                    ; preds = %308, %316
  %.14 = phi i32 [ %324, %316 ], [ %.12, %308 ]
  %326 = trunc i32 %.14 to i16
  store i16 %326, i16* %41, align 4
  br label %327

; <label>:327:                                    ; preds = %296, %325
  call void %110(%struct.jpeg_decompress_struct* %0, %struct.jpeg_component_info* %.022120, i16* nonnull %42, i8** %.020118, i32 %.021111) #4
  %328 = load i32, i32* %sunkaddr223, align 4
  %329 = add i32 %328, %.021111
  %330 = getelementptr inbounds [64 x i16], [64 x i16]* %.119112, i64 1
  %331 = getelementptr inbounds [64 x i16], [64 x i16]* %.117113, i64 1
  %332 = getelementptr inbounds [64 x i16], [64 x i16]* %.015114, i64 1
  %333 = add i32 %.07116, 1
  %334 = icmp ugt i32 %333, %163
  br i1 %334, label %335, label %164

; <label>:335:                                    ; preds = %327
  %336 = load i32, i32* %sunkaddr226, align 4
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds i8*, i8** %.020118, i64 %337
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.loopexit.loopexit, label %138

.loopexit.loopexit:                               ; preds = %335
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %86, %43
  %indvars.iv.next135 = add nuw i64 %indvars.iv134, 1
  %339 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.022120, i64 1
  %340 = load i32, i32* %sunkaddr229, align 8
  %341 = sext i32 %340 to i64
  %342 = icmp slt i64 %indvars.iv.next135, %341
  br i1 %342, label %43, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.critedge
  %343 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 37
  %344 = load i32, i32* %343, align 8
  %345 = add i32 %344, 1
  store i32 %345, i32* %343, align 8
  %sunkaddr103 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr104 = add i64 %sunkaddr103, 400
  %sunkaddr105 = inttoptr i64 %sunkaddr104 to i32*
  %346 = load i32, i32* %sunkaddr105, align 8
  %347 = icmp ult i32 %345, %346
  %. = select i1 %347, i32 3, i32 4
  br label %.loopexit106

.loopexit106.loopexit:                            ; preds = %29
  br label %.loopexit106

.loopexit106:                                     ; preds = %.loopexit106.loopexit, %._crit_edge
  %.0 = phi i32 [ %., %._crit_edge ], [ 0, %.loopexit106.loopexit ]
  ret i32 %.0
}

declare void @jcopy_block_row([64 x i16]*, [64 x i16]*, i32) local_unnamed_addr #2

declare void @jzero_far(i8*, i64) local_unnamed_addr #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}

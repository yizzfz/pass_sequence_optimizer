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
define void @jinit_d_coef_controller(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %4 = bitcast %struct.jpeg_memory_mgr** %3 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %4, align 8
  %6 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %5, align 8
  %7 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %8 = tail call i8* %6(%struct.jpeg_common_struct* %7, i32 1, i64 224) #4
  %.cast = ptrtoint i8* %8 to i64
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %10 = bitcast %struct.jpeg_d_coef_controller** %9 to i64*
  store i64 %.cast, i64* %10, align 8
  %11 = bitcast i8* %8 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_input_pass, void (%struct.jpeg_decompress_struct*)** %11, align 8
  %12 = getelementptr inbounds i8, i8* %8, i64 16
  %13 = bitcast i8* %12 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_output_pass, void (%struct.jpeg_decompress_struct*)** %13, align 8
  %14 = getelementptr inbounds i8, i8* %8, i64 216
  %15 = bitcast i8* %14 to i32**
  store i32* null, i32** %15, align 8
  %16 = icmp eq i32 %1, 0
  br i1 %16, label %65, label %17

; <label>:17:                                     ; preds = %2
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %19 = load i32, i32* %18, align 8
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %17
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %22 = bitcast %struct.jpeg_component_info** %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = bitcast i8* %8 to %struct.my_coef_controller*
  %25 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 44
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr29 = add i64 %sunkaddr, 8
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to %struct.jpeg_memory_mgr**
  br label %27

; <label>:27:                                     ; preds = %.lr.ph, %27
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %27 ]
  %.sroa.0.035 = phi i64 [ %23, %.lr.ph ], [ %55, %27 ]
  %28 = inttoptr i64 %.sroa.0.035 to %struct.jpeg_component_info*
  %29 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %28, i64 0, i32 3
  %30 = load i32, i32* %29, align 4
  %31 = load i32, i32* %26, align 8
  %32 = icmp eq i32 %31, 0
  %33 = mul nsw i32 %30, 3
  %. = select i1 %32, i32 %30, i32 %33
  %34 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr30, align 8
  %35 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %34, i64 0, i32 5
  %36 = load %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %35, align 8
  %37 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %28, i64 0, i32 7
  %38 = load i32, i32* %37, align 4
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %28, i64 0, i32 2
  %41 = load i32, i32* %40, align 8
  %42 = sext i32 %41 to i64
  %43 = tail call i64 @jround_up(i64 %39, i64 %42) #4
  %44 = trunc i64 %43 to i32
  %45 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %28, i64 0, i32 8
  %46 = load i32, i32* %45, align 8
  %47 = zext i32 %46 to i64
  %48 = load i32, i32* %29, align 4
  %49 = sext i32 %48 to i64
  %50 = tail call i64 @jround_up(i64 %47, i64 %49) #4
  %51 = trunc i64 %50 to i32
  %52 = tail call %struct.jvirt_barray_control* %36(%struct.jpeg_common_struct* nonnull %25, i32 1, i32 1, i32 %44, i32 %51, i32 %.) #4
  %53 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %24, i64 0, i32 5, i64 %indvars.iv
  store %struct.jvirt_barray_control* %52, %struct.jvirt_barray_control** %53, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %54 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %28, i64 1
  %55 = ptrtoint %struct.jpeg_component_info* %54 to i64
  %56 = load i32, i32* %18, align 8
  %57 = sext i32 %56 to i64
  %58 = icmp slt i64 %indvars.iv.next, %57
  br i1 %58, label %27, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %27
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %17
  %59 = getelementptr inbounds i8, i8* %8, i64 8
  %60 = bitcast i8* %59 to i32 (%struct.jpeg_decompress_struct*)**
  store i32 (%struct.jpeg_decompress_struct*)* @consume_data, i32 (%struct.jpeg_decompress_struct*)** %60, align 8
  %61 = getelementptr inbounds i8, i8* %8, i64 24
  %62 = bitcast i8* %61 to i32 (%struct.jpeg_decompress_struct*, i8***)**
  store i32 (%struct.jpeg_decompress_struct*, i8***)* @decompress_data, i32 (%struct.jpeg_decompress_struct*, i8***)** %62, align 8
  %63 = getelementptr inbounds i8, i8* %8, i64 136
  %64 = bitcast i8* %63 to %struct.jvirt_barray_control**
  br label %104

; <label>:65:                                     ; preds = %2
  %66 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr31 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr32 = add i64 %sunkaddr31, 8
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to %struct.jpeg_memory_mgr**
  %67 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr33, align 8
  %68 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %67, i64 0, i32 1
  %69 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %68, align 8
  %70 = tail call i8* %69(%struct.jpeg_common_struct* %66, i32 1, i64 1280) #4
  %71 = getelementptr inbounds i8, i8* %8, i64 56
  %72 = bitcast i8* %71 to i8**
  store i8* %70, i8** %72, align 8
  %73 = getelementptr inbounds i8, i8* %70, i64 128
  %74 = getelementptr inbounds i8, i8* %8, i64 64
  %75 = bitcast i8* %74 to i8**
  store i8* %73, i8** %75, align 8
  %76 = getelementptr inbounds i8, i8* %70, i64 256
  %77 = getelementptr inbounds i8, i8* %8, i64 72
  %78 = bitcast i8* %77 to i8**
  store i8* %76, i8** %78, align 8
  %79 = getelementptr inbounds i8, i8* %70, i64 384
  %80 = getelementptr inbounds i8, i8* %8, i64 80
  %81 = bitcast i8* %80 to i8**
  store i8* %79, i8** %81, align 8
  %82 = getelementptr inbounds i8, i8* %70, i64 512
  %83 = getelementptr inbounds i8, i8* %8, i64 88
  %84 = bitcast i8* %83 to i8**
  store i8* %82, i8** %84, align 8
  %85 = getelementptr inbounds i8, i8* %70, i64 640
  %86 = getelementptr inbounds i8, i8* %8, i64 96
  %87 = bitcast i8* %86 to i8**
  store i8* %85, i8** %87, align 8
  %88 = getelementptr inbounds i8, i8* %70, i64 768
  %89 = getelementptr inbounds i8, i8* %8, i64 104
  %90 = bitcast i8* %89 to i8**
  store i8* %88, i8** %90, align 8
  %91 = getelementptr inbounds i8, i8* %70, i64 896
  %92 = getelementptr inbounds i8, i8* %8, i64 112
  %93 = bitcast i8* %92 to i8**
  store i8* %91, i8** %93, align 8
  %94 = getelementptr inbounds i8, i8* %70, i64 1024
  %95 = getelementptr inbounds i8, i8* %8, i64 120
  %96 = bitcast i8* %95 to i8**
  store i8* %94, i8** %96, align 8
  %97 = getelementptr inbounds i8, i8* %70, i64 1152
  %98 = getelementptr inbounds i8, i8* %8, i64 128
  %99 = bitcast i8* %98 to i8**
  store i8* %97, i8** %99, align 8
  %100 = getelementptr inbounds i8, i8* %8, i64 8
  %101 = bitcast i8* %100 to i32 (%struct.jpeg_decompress_struct*)**
  store i32 (%struct.jpeg_decompress_struct*)* @dummy_consume_data, i32 (%struct.jpeg_decompress_struct*)** %101, align 8
  %102 = getelementptr inbounds i8, i8* %8, i64 24
  %103 = bitcast i8* %102 to i32 (%struct.jpeg_decompress_struct*, i8***)**
  store i32 (%struct.jpeg_decompress_struct*, i8***)* @decompress_onepass, i32 (%struct.jpeg_decompress_struct*, i8***)** %103, align 8
  br label %104

; <label>:104:                                    ; preds = %65, %._crit_edge
  %.sink = phi %struct.jvirt_barray_control** [ null, %65 ], [ %64, %._crit_edge ]
  %105 = getelementptr inbounds i8, i8* %8, i64 32
  %106 = bitcast i8* %105 to %struct.jvirt_barray_control***
  store %struct.jvirt_barray_control** %.sink, %struct.jvirt_barray_control*** %106, align 8
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @start_input_pass(%struct.jpeg_decompress_struct*) #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 35
  store i32 0, i32* %2, align 8
  tail call void @start_iMCU_row(%struct.jpeg_decompress_struct* %0)
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
  br i1 %7, label %18, label %8

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 18
  %10 = load i32, i32* %9, align 8
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %15, label %12

; <label>:12:                                     ; preds = %8
  %13 = tail call i32 @smoothing_ok(%struct.jpeg_decompress_struct* nonnull %0)
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12, %8
  br label %16

; <label>:16:                                     ; preds = %12, %15
  %decompress_data.sink = phi i32 (%struct.jpeg_decompress_struct*, i8***)* [ @decompress_data, %15 ], [ @decompress_smooth_data, %12 ]
  %17 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %4, i64 0, i32 0, i32 3
  store i32 (%struct.jpeg_decompress_struct*, i8***)* %decompress_data.sink, i32 (%struct.jpeg_decompress_struct*, i8***)** %17, align 8
  br label %18

; <label>:18:                                     ; preds = %1, %16
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 37
  store i32 0, i32* %19, align 8
  ret void
}

declare i64 @jround_up(i64, i64) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @consume_data(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca [4 x [64 x i16]**], align 16
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %4 = bitcast %struct.jpeg_d_coef_controller** %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 62
  %7 = load i32, i32* %6, align 8
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %.lr.ph80, label %._crit_edge81

.lr.ph80:                                         ; preds = %1
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %.cast6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %10 = inttoptr i64 %5 to %struct.my_coef_controller*
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 35
  br label %12

; <label>:12:                                     ; preds = %.lr.ph80, %12
  %indvars.iv90 = phi i64 [ 0, %.lr.ph80 ], [ %indvars.iv.next91, %12 ]
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv90
  %14 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %13, align 8
  %15 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %9, align 8
  %16 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %15, i64 0, i32 8
  %17 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %14, i64 0, i32 1
  %19 = load i32, i32* %18, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %10, i64 0, i32 5, i64 %20
  %22 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %21, align 8
  %23 = load i32, i32* %11, align 8
  %24 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %14, i64 0, i32 3
  %25 = load i32, i32* %24, align 4
  %26 = mul i32 %25, %23
  %27 = tail call [64 x i16]** %17(%struct.jpeg_common_struct* %.cast6, %struct.jvirt_barray_control* %22, i32 %26, i32 %25, i32 1) #4
  %28 = getelementptr inbounds [4 x [64 x i16]**], [4 x [64 x i16]**]* %2, i64 0, i64 %indvars.iv90
  store [64 x i16]** %27, [64 x i16]*** %28, align 8
  %indvars.iv.next91 = add nuw i64 %indvars.iv90, 1
  %29 = load i32, i32* %6, align 8
  %30 = sext i32 %29 to i64
  %31 = icmp slt i64 %indvars.iv.next91, %30
  br i1 %31, label %12, label %._crit_edge81.loopexit

._crit_edge81.loopexit:                           ; preds = %12
  br label %._crit_edge81

._crit_edge81:                                    ; preds = %._crit_edge81.loopexit, %1
  %32 = inttoptr i64 %5 to %struct.my_coef_controller*
  %33 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %32, i64 0, i32 2
  %34 = load i32, i32* %33, align 4
  %35 = inttoptr i64 %5 to %struct.my_coef_controller*
  %36 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %35, i64 0, i32 3
  %37 = load i32, i32* %36, align 8
  %38 = icmp slt i32 %34, %37
  br i1 %38, label %.lr.ph76, label %._crit_edge77

.lr.ph76:                                         ; preds = %._crit_edge81
  %39 = inttoptr i64 %5 to %struct.my_coef_controller*
  %40 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %39, i64 0, i32 1
  %41 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 64
  %sunkaddr54 = add i64 %5, 40
  %sunkaddr55 = inttoptr i64 %sunkaddr54 to i32*
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr45 = add i64 %sunkaddr, 416
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to i32*
  %42 = inttoptr i64 %5 to %struct.my_coef_controller*
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %44 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %42, i64 0, i32 4, i64 0
  %45 = inttoptr i64 %5 to %struct.my_coef_controller*
  %46 = sext i32 %34 to i64
  br label %47

; <label>:47:                                     ; preds = %.lr.ph76, %._crit_edge72
  %indvars.iv88 = phi i64 [ %46, %.lr.ph76 ], [ %indvars.iv.next89, %._crit_edge72 ]
  %48 = load i32, i32* %40, align 8
  %49 = load i32, i32* %41, align 8
  %50 = icmp ult i32 %48, %49
  br i1 %50, label %.preheader.preheader, label %._crit_edge72

.preheader.preheader:                             ; preds = %47
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %91
  %storemerge271 = phi i32 [ %92, %91 ], [ %48, %.preheader.preheader ]
  %51 = load i32, i32* %sunkaddr46, align 8
  %52 = icmp sgt i32 %51, 0
  br i1 %52, label %.lr.ph69.preheader, label %._crit_edge70

.lr.ph69.preheader:                               ; preds = %.preheader
  br label %.lr.ph69

.lr.ph69:                                         ; preds = %.lr.ph69.preheader, %._crit_edge65
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %._crit_edge65 ], [ 0, %.lr.ph69.preheader ]
  %.04467 = phi i32 [ %.1.lcssa, %._crit_edge65 ], [ 0, %.lr.ph69.preheader ]
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv86
  %54 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %53, align 8
  %55 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %54, i64 0, i32 14
  %56 = load i32, i32* %55, align 8
  %57 = icmp sgt i32 %56, 0
  br i1 %57, label %.lr.ph64, label %._crit_edge65

.lr.ph64:                                         ; preds = %.lr.ph69
  %58 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %54, i64 0, i32 13
  %59 = load i32, i32* %58, align 4
  %60 = mul i32 %59, %storemerge271
  %61 = getelementptr inbounds [4 x [64 x i16]**], [4 x [64 x i16]**]* %2, i64 0, i64 %indvars.iv86
  %62 = zext i32 %60 to i64
  %sunkaddr47 = ptrtoint %struct.jpeg_component_info* %54 to i64
  %sunkaddr48 = add i64 %sunkaddr47, 52
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to i32*
  br label %63

; <label>:63:                                     ; preds = %.lr.ph64, %._crit_edge
  %indvars.iv84 = phi i64 [ 0, %.lr.ph64 ], [ %indvars.iv.next85, %._crit_edge ]
  %.161 = phi i32 [ %.04467, %.lr.ph64 ], [ %.2.lcssa, %._crit_edge ]
  %64 = load i32, i32* %sunkaddr49, align 4
  %65 = icmp sgt i32 %64, 0
  br i1 %65, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %63
  %66 = load [64 x i16]**, [64 x i16]*** %61, align 8
  %67 = add nsw i64 %indvars.iv84, %indvars.iv88
  %68 = getelementptr inbounds [64 x i16]*, [64 x i16]** %66, i64 %67
  %69 = load [64 x i16]*, [64 x i16]** %68, align 8
  %70 = getelementptr inbounds [64 x i16], [64 x i16]* %69, i64 %62
  %71 = sext i32 %.161 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %71, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %storemerge560 = phi i32 [ 0, %.lr.ph.preheader ], [ %74, %.lr.ph ]
  %.059 = phi [64 x i16]* [ %70, %.lr.ph.preheader ], [ %72, %.lr.ph ]
  %72 = getelementptr inbounds [64 x i16], [64 x i16]* %.059, i64 1
  %indvars.iv.next = add i64 %indvars.iv, 1
  %73 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %45, i64 0, i32 4, i64 %indvars.iv
  store [64 x i16]* %.059, [64 x i16]** %73, align 8
  %74 = add nuw nsw i32 %storemerge560, 1
  %75 = load i32, i32* %sunkaddr49, align 4
  %76 = icmp slt i32 %74, %75
  br i1 %76, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %77 = trunc i64 %indvars.iv.next to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %63
  %.2.lcssa = phi i32 [ %.161, %63 ], [ %77, %._crit_edge.loopexit ]
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %78 = load i32, i32* %55, align 8
  %79 = sext i32 %78 to i64
  %80 = icmp slt i64 %indvars.iv.next85, %79
  br i1 %80, label %63, label %._crit_edge65.loopexit

._crit_edge65.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge65.loopexit, %.lr.ph69
  %.1.lcssa = phi i32 [ %.04467, %.lr.ph69 ], [ %.2.lcssa, %._crit_edge65.loopexit ]
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %81 = load i32, i32* %sunkaddr46, align 8
  %82 = sext i32 %81 to i64
  %83 = icmp slt i64 %indvars.iv.next87, %82
  br i1 %83, label %.lr.ph69, label %._crit_edge70.loopexit

._crit_edge70.loopexit:                           ; preds = %._crit_edge65
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %._crit_edge70.loopexit, %.preheader
  %84 = load %struct.jpeg_entropy_decoder*, %struct.jpeg_entropy_decoder** %43, align 8
  %85 = getelementptr inbounds %struct.jpeg_entropy_decoder, %struct.jpeg_entropy_decoder* %84, i64 0, i32 1
  %86 = load i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)** %85, align 8
  %87 = tail call i32 %86(%struct.jpeg_decompress_struct* nonnull %0, [64 x i16]** %44) #4
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %89, label %91

; <label>:89:                                     ; preds = %._crit_edge70
  %90 = trunc i64 %indvars.iv88 to i32
  %sunkaddr50 = add i64 %5, 44
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to i32*
  store i32 %90, i32* %sunkaddr51, align 4
  %sunkaddr52 = add i64 %5, 40
  %sunkaddr53 = inttoptr i64 %sunkaddr52 to i32*
  store i32 %storemerge271, i32* %sunkaddr53, align 8
  br label %110

; <label>:91:                                     ; preds = %._crit_edge70
  %92 = add i32 %storemerge271, 1
  %93 = load i32, i32* %41, align 8
  %94 = icmp ult i32 %92, %93
  br i1 %94, label %.preheader, label %._crit_edge72.loopexit

._crit_edge72.loopexit:                           ; preds = %91
  br label %._crit_edge72

._crit_edge72:                                    ; preds = %._crit_edge72.loopexit, %47
  store i32 0, i32* %sunkaddr55, align 8
  %indvars.iv.next89 = add i64 %indvars.iv88, 1
  %95 = load i32, i32* %36, align 8
  %96 = sext i32 %95 to i64
  %97 = icmp slt i64 %indvars.iv.next89, %96
  br i1 %97, label %47, label %._crit_edge77.loopexit

._crit_edge77.loopexit:                           ; preds = %._crit_edge72
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %._crit_edge77.loopexit, %._crit_edge81
  %98 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 35
  %99 = load i32, i32* %98, align 8
  %100 = add i32 %99, 1
  store i32 %100, i32* %98, align 8
  %101 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 60
  %102 = load i32, i32* %101, align 8
  %103 = icmp ult i32 %100, %102
  br i1 %103, label %104, label %105

; <label>:104:                                    ; preds = %._crit_edge77
  tail call void @start_iMCU_row(%struct.jpeg_decompress_struct* nonnull %0)
  br label %110

; <label>:105:                                    ; preds = %._crit_edge77
  %106 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %107 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %106, align 8
  %108 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %107, i64 0, i32 3
  %109 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %108, align 8
  tail call void %109(%struct.jpeg_decompress_struct* nonnull %0) #4
  br label %110

; <label>:110:                                    ; preds = %105, %104, %89
  %.043 = phi i32 [ 0, %89 ], [ 3, %104 ], [ 4, %105 ]
  ret i32 %.043
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @decompress_data(%struct.jpeg_decompress_struct*, i8***) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %4 = bitcast %struct.jpeg_d_coef_controller** %3 to %struct.my_coef_controller**
  %5 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 60
  %7 = load i32, i32* %6, align 8
  %8 = add i32 %7, -1
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 34
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 36
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 35
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 37
  %14 = bitcast %struct.jpeg_input_controller** %11 to i32 (%struct.jpeg_decompress_struct*)***
  br label %15

; <label>:15:                                     ; preds = %.critedge, %2
  %16 = load i32, i32* %9, align 4
  %17 = load i32, i32* %10, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %.critedge, label %19

; <label>:19:                                     ; preds = %15
  %20 = icmp eq i32 %16, %17
  br i1 %20, label %21, label %.critedge3

; <label>:21:                                     ; preds = %19
  %22 = load i32, i32* %12, align 8
  %23 = load i32, i32* %13, align 8
  %24 = icmp ugt i32 %22, %23
  br i1 %24, label %.critedge3, label %.critedge

.critedge:                                        ; preds = %21, %15
  %25 = load i32 (%struct.jpeg_decompress_struct*)**, i32 (%struct.jpeg_decompress_struct*)*** %14, align 8
  %26 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %25, align 8
  %27 = tail call i32 %26(%struct.jpeg_decompress_struct* nonnull %0) #4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %112, label %15

.critedge3:                                       ; preds = %21, %19
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %30 = load i32, i32* %29, align 8
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %.lr.ph62, label %._crit_edge63

.lr.ph62:                                         ; preds = %.critedge3
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %33 = bitcast %struct.jpeg_component_info** %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %.cast = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 37
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 80
  br label %38

; <label>:38:                                     ; preds = %.lr.ph62, %.loopexit
  %indvars.iv64 = phi i64 [ 0, %.lr.ph62 ], [ %indvars.iv.next65, %.loopexit ]
  %.sroa.04.061 = phi i64 [ %34, %.lr.ph62 ], [ %103, %.loopexit ]
  %39 = inttoptr i64 %.sroa.04.061 to %struct.jpeg_component_info*
  %40 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %39, i64 0, i32 12
  %41 = load i32, i32* %40, align 8
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %.loopexit, label %43

; <label>:43:                                     ; preds = %38
  %44 = inttoptr i64 %.sroa.04.061 to %struct.jpeg_component_info*
  %45 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %35, align 8
  %46 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %45, i64 0, i32 8
  %47 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %46, align 8
  %48 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %indvars.iv64
  %49 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %48, align 8
  %50 = load i32, i32* %36, align 8
  %51 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %44, i64 0, i32 3
  %52 = load i32, i32* %51, align 4
  %53 = mul i32 %52, %50
  %54 = tail call [64 x i16]** %47(%struct.jpeg_common_struct* %.cast, %struct.jvirt_barray_control* %49, i32 %53, i32 %52, i32 0) #4
  %55 = load i32, i32* %36, align 8
  %56 = icmp ult i32 %55, %8
  br i1 %56, label %57, label %59

; <label>:57:                                     ; preds = %43
  %sunkaddr = add i64 %.sroa.04.061, 12
  %sunkaddr47 = inttoptr i64 %sunkaddr to i32*
  %58 = load i32, i32* %sunkaddr47, align 4
  br label %66

; <label>:59:                                     ; preds = %43
  %60 = inttoptr i64 %.sroa.04.061 to %struct.jpeg_component_info*
  %61 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %60, i64 0, i32 8
  %62 = load i32, i32* %61, align 8
  %sunkaddr48 = add i64 %.sroa.04.061, 12
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to i32*
  %63 = load i32, i32* %sunkaddr49, align 4
  %64 = urem i32 %62, %63
  %65 = icmp eq i32 %64, 0
  %. = select i1 %65, i32 %63, i32 %64
  br label %66

; <label>:66:                                     ; preds = %59, %57
  %.045 = phi i32 [ %58, %57 ], [ %., %59 ]
  %67 = load %struct.jpeg_inverse_dct*, %struct.jpeg_inverse_dct** %37, align 8
  %68 = getelementptr inbounds %struct.jpeg_inverse_dct, %struct.jpeg_inverse_dct* %67, i64 0, i32 1, i64 %indvars.iv64
  %69 = load void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %68, align 8
  %70 = icmp sgt i32 %.045, 0
  br i1 %70, label %.lr.ph59, label %.loopexit

.lr.ph59:                                         ; preds = %66
  %71 = getelementptr inbounds i8**, i8*** %1, i64 %indvars.iv64
  %72 = bitcast i8*** %71 to i64*
  %73 = load i64, i64* %72, align 8
  %74 = inttoptr i64 %.sroa.04.061 to %struct.jpeg_component_info*
  %75 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %74, i64 0, i32 7
  %76 = inttoptr i64 %.sroa.04.061 to %struct.jpeg_component_info*
  %77 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %76, i64 0, i32 9
  %78 = inttoptr i64 %.sroa.04.061 to %struct.jpeg_component_info*
  %79 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %78, i64 0, i32 9
  %wide.trip.count = zext i32 %.045 to i64
  br label %80

; <label>:80:                                     ; preds = %._crit_edge, %.lr.ph59
  %indvars.iv = phi i64 [ 0, %.lr.ph59 ], [ %indvars.iv.next, %._crit_edge ]
  %.sroa.014.056 = phi i64 [ %73, %.lr.ph59 ], [ %100, %._crit_edge ]
  %81 = load i32, i32* %75, align 4
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %80
  %83 = getelementptr inbounds [64 x i16]*, [64 x i16]** %54, i64 %indvars.iv
  %84 = bitcast [64 x i16]** %83 to i64*
  %85 = load i64, i64* %84, align 8
  %86 = inttoptr i64 %.sroa.014.056 to i8**
  br label %87

; <label>:87:                                     ; preds = %.lr.ph, %87
  %storemerge155 = phi i32 [ 0, %.lr.ph ], [ %93, %87 ]
  %.04354 = phi i32 [ 0, %.lr.ph ], [ %92, %87 ]
  %.sroa.016.053 = phi i64 [ %85, %.lr.ph ], [ %90, %87 ]
  %88 = inttoptr i64 %.sroa.016.053 to i16*
  tail call void %69(%struct.jpeg_decompress_struct* %0, %struct.jpeg_component_info* nonnull %78, i16* %88, i8** %86, i32 %.04354) #4
  %89 = getelementptr inbounds i16, i16* %88, i64 64
  %90 = ptrtoint i16* %89 to i64
  %91 = load i32, i32* %79, align 4
  %92 = add i32 %91, %.04354
  %93 = add i32 %storemerge155, 1
  %94 = load i32, i32* %75, align 4
  %95 = icmp ult i32 %93, %94
  br i1 %95, label %87, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %87
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %80
  %96 = load i32, i32* %77, align 4
  %97 = inttoptr i64 %.sroa.014.056 to i8**
  %98 = sext i32 %96 to i64
  %99 = getelementptr inbounds i8*, i8** %97, i64 %98
  %100 = ptrtoint i8** %99 to i64
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.loopexit.loopexit, label %80

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %66, %38
  %101 = inttoptr i64 %.sroa.04.061 to %struct.jpeg_component_info*
  %indvars.iv.next65 = add nuw i64 %indvars.iv64, 1
  %102 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %101, i64 1
  %103 = ptrtoint %struct.jpeg_component_info* %102 to i64
  %104 = load i32, i32* %29, align 8
  %105 = sext i32 %104 to i64
  %106 = icmp slt i64 %indvars.iv.next65, %105
  br i1 %106, label %38, label %._crit_edge63.loopexit

._crit_edge63.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge63

._crit_edge63:                                    ; preds = %._crit_edge63.loopexit, %.critedge3
  %107 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 37
  %108 = load i32, i32* %107, align 8
  %109 = add i32 %108, 1
  store i32 %109, i32* %107, align 8
  %sunkaddr50 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr51 = add i64 %sunkaddr50, 400
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to i32*
  %110 = load i32, i32* %sunkaddr52, align 8
  %111 = icmp ult i32 %109, %110
  %.46 = select i1 %111, i32 3, i32 4
  ret i32 %.46

; <label>:112:                                    ; preds = %.critedge
  ret i32 0
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal i32 @dummy_consume_data(%struct.jpeg_decompress_struct* nocapture readnone) #3 {
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @decompress_onepass(%struct.jpeg_decompress_struct*, i8***) #0 {
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
  br i1 %16, label %.lr.ph108, label %._crit_edge109

.lr.ph108:                                        ; preds = %2
  %17 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 1
  %sunkaddr74 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr75 = add i64 %sunkaddr74, 40
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to i32*
  %18 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 4, i64 0
  %19 = bitcast [64 x i16]** %18 to i8**
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 66
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 62
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 80
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 35
  %25 = sext i32 %13 to i64
  br label %26

; <label>:26:                                     ; preds = %.lr.ph108, %._crit_edge104
  %indvars.iv116 = phi i64 [ %25, %.lr.ph108 ], [ %indvars.iv.next117, %._crit_edge104 ]
  %27 = load i32, i32* %17, align 8
  %28 = icmp ugt i32 %27, %8
  br i1 %28, label %._crit_edge104, label %.lr.ph103.preheader

.lr.ph103.preheader:                              ; preds = %26
  %29 = trunc i64 %indvars.iv116 to i32
  br label %.lr.ph103

.lr.ph103:                                        ; preds = %.lr.ph103.preheader, %._crit_edge
  %storemerge1100 = phi i32 [ %110, %._crit_edge ], [ %27, %.lr.ph103.preheader ]
  %30 = load i8*, i8** %19, align 8
  %31 = load i32, i32* %20, align 8
  %32 = sext i32 %31 to i64
  %33 = shl nsw i64 %32, 7
  tail call void @jzero_far(i8* %30, i64 %33) #4
  %34 = load %struct.jpeg_entropy_decoder*, %struct.jpeg_entropy_decoder** %21, align 8
  %35 = getelementptr inbounds %struct.jpeg_entropy_decoder, %struct.jpeg_entropy_decoder* %34, i64 0, i32 1
  %36 = load i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)** %35, align 8
  %37 = tail call i32 %36(%struct.jpeg_decompress_struct* %0, [64 x i16]** %18) #4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %42, label %.preheader86

.preheader86:                                     ; preds = %.lr.ph103
  %39 = load i32, i32* %22, align 8
  %40 = icmp sgt i32 %39, 0
  br i1 %40, label %.lr.ph99, label %._crit_edge

.lr.ph99:                                         ; preds = %.preheader86
  %41 = icmp ult i32 %storemerge1100, %8
  br label %44

; <label>:42:                                     ; preds = %.lr.ph103
  %43 = trunc i64 %indvars.iv116 to i32
  %sunkaddr = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr62 = add i64 %sunkaddr, 44
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to i32*
  store i32 %43, i32* %sunkaddr63, align 4
  %sunkaddr64 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr65 = add i64 %sunkaddr64, 40
  %sunkaddr66 = inttoptr i64 %sunkaddr65 to i32*
  store i32 %storemerge1100, i32* %sunkaddr66, align 8
  br label %129

; <label>:44:                                     ; preds = %.lr.ph99, %.loopexit85
  %indvars.iv114 = phi i64 [ 0, %.lr.ph99 ], [ %indvars.iv.next115, %.loopexit85 ]
  %.05997 = phi i32 [ 0, %.lr.ph99 ], [ %.2, %.loopexit85 ]
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv114
  %46 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %45, align 8
  %47 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %46, i64 0, i32 12
  %48 = load i32, i32* %47, align 8
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %54

; <label>:50:                                     ; preds = %44
  %51 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %46, i64 0, i32 15
  %52 = load i32, i32* %51, align 4
  %53 = add nsw i32 %52, %.05997
  br label %.loopexit85

; <label>:54:                                     ; preds = %44
  %55 = load %struct.jpeg_inverse_dct*, %struct.jpeg_inverse_dct** %23, align 8
  %56 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %46, i64 0, i32 1
  %57 = load i32, i32* %56, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds %struct.jpeg_inverse_dct, %struct.jpeg_inverse_dct* %55, i64 0, i32 1, i64 %58
  %60 = load void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %59, align 8
  %61 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %46, i64 0, i32 13
  %62 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %46, i64 0, i32 17
  %.in = select i1 %41, i32* %61, i32* %62
  %63 = load i32, i32* %.in, align 4
  %64 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %46, i64 0, i32 16
  %65 = load i32, i32* %64, align 8
  %66 = mul i32 %65, %storemerge1100
  %67 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %46, i64 0, i32 14
  %68 = load i32, i32* %67, align 8
  %69 = icmp sgt i32 %68, 0
  br i1 %69, label %.lr.ph96, label %.loopexit85

.lr.ph96:                                         ; preds = %54
  %sunkaddr81 = ptrtoint %struct.jpeg_component_info* %46 to i64
  %sunkaddr82 = add i64 %sunkaddr81, 52
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to i32*
  %sunkaddr71 = ptrtoint %struct.jpeg_component_info* %46 to i64
  %sunkaddr72 = add i64 %sunkaddr71, 36
  %sunkaddr73 = inttoptr i64 %sunkaddr72 to i32*
  %70 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %46, i64 0, i32 18
  %71 = icmp sgt i32 %63, 0
  %sunkaddr68 = ptrtoint %struct.jpeg_component_info* %46 to i64
  %sunkaddr69 = add i64 %sunkaddr68, 36
  %sunkaddr70 = inttoptr i64 %sunkaddr69 to i32*
  br i1 %71, label %.lr.ph96.split.us.preheader, label %.lr.ph96.split.preheader

.lr.ph96.split.preheader:                         ; preds = %.lr.ph96
  %72 = load i32, i32* %sunkaddr83, align 4
  %73 = load i32, i32* %67, align 8
  %74 = icmp sgt i32 %73, 1
  %smax = select i1 %74, i32 %73, i32 1
  %75 = mul i32 %72, %smax
  br label %.lr.ph96.split

.lr.ph96.split.us.preheader:                      ; preds = %.lr.ph96
  %76 = getelementptr inbounds i8**, i8*** %1, i64 %indvars.iv114
  %77 = load i8**, i8*** %76, align 8
  %78 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %46, i64 0, i32 9
  %79 = load i32, i32* %78, align 4
  %80 = sext i32 %79 to i64
  %81 = mul nsw i64 %80, %indvars.iv116
  %82 = getelementptr inbounds i8*, i8** %77, i64 %81
  %wide.trip.count = zext i32 %63 to i64
  br label %.lr.ph96.split.us

.lr.ph96.split.us:                                ; preds = %.lr.ph96.split.us.preheader, %..loopexit_crit_edge.us
  %storemerge395.us = phi i32 [ %95, %..loopexit_crit_edge.us ], [ 0, %.lr.ph96.split.us.preheader ]
  %.192.us = phi i32 [ %91, %..loopexit_crit_edge.us ], [ %.05997, %.lr.ph96.split.us.preheader ]
  %.06191.us = phi i8** [ %94, %..loopexit_crit_edge.us ], [ %82, %.lr.ph96.split.us.preheader ]
  %83 = load i32, i32* %24, align 8
  %84 = icmp ult i32 %83, %11
  br i1 %84, label %.lr.ph.us.preheader, label %85

; <label>:85:                                     ; preds = %.lr.ph96.split.us
  %86 = add nsw i32 %storemerge395.us, %29
  %87 = load i32, i32* %70, align 8
  %88 = icmp slt i32 %86, %87
  br i1 %88, label %.lr.ph.us.preheader, label %..loopexit_crit_edge.us

.lr.ph.us.preheader:                              ; preds = %.lr.ph96.split.us, %85
  %89 = sext i32 %.192.us to i64
  br label %.lr.ph.us

..loopexit_crit_edge.us.loopexit:                 ; preds = %.lr.ph.us
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit, %85
  %90 = load i32, i32* %sunkaddr83, align 4
  %91 = add nsw i32 %90, %.192.us
  %92 = load i32, i32* %sunkaddr73, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8*, i8** %.06191.us, i64 %93
  %95 = add nuw nsw i32 %storemerge395.us, 1
  %96 = load i32, i32* %67, align 8
  %97 = icmp slt i32 %95, %96
  br i1 %97, label %.lr.ph96.split.us, label %.loopexit85.loopexit

.lr.ph.us:                                        ; preds = %.lr.ph.us, %.lr.ph.us.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next, %.lr.ph.us ]
  %.06089.us = phi i32 [ %66, %.lr.ph.us.preheader ], [ %103, %.lr.ph.us ]
  %98 = add nsw i64 %indvars.iv, %89
  %99 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 4, i64 %98
  %100 = bitcast [64 x i16]** %99 to i16**
  %101 = load i16*, i16** %100, align 8
  tail call void %60(%struct.jpeg_decompress_struct* %0, %struct.jpeg_component_info* nonnull %46, i16* %101, i8** %.06191.us, i32 %.06089.us) #4
  %102 = load i32, i32* %sunkaddr70, align 4
  %103 = add i32 %102, %.06089.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %..loopexit_crit_edge.us.loopexit, label %.lr.ph.us

.lr.ph96.split:                                   ; preds = %.lr.ph96.split.preheader, %.lr.ph96.split
  %storemerge395 = phi i32 [ %104, %.lr.ph96.split ], [ 0, %.lr.ph96.split.preheader ]
  %104 = add nuw nsw i32 %storemerge395, 1
  %105 = icmp slt i32 %104, %73
  br i1 %105, label %.lr.ph96.split, label %.loopexit85.loopexit122

.loopexit85.loopexit122:                          ; preds = %.lr.ph96.split
  %106 = add i32 %.05997, %75
  br label %.loopexit85

.loopexit85.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %.loopexit85

.loopexit85:                                      ; preds = %.loopexit85.loopexit, %.loopexit85.loopexit122, %54, %50
  %.2 = phi i32 [ %53, %50 ], [ %.05997, %54 ], [ %106, %.loopexit85.loopexit122 ], [ %91, %.loopexit85.loopexit ]
  %indvars.iv.next115 = add nuw i64 %indvars.iv114, 1
  %107 = load i32, i32* %22, align 8
  %108 = sext i32 %107 to i64
  %109 = icmp slt i64 %indvars.iv.next115, %108
  br i1 %109, label %44, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit85
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader86
  %110 = add i32 %storemerge1100, 1
  %111 = icmp ugt i32 %110, %8
  br i1 %111, label %._crit_edge104.loopexit, label %.lr.ph103

._crit_edge104.loopexit:                          ; preds = %._crit_edge
  br label %._crit_edge104

._crit_edge104:                                   ; preds = %._crit_edge104.loopexit, %26
  store i32 0, i32* %sunkaddr76, align 8
  %indvars.iv.next117 = add i64 %indvars.iv116, 1
  %112 = load i32, i32* %14, align 8
  %113 = sext i32 %112 to i64
  %114 = icmp slt i64 %indvars.iv.next117, %113
  br i1 %114, label %26, label %._crit_edge109.loopexit

._crit_edge109.loopexit:                          ; preds = %._crit_edge104
  br label %._crit_edge109

._crit_edge109:                                   ; preds = %._crit_edge109.loopexit, %2
  %115 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 37
  %116 = load i32, i32* %115, align 8
  %117 = add i32 %116, 1
  store i32 %117, i32* %115, align 8
  %118 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 35
  %119 = load i32, i32* %118, align 8
  %120 = add i32 %119, 1
  store i32 %120, i32* %118, align 8
  %sunkaddr77 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr78 = add i64 %sunkaddr77, 400
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to i32*
  %121 = load i32, i32* %sunkaddr79, align 8
  %122 = icmp ult i32 %120, %121
  br i1 %122, label %123, label %124

; <label>:123:                                    ; preds = %._crit_edge109
  tail call void @start_iMCU_row(%struct.jpeg_decompress_struct* nonnull %0)
  br label %129

; <label>:124:                                    ; preds = %._crit_edge109
  %125 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %126 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %125, align 8
  %127 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %126, i64 0, i32 3
  %128 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %127, align 8
  tail call void %128(%struct.jpeg_decompress_struct* nonnull %0) #4
  br label %129

; <label>:129:                                    ; preds = %124, %123, %42
  %.0 = phi i32 [ 0, %42 ], [ 3, %123 ], [ 4, %124 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @start_iMCU_row(%struct.jpeg_decompress_struct*) #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %3 = bitcast %struct.jpeg_d_coef_controller** %2 to i64*
  %4 = load i64, i64* %3, align 8
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

; <label>:23:                                     ; preds = %1, %17, %20
  %.sink.sink = phi i32 [ %22, %20 ], [ %19, %17 ], [ 1, %1 ]
  %24 = inttoptr i64 %4 to %struct.my_coef_controller*
  %25 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %24, i64 0, i32 3
  store i32 %.sink.sink, i32* %25, align 8
  %26 = inttoptr i64 %4 to %struct.my_coef_controller*
  %27 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %26, i64 0, i32 1
  store i32 0, i32* %27, align 8
  %28 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %26, i64 0, i32 2
  store i32 0, i32* %28, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @smoothing_ok(%struct.jpeg_decompress_struct*) #0 {
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
  br i1 %15, label %16, label %26

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %18 = bitcast %struct.jpeg_memory_mgr** %17 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %19 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %18, align 8
  %20 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %19, align 8
  %.cast = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %22 = load i32, i32* %21, align 8
  %23 = sext i32 %22 to i64
  %24 = mul nsw i64 %23, 24
  %25 = tail call i8* %20(%struct.jpeg_common_struct* %.cast, i32 1, i64 %24) #4
  %sunkaddr = ptrtoint %struct.my_coef_controller* %4 to i64
  %sunkaddr29 = add i64 %sunkaddr, 216
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i8**
  store i8* %25, i8** %sunkaddr30, align 8
  br label %26

; <label>:26:                                     ; preds = %16, %12
  %sunkaddr34 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr35 = add i64 %sunkaddr34, 184
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to [64 x i32]**
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %28 = load i32, i32* %27, align 8
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %26
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %31 = bitcast %struct.jpeg_component_info** %30 to i64*
  %32 = load i64, i64* %31, align 8
  %sunkaddr31 = ptrtoint %struct.my_coef_controller* %4 to i64
  %sunkaddr32 = add i64 %sunkaddr31, 216
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to i64*
  %33 = load i64, i64* %sunkaddr33, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %67
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %67 ]
  %.sroa.0.042 = phi i64 [ %33, %.lr.ph.preheader ], [ %97, %67 ]
  %.02741 = phi i32 [ 0, %.lr.ph.preheader ], [ %.1..4, %67 ]
  %.sroa.09.040 = phi i64 [ %32, %.lr.ph.preheader ], [ %99, %67 ]
  %34 = inttoptr i64 %.sroa.09.040 to %struct.jpeg_component_info*
  %35 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %34, i64 0, i32 19
  %36 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %35, align 8
  %37 = icmp eq %struct.JQUANT_TBL* %36, null
  br i1 %37, label %.loopexit.loopexit, label %38

; <label>:38:                                     ; preds = %.lr.ph
  %39 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %36, i64 0, i32 0, i64 0
  %40 = load i16, i16* %39, align 4
  %41 = icmp eq i16 %40, 0
  br i1 %41, label %.loopexit.loopexit, label %42

; <label>:42:                                     ; preds = %38
  %43 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %36, i64 0, i32 0, i64 1
  %44 = load i16, i16* %43, align 2
  %45 = icmp eq i16 %44, 0
  br i1 %45, label %.loopexit.loopexit, label %46

; <label>:46:                                     ; preds = %42
  %47 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %36, i64 0, i32 0, i64 8
  %48 = load i16, i16* %47, align 4
  %49 = icmp eq i16 %48, 0
  br i1 %49, label %.loopexit.loopexit, label %50

; <label>:50:                                     ; preds = %46
  %51 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %36, i64 0, i32 0, i64 16
  %52 = load i16, i16* %51, align 4
  %53 = icmp eq i16 %52, 0
  br i1 %53, label %.loopexit.loopexit, label %54

; <label>:54:                                     ; preds = %50
  %55 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %36, i64 0, i32 0, i64 9
  %56 = load i16, i16* %55, align 2
  %57 = icmp eq i16 %56, 0
  br i1 %57, label %.loopexit.loopexit, label %58

; <label>:58:                                     ; preds = %54
  %59 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %36, i64 0, i32 0, i64 2
  %60 = load i16, i16* %59, align 4
  %61 = icmp eq i16 %60, 0
  br i1 %61, label %.loopexit.loopexit, label %62

; <label>:62:                                     ; preds = %58
  %63 = load [64 x i32]*, [64 x i32]** %sunkaddr36, align 8
  %64 = getelementptr inbounds [64 x i32], [64 x i32]* %63, i64 %indvars.iv, i64 0
  %65 = load i32, i32* %64, align 4
  %66 = icmp slt i32 %65, 0
  br i1 %66, label %.loopexit.loopexit, label %67

; <label>:67:                                     ; preds = %62
  %68 = inttoptr i64 %.sroa.0.042 to i32*
  %69 = getelementptr inbounds [64 x i32], [64 x i32]* %63, i64 %indvars.iv, i64 1
  %70 = load i32, i32* %69, align 4
  %71 = getelementptr inbounds i32, i32* %68, i64 1
  store i32 %70, i32* %71, align 4
  %72 = load i32, i32* %69, align 4
  %73 = getelementptr inbounds [64 x i32], [64 x i32]* %63, i64 %indvars.iv, i64 2
  %74 = load i32, i32* %73, align 4
  %75 = getelementptr inbounds i32, i32* %68, i64 2
  store i32 %74, i32* %75, align 4
  %76 = load i32, i32* %73, align 4
  %77 = or i32 %76, %72
  %78 = getelementptr inbounds [64 x i32], [64 x i32]* %63, i64 %indvars.iv, i64 3
  %79 = load i32, i32* %78, align 4
  %80 = getelementptr inbounds i32, i32* %68, i64 3
  store i32 %79, i32* %80, align 4
  %81 = load i32, i32* %78, align 4
  %82 = or i32 %81, %77
  %83 = getelementptr inbounds [64 x i32], [64 x i32]* %63, i64 %indvars.iv, i64 4
  %84 = load i32, i32* %83, align 4
  %85 = getelementptr inbounds i32, i32* %68, i64 4
  store i32 %84, i32* %85, align 4
  %86 = load i32, i32* %83, align 4
  %87 = or i32 %86, %82
  %88 = getelementptr inbounds [64 x i32], [64 x i32]* %63, i64 %indvars.iv, i64 5
  %89 = load i32, i32* %88, align 4
  %90 = getelementptr inbounds i32, i32* %68, i64 5
  store i32 %89, i32* %90, align 4
  %91 = load i32, i32* %88, align 4
  %92 = or i32 %91, %87
  %93 = icmp eq i32 %92, 0
  %.1..4 = select i1 %93, i32 %.02741, i32 1
  %94 = inttoptr i64 %.sroa.09.040 to %struct.jpeg_component_info*
  %95 = inttoptr i64 %.sroa.0.042 to i32*
  %96 = getelementptr inbounds i32, i32* %95, i64 6
  %97 = ptrtoint i32* %96 to i64
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %98 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %94, i64 1
  %99 = ptrtoint %struct.jpeg_component_info* %98 to i64
  %100 = load i32, i32* %27, align 8
  %101 = sext i32 %100 to i64
  %102 = icmp slt i64 %indvars.iv.next, %101
  br i1 %102, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %67, %62, %38, %42, %46, %50, %54, %58, %.lr.ph
  %.0.ph = phi i32 [ 0, %.lr.ph ], [ 0, %58 ], [ 0, %54 ], [ 0, %50 ], [ 0, %46 ], [ 0, %42 ], [ 0, %38 ], [ 0, %62 ], [ %.1..4, %67 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %26, %8, %1
  %.0 = phi i32 [ 0, %1 ], [ 0, %8 ], [ 0, %26 ], [ %.0.ph, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @decompress_smooth_data(%struct.jpeg_decompress_struct*, i8***) #0 {
  %.sroa.0130 = alloca i64, align 8
  %3 = alloca [64 x i16], align 16
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %5 = bitcast %struct.jpeg_d_coef_controller** %4 to i64*
  %6 = load i64, i64* %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 60
  %8 = load i32, i32* %7, align 8
  %9 = add i32 %8, -1
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 34
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 36
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 68
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 35
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 37
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr222 = add i64 %sunkaddr, 560
  %16 = inttoptr i64 %sunkaddr222 to i32 (%struct.jpeg_decompress_struct*)***
  br label %17

; <label>:17:                                     ; preds = %36, %2
  %18 = load i32, i32* %10, align 4
  %19 = load i32, i32* %11, align 4
  %20 = icmp sgt i32 %18, %19
  br i1 %20, label %.critedge, label %21

; <label>:21:                                     ; preds = %17
  %22 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %12, align 8
  %23 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %22, i64 0, i32 5
  %24 = load i32, i32* %23, align 4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %.critedge

; <label>:26:                                     ; preds = %21
  %27 = icmp eq i32 %18, %19
  br i1 %27, label %28, label %36

; <label>:28:                                     ; preds = %26
  %29 = load i32, i32* %13, align 4
  %30 = icmp eq i32 %29, 0
  %31 = zext i1 %30 to i32
  %32 = load i32, i32* %14, align 8
  %33 = load i32, i32* %15, align 8
  %34 = add i32 %33, %31
  %35 = icmp ugt i32 %32, %34
  br i1 %35, label %.critedge, label %36

; <label>:36:                                     ; preds = %28, %26
  %37 = load i32 (%struct.jpeg_decompress_struct*)**, i32 (%struct.jpeg_decompress_struct*)*** %16, align 8
  %38 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %37, align 8
  %39 = tail call i32 %38(%struct.jpeg_decompress_struct* nonnull %0) #4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %408, label %17

.critedge:                                        ; preds = %17, %28, %21
  %41 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %42 = load i32, i32* %41, align 8
  %43 = icmp sgt i32 %42, 0
  br i1 %43, label %.lr.ph285, label %._crit_edge

.lr.ph285:                                        ; preds = %.critedge
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %45 = bitcast %struct.jpeg_component_info** %44 to i64*
  %46 = load i64, i64* %45, align 8
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 37
  %sunkaddr224 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr225 = add i64 %sunkaddr224, 176
  %sunkaddr226 = inttoptr i64 %sunkaddr225 to i32*
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %.cast = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %49 = inttoptr i64 %6 to %struct.my_coef_controller*
  %50 = inttoptr i64 %6 to %struct.my_coef_controller*
  %51 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %50, i64 0, i32 6
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 80
  %53 = bitcast i64* %.sroa.0130 to [64 x i16]**
  %54 = bitcast i64* %.sroa.0130 to [64 x i16]**
  %55 = bitcast i64* %.sroa.0130 to [64 x i16]**
  %56 = getelementptr inbounds [64 x i16], [64 x i16]* %3, i64 0, i64 0
  %57 = bitcast i64* %.sroa.0130 to [64 x i16]**
  %58 = getelementptr inbounds [64 x i16], [64 x i16]* %3, i64 0, i64 2
  %sunkaddr264 = ptrtoint [64 x i16]* %3 to i64
  %sunkaddr265 = or i64 %sunkaddr264, 4
  %sunkaddr266 = inttoptr i64 %sunkaddr265 to i16*
  %59 = getelementptr inbounds [64 x i16], [64 x i16]* %3, i64 0, i64 9
  %sunkaddr256 = ptrtoint [64 x i16]* %3 to i64
  %sunkaddr257 = add i64 %sunkaddr256, 18
  %sunkaddr258 = inttoptr i64 %sunkaddr257 to i16*
  %60 = getelementptr inbounds [64 x i16], [64 x i16]* %3, i64 0, i64 16
  %sunkaddr248 = ptrtoint [64 x i16]* %3 to i64
  %sunkaddr249 = add i64 %sunkaddr248, 32
  %sunkaddr250 = inttoptr i64 %sunkaddr249 to i16*
  %61 = getelementptr inbounds [64 x i16], [64 x i16]* %3, i64 0, i64 8
  %sunkaddr240 = ptrtoint [64 x i16]* %3 to i64
  %sunkaddr241 = add i64 %sunkaddr240, 16
  %sunkaddr242 = inttoptr i64 %sunkaddr241 to i16*
  %62 = getelementptr inbounds [64 x i16], [64 x i16]* %3, i64 0, i64 1
  %sunkaddr232 = ptrtoint [64 x i16]* %3 to i64
  %sunkaddr233 = or i64 %sunkaddr232, 2
  %sunkaddr234 = inttoptr i64 %sunkaddr233 to i16*
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %.cast6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %64 = inttoptr i64 %6 to %struct.my_coef_controller*
  %65 = bitcast i64* %.sroa.0130 to i16**
  br label %66

; <label>:66:                                     ; preds = %.lr.ph285, %.loopexit
  %indvars.iv297 = phi i64 [ 0, %.lr.ph285 ], [ %indvars.iv.next298, %.loopexit ]
  %.sroa.0108.0282 = phi i64 [ %46, %.lr.ph285 ], [ %399, %.loopexit ]
  %67 = inttoptr i64 %.sroa.0108.0282 to %struct.jpeg_component_info*
  %68 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %67, i64 0, i32 12
  %69 = load i32, i32* %68, align 8
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %.loopexit, label %71

; <label>:71:                                     ; preds = %66
  %72 = load i32, i32* %47, align 8
  %73 = icmp ult i32 %72, %9
  %74 = inttoptr i64 %.sroa.0108.0282 to %struct.jpeg_component_info*
  br i1 %73, label %75, label %79

; <label>:75:                                     ; preds = %71
  %76 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %74, i64 0, i32 3
  %77 = load i32, i32* %76, align 4
  %78 = shl nsw i32 %77, 1
  br label %86

; <label>:79:                                     ; preds = %71
  %80 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %74, i64 0, i32 8
  %81 = load i32, i32* %80, align 8
  %82 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %74, i64 0, i32 3
  %83 = load i32, i32* %82, align 4
  %84 = urem i32 %81, %83
  %85 = icmp eq i32 %84, 0
  %. = select i1 %85, i32 %83, i32 %84
  %.203 = select i1 %85, i32 %83, i32 %84
  br label %86

; <label>:86:                                     ; preds = %79, %75
  %.1201 = phi i32 [ %77, %75 ], [ %., %79 ]
  %storemerge8 = phi i32 [ %78, %75 ], [ %.203, %79 ]
  %storemerge = phi i32 [ 0, %75 ], [ 1, %79 ]
  %87 = load i32, i32* %sunkaddr226, align 8
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %105, label %89

; <label>:89:                                     ; preds = %86
  %90 = inttoptr i64 %.sroa.0108.0282 to %struct.jpeg_component_info*
  %91 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %90, i64 0, i32 3
  %92 = load i32, i32* %91, align 4
  %93 = add nsw i32 %92, %storemerge8
  %94 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %63, align 8
  %95 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %94, i64 0, i32 8
  %96 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %95, align 8
  %97 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %64, i64 0, i32 5, i64 %indvars.iv297
  %98 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %97, align 8
  %99 = add i32 %87, -1
  %100 = mul i32 %92, %99
  %101 = call [64 x i16]** %96(%struct.jpeg_common_struct* nonnull %.cast6, %struct.jvirt_barray_control* %98, i32 %100, i32 %93, i32 0) #4
  %102 = load i32, i32* %91, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [64 x i16]*, [64 x i16]** %101, i64 %103
  br label %112

; <label>:105:                                    ; preds = %86
  %106 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %48, align 8
  %107 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %106, i64 0, i32 8
  %108 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %107, align 8
  %109 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %49, i64 0, i32 5, i64 %indvars.iv297
  %110 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %109, align 8
  %111 = call [64 x i16]** %108(%struct.jpeg_common_struct* nonnull %.cast, %struct.jvirt_barray_control* %110, i32 0, i32 %storemerge8, i32 0) #4
  br label %112

; <label>:112:                                    ; preds = %105, %89
  %storemerge7 = phi [64 x i16]** [ %104, %89 ], [ %111, %105 ]
  %storemerge1 = phi i32 [ 0, %89 ], [ 1, %105 ]
  %113 = inttoptr i64 %.sroa.0108.0282 to %struct.jpeg_component_info*
  %114 = load i32*, i32** %51, align 8
  %115 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %113, i64 0, i32 19
  %116 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %115, align 8
  %117 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %116, i64 0, i32 0, i64 0
  %118 = load i16, i16* %117, align 4
  %119 = zext i16 %118 to i64
  %120 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %116, i64 0, i32 0, i64 1
  %121 = load i16, i16* %120, align 2
  %122 = zext i16 %121 to i64
  %123 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %116, i64 0, i32 0, i64 8
  %124 = load i16, i16* %123, align 4
  %125 = zext i16 %124 to i64
  %126 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %116, i64 0, i32 0, i64 16
  %127 = load i16, i16* %126, align 4
  %128 = zext i16 %127 to i64
  %129 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %116, i64 0, i32 0, i64 9
  %130 = load i16, i16* %129, align 2
  %131 = zext i16 %130 to i64
  %132 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %116, i64 0, i32 0, i64 2
  %133 = load i16, i16* %132, align 4
  %134 = zext i16 %133 to i64
  %135 = load %struct.jpeg_inverse_dct*, %struct.jpeg_inverse_dct** %52, align 8
  %136 = getelementptr inbounds %struct.jpeg_inverse_dct, %struct.jpeg_inverse_dct* %135, i64 0, i32 1, i64 %indvars.iv297
  %137 = load void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %136, align 8
  %138 = icmp sgt i32 %.1201, 0
  br i1 %138, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %112
  %139 = getelementptr inbounds i8**, i8*** %1, i64 %indvars.iv297
  %140 = bitcast i8*** %139 to i64*
  %141 = load i64, i64* %140, align 8
  %142 = inttoptr i64 %.sroa.0108.0282 to %struct.jpeg_component_info*
  %143 = icmp ne i32 %storemerge1, 0
  %144 = icmp ne i32 %storemerge, 0
  %145 = add nsw i32 %.1201, -1
  %146 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %142, i64 0, i32 7
  %sunkaddr227 = ptrtoint i32* %114 to i64
  %sunkaddr228 = mul i64 %indvars.iv297, 24
  %sunkaddr229 = add i64 %sunkaddr227, %sunkaddr228
  %sunkaddr230 = add i64 %sunkaddr229, 4
  %sunkaddr231 = inttoptr i64 %sunkaddr230 to i32*
  %sunkaddr235 = ptrtoint i32* %114 to i64
  %sunkaddr236 = mul i64 %indvars.iv297, 24
  %sunkaddr237 = add i64 %sunkaddr235, %sunkaddr236
  %sunkaddr238 = add i64 %sunkaddr237, 8
  %sunkaddr239 = inttoptr i64 %sunkaddr238 to i32*
  %sunkaddr243 = ptrtoint i32* %114 to i64
  %sunkaddr244 = mul i64 %indvars.iv297, 24
  %sunkaddr245 = add i64 %sunkaddr243, %sunkaddr244
  %sunkaddr246 = add i64 %sunkaddr245, 12
  %sunkaddr247 = inttoptr i64 %sunkaddr246 to i32*
  %sunkaddr251 = ptrtoint i32* %114 to i64
  %sunkaddr252 = mul i64 %indvars.iv297, 24
  %sunkaddr253 = add i64 %sunkaddr251, %sunkaddr252
  %sunkaddr254 = add i64 %sunkaddr253, 16
  %sunkaddr255 = inttoptr i64 %sunkaddr254 to i32*
  %sunkaddr259 = ptrtoint i32* %114 to i64
  %sunkaddr260 = mul i64 %indvars.iv297, 24
  %sunkaddr261 = add i64 %sunkaddr259, %sunkaddr260
  %sunkaddr262 = add i64 %sunkaddr261, 20
  %sunkaddr263 = inttoptr i64 %sunkaddr262 to i32*
  %147 = inttoptr i64 %.sroa.0108.0282 to %struct.jpeg_component_info*
  %148 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %147, i64 0, i32 9
  %149 = mul nuw nsw i64 %119, 9
  %150 = shl nuw nsw i64 %134, 7
  %151 = shl nuw nsw i64 %134, 8
  %152 = shl nuw nsw i64 %134, 8
  %153 = mul nuw nsw i64 %119, 5
  %154 = shl nuw nsw i64 %131, 7
  %155 = shl nuw nsw i64 %131, 8
  %156 = shl nuw nsw i64 %131, 8
  %157 = mul nuw nsw i64 %119, 9
  %158 = shl nuw nsw i64 %128, 7
  %159 = shl nuw nsw i64 %128, 8
  %160 = shl nuw nsw i64 %128, 8
  %161 = mul nuw nsw i64 %119, 36
  %162 = shl nuw nsw i64 %125, 7
  %163 = shl nuw nsw i64 %125, 8
  %164 = shl nuw nsw i64 %125, 8
  %165 = mul nuw nsw i64 %119, 36
  %166 = shl nuw nsw i64 %122, 7
  %167 = shl nuw nsw i64 %122, 8
  %168 = shl nuw nsw i64 %122, 8
  %169 = inttoptr i64 %.sroa.0108.0282 to %struct.jpeg_component_info*
  %170 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %169, i64 0, i32 9
  %171 = zext i32 %145 to i64
  %wide.trip.count = zext i32 %.1201 to i64
  br label %172

; <label>:172:                                    ; preds = %391, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %391 ]
  %.sroa.0122.0280 = phi i64 [ %141, %.lr.ph ], [ %396, %391 ]
  %173 = getelementptr inbounds [64 x i16]*, [64 x i16]** %storemerge7, i64 %indvars.iv
  %174 = bitcast [64 x i16]** %173 to i64*
  %175 = load i64, i64* %174, align 8
  store i64 %175, i64* %.sroa.0130, align 8
  %176 = icmp eq i64 %indvars.iv, 0
  %or.cond = and i1 %143, %176
  %177 = add nsw i64 %indvars.iv, -1
  %178 = getelementptr inbounds [64 x i16]*, [64 x i16]** %storemerge7, i64 %177
  %.sroa.0130.0.sroa_cast135. = select i1 %or.cond, [64 x i16]** %53, [64 x i16]** %178
  %179 = bitcast [64 x i16]** %.sroa.0130.0.sroa_cast135. to i64*
  %180 = load i64, i64* %179, align 8
  %181 = icmp eq i64 %indvars.iv, %171
  %or.cond205 = and i1 %144, %181
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %182 = getelementptr inbounds [64 x i16]*, [64 x i16]** %storemerge7, i64 %indvars.iv.next
  %.sink15 = select i1 %or.cond205, [64 x i16]** %53, [64 x i16]** %182
  %183 = bitcast [64 x i16]** %.sink15 to i64*
  %184 = load i64, i64* %183, align 8
  %185 = inttoptr i64 %180 to [64 x i16]*
  %186 = getelementptr inbounds [64 x i16], [64 x i16]* %185, i64 0, i64 0
  %187 = load i16, i16* %186, align 2
  %188 = sext i16 %187 to i32
  %.sroa.0130.0..sroa.0130.0.217296 = load i16*, i16** %65, align 8
  %189 = load i16, i16* %.sroa.0130.0..sroa.0130.0.217296, align 2
  %190 = sext i16 %189 to i32
  %191 = inttoptr i64 %184 to [64 x i16]*
  %192 = getelementptr inbounds [64 x i16], [64 x i16]* %191, i64 0, i64 0
  %193 = load i16, i16* %192, align 2
  %194 = sext i16 %193 to i32
  %195 = load i32, i32* %146, align 4
  %196 = add i32 %195, -1
  %197 = inttoptr i64 %.sroa.0122.0280 to i8**
  br label %198

; <label>:198:                                    ; preds = %172, %378
  %storemerge5279 = phi i32 [ 0, %172 ], [ %389, %378 ]
  %.0188278 = phi i32 [ %194, %172 ], [ %.1187, %378 ]
  %.0189277 = phi i32 [ %194, %172 ], [ %.0188278, %378 ]
  %.0192276 = phi i32 [ %190, %172 ], [ %.1191, %378 ]
  %.0193275 = phi i32 [ %190, %172 ], [ %.0192276, %378 ]
  %.0196274 = phi i32 [ %188, %172 ], [ %.1195, %378 ]
  %.0197273 = phi i32 [ %188, %172 ], [ %.0196274, %378 ]
  %.sroa.0127.0272 = phi i64 [ %180, %172 ], [ %383, %378 ]
  %.sroa.0124.0271 = phi i64 [ %184, %172 ], [ %386, %378 ]
  %.0202270 = phi i32 [ 0, %172 ], [ %388, %378 ]
  %.sroa.0130.0..sroa.0130.0.131218 = load [64 x i16]*, [64 x i16]** %54, align 8
  call void @jcopy_block_row([64 x i16]* %.sroa.0130.0..sroa.0130.0.131218, [64 x i16]* nonnull %3, i32 1) #4
  %199 = icmp ult i32 %storemerge5279, %196
  br i1 %199, label %200, label %212

; <label>:200:                                    ; preds = %198
  %201 = inttoptr i64 %.sroa.0127.0272 to [64 x i16]*
  %202 = getelementptr inbounds [64 x i16], [64 x i16]* %201, i64 1, i64 0
  %203 = load i16, i16* %202, align 2
  %204 = sext i16 %203 to i32
  %.sroa.0130.0..sroa.0130.0.132220 = load [64 x i16]*, [64 x i16]** %55, align 8
  %205 = getelementptr inbounds [64 x i16], [64 x i16]* %.sroa.0130.0..sroa.0130.0.132220, i64 1, i64 0
  %206 = load i16, i16* %205, align 2
  %207 = sext i16 %206 to i32
  %208 = inttoptr i64 %.sroa.0124.0271 to [64 x i16]*
  %209 = getelementptr inbounds [64 x i16], [64 x i16]* %208, i64 1, i64 0
  %210 = load i16, i16* %209, align 2
  %211 = sext i16 %210 to i32
  br label %212

; <label>:212:                                    ; preds = %200, %198
  %.1195 = phi i32 [ %204, %200 ], [ %.0196274, %198 ]
  %.1191 = phi i32 [ %207, %200 ], [ %.0192276, %198 ]
  %.1187 = phi i32 [ %211, %200 ], [ %.0188278, %198 ]
  %213 = load i32, i32* %sunkaddr231, align 4
  %214 = icmp ne i32 %213, 0
  %215 = load i16, i16* %62, align 2
  %216 = icmp eq i16 %215, 0
  %or.cond287 = and i1 %214, %216
  br i1 %or.cond287, label %217, label %244

; <label>:217:                                    ; preds = %212
  %218 = sub nsw i32 %.0193275, %.1191
  %219 = sext i32 %218 to i64
  %220 = mul nsw i64 %165, %219
  %221 = icmp sgt i64 %220, -1
  br i1 %221, label %222, label %231

; <label>:222:                                    ; preds = %217
  %223 = add nsw i64 %220, %166
  %224 = sdiv i64 %223, %167
  %225 = trunc i64 %224 to i32
  %226 = icmp sgt i32 %213, 0
  br i1 %226, label %227, label %242

; <label>:227:                                    ; preds = %222
  %228 = shl i32 1, %213
  %229 = icmp slt i32 %225, %228
  %230 = add nsw i32 %228, -1
  %.206 = select i1 %229, i32 %225, i32 %230
  br label %242

; <label>:231:                                    ; preds = %217
  %232 = sub nsw i64 %166, %220
  %233 = sdiv i64 %232, %168
  %234 = trunc i64 %233 to i32
  %235 = icmp sgt i32 %213, 0
  br i1 %235, label %236, label %240

; <label>:236:                                    ; preds = %231
  %237 = shl i32 1, %213
  %238 = icmp slt i32 %234, %237
  %239 = add nsw i32 %237, -1
  %.207 = select i1 %238, i32 %234, i32 %239
  br label %240

; <label>:240:                                    ; preds = %236, %231
  %.0 = phi i32 [ %234, %231 ], [ %.207, %236 ]
  %241 = sub nsw i32 0, %.0
  br label %242

; <label>:242:                                    ; preds = %227, %222, %240
  %.1 = phi i32 [ %225, %222 ], [ %241, %240 ], [ %.206, %227 ]
  %243 = trunc i32 %.1 to i16
  store i16 %243, i16* %sunkaddr234, align 2
  br label %244

; <label>:244:                                    ; preds = %212, %242
  %245 = load i32, i32* %sunkaddr239, align 4
  %246 = icmp ne i32 %245, 0
  %247 = load i16, i16* %61, align 16
  %248 = icmp eq i16 %247, 0
  %or.cond289 = and i1 %246, %248
  br i1 %or.cond289, label %249, label %276

; <label>:249:                                    ; preds = %244
  %250 = sub nsw i32 %.0196274, %.0188278
  %251 = sext i32 %250 to i64
  %252 = mul nsw i64 %161, %251
  %253 = icmp sgt i64 %252, -1
  br i1 %253, label %254, label %263

; <label>:254:                                    ; preds = %249
  %255 = add nsw i64 %252, %162
  %256 = sdiv i64 %255, %163
  %257 = trunc i64 %256 to i32
  %258 = icmp sgt i32 %245, 0
  br i1 %258, label %259, label %274

; <label>:259:                                    ; preds = %254
  %260 = shl i32 1, %245
  %261 = icmp slt i32 %257, %260
  %262 = add nsw i32 %260, -1
  %.208 = select i1 %261, i32 %257, i32 %262
  br label %274

; <label>:263:                                    ; preds = %249
  %264 = sub nsw i64 %162, %252
  %265 = sdiv i64 %264, %164
  %266 = trunc i64 %265 to i32
  %267 = icmp sgt i32 %245, 0
  br i1 %267, label %268, label %272

; <label>:268:                                    ; preds = %263
  %269 = shl i32 1, %245
  %270 = icmp slt i32 %266, %269
  %271 = add nsw i32 %269, -1
  %.209 = select i1 %270, i32 %266, i32 %271
  br label %272

; <label>:272:                                    ; preds = %268, %263
  %.2 = phi i32 [ %266, %263 ], [ %.209, %268 ]
  %273 = sub nsw i32 0, %.2
  br label %274

; <label>:274:                                    ; preds = %259, %254, %272
  %.3 = phi i32 [ %257, %254 ], [ %273, %272 ], [ %.208, %259 ]
  %275 = trunc i32 %.3 to i16
  store i16 %275, i16* %sunkaddr242, align 16
  br label %276

; <label>:276:                                    ; preds = %244, %274
  %277 = load i32, i32* %sunkaddr247, align 4
  %278 = icmp ne i32 %277, 0
  %279 = load i16, i16* %60, align 16
  %280 = icmp eq i16 %279, 0
  %or.cond291 = and i1 %278, %280
  br i1 %or.cond291, label %281, label %310

; <label>:281:                                    ; preds = %276
  %282 = shl nsw i32 %.0192276, 1
  %283 = sub i32 %.0196274, %282
  %284 = add i32 %283, %.0188278
  %285 = sext i32 %284 to i64
  %286 = mul nsw i64 %157, %285
  %287 = icmp sgt i64 %286, -1
  br i1 %287, label %288, label %297

; <label>:288:                                    ; preds = %281
  %289 = add nsw i64 %286, %158
  %290 = sdiv i64 %289, %159
  %291 = trunc i64 %290 to i32
  %292 = icmp sgt i32 %277, 0
  br i1 %292, label %293, label %308

; <label>:293:                                    ; preds = %288
  %294 = shl i32 1, %277
  %295 = icmp slt i32 %291, %294
  %296 = add nsw i32 %294, -1
  %.210 = select i1 %295, i32 %291, i32 %296
  br label %308

; <label>:297:                                    ; preds = %281
  %298 = sub nsw i64 %158, %286
  %299 = sdiv i64 %298, %160
  %300 = trunc i64 %299 to i32
  %301 = icmp sgt i32 %277, 0
  br i1 %301, label %302, label %306

; <label>:302:                                    ; preds = %297
  %303 = shl i32 1, %277
  %304 = icmp slt i32 %300, %303
  %305 = add nsw i32 %303, -1
  %.211 = select i1 %304, i32 %300, i32 %305
  br label %306

; <label>:306:                                    ; preds = %302, %297
  %.4 = phi i32 [ %300, %297 ], [ %.211, %302 ]
  %307 = sub nsw i32 0, %.4
  br label %308

; <label>:308:                                    ; preds = %293, %288, %306
  %.5 = phi i32 [ %291, %288 ], [ %307, %306 ], [ %.210, %293 ]
  %309 = trunc i32 %.5 to i16
  store i16 %309, i16* %sunkaddr250, align 16
  br label %310

; <label>:310:                                    ; preds = %276, %308
  %311 = load i32, i32* %sunkaddr255, align 4
  %312 = icmp ne i32 %311, 0
  %313 = load i16, i16* %59, align 2
  %314 = icmp eq i16 %313, 0
  %or.cond293 = and i1 %312, %314
  br i1 %or.cond293, label %315, label %344

; <label>:315:                                    ; preds = %310
  %316 = sub i32 %.0197273, %.0189277
  %317 = sub i32 %316, %.1195
  %318 = add i32 %317, %.1187
  %319 = sext i32 %318 to i64
  %320 = mul nsw i64 %153, %319
  %321 = icmp sgt i64 %320, -1
  br i1 %321, label %322, label %331

; <label>:322:                                    ; preds = %315
  %323 = add nsw i64 %320, %154
  %324 = sdiv i64 %323, %155
  %325 = trunc i64 %324 to i32
  %326 = icmp sgt i32 %311, 0
  br i1 %326, label %327, label %342

; <label>:327:                                    ; preds = %322
  %328 = shl i32 1, %311
  %329 = icmp slt i32 %325, %328
  %330 = add nsw i32 %328, -1
  %.212 = select i1 %329, i32 %325, i32 %330
  br label %342

; <label>:331:                                    ; preds = %315
  %332 = sub nsw i64 %154, %320
  %333 = sdiv i64 %332, %156
  %334 = trunc i64 %333 to i32
  %335 = icmp sgt i32 %311, 0
  br i1 %335, label %336, label %340

; <label>:336:                                    ; preds = %331
  %337 = shl i32 1, %311
  %338 = icmp slt i32 %334, %337
  %339 = add nsw i32 %337, -1
  %.213 = select i1 %338, i32 %334, i32 %339
  br label %340

; <label>:340:                                    ; preds = %336, %331
  %.6 = phi i32 [ %334, %331 ], [ %.213, %336 ]
  %341 = sub nsw i32 0, %.6
  br label %342

; <label>:342:                                    ; preds = %327, %322, %340
  %.7 = phi i32 [ %325, %322 ], [ %341, %340 ], [ %.212, %327 ]
  %343 = trunc i32 %.7 to i16
  store i16 %343, i16* %sunkaddr258, align 2
  br label %344

; <label>:344:                                    ; preds = %310, %342
  %345 = load i32, i32* %sunkaddr263, align 4
  %346 = icmp ne i32 %345, 0
  %347 = load i16, i16* %58, align 4
  %348 = icmp eq i16 %347, 0
  %or.cond295 = and i1 %346, %348
  br i1 %or.cond295, label %349, label %378

; <label>:349:                                    ; preds = %344
  %350 = shl nsw i32 %.0192276, 1
  %351 = sub i32 %.0193275, %350
  %352 = add i32 %351, %.1191
  %353 = sext i32 %352 to i64
  %354 = mul nsw i64 %149, %353
  %355 = icmp sgt i64 %354, -1
  br i1 %355, label %356, label %365

; <label>:356:                                    ; preds = %349
  %357 = add nsw i64 %354, %150
  %358 = sdiv i64 %357, %151
  %359 = trunc i64 %358 to i32
  %360 = icmp sgt i32 %345, 0
  br i1 %360, label %361, label %376

; <label>:361:                                    ; preds = %356
  %362 = shl i32 1, %345
  %363 = icmp slt i32 %359, %362
  %364 = add nsw i32 %362, -1
  %.214 = select i1 %363, i32 %359, i32 %364
  br label %376

; <label>:365:                                    ; preds = %349
  %366 = sub nsw i64 %150, %354
  %367 = sdiv i64 %366, %152
  %368 = trunc i64 %367 to i32
  %369 = icmp sgt i32 %345, 0
  br i1 %369, label %370, label %374

; <label>:370:                                    ; preds = %365
  %371 = shl i32 1, %345
  %372 = icmp slt i32 %368, %371
  %373 = add nsw i32 %371, -1
  %.215 = select i1 %372, i32 %368, i32 %373
  br label %374

; <label>:374:                                    ; preds = %370, %365
  %.8 = phi i32 [ %368, %365 ], [ %.215, %370 ]
  %375 = sub nsw i32 0, %.8
  br label %376

; <label>:376:                                    ; preds = %361, %356, %374
  %.9 = phi i32 [ %359, %356 ], [ %375, %374 ], [ %.214, %361 ]
  %377 = trunc i32 %.9 to i16
  store i16 %377, i16* %sunkaddr266, align 4
  br label %378

; <label>:378:                                    ; preds = %344, %376
  call void %137(%struct.jpeg_decompress_struct* %0, %struct.jpeg_component_info* %147, i16* nonnull %56, i8** %197, i32 %.0202270) #4
  %.sroa.0130.0..sroa.0130.0.133219 = load [64 x i16]*, [64 x i16]** %57, align 8
  %379 = getelementptr inbounds [64 x i16], [64 x i16]* %.sroa.0130.0..sroa.0130.0.133219, i64 1
  %380 = ptrtoint [64 x i16]* %379 to i64
  store i64 %380, i64* %.sroa.0130, align 8
  %381 = inttoptr i64 %.sroa.0127.0272 to [64 x i16]*
  %382 = getelementptr inbounds [64 x i16], [64 x i16]* %381, i64 1
  %383 = ptrtoint [64 x i16]* %382 to i64
  %384 = inttoptr i64 %.sroa.0124.0271 to [64 x i16]*
  %385 = getelementptr inbounds [64 x i16], [64 x i16]* %384, i64 1
  %386 = ptrtoint [64 x i16]* %385 to i64
  %387 = load i32, i32* %148, align 4
  %388 = add i32 %387, %.0202270
  %389 = add i32 %storemerge5279, 1
  %390 = icmp ugt i32 %389, %196
  br i1 %390, label %391, label %198

; <label>:391:                                    ; preds = %378
  %392 = load i32, i32* %170, align 4
  %393 = inttoptr i64 %.sroa.0122.0280 to i8**
  %394 = sext i32 %392 to i64
  %395 = getelementptr inbounds i8*, i8** %393, i64 %394
  %396 = ptrtoint i8** %395 to i64
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.loopexit.loopexit, label %172

.loopexit.loopexit:                               ; preds = %391
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %112, %66
  %397 = inttoptr i64 %.sroa.0108.0282 to %struct.jpeg_component_info*
  %indvars.iv.next298 = add nuw i64 %indvars.iv297, 1
  %398 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %397, i64 1
  %399 = ptrtoint %struct.jpeg_component_info* %398 to i64
  %400 = load i32, i32* %41, align 8
  %401 = sext i32 %400 to i64
  %402 = icmp slt i64 %indvars.iv.next298, %401
  br i1 %402, label %66, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.critedge
  %403 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 37
  %404 = load i32, i32* %403, align 8
  %405 = add i32 %404, 1
  store i32 %405, i32* %403, align 8
  %sunkaddr267 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr268 = add i64 %sunkaddr267, 400
  %sunkaddr269 = inttoptr i64 %sunkaddr268 to i32*
  %406 = load i32, i32* %sunkaddr269, align 8
  %407 = icmp ult i32 %405, %406
  %.216 = select i1 %407, i32 3, i32 4
  ret i32 %.216

; <label>:408:                                    ; preds = %36
  ret i32 0
}

declare void @jcopy_block_row([64 x i16]*, [64 x i16]*, i32) #2

declare void @jzero_far(i8*, i64) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

; ModuleID = 'jdcolor.ll'
source_filename = "jdcolor.c"
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
%struct.jpeg_source_mgr = type { i8*, i64, {}*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, {}* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.jpeg_decomp_master = type { {}*, {}*, i32 }
%struct.jpeg_d_main_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* }
%struct.jpeg_d_coef_controller = type { {}*, i32 (%struct.jpeg_decompress_struct*)*, {}*, i32 (%struct.jpeg_decompress_struct*, i8***)*, %struct.jvirt_barray_control** }
%struct.jpeg_d_post_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* }
%struct.jpeg_input_controller = type { i32 (%struct.jpeg_decompress_struct*)*, {}*, {}*, {}*, i32, i32 }
%struct.jpeg_marker_reader = type { {}*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, [16 x i32 (%struct.jpeg_decompress_struct*)*], i32, i32, i32, i32 }
%struct.jpeg_entropy_decoder = type { {}*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* }
%struct.jpeg_inverse_dct = type { {}*, [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*] }
%struct.jpeg_upsampler = type { {}*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, i32 }
%struct.jpeg_color_deconverter = type { {}*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* }
%struct.jpeg_color_quantizer = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, {}*, {}* }
%struct.my_color_deconverter = type { %struct.jpeg_color_deconverter, i32*, i32*, i64*, i64* }

; Function Attrs: noinline nounwind uwtable
define void @jinit_color_deconverter(%struct.jpeg_decompress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 48) #4
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 82
  %9 = bitcast %struct.jpeg_color_deconverter** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_pass_dcolor, void (%struct.jpeg_decompress_struct*)** %10, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 9
  %12 = load i32, i32* %11, align 4
  switch i32 %12, label %49 [
    i32 1, label %13
    i32 2, label %25
    i32 3, label %25
    i32 4, label %37
    i32 5, label %37
  ]

; <label>:13:                                     ; preds = %1
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %15 = load i32, i32* %14, align 8
  %16 = icmp eq i32 %15, 1
  br i1 %16, label %61, label %17

; <label>:17:                                     ; preds = %13
  %18 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 5
  store i32 8, i32* %21, align 8
  %22 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %23 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %22, align 8
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  tail call void %24(%struct.jpeg_common_struct* nonnull %18) #4
  br label %61

; <label>:25:                                     ; preds = %1, %1
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %27 = load i32, i32* %26, align 8
  %28 = icmp eq i32 %27, 3
  br i1 %28, label %61, label %29

; <label>:29:                                     ; preds = %25
  %30 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i64 0, i32 5
  store i32 8, i32* %33, align 8
  %34 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %35 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %34, align 8
  %36 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %35, align 8
  tail call void %36(%struct.jpeg_common_struct* nonnull %30) #4
  br label %61

; <label>:37:                                     ; preds = %1, %1
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %39 = load i32, i32* %38, align 8
  %40 = icmp eq i32 %39, 4
  br i1 %40, label %61, label %41

; <label>:41:                                     ; preds = %37
  %42 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %44 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %44, i64 0, i32 5
  store i32 8, i32* %45, align 8
  %46 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %47 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %46, align 8
  %48 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %47, align 8
  tail call void %48(%struct.jpeg_common_struct* nonnull %42) #4
  br label %61

; <label>:49:                                     ; preds = %1
  %50 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %51 = load i32, i32* %50, align 8
  %52 = icmp slt i32 %51, 1
  br i1 %52, label %53, label %61

; <label>:53:                                     ; preds = %49
  %54 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %55 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %56 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %55, align 8
  %57 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %56, i64 0, i32 5
  store i32 8, i32* %57, align 8
  %58 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %59 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %58, align 8
  %60 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %59, align 8
  tail call void %60(%struct.jpeg_common_struct* nonnull %54) #4
  br label %61

; <label>:61:                                     ; preds = %49, %37, %25, %13, %53, %41, %29, %17
  %62 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 10
  %63 = load i32, i32* %62, align 8
  switch i32 %63, label %120 [
    i32 1, label %64
    i32 2, label %86
    i32 4, label %103
  ]

; <label>:64:                                     ; preds = %61
  %65 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  store i32 1, i32* %65, align 8
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr3 = add i64 %sunkaddr, 52
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to i32*
  %66 = load i32, i32* %sunkaddr4, align 4
  switch i32 %66, label %78 [
    i32 1, label %67
    i32 3, label %67
  ]

; <label>:67:                                     ; preds = %64, %64
  %68 = getelementptr inbounds i8, i8* %7, i64 8
  %69 = bitcast i8* %68 to void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @grayscale_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %69, align 8
  %70 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %71 = load i32, i32* %70, align 8
  %72 = icmp sgt i32 %71, 1
  br i1 %72, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %67
  %sunkaddr31 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr32 = add i64 %sunkaddr31, 296
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to %struct.jpeg_component_info**
  %sunkaddr34 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr35 = add i64 %sunkaddr34, 48
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 1, %.lr.ph.preheader ]
  %73 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr33, align 8
  %74 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %73, i64 %indvars.iv, i32 12
  store i32 0, i32* %74, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %75 = load i32, i32* %sunkaddr36, align 8
  %76 = sext i32 %75 to i64
  %77 = icmp slt i64 %indvars.iv.next, %76
  br i1 %77, label %.lr.ph, label %.loopexit.loopexit

; <label>:78:                                     ; preds = %64
  %79 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %80 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %81 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %82 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %81, i64 0, i32 5
  store i32 25, i32* %82, align 8
  %83 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %84 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %83, align 8
  %85 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %84, align 8
  tail call void %85(%struct.jpeg_common_struct* nonnull %79) #4
  br label %.loopexit

; <label>:86:                                     ; preds = %61
  %87 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  store i32 3, i32* %87, align 8
  %sunkaddr11 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr12 = add i64 %sunkaddr11, 52
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to i32*
  %88 = load i32, i32* %sunkaddr13, align 4
  switch i32 %88, label %95 [
    i32 3, label %89
    i32 2, label %92
  ]

; <label>:89:                                     ; preds = %86
  %90 = getelementptr inbounds i8, i8* %7, i64 8
  %91 = bitcast i8* %90 to void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @ycc_rgb_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %91, align 8
  tail call fastcc void @build_ycc_rgb_table(%struct.jpeg_decompress_struct* nonnull %0)
  br label %.loopexit

; <label>:92:                                     ; preds = %86
  %93 = getelementptr inbounds i8, i8* %7, i64 8
  %94 = bitcast i8* %93 to void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @null_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %94, align 8
  br label %.loopexit

; <label>:95:                                     ; preds = %86
  %96 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %97 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %98 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %97, align 8
  %99 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i64 0, i32 5
  store i32 25, i32* %99, align 8
  %100 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %101 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %100, align 8
  %102 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %101, align 8
  tail call void %102(%struct.jpeg_common_struct* nonnull %96) #4
  br label %.loopexit

; <label>:103:                                    ; preds = %61
  %104 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  store i32 4, i32* %104, align 8
  %sunkaddr14 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr15 = add i64 %sunkaddr14, 52
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to i32*
  %105 = load i32, i32* %sunkaddr16, align 4
  switch i32 %105, label %112 [
    i32 5, label %106
    i32 4, label %109
  ]

; <label>:106:                                    ; preds = %103
  %107 = getelementptr inbounds i8, i8* %7, i64 8
  %108 = bitcast i8* %107 to void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @ycck_cmyk_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %108, align 8
  tail call fastcc void @build_ycc_rgb_table(%struct.jpeg_decompress_struct* nonnull %0)
  br label %.loopexit

; <label>:109:                                    ; preds = %103
  %110 = getelementptr inbounds i8, i8* %7, i64 8
  %111 = bitcast i8* %110 to void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @null_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %111, align 8
  br label %.loopexit

; <label>:112:                                    ; preds = %103
  %113 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %114 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %115 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %114, align 8
  %116 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %115, i64 0, i32 5
  store i32 25, i32* %116, align 8
  %117 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %118 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %117, align 8
  %119 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %118, align 8
  tail call void %119(%struct.jpeg_common_struct* nonnull %113) #4
  br label %.loopexit

; <label>:120:                                    ; preds = %61
  %sunkaddr17 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr18 = add i64 %sunkaddr17, 52
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to i32*
  %121 = load i32, i32* %sunkaddr19, align 4
  %122 = icmp eq i32 %63, %121
  br i1 %122, label %123, label %129

; <label>:123:                                    ; preds = %120
  %124 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %125 = load i32, i32* %124, align 8
  %126 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  store i32 %125, i32* %126, align 8
  %127 = getelementptr inbounds i8, i8* %7, i64 8
  %128 = bitcast i8* %127 to void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @null_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %128, align 8
  br label %.loopexit

; <label>:129:                                    ; preds = %120
  %130 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %131 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %132 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %131, align 8
  %133 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %132, i64 0, i32 5
  store i32 25, i32* %133, align 8
  %134 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %135 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %134, align 8
  %136 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %135, align 8
  tail call void %136(%struct.jpeg_common_struct* nonnull %130) #4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %67, %123, %129, %106, %112, %109, %89, %95, %92, %78
  %137 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %138 = load i32, i32* %137, align 4
  %139 = icmp eq i32 %138, 0
  br i1 %139, label %140, label %143

; <label>:140:                                    ; preds = %.loopexit
  %141 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %142 = load i32, i32* %141, align 8
  br label %143

; <label>:143:                                    ; preds = %.loopexit, %140
  %.sink = phi i32 [ %142, %140 ], [ 1, %.loopexit ]
  %144 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 29
  store i32 %.sink, i32* %144, align 4
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal void @start_pass_dcolor(%struct.jpeg_decompress_struct* nocapture) #1 {
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @grayscale_convert(%struct.jpeg_decompress_struct* nocapture readonly, i8*** nocapture readonly, i32, i8**, i32) #0 {
  %6 = load i8**, i8*** %1, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %8 = load i32, i32* %7, align 8
  tail call void @jcopy_sample_rows(i8** %6, i32 %2, i8** %3, i32 0, i32 %4, i32 %8) #4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @ycc_rgb_convert(%struct.jpeg_decompress_struct* nocapture readonly, i8*** nocapture readonly, i32, i8** nocapture readonly, i32) #2 {
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 82
  %7 = bitcast %struct.jpeg_color_deconverter** %6 to %struct.my_color_deconverter**
  %8 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %10 = load i32, i32* %9, align 8
  %wide.trip.count = zext i32 %10 to i64
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %12 = load i8*, i8** %11, align 8
  %13 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %8, i64 0, i32 1
  %14 = load i32*, i32** %13, align 8
  %15 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %8, i64 0, i32 2
  %16 = load i32*, i32** %15, align 8
  %17 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %8, i64 0, i32 3
  %18 = load i64*, i64** %17, align 8
  %19 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %8, i64 0, i32 4
  %20 = load i64*, i64** %19, align 8
  %21 = icmp slt i32 %4, 1
  %22 = icmp eq i32 %10, 0
  %or.cond = or i1 %21, %22
  br i1 %or.cond, label %._crit_edge, label %.lr.ph9.split.us.preheader

.lr.ph9.split.us.preheader:                       ; preds = %5
  %sunkaddr26 = ptrtoint i8*** %1 to i64
  %sunkaddr27 = add i64 %sunkaddr26, 8
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i8***
  %sunkaddr = ptrtoint i8*** %1 to i64
  %sunkaddr29 = add i64 %sunkaddr, 16
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i8***
  br label %.lr.ph9.split.us

.lr.ph9.split.us:                                 ; preds = %.lr.ph9.split.us.preheader, %.loopexit.us
  %.in = phi i32 [ %68, %.loopexit.us ], [ %4, %.lr.ph9.split.us.preheader ]
  %.028.us = phi i32 [ %69, %.loopexit.us ], [ %2, %.lr.ph9.split.us.preheader ]
  %.037.us = phi i8** [ %70, %.loopexit.us ], [ %3, %.lr.ph9.split.us.preheader ]
  %23 = load i8**, i8*** %1, align 8
  %24 = zext i32 %.028.us to i64
  %25 = getelementptr inbounds i8*, i8** %23, i64 %24
  %26 = load i8*, i8** %25, align 8
  %27 = load i8**, i8*** %sunkaddr28, align 8
  %28 = getelementptr inbounds i8*, i8** %27, i64 %24
  %29 = load i8*, i8** %28, align 8
  %30 = load i8**, i8*** %sunkaddr30, align 8
  %31 = getelementptr inbounds i8*, i8** %30, i64 %24
  %32 = load i8*, i8** %31, align 8
  %33 = load i8*, i8** %.037.us, align 8
  br label %34

; <label>:34:                                     ; preds = %34, %.lr.ph9.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %34 ], [ 0, %.lr.ph9.split.us ]
  %.015.us = phi i8* [ %67, %34 ], [ %33, %.lr.ph9.split.us ]
  %35 = getelementptr inbounds i8, i8* %26, i64 %indvars.iv
  %36 = load i8, i8* %35, align 1
  %promoted = zext i8 %36 to i64
  %promoted23 = zext i8 %36 to i64
  %promoted19 = zext i8 %36 to i64
  %37 = getelementptr inbounds i8, i8* %29, i64 %indvars.iv
  %38 = load i8, i8* %37, align 1
  %39 = getelementptr inbounds i8, i8* %32, i64 %indvars.iv
  %40 = load i8, i8* %39, align 1
  %41 = zext i8 %40 to i64
  %42 = getelementptr inbounds i32, i32* %14, i64 %41
  %43 = load i32, i32* %42, align 4
  %44 = sext i32 %43 to i64
  %45 = add nsw i64 %44, %promoted23
  %46 = getelementptr inbounds i8, i8* %12, i64 %45
  %47 = load i8, i8* %46, align 1
  store i8 %47, i8* %.015.us, align 1
  %48 = zext i8 %38 to i64
  %49 = getelementptr inbounds i64, i64* %20, i64 %48
  %50 = load i64, i64* %49, align 8
  %51 = getelementptr inbounds i64, i64* %18, i64 %41
  %52 = load i64, i64* %51, align 8
  %53 = add nsw i64 %52, %50
  %54 = shl i64 %53, 16
  %55 = ashr i64 %54, 32
  %56 = add nsw i64 %55, %promoted19
  %57 = getelementptr inbounds i8, i8* %12, i64 %56
  %58 = load i8, i8* %57, align 1
  %59 = getelementptr inbounds i8, i8* %.015.us, i64 1
  store i8 %58, i8* %59, align 1
  %60 = getelementptr inbounds i32, i32* %16, i64 %48
  %61 = load i32, i32* %60, align 4
  %62 = sext i32 %61 to i64
  %63 = add nsw i64 %62, %promoted
  %64 = getelementptr inbounds i8, i8* %12, i64 %63
  %65 = load i8, i8* %64, align 1
  %66 = getelementptr inbounds i8, i8* %.015.us, i64 2
  store i8 %65, i8* %66, align 1
  %67 = getelementptr inbounds i8, i8* %.015.us, i64 3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.loopexit.us, label %34

.loopexit.us:                                     ; preds = %34
  %68 = add nsw i32 %.in, -1
  %69 = add i32 %.028.us, 1
  %70 = getelementptr inbounds i8*, i8** %.037.us, i64 1
  %71 = icmp sgt i32 %.in, 1
  br i1 %71, label %.lr.ph9.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @build_ycc_rgb_table(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 82
  %3 = bitcast %struct.jpeg_color_deconverter** %2 to %struct.my_color_deconverter**
  %4 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %6 = bitcast %struct.jpeg_memory_mgr** %5 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %7 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %6, align 8
  %8 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %7, align 8
  %9 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %10 = tail call i8* %8(%struct.jpeg_common_struct* %9, i32 1, i64 1024) #4
  %11 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %4, i64 0, i32 1
  %12 = bitcast i32** %11 to i8**
  store i8* %10, i8** %12, align 8
  %13 = bitcast %struct.jpeg_memory_mgr** %5 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %14 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %13, align 8
  %15 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %14, align 8
  %16 = tail call i8* %15(%struct.jpeg_common_struct* %9, i32 1, i64 1024) #4
  %17 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %4, i64 0, i32 2
  %18 = bitcast i32** %17 to i8**
  store i8* %16, i8** %18, align 8
  %19 = bitcast %struct.jpeg_memory_mgr** %5 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %20 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %19, align 8
  %21 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %20, align 8
  %22 = tail call i8* %21(%struct.jpeg_common_struct* %9, i32 1, i64 2048) #4
  %23 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %4, i64 0, i32 3
  %24 = bitcast i64** %23 to i8**
  store i8* %22, i8** %24, align 8
  %25 = bitcast %struct.jpeg_memory_mgr** %5 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %26 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %25, align 8
  %27 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %26, align 8
  %28 = tail call i8* %27(%struct.jpeg_common_struct* %9, i32 1, i64 2048) #4
  %29 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %4, i64 0, i32 4
  %30 = bitcast i64** %29 to i8**
  store i8* %28, i8** %30, align 8
  %sunkaddr15 = ptrtoint %struct.my_color_deconverter* %4 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 16
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32**
  %sunkaddr = ptrtoint %struct.my_color_deconverter* %4 to i64
  %sunkaddr18 = add i64 %sunkaddr, 24
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to i32**
  %sunkaddr20 = ptrtoint %struct.my_color_deconverter* %4 to i64
  %sunkaddr21 = add i64 %sunkaddr20, 32
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i64**
  %sunkaddr23 = ptrtoint %struct.my_color_deconverter* %4 to i64
  %sunkaddr24 = add i64 %sunkaddr23, 40
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to i64**
  br label %31

; <label>:31:                                     ; preds = %31, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %31 ]
  %.03 = phi i64 [ -128, %1 ], [ %51, %31 ]
  %32 = mul nsw i64 %.03, 91881
  %33 = add nsw i64 %32, 32768
  %34 = lshr i64 %33, 16
  %35 = trunc i64 %34 to i32
  %36 = load i32*, i32** %sunkaddr17, align 8
  %37 = getelementptr inbounds i32, i32* %36, i64 %indvars.iv
  store i32 %35, i32* %37, align 4
  %38 = mul nsw i64 %.03, 116130
  %39 = add nsw i64 %38, 32768
  %40 = lshr i64 %39, 16
  %41 = trunc i64 %40 to i32
  %42 = load i32*, i32** %sunkaddr19, align 8
  %43 = getelementptr inbounds i32, i32* %42, i64 %indvars.iv
  store i32 %41, i32* %43, align 4
  %44 = mul nsw i64 %.03, -46802
  %45 = load i64*, i64** %sunkaddr22, align 8
  %46 = getelementptr inbounds i64, i64* %45, i64 %indvars.iv
  store i64 %44, i64* %46, align 8
  %47 = mul nsw i64 %.03, -22554
  %48 = add nsw i64 %47, 32768
  %49 = load i64*, i64** %sunkaddr25, align 8
  %50 = getelementptr inbounds i64, i64* %49, i64 %indvars.iv
  store i64 %48, i64* %50, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %51 = add nsw i64 %.03, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 256
  br i1 %exitcond, label %52, label %31

; <label>:52:                                     ; preds = %31
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @null_convert(%struct.jpeg_decompress_struct* nocapture readonly, i8*** nocapture readonly, i32, i8** nocapture readonly, i32) #2 {
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %7 = load i32, i32* %6, align 8
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %10 = load i32, i32* %9, align 8
  %11 = icmp sgt i32 %4, 0
  %12 = icmp sgt i32 %7, 0
  %or.cond = and i1 %11, %12
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge16

.preheader.us.preheader:                          ; preds = %5
  %13 = add i32 %10, -1
  %xtraiter = and i32 %10, 7
  %wide.trip.count = zext i32 %7 to i64
  %14 = add nsw i32 %xtraiter, -1
  %15 = zext i32 %14 to i64
  %16 = add nuw nsw i64 %15, 1
  %17 = mul i64 %16, %8
  %18 = sub i32 %10, %xtraiter
  %19 = icmp eq i32 %10, 0
  %20 = icmp eq i32 %xtraiter, 0
  %21 = icmp ult i32 %13, 7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge12.us, %.preheader.us.preheader
  %.in = phi i32 [ %22, %._crit_edge12.us ], [ %4, %.preheader.us.preheader ]
  %.0215.us = phi i32 [ %59, %._crit_edge12.us ], [ %2, %.preheader.us.preheader ]
  %.0313.us = phi i8** [ %60, %._crit_edge12.us ], [ %3, %.preheader.us.preheader ]
  %22 = add nsw i32 %.in, -1
  %23 = zext i32 %.0215.us to i64
  br i1 %19, label %._crit_edge12.us, label %.lr.ph.us18.preheader

.lr.ph.us18.preheader:                            ; preds = %.preheader.us
  br label %.lr.ph.us18

.lr.ph.us18:                                      ; preds = %.lr.ph.us18.preheader, %._crit_edge.us22
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge.us22 ], [ %17, %.lr.ph.us18.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us22 ], [ 0, %.lr.ph.us18.preheader ]
  %24 = getelementptr inbounds i8**, i8*** %1, i64 %indvars.iv
  %25 = load i8**, i8*** %24, align 8
  %26 = getelementptr inbounds i8*, i8** %25, i64 %23
  %27 = load i8*, i8** %26, align 8
  %28 = load i8*, i8** %.0313.us, align 8
  %29 = getelementptr inbounds i8, i8* %28, i64 %indvars.iv
  br i1 %20, label %.prol.loopexit, label %.lr.ph.us18..prol.preheader_crit_edge

.lr.ph.us18..prol.preheader_crit_edge:            ; preds = %.lr.ph.us18
  %scevgep = getelementptr i8, i8* %28, i64 %indvars.iv33
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader, %.lr.ph.us18..prol.preheader_crit_edge
  %.058.us20.prol = phi i8* [ %32, %.prol.preheader ], [ %27, %.lr.ph.us18..prol.preheader_crit_edge ]
  %.067.us21.prol = phi i8* [ %31, %.prol.preheader ], [ %29, %.lr.ph.us18..prol.preheader_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.lr.ph.us18..prol.preheader_crit_edge ]
  %30 = load i8, i8* %.058.us20.prol, align 1
  store i8 %30, i8* %.067.us21.prol, align 1
  %31 = getelementptr inbounds i8, i8* %.067.us21.prol, i64 %8
  %32 = getelementptr inbounds i8, i8* %.058.us20.prol, i64 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.preheader..prol.loopexit_crit_edge, label %.prol.preheader, !llvm.loop !1

.prol.preheader..prol.loopexit_crit_edge:         ; preds = %.prol.preheader
  %scevgep35 = getelementptr i8, i8* %27, i64 %16
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us18, %.prol.preheader..prol.loopexit_crit_edge
  %.019.us19.unr = phi i32 [ %18, %.prol.preheader..prol.loopexit_crit_edge ], [ %10, %.lr.ph.us18 ]
  %.058.us20.unr = phi i8* [ %scevgep35, %.prol.preheader..prol.loopexit_crit_edge ], [ %27, %.lr.ph.us18 ]
  %.067.us21.unr = phi i8* [ %scevgep, %.prol.preheader..prol.loopexit_crit_edge ], [ %29, %.lr.ph.us18 ]
  br i1 %21, label %._crit_edge.us22, label %.lr.ph.us18.new.preheader

.lr.ph.us18.new.preheader:                        ; preds = %.prol.loopexit
  br label %.lr.ph.us18.new

.lr.ph.us18.new:                                  ; preds = %.lr.ph.us18.new.preheader, %.lr.ph.us18.new
  %.019.us19 = phi i32 [ %57, %.lr.ph.us18.new ], [ %.019.us19.unr, %.lr.ph.us18.new.preheader ]
  %.058.us20 = phi i8* [ %56, %.lr.ph.us18.new ], [ %.058.us20.unr, %.lr.ph.us18.new.preheader ]
  %.067.us21 = phi i8* [ %55, %.lr.ph.us18.new ], [ %.067.us21.unr, %.lr.ph.us18.new.preheader ]
  %33 = load i8, i8* %.058.us20, align 1
  store i8 %33, i8* %.067.us21, align 1
  %34 = getelementptr inbounds i8, i8* %.067.us21, i64 %8
  %35 = getelementptr inbounds i8, i8* %.058.us20, i64 1
  %36 = load i8, i8* %35, align 1
  store i8 %36, i8* %34, align 1
  %37 = getelementptr inbounds i8, i8* %34, i64 %8
  %38 = getelementptr inbounds i8, i8* %.058.us20, i64 2
  %39 = load i8, i8* %38, align 1
  store i8 %39, i8* %37, align 1
  %40 = getelementptr inbounds i8, i8* %37, i64 %8
  %41 = getelementptr inbounds i8, i8* %.058.us20, i64 3
  %42 = load i8, i8* %41, align 1
  store i8 %42, i8* %40, align 1
  %43 = getelementptr inbounds i8, i8* %40, i64 %8
  %44 = getelementptr inbounds i8, i8* %.058.us20, i64 4
  %45 = load i8, i8* %44, align 1
  store i8 %45, i8* %43, align 1
  %46 = getelementptr inbounds i8, i8* %43, i64 %8
  %47 = getelementptr inbounds i8, i8* %.058.us20, i64 5
  %48 = load i8, i8* %47, align 1
  store i8 %48, i8* %46, align 1
  %49 = getelementptr inbounds i8, i8* %46, i64 %8
  %50 = getelementptr inbounds i8, i8* %.058.us20, i64 6
  %51 = load i8, i8* %50, align 1
  store i8 %51, i8* %49, align 1
  %52 = getelementptr inbounds i8, i8* %49, i64 %8
  %53 = getelementptr inbounds i8, i8* %.058.us20, i64 7
  %54 = load i8, i8* %53, align 1
  store i8 %54, i8* %52, align 1
  %55 = getelementptr inbounds i8, i8* %52, i64 %8
  %56 = getelementptr inbounds i8, i8* %.058.us20, i64 8
  %57 = add i32 %.019.us19, -8
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %._crit_edge.us22.loopexit, label %.lr.ph.us18.new

._crit_edge.us22.loopexit:                        ; preds = %.lr.ph.us18.new
  br label %._crit_edge.us22

._crit_edge.us22:                                 ; preds = %._crit_edge.us22.loopexit, %.prol.loopexit
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next34 = add i64 %indvars.iv33, 1
  br i1 %exitcond, label %._crit_edge12.us.loopexit, label %.lr.ph.us18

._crit_edge12.us.loopexit:                        ; preds = %._crit_edge.us22
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.preheader.us
  %59 = add i32 %.0215.us, 1
  %60 = getelementptr inbounds i8*, i8** %.0313.us, i64 1
  %61 = icmp sgt i32 %.in, 1
  br i1 %61, label %.preheader.us, label %._crit_edge16.loopexit

._crit_edge16.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %5
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @ycck_cmyk_convert(%struct.jpeg_decompress_struct* nocapture readonly, i8*** nocapture readonly, i32, i8** nocapture readonly, i32) #2 {
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 82
  %7 = bitcast %struct.jpeg_color_deconverter** %6 to %struct.my_color_deconverter**
  %8 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %10 = load i32, i32* %9, align 8
  %wide.trip.count = zext i32 %10 to i64
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %12 = load i8*, i8** %11, align 8
  %13 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %8, i64 0, i32 1
  %14 = load i32*, i32** %13, align 8
  %15 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %8, i64 0, i32 2
  %16 = load i32*, i32** %15, align 8
  %17 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %8, i64 0, i32 3
  %18 = load i64*, i64** %17, align 8
  %19 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %8, i64 0, i32 4
  %20 = load i64*, i64** %19, align 8
  %21 = icmp slt i32 %4, 1
  %22 = icmp eq i32 %10, 0
  %or.cond = or i1 %21, %22
  br i1 %or.cond, label %._crit_edge, label %.lr.ph15.split.us.preheader

.lr.ph15.split.us.preheader:                      ; preds = %5
  %sunkaddr27 = ptrtoint i8*** %1 to i64
  %sunkaddr28 = add i64 %sunkaddr27, 8
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to i8***
  %sunkaddr = ptrtoint i8*** %1 to i64
  %sunkaddr30 = add i64 %sunkaddr, 16
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to i8***
  %sunkaddr32 = ptrtoint i8*** %1 to i64
  %sunkaddr33 = add i64 %sunkaddr32, 24
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i8***
  br label %.lr.ph15.split.us

.lr.ph15.split.us:                                ; preds = %.lr.ph15.split.us.preheader, %.loopexit.us
  %.in = phi i32 [ %76, %.loopexit.us ], [ %4, %.lr.ph15.split.us.preheader ]
  %.0214.us = phi i32 [ %77, %.loopexit.us ], [ %2, %.lr.ph15.split.us.preheader ]
  %.0313.us = phi i8** [ %78, %.loopexit.us ], [ %3, %.lr.ph15.split.us.preheader ]
  %23 = load i8**, i8*** %1, align 8
  %24 = zext i32 %.0214.us to i64
  %25 = getelementptr inbounds i8*, i8** %23, i64 %24
  %26 = load i8*, i8** %25, align 8
  %27 = load i8**, i8*** %sunkaddr29, align 8
  %28 = getelementptr inbounds i8*, i8** %27, i64 %24
  %29 = load i8*, i8** %28, align 8
  %30 = load i8**, i8*** %sunkaddr31, align 8
  %31 = getelementptr inbounds i8*, i8** %30, i64 %24
  %32 = load i8*, i8** %31, align 8
  %33 = load i8**, i8*** %sunkaddr34, align 8
  %34 = getelementptr inbounds i8*, i8** %33, i64 %24
  %35 = load i8*, i8** %34, align 8
  %36 = load i8*, i8** %.0313.us, align 8
  br label %37

; <label>:37:                                     ; preds = %37, %.lr.ph15.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %37 ], [ 0, %.lr.ph15.split.us ]
  %.0111.us = phi i8* [ %75, %37 ], [ %36, %.lr.ph15.split.us ]
  %38 = getelementptr inbounds i8, i8* %26, i64 %indvars.iv
  %39 = load i8, i8* %38, align 1
  %40 = zext i8 %39 to i32
  %41 = getelementptr inbounds i8, i8* %29, i64 %indvars.iv
  %42 = load i8, i8* %41, align 1
  %43 = getelementptr inbounds i8, i8* %32, i64 %indvars.iv
  %44 = load i8, i8* %43, align 1
  %45 = zext i8 %44 to i64
  %46 = getelementptr inbounds i32, i32* %14, i64 %45
  %47 = load i32, i32* %46, align 4
  %.neg6.us = xor i32 %40, 255
  %48 = sub i32 %.neg6.us, %47
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8* %12, i64 %49
  %51 = load i8, i8* %50, align 1
  store i8 %51, i8* %.0111.us, align 1
  %52 = zext i8 %42 to i64
  %53 = getelementptr inbounds i64, i64* %20, i64 %52
  %54 = load i64, i64* %53, align 8
  %55 = getelementptr inbounds i64, i64* %18, i64 %45
  %56 = load i64, i64* %55, align 8
  %57 = add nsw i64 %56, %54
  %58 = lshr i64 %57, 16
  %59 = trunc i64 %58 to i32
  %.neg8.us = xor i32 %40, 255
  %60 = sub i32 %.neg8.us, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8* %12, i64 %61
  %63 = load i8, i8* %62, align 1
  %64 = getelementptr inbounds i8, i8* %.0111.us, i64 1
  store i8 %63, i8* %64, align 1
  %65 = getelementptr inbounds i32, i32* %16, i64 %52
  %66 = load i32, i32* %65, align 4
  %.neg10.us = xor i32 %40, 255
  %67 = sub i32 %.neg10.us, %66
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i8, i8* %12, i64 %68
  %70 = load i8, i8* %69, align 1
  %71 = getelementptr inbounds i8, i8* %.0111.us, i64 2
  store i8 %70, i8* %71, align 1
  %72 = getelementptr inbounds i8, i8* %35, i64 %indvars.iv
  %73 = load i8, i8* %72, align 1
  %74 = getelementptr inbounds i8, i8* %.0111.us, i64 3
  store i8 %73, i8* %74, align 1
  %75 = getelementptr inbounds i8, i8* %.0111.us, i64 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.loopexit.us, label %37

.loopexit.us:                                     ; preds = %37
  %76 = add nsw i32 %.in, -1
  %77 = add i32 %.0214.us, 1
  %78 = getelementptr inbounds i8*, i8** %.0313.us, i64 1
  %79 = icmp sgt i32 %.in, 1
  br i1 %79, label %.lr.ph15.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  ret void
}

declare void @jcopy_sample_rows(i8**, i32, i8**, i32, i32, i32) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}

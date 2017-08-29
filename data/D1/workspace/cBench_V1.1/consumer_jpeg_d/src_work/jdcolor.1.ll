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
define void @jinit_color_deconverter(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %3, i64 0, i32 0
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
  switch i32 %12, label %46 [
    i32 1, label %13
    i32 2, label %24
    i32 3, label %24
    i32 4, label %35
    i32 5, label %35
  ]

; <label>:13:                                     ; preds = %1
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %15 = load i32, i32* %14, align 8
  %16 = icmp eq i32 %15, 1
  br i1 %16, label %57, label %17

; <label>:17:                                     ; preds = %13
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i64 0, i32 5
  store i32 8, i32* %20, align 8
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i64 0, i32 0
  %23 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %22, align 8
  tail call void %23(%struct.jpeg_common_struct* nonnull %6) #4
  br label %57

; <label>:24:                                     ; preds = %1, %1
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %26 = load i32, i32* %25, align 8
  %27 = icmp eq i32 %26, 3
  br i1 %27, label %57, label %28

; <label>:28:                                     ; preds = %24
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i64 0, i32 5
  store i32 8, i32* %31, align 8
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i64 0, i32 0
  %34 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %33, align 8
  tail call void %34(%struct.jpeg_common_struct* nonnull %6) #4
  br label %57

; <label>:35:                                     ; preds = %1, %1
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %37 = load i32, i32* %36, align 8
  %38 = icmp eq i32 %37, 4
  br i1 %38, label %57, label %39

; <label>:39:                                     ; preds = %35
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %41 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %42 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %41, i64 0, i32 5
  store i32 8, i32* %42, align 8
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i64 0, i32 0
  %45 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %44, align 8
  tail call void %45(%struct.jpeg_common_struct* nonnull %6) #4
  br label %57

; <label>:46:                                     ; preds = %1
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %48 = load i32, i32* %47, align 8
  %49 = icmp slt i32 %48, 1
  br i1 %49, label %50, label %57

; <label>:50:                                     ; preds = %46
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %52 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %51, align 8
  %53 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %52, i64 0, i32 5
  store i32 8, i32* %53, align 8
  %54 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %51, align 8
  %55 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %54, i64 0, i32 0
  %56 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %55, align 8
  tail call void %56(%struct.jpeg_common_struct* nonnull %6) #4
  br label %57

; <label>:57:                                     ; preds = %13, %24, %35, %46, %50, %39, %28, %17
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 10
  %59 = load i32, i32* %58, align 8
  switch i32 %59, label %115 [
    i32 1, label %60
    i32 2, label %83
    i32 4, label %99
  ]

; <label>:60:                                     ; preds = %57
  %61 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  store i32 1, i32* %61, align 8
  %62 = load i32, i32* %11, align 4
  switch i32 %62, label %76 [
    i32 1, label %63
    i32 3, label %63
  ]

; <label>:63:                                     ; preds = %60, %60
  %64 = getelementptr inbounds i8, i8* %7, i64 8
  %65 = bitcast i8* %64 to void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @grayscale_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %65, align 8
  %66 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %67 = load i32, i32* %66, align 8
  %68 = icmp sgt i32 %67, 1
  br i1 %68, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %63
  %69 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  br label %70

; <label>:70:                                     ; preds = %.lr.ph, %70
  %indvars.iv2 = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next, %70 ]
  %71 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %69, align 8
  %72 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %71, i64 %indvars.iv2, i32 12
  store i32 0, i32* %72, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv2, 1
  %73 = load i32, i32* %66, align 8
  %74 = sext i32 %73 to i64
  %75 = icmp slt i64 %indvars.iv.next, %74
  br i1 %75, label %70, label %.loopexit.loopexit

; <label>:76:                                     ; preds = %60
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %78 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %77, align 8
  %79 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %78, i64 0, i32 5
  store i32 25, i32* %79, align 8
  %80 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %77, align 8
  %81 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %80, i64 0, i32 0
  %82 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %81, align 8
  tail call void %82(%struct.jpeg_common_struct* nonnull %6) #4
  br label %.loopexit

; <label>:83:                                     ; preds = %57
  %84 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  store i32 3, i32* %84, align 8
  %85 = load i32, i32* %11, align 4
  switch i32 %85, label %92 [
    i32 3, label %86
    i32 2, label %89
  ]

; <label>:86:                                     ; preds = %83
  %87 = getelementptr inbounds i8, i8* %7, i64 8
  %88 = bitcast i8* %87 to void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @ycc_rgb_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %88, align 8
  tail call void @build_ycc_rgb_table(%struct.jpeg_decompress_struct* nonnull %0)
  br label %.loopexit

; <label>:89:                                     ; preds = %83
  %90 = getelementptr inbounds i8, i8* %7, i64 8
  %91 = bitcast i8* %90 to void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @null_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %91, align 8
  br label %.loopexit

; <label>:92:                                     ; preds = %83
  %93 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %94 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %93, align 8
  %95 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %94, i64 0, i32 5
  store i32 25, i32* %95, align 8
  %96 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %93, align 8
  %97 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %96, i64 0, i32 0
  %98 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %97, align 8
  tail call void %98(%struct.jpeg_common_struct* nonnull %6) #4
  br label %.loopexit

; <label>:99:                                     ; preds = %57
  %100 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  store i32 4, i32* %100, align 8
  %101 = load i32, i32* %11, align 4
  switch i32 %101, label %108 [
    i32 5, label %102
    i32 4, label %105
  ]

; <label>:102:                                    ; preds = %99
  %103 = getelementptr inbounds i8, i8* %7, i64 8
  %104 = bitcast i8* %103 to void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @ycck_cmyk_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %104, align 8
  tail call void @build_ycc_rgb_table(%struct.jpeg_decompress_struct* nonnull %0)
  br label %.loopexit

; <label>:105:                                    ; preds = %99
  %106 = getelementptr inbounds i8, i8* %7, i64 8
  %107 = bitcast i8* %106 to void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @null_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %107, align 8
  br label %.loopexit

; <label>:108:                                    ; preds = %99
  %109 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %110 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %109, align 8
  %111 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %110, i64 0, i32 5
  store i32 25, i32* %111, align 8
  %112 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %109, align 8
  %113 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %112, i64 0, i32 0
  %114 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %113, align 8
  tail call void %114(%struct.jpeg_common_struct* nonnull %6) #4
  br label %.loopexit

; <label>:115:                                    ; preds = %57
  %116 = load i32, i32* %11, align 4
  %117 = icmp eq i32 %59, %116
  br i1 %117, label %118, label %124

; <label>:118:                                    ; preds = %115
  %119 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %120 = load i32, i32* %119, align 8
  %121 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  store i32 %120, i32* %121, align 8
  %122 = getelementptr inbounds i8, i8* %7, i64 8
  %123 = bitcast i8* %122 to void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* @null_convert, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %123, align 8
  br label %.loopexit

; <label>:124:                                    ; preds = %115
  %125 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %126 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %125, align 8
  %127 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %126, i64 0, i32 5
  store i32 25, i32* %127, align 8
  %128 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %125, align 8
  %129 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %128, i64 0, i32 0
  %130 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %129, align 8
  tail call void %130(%struct.jpeg_common_struct* nonnull %6) #4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %70
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %63, %118, %124, %102, %108, %105, %86, %92, %89, %76
  %131 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %132 = load i32, i32* %131, align 4
  %133 = icmp eq i32 %132, 0
  br i1 %133, label %134, label %137

; <label>:134:                                    ; preds = %.loopexit
  %135 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %136 = load i32, i32* %135, align 8
  br label %137

; <label>:137:                                    ; preds = %.loopexit, %134
  %.sink = phi i32 [ %136, %134 ], [ 1, %.loopexit ]
  %138 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 29
  store i32 %.sink, i32* %138, align 4
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
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %10 = load i8*, i8** %9, align 8
  %11 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %8, i64 0, i32 1
  %12 = load i32*, i32** %11, align 8
  %13 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %8, i64 0, i32 2
  %14 = load i32*, i32** %13, align 8
  %15 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %8, i64 0, i32 3
  %16 = load i64*, i64** %15, align 8
  %17 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %8, i64 0, i32 4
  %18 = load i64*, i64** %17, align 8
  %19 = icmp sgt i32 %4, 0
  br i1 %19, label %.lr.ph11, label %._crit_edge12

.lr.ph11:                                         ; preds = %5
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %21 = load i32, i32* %20, align 8
  %22 = getelementptr inbounds i8**, i8*** %1, i64 1
  %23 = getelementptr inbounds i8**, i8*** %1, i64 2
  %wide.trip.count = zext i32 %21 to i64
  %exitcond5 = icmp eq i32 %21, 0
  br i1 %exitcond5, label %._crit_edge12, label %.lr.ph11.split.preheader

.lr.ph11.split.preheader:                         ; preds = %.lr.ph11
  br label %.lr.ph11.split

.lr.ph11.split:                                   ; preds = %.lr.ph11.split.preheader, %._crit_edge
  %.in = phi i32 [ %24, %._crit_edge ], [ %4, %.lr.ph11.split.preheader ]
  %.029 = phi i32 [ %72, %._crit_edge ], [ %2, %.lr.ph11.split.preheader ]
  %.038 = phi i8** [ %73, %._crit_edge ], [ %3, %.lr.ph11.split.preheader ]
  %24 = add nsw i32 %.in, -1
  %25 = load i8**, i8*** %1, align 8
  %26 = zext i32 %.029 to i64
  %27 = getelementptr inbounds i8*, i8** %25, i64 %26
  %28 = load i8*, i8** %27, align 8
  %29 = load i8**, i8*** %22, align 8
  %30 = getelementptr inbounds i8*, i8** %29, i64 %26
  %31 = load i8*, i8** %30, align 8
  %32 = load i8**, i8*** %23, align 8
  %33 = getelementptr inbounds i8*, i8** %32, i64 %26
  %34 = load i8*, i8** %33, align 8
  %35 = load i8*, i8** %.038, align 8
  br label %36

; <label>:36:                                     ; preds = %.lr.ph11.split, %36
  %.017 = phi i8* [ %35, %.lr.ph11.split ], [ %71, %36 ]
  %indvars.iv6 = phi i64 [ 0, %.lr.ph11.split ], [ %indvars.iv.next, %36 ]
  %37 = getelementptr inbounds i8, i8* %28, i64 %indvars.iv6
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = getelementptr inbounds i8, i8* %31, i64 %indvars.iv6
  %41 = load i8, i8* %40, align 1
  %42 = getelementptr inbounds i8, i8* %34, i64 %indvars.iv6
  %43 = load i8, i8* %42, align 1
  %44 = zext i8 %43 to i64
  %45 = getelementptr inbounds i32, i32* %12, i64 %44
  %46 = load i32, i32* %45, align 4
  %47 = add nsw i32 %46, %39
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i8, i8* %10, i64 %48
  %50 = load i8, i8* %49, align 1
  store i8 %50, i8* %.017, align 1
  %51 = zext i8 %41 to i64
  %52 = getelementptr inbounds i64, i64* %18, i64 %51
  %53 = load i64, i64* %52, align 8
  %54 = getelementptr inbounds i64, i64* %16, i64 %44
  %55 = load i64, i64* %54, align 8
  %56 = add nsw i64 %55, %53
  %57 = lshr i64 %56, 16
  %58 = trunc i64 %57 to i32
  %59 = add nsw i32 %58, %39
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8* %10, i64 %60
  %62 = load i8, i8* %61, align 1
  %63 = getelementptr inbounds i8, i8* %.017, i64 1
  store i8 %62, i8* %63, align 1
  %64 = getelementptr inbounds i32, i32* %14, i64 %51
  %65 = load i32, i32* %64, align 4
  %66 = add nsw i32 %65, %39
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, i8* %10, i64 %67
  %69 = load i8, i8* %68, align 1
  %70 = getelementptr inbounds i8, i8* %.017, i64 2
  store i8 %69, i8* %70, align 1
  %71 = getelementptr inbounds i8, i8* %.017, i64 3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge, label %36

._crit_edge:                                      ; preds = %36
  %72 = add i32 %.029, 1
  %73 = getelementptr inbounds i8*, i8** %.038, i64 1
  %74 = icmp sgt i32 %.in, 1
  br i1 %74, label %.lr.ph11.split, label %._crit_edge12.loopexit

._crit_edge12.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.lr.ph11, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @build_ycc_rgb_table(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 82
  %3 = bitcast %struct.jpeg_color_deconverter** %2 to %struct.my_color_deconverter**
  %4 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %6 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %6, i64 0, i32 0
  %8 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %7, align 8
  %9 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %10 = tail call i8* %8(%struct.jpeg_common_struct* %9, i32 1, i64 1024) #4
  %11 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %4, i64 0, i32 1
  %12 = bitcast i32** %11 to i8**
  store i8* %10, i8** %12, align 8
  %13 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %14 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %13, i64 0, i32 0
  %15 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %14, align 8
  %16 = tail call i8* %15(%struct.jpeg_common_struct* %9, i32 1, i64 1024) #4
  %17 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %4, i64 0, i32 2
  %18 = bitcast i32** %17 to i8**
  store i8* %16, i8** %18, align 8
  %19 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %20 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %19, i64 0, i32 0
  %21 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %20, align 8
  %22 = tail call i8* %21(%struct.jpeg_common_struct* %9, i32 1, i64 2048) #4
  %23 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %4, i64 0, i32 3
  %24 = bitcast i64** %23 to i8**
  store i8* %22, i8** %24, align 8
  %25 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %26 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %25, i64 0, i32 0
  %27 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %26, align 8
  %28 = tail call i8* %27(%struct.jpeg_common_struct* %9, i32 1, i64 2048) #4
  %29 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %4, i64 0, i32 4
  %30 = bitcast i64** %29 to i8**
  store i8* %28, i8** %30, align 8
  br label %31

; <label>:31:                                     ; preds = %1, %31
  %.03 = phi i64 [ -128, %1 ], [ %51, %31 ]
  %indvars.iv2 = phi i64 [ 0, %1 ], [ %indvars.iv.next, %31 ]
  %32 = mul nsw i64 %.03, 91881
  %33 = add nsw i64 %32, 32768
  %34 = lshr i64 %33, 16
  %35 = trunc i64 %34 to i32
  %36 = load i32*, i32** %11, align 8
  %37 = getelementptr inbounds i32, i32* %36, i64 %indvars.iv2
  store i32 %35, i32* %37, align 4
  %38 = mul nsw i64 %.03, 116130
  %39 = add nsw i64 %38, 32768
  %40 = lshr i64 %39, 16
  %41 = trunc i64 %40 to i32
  %42 = load i32*, i32** %17, align 8
  %43 = getelementptr inbounds i32, i32* %42, i64 %indvars.iv2
  store i32 %41, i32* %43, align 4
  %44 = mul nsw i64 %.03, -46802
  %45 = load i64*, i64** %23, align 8
  %46 = getelementptr inbounds i64, i64* %45, i64 %indvars.iv2
  store i64 %44, i64* %46, align 8
  %47 = mul nsw i64 %.03, -22554
  %48 = add nsw i64 %47, 32768
  %49 = load i64*, i64** %29, align 8
  %50 = getelementptr inbounds i64, i64* %49, i64 %indvars.iv2
  store i64 %48, i64* %50, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
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
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %9 = load i32, i32* %8, align 8
  %10 = sext i32 %7 to i64
  %11 = icmp sgt i32 %4, 0
  br i1 %11, label %.preheader.lr.ph, label %._crit_edge17

.preheader.lr.ph:                                 ; preds = %5
  %12 = icmp sgt i32 %7, 0
  %13 = icmp eq i32 %9, 0
  br i1 %12, label %.preheader.us.preheader, label %._crit_edge17

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %14 = add i32 %9, -1
  %xtraiter = and i32 %9, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %15 = icmp ult i32 %14, 7
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge12.us
  %.in = phi i32 [ %16, %._crit_edge12.us ], [ %4, %.preheader.us.preheader ]
  %.0216.us = phi i32 [ %54, %._crit_edge12.us ], [ %2, %.preheader.us.preheader ]
  %.0313.us = phi i8** [ %55, %._crit_edge12.us ], [ %3, %.preheader.us.preheader ]
  %16 = add nsw i32 %.in, -1
  %17 = zext i32 %.0216.us to i64
  br i1 %13, label %._crit_edge12.us, label %.lr.ph.us23.preheader

.lr.ph.us23.preheader:                            ; preds = %.preheader.us
  br label %.lr.ph.us23

.lr.ph.us23:                                      ; preds = %.lr.ph.us23.preheader, %._crit_edge.us24
  %indvars.iv10.us18 = phi i64 [ %indvars.iv.next.us22, %._crit_edge.us24 ], [ 0, %.lr.ph.us23.preheader ]
  %18 = getelementptr inbounds i8**, i8*** %1, i64 %indvars.iv10.us18
  %19 = load i8**, i8*** %18, align 8
  %20 = getelementptr inbounds i8*, i8** %19, i64 %17
  %21 = load i8*, i8** %20, align 8
  %22 = load i8*, i8** %.0313.us, align 8
  %23 = getelementptr inbounds i8, i8* %22, i64 %indvars.iv10.us18
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us23
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %.019.us19.prol = phi i32 [ %27, %.prol.preheader ], [ %9, %.prol.preheader.preheader ]
  %.058.us20.prol = phi i8* [ %24, %.prol.preheader ], [ %21, %.prol.preheader.preheader ]
  %.067.us21.prol = phi i8* [ %26, %.prol.preheader ], [ %23, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %24 = getelementptr inbounds i8, i8* %.058.us20.prol, i64 1
  %25 = load i8, i8* %.058.us20.prol, align 1
  store i8 %25, i8* %.067.us21.prol, align 1
  %26 = getelementptr inbounds i8, i8* %.067.us21.prol, i64 %10
  %27 = add i32 %.019.us19.prol, -1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us23
  %.019.us19.unr = phi i32 [ %9, %.lr.ph.us23 ], [ %27, %.prol.loopexit.loopexit ]
  %.058.us20.unr = phi i8* [ %21, %.lr.ph.us23 ], [ %24, %.prol.loopexit.loopexit ]
  %.067.us21.unr = phi i8* [ %23, %.lr.ph.us23 ], [ %26, %.prol.loopexit.loopexit ]
  br i1 %15, label %._crit_edge.us24, label %.lr.ph.us23.new.preheader

.lr.ph.us23.new.preheader:                        ; preds = %.prol.loopexit
  br label %.lr.ph.us23.new

.lr.ph.us23.new:                                  ; preds = %.lr.ph.us23.new.preheader, %.lr.ph.us23.new
  %.019.us19 = phi i32 [ %52, %.lr.ph.us23.new ], [ %.019.us19.unr, %.lr.ph.us23.new.preheader ]
  %.058.us20 = phi i8* [ %49, %.lr.ph.us23.new ], [ %.058.us20.unr, %.lr.ph.us23.new.preheader ]
  %.067.us21 = phi i8* [ %51, %.lr.ph.us23.new ], [ %.067.us21.unr, %.lr.ph.us23.new.preheader ]
  %28 = getelementptr inbounds i8, i8* %.058.us20, i64 1
  %29 = load i8, i8* %.058.us20, align 1
  store i8 %29, i8* %.067.us21, align 1
  %30 = getelementptr inbounds i8, i8* %.067.us21, i64 %10
  %31 = getelementptr inbounds i8, i8* %.058.us20, i64 2
  %32 = load i8, i8* %28, align 1
  store i8 %32, i8* %30, align 1
  %33 = getelementptr inbounds i8, i8* %30, i64 %10
  %34 = getelementptr inbounds i8, i8* %.058.us20, i64 3
  %35 = load i8, i8* %31, align 1
  store i8 %35, i8* %33, align 1
  %36 = getelementptr inbounds i8, i8* %33, i64 %10
  %37 = getelementptr inbounds i8, i8* %.058.us20, i64 4
  %38 = load i8, i8* %34, align 1
  store i8 %38, i8* %36, align 1
  %39 = getelementptr inbounds i8, i8* %36, i64 %10
  %40 = getelementptr inbounds i8, i8* %.058.us20, i64 5
  %41 = load i8, i8* %37, align 1
  store i8 %41, i8* %39, align 1
  %42 = getelementptr inbounds i8, i8* %39, i64 %10
  %43 = getelementptr inbounds i8, i8* %.058.us20, i64 6
  %44 = load i8, i8* %40, align 1
  store i8 %44, i8* %42, align 1
  %45 = getelementptr inbounds i8, i8* %42, i64 %10
  %46 = getelementptr inbounds i8, i8* %.058.us20, i64 7
  %47 = load i8, i8* %43, align 1
  store i8 %47, i8* %45, align 1
  %48 = getelementptr inbounds i8, i8* %45, i64 %10
  %49 = getelementptr inbounds i8, i8* %.058.us20, i64 8
  %50 = load i8, i8* %46, align 1
  store i8 %50, i8* %48, align 1
  %51 = getelementptr inbounds i8, i8* %48, i64 %10
  %52 = add i32 %.019.us19, -8
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %._crit_edge.us24.loopexit, label %.lr.ph.us23.new

._crit_edge.us24.loopexit:                        ; preds = %.lr.ph.us23.new
  br label %._crit_edge.us24

._crit_edge.us24:                                 ; preds = %._crit_edge.us24.loopexit, %.prol.loopexit
  %indvars.iv.next.us22 = add nuw nsw i64 %indvars.iv10.us18, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us22, %10
  br i1 %exitcond, label %._crit_edge12.us.loopexit, label %.lr.ph.us23

._crit_edge12.us.loopexit:                        ; preds = %._crit_edge.us24
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.preheader.us
  %54 = add i32 %.0216.us, 1
  %55 = getelementptr inbounds i8*, i8** %.0313.us, i64 1
  %56 = icmp sgt i32 %.in, 1
  br i1 %56, label %.preheader.us, label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %.preheader.lr.ph, %5
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @ycck_cmyk_convert(%struct.jpeg_decompress_struct* nocapture readonly, i8*** nocapture readonly, i32, i8** nocapture readonly, i32) #2 {
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 82
  %7 = bitcast %struct.jpeg_color_deconverter** %6 to %struct.my_color_deconverter**
  %8 = load %struct.my_color_deconverter*, %struct.my_color_deconverter** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %10 = load i8*, i8** %9, align 8
  %11 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %8, i64 0, i32 1
  %12 = load i32*, i32** %11, align 8
  %13 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %8, i64 0, i32 2
  %14 = load i32*, i32** %13, align 8
  %15 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %8, i64 0, i32 3
  %16 = load i64*, i64** %15, align 8
  %17 = getelementptr inbounds %struct.my_color_deconverter, %struct.my_color_deconverter* %8, i64 0, i32 4
  %18 = load i64*, i64** %17, align 8
  %19 = icmp sgt i32 %4, 0
  br i1 %19, label %.lr.ph17, label %._crit_edge18

.lr.ph17:                                         ; preds = %5
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %21 = load i32, i32* %20, align 8
  %22 = getelementptr inbounds i8**, i8*** %1, i64 1
  %23 = getelementptr inbounds i8**, i8*** %1, i64 2
  %24 = getelementptr inbounds i8**, i8*** %1, i64 3
  %wide.trip.count = zext i32 %21 to i64
  %exitcond11 = icmp eq i32 %21, 0
  br i1 %exitcond11, label %._crit_edge18, label %.lr.ph17.split.preheader

.lr.ph17.split.preheader:                         ; preds = %.lr.ph17
  br label %.lr.ph17.split

.lr.ph17.split:                                   ; preds = %.lr.ph17.split.preheader, %._crit_edge
  %.in = phi i32 [ %25, %._crit_edge ], [ %4, %.lr.ph17.split.preheader ]
  %.0215 = phi i32 [ %79, %._crit_edge ], [ %2, %.lr.ph17.split.preheader ]
  %.0314 = phi i8** [ %80, %._crit_edge ], [ %3, %.lr.ph17.split.preheader ]
  %25 = add nsw i32 %.in, -1
  %26 = load i8**, i8*** %1, align 8
  %27 = zext i32 %.0215 to i64
  %28 = getelementptr inbounds i8*, i8** %26, i64 %27
  %29 = load i8*, i8** %28, align 8
  %30 = load i8**, i8*** %22, align 8
  %31 = getelementptr inbounds i8*, i8** %30, i64 %27
  %32 = load i8*, i8** %31, align 8
  %33 = load i8**, i8*** %23, align 8
  %34 = getelementptr inbounds i8*, i8** %33, i64 %27
  %35 = load i8*, i8** %34, align 8
  %36 = load i8**, i8*** %24, align 8
  %37 = getelementptr inbounds i8*, i8** %36, i64 %27
  %38 = load i8*, i8** %37, align 8
  %39 = load i8*, i8** %.0314, align 8
  br label %40

; <label>:40:                                     ; preds = %.lr.ph17.split, %40
  %.0113 = phi i8* [ %39, %.lr.ph17.split ], [ %78, %40 ]
  %indvars.iv12 = phi i64 [ 0, %.lr.ph17.split ], [ %indvars.iv.next, %40 ]
  %41 = getelementptr inbounds i8, i8* %29, i64 %indvars.iv12
  %42 = load i8, i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = getelementptr inbounds i8, i8* %32, i64 %indvars.iv12
  %45 = load i8, i8* %44, align 1
  %46 = getelementptr inbounds i8, i8* %35, i64 %indvars.iv12
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i64
  %49 = getelementptr inbounds i32, i32* %12, i64 %48
  %50 = load i32, i32* %49, align 4
  %.neg6 = xor i32 %43, 255
  %51 = sub i32 %.neg6, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8, i8* %10, i64 %52
  %54 = load i8, i8* %53, align 1
  store i8 %54, i8* %.0113, align 1
  %55 = zext i8 %45 to i64
  %56 = getelementptr inbounds i64, i64* %18, i64 %55
  %57 = load i64, i64* %56, align 8
  %58 = getelementptr inbounds i64, i64* %16, i64 %48
  %59 = load i64, i64* %58, align 8
  %60 = add nsw i64 %59, %57
  %61 = lshr i64 %60, 16
  %62 = trunc i64 %61 to i32
  %.neg8 = xor i32 %43, 255
  %63 = sub i32 %.neg8, %62
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i8, i8* %10, i64 %64
  %66 = load i8, i8* %65, align 1
  %67 = getelementptr inbounds i8, i8* %.0113, i64 1
  store i8 %66, i8* %67, align 1
  %68 = getelementptr inbounds i32, i32* %14, i64 %55
  %69 = load i32, i32* %68, align 4
  %.neg10 = xor i32 %43, 255
  %70 = sub i32 %.neg10, %69
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i8, i8* %10, i64 %71
  %73 = load i8, i8* %72, align 1
  %74 = getelementptr inbounds i8, i8* %.0113, i64 2
  store i8 %73, i8* %74, align 1
  %75 = getelementptr inbounds i8, i8* %38, i64 %indvars.iv12
  %76 = load i8, i8* %75, align 1
  %77 = getelementptr inbounds i8, i8* %.0113, i64 3
  store i8 %76, i8* %77, align 1
  %78 = getelementptr inbounds i8, i8* %.0113, i64 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge, label %40

._crit_edge:                                      ; preds = %40
  %79 = add i32 %.0215, 1
  %80 = getelementptr inbounds i8*, i8** %.0314, i64 1
  %81 = icmp sgt i32 %.in, 1
  br i1 %81, label %.lr.ph17.split, label %._crit_edge18.loopexit

._crit_edge18.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %.lr.ph17, %5
  ret void
}

declare void @jcopy_sample_rows(i8**, i32, i8**, i32, i32, i32) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}

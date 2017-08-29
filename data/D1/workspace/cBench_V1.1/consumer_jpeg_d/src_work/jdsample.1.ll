; ModuleID = 'jdsample.ll'
source_filename = "jdsample.c"
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
%struct.my_upsampler = type { %struct.jpeg_upsampler, [10 x i8**], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*], i32, i32, [10 x i32], [10 x i8], [10 x i8] }

; Function Attrs: noinline nounwind uwtable
define void @jinit_upsampler(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %3, i64 0, i32 0
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 256) #4
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %9 = bitcast %struct.jpeg_upsampler** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_pass_upsample, void (%struct.jpeg_decompress_struct*)** %10, align 8
  %11 = getelementptr inbounds i8, i8* %7, i64 8
  %12 = bitcast i8* %11 to void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)**
  store void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @sep_upsample, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %12, align 8
  %13 = getelementptr inbounds i8, i8* %7, i64 16
  %14 = bitcast i8* %13 to i32*
  store i32 0, i32* %14, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 56
  %16 = load i32, i32* %15, align 8
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %25, label %18

; <label>:18:                                     ; preds = %1
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 5
  store i32 23, i32* %21, align 8
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i64 0, i32 0
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  tail call void %24(%struct.jpeg_common_struct* %6) #4
  br label %25

; <label>:25:                                     ; preds = %1, %18
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 17
  %27 = load i32, i32* %26, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %33, label %29

; <label>:29:                                     ; preds = %25
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %31 = load i32, i32* %30, align 4
  %32 = icmp sgt i32 %31, 1
  br label %33

; <label>:33:                                     ; preds = %25, %29
  %34 = phi i1 [ false, %25 ], [ %32, %29 ]
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %36 = load i32, i32* %35, align 8
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %33
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %39 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %38, align 8
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %41 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 57
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %43 = getelementptr inbounds i8, i8* %7, i64 192
  %44 = bitcast i8* %43 to [10 x i32]*
  %45 = getelementptr inbounds i8, i8* %7, i64 104
  %46 = bitcast i8* %45 to [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]*
  %47 = getelementptr inbounds i8, i8* %7, i64 104
  %48 = bitcast i8* %47 to [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]*
  %49 = getelementptr inbounds i8, i8* %7, i64 104
  %50 = bitcast i8* %49 to [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]*
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %52 = getelementptr inbounds i8, i8* %7, i64 24
  %53 = bitcast i8* %52 to [10 x i8**]*
  %54 = getelementptr inbounds i8, i8* %7, i64 104
  %55 = bitcast i8* %54 to [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]*
  %56 = getelementptr inbounds i8, i8* %7, i64 104
  %57 = bitcast i8* %56 to [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]*
  %58 = getelementptr inbounds i8, i8* %7, i64 104
  %59 = bitcast i8* %58 to [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]*
  %60 = getelementptr inbounds i8, i8* %7, i64 232
  %61 = getelementptr inbounds i8, i8* %7, i64 242
  %62 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  br label %63

; <label>:63:                                     ; preds = %.lr.ph, %143
  %.0110 = phi %struct.jpeg_component_info* [ %39, %.lr.ph ], [ %144, %143 ]
  %indvars.iv7 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %143 ]
  %64 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0110, i64 0, i32 2
  %65 = load i32, i32* %64, align 8
  %66 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0110, i64 0, i32 9
  %67 = load i32, i32* %66, align 4
  %68 = mul nsw i32 %67, %65
  %69 = load i32, i32* %40, align 4
  %70 = sdiv i32 %68, %69
  %71 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0110, i64 0, i32 3
  %72 = load i32, i32* %71, align 4
  %73 = mul nsw i32 %72, %67
  %74 = sdiv i32 %73, %69
  %75 = load i32, i32* %41, align 4
  %76 = load i32, i32* %42, align 8
  %77 = getelementptr inbounds [10 x i32], [10 x i32]* %44, i64 0, i64 %indvars.iv7
  store i32 %74, i32* %77, align 4
  %78 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0110, i64 0, i32 12
  %79 = load i32, i32* %78, align 8
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %83

; <label>:81:                                     ; preds = %63
  %82 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]* %46, i64 0, i64 %indvars.iv7
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @noop_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %82, align 8
  br label %143

; <label>:83:                                     ; preds = %63
  %84 = icmp eq i32 %70, %75
  %85 = icmp eq i32 %74, %76
  %or.cond = and i1 %84, %85
  br i1 %or.cond, label %86, label %88

; <label>:86:                                     ; preds = %83
  %87 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]* %48, i64 0, i64 %indvars.iv7
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @fullsize_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %87, align 8
  br label %143

; <label>:88:                                     ; preds = %83
  %89 = shl nsw i32 %70, 1
  %90 = icmp eq i32 %89, %75
  %or.cond3 = and i1 %90, %85
  br i1 %or.cond3, label %91, label %98

; <label>:91:                                     ; preds = %88
  br i1 %34, label %92, label %96

; <label>:92:                                     ; preds = %91
  %93 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0110, i64 0, i32 10
  %94 = load i32, i32* %93, align 8
  %95 = icmp ugt i32 %94, 2
  %h2v1_fancy_upsample.h2v1_upsample = select i1 %95, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @h2v1_fancy_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @h2v1_upsample
  br label %96

; <label>:96:                                     ; preds = %92, %91
  %h2v1_upsample.sink = phi void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* [ @h2v1_upsample, %91 ], [ %h2v1_fancy_upsample.h2v1_upsample, %92 ]
  %97 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]* %50, i64 0, i64 %indvars.iv7
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* %h2v1_upsample.sink, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %97, align 8
  br label %130

; <label>:98:                                     ; preds = %88
  %99 = shl nsw i32 %74, 1
  %100 = icmp eq i32 %99, %76
  %or.cond6 = and i1 %90, %100
  br i1 %or.cond6, label %101, label %110

; <label>:101:                                    ; preds = %98
  br i1 %34, label %102, label %108

; <label>:102:                                    ; preds = %101
  %103 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0110, i64 0, i32 10
  %104 = load i32, i32* %103, align 8
  %105 = icmp ugt i32 %104, 2
  br i1 %105, label %106, label %108

; <label>:106:                                    ; preds = %102
  %107 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]* %55, i64 0, i64 %indvars.iv7
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @h2v2_fancy_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %107, align 8
  store i32 1, i32* %14, align 8
  br label %130

; <label>:108:                                    ; preds = %102, %101
  %109 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]* %57, i64 0, i64 %indvars.iv7
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @h2v2_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %109, align 8
  br label %130

; <label>:110:                                    ; preds = %98
  %111 = srem i32 %75, %70
  %112 = icmp eq i32 %111, 0
  br i1 %112, label %113, label %124

; <label>:113:                                    ; preds = %110
  %114 = srem i32 %76, %74
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %116, label %124

; <label>:116:                                    ; preds = %113
  %117 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]* %59, i64 0, i64 %indvars.iv7
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @int_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %117, align 8
  %118 = sdiv i32 %75, %70
  %119 = trunc i32 %118 to i8
  %120 = getelementptr inbounds i8, i8* %60, i64 %indvars.iv7
  store i8 %119, i8* %120, align 1
  %121 = sdiv i32 %76, %74
  %122 = trunc i32 %121 to i8
  %123 = getelementptr inbounds i8, i8* %61, i64 %indvars.iv7
  store i8 %122, i8* %123, align 1
  br label %130

; <label>:124:                                    ; preds = %113, %110
  %125 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %62, align 8
  %126 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %125, i64 0, i32 5
  store i32 37, i32* %126, align 8
  %127 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %62, align 8
  %128 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %127, i64 0, i32 0
  %129 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %128, align 8
  tail call void %129(%struct.jpeg_common_struct* nonnull %6) #4
  br label %130

; <label>:130:                                    ; preds = %108, %106, %124, %116, %96
  %131 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %132 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %131, i64 0, i32 2
  %133 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %132, align 8
  %134 = load i32, i32* %51, align 8
  %135 = zext i32 %134 to i64
  %136 = load i32, i32* %41, align 4
  %137 = sext i32 %136 to i64
  %138 = tail call i64 @jround_up(i64 %135, i64 %137) #4
  %139 = trunc i64 %138 to i32
  %140 = load i32, i32* %42, align 8
  %141 = tail call i8** %133(%struct.jpeg_common_struct* nonnull %6, i32 1, i32 %139, i32 %140) #4
  %142 = getelementptr inbounds [10 x i8**], [10 x i8**]* %53, i64 0, i64 %indvars.iv7
  store i8** %141, i8*** %142, align 8
  br label %143

; <label>:143:                                    ; preds = %81, %86, %130
  %indvars.iv.next = add nuw i64 %indvars.iv7, 1
  %144 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0110, i64 1
  %145 = load i32, i32* %35, align 8
  %146 = sext i32 %145 to i64
  %147 = icmp slt i64 %indvars.iv.next, %146
  br i1 %147, label %63, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %143
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %33
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @start_pass_upsample(%struct.jpeg_decompress_struct* nocapture readonly) #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %3 = bitcast %struct.jpeg_upsampler** %2 to %struct.my_upsampler**
  %4 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %6 = load i32, i32* %5, align 8
  %7 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %4, i64 0, i32 3
  store i32 %6, i32* %7, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %9 = load i32, i32* %8, align 4
  %10 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %4, i64 0, i32 4
  store i32 %9, i32* %10, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @sep_upsample(%struct.jpeg_decompress_struct*, i8*** nocapture readonly, i32* nocapture, i32, i8**, i32* nocapture, i32) #0 {
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %9 = bitcast %struct.jpeg_upsampler** %8 to %struct.my_upsampler**
  %10 = load %struct.my_upsampler*, %struct.my_upsampler** %9, align 8
  %11 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %10, i64 0, i32 3
  %12 = load i32, i32* %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %14 = load i32, i32* %13, align 8
  %15 = icmp slt i32 %12, %14
  br i1 %15, label %37, label %16

; <label>:16:                                     ; preds = %7
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %18 = load i32, i32* %17, align 8
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %16
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %21 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.014 = phi %struct.jpeg_component_info* [ %33, %.lr.ph ], [ %21, %.lr.ph.preheader ]
  %indvars.iv3 = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %22 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %10, i64 0, i32 2, i64 %indvars.iv3
  %23 = load void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %22, align 8
  %24 = getelementptr inbounds i8**, i8*** %1, i64 %indvars.iv3
  %25 = load i8**, i8*** %24, align 8
  %26 = load i32, i32* %2, align 4
  %27 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %10, i64 0, i32 5, i64 %indvars.iv3
  %28 = load i32, i32* %27, align 4
  %29 = mul i32 %28, %26
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i8*, i8** %25, i64 %30
  %32 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %10, i64 0, i32 1, i64 %indvars.iv3
  tail call void %23(%struct.jpeg_decompress_struct* nonnull %0, %struct.jpeg_component_info* %.014, i8** %31, i8*** %32) #4
  %indvars.iv.next = add nuw i64 %indvars.iv3, 1
  %33 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.014, i64 1
  %34 = load i32, i32* %17, align 8
  %35 = sext i32 %34 to i64
  %36 = icmp slt i64 %indvars.iv.next, %35
  br i1 %36, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %16
  store i32 0, i32* %11, align 8
  br label %37

; <label>:37:                                     ; preds = %7, %._crit_edge
  %38 = load i32, i32* %13, align 8
  %39 = load i32, i32* %11, align 8
  %40 = sub nsw i32 %38, %39
  %41 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %10, i64 0, i32 4
  %42 = load i32, i32* %41, align 4
  %43 = icmp ugt i32 %40, %42
  %. = select i1 %43, i32 %42, i32 %40
  %44 = load i32, i32* %5, align 4
  %45 = sub i32 %6, %44
  %46 = icmp ugt i32 %., %45
  %..0 = select i1 %46, i32 %45, i32 %.
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 82
  %48 = load %struct.jpeg_color_deconverter*, %struct.jpeg_color_deconverter** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_color_deconverter, %struct.jpeg_color_deconverter* %48, i64 0, i32 1
  %50 = load void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %49, align 8
  %51 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %10, i64 0, i32 1, i64 0
  %52 = load i32, i32* %11, align 8
  %53 = zext i32 %44 to i64
  %54 = getelementptr inbounds i8*, i8** %4, i64 %53
  tail call void %50(%struct.jpeg_decompress_struct* nonnull %0, i8*** %51, i32 %52, i8** %54, i32 %..0) #4
  %55 = load i32, i32* %5, align 4
  %56 = add i32 %55, %..0
  store i32 %56, i32* %5, align 4
  %57 = load i32, i32* %41, align 4
  %58 = sub i32 %57, %..0
  store i32 %58, i32* %41, align 4
  %59 = load i32, i32* %11, align 8
  %60 = add i32 %59, %..0
  store i32 %60, i32* %11, align 8
  %61 = load i32, i32* %13, align 8
  %62 = icmp slt i32 %60, %61
  br i1 %62, label %66, label %63

; <label>:63:                                     ; preds = %37
  %64 = load i32, i32* %2, align 4
  %65 = add i32 %64, 1
  store i32 %65, i32* %2, align 4
  br label %66

; <label>:66:                                     ; preds = %37, %63
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @noop_upsample(%struct.jpeg_decompress_struct* nocapture readnone, %struct.jpeg_component_info* nocapture readnone, i8** nocapture readnone, i8*** nocapture) #1 {
  store i8** null, i8*** %3, align 8
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @fullsize_upsample(%struct.jpeg_decompress_struct* nocapture readnone, %struct.jpeg_component_info* nocapture readnone, i8**, i8*** nocapture) #1 {
  store i8** %2, i8*** %3, align 8
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @h2v1_fancy_upsample(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i8** nocapture readonly, i8*** nocapture readonly) #1 {
  %5 = load i8**, i8*** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %7 = load i32, i32* %6, align 8
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %.lr.ph14, label %._crit_edge15

.lr.ph14:                                         ; preds = %4
  %9 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 10
  br label %10

; <label>:10:                                     ; preds = %.lr.ph14, %._crit_edge
  %indvars.iv12 = phi i64 [ 0, %.lr.ph14 ], [ %indvars.iv.next, %._crit_edge ]
  %11 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv12
  %12 = load i8*, i8** %11, align 8
  %13 = getelementptr inbounds i8*, i8** %5, i64 %indvars.iv12
  %14 = load i8*, i8** %13, align 8
  %15 = getelementptr inbounds i8, i8* %12, i64 1
  %16 = load i8, i8* %12, align 1
  %17 = zext i8 %16 to i32
  %18 = getelementptr inbounds i8, i8* %14, i64 1
  store i8 %16, i8* %14, align 1
  %19 = mul nuw nsw i32 %17, 3
  %20 = load i8, i8* %15, align 1
  %21 = zext i8 %20 to i32
  %22 = add nuw nsw i32 %19, 2
  %23 = add nuw nsw i32 %22, %21
  %24 = lshr i32 %23, 2
  %25 = trunc i32 %24 to i8
  store i8 %25, i8* %18, align 1
  %26 = load i32, i32* %9, align 8
  %27 = add i32 %26, -2
  %scevgep = getelementptr i8, i8* %12, i64 1
  %28 = zext i32 %27 to i64
  %scevgep4 = getelementptr i8, i8* %scevgep, i64 %28
  %29 = shl nuw nsw i64 %28, 1
  %30 = icmp eq i32 %27, 0
  br i1 %30, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %10
  %31 = add i32 %26, -3
  %32 = zext i32 %31 to i64
  %33 = add nuw nsw i64 %32, 1
  %min.iters.check = icmp ult i64 %33, 16
  br i1 %min.iters.check, label %.lr.ph.preheader28, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.preheader
  %n.vec = and i64 %33, 8589934576
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph.preheader28, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep16 = getelementptr i8, i8* %14, i64 2
  %scevgep17 = getelementptr i8, i8* %14, i64 4
  %34 = add i32 %26, -3
  %35 = zext i32 %34 to i64
  %36 = shl nuw nsw i64 %35, 1
  %scevgep18 = getelementptr i8, i8* %scevgep17, i64 %36
  %scevgep19 = getelementptr i8, i8* %12, i64 3
  %scevgep20 = getelementptr i8, i8* %scevgep19, i64 %35
  %bound0 = icmp ult i8* %scevgep16, %scevgep20
  %bound1 = icmp ult i8* %12, %scevgep18
  %memcheck.conflict = and i1 %bound0, %bound1
  %37 = shl nuw nsw i64 %n.vec, 1
  %ind.end = getelementptr i8, i8* %14, i64 %37
  %cast.crd = trunc i64 %n.vec to i32
  %ind.end22 = sub i32 %27, %cast.crd
  %ind.end24 = getelementptr i8, i8* %15, i64 %n.vec
  br i1 %memcheck.conflict, label %.lr.ph.preheader28, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %38 = shl i64 %index, 1
  %next.gep = getelementptr i8, i8* %14, i64 %38
  %next.gep25 = getelementptr i8, i8* %15, i64 %index
  %39 = getelementptr inbounds i8, i8* %next.gep25, i64 1
  %40 = bitcast i8* %next.gep25 to <16 x i8>*
  %wide.load = load <16 x i8>, <16 x i8>* %40, align 1, !alias.scope !1
  %41 = zext <16 x i8> %wide.load to <16 x i32>
  %42 = mul nuw nsw <16 x i32> %41, <i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3>
  %43 = getelementptr inbounds i8, i8* %next.gep25, i64 -1
  %44 = bitcast i8* %43 to <16 x i8>*
  %wide.load26 = load <16 x i8>, <16 x i8>* %44, align 1, !alias.scope !1
  %45 = zext <16 x i8> %wide.load26 to <16 x i32>
  %46 = add nuw nsw <16 x i32> %45, <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %47 = add nuw nsw <16 x i32> %46, %42
  %48 = lshr <16 x i32> %47, <i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2>
  %49 = trunc <16 x i32> %48 to <16 x i8>
  %50 = getelementptr inbounds i8, i8* %next.gep, i64 3
  %51 = bitcast i8* %39 to <16 x i8>*
  %wide.load27 = load <16 x i8>, <16 x i8>* %51, align 1, !alias.scope !1
  %52 = zext <16 x i8> %wide.load27 to <16 x i32>
  %53 = add nuw nsw <16 x i32> %42, <i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2>
  %54 = add nuw nsw <16 x i32> %53, %52
  %55 = lshr <16 x i32> %54, <i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2>
  %56 = trunc <16 x i32> %55 to <16 x i8>
  %57 = getelementptr i8, i8* %50, i64 -1
  %58 = bitcast i8* %57 to <32 x i8>*
  %interleaved.vec = shufflevector <16 x i8> %49, <16 x i8> %56, <32 x i32> <i32 0, i32 16, i32 1, i32 17, i32 2, i32 18, i32 3, i32 19, i32 4, i32 20, i32 5, i32 21, i32 6, i32 22, i32 7, i32 23, i32 8, i32 24, i32 9, i32 25, i32 10, i32 26, i32 11, i32 27, i32 12, i32 28, i32 13, i32 29, i32 14, i32 30, i32 15, i32 31>
  store <32 x i8> %interleaved.vec, <32 x i8>* %58, align 1, !alias.scope !4, !noalias !1
  %index.next = add i64 %index, 16
  %59 = icmp eq i64 %index.next, %n.vec
  br i1 %59, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %33, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph.preheader28

.lr.ph.preheader28:                               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph.preheader
  %.0211.pn.ph = phi i8* [ %14, %vector.memcheck ], [ %14, %min.iters.checked ], [ %14, %.lr.ph.preheader ], [ %ind.end, %middle.block ]
  %.0110.ph = phi i32 [ %27, %vector.memcheck ], [ %27, %min.iters.checked ], [ %27, %.lr.ph.preheader ], [ %ind.end22, %middle.block ]
  %.038.ph = phi i8* [ %15, %vector.memcheck ], [ %15, %min.iters.checked ], [ %15, %.lr.ph.preheader ], [ %ind.end24, %middle.block ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader28, %.lr.ph
  %.0211.pn = phi i8* [ %.0211, %.lr.ph ], [ %.0211.pn.ph, %.lr.ph.preheader28 ]
  %.0110 = phi i32 [ %78, %.lr.ph ], [ %.0110.ph, %.lr.ph.preheader28 ]
  %.038 = phi i8* [ %60, %.lr.ph ], [ %.038.ph, %.lr.ph.preheader28 ]
  %.0211 = getelementptr inbounds i8, i8* %.0211.pn, i64 2
  %60 = getelementptr inbounds i8, i8* %.038, i64 1
  %61 = load i8, i8* %.038, align 1
  %62 = zext i8 %61 to i32
  %63 = mul nuw nsw i32 %62, 3
  %64 = getelementptr inbounds i8, i8* %.038, i64 -1
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = add nuw nsw i32 %66, 1
  %68 = add nuw nsw i32 %67, %63
  %69 = lshr i32 %68, 2
  %70 = trunc i32 %69 to i8
  %71 = getelementptr inbounds i8, i8* %.0211.pn, i64 3
  store i8 %70, i8* %.0211, align 1
  %72 = load i8, i8* %60, align 1
  %73 = zext i8 %72 to i32
  %74 = add nuw nsw i32 %63, 2
  %75 = add nuw nsw i32 %74, %73
  %76 = lshr i32 %75, 2
  %77 = trunc i32 %76 to i8
  store i8 %77, i8* %71, align 1
  %78 = add i32 %.0110, -1
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %._crit_edge.loopexit, label %.lr.ph, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %10
  %scevgep5 = getelementptr i8, i8* %14, i64 2
  %scevgep6 = getelementptr i8, i8* %scevgep5, i64 %29
  %80 = load i8, i8* %scevgep4, align 1
  %81 = zext i8 %80 to i32
  %82 = mul nuw nsw i32 %81, 3
  %83 = getelementptr inbounds i8, i8* %scevgep4, i64 -1
  %84 = load i8, i8* %83, align 1
  %85 = zext i8 %84 to i32
  %86 = add nuw nsw i32 %85, 1
  %87 = add nuw nsw i32 %86, %82
  %88 = lshr i32 %87, 2
  %89 = trunc i32 %88 to i8
  %90 = getelementptr inbounds i8, i8* %scevgep6, i64 1
  store i8 %89, i8* %scevgep6, align 1
  store i8 %80, i8* %90, align 1
  %indvars.iv.next = add nuw i64 %indvars.iv12, 1
  %91 = load i32, i32* %6, align 8
  %92 = sext i32 %91 to i64
  %93 = icmp slt i64 %indvars.iv.next, %92
  br i1 %93, label %10, label %._crit_edge15.loopexit

._crit_edge15.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @h2v1_upsample(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readnone, i8** nocapture readonly, i8*** nocapture readonly) #1 {
  %5 = load i8**, i8*** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %7 = load i32, i32* %6, align 8
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %.lr.ph7, label %._crit_edge8

.lr.ph7:                                          ; preds = %4
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  br label %10

; <label>:10:                                     ; preds = %.lr.ph7, %._crit_edge
  %indvars.iv5 = phi i64 [ 0, %.lr.ph7 ], [ %indvars.iv.next, %._crit_edge ]
  %11 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv5
  %12 = load i8*, i8** %11, align 8
  %13 = getelementptr inbounds i8*, i8** %5, i64 %indvars.iv5
  %14 = load i8*, i8** %13, align 8
  %15 = load i32, i32* %9, align 8
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds i8, i8* %14, i64 %16
  %18 = icmp eq i32 %15, 0
  br i1 %18, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %10
  %19 = ptrtoint i8* %14 to i64
  %scevgep = getelementptr i8, i8* %14, i64 2
  %20 = icmp ugt i8* %17, %scevgep
  %umax = select i1 %20, i8* %17, i8* %scevgep
  %scevgep9 = getelementptr i8, i8* %umax, i64 -1
  %21 = sub i64 0, %19
  %scevgep10 = getelementptr i8, i8* %scevgep9, i64 %21
  %scevgep1011 = ptrtoint i8* %scevgep10 to i64
  %22 = lshr i64 %scevgep1011, 1
  %23 = add nuw i64 %22, 1
  %xtraiter = and i64 %23, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.014.prol = phi i8* [ %27, %.lr.ph.prol ], [ %14, %.lr.ph.prol.preheader ]
  %.023.prol = phi i8* [ %24, %.lr.ph.prol ], [ %12, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %24 = getelementptr inbounds i8, i8* %.023.prol, i64 1
  %25 = load i8, i8* %.023.prol, align 1
  %26 = getelementptr inbounds i8, i8* %.014.prol, i64 1
  store i8 %25, i8* %.014.prol, align 1
  %27 = getelementptr inbounds i8, i8* %.014.prol, i64 2
  store i8 %25, i8* %26, align 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !10

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.014.unr = phi i8* [ %14, %.lr.ph.preheader ], [ %27, %.lr.ph.prol.loopexit.loopexit ]
  %.023.unr = phi i8* [ %12, %.lr.ph.preheader ], [ %24, %.lr.ph.prol.loopexit.loopexit ]
  %28 = icmp ult i8* %scevgep10, inttoptr (i64 14 to i8*)
  br i1 %28, label %._crit_edge, label %.lr.ph.preheader16

.lr.ph.preheader16:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader16, %.lr.ph
  %.014 = phi i8* [ %60, %.lr.ph ], [ %.014.unr, %.lr.ph.preheader16 ]
  %.023 = phi i8* [ %57, %.lr.ph ], [ %.023.unr, %.lr.ph.preheader16 ]
  %29 = getelementptr inbounds i8, i8* %.023, i64 1
  %30 = load i8, i8* %.023, align 1
  %31 = getelementptr inbounds i8, i8* %.014, i64 1
  store i8 %30, i8* %.014, align 1
  %32 = getelementptr inbounds i8, i8* %.014, i64 2
  store i8 %30, i8* %31, align 1
  %33 = getelementptr inbounds i8, i8* %.023, i64 2
  %34 = load i8, i8* %29, align 1
  %35 = getelementptr inbounds i8, i8* %.014, i64 3
  store i8 %34, i8* %32, align 1
  %36 = getelementptr inbounds i8, i8* %.014, i64 4
  store i8 %34, i8* %35, align 1
  %37 = getelementptr inbounds i8, i8* %.023, i64 3
  %38 = load i8, i8* %33, align 1
  %39 = getelementptr inbounds i8, i8* %.014, i64 5
  store i8 %38, i8* %36, align 1
  %40 = getelementptr inbounds i8, i8* %.014, i64 6
  store i8 %38, i8* %39, align 1
  %41 = getelementptr inbounds i8, i8* %.023, i64 4
  %42 = load i8, i8* %37, align 1
  %43 = getelementptr inbounds i8, i8* %.014, i64 7
  store i8 %42, i8* %40, align 1
  %44 = getelementptr inbounds i8, i8* %.014, i64 8
  store i8 %42, i8* %43, align 1
  %45 = getelementptr inbounds i8, i8* %.023, i64 5
  %46 = load i8, i8* %41, align 1
  %47 = getelementptr inbounds i8, i8* %.014, i64 9
  store i8 %46, i8* %44, align 1
  %48 = getelementptr inbounds i8, i8* %.014, i64 10
  store i8 %46, i8* %47, align 1
  %49 = getelementptr inbounds i8, i8* %.023, i64 6
  %50 = load i8, i8* %45, align 1
  %51 = getelementptr inbounds i8, i8* %.014, i64 11
  store i8 %50, i8* %48, align 1
  %52 = getelementptr inbounds i8, i8* %.014, i64 12
  store i8 %50, i8* %51, align 1
  %53 = getelementptr inbounds i8, i8* %.023, i64 7
  %54 = load i8, i8* %49, align 1
  %55 = getelementptr inbounds i8, i8* %.014, i64 13
  store i8 %54, i8* %52, align 1
  %56 = getelementptr inbounds i8, i8* %.014, i64 14
  store i8 %54, i8* %55, align 1
  %57 = getelementptr inbounds i8, i8* %.023, i64 8
  %58 = load i8, i8* %53, align 1
  %59 = getelementptr inbounds i8, i8* %.014, i64 15
  store i8 %58, i8* %56, align 1
  %60 = getelementptr inbounds i8, i8* %.014, i64 16
  store i8 %58, i8* %59, align 1
  %61 = icmp ult i8* %60, %17
  br i1 %61, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %10
  %indvars.iv.next = add nuw i64 %indvars.iv5, 1
  %62 = load i32, i32* %6, align 8
  %63 = sext i32 %62 to i64
  %64 = icmp slt i64 %indvars.iv.next, %63
  br i1 %64, label %10, label %._crit_edge8.loopexit

._crit_edge8.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @h2v2_fancy_upsample(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i8** nocapture readonly, i8*** nocapture readonly) #1 {
  %5 = load i8**, i8*** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %7 = load i32, i32* %6, align 8
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %.lr.ph28, label %._crit_edge29

.lr.ph28:                                         ; preds = %4
  %9 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 10
  br label %10

; <label>:10:                                     ; preds = %._crit_edge.1, %.lr.ph28
  %.0126 = phi i32 [ 0, %.lr.ph28 ], [ %145, %._crit_edge.1 ]
  %indvars.iv1125 = phi i64 [ 0, %.lr.ph28 ], [ %indvars.iv.next12, %._crit_edge.1 ]
  %11 = sext i32 %.0126 to i64
  %12 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv1125
  %13 = load i8*, i8** %12, align 8
  %.sink13 = add i64 %indvars.iv1125, -1
  %14 = getelementptr inbounds i8*, i8** %2, i64 %.sink13
  %15 = load i8*, i8** %14, align 8
  %16 = getelementptr inbounds i8*, i8** %5, i64 %11
  %17 = load i8*, i8** %16, align 8
  %18 = getelementptr inbounds i8, i8* %13, i64 1
  %19 = load i8, i8* %13, align 1
  %20 = zext i8 %19 to i32
  %21 = mul nuw nsw i32 %20, 3
  %22 = getelementptr inbounds i8, i8* %15, i64 1
  %23 = load i8, i8* %15, align 1
  %24 = zext i8 %23 to i32
  %25 = add nuw nsw i32 %21, %24
  %26 = load i8, i8* %18, align 1
  %27 = zext i8 %26 to i32
  %28 = mul nuw nsw i32 %27, 3
  %29 = load i8, i8* %22, align 1
  %30 = zext i8 %29 to i32
  %31 = add nuw nsw i32 %28, %30
  %32 = shl nuw nsw i32 %25, 2
  %33 = add nuw nsw i32 %32, 8
  %34 = lshr i32 %33, 4
  %35 = trunc i32 %34 to i8
  %36 = getelementptr inbounds i8, i8* %17, i64 1
  store i8 %35, i8* %17, align 1
  %37 = mul nuw nsw i32 %25, 3
  %38 = add nuw nsw i32 %37, 7
  %39 = add nuw nsw i32 %38, %31
  %40 = lshr i32 %39, 4
  %41 = trunc i32 %40 to i8
  store i8 %41, i8* %36, align 1
  %42 = load i32, i32* %9, align 8
  %43 = add i32 %42, -2
  %44 = zext i32 %43 to i64
  %45 = shl nuw nsw i64 %44, 1
  %46 = icmp eq i32 %43, 0
  br i1 %46, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %10
  %47 = getelementptr inbounds i8, i8* %15, i64 2
  %48 = getelementptr inbounds i8, i8* %13, i64 2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.0721.pn = phi i8* [ %.0721, %.lr.ph ], [ %17, %.lr.ph.preheader ]
  %.0320 = phi i32 [ %67, %.lr.ph ], [ %43, %.lr.ph.preheader ]
  %.0419 = phi i8* [ %49, %.lr.ph ], [ %48, %.lr.ph.preheader ]
  %.1618 = phi i8* [ %53, %.lr.ph ], [ %47, %.lr.ph.preheader ]
  %.0816 = phi i32 [ %56, %.lr.ph ], [ %31, %.lr.ph.preheader ]
  %.0915 = phi i32 [ %.0816, %.lr.ph ], [ %25, %.lr.ph.preheader ]
  %.0721 = getelementptr inbounds i8, i8* %.0721.pn, i64 2
  %49 = getelementptr inbounds i8, i8* %.0419, i64 1
  %50 = load i8, i8* %.0419, align 1
  %51 = zext i8 %50 to i32
  %52 = mul nuw nsw i32 %51, 3
  %53 = getelementptr inbounds i8, i8* %.1618, i64 1
  %54 = load i8, i8* %.1618, align 1
  %55 = zext i8 %54 to i32
  %56 = add nuw nsw i32 %52, %55
  %57 = mul nsw i32 %.0816, 3
  %58 = add nsw i32 %.0915, 8
  %59 = add i32 %58, %57
  %60 = lshr i32 %59, 4
  %61 = trunc i32 %60 to i8
  %62 = getelementptr inbounds i8, i8* %.0721.pn, i64 3
  store i8 %61, i8* %.0721, align 1
  %63 = add i32 %57, 7
  %64 = add i32 %63, %56
  %65 = lshr i32 %64, 4
  %66 = trunc i32 %65 to i8
  store i8 %66, i8* %62, align 1
  %67 = add i32 %.0320, -1
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %10
  %.09.lcssa = phi i32 [ %25, %10 ], [ %.0816, %._crit_edge.loopexit ]
  %.08.lcssa = phi i32 [ %31, %10 ], [ %56, %._crit_edge.loopexit ]
  %indvars.iv.next = or i64 %11, 1
  %scevgep = getelementptr i8, i8* %17, i64 2
  %scevgep10 = getelementptr i8, i8* %scevgep, i64 %45
  %69 = mul nsw i32 %.08.lcssa, 3
  %70 = add nsw i32 %.09.lcssa, 8
  %71 = add i32 %70, %69
  %72 = lshr i32 %71, 4
  %73 = trunc i32 %72 to i8
  %74 = getelementptr inbounds i8, i8* %scevgep10, i64 1
  store i8 %73, i8* %scevgep10, align 1
  %75 = shl nsw i32 %.08.lcssa, 2
  %76 = add nsw i32 %75, 7
  %77 = lshr i32 %76, 4
  %78 = trunc i32 %77 to i8
  store i8 %78, i8* %74, align 1
  %79 = load i8*, i8** %12, align 8
  %.sink13.1 = add i64 %indvars.iv1125, 1
  %80 = getelementptr inbounds i8*, i8** %2, i64 %.sink13.1
  %81 = load i8*, i8** %80, align 8
  %82 = getelementptr inbounds i8*, i8** %5, i64 %indvars.iv.next
  %83 = load i8*, i8** %82, align 8
  %84 = getelementptr inbounds i8, i8* %79, i64 1
  %85 = load i8, i8* %79, align 1
  %86 = zext i8 %85 to i32
  %87 = mul nuw nsw i32 %86, 3
  %88 = getelementptr inbounds i8, i8* %81, i64 1
  %89 = load i8, i8* %81, align 1
  %90 = zext i8 %89 to i32
  %91 = add nuw nsw i32 %87, %90
  %92 = load i8, i8* %84, align 1
  %93 = zext i8 %92 to i32
  %94 = mul nuw nsw i32 %93, 3
  %95 = load i8, i8* %88, align 1
  %96 = zext i8 %95 to i32
  %97 = add nuw nsw i32 %94, %96
  %98 = shl nuw nsw i32 %91, 2
  %99 = add nuw nsw i32 %98, 8
  %100 = lshr i32 %99, 4
  %101 = trunc i32 %100 to i8
  %102 = getelementptr inbounds i8, i8* %83, i64 1
  store i8 %101, i8* %83, align 1
  %103 = mul nuw nsw i32 %91, 3
  %104 = add nuw nsw i32 %103, 7
  %105 = add nuw nsw i32 %104, %97
  %106 = lshr i32 %105, 4
  %107 = trunc i32 %106 to i8
  store i8 %107, i8* %102, align 1
  %108 = load i32, i32* %9, align 8
  %109 = add i32 %108, -2
  %110 = zext i32 %109 to i64
  %111 = shl nuw nsw i64 %110, 1
  %112 = icmp eq i32 %109, 0
  br i1 %112, label %._crit_edge.1, label %.lr.ph.preheader.1

._crit_edge29.loopexit:                           ; preds = %._crit_edge.1
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %4
  ret void

.lr.ph.preheader.1:                               ; preds = %._crit_edge
  %113 = getelementptr inbounds i8, i8* %81, i64 2
  %114 = getelementptr inbounds i8, i8* %79, i64 2
  br label %.lr.ph.1

.lr.ph.1:                                         ; preds = %.lr.ph.1, %.lr.ph.preheader.1
  %.0721.pn.1 = phi i8* [ %.0721.1, %.lr.ph.1 ], [ %83, %.lr.ph.preheader.1 ]
  %.0320.1 = phi i32 [ %133, %.lr.ph.1 ], [ %109, %.lr.ph.preheader.1 ]
  %.0419.1 = phi i8* [ %115, %.lr.ph.1 ], [ %114, %.lr.ph.preheader.1 ]
  %.1618.1 = phi i8* [ %119, %.lr.ph.1 ], [ %113, %.lr.ph.preheader.1 ]
  %.0816.1 = phi i32 [ %122, %.lr.ph.1 ], [ %97, %.lr.ph.preheader.1 ]
  %.0915.1 = phi i32 [ %.0816.1, %.lr.ph.1 ], [ %91, %.lr.ph.preheader.1 ]
  %.0721.1 = getelementptr inbounds i8, i8* %.0721.pn.1, i64 2
  %115 = getelementptr inbounds i8, i8* %.0419.1, i64 1
  %116 = load i8, i8* %.0419.1, align 1
  %117 = zext i8 %116 to i32
  %118 = mul nuw nsw i32 %117, 3
  %119 = getelementptr inbounds i8, i8* %.1618.1, i64 1
  %120 = load i8, i8* %.1618.1, align 1
  %121 = zext i8 %120 to i32
  %122 = add nuw nsw i32 %118, %121
  %123 = mul nsw i32 %.0816.1, 3
  %124 = add nsw i32 %.0915.1, 8
  %125 = add i32 %124, %123
  %126 = lshr i32 %125, 4
  %127 = trunc i32 %126 to i8
  %128 = getelementptr inbounds i8, i8* %.0721.pn.1, i64 3
  store i8 %127, i8* %.0721.1, align 1
  %129 = add i32 %123, 7
  %130 = add i32 %129, %122
  %131 = lshr i32 %130, 4
  %132 = trunc i32 %131 to i8
  store i8 %132, i8* %128, align 1
  %133 = add i32 %.0320.1, -1
  %134 = icmp eq i32 %133, 0
  br i1 %134, label %._crit_edge.1.loopexit, label %.lr.ph.1

._crit_edge.1.loopexit:                           ; preds = %.lr.ph.1
  br label %._crit_edge.1

._crit_edge.1:                                    ; preds = %._crit_edge.1.loopexit, %._crit_edge
  %.09.lcssa.1 = phi i32 [ %91, %._crit_edge ], [ %.0816.1, %._crit_edge.1.loopexit ]
  %.08.lcssa.1 = phi i32 [ %97, %._crit_edge ], [ %122, %._crit_edge.1.loopexit ]
  %scevgep.1 = getelementptr i8, i8* %83, i64 2
  %scevgep10.1 = getelementptr i8, i8* %scevgep.1, i64 %111
  %135 = mul nsw i32 %.08.lcssa.1, 3
  %136 = add nsw i32 %.09.lcssa.1, 8
  %137 = add i32 %136, %135
  %138 = lshr i32 %137, 4
  %139 = trunc i32 %138 to i8
  %140 = getelementptr inbounds i8, i8* %scevgep10.1, i64 1
  store i8 %139, i8* %scevgep10.1, align 1
  %141 = shl nsw i32 %.08.lcssa.1, 2
  %142 = add nsw i32 %141, 7
  %143 = lshr i32 %142, 4
  %144 = trunc i32 %143 to i8
  store i8 %144, i8* %140, align 1
  %145 = add i32 %.0126, 2
  %indvars.iv.next12 = add nuw i64 %indvars.iv1125, 1
  %146 = load i32, i32* %6, align 8
  %147 = icmp slt i32 %145, %146
  br i1 %147, label %10, label %._crit_edge29.loopexit
}

; Function Attrs: noinline nounwind uwtable
define internal void @h2v2_upsample(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readnone, i8** nocapture readonly, i8*** nocapture readonly) #0 {
  %5 = load i8**, i8*** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %7 = load i32, i32* %6, align 8
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %.lr.ph12, label %._crit_edge13

.lr.ph12:                                         ; preds = %4
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  br label %10

; <label>:10:                                     ; preds = %.lr.ph12, %._crit_edge
  %.010 = phi i32 [ 0, %.lr.ph12 ], [ %65, %._crit_edge ]
  %indvars.iv9 = phi i64 [ 0, %.lr.ph12 ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv48 = phi i64 [ 0, %.lr.ph12 ], [ %indvars.iv.next5, %._crit_edge ]
  %11 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv9
  %12 = load i8*, i8** %11, align 8
  %13 = getelementptr inbounds i8*, i8** %5, i64 %indvars.iv48
  %14 = load i8*, i8** %13, align 8
  %15 = load i32, i32* %9, align 8
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds i8, i8* %14, i64 %16
  %18 = icmp eq i32 %15, 0
  br i1 %18, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %10
  %19 = ptrtoint i8* %14 to i64
  %scevgep = getelementptr i8, i8* %14, i64 2
  %20 = icmp ugt i8* %17, %scevgep
  %umax = select i1 %20, i8* %17, i8* %scevgep
  %scevgep14 = getelementptr i8, i8* %umax, i64 -1
  %21 = sub i64 0, %19
  %scevgep15 = getelementptr i8, i8* %scevgep14, i64 %21
  %scevgep1516 = ptrtoint i8* %scevgep15 to i64
  %22 = lshr i64 %scevgep1516, 1
  %23 = add nuw i64 %22, 1
  %xtraiter = and i64 %23, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.027.prol = phi i8* [ %27, %.lr.ph.prol ], [ %14, %.lr.ph.prol.preheader ]
  %.036.prol = phi i8* [ %24, %.lr.ph.prol ], [ %12, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %24 = getelementptr inbounds i8, i8* %.036.prol, i64 1
  %25 = load i8, i8* %.036.prol, align 1
  %26 = getelementptr inbounds i8, i8* %.027.prol, i64 1
  store i8 %25, i8* %.027.prol, align 1
  %27 = getelementptr inbounds i8, i8* %.027.prol, i64 2
  store i8 %25, i8* %26, align 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !12

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.027.unr = phi i8* [ %14, %.lr.ph.preheader ], [ %27, %.lr.ph.prol.loopexit.loopexit ]
  %.036.unr = phi i8* [ %12, %.lr.ph.preheader ], [ %24, %.lr.ph.prol.loopexit.loopexit ]
  %28 = icmp ult i8* %scevgep15, inttoptr (i64 14 to i8*)
  br i1 %28, label %._crit_edge, label %.lr.ph.preheader21

.lr.ph.preheader21:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader21, %.lr.ph
  %.027 = phi i8* [ %60, %.lr.ph ], [ %.027.unr, %.lr.ph.preheader21 ]
  %.036 = phi i8* [ %57, %.lr.ph ], [ %.036.unr, %.lr.ph.preheader21 ]
  %29 = getelementptr inbounds i8, i8* %.036, i64 1
  %30 = load i8, i8* %.036, align 1
  %31 = getelementptr inbounds i8, i8* %.027, i64 1
  store i8 %30, i8* %.027, align 1
  %32 = getelementptr inbounds i8, i8* %.027, i64 2
  store i8 %30, i8* %31, align 1
  %33 = getelementptr inbounds i8, i8* %.036, i64 2
  %34 = load i8, i8* %29, align 1
  %35 = getelementptr inbounds i8, i8* %.027, i64 3
  store i8 %34, i8* %32, align 1
  %36 = getelementptr inbounds i8, i8* %.027, i64 4
  store i8 %34, i8* %35, align 1
  %37 = getelementptr inbounds i8, i8* %.036, i64 3
  %38 = load i8, i8* %33, align 1
  %39 = getelementptr inbounds i8, i8* %.027, i64 5
  store i8 %38, i8* %36, align 1
  %40 = getelementptr inbounds i8, i8* %.027, i64 6
  store i8 %38, i8* %39, align 1
  %41 = getelementptr inbounds i8, i8* %.036, i64 4
  %42 = load i8, i8* %37, align 1
  %43 = getelementptr inbounds i8, i8* %.027, i64 7
  store i8 %42, i8* %40, align 1
  %44 = getelementptr inbounds i8, i8* %.027, i64 8
  store i8 %42, i8* %43, align 1
  %45 = getelementptr inbounds i8, i8* %.036, i64 5
  %46 = load i8, i8* %41, align 1
  %47 = getelementptr inbounds i8, i8* %.027, i64 9
  store i8 %46, i8* %44, align 1
  %48 = getelementptr inbounds i8, i8* %.027, i64 10
  store i8 %46, i8* %47, align 1
  %49 = getelementptr inbounds i8, i8* %.036, i64 6
  %50 = load i8, i8* %45, align 1
  %51 = getelementptr inbounds i8, i8* %.027, i64 11
  store i8 %50, i8* %48, align 1
  %52 = getelementptr inbounds i8, i8* %.027, i64 12
  store i8 %50, i8* %51, align 1
  %53 = getelementptr inbounds i8, i8* %.036, i64 7
  %54 = load i8, i8* %49, align 1
  %55 = getelementptr inbounds i8, i8* %.027, i64 13
  store i8 %54, i8* %52, align 1
  %56 = getelementptr inbounds i8, i8* %.027, i64 14
  store i8 %54, i8* %55, align 1
  %57 = getelementptr inbounds i8, i8* %.036, i64 8
  %58 = load i8, i8* %53, align 1
  %59 = getelementptr inbounds i8, i8* %.027, i64 15
  store i8 %58, i8* %56, align 1
  %60 = getelementptr inbounds i8, i8* %.027, i64 16
  store i8 %58, i8* %59, align 1
  %61 = icmp ult i8* %60, %17
  br i1 %61, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %10
  %62 = or i32 %.010, 1
  %63 = load i32, i32* %9, align 8
  %64 = trunc i64 %indvars.iv48 to i32
  tail call void @jcopy_sample_rows(i8** %5, i32 %64, i8** %5, i32 %62, i32 1, i32 %63) #4
  %indvars.iv.next = add nuw i64 %indvars.iv9, 1
  %indvars.iv.next5 = add nuw i64 %indvars.iv48, 2
  %65 = add nuw nsw i32 %.010, 2
  %66 = load i32, i32* %6, align 8
  %67 = sext i32 %66 to i64
  %68 = icmp slt i64 %indvars.iv.next5, %67
  br i1 %68, label %10, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @int_upsample(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i8** nocapture readonly, i8*** nocapture readonly) #0 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %6 = bitcast %struct.jpeg_upsampler** %5 to %struct.my_upsampler**
  %7 = load %struct.my_upsampler*, %struct.my_upsampler** %6, align 8
  %8 = load i8**, i8*** %3, align 8
  %9 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 1
  %10 = load i32, i32* %9, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %7, i64 0, i32 6, i64 %11
  %13 = load i8, i8* %12, align 1
  %14 = zext i8 %13 to i32
  %15 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %7, i64 0, i32 7, i64 %11
  %16 = load i8, i8* %15, align 1
  %17 = zext i8 %16 to i32
  %18 = zext i8 %13 to i64
  %19 = zext i8 %16 to i64
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %21 = load i32, i32* %20, align 8
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %4
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %24 = icmp ne i8 %13, 0
  %25 = icmp ugt i8 %16, 1
  %26 = add nsw i32 %17, -1
  br i1 %25, label %.lr.ph18.split.us.preheader, label %.lr.ph18.split

.lr.ph18.split.us.preheader:                      ; preds = %.lr.ph18
  %27 = xor i32 %14, -1
  %28 = icmp eq i8 %13, 0
  %smax = select i1 %28, i32 %27, i32 -2
  %29 = add nsw i32 %smax, %14
  %30 = add nsw i32 %29, 1
  %31 = zext i32 %30 to i64
  %32 = add nuw nsw i64 %31, 1
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %.lr.ph18.split.us.preheader, %._crit_edge13.us
  %.016.us = phi i32 [ %42, %._crit_edge13.us ], [ 0, %.lr.ph18.split.us.preheader ]
  %indvars.iv15.us = phi i64 [ %indvars.iv.next.us, %._crit_edge13.us ], [ 0, %.lr.ph18.split.us.preheader ]
  %indvars.iv514.us = phi i64 [ %indvars.iv.next6.us, %._crit_edge13.us ], [ 0, %.lr.ph18.split.us.preheader ]
  %33 = getelementptr inbounds i8*, i8** %8, i64 %indvars.iv514.us
  %34 = load i8*, i8** %33, align 8
  %35 = load i32, i32* %23, align 8
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8* %34, i64 %36
  %38 = icmp eq i32 %35, 0
  br i1 %38, label %._crit_edge13.us, label %.lr.ph12.us

._crit_edge13.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge13.us

._crit_edge13.us.loopexit69:                      ; preds = %.lr.ph12..lr.ph12.split_crit_edge.us
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.loopexit69, %._crit_edge13.us.loopexit, %.lr.ph18.split.us
  %39 = add nuw nsw i32 %.016.us, 1
  %40 = load i32, i32* %23, align 8
  %41 = trunc i64 %indvars.iv514.us to i32
  tail call void @jcopy_sample_rows(i8** %8, i32 %41, i8** %8, i32 %39, i32 %26, i32 %40) #4
  %indvars.iv.next.us = add nuw i64 %indvars.iv15.us, 1
  %indvars.iv.next6.us = add i64 %indvars.iv514.us, %19
  %42 = add nsw i32 %.016.us, %17
  %43 = load i32, i32* %20, align 8
  %44 = sext i32 %43 to i64
  %45 = icmp slt i64 %indvars.iv.next6.us, %44
  br i1 %45, label %.lr.ph18.split.us, label %._crit_edge19.loopexit

.lr.ph12..lr.ph12.split_crit_edge.us:             ; preds = %.lr.ph12..lr.ph12.split_crit_edge.us.preheader, %.lr.ph12..lr.ph12.split_crit_edge.us
  %.0310.us20 = phi i8* [ %scevgep.us22, %.lr.ph12..lr.ph12.split_crit_edge.us ], [ %34, %.lr.ph12..lr.ph12.split_crit_edge.us.preheader ]
  %scevgep.us22 = getelementptr i8, i8* %.0310.us20, i64 %18
  %46 = icmp ult i8* %scevgep.us22, %37
  br i1 %46, label %.lr.ph12..lr.ph12.split_crit_edge.us, label %._crit_edge13.us.loopexit69

.lr.ph12.us:                                      ; preds = %.lr.ph18.split.us
  br i1 %24, label %.lr.ph.us.us.preheader, label %.lr.ph12..lr.ph12.split_crit_edge.us.preheader

.lr.ph12..lr.ph12.split_crit_edge.us.preheader:   ; preds = %.lr.ph12.us
  br label %.lr.ph12..lr.ph12.split_crit_edge.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph12.us
  %47 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv15.us
  %48 = load i8*, i8** %47, align 8
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvar = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvar.next, %._crit_edge.us.us ]
  %.0310.us.us = phi i8* [ %34, %.lr.ph.us.us.preheader ], [ %scevgep.us.us, %._crit_edge.us.us ]
  %.049.us.us = phi i8* [ %48, %.lr.ph.us.us.preheader ], [ %51, %._crit_edge.us.us ]
  %49 = mul i64 %18, %indvar
  %scevgep58 = getelementptr i8, i8* %34, i64 %49
  %50 = load i8, i8* %.049.us.us, align 1
  call void @llvm.memset.p0i8.i64(i8* %scevgep58, i8 %50, i64 %32, i32 1, i1 false)
  %51 = getelementptr inbounds i8, i8* %.049.us.us, i64 1
  %scevgep.us.us = getelementptr i8, i8* %.0310.us.us, i64 %18
  %52 = icmp ult i8* %scevgep.us.us, %37
  %indvar.next = add i64 %indvar, 1
  br i1 %52, label %._crit_edge.us.us, label %._crit_edge13.us.loopexit

.lr.ph18.split:                                   ; preds = %.lr.ph18
  br i1 %24, label %.lr.ph18.split.split.us.preheader, label %.lr.ph18.split.split.preheader

.lr.ph18.split.split.preheader:                   ; preds = %.lr.ph18.split
  %53 = load i32, i32* %23, align 8
  %54 = zext i32 %53 to i64
  %55 = icmp eq i32 %53, 0
  %56 = load i32, i32* %20, align 8
  %57 = sext i32 %56 to i64
  br label %.lr.ph18.split.split

.lr.ph18.split.split.us.preheader:                ; preds = %.lr.ph18.split
  %58 = add nsw i32 %14, -1
  %59 = zext i32 %58 to i64
  %60 = add nuw nsw i64 %59, 1
  br label %.lr.ph18.split.split.us

.lr.ph18.split.split.us:                          ; preds = %.lr.ph18.split.split.us.preheader, %._crit_edge13.us-lcssa.us.us53
  %indvars.iv15.us30 = phi i64 [ %indvars.iv.next.us32, %._crit_edge13.us-lcssa.us.us53 ], [ 0, %.lr.ph18.split.split.us.preheader ]
  %indvars.iv514.us31 = phi i64 [ %indvars.iv.next6.us33, %._crit_edge13.us-lcssa.us.us53 ], [ 0, %.lr.ph18.split.split.us.preheader ]
  %61 = getelementptr inbounds i8*, i8** %8, i64 %indvars.iv514.us31
  %62 = load i8*, i8** %61, align 8
  %63 = load i32, i32* %23, align 8
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i8, i8* %62, i64 %64
  %66 = icmp eq i32 %63, 0
  br i1 %66, label %._crit_edge13.us-lcssa.us.us53, label %.lr.ph.us.us48.preheader

.lr.ph.us.us48.preheader:                         ; preds = %.lr.ph18.split.split.us
  %67 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv15.us30
  %68 = load i8*, i8** %67, align 8
  br label %._crit_edge.us.us49

._crit_edge13.us-lcssa.us.us53.loopexit:          ; preds = %._crit_edge.us.us49
  br label %._crit_edge13.us-lcssa.us.us53

._crit_edge13.us-lcssa.us.us53:                   ; preds = %._crit_edge13.us-lcssa.us.us53.loopexit, %.lr.ph18.split.split.us
  %indvars.iv.next.us32 = add nuw i64 %indvars.iv15.us30, 1
  %indvars.iv.next6.us33 = add i64 %indvars.iv514.us31, %19
  %69 = load i32, i32* %20, align 8
  %70 = sext i32 %69 to i64
  %71 = icmp slt i64 %indvars.iv.next6.us33, %70
  br i1 %71, label %.lr.ph18.split.split.us, label %._crit_edge19.loopexit70

._crit_edge.us.us49:                              ; preds = %._crit_edge.us.us49, %.lr.ph.us.us48.preheader
  %indvar59 = phi i64 [ 0, %.lr.ph.us.us48.preheader ], [ %indvar.next60, %._crit_edge.us.us49 ]
  %.0310.us.us45 = phi i8* [ %62, %.lr.ph.us.us48.preheader ], [ %scevgep.us.us47, %._crit_edge.us.us49 ]
  %.049.us.us46 = phi i8* [ %68, %.lr.ph.us.us48.preheader ], [ %74, %._crit_edge.us.us49 ]
  %72 = mul i64 %18, %indvar59
  %scevgep61 = getelementptr i8, i8* %62, i64 %72
  %73 = load i8, i8* %.049.us.us46, align 1
  call void @llvm.memset.p0i8.i64(i8* %scevgep61, i8 %73, i64 %60, i32 1, i1 false)
  %74 = getelementptr inbounds i8, i8* %.049.us.us46, i64 1
  %scevgep.us.us47 = getelementptr i8, i8* %.0310.us.us45, i64 %18
  %75 = icmp ult i8* %scevgep.us.us47, %65
  %indvar.next60 = add i64 %indvar59, 1
  br i1 %75, label %._crit_edge.us.us49, label %._crit_edge13.us-lcssa.us.us53.loopexit

.lr.ph18.split.split:                             ; preds = %.lr.ph18.split.split.preheader, %._crit_edge13
  %indvars.iv514 = phi i64 [ %indvars.iv.next6, %._crit_edge13 ], [ 0, %.lr.ph18.split.split.preheader ]
  %76 = getelementptr inbounds i8*, i8** %8, i64 %indvars.iv514
  %77 = load i8*, i8** %76, align 8
  %78 = getelementptr inbounds i8, i8* %77, i64 %54
  br i1 %55, label %._crit_edge13, label %.lr.ph12.split.preheader

.lr.ph12.split.preheader:                         ; preds = %.lr.ph18.split.split
  br label %.lr.ph12.split

.lr.ph12.split:                                   ; preds = %.lr.ph12.split.preheader, %.lr.ph12.split
  %.0310 = phi i8* [ %scevgep, %.lr.ph12.split ], [ %77, %.lr.ph12.split.preheader ]
  %scevgep = getelementptr i8, i8* %.0310, i64 %18
  %79 = icmp ult i8* %scevgep, %78
  br i1 %79, label %.lr.ph12.split, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %.lr.ph12.split
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.lr.ph18.split.split
  %indvars.iv.next6 = add i64 %indvars.iv514, %19
  %80 = icmp slt i64 %indvars.iv.next6, %57
  br i1 %80, label %.lr.ph18.split.split, label %._crit_edge19.loopexit71

._crit_edge19.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge19

._crit_edge19.loopexit70:                         ; preds = %._crit_edge13.us-lcssa.us.us53
  br label %._crit_edge19

._crit_edge19.loopexit71:                         ; preds = %._crit_edge13
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit71, %._crit_edge19.loopexit70, %._crit_edge19.loopexit, %4
  ret void
}

declare i64 @jround_up(i64, i64) #2

declare void @jcopy_sample_rows(i8**, i32, i8**, i32, i32, i32) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !11}

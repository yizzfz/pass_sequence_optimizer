; ModuleID = 'jdmaster.ll'
source_filename = "jdmaster.c"
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
%struct.my_decomp_master = type { %struct.jpeg_decomp_master, i32, i32, %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer* }

@switch.table = private unnamed_addr constant [5 x i32] [i32 1, i32 3, i32 3, i32 4, i32 4]

; Function Attrs: noinline nounwind uwtable
define void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 202
  br i1 %4, label %16, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %7 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %7, i64 0, i32 5
  store i32 18, i32* %8, align 8
  %9 = load i32, i32* %2, align 4
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 6, i32 0, i64 0
  store i32 %9, i32* %11, align 4
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 0
  %14 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %13, align 8
  %15 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %14(%struct.jpeg_common_struct* %15) #4
  br label %16

; <label>:16:                                     ; preds = %1, %5
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 11
  %18 = load i32, i32* %17, align 4
  %19 = shl i32 %18, 3
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 12
  %21 = load i32, i32* %20, align 8
  %22 = icmp ugt i32 %19, %21
  br i1 %22, label %35, label %23

; <label>:23:                                     ; preds = %16
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 6
  %25 = load i32, i32* %24, align 8
  %26 = zext i32 %25 to i64
  %27 = tail call i64 @jdiv_round_up(i64 %26, i64 8) #4
  %28 = trunc i64 %27 to i32
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  store i32 %28, i32* %29, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 7
  %31 = load i32, i32* %30, align 4
  %32 = zext i32 %31 to i64
  %33 = tail call i64 @jdiv_round_up(i64 %32, i64 8) #4
  %34 = trunc i64 %33 to i32
  br label %69

; <label>:35:                                     ; preds = %16
  %36 = shl i32 %18, 2
  %37 = icmp ugt i32 %36, %21
  br i1 %37, label %50, label %38

; <label>:38:                                     ; preds = %35
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 6
  %40 = load i32, i32* %39, align 8
  %41 = zext i32 %40 to i64
  %42 = tail call i64 @jdiv_round_up(i64 %41, i64 4) #4
  %43 = trunc i64 %42 to i32
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  store i32 %43, i32* %44, align 8
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 7
  %46 = load i32, i32* %45, align 4
  %47 = zext i32 %46 to i64
  %48 = tail call i64 @jdiv_round_up(i64 %47, i64 4) #4
  %49 = trunc i64 %48 to i32
  br label %69

; <label>:50:                                     ; preds = %35
  %51 = shl i32 %18, 1
  %52 = icmp ugt i32 %51, %21
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 6
  %54 = load i32, i32* %53, align 8
  br i1 %52, label %65, label %55

; <label>:55:                                     ; preds = %50
  %56 = zext i32 %54 to i64
  %57 = tail call i64 @jdiv_round_up(i64 %56, i64 2) #4
  %58 = trunc i64 %57 to i32
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  store i32 %58, i32* %59, align 8
  %60 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 7
  %61 = load i32, i32* %60, align 4
  %62 = zext i32 %61 to i64
  %63 = tail call i64 @jdiv_round_up(i64 %62, i64 2) #4
  %64 = trunc i64 %63 to i32
  br label %69

; <label>:65:                                     ; preds = %50
  %66 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  store i32 %54, i32* %66, align 8
  %67 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 7
  %68 = load i32, i32* %67, align 4
  br label %69

; <label>:69:                                     ; preds = %38, %65, %55, %23
  %.sink5.sink.sink = phi i32 [ %34, %23 ], [ %49, %38 ], [ %68, %65 ], [ %64, %55 ]
  %.sink.sink.sink = phi i32 [ 1, %23 ], [ 2, %38 ], [ 8, %65 ], [ 4, %55 ]
  %70 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  store i32 %.sink5.sink.sink, i32* %70, align 4
  %71 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  store i32 %.sink.sink.sink, i32* %71, align 4
  %72 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %74 = load i32, i32* %73, align 8
  %75 = icmp sgt i32 %74, 0
  br i1 %75, label %.lr.ph30, label %._crit_edge

.lr.ph30:                                         ; preds = %69
  %76 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %72, align 8
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 57
  %78 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  br label %79

; <label>:79:                                     ; preds = %.lr.ph30, %.critedge
  %.0128 = phi i32 [ 0, %.lr.ph30 ], [ %103, %.critedge ]
  %.0227 = phi %struct.jpeg_component_info* [ %76, %.lr.ph30 ], [ %104, %.critedge ]
  %80 = load i32, i32* %71, align 4
  %81 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0227, i64 0, i32 3
  %82 = icmp slt i32 %80, 8
  br i1 %82, label %.lr.ph21, label %.critedge

.lr.ph21:                                         ; preds = %79
  %83 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0227, i64 0, i32 2
  %84 = load i32, i32* %83, align 8
  %85 = load i32, i32* %77, align 4
  %86 = load i32, i32* %71, align 4
  %87 = mul nsw i32 %86, %85
  br label %88

; <label>:88:                                     ; preds = %.lr.ph21, %99
  %.019 = phi i32 [ %80, %.lr.ph21 ], [ %100, %99 ]
  %89 = shl i32 %.019, 1
  %90 = mul i32 %89, %84
  %91 = icmp sgt i32 %90, %87
  br i1 %91, label %.critedge.loopexit, label %92

; <label>:92:                                     ; preds = %88
  %93 = load i32, i32* %81, align 4
  %94 = shl i32 %.019, 1
  %95 = mul i32 %94, %93
  %96 = load i32, i32* %78, align 8
  %97 = mul nsw i32 %96, %86
  %98 = icmp sgt i32 %95, %97
  br i1 %98, label %.critedge.loopexit, label %99

; <label>:99:                                     ; preds = %92
  %100 = shl nsw i32 %.019, 1
  %101 = icmp slt i32 %100, 8
  br i1 %101, label %88, label %.critedge.loopexit

.critedge.loopexit:                               ; preds = %92, %88, %99
  %.0.lcssa.ph = phi i32 [ %.019, %92 ], [ %.019, %88 ], [ %100, %99 ]
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %79
  %.0.lcssa = phi i32 [ %80, %79 ], [ %.0.lcssa.ph, %.critedge.loopexit ]
  %102 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0227, i64 0, i32 9
  store i32 %.0.lcssa, i32* %102, align 4
  %103 = add nuw nsw i32 %.0128, 1
  %104 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0227, i64 1
  %105 = load i32, i32* %73, align 8
  %106 = icmp slt i32 %103, %105
  br i1 %106, label %79, label %._crit_edge31

._crit_edge31:                                    ; preds = %.critedge
  %107 = icmp sgt i32 %105, 0
  br i1 %107, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge31
  %108 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %72, align 8
  %109 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 6
  %110 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 57
  %111 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 7
  %112 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  br label %113

; <label>:113:                                    ; preds = %.lr.ph, %113
  %.118 = phi i32 [ 0, %.lr.ph ], [ %143, %113 ]
  %.1317 = phi %struct.jpeg_component_info* [ %108, %.lr.ph ], [ %144, %113 ]
  %114 = load i32, i32* %109, align 8
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.1317, i64 0, i32 2
  %117 = load i32, i32* %116, align 8
  %118 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.1317, i64 0, i32 9
  %119 = load i32, i32* %118, align 4
  %120 = mul nsw i32 %119, %117
  %121 = sext i32 %120 to i64
  %122 = mul nsw i64 %121, %115
  %123 = load i32, i32* %110, align 4
  %124 = shl nsw i32 %123, 3
  %125 = sext i32 %124 to i64
  %126 = tail call i64 @jdiv_round_up(i64 %122, i64 %125) #4
  %127 = trunc i64 %126 to i32
  %128 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.1317, i64 0, i32 10
  store i32 %127, i32* %128, align 8
  %129 = load i32, i32* %111, align 4
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.1317, i64 0, i32 3
  %132 = load i32, i32* %131, align 4
  %133 = load i32, i32* %118, align 4
  %134 = mul nsw i32 %133, %132
  %135 = sext i32 %134 to i64
  %136 = mul nsw i64 %135, %130
  %137 = load i32, i32* %112, align 8
  %138 = shl nsw i32 %137, 3
  %139 = sext i32 %138 to i64
  %140 = tail call i64 @jdiv_round_up(i64 %136, i64 %139) #4
  %141 = trunc i64 %140 to i32
  %142 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.1317, i64 0, i32 11
  store i32 %141, i32* %142, align 4
  %143 = add nuw nsw i32 %.118, 1
  %144 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.1317, i64 1
  %145 = load i32, i32* %73, align 8
  %146 = icmp slt i32 %143, %145
  br i1 %146, label %113, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %113
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %69, %._crit_edge31
  %.lcssa = phi i32 [ %105, %._crit_edge31 ], [ %74, %69 ], [ %145, %._crit_edge.loopexit ]
  %147 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 10
  %148 = load i32, i32* %147, align 8
  %switch.tableidx = add i32 %148, -1
  %149 = icmp ult i32 %switch.tableidx, 5
  br i1 %149, label %switch.lookup, label %151

switch.lookup:                                    ; preds = %._crit_edge
  %150 = sext i32 %switch.tableidx to i64
  %switch.gep = getelementptr inbounds [5 x i32], [5 x i32]* @switch.table, i64 0, i64 %150
  %switch.load = load i32, i32* %switch.gep, align 4
  br label %151

; <label>:151:                                    ; preds = %._crit_edge, %switch.lookup
  %.sink12 = phi i32 [ %switch.load, %switch.lookup ], [ %.lcssa, %._crit_edge ]
  %152 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  store i32 %.sink12, i32* %152, align 8
  %153 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %154 = load i32, i32* %153, align 4
  %155 = icmp ne i32 %154, 0
  %..sink12 = select i1 %155, i32 1, i32 %.sink12
  %156 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 29
  store i32 %..sink12, i32* %156, align 4
  %157 = tail call i32 @use_merged_upsample(%struct.jpeg_decompress_struct* nonnull %0)
  %158 = icmp eq i32 %157, 0
  br i1 %158, label %162, label %159

; <label>:159:                                    ; preds = %151
  %160 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %161 = load i32, i32* %160, align 8
  br label %162

; <label>:162:                                    ; preds = %151, %159
  %.sink14 = phi i32 [ %161, %159 ], [ 1, %151 ]
  %163 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 30
  store i32 %.sink14, i32* %163, align 8
  ret void
}

declare i64 @jdiv_round_up(i64, i64) #1

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal i32 @use_merged_upsample(%struct.jpeg_decompress_struct* nocapture readonly) #2 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 17
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %64

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 56
  %7 = load i32, i32* %6, align 8
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %64

; <label>:9:                                      ; preds = %5
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 9
  %11 = load i32, i32* %10, align 4
  %12 = icmp eq i32 %11, 3
  br i1 %12, label %13, label %64

; <label>:13:                                     ; preds = %9
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %15 = load i32, i32* %14, align 8
  %16 = icmp eq i32 %15, 3
  br i1 %16, label %17, label %64

; <label>:17:                                     ; preds = %13
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 10
  %19 = load i32, i32* %18, align 8
  %20 = icmp eq i32 %19, 2
  br i1 %20, label %21, label %64

; <label>:21:                                     ; preds = %17
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %23 = load i32, i32* %22, align 8
  %24 = icmp eq i32 %23, 3
  br i1 %24, label %25, label %64

; <label>:25:                                     ; preds = %21
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %27 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 0, i32 2
  %29 = load i32, i32* %28, align 8
  %30 = icmp eq i32 %29, 2
  br i1 %30, label %31, label %64

; <label>:31:                                     ; preds = %25
  %32 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 1, i32 2
  %33 = load i32, i32* %32, align 8
  %34 = icmp eq i32 %33, 1
  br i1 %34, label %35, label %64

; <label>:35:                                     ; preds = %31
  %36 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 2, i32 2
  %37 = load i32, i32* %36, align 8
  %38 = icmp eq i32 %37, 1
  br i1 %38, label %39, label %64

; <label>:39:                                     ; preds = %35
  %40 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 0, i32 3
  %41 = load i32, i32* %40, align 4
  %42 = icmp sgt i32 %41, 2
  br i1 %42, label %64, label %43

; <label>:43:                                     ; preds = %39
  %44 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 1, i32 3
  %45 = load i32, i32* %44, align 4
  %46 = icmp eq i32 %45, 1
  br i1 %46, label %47, label %64

; <label>:47:                                     ; preds = %43
  %48 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 2, i32 3
  %49 = load i32, i32* %48, align 4
  %50 = icmp eq i32 %49, 1
  br i1 %50, label %51, label %64

; <label>:51:                                     ; preds = %47
  %52 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 0, i32 9
  %53 = load i32, i32* %52, align 4
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %55 = load i32, i32* %54, align 4
  %56 = icmp eq i32 %53, %55
  br i1 %56, label %57, label %64

; <label>:57:                                     ; preds = %51
  %58 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 1, i32 9
  %59 = load i32, i32* %58, align 4
  %60 = icmp eq i32 %59, %55
  br i1 %60, label %61, label %64

; <label>:61:                                     ; preds = %57
  %62 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 2, i32 9
  %63 = load i32, i32* %62, align 4
  %not. = icmp eq i32 %63, %55
  %. = zext i1 %not. to i32
  ret i32 %.

; <label>:64:                                     ; preds = %57, %51, %47, %43, %35, %31, %25, %21, %17, %13, %9, %5, %1, %39
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_new_colormap(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 73
  %3 = bitcast %struct.jpeg_decomp_master** %2 to %struct.my_decomp_master**
  %4 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 207
  br i1 %7, label %19, label %8

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 5
  store i32 18, i32* %11, align 8
  %12 = load i32, i32* %5, align 4
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 6, i32 0, i64 0
  store i32 %12, i32* %14, align 4
  %15 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %16 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %15, i64 0, i32 0
  %17 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %16, align 8
  %18 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %17(%struct.jpeg_common_struct* %18) #4
  br label %19

; <label>:19:                                     ; preds = %1, %8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %21 = load i32, i32* %20, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %39, label %23

; <label>:23:                                     ; preds = %19
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 24
  %25 = load i32, i32* %24, align 8
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %39, label %27

; <label>:27:                                     ; preds = %23
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %29 = load i8**, i8*** %28, align 8
  %30 = icmp eq i8** %29, null
  br i1 %30, label %39, label %31

; <label>:31:                                     ; preds = %27
  %32 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %4, i64 0, i32 4
  %33 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  store %struct.jpeg_color_quantizer* %33, %struct.jpeg_color_quantizer** %34, align 8
  %35 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %33, i64 0, i32 3
  %36 = bitcast {}** %35 to void (%struct.jpeg_decompress_struct*)**
  %37 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %36, align 8
  tail call void %37(%struct.jpeg_decompress_struct* nonnull %0) #4
  %38 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %4, i64 0, i32 0, i32 2
  store i32 0, i32* %38, align 8
  br label %47

; <label>:39:                                     ; preds = %27, %23, %19
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %41 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %42 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %41, i64 0, i32 5
  store i32 45, i32* %42, align 8
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i64 0, i32 0
  %45 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %44, align 8
  %46 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %45(%struct.jpeg_common_struct* %46) #4
  br label %47

; <label>:47:                                     ; preds = %39, %31
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jinit_master_decompress(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %3, i64 0, i32 0
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 48) #4
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 73
  %9 = bitcast %struct.jpeg_decomp_master** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @prepare_for_output_pass, void (%struct.jpeg_decompress_struct*)** %10, align 8
  %11 = getelementptr inbounds i8, i8* %7, i64 8
  %12 = bitcast i8* %11 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @finish_output_pass, void (%struct.jpeg_decompress_struct*)** %12, align 8
  %13 = getelementptr inbounds i8, i8* %7, i64 16
  %14 = bitcast i8* %13 to i32*
  store i32 0, i32* %14, align 8
  tail call void @master_selection(%struct.jpeg_decompress_struct* %0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @prepare_for_output_pass(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 73
  %3 = bitcast %struct.jpeg_decomp_master** %2 to %struct.my_decomp_master**
  %4 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %5 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %4, i64 0, i32 0, i32 2
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %21, label %8

; <label>:8:                                      ; preds = %1
  store i32 0, i32* %5, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %10 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %10, i64 0, i32 0
  %12 = load void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i32)** %11, align 8
  tail call void %12(%struct.jpeg_decompress_struct* nonnull %0, i32 0) #4
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 76
  %14 = load %struct.jpeg_d_post_controller*, %struct.jpeg_d_post_controller** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_d_post_controller, %struct.jpeg_d_post_controller* %14, i64 0, i32 0
  %16 = load void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i32)** %15, align 8
  tail call void %16(%struct.jpeg_decompress_struct* nonnull %0, i32 2) #4
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %18 = load %struct.jpeg_d_main_controller*, %struct.jpeg_d_main_controller** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_d_main_controller, %struct.jpeg_d_main_controller* %18, i64 0, i32 0
  %20 = load void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i32)** %19, align 8
  tail call void %20(%struct.jpeg_decompress_struct* nonnull %0, i32 2) #4
  br label %108

; <label>:21:                                     ; preds = %1
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %23 = load i32, i32* %22, align 4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %61, label %25

; <label>:25:                                     ; preds = %21
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %27 = load i8**, i8*** %26, align 8
  %28 = icmp eq i8** %27, null
  br i1 %28, label %29, label %61

; <label>:29:                                     ; preds = %25
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 21
  %31 = load i32, i32* %30, align 4
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %43, label %33

; <label>:33:                                     ; preds = %29
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 25
  %35 = load i32, i32* %34, align 4
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %43, label %37

; <label>:37:                                     ; preds = %33
  %38 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %4, i64 0, i32 4
  %39 = bitcast %struct.jpeg_color_quantizer** %38 to i64*
  %40 = load i64, i64* %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %42 = bitcast %struct.jpeg_color_quantizer** %41 to i64*
  store i64 %40, i64* %42, align 8
  store i32 1, i32* %5, align 8
  br label %61

; <label>:43:                                     ; preds = %33, %29
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 23
  %45 = load i32, i32* %44, align 4
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %53, label %47

; <label>:47:                                     ; preds = %43
  %48 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %4, i64 0, i32 3
  %49 = bitcast %struct.jpeg_color_quantizer** %48 to i64*
  %50 = load i64, i64* %49, align 8
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %52 = bitcast %struct.jpeg_color_quantizer** %51 to i64*
  store i64 %50, i64* %52, align 8
  br label %61

; <label>:53:                                     ; preds = %43
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %55 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %56 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %55, i64 0, i32 5
  store i32 45, i32* %56, align 8
  %57 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %58 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %57, i64 0, i32 0
  %59 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %58, align 8
  %60 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %59(%struct.jpeg_common_struct* %60) #4
  br label %61

; <label>:61:                                     ; preds = %21, %37, %53, %47, %25
  %62 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 80
  %63 = bitcast %struct.jpeg_inverse_dct** %62 to void (%struct.jpeg_decompress_struct*)***
  %64 = load void (%struct.jpeg_decompress_struct*)**, void (%struct.jpeg_decompress_struct*)*** %63, align 8
  %65 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %64, align 8
  tail call void %65(%struct.jpeg_decompress_struct* nonnull %0) #4
  %66 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %67 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %66, align 8
  %68 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %67, i64 0, i32 2
  %69 = bitcast {}** %68 to void (%struct.jpeg_decompress_struct*)**
  %70 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %69, align 8
  tail call void %70(%struct.jpeg_decompress_struct* nonnull %0) #4
  %71 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 15
  %72 = load i32, i32* %71, align 4
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %74, label %108

; <label>:74:                                     ; preds = %61
  %75 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %4, i64 0, i32 2
  %76 = load i32, i32* %75, align 4
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %83

; <label>:78:                                     ; preds = %74
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 82
  %80 = bitcast %struct.jpeg_color_deconverter** %79 to void (%struct.jpeg_decompress_struct*)***
  %81 = load void (%struct.jpeg_decompress_struct*)**, void (%struct.jpeg_decompress_struct*)*** %80, align 8
  %82 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %81, align 8
  tail call void %82(%struct.jpeg_decompress_struct* nonnull %0) #4
  br label %83

; <label>:83:                                     ; preds = %74, %78
  %84 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %85 = bitcast %struct.jpeg_upsampler** %84 to void (%struct.jpeg_decompress_struct*)***
  %86 = load void (%struct.jpeg_decompress_struct*)**, void (%struct.jpeg_decompress_struct*)*** %85, align 8
  %87 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %86, align 8
  tail call void %87(%struct.jpeg_decompress_struct* nonnull %0) #4
  %88 = load i32, i32* %22, align 4
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %96, label %90

; <label>:90:                                     ; preds = %83
  %91 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %92 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %91, align 8
  %93 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %92, i64 0, i32 0
  %94 = load void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i32)** %93, align 8
  %95 = load i32, i32* %5, align 8
  tail call void %94(%struct.jpeg_decompress_struct* nonnull %0, i32 %95) #4
  br label %96

; <label>:96:                                     ; preds = %83, %90
  %97 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 76
  %98 = load %struct.jpeg_d_post_controller*, %struct.jpeg_d_post_controller** %97, align 8
  %99 = getelementptr inbounds %struct.jpeg_d_post_controller, %struct.jpeg_d_post_controller* %98, i64 0, i32 0
  %100 = load void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i32)** %99, align 8
  %101 = load i32, i32* %5, align 8
  %102 = icmp ne i32 %101, 0
  %103 = select i1 %102, i32 3, i32 0
  tail call void %100(%struct.jpeg_decompress_struct* nonnull %0, i32 %103) #4
  %104 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %105 = load %struct.jpeg_d_main_controller*, %struct.jpeg_d_main_controller** %104, align 8
  %106 = getelementptr inbounds %struct.jpeg_d_main_controller, %struct.jpeg_d_main_controller* %105, i64 0, i32 0
  %107 = load void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i32)** %106, align 8
  tail call void %107(%struct.jpeg_decompress_struct* nonnull %0, i32 0) #4
  br label %108

; <label>:108:                                    ; preds = %61, %96, %8
  %109 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 2
  %110 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %109, align 8
  %111 = icmp eq %struct.jpeg_progress_mgr* %110, null
  br i1 %111, label %141, label %112

; <label>:112:                                    ; preds = %108
  %113 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %4, i64 0, i32 1
  %114 = load i32, i32* %113, align 8
  %115 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %110, i64 0, i32 3
  store i32 %114, i32* %115, align 8
  %116 = load i32, i32* %113, align 8
  %117 = load i32, i32* %5, align 8
  %118 = icmp ne i32 %117, 0
  %119 = select i1 %118, i32 2, i32 1
  %120 = add nsw i32 %119, %116
  %121 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %109, align 8
  %122 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %121, i64 0, i32 4
  store i32 %120, i32* %122, align 4
  %123 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 14
  %124 = load i32, i32* %123, align 8
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %141, label %126

; <label>:126:                                    ; preds = %112
  %127 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %128 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %127, align 8
  %129 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %128, i64 0, i32 5
  %130 = load i32, i32* %129, align 4
  %131 = icmp eq i32 %130, 0
  br i1 %131, label %132, label %141

; <label>:132:                                    ; preds = %126
  %133 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 25
  %134 = load i32, i32* %133, align 4
  %135 = icmp ne i32 %134, 0
  %136 = select i1 %135, i32 2, i32 1
  %137 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %109, align 8
  %138 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %137, i64 0, i32 4
  %139 = load i32, i32* %138, align 4
  %140 = add nsw i32 %139, %136
  store i32 %140, i32* %138, align 4
  br label %141

; <label>:141:                                    ; preds = %126, %112, %108, %132
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_output_pass(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 73
  %3 = bitcast %struct.jpeg_decomp_master** %2 to %struct.my_decomp_master**
  %4 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %14, label %8

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %10 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %10, i64 0, i32 2
  %12 = bitcast {}** %11 to void (%struct.jpeg_decompress_struct*)**
  %13 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %12, align 8
  tail call void %13(%struct.jpeg_decompress_struct* nonnull %0) #4
  br label %14

; <label>:14:                                     ; preds = %1, %8
  %15 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %4, i64 0, i32 1
  %16 = load i32, i32* %15, align 8
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %15, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @master_selection(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 73
  %3 = bitcast %struct.jpeg_decomp_master** %2 to %struct.my_decomp_master**
  %4 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  tail call void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct* %0)
  tail call void @prepare_range_limit_table(%struct.jpeg_decompress_struct* %0)
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %6 = load i32, i32* %5, align 8
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %9 = load i32, i32* %8, align 8
  %10 = sext i32 %9 to i64
  %11 = mul nsw i64 %10, %7
  %12 = and i64 %11, 4294967295
  %13 = icmp eq i64 %12, %11
  br i1 %13, label %22, label %14

; <label>:14:                                     ; preds = %1
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i64 0, i32 5
  store i32 69, i32* %17, align 8
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i64 0, i32 0
  %20 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %19, align 8
  %21 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %20(%struct.jpeg_common_struct* %21) #4
  br label %22

; <label>:22:                                     ; preds = %1, %14
  %23 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %4, i64 0, i32 1
  store i32 0, i32* %23, align 8
  %24 = tail call i32 @use_merged_upsample(%struct.jpeg_decompress_struct* nonnull %0)
  %25 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %4, i64 0, i32 2
  store i32 %24, i32* %25, align 4
  %26 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %4, i64 0, i32 3
  %27 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %4, i64 0, i32 4
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %29 = bitcast %struct.jpeg_color_quantizer** %26 to i8*
  call void @llvm.memset.p0i8.i64(i8* %29, i8 0, i64 16, i32 8, i1 false)
  %30 = load i32, i32* %28, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %36, label %32

; <label>:32:                                     ; preds = %22
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 14
  %34 = load i32, i32* %33, align 8
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %40

; <label>:36:                                     ; preds = %32, %22
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 23
  store i32 0, i32* %37, align 4
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 24
  store i32 0, i32* %38, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 25
  store i32 0, i32* %39, align 4
  br label %40

; <label>:40:                                     ; preds = %32, %36
  %41 = load i32, i32* %28, align 4
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %97, label %43

; <label>:43:                                     ; preds = %40
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 15
  %45 = load i32, i32* %44, align 4
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %55, label %47

; <label>:47:                                     ; preds = %43
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %49 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %48, align 8
  %50 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %49, i64 0, i32 5
  store i32 46, i32* %50, align 8
  %51 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %48, align 8
  %52 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %51, i64 0, i32 0
  %53 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %52, align 8
  %54 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %53(%struct.jpeg_common_struct* %54) #4
  br label %55

; <label>:55:                                     ; preds = %43, %47
  %56 = load i32, i32* %8, align 8
  %57 = icmp eq i32 %56, 3
  br i1 %57, label %63, label %58

; <label>:58:                                     ; preds = %55
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 23
  store i32 1, i32* %59, align 4
  %60 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 24
  store i32 0, i32* %60, align 8
  %61 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 25
  store i32 0, i32* %61, align 4
  %62 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  store i8** null, i8*** %62, align 8
  br label %75

; <label>:63:                                     ; preds = %55
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %65 = load i8**, i8*** %64, align 8
  %66 = icmp eq i8** %65, null
  br i1 %66, label %69, label %67

; <label>:67:                                     ; preds = %63
  %68 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 24
  store i32 1, i32* %68, align 8
  br label %75

; <label>:69:                                     ; preds = %63
  %70 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 21
  %71 = load i32, i32* %70, align 4
  %72 = icmp ne i32 %71, 0
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 23
  %74 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 25
  %.sink = select i1 %72, i32* %74, i32* %73
  store i32 1, i32* %.sink, align 4
  br label %75

; <label>:75:                                     ; preds = %67, %69, %58
  %76 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 23
  %77 = load i32, i32* %76, align 4
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %84, label %79

; <label>:79:                                     ; preds = %75
  tail call void @jinit_1pass_quantizer(%struct.jpeg_decompress_struct* nonnull %0) #4
  %80 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %81 = bitcast %struct.jpeg_color_quantizer** %80 to i64*
  %82 = load i64, i64* %81, align 8
  %83 = bitcast %struct.jpeg_color_quantizer** %26 to i64*
  store i64 %82, i64* %83, align 8
  br label %84

; <label>:84:                                     ; preds = %75, %79
  %85 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 25
  %86 = load i32, i32* %85, align 4
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %88, label %92

; <label>:88:                                     ; preds = %84
  %89 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 24
  %90 = load i32, i32* %89, align 8
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %97, label %92

; <label>:92:                                     ; preds = %88, %84
  tail call void @jinit_2pass_quantizer(%struct.jpeg_decompress_struct* nonnull %0) #4
  %93 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %94 = bitcast %struct.jpeg_color_quantizer** %93 to i64*
  %95 = load i64, i64* %94, align 8
  %96 = bitcast %struct.jpeg_color_quantizer** %27 to i64*
  store i64 %95, i64* %96, align 8
  br label %97

; <label>:97:                                     ; preds = %88, %40, %92
  %98 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 15
  %99 = load i32, i32* %98, align 4
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %101, label %109

; <label>:101:                                    ; preds = %97
  %102 = load i32, i32* %25, align 4
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %105, label %104

; <label>:104:                                    ; preds = %101
  tail call void @jinit_merged_upsampler(%struct.jpeg_decompress_struct* nonnull %0) #4
  br label %106

; <label>:105:                                    ; preds = %101
  tail call void @jinit_color_deconverter(%struct.jpeg_decompress_struct* nonnull %0) #4
  tail call void @jinit_upsampler(%struct.jpeg_decompress_struct* nonnull %0) #4
  br label %106

; <label>:106:                                    ; preds = %105, %104
  %107 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 25
  %108 = load i32, i32* %107, align 4
  tail call void @jinit_d_post_controller(%struct.jpeg_decompress_struct* nonnull %0, i32 %108) #4
  br label %109

; <label>:109:                                    ; preds = %97, %106
  tail call void @jinit_inverse_dct(%struct.jpeg_decompress_struct* nonnull %0) #4
  %110 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 45
  %111 = load i32, i32* %110, align 4
  %112 = icmp eq i32 %111, 0
  br i1 %112, label %121, label %113

; <label>:113:                                    ; preds = %109
  %114 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %115 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %114, align 8
  %116 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %115, i64 0, i32 5
  store i32 1, i32* %116, align 8
  %117 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %114, align 8
  %118 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %117, i64 0, i32 0
  %119 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %118, align 8
  %120 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %119(%struct.jpeg_common_struct* %120) #4
  br label %127

; <label>:121:                                    ; preds = %109
  %122 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 44
  %123 = load i32, i32* %122, align 8
  %124 = icmp eq i32 %123, 0
  br i1 %124, label %126, label %125

; <label>:125:                                    ; preds = %121
  tail call void @jinit_phuff_decoder(%struct.jpeg_decompress_struct* nonnull %0) #4
  br label %127

; <label>:126:                                    ; preds = %121
  tail call void @jinit_huff_decoder(%struct.jpeg_decompress_struct* nonnull %0) #4
  br label %127

; <label>:127:                                    ; preds = %125, %126, %113
  %128 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %129 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %128, align 8
  %130 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %129, i64 0, i32 4
  %131 = load i32, i32* %130, align 8
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %133, label %137

; <label>:133:                                    ; preds = %127
  %134 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 14
  %135 = load i32, i32* %134, align 8
  %136 = icmp ne i32 %135, 0
  br label %137

; <label>:137:                                    ; preds = %127, %133
  %138 = phi i1 [ true, %127 ], [ %136, %133 ]
  %139 = zext i1 %138 to i32
  tail call void @jinit_d_coef_controller(%struct.jpeg_decompress_struct* nonnull %0, i32 %139) #4
  %140 = load i32, i32* %98, align 4
  %141 = icmp eq i32 %140, 0
  br i1 %141, label %142, label %143

; <label>:142:                                    ; preds = %137
  tail call void @jinit_d_main_controller(%struct.jpeg_decompress_struct* nonnull %0, i32 0) #4
  br label %143

; <label>:143:                                    ; preds = %137, %142
  %144 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %145 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %144, align 8
  %146 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %145, i64 0, i32 6
  %147 = bitcast {}** %146 to void (%struct.jpeg_common_struct*)**
  %148 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %147, align 8
  %149 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %148(%struct.jpeg_common_struct* %149) #4
  %150 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %128, align 8
  %151 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %150, i64 0, i32 2
  %152 = bitcast {}** %151 to void (%struct.jpeg_decompress_struct*)**
  %153 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %152, align 8
  tail call void %153(%struct.jpeg_decompress_struct* nonnull %0) #4
  %154 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 2
  %155 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %154, align 8
  %156 = icmp eq %struct.jpeg_progress_mgr* %155, null
  br i1 %156, label %192, label %157

; <label>:157:                                    ; preds = %143
  %158 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 14
  %159 = load i32, i32* %158, align 8
  %160 = icmp eq i32 %159, 0
  br i1 %160, label %161, label %192

; <label>:161:                                    ; preds = %157
  %162 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %128, align 8
  %163 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %162, i64 0, i32 4
  %164 = load i32, i32* %163, align 8
  %165 = icmp eq i32 %164, 0
  br i1 %165, label %192, label %166

; <label>:166:                                    ; preds = %161
  %167 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 44
  %168 = load i32, i32* %167, align 8
  %169 = icmp ne i32 %168, 0
  %170 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %171 = load i32, i32* %170, align 8
  %172 = mul nsw i32 %171, 3
  %173 = add nsw i32 %172, 2
  %.0 = select i1 %169, i32 %173, i32 %171
  %174 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %155, i64 0, i32 1
  store i64 0, i64* %174, align 8
  %175 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 60
  %176 = load i32, i32* %175, align 8
  %177 = zext i32 %176 to i64
  %178 = sext i32 %.0 to i64
  %179 = mul nsw i64 %178, %177
  %180 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %154, align 8
  %181 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %180, i64 0, i32 2
  store i64 %179, i64* %181, align 8
  %182 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %154, align 8
  %183 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %182, i64 0, i32 3
  store i32 0, i32* %183, align 8
  %184 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 25
  %185 = load i32, i32* %184, align 4
  %186 = icmp ne i32 %185, 0
  %187 = select i1 %186, i32 3, i32 2
  %188 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %154, align 8
  %189 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %188, i64 0, i32 4
  store i32 %187, i32* %189, align 4
  %190 = load i32, i32* %23, align 8
  %191 = add nsw i32 %190, 1
  store i32 %191, i32* %23, align 8
  br label %192

; <label>:192:                                    ; preds = %161, %157, %143, %166
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @prepare_range_limit_table(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %3, i64 0, i32 0
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 1408) #4
  %8 = getelementptr inbounds i8, i8* %7, i64 256
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  store i8* %8, i8** %9, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 256, i32 1, i1 false)
  br label %10

; <label>:10:                                     ; preds = %10, %1
  %indvars.iv15 = phi i64 [ 0, %1 ], [ %indvars.iv.next2.7, %10 ]
  %11 = trunc i64 %indvars.iv15 to i8
  %12 = getelementptr inbounds i8, i8* %8, i64 %indvars.iv15
  store i8 %11, i8* %12, align 1
  %indvars.iv.next2 = or i64 %indvars.iv15, 1
  %13 = trunc i64 %indvars.iv.next2 to i8
  %14 = getelementptr inbounds i8, i8* %8, i64 %indvars.iv.next2
  store i8 %13, i8* %14, align 1
  %indvars.iv.next2.1 = or i64 %indvars.iv15, 2
  %15 = trunc i64 %indvars.iv.next2.1 to i8
  %16 = getelementptr inbounds i8, i8* %8, i64 %indvars.iv.next2.1
  store i8 %15, i8* %16, align 1
  %indvars.iv.next2.2 = or i64 %indvars.iv15, 3
  %17 = trunc i64 %indvars.iv.next2.2 to i8
  %18 = getelementptr inbounds i8, i8* %8, i64 %indvars.iv.next2.2
  store i8 %17, i8* %18, align 1
  %indvars.iv.next2.3 = or i64 %indvars.iv15, 4
  %19 = trunc i64 %indvars.iv.next2.3 to i8
  %20 = getelementptr inbounds i8, i8* %8, i64 %indvars.iv.next2.3
  store i8 %19, i8* %20, align 1
  %indvars.iv.next2.4 = or i64 %indvars.iv15, 5
  %21 = trunc i64 %indvars.iv.next2.4 to i8
  %22 = getelementptr inbounds i8, i8* %8, i64 %indvars.iv.next2.4
  store i8 %21, i8* %22, align 1
  %indvars.iv.next2.5 = or i64 %indvars.iv15, 6
  %23 = trunc i64 %indvars.iv.next2.5 to i8
  %24 = getelementptr inbounds i8, i8* %8, i64 %indvars.iv.next2.5
  store i8 %23, i8* %24, align 1
  %indvars.iv.next2.6 = or i64 %indvars.iv15, 7
  %25 = trunc i64 %indvars.iv.next2.6 to i8
  %26 = getelementptr inbounds i8, i8* %8, i64 %indvars.iv.next2.6
  store i8 %25, i8* %26, align 1
  %indvars.iv.next2.7 = add nsw i64 %indvars.iv15, 8
  %exitcond3.7 = icmp eq i64 %indvars.iv.next2.7, 256
  br i1 %exitcond3.7, label %27, label %10

; <label>:27:                                     ; preds = %10
  %scevgep = getelementptr i8, i8* %7, i64 512
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 -1, i64 384, i32 1, i1 false)
  %28 = getelementptr inbounds i8, i8* %7, i64 896
  tail call void @llvm.memset.p0i8.i64(i8* %28, i8 0, i64 384, i32 1, i1 false)
  %29 = getelementptr inbounds i8, i8* %7, i64 1280
  %30 = load i8*, i8** %9, align 8
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %29, i8* %30, i64 128, i32 1, i1 false)
  ret void
}

declare void @jinit_1pass_quantizer(%struct.jpeg_decompress_struct*) #1

declare void @jinit_2pass_quantizer(%struct.jpeg_decompress_struct*) #1

declare void @jinit_merged_upsampler(%struct.jpeg_decompress_struct*) #1

declare void @jinit_color_deconverter(%struct.jpeg_decompress_struct*) #1

declare void @jinit_upsampler(%struct.jpeg_decompress_struct*) #1

declare void @jinit_d_post_controller(%struct.jpeg_decompress_struct*, i32) #1

declare void @jinit_inverse_dct(%struct.jpeg_decompress_struct*) #1

declare void @jinit_phuff_decoder(%struct.jpeg_decompress_struct*) #1

declare void @jinit_huff_decoder(%struct.jpeg_decompress_struct*) #1

declare void @jinit_d_coef_controller(%struct.jpeg_decompress_struct*, i32) #1

declare void @jinit_d_main_controller(%struct.jpeg_decompress_struct*, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

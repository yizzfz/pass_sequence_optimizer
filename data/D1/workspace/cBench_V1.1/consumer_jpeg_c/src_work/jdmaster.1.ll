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
define void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 202
  br i1 %4, label %16, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %7 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %7, i64 0, i32 5
  store i32 18, i32* %8, align 8
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr34 = add i64 %sunkaddr, 28
  %sunkaddr35 = inttoptr i64 %sunkaddr34 to i32*
  %9 = load i32, i32* %sunkaddr35, align 4
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %6, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 6, i32 0, i64 0
  store i32 %9, i32* %11, align 4
  %12 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %13 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %12, align 8
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
  %72 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %73 = load i32, i32* %72, align 8
  %74 = icmp sgt i32 %73, 0
  br i1 %74, label %.lr.ph30, label %._crit_edge

.lr.ph30:                                         ; preds = %69
  %sunkaddr36 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr37 = add i64 %sunkaddr36, 296
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to %struct.jpeg_component_info**
  %75 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr38, align 8
  %sunkaddr93 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr94 = add i64 %sunkaddr93, 396
  %sunkaddr95 = inttoptr i64 %sunkaddr94 to i32*
  %sunkaddr96 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr97 = add i64 %sunkaddr96, 388
  %sunkaddr98 = inttoptr i64 %sunkaddr97 to i32*
  %sunkaddr99 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr100 = add i64 %sunkaddr99, 396
  %sunkaddr101 = inttoptr i64 %sunkaddr100 to i32*
  %sunkaddr105 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr106 = add i64 %sunkaddr105, 392
  %sunkaddr107 = inttoptr i64 %sunkaddr106 to i32*
  %sunkaddr108 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr109 = add i64 %sunkaddr108, 48
  %sunkaddr110 = inttoptr i64 %sunkaddr109 to i32*
  br label %76

; <label>:76:                                     ; preds = %.critedge, %.lr.ph30
  %.0128 = phi i32 [ 0, %.lr.ph30 ], [ %101, %.critedge ]
  %.0227 = phi %struct.jpeg_component_info* [ %75, %.lr.ph30 ], [ %102, %.critedge ]
  %77 = load i32, i32* %sunkaddr95, align 4
  %78 = icmp slt i32 %77, 8
  br i1 %78, label %.lr.ph21, label %.critedge

.lr.ph21:                                         ; preds = %76
  %79 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0227, i64 0, i32 2
  %80 = load i32, i32* %79, align 8
  %81 = load i32, i32* %sunkaddr98, align 4
  %82 = load i32, i32* %sunkaddr101, align 4
  %83 = mul nsw i32 %82, %81
  %84 = shl i32 %77, 1
  %85 = mul i32 %84, %80
  %86 = icmp sgt i32 %85, %83
  br i1 %86, label %.critedge, label %.lr.ph92.preheader

.lr.ph92.preheader:                               ; preds = %.lr.ph21
  %sunkaddr102 = ptrtoint %struct.jpeg_component_info* %.0227 to i64
  %sunkaddr103 = add i64 %sunkaddr102, 12
  %sunkaddr104 = inttoptr i64 %sunkaddr103 to i32*
  %87 = load i32, i32* %sunkaddr104, align 4
  %88 = load i32, i32* %sunkaddr107, align 8
  %89 = mul nsw i32 %88, %82
  br label %.lr.ph92

; <label>:90:                                     ; preds = %97
  %91 = shl i32 %.01991, 2
  %92 = mul i32 %91, %80
  %93 = icmp sgt i32 %92, %83
  br i1 %93, label %.critedge.loopexit, label %.lr.ph92

.lr.ph92:                                         ; preds = %.lr.ph92.preheader, %90
  %.01991 = phi i32 [ %98, %90 ], [ %77, %.lr.ph92.preheader ]
  %94 = shl i32 %.01991, 1
  %95 = mul i32 %94, %87
  %96 = icmp sgt i32 %95, %89
  br i1 %96, label %.critedge.loopexit, label %97

; <label>:97:                                     ; preds = %.lr.ph92
  %98 = shl nsw i32 %.01991, 1
  %99 = icmp slt i32 %98, 8
  br i1 %99, label %90, label %.critedge.loopexit

.critedge.loopexit:                               ; preds = %90, %.lr.ph92, %97
  %.0.lcssa.ph = phi i32 [ %98, %90 ], [ %.01991, %.lr.ph92 ], [ %98, %97 ]
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %.lr.ph21, %76
  %.0.lcssa = phi i32 [ %77, %76 ], [ %77, %.lr.ph21 ], [ %.0.lcssa.ph, %.critedge.loopexit ]
  %100 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0227, i64 0, i32 9
  store i32 %.0.lcssa, i32* %100, align 4
  %101 = add nuw nsw i32 %.0128, 1
  %102 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0227, i64 1
  %103 = load i32, i32* %sunkaddr110, align 8
  %104 = icmp slt i32 %101, %103
  br i1 %104, label %76, label %._crit_edge31

._crit_edge31:                                    ; preds = %.critedge
  %105 = icmp sgt i32 %103, 0
  br i1 %105, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge31
  %sunkaddr57 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr58 = add i64 %sunkaddr57, 296
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to %struct.jpeg_component_info**
  %106 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr59, align 8
  %sunkaddr111 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr112 = add i64 %sunkaddr111, 40
  %sunkaddr113 = inttoptr i64 %sunkaddr112 to i32*
  %sunkaddr114 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr115 = add i64 %sunkaddr114, 388
  %sunkaddr116 = inttoptr i64 %sunkaddr115 to i32*
  %sunkaddr117 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr118 = add i64 %sunkaddr117, 44
  %sunkaddr119 = inttoptr i64 %sunkaddr118 to i32*
  %sunkaddr120 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr121 = add i64 %sunkaddr120, 392
  %sunkaddr122 = inttoptr i64 %sunkaddr121 to i32*
  %sunkaddr123 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr124 = add i64 %sunkaddr123, 48
  %sunkaddr125 = inttoptr i64 %sunkaddr124 to i32*
  br label %107

; <label>:107:                                    ; preds = %107, %.lr.ph
  %.118 = phi i32 [ 0, %.lr.ph ], [ %137, %107 ]
  %.1317 = phi %struct.jpeg_component_info* [ %106, %.lr.ph ], [ %138, %107 ]
  %108 = load i32, i32* %sunkaddr113, align 8
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.1317, i64 0, i32 2
  %111 = load i32, i32* %110, align 8
  %112 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.1317, i64 0, i32 9
  %113 = load i32, i32* %112, align 4
  %114 = sext i32 %113 to i64
  %promoted = sext i32 %111 to i64
  %115 = mul nsw i64 %114, %promoted
  %116 = mul nsw i64 %115, %109
  %117 = load i32, i32* %sunkaddr116, align 4
  %118 = sext i32 %117 to i64
  %119 = shl nsw i64 %118, 3
  %120 = tail call i64 @jdiv_round_up(i64 %116, i64 %119) #4
  %121 = trunc i64 %120 to i32
  %122 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.1317, i64 0, i32 10
  store i32 %121, i32* %122, align 8
  %123 = load i32, i32* %sunkaddr119, align 4
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.1317, i64 0, i32 3
  %126 = load i32, i32* %125, align 4
  %127 = load i32, i32* %112, align 4
  %128 = sext i32 %127 to i64
  %promoted69 = sext i32 %126 to i64
  %129 = mul nsw i64 %128, %promoted69
  %130 = mul nsw i64 %129, %124
  %131 = load i32, i32* %sunkaddr122, align 8
  %132 = sext i32 %131 to i64
  %133 = shl nsw i64 %132, 3
  %134 = tail call i64 @jdiv_round_up(i64 %130, i64 %133) #4
  %135 = trunc i64 %134 to i32
  %136 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.1317, i64 0, i32 11
  store i32 %135, i32* %136, align 4
  %137 = add nuw nsw i32 %.118, 1
  %138 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.1317, i64 1
  %139 = load i32, i32* %sunkaddr125, align 8
  %140 = icmp slt i32 %137, %139
  br i1 %140, label %107, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %107
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge31, %69
  %.lcssa = phi i32 [ %73, %69 ], [ %103, %._crit_edge31 ], [ %139, %._crit_edge.loopexit ]
  %141 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 10
  %142 = load i32, i32* %141, align 8
  %switch.tableidx = add i32 %142, -1
  %143 = icmp ult i32 %switch.tableidx, 5
  br i1 %143, label %switch.lookup, label %145

switch.lookup:                                    ; preds = %._crit_edge
  %144 = sext i32 %switch.tableidx to i64
  %switch.gep = getelementptr inbounds [5 x i32], [5 x i32]* @switch.table, i64 0, i64 %144
  %switch.load = load i32, i32* %switch.gep, align 4
  br label %145

; <label>:145:                                    ; preds = %._crit_edge, %switch.lookup
  %.sink12 = phi i32 [ %switch.load, %switch.lookup ], [ %.lcssa, %._crit_edge ]
  %146 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  store i32 %.sink12, i32* %146, align 8
  %147 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %148 = load i32, i32* %147, align 4
  %149 = icmp eq i32 %148, 0
  %.sink12. = select i1 %149, i32 %.sink12, i32 1
  %150 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 29
  store i32 %.sink12., i32* %150, align 4
  %151 = tail call fastcc i32 @use_merged_upsample(%struct.jpeg_decompress_struct* nonnull %0)
  %152 = icmp eq i32 %151, 0
  br i1 %152, label %156, label %153

; <label>:153:                                    ; preds = %145
  %154 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %155 = load i32, i32* %154, align 8
  br label %156

; <label>:156:                                    ; preds = %145, %153
  %.sink14 = phi i32 [ %155, %153 ], [ 1, %145 ]
  %157 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 30
  store i32 %.sink14, i32* %157, align 8
  ret void
}

declare i64 @jdiv_round_up(i64, i64) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal fastcc i32 @use_merged_upsample(%struct.jpeg_decompress_struct* nocapture readonly) unnamed_addr #2 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 17
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %65

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 56
  %7 = load i32, i32* %6, align 8
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %65

; <label>:9:                                      ; preds = %5
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 9
  %11 = load i32, i32* %10, align 4
  %12 = icmp eq i32 %11, 3
  br i1 %12, label %13, label %65

; <label>:13:                                     ; preds = %9
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %15 = load i32, i32* %14, align 8
  %16 = icmp eq i32 %15, 3
  br i1 %16, label %17, label %65

; <label>:17:                                     ; preds = %13
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 10
  %19 = load i32, i32* %18, align 8
  %20 = icmp eq i32 %19, 2
  br i1 %20, label %21, label %65

; <label>:21:                                     ; preds = %17
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %23 = load i32, i32* %22, align 8
  %24 = icmp eq i32 %23, 3
  br i1 %24, label %25, label %65

; <label>:25:                                     ; preds = %21
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %27 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 0, i32 2
  %29 = load i32, i32* %28, align 8
  %30 = icmp eq i32 %29, 2
  br i1 %30, label %31, label %65

; <label>:31:                                     ; preds = %25
  %32 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 1, i32 2
  %33 = load i32, i32* %32, align 8
  %34 = icmp eq i32 %33, 1
  br i1 %34, label %35, label %65

; <label>:35:                                     ; preds = %31
  %36 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 2, i32 2
  %37 = load i32, i32* %36, align 8
  %38 = icmp eq i32 %37, 1
  br i1 %38, label %39, label %65

; <label>:39:                                     ; preds = %35
  %40 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 0, i32 3
  %41 = load i32, i32* %40, align 4
  %42 = icmp sgt i32 %41, 2
  br i1 %42, label %65, label %43

; <label>:43:                                     ; preds = %39
  %44 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 1, i32 3
  %45 = load i32, i32* %44, align 4
  %46 = icmp eq i32 %45, 1
  br i1 %46, label %47, label %65

; <label>:47:                                     ; preds = %43
  %48 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 2, i32 3
  %49 = load i32, i32* %48, align 4
  %50 = icmp eq i32 %49, 1
  br i1 %50, label %51, label %65

; <label>:51:                                     ; preds = %47
  %52 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 0, i32 9
  %53 = load i32, i32* %52, align 4
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  %55 = load i32, i32* %54, align 4
  %56 = icmp eq i32 %53, %55
  br i1 %56, label %57, label %65

; <label>:57:                                     ; preds = %51
  %58 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 1, i32 9
  %59 = load i32, i32* %58, align 4
  %60 = icmp eq i32 %59, %55
  br i1 %60, label %61, label %65

; <label>:61:                                     ; preds = %57
  %62 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i64 2, i32 9
  %63 = load i32, i32* %62, align 4
  %64 = icmp eq i32 %63, %55
  %. = zext i1 %64 to i32
  ret i32 %.

; <label>:65:                                     ; preds = %57, %51, %47, %43, %39, %35, %31, %25, %21, %17, %13, %9, %5, %1
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_new_colormap(%struct.jpeg_decompress_struct*) local_unnamed_addr #0 {
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
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr1 = add i64 %sunkaddr, 28
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  %12 = load i32, i32* %sunkaddr2, align 4
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 6, i32 0, i64 0
  store i32 %12, i32* %14, align 4
  %15 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %16 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %15, align 8
  %17 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %16, align 8
  %18 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %17(%struct.jpeg_common_struct* %18) #4
  br label %19

; <label>:19:                                     ; preds = %1, %8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %21 = load i32, i32* %20, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %31, label %23

; <label>:23:                                     ; preds = %19
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 24
  %25 = load i32, i32* %24, align 8
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %31, label %27

; <label>:27:                                     ; preds = %23
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %29 = load i8**, i8*** %28, align 8
  %30 = icmp eq i8** %29, null
  br i1 %30, label %31, label %39

; <label>:31:                                     ; preds = %27, %23, %19
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %33 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %33, i64 0, i32 5
  store i32 45, i32* %34, align 8
  %35 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %36 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %35, align 8
  %37 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %36, align 8
  %38 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %37(%struct.jpeg_common_struct* %38) #4
  ret void

; <label>:39:                                     ; preds = %27
  %40 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %4, i64 0, i32 4
  %41 = bitcast %struct.jpeg_color_quantizer** %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %44 = bitcast %struct.jpeg_color_quantizer** %43 to i64*
  store i64 %42, i64* %44, align 8
  %.cast = inttoptr i64 %42 to %struct.jpeg_color_quantizer*
  %45 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %.cast, i64 0, i32 3
  %46 = bitcast {}** %45 to void (%struct.jpeg_decompress_struct*)**
  %47 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %46, align 8
  tail call void %47(%struct.jpeg_decompress_struct* nonnull %0) #4
  %48 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %4, i64 0, i32 0, i32 2
  store i32 0, i32* %48, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jinit_master_decompress(%struct.jpeg_decompress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
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
  tail call fastcc void @master_selection(%struct.jpeg_decompress_struct* %0)
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
  %sunkaddr = ptrtoint %struct.my_decomp_master* %4 to i64
  %sunkaddr1 = add i64 %sunkaddr, 16
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  store i32 0, i32* %sunkaddr2, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %10 = bitcast %struct.jpeg_color_quantizer** %9 to void (%struct.jpeg_decompress_struct*, i32)***
  %11 = load void (%struct.jpeg_decompress_struct*, i32)**, void (%struct.jpeg_decompress_struct*, i32)*** %10, align 8
  %12 = load void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i32)** %11, align 8
  tail call void %12(%struct.jpeg_decompress_struct* nonnull %0, i32 0) #4
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 76
  %14 = bitcast %struct.jpeg_d_post_controller** %13 to void (%struct.jpeg_decompress_struct*, i32)***
  %15 = load void (%struct.jpeg_decompress_struct*, i32)**, void (%struct.jpeg_decompress_struct*, i32)*** %14, align 8
  %16 = load void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i32)** %15, align 8
  tail call void %16(%struct.jpeg_decompress_struct* nonnull %0, i32 2) #4
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %18 = bitcast %struct.jpeg_d_main_controller** %17 to void (%struct.jpeg_decompress_struct*, i32)***
  %19 = load void (%struct.jpeg_decompress_struct*, i32)**, void (%struct.jpeg_decompress_struct*, i32)*** %18, align 8
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
  %sunkaddr3 = ptrtoint %struct.my_decomp_master* %4 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 16
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  store i32 1, i32* %sunkaddr5, align 8
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
  %57 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %58 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %57, align 8
  %59 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %58, align 8
  %60 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %59(%struct.jpeg_common_struct* %60) #4
  br label %61

; <label>:61:                                     ; preds = %25, %21, %37, %53, %47
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
  %sunkaddr6 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 100
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  %88 = load i32, i32* %sunkaddr8, align 4
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %96, label %90

; <label>:90:                                     ; preds = %83
  %91 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %92 = bitcast %struct.jpeg_color_quantizer** %91 to void (%struct.jpeg_decompress_struct*, i32)***
  %93 = load void (%struct.jpeg_decompress_struct*, i32)**, void (%struct.jpeg_decompress_struct*, i32)*** %92, align 8
  %94 = load void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i32)** %93, align 8
  %sunkaddr9 = ptrtoint %struct.my_decomp_master* %4 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 16
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i32*
  %95 = load i32, i32* %sunkaddr11, align 8
  tail call void %94(%struct.jpeg_decompress_struct* nonnull %0, i32 %95) #4
  br label %96

; <label>:96:                                     ; preds = %83, %90
  %97 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 76
  %98 = bitcast %struct.jpeg_d_post_controller** %97 to void (%struct.jpeg_decompress_struct*, i32)***
  %99 = load void (%struct.jpeg_decompress_struct*, i32)**, void (%struct.jpeg_decompress_struct*, i32)*** %98, align 8
  %100 = load void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i32)** %99, align 8
  %sunkaddr12 = ptrtoint %struct.my_decomp_master* %4 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 16
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i32*
  %101 = load i32, i32* %sunkaddr14, align 8
  %102 = icmp ne i32 %101, 0
  %103 = select i1 %102, i32 3, i32 0
  tail call void %100(%struct.jpeg_decompress_struct* nonnull %0, i32 %103) #4
  %104 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 74
  %105 = bitcast %struct.jpeg_d_main_controller** %104 to void (%struct.jpeg_decompress_struct*, i32)***
  %106 = load void (%struct.jpeg_decompress_struct*, i32)**, void (%struct.jpeg_decompress_struct*, i32)*** %105, align 8
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
  %sunkaddr15 = ptrtoint %struct.my_decomp_master* %4 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 16
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32*
  %117 = load i32, i32* %sunkaddr17, align 8
  %118 = icmp ne i32 %117, 0
  %119 = select i1 %118, i32 2, i32 1
  %120 = add nsw i32 %119, %116
  %sunkaddr18 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr19 = add i64 %sunkaddr18, 16
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to %struct.jpeg_progress_mgr**
  %121 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr20, align 8
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
  %sunkaddr21 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 16
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to %struct.jpeg_progress_mgr**
  %137 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr23, align 8
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
define internal fastcc void @master_selection(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 73
  %3 = bitcast %struct.jpeg_decomp_master** %2 to %struct.my_decomp_master**
  %4 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  tail call void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct* %0)
  tail call fastcc void @prepare_range_limit_table(%struct.jpeg_decompress_struct* %0)
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
  %18 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %19 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %18, align 8
  %20 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %19, align 8
  %21 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %20(%struct.jpeg_common_struct* %21) #4
  br label %22

; <label>:22:                                     ; preds = %1, %14
  %23 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %4, i64 0, i32 1
  store i32 0, i32* %23, align 8
  %24 = tail call fastcc i32 @use_merged_upsample(%struct.jpeg_decompress_struct* nonnull %0)
  %25 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %4, i64 0, i32 2
  store i32 %24, i32* %25, align 4
  %26 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %4, i64 0, i32 3
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %28 = bitcast %struct.jpeg_color_quantizer** %26 to i8*
  call void @llvm.memset.p0i8.i64(i8* %28, i8 0, i64 16, i32 8, i1 false)
  %29 = load i32, i32* %27, align 4
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %35, label %31

; <label>:31:                                     ; preds = %22
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 14
  %33 = load i32, i32* %32, align 8
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %39

; <label>:35:                                     ; preds = %31, %22
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 23
  store i32 0, i32* %36, align 4
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 24
  store i32 0, i32* %37, align 8
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 25
  store i32 0, i32* %38, align 4
  br label %39

; <label>:39:                                     ; preds = %31, %35
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr1 = add i64 %sunkaddr, 100
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  %40 = load i32, i32* %sunkaddr2, align 4
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %95, label %42

; <label>:42:                                     ; preds = %39
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 15
  %44 = load i32, i32* %43, align 4
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %54, label %46

; <label>:46:                                     ; preds = %42
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %48 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %48, i64 0, i32 5
  store i32 46, i32* %49, align 8
  %50 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %51 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %50, align 8
  %52 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %51, align 8
  %53 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %52(%struct.jpeg_common_struct* %53) #4
  br label %54

; <label>:54:                                     ; preds = %42, %46
  %sunkaddr3 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 136
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  %55 = load i32, i32* %sunkaddr5, align 8
  %56 = icmp eq i32 %55, 3
  br i1 %56, label %62, label %57

; <label>:57:                                     ; preds = %54
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 23
  store i32 1, i32* %58, align 4
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 24
  store i32 0, i32* %59, align 8
  %60 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 25
  store i32 0, i32* %60, align 4
  %61 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  store i8** null, i8*** %61, align 8
  br label %74

; <label>:62:                                     ; preds = %54
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %64 = load i8**, i8*** %63, align 8
  %65 = icmp eq i8** %64, null
  br i1 %65, label %68, label %66

; <label>:66:                                     ; preds = %62
  %67 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 24
  store i32 1, i32* %67, align 8
  br label %74

; <label>:68:                                     ; preds = %62
  %69 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 21
  %70 = load i32, i32* %69, align 4
  %71 = icmp eq i32 %70, 0
  %72 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 23
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 25
  %.sink = select i1 %71, i32* %72, i32* %73
  store i32 1, i32* %.sink, align 4
  br label %74

; <label>:74:                                     ; preds = %66, %68, %57
  %75 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 23
  %76 = load i32, i32* %75, align 4
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %83, label %78

; <label>:78:                                     ; preds = %74
  tail call void @jinit_1pass_quantizer(%struct.jpeg_decompress_struct* nonnull %0) #4
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %80 = bitcast %struct.jpeg_color_quantizer** %79 to i64*
  %81 = load i64, i64* %80, align 8
  %82 = bitcast %struct.jpeg_color_quantizer** %26 to i64*
  store i64 %81, i64* %82, align 8
  br label %83

; <label>:83:                                     ; preds = %74, %78
  %84 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 25
  %85 = load i32, i32* %84, align 4
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %87, label %91

; <label>:87:                                     ; preds = %83
  %88 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 24
  %89 = load i32, i32* %88, align 8
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %95, label %91

; <label>:91:                                     ; preds = %87, %83
  tail call void @jinit_2pass_quantizer(%struct.jpeg_decompress_struct* nonnull %0) #4
  %92 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %93 = bitcast %struct.jpeg_color_quantizer** %92 to i64*
  %94 = load i64, i64* %93, align 8
  %sunkaddr6 = ptrtoint %struct.my_decomp_master* %4 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 40
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i64*
  store i64 %94, i64* %sunkaddr8, align 8
  br label %95

; <label>:95:                                     ; preds = %87, %39, %91
  %96 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 15
  %97 = load i32, i32* %96, align 4
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %99, label %107

; <label>:99:                                     ; preds = %95
  %sunkaddr9 = ptrtoint %struct.my_decomp_master* %4 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 28
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i32*
  %100 = load i32, i32* %sunkaddr11, align 4
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %103, label %102

; <label>:102:                                    ; preds = %99
  tail call void @jinit_merged_upsampler(%struct.jpeg_decompress_struct* nonnull %0) #4
  br label %104

; <label>:103:                                    ; preds = %99
  tail call void @jinit_color_deconverter(%struct.jpeg_decompress_struct* nonnull %0) #4
  tail call void @jinit_upsampler(%struct.jpeg_decompress_struct* nonnull %0) #4
  br label %104

; <label>:104:                                    ; preds = %103, %102
  %105 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 25
  %106 = load i32, i32* %105, align 4
  tail call void @jinit_d_post_controller(%struct.jpeg_decompress_struct* nonnull %0, i32 %106) #4
  br label %107

; <label>:107:                                    ; preds = %95, %104
  tail call void @jinit_inverse_dct(%struct.jpeg_decompress_struct* nonnull %0) #4
  %108 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 45
  %109 = load i32, i32* %108, align 4
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %119, label %111

; <label>:111:                                    ; preds = %107
  %112 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %113 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %112, align 8
  %114 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %113, i64 0, i32 5
  store i32 1, i32* %114, align 8
  %115 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %116 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %115, align 8
  %117 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %116, align 8
  %118 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %117(%struct.jpeg_common_struct* %118) #4
  br label %125

; <label>:119:                                    ; preds = %107
  %120 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 44
  %121 = load i32, i32* %120, align 8
  %122 = icmp eq i32 %121, 0
  br i1 %122, label %124, label %123

; <label>:123:                                    ; preds = %119
  tail call void @jinit_phuff_decoder(%struct.jpeg_decompress_struct* nonnull %0) #4
  br label %125

; <label>:124:                                    ; preds = %119
  tail call void @jinit_huff_decoder(%struct.jpeg_decompress_struct* nonnull %0) #4
  br label %125

; <label>:125:                                    ; preds = %123, %124, %111
  %126 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %127 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %126, align 8
  %128 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %127, i64 0, i32 4
  %129 = load i32, i32* %128, align 8
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %131, label %135

; <label>:131:                                    ; preds = %125
  %132 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 14
  %133 = load i32, i32* %132, align 8
  %134 = icmp ne i32 %133, 0
  br label %135

; <label>:135:                                    ; preds = %125, %131
  %136 = phi i1 [ %134, %131 ], [ true, %125 ]
  %137 = zext i1 %136 to i32
  tail call void @jinit_d_coef_controller(%struct.jpeg_decompress_struct* nonnull %0, i32 %137) #4
  %sunkaddr12 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 84
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i32*
  %138 = load i32, i32* %sunkaddr14, align 4
  %139 = icmp eq i32 %138, 0
  br i1 %139, label %140, label %141

; <label>:140:                                    ; preds = %135
  tail call void @jinit_d_main_controller(%struct.jpeg_decompress_struct* nonnull %0, i32 0) #4
  br label %141

; <label>:141:                                    ; preds = %135, %140
  %142 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %143 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %142, align 8
  %144 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %143, i64 0, i32 6
  %145 = bitcast {}** %144 to void (%struct.jpeg_common_struct*)**
  %146 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %145, align 8
  %147 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %146(%struct.jpeg_common_struct* %147) #4
  %sunkaddr15 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 560
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to %struct.jpeg_input_controller**
  %148 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %sunkaddr17, align 8
  %149 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %148, i64 0, i32 2
  %150 = bitcast {}** %149 to void (%struct.jpeg_decompress_struct*)**
  %151 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %150, align 8
  tail call void %151(%struct.jpeg_decompress_struct* nonnull %0) #4
  %152 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 2
  %153 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %152, align 8
  %154 = icmp eq %struct.jpeg_progress_mgr* %153, null
  br i1 %154, label %190, label %155

; <label>:155:                                    ; preds = %141
  %156 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 14
  %157 = load i32, i32* %156, align 8
  %158 = icmp eq i32 %157, 0
  br i1 %158, label %159, label %190

; <label>:159:                                    ; preds = %155
  %sunkaddr18 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr19 = add i64 %sunkaddr18, 560
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to %struct.jpeg_input_controller**
  %160 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %sunkaddr20, align 8
  %161 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %160, i64 0, i32 4
  %162 = load i32, i32* %161, align 8
  %163 = icmp eq i32 %162, 0
  br i1 %163, label %190, label %164

; <label>:164:                                    ; preds = %159
  %165 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 44
  %166 = load i32, i32* %165, align 8
  %167 = icmp eq i32 %166, 0
  %168 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %169 = load i32, i32* %168, align 8
  %170 = mul nsw i32 %169, 3
  %171 = add nsw i32 %170, 2
  %.0 = select i1 %167, i32 %169, i32 %171
  %172 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %153, i64 0, i32 1
  store i64 0, i64* %172, align 8
  %173 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 60
  %174 = load i32, i32* %173, align 8
  %175 = zext i32 %174 to i64
  %176 = sext i32 %.0 to i64
  %177 = mul nsw i64 %176, %175
  %sunkaddr21 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 16
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to %struct.jpeg_progress_mgr**
  %178 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr23, align 8
  %179 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %178, i64 0, i32 2
  store i64 %177, i64* %179, align 8
  %180 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr23, align 8
  %181 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %180, i64 0, i32 3
  store i32 0, i32* %181, align 8
  %182 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 25
  %183 = load i32, i32* %182, align 4
  %184 = icmp ne i32 %183, 0
  %185 = select i1 %184, i32 3, i32 2
  %186 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr23, align 8
  %187 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %186, i64 0, i32 4
  store i32 %185, i32* %187, align 4
  %sunkaddr24 = ptrtoint %struct.my_decomp_master* %4 to i64
  %sunkaddr25 = add i64 %sunkaddr24, 24
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to i32*
  %188 = load i32, i32* %sunkaddr26, align 8
  %189 = add nsw i32 %188, 1
  store i32 %189, i32* %sunkaddr26, align 8
  br label %190

; <label>:190:                                    ; preds = %159, %155, %141, %164
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @prepare_range_limit_table(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
min.iters.checked:
  %1 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %2 = bitcast %struct.jpeg_memory_mgr** %1 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %3 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %2, align 8
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %3, align 8
  %5 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %6 = tail call i8* %4(%struct.jpeg_common_struct* %5, i32 1, i64 1408) #4
  %7 = getelementptr inbounds i8, i8* %6, i64 256
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  store i8* %7, i8** %8, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 256, i32 1, i1 false)
  br label %vector.body

vector.body:                                      ; preds = %min.iters.checked
  %9 = getelementptr i8, i8* %6, i64 256
  %10 = bitcast i8* %9 to <128 x i8>*
  store <128 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 16, i8 17, i8 18, i8 19, i8 20, i8 21, i8 22, i8 23, i8 24, i8 25, i8 26, i8 27, i8 28, i8 29, i8 30, i8 31, i8 32, i8 33, i8 34, i8 35, i8 36, i8 37, i8 38, i8 39, i8 40, i8 41, i8 42, i8 43, i8 44, i8 45, i8 46, i8 47, i8 48, i8 49, i8 50, i8 51, i8 52, i8 53, i8 54, i8 55, i8 56, i8 57, i8 58, i8 59, i8 60, i8 61, i8 62, i8 63, i8 64, i8 65, i8 66, i8 67, i8 68, i8 69, i8 70, i8 71, i8 72, i8 73, i8 74, i8 75, i8 76, i8 77, i8 78, i8 79, i8 80, i8 81, i8 82, i8 83, i8 84, i8 85, i8 86, i8 87, i8 88, i8 89, i8 90, i8 91, i8 92, i8 93, i8 94, i8 95, i8 96, i8 97, i8 98, i8 99, i8 100, i8 101, i8 102, i8 103, i8 104, i8 105, i8 106, i8 107, i8 108, i8 109, i8 110, i8 111, i8 112, i8 113, i8 114, i8 115, i8 116, i8 117, i8 118, i8 119, i8 120, i8 121, i8 122, i8 123, i8 124, i8 125, i8 126, i8 127>, <128 x i8>* %10, align 1
  %11 = getelementptr i8, i8* %6, i64 384
  %12 = bitcast i8* %11 to <128 x i8>*
  store <128 x i8> <i8 -128, i8 -127, i8 -126, i8 -125, i8 -124, i8 -123, i8 -122, i8 -121, i8 -120, i8 -119, i8 -118, i8 -117, i8 -116, i8 -115, i8 -114, i8 -113, i8 -112, i8 -111, i8 -110, i8 -109, i8 -108, i8 -107, i8 -106, i8 -105, i8 -104, i8 -103, i8 -102, i8 -101, i8 -100, i8 -99, i8 -98, i8 -97, i8 -96, i8 -95, i8 -94, i8 -93, i8 -92, i8 -91, i8 -90, i8 -89, i8 -88, i8 -87, i8 -86, i8 -85, i8 -84, i8 -83, i8 -82, i8 -81, i8 -80, i8 -79, i8 -78, i8 -77, i8 -76, i8 -75, i8 -74, i8 -73, i8 -72, i8 -71, i8 -70, i8 -69, i8 -68, i8 -67, i8 -66, i8 -65, i8 -64, i8 -63, i8 -62, i8 -61, i8 -60, i8 -59, i8 -58, i8 -57, i8 -56, i8 -55, i8 -54, i8 -53, i8 -52, i8 -51, i8 -50, i8 -49, i8 -48, i8 -47, i8 -46, i8 -45, i8 -44, i8 -43, i8 -42, i8 -41, i8 -40, i8 -39, i8 -38, i8 -37, i8 -36, i8 -35, i8 -34, i8 -33, i8 -32, i8 -31, i8 -30, i8 -29, i8 -28, i8 -27, i8 -26, i8 -25, i8 -24, i8 -23, i8 -22, i8 -21, i8 -20, i8 -19, i8 -18, i8 -17, i8 -16, i8 -15, i8 -14, i8 -13, i8 -12, i8 -11, i8 -10, i8 -9, i8 -8, i8 -7, i8 -6, i8 -5, i8 -4, i8 -3, i8 -2, i8 -1>, <128 x i8>* %12, align 1
  %scevgep = getelementptr i8, i8* %6, i64 512
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 -1, i64 384, i32 1, i1 false)
  %13 = getelementptr inbounds i8, i8* %6, i64 896
  tail call void @llvm.memset.p0i8.i64(i8* %13, i8 0, i64 384, i32 1, i1 false)
  %14 = getelementptr inbounds i8, i8* %6, i64 1280
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr3 = add i64 %sunkaddr, 408
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to i8**
  %15 = load i8*, i8** %sunkaddr4, align 8
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 128, i32 1, i1 false)
  ret void
}

declare void @jinit_1pass_quantizer(%struct.jpeg_decompress_struct*) local_unnamed_addr #1

declare void @jinit_2pass_quantizer(%struct.jpeg_decompress_struct*) local_unnamed_addr #1

declare void @jinit_merged_upsampler(%struct.jpeg_decompress_struct*) local_unnamed_addr #1

declare void @jinit_color_deconverter(%struct.jpeg_decompress_struct*) local_unnamed_addr #1

declare void @jinit_upsampler(%struct.jpeg_decompress_struct*) local_unnamed_addr #1

declare void @jinit_d_post_controller(%struct.jpeg_decompress_struct*, i32) local_unnamed_addr #1

declare void @jinit_inverse_dct(%struct.jpeg_decompress_struct*) local_unnamed_addr #1

declare void @jinit_phuff_decoder(%struct.jpeg_decompress_struct*) local_unnamed_addr #1

declare void @jinit_huff_decoder(%struct.jpeg_decompress_struct*) local_unnamed_addr #1

declare void @jinit_d_coef_controller(%struct.jpeg_decompress_struct*, i32) local_unnamed_addr #1

declare void @jinit_d_main_controller(%struct.jpeg_decompress_struct*, i32) local_unnamed_addr #1

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

; ModuleID = 'jdphuff.ll'
source_filename = "jdphuff.c"
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
%struct.phuff_entropy_decoder = type { %struct.jpeg_entropy_decoder, %struct.bitread_perm_state, %struct.savable_state, i32, [4 x %struct.d_derived_tbl*], %struct.d_derived_tbl* }
%struct.bitread_perm_state = type { i64, i32, i32 }
%struct.savable_state = type { i32, [4 x i32] }
%struct.d_derived_tbl = type { [17 x i64], [18 x i64], [17 x i32], %struct.JHUFF_TBL*, [256 x i32], [256 x i8] }
%struct.bitread_working_state = type { i8*, i64, i32, i64, i32, %struct.jpeg_decompress_struct*, i32* }

@extend_test = internal constant [16 x i32] [i32 0, i32 1, i32 2, i32 4, i32 8, i32 16, i32 32, i32 64, i32 128, i32 256, i32 512, i32 1024, i32 2048, i32 4096, i32 8192, i32 16384], align 16
@extend_offset = internal constant [16 x i32] [i32 0, i32 -1, i32 -3, i32 -7, i32 -15, i32 -31, i32 -63, i32 -127, i32 -255, i32 -511, i32 -1023, i32 -2047, i32 -4095, i32 -8191, i32 -16383, i32 -32767], align 16
@jpeg_natural_order = external constant [0 x i32], align 4

; Function Attrs: noinline nounwind uwtable
define void @jinit_phuff_decoder(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %3, i64 0, i32 0
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 96) #3
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %9 = bitcast %struct.jpeg_entropy_decoder** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_pass_phuff_decoder, void (%struct.jpeg_decompress_struct*)** %10, align 8
  %11 = getelementptr inbounds i8, i8* %7, i64 56
  call void @llvm.memset.p0i8.i64(i8* %11, i8 0, i64 32, i32 8, i1 false)
  %12 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %13 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %12, i64 0, i32 0
  %14 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %16 = load i32, i32* %15, align 8
  %17 = shl nsw i32 %16, 6
  %18 = sext i32 %17 to i64
  %19 = shl nsw i64 %18, 2
  %20 = tail call i8* %14(%struct.jpeg_common_struct* %6, i32 1, i64 %19) #3
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 38
  %22 = bitcast [64 x i32]** %21 to i8**
  store i8* %20, i8** %22, align 8
  %23 = load i32, i32* %15, align 8
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %.preheader.preheader, label %._crit_edge

.preheader.preheader:                             ; preds = %1
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvar = phi i64 [ %indvar.next, %.preheader ], [ 0, %.preheader.preheader ]
  %.018 = phi i32 [ %26, %.preheader ], [ 0, %.preheader.preheader ]
  %25 = shl i64 %indvar, 8
  %scevgep10 = getelementptr i8, i8* %20, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep10, i8 -1, i64 256, i32 4, i1 false)
  %26 = add nuw nsw i32 %.018, 1
  %27 = load i32, i32* %15, align 8
  %28 = icmp slt i32 %26, %27
  %indvar.next = add i64 %indvar, 1
  br i1 %28, label %.preheader, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.preheader
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_phuff_decoder(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %3 = bitcast %struct.jpeg_entropy_decoder** %2 to %struct.phuff_entropy_decoder**
  %4 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 68
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 0
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 69
  br i1 %7, label %14, label %9

; <label>:9:                                      ; preds = %1
  %10 = load i32, i32* %8, align 8
  %11 = icmp sgt i32 %6, %10
  %12 = icmp sgt i32 %10, 63
  %or.cond11 = or i1 %11, %12
  %.13 = zext i1 %or.cond11 to i32
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 62
  br label %14

; <label>:14:                                     ; preds = %1, %9
  %.sink = phi i32* [ %13, %9 ], [ %8, %1 ]
  %.sink10 = phi i32 [ 1, %9 ], [ 0, %1 ]
  %.13.sink = phi i32 [ %.13, %9 ], [ 0, %1 ]
  %15 = load i32, i32* %.sink, align 8
  %16 = icmp ne i32 %15, %.sink10
  %..13 = select i1 %16, i32 1, i32 %.13.sink
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 70
  %18 = load i32, i32* %17, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %25, label %20

; <label>:20:                                     ; preds = %14
  %21 = add nsw i32 %18, -1
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 71
  %23 = load i32, i32* %22, align 8
  %24 = icmp ne i32 %23, %21
  %..3 = select i1 %24, i32 1, i32 %..13
  br label %25

; <label>:25:                                     ; preds = %14, %20
  %.5 = phi i32 [ %..3, %20 ], [ %..13, %14 ]
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 71
  %27 = load i32, i32* %26, align 8
  %28 = icmp sgt i32 %27, 13
  %29 = icmp ne i32 %.5, 0
  %30 = or i1 %29, %28
  br i1 %30, label %31, label %.preheader12

; <label>:31:                                     ; preds = %25
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %33 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %33, i64 0, i32 5
  store i32 14, i32* %34, align 8
  %35 = load i32, i32* %5, align 4
  %36 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %37 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %36, i64 0, i32 6, i32 0, i64 0
  store i32 %35, i32* %37, align 4
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 69
  %39 = load i32, i32* %38, align 8
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i64 0, i32 6, i32 0, i64 1
  store i32 %39, i32* %41, align 4
  %42 = load i32, i32* %17, align 4
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i64 0, i32 6, i32 0, i64 2
  store i32 %42, i32* %44, align 4
  %45 = load i32, i32* %26, align 8
  %46 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %47 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %46, i64 0, i32 6, i32 0, i64 3
  store i32 %45, i32* %47, align 4
  %48 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %49 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %48, i64 0, i32 0
  %50 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %49, align 8
  %51 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %50(%struct.jpeg_common_struct* %51) #3
  br label %.preheader12

.preheader12:                                     ; preds = %31, %25
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 62
  %53 = load i32, i32* %52, align 8
  %54 = icmp sgt i32 %53, 0
  br i1 %54, label %.lr.ph19, label %._crit_edge20

.lr.ph19:                                         ; preds = %.preheader12
  %55 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 38
  %56 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 69
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %58 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %60 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  br i1 %7, label %.lr.ph19.split.us.preheader, label %.lr.ph19.split.preheader

.lr.ph19.split.preheader:                         ; preds = %.lr.ph19
  br label %.lr.ph19.split

.lr.ph19.split.us.preheader:                      ; preds = %.lr.ph19
  br label %.lr.ph19.split.us

.lr.ph19.split.us:                                ; preds = %.lr.ph19.split.us.preheader, %._crit_edge17.us
  %indvars.iv618.us = phi i64 [ %indvars.iv.next7.us, %._crit_edge17.us ], [ 0, %.lr.ph19.split.us.preheader ]
  %61 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv618.us
  %62 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %61, align 8
  %63 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %62, i64 0, i32 1
  %64 = load i32, i32* %63, align 4
  %65 = load [64 x i32]*, [64 x i32]** %55, align 8
  %66 = sext i32 %64 to i64
  %67 = load i32, i32* %5, align 4
  %68 = load i32, i32* %56, align 8
  %69 = icmp sgt i32 %67, %68
  br i1 %69, label %._crit_edge17.us, label %.lr.ph16.us.preheader

.lr.ph16.us.preheader:                            ; preds = %.lr.ph19.split.us
  %70 = sext i32 %67 to i64
  br label %.lr.ph16.us

.lr.ph16.us:                                      ; preds = %.lr.ph16.us.preheader, %87
  %indvars.iv414.us = phi i64 [ %indvars.iv.next5.us, %87 ], [ %70, %.lr.ph16.us.preheader ]
  %71 = getelementptr inbounds [64 x i32], [64 x i32]* %65, i64 %66, i64 %indvars.iv414.us
  %72 = load i32, i32* %71, align 4
  %73 = icmp sgt i32 %72, 0
  %..us = select i1 %73, i32 %72, i32 0
  %74 = load i32, i32* %17, align 4
  %75 = icmp eq i32 %74, %..us
  br i1 %75, label %87, label %76

; <label>:76:                                     ; preds = %.lr.ph16.us
  %77 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %78 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %77, i64 0, i32 5
  store i32 111, i32* %78, align 8
  %79 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %80 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %79, i64 0, i32 6, i32 0, i64 0
  store i32 %64, i32* %80, align 4
  %81 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %82 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %81, i64 0, i32 6, i32 0, i64 1
  %83 = trunc i64 %indvars.iv414.us to i32
  store i32 %83, i32* %82, align 4
  %84 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %85 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %84, i64 0, i32 1
  %86 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %85, align 8
  tail call void %86(%struct.jpeg_common_struct* nonnull %58, i32 -1) #3
  br label %87

; <label>:87:                                     ; preds = %76, %.lr.ph16.us
  %88 = load i32, i32* %26, align 8
  store i32 %88, i32* %71, align 4
  %indvars.iv.next5.us = add i64 %indvars.iv414.us, 1
  %89 = load i32, i32* %56, align 8
  %90 = sext i32 %89 to i64
  %91 = icmp sgt i64 %indvars.iv.next5.us, %90
  br i1 %91, label %._crit_edge17.us.loopexit, label %.lr.ph16.us

._crit_edge17.us.loopexit:                        ; preds = %87
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %.lr.ph19.split.us
  %indvars.iv.next7.us = add nuw i64 %indvars.iv618.us, 1
  %92 = load i32, i32* %52, align 8
  %93 = sext i32 %92 to i64
  %94 = icmp slt i64 %indvars.iv.next7.us, %93
  br i1 %94, label %.lr.ph19.split.us, label %._crit_edge20.loopexit

.lr.ph19.split:                                   ; preds = %.lr.ph19.split.preheader, %._crit_edge17
  %indvars.iv618 = phi i64 [ %indvars.iv.next7, %._crit_edge17 ], [ 0, %.lr.ph19.split.preheader ]
  %95 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv618
  %96 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %95, align 8
  %97 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %96, i64 0, i32 1
  %98 = load i32, i32* %97, align 4
  %99 = load [64 x i32]*, [64 x i32]** %55, align 8
  %100 = sext i32 %98 to i64
  %101 = getelementptr inbounds [64 x i32], [64 x i32]* %99, i64 %100, i64 0
  %102 = load i32, i32* %101, align 4
  %103 = icmp slt i32 %102, 0
  br i1 %103, label %104, label %114

; <label>:104:                                    ; preds = %.lr.ph19.split
  %105 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %59, align 8
  %106 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %105, i64 0, i32 5
  store i32 111, i32* %106, align 8
  %107 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %59, align 8
  %108 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %107, i64 0, i32 6, i32 0, i64 0
  store i32 %98, i32* %108, align 4
  %109 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %59, align 8
  %110 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %109, i64 0, i32 6, i32 0, i64 1
  store i32 0, i32* %110, align 4
  %111 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %59, align 8
  %112 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %111, i64 0, i32 1
  %113 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %112, align 8
  tail call void %113(%struct.jpeg_common_struct* nonnull %60, i32 -1) #3
  br label %114

; <label>:114:                                    ; preds = %104, %.lr.ph19.split
  %115 = load i32, i32* %5, align 4
  %116 = load i32, i32* %56, align 8
  %117 = icmp sgt i32 %115, %116
  br i1 %117, label %._crit_edge17, label %.lr.ph16.preheader

.lr.ph16.preheader:                               ; preds = %114
  %118 = sext i32 %115 to i64
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %.lr.ph16.preheader, %135
  %indvars.iv414 = phi i64 [ %indvars.iv.next5, %135 ], [ %118, %.lr.ph16.preheader ]
  %119 = getelementptr inbounds [64 x i32], [64 x i32]* %99, i64 %100, i64 %indvars.iv414
  %120 = load i32, i32* %119, align 4
  %121 = icmp sgt i32 %120, 0
  %. = select i1 %121, i32 %120, i32 0
  %122 = load i32, i32* %17, align 4
  %123 = icmp eq i32 %122, %.
  br i1 %123, label %135, label %124

; <label>:124:                                    ; preds = %.lr.ph16
  %125 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %126 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %125, i64 0, i32 5
  store i32 111, i32* %126, align 8
  %127 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %128 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %127, i64 0, i32 6, i32 0, i64 0
  store i32 %98, i32* %128, align 4
  %129 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %130 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %129, i64 0, i32 6, i32 0, i64 1
  %131 = trunc i64 %indvars.iv414 to i32
  store i32 %131, i32* %130, align 4
  %132 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %133 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %132, i64 0, i32 1
  %134 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %133, align 8
  tail call void %134(%struct.jpeg_common_struct* nonnull %58, i32 -1) #3
  br label %135

; <label>:135:                                    ; preds = %.lr.ph16, %124
  %136 = load i32, i32* %26, align 8
  store i32 %136, i32* %119, align 4
  %indvars.iv.next5 = add i64 %indvars.iv414, 1
  %137 = load i32, i32* %56, align 8
  %138 = sext i32 %137 to i64
  %139 = icmp sgt i64 %indvars.iv.next5, %138
  br i1 %139, label %._crit_edge17.loopexit, label %.lr.ph16

._crit_edge17.loopexit:                           ; preds = %135
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %114
  %indvars.iv.next7 = add nuw i64 %indvars.iv618, 1
  %140 = load i32, i32* %52, align 8
  %141 = sext i32 %140 to i64
  %142 = icmp slt i64 %indvars.iv.next7, %141
  br i1 %142, label %.lr.ph19.split, label %._crit_edge20.loopexit28

._crit_edge20.loopexit:                           ; preds = %._crit_edge17.us
  br label %._crit_edge20

._crit_edge20.loopexit28:                         ; preds = %._crit_edge17
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit28, %._crit_edge20.loopexit, %.preheader12
  %143 = load i32, i32* %17, align 4
  %144 = icmp eq i32 %143, 0
  %145 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 0, i32 1
  %decode_mcu_AC_refine.sink = select i1 %7, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu_DC_refine, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu_AC_refine
  %decode_mcu_AC_first.sink = select i1 %7, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu_DC_first, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu_AC_first
  %decode_mcu_AC_refine.sink.sink = select i1 %144, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* %decode_mcu_AC_first.sink, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* %decode_mcu_AC_refine.sink
  store i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* %decode_mcu_AC_refine.sink.sink, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)** %145, align 8
  %146 = load i32, i32* %52, align 8
  %147 = icmp sgt i32 %146, 0
  br i1 %147, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge20
  %148 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %149 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %150 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %151 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %152 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 5
  %153 = bitcast %struct.d_derived_tbl** %152 to i64*
  br i1 %7, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %180
  %indvars.iv13.us = phi i64 [ %indvars.iv.next.us, %180 ], [ 0, %.lr.ph.split.us.preheader ]
  %154 = load i32, i32* %17, align 4
  %155 = icmp eq i32 %154, 0
  br i1 %155, label %156, label %180

; <label>:156:                                    ; preds = %.lr.ph.split.us
  %157 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv13.us
  %158 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %157, align 8
  %159 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %158, i64 0, i32 5
  %160 = load i32, i32* %159, align 4
  %161 = icmp ugt i32 %160, 3
  br i1 %161, label %167, label %162

; <label>:162:                                    ; preds = %156
  %163 = sext i32 %160 to i64
  %164 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 40, i64 %163
  %165 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %164, align 8
  %166 = icmp eq %struct.JHUFF_TBL* %165, null
  br i1 %166, label %167, label %175

; <label>:167:                                    ; preds = %162, %156
  %168 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %148, align 8
  %169 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %168, i64 0, i32 5
  store i32 49, i32* %169, align 8
  %170 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %148, align 8
  %171 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %170, i64 0, i32 6, i32 0, i64 0
  store i32 %160, i32* %171, align 4
  %172 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %148, align 8
  %173 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %172, i64 0, i32 0
  %174 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %173, align 8
  tail call void %174(%struct.jpeg_common_struct* nonnull %149) #3
  br label %175

; <label>:175:                                    ; preds = %167, %162
  %176 = sext i32 %160 to i64
  %177 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 40, i64 %176
  %178 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %177, align 8
  %179 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 4, i64 %176
  tail call void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct* nonnull %0, %struct.JHUFF_TBL* %178, %struct.d_derived_tbl** %179) #3
  br label %180

; <label>:180:                                    ; preds = %175, %.lr.ph.split.us
  %181 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 2, i32 1, i64 %indvars.iv13.us
  store i32 0, i32* %181, align 4
  %indvars.iv.next.us = add nuw i64 %indvars.iv13.us, 1
  %182 = load i32, i32* %52, align 8
  %183 = sext i32 %182 to i64
  %184 = icmp slt i64 %indvars.iv.next.us, %183
  br i1 %184, label %.lr.ph.split.us, label %._crit_edge.loopexit

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %203
  %indvars.iv13 = phi i64 [ %indvars.iv.next, %203 ], [ 0, %.lr.ph.split.preheader ]
  %185 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv13
  %186 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %185, align 8
  %187 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %186, i64 0, i32 6
  %188 = load i32, i32* %187, align 8
  %189 = icmp ugt i32 %188, 3
  br i1 %189, label %195, label %190

; <label>:190:                                    ; preds = %.lr.ph.split
  %191 = sext i32 %188 to i64
  %192 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 41, i64 %191
  %193 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %192, align 8
  %194 = icmp eq %struct.JHUFF_TBL* %193, null
  br i1 %194, label %195, label %203

; <label>:195:                                    ; preds = %190, %.lr.ph.split
  %196 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %150, align 8
  %197 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %196, i64 0, i32 5
  store i32 49, i32* %197, align 8
  %198 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %150, align 8
  %199 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %198, i64 0, i32 6, i32 0, i64 0
  store i32 %188, i32* %199, align 4
  %200 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %150, align 8
  %201 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %200, i64 0, i32 0
  %202 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %201, align 8
  tail call void %202(%struct.jpeg_common_struct* nonnull %151) #3
  br label %203

; <label>:203:                                    ; preds = %195, %190
  %204 = sext i32 %188 to i64
  %205 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 41, i64 %204
  %206 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %205, align 8
  %207 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 4, i64 %204
  tail call void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct* nonnull %0, %struct.JHUFF_TBL* %206, %struct.d_derived_tbl** %207) #3
  %208 = bitcast %struct.d_derived_tbl** %207 to i64*
  %209 = load i64, i64* %208, align 8
  store i64 %209, i64* %153, align 8
  %210 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 2, i32 1, i64 %indvars.iv13
  store i32 0, i32* %210, align 4
  %indvars.iv.next = add nuw i64 %indvars.iv13, 1
  %211 = load i32, i32* %52, align 8
  %212 = sext i32 %211 to i64
  %213 = icmp slt i64 %indvars.iv.next, %212
  br i1 %213, label %.lr.ph.split, label %._crit_edge.loopexit27

._crit_edge.loopexit:                             ; preds = %180
  br label %._crit_edge

._crit_edge.loopexit27:                           ; preds = %203
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit27, %._crit_edge.loopexit, %._crit_edge20
  %214 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 1, i32 0
  %215 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 49
  %216 = bitcast i64* %214 to i8*
  call void @llvm.memset.p0i8.i64(i8* %216, i8 0, i64 20, i32 8, i1 false)
  %217 = load i32, i32* %215, align 8
  %218 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 3
  store i32 %217, i32* %218, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @decode_mcu_DC_first(%struct.jpeg_decompress_struct*, [64 x i16]** nocapture readonly) #0 {
  %3 = alloca %struct.bitread_working_state, align 8
  %4 = alloca %struct.savable_state, align 4
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %6 = bitcast %struct.jpeg_entropy_decoder** %5 to %struct.phuff_entropy_decoder**
  %7 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 71
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 49
  %11 = load i32, i32* %10, align 8
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %20, label %13

; <label>:13:                                     ; preds = %2
  %14 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 3
  %15 = load i32, i32* %14, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %20

; <label>:17:                                     ; preds = %13
  %18 = tail call i32 @process_restart(%struct.jpeg_decompress_struct* nonnull %0)
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %.loopexit, label %20

; <label>:20:                                     ; preds = %17, %2, %13
  %21 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 5
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %21, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %23 = bitcast %struct.jpeg_source_mgr** %22 to i64**
  %24 = load i64*, i64** %23, align 8
  %25 = load i64, i64* %24, align 8
  %26 = bitcast %struct.bitread_working_state* %3 to i64*
  store i64 %25, i64* %26, align 8
  %27 = getelementptr inbounds i64, i64* %24, i64 1
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 1
  store i64 %28, i64* %29, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  %31 = load i32, i32* %30, align 4
  %32 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 2
  store i32 %31, i32* %32, align 8
  %33 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 1, i32 0
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 1, i32 1
  %36 = load i32, i32* %35, align 8
  %37 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 1, i32 2
  %38 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 6
  store i32* %37, i32** %38, align 8
  %39 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 2
  %40 = bitcast %struct.savable_state* %4 to i8*
  %41 = bitcast %struct.savable_state* %39 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %40, i8* %41, i64 20, i32 4, i1 false)
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 66
  %43 = load i32, i32* %42, align 8
  %44 = icmp sgt i32 %43, 0
  br i1 %44, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %20
  %45 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %46 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %47 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %48 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %49 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %50 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  br label %51

; <label>:51:                                     ; preds = %.lr.ph, %117
  %.0222 = phi i32 [ %36, %.lr.ph ], [ %.5, %117 ]
  %.0321 = phi i64 [ %34, %.lr.ph ], [ %.58, %117 ]
  %indvars.iv20 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %117 ]
  %52 = getelementptr inbounds [64 x i16]*, [64 x i16]** %1, i64 %indvars.iv20
  %53 = load [64 x i16]*, [64 x i16]** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 67, i64 %indvars.iv20
  %55 = load i32, i32* %54, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %56
  %58 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %57, align 8
  %59 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %58, i64 0, i32 5
  %60 = load i32, i32* %59, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 4, i64 %61
  %63 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %62, align 8
  %64 = icmp slt i32 %.0222, 8
  br i1 %64, label %65, label %72

; <label>:65:                                     ; preds = %51
  %66 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.0321, i32 %.0222, i32 0) #3
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %.loopexit.loopexit, label %68

; <label>:68:                                     ; preds = %65
  %69 = load i64, i64* %45, align 8
  %70 = load i32, i32* %46, align 8
  %71 = icmp slt i32 %70, 8
  br i1 %71, label %85, label %72

; <label>:72:                                     ; preds = %68, %51
  %.14 = phi i64 [ %.0321, %51 ], [ %69, %68 ]
  %.1 = phi i32 [ %.0222, %51 ], [ %70, %68 ]
  %73 = add nsw i32 %.1, -8
  %74 = zext i32 %73 to i64
  %75 = ashr i64 %.14, %74
  %76 = and i64 %75, 255
  %77 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %63, i64 0, i32 4, i64 %76
  %78 = load i32, i32* %77, align 4
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %85, label %80

; <label>:80:                                     ; preds = %72
  %81 = sub nsw i32 %.1, %78
  %82 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %63, i64 0, i32 5, i64 %76
  %83 = load i8, i8* %82, align 1
  %84 = zext i8 %83 to i32
  br label %91

; <label>:85:                                     ; preds = %72, %68
  %.25 = phi i64 [ %69, %68 ], [ %.14, %72 ]
  %.2 = phi i32 [ %70, %68 ], [ %.1, %72 ]
  %.01 = phi i32 [ 1, %68 ], [ 9, %72 ]
  %86 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* nonnull %3, i64 %.25, i32 %.2, %struct.d_derived_tbl* %63, i32 %.01) #3
  %87 = icmp slt i32 %86, 0
  br i1 %87, label %.loopexit.loopexit, label %88

; <label>:88:                                     ; preds = %85
  %89 = load i64, i64* %47, align 8
  %90 = load i32, i32* %48, align 8
  br label %91

; <label>:91:                                     ; preds = %88, %80
  %.010 = phi i32 [ %86, %88 ], [ %84, %80 ]
  %.36 = phi i64 [ %89, %88 ], [ %.14, %80 ]
  %.3 = phi i32 [ %90, %88 ], [ %81, %80 ]
  %92 = icmp eq i32 %.010, 0
  br i1 %92, label %117, label %93

; <label>:93:                                     ; preds = %91
  %94 = icmp slt i32 %.3, %.010
  br i1 %94, label %95, label %101

; <label>:95:                                     ; preds = %93
  %96 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.36, i32 %.3, i32 %.010) #3
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %.loopexit.loopexit, label %98

; <label>:98:                                     ; preds = %95
  %99 = load i64, i64* %49, align 8
  %100 = load i32, i32* %50, align 8
  br label %101

; <label>:101:                                    ; preds = %98, %93
  %.47 = phi i64 [ %99, %98 ], [ %.36, %93 ]
  %.4 = phi i32 [ %100, %98 ], [ %.3, %93 ]
  %102 = sub nsw i32 %.4, %.010
  %103 = zext i32 %102 to i64
  %104 = ashr i64 %.47, %103
  %105 = trunc i64 %104 to i32
  %106 = shl i32 1, %.010
  %107 = add nsw i32 %106, -1
  %108 = and i32 %105, %107
  %109 = sext i32 %.010 to i64
  %110 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_test, i64 0, i64 %109
  %111 = load i32, i32* %110, align 4
  %112 = icmp slt i32 %108, %111
  br i1 %112, label %113, label %117

; <label>:113:                                    ; preds = %101
  %114 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_offset, i64 0, i64 %109
  %115 = load i32, i32* %114, align 4
  %116 = add nsw i32 %115, %108
  br label %117

; <label>:117:                                    ; preds = %91, %113, %101
  %.111 = phi i32 [ 0, %91 ], [ %116, %113 ], [ %108, %101 ]
  %.58 = phi i64 [ %.36, %91 ], [ %.47, %113 ], [ %.47, %101 ]
  %.5 = phi i32 [ %.3, %91 ], [ %102, %113 ], [ %102, %101 ]
  %118 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %4, i64 0, i32 1, i64 %56
  %119 = load i32, i32* %118, align 4
  %120 = add nsw i32 %119, %.111
  store i32 %120, i32* %118, align 4
  %121 = shl i32 %120, %9
  %122 = trunc i32 %121 to i16
  %123 = getelementptr inbounds [64 x i16], [64 x i16]* %53, i64 0, i64 0
  store i16 %122, i16* %123, align 2
  %indvars.iv.next = add nuw i64 %indvars.iv20, 1
  %124 = load i32, i32* %42, align 8
  %125 = sext i32 %124 to i64
  %126 = icmp slt i64 %indvars.iv.next, %125
  br i1 %126, label %51, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %117
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %20
  %.03.lcssa = phi i64 [ %34, %20 ], [ %.58, %._crit_edge.loopexit ]
  %.02.lcssa = phi i32 [ %36, %20 ], [ %.5, %._crit_edge.loopexit ]
  %127 = bitcast %struct.bitread_working_state* %3 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = bitcast %struct.jpeg_source_mgr** %22 to i64**
  %130 = load i64*, i64** %129, align 8
  store i64 %128, i64* %130, align 8
  %131 = load i64, i64* %29, align 8
  %132 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %22, align 8
  %133 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %132, i64 0, i32 1
  store i64 %131, i64* %133, align 8
  %134 = load i32, i32* %32, align 8
  store i32 %134, i32* %30, align 4
  store i64 %.03.lcssa, i64* %33, align 8
  store i32 %.02.lcssa, i32* %35, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %41, i8* nonnull %40, i64 20, i32 4, i1 false)
  %135 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 3
  %136 = load i32, i32* %135, align 4
  %137 = add i32 %136, -1
  store i32 %137, i32* %135, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %85, %95, %65
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %17, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %17 ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @decode_mcu_AC_first(%struct.jpeg_decompress_struct*, [64 x i16]** nocapture readonly) #0 {
  %3 = alloca %struct.bitread_working_state, align 8
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %5 = bitcast %struct.jpeg_entropy_decoder** %4 to %struct.phuff_entropy_decoder**
  %6 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 69
  %8 = load i32, i32* %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 71
  %10 = load i32, i32* %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 49
  %12 = load i32, i32* %11, align 8
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %21, label %14

; <label>:14:                                     ; preds = %2
  %15 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %6, i64 0, i32 3
  %16 = load i32, i32* %15, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %21

; <label>:18:                                     ; preds = %14
  %19 = tail call i32 @process_restart(%struct.jpeg_decompress_struct* nonnull %0)
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %.loopexit29, label %21

; <label>:21:                                     ; preds = %18, %2, %14
  %22 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %6, i64 0, i32 2, i32 0
  %23 = load i32, i32* %22, align 8
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %27, label %25

; <label>:25:                                     ; preds = %21
  %26 = add i32 %23, -1
  br label %162

; <label>:27:                                     ; preds = %21
  %28 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 5
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %28, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %30 = bitcast %struct.jpeg_source_mgr** %29 to i64**
  %31 = load i64*, i64** %30, align 8
  %32 = load i64, i64* %31, align 8
  %33 = bitcast %struct.bitread_working_state* %3 to i64*
  store i64 %32, i64* %33, align 8
  %34 = getelementptr inbounds i64, i64* %31, i64 1
  %35 = load i64, i64* %34, align 8
  %36 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 1
  store i64 %35, i64* %36, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  %38 = load i32, i32* %37, align 4
  %39 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 2
  store i32 %38, i32* %39, align 8
  %40 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %6, i64 0, i32 1, i32 0
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %6, i64 0, i32 1, i32 1
  %43 = load i32, i32* %42, align 8
  %44 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %6, i64 0, i32 1, i32 2
  %45 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 6
  store i32* %44, i32** %45, align 8
  %46 = load [64 x i16]*, [64 x i16]** %1, align 8
  %47 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %6, i64 0, i32 5
  %48 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 68
  %50 = load i32, i32* %49, align 4
  %51 = icmp sgt i32 %50, %8
  br i1 %51, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %27
  %52 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %53 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %54 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %55 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %56 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %57 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  br label %58

; <label>:58:                                     ; preds = %151, %.lr.ph
  %.0236 = phi i32 [ %43, %.lr.ph ], [ %.7, %151 ]
  %.0335 = phi i64 [ %41, %.lr.ph ], [ %.710, %151 ]
  %.01634 = phi i32 [ %50, %.lr.ph ], [ %152, %151 ]
  %59 = icmp slt i32 %.0236, 8
  br i1 %59, label %60, label %67

; <label>:60:                                     ; preds = %58
  %61 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.0335, i32 %.0236, i32 0) #3
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %.loopexit29.loopexit, label %63

; <label>:63:                                     ; preds = %60
  %64 = load i64, i64* %52, align 8
  %65 = load i32, i32* %53, align 8
  %66 = icmp slt i32 %65, 8
  br i1 %66, label %80, label %67

; <label>:67:                                     ; preds = %63, %58
  %.14 = phi i64 [ %.0335, %58 ], [ %64, %63 ]
  %.1 = phi i32 [ %.0236, %58 ], [ %65, %63 ]
  %68 = add nsw i32 %.1, -8
  %69 = zext i32 %68 to i64
  %70 = ashr i64 %.14, %69
  %71 = and i64 %70, 255
  %72 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %48, i64 0, i32 4, i64 %71
  %73 = load i32, i32* %72, align 4
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %80, label %75

; <label>:75:                                     ; preds = %67
  %76 = sub nsw i32 %.1, %73
  %77 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %48, i64 0, i32 5, i64 %71
  %78 = load i8, i8* %77, align 1
  %79 = zext i8 %78 to i32
  br label %86

; <label>:80:                                     ; preds = %67, %63
  %.25 = phi i64 [ %64, %63 ], [ %.14, %67 ]
  %.2 = phi i32 [ %65, %63 ], [ %.1, %67 ]
  %.01 = phi i32 [ 1, %63 ], [ 9, %67 ]
  %81 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* nonnull %3, i64 %.25, i32 %.2, %struct.d_derived_tbl* %48, i32 %.01) #3
  %82 = icmp slt i32 %81, 0
  br i1 %82, label %.loopexit29.loopexit, label %83

; <label>:83:                                     ; preds = %80
  %84 = load i64, i64* %54, align 8
  %85 = load i32, i32* %55, align 8
  br label %86

; <label>:86:                                     ; preds = %83, %75
  %.015 = phi i32 [ %81, %83 ], [ %79, %75 ]
  %.36 = phi i64 [ %84, %83 ], [ %.14, %75 ]
  %.3 = phi i32 [ %85, %83 ], [ %76, %75 ]
  %87 = ashr i32 %.015, 4
  %88 = and i32 %.015, 15
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %124, label %90

; <label>:90:                                     ; preds = %86
  %91 = add nsw i32 %87, %.01634
  %92 = icmp slt i32 %.3, %88
  br i1 %92, label %93, label %99

; <label>:93:                                     ; preds = %90
  %94 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.36, i32 %.3, i32 %88) #3
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %.loopexit29.loopexit, label %96

; <label>:96:                                     ; preds = %93
  %97 = load i64, i64* %56, align 8
  %98 = load i32, i32* %57, align 8
  br label %99

; <label>:99:                                     ; preds = %96, %90
  %.47 = phi i64 [ %97, %96 ], [ %.36, %90 ]
  %.4 = phi i32 [ %98, %96 ], [ %.3, %90 ]
  %100 = sub nsw i32 %.4, %88
  %101 = zext i32 %100 to i64
  %102 = ashr i64 %.47, %101
  %103 = trunc i64 %102 to i32
  %104 = shl i32 1, %88
  %105 = add nsw i32 %104, -1
  %106 = and i32 %103, %105
  %107 = zext i32 %88 to i64
  %108 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_test, i64 0, i64 %107
  %109 = load i32, i32* %108, align 4
  %110 = icmp slt i32 %106, %109
  br i1 %110, label %111, label %115

; <label>:111:                                    ; preds = %99
  %112 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_offset, i64 0, i64 %107
  %113 = load i32, i32* %112, align 4
  %114 = add nsw i32 %113, %106
  br label %115

; <label>:115:                                    ; preds = %99, %111
  %116 = phi i32 [ %114, %111 ], [ %106, %99 ]
  %117 = shl i32 %116, %10
  %118 = trunc i32 %117 to i16
  %119 = sext i32 %91 to i64
  %120 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %119
  %121 = load i32, i32* %120, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [64 x i16], [64 x i16]* %46, i64 0, i64 %122
  store i16 %118, i16* %123, align 2
  br label %151

; <label>:124:                                    ; preds = %86
  %125 = icmp eq i32 %87, 15
  br i1 %125, label %126, label %128

; <label>:126:                                    ; preds = %124
  %127 = add nsw i32 %.01634, 15
  br label %151

; <label>:128:                                    ; preds = %124
  %129 = shl i32 1, %87
  %130 = icmp eq i32 %87, 0
  br i1 %130, label %149, label %131

; <label>:131:                                    ; preds = %128
  %132 = icmp slt i32 %.3, %87
  br i1 %132, label %133, label %141

; <label>:133:                                    ; preds = %131
  %134 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.36, i32 %.3, i32 %87) #3
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %.loopexit29, label %136

; <label>:136:                                    ; preds = %133
  %137 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %138 = load i64, i64* %137, align 8
  %139 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %140 = load i32, i32* %139, align 8
  br label %141

; <label>:141:                                    ; preds = %136, %131
  %.58 = phi i64 [ %138, %136 ], [ %.36, %131 ]
  %.5 = phi i32 [ %140, %136 ], [ %.3, %131 ]
  %142 = sub nsw i32 %.5, %87
  %143 = zext i32 %142 to i64
  %144 = ashr i64 %.58, %143
  %145 = trunc i64 %144 to i32
  %146 = add nsw i32 %129, -1
  %147 = and i32 %145, %146
  %148 = add i32 %147, %129
  br label %149

; <label>:149:                                    ; preds = %128, %141
  %.012 = phi i32 [ %148, %141 ], [ %129, %128 ]
  %.69 = phi i64 [ %.58, %141 ], [ %.36, %128 ]
  %.6 = phi i32 [ %142, %141 ], [ %.3, %128 ]
  %150 = add i32 %.012, -1
  br label %.loopexit

; <label>:151:                                    ; preds = %115, %126
  %.117 = phi i32 [ %91, %115 ], [ %127, %126 ]
  %.710 = phi i64 [ %.47, %115 ], [ %.36, %126 ]
  %.7 = phi i32 [ %100, %115 ], [ %.3, %126 ]
  %152 = add nsw i32 %.117, 1
  %153 = icmp slt i32 %.117, %8
  br i1 %153, label %58, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %151
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %27, %149
  %.113 = phi i32 [ %150, %149 ], [ 0, %27 ], [ %23, %.loopexit.loopexit ]
  %.811 = phi i64 [ %.69, %149 ], [ %41, %27 ], [ %.710, %.loopexit.loopexit ]
  %.8 = phi i32 [ %.6, %149 ], [ %43, %27 ], [ %.7, %.loopexit.loopexit ]
  %154 = bitcast %struct.bitread_working_state* %3 to i64*
  %155 = load i64, i64* %154, align 8
  %156 = bitcast %struct.jpeg_source_mgr** %29 to i64**
  %157 = load i64*, i64** %156, align 8
  store i64 %155, i64* %157, align 8
  %158 = load i64, i64* %36, align 8
  %159 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %29, align 8
  %160 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %159, i64 0, i32 1
  store i64 %158, i64* %160, align 8
  %161 = load i32, i32* %39, align 8
  store i32 %161, i32* %37, align 4
  store i64 %.811, i64* %40, align 8
  store i32 %.8, i32* %42, align 8
  br label %162

; <label>:162:                                    ; preds = %.loopexit, %25
  %.214 = phi i32 [ %26, %25 ], [ %.113, %.loopexit ]
  store i32 %.214, i32* %22, align 8
  %163 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %6, i64 0, i32 3
  %164 = load i32, i32* %163, align 4
  %165 = add i32 %164, -1
  store i32 %165, i32* %163, align 4
  br label %.loopexit29

.loopexit29.loopexit:                             ; preds = %80, %93, %60
  br label %.loopexit29

.loopexit29:                                      ; preds = %.loopexit29.loopexit, %18, %133, %162
  %.0 = phi i32 [ 1, %162 ], [ 0, %18 ], [ 0, %133 ], [ 0, %.loopexit29.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @decode_mcu_DC_refine(%struct.jpeg_decompress_struct*, [64 x i16]** nocapture readonly) #0 {
  %3 = alloca %struct.bitread_working_state, align 8
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %5 = bitcast %struct.jpeg_entropy_decoder** %4 to %struct.phuff_entropy_decoder**
  %6 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 71
  %8 = load i32, i32* %7, align 8
  %9 = shl i32 1, %8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 49
  %11 = load i32, i32* %10, align 8
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %20, label %13

; <label>:13:                                     ; preds = %2
  %14 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %6, i64 0, i32 3
  %15 = load i32, i32* %14, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %20

; <label>:17:                                     ; preds = %13
  %18 = tail call i32 @process_restart(%struct.jpeg_decompress_struct* nonnull %0)
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %.loopexit, label %20

; <label>:20:                                     ; preds = %17, %2, %13
  %21 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 5
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %21, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %23 = bitcast %struct.jpeg_source_mgr** %22 to i64**
  %24 = load i64*, i64** %23, align 8
  %25 = load i64, i64* %24, align 8
  %26 = bitcast %struct.bitread_working_state* %3 to i64*
  store i64 %25, i64* %26, align 8
  %27 = getelementptr inbounds i64, i64* %24, i64 1
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 1
  store i64 %28, i64* %29, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  %31 = load i32, i32* %30, align 4
  %32 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 2
  store i32 %31, i32* %32, align 8
  %33 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %6, i64 0, i32 1, i32 0
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %6, i64 0, i32 1, i32 1
  %36 = load i32, i32* %35, align 8
  %37 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %6, i64 0, i32 1, i32 2
  %38 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 6
  store i32* %37, i32** %38, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 66
  %40 = load i32, i32* %39, align 8
  %41 = icmp sgt i32 %40, 0
  br i1 %41, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %20
  %42 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %43 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  br label %44

; <label>:44:                                     ; preds = %.lr.ph, %66
  %.0111 = phi i32 [ %36, %.lr.ph ], [ %55, %66 ]
  %.0210 = phi i64 [ %34, %.lr.ph ], [ %.13, %66 ]
  %indvars.iv9 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %66 ]
  %45 = getelementptr inbounds [64 x i16]*, [64 x i16]** %1, i64 %indvars.iv9
  %46 = load [64 x i16]*, [64 x i16]** %45, align 8
  %47 = icmp slt i32 %.0111, 1
  br i1 %47, label %48, label %54

; <label>:48:                                     ; preds = %44
  %49 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.0210, i32 %.0111, i32 1) #3
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %.loopexit.loopexit, label %51

; <label>:51:                                     ; preds = %48
  %52 = load i64, i64* %42, align 8
  %53 = load i32, i32* %43, align 8
  br label %54

; <label>:54:                                     ; preds = %51, %44
  %.13 = phi i64 [ %52, %51 ], [ %.0210, %44 ]
  %.1 = phi i32 [ %53, %51 ], [ %.0111, %44 ]
  %55 = add nsw i32 %.1, -1
  %56 = zext i32 %55 to i64
  %57 = shl i64 1, %56
  %58 = and i64 %57, %.13
  %59 = icmp eq i64 %58, 0
  br i1 %59, label %66, label %60

; <label>:60:                                     ; preds = %54
  %61 = getelementptr inbounds [64 x i16], [64 x i16]* %46, i64 0, i64 0
  %62 = load i16, i16* %61, align 2
  %63 = zext i16 %62 to i32
  %64 = or i32 %63, %9
  %65 = trunc i32 %64 to i16
  store i16 %65, i16* %61, align 2
  br label %66

; <label>:66:                                     ; preds = %54, %60
  %indvars.iv.next = add nuw i64 %indvars.iv9, 1
  %67 = load i32, i32* %39, align 8
  %68 = sext i32 %67 to i64
  %69 = icmp slt i64 %indvars.iv.next, %68
  br i1 %69, label %44, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %66
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %20
  %.02.lcssa = phi i64 [ %34, %20 ], [ %.13, %._crit_edge.loopexit ]
  %.01.lcssa = phi i32 [ %36, %20 ], [ %55, %._crit_edge.loopexit ]
  %70 = bitcast %struct.bitread_working_state* %3 to i64*
  %71 = load i64, i64* %70, align 8
  %72 = bitcast %struct.jpeg_source_mgr** %22 to i64**
  %73 = load i64*, i64** %72, align 8
  store i64 %71, i64* %73, align 8
  %74 = load i64, i64* %29, align 8
  %75 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %22, align 8
  %76 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %75, i64 0, i32 1
  store i64 %74, i64* %76, align 8
  %77 = load i32, i32* %32, align 8
  store i32 %77, i32* %30, align 4
  store i64 %.02.lcssa, i64* %33, align 8
  store i32 %.01.lcssa, i32* %35, align 8
  %78 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %6, i64 0, i32 3
  %79 = load i32, i32* %78, align 4
  %80 = add i32 %79, -1
  store i32 %80, i32* %78, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %48
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %17, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %17 ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @decode_mcu_AC_refine(%struct.jpeg_decompress_struct*, [64 x i16]** nocapture readonly) #0 {
  %3 = alloca %struct.bitread_working_state, align 8
  %4 = alloca [64 x i32], align 16
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %6 = bitcast %struct.jpeg_entropy_decoder** %5 to %struct.phuff_entropy_decoder**
  %7 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 69
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 71
  %11 = load i32, i32* %10, align 8
  %12 = shl i32 1, %11
  %13 = shl i32 -1, %11
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 49
  %15 = load i32, i32* %14, align 8
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %24, label %17

; <label>:17:                                     ; preds = %2
  %18 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 3
  %19 = load i32, i32* %18, align 4
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %24

; <label>:21:                                     ; preds = %17
  %22 = tail call i32 @process_restart(%struct.jpeg_decompress_struct* nonnull %0)
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %.loopexit92, label %24

; <label>:24:                                     ; preds = %21, %2, %17
  %25 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 5
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %25, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %27 = bitcast %struct.jpeg_source_mgr** %26 to i64**
  %28 = load i64*, i64** %27, align 8
  %29 = load i64, i64* %28, align 8
  %30 = bitcast %struct.bitread_working_state* %3 to i64*
  store i64 %29, i64* %30, align 8
  %31 = getelementptr inbounds i64, i64* %28, i64 1
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 1
  store i64 %32, i64* %33, align 8
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  %35 = load i32, i32* %34, align 4
  %36 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 2
  store i32 %35, i32* %36, align 8
  %37 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 1, i32 0
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 1, i32 1
  %40 = load i32, i32* %39, align 8
  %41 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 1, i32 2
  %42 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 6
  store i32* %41, i32** %42, align 8
  %43 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 2, i32 0
  %44 = load i32, i32* %43, align 8
  %45 = load [64 x i16]*, [64 x i16]** %1, align 8
  %46 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 5
  %47 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 68
  %49 = load i32, i32* %48, align 4
  %50 = icmp eq i32 %44, 0
  br i1 %50, label %51, label %.loopexit41.thread

; <label>:51:                                     ; preds = %24
  %52 = sext i32 %9 to i64
  %53 = icmp sgt i32 %49, %9
  br i1 %53, label %.loopexit41.thread147, label %.lr.ph127

.lr.ph127:                                        ; preds = %51
  %54 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %55 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %56 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %57 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %59 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %60 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %61 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %62 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %63 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  br label %64

; <label>:64:                                     ; preds = %186, %.lr.ph127
  %.02124 = phi i32 [ 0, %.lr.ph127 ], [ %.1, %186 ]
  %.03123 = phi i32 [ %40, %.lr.ph127 ], [ %.11, %186 ]
  %.09122 = phi i64 [ %38, %.lr.ph127 ], [ %.1120, %186 ]
  %.034121 = phi i32 [ %49, %.lr.ph127 ], [ %187, %186 ]
  %65 = icmp slt i32 %.03123, 8
  br i1 %65, label %66, label %73

; <label>:66:                                     ; preds = %64
  %67 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.09122, i32 %.03123, i32 0) #3
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %.loopexit93.loopexit179, label %69

; <label>:69:                                     ; preds = %66
  %70 = load i64, i64* %54, align 8
  %71 = load i32, i32* %55, align 8
  %72 = icmp slt i32 %71, 8
  br i1 %72, label %86, label %73

; <label>:73:                                     ; preds = %69, %64
  %.110 = phi i64 [ %.09122, %64 ], [ %70, %69 ]
  %.14 = phi i32 [ %.03123, %64 ], [ %71, %69 ]
  %74 = add nsw i32 %.14, -8
  %75 = zext i32 %74 to i64
  %76 = ashr i64 %.110, %75
  %77 = and i64 %76, 255
  %78 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %47, i64 0, i32 4, i64 %77
  %79 = load i32, i32* %78, align 4
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %86, label %81

; <label>:81:                                     ; preds = %73
  %82 = sub nsw i32 %.14, %79
  %83 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %47, i64 0, i32 5, i64 %77
  %84 = load i8, i8* %83, align 1
  %85 = zext i8 %84 to i32
  br label %92

; <label>:86:                                     ; preds = %73, %69
  %.211 = phi i64 [ %70, %69 ], [ %.110, %73 ]
  %.25 = phi i32 [ %71, %69 ], [ %.14, %73 ]
  %.01 = phi i32 [ 1, %69 ], [ 9, %73 ]
  %87 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* nonnull %3, i64 %.211, i32 %.25, %struct.d_derived_tbl* %47, i32 %.01) #3
  %88 = icmp slt i32 %87, 0
  br i1 %88, label %.loopexit93.loopexit179, label %89

; <label>:89:                                     ; preds = %86
  %90 = load i64, i64* %56, align 8
  %91 = load i32, i32* %57, align 8
  br label %92

; <label>:92:                                     ; preds = %89, %81
  %.031 = phi i32 [ %87, %89 ], [ %85, %81 ]
  %.312 = phi i64 [ %90, %89 ], [ %.110, %81 ]
  %.36 = phi i32 [ %91, %89 ], [ %82, %81 ]
  %93 = ashr i32 %.031, 4
  %trunc = trunc i32 %.031 to i4
  switch i4 %trunc, label %94 [
    i4 0, label %114
    i4 1, label %100
  ]

; <label>:94:                                     ; preds = %92
  %95 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %96 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %95, i64 0, i32 5
  store i32 114, i32* %96, align 8
  %97 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %98 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %97, i64 0, i32 1
  %99 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %98, align 8
  call void %99(%struct.jpeg_common_struct* %59, i32 -1) #3
  br label %100

; <label>:100:                                    ; preds = %92, %94
  %101 = icmp slt i32 %.36, 1
  br i1 %101, label %102, label %108

; <label>:102:                                    ; preds = %100
  %103 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.312, i32 %.36, i32 1) #3
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %.loopexit93.loopexit179, label %105

; <label>:105:                                    ; preds = %102
  %106 = load i64, i64* %60, align 8
  %107 = load i32, i32* %61, align 8
  br label %108

; <label>:108:                                    ; preds = %105, %100
  %.413 = phi i64 [ %106, %105 ], [ %.312, %100 ]
  %.47 = phi i32 [ %107, %105 ], [ %.36, %100 ]
  %109 = add nsw i32 %.47, -1
  %110 = zext i32 %109 to i64
  %111 = shl i64 1, %110
  %112 = and i64 %111, %.413
  %113 = icmp ne i64 %112, 0
  %. = select i1 %113, i32 %12, i32 %13
  br label %137

; <label>:114:                                    ; preds = %92
  %115 = icmp eq i32 %93, 15
  br i1 %115, label %137, label %116

; <label>:116:                                    ; preds = %114
  %117 = shl i32 1, %93
  %118 = icmp eq i32 %93, 0
  br i1 %118, label %.loopexit41.thread, label %119

; <label>:119:                                    ; preds = %116
  %120 = icmp slt i32 %.36, %93
  br i1 %120, label %121, label %129

; <label>:121:                                    ; preds = %119
  %122 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.312, i32 %.36, i32 %93) #3
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %.loopexit93, label %124

; <label>:124:                                    ; preds = %121
  %125 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %128 = load i32, i32* %127, align 8
  br label %129

; <label>:129:                                    ; preds = %124, %119
  %.514 = phi i64 [ %126, %124 ], [ %.312, %119 ]
  %.5 = phi i32 [ %128, %124 ], [ %.36, %119 ]
  %130 = sub nsw i32 %.5, %93
  %131 = zext i32 %130 to i64
  %132 = ashr i64 %.514, %131
  %133 = trunc i64 %132 to i32
  %134 = add nsw i32 %117, -1
  %135 = and i32 %133, %134
  %136 = add i32 %135, %117
  br label %.loopexit41

; <label>:137:                                    ; preds = %114, %108
  %.233 = phi i32 [ %., %108 ], [ 0, %114 ]
  %.716 = phi i64 [ %.413, %108 ], [ %.312, %114 ]
  %.7 = phi i32 [ %109, %108 ], [ %.36, %114 ]
  %138 = sext i32 %.034121 to i64
  br label %139

; <label>:139:                                    ; preds = %172, %137
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %172 ], [ %138, %137 ]
  %.039 = phi i32 [ %.140, %172 ], [ %93, %137 ]
  %.817 = phi i64 [ %.1019, %172 ], [ %.716, %137 ]
  %.8 = phi i32 [ %.10, %172 ], [ %.7, %137 ]
  %140 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv81
  %141 = load i32, i32* %140, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [64 x i16], [64 x i16]* %45, i64 0, i64 %142
  %144 = load i16, i16* %143, align 2
  %145 = icmp eq i16 %144, 0
  br i1 %145, label %169, label %146

; <label>:146:                                    ; preds = %139
  %147 = icmp slt i32 %.8, 1
  br i1 %147, label %148, label %154

; <label>:148:                                    ; preds = %146
  %149 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.817, i32 %.8, i32 1) #3
  %150 = icmp eq i32 %149, 0
  br i1 %150, label %.loopexit93.loopexit178, label %151

; <label>:151:                                    ; preds = %148
  %152 = load i64, i64* %62, align 8
  %153 = load i32, i32* %63, align 8
  br label %154

; <label>:154:                                    ; preds = %151, %146
  %.918 = phi i64 [ %152, %151 ], [ %.817, %146 ]
  %.9 = phi i32 [ %153, %151 ], [ %.8, %146 ]
  %155 = add nsw i32 %.9, -1
  %156 = zext i32 %155 to i64
  %157 = shl i64 1, %156
  %158 = and i64 %157, %.918
  %159 = icmp eq i64 %158, 0
  br i1 %159, label %172, label %160

; <label>:160:                                    ; preds = %154
  %161 = load i16, i16* %143, align 2
  %162 = sext i16 %161 to i32
  %163 = and i32 %162, %12
  %164 = icmp eq i32 %163, 0
  br i1 %164, label %165, label %172

; <label>:165:                                    ; preds = %160
  %166 = icmp sgt i16 %161, -1
  %.sink = select i1 %166, i32 %12, i32 %13
  %167 = add nsw i32 %.sink, %162
  %168 = trunc i32 %167 to i16
  store i16 %168, i16* %143, align 2
  br label %172

; <label>:169:                                    ; preds = %139
  %170 = add nsw i32 %.039, -1
  %171 = icmp slt i32 %.039, 1
  br i1 %171, label %.loopexit, label %172

; <label>:172:                                    ; preds = %154, %169, %165, %160
  %.140 = phi i32 [ %.039, %160 ], [ %.039, %165 ], [ %.039, %154 ], [ %170, %169 ]
  %.1019 = phi i64 [ %.918, %160 ], [ %.918, %165 ], [ %.918, %154 ], [ %.817, %169 ]
  %.10 = phi i32 [ %155, %160 ], [ %155, %165 ], [ %155, %154 ], [ %.8, %169 ]
  %indvars.iv.next82 = add nsw i64 %indvars.iv81, 1
  %173 = icmp slt i64 %indvars.iv81, %52
  br i1 %173, label %139, label %.loopexit

.loopexit:                                        ; preds = %172, %169
  %.lcssa.wide.sink = phi i64 [ %indvars.iv.next82, %172 ], [ %indvars.iv81, %169 ]
  %.1120 = phi i64 [ %.1019, %172 ], [ %.817, %169 ]
  %.11 = phi i32 [ %.10, %172 ], [ %.8, %169 ]
  %174 = trunc i64 %.lcssa.wide.sink to i32
  %175 = icmp eq i32 %.233, 0
  br i1 %175, label %186, label %176

; <label>:176:                                    ; preds = %.loopexit
  %sext = shl i64 %.lcssa.wide.sink, 32
  %177 = ashr exact i64 %sext, 32
  %178 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %177
  %179 = load i32, i32* %178, align 4
  %180 = trunc i32 %.233 to i16
  %181 = sext i32 %179 to i64
  %182 = getelementptr inbounds [64 x i16], [64 x i16]* %45, i64 0, i64 %181
  store i16 %180, i16* %182, align 2
  %183 = add nsw i32 %.02124, 1
  %184 = sext i32 %.02124 to i64
  %185 = getelementptr inbounds [64 x i32], [64 x i32]* %4, i64 0, i64 %184
  store i32 %179, i32* %185, align 4
  br label %186

; <label>:186:                                    ; preds = %.loopexit, %176
  %.1 = phi i32 [ %183, %176 ], [ %.02124, %.loopexit ]
  %187 = add nsw i32 %174, 1
  %188 = icmp slt i32 %174, %9
  br i1 %188, label %64, label %.loopexit41.loopexit

.loopexit41.loopexit:                             ; preds = %186
  br label %.loopexit41

.loopexit41:                                      ; preds = %.loopexit41.loopexit, %129
  %.034114 = phi i32 [ %.034121, %129 ], [ %187, %.loopexit41.loopexit ]
  %.02104 = phi i32 [ %.02124, %129 ], [ %.1, %.loopexit41.loopexit ]
  %.229 = phi i32 [ %136, %129 ], [ %44, %.loopexit41.loopexit ]
  %.1322 = phi i64 [ %.514, %129 ], [ %.1120, %.loopexit41.loopexit ]
  %.13 = phi i32 [ %130, %129 ], [ %.11, %.loopexit41.loopexit ]
  %189 = icmp eq i32 %.229, 0
  br i1 %189, label %.loopexit41.thread147, label %.loopexit41.thread

.loopexit41.thread:                               ; preds = %116, %.loopexit41, %24
  %.291 = phi i32 [ %.02104, %.loopexit41 ], [ %.02124, %116 ], [ 0, %24 ]
  %.1390 = phi i32 [ %.13, %.loopexit41 ], [ %.36, %116 ], [ %40, %24 ]
  %.132289 = phi i64 [ %.1322, %.loopexit41 ], [ %.312, %116 ], [ %38, %24 ]
  %.22988 = phi i32 [ %.229, %.loopexit41 ], [ %117, %116 ], [ %44, %24 ]
  %.33787 = phi i32 [ %.034114, %.loopexit41 ], [ %.034121, %116 ], [ %49, %24 ]
  %190 = sext i32 %9 to i64
  %191 = icmp sgt i32 %.33787, %9
  br i1 %191, label %._crit_edge, label %.lr.ph119

.lr.ph119:                                        ; preds = %.loopexit41.thread
  %192 = sext i32 %.33787 to i64
  %193 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %194 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  br label %195

; <label>:195:                                    ; preds = %225, %.lr.ph119
  %.148118 = phi i32 [ %.1390, %.lr.ph119 ], [ %.16, %225 ]
  %.1423117 = phi i64 [ %.132289, %.lr.ph119 ], [ %.1625, %225 ]
  %indvars.iv79116 = phi i64 [ %192, %.lr.ph119 ], [ %indvars.iv.next80, %225 ]
  %196 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv79116
  %197 = load i32, i32* %196, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [64 x i16], [64 x i16]* %45, i64 0, i64 %198
  %200 = load i16, i16* %199, align 2
  %201 = icmp eq i16 %200, 0
  br i1 %201, label %225, label %202

; <label>:202:                                    ; preds = %195
  %203 = icmp slt i32 %.148118, 1
  br i1 %203, label %204, label %210

; <label>:204:                                    ; preds = %202
  %205 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.1423117, i32 %.148118, i32 1) #3
  %206 = icmp eq i32 %205, 0
  br i1 %206, label %.loopexit93.loopexit, label %207

; <label>:207:                                    ; preds = %204
  %208 = load i64, i64* %193, align 8
  %209 = load i32, i32* %194, align 8
  br label %210

; <label>:210:                                    ; preds = %207, %202
  %.1524 = phi i64 [ %208, %207 ], [ %.1423117, %202 ]
  %.15 = phi i32 [ %209, %207 ], [ %.148118, %202 ]
  %211 = add nsw i32 %.15, -1
  %212 = zext i32 %211 to i64
  %213 = shl i64 1, %212
  %214 = and i64 %213, %.1524
  %215 = icmp eq i64 %214, 0
  br i1 %215, label %225, label %216

; <label>:216:                                    ; preds = %210
  %217 = load i16, i16* %199, align 2
  %218 = sext i16 %217 to i32
  %219 = and i32 %218, %12
  %220 = icmp eq i32 %219, 0
  br i1 %220, label %221, label %225

; <label>:221:                                    ; preds = %216
  %222 = icmp sgt i16 %217, -1
  %.sink86 = select i1 %222, i32 %12, i32 %13
  %223 = add nsw i32 %.sink86, %218
  %224 = trunc i32 %223 to i16
  store i16 %224, i16* %199, align 2
  br label %225

; <label>:225:                                    ; preds = %210, %195, %216, %221
  %.1625 = phi i64 [ %.1423117, %195 ], [ %.1524, %216 ], [ %.1524, %221 ], [ %.1524, %210 ]
  %.16 = phi i32 [ %.148118, %195 ], [ %211, %216 ], [ %211, %221 ], [ %211, %210 ]
  %indvars.iv.next80 = add nsw i64 %indvars.iv79116, 1
  %226 = icmp slt i64 %indvars.iv79116, %190
  br i1 %226, label %195, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %225
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.loopexit41.thread
  %.1423.lcssa = phi i64 [ %.132289, %.loopexit41.thread ], [ %.1625, %._crit_edge.loopexit ]
  %.148.lcssa = phi i32 [ %.1390, %.loopexit41.thread ], [ %.16, %._crit_edge.loopexit ]
  %227 = add i32 %.22988, -1
  br label %.loopexit41.thread147

.loopexit41.thread147:                            ; preds = %51, %.loopexit41, %._crit_edge
  %.330 = phi i32 [ %227, %._crit_edge ], [ 0, %.loopexit41 ], [ 0, %51 ]
  %.1726 = phi i64 [ %.1423.lcssa, %._crit_edge ], [ %.1322, %.loopexit41 ], [ %38, %51 ]
  %.17 = phi i32 [ %.148.lcssa, %._crit_edge ], [ %.13, %.loopexit41 ], [ %40, %51 ]
  %228 = bitcast %struct.bitread_working_state* %3 to i64*
  %229 = load i64, i64* %228, align 8
  %230 = bitcast %struct.jpeg_source_mgr** %26 to i64**
  %231 = load i64*, i64** %230, align 8
  store i64 %229, i64* %231, align 8
  %232 = load i64, i64* %33, align 8
  %233 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %26, align 8
  %234 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %233, i64 0, i32 1
  store i64 %232, i64* %234, align 8
  %235 = load i32, i32* %36, align 8
  store i32 %235, i32* %34, align 4
  store i64 %.1726, i64* %37, align 8
  store i32 %.17, i32* %39, align 8
  store i32 %.330, i32* %43, align 8
  %236 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 3
  %237 = load i32, i32* %236, align 4
  %238 = add i32 %237, -1
  store i32 %238, i32* %236, align 4
  br label %.loopexit92

.loopexit93.loopexit:                             ; preds = %204
  br label %.loopexit93

.loopexit93.loopexit178:                          ; preds = %148
  br label %.loopexit93

.loopexit93.loopexit179:                          ; preds = %86, %102, %66
  br label %.loopexit93

.loopexit93:                                      ; preds = %.loopexit93.loopexit179, %.loopexit93.loopexit178, %.loopexit93.loopexit, %121
  %.3 = phi i32 [ %.02124, %121 ], [ %.291, %.loopexit93.loopexit ], [ %.02124, %.loopexit93.loopexit178 ], [ %.02124, %.loopexit93.loopexit179 ]
  %239 = icmp sgt i32 %.3, 0
  br i1 %239, label %.lr.ph.preheader, label %.loopexit92

.lr.ph.preheader:                                 ; preds = %.loopexit93
  %240 = sext i32 %.3 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv115 = phi i64 [ %indvars.iv.next, %.lr.ph ], [ %240, %.lr.ph.preheader ]
  %indvars.iv.next = add nsw i64 %indvars.iv115, -1
  %241 = getelementptr inbounds [64 x i32], [64 x i32]* %4, i64 0, i64 %indvars.iv.next
  %242 = load i32, i32* %241, align 4
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds [64 x i16], [64 x i16]* %45, i64 0, i64 %243
  store i16 0, i16* %244, align 2
  %245 = icmp sgt i64 %indvars.iv115, 1
  br i1 %245, label %.lr.ph, label %.loopexit92.loopexit

.loopexit92.loopexit:                             ; preds = %.lr.ph
  br label %.loopexit92

.loopexit92:                                      ; preds = %.loopexit92.loopexit, %.loopexit93, %21, %.loopexit41.thread147
  %.0 = phi i32 [ 1, %.loopexit41.thread147 ], [ 0, %21 ], [ 0, %.loopexit93 ], [ 0, %.loopexit92.loopexit ]
  ret i32 %.0
}

declare void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct*, %struct.JHUFF_TBL*, %struct.d_derived_tbl**) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @process_restart(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %3 = bitcast %struct.jpeg_entropy_decoder** %2 to %struct.phuff_entropy_decoder**
  %4 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %5 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 1, i32 1
  %6 = load i32, i32* %5, align 8
  %7 = sdiv i32 %6, 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %9 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %9, i64 0, i32 8
  %11 = load i32, i32* %10, align 4
  %12 = add i32 %11, %7
  store i32 %12, i32* %10, align 4
  store i32 0, i32* %5, align 8
  %13 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %8, align 8
  %14 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %13, i64 0, i32 2
  %15 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %14, align 8
  %16 = tail call i32 %15(%struct.jpeg_decompress_struct* %0) #3
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %30, label %.preheader

.preheader:                                       ; preds = %1
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 62
  %19 = load i32, i32* %18, align 8
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv2 = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %21 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 2, i32 1, i64 %indvars.iv2
  store i32 0, i32* %21, align 4
  %indvars.iv.next = add nuw i64 %indvars.iv2, 1
  %22 = load i32, i32* %18, align 8
  %23 = sext i32 %22 to i64
  %24 = icmp slt i64 %indvars.iv.next, %23
  br i1 %24, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %25 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 2, i32 0
  store i32 0, i32* %25, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 49
  %27 = load i32, i32* %26, align 8
  %28 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 3
  store i32 %27, i32* %28, align 4
  %29 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 1, i32 2
  store i32 0, i32* %29, align 4
  br label %30

; <label>:30:                                     ; preds = %1, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %1 ]
  ret i32 %.0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state*, i64, i32, i32) #1

declare i32 @jpeg_huff_decode(%struct.bitread_working_state*, i64, i32, %struct.d_derived_tbl*, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

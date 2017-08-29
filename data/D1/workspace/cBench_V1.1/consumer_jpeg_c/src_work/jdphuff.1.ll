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

@extend_test = internal unnamed_addr constant [16 x i32] [i32 0, i32 1, i32 2, i32 4, i32 8, i32 16, i32 32, i32 64, i32 128, i32 256, i32 512, i32 1024, i32 2048, i32 4096, i32 8192, i32 16384], align 16
@extend_offset = internal unnamed_addr constant [16 x i32] [i32 0, i32 -1, i32 -3, i32 -7, i32 -15, i32 -31, i32 -63, i32 -127, i32 -255, i32 -511, i32 -1023, i32 -2047, i32 -4095, i32 -8191, i32 -16383, i32 -32767], align 16
@jpeg_natural_order = external local_unnamed_addr constant [0 x i32], align 4

; Function Attrs: noinline nounwind uwtable
define void @jinit_phuff_decoder(%struct.jpeg_decompress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
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
  %12 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %13 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %12, align 8
  %14 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %16 = load i32, i32* %15, align 8
  %17 = sext i32 %16 to i64
  %18 = shl nsw i64 %17, 8
  %19 = tail call i8* %14(%struct.jpeg_common_struct* %6, i32 1, i64 %18) #3
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 38
  %21 = bitcast [64 x i32]** %20 to i8**
  store i8* %19, i8** %21, align 8
  %22 = load i32, i32* %15, align 8
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %.preheader.preheader, label %._crit_edge

.preheader.preheader:                             ; preds = %1
  %sunkaddr14 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr15 = add i64 %sunkaddr14, 48
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to i32*
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvar = phi i64 [ %indvar.next, %.preheader ], [ 0, %.preheader.preheader ]
  %.017 = phi i32 [ %25, %.preheader ], [ 0, %.preheader.preheader ]
  %24 = shl i64 %indvar, 8
  %scevgep9 = getelementptr i8, i8* %19, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep9, i8 -1, i64 256, i32 4, i1 false)
  %25 = add nuw nsw i32 %.017, 1
  %26 = load i32, i32* %sunkaddr16, align 8
  %27 = icmp slt i32 %25, %26
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %27, label %.preheader, label %._crit_edge.loopexit

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
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr31 = add i64 %sunkaddr, 512
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to i32*
  %10 = load i32, i32* %sunkaddr32, align 8
  %11 = icmp sgt i32 %6, %10
  %12 = icmp sgt i32 %10, 63
  %or.cond7 = or i1 %11, %12
  %.13 = zext i1 %or.cond7 to i32
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 62
  br label %14

; <label>:14:                                     ; preds = %1, %9
  %.sink = phi i32* [ %13, %9 ], [ %8, %1 ]
  %.sink6 = phi i32 [ 1, %9 ], [ 0, %1 ]
  %.13.sink = phi i32 [ %.13, %9 ], [ 0, %1 ]
  %15 = load i32, i32* %.sink, align 8
  %16 = icmp eq i32 %15, %.sink6
  %.13. = select i1 %16, i32 %.13.sink, i32 1
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 70
  %18 = load i32, i32* %17, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %25, label %20

; <label>:20:                                     ; preds = %14
  %21 = add nsw i32 %18, -1
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 71
  %23 = load i32, i32* %22, align 8
  %24 = icmp eq i32 %23, %21
  %.3. = select i1 %24, i32 %.13., i32 1
  br label %25

; <label>:25:                                     ; preds = %14, %20
  %.5 = phi i32 [ %.3., %20 ], [ %.13., %14 ]
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 71
  %27 = load i32, i32* %26, align 8
  %28 = icmp eq i32 %.5, 0
  %not. = icmp slt i32 %27, 14
  %29 = and i1 %28, %not.
  br i1 %29, label %.preheader8, label %30

; <label>:30:                                     ; preds = %25
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i64 0, i32 5
  store i32 14, i32* %33, align 8
  %sunkaddr33 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr34 = add i64 %sunkaddr33, 508
  %sunkaddr35 = inttoptr i64 %sunkaddr34 to i32*
  %34 = load i32, i32* %sunkaddr35, align 4
  %35 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %36 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %35, i64 0, i32 6, i32 0, i64 0
  store i32 %34, i32* %36, align 4
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 69
  %38 = load i32, i32* %37, align 8
  %39 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %40 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %39, i64 0, i32 6, i32 0, i64 1
  store i32 %38, i32* %40, align 4
  %sunkaddr36 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr37 = add i64 %sunkaddr36, 516
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to i32*
  %41 = load i32, i32* %sunkaddr38, align 4
  %42 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %43 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %42, i64 0, i32 6, i32 0, i64 2
  store i32 %41, i32* %43, align 4
  %sunkaddr39 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr40 = add i64 %sunkaddr39, 520
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to i32*
  %44 = load i32, i32* %sunkaddr41, align 8
  %45 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %46 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %45, i64 0, i32 6, i32 0, i64 3
  store i32 %44, i32* %46, align 4
  %47 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %48 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %47, align 8
  %49 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %48, align 8
  %50 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %49(%struct.jpeg_common_struct* %50) #3
  br label %.preheader8

.preheader8:                                      ; preds = %25, %30
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 62
  %52 = load i32, i32* %51, align 8
  %53 = icmp sgt i32 %52, 0
  br i1 %53, label %.lr.ph15, label %._crit_edge16

.lr.ph15:                                         ; preds = %.preheader8
  %54 = icmp eq i32 %6, 0
  br i1 %54, label %.lr.ph15.split.us.preheader, label %.lr.ph15.split.preheader

.lr.ph15.split.preheader:                         ; preds = %.lr.ph15
  %sunkaddr135 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr136 = add i64 %sunkaddr135, 184
  %sunkaddr137 = inttoptr i64 %sunkaddr136 to [64 x i32]**
  %55 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %56 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr138 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr139 = add i64 %sunkaddr138, 508
  %sunkaddr140 = inttoptr i64 %sunkaddr139 to i32*
  %sunkaddr141 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr142 = add i64 %sunkaddr141, 512
  %sunkaddr143 = inttoptr i64 %sunkaddr142 to i32*
  %sunkaddr153 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr154 = add i64 %sunkaddr153, 416
  %sunkaddr155 = inttoptr i64 %sunkaddr154 to i32*
  %sunkaddr144 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr145 = add i64 %sunkaddr144, 516
  %sunkaddr146 = inttoptr i64 %sunkaddr145 to i32*
  %sunkaddr147 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr148 = add i64 %sunkaddr147, 520
  %sunkaddr149 = inttoptr i64 %sunkaddr148 to i32*
  %sunkaddr150 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr151 = add i64 %sunkaddr150, 512
  %sunkaddr152 = inttoptr i64 %sunkaddr151 to i32*
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %58 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  br label %.lr.ph15.split

.lr.ph15.split.us.preheader:                      ; preds = %.lr.ph15
  %sunkaddr114 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr115 = add i64 %sunkaddr114, 184
  %sunkaddr116 = inttoptr i64 %sunkaddr115 to [64 x i32]**
  %sunkaddr117 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr118 = add i64 %sunkaddr117, 508
  %sunkaddr119 = inttoptr i64 %sunkaddr118 to i32*
  %sunkaddr120 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr121 = add i64 %sunkaddr120, 512
  %sunkaddr122 = inttoptr i64 %sunkaddr121 to i32*
  %sunkaddr132 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr133 = add i64 %sunkaddr132, 416
  %sunkaddr134 = inttoptr i64 %sunkaddr133 to i32*
  %sunkaddr123 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr124 = add i64 %sunkaddr123, 516
  %sunkaddr125 = inttoptr i64 %sunkaddr124 to i32*
  %sunkaddr126 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr127 = add i64 %sunkaddr126, 520
  %sunkaddr128 = inttoptr i64 %sunkaddr127 to i32*
  %sunkaddr129 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr130 = add i64 %sunkaddr129, 512
  %sunkaddr131 = inttoptr i64 %sunkaddr130 to i32*
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %60 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  br label %.lr.ph15.split.us

.lr.ph15.split.us:                                ; preds = %.lr.ph15.split.us.preheader, %._crit_edge13.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge13.us ], [ 0, %.lr.ph15.split.us.preheader ]
  %61 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv23
  %62 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %61, align 8
  %63 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %62, i64 0, i32 1
  %64 = load i32, i32* %63, align 4
  %65 = load [64 x i32]*, [64 x i32]** %sunkaddr116, align 8
  %66 = sext i32 %64 to i64
  %67 = load i32, i32* %sunkaddr119, align 4
  %68 = load i32, i32* %sunkaddr122, align 8
  %69 = icmp sgt i32 %67, %68
  br i1 %69, label %._crit_edge13.us, label %.lr.ph15.split.us..lr.ph12.us_crit_edge

.lr.ph15.split.us..lr.ph12.us_crit_edge:          ; preds = %.lr.ph15.split.us
  %70 = sext i32 %67 to i64
  br label %.lr.ph12.us

.lr.ph12.us:                                      ; preds = %87, %.lr.ph15.split.us..lr.ph12.us_crit_edge
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %87 ], [ %70, %.lr.ph15.split.us..lr.ph12.us_crit_edge ]
  %71 = getelementptr inbounds [64 x i32], [64 x i32]* %65, i64 %66, i64 %indvars.iv21
  %72 = load i32, i32* %71, align 4
  %73 = icmp sgt i32 %72, 0
  %..us = select i1 %73, i32 %72, i32 0
  %74 = load i32, i32* %sunkaddr125, align 4
  %75 = icmp eq i32 %74, %..us
  br i1 %75, label %87, label %76

; <label>:76:                                     ; preds = %.lr.ph12.us
  %77 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %59, align 8
  %78 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %77, i64 0, i32 5
  store i32 111, i32* %78, align 8
  %79 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %59, align 8
  %80 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %79, i64 0, i32 6, i32 0, i64 0
  store i32 %64, i32* %80, align 4
  %81 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %59, align 8
  %82 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %81, i64 0, i32 6, i32 0, i64 1
  %83 = trunc i64 %indvars.iv21 to i32
  store i32 %83, i32* %82, align 4
  %84 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %59, align 8
  %85 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %84, i64 0, i32 1
  %86 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %85, align 8
  tail call void %86(%struct.jpeg_common_struct* nonnull %60, i32 -1) #3
  br label %87

; <label>:87:                                     ; preds = %.lr.ph12.us, %76
  %88 = load i32, i32* %sunkaddr128, align 8
  store i32 %88, i32* %71, align 4
  %indvars.iv.next22 = add i64 %indvars.iv21, 1
  %89 = load i32, i32* %sunkaddr131, align 8
  %90 = sext i32 %89 to i64
  %91 = icmp slt i64 %indvars.iv21, %90
  br i1 %91, label %.lr.ph12.us, label %._crit_edge13.us.loopexit

._crit_edge13.us.loopexit:                        ; preds = %87
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.loopexit, %.lr.ph15.split.us
  %indvars.iv.next24 = add nuw i64 %indvars.iv23, 1
  %92 = load i32, i32* %sunkaddr134, align 8
  %93 = sext i32 %92 to i64
  %94 = icmp slt i64 %indvars.iv.next24, %93
  br i1 %94, label %.lr.ph15.split.us, label %._crit_edge16.loopexit

.lr.ph15.split:                                   ; preds = %.lr.ph15.split.preheader, %._crit_edge13
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge13 ], [ 0, %.lr.ph15.split.preheader ]
  %95 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv27
  %96 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %95, align 8
  %97 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %96, i64 0, i32 1
  %98 = load i32, i32* %97, align 4
  %99 = load [64 x i32]*, [64 x i32]** %sunkaddr137, align 8
  %100 = sext i32 %98 to i64
  %101 = getelementptr inbounds [64 x i32], [64 x i32]* %99, i64 %100, i64 0
  %102 = load i32, i32* %101, align 4
  %103 = icmp slt i32 %102, 0
  br i1 %103, label %104, label %114

; <label>:104:                                    ; preds = %.lr.ph15.split
  %105 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %55, align 8
  %106 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %105, i64 0, i32 5
  store i32 111, i32* %106, align 8
  %107 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %55, align 8
  %108 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %107, i64 0, i32 6, i32 0, i64 0
  store i32 %98, i32* %108, align 4
  %109 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %55, align 8
  %110 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %109, i64 0, i32 6, i32 0, i64 1
  store i32 0, i32* %110, align 4
  %111 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %55, align 8
  %112 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %111, i64 0, i32 1
  %113 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %112, align 8
  tail call void %113(%struct.jpeg_common_struct* nonnull %56, i32 -1) #3
  br label %114

; <label>:114:                                    ; preds = %.lr.ph15.split, %104
  %115 = load i32, i32* %sunkaddr140, align 4
  %116 = load i32, i32* %sunkaddr143, align 8
  %117 = icmp sgt i32 %115, %116
  br i1 %117, label %._crit_edge13, label %..lr.ph12_crit_edge

..lr.ph12_crit_edge:                              ; preds = %114
  %118 = sext i32 %115 to i64
  br label %.lr.ph12

.lr.ph12:                                         ; preds = %135, %..lr.ph12_crit_edge
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %135 ], [ %118, %..lr.ph12_crit_edge ]
  %119 = getelementptr inbounds [64 x i32], [64 x i32]* %99, i64 %100, i64 %indvars.iv25
  %120 = load i32, i32* %119, align 4
  %121 = icmp sgt i32 %120, 0
  %. = select i1 %121, i32 %120, i32 0
  %122 = load i32, i32* %sunkaddr146, align 4
  %123 = icmp eq i32 %122, %.
  br i1 %123, label %135, label %124

; <label>:124:                                    ; preds = %.lr.ph12
  %125 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %126 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %125, i64 0, i32 5
  store i32 111, i32* %126, align 8
  %127 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %128 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %127, i64 0, i32 6, i32 0, i64 0
  store i32 %98, i32* %128, align 4
  %129 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %130 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %129, i64 0, i32 6, i32 0, i64 1
  %131 = trunc i64 %indvars.iv25 to i32
  store i32 %131, i32* %130, align 4
  %132 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %133 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %132, i64 0, i32 1
  %134 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %133, align 8
  tail call void %134(%struct.jpeg_common_struct* nonnull %58, i32 -1) #3
  br label %135

; <label>:135:                                    ; preds = %.lr.ph12, %124
  %136 = load i32, i32* %sunkaddr149, align 8
  store i32 %136, i32* %119, align 4
  %indvars.iv.next26 = add i64 %indvars.iv25, 1
  %137 = load i32, i32* %sunkaddr152, align 8
  %138 = sext i32 %137 to i64
  %139 = icmp slt i64 %indvars.iv25, %138
  br i1 %139, label %.lr.ph12, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %135
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %114
  %indvars.iv.next28 = add nuw i64 %indvars.iv27, 1
  %140 = load i32, i32* %sunkaddr155, align 8
  %141 = sext i32 %140 to i64
  %142 = icmp slt i64 %indvars.iv.next28, %141
  br i1 %142, label %.lr.ph15.split, label %._crit_edge16.loopexit171

._crit_edge16.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge16

._crit_edge16.loopexit171:                        ; preds = %._crit_edge13
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit171, %._crit_edge16.loopexit, %.preheader8
  %143 = icmp eq i32 %6, 0
  %sunkaddr84 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr85 = add i64 %sunkaddr84, 516
  %sunkaddr86 = inttoptr i64 %sunkaddr85 to i32*
  %144 = load i32, i32* %sunkaddr86, align 4
  %145 = icmp eq i32 %144, 0
  %146 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 0, i32 1
  %decode_mcu_AC_refine.sink = select i1 %143, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu_DC_refine, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu_AC_refine
  %decode_mcu_AC_first.sink = select i1 %143, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu_DC_first, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu_AC_first
  %decode_mcu_AC_refine.sink.sink = select i1 %145, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* %decode_mcu_AC_first.sink, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* %decode_mcu_AC_refine.sink
  store i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* %decode_mcu_AC_refine.sink.sink, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)** %146, align 8
  %sunkaddr87 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr88 = add i64 %sunkaddr87, 416
  %sunkaddr89 = inttoptr i64 %sunkaddr88 to i32*
  %147 = load i32, i32* %sunkaddr89, align 8
  %148 = icmp sgt i32 %147, 0
  br i1 %148, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge16
  %149 = icmp eq i32 %6, 0
  br i1 %149, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  %150 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %151 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %152 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr162 = ptrtoint %struct.phuff_entropy_decoder* %4 to i64
  %sunkaddr163 = add i64 %sunkaddr162, 88
  %sunkaddr164 = inttoptr i64 %sunkaddr163 to i64*
  %sunkaddr165 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr166 = add i64 %sunkaddr165, 416
  %sunkaddr167 = inttoptr i64 %sunkaddr166 to i32*
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  %sunkaddr156 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr157 = add i64 %sunkaddr156, 516
  %sunkaddr158 = inttoptr i64 %sunkaddr157 to i32*
  %153 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %154 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %155 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr159 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr160 = add i64 %sunkaddr159, 416
  %sunkaddr161 = inttoptr i64 %sunkaddr160 to i32*
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %181
  %indvars.iv = phi i64 [ %indvars.iv.next, %181 ], [ 0, %.lr.ph.split.us.preheader ]
  %156 = load i32, i32* %sunkaddr158, align 4
  %157 = icmp eq i32 %156, 0
  br i1 %157, label %158, label %181

; <label>:158:                                    ; preds = %.lr.ph.split.us
  %159 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv
  %160 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %159, align 8
  %161 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %160, i64 0, i32 5
  %162 = load i32, i32* %161, align 4
  %163 = sext i32 %162 to i64
  %164 = icmp ugt i32 %162, 3
  br i1 %164, label %170, label %165

; <label>:165:                                    ; preds = %158
  %166 = sext i32 %162 to i64
  %167 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 40, i64 %166
  %168 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %167, align 8
  %169 = icmp eq %struct.JHUFF_TBL* %168, null
  br i1 %169, label %170, label %177

; <label>:170:                                    ; preds = %165, %158
  %171 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %153, align 8
  %172 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %171, i64 0, i32 5
  store i32 49, i32* %172, align 8
  %173 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %153, align 8
  %174 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %173, i64 0, i32 6, i32 0, i64 0
  store i32 %162, i32* %174, align 4
  %175 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %155, align 8
  %176 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %175, align 8
  tail call void %176(%struct.jpeg_common_struct* nonnull %154) #3
  br label %177

; <label>:177:                                    ; preds = %165, %170
  %178 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 40, i64 %163
  %179 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %178, align 8
  %180 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 4, i64 %163
  tail call void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct* nonnull %0, %struct.JHUFF_TBL* %179, %struct.d_derived_tbl** %180) #3
  br label %181

; <label>:181:                                    ; preds = %.lr.ph.split.us, %177
  %182 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 2, i32 1, i64 %indvars.iv
  store i32 0, i32* %182, align 4
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %183 = load i32, i32* %sunkaddr161, align 8
  %184 = sext i32 %183 to i64
  %185 = icmp slt i64 %indvars.iv.next, %184
  br i1 %185, label %.lr.ph.split.us, label %._crit_edge.loopexit

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %204
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %204 ], [ 0, %.lr.ph.split.preheader ]
  %186 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv19
  %187 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %186, align 8
  %188 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %187, i64 0, i32 6
  %189 = load i32, i32* %188, align 8
  %190 = sext i32 %189 to i64
  %191 = icmp ugt i32 %189, 3
  br i1 %191, label %197, label %192

; <label>:192:                                    ; preds = %.lr.ph.split
  %193 = sext i32 %189 to i64
  %194 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 41, i64 %193
  %195 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %194, align 8
  %196 = icmp eq %struct.JHUFF_TBL* %195, null
  br i1 %196, label %197, label %204

; <label>:197:                                    ; preds = %192, %.lr.ph.split
  %198 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %150, align 8
  %199 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %198, i64 0, i32 5
  store i32 49, i32* %199, align 8
  %200 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %150, align 8
  %201 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %200, i64 0, i32 6, i32 0, i64 0
  store i32 %189, i32* %201, align 4
  %202 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %152, align 8
  %203 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %202, align 8
  tail call void %203(%struct.jpeg_common_struct* nonnull %151) #3
  br label %204

; <label>:204:                                    ; preds = %192, %197
  %205 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 41, i64 %190
  %206 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %205, align 8
  %207 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 4, i64 %190
  tail call void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct* nonnull %0, %struct.JHUFF_TBL* %206, %struct.d_derived_tbl** %207) #3
  %208 = bitcast %struct.d_derived_tbl** %207 to i64*
  %209 = load i64, i64* %208, align 8
  store i64 %209, i64* %sunkaddr164, align 8
  %210 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 2, i32 1, i64 %indvars.iv19
  store i32 0, i32* %210, align 4
  %indvars.iv.next20 = add nuw i64 %indvars.iv19, 1
  %211 = load i32, i32* %sunkaddr167, align 8
  %212 = sext i32 %211 to i64
  %213 = icmp slt i64 %indvars.iv.next20, %212
  br i1 %213, label %.lr.ph.split, label %._crit_edge.loopexit170

._crit_edge.loopexit:                             ; preds = %181
  br label %._crit_edge

._crit_edge.loopexit170:                          ; preds = %204
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit170, %._crit_edge.loopexit, %._crit_edge16
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
  %18 = tail call fastcc i32 @process_restart(%struct.jpeg_decompress_struct* nonnull %0)
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %.loopexit, label %20

; <label>:20:                                     ; preds = %17, %13, %2
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
  br i1 %44, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %20
  %sunkaddr74 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr75 = add i64 %sunkaddr74, 24
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to i64*
  %sunkaddr = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr77 = add i64 %sunkaddr, 32
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to i32*
  %sunkaddr79 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr80 = add i64 %sunkaddr79, 24
  %sunkaddr81 = inttoptr i64 %sunkaddr80 to i64*
  %sunkaddr82 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr83 = add i64 %sunkaddr82, 32
  %sunkaddr84 = inttoptr i64 %sunkaddr83 to i32*
  %sunkaddr91 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr92 = add i64 %sunkaddr91, 464
  %sunkaddr93 = inttoptr i64 %sunkaddr92 to i32*
  %sunkaddr85 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr86 = add i64 %sunkaddr85, 24
  %sunkaddr87 = inttoptr i64 %sunkaddr86 to i64*
  %sunkaddr88 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr89 = add i64 %sunkaddr88, 32
  %sunkaddr90 = inttoptr i64 %sunkaddr89 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %111
  %indvars.iv = phi i64 [ %indvars.iv.next, %111 ], [ 0, %.lr.ph.preheader ]
  %.0216 = phi i32 [ %.5, %111 ], [ %36, %.lr.ph.preheader ]
  %.0315 = phi i64 [ %.58, %111 ], [ %34, %.lr.ph.preheader ]
  %45 = getelementptr inbounds [64 x i16]*, [64 x i16]** %1, i64 %indvars.iv
  %46 = bitcast [64 x i16]** %45 to i16**
  %47 = load i16*, i16** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 67, i64 %indvars.iv
  %49 = load i32, i32* %48, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %50
  %52 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %51, align 8
  %53 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %52, i64 0, i32 5
  %54 = load i32, i32* %53, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 4, i64 %55
  %57 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %56, align 8
  %58 = icmp slt i32 %.0216, 8
  br i1 %58, label %59, label %66

; <label>:59:                                     ; preds = %.lr.ph
  %60 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.0315, i32 %.0216, i32 0) #3
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %.loopexit.loopexit, label %62

; <label>:62:                                     ; preds = %59
  %63 = load i64, i64* %sunkaddr76, align 8
  %64 = load i32, i32* %sunkaddr78, align 8
  %65 = icmp slt i32 %64, 8
  br i1 %65, label %79, label %66

; <label>:66:                                     ; preds = %62, %.lr.ph
  %.14 = phi i64 [ %.0315, %.lr.ph ], [ %63, %62 ]
  %.1 = phi i32 [ %.0216, %.lr.ph ], [ %64, %62 ]
  %67 = add nsw i32 %.1, -8
  %68 = zext i32 %67 to i64
  %69 = ashr i64 %.14, %68
  %70 = and i64 %69, 255
  %71 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %57, i64 0, i32 4, i64 %70
  %72 = load i32, i32* %71, align 4
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %79, label %74

; <label>:74:                                     ; preds = %66
  %75 = sub nsw i32 %.1, %72
  %76 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %57, i64 0, i32 5, i64 %70
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  br label %85

; <label>:79:                                     ; preds = %66, %62
  %.25 = phi i64 [ %63, %62 ], [ %.14, %66 ]
  %.2 = phi i32 [ %64, %62 ], [ %.1, %66 ]
  %.01 = phi i32 [ 1, %62 ], [ 9, %66 ]
  %80 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* nonnull %3, i64 %.25, i32 %.2, %struct.d_derived_tbl* %57, i32 %.01) #3
  %81 = icmp slt i32 %80, 0
  br i1 %81, label %.loopexit.loopexit, label %82

; <label>:82:                                     ; preds = %79
  %83 = load i64, i64* %sunkaddr81, align 8
  %84 = load i32, i32* %sunkaddr84, align 8
  br label %85

; <label>:85:                                     ; preds = %82, %74
  %.010 = phi i32 [ %80, %82 ], [ %78, %74 ]
  %.36 = phi i64 [ %83, %82 ], [ %.14, %74 ]
  %.3 = phi i32 [ %84, %82 ], [ %75, %74 ]
  %86 = icmp eq i32 %.010, 0
  br i1 %86, label %111, label %87

; <label>:87:                                     ; preds = %85
  %88 = icmp slt i32 %.3, %.010
  br i1 %88, label %89, label %95

; <label>:89:                                     ; preds = %87
  %90 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.36, i32 %.3, i32 %.010) #3
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %.loopexit.loopexit, label %92

; <label>:92:                                     ; preds = %89
  %93 = load i64, i64* %sunkaddr87, align 8
  %94 = load i32, i32* %sunkaddr90, align 8
  br label %95

; <label>:95:                                     ; preds = %87, %92
  %.47 = phi i64 [ %93, %92 ], [ %.36, %87 ]
  %.4 = phi i32 [ %94, %92 ], [ %.3, %87 ]
  %96 = sub nsw i32 %.4, %.010
  %97 = zext i32 %96 to i64
  %98 = ashr i64 %.47, %97
  %99 = trunc i64 %98 to i32
  %100 = shl i32 1, %.010
  %101 = add nsw i32 %100, -1
  %102 = and i32 %99, %101
  %103 = sext i32 %.010 to i64
  %104 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_test, i64 0, i64 %103
  %105 = load i32, i32* %104, align 4
  %106 = icmp slt i32 %102, %105
  br i1 %106, label %107, label %111

; <label>:107:                                    ; preds = %95
  %108 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_offset, i64 0, i64 %103
  %109 = load i32, i32* %108, align 4
  %110 = add nsw i32 %109, %102
  br label %111

; <label>:111:                                    ; preds = %95, %85, %107
  %.111 = phi i32 [ %110, %107 ], [ 0, %85 ], [ %102, %95 ]
  %.58 = phi i64 [ %.47, %107 ], [ %.36, %85 ], [ %.47, %95 ]
  %.5 = phi i32 [ %96, %107 ], [ %.3, %85 ], [ %96, %95 ]
  %112 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %4, i64 0, i32 1, i64 %50
  %113 = load i32, i32* %112, align 4
  %114 = add nsw i32 %113, %.111
  store i32 %114, i32* %112, align 4
  %115 = shl i32 %114, %9
  %116 = trunc i32 %115 to i16
  store i16 %116, i16* %47, align 2
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %117 = load i32, i32* %sunkaddr93, align 8
  %118 = sext i32 %117 to i64
  %119 = icmp slt i64 %indvars.iv.next, %118
  br i1 %119, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %111
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %20
  %.03.lcssa = phi i64 [ %34, %20 ], [ %.58, %._crit_edge.loopexit ]
  %.02.lcssa = phi i32 [ %36, %20 ], [ %.5, %._crit_edge.loopexit ]
  %120 = bitcast %struct.savable_state* %39 to i8*
  %121 = bitcast %struct.savable_state* %4 to i8*
  %122 = bitcast %struct.bitread_working_state* %3 to i64*
  %123 = load i64, i64* %122, align 8
  %sunkaddr38 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr39 = add i64 %sunkaddr38, 32
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to i64**
  %124 = load i64*, i64** %sunkaddr40, align 8
  store i64 %123, i64* %124, align 8
  %sunkaddr41 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr42 = add i64 %sunkaddr41, 8
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to i64*
  %125 = load i64, i64* %sunkaddr43, align 8
  %sunkaddr44 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr45 = add i64 %sunkaddr44, 32
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to %struct.jpeg_source_mgr**
  %126 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %sunkaddr46, align 8
  %127 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %126, i64 0, i32 1
  store i64 %125, i64* %127, align 8
  %sunkaddr47 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr48 = add i64 %sunkaddr47, 16
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to i32*
  %128 = load i32, i32* %sunkaddr49, align 8
  %sunkaddr50 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr51 = add i64 %sunkaddr50, 524
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to i32*
  store i32 %128, i32* %sunkaddr52, align 4
  %sunkaddr53 = ptrtoint %struct.phuff_entropy_decoder* %7 to i64
  %sunkaddr54 = add i64 %sunkaddr53, 16
  %sunkaddr55 = inttoptr i64 %sunkaddr54 to i64*
  store i64 %.03.lcssa, i64* %sunkaddr55, align 8
  %sunkaddr56 = ptrtoint %struct.phuff_entropy_decoder* %7 to i64
  %sunkaddr57 = add i64 %sunkaddr56, 24
  %sunkaddr58 = inttoptr i64 %sunkaddr57 to i32*
  store i32 %.02.lcssa, i32* %sunkaddr58, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %120, i8* nonnull %121, i64 20, i32 4, i1 false)
  %129 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 3
  %130 = load i32, i32* %129, align 4
  %131 = add i32 %130, -1
  store i32 %131, i32* %129, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %59, %79, %89
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
  %19 = tail call fastcc i32 @process_restart(%struct.jpeg_decompress_struct* nonnull %0)
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %.loopexit18, label %21

; <label>:21:                                     ; preds = %18, %14, %2
  %22 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %6, i64 0, i32 2, i32 0
  %23 = load i32, i32* %22, align 8
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %27, label %25

; <label>:25:                                     ; preds = %21
  %26 = add i32 %23, -1
  br label %154

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
  br i1 %51, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %27
  %sunkaddr95 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr96 = add i64 %sunkaddr95, 24
  %sunkaddr97 = inttoptr i64 %sunkaddr96 to i64*
  %sunkaddr = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr98 = add i64 %sunkaddr, 32
  %sunkaddr99 = inttoptr i64 %sunkaddr98 to i32*
  %sunkaddr100 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr101 = add i64 %sunkaddr100, 24
  %sunkaddr102 = inttoptr i64 %sunkaddr101 to i64*
  %sunkaddr103 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr104 = add i64 %sunkaddr103, 32
  %sunkaddr105 = inttoptr i64 %sunkaddr104 to i32*
  %sunkaddr106 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr107 = add i64 %sunkaddr106, 24
  %sunkaddr108 = inttoptr i64 %sunkaddr107 to i64*
  %sunkaddr109 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr110 = add i64 %sunkaddr109, 32
  %sunkaddr111 = inttoptr i64 %sunkaddr110 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %144
  %.0225 = phi i32 [ %.7, %144 ], [ %43, %.lr.ph.preheader ]
  %.0324 = phi i64 [ %.710, %144 ], [ %41, %.lr.ph.preheader ]
  %.01623 = phi i32 [ %145, %144 ], [ %50, %.lr.ph.preheader ]
  %52 = icmp slt i32 %.0225, 8
  br i1 %52, label %53, label %60

; <label>:53:                                     ; preds = %.lr.ph
  %54 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.0324, i32 %.0225, i32 0) #3
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %.loopexit18.loopexit, label %56

; <label>:56:                                     ; preds = %53
  %57 = load i64, i64* %sunkaddr97, align 8
  %58 = load i32, i32* %sunkaddr99, align 8
  %59 = icmp slt i32 %58, 8
  br i1 %59, label %73, label %60

; <label>:60:                                     ; preds = %56, %.lr.ph
  %.14 = phi i64 [ %.0324, %.lr.ph ], [ %57, %56 ]
  %.1 = phi i32 [ %.0225, %.lr.ph ], [ %58, %56 ]
  %61 = add nsw i32 %.1, -8
  %62 = zext i32 %61 to i64
  %63 = ashr i64 %.14, %62
  %64 = and i64 %63, 255
  %65 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %48, i64 0, i32 4, i64 %64
  %66 = load i32, i32* %65, align 4
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %73, label %68

; <label>:68:                                     ; preds = %60
  %69 = sub nsw i32 %.1, %66
  %70 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %48, i64 0, i32 5, i64 %64
  %71 = load i8, i8* %70, align 1
  %72 = zext i8 %71 to i32
  br label %79

; <label>:73:                                     ; preds = %60, %56
  %.25 = phi i64 [ %57, %56 ], [ %.14, %60 ]
  %.2 = phi i32 [ %58, %56 ], [ %.1, %60 ]
  %.01 = phi i32 [ 1, %56 ], [ 9, %60 ]
  %74 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* nonnull %3, i64 %.25, i32 %.2, %struct.d_derived_tbl* %48, i32 %.01) #3
  %75 = icmp slt i32 %74, 0
  br i1 %75, label %.loopexit18.loopexit, label %76

; <label>:76:                                     ; preds = %73
  %77 = load i64, i64* %sunkaddr102, align 8
  %78 = load i32, i32* %sunkaddr105, align 8
  br label %79

; <label>:79:                                     ; preds = %76, %68
  %.015 = phi i32 [ %74, %76 ], [ %72, %68 ]
  %.36 = phi i64 [ %77, %76 ], [ %.14, %68 ]
  %.3 = phi i32 [ %78, %76 ], [ %69, %68 ]
  %80 = ashr i32 %.015, 4
  %81 = and i32 %.015, 15
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %117, label %83

; <label>:83:                                     ; preds = %79
  %84 = add nsw i32 %80, %.01623
  %85 = icmp slt i32 %.3, %81
  br i1 %85, label %86, label %92

; <label>:86:                                     ; preds = %83
  %87 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.36, i32 %.3, i32 %81) #3
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %.loopexit18.loopexit, label %89

; <label>:89:                                     ; preds = %86
  %90 = load i64, i64* %sunkaddr108, align 8
  %91 = load i32, i32* %sunkaddr111, align 8
  br label %92

; <label>:92:                                     ; preds = %83, %89
  %.47 = phi i64 [ %90, %89 ], [ %.36, %83 ]
  %.4 = phi i32 [ %91, %89 ], [ %.3, %83 ]
  %93 = sub nsw i32 %.4, %81
  %94 = zext i32 %93 to i64
  %95 = ashr i64 %.47, %94
  %96 = trunc i64 %95 to i32
  %97 = shl i32 1, %81
  %98 = add nsw i32 %97, -1
  %99 = and i32 %96, %98
  %100 = zext i32 %81 to i64
  %101 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_test, i64 0, i64 %100
  %102 = load i32, i32* %101, align 4
  %103 = icmp slt i32 %99, %102
  br i1 %103, label %104, label %108

; <label>:104:                                    ; preds = %92
  %105 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_offset, i64 0, i64 %100
  %106 = load i32, i32* %105, align 4
  %107 = add nsw i32 %106, %99
  br label %108

; <label>:108:                                    ; preds = %92, %104
  %109 = phi i32 [ %107, %104 ], [ %99, %92 ]
  %110 = shl i32 %109, %10
  %111 = trunc i32 %110 to i16
  %112 = sext i32 %84 to i64
  %113 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %112
  %114 = load i32, i32* %113, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [64 x i16], [64 x i16]* %46, i64 0, i64 %115
  store i16 %111, i16* %116, align 2
  br label %144

; <label>:117:                                    ; preds = %79
  %118 = icmp eq i32 %80, 15
  br i1 %118, label %142, label %119

; <label>:119:                                    ; preds = %117
  %120 = shl i32 1, %80
  %121 = icmp eq i32 %80, 0
  br i1 %121, label %140, label %122

; <label>:122:                                    ; preds = %119
  %123 = icmp slt i32 %.3, %80
  br i1 %123, label %124, label %132

; <label>:124:                                    ; preds = %122
  %125 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.36, i32 %.3, i32 %80) #3
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %.loopexit18, label %127

; <label>:127:                                    ; preds = %124
  %128 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %131 = load i32, i32* %130, align 8
  br label %132

; <label>:132:                                    ; preds = %122, %127
  %.58 = phi i64 [ %129, %127 ], [ %.36, %122 ]
  %.5 = phi i32 [ %131, %127 ], [ %.3, %122 ]
  %133 = sub nsw i32 %.5, %80
  %134 = zext i32 %133 to i64
  %135 = ashr i64 %.58, %134
  %136 = trunc i64 %135 to i32
  %137 = add nsw i32 %120, -1
  %138 = and i32 %136, %137
  %139 = add i32 %138, %120
  br label %140

; <label>:140:                                    ; preds = %119, %132
  %.012 = phi i32 [ %139, %132 ], [ %120, %119 ]
  %.69 = phi i64 [ %.58, %132 ], [ %.36, %119 ]
  %.6 = phi i32 [ %133, %132 ], [ %.3, %119 ]
  %141 = add i32 %.012, -1
  br label %.loopexit

; <label>:142:                                    ; preds = %117
  %143 = add nsw i32 %.01623, 15
  br label %144

; <label>:144:                                    ; preds = %108, %142
  %.117 = phi i32 [ %84, %108 ], [ %143, %142 ]
  %.710 = phi i64 [ %.47, %108 ], [ %.36, %142 ]
  %.7 = phi i32 [ %93, %108 ], [ %.3, %142 ]
  %145 = add nsw i32 %.117, 1
  %146 = icmp slt i32 %.117, %8
  br i1 %146, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %144
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %27, %140
  %.113 = phi i32 [ %141, %140 ], [ 0, %27 ], [ %23, %.loopexit.loopexit ]
  %.811 = phi i64 [ %.69, %140 ], [ %41, %27 ], [ %.710, %.loopexit.loopexit ]
  %.8 = phi i32 [ %.6, %140 ], [ %43, %27 ], [ %.7, %.loopexit.loopexit ]
  %147 = bitcast %struct.bitread_working_state* %3 to i64*
  %148 = load i64, i64* %147, align 8
  %sunkaddr48 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr49 = add i64 %sunkaddr48, 32
  %sunkaddr50 = inttoptr i64 %sunkaddr49 to i64**
  %149 = load i64*, i64** %sunkaddr50, align 8
  store i64 %148, i64* %149, align 8
  %sunkaddr51 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr52 = add i64 %sunkaddr51, 8
  %sunkaddr53 = inttoptr i64 %sunkaddr52 to i64*
  %150 = load i64, i64* %sunkaddr53, align 8
  %sunkaddr54 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr55 = add i64 %sunkaddr54, 32
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to %struct.jpeg_source_mgr**
  %151 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %sunkaddr56, align 8
  %152 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %151, i64 0, i32 1
  store i64 %150, i64* %152, align 8
  %sunkaddr57 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr58 = add i64 %sunkaddr57, 16
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to i32*
  %153 = load i32, i32* %sunkaddr59, align 8
  %sunkaddr60 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr61 = add i64 %sunkaddr60, 524
  %sunkaddr62 = inttoptr i64 %sunkaddr61 to i32*
  store i32 %153, i32* %sunkaddr62, align 4
  %sunkaddr63 = ptrtoint %struct.phuff_entropy_decoder* %6 to i64
  %sunkaddr64 = add i64 %sunkaddr63, 16
  %sunkaddr65 = inttoptr i64 %sunkaddr64 to i64*
  store i64 %.811, i64* %sunkaddr65, align 8
  %sunkaddr66 = ptrtoint %struct.phuff_entropy_decoder* %6 to i64
  %sunkaddr67 = add i64 %sunkaddr66, 24
  %sunkaddr68 = inttoptr i64 %sunkaddr67 to i32*
  store i32 %.8, i32* %sunkaddr68, align 8
  br label %154

; <label>:154:                                    ; preds = %.loopexit, %25
  %.214 = phi i32 [ %26, %25 ], [ %.113, %.loopexit ]
  %sunkaddr69 = ptrtoint %struct.phuff_entropy_decoder* %6 to i64
  %sunkaddr70 = add i64 %sunkaddr69, 32
  %sunkaddr71 = inttoptr i64 %sunkaddr70 to i32*
  store i32 %.214, i32* %sunkaddr71, align 8
  %155 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %6, i64 0, i32 3
  %156 = load i32, i32* %155, align 4
  %157 = add i32 %156, -1
  store i32 %157, i32* %155, align 4
  br label %.loopexit18

.loopexit18.loopexit:                             ; preds = %53, %73, %86
  br label %.loopexit18

.loopexit18:                                      ; preds = %.loopexit18.loopexit, %124, %18, %154
  %.0 = phi i32 [ 1, %154 ], [ 0, %18 ], [ 0, %124 ], [ 0, %.loopexit18.loopexit ]
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
  %18 = tail call fastcc i32 @process_restart(%struct.jpeg_decompress_struct* nonnull %0)
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %.loopexit, label %20

; <label>:20:                                     ; preds = %17, %13, %2
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
  br i1 %41, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %20
  %sunkaddr48 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr49 = add i64 %sunkaddr48, 24
  %sunkaddr50 = inttoptr i64 %sunkaddr49 to i64*
  %sunkaddr = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr51 = add i64 %sunkaddr, 32
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to i32*
  %sunkaddr53 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr54 = add i64 %sunkaddr53, 464
  %sunkaddr55 = inttoptr i64 %sunkaddr54 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %63
  %indvars.iv = phi i64 [ %indvars.iv.next, %63 ], [ 0, %.lr.ph.preheader ]
  %.019 = phi i32 [ %53, %63 ], [ %36, %.lr.ph.preheader ]
  %.028 = phi i64 [ %.13, %63 ], [ %34, %.lr.ph.preheader ]
  %42 = getelementptr inbounds [64 x i16]*, [64 x i16]** %1, i64 %indvars.iv
  %43 = bitcast [64 x i16]** %42 to i16**
  %44 = load i16*, i16** %43, align 8
  %45 = icmp slt i32 %.019, 1
  br i1 %45, label %46, label %52

; <label>:46:                                     ; preds = %.lr.ph
  %47 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.028, i32 %.019, i32 1) #3
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %.loopexit.loopexit, label %49

; <label>:49:                                     ; preds = %46
  %50 = load i64, i64* %sunkaddr50, align 8
  %51 = load i32, i32* %sunkaddr52, align 8
  br label %52

; <label>:52:                                     ; preds = %.lr.ph, %49
  %.13 = phi i64 [ %50, %49 ], [ %.028, %.lr.ph ]
  %.1 = phi i32 [ %51, %49 ], [ %.019, %.lr.ph ]
  %53 = add nsw i32 %.1, -1
  %54 = zext i32 %53 to i64
  %55 = shl i64 1, %54
  %56 = and i64 %55, %.13
  %57 = icmp eq i64 %56, 0
  br i1 %57, label %63, label %58

; <label>:58:                                     ; preds = %52
  %59 = load i16, i16* %44, align 2
  %60 = zext i16 %59 to i32
  %61 = or i32 %60, %9
  %62 = trunc i32 %61 to i16
  store i16 %62, i16* %44, align 2
  br label %63

; <label>:63:                                     ; preds = %52, %58
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %64 = load i32, i32* %sunkaddr55, align 8
  %65 = sext i32 %64 to i64
  %66 = icmp slt i64 %indvars.iv.next, %65
  br i1 %66, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %63
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %20
  %.02.lcssa = phi i64 [ %34, %20 ], [ %.13, %._crit_edge.loopexit ]
  %.01.lcssa = phi i32 [ %36, %20 ], [ %53, %._crit_edge.loopexit ]
  %67 = bitcast %struct.bitread_working_state* %3 to i64*
  %68 = load i64, i64* %67, align 8
  %sunkaddr19 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr20 = add i64 %sunkaddr19, 32
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to i64**
  %69 = load i64*, i64** %sunkaddr21, align 8
  store i64 %68, i64* %69, align 8
  %sunkaddr22 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr23 = add i64 %sunkaddr22, 8
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to i64*
  %70 = load i64, i64* %sunkaddr24, align 8
  %sunkaddr25 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr26 = add i64 %sunkaddr25, 32
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to %struct.jpeg_source_mgr**
  %71 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %sunkaddr27, align 8
  %72 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %71, i64 0, i32 1
  store i64 %70, i64* %72, align 8
  %sunkaddr28 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr29 = add i64 %sunkaddr28, 16
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i32*
  %73 = load i32, i32* %sunkaddr30, align 8
  %sunkaddr31 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr32 = add i64 %sunkaddr31, 524
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to i32*
  store i32 %73, i32* %sunkaddr33, align 4
  %sunkaddr34 = ptrtoint %struct.phuff_entropy_decoder* %6 to i64
  %sunkaddr35 = add i64 %sunkaddr34, 16
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to i64*
  store i64 %.02.lcssa, i64* %sunkaddr36, align 8
  %sunkaddr37 = ptrtoint %struct.phuff_entropy_decoder* %6 to i64
  %sunkaddr38 = add i64 %sunkaddr37, 24
  %sunkaddr39 = inttoptr i64 %sunkaddr38 to i32*
  store i32 %.01.lcssa, i32* %sunkaddr39, align 8
  %74 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %6, i64 0, i32 3
  %75 = load i32, i32* %74, align 4
  %76 = add i32 %75, -1
  store i32 %76, i32* %74, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %46
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
  %10 = sext i32 %9 to i64
  %11 = sext i32 %9 to i64
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 71
  %13 = load i32, i32* %12, align 8
  %14 = shl i32 1, %13
  %15 = shl i32 -1, %13
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 49
  %17 = load i32, i32* %16, align 8
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %26, label %19

; <label>:19:                                     ; preds = %2
  %20 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 3
  %21 = load i32, i32* %20, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %26

; <label>:23:                                     ; preds = %19
  %24 = tail call fastcc i32 @process_restart(%struct.jpeg_decompress_struct* nonnull %0)
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %.loopexit, label %26

; <label>:26:                                     ; preds = %23, %19, %2
  %27 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 5
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %27, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %29 = bitcast %struct.jpeg_source_mgr** %28 to i64**
  %30 = load i64*, i64** %29, align 8
  %31 = load i64, i64* %30, align 8
  %32 = bitcast %struct.bitread_working_state* %3 to i64*
  store i64 %31, i64* %32, align 8
  %33 = getelementptr inbounds i64, i64* %30, i64 1
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 1
  store i64 %34, i64* %35, align 8
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  %37 = load i32, i32* %36, align 4
  %38 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 2
  store i32 %37, i32* %38, align 8
  %39 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 1, i32 0
  %40 = load i64, i64* %39, align 8
  %41 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 1, i32 1
  %42 = load i32, i32* %41, align 8
  %43 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 1, i32 2
  %44 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 6
  store i32* %43, i32** %44, align 8
  %45 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 2, i32 0
  %46 = load i32, i32* %45, align 8
  %47 = load [64 x i16]*, [64 x i16]** %1, align 8
  %48 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 5
  %49 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %48, align 8
  %50 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 68
  %51 = load i32, i32* %50, align 4
  %52 = icmp eq i32 %46, 0
  br i1 %52, label %.preheader45, label %.thread.preheader

.preheader45:                                     ; preds = %26
  %53 = icmp sgt i32 %51, %9
  br i1 %53, label %.loopexit46.thread, label %.lr.ph78.preheader

.lr.ph78.preheader:                               ; preds = %.preheader45
  %sunkaddr240 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr241 = add i64 %sunkaddr240, 24
  %sunkaddr242 = inttoptr i64 %sunkaddr241 to i64*
  %sunkaddr = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr243 = add i64 %sunkaddr, 32
  %sunkaddr244 = inttoptr i64 %sunkaddr243 to i32*
  %sunkaddr245 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr246 = add i64 %sunkaddr245, 24
  %sunkaddr247 = inttoptr i64 %sunkaddr246 to i64*
  %sunkaddr248 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr249 = add i64 %sunkaddr248, 32
  %sunkaddr250 = inttoptr i64 %sunkaddr249 to i32*
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %55 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr251 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr252 = add i64 %sunkaddr251, 24
  %sunkaddr253 = inttoptr i64 %sunkaddr252 to i64*
  %sunkaddr254 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr255 = add i64 %sunkaddr254, 32
  %sunkaddr256 = inttoptr i64 %sunkaddr255 to i32*
  %sunkaddr257 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr258 = add i64 %sunkaddr257, 24
  %sunkaddr259 = inttoptr i64 %sunkaddr258 to i64*
  %sunkaddr260 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr261 = add i64 %sunkaddr260, 32
  %sunkaddr262 = inttoptr i64 %sunkaddr261 to i32*
  %56 = ptrtoint [64 x i16]* %47 to i64
  %57 = ptrtoint [64 x i16]* %47 to i64
  br label %.lr.ph78

.lr.ph78:                                         ; preds = %.lr.ph78.preheader, %185
  %.0276 = phi i32 [ %.1, %185 ], [ 0, %.lr.ph78.preheader ]
  %.0375 = phi i32 [ %.11, %185 ], [ %42, %.lr.ph78.preheader ]
  %.0974 = phi i64 [ %.1120, %185 ], [ %40, %.lr.ph78.preheader ]
  %.03473 = phi i32 [ %186, %185 ], [ %51, %.lr.ph78.preheader ]
  %58 = icmp slt i32 %.0375, 8
  br i1 %58, label %59, label %68

; <label>:59:                                     ; preds = %.lr.ph78
  %60 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.0974, i32 %.0375, i32 0) #3
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %.preheader.loopexit285, label %64

.preheader.loopexit:                              ; preds = %202
  br label %.preheader

.preheader.loopexit284:                           ; preds = %143
  br label %.preheader

.preheader.loopexit285:                           ; preds = %59, %81, %97
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit285, %.preheader.loopexit284, %.preheader.loopexit, %116
  %.4.ph = phi i32 [ %.0276, %116 ], [ %.243.ph, %.preheader.loopexit ], [ %.0276, %.preheader.loopexit284 ], [ %.0276, %.preheader.loopexit285 ]
  %62 = icmp sgt i32 %.4.ph, 0
  br i1 %62, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.preheader
  %63 = sext i32 %.4.ph to i64
  br label %.lr.ph

; <label>:64:                                     ; preds = %59
  %65 = load i64, i64* %sunkaddr242, align 8
  %66 = load i32, i32* %sunkaddr244, align 8
  %67 = icmp slt i32 %66, 8
  br i1 %67, label %81, label %68

; <label>:68:                                     ; preds = %64, %.lr.ph78
  %.110 = phi i64 [ %.0974, %.lr.ph78 ], [ %65, %64 ]
  %.14 = phi i32 [ %.0375, %.lr.ph78 ], [ %66, %64 ]
  %69 = add nsw i32 %.14, -8
  %70 = zext i32 %69 to i64
  %71 = ashr i64 %.110, %70
  %72 = and i64 %71, 255
  %73 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %49, i64 0, i32 4, i64 %72
  %74 = load i32, i32* %73, align 4
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %81, label %76

; <label>:76:                                     ; preds = %68
  %77 = sub nsw i32 %.14, %74
  %78 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %49, i64 0, i32 5, i64 %72
  %79 = load i8, i8* %78, align 1
  %80 = zext i8 %79 to i32
  br label %87

; <label>:81:                                     ; preds = %68, %64
  %.211 = phi i64 [ %65, %64 ], [ %.110, %68 ]
  %.25 = phi i32 [ %66, %64 ], [ %.14, %68 ]
  %.01 = phi i32 [ 1, %64 ], [ 9, %68 ]
  %82 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* nonnull %3, i64 %.211, i32 %.25, %struct.d_derived_tbl* %49, i32 %.01) #3
  %83 = icmp slt i32 %82, 0
  br i1 %83, label %.preheader.loopexit285, label %84

; <label>:84:                                     ; preds = %81
  %85 = load i64, i64* %sunkaddr247, align 8
  %86 = load i32, i32* %sunkaddr250, align 8
  br label %87

; <label>:87:                                     ; preds = %84, %76
  %.031 = phi i32 [ %82, %84 ], [ %80, %76 ]
  %.312 = phi i64 [ %85, %84 ], [ %.110, %76 ]
  %.36 = phi i32 [ %86, %84 ], [ %77, %76 ]
  %88 = ashr i32 %.031, 4
  %trunc = trunc i32 %.031 to i4
  switch i4 %trunc, label %89 [
    i4 0, label %109
    i4 1, label %95
  ]

; <label>:89:                                     ; preds = %87
  %90 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %91 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %90, i64 0, i32 5
  store i32 114, i32* %91, align 8
  %92 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %93 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %92, i64 0, i32 1
  %94 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %93, align 8
  call void %94(%struct.jpeg_common_struct* %55, i32 -1) #3
  br label %95

; <label>:95:                                     ; preds = %87, %89
  %96 = icmp slt i32 %.36, 1
  br i1 %96, label %97, label %103

; <label>:97:                                     ; preds = %95
  %98 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.312, i32 %.36, i32 1) #3
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %.preheader.loopexit285, label %100

; <label>:100:                                    ; preds = %97
  %101 = load i64, i64* %sunkaddr253, align 8
  %102 = load i32, i32* %sunkaddr256, align 8
  br label %103

; <label>:103:                                    ; preds = %95, %100
  %.413 = phi i64 [ %101, %100 ], [ %.312, %95 ]
  %.47 = phi i32 [ %102, %100 ], [ %.36, %95 ]
  %104 = add nsw i32 %.47, -1
  %105 = zext i32 %104 to i64
  %106 = shl i64 1, %105
  %107 = and i64 %106, %.413
  %108 = icmp eq i64 %107, 0
  %. = select i1 %108, i32 %15, i32 %14
  br label %132

; <label>:109:                                    ; preds = %87
  %110 = icmp eq i32 %88, 15
  br i1 %110, label %132, label %111

; <label>:111:                                    ; preds = %109
  %112 = shl i32 1, %88
  %113 = icmp eq i32 %88, 0
  br i1 %113, label %.thread.preheader, label %114

; <label>:114:                                    ; preds = %111
  %115 = icmp slt i32 %.36, %88
  br i1 %115, label %116, label %124

; <label>:116:                                    ; preds = %114
  %117 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.312, i32 %.36, i32 %88) #3
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %.preheader, label %119

; <label>:119:                                    ; preds = %116
  %120 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 3
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 4
  %123 = load i32, i32* %122, align 8
  br label %124

; <label>:124:                                    ; preds = %114, %119
  %.514 = phi i64 [ %121, %119 ], [ %.312, %114 ]
  %.5 = phi i32 [ %123, %119 ], [ %.36, %114 ]
  %125 = sub nsw i32 %.5, %88
  %126 = zext i32 %125 to i64
  %127 = ashr i64 %.514, %126
  %128 = trunc i64 %127 to i32
  %129 = add nsw i32 %112, -1
  %130 = and i32 %128, %129
  %131 = add i32 %130, %112
  br label %.loopexit46

; <label>:132:                                    ; preds = %109, %103
  %.233 = phi i32 [ %., %103 ], [ 0, %109 ]
  %.716 = phi i64 [ %.413, %103 ], [ %.312, %109 ]
  %.7 = phi i32 [ %104, %103 ], [ %.36, %109 ]
  %133 = sext i32 %.03473 to i64
  br label %134

; <label>:134:                                    ; preds = %170, %132
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %170 ], [ %133, %132 ]
  %.039 = phi i32 [ %.140, %170 ], [ %88, %132 ]
  %.135 = phi i32 [ %171, %170 ], [ %.03473, %132 ]
  %.817 = phi i64 [ %.1019, %170 ], [ %.716, %132 ]
  %.8 = phi i32 [ %.10, %170 ], [ %.7, %132 ]
  %135 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv100
  %136 = load i32, i32* %135, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds [64 x i16], [64 x i16]* %47, i64 0, i64 %137
  %139 = load i16, i16* %138, align 2
  %140 = icmp eq i16 %139, 0
  br i1 %140, label %165, label %141

; <label>:141:                                    ; preds = %134
  %142 = icmp slt i32 %.8, 1
  br i1 %142, label %143, label %149

; <label>:143:                                    ; preds = %141
  %144 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.817, i32 %.8, i32 1) #3
  %145 = icmp eq i32 %144, 0
  br i1 %145, label %.preheader.loopexit284, label %146

; <label>:146:                                    ; preds = %143
  %147 = load i64, i64* %sunkaddr259, align 8
  %148 = load i32, i32* %sunkaddr262, align 8
  br label %149

; <label>:149:                                    ; preds = %141, %146
  %.918 = phi i64 [ %147, %146 ], [ %.817, %141 ]
  %.9 = phi i32 [ %148, %146 ], [ %.8, %141 ]
  %150 = add nsw i32 %.9, -1
  %151 = zext i32 %150 to i64
  %152 = shl i64 1, %151
  %153 = and i64 %152, %.918
  %154 = icmp eq i64 %153, 0
  br i1 %154, label %170, label %155

; <label>:155:                                    ; preds = %149
  %sunkaddr128 = shl nsw i64 %137, 1
  %sunkaddr129 = add i64 %56, %sunkaddr128
  %sunkaddr130 = inttoptr i64 %sunkaddr129 to i16*
  %156 = load i16, i16* %sunkaddr130, align 2
  %157 = sext i16 %156 to i32
  %158 = and i32 %157, %14
  %159 = icmp eq i32 %158, 0
  br i1 %159, label %160, label %170

; <label>:160:                                    ; preds = %155
  %161 = icmp sgt i16 %156, -1
  %162 = add nsw i32 %157, %14
  %163 = zext i16 %156 to i32
  %164 = add i32 %163, %15
  %storemerge41.in = select i1 %161, i32 %162, i32 %164
  %storemerge41 = trunc i32 %storemerge41.in to i16
  %sunkaddr132 = shl nsw i64 %137, 1
  %sunkaddr133 = add i64 %57, %sunkaddr132
  %sunkaddr134 = inttoptr i64 %sunkaddr133 to i16*
  store i16 %storemerge41, i16* %sunkaddr134, align 2
  br label %170

; <label>:165:                                    ; preds = %134
  %166 = icmp slt i32 %.039, 1
  %167 = trunc i64 %indvars.iv100 to i32
  br i1 %166, label %173, label %168

; <label>:168:                                    ; preds = %165
  %169 = add nsw i32 %.039, -1
  br label %170

; <label>:170:                                    ; preds = %155, %149, %160, %168
  %.140 = phi i32 [ %169, %168 ], [ %.039, %160 ], [ %.039, %149 ], [ %.039, %155 ]
  %.1019 = phi i64 [ %.817, %168 ], [ %.918, %160 ], [ %.918, %149 ], [ %.918, %155 ]
  %.10 = phi i32 [ %.8, %168 ], [ %150, %160 ], [ %150, %149 ], [ %150, %155 ]
  %indvars.iv.next101 = add nsw i64 %indvars.iv100, 1
  %171 = add nsw i32 %.135, 1
  %172 = icmp slt i64 %indvars.iv100, %11
  br i1 %172, label %134, label %173

; <label>:173:                                    ; preds = %170, %165
  %.236 = phi i32 [ %167, %165 ], [ %171, %170 ]
  %.1120 = phi i64 [ %.817, %165 ], [ %.1019, %170 ]
  %.11 = phi i32 [ %.8, %165 ], [ %.10, %170 ]
  %174 = icmp eq i32 %.233, 0
  br i1 %174, label %185, label %175

; <label>:175:                                    ; preds = %173
  %176 = sext i32 %.236 to i64
  %177 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %176
  %178 = load i32, i32* %177, align 4
  %179 = trunc i32 %.233 to i16
  %180 = sext i32 %178 to i64
  %181 = getelementptr inbounds [64 x i16], [64 x i16]* %47, i64 0, i64 %180
  store i16 %179, i16* %181, align 2
  %182 = add nsw i32 %.0276, 1
  %183 = sext i32 %.0276 to i64
  %184 = getelementptr inbounds [64 x i32], [64 x i32]* %4, i64 0, i64 %183
  store i32 %178, i32* %184, align 4
  br label %185

; <label>:185:                                    ; preds = %173, %175
  %.1 = phi i32 [ %182, %175 ], [ %.0276, %173 ]
  %186 = add nsw i32 %.236, 1
  %187 = icmp slt i32 %.236, %9
  br i1 %187, label %.lr.ph78, label %.loopexit46.loopexit

.loopexit46.loopexit:                             ; preds = %185
  br label %.loopexit46

.loopexit46:                                      ; preds = %.loopexit46.loopexit, %124
  %.03466 = phi i32 [ %.03473, %124 ], [ %186, %.loopexit46.loopexit ]
  %.0256 = phi i32 [ %.0276, %124 ], [ %.1, %.loopexit46.loopexit ]
  %.229 = phi i32 [ %131, %124 ], [ %46, %.loopexit46.loopexit ]
  %.1322 = phi i64 [ %.514, %124 ], [ %.1120, %.loopexit46.loopexit ]
  %.13 = phi i32 [ %125, %124 ], [ %.11, %.loopexit46.loopexit ]
  %188 = icmp eq i32 %.229, 0
  br i1 %188, label %.loopexit46.thread, label %.thread.preheader

.thread.preheader:                                ; preds = %.loopexit46, %111, %26
  %.243.ph = phi i32 [ 0, %26 ], [ %.0276, %111 ], [ %.0256, %.loopexit46 ]
  %.22942.ph = phi i32 [ %46, %26 ], [ %112, %111 ], [ %.229, %.loopexit46 ]
  %.438.ph = phi i32 [ %51, %26 ], [ %.03473, %111 ], [ %.03466, %.loopexit46 ]
  %.1423.ph = phi i64 [ %40, %26 ], [ %.312, %111 ], [ %.1322, %.loopexit46 ]
  %.148.ph = phi i32 [ %42, %26 ], [ %.36, %111 ], [ %.13, %.loopexit46 ]
  %189 = icmp sgt i32 %.438.ph, %9
  br i1 %189, label %.thread._crit_edge, label %.lr.ph71

.lr.ph71:                                         ; preds = %.thread.preheader
  %190 = sext i32 %.438.ph to i64
  %sunkaddr263 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr264 = add i64 %sunkaddr263, 24
  %sunkaddr265 = inttoptr i64 %sunkaddr264 to i64*
  %sunkaddr266 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr267 = add i64 %sunkaddr266, 32
  %sunkaddr268 = inttoptr i64 %sunkaddr267 to i32*
  %191 = ptrtoint [64 x i16]* %47 to i64
  %192 = ptrtoint [64 x i16]* %47 to i64
  br label %193

; <label>:193:                                    ; preds = %.thread, %.lr.ph71
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %.thread ], [ %190, %.lr.ph71 ]
  %.14870 = phi i32 [ %.16, %.thread ], [ %.148.ph, %.lr.ph71 ]
  %.142369 = phi i64 [ %.1625, %.thread ], [ %.1423.ph, %.lr.ph71 ]
  %194 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv98
  %195 = load i32, i32* %194, align 4
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds [64 x i16], [64 x i16]* %47, i64 0, i64 %196
  %198 = load i16, i16* %197, align 2
  %199 = icmp eq i16 %198, 0
  br i1 %199, label %.thread, label %200

; <label>:200:                                    ; preds = %193
  %201 = icmp slt i32 %.14870, 1
  br i1 %201, label %202, label %208

; <label>:202:                                    ; preds = %200
  %203 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.142369, i32 %.14870, i32 1) #3
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %.preheader.loopexit, label %205

; <label>:205:                                    ; preds = %202
  %206 = load i64, i64* %sunkaddr265, align 8
  %207 = load i32, i32* %sunkaddr268, align 8
  br label %208

; <label>:208:                                    ; preds = %200, %205
  %.1524 = phi i64 [ %206, %205 ], [ %.142369, %200 ]
  %.15 = phi i32 [ %207, %205 ], [ %.14870, %200 ]
  %209 = add nsw i32 %.15, -1
  %210 = zext i32 %209 to i64
  %211 = shl i64 1, %210
  %212 = and i64 %211, %.1524
  %213 = icmp eq i64 %212, 0
  br i1 %213, label %.thread, label %214

; <label>:214:                                    ; preds = %208
  %sunkaddr142 = shl nsw i64 %196, 1
  %sunkaddr143 = add i64 %191, %sunkaddr142
  %sunkaddr144 = inttoptr i64 %sunkaddr143 to i16*
  %215 = load i16, i16* %sunkaddr144, align 2
  %216 = sext i16 %215 to i32
  %217 = and i32 %216, %14
  %218 = icmp eq i32 %217, 0
  br i1 %218, label %219, label %.thread

; <label>:219:                                    ; preds = %214
  %220 = icmp sgt i16 %215, -1
  %221 = add nsw i32 %216, %14
  %222 = zext i16 %215 to i32
  %223 = add i32 %222, %15
  %storemerge.in = select i1 %220, i32 %221, i32 %223
  %storemerge = trunc i32 %storemerge.in to i16
  %sunkaddr146 = shl nsw i64 %196, 1
  %sunkaddr147 = add i64 %192, %sunkaddr146
  %sunkaddr148 = inttoptr i64 %sunkaddr147 to i16*
  store i16 %storemerge, i16* %sunkaddr148, align 2
  br label %.thread

.thread:                                          ; preds = %214, %208, %193, %219
  %.1625 = phi i64 [ %.1524, %219 ], [ %.142369, %193 ], [ %.1524, %208 ], [ %.1524, %214 ]
  %.16 = phi i32 [ %209, %219 ], [ %.14870, %193 ], [ %209, %208 ], [ %209, %214 ]
  %indvars.iv.next99 = add nsw i64 %indvars.iv98, 1
  %224 = icmp slt i64 %indvars.iv98, %10
  br i1 %224, label %193, label %.thread._crit_edge.loopexit

.thread._crit_edge.loopexit:                      ; preds = %.thread
  br label %.thread._crit_edge

.thread._crit_edge:                               ; preds = %.thread._crit_edge.loopexit, %.thread.preheader
  %.1423.lcssa = phi i64 [ %.1423.ph, %.thread.preheader ], [ %.1625, %.thread._crit_edge.loopexit ]
  %.148.lcssa = phi i32 [ %.148.ph, %.thread.preheader ], [ %.16, %.thread._crit_edge.loopexit ]
  %225 = add i32 %.22942.ph, -1
  br label %.loopexit46.thread

.loopexit46.thread:                               ; preds = %.loopexit46, %.preheader45, %.thread._crit_edge
  %.330 = phi i32 [ %225, %.thread._crit_edge ], [ 0, %.preheader45 ], [ 0, %.loopexit46 ]
  %.1726 = phi i64 [ %.1423.lcssa, %.thread._crit_edge ], [ %40, %.preheader45 ], [ %.1322, %.loopexit46 ]
  %.17 = phi i32 [ %.148.lcssa, %.thread._crit_edge ], [ %42, %.preheader45 ], [ %.13, %.loopexit46 ]
  %226 = bitcast %struct.bitread_working_state* %3 to i64*
  %227 = load i64, i64* %226, align 8
  %sunkaddr149 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr150 = add i64 %sunkaddr149, 32
  %sunkaddr151 = inttoptr i64 %sunkaddr150 to i64**
  %228 = load i64*, i64** %sunkaddr151, align 8
  store i64 %227, i64* %228, align 8
  %sunkaddr152 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr153 = add i64 %sunkaddr152, 8
  %sunkaddr154 = inttoptr i64 %sunkaddr153 to i64*
  %229 = load i64, i64* %sunkaddr154, align 8
  %sunkaddr155 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr156 = add i64 %sunkaddr155, 32
  %sunkaddr157 = inttoptr i64 %sunkaddr156 to %struct.jpeg_source_mgr**
  %230 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %sunkaddr157, align 8
  %231 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %230, i64 0, i32 1
  store i64 %229, i64* %231, align 8
  %sunkaddr158 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr159 = add i64 %sunkaddr158, 16
  %sunkaddr160 = inttoptr i64 %sunkaddr159 to i32*
  %232 = load i32, i32* %sunkaddr160, align 8
  %sunkaddr161 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr162 = add i64 %sunkaddr161, 524
  %sunkaddr163 = inttoptr i64 %sunkaddr162 to i32*
  store i32 %232, i32* %sunkaddr163, align 4
  %sunkaddr164 = ptrtoint %struct.phuff_entropy_decoder* %7 to i64
  %sunkaddr165 = add i64 %sunkaddr164, 16
  %sunkaddr166 = inttoptr i64 %sunkaddr165 to i64*
  store i64 %.1726, i64* %sunkaddr166, align 8
  %sunkaddr167 = ptrtoint %struct.phuff_entropy_decoder* %7 to i64
  %sunkaddr168 = add i64 %sunkaddr167, 24
  %sunkaddr169 = inttoptr i64 %sunkaddr168 to i32*
  store i32 %.17, i32* %sunkaddr169, align 8
  %sunkaddr170 = ptrtoint %struct.phuff_entropy_decoder* %7 to i64
  %sunkaddr171 = add i64 %sunkaddr170, 32
  %sunkaddr172 = inttoptr i64 %sunkaddr171 to i32*
  store i32 %.330, i32* %sunkaddr172, align 8
  %233 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %7, i64 0, i32 3
  %234 = load i32, i32* %233, align 4
  %235 = add i32 %234, -1
  store i32 %235, i32* %233, align 4
  br label %.loopexit

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %63, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %236 = getelementptr inbounds [64 x i32], [64 x i32]* %4, i64 0, i64 %indvars.iv.next
  %237 = load i32, i32* %236, align 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds [64 x i16], [64 x i16]* %47, i64 0, i64 %238
  store i16 0, i16* %239, align 2
  %240 = icmp sgt i64 %indvars.iv, 1
  br i1 %240, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %23, %.loopexit46.thread
  %.0 = phi i32 [ 1, %.loopexit46.thread ], [ 0, %23 ], [ 0, %.preheader ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

declare void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct*, %struct.JHUFF_TBL*, %struct.d_derived_tbl**) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @process_restart(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
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
  %sunkaddr6 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 416
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %21 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %4, i64 0, i32 2, i32 1, i64 %indvars.iv
  store i32 0, i32* %21, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %22 = load i32, i32* %sunkaddr8, align 8
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

declare i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state*, i64, i32, i32) local_unnamed_addr #1

declare i32 @jpeg_huff_decode(%struct.bitread_working_state*, i64, i32, %struct.d_derived_tbl*, i32) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

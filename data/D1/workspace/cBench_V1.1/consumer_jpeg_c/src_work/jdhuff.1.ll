; ModuleID = 'jdhuff.ll'
source_filename = "jdhuff.c"
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
%struct.jpeg_color_quantizer = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)* }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.d_derived_tbl = type { [17 x i64], [18 x i64], [17 x i32], %struct.JHUFF_TBL*, [256 x i32], [256 x i8] }
%struct.bitread_working_state = type { i8*, i64, i32, i64, i32, %struct.jpeg_decompress_struct*, i32* }
%struct.huff_entropy_decoder = type { %struct.jpeg_entropy_decoder, %struct.bitread_perm_state, %struct.savable_state, i32, [4 x %struct.d_derived_tbl*], [4 x %struct.d_derived_tbl*] }
%struct.bitread_perm_state = type { i64, i32, i32 }
%struct.savable_state = type { [4 x i32] }

@extend_test = internal unnamed_addr constant [16 x i32] [i32 0, i32 1, i32 2, i32 4, i32 8, i32 16, i32 32, i32 64, i32 128, i32 256, i32 512, i32 1024, i32 2048, i32 4096, i32 8192, i32 16384], align 16
@extend_offset = internal unnamed_addr constant [16 x i32] [i32 0, i32 -1, i32 -3, i32 -7, i32 -15, i32 -31, i32 -63, i32 -127, i32 -255, i32 -511, i32 -1023, i32 -2047, i32 -4095, i32 -8191, i32 -16383, i32 -32767], align 16
@jpeg_natural_order = external local_unnamed_addr constant [0 x i32], align 4

; Function Attrs: noinline nounwind uwtable
define void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct*, %struct.JHUFF_TBL*, %struct.d_derived_tbl** nocapture) local_unnamed_addr #0 {
  %4 = alloca [257 x i8], align 16
  %5 = alloca [257 x i32], align 16
  %6 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %2, align 8
  %7 = icmp eq %struct.d_derived_tbl* %6, null
  br i1 %7, label %8, label %16

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %10 = bitcast %struct.jpeg_memory_mgr** %9 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %11 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %10, align 8
  %12 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %11, align 8
  %13 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %14 = tail call i8* %12(%struct.jpeg_common_struct* %13, i32 1, i64 1640) #2
  %15 = bitcast %struct.d_derived_tbl** %2 to i8**
  store i8* %14, i8** %15, align 8
  br label %16

; <label>:16:                                     ; preds = %3, %8
  %17 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %2, align 8
  %18 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 3
  store %struct.JHUFF_TBL* %1, %struct.JHUFF_TBL** %18, align 8
  %19 = ptrtoint %struct.JHUFF_TBL* %1 to i64
  br label %.preheader15

.preheader15:                                     ; preds = %._crit_edge38, %16
  %indvars.iv58 = phi i64 [ 1, %16 ], [ %indvars.iv.next59, %._crit_edge38 ]
  %.0441 = phi i32 [ 0, %16 ], [ %.15.lcssa, %._crit_edge38 ]
  %.0840 = phi i32 [ 1, %16 ], [ %36, %._crit_edge38 ]
  %20 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 0, i64 %indvars.iv58
  %21 = load i8, i8* %20, align 1
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %._crit_edge38, label %.lr.ph37

.lr.ph37:                                         ; preds = %.preheader15
  %23 = trunc i32 %.0840 to i8
  %sunkaddr61 = add i64 %19, %indvars.iv58
  %sunkaddr62 = inttoptr i64 %sunkaddr61 to i8*
  %24 = load i8, i8* %sunkaddr62, align 1
  %25 = zext i8 %24 to i32
  %26 = sext i32 %.0441 to i64
  %scevgep = getelementptr [257 x i8], [257 x i8]* %4, i64 0, i64 %26
  %27 = icmp ugt i32 %25, 1
  %smax = select i1 %27, i32 %25, i32 1
  %28 = add nsw i32 %smax, -1
  %29 = zext i32 %28 to i64
  %30 = add nuw nsw i64 %29, 1
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 %23, i64 %30, i32 1, i1 false)
  %31 = icmp ugt i32 %25, 1
  %smax77 = select i1 %31, i32 %25, i32 1
  br label %32

; <label>:32:                                     ; preds = %32, %.lr.ph37
  %.0635 = phi i32 [ %33, %32 ], [ 1, %.lr.ph37 ]
  %33 = add nuw nsw i32 %.0635, 1
  %34 = icmp slt i32 %.0635, %25
  br i1 %34, label %32, label %._crit_edge38.loopexit

._crit_edge38.loopexit:                           ; preds = %32
  %35 = add i32 %.0441, %smax77
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %.preheader15, %._crit_edge38.loopexit
  %.15.lcssa = phi i32 [ %35, %._crit_edge38.loopexit ], [ %.0441, %.preheader15 ]
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %36 = add nuw nsw i32 %.0840, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next59, 17
  br i1 %exitcond60, label %37, label %.preheader15

; <label>:37:                                     ; preds = %._crit_edge38
  %38 = sext i32 %.15.lcssa to i64
  %39 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %38
  store i8 0, i8* %39, align 1
  %40 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 0
  %41 = load i8, i8* %40, align 16
  %42 = icmp eq i8 %41, 0
  br i1 %42, label %.preheader13.preheader, label %..preheader14_crit_edge

..preheader14_crit_edge:                          ; preds = %37
  %43 = sext i8 %41 to i32
  br label %.preheader14

.preheader14:                                     ; preds = %._crit_edge29, %..preheader14_crit_edge
  %.034 = phi i32 [ %56, %._crit_edge29 ], [ 0, %..preheader14_crit_edge ]
  %.0333 = phi i32 [ %57, %._crit_edge29 ], [ %43, %..preheader14_crit_edge ]
  %.232 = phi i32 [ %.3.lcssa, %._crit_edge29 ], [ 0, %..preheader14_crit_edge ]
  %44 = sext i32 %.232 to i64
  %45 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %44
  %46 = load i8, i8* %45, align 1
  %47 = sext i8 %46 to i32
  %48 = icmp eq i32 %47, %.0333
  br i1 %48, label %.lr.ph28.preheader, label %._crit_edge29

.lr.ph28.preheader:                               ; preds = %.preheader14
  br label %.lr.ph28

.lr.ph28:                                         ; preds = %.lr.ph28.preheader, %.lr.ph28
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %.lr.ph28 ], [ %44, %.lr.ph28.preheader ]
  %.127 = phi i32 [ %50, %.lr.ph28 ], [ %.034, %.lr.ph28.preheader ]
  %indvars.iv.next55 = add nsw i64 %indvars.iv54, 1
  %49 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv54
  store i32 %.127, i32* %49, align 4
  %50 = add i32 %.127, 1
  %51 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %indvars.iv.next55
  %52 = load i8, i8* %51, align 1
  %53 = sext i8 %52 to i32
  %54 = icmp eq i32 %53, %.0333
  br i1 %54, label %.lr.ph28, label %._crit_edge29.loopexit

._crit_edge29.loopexit:                           ; preds = %.lr.ph28
  %55 = trunc i64 %indvars.iv.next55 to i32
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %.preheader14, %._crit_edge29.loopexit
  %.3.lcssa = phi i32 [ %55, %._crit_edge29.loopexit ], [ %.232, %.preheader14 ]
  %.1.lcssa = phi i32 [ %50, %._crit_edge29.loopexit ], [ %.034, %.preheader14 ]
  %56 = shl i32 %.1.lcssa, 1
  %57 = add nsw i32 %.0333, 1
  %58 = sext i32 %.3.lcssa to i64
  %59 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %58
  %60 = load i8, i8* %59, align 1
  %61 = icmp eq i8 %60, 0
  br i1 %61, label %.preheader13.preheader.loopexit, label %.preheader14

.preheader13.preheader.loopexit:                  ; preds = %._crit_edge29
  br label %.preheader13.preheader

.preheader13.preheader:                           ; preds = %.preheader13.preheader.loopexit, %37
  %62 = ptrtoint %struct.JHUFF_TBL* %1 to i64
  br label %.preheader13

.preheader13:                                     ; preds = %.preheader13.preheader, %79
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %79 ], [ 1, %.preheader13.preheader ]
  %.425 = phi i32 [ %.5, %79 ], [ 0, %.preheader13.preheader ]
  %63 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 0, i64 %indvars.iv51
  %64 = load i8, i8* %63, align 1
  %65 = icmp eq i8 %64, 0
  br i1 %65, label %79, label %66

; <label>:66:                                     ; preds = %.preheader13
  %67 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 2, i64 %indvars.iv51
  store i32 %.425, i32* %67, align 4
  %68 = sext i32 %.425 to i64
  %69 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %68
  %70 = load i32, i32* %69, align 4
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 0, i64 %indvars.iv51
  store i64 %71, i64* %72, align 8
  %sunkaddr64 = add i64 %62, %indvars.iv51
  %sunkaddr65 = inttoptr i64 %sunkaddr64 to i8*
  %73 = load i8, i8* %sunkaddr65, align 1
  %promoted67 = zext i8 %73 to i64
  %promoted66 = sext i32 %.425 to i64
  %74 = add nsw i64 %promoted67, %promoted66
  %promoted = trunc i64 %74 to i32
  %75 = add nsw i64 %74, -1
  %76 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %75
  %77 = load i32, i32* %76, align 4
  %78 = zext i32 %77 to i64
  br label %79

; <label>:79:                                     ; preds = %.preheader13, %66
  %.sink = phi i64 [ %78, %66 ], [ -1, %.preheader13 ]
  %.5 = phi i32 [ %promoted, %66 ], [ %.425, %.preheader13 ]
  %80 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 1, i64 %indvars.iv51
  store i64 %.sink, i64* %80, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next52, 17
  br i1 %exitcond53, label %81, label %.preheader13

; <label>:81:                                     ; preds = %79
  %82 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 1, i64 17
  store i64 1048575, i64* %82, align 8
  %83 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 4, i64 0
  %84 = bitcast i32* %83 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %84, i8 0, i64 1024, i32 8, i1 false)
  %sunkaddr = ptrtoint %struct.JHUFF_TBL* %1 to i64
  %sunkaddr81 = ptrtoint %struct.JHUFF_TBL* %1 to i64
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge21, %81
  %indvars.iv49 = phi i64 [ 1, %81 ], [ %indvars.iv.next50, %._crit_edge21 ]
  %.623 = phi i32 [ 0, %81 ], [ %.7.lcssa, %._crit_edge21 ]
  %85 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 0, i64 %indvars.iv49
  %86 = load i8, i8* %85, align 1
  %87 = icmp eq i8 %86, 0
  br i1 %87, label %._crit_edge21, label %.lr.ph20.split.us.preheader

.lr.ph20.split.us.preheader:                      ; preds = %.preheader
  %88 = sub nuw nsw i64 8, %indvars.iv49
  %89 = trunc i64 %88 to i32
  %90 = shl i32 1, %89
  %91 = sext i32 %.623 to i64
  %92 = trunc i64 %88 to i32
  %93 = trunc i64 %indvars.iv49 to i32
  %sunkaddr82 = add i64 %indvars.iv49, %sunkaddr81
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to i8*
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %._crit_edge.us, %.lr.ph20.split.us.preheader
  %indvars.iv47 = phi i64 [ %91, %.lr.ph20.split.us.preheader ], [ %indvars.iv.next48, %._crit_edge.us ]
  %.1718.us = phi i32 [ 1, %.lr.ph20.split.us.preheader ], [ %104, %._crit_edge.us ]
  %94 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv47
  %95 = load i32, i32* %94, align 4
  %96 = shl i32 %95, %92
  %97 = sext i32 %96 to i64
  %sunkaddr78 = add i64 %indvars.iv47, %sunkaddr
  %sunkaddr79 = add i64 %sunkaddr78, 17
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to i8*
  br label %98

; <label>:98:                                     ; preds = %98, %.lr.ph20.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %98 ], [ %97, %.lr.ph20.split.us ]
  %.0117.us = phi i32 [ %102, %98 ], [ %90, %.lr.ph20.split.us ]
  %99 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 4, i64 %indvars.iv
  store i32 %93, i32* %99, align 4
  %100 = load i8, i8* %sunkaddr80, align 1
  %101 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %17, i64 0, i32 5, i64 %indvars.iv
  store i8 %100, i8* %101, align 1
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %102 = add nsw i32 %.0117.us, -1
  %103 = icmp sgt i32 %.0117.us, 1
  br i1 %103, label %98, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %98
  %104 = add nuw nsw i32 %.1718.us, 1
  %indvars.iv.next48 = add i64 %indvars.iv47, 1
  %105 = load i8, i8* %sunkaddr83, align 1
  %106 = zext i8 %105 to i32
  %107 = icmp slt i32 %.1718.us, %106
  br i1 %107, label %.lr.ph20.split.us, label %._crit_edge21.loopexit42

._crit_edge21.loopexit42:                         ; preds = %._crit_edge.us
  %108 = trunc i64 %indvars.iv.next48 to i32
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %.preheader, %._crit_edge21.loopexit42
  %.7.lcssa = phi i32 [ %108, %._crit_edge21.loopexit42 ], [ %.623, %.preheader ]
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond = icmp eq i64 %indvars.iv.next50, 9
  br i1 %exitcond, label %109, label %.preheader

; <label>:109:                                    ; preds = %._crit_edge21
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nocapture, i64, i32, i32) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 0
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 1
  %8 = load i64, i64* %7, align 8
  %9 = icmp slt i32 %2, 25
  br i1 %9, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %4
  %sunkaddr102 = ptrtoint %struct.bitread_working_state* %0 to i64
  %sunkaddr103 = add i64 %sunkaddr102, 16
  %sunkaddr104 = inttoptr i64 %sunkaddr103 to i32*
  %sunkaddr = ptrtoint %struct.bitread_working_state* %0 to i64
  %sunkaddr105 = add i64 %sunkaddr, 40
  %sunkaddr106 = inttoptr i64 %sunkaddr105 to %struct.jpeg_decompress_struct**
  %sunkaddr107 = ptrtoint %struct.bitread_working_state* %0 to i64
  %sunkaddr108 = add i64 %sunkaddr107, 40
  %sunkaddr109 = inttoptr i64 %sunkaddr108 to %struct.jpeg_decompress_struct**
  %sunkaddr110 = ptrtoint %struct.bitread_working_state* %0 to i64
  %sunkaddr111 = add i64 %sunkaddr110, 40
  %sunkaddr112 = inttoptr i64 %sunkaddr111 to %struct.jpeg_decompress_struct**
  %sunkaddr113 = ptrtoint %struct.bitread_working_state* %0 to i64
  %sunkaddr114 = add i64 %sunkaddr113, 40
  %sunkaddr115 = inttoptr i64 %sunkaddr114 to %struct.jpeg_decompress_struct**
  %sunkaddr116 = ptrtoint %struct.bitread_working_state* %0 to i64
  %sunkaddr117 = add i64 %sunkaddr116, 16
  %sunkaddr118 = inttoptr i64 %sunkaddr117 to i32*
  %sunkaddr119 = ptrtoint %struct.bitread_working_state* %0 to i64
  %sunkaddr120 = add i64 %sunkaddr119, 48
  %sunkaddr121 = inttoptr i64 %sunkaddr120 to i32**
  %sunkaddr122 = ptrtoint %struct.bitread_working_state* %0 to i64
  %sunkaddr123 = add i64 %sunkaddr122, 40
  %sunkaddr124 = inttoptr i64 %sunkaddr123 to %struct.jpeg_error_mgr***
  %sunkaddr125 = ptrtoint %struct.bitread_working_state* %0 to i64
  %sunkaddr126 = add i64 %sunkaddr125, 40
  %sunkaddr127 = inttoptr i64 %sunkaddr126 to %struct.jpeg_decompress_struct**
  %sunkaddr128 = ptrtoint %struct.bitread_working_state* %0 to i64
  %sunkaddr129 = add i64 %sunkaddr128, 48
  %sunkaddr130 = inttoptr i64 %sunkaddr129 to i32**
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.loopexit14
  %.0229 = phi i64 [ %76, %.loopexit14 ], [ %1, %.lr.ph.preheader ]
  %.0327 = phi i32 [ %77, %.loopexit14 ], [ %2, %.lr.ph.preheader ]
  %.0426 = phi i64 [ %.6, %.loopexit14 ], [ %8, %.lr.ph.preheader ]
  %.0625 = phi i8* [ %.612, %.loopexit14 ], [ %6, %.lr.ph.preheader ]
  %10 = load i32, i32* %sunkaddr104, align 8
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %59

; <label>:12:                                     ; preds = %.lr.ph
  %13 = icmp eq i64 %.0426, 0
  br i1 %13, label %14, label %30

; <label>:14:                                     ; preds = %12
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %sunkaddr106, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i64 0, i32 5
  %17 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %17, i64 0, i32 3
  %19 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %18, align 8
  %20 = tail call i32 %19(%struct.jpeg_decompress_struct* %15) #2
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %.loopexit.loopexit137, label %22

; <label>:22:                                     ; preds = %14
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %sunkaddr109, align 8
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %23, i64 0, i32 5
  %25 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %25, i64 0, i32 0
  %27 = load i8*, i8** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %25, i64 0, i32 1
  %29 = load i64, i64* %28, align 8
  br label %30

; <label>:30:                                     ; preds = %12, %22
  %.17 = phi i8* [ %27, %22 ], [ %.0625, %12 ]
  %.15 = phi i64 [ %29, %22 ], [ %.0426, %12 ]
  %31 = add i64 %.15, -1
  %32 = getelementptr inbounds i8, i8* %.17, i64 1
  %33 = load i8, i8* %.17, align 1
  %34 = zext i8 %33 to i64
  %35 = icmp eq i8 %33, -1
  br i1 %35, label %.preheader.preheader, label %.loopexit14

.preheader.preheader:                             ; preds = %30
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %53
  %.28 = phi i8* [ %55, %53 ], [ %32, %.preheader.preheader ]
  %.2 = phi i64 [ %54, %53 ], [ %31, %.preheader.preheader ]
  %36 = icmp eq i64 %.2, 0
  br i1 %36, label %37, label %53

; <label>:37:                                     ; preds = %.preheader
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %sunkaddr112, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %38, i64 0, i32 5
  %40 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %40, i64 0, i32 3
  %42 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %41, align 8
  %43 = tail call i32 %42(%struct.jpeg_decompress_struct* %38) #2
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %.loopexit.loopexit, label %45

; <label>:45:                                     ; preds = %37
  %46 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %sunkaddr115, align 8
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %46, i64 0, i32 5
  %48 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %48, i64 0, i32 0
  %50 = load i8*, i8** %49, align 8
  %51 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %48, i64 0, i32 1
  %52 = load i64, i64* %51, align 8
  br label %53

; <label>:53:                                     ; preds = %.preheader, %45
  %.39 = phi i8* [ %50, %45 ], [ %.28, %.preheader ]
  %.3 = phi i64 [ %52, %45 ], [ %.2, %.preheader ]
  %54 = add i64 %.3, -1
  %55 = getelementptr inbounds i8, i8* %.39, i64 1
  %56 = load i8, i8* %.39, align 1
  switch i8 %56, label %57 [
    i8 -1, label %.preheader
    i8 0, label %.loopexit14.loopexit
  ]

; <label>:57:                                     ; preds = %53
  %58 = zext i8 %56 to i32
  store i32 %58, i32* %sunkaddr118, align 8
  br label %59

; <label>:59:                                     ; preds = %.lr.ph, %57
  %.410 = phi i8* [ %55, %57 ], [ %.0625, %.lr.ph ]
  %.4 = phi i64 [ %54, %57 ], [ %.0426, %.lr.ph ]
  %60 = icmp slt i32 %.0327, %3
  br i1 %60, label %61, label %._crit_edge.loopexit

; <label>:61:                                     ; preds = %59
  %62 = load i32*, i32** %sunkaddr121, align 8
  %63 = load i32, i32* %62, align 4
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %65, label %.loopexit14

; <label>:65:                                     ; preds = %61
  %66 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %sunkaddr124, align 8
  %67 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %68 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %67, i64 0, i32 5
  store i32 113, i32* %68, align 8
  %69 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %sunkaddr127, align 8
  %70 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %69, i64 0, i32 0
  %71 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %71, i64 0, i32 1
  %73 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %72, align 8
  %.cast = bitcast %struct.jpeg_decompress_struct* %69 to %struct.jpeg_common_struct*
  tail call void %73(%struct.jpeg_common_struct* %.cast, i32 -1) #2
  %74 = load i32*, i32** %sunkaddr130, align 8
  store i32 1, i32* %74, align 4
  br label %.loopexit14

.loopexit14.loopexit:                             ; preds = %53
  br label %.loopexit14

.loopexit14:                                      ; preds = %.loopexit14.loopexit, %61, %30, %65
  %.612 = phi i8* [ %.410, %65 ], [ %32, %30 ], [ %.410, %61 ], [ %55, %.loopexit14.loopexit ]
  %.6 = phi i64 [ %.4, %65 ], [ %31, %30 ], [ %.4, %61 ], [ %54, %.loopexit14.loopexit ]
  %.1 = phi i64 [ 0, %65 ], [ %34, %30 ], [ 0, %61 ], [ 255, %.loopexit14.loopexit ]
  %75 = shl i64 %.0229, 8
  %76 = or i64 %.1, %75
  %77 = add nsw i32 %.0327, 8
  %78 = icmp slt i32 %77, 25
  br i1 %78, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %59, %.loopexit14
  %.03.lcssa.ph = phi i32 [ %.0327, %59 ], [ %77, %.loopexit14 ]
  %.02.lcssa.ph = phi i64 [ %.0229, %59 ], [ %76, %.loopexit14 ]
  %.713.ph = phi i8* [ %.410, %59 ], [ %.612, %.loopexit14 ]
  %.7.ph = phi i64 [ %.4, %59 ], [ %.6, %.loopexit14 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  %.03.lcssa = phi i32 [ %2, %4 ], [ %.03.lcssa.ph, %._crit_edge.loopexit ]
  %.02.lcssa = phi i64 [ %1, %4 ], [ %.02.lcssa.ph, %._crit_edge.loopexit ]
  %.713 = phi i8* [ %6, %4 ], [ %.713.ph, %._crit_edge.loopexit ]
  %.7 = phi i64 [ %8, %4 ], [ %.7.ph, %._crit_edge.loopexit ]
  %79 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 0
  store i8* %.713, i8** %79, align 8
  %sunkaddr72 = ptrtoint %struct.bitread_working_state* %0 to i64
  %sunkaddr73 = add i64 %sunkaddr72, 8
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to i64*
  store i64 %.7, i64* %sunkaddr74, align 8
  %80 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 3
  store i64 %.02.lcssa, i64* %80, align 8
  %81 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 4
  store i32 %.03.lcssa, i32* %81, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %37
  br label %.loopexit

.loopexit.loopexit137:                            ; preds = %14
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit137, %.loopexit.loopexit, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %.loopexit.loopexit ], [ 0, %.loopexit.loopexit137 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @jpeg_huff_decode(%struct.bitread_working_state* nocapture, i64, i32, %struct.d_derived_tbl* nocapture readonly, i32) local_unnamed_addr #0 {
  %6 = icmp slt i32 %2, %4
  br i1 %6, label %7, label %15

; <label>:7:                                      ; preds = %5
  %8 = tail call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %0, i64 %1, i32 %2, i32 %4)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %.loopexit, label %10

; <label>:10:                                     ; preds = %7
  %11 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 3
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 4
  %14 = load i32, i32* %13, align 8
  br label %15

; <label>:15:                                     ; preds = %5, %10
  %.03 = phi i32 [ %14, %10 ], [ %2, %5 ]
  %.02 = phi i64 [ %12, %10 ], [ %1, %5 ]
  %16 = sub nsw i32 %.03, %4
  %17 = zext i32 %16 to i64
  %18 = ashr i64 %.02, %17
  %19 = trunc i64 %18 to i32
  %20 = shl i32 1, %4
  %21 = add nsw i32 %20, -1
  %22 = and i32 %19, %21
  %23 = sext i32 %22 to i64
  %24 = sext i32 %4 to i64
  %25 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %3, i64 0, i32 1, i64 %24
  %26 = load i64, i64* %25, align 8
  %27 = icmp sgt i64 %23, %26
  br i1 %27, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %15
  %28 = sext i32 %4 to i64
  %sunkaddr37 = ptrtoint %struct.bitread_working_state* %0 to i64
  %sunkaddr38 = add i64 %sunkaddr37, 24
  %sunkaddr39 = inttoptr i64 %sunkaddr38 to i64*
  %sunkaddr = ptrtoint %struct.bitread_working_state* %0 to i64
  %sunkaddr40 = add i64 %sunkaddr, 32
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to i32*
  br label %29

; <label>:29:                                     ; preds = %38, %.lr.ph
  %indvars.iv = phi i64 [ %28, %.lr.ph ], [ %indvars.iv.next, %38 ]
  %.0115 = phi i64 [ %23, %.lr.ph ], [ %43, %38 ]
  %.114 = phi i64 [ %.02, %.lr.ph ], [ %.2, %38 ]
  %.1413 = phi i32 [ %16, %.lr.ph ], [ %39, %38 ]
  %30 = shl i64 %.0115, 1
  %31 = icmp slt i32 %.1413, 1
  br i1 %31, label %32, label %38

; <label>:32:                                     ; preds = %29
  %33 = tail call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %0, i64 %.114, i32 %.1413, i32 1)
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %.loopexit.loopexit, label %35

; <label>:35:                                     ; preds = %32
  %36 = load i64, i64* %sunkaddr39, align 8
  %37 = load i32, i32* %sunkaddr41, align 8
  br label %38

; <label>:38:                                     ; preds = %29, %35
  %.25 = phi i32 [ %37, %35 ], [ %.1413, %29 ]
  %.2 = phi i64 [ %36, %35 ], [ %.114, %29 ]
  %39 = add nsw i32 %.25, -1
  %40 = zext i32 %39 to i64
  %41 = lshr i64 %.2, %40
  %42 = and i64 %41, 1
  %43 = or i64 %42, %30
  %indvars.iv.next = add i64 %indvars.iv, 1
  %44 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %3, i64 0, i32 1, i64 %indvars.iv.next
  %45 = load i64, i64* %44, align 8
  %46 = icmp sgt i64 %43, %45
  br i1 %46, label %29, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %38
  %47 = trunc i64 %indvars.iv.next to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %15, %._crit_edge.loopexit
  %.06.lcssa = phi i32 [ %47, %._crit_edge.loopexit ], [ %4, %15 ]
  %.14.lcssa = phi i32 [ %39, %._crit_edge.loopexit ], [ %16, %15 ]
  %.1.lcssa = phi i64 [ %.2, %._crit_edge.loopexit ], [ %.02, %15 ]
  %.01.lcssa = phi i64 [ %43, %._crit_edge.loopexit ], [ %23, %15 ]
  %.lcssa = phi i64 [ %indvars.iv.next, %._crit_edge.loopexit ], [ %24, %15 ]
  %48 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 3
  store i64 %.1.lcssa, i64* %48, align 8
  %49 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 4
  store i32 %.14.lcssa, i32* %49, align 8
  %50 = icmp sgt i32 %.06.lcssa, 16
  br i1 %50, label %51, label %62

; <label>:51:                                     ; preds = %._crit_edge
  %52 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %0, i64 0, i32 5
  %53 = bitcast %struct.jpeg_decompress_struct** %52 to %struct.jpeg_error_mgr***
  %54 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %53, align 8
  %55 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %56 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %55, i64 0, i32 5
  store i32 114, i32* %56, align 8
  %57 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %52, align 8
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %57, i64 0, i32 0
  %59 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %60 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %59, i64 0, i32 1
  %61 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %60, align 8
  %.cast = bitcast %struct.jpeg_decompress_struct* %57 to %struct.jpeg_common_struct*
  tail call void %61(%struct.jpeg_common_struct* %.cast, i32 -1) #2
  br label %.loopexit

; <label>:62:                                     ; preds = %._crit_edge
  %63 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %3, i64 0, i32 3
  %64 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %63, align 8
  %65 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %3, i64 0, i32 2, i64 %.lcssa
  %66 = load i32, i32* %65, align 4
  %promoted = sext i32 %66 to i64
  %67 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %3, i64 0, i32 0, i64 %.lcssa
  %68 = load i64, i64* %67, align 8
  %69 = sub nsw i64 %.01.lcssa, %68
  %sext = shl i64 %69, 32
  %70 = ashr exact i64 %sext, 32
  %71 = add nsw i64 %70, %promoted
  %72 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %64, i64 0, i32 1, i64 %71
  %73 = load i8, i8* %72, align 1
  %74 = zext i8 %73 to i32
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %32
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %7, %62, %51
  %.0 = phi i32 [ 0, %51 ], [ %74, %62 ], [ -1, %7 ], [ -1, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define void @jinit_huff_decoder(%struct.jpeg_decompress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 120) #2
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %9 = bitcast %struct.jpeg_entropy_decoder** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_pass_huff_decoder, void (%struct.jpeg_decompress_struct*)** %10, align 8
  %11 = getelementptr inbounds i8, i8* %7, i64 8
  %12 = bitcast i8* %11 to i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)**
  store i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)** %12, align 8
  %13 = getelementptr inbounds i8, i8* %7, i64 56
  %14 = getelementptr inbounds i8, i8* %7, i64 88
  %15 = bitcast i8* %14 to %struct.d_derived_tbl**
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %15, align 8
  %16 = bitcast i8* %13 to %struct.d_derived_tbl**
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %16, align 8
  %17 = getelementptr inbounds i8, i8* %7, i64 96
  %18 = bitcast i8* %17 to %struct.d_derived_tbl**
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %18, align 8
  %19 = getelementptr inbounds i8, i8* %7, i64 64
  %20 = bitcast i8* %19 to %struct.d_derived_tbl**
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %20, align 8
  %21 = getelementptr inbounds i8, i8* %7, i64 104
  %22 = bitcast i8* %21 to %struct.d_derived_tbl**
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %22, align 8
  %23 = getelementptr inbounds i8, i8* %7, i64 72
  %24 = bitcast i8* %23 to %struct.d_derived_tbl**
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %24, align 8
  %25 = getelementptr inbounds i8, i8* %7, i64 112
  %26 = bitcast i8* %25 to %struct.d_derived_tbl**
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %26, align 8
  %27 = getelementptr inbounds i8, i8* %7, i64 80
  %28 = bitcast i8* %27 to %struct.d_derived_tbl**
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %28, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_huff_decoder(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %3 = bitcast %struct.jpeg_entropy_decoder** %2 to %struct.huff_entropy_decoder**
  %4 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 68
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %20

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 69
  %10 = load i32, i32* %9, align 8
  %11 = icmp eq i32 %10, 63
  br i1 %11, label %12, label %20

; <label>:12:                                     ; preds = %8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 70
  %14 = load i32, i32* %13, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %20

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 71
  %18 = load i32, i32* %17, align 8
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %.preheader, label %20

; <label>:20:                                     ; preds = %16, %12, %8, %1
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i64 0, i32 5
  store i32 118, i32* %23, align 8
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i64 0, i32 1
  %26 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %25, align 8
  %27 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %26(%struct.jpeg_common_struct* %27, i32 -1) #2
  br label %.preheader

.preheader:                                       ; preds = %16, %20
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 62
  %29 = load i32, i32* %28, align 8
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %32 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %33 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %35 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %36 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr16 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr17 = add i64 %sunkaddr16, 416
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %72
  %indvars.iv = phi i64 [ %indvars.iv.next, %72 ], [ 0, %.lr.ph.preheader ]
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv
  %38 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %37, align 8
  %39 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %38, i64 0, i32 5
  %40 = load i32, i32* %39, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %38, i64 0, i32 6
  %43 = load i32, i32* %42, align 8
  %44 = sext i32 %43 to i64
  %45 = sext i32 %43 to i64
  %46 = icmp ugt i32 %40, 3
  br i1 %46, label %52, label %47

; <label>:47:                                     ; preds = %.lr.ph
  %48 = sext i32 %40 to i64
  %49 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 40, i64 %48
  %50 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %49, align 8
  %51 = icmp eq %struct.JHUFF_TBL* %50, null
  br i1 %51, label %52, label %59

; <label>:52:                                     ; preds = %47, %.lr.ph
  %53 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %54 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %53, i64 0, i32 5
  store i32 49, i32* %54, align 8
  %55 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %56 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %55, i64 0, i32 6, i32 0, i64 0
  store i32 %40, i32* %56, align 4
  %57 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %33, align 8
  %58 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %57, align 8
  tail call void %58(%struct.jpeg_common_struct* nonnull %32) #2
  br label %59

; <label>:59:                                     ; preds = %47, %52
  %60 = icmp ugt i32 %43, 3
  br i1 %60, label %65, label %61

; <label>:61:                                     ; preds = %59
  %62 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 41, i64 %45
  %63 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %62, align 8
  %64 = icmp eq %struct.JHUFF_TBL* %63, null
  br i1 %64, label %65, label %72

; <label>:65:                                     ; preds = %61, %59
  %66 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %67 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %66, i64 0, i32 5
  store i32 49, i32* %67, align 8
  %68 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %69 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %68, i64 0, i32 6, i32 0, i64 0
  store i32 %43, i32* %69, align 4
  %70 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %36, align 8
  %71 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %70, align 8
  tail call void %71(%struct.jpeg_common_struct* nonnull %35) #2
  br label %72

; <label>:72:                                     ; preds = %61, %65
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 40, i64 %41
  %74 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %73, align 8
  %75 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 4, i64 %41
  tail call void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct* nonnull %0, %struct.JHUFF_TBL* %74, %struct.d_derived_tbl** %75)
  %76 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 41, i64 %44
  %77 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %76, align 8
  %78 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 5, i64 %44
  tail call void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct* nonnull %0, %struct.JHUFF_TBL* %77, %struct.d_derived_tbl** %78)
  %79 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 2, i32 0, i64 %indvars.iv
  store i32 0, i32* %79, align 4
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %80 = load i32, i32* %sunkaddr18, align 8
  %81 = sext i32 %80 to i64
  %82 = icmp slt i64 %indvars.iv.next, %81
  br i1 %82, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %72
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %83 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 1, i32 0
  %84 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 49
  %85 = bitcast i64* %83 to i8*
  call void @llvm.memset.p0i8.i64(i8* %85, i8 0, i64 16, i32 8, i1 false)
  %86 = load i32, i32* %84, align 8
  %87 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 3
  store i32 %86, i32* %87, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @decode_mcu(%struct.jpeg_decompress_struct*, [64 x i16]** nocapture readonly) #0 {
  %3 = alloca %struct.bitread_working_state, align 8
  %4 = alloca %struct.savable_state, align 4
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %6 = bitcast %struct.jpeg_entropy_decoder** %5 to %struct.huff_entropy_decoder**
  %7 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 49
  %9 = load i32, i32* %8, align 8
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %18, label %11

; <label>:11:                                     ; preds = %2
  %12 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %7, i64 0, i32 3
  %13 = load i32, i32* %12, align 8
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %18

; <label>:15:                                     ; preds = %11
  %16 = tail call fastcc i32 @process_restart(%struct.jpeg_decompress_struct* nonnull %0)
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %.loopexit36, label %18

; <label>:18:                                     ; preds = %15, %11, %2
  %19 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 5
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %19, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 5
  %21 = bitcast %struct.jpeg_source_mgr** %20 to i64**
  %22 = load i64*, i64** %21, align 8
  %23 = load i64, i64* %22, align 8
  %24 = bitcast %struct.bitread_working_state* %3 to i64*
  store i64 %23, i64* %24, align 8
  %25 = getelementptr inbounds i64, i64* %22, i64 1
  %26 = load i64, i64* %25, align 8
  %27 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 1
  store i64 %26, i64* %27, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 72
  %29 = load i32, i32* %28, align 4
  %30 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 2
  store i32 %29, i32* %30, align 8
  %31 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %7, i64 0, i32 1, i32 0
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %7, i64 0, i32 1, i32 1
  %34 = load i32, i32* %33, align 8
  %35 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %7, i64 0, i32 1, i32 2
  %36 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %3, i64 0, i32 6
  store i32* %35, i32** %36, align 8
  %37 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %7, i64 0, i32 2
  %38 = bitcast %struct.savable_state* %4 to i8*
  %39 = bitcast %struct.savable_state* %37 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %38, i8* %39, i64 16, i32 4, i1 false)
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 66
  %41 = load i32, i32* %40, align 8
  %42 = icmp sgt i32 %41, 0
  br i1 %42, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %18
  %sunkaddr196 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr197 = add i64 %sunkaddr196, 24
  %sunkaddr198 = inttoptr i64 %sunkaddr197 to i64*
  %sunkaddr = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr199 = add i64 %sunkaddr, 32
  %sunkaddr200 = inttoptr i64 %sunkaddr199 to i32*
  %sunkaddr201 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr202 = add i64 %sunkaddr201, 24
  %sunkaddr203 = inttoptr i64 %sunkaddr202 to i64*
  %sunkaddr204 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr205 = add i64 %sunkaddr204, 32
  %sunkaddr206 = inttoptr i64 %sunkaddr205 to i32*
  %sunkaddr250 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr251 = add i64 %sunkaddr250, 464
  %sunkaddr252 = inttoptr i64 %sunkaddr251 to i32*
  %sunkaddr213 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr214 = add i64 %sunkaddr213, 24
  %sunkaddr215 = inttoptr i64 %sunkaddr214 to i64*
  %sunkaddr216 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr217 = add i64 %sunkaddr216, 32
  %sunkaddr218 = inttoptr i64 %sunkaddr217 to i32*
  %sunkaddr219 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr220 = add i64 %sunkaddr219, 24
  %sunkaddr221 = inttoptr i64 %sunkaddr220 to i64*
  %sunkaddr222 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr223 = add i64 %sunkaddr222, 32
  %sunkaddr224 = inttoptr i64 %sunkaddr223 to i32*
  %sunkaddr225 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr226 = add i64 %sunkaddr225, 24
  %sunkaddr227 = inttoptr i64 %sunkaddr226 to i64*
  %sunkaddr228 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr229 = add i64 %sunkaddr228, 32
  %sunkaddr230 = inttoptr i64 %sunkaddr229 to i32*
  %sunkaddr232 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr233 = add i64 %sunkaddr232, 24
  %sunkaddr234 = inttoptr i64 %sunkaddr233 to i64*
  %sunkaddr235 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr236 = add i64 %sunkaddr235, 32
  %sunkaddr237 = inttoptr i64 %sunkaddr236 to i32*
  %sunkaddr238 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr239 = add i64 %sunkaddr238, 24
  %sunkaddr240 = inttoptr i64 %sunkaddr239 to i64*
  %sunkaddr241 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr242 = add i64 %sunkaddr241, 32
  %sunkaddr243 = inttoptr i64 %sunkaddr242 to i32*
  %sunkaddr244 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr245 = add i64 %sunkaddr244, 24
  %sunkaddr246 = inttoptr i64 %sunkaddr245 to i64*
  %sunkaddr247 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr248 = add i64 %sunkaddr247, 32
  %sunkaddr249 = inttoptr i64 %sunkaddr248 to i32*
  %sunkaddr207 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr208 = add i64 %sunkaddr207, 24
  %sunkaddr209 = inttoptr i64 %sunkaddr208 to i64*
  %sunkaddr210 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr211 = add i64 %sunkaddr210, 32
  %sunkaddr212 = inttoptr i64 %sunkaddr211 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.loopexit
  %indvars.iv = phi i64 [ %indvars.iv.next, %.loopexit ], [ 0, %.lr.ph.preheader ]
  %.01056 = phi i32 [ %.20, %.loopexit ], [ %34, %.lr.ph.preheader ]
  %.01555 = phi i64 [ %.2035, %.loopexit ], [ %32, %.lr.ph.preheader ]
  %43 = getelementptr inbounds [64 x i16]*, [64 x i16]** %1, i64 %indvars.iv
  %44 = load [64 x i16]*, [64 x i16]** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 67, i64 %indvars.iv
  %46 = load i32, i32* %45, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %47
  %49 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %48, align 8
  %50 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %49, i64 0, i32 5
  %51 = load i32, i32* %50, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %7, i64 0, i32 4, i64 %52
  %54 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %53, align 8
  %55 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %49, i64 0, i32 6
  %56 = load i32, i32* %55, align 8
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %7, i64 0, i32 5, i64 %57
  %59 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %58, align 8
  %60 = icmp slt i32 %.01056, 8
  br i1 %60, label %61, label %68

; <label>:61:                                     ; preds = %.lr.ph
  %62 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.01555, i32 %.01056, i32 0)
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %.loopexit36.loopexit263, label %64

; <label>:64:                                     ; preds = %61
  %65 = load i64, i64* %sunkaddr198, align 8
  %66 = load i32, i32* %sunkaddr200, align 8
  %67 = icmp slt i32 %66, 8
  br i1 %67, label %81, label %68

; <label>:68:                                     ; preds = %64, %.lr.ph
  %.116 = phi i64 [ %.01555, %.lr.ph ], [ %65, %64 ]
  %.111 = phi i32 [ %.01056, %.lr.ph ], [ %66, %64 ]
  %69 = add nsw i32 %.111, -8
  %70 = zext i32 %69 to i64
  %71 = ashr i64 %.116, %70
  %72 = and i64 %71, 255
  %73 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %54, i64 0, i32 4, i64 %72
  %74 = load i32, i32* %73, align 4
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %81, label %76

; <label>:76:                                     ; preds = %68
  %77 = sub nsw i32 %.111, %74
  %78 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %54, i64 0, i32 5, i64 %72
  %79 = load i8, i8* %78, align 1
  %80 = zext i8 %79 to i32
  br label %87

; <label>:81:                                     ; preds = %68, %64
  %.217 = phi i64 [ %65, %64 ], [ %.116, %68 ]
  %.212 = phi i32 [ %66, %64 ], [ %.111, %68 ]
  %.03 = phi i32 [ 1, %64 ], [ 9, %68 ]
  %82 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* nonnull %3, i64 %.217, i32 %.212, %struct.d_derived_tbl* %54, i32 %.03)
  %83 = icmp slt i32 %82, 0
  br i1 %83, label %.loopexit36.loopexit263, label %84

; <label>:84:                                     ; preds = %81
  %85 = load i64, i64* %sunkaddr203, align 8
  %86 = load i32, i32* %sunkaddr206, align 8
  br label %87

; <label>:87:                                     ; preds = %84, %76
  %.318 = phi i64 [ %85, %84 ], [ %.116, %76 ]
  %.313 = phi i32 [ %86, %84 ], [ %77, %76 ]
  %.04 = phi i32 [ %82, %84 ], [ %80, %76 ]
  %88 = icmp eq i32 %.04, 0
  br i1 %88, label %113, label %89

; <label>:89:                                     ; preds = %87
  %90 = icmp slt i32 %.313, %.04
  br i1 %90, label %91, label %97

; <label>:91:                                     ; preds = %89
  %92 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.318, i32 %.313, i32 %.04)
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %.loopexit36.loopexit263, label %94

; <label>:94:                                     ; preds = %91
  %95 = load i64, i64* %sunkaddr209, align 8
  %96 = load i32, i32* %sunkaddr212, align 8
  br label %97

; <label>:97:                                     ; preds = %89, %94
  %.419 = phi i64 [ %95, %94 ], [ %.318, %89 ]
  %.4 = phi i32 [ %96, %94 ], [ %.313, %89 ]
  %98 = sub nsw i32 %.4, %.04
  %99 = zext i32 %98 to i64
  %100 = ashr i64 %.419, %99
  %101 = trunc i64 %100 to i32
  %102 = shl i32 1, %.04
  %103 = add nsw i32 %102, -1
  %104 = and i32 %101, %103
  %105 = sext i32 %.04 to i64
  %106 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_test, i64 0, i64 %105
  %107 = load i32, i32* %106, align 4
  %108 = icmp slt i32 %104, %107
  br i1 %108, label %109, label %113

; <label>:109:                                    ; preds = %97
  %110 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_offset, i64 0, i64 %105
  %111 = load i32, i32* %110, align 4
  %112 = add nsw i32 %111, %104
  br label %113

; <label>:113:                                    ; preds = %97, %87, %109
  %.520 = phi i64 [ %.419, %109 ], [ %.318, %87 ], [ %.419, %97 ]
  %.5 = phi i32 [ %98, %109 ], [ %.313, %87 ], [ %98, %97 ]
  %.1 = phi i32 [ %112, %109 ], [ 0, %87 ], [ %104, %97 ]
  %114 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %49, i64 0, i32 12
  %115 = load i32, i32* %114, align 8
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %.preheader.preheader, label %117

.preheader.preheader:                             ; preds = %117, %113
  br label %.preheader

; <label>:117:                                    ; preds = %113
  %118 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %4, i64 0, i32 0, i64 %47
  %119 = load i32, i32* %118, align 4
  %120 = add nsw i32 %119, %.1
  store i32 %120, i32* %118, align 4
  %121 = trunc i32 %120 to i16
  %122 = getelementptr inbounds [64 x i16], [64 x i16]* %44, i64 0, i64 0
  store i16 %121, i16* %122, align 2
  %123 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %49, i64 0, i32 9
  %124 = load i32, i32* %123, align 4
  %125 = icmp sgt i32 %124, 1
  br i1 %125, label %.preheader37.preheader, label %.preheader.preheader

.preheader37.preheader:                           ; preds = %117
  br label %.preheader37

.preheader37:                                     ; preds = %.preheader37.preheader, %194
  %.0551 = phi i32 [ %195, %194 ], [ 1, %.preheader37.preheader ]
  %.650 = phi i32 [ %.11, %194 ], [ %.5, %.preheader37.preheader ]
  %.62149 = phi i64 [ %.1126, %194 ], [ %.520, %.preheader37.preheader ]
  %126 = icmp slt i32 %.650, 8
  br i1 %126, label %127, label %134

; <label>:127:                                    ; preds = %.preheader37
  %128 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.62149, i32 %.650, i32 0)
  %129 = icmp eq i32 %128, 0
  br i1 %129, label %.loopexit36.loopexit259, label %130

; <label>:130:                                    ; preds = %127
  %131 = load i64, i64* %sunkaddr215, align 8
  %132 = load i32, i32* %sunkaddr218, align 8
  %133 = icmp slt i32 %132, 8
  br i1 %133, label %147, label %134

; <label>:134:                                    ; preds = %130, %.preheader37
  %.722 = phi i64 [ %.62149, %.preheader37 ], [ %131, %130 ]
  %.7 = phi i32 [ %.650, %.preheader37 ], [ %132, %130 ]
  %135 = add nsw i32 %.7, -8
  %136 = zext i32 %135 to i64
  %137 = ashr i64 %.722, %136
  %138 = and i64 %137, 255
  %139 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %59, i64 0, i32 4, i64 %138
  %140 = load i32, i32* %139, align 4
  %141 = icmp eq i32 %140, 0
  br i1 %141, label %147, label %142

; <label>:142:                                    ; preds = %134
  %143 = sub nsw i32 %.7, %140
  %144 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %59, i64 0, i32 5, i64 %138
  %145 = load i8, i8* %144, align 1
  %146 = zext i8 %145 to i32
  br label %153

; <label>:147:                                    ; preds = %134, %130
  %.823 = phi i64 [ %131, %130 ], [ %.722, %134 ]
  %.8 = phi i32 [ %132, %130 ], [ %.7, %134 ]
  %.02 = phi i32 [ 1, %130 ], [ 9, %134 ]
  %148 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* nonnull %3, i64 %.823, i32 %.8, %struct.d_derived_tbl* %59, i32 %.02)
  %149 = icmp slt i32 %148, 0
  br i1 %149, label %.loopexit36.loopexit259, label %150

; <label>:150:                                    ; preds = %147
  %151 = load i64, i64* %sunkaddr221, align 8
  %152 = load i32, i32* %sunkaddr224, align 8
  br label %153

; <label>:153:                                    ; preds = %150, %142
  %.924 = phi i64 [ %151, %150 ], [ %.722, %142 ]
  %.9 = phi i32 [ %152, %150 ], [ %143, %142 ]
  %.2 = phi i32 [ %148, %150 ], [ %146, %142 ]
  %154 = ashr i32 %.2, 4
  %155 = and i32 %.2, 15
  %156 = icmp eq i32 %155, 0
  br i1 %156, label %190, label %157

; <label>:157:                                    ; preds = %153
  %158 = add nsw i32 %154, %.0551
  %159 = icmp slt i32 %.9, %155
  br i1 %159, label %160, label %166

; <label>:160:                                    ; preds = %157
  %161 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.924, i32 %.9, i32 %155)
  %162 = icmp eq i32 %161, 0
  br i1 %162, label %.loopexit36.loopexit259, label %163

; <label>:163:                                    ; preds = %160
  %164 = load i64, i64* %sunkaddr227, align 8
  %165 = load i32, i32* %sunkaddr230, align 8
  br label %166

; <label>:166:                                    ; preds = %157, %163
  %.1025 = phi i64 [ %164, %163 ], [ %.924, %157 ]
  %.10 = phi i32 [ %165, %163 ], [ %.9, %157 ]
  %167 = sub nsw i32 %.10, %155
  %168 = zext i32 %167 to i64
  %169 = ashr i64 %.1025, %168
  %170 = trunc i64 %169 to i32
  %171 = shl i32 1, %155
  %172 = add nsw i32 %171, -1
  %173 = and i32 %170, %172
  %174 = zext i32 %155 to i64
  %175 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_test, i64 0, i64 %174
  %176 = load i32, i32* %175, align 4
  %177 = icmp slt i32 %173, %176
  br i1 %177, label %178, label %182

; <label>:178:                                    ; preds = %166
  %179 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_offset, i64 0, i64 %174
  %180 = load i32, i32* %179, align 4
  %181 = add nsw i32 %180, %173
  br label %182

; <label>:182:                                    ; preds = %166, %178
  %183 = phi i32 [ %181, %178 ], [ %173, %166 ]
  %184 = trunc i32 %183 to i16
  %185 = sext i32 %158 to i64
  %186 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %185
  %187 = load i32, i32* %186, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [64 x i16], [64 x i16]* %44, i64 0, i64 %188
  store i16 %184, i16* %189, align 2
  br label %194

; <label>:190:                                    ; preds = %153
  %191 = icmp eq i32 %154, 15
  br i1 %191, label %192, label %.loopexit.loopexit260

; <label>:192:                                    ; preds = %190
  %193 = add nsw i32 %.0551, 15
  br label %194

; <label>:194:                                    ; preds = %182, %192
  %.1126 = phi i64 [ %.1025, %182 ], [ %.924, %192 ]
  %.11 = phi i32 [ %167, %182 ], [ %.9, %192 ]
  %.16 = phi i32 [ %158, %182 ], [ %193, %192 ]
  %195 = add nsw i32 %.16, 1
  %196 = icmp slt i32 %195, 64
  br i1 %196, label %.preheader37, label %.loopexit.loopexit260

.preheader:                                       ; preds = %.preheader.preheader, %240
  %.2754 = phi i32 [ %241, %240 ], [ 1, %.preheader.preheader ]
  %.1353 = phi i32 [ %.18, %240 ], [ %.5, %.preheader.preheader ]
  %.132852 = phi i64 [ %.1833, %240 ], [ %.520, %.preheader.preheader ]
  %197 = icmp slt i32 %.1353, 8
  br i1 %197, label %198, label %205

; <label>:198:                                    ; preds = %.preheader
  %199 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.132852, i32 %.1353, i32 0)
  %200 = icmp eq i32 %199, 0
  br i1 %200, label %.loopexit36.loopexit, label %201

; <label>:201:                                    ; preds = %198
  %202 = load i64, i64* %sunkaddr234, align 8
  %203 = load i32, i32* %sunkaddr237, align 8
  %204 = icmp slt i32 %203, 8
  br i1 %204, label %218, label %205

; <label>:205:                                    ; preds = %201, %.preheader
  %.1429 = phi i64 [ %.132852, %.preheader ], [ %202, %201 ]
  %.14 = phi i32 [ %.1353, %.preheader ], [ %203, %201 ]
  %206 = add nsw i32 %.14, -8
  %207 = zext i32 %206 to i64
  %208 = ashr i64 %.1429, %207
  %209 = and i64 %208, 255
  %210 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %59, i64 0, i32 4, i64 %209
  %211 = load i32, i32* %210, align 4
  %212 = icmp eq i32 %211, 0
  br i1 %212, label %218, label %213

; <label>:213:                                    ; preds = %205
  %214 = sub nsw i32 %.14, %211
  %215 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %59, i64 0, i32 5, i64 %209
  %216 = load i8, i8* %215, align 1
  %217 = zext i8 %216 to i32
  br label %224

; <label>:218:                                    ; preds = %205, %201
  %.1530 = phi i64 [ %202, %201 ], [ %.1429, %205 ]
  %.15 = phi i32 [ %203, %201 ], [ %.14, %205 ]
  %.01 = phi i32 [ 1, %201 ], [ 9, %205 ]
  %219 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* nonnull %3, i64 %.1530, i32 %.15, %struct.d_derived_tbl* %59, i32 %.01)
  %220 = icmp slt i32 %219, 0
  br i1 %220, label %.loopexit36.loopexit, label %221

; <label>:221:                                    ; preds = %218
  %222 = load i64, i64* %sunkaddr240, align 8
  %223 = load i32, i32* %sunkaddr243, align 8
  br label %224

; <label>:224:                                    ; preds = %221, %213
  %.1631 = phi i64 [ %222, %221 ], [ %.1429, %213 ]
  %.1614 = phi i32 [ %223, %221 ], [ %214, %213 ]
  %.3 = phi i32 [ %219, %221 ], [ %217, %213 ]
  %225 = ashr i32 %.3, 4
  %226 = and i32 %.3, 15
  %227 = icmp eq i32 %226, 0
  br i1 %227, label %238, label %228

; <label>:228:                                    ; preds = %224
  %229 = icmp slt i32 %.1614, %226
  br i1 %229, label %230, label %236

; <label>:230:                                    ; preds = %228
  %231 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* nonnull %3, i64 %.1631, i32 %.1614, i32 %226)
  %232 = icmp eq i32 %231, 0
  br i1 %232, label %.loopexit36.loopexit, label %233

; <label>:233:                                    ; preds = %230
  %234 = load i64, i64* %sunkaddr246, align 8
  %235 = load i32, i32* %sunkaddr249, align 8
  br label %236

; <label>:236:                                    ; preds = %228, %233
  %.1732 = phi i64 [ %234, %233 ], [ %.1631, %228 ]
  %.17 = phi i32 [ %235, %233 ], [ %.1614, %228 ]
  %237 = sub nsw i32 %.17, %226
  br label %240

; <label>:238:                                    ; preds = %224
  %239 = icmp eq i32 %225, 15
  br i1 %239, label %240, label %.loopexit.loopexit

; <label>:240:                                    ; preds = %238, %236
  %.1833 = phi i64 [ %.1732, %236 ], [ %.1631, %238 ]
  %.18 = phi i32 [ %237, %236 ], [ %.1614, %238 ]
  %.pn = phi i32 [ %225, %236 ], [ 15, %238 ]
  %.38 = add i32 %.2754, 1
  %241 = add i32 %.38, %.pn
  %242 = icmp slt i32 %241, 64
  br i1 %242, label %.preheader, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %238, %240
  %.2035.ph = phi i64 [ %.1631, %238 ], [ %.1833, %240 ]
  %.20.ph = phi i32 [ %.1614, %238 ], [ %.18, %240 ]
  br label %.loopexit

.loopexit.loopexit260:                            ; preds = %190, %194
  %.2035.ph261 = phi i64 [ %.924, %190 ], [ %.1126, %194 ]
  %.20.ph262 = phi i32 [ %.9, %190 ], [ %.11, %194 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit260, %.loopexit.loopexit
  %.2035 = phi i64 [ %.2035.ph, %.loopexit.loopexit ], [ %.2035.ph261, %.loopexit.loopexit260 ]
  %.20 = phi i32 [ %.20.ph, %.loopexit.loopexit ], [ %.20.ph262, %.loopexit.loopexit260 ]
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %243 = load i32, i32* %sunkaddr252, align 8
  %244 = sext i32 %243 to i64
  %245 = icmp slt i64 %indvars.iv.next, %244
  br i1 %245, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %18
  %.015.lcssa = phi i64 [ %32, %18 ], [ %.2035, %._crit_edge.loopexit ]
  %.010.lcssa = phi i32 [ %34, %18 ], [ %.20, %._crit_edge.loopexit ]
  %246 = bitcast %struct.savable_state* %37 to i8*
  %247 = bitcast %struct.savable_state* %4 to i8*
  %248 = bitcast %struct.bitread_working_state* %3 to i64*
  %249 = load i64, i64* %248, align 8
  %sunkaddr126 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr127 = add i64 %sunkaddr126, 32
  %sunkaddr128 = inttoptr i64 %sunkaddr127 to i64**
  %250 = load i64*, i64** %sunkaddr128, align 8
  store i64 %249, i64* %250, align 8
  %sunkaddr129 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr130 = add i64 %sunkaddr129, 8
  %sunkaddr131 = inttoptr i64 %sunkaddr130 to i64*
  %251 = load i64, i64* %sunkaddr131, align 8
  %sunkaddr132 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr133 = add i64 %sunkaddr132, 32
  %sunkaddr134 = inttoptr i64 %sunkaddr133 to %struct.jpeg_source_mgr**
  %252 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %sunkaddr134, align 8
  %253 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %252, i64 0, i32 1
  store i64 %251, i64* %253, align 8
  %sunkaddr135 = ptrtoint %struct.bitread_working_state* %3 to i64
  %sunkaddr136 = add i64 %sunkaddr135, 16
  %sunkaddr137 = inttoptr i64 %sunkaddr136 to i32*
  %254 = load i32, i32* %sunkaddr137, align 8
  %sunkaddr138 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr139 = add i64 %sunkaddr138, 524
  %sunkaddr140 = inttoptr i64 %sunkaddr139 to i32*
  store i32 %254, i32* %sunkaddr140, align 4
  %sunkaddr141 = ptrtoint %struct.huff_entropy_decoder* %7 to i64
  %sunkaddr142 = add i64 %sunkaddr141, 16
  %sunkaddr143 = inttoptr i64 %sunkaddr142 to i64*
  store i64 %.015.lcssa, i64* %sunkaddr143, align 8
  %sunkaddr144 = ptrtoint %struct.huff_entropy_decoder* %7 to i64
  %sunkaddr145 = add i64 %sunkaddr144, 24
  %sunkaddr146 = inttoptr i64 %sunkaddr145 to i32*
  store i32 %.010.lcssa, i32* %sunkaddr146, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %246, i8* nonnull %247, i64 16, i32 4, i1 false)
  %255 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %7, i64 0, i32 3
  %256 = load i32, i32* %255, align 8
  %257 = add i32 %256, -1
  store i32 %257, i32* %255, align 8
  br label %.loopexit36

.loopexit36.loopexit:                             ; preds = %198, %218, %230
  br label %.loopexit36

.loopexit36.loopexit259:                          ; preds = %127, %147, %160
  br label %.loopexit36

.loopexit36.loopexit263:                          ; preds = %61, %81, %91
  br label %.loopexit36

.loopexit36:                                      ; preds = %.loopexit36.loopexit263, %.loopexit36.loopexit259, %.loopexit36.loopexit, %15, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %15 ], [ 0, %.loopexit36.loopexit ], [ 0, %.loopexit36.loopexit259 ], [ 0, %.loopexit36.loopexit263 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @process_restart(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %3 = bitcast %struct.jpeg_entropy_decoder** %2 to %struct.huff_entropy_decoder**
  %4 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %3, align 8
  %5 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 1, i32 1
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
  %16 = tail call i32 %15(%struct.jpeg_decompress_struct* %0) #2
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %29, label %.preheader

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
  %21 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 2, i32 0, i64 %indvars.iv
  store i32 0, i32* %21, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %22 = load i32, i32* %sunkaddr8, align 8
  %23 = sext i32 %22 to i64
  %24 = icmp slt i64 %indvars.iv.next, %23
  br i1 %24, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 49
  %26 = load i32, i32* %25, align 8
  %27 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 3
  store i32 %26, i32* %27, align 8
  %28 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %4, i64 0, i32 1, i32 2
  store i32 0, i32* %28, align 4
  br label %29

; <label>:29:                                     ; preds = %1, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %1 ]
  ret i32 %.0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

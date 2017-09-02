; ModuleID = 'jchuff.ll'
source_filename = "jchuff.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_compress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_destination_mgr*, i32, i32, i32, i32, double, i32, i32, i32, %struct.jpeg_component_info*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], [16 x i8], [16 x i8], [16 x i8], i32, %struct.jpeg_scan_info*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8, i16, i16, i32, i32, i32, i32, i32, i32, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, %struct.jpeg_comp_master*, %struct.jpeg_c_main_controller*, %struct.jpeg_c_prep_controller*, %struct.jpeg_c_coef_controller*, %struct.jpeg_marker_writer*, %struct.jpeg_color_converter*, %struct.jpeg_downsampler*, %struct.jpeg_forward_dct*, %struct.jpeg_entropy_encoder* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_destination_mgr = type { i8*, i64, void (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)* }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.jpeg_scan_info = type { i32, [4 x i32], i32, i32, i32, i32 }
%struct.jpeg_comp_master = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, i32, i32 }
%struct.jpeg_c_main_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32)* }
%struct.jpeg_c_prep_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* }
%struct.jpeg_c_coef_controller = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, i8***)* }
%struct.jpeg_marker_writer = type { void (%struct.jpeg_compress_struct*, i32, i8*, i32)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)* }
%struct.jpeg_color_converter = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* }
%struct.jpeg_downsampler = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, i32 }
%struct.jpeg_forward_dct = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* }
%struct.jpeg_entropy_encoder = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, void (%struct.jpeg_compress_struct*)* }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.c_derived_tbl = type { [256 x i32], [256 x i8] }
%struct.huff_entropy_encoder = type { %struct.jpeg_entropy_encoder, %struct.savable_state, i32, i32, [4 x %struct.c_derived_tbl*], [4 x %struct.c_derived_tbl*], [4 x i64*], [4 x i64*] }
%struct.savable_state = type { i64, i32, [4 x i32] }
%struct.working_state = type { i8*, i64, %struct.savable_state, %struct.jpeg_compress_struct* }

@jpeg_natural_order = external local_unnamed_addr constant [0 x i32], align 4

; Function Attrs: noinline nounwind uwtable
define void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct*, %struct.JHUFF_TBL* nocapture readonly, %struct.c_derived_tbl** nocapture) local_unnamed_addr #0 {
  %4 = alloca [257 x i8], align 16
  %5 = alloca [257 x i32], align 16
  %6 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %2, align 8
  %7 = icmp eq %struct.c_derived_tbl* %6, null
  br i1 %7, label %9, label %._crit_edge38

._crit_edge38:                                    ; preds = %3
  %8 = ptrtoint %struct.c_derived_tbl* %6 to i64
  br label %.lr.ph28

; <label>:9:                                      ; preds = %3
  %10 = bitcast %struct.c_derived_tbl** %2 to i8**
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %12 = bitcast %struct.jpeg_memory_mgr** %11 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %13 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %12, align 8
  %14 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %13, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %15 = tail call i8* %14(%struct.jpeg_common_struct* %.cast, i32 1, i64 1280) #4
  store i8* %15, i8** %10, align 8
  %.pre.cast = ptrtoint i8* %15 to i64
  br label %.lr.ph28

.lr.ph28:                                         ; preds = %9, %._crit_edge38
  %16 = phi i64 [ %.pre.cast, %9 ], [ %8, %._crit_edge38 ]
  br label %17

; <label>:17:                                     ; preds = %._crit_edge22, %.lr.ph28
  %indvars.iv47 = phi i64 [ 1, %.lr.ph28 ], [ %indvars.iv.next48, %._crit_edge22 ]
  %.lcssa2434 = phi i32 [ 0, %.lr.ph28 ], [ %.lcssa2433, %._crit_edge22 ]
  %18 = phi i32 [ 1, %.lr.ph28 ], [ %31, %._crit_edge22 ]
  %19 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 0, i64 %indvars.iv47
  %20 = load i8, i8* %19, align 1
  %21 = zext i8 %20 to i64
  %22 = icmp eq i8 %20, 0
  br i1 %22, label %._crit_edge22, label %._crit_edge22.loopexit

._crit_edge22.loopexit:                           ; preds = %17
  %23 = trunc i32 %18 to i8
  %24 = sext i32 %.lcssa2434 to i64
  %25 = add nuw nsw i64 %21, 4294967295
  %26 = and i64 %25, 4294967295
  %scevgep = getelementptr [257 x i8], [257 x i8]* %4, i64 0, i64 %24
  %27 = add nuw nsw i64 %26, 1
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 %23, i64 %27, i32 1, i1 false)
  %28 = add nsw i64 %24, 1
  %29 = add nsw i64 %28, %25
  %30 = trunc i64 %29 to i32
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %17
  %.lcssa2433 = phi i32 [ %.lcssa2434, %17 ], [ %30, %._crit_edge22.loopexit ]
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %31 = add nuw nsw i32 %18, 1
  %exitcond = icmp eq i64 %indvars.iv.next48, 17
  br i1 %exitcond, label %._crit_edge29, label %17

._crit_edge29:                                    ; preds = %._crit_edge22
  %32 = sext i32 %.lcssa2433 to i64
  %33 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %32
  store i8 0, i8* %33, align 1
  %34 = bitcast [257 x i8]* %4 to i8*
  %35 = load i8, i8* %34, align 16
  %36 = sext i8 %35 to i32
  %37 = icmp eq i8 %35, 0
  br i1 %37, label %._crit_edge10, label %.outer.preheader

.outer.preheader:                                 ; preds = %._crit_edge29
  br label %.outer

.outer:                                           ; preds = %.outer.preheader, %._crit_edge3
  %.ph = phi i8 [ %56, %._crit_edge3 ], [ %35, %.outer.preheader ]
  %.ph49 = phi i32 [ %60, %._crit_edge3 ], [ %36, %.outer.preheader ]
  %.lcssa717.ph = phi i64 [ %indvars.iv.next44, %._crit_edge3 ], [ 0, %.outer.preheader ]
  %.lcssa512.ph = phi i32 [ %59, %._crit_edge3 ], [ 0, %.outer.preheader ]
  %38 = sext i8 %.ph to i32
  %39 = icmp eq i32 %38, %.ph49
  br i1 %39, label %.lr.ph2.preheader, label %._crit_edge3.thread.preheader

._crit_edge3.thread.preheader:                    ; preds = %.outer
  %40 = sub i32 %38, %.ph49
  %41 = add nsw i32 %38, -1
  %42 = sub i32 %41, %.ph49
  %xtraiter71 = and i32 %40, 7
  %lcmp.mod72 = icmp eq i32 %xtraiter71, 0
  br i1 %lcmp.mod72, label %._crit_edge3.thread.prol.loopexit, label %._crit_edge3.thread.prol.preheader

._crit_edge3.thread.prol.preheader:               ; preds = %._crit_edge3.thread.preheader
  br label %._crit_edge3.thread.prol

._crit_edge3.thread.prol:                         ; preds = %._crit_edge3.thread.prol, %._crit_edge3.thread.prol.preheader
  %.lcssa51266.prol = phi i32 [ %44, %._crit_edge3.thread.prol ], [ %.lcssa512.ph, %._crit_edge3.thread.prol.preheader ]
  %43 = phi i32 [ %45, %._crit_edge3.thread.prol ], [ %.ph49, %._crit_edge3.thread.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge3.thread.prol ], [ %xtraiter71, %._crit_edge3.thread.prol.preheader ]
  %44 = shl i32 %.lcssa51266.prol, 1
  %45 = add nsw i32 %43, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge3.thread.prol.loopexit.loopexit, label %._crit_edge3.thread.prol, !llvm.loop !1

._crit_edge3.thread.prol.loopexit.loopexit:       ; preds = %._crit_edge3.thread.prol
  br label %._crit_edge3.thread.prol.loopexit

._crit_edge3.thread.prol.loopexit:                ; preds = %._crit_edge3.thread.prol.loopexit.loopexit, %._crit_edge3.thread.preheader
  %.lcssa68.unr = phi i32 [ undef, %._crit_edge3.thread.preheader ], [ %44, %._crit_edge3.thread.prol.loopexit.loopexit ]
  %.lcssa51266.unr = phi i32 [ %.lcssa512.ph, %._crit_edge3.thread.preheader ], [ %44, %._crit_edge3.thread.prol.loopexit.loopexit ]
  %.unr = phi i32 [ %.ph49, %._crit_edge3.thread.preheader ], [ %45, %._crit_edge3.thread.prol.loopexit.loopexit ]
  %46 = icmp ult i32 %42, 7
  br i1 %46, label %.lr.ph2.preheader, label %._crit_edge3.thread.preheader.new

._crit_edge3.thread.preheader.new:                ; preds = %._crit_edge3.thread.prol.loopexit
  br label %._crit_edge3.thread

._crit_edge3.thread:                              ; preds = %._crit_edge3.thread, %._crit_edge3.thread.preheader.new
  %.lcssa51266 = phi i32 [ %.lcssa51266.unr, %._crit_edge3.thread.preheader.new ], [ %48, %._crit_edge3.thread ]
  %47 = phi i32 [ %.unr, %._crit_edge3.thread.preheader.new ], [ %49, %._crit_edge3.thread ]
  %48 = shl i32 %.lcssa51266, 8
  %49 = add nsw i32 %47, 8
  %50 = icmp eq i32 %38, %49
  br i1 %50, label %.lr.ph2.preheader.loopexit, label %._crit_edge3.thread

.lr.ph2.preheader.loopexit:                       ; preds = %._crit_edge3.thread
  br label %.lr.ph2.preheader

.lr.ph2.preheader:                                ; preds = %.lr.ph2.preheader.loopexit, %._crit_edge3.thread.prol.loopexit, %.outer
  %.lcssa = phi i32 [ %.ph49, %.outer ], [ %38, %._crit_edge3.thread.prol.loopexit ], [ %38, %.lr.ph2.preheader.loopexit ]
  %.lcssa512.lcssa = phi i32 [ %.lcssa512.ph, %.outer ], [ %.lcssa68.unr, %._crit_edge3.thread.prol.loopexit ], [ %48, %.lr.ph2.preheader.loopexit ]
  %sext = shl i64 %.lcssa717.ph, 32
  %51 = ashr exact i64 %sext, 32
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %.lr.ph2.preheader, %.lr.ph2
  %indvars.iv43 = phi i64 [ %51, %.lr.ph2.preheader ], [ %indvars.iv.next44, %.lr.ph2 ]
  %52 = phi i32 [ %.lcssa512.lcssa, %.lr.ph2.preheader ], [ %54, %.lr.ph2 ]
  %indvars.iv.next44 = add nsw i64 %indvars.iv43, 1
  %53 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv43
  store i32 %52, i32* %53, align 4
  %54 = add i32 %52, 1
  %55 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %indvars.iv.next44
  %56 = load i8, i8* %55, align 1
  %57 = sext i8 %56 to i32
  %58 = icmp eq i32 %57, %.lcssa
  br i1 %58, label %.lr.ph2, label %._crit_edge3

._crit_edge3:                                     ; preds = %.lr.ph2
  %59 = shl i32 %54, 1
  %60 = add nsw i32 %.lcssa, 1
  %61 = icmp eq i8 %56, 0
  br i1 %61, label %._crit_edge10.loopexit, label %.outer

._crit_edge10.loopexit:                           ; preds = %._crit_edge3
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %._crit_edge29
  %62 = inttoptr i64 %16 to %struct.c_derived_tbl*
  %63 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %62, i64 0, i32 1, i64 0
  tail call void @llvm.memset.p0i8.i64(i8* %63, i8 0, i64 256, i32 4, i1 false)
  %64 = icmp sgt i32 %.lcssa2433, 0
  br i1 %64, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge10
  %xtraiter = and i32 %.lcssa2433, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %65 = bitcast [257 x i8]* %4 to i8*
  %66 = inttoptr i64 %16 to [256 x i32]*
  %67 = bitcast [257 x i32]* %5 to i32*
  %68 = load i32, i32* %67, align 16
  %69 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 1, i64 0
  %70 = load i8, i8* %69, align 1
  %71 = zext i8 %70 to i64
  %72 = getelementptr inbounds [256 x i32], [256 x i32]* %66, i64 0, i64 %71
  store i32 %68, i32* %72, align 4
  %73 = load i8, i8* %65, align 16
  %74 = load i8, i8* %69, align 1
  %75 = zext i8 %74 to i64
  %sunkaddr = add i64 %16, %75
  %sunkaddr52 = add i64 %sunkaddr, 1024
  %sunkaddr53 = inttoptr i64 %sunkaddr52 to i8*
  store i8 %73, i8* %sunkaddr53, align 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ 1, %.prol.preheader ]
  %76 = icmp eq i32 %.lcssa2433, 1
  br i1 %76, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %wide.trip.count.1 = zext i32 %.lcssa2433 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %77 = inttoptr i64 %16 to [256 x i32]*
  %78 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv
  %79 = load i32, i32* %78, align 4
  %80 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 1, i64 %indvars.iv
  %81 = load i8, i8* %80, align 1
  %82 = zext i8 %81 to i64
  %83 = getelementptr inbounds [256 x i32], [256 x i32]* %77, i64 0, i64 %82
  store i32 %79, i32* %83, align 4
  %84 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %indvars.iv
  %85 = load i8, i8* %84, align 1
  %86 = load i8, i8* %80, align 1
  %87 = zext i8 %86 to i64
  %sunkaddr54 = add i64 %16, %87
  %sunkaddr55 = add i64 %sunkaddr54, 1024
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to i8*
  store i8 %85, i8* %sunkaddr56, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %88 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv.next
  %89 = load i32, i32* %88, align 4
  %90 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 1, i64 %indvars.iv.next
  %91 = load i8, i8* %90, align 1
  %92 = zext i8 %91 to i64
  %93 = getelementptr inbounds [256 x i32], [256 x i32]* %77, i64 0, i64 %92
  store i32 %89, i32* %93, align 4
  %94 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %indvars.iv.next
  %95 = load i8, i8* %94, align 1
  %96 = load i8, i8* %90, align 1
  %97 = zext i8 %96 to i64
  %sunkaddr57 = add i64 %16, %97
  %sunkaddr58 = add i64 %sunkaddr57, 1024
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to i8*
  store i8 %95, i8* %sunkaddr59, align 1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %._crit_edge10
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct*, %struct.JHUFF_TBL* nocapture, i64* nocapture) local_unnamed_addr #0 {
  %4 = alloca [33 x i8], align 16
  %5 = alloca [257 x i32], align 16
  %6 = alloca [257 x i32], align 16
  %7 = bitcast [33 x i8]* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %7, i8 0, i64 33, i32 16, i1 false)
  %8 = bitcast [257 x i32]* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %8, i8 0, i64 1028, i32 16, i1 false)
  %9 = bitcast [257 x i32]* %6 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %9, i8 -1, i64 1028, i32 16, i1 false)
  %10 = getelementptr inbounds i64, i64* %2, i64 256
  store i64 1, i64* %10, align 8
  br label %.lr.ph41.preheader

.lr.ph41.preheader.loopexit:                      ; preds = %.lr.ph64
  br label %.lr.ph41.preheader.backedge

.lr.ph41.preheader:                               ; preds = %.lr.ph41.preheader.backedge, %3
  %11 = load i64, i64* %2, align 8
  %12 = icmp eq i64 %11, 0
  %13 = icmp sgt i64 %11, 1000000000
  %or.cond127140 = or i1 %12, %13
  %14 = sext i1 %or.cond127140 to i32
  %15 = select i1 %or.cond127140, i64 1000000000, i64 %11
  br label %.lr.ph41.1

.lr.ph50.preheader:                               ; preds = %.lr.ph41.1
  %16 = zext i32 %162 to i64
  br label %.lr.ph50

.lr.ph50:                                         ; preds = %171, %.lr.ph50.preheader
  %17 = phi i64 [ %11, %.lr.ph50.preheader ], [ %.pre143, %171 ]
  %indvars.iv106 = phi i64 [ 0, %.lr.ph50.preheader ], [ %indvars.iv.next107.1, %171 ]
  %18 = phi i32 [ -1, %.lr.ph50.preheader ], [ %172, %171 ]
  %19 = phi i64 [ 1000000000, %.lr.ph50.preheader ], [ %173, %171 ]
  %20 = icmp eq i64 %17, 0
  br i1 %20, label %25, label %21

; <label>:21:                                     ; preds = %.lr.ph50
  %22 = icmp sle i64 %17, %19
  %23 = icmp ne i64 %indvars.iv106, %16
  %or.cond = and i1 %22, %23
  %24 = trunc i64 %indvars.iv106 to i32
  %. = select i1 %or.cond, i32 %24, i32 %18
  %.128 = select i1 %or.cond, i64 %17, i64 %19
  br label %25

; <label>:25:                                     ; preds = %21, %.lr.ph50
  %26 = phi i32 [ %18, %.lr.ph50 ], [ %., %21 ]
  %27 = phi i64 [ %19, %.lr.ph50 ], [ %.128, %21 ]
  %indvars.iv.next107 = or i64 %indvars.iv106, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next107, 257
  br i1 %exitcond108, label %._crit_edge51, label %.lr.ph50.1

._crit_edge51:                                    ; preds = %25
  %28 = icmp slt i32 %26, 0
  br i1 %28, label %.lr.ph36, label %29

; <label>:29:                                     ; preds = %._crit_edge51
  %30 = sext i32 %26 to i64
  %31 = getelementptr inbounds i64, i64* %2, i64 %30
  %32 = load i64, i64* %31, align 8
  %33 = sext i32 %162 to i64
  %34 = getelementptr inbounds i64, i64* %2, i64 %33
  %35 = load i64, i64* %34, align 8
  %36 = add nsw i64 %35, %32
  store i64 %36, i64* %34, align 8
  store i64 0, i64* %31, align 8
  %37 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %33
  %38 = load i32, i32* %37, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %37, align 4
  %40 = getelementptr inbounds [257 x i32], [257 x i32]* %6, i64 0, i64 %33
  %41 = load i32, i32* %40, align 4
  %42 = icmp sgt i32 %41, -1
  br i1 %42, label %.lr.ph59.preheader, label %._crit_edge60

.lr.ph59.preheader:                               ; preds = %29
  br label %.lr.ph59

.lr.ph59:                                         ; preds = %.lr.ph59.preheader, %.lr.ph59
  %43 = phi i32 [ %49, %.lr.ph59 ], [ %41, %.lr.ph59.preheader ]
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %44
  %46 = load i32, i32* %45, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %45, align 4
  %48 = getelementptr inbounds [257 x i32], [257 x i32]* %6, i64 0, i64 %44
  %49 = load i32, i32* %48, align 4
  %50 = icmp sgt i32 %49, -1
  br i1 %50, label %.lr.ph59, label %._crit_edge60.loopexit

._crit_edge60.loopexit:                           ; preds = %.lr.ph59
  br label %._crit_edge60

._crit_edge60:                                    ; preds = %._crit_edge60.loopexit, %29
  %.lcssa6273 = phi i32 [ %162, %29 ], [ %43, %._crit_edge60.loopexit ]
  %51 = sext i32 %.lcssa6273 to i64
  %52 = getelementptr inbounds [257 x i32], [257 x i32]* %6, i64 0, i64 %51
  store i32 %26, i32* %52, align 4
  %53 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %30
  %54 = load i32, i32* %53, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %53, align 4
  %56 = getelementptr inbounds [257 x i32], [257 x i32]* %6, i64 0, i64 %30
  %57 = load i32, i32* %56, align 4
  %58 = icmp sgt i32 %57, -1
  br i1 %58, label %.lr.ph64.preheader, label %.lr.ph41.preheader.backedge

.lr.ph41.preheader.backedge:                      ; preds = %._crit_edge60, %.lr.ph41.preheader.loopexit
  br label %.lr.ph41.preheader

.lr.ph64.preheader:                               ; preds = %._crit_edge60
  br label %.lr.ph64

.lr.ph64:                                         ; preds = %.lr.ph64.preheader, %.lr.ph64
  %59 = phi i32 [ %65, %.lr.ph64 ], [ %57, %.lr.ph64.preheader ]
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %60
  %62 = load i32, i32* %61, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %61, align 4
  %64 = getelementptr inbounds [257 x i32], [257 x i32]* %6, i64 0, i64 %60
  %65 = load i32, i32* %64, align 4
  %66 = icmp sgt i32 %65, -1
  br i1 %66, label %.lr.ph64, label %.lr.ph41.preheader.loopexit

.lr.ph36:                                         ; preds = %._crit_edge51
  br label %67

; <label>:67:                                     ; preds = %86, %.lr.ph36
  %indvars.iv100 = phi i64 [ 0, %.lr.ph36 ], [ %indvars.iv.next101, %86 ]
  %68 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv100
  %69 = load i32, i32* %68, align 4
  %70 = sext i32 %69 to i64
  %71 = icmp eq i32 %69, 0
  br i1 %71, label %86, label %72

; <label>:72:                                     ; preds = %67
  %73 = icmp sgt i32 %69, 32
  br i1 %73, label %74, label %82

; <label>:74:                                     ; preds = %72
  %75 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %76 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %77 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %78 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %76, align 8
  %79 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %78, i64 0, i32 5
  store i32 38, i32* %79, align 8
  %80 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %75, align 8
  %81 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %80, align 8
  tail call void %81(%struct.jpeg_common_struct* %77) #4
  br label %82

; <label>:82:                                     ; preds = %74, %72
  %83 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 %70
  %84 = load i8, i8* %83, align 1
  %85 = add i8 %84, 1
  store i8 %85, i8* %83, align 1
  br label %86

; <label>:86:                                     ; preds = %67, %82
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next101, 257
  br i1 %exitcond102, label %.lr.ph28.preheader, label %67

.lr.ph28.preheader:                               ; preds = %86
  br label %.lr.ph28

.lr.ph28:                                         ; preds = %.lr.ph28.preheader, %._crit_edge24
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %._crit_edge24 ], [ 32, %.lr.ph28.preheader ]
  %indvars.iv94 = phi i64 [ %indvars.iv.next95, %._crit_edge24 ], [ 30, %.lr.ph28.preheader ]
  %87 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 %indvars.iv98
  %88 = load i8, i8* %87, align 1
  %89 = icmp eq i8 %88, 0
  br i1 %89, label %._crit_edge24, label %.lr.ph23

.lr.ph23:                                         ; preds = %.lr.ph28
  %90 = add nsw i64 %indvars.iv98, -2
  br label %91

; <label>:91:                                     ; preds = %._crit_edge19, %.lr.ph23
  %92 = phi i8 [ %106, %._crit_edge19 ], [ %88, %.lr.ph23 ]
  %sunkaddr = ptrtoint [33 x i8]* %4 to i64
  %sunkaddr152 = add i64 %sunkaddr, %90
  %sunkaddr153 = inttoptr i64 %sunkaddr152 to i8*
  %93 = load i8, i8* %sunkaddr153, align 1
  %94 = icmp eq i8 %93, 0
  br i1 %94, label %.lr.ph18.preheader, label %._crit_edge19

.lr.ph18.preheader:                               ; preds = %91
  br label %.lr.ph18

.lr.ph18:                                         ; preds = %.lr.ph18.preheader, %.lr.ph18
  %indvars.iv96 = phi i64 [ %indvars.iv.next97, %.lr.ph18 ], [ %indvars.iv94, %.lr.ph18.preheader ]
  %indvars.iv.next97 = add nsw i64 %indvars.iv96, -1
  %95 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 %indvars.iv.next97
  %96 = load i8, i8* %95, align 1
  %97 = icmp eq i8 %96, 0
  br i1 %97, label %.lr.ph18, label %._crit_edge19.loopexit

._crit_edge19.loopexit:                           ; preds = %.lr.ph18
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %91
  %.lcssa2126.in = phi i64 [ %90, %91 ], [ %indvars.iv.next97, %._crit_edge19.loopexit ]
  %98 = add i8 %92, -2
  %sunkaddr154 = ptrtoint [33 x i8]* %4 to i64
  %sunkaddr155 = add i64 %indvars.iv98, %sunkaddr154
  %sunkaddr156 = inttoptr i64 %sunkaddr155 to i8*
  store i8 %98, i8* %sunkaddr156, align 1
  %sunkaddr157 = ptrtoint [33 x i8]* %4 to i64
  %sunkaddr158 = add i64 %indvars.iv98, %sunkaddr157
  %sunkaddr159 = add i64 %sunkaddr158, -1
  %sunkaddr160 = inttoptr i64 %sunkaddr159 to i8*
  %99 = load i8, i8* %sunkaddr160, align 1
  %100 = add i8 %99, 1
  store i8 %100, i8* %sunkaddr160, align 1
  %sext = shl i64 %.lcssa2126.in, 32
  %101 = ashr exact i64 %sext, 32
  %102 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 %101
  %103 = bitcast i8* %102 to <2 x i8>*
  %104 = load <2 x i8>, <2 x i8>* %103, align 1
  %105 = add <2 x i8> %104, <i8 -1, i8 2>
  store <2 x i8> %105, <2 x i8>* %103, align 1
  %106 = load i8, i8* %sunkaddr156, align 1
  %107 = icmp eq i8 %106, 0
  br i1 %107, label %._crit_edge24.loopexit, label %91

._crit_edge24.loopexit:                           ; preds = %._crit_edge19
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %.lr.ph28
  %indvars.iv.next99 = add nsw i64 %indvars.iv98, -1
  %108 = icmp sgt i64 %indvars.iv.next99, 16
  %indvars.iv.next95 = add nsw i64 %indvars.iv94, -1
  br i1 %108, label %.lr.ph28, label %109

; <label>:109:                                    ; preds = %._crit_edge24
  %.phi.trans.insert83 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 16
  %.pre = load i8, i8* %.phi.trans.insert83, align 16
  %110 = icmp eq i8 %.pre, 0
  br i1 %110, label %.lr.ph13.preheader, label %.lr.ph4.split.us.preheader

.lr.ph13.preheader:                               ; preds = %109
  br label %.lr.ph13

.lr.ph13:                                         ; preds = %.lr.ph13.preheader, %.lr.ph13
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %.lr.ph13 ], [ 16, %.lr.ph13.preheader ]
  %indvars.iv.next93 = add nsw i64 %indvars.iv92, -1
  %111 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 %indvars.iv.next93
  %112 = load i8, i8* %111, align 1
  %113 = icmp eq i8 %112, 0
  br i1 %113, label %.lr.ph13, label %._crit_edge14

._crit_edge14:                                    ; preds = %.lr.ph13
  %sext112 = shl i64 %indvars.iv.next93, 32
  %phitmp = ashr exact i64 %sext112, 32
  br label %.lr.ph4.split.us.preheader

.lr.ph4.split.us.preheader:                       ; preds = %._crit_edge14, %109
  %114 = phi i8 [ %112, %._crit_edge14 ], [ %.pre, %109 ]
  %115 = phi i64 [ %phitmp, %._crit_edge14 ], [ 16, %109 ]
  %116 = bitcast [33 x i8]* %4 to i8*
  %117 = bitcast %struct.JHUFF_TBL* %1 to i8*
  %118 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 %115
  %119 = add i8 %114, -1
  store i8 %119, i8* %118, align 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %117, i8* nonnull %116, i64 17, i32 4, i1 false)
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph4.split.us.preheader
  %.lcssa211.us = phi i32 [ %146, %._crit_edge.us ], [ 0, %.lr.ph4.split.us.preheader ]
  %120 = phi i32 [ %137, %._crit_edge.us ], [ 1, %.lr.ph4.split.us.preheader ]
  br label %121

; <label>:121:                                    ; preds = %145, %.lr.ph4.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph4.split.us ], [ %indvars.iv.next.1, %145 ]
  %122 = phi i32 [ %.lcssa211.us, %.lr.ph4.split.us ], [ %146, %145 ]
  %123 = phi i32 [ 0, %.lr.ph4.split.us ], [ %147, %145 ]
  %124 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv
  %125 = load i32, i32* %124, align 8
  %126 = icmp eq i32 %125, %120
  br i1 %126, label %127, label %132

; <label>:127:                                    ; preds = %121
  %128 = trunc i32 %123 to i8
  %129 = sext i32 %122 to i64
  %130 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 1, i64 %129
  store i8 %128, i8* %130, align 1
  %131 = add nsw i32 %122, 1
  br label %132

; <label>:132:                                    ; preds = %127, %121
  %133 = phi i32 [ %122, %121 ], [ %131, %127 ]
  %indvars.iv.next = or i64 %indvars.iv, 1
  %134 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv.next
  %135 = load i32, i32* %134, align 4
  %136 = icmp eq i32 %135, %120
  br i1 %136, label %139, label %145

._crit_edge.us:                                   ; preds = %145
  %137 = add nuw nsw i32 %120, 1
  %exitcond = icmp eq i32 %137, 33
  br i1 %exitcond, label %._crit_edge5, label %.lr.ph4.split.us

._crit_edge5:                                     ; preds = %._crit_edge.us
  %138 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 2
  store i32 0, i32* %138, align 4
  ret void

; <label>:139:                                    ; preds = %132
  %140 = trunc i32 %123 to i8
  %141 = or i8 %140, 1
  %142 = sext i32 %133 to i64
  %143 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 1, i64 %142
  store i8 %141, i8* %143, align 1
  %144 = add nsw i32 %133, 1
  br label %145

; <label>:145:                                    ; preds = %139, %132
  %146 = phi i32 [ %133, %132 ], [ %144, %139 ]
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %147 = add nsw i32 %123, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 256
  br i1 %exitcond.1, label %._crit_edge.us, label %121

.lr.ph41.1:                                       ; preds = %.lr.ph41.preheader, %.lr.ph41.1
  %indvars.iv.next104142 = phi i64 [ 1, %.lr.ph41.preheader ], [ %indvars.iv.next104, %.lr.ph41.1 ]
  %148 = phi i64 [ %15, %.lr.ph41.preheader ], [ %163, %.lr.ph41.1 ]
  %149 = phi i32 [ %14, %.lr.ph41.preheader ], [ %162, %.lr.ph41.1 ]
  %indvars.iv103141 = phi i64 [ 0, %.lr.ph41.preheader ], [ %indvars.iv.next104.1, %.lr.ph41.1 ]
  %150 = getelementptr inbounds i64, i64* %2, i64 %indvars.iv.next104142
  %151 = load i64, i64* %150, align 8
  %152 = icmp eq i64 %151, 0
  %153 = icmp sgt i64 %151, %148
  %or.cond129 = or i1 %152, %153
  %154 = trunc i64 %indvars.iv.next104142 to i32
  %155 = select i1 %or.cond129, i32 %149, i32 %154
  %156 = select i1 %or.cond129, i64 %148, i64 %151
  %indvars.iv.next104.1 = add nsw i64 %indvars.iv103141, 2
  %157 = getelementptr inbounds i64, i64* %2, i64 %indvars.iv.next104.1
  %158 = load i64, i64* %157, align 8
  %159 = icmp eq i64 %158, 0
  %160 = icmp sgt i64 %158, %156
  %or.cond127 = or i1 %159, %160
  %161 = trunc i64 %indvars.iv.next104.1 to i32
  %162 = select i1 %or.cond127, i32 %155, i32 %161
  %163 = select i1 %or.cond127, i64 %156, i64 %158
  %indvars.iv.next104 = or i64 %indvars.iv.next104.1, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next104, 257
  br i1 %exitcond105, label %.lr.ph50.preheader, label %.lr.ph41.1

.lr.ph50.1:                                       ; preds = %25
  %164 = getelementptr inbounds i64, i64* %2, i64 %indvars.iv.next107
  %165 = load i64, i64* %164, align 8
  %166 = icmp eq i64 %165, 0
  br i1 %166, label %171, label %167

; <label>:167:                                    ; preds = %.lr.ph50.1
  %168 = icmp sle i64 %165, %27
  %169 = icmp ne i64 %indvars.iv.next107, %16
  %or.cond.1 = and i1 %168, %169
  %170 = trunc i64 %indvars.iv.next107 to i32
  %.130 = select i1 %or.cond.1, i32 %170, i32 %26
  %.131 = select i1 %or.cond.1, i64 %165, i64 %27
  br label %171

; <label>:171:                                    ; preds = %167, %.lr.ph50.1
  %172 = phi i32 [ %26, %.lr.ph50.1 ], [ %.130, %167 ]
  %173 = phi i64 [ %27, %.lr.ph50.1 ], [ %.131, %167 ]
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106, 2
  %.phi.trans.insert = getelementptr inbounds i64, i64* %2, i64 %indvars.iv.next107.1
  %.pre143 = load i64, i64* %.phi.trans.insert, align 8
  br label %.lr.ph50
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define void @jinit_huff_encoder(%struct.jpeg_compress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %6 = tail call i8* %5(%struct.jpeg_common_struct* %.cast, i32 1, i64 192) #4
  %.cast1 = ptrtoint i8* %6 to i64
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %8 = bitcast %struct.jpeg_entropy_encoder** %7 to i64*
  store i64 %.cast1, i64* %8, align 8
  %9 = bitcast i8* %6 to void (%struct.jpeg_compress_struct*, i32)**
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_huff, void (%struct.jpeg_compress_struct*, i32)** %9, align 8
  %10 = getelementptr inbounds i8, i8* %6, i64 64
  call void @llvm.memset.p0i8.i64(i8* %10, i8 0, i64 128, i32 8, i1 false)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_huff(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %4 = bitcast %struct.jpeg_entropy_encoder** %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = icmp eq i32 %1, 0
  %encode_mcu_huff.encode_mcu_gather = select i1 %6, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_huff, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_gather
  %finish_pass_huff.finish_pass_gather = select i1 %6, void (%struct.jpeg_compress_struct*)* @finish_pass_huff, void (%struct.jpeg_compress_struct*)* @finish_pass_gather
  %7 = inttoptr i64 %5 to %struct.jpeg_entropy_encoder*
  %sunkaddr = add i64 %5, 8
  %sunkaddr20 = inttoptr i64 %sunkaddr to i32 (%struct.jpeg_compress_struct*, [64 x i16]**)**
  store i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* %encode_mcu_huff.encode_mcu_gather, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %sunkaddr20, align 8
  %8 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %7, i64 0, i32 2
  store void (%struct.jpeg_compress_struct*)* %finish_pass_huff.finish_pass_gather, void (%struct.jpeg_compress_struct*)** %8, align 8
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %10 = load i32, i32* %9, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  %.pre = inttoptr i64 %5 to %struct.huff_entropy_encoder*
  br label %._crit_edge

.lr.ph:                                           ; preds = %2
  br label %12

; <label>:12:                                     ; preds = %.lr.ph, %87
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %87 ]
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv
  %14 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %14, i64 0, i32 5
  %16 = load i32, i32* %15, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %14, i64 0, i32 6
  %19 = load i32, i32* %18, align 8
  %20 = sext i32 %19 to i64
  %21 = icmp ugt i32 %16, 3
  br i1 %21, label %26, label %22

; <label>:22:                                     ; preds = %12
  %23 = icmp ne i32 %1, 0
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %17
  %25 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %24, align 8
  %.not = icmp ne %struct.JHUFF_TBL* %25, null
  %brmerge = or i1 %.not, %23
  br i1 %brmerge, label %36, label %26

; <label>:26:                                     ; preds = %22, %12
  %27 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %28 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %29 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %28, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i64 0, i32 5
  store i32 49, i32* %31, align 8
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %28, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i64 0, i32 6, i32 0, i64 0
  store i32 %16, i32* %33, align 4
  %34 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %29, align 8
  %35 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %34, align 8
  tail call void %35(%struct.jpeg_common_struct* %27) #4
  br label %36

; <label>:36:                                     ; preds = %22, %26
  %37 = icmp ugt i32 %19, 3
  br i1 %37, label %42, label %38

; <label>:38:                                     ; preds = %36
  %39 = icmp ne i32 %1, 0
  %40 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %20
  %41 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %40, align 8
  %.not9 = icmp ne %struct.JHUFF_TBL* %41, null
  %brmerge10 = or i1 %.not9, %39
  br i1 %brmerge10, label %52, label %42

; <label>:42:                                     ; preds = %38, %36
  %43 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %44 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %45 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %46 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %44, align 8
  %47 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %46, i64 0, i32 5
  store i32 49, i32* %47, align 8
  %48 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %44, align 8
  %49 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %48, i64 0, i32 6, i32 0, i64 0
  store i32 %19, i32* %49, align 4
  %50 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %45, align 8
  %51 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %50, align 8
  tail call void %51(%struct.jpeg_common_struct* %43) #4
  br label %52

; <label>:52:                                     ; preds = %38, %42
  %53 = icmp eq i32 %1, 0
  br i1 %53, label %79, label %54

; <label>:54:                                     ; preds = %52
  %55 = inttoptr i64 %5 to %struct.huff_entropy_encoder*
  %56 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %55, i64 0, i32 6, i64 %17
  %57 = load i64*, i64** %56, align 8
  %58 = icmp eq i64* %57, null
  br i1 %58, label %60, label %._crit_edge17

._crit_edge17:                                    ; preds = %54
  %59 = bitcast i64* %57 to i8*
  br label %65

; <label>:60:                                     ; preds = %54
  %61 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr32 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr33 = add i64 %sunkaddr32, 8
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %62 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %sunkaddr34, align 8
  %63 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %62, align 8
  %64 = tail call i8* %63(%struct.jpeg_common_struct* %61, i32 1, i64 2056) #4
  %sunkaddr21 = shl nsw i64 %17, 3
  %sunkaddr22 = add i64 %5, %sunkaddr21
  %sunkaddr23 = add i64 %sunkaddr22, 128
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to i8**
  store i8* %64, i8** %sunkaddr24, align 8
  br label %65

; <label>:65:                                     ; preds = %._crit_edge17, %60
  %66 = phi i8* [ %64, %60 ], [ %59, %._crit_edge17 ]
  %67 = inttoptr i64 %5 to %struct.huff_entropy_encoder*
  tail call void @llvm.memset.p0i8.i64(i8* %66, i8 0, i64 2056, i32 1, i1 false)
  %68 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %67, i64 0, i32 7, i64 %20
  %69 = load i64*, i64** %68, align 8
  %70 = icmp eq i64* %69, null
  br i1 %70, label %72, label %._crit_edge16

._crit_edge16:                                    ; preds = %65
  %71 = bitcast i64* %69 to i8*
  br label %77

; <label>:72:                                     ; preds = %65
  %73 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr35 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr36 = add i64 %sunkaddr35, 8
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %74 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %sunkaddr37, align 8
  %75 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %74, align 8
  %76 = tail call i8* %75(%struct.jpeg_common_struct* %73, i32 1, i64 2056) #4
  %sunkaddr25 = shl nsw i64 %20, 3
  %sunkaddr26 = add i64 %5, %sunkaddr25
  %sunkaddr27 = add i64 %sunkaddr26, 160
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i8**
  store i8* %76, i8** %sunkaddr28, align 8
  br label %77

; <label>:77:                                     ; preds = %._crit_edge16, %72
  %78 = phi i8* [ %76, %72 ], [ %71, %._crit_edge16 ]
  tail call void @llvm.memset.p0i8.i64(i8* %78, i8 0, i64 2056, i32 1, i1 false)
  br label %87

; <label>:79:                                     ; preds = %52
  %80 = inttoptr i64 %5 to %struct.huff_entropy_encoder*
  %81 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %17
  %82 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %81, align 8
  %83 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %80, i64 0, i32 4, i64 %17
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %82, %struct.c_derived_tbl** %83)
  %84 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %20
  %85 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %84, align 8
  %86 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %80, i64 0, i32 5, i64 %20
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %85, %struct.c_derived_tbl** %86)
  br label %87

; <label>:87:                                     ; preds = %77, %79
  %88 = inttoptr i64 %5 to %struct.huff_entropy_encoder*
  %89 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %88, i64 0, i32 1, i32 2, i64 %indvars.iv
  store i32 0, i32* %89, align 4
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %sunkaddr38 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr39 = add i64 %sunkaddr38, 316
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to i32*
  %90 = load i32, i32* %sunkaddr40, align 4
  %91 = sext i32 %90 to i64
  %92 = icmp slt i64 %indvars.iv.next, %91
  br i1 %92, label %12, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %87
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.._crit_edge_crit_edge
  %.pre-phi = phi %struct.huff_entropy_encoder* [ %.pre, %.._crit_edge_crit_edge ], [ %88, %._crit_edge.loopexit ]
  %93 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %.pre-phi, i64 0, i32 1, i32 0
  store i64 0, i64* %93, align 8
  %94 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %.pre-phi, i64 0, i32 1, i32 1
  store i32 0, i32* %94, align 8
  %95 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %96 = load i32, i32* %95, align 8
  %97 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %.pre-phi, i64 0, i32 2
  store i32 %96, i32* %97, align 8
  %98 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %.pre-phi, i64 0, i32 3
  store i32 0, i32* %98, align 4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal i32 @encode_mcu_gather(%struct.jpeg_compress_struct*, [64 x i16]** nocapture readonly) #2 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %4 = bitcast %struct.jpeg_entropy_encoder** %3 to %struct.huff_entropy_encoder**
  %5 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %7 = load i32, i32* %6, align 8
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %27, label %9

; <label>:9:                                      ; preds = %2
  %10 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 2
  %11 = load i32, i32* %10, align 8
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge26

._crit_edge26:                                    ; preds = %9
  %.pre27 = ptrtoint %struct.huff_entropy_encoder* %5 to i64
  %.pre28 = add i64 %.pre27, 56
  %.pre29 = inttoptr i64 %.pre28 to i32*
  br label %24

; <label>:13:                                     ; preds = %9
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %15 = load i32, i32* %14, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %.lr.ph6.preheader, label %22

.lr.ph6.preheader:                                ; preds = %13
  br label %.lr.ph6

.lr.ph6:                                          ; preds = %.lr.ph6.preheader, %.lr.ph6
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %.lr.ph6 ], [ 0, %.lr.ph6.preheader ]
  %17 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 1, i32 2, i64 %indvars.iv10
  store i32 0, i32* %17, align 4
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %sunkaddr30 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr31 = add i64 %sunkaddr30, 316
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to i32*
  %18 = load i32, i32* %sunkaddr32, align 4
  %19 = sext i32 %18 to i64
  %20 = icmp slt i64 %indvars.iv.next11, %19
  br i1 %20, label %.lr.ph6, label %._crit_edge7

._crit_edge7:                                     ; preds = %.lr.ph6
  %21 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr15 = add i64 %21, 272
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to i32*
  %.pre = load i32, i32* %sunkaddr16, align 8
  br label %22

; <label>:22:                                     ; preds = %._crit_edge7, %13
  %23 = phi i32 [ %.pre, %._crit_edge7 ], [ %7, %13 ]
  %sunkaddr17 = ptrtoint %struct.huff_entropy_encoder* %5 to i64
  %sunkaddr18 = add i64 %sunkaddr17, 56
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to i32*
  store i32 %23, i32* %sunkaddr19, align 8
  br label %24

; <label>:24:                                     ; preds = %._crit_edge26, %22
  %sunkaddr22.pre-phi = phi i32* [ %.pre29, %._crit_edge26 ], [ %sunkaddr19, %22 ]
  %25 = phi i32 [ %11, %._crit_edge26 ], [ %23, %22 ]
  %26 = add i32 %25, -1
  store i32 %26, i32* %sunkaddr22.pre-phi, align 8
  br label %27

; <label>:27:                                     ; preds = %2, %24
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 45
  %29 = load i32, i32* %28, align 8
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %27
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %31 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 46, i64 %indvars.iv
  %32 = load i32, i32* %31, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %33
  %35 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %34, align 8
  %36 = getelementptr inbounds [64 x i16]*, [64 x i16]** %1, i64 %indvars.iv
  %37 = bitcast [64 x i16]** %36 to i16**
  %38 = load i16*, i16** %37, align 8
  %39 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 1, i32 2, i64 %33
  %40 = load i32, i32* %39, align 4
  %41 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %35, i64 0, i32 5
  %42 = load i32, i32* %41, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 6, i64 %43
  %45 = load i64*, i64** %44, align 8
  %46 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %35, i64 0, i32 6
  %47 = load i32, i32* %46, align 8
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 7, i64 %48
  %50 = load i64*, i64** %49, align 8
  tail call fastcc void @htest_one_block(i16* %38, i32 %40, i64* %45, i64* %50)
  %51 = load i16*, i16** %37, align 8
  %52 = load i16, i16* %51, align 2
  %53 = sext i16 %52 to i32
  store i32 %53, i32* %39, align 4
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr33 = add i64 %sunkaddr, 360
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i32*
  %54 = load i32, i32* %sunkaddr34, align 8
  %55 = sext i32 %54 to i64
  %56 = icmp slt i64 %indvars.iv.next, %55
  br i1 %56, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %27
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_pass_gather(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca [4 x i32], align 16
  %3 = alloca [4 x i32], align 16
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %5 = bitcast %struct.jpeg_entropy_encoder** %4 to %struct.huff_entropy_encoder**
  %6 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %7 = bitcast [4 x i32]* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %7, i8 0, i64 16, i32 16, i1 false)
  %8 = bitcast [4 x i32]* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %8, i8 0, i64 16, i32 16, i1 false)
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %10 = load i32, i32* %9, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1
  br label %12

; <label>:12:                                     ; preds = %.lr.ph, %54
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %54 ]
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv
  %14 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %14, i64 0, i32 5
  %16 = load i32, i32* %15, align 4
  %17 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %14, i64 0, i32 6
  %18 = load i32, i32* %17, align 8
  %19 = sext i32 %18 to i64
  %20 = sext i32 %16 to i64
  %21 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 %20
  %22 = load i32, i32* %21, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %37

; <label>:24:                                     ; preds = %12
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %20
  %26 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %25, align 8
  %27 = icmp eq %struct.JHUFF_TBL* %26, null
  br i1 %27, label %28, label %32

; <label>:28:                                     ; preds = %24
  %29 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %30 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %31 = tail call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* nonnull %30) #4
  %sunkaddr10 = shl nsw i64 %20, 3
  %sunkaddr11 = add i64 %29, %sunkaddr10
  %sunkaddr12 = add i64 %sunkaddr11, 120
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to %struct.JHUFF_TBL**
  store %struct.JHUFF_TBL* %31, %struct.JHUFF_TBL** %sunkaddr13, align 8
  br label %32

; <label>:32:                                     ; preds = %28, %24
  %33 = phi %struct.JHUFF_TBL* [ %31, %28 ], [ %26, %24 ]
  %34 = ptrtoint [4 x i32]* %2 to i64
  %35 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 6, i64 %20
  %36 = load i64*, i64** %35, align 8
  tail call void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %33, i64* %36)
  %sunkaddr15 = shl nsw i64 %20, 2
  %sunkaddr16 = add i64 %34, %sunkaddr15
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32*
  store i32 1, i32* %sunkaddr17, align 4
  br label %37

; <label>:37:                                     ; preds = %12, %32
  %38 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 %19
  %39 = load i32, i32* %38, align 4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %54

; <label>:41:                                     ; preds = %37
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %19
  %43 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %42, align 8
  %44 = icmp eq %struct.JHUFF_TBL* %43, null
  br i1 %44, label %45, label %49

; <label>:45:                                     ; preds = %41
  %46 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %47 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %48 = tail call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* nonnull %47) #4
  %sunkaddr19 = shl nsw i64 %19, 3
  %sunkaddr20 = add i64 %46, %sunkaddr19
  %sunkaddr21 = add i64 %sunkaddr20, 152
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to %struct.JHUFF_TBL**
  store %struct.JHUFF_TBL* %48, %struct.JHUFF_TBL** %sunkaddr22, align 8
  br label %49

; <label>:49:                                     ; preds = %45, %41
  %50 = phi %struct.JHUFF_TBL* [ %48, %45 ], [ %43, %41 ]
  %51 = ptrtoint [4 x i32]* %3 to i64
  %52 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 7, i64 %19
  %53 = load i64*, i64** %52, align 8
  tail call void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %50, i64* %53)
  %sunkaddr24 = shl nsw i64 %19, 2
  %sunkaddr25 = add i64 %51, %sunkaddr24
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to i32*
  store i32 1, i32* %sunkaddr26, align 4
  br label %54

; <label>:54:                                     ; preds = %37, %49
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %sunkaddr30 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr31 = add i64 %sunkaddr30, 316
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to i32*
  %55 = load i32, i32* %sunkaddr32, align 4
  %56 = sext i32 %55 to i64
  %57 = icmp slt i64 %indvars.iv.next, %56
  br i1 %57, label %12, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %54
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @encode_mcu_huff(%struct.jpeg_compress_struct*, [64 x i16]**) #0 {
  %3 = alloca %struct.working_state, align 16
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %5 = bitcast %struct.jpeg_entropy_encoder** %4 to %struct.huff_entropy_encoder**
  %6 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %8 = bitcast %struct.jpeg_destination_mgr** %7 to <2 x i64>**
  %9 = load <2 x i64>*, <2 x i64>** %8, align 8
  %10 = load <2 x i64>, <2 x i64>* %9, align 8
  %11 = bitcast %struct.working_state* %3 to <2 x i64>*
  store <2 x i64> %10, <2 x i64>* %11, align 16
  %12 = getelementptr inbounds %struct.working_state, %struct.working_state* %3, i64 0, i32 2
  %13 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 1
  %14 = bitcast %struct.savable_state* %12 to i8*
  %15 = bitcast %struct.savable_state* %13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 32, i32 8, i1 false)
  %16 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %17 = getelementptr inbounds %struct.working_state, %struct.working_state* %3, i64 0, i32 3
  %18 = bitcast %struct.jpeg_compress_struct** %17 to i64*
  store i64 %16, i64* %18, align 16
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %20 = load i32, i32* %19, align 8
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %31, label %22

; <label>:22:                                     ; preds = %2
  %23 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 2
  %24 = load i32, i32* %23, align 8
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %31

; <label>:26:                                     ; preds = %22
  %27 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 3
  %28 = load i32, i32* %27, align 4
  %29 = call fastcc i32 @emit_restart(%struct.working_state* nonnull %3, i32 %28)
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %.loopexit, label %31

; <label>:31:                                     ; preds = %26, %2, %22
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 45
  %33 = load i32, i32* %32, align 8
  %34 = icmp sgt i32 %33, 0
  br i1 %34, label %.lr.ph.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %31
  %.pre = ptrtoint %struct.working_state* %3 to i64
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %31
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %57
  %indvars.iv = phi i64 [ %indvars.iv.next, %57 ], [ 0, %.lr.ph.preheader ]
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 46, i64 %indvars.iv
  %36 = load i32, i32* %35, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %37
  %39 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %38, align 8
  %40 = getelementptr inbounds [64 x i16]*, [64 x i16]** %1, i64 %indvars.iv
  %41 = bitcast [64 x i16]** %40 to i16**
  %42 = load i16*, i16** %41, align 8
  %43 = getelementptr inbounds %struct.working_state, %struct.working_state* %3, i64 0, i32 2, i32 2, i64 %37
  %44 = load i32, i32* %43, align 4
  %45 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %39, i64 0, i32 5
  %46 = load i32, i32* %45, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 4, i64 %47
  %49 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %48, align 8
  %50 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %39, i64 0, i32 6
  %51 = load i32, i32* %50, align 8
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 5, i64 %52
  %54 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %53, align 8
  %55 = call fastcc i32 @encode_one_block(%struct.working_state* nonnull %3, i16* %42, i32 %44, %struct.c_derived_tbl* %49, %struct.c_derived_tbl* %54)
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %.loopexit.loopexit, label %57

; <label>:57:                                     ; preds = %.lr.ph
  %58 = ptrtoint %struct.working_state* %3 to i64
  %59 = ptrtoint [64 x i16]** %1 to i64
  %sunkaddr8 = shl i64 %indvars.iv, 3
  %sunkaddr9 = add i64 %59, %sunkaddr8
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to i16**
  %60 = load i16*, i16** %sunkaddr10, align 8
  %61 = load i16, i16* %60, align 2
  %62 = sext i16 %61 to i32
  %sunkaddr12 = shl nsw i64 %37, 2
  %sunkaddr13 = add i64 %58, %sunkaddr12
  %sunkaddr14 = add i64 %sunkaddr13, 28
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i32*
  store i32 %62, i32* %sunkaddr15, align 4
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr41 = add i64 %sunkaddr, 360
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to i32*
  %63 = load i32, i32* %sunkaddr42, align 8
  %64 = sext i32 %63 to i64
  %65 = icmp slt i64 %indvars.iv.next, %64
  br i1 %65, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %57
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.._crit_edge_crit_edge
  %sunkaddr22.pre-phi = phi i64 [ %.pre, %.._crit_edge_crit_edge ], [ %58, %._crit_edge.loopexit ]
  %66 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %67 = bitcast %struct.savable_state* %13 to i8*
  %68 = bitcast %struct.savable_state* %12 to i8*
  %69 = bitcast %struct.working_state* %3 to i64*
  %70 = load i64, i64* %69, align 16
  %sunkaddr20 = add i64 %66, 32
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to i64**
  %71 = load i64*, i64** %sunkaddr21, align 8
  store i64 %70, i64* %71, align 8
  %sunkaddr23 = add i64 %sunkaddr22.pre-phi, 8
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to i64*
  %72 = load i64, i64* %sunkaddr24, align 8
  %sunkaddr27 = inttoptr i64 %sunkaddr20 to %struct.jpeg_destination_mgr**
  %73 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %sunkaddr27, align 8
  %74 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %73, i64 0, i32 1
  store i64 %72, i64* %74, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %67, i8* %68, i64 32, i32 8, i1 false)
  %sunkaddr29 = add i64 %66, 272
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i32*
  %75 = load i32, i32* %sunkaddr30, align 8
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %.loopexit, label %77

; <label>:77:                                     ; preds = %._crit_edge
  %78 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 2
  %79 = load i32, i32* %78, align 8
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %._crit_edge37

; <label>:81:                                     ; preds = %77
  %sunkaddr43 = ptrtoint %struct.huff_entropy_encoder* %6 to i64
  %sunkaddr44 = add i64 %sunkaddr43, 56
  %sunkaddr45 = inttoptr i64 %sunkaddr44 to i32*
  store i32 %75, i32* %sunkaddr45, align 8
  %82 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 3
  %83 = load i32, i32* %82, align 4
  %84 = add nsw i32 %83, 1
  %85 = and i32 %84, 7
  store i32 %85, i32* %82, align 4
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %77, %81
  %86 = phi i32 [ %75, %81 ], [ %79, %77 ]
  %87 = add i32 %86, -1
  %sunkaddr46 = ptrtoint %struct.huff_entropy_encoder* %6 to i64
  %sunkaddr47 = add i64 %sunkaddr46, 56
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to i32*
  store i32 %87, i32* %sunkaddr48, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge37, %._crit_edge, %26
  %88 = phi i32 [ 0, %26 ], [ 1, %._crit_edge ], [ 1, %._crit_edge37 ], [ 0, %.loopexit.loopexit ]
  ret i32 %88
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_pass_huff(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.working_state, align 16
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %4 = bitcast %struct.jpeg_entropy_encoder** %3 to %struct.huff_entropy_encoder**
  %5 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %7 = bitcast %struct.jpeg_destination_mgr** %6 to <2 x i64>**
  %8 = load <2 x i64>*, <2 x i64>** %7, align 8
  %9 = load <2 x i64>, <2 x i64>* %8, align 8
  %10 = bitcast %struct.working_state* %2 to <2 x i64>*
  store <2 x i64> %9, <2 x i64>* %10, align 16
  %11 = getelementptr inbounds %struct.working_state, %struct.working_state* %2, i64 0, i32 2
  %12 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 1
  %13 = bitcast %struct.savable_state* %11 to i8*
  %14 = bitcast %struct.savable_state* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 32, i32 8, i1 false)
  %15 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %16 = getelementptr inbounds %struct.working_state, %struct.working_state* %2, i64 0, i32 3
  %17 = bitcast %struct.jpeg_compress_struct** %16 to i64*
  store i64 %15, i64* %17, align 16
  %18 = call fastcc i32 @flush_bits(%struct.working_state* nonnull %2)
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %28

; <label>:20:                                     ; preds = %1
  %21 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %22 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %23 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %24 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %23, i64 0, i32 5
  store i32 22, i32* %24, align 8
  %25 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %26 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %25, align 8
  %27 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %26, align 8
  call void %27(%struct.jpeg_common_struct* %22) #4
  br label %28

; <label>:28:                                     ; preds = %1, %20
  %29 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %30 = bitcast %struct.savable_state* %12 to i8*
  %31 = bitcast %struct.savable_state* %11 to i8*
  %32 = bitcast %struct.working_state* %2 to i64*
  %33 = load i64, i64* %32, align 16
  %sunkaddr1 = add i64 %29, 32
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i64**
  %34 = load i64*, i64** %sunkaddr2, align 8
  store i64 %33, i64* %34, align 8
  %sunkaddr3 = ptrtoint %struct.working_state* %2 to i64
  %sunkaddr4 = or i64 %sunkaddr3, 8
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i64*
  %35 = load i64, i64* %sunkaddr5, align 8
  %sunkaddr8 = inttoptr i64 %sunkaddr1 to %struct.jpeg_destination_mgr**
  %36 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %sunkaddr8, align 8
  %37 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %36, i64 0, i32 1
  store i64 %35, i64* %37, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %30, i8* %31, i64 32, i32 8, i1 false)
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @htest_one_block(i16* nocapture readonly, i32, i64* nocapture, i64*) unnamed_addr #2 {
  %5 = load i16, i16* %0, align 2
  %6 = sext i16 %5 to i32
  %7 = sub nsw i32 %6, %1
  %8 = icmp slt i32 %7, 0
  %9 = sub nsw i32 0, %7
  %.44 = select i1 %8, i32 %9, i32 %7
  %10 = icmp eq i32 %.44, 0
  br i1 %10, label %.lr.ph11, label %.lr.ph28.preheader

.lr.ph28.preheader:                               ; preds = %4
  br label %.lr.ph28

.lr.ph28:                                         ; preds = %.lr.ph28.preheader, %.lr.ph28
  %11 = phi i32 [ %14, %.lr.ph28 ], [ %.44, %.lr.ph28.preheader ]
  %12 = phi i32 [ %13, %.lr.ph28 ], [ 0, %.lr.ph28.preheader ]
  %13 = add nuw nsw i32 %12, 1
  %14 = ashr i32 %11, 1
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %._crit_edge29, label %.lr.ph28

._crit_edge29:                                    ; preds = %.lr.ph28
  %phitmp = sext i32 %13 to i64
  br label %.lr.ph11

.lr.ph11:                                         ; preds = %._crit_edge29, %4
  %.promoted17 = phi i64 [ 0, %4 ], [ %phitmp, %._crit_edge29 ]
  %16 = getelementptr inbounds i64, i64* %2, i64 %.promoted17
  %17 = load i64, i64* %16, align 8
  %18 = add nsw i64 %17, 1
  store i64 %18, i64* %16, align 8
  br label %19

; <label>:19:                                     ; preds = %54, %.lr.ph11
  %indvars.iv = phi i64 [ 1, %.lr.ph11 ], [ %indvars.iv.next, %54 ]
  %.lcssa214 = phi i32 [ 0, %.lr.ph11 ], [ %.lcssa215, %54 ]
  %20 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv
  %21 = load i32, i32* %20, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i16, i16* %0, i64 %22
  %24 = load i16, i16* %23, align 2
  %25 = sext i16 %24 to i32
  %26 = icmp eq i16 %24, 0
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %19
  %28 = add nsw i32 %.lcssa214, 1
  br label %54

; <label>:29:                                     ; preds = %19
  %30 = icmp sgt i32 %.lcssa214, 15
  br i1 %30, label %._crit_edge, label %38

._crit_edge:                                      ; preds = %29
  %31 = add i32 %.lcssa214, -16
  %32 = lshr i32 %31, 4
  %33 = shl nuw i32 %32, 4
  %34 = zext i32 %32 to i64
  %sunkaddr50 = ptrtoint i64* %3 to i64
  %sunkaddr51 = add i64 %sunkaddr50, 1920
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to i64*
  %.promoted = load i64, i64* %sunkaddr52, align 8
  %35 = add i64 %.promoted, 1
  %36 = add i64 %35, %34
  %37 = sub i32 %31, %33
  store i64 %36, i64* %sunkaddr52, align 8
  br label %38

; <label>:38:                                     ; preds = %._crit_edge, %29
  %.lcssa216 = phi i32 [ %37, %._crit_edge ], [ %.lcssa214, %29 ]
  %39 = icmp slt i16 %24, 0
  %40 = sub nsw i32 0, %25
  %. = select i1 %39, i32 %40, i32 %25
  %41 = ashr i32 %., 1
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %._crit_edge5, label %.lr.ph4.preheader

.lr.ph4.preheader:                                ; preds = %38
  br label %.lr.ph4

.lr.ph4:                                          ; preds = %.lr.ph4.preheader, %.lr.ph4
  %43 = phi i32 [ %46, %.lr.ph4 ], [ %41, %.lr.ph4.preheader ]
  %44 = phi i32 [ %45, %.lr.ph4 ], [ 1, %.lr.ph4.preheader ]
  %45 = add nuw nsw i32 %44, 1
  %46 = ashr i32 %43, 1
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %._crit_edge5.loopexit, label %.lr.ph4

._crit_edge5.loopexit:                            ; preds = %.lr.ph4
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %38
  %.lcssa718 = phi i32 [ 1, %38 ], [ %45, %._crit_edge5.loopexit ]
  %48 = shl i32 %.lcssa216, 4
  %promoted = sext i32 %.lcssa718 to i64
  %49 = sext i32 %48 to i64
  %50 = add nsw i64 %49, %promoted
  %51 = getelementptr inbounds i64, i64* %3, i64 %50
  %52 = load i64, i64* %51, align 8
  %53 = add nsw i64 %52, 1
  store i64 %53, i64* %51, align 8
  br label %54

; <label>:54:                                     ; preds = %27, %._crit_edge5
  %.lcssa215 = phi i32 [ %28, %27 ], [ 0, %._crit_edge5 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 64
  br i1 %exitcond, label %._crit_edge12, label %19

._crit_edge12:                                    ; preds = %54
  %55 = icmp sgt i32 %.lcssa215, 0
  br i1 %55, label %56, label %59

; <label>:56:                                     ; preds = %._crit_edge12
  %57 = load i64, i64* %3, align 8
  %58 = add nsw i64 %57, 1
  store i64 %58, i64* %3, align 8
  br label %59

; <label>:59:                                     ; preds = %56, %._crit_edge12
  ret void
}

declare %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct*) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @emit_restart(%struct.working_state*, i32) unnamed_addr #0 {
  %3 = tail call fastcc i32 @flush_bits(%struct.working_state* %0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %._crit_edge, label %5

; <label>:5:                                      ; preds = %2
  %6 = bitcast %struct.working_state* %0 to i8**
  %7 = load i8*, i8** %6, align 8
  %8 = getelementptr inbounds i8, i8* %7, i64 1
  store i8* %8, i8** %6, align 8
  store i8 -1, i8* %7, align 1
  %9 = getelementptr inbounds i8*, i8** %6, i64 1
  %10 = bitcast i8** %9 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = add i64 %11, -1
  store i64 %12, i64* %10, align 8
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %._crit_edge1

; <label>:14:                                     ; preds = %5
  %15 = tail call fastcc i32 @dump_buffer(%struct.working_state* %0)
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %._crit_edge, label %._crit_edge1

._crit_edge1:                                     ; preds = %5, %14
  %17 = bitcast %struct.working_state* %0 to i8**
  %18 = add nsw i32 %1, 208
  %19 = trunc i32 %18 to i8
  %20 = load i8*, i8** %17, align 8
  %21 = getelementptr inbounds i8, i8* %20, i64 1
  store i8* %21, i8** %17, align 8
  store i8 %19, i8* %20, align 1
  %sunkaddr6 = ptrtoint %struct.working_state* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 8
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i64*
  %22 = load i64, i64* %sunkaddr8, align 8
  %23 = add i64 %22, -1
  store i64 %23, i64* %sunkaddr8, align 8
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %25, label %._crit_edge2

; <label>:25:                                     ; preds = %._crit_edge1
  %26 = tail call fastcc i32 @dump_buffer(%struct.working_state* %0)
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %._crit_edge, label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge1, %25
  %28 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 3
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %28, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i64 0, i32 41
  %31 = load i32, i32* %30, align 4
  %32 = icmp sgt i32 %31, 0
  br i1 %32, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %33 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 2, i32 2, i64 %indvars.iv
  store i32 0, i32* %33, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %sunkaddr9 = ptrtoint %struct.working_state* %0 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 48
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to %struct.jpeg_compress_struct**
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %sunkaddr11, align 8
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %34, i64 0, i32 41
  %36 = load i32, i32* %35, align 4
  %37 = sext i32 %36 to i64
  %38 = icmp slt i64 %indvars.iv.next, %37
  br i1 %38, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge2, %25, %14, %2
  %39 = phi i32 [ 0, %2 ], [ 0, %14 ], [ 0, %25 ], [ 1, %._crit_edge2 ], [ 1, %._crit_edge.loopexit ]
  ret i32 %39
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @encode_one_block(%struct.working_state*, i16* nocapture readonly, i32, %struct.c_derived_tbl* nocapture readonly, %struct.c_derived_tbl*) unnamed_addr #0 {
  %6 = load i16, i16* %1, align 2
  %7 = sext i16 %6 to i32
  %8 = sub nsw i32 %7, %2
  %9 = icmp slt i32 %8, 0
  %10 = sub nsw i32 0, %8
  %.lobit67 = ashr i32 %8, 31
  %.promoted32 = add nsw i32 %8, %.lobit67
  %.promoted47 = select i1 %9, i32 %10, i32 %8
  %11 = icmp eq i32 %.promoted47, 0
  br i1 %11, label %._crit_edge44, label %.lr.ph43.preheader

.lr.ph43.preheader:                               ; preds = %5
  br label %.lr.ph43

.lr.ph43:                                         ; preds = %.lr.ph43.preheader, %.lr.ph43
  %12 = phi i32 [ %15, %.lr.ph43 ], [ %.promoted47, %.lr.ph43.preheader ]
  %13 = phi i32 [ %14, %.lr.ph43 ], [ 0, %.lr.ph43.preheader ]
  %14 = add nuw nsw i32 %13, 1
  %15 = ashr i32 %12, 1
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %._crit_edge44.loopexit, label %.lr.ph43

._crit_edge44.loopexit:                           ; preds = %.lr.ph43
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.loopexit, %5
  %.promoted = phi i32 [ 0, %5 ], [ %14, %._crit_edge44.loopexit ]
  %17 = bitcast %struct.c_derived_tbl* %3 to [256 x i32]*
  %18 = sext i32 %.promoted to i64
  %19 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %3, i64 0, i32 0, i64 %18
  %20 = load i32, i32* %19, align 4
  %21 = getelementptr inbounds [256 x i32], [256 x i32]* %17, i64 1
  %22 = bitcast [256 x i32]* %21 to [256 x i8]*
  %23 = getelementptr inbounds [256 x i8], [256 x i8]* %22, i64 0, i64 %18
  %24 = load i8, i8* %23, align 1
  %25 = sext i8 %24 to i32
  %26 = tail call fastcc i32 @emit_bits(%struct.working_state* %0, i32 %20, i32 %25)
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %.loopexit, label %28

; <label>:28:                                     ; preds = %._crit_edge44
  %29 = icmp eq i32 %.promoted, 0
  br i1 %29, label %.lr.ph10, label %30

; <label>:30:                                     ; preds = %28
  %31 = tail call fastcc i32 @emit_bits(%struct.working_state* %0, i32 %.promoted32, i32 %.promoted)
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %.loopexit, label %.lr.ph10

.lr.ph10:                                         ; preds = %28, %30
  br label %33

; <label>:33:                                     ; preds = %.lr.ph10, %78
  %indvars.iv = phi i64 [ 1, %.lr.ph10 ], [ %indvars.iv.next, %78 ]
  %.lcssa113 = phi i32 [ 0, %.lr.ph10 ], [ %.lcssa114, %78 ]
  %34 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv
  %35 = load i32, i32* %34, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i16, i16* %1, i64 %36
  %38 = load i16, i16* %37, align 2
  %39 = sext i16 %38 to i32
  %40 = icmp eq i16 %38, 0
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %33
  %42 = add nsw i32 %.lcssa113, 1
  br label %78

; <label>:43:                                     ; preds = %33
  %44 = icmp sgt i32 %.lcssa113, 15
  br i1 %44, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %43
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %51
  %45 = phi i32 [ %52, %51 ], [ %.lcssa113, %.lr.ph.preheader ]
  %sunkaddr78 = ptrtoint %struct.c_derived_tbl* %4 to i64
  %sunkaddr79 = add i64 %sunkaddr78, 960
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to i32*
  %46 = load i32, i32* %sunkaddr80, align 4
  %sunkaddr81 = ptrtoint %struct.c_derived_tbl* %4 to i64
  %sunkaddr82 = add i64 %sunkaddr81, 1264
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to i8*
  %47 = load i8, i8* %sunkaddr83, align 4
  %48 = sext i8 %47 to i32
  %49 = tail call fastcc i32 @emit_bits(%struct.working_state* %0, i32 %46, i32 %48)
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %.loopexit.loopexit, label %51

; <label>:51:                                     ; preds = %.lr.ph
  %52 = add nsw i32 %45, -16
  %53 = icmp sgt i32 %52, 15
  br i1 %53, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %51
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %43
  %.lcssa115 = phi i32 [ %.lcssa113, %43 ], [ %52, %._crit_edge.loopexit ]
  %54 = icmp slt i16 %38, 0
  %55 = sub nsw i32 0, %39
  %.lobit = ashr i16 %38, 15
  %56 = sext i16 %.lobit to i32
  %57 = add nsw i32 %39, %56
  %.lcssa822 = select i1 %54, i32 %55, i32 %39
  %58 = ashr i32 %.lcssa822, 1
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %._crit_edge4, label %.lr.ph3.preheader

.lr.ph3.preheader:                                ; preds = %._crit_edge
  br label %.lr.ph3

.lr.ph3:                                          ; preds = %.lr.ph3.preheader, %.lr.ph3
  %60 = phi i32 [ %63, %.lr.ph3 ], [ %58, %.lr.ph3.preheader ]
  %61 = phi i32 [ %62, %.lr.ph3 ], [ 1, %.lr.ph3.preheader ]
  %62 = add nuw nsw i32 %61, 1
  %63 = ashr i32 %60, 1
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %._crit_edge4.loopexit, label %.lr.ph3

._crit_edge4.loopexit:                            ; preds = %.lr.ph3
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %._crit_edge
  %.lcssa617 = phi i32 [ 1, %._crit_edge ], [ %62, %._crit_edge4.loopexit ]
  %65 = ptrtoint %struct.c_derived_tbl* %4 to i64
  %66 = shl i32 %.lcssa115, 4
  %67 = add nsw i32 %66, %.lcssa617
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %4, i64 0, i32 0, i64 %68
  %70 = load i32, i32* %69, align 4
  %sunkaddr61 = add i64 %65, %68
  %sunkaddr62 = add i64 %sunkaddr61, 1024
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to i8*
  %71 = load i8, i8* %sunkaddr63, align 1
  %72 = sext i8 %71 to i32
  %73 = tail call fastcc i32 @emit_bits(%struct.working_state* %0, i32 %70, i32 %72)
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %.loopexit.loopexit84, label %75

; <label>:75:                                     ; preds = %._crit_edge4
  %76 = tail call fastcc i32 @emit_bits(%struct.working_state* %0, i32 %57, i32 %.lcssa617)
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %.loopexit.loopexit84, label %78

; <label>:78:                                     ; preds = %75, %41
  %.lcssa114 = phi i32 [ %42, %41 ], [ 0, %75 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %79 = icmp slt i64 %indvars.iv.next, 64
  br i1 %79, label %33, label %._crit_edge11

._crit_edge11:                                    ; preds = %78
  %80 = icmp sgt i32 %.lcssa114, 0
  br i1 %80, label %81, label %90

; <label>:81:                                     ; preds = %._crit_edge11
  %82 = bitcast %struct.c_derived_tbl* %4 to i32*
  %83 = load i32, i32* %82, align 4
  %84 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %4, i64 0, i32 0, i64 256
  %85 = bitcast i32* %84 to i8*
  %86 = load i8, i8* %85, align 4
  %87 = sext i8 %86 to i32
  %88 = tail call fastcc i32 @emit_bits(%struct.working_state* %0, i32 %83, i32 %87)
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %.loopexit, label %90

; <label>:90:                                     ; preds = %81, %._crit_edge11
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit.loopexit84:                             ; preds = %._crit_edge4, %75
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit84, %.loopexit.loopexit, %81, %30, %._crit_edge44, %90
  %91 = phi i32 [ 1, %90 ], [ 0, %._crit_edge44 ], [ 0, %30 ], [ 0, %81 ], [ 0, %.loopexit.loopexit ], [ 0, %.loopexit.loopexit84 ]
  ret i32 %91
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @flush_bits(%struct.working_state*) unnamed_addr #0 {
  %2 = tail call fastcc i32 @emit_bits(%struct.working_state* %0, i32 127, i32 7)
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %7, label %4

; <label>:4:                                      ; preds = %1
  %5 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 2, i32 0
  store i64 0, i64* %5, align 8
  %6 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 2, i32 1
  store i32 0, i32* %6, align 8
  br label %7

; <label>:7:                                      ; preds = %1, %4
  %storemerge = phi i32 [ 1, %4 ], [ 0, %1 ]
  ret i32 %storemerge
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @dump_buffer(%struct.working_state* nocapture) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 3
  %3 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %3, i64 0, i32 5
  %5 = bitcast %struct.jpeg_destination_mgr** %4 to i64*
  %6 = load i64, i64* %5, align 8
  %.cast = inttoptr i64 %6 to %struct.jpeg_destination_mgr*
  %7 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %.cast, i64 0, i32 3
  %8 = load i32 (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)** %7, align 8
  %9 = tail call i32 %8(%struct.jpeg_compress_struct* %3) #4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %18, label %11

; <label>:11:                                     ; preds = %1
  %12 = inttoptr i64 %6 to i64*
  %13 = bitcast %struct.working_state* %0 to i64*
  %14 = load i64, i64* %12, align 8
  store i64 %14, i64* %13, align 8
  %15 = getelementptr inbounds i64, i64* %12, i64 1
  %16 = load i64, i64* %15, align 8
  %17 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 1
  store i64 %16, i64* %17, align 8
  br label %18

; <label>:18:                                     ; preds = %1, %11
  %storemerge = phi i32 [ 1, %11 ], [ 0, %1 ]
  ret i32 %storemerge
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @emit_bits(%struct.working_state*, i32, i32) unnamed_addr #0 {
  %4 = alloca %struct.working_state*, align 8
  store %struct.working_state* %0, %struct.working_state** %4, align 8
  %5 = zext i32 %1 to i64
  %6 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 2, i32 1
  %7 = load i32, i32* %6, align 8
  %8 = icmp eq i32 %2, 0
  br i1 %8, label %9, label %19

; <label>:9:                                      ; preds = %3
  %10 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 3
  %11 = bitcast %struct.jpeg_compress_struct** %10 to %struct.jpeg_error_mgr***
  %12 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %11, align 8
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 5
  store i32 39, i32* %14, align 8
  %15 = bitcast %struct.jpeg_compress_struct** %10 to void (%struct.jpeg_common_struct*)****
  %16 = load void (%struct.jpeg_common_struct*)***, void (%struct.jpeg_common_struct*)**** %15, align 8
  %17 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %16, align 8
  %18 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %17, align 8
  %.cast13 = bitcast void (%struct.jpeg_common_struct*)*** %16 to %struct.jpeg_common_struct*
  tail call void %18(%struct.jpeg_common_struct* %.cast13) #4
  br label %19

; <label>:19:                                     ; preds = %9, %3
  %20 = zext i32 %2 to i64
  %21 = shl i64 1, %20
  %22 = add nsw i64 %21, -1
  %23 = and i64 %5, %22
  %24 = add nsw i32 %7, %2
  %25 = sub nsw i32 24, %24
  %26 = zext i32 %25 to i64
  %27 = shl i64 %23, %26
  %28 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 2, i32 0
  %29 = load i64, i64* %28, align 8
  %30 = or i64 %27, %29
  %31 = icmp sgt i32 %24, 7
  br i1 %31, label %.lr.ph, label %63

.lr.ph:                                           ; preds = %19
  br label %32

; <label>:32:                                     ; preds = %.lr.ph, %59
  %33 = phi i32 [ %24, %.lr.ph ], [ %61, %59 ]
  %34 = phi i64 [ %30, %.lr.ph ], [ %60, %59 ]
  %35 = bitcast %struct.working_state* %0 to i8**
  %36 = lshr i64 %34, 16
  %37 = trunc i64 %36 to i8
  %38 = load i8*, i8** %35, align 8
  %39 = getelementptr inbounds i8, i8* %38, i64 1
  store i8* %39, i8** %35, align 8
  store i8 %37, i8* %38, align 1
  %sunkaddr26 = ptrtoint %struct.working_state* %0 to i64
  %sunkaddr27 = add i64 %sunkaddr26, 8
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i64*
  %40 = load i64, i64* %sunkaddr28, align 8
  %41 = add i64 %40, -1
  store i64 %41, i64* %sunkaddr28, align 8
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %43, label %46

; <label>:43:                                     ; preds = %32
  %44 = tail call fastcc i32 @dump_buffer(%struct.working_state* nonnull %0)
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %.loopexit.loopexit, label %46

; <label>:46:                                     ; preds = %43, %32
  %47 = and i64 %36, 255
  %48 = icmp eq i64 %47, 255
  br i1 %48, label %49, label %59

; <label>:49:                                     ; preds = %46
  %50 = bitcast %struct.working_state* %0 to i8**
  %51 = load i8*, i8** %50, align 8
  %52 = getelementptr inbounds i8, i8* %51, i64 1
  store i8* %52, i8** %50, align 8
  store i8 0, i8* %51, align 1
  %sunkaddr29 = ptrtoint %struct.working_state* %0 to i64
  %sunkaddr30 = add i64 %sunkaddr29, 8
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to i64*
  %53 = load i64, i64* %sunkaddr31, align 8
  %54 = add i64 %53, -1
  store i64 %54, i64* %sunkaddr31, align 8
  %55 = icmp eq i64 %54, 0
  br i1 %55, label %56, label %59

; <label>:56:                                     ; preds = %49
  %57 = tail call fastcc i32 @dump_buffer(%struct.working_state* nonnull %0)
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %.loopexit.loopexit, label %59

; <label>:59:                                     ; preds = %56, %49, %46
  %60 = shl i64 %34, 8
  %61 = add nsw i32 %33, -8
  %62 = icmp sgt i32 %61, 7
  br i1 %62, label %32, label %._crit_edge

._crit_edge:                                      ; preds = %59
  %.pre = load %struct.working_state*, %struct.working_state** %4, align 8
  br label %63

; <label>:63:                                     ; preds = %._crit_edge, %19
  %64 = phi i32 [ %61, %._crit_edge ], [ %24, %19 ]
  %65 = phi %struct.working_state* [ %.pre, %._crit_edge ], [ %0, %19 ]
  %66 = phi i64 [ %60, %._crit_edge ], [ %30, %19 ]
  %67 = getelementptr inbounds %struct.working_state, %struct.working_state* %65, i64 0, i32 2, i32 0
  store i64 %66, i64* %67, align 8
  %68 = getelementptr inbounds %struct.working_state, %struct.working_state* %65, i64 0, i32 2, i32 1
  store i32 %64, i32* %68, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %43, %56
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %63
  %69 = phi i32 [ 1, %63 ], [ 0, %.loopexit.loopexit ]
  ret i32 %69
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}

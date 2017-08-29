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
  br i1 %7, label %8, label %16

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %10 = bitcast %struct.jpeg_memory_mgr** %9 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %11 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %10, align 8
  %12 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %11, align 8
  %13 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %14 = tail call i8* %12(%struct.jpeg_common_struct* %13, i32 1, i64 1280) #4
  %15 = bitcast %struct.c_derived_tbl** %2 to i8**
  store i8* %14, i8** %15, align 8
  br label %16

; <label>:16:                                     ; preds = %8, %3
  %17 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %2, align 8
  %sunkaddr = ptrtoint %struct.JHUFF_TBL* %1 to i64
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge20, %16
  %indvars.iv30 = phi i64 [ 1, %16 ], [ %indvars.iv.next31, %._crit_edge20 ]
  %.0223 = phi i32 [ 1, %16 ], [ %44, %._crit_edge20 ]
  %.0422 = phi i32 [ 0, %16 ], [ %.15.lcssa, %._crit_edge20 ]
  %18 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 0, i64 %indvars.iv30
  %19 = load i8, i8* %18, align 1
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %._crit_edge20, label %.lr.ph19

.lr.ph19:                                         ; preds = %.preheader6
  %21 = trunc i32 %.0223 to i8
  %sunkaddr33 = add i64 %sunkaddr, %indvars.iv30
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i8*
  %22 = load i8, i8* %sunkaddr34, align 1
  %23 = zext i8 %22 to i32
  %24 = sext i32 %.0422 to i64
  %scevgep = getelementptr [257 x i8], [257 x i8]* %4, i64 0, i64 %24
  %25 = icmp ugt i32 %23, 1
  %smax = select i1 %25, i32 %23, i32 1
  %26 = add nsw i32 %smax, -1
  %27 = zext i32 %26 to i64
  %28 = add nuw nsw i64 %27, 1
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 %21, i64 %28, i32 1, i1 false)
  %29 = icmp ugt i32 %23, 1
  %smax35 = select i1 %29, i32 %23, i32 1
  %min.iters.check = icmp ult i32 %smax35, 4
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph19
  %n.vec = and i32 %smax35, 252
  %cmp.zero = icmp eq i32 %n.vec, 0
  %ind.end = or i32 %n.vec, 1
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %30 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %24, i32 0
  %31 = add nsw i32 %n.vec, -4
  %32 = lshr exact i32 %31, 2
  %33 = add nuw nsw i32 %32, 1
  %xtraiter42 = and i32 %33, 7
  %lcmp.mod43 = icmp eq i32 %xtraiter42, 0
  br i1 %lcmp.mod43, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i32 [ 0, %vector.body.prol.preheader ], [ %index.next.prol, %vector.body.prol ]
  %vec.phi.prol = phi <2 x i64> [ %30, %vector.body.prol.preheader ], [ %34, %vector.body.prol ]
  %vec.phi36.prol = phi <2 x i64> [ zeroinitializer, %vector.body.prol.preheader ], [ %35, %vector.body.prol ]
  %prol.iter = phi i32 [ %xtraiter42, %vector.body.prol.preheader ], [ %prol.iter.sub, %vector.body.prol ]
  %34 = add nsw <2 x i64> %vec.phi.prol, <i64 1, i64 1>
  %35 = add nsw <2 x i64> %vec.phi36.prol, <i64 1, i64 1>
  %index.next.prol = add i32 %index.prol, 4
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.ph, %vector.body.prol.loopexit.unr-lcssa
  %.lcssa40.unr = phi <2 x i64> [ undef, %vector.ph ], [ %34, %vector.body.prol.loopexit.unr-lcssa ]
  %.lcssa39.unr = phi <2 x i64> [ undef, %vector.ph ], [ %35, %vector.body.prol.loopexit.unr-lcssa ]
  %index.unr = phi i32 [ 0, %vector.ph ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %vec.phi.unr = phi <2 x i64> [ %30, %vector.ph ], [ %34, %vector.body.prol.loopexit.unr-lcssa ]
  %vec.phi36.unr = phi <2 x i64> [ zeroinitializer, %vector.ph ], [ %35, %vector.body.prol.loopexit.unr-lcssa ]
  %36 = icmp ult i32 %31, 28
  br i1 %36, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i32 [ %index.unr, %vector.ph.new ], [ %index.next.7, %vector.body ]
  %vec.phi = phi <2 x i64> [ %vec.phi.unr, %vector.ph.new ], [ %37, %vector.body ]
  %vec.phi36 = phi <2 x i64> [ %vec.phi36.unr, %vector.ph.new ], [ %38, %vector.body ]
  %37 = add nsw <2 x i64> %vec.phi, <i64 8, i64 8>
  %38 = add nsw <2 x i64> %vec.phi36, <i64 8, i64 8>
  %index.next.7 = add i32 %index, 32
  %39 = icmp eq i32 %index.next.7, %n.vec
  br i1 %39, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %.lcssa40 = phi <2 x i64> [ %.lcssa40.unr, %vector.body.prol.loopexit ], [ %37, %middle.block.unr-lcssa ]
  %.lcssa39 = phi <2 x i64> [ %.lcssa39.unr, %vector.body.prol.loopexit ], [ %38, %middle.block.unr-lcssa ]
  %bin.rdx = add <2 x i64> %.lcssa39, %.lcssa40
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx38 = add <2 x i64> %bin.rdx, %rdx.shuf
  %40 = extractelement <2 x i64> %bin.rdx38, i32 0
  %cmp.n = icmp eq i32 %smax35, %n.vec
  br i1 %cmp.n, label %._crit_edge20.loopexit, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph19
  %indvars.iv28.ph = phi i64 [ %24, %min.iters.checked ], [ %24, %.lr.ph19 ], [ %40, %middle.block ]
  %.0318.ph = phi i32 [ 1, %min.iters.checked ], [ 1, %.lr.ph19 ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %scalar.ph ], [ %indvars.iv28.ph, %scalar.ph.preheader ]
  %.0318 = phi i32 [ %41, %scalar.ph ], [ %.0318.ph, %scalar.ph.preheader ]
  %indvars.iv.next29 = add nsw i64 %indvars.iv28, 1
  %41 = add nuw nsw i32 %.0318, 1
  %42 = icmp slt i32 %.0318, %23
  br i1 %42, label %scalar.ph, label %._crit_edge20.loopexit.loopexit, !llvm.loop !6

._crit_edge20.loopexit.loopexit:                  ; preds = %scalar.ph
  br label %._crit_edge20.loopexit

._crit_edge20.loopexit:                           ; preds = %._crit_edge20.loopexit.loopexit, %middle.block
  %indvars.iv.next29.lcssa = phi i64 [ %40, %middle.block ], [ %indvars.iv.next29, %._crit_edge20.loopexit.loopexit ]
  %43 = trunc i64 %indvars.iv.next29.lcssa to i32
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %.preheader6
  %.15.lcssa = phi i32 [ %.0422, %.preheader6 ], [ %43, %._crit_edge20.loopexit ]
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %44 = add nuw nsw i32 %.0223, 1
  %exitcond = icmp eq i64 %indvars.iv.next31, 17
  br i1 %exitcond, label %45, label %.preheader6

; <label>:45:                                     ; preds = %._crit_edge20
  %46 = sext i32 %.15.lcssa to i64
  %47 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %46
  store i8 0, i8* %47, align 1
  %48 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 0
  %49 = load i8, i8* %48, align 16
  %50 = icmp eq i8 %49, 0
  br i1 %50, label %._crit_edge16, label %.preheader.preheader

.preheader.preheader:                             ; preds = %45
  %51 = sext i8 %49 to i32
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge11
  %.015 = phi i32 [ %64, %._crit_edge11 ], [ 0, %.preheader.preheader ]
  %.0114 = phi i32 [ %65, %._crit_edge11 ], [ %51, %.preheader.preheader ]
  %.213 = phi i32 [ %.3.lcssa, %._crit_edge11 ], [ 0, %.preheader.preheader ]
  %52 = sext i32 %.213 to i64
  %53 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %52
  %54 = load i8, i8* %53, align 1
  %55 = sext i8 %54 to i32
  %56 = icmp eq i32 %55, %.0114
  br i1 %56, label %.lr.ph10.preheader, label %._crit_edge11

.lr.ph10.preheader:                               ; preds = %.preheader
  br label %.lr.ph10

.lr.ph10:                                         ; preds = %.lr.ph10.preheader, %.lr.ph10
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %.lr.ph10 ], [ %52, %.lr.ph10.preheader ]
  %.19 = phi i32 [ %58, %.lr.ph10 ], [ %.015, %.lr.ph10.preheader ]
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, 1
  %57 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv26
  store i32 %.19, i32* %57, align 4
  %58 = add i32 %.19, 1
  %59 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %indvars.iv.next27
  %60 = load i8, i8* %59, align 1
  %61 = sext i8 %60 to i32
  %62 = icmp eq i32 %61, %.0114
  br i1 %62, label %.lr.ph10, label %._crit_edge11.loopexit

._crit_edge11.loopexit:                           ; preds = %.lr.ph10
  %63 = trunc i64 %indvars.iv.next27 to i32
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.preheader
  %.3.lcssa = phi i32 [ %.213, %.preheader ], [ %63, %._crit_edge11.loopexit ]
  %.1.lcssa = phi i32 [ %.015, %.preheader ], [ %58, %._crit_edge11.loopexit ]
  %64 = shl i32 %.1.lcssa, 1
  %65 = add nsw i32 %.0114, 1
  %66 = sext i32 %.3.lcssa to i64
  %67 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = icmp eq i8 %68, 0
  br i1 %69, label %._crit_edge16.loopexit, label %.preheader

._crit_edge16.loopexit:                           ; preds = %._crit_edge11
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %45
  %70 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %17, i64 0, i32 1, i64 0
  tail call void @llvm.memset.p0i8.i64(i8* %70, i8 0, i64 256, i32 4, i1 false)
  %71 = icmp sgt i32 %.15.lcssa, 0
  br i1 %71, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge16
  %xtraiter = and i32 %.15.lcssa, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %72 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 0
  %73 = load i32, i32* %72, align 16
  %74 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 1, i64 0
  %75 = load i8, i8* %74, align 1
  %76 = zext i8 %75 to i64
  %77 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %17, i64 0, i32 0, i64 %76
  store i32 %73, i32* %77, align 4
  %78 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 0
  %79 = load i8, i8* %78, align 16
  %80 = load i8, i8* %74, align 1
  %81 = zext i8 %80 to i64
  %82 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %17, i64 0, i32 1, i64 %81
  store i8 %79, i8* %82, align 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.preheader ], [ 1, %.lr.ph.prol ]
  %83 = icmp eq i32 %.15.lcssa, 1
  br i1 %83, label %._crit_edge, label %.lr.ph.preheader32

.lr.ph.preheader32:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count.1 = zext i32 %.15.lcssa to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader32, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv.unr, %.lr.ph.preheader32 ]
  %84 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv
  %85 = load i32, i32* %84, align 4
  %86 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 1, i64 %indvars.iv
  %87 = load i8, i8* %86, align 1
  %88 = zext i8 %87 to i64
  %89 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %17, i64 0, i32 0, i64 %88
  store i32 %85, i32* %89, align 4
  %90 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %indvars.iv
  %91 = load i8, i8* %90, align 1
  %92 = load i8, i8* %86, align 1
  %93 = zext i8 %92 to i64
  %94 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %17, i64 0, i32 1, i64 %93
  store i8 %91, i8* %94, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %95 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv.next
  %96 = load i32, i32* %95, align 4
  %97 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 1, i64 %indvars.iv.next
  %98 = load i8, i8* %97, align 1
  %99 = zext i8 %98 to i64
  %100 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %17, i64 0, i32 0, i64 %99
  store i32 %96, i32* %100, align 4
  %101 = getelementptr inbounds [257 x i8], [257 x i8]* %4, i64 0, i64 %indvars.iv.next
  %102 = load i8, i8* %101, align 1
  %103 = load i8, i8* %97, align 1
  %104 = zext i8 %103 to i64
  %105 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %17, i64 0, i32 1, i64 %104
  store i8 %102, i8* %105, align 1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %._crit_edge16
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct*, %struct.JHUFF_TBL* nocapture, i64* nocapture) local_unnamed_addr #0 {
  %4 = alloca [33 x i8], align 16
  %5 = alloca [257 x i32], align 16
  %6 = alloca [257 x i32], align 16
  %7 = bitcast [257 x i32]* %6 to i8*
  %8 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* nonnull %8, i8 0, i64 33, i32 16, i1 false)
  %9 = bitcast [257 x i32]* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %9, i8 0, i64 1028, i32 16, i1 false)
  call void @llvm.memset.p0i8.i64(i8* nonnull %7, i8 -1, i64 1028, i32 16, i1 false)
  %10 = getelementptr inbounds i64, i64* %2, i64 256
  store i64 1, i64* %10, align 8
  %11 = ptrtoint [257 x i32]* %6 to i64
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %49
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %3
  %12 = load i64, i64* %2, align 8
  %13 = icmp eq i64 %12, 0
  %14 = icmp sgt i64 %12, 1000000000
  %or.cond2598 = or i1 %13, %14
  %.1899 = sext i1 %or.cond2598 to i32
  %.1100 = select i1 %or.cond2598, i64 1000000000, i64 %12
  br label %130

.preheader46:                                     ; preds = %130
  %15 = zext i32 %.18 to i64
  br label %16

; <label>:16:                                     ; preds = %149, %.preheader46
  %indvars.iv81 = phi i64 [ 0, %.preheader46 ], [ %indvars.iv.next82.1, %149 ]
  %.261 = phi i64 [ 1000000000, %.preheader46 ], [ %.3.1, %149 ]
  %.01059 = phi i32 [ -1, %.preheader46 ], [ %.111.1, %149 ]
  %17 = getelementptr inbounds i64, i64* %2, i64 %indvars.iv81
  %18 = load i64, i64* %17, align 8
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %24, label %20

; <label>:20:                                     ; preds = %16
  %21 = icmp sgt i64 %18, %.261
  %22 = icmp eq i64 %indvars.iv81, %15
  %or.cond = or i1 %22, %21
  %23 = trunc i64 %indvars.iv81 to i32
  %.010..25 = select i1 %or.cond, i32 %.01059, i32 %23
  %.2. = select i1 %or.cond, i64 %.261, i64 %18
  br label %24

; <label>:24:                                     ; preds = %20, %16
  %.111 = phi i32 [ %.01059, %16 ], [ %.010..25, %20 ]
  %.3 = phi i64 [ %.261, %16 ], [ %.2., %20 ]
  %indvars.iv.next82 = or i64 %indvars.iv81, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next82, 257
  br i1 %exitcond83, label %25, label %141

; <label>:25:                                     ; preds = %24
  %26 = icmp slt i32 %.111, 0
  br i1 %26, label %.preheader45.preheader, label %31

.preheader45.preheader:                           ; preds = %25
  %27 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %28 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %30 = ptrtoint [257 x i32]* %5 to i64
  br label %.preheader45

; <label>:31:                                     ; preds = %25
  %32 = sext i32 %.111 to i64
  %33 = getelementptr inbounds i64, i64* %2, i64 %32
  %34 = load i64, i64* %33, align 8
  %35 = sext i32 %.18 to i64
  %36 = getelementptr inbounds i64, i64* %2, i64 %35
  %37 = load i64, i64* %36, align 8
  %38 = add nsw i64 %37, %34
  store i64 %38, i64* %36, align 8
  store i64 0, i64* %33, align 8
  br label %39

; <label>:39:                                     ; preds = %39, %31
  %.sink = phi i32 [ %.18, %31 ], [ %46, %39 ]
  %40 = sext i32 %.sink to i64
  %41 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %40
  %42 = load i32, i32* %41, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %41, align 4
  %44 = sext i32 %.sink to i64
  %45 = getelementptr inbounds [257 x i32], [257 x i32]* %6, i64 0, i64 %44
  %46 = load i32, i32* %45, align 4
  %47 = icmp sgt i32 %46, -1
  br i1 %47, label %39, label %48

; <label>:48:                                     ; preds = %39
  %sunkaddr26 = shl nsw i64 %44, 2
  %sunkaddr27 = add i64 %11, %sunkaddr26
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i32*
  store i32 %.111, i32* %sunkaddr28, align 4
  br label %49

; <label>:49:                                     ; preds = %49, %48
  %.sink24 = phi i32 [ %.111, %48 ], [ %56, %49 ]
  %50 = sext i32 %.sink24 to i64
  %51 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %50
  %52 = load i32, i32* %51, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %51, align 4
  %54 = sext i32 %.sink24 to i64
  %55 = getelementptr inbounds [257 x i32], [257 x i32]* %6, i64 0, i64 %54
  %56 = load i32, i32* %55, align 4
  %57 = icmp sgt i32 %56, -1
  br i1 %57, label %49, label %.loopexit.loopexit

.preheader45:                                     ; preds = %.preheader45.preheader, %74
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %74 ], [ 0, %.preheader45.preheader ]
  %58 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv75
  %59 = load i32, i32* %58, align 4
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %74, label %61

; <label>:61:                                     ; preds = %.preheader45
  %62 = icmp sgt i32 %59, 32
  br i1 %62, label %63, label %68

; <label>:63:                                     ; preds = %61
  %64 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %65 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %64, i64 0, i32 5
  store i32 38, i32* %65, align 8
  %66 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %27, align 8
  %67 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %66, align 8
  tail call void %67(%struct.jpeg_common_struct* %28) #4
  br label %68

; <label>:68:                                     ; preds = %63, %61
  %sunkaddr30 = shl nsw i64 %indvars.iv75, 2
  %sunkaddr31 = add i64 %30, %sunkaddr30
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to i32*
  %69 = load i32, i32* %sunkaddr32, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 %70
  %72 = load i8, i8* %71, align 1
  %73 = add i8 %72, 1
  store i8 %73, i8* %71, align 1
  br label %74

; <label>:74:                                     ; preds = %68, %.preheader45
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next76, 257
  br i1 %exitcond77, label %.preheader43.preheader, label %.preheader45

.preheader43.preheader:                           ; preds = %74
  %75 = ptrtoint [33 x i8]* %4 to i64
  %sunkaddr = ptrtoint [33 x i8]* %4 to i64
  %sunkaddr90 = ptrtoint [33 x i8]* %4 to i64
  %sunkaddr94 = ptrtoint [33 x i8]* %4 to i64
  br label %.preheader43

.preheader43:                                     ; preds = %.preheader43.preheader, %._crit_edge
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %._crit_edge ], [ 32, %.preheader43.preheader ]
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge ], [ 30, %.preheader43.preheader ]
  %76 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 %indvars.iv73
  %77 = load i8, i8* %76, align 1
  %78 = icmp eq i8 %77, 0
  br i1 %78, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader43
  %sunkaddr88 = add i64 %indvars.iv73, %sunkaddr
  %sunkaddr89 = inttoptr i64 %sunkaddr88 to i8*
  %sunkaddr91 = add i64 %sunkaddr90, %indvars.iv73
  %sunkaddr92 = add i64 %sunkaddr91, -1
  %sunkaddr93 = inttoptr i64 %sunkaddr92 to i8*
  %sunkaddr95 = add i64 %sunkaddr94, %indvars.iv73
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to i8*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %83
  br label %79

; <label>:79:                                     ; preds = %79, %.lr.ph
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %79 ], [ %indvars.iv69, %.lr.ph ]
  %80 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 %indvars.iv71
  %81 = load i8, i8* %80, align 1
  %82 = icmp eq i8 %81, 0
  %indvars.iv.next72 = add i64 %indvars.iv71, -1
  br i1 %82, label %79, label %83

; <label>:83:                                     ; preds = %79
  %84 = load i8, i8* %sunkaddr89, align 1
  %85 = add i8 %84, -2
  store i8 %85, i8* %sunkaddr89, align 1
  %86 = load i8, i8* %sunkaddr93, align 1
  %87 = add i8 %86, 1
  store i8 %87, i8* %sunkaddr93, align 1
  %sext = shl i64 %indvars.iv71, 32
  %88 = ashr exact i64 %sext, 32
  %89 = add nsw i64 %88, 1
  %90 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 %89
  %91 = load i8, i8* %90, align 1
  %92 = add i8 %91, 2
  store i8 %92, i8* %90, align 1
  %sunkaddr37 = add i64 %75, %indvars.iv71
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to i8*
  %93 = load i8, i8* %sunkaddr38, align 1
  %94 = add i8 %93, -1
  store i8 %94, i8* %sunkaddr38, align 1
  %95 = load i8, i8* %sunkaddr96, align 1
  %96 = icmp eq i8 %95, 0
  br i1 %96, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %83
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader43
  %indvars.iv.next74 = add nsw i64 %indvars.iv73, -1
  %97 = icmp sgt i64 %indvars.iv.next74, 16
  %indvars.iv.next70 = add nsw i64 %indvars.iv69, -1
  br i1 %97, label %.preheader43, label %.preheader42.preheader

.preheader42.preheader:                           ; preds = %._crit_edge
  br label %.preheader42

.preheader42:                                     ; preds = %.preheader42.preheader, %.preheader42
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %.preheader42 ], [ 16, %.preheader42.preheader ]
  %98 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 %indvars.iv67
  %99 = load i8, i8* %98, align 1
  %100 = icmp eq i8 %99, 0
  %indvars.iv.next68 = add i64 %indvars.iv67, -1
  br i1 %100, label %.preheader42, label %101

; <label>:101:                                    ; preds = %.preheader42
  %102 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i64 0, i64 0
  %103 = add i8 %99, -1
  %sunkaddr39 = ptrtoint [33 x i8]* %4 to i64
  %sunkaddr40 = add i64 %sunkaddr39, %indvars.iv67
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to i8*
  store i8 %103, i8* %sunkaddr41, align 1
  %104 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %104, i8* nonnull %102, i64 17, i32 4, i1 false)
  br label %.preheader

.preheader:                                       ; preds = %118, %101
  %.653 = phi i32 [ 1, %101 ], [ %119, %118 ]
  %.01352 = phi i32 [ 0, %101 ], [ %.215.1, %118 ]
  br label %105

; <label>:105:                                    ; preds = %128, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %128 ]
  %.1251 = phi i32 [ 0, %.preheader ], [ %129, %128 ]
  %.11450 = phi i32 [ %.01352, %.preheader ], [ %.215.1, %128 ]
  %106 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv
  %107 = load i32, i32* %106, align 8
  %108 = icmp eq i32 %107, %.653
  br i1 %108, label %109, label %114

; <label>:109:                                    ; preds = %105
  %110 = add nsw i32 %.11450, 1
  %111 = sext i32 %.11450 to i64
  %112 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 1, i64 %111
  %113 = trunc i32 %.1251 to i8
  store i8 %113, i8* %112, align 1
  br label %114

; <label>:114:                                    ; preds = %105, %109
  %.215 = phi i32 [ %110, %109 ], [ %.11450, %105 ]
  %indvars.iv.next = or i64 %indvars.iv, 1
  %115 = getelementptr inbounds [257 x i32], [257 x i32]* %5, i64 0, i64 %indvars.iv.next
  %116 = load i32, i32* %115, align 4
  %117 = icmp eq i32 %116, %.653
  br i1 %117, label %122, label %128

; <label>:118:                                    ; preds = %128
  %119 = add nuw nsw i32 %.653, 1
  %exitcond = icmp eq i32 %119, 33
  br i1 %exitcond, label %120, label %.preheader

; <label>:120:                                    ; preds = %118
  %121 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 2
  store i32 0, i32* %121, align 4
  ret void

; <label>:122:                                    ; preds = %114
  %123 = add nsw i32 %.215, 1
  %124 = sext i32 %.215 to i64
  %125 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %1, i64 0, i32 1, i64 %124
  %126 = trunc i32 %.1251 to i8
  %127 = or i8 %126, 1
  store i8 %127, i8* %125, align 1
  br label %128

; <label>:128:                                    ; preds = %122, %114
  %.215.1 = phi i32 [ %123, %122 ], [ %.215, %114 ]
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %129 = add nsw i32 %.1251, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 256
  br i1 %exitcond.1, label %118, label %105

; <label>:130:                                    ; preds = %.loopexit, %130
  %indvars.iv.next79104 = phi i64 [ 1, %.loopexit ], [ %indvars.iv.next79, %130 ]
  %.1103 = phi i64 [ %.1100, %.loopexit ], [ %.1, %130 ]
  %.18102 = phi i32 [ %.1899, %.loopexit ], [ %.18, %130 ]
  %indvars.iv78101 = phi i64 [ 0, %.loopexit ], [ %indvars.iv.next79.1, %130 ]
  %131 = getelementptr inbounds i64, i64* %2, i64 %indvars.iv.next79104
  %132 = load i64, i64* %131, align 8
  %133 = icmp eq i64 %132, 0
  %134 = icmp sgt i64 %132, %.1103
  %or.cond25.1 = or i1 %133, %134
  %135 = trunc i64 %indvars.iv.next79104 to i32
  %.18.1 = select i1 %or.cond25.1, i32 %.18102, i32 %135
  %.1.1 = select i1 %or.cond25.1, i64 %.1103, i64 %132
  %indvars.iv.next79.1 = add nsw i64 %indvars.iv78101, 2
  %136 = getelementptr inbounds i64, i64* %2, i64 %indvars.iv.next79.1
  %137 = load i64, i64* %136, align 8
  %138 = icmp eq i64 %137, 0
  %139 = icmp sgt i64 %137, %.1.1
  %or.cond25 = or i1 %138, %139
  %140 = trunc i64 %indvars.iv.next79.1 to i32
  %.18 = select i1 %or.cond25, i32 %.18.1, i32 %140
  %.1 = select i1 %or.cond25, i64 %.1.1, i64 %137
  %indvars.iv.next79 = or i64 %indvars.iv.next79.1, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next79, 257
  br i1 %exitcond80, label %.preheader46, label %130

; <label>:141:                                    ; preds = %24
  %142 = getelementptr inbounds i64, i64* %2, i64 %indvars.iv.next82
  %143 = load i64, i64* %142, align 8
  %144 = icmp eq i64 %143, 0
  br i1 %144, label %149, label %145

; <label>:145:                                    ; preds = %141
  %146 = icmp sgt i64 %143, %.3
  %147 = icmp eq i64 %indvars.iv.next82, %15
  %or.cond.1 = or i1 %147, %146
  %148 = trunc i64 %indvars.iv.next82 to i32
  %.010..25.1 = select i1 %or.cond.1, i32 %.111, i32 %148
  %.2..1 = select i1 %or.cond.1, i64 %.3, i64 %143
  br label %149

; <label>:149:                                    ; preds = %145, %141
  %.111.1 = phi i32 [ %.111, %141 ], [ %.010..25.1, %145 ]
  %.3.1 = phi i64 [ %.3, %141 ], [ %.2..1, %145 ]
  %indvars.iv.next82.1 = add nsw i64 %indvars.iv81, 2
  br label %16
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define void @jinit_huff_encoder(%struct.jpeg_compress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 192) #4
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %9 = bitcast %struct.jpeg_entropy_encoder** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_compress_struct*, i32)**
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_huff, void (%struct.jpeg_compress_struct*, i32)** %10, align 8
  %11 = getelementptr inbounds i8, i8* %7, i64 128
  %12 = getelementptr inbounds i8, i8* %7, i64 160
  %13 = getelementptr inbounds i8, i8* %7, i64 64
  %14 = getelementptr inbounds i8, i8* %7, i64 96
  %15 = bitcast i8* %14 to %struct.c_derived_tbl**
  store %struct.c_derived_tbl* null, %struct.c_derived_tbl** %15, align 8
  %16 = bitcast i8* %13 to %struct.c_derived_tbl**
  store %struct.c_derived_tbl* null, %struct.c_derived_tbl** %16, align 8
  %17 = bitcast i8* %12 to i64**
  store i64* null, i64** %17, align 8
  %18 = bitcast i8* %11 to i64**
  store i64* null, i64** %18, align 8
  %19 = getelementptr inbounds i8, i8* %7, i64 104
  %20 = bitcast i8* %19 to %struct.c_derived_tbl**
  store %struct.c_derived_tbl* null, %struct.c_derived_tbl** %20, align 8
  %21 = getelementptr inbounds i8, i8* %7, i64 72
  %22 = bitcast i8* %21 to %struct.c_derived_tbl**
  store %struct.c_derived_tbl* null, %struct.c_derived_tbl** %22, align 8
  %23 = getelementptr inbounds i8, i8* %7, i64 168
  %24 = bitcast i8* %23 to i64**
  store i64* null, i64** %24, align 8
  %25 = getelementptr inbounds i8, i8* %7, i64 136
  %26 = bitcast i8* %25 to i64**
  store i64* null, i64** %26, align 8
  %27 = getelementptr inbounds i8, i8* %7, i64 112
  %28 = bitcast i8* %27 to %struct.c_derived_tbl**
  store %struct.c_derived_tbl* null, %struct.c_derived_tbl** %28, align 8
  %29 = getelementptr inbounds i8, i8* %7, i64 80
  %30 = bitcast i8* %29 to %struct.c_derived_tbl**
  store %struct.c_derived_tbl* null, %struct.c_derived_tbl** %30, align 8
  %31 = getelementptr inbounds i8, i8* %7, i64 176
  %32 = bitcast i8* %31 to i64**
  store i64* null, i64** %32, align 8
  %33 = getelementptr inbounds i8, i8* %7, i64 144
  %34 = bitcast i8* %33 to i64**
  store i64* null, i64** %34, align 8
  %35 = getelementptr inbounds i8, i8* %7, i64 120
  %36 = bitcast i8* %35 to %struct.c_derived_tbl**
  store %struct.c_derived_tbl* null, %struct.c_derived_tbl** %36, align 8
  %37 = getelementptr inbounds i8, i8* %7, i64 88
  %38 = bitcast i8* %37 to %struct.c_derived_tbl**
  store %struct.c_derived_tbl* null, %struct.c_derived_tbl** %38, align 8
  %39 = getelementptr inbounds i8, i8* %7, i64 184
  %40 = bitcast i8* %39 to i64**
  store i64* null, i64** %40, align 8
  %41 = getelementptr inbounds i8, i8* %7, i64 152
  %42 = bitcast i8* %41 to i64**
  store i64* null, i64** %42, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_huff(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %4 = bitcast %struct.jpeg_entropy_encoder** %3 to %struct.huff_entropy_encoder**
  %5 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %4, align 8
  %6 = icmp eq i32 %1, 0
  %7 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 0, i32 1
  %encode_mcu_huff.sink = select i1 %6, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_huff, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_gather
  %finish_pass_huff.sink = select i1 %6, void (%struct.jpeg_compress_struct*)* @finish_pass_huff, void (%struct.jpeg_compress_struct*)* @finish_pass_gather
  store i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* %encode_mcu_huff.sink, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %7, align 8
  %8 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 0, i32 2
  store void (%struct.jpeg_compress_struct*)* %finish_pass_huff.sink, void (%struct.jpeg_compress_struct*)** %8, align 8
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %10 = load i32, i32* %9, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %12 = icmp eq i32 %1, 0
  br i1 %12, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  %13 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %14 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %16 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %17 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %19 = icmp eq i32 %1, 0
  %sunkaddr42 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr43 = add i64 %sunkaddr42, 316
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to i32*
  %20 = ptrtoint %struct.huff_entropy_encoder* %5 to i64
  %21 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr36 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr37 = add i64 %sunkaddr36, 8
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %22 = ptrtoint %struct.huff_entropy_encoder* %5 to i64
  %23 = ptrtoint %struct.huff_entropy_encoder* %5 to i64
  %24 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr39 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr40 = add i64 %sunkaddr39, 8
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %25 = ptrtoint %struct.huff_entropy_encoder* %5 to i64
  %26 = icmp eq i32 %1, 0
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  %27 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %28 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %30 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %31 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %33 = icmp eq i32 %1, 0
  %sunkaddr33 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr34 = add i64 %sunkaddr33, 316
  %sunkaddr35 = inttoptr i64 %sunkaddr34 to i32*
  %34 = ptrtoint %struct.huff_entropy_encoder* %5 to i64
  %35 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr28 = add i64 %sunkaddr, 8
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %36 = ptrtoint %struct.huff_entropy_encoder* %5 to i64
  %37 = ptrtoint %struct.huff_entropy_encoder* %5 to i64
  %38 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr30 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr31 = add i64 %sunkaddr30, 8
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %39 = ptrtoint %struct.huff_entropy_encoder* %5 to i64
  %40 = icmp eq i32 %1, 0
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %104
  %indvars.iv = phi i64 [ %indvars.iv.next, %104 ], [ 0, %.lr.ph.split.us.preheader ]
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv
  %42 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %41, align 8
  %43 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %42, i64 0, i32 5
  %44 = load i32, i32* %43, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %42, i64 0, i32 6
  %47 = load i32, i32* %46, align 8
  %48 = sext i32 %47 to i64
  %49 = sext i32 %47 to i64
  %50 = sext i32 %47 to i64
  %51 = icmp ugt i32 %44, 3
  br i1 %51, label %57, label %52

; <label>:52:                                     ; preds = %.lr.ph.split.us
  %53 = sext i32 %44 to i64
  %54 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %53
  %55 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %54, align 8
  %56 = icmp eq %struct.JHUFF_TBL* %55, null
  br i1 %56, label %57, label %64

; <label>:57:                                     ; preds = %52, %.lr.ph.split.us
  %58 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %59 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %58, i64 0, i32 5
  store i32 49, i32* %59, align 8
  %60 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %61 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %60, i64 0, i32 6, i32 0, i64 0
  store i32 %44, i32* %61, align 4
  %62 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %27, align 8
  %63 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %62, align 8
  tail call void %63(%struct.jpeg_common_struct* nonnull %28) #4
  br label %64

; <label>:64:                                     ; preds = %57, %52
  %65 = icmp ugt i32 %47, 3
  br i1 %65, label %70, label %66

; <label>:66:                                     ; preds = %64
  %67 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %50
  %68 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %67, align 8
  %69 = icmp eq %struct.JHUFF_TBL* %68, null
  %or.cond3.us = and i1 %40, %69
  br i1 %or.cond3.us, label %70, label %77

; <label>:70:                                     ; preds = %66, %64
  %71 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %72 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %71, i64 0, i32 5
  store i32 49, i32* %72, align 8
  %73 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %74 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %73, i64 0, i32 6, i32 0, i64 0
  store i32 %47, i32* %74, align 4
  %75 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %30, align 8
  %76 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %75, align 8
  tail call void %76(%struct.jpeg_common_struct* nonnull %31) #4
  br label %77

; <label>:77:                                     ; preds = %70, %66
  br i1 %33, label %97, label %78

; <label>:78:                                     ; preds = %77
  %79 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 6, i64 %45
  %80 = load i64*, i64** %79, align 8
  %81 = icmp eq i64* %80, null
  br i1 %81, label %82, label %86

; <label>:82:                                     ; preds = %78
  %83 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %sunkaddr29, align 8
  %84 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %83, align 8
  %85 = tail call i8* %84(%struct.jpeg_common_struct* nonnull %35, i32 1, i64 2056) #4
  %sunkaddr4.us = shl nsw i64 %45, 3
  %sunkaddr5.us = add i64 %34, %sunkaddr4.us
  %sunkaddr6.us = add i64 %sunkaddr5.us, 128
  %sunkaddr7.us = inttoptr i64 %sunkaddr6.us to i8**
  store i8* %85, i8** %sunkaddr7.us, align 8
  br label %86

; <label>:86:                                     ; preds = %82, %78
  %sunkaddr9.us = shl nsw i64 %45, 3
  %sunkaddr10.us = add i64 %36, %sunkaddr9.us
  %sunkaddr11.us = add i64 %sunkaddr10.us, 128
  %sunkaddr12.us = inttoptr i64 %sunkaddr11.us to i8**
  %87 = load i8*, i8** %sunkaddr12.us, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %87, i8 0, i64 2056, i32 1, i1 false)
  %88 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 7, i64 %49
  %89 = load i64*, i64** %88, align 8
  %90 = icmp eq i64* %89, null
  br i1 %90, label %91, label %95

; <label>:91:                                     ; preds = %86
  %92 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %sunkaddr32, align 8
  %93 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %92, align 8
  %94 = tail call i8* %93(%struct.jpeg_common_struct* nonnull %38, i32 1, i64 2056) #4
  %sunkaddr14.us = shl nsw i64 %49, 3
  %sunkaddr15.us = add i64 %37, %sunkaddr14.us
  %sunkaddr16.us = add i64 %sunkaddr15.us, 160
  %sunkaddr17.us = inttoptr i64 %sunkaddr16.us to i8**
  store i8* %94, i8** %sunkaddr17.us, align 8
  br label %95

; <label>:95:                                     ; preds = %91, %86
  %sunkaddr19.us = shl nsw i64 %49, 3
  %sunkaddr20.us = add i64 %39, %sunkaddr19.us
  %sunkaddr21.us = add i64 %sunkaddr20.us, 160
  %sunkaddr22.us = inttoptr i64 %sunkaddr21.us to i8**
  %96 = load i8*, i8** %sunkaddr22.us, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %96, i8 0, i64 2056, i32 1, i1 false)
  br label %104

; <label>:97:                                     ; preds = %77
  %98 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %45
  %99 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %98, align 8
  %100 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 4, i64 %45
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %99, %struct.c_derived_tbl** %100)
  %101 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %48
  %102 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %101, align 8
  %103 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 5, i64 %48
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %102, %struct.c_derived_tbl** %103)
  br label %104

; <label>:104:                                    ; preds = %97, %95
  %105 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 1, i32 2, i64 %indvars.iv
  store i32 0, i32* %105, align 4
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %106 = load i32, i32* %sunkaddr35, align 4
  %107 = sext i32 %106 to i64
  %108 = icmp slt i64 %indvars.iv.next, %107
  br i1 %108, label %.lr.ph.split.us, label %._crit_edge.loopexit

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %167
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %167 ], [ 0, %.lr.ph.split.preheader ]
  %109 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv25
  %110 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %109, align 8
  %111 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %110, i64 0, i32 5
  %112 = load i32, i32* %111, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %110, i64 0, i32 6
  %115 = load i32, i32* %114, align 8
  %116 = sext i32 %115 to i64
  %117 = sext i32 %115 to i64
  %118 = sext i32 %115 to i64
  %119 = icmp ugt i32 %112, 3
  br i1 %119, label %120, label %127

; <label>:120:                                    ; preds = %.lr.ph.split
  %121 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %122 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %121, i64 0, i32 5
  store i32 49, i32* %122, align 8
  %123 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %124 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %123, i64 0, i32 6, i32 0, i64 0
  store i32 %112, i32* %124, align 4
  %125 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %13, align 8
  %126 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %125, align 8
  tail call void %126(%struct.jpeg_common_struct* nonnull %14) #4
  br label %127

; <label>:127:                                    ; preds = %.lr.ph.split, %120
  %128 = icmp ugt i32 %115, 3
  br i1 %128, label %133, label %129

; <label>:129:                                    ; preds = %127
  %130 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %118
  %131 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %130, align 8
  %132 = icmp eq %struct.JHUFF_TBL* %131, null
  %or.cond3 = and i1 %26, %132
  br i1 %or.cond3, label %133, label %140

; <label>:133:                                    ; preds = %129, %127
  %134 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %135 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %134, i64 0, i32 5
  store i32 49, i32* %135, align 8
  %136 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %137 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 6, i32 0, i64 0
  store i32 %115, i32* %137, align 4
  %138 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %16, align 8
  %139 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %138, align 8
  tail call void %139(%struct.jpeg_common_struct* nonnull %17) #4
  br label %140

; <label>:140:                                    ; preds = %133, %129
  br i1 %19, label %160, label %141

; <label>:141:                                    ; preds = %140
  %142 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 6, i64 %113
  %143 = load i64*, i64** %142, align 8
  %144 = icmp eq i64* %143, null
  br i1 %144, label %145, label %149

; <label>:145:                                    ; preds = %141
  %146 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %sunkaddr38, align 8
  %147 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %146, align 8
  %148 = tail call i8* %147(%struct.jpeg_common_struct* nonnull %21, i32 1, i64 2056) #4
  %sunkaddr4 = shl nsw i64 %113, 3
  %sunkaddr5 = add i64 %20, %sunkaddr4
  %sunkaddr6 = add i64 %sunkaddr5, 128
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to i8**
  store i8* %148, i8** %sunkaddr7, align 8
  br label %149

; <label>:149:                                    ; preds = %145, %141
  %sunkaddr9 = shl nsw i64 %113, 3
  %sunkaddr10 = add i64 %22, %sunkaddr9
  %sunkaddr11 = add i64 %sunkaddr10, 128
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to i8**
  %150 = load i8*, i8** %sunkaddr12, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %150, i8 0, i64 2056, i32 1, i1 false)
  %151 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 7, i64 %117
  %152 = load i64*, i64** %151, align 8
  %153 = icmp eq i64* %152, null
  br i1 %153, label %154, label %158

; <label>:154:                                    ; preds = %149
  %155 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %sunkaddr41, align 8
  %156 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %155, align 8
  %157 = tail call i8* %156(%struct.jpeg_common_struct* nonnull %24, i32 1, i64 2056) #4
  %sunkaddr14 = shl nsw i64 %117, 3
  %sunkaddr15 = add i64 %23, %sunkaddr14
  %sunkaddr16 = add i64 %sunkaddr15, 160
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i8**
  store i8* %157, i8** %sunkaddr17, align 8
  br label %158

; <label>:158:                                    ; preds = %154, %149
  %sunkaddr19 = shl nsw i64 %117, 3
  %sunkaddr20 = add i64 %25, %sunkaddr19
  %sunkaddr21 = add i64 %sunkaddr20, 160
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i8**
  %159 = load i8*, i8** %sunkaddr22, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %159, i8 0, i64 2056, i32 1, i1 false)
  br label %167

; <label>:160:                                    ; preds = %140
  %161 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %113
  %162 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %161, align 8
  %163 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 4, i64 %113
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %162, %struct.c_derived_tbl** %163)
  %164 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %116
  %165 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %164, align 8
  %166 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 5, i64 %116
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %165, %struct.c_derived_tbl** %166)
  br label %167

; <label>:167:                                    ; preds = %160, %158
  %168 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 1, i32 2, i64 %indvars.iv25
  store i32 0, i32* %168, align 4
  %indvars.iv.next26 = add nuw i64 %indvars.iv25, 1
  %169 = load i32, i32* %sunkaddr44, align 4
  %170 = sext i32 %169 to i64
  %171 = icmp slt i64 %indvars.iv.next26, %170
  br i1 %171, label %.lr.ph.split, label %._crit_edge.loopexit46

._crit_edge.loopexit:                             ; preds = %104
  br label %._crit_edge

._crit_edge.loopexit46:                           ; preds = %167
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit46, %._crit_edge.loopexit, %2
  %172 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 1, i32 0
  store i64 0, i64* %172, align 8
  %173 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 1, i32 1
  store i32 0, i32* %173, align 8
  %174 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %175 = load i32, i32* %174, align 8
  %176 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 2
  store i32 %175, i32* %176, align 8
  %177 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 3
  store i32 0, i32* %177, align 4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal i32 @encode_mcu_gather(%struct.jpeg_compress_struct* nocapture readonly, [64 x i16]** nocapture readonly) #2 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %4 = bitcast %struct.jpeg_entropy_encoder** %3 to %struct.huff_entropy_encoder**
  %5 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %7 = load i32, i32* %6, align 8
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %.preheader, label %9

; <label>:9:                                      ; preds = %2
  %10 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 2
  %11 = load i32, i32* %10, align 8
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %.preheader10, label %21

.preheader10:                                     ; preds = %9
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %14 = load i32, i32* %13, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %.lr.ph13.preheader, label %._crit_edge14

.lr.ph13.preheader:                               ; preds = %.preheader10
  %sunkaddr17 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr18 = add i64 %sunkaddr17, 316
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to i32*
  br label %.lr.ph13

.lr.ph13:                                         ; preds = %.lr.ph13.preheader, %.lr.ph13
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %.lr.ph13 ], [ 0, %.lr.ph13.preheader ]
  %16 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 1, i32 2, i64 %indvars.iv15
  store i32 0, i32* %16, align 4
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %17 = load i32, i32* %sunkaddr19, align 4
  %18 = sext i32 %17 to i64
  %19 = icmp slt i64 %indvars.iv.next16, %18
  br i1 %19, label %.lr.ph13, label %._crit_edge14.loopexit

._crit_edge14.loopexit:                           ; preds = %.lr.ph13
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.preheader10
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr2 = add i64 %sunkaddr, 272
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to i32*
  %20 = load i32, i32* %sunkaddr3, align 8
  %sunkaddr4 = ptrtoint %struct.huff_entropy_encoder* %5 to i64
  %sunkaddr5 = add i64 %sunkaddr4, 56
  %sunkaddr6 = inttoptr i64 %sunkaddr5 to i32*
  store i32 %20, i32* %sunkaddr6, align 8
  br label %21

; <label>:21:                                     ; preds = %._crit_edge14, %9
  %sunkaddr7 = ptrtoint %struct.huff_entropy_encoder* %5 to i64
  %sunkaddr8 = add i64 %sunkaddr7, 56
  %sunkaddr9 = inttoptr i64 %sunkaddr8 to i32*
  %22 = load i32, i32* %sunkaddr9, align 8
  %23 = add i32 %22, -1
  store i32 %23, i32* %sunkaddr9, align 8
  br label %.preheader

.preheader:                                       ; preds = %2, %21
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 45
  %25 = load i32, i32* %24, align 8
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %sunkaddr20 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr21 = add i64 %sunkaddr20, 360
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 46, i64 %indvars.iv
  %28 = load i32, i32* %27, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %29
  %31 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %30, align 8
  %32 = getelementptr inbounds [64 x i16]*, [64 x i16]** %1, i64 %indvars.iv
  %33 = bitcast [64 x i16]** %32 to i16**
  %34 = load i16*, i16** %33, align 8
  %35 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 1, i32 2, i64 %29
  %36 = load i32, i32* %35, align 4
  %37 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %31, i64 0, i32 5
  %38 = load i32, i32* %37, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 6, i64 %39
  %41 = load i64*, i64** %40, align 8
  %42 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %31, i64 0, i32 6
  %43 = load i32, i32* %42, align 8
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %5, i64 0, i32 7, i64 %44
  %46 = load i64*, i64** %45, align 8
  tail call fastcc void @htest_one_block(i16* %34, i32 %36, i64* %41, i64* %46)
  %47 = bitcast [64 x i16]** %32 to i16**
  %48 = load i16*, i16** %47, align 8
  %49 = load i16, i16* %48, align 2
  %50 = sext i16 %49 to i32
  store i32 %50, i32* %35, align 4
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %51 = load i32, i32* %sunkaddr22, align 8
  %52 = sext i32 %51 to i64
  %53 = icmp slt i64 %indvars.iv.next, %52
  br i1 %53, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
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
  br i1 %11, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %1
  %12 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %13 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %14 = ptrtoint [4 x i32]* %2 to i64
  %15 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %16 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %17 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %18 = ptrtoint [4 x i32]* %3 to i64
  %19 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr29 = add i64 %sunkaddr, 316
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %55
  %indvars.iv = phi i64 [ %indvars.iv.next, %55 ], [ 0, %.lr.ph.preheader ]
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv
  %21 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %21, i64 0, i32 5
  %23 = load i32, i32* %22, align 4
  %24 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %21, i64 0, i32 6
  %25 = load i32, i32* %24, align 8
  %26 = sext i32 %25 to i64
  %27 = sext i32 %23 to i64
  %28 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 %27
  %29 = load i32, i32* %28, align 4
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %41

; <label>:31:                                     ; preds = %.lr.ph
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %27
  %33 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %32, align 8
  %34 = icmp eq %struct.JHUFF_TBL* %33, null
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %31
  %36 = tail call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* nonnull %13) #4
  %sunkaddr1 = shl nsw i64 %27, 3
  %sunkaddr2 = add i64 %12, %sunkaddr1
  %sunkaddr3 = add i64 %sunkaddr2, 120
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to %struct.JHUFF_TBL**
  store %struct.JHUFF_TBL* %36, %struct.JHUFF_TBL** %sunkaddr4, align 8
  br label %37

; <label>:37:                                     ; preds = %35, %31
  %sunkaddr6 = shl nsw i64 %27, 3
  %sunkaddr7 = add i64 %15, %sunkaddr6
  %sunkaddr8 = add i64 %sunkaddr7, 120
  %sunkaddr9 = inttoptr i64 %sunkaddr8 to %struct.JHUFF_TBL**
  %38 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %sunkaddr9, align 8
  %39 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 6, i64 %27
  %40 = load i64*, i64** %39, align 8
  tail call void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %38, i64* %40)
  %sunkaddr11 = shl nsw i64 %27, 2
  %sunkaddr12 = add i64 %14, %sunkaddr11
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to i32*
  store i32 1, i32* %sunkaddr13, align 4
  br label %41

; <label>:41:                                     ; preds = %.lr.ph, %37
  %42 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 %26
  %43 = load i32, i32* %42, align 4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %55

; <label>:45:                                     ; preds = %41
  %46 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %26
  %47 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %46, align 8
  %48 = icmp eq %struct.JHUFF_TBL* %47, null
  br i1 %48, label %49, label %51

; <label>:49:                                     ; preds = %45
  %50 = tail call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* nonnull %17) #4
  %sunkaddr15 = shl nsw i64 %26, 3
  %sunkaddr16 = add i64 %16, %sunkaddr15
  %sunkaddr17 = add i64 %sunkaddr16, 152
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to %struct.JHUFF_TBL**
  store %struct.JHUFF_TBL* %50, %struct.JHUFF_TBL** %sunkaddr18, align 8
  br label %51

; <label>:51:                                     ; preds = %49, %45
  %sunkaddr20 = shl nsw i64 %26, 3
  %sunkaddr21 = add i64 %19, %sunkaddr20
  %sunkaddr22 = add i64 %sunkaddr21, 152
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to %struct.JHUFF_TBL**
  %52 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %sunkaddr23, align 8
  %53 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 7, i64 %26
  %54 = load i64*, i64** %53, align 8
  tail call void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %52, i64* %54)
  %sunkaddr25 = shl nsw i64 %26, 2
  %sunkaddr26 = add i64 %18, %sunkaddr25
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to i32*
  store i32 1, i32* %sunkaddr27, align 4
  br label %55

; <label>:55:                                     ; preds = %51, %41
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %56 = load i32, i32* %sunkaddr30, align 4
  %57 = sext i32 %56 to i64
  %58 = icmp slt i64 %indvars.iv.next, %57
  br i1 %58, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %55
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @encode_mcu_huff(%struct.jpeg_compress_struct*, [64 x i16]** nocapture readonly) #0 {
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
  %16 = getelementptr inbounds %struct.working_state, %struct.working_state* %3, i64 0, i32 3
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %16, align 16
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %18 = load i32, i32* %17, align 8
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %.preheader, label %20

; <label>:20:                                     ; preds = %2
  %21 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 2
  %22 = load i32, i32* %21, align 8
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %.preheader

; <label>:24:                                     ; preds = %20
  %25 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 3
  %26 = load i32, i32* %25, align 4
  %27 = call fastcc i32 @emit_restart(%struct.working_state* nonnull %3, i32 %26)
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %20, %24, %2
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 45
  %30 = load i32, i32* %29, align 8
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %32 = ptrtoint %struct.working_state* %3 to i64
  %33 = ptrtoint [64 x i16]** %1 to i64
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr29 = add i64 %sunkaddr, 360
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %56
  %indvars.iv = phi i64 [ %indvars.iv.next, %56 ], [ 0, %.lr.ph.preheader ]
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 46, i64 %indvars.iv
  %35 = load i32, i32* %34, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %36
  %38 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %37, align 8
  %39 = getelementptr inbounds [64 x i16]*, [64 x i16]** %1, i64 %indvars.iv
  %40 = bitcast [64 x i16]** %39 to i16**
  %41 = load i16*, i16** %40, align 8
  %42 = getelementptr inbounds %struct.working_state, %struct.working_state* %3, i64 0, i32 2, i32 2, i64 %36
  %43 = load i32, i32* %42, align 4
  %44 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %38, i64 0, i32 5
  %45 = load i32, i32* %44, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 4, i64 %46
  %48 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %38, i64 0, i32 6
  %50 = load i32, i32* %49, align 8
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 5, i64 %51
  %53 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %52, align 8
  %54 = call fastcc i32 @encode_one_block(%struct.working_state* nonnull %3, i16* %41, i32 %43, %struct.c_derived_tbl* %48, %struct.c_derived_tbl* %53)
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %.loopexit.loopexit, label %56

; <label>:56:                                     ; preds = %.lr.ph
  %sunkaddr2 = shl nsw i64 %indvars.iv, 3
  %sunkaddr3 = add i64 %33, %sunkaddr2
  %57 = inttoptr i64 %sunkaddr3 to i16**
  %58 = load i16*, i16** %57, align 8
  %59 = load i16, i16* %58, align 2
  %60 = sext i16 %59 to i32
  %sunkaddr6 = shl nsw i64 %36, 2
  %sunkaddr7 = add i64 %32, %sunkaddr6
  %sunkaddr8 = add i64 %sunkaddr7, 28
  %sunkaddr9 = inttoptr i64 %sunkaddr8 to i32*
  store i32 %60, i32* %sunkaddr9, align 4
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %61 = load i32, i32* %sunkaddr30, align 8
  %62 = sext i32 %61 to i64
  %63 = icmp slt i64 %indvars.iv.next, %62
  br i1 %63, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %56
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %64 = bitcast %struct.savable_state* %13 to i8*
  %65 = bitcast %struct.savable_state* %12 to i8*
  %66 = bitcast %struct.working_state* %3 to i64*
  %67 = load i64, i64* %66, align 16
  %sunkaddr10 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr11 = add i64 %sunkaddr10, 32
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to i64**
  %68 = load i64*, i64** %sunkaddr12, align 8
  store i64 %67, i64* %68, align 8
  %sunkaddr13 = ptrtoint %struct.working_state* %3 to i64
  %sunkaddr14 = or i64 %sunkaddr13, 8
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i64*
  %69 = load i64, i64* %sunkaddr15, align 8
  %sunkaddr16 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr17 = add i64 %sunkaddr16, 32
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to %struct.jpeg_destination_mgr**
  %70 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %sunkaddr18, align 8
  %71 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %70, i64 0, i32 1
  store i64 %69, i64* %71, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %64, i8* %65, i64 32, i32 8, i1 false)
  %sunkaddr19 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr20 = add i64 %sunkaddr19, 272
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to i32*
  %72 = load i32, i32* %sunkaddr21, align 8
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %.loopexit, label %74

; <label>:74:                                     ; preds = %._crit_edge
  %75 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 2
  %76 = load i32, i32* %75, align 8
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %83

; <label>:78:                                     ; preds = %74
  %sunkaddr22 = ptrtoint %struct.huff_entropy_encoder* %6 to i64
  %sunkaddr23 = add i64 %sunkaddr22, 56
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to i32*
  store i32 %72, i32* %sunkaddr24, align 8
  %79 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %6, i64 0, i32 3
  %80 = load i32, i32* %79, align 4
  %81 = add nsw i32 %80, 1
  %82 = and i32 %81, 7
  store i32 %82, i32* %79, align 4
  br label %83

; <label>:83:                                     ; preds = %78, %74
  %sunkaddr25 = ptrtoint %struct.huff_entropy_encoder* %6 to i64
  %sunkaddr26 = add i64 %sunkaddr25, 56
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to i32*
  %84 = load i32, i32* %sunkaddr27, align 8
  %85 = add i32 %84, -1
  store i32 %85, i32* %sunkaddr27, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %83, %._crit_edge, %24
  %.0 = phi i32 [ 0, %24 ], [ 1, %._crit_edge ], [ 1, %83 ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
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
  %15 = getelementptr inbounds %struct.working_state, %struct.working_state* %2, i64 0, i32 3
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %15, align 16
  %16 = call fastcc i32 @flush_bits(%struct.working_state* nonnull %2)
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %26

; <label>:18:                                     ; preds = %1
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 5
  store i32 22, i32* %21, align 8
  %22 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %23 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %22, align 8
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  %25 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %24(%struct.jpeg_common_struct* %25) #4
  br label %26

; <label>:26:                                     ; preds = %1, %18
  %27 = bitcast %struct.savable_state* %12 to i8*
  %28 = bitcast %struct.savable_state* %11 to i8*
  %29 = bitcast %struct.working_state* %2 to i64*
  %30 = load i64, i64* %29, align 16
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr1 = add i64 %sunkaddr, 32
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i64**
  %31 = load i64*, i64** %sunkaddr2, align 8
  store i64 %30, i64* %31, align 8
  %sunkaddr3 = ptrtoint %struct.working_state* %2 to i64
  %sunkaddr4 = or i64 %sunkaddr3, 8
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i64*
  %32 = load i64, i64* %sunkaddr5, align 8
  %sunkaddr6 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 32
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to %struct.jpeg_destination_mgr**
  %33 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %sunkaddr8, align 8
  %34 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %33, i64 0, i32 1
  store i64 %32, i64* %34, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %27, i8* %28, i64 32, i32 8, i1 false)
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @htest_one_block(i16* nocapture readonly, i32, i64* nocapture, i64* nocapture) unnamed_addr #2 {
  %5 = load i16, i16* %0, align 2
  %6 = sext i16 %5 to i32
  %7 = sub nsw i32 %6, %1
  %8 = icmp slt i32 %7, 0
  %9 = sub nsw i32 0, %7
  %. = select i1 %8, i32 %9, i32 %7
  %10 = icmp eq i32 %., 0
  br i1 %10, label %._crit_edge15, label %.lr.ph14.preheader

.lr.ph14.preheader:                               ; preds = %4
  br label %.lr.ph14

.lr.ph14:                                         ; preds = %.lr.ph14.preheader, %.lr.ph14
  %.0212 = phi i32 [ %11, %.lr.ph14 ], [ 0, %.lr.ph14.preheader ]
  %.1511 = phi i32 [ %12, %.lr.ph14 ], [ %., %.lr.ph14.preheader ]
  %11 = add nuw nsw i32 %.0212, 1
  %12 = ashr i32 %.1511, 1
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %._crit_edge15.loopexit, label %.lr.ph14

._crit_edge15.loopexit:                           ; preds = %.lr.ph14
  %phitmp = sext i32 %11 to i64
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %4
  %.02.lcssa = phi i64 [ 0, %4 ], [ %phitmp, %._crit_edge15.loopexit ]
  %14 = getelementptr inbounds i64, i64* %2, i64 %.02.lcssa
  %15 = load i64, i64* %14, align 8
  %16 = add nsw i64 %15, 1
  store i64 %16, i64* %14, align 8
  %sunkaddr = ptrtoint i64* %3 to i64
  %sunkaddr19 = add i64 %sunkaddr, 1920
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i64*
  br label %17

; <label>:17:                                     ; preds = %49, %._crit_edge15
  %indvars.iv = phi i64 [ 1, %._crit_edge15 ], [ %indvars.iv.next, %49 ]
  %.010 = phi i32 [ 0, %._crit_edge15 ], [ %.2, %49 ]
  %18 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv
  %19 = load i32, i32* %18, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i16, i16* %0, i64 %20
  %22 = load i16, i16* %21, align 2
  %23 = sext i16 %22 to i32
  %24 = icmp eq i16 %22, 0
  br i1 %24, label %26, label %.preheader

.preheader:                                       ; preds = %17
  %25 = icmp sgt i32 %.010, 15
  br i1 %25, label %._crit_edge, label %35

; <label>:26:                                     ; preds = %17
  %27 = add nsw i32 %.010, 1
  br label %49

._crit_edge:                                      ; preds = %.preheader
  %28 = add i32 %.010, -16
  %29 = lshr i32 %28, 4
  %30 = shl nuw i32 %29, 4
  %31 = zext i32 %29 to i64
  %.promoted = load i64, i64* %sunkaddr20, align 8
  %32 = add i64 %.promoted, 1
  %33 = add i64 %32, %31
  %34 = sub i32 %28, %30
  store i64 %33, i64* %sunkaddr20, align 8
  br label %35

; <label>:35:                                     ; preds = %._crit_edge, %.preheader
  %.1.lcssa = phi i32 [ %34, %._crit_edge ], [ %.010, %.preheader ]
  %36 = icmp slt i16 %22, 0
  %37 = sub nsw i32 0, %23
  %.7 = select i1 %36, i32 %37, i32 %23
  br label %38

; <label>:38:                                     ; preds = %38, %35
  %.3 = phi i32 [ %.7, %35 ], [ %39, %38 ]
  %.13 = phi i32 [ 1, %35 ], [ %41, %38 ]
  %39 = ashr i32 %.3, 1
  %40 = icmp eq i32 %39, 0
  %41 = add nuw nsw i32 %.13, 1
  br i1 %40, label %42, label %38

; <label>:42:                                     ; preds = %38
  %43 = shl i32 %.1.lcssa, 4
  %44 = add nsw i32 %.13, %43
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i64, i64* %3, i64 %45
  %47 = load i64, i64* %46, align 8
  %48 = add nsw i64 %47, 1
  store i64 %48, i64* %46, align 8
  br label %49

; <label>:49:                                     ; preds = %26, %42
  %.2 = phi i32 [ %27, %26 ], [ 0, %42 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 64
  br i1 %exitcond, label %50, label %17

; <label>:50:                                     ; preds = %49
  %51 = icmp sgt i32 %.2, 0
  br i1 %51, label %52, label %55

; <label>:52:                                     ; preds = %50
  %53 = load i64, i64* %3, align 8
  %54 = add nsw i64 %53, 1
  store i64 %54, i64* %3, align 8
  br label %55

; <label>:55:                                     ; preds = %52, %50
  ret void
}

declare %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct*) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @emit_restart(%struct.working_state* nocapture, i32) unnamed_addr #0 {
  %3 = tail call fastcc i32 @flush_bits(%struct.working_state* %0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %.loopexit, label %5

; <label>:5:                                      ; preds = %2
  %6 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 0
  %7 = load i8*, i8** %6, align 8
  %8 = getelementptr inbounds i8, i8* %7, i64 1
  store i8* %8, i8** %6, align 8
  store i8 -1, i8* %7, align 1
  %9 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 1
  %10 = load i64, i64* %9, align 8
  %11 = add i64 %10, -1
  store i64 %11, i64* %9, align 8
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %5
  %14 = tail call fastcc i32 @dump_buffer(%struct.working_state* nonnull %0)
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %.loopexit, label %16

; <label>:16:                                     ; preds = %13, %5
  %17 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 0
  %18 = add nsw i32 %1, 208
  %19 = trunc i32 %18 to i8
  %20 = load i8*, i8** %17, align 8
  %21 = getelementptr inbounds i8, i8* %20, i64 1
  store i8* %21, i8** %17, align 8
  store i8 %19, i8* %20, align 1
  %sunkaddr = ptrtoint %struct.working_state* %0 to i64
  %sunkaddr2 = add i64 %sunkaddr, 8
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to i64*
  %22 = load i64, i64* %sunkaddr3, align 8
  %23 = add i64 %22, -1
  store i64 %23, i64* %sunkaddr3, align 8
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %25, label %.preheader

; <label>:25:                                     ; preds = %16
  %26 = tail call fastcc i32 @dump_buffer(%struct.working_state* nonnull %0)
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %25, %16
  %28 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 3
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %28, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i64 0, i32 41
  %31 = load i32, i32* %30, align 4
  %32 = icmp sgt i32 %31, 0
  br i1 %32, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.preheader
  %sunkaddr5 = ptrtoint %struct.working_state* %0 to i64
  %sunkaddr6 = add i64 %sunkaddr5, 48
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to %struct.jpeg_compress_struct**
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %33 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 2, i32 2, i64 %indvars.iv
  store i32 0, i32* %33, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %sunkaddr7, align 8
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %34, i64 0, i32 41
  %36 = load i32, i32* %35, align 4
  %37 = sext i32 %36 to i64
  %38 = icmp slt i64 %indvars.iv.next, %37
  br i1 %38, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %25, %13, %2
  %.0 = phi i32 [ 0, %2 ], [ 0, %13 ], [ 0, %25 ], [ 1, %.preheader ], [ 1, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @encode_one_block(%struct.working_state* nocapture, i16* nocapture readonly, i32, %struct.c_derived_tbl* nocapture readonly, %struct.c_derived_tbl* nocapture readonly) unnamed_addr #0 {
  %6 = load i16, i16* %1, align 2
  %7 = sext i16 %6 to i32
  %8 = sub nsw i32 %7, %2
  %9 = icmp slt i32 %8, 0
  %10 = sub nsw i32 0, %8
  %.07 = select i1 %9, i32 %10, i32 %8
  %.lobit = ashr i32 %8, 31
  %.05 = add nsw i32 %.lobit, %8
  %11 = icmp eq i32 %.07, 0
  br i1 %11, label %._crit_edge23, label %.lr.ph22.preheader

.lr.ph22.preheader:                               ; preds = %5
  br label %.lr.ph22

.lr.ph22:                                         ; preds = %.lr.ph22.preheader, %.lr.ph22
  %.0320 = phi i32 [ %12, %.lr.ph22 ], [ 0, %.lr.ph22.preheader ]
  %.1819 = phi i32 [ %13, %.lr.ph22 ], [ %.07, %.lr.ph22.preheader ]
  %12 = add nuw nsw i32 %.0320, 1
  %13 = ashr i32 %.1819, 1
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %._crit_edge23.loopexit, label %.lr.ph22

._crit_edge23.loopexit:                           ; preds = %.lr.ph22
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %5
  %.03.lcssa = phi i32 [ 0, %5 ], [ %12, %._crit_edge23.loopexit ]
  %15 = sext i32 %.03.lcssa to i64
  %16 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %3, i64 0, i32 0, i64 %15
  %17 = load i32, i32* %16, align 4
  %18 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %3, i64 0, i32 1, i64 %15
  %19 = load i8, i8* %18, align 1
  %20 = sext i8 %19 to i32
  %21 = tail call fastcc i32 @emit_bits(%struct.working_state* %0, i32 %17, i32 %20)
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %.loopexit, label %23

; <label>:23:                                     ; preds = %._crit_edge23
  %24 = icmp eq i32 %.03.lcssa, 0
  br i1 %24, label %.preheader11.preheader, label %25

; <label>:25:                                     ; preds = %23
  %26 = tail call fastcc i32 @emit_bits(%struct.working_state* %0, i32 %.05, i32 %.03.lcssa)
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %.loopexit, label %.preheader11.preheader

.preheader11.preheader:                           ; preds = %25, %23
  %sunkaddr = ptrtoint %struct.c_derived_tbl* %4 to i64
  %sunkaddr29 = add i64 %sunkaddr, 960
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i32*
  %sunkaddr31 = ptrtoint %struct.c_derived_tbl* %4 to i64
  %sunkaddr32 = add i64 %sunkaddr31, 1264
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to i8*
  br label %.preheader11

.preheader11:                                     ; preds = %.preheader11.preheader, %67
  %indvars.iv = phi i64 [ %indvars.iv.next, %67 ], [ 1, %.preheader11.preheader ]
  %.0118 = phi i32 [ %.2, %67 ], [ 0, %.preheader11.preheader ]
  %28 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv
  %29 = load i32, i32* %28, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i16, i16* %1, i64 %30
  %32 = load i16, i16* %31, align 2
  %33 = sext i16 %32 to i32
  %34 = icmp eq i16 %32, 0
  br i1 %34, label %36, label %.preheader

.preheader:                                       ; preds = %.preheader11
  %35 = icmp sgt i32 %.0118, 15
  br i1 %35, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

; <label>:36:                                     ; preds = %.preheader11
  %37 = add nsw i32 %.0118, 1
  br label %67

.lr.ph:                                           ; preds = %.lr.ph.preheader, %43
  %.116 = phi i32 [ %44, %43 ], [ %.0118, %.lr.ph.preheader ]
  %38 = load i32, i32* %sunkaddr30, align 4
  %39 = load i8, i8* %sunkaddr33, align 4
  %40 = sext i8 %39 to i32
  %41 = tail call fastcc i32 @emit_bits(%struct.working_state* %0, i32 %38, i32 %40)
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %.loopexit.loopexit, label %43

; <label>:43:                                     ; preds = %.lr.ph
  %44 = add nsw i32 %.116, -16
  %45 = icmp sgt i32 %44, 15
  br i1 %45, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %43
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.1.lcssa = phi i32 [ %.0118, %.preheader ], [ %44, %._crit_edge.loopexit ]
  %46 = icmp slt i16 %32, 0
  %47 = sub nsw i32 0, %33
  %.29 = select i1 %46, i32 %47, i32 %33
  %.lobit10 = ashr i16 %32, 15
  %48 = sext i16 %.lobit10 to i32
  br label %49

; <label>:49:                                     ; preds = %49, %._crit_edge
  %.3 = phi i32 [ %50, %49 ], [ %.29, %._crit_edge ]
  %.14 = phi i32 [ %52, %49 ], [ 1, %._crit_edge ]
  %50 = ashr i32 %.3, 1
  %51 = icmp eq i32 %50, 0
  %52 = add nuw nsw i32 %.14, 1
  br i1 %51, label %53, label %49

; <label>:53:                                     ; preds = %49
  %54 = shl i32 %.1.lcssa, 4
  %55 = add nsw i32 %.14, %54
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %4, i64 0, i32 0, i64 %56
  %58 = load i32, i32* %57, align 4
  %59 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %4, i64 0, i32 1, i64 %56
  %60 = load i8, i8* %59, align 1
  %61 = sext i8 %60 to i32
  %62 = tail call fastcc i32 @emit_bits(%struct.working_state* %0, i32 %58, i32 %61)
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %.loopexit.loopexit36, label %64

; <label>:64:                                     ; preds = %53
  %.16 = add nsw i32 %48, %33
  %65 = tail call fastcc i32 @emit_bits(%struct.working_state* %0, i32 %.16, i32 %.14)
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %.loopexit.loopexit36, label %67

; <label>:67:                                     ; preds = %36, %64
  %.2 = phi i32 [ %37, %36 ], [ 0, %64 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %68 = icmp slt i64 %indvars.iv.next, 64
  br i1 %68, label %.preheader11, label %69

; <label>:69:                                     ; preds = %67
  %70 = icmp sgt i32 %.2, 0
  br i1 %70, label %71, label %79

; <label>:71:                                     ; preds = %69
  %72 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %4, i64 0, i32 0, i64 0
  %73 = load i32, i32* %72, align 4
  %74 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %4, i64 0, i32 1, i64 0
  %75 = load i8, i8* %74, align 4
  %76 = sext i8 %75 to i32
  %77 = tail call fastcc i32 @emit_bits(%struct.working_state* %0, i32 %73, i32 %76)
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %.loopexit, label %79

; <label>:79:                                     ; preds = %71, %69
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit.loopexit36:                             ; preds = %53, %64
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit36, %.loopexit.loopexit, %71, %25, %._crit_edge23, %79
  %.0 = phi i32 [ 1, %79 ], [ 0, %._crit_edge23 ], [ 0, %25 ], [ 0, %71 ], [ 0, %.loopexit.loopexit ], [ 0, %.loopexit.loopexit36 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @flush_bits(%struct.working_state* nocapture) unnamed_addr #0 {
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
  %.0 = phi i32 [ 1, %4 ], [ 0, %1 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @dump_buffer(%struct.working_state* nocapture) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 3
  %3 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %3, i64 0, i32 5
  %5 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %5, i64 0, i32 3
  %7 = load i32 (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)** %6, align 8
  %8 = tail call i32 %7(%struct.jpeg_compress_struct* %3) #4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %17, label %10

; <label>:10:                                     ; preds = %1
  %11 = bitcast %struct.jpeg_destination_mgr* %5 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = bitcast %struct.working_state* %0 to i64*
  store i64 %12, i64* %13, align 8
  %14 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %5, i64 0, i32 1
  %15 = load i64, i64* %14, align 8
  %16 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 1
  store i64 %15, i64* %16, align 8
  br label %17

; <label>:17:                                     ; preds = %1, %10
  %.0 = phi i32 [ 1, %10 ], [ 0, %1 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @emit_bits(%struct.working_state* nocapture, i32, i32) unnamed_addr #0 {
  %4 = zext i32 %1 to i64
  %5 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 2, i32 1
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %2, 0
  br i1 %7, label %8, label %18

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 3
  %10 = bitcast %struct.jpeg_compress_struct** %9 to %struct.jpeg_error_mgr***
  %11 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %10, align 8
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 5
  store i32 39, i32* %13, align 8
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %9, align 8
  %15 = bitcast %struct.jpeg_compress_struct* %14 to void (%struct.jpeg_common_struct*)***
  %16 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %15, align 8
  %17 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %16, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %14 to %struct.jpeg_common_struct*
  tail call void %17(%struct.jpeg_common_struct* %.cast) #4
  br label %18

; <label>:18:                                     ; preds = %8, %3
  %19 = zext i32 %2 to i64
  %20 = shl i64 1, %19
  %21 = add i64 %20, 4294967295
  %22 = and i64 %21, %4
  %23 = add nsw i32 %6, %2
  %24 = sub nsw i32 24, %23
  %25 = zext i32 %24 to i64
  %26 = shl i64 %22, %25
  %27 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 2, i32 0
  %28 = load i64, i64* %27, align 8
  %29 = or i64 %28, %26
  %30 = icmp sgt i32 %23, 7
  br i1 %30, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %18
  %31 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 0
  %sunkaddr18 = ptrtoint %struct.working_state* %0 to i64
  %sunkaddr19 = add i64 %sunkaddr18, 8
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i64*
  %32 = getelementptr inbounds %struct.working_state, %struct.working_state* %0, i64 0, i32 0
  %sunkaddr21 = ptrtoint %struct.working_state* %0 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 8
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i64*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %55
  %.0114 = phi i32 [ %57, %55 ], [ %23, %.lr.ph.preheader ]
  %.0213 = phi i64 [ %56, %55 ], [ %29, %.lr.ph.preheader ]
  %33 = lshr i64 %.0213, 16
  %34 = trunc i64 %33 to i8
  %35 = load i8*, i8** %31, align 8
  %36 = getelementptr inbounds i8, i8* %35, i64 1
  store i8* %36, i8** %31, align 8
  store i8 %34, i8* %35, align 1
  %37 = load i64, i64* %sunkaddr20, align 8
  %38 = add i64 %37, -1
  store i64 %38, i64* %sunkaddr20, align 8
  %39 = icmp eq i64 %38, 0
  br i1 %39, label %40, label %43

; <label>:40:                                     ; preds = %.lr.ph
  %41 = tail call fastcc i32 @dump_buffer(%struct.working_state* nonnull %0)
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %.loopexit.loopexit, label %43

; <label>:43:                                     ; preds = %40, %.lr.ph
  %44 = and i64 %33, 255
  %45 = icmp eq i64 %44, 255
  br i1 %45, label %46, label %55

; <label>:46:                                     ; preds = %43
  %47 = load i8*, i8** %32, align 8
  %48 = getelementptr inbounds i8, i8* %47, i64 1
  store i8* %48, i8** %32, align 8
  store i8 0, i8* %47, align 1
  %49 = load i64, i64* %sunkaddr23, align 8
  %50 = add i64 %49, -1
  store i64 %50, i64* %sunkaddr23, align 8
  %51 = icmp eq i64 %50, 0
  br i1 %51, label %52, label %55

; <label>:52:                                     ; preds = %46
  %53 = tail call fastcc i32 @dump_buffer(%struct.working_state* nonnull %0)
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %.loopexit.loopexit, label %55

; <label>:55:                                     ; preds = %46, %52, %43
  %56 = shl i64 %.0213, 8
  %57 = add nsw i32 %.0114, -8
  %58 = icmp sgt i32 %57, 7
  br i1 %58, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %55
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %18
  %.02.lcssa = phi i64 [ %29, %18 ], [ %56, %._crit_edge.loopexit ]
  %.01.lcssa = phi i32 [ %23, %18 ], [ %57, %._crit_edge.loopexit ]
  %sunkaddr5 = ptrtoint %struct.working_state* %0 to i64
  %sunkaddr6 = add i64 %sunkaddr5, 16
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to i64*
  store i64 %.02.lcssa, i64* %sunkaddr7, align 8
  %sunkaddr8 = ptrtoint %struct.working_state* %0 to i64
  %sunkaddr9 = add i64 %sunkaddr8, 24
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to i32*
  store i32 %.01.lcssa, i32* %sunkaddr10, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %40, %52
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}

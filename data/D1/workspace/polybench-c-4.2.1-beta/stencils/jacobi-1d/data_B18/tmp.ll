; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %12)
  br label %13

; <label>:13:                                     ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %4 = sext i32 %0 to i64
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %6 = sitofp i32 %0 to double
  %min.iters.check = icmp eq i32 %0, 1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  %n.vec = and i64 %4, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %1, i64 %4
  %scevgep3 = getelementptr double, double* %2, i64 %4
  %bound0 = icmp ugt double* %scevgep3, %1
  %bound1 = icmp ugt double* %scevgep, %2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %6, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind5 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next6, %vector.body ]
  %7 = sitofp <2 x i32> %vec.ind5 to <2 x double>
  %8 = fadd <2 x double> %7, <double 2.000000e+00, double 2.000000e+00>
  %9 = fdiv <2 x double> %8, %broadcast.splat
  %10 = getelementptr inbounds double, double* %1, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> %9, <2 x double>* %11, align 8, !alias.scope !1, !noalias !4
  %12 = fadd <2 x double> %7, <double 3.000000e+00, double 3.000000e+00>
  %13 = fdiv <2 x double> %12, %broadcast.splat
  %14 = getelementptr inbounds double, double* %2, i64 %index
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> %13, <2 x double>* %15, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next6 = add <2 x i32> %vec.ind5, <i32 2, i32 2>
  %16 = icmp eq i64 %index.next, %n.vec
  br i1 %16, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %4, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph
  %indvars.iv1.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv1.ph, %scalar.ph.preheader ]
  %17 = trunc i64 %indvars.iv1 to i32
  %18 = sitofp i32 %17 to double
  %19 = fadd double %18, 2.000000e+00
  %20 = fdiv double %19, %6
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  store double %20, double* %21, align 8
  %22 = fadd double %18, 3.000000e+00
  %23 = fdiv double %22, %6
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv1
  store double %23, double* %24, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %4
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %5 = add i32 %1, -1
  %6 = sext i32 %5 to i64
  %7 = icmp sgt i32 %0, 0
  %8 = icmp sgt i32 %5, 1
  %or.cond = and i1 %7, %8
  br i1 %or.cond, label %.preheader2.preheader.us.preheader, label %._crit_edge

.preheader2.preheader.us.preheader:               ; preds = %4
  %9 = add nsw i64 %6, -1
  %10 = add nsw i64 %6, -2
  %xtraiter = and i64 %9, 1
  %xtraiter27 = and i64 %9, 1
  %11 = add nsw i64 %6, -2
  %scevgep51 = getelementptr double, double* %2, i64 2
  %12 = add nsw i64 %6, -2
  %scevgep54 = getelementptr double, double* %3, i64 -1
  %scevgep57 = getelementptr double, double* %3, i64 3
  %13 = add nsw i64 %6, -2
  %scevgep78 = getelementptr double, double* %3, i64 2
  %14 = add nsw i64 %6, -2
  %scevgep81 = getelementptr double, double* %2, i64 -1
  %scevgep84 = getelementptr double, double* %2, i64 3
  %15 = icmp eq i64 %xtraiter, 0
  %16 = icmp eq i64 %10, 0
  %17 = icmp eq i64 %xtraiter27, 0
  %18 = icmp eq i64 %10, 0
  %sunkaddr41 = ptrtoint double* %3 to i64
  %sunkaddr42 = add i64 %sunkaddr41, 8
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to double*
  %sunkaddr44 = ptrtoint double* %3 to i64
  %sunkaddr45 = add i64 %sunkaddr44, 16
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to double*
  %sunkaddr47 = ptrtoint double* %2 to i64
  %sunkaddr48 = add i64 %sunkaddr47, 8
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to double*
  %sunkaddr = ptrtoint double* %2 to i64
  %sunkaddr33 = add i64 %sunkaddr, 8
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to double*
  %sunkaddr35 = ptrtoint double* %2 to i64
  %sunkaddr36 = add i64 %sunkaddr35, 16
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to double*
  %sunkaddr38 = ptrtoint double* %3 to i64
  %sunkaddr39 = add i64 %sunkaddr38, 8
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to double*
  br label %.preheader2.preheader.us

.preheader2.preheader.us:                         ; preds = %.preheader._crit_edge.us, %.preheader2.preheader.us.preheader
  %.018.us = phi i32 [ %55, %.preheader._crit_edge.us ], [ 0, %.preheader2.preheader.us.preheader ]
  br i1 %15, label %.preheader2.us.prol.loopexit, label %.preheader2.us.prol

.preheader2.us.prol:                              ; preds = %.preheader2.preheader.us
  %19 = load double, double* %2, align 8
  %20 = load double, double* %sunkaddr34, align 8
  %21 = fadd double %19, %20
  %22 = load double, double* %sunkaddr37, align 8
  %23 = fadd double %21, %22
  %24 = fmul double %23, 3.333300e-01
  store double %24, double* %sunkaddr40, align 8
  br label %.preheader2.us.prol.loopexit

.preheader2.us.prol.loopexit:                     ; preds = %.preheader2.preheader.us, %.preheader2.us.prol
  %indvars.iv5.us.unr.ph = phi i64 [ 2, %.preheader2.us.prol ], [ 1, %.preheader2.preheader.us ]
  br i1 %16, label %.preheader.us.preheader, label %.preheader2.us.preheader

.preheader2.us.preheader:                         ; preds = %.preheader2.us.prol.loopexit
  %25 = sub nsw i64 %13, %indvars.iv5.us.unr.ph
  %26 = lshr i64 %25, 1
  %27 = add nuw i64 %26, 1
  %min.iters.check70 = icmp ult i64 %27, 2
  br i1 %min.iters.check70, label %.preheader2.us.preheader113, label %min.iters.checked71

.preheader2.us.preheader113:                      ; preds = %middle.block68, %vector.memcheck91, %min.iters.checked71, %.preheader2.us.preheader
  %indvars.iv5.us.ph = phi i64 [ %indvars.iv5.us.unr.ph, %vector.memcheck91 ], [ %indvars.iv5.us.unr.ph, %min.iters.checked71 ], [ %indvars.iv5.us.unr.ph, %.preheader2.us.preheader ], [ %ind.end96, %middle.block68 ]
  br label %.preheader2.us

min.iters.checked71:                              ; preds = %.preheader2.us.preheader
  %n.mod.vf72 = and i64 %27, 1
  %n.vec73 = sub i64 %27, %n.mod.vf72
  %cmp.zero74 = icmp eq i64 %n.vec73, 0
  br i1 %cmp.zero74, label %.preheader2.us.preheader113, label %vector.memcheck91

vector.memcheck91:                                ; preds = %min.iters.checked71
  %scevgep76 = getelementptr double, double* %3, i64 %indvars.iv5.us.unr.ph
  %28 = sub nsw i64 %14, %indvars.iv5.us.unr.ph
  %29 = and i64 %28, -2
  %30 = add nsw i64 %indvars.iv5.us.unr.ph, %29
  %scevgep79 = getelementptr double, double* %scevgep78, i64 %30
  %scevgep82 = getelementptr double, double* %scevgep81, i64 %indvars.iv5.us.unr.ph
  %scevgep85 = getelementptr double, double* %scevgep84, i64 %30
  %bound087 = icmp ult double* %scevgep76, %scevgep85
  %bound188 = icmp ult double* %scevgep82, %scevgep79
  %memcheck.conflict90 = and i1 %bound087, %bound188
  %31 = add nuw nsw i64 %indvars.iv5.us.unr.ph, 2
  %32 = shl nuw i64 %26, 1
  %33 = add i64 %31, %32
  %34 = shl nuw nsw i64 %n.mod.vf72, 1
  %ind.end96 = sub i64 %33, %34
  br i1 %memcheck.conflict90, label %.preheader2.us.preheader113, label %vector.body67.preheader

vector.body67.preheader:                          ; preds = %vector.memcheck91
  br label %vector.body67

vector.body67:                                    ; preds = %vector.body67.preheader, %vector.body67
  %index93 = phi i64 [ %index.next94, %vector.body67 ], [ 0, %vector.body67.preheader ]
  %35 = shl i64 %index93, 1
  %offset.idx98 = or i64 %indvars.iv5.us.unr.ph, %35
  %36 = add nsw i64 %offset.idx98, -1
  %37 = getelementptr inbounds double, double* %2, i64 %36
  %38 = bitcast double* %37 to <4 x double>*
  %wide.vec102 = load <4 x double>, <4 x double>* %38, align 8, !alias.scope !10
  %strided.vec103 = shufflevector <4 x double> %wide.vec102, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec104 = shufflevector <4 x double> %wide.vec102, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %39 = fadd <2 x double> %strided.vec103, %strided.vec104
  %40 = add nuw nsw i64 %offset.idx98, 1
  %41 = getelementptr inbounds double, double* %2, i64 %40
  %42 = getelementptr double, double* %41, i64 -1
  %43 = bitcast double* %42 to <4 x double>*
  %wide.vec105 = load <4 x double>, <4 x double>* %43, align 8, !alias.scope !10
  %strided.vec107 = shufflevector <4 x double> %wide.vec105, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %44 = fadd <2 x double> %39, %strided.vec107
  %45 = fmul <2 x double> %44, <double 3.333300e-01, double 3.333300e-01>
  %46 = bitcast double* %41 to <4 x double>*
  %wide.vec108 = load <4 x double>, <4 x double>* %46, align 8, !alias.scope !10
  %strided.vec110 = shufflevector <4 x double> %wide.vec108, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %47 = fadd <4 x double> %wide.vec105, %wide.vec108
  %48 = shufflevector <4 x double> %47, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %49 = fadd <2 x double> %48, %strided.vec110
  %50 = fmul <2 x double> %49, <double 3.333300e-01, double 3.333300e-01>
  %51 = getelementptr inbounds double, double* %3, i64 %40
  %52 = getelementptr double, double* %51, i64 -1
  %53 = bitcast double* %52 to <4 x double>*
  %interleaved.vec111 = shufflevector <2 x double> %45, <2 x double> %50, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec111, <4 x double>* %53, align 8, !alias.scope !13, !noalias !10
  %index.next94 = add i64 %index93, 2
  %54 = icmp eq i64 %index.next94, %n.vec73
  br i1 %54, label %middle.block68, label %vector.body67, !llvm.loop !15

middle.block68:                                   ; preds = %vector.body67
  %cmp.n97 = icmp eq i64 %n.mod.vf72, 0
  br i1 %cmp.n97, label %.preheader.us.preheader, label %.preheader2.us.preheader113

.preheader._crit_edge.us.loopexit:                ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit, %middle.block, %.preheader.us.prol.loopexit
  %55 = add nuw nsw i32 %.018.us, 1
  %exitcond24 = icmp eq i32 %55, %0
  br i1 %exitcond24, label %._crit_edge.loopexit, label %.preheader2.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader112, %.preheader.us
  %indvars.iv36.us = phi i64 [ %indvars.iv.next4.us.1, %.preheader.us ], [ %indvars.iv36.us.ph, %.preheader.us.preheader112 ]
  %56 = add nsw i64 %indvars.iv36.us, -1
  %57 = getelementptr inbounds double, double* %3, i64 %56
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.us
  %60 = load double, double* %59, align 8
  %61 = fadd double %58, %60
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv36.us, 1
  %62 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = fmul double %64, 3.333300e-01
  %66 = getelementptr inbounds double, double* %2, i64 %indvars.iv36.us
  store double %65, double* %66, align 8
  %67 = getelementptr inbounds double, double* %3, i64 %indvars.iv36.us
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us
  %70 = load double, double* %69, align 8
  %71 = fadd double %68, %70
  %indvars.iv.next4.us.1 = add nsw i64 %indvars.iv36.us, 2
  %72 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.us.1
  %73 = load double, double* %72, align 8
  %74 = fadd double %71, %73
  %75 = fmul double %74, 3.333300e-01
  %76 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next4.us
  store double %75, double* %76, align 8
  %exitcond23.1 = icmp eq i64 %indvars.iv.next4.us.1, %6
  br i1 %exitcond23.1, label %.preheader._crit_edge.us.loopexit, label %.preheader.us, !llvm.loop !16

.preheader2.us:                                   ; preds = %.preheader2.us.preheader113, %.preheader2.us
  %indvars.iv5.us = phi i64 [ %indvars.iv.next.us.1, %.preheader2.us ], [ %indvars.iv5.us.ph, %.preheader2.us.preheader113 ]
  %77 = add nsw i64 %indvars.iv5.us, -1
  %78 = getelementptr inbounds double, double* %2, i64 %77
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds double, double* %2, i64 %indvars.iv5.us
  %81 = load double, double* %80, align 8
  %82 = fadd double %79, %81
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv5.us, 1
  %83 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us
  %84 = load double, double* %83, align 8
  %85 = fadd double %82, %84
  %86 = fmul double %85, 3.333300e-01
  %87 = getelementptr inbounds double, double* %3, i64 %indvars.iv5.us
  store double %86, double* %87, align 8
  %88 = getelementptr inbounds double, double* %2, i64 %indvars.iv5.us
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us
  %91 = load double, double* %90, align 8
  %92 = fadd double %89, %91
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv5.us, 2
  %93 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.us.1
  %94 = load double, double* %93, align 8
  %95 = fadd double %92, %94
  %96 = fmul double %95, 3.333300e-01
  %97 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.us
  store double %96, double* %97, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, %6
  br i1 %exitcond.1, label %.preheader.us.preheader.loopexit, label %.preheader2.us, !llvm.loop !17

.preheader.us.preheader.loopexit:                 ; preds = %.preheader2.us
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit, %middle.block68, %.preheader2.us.prol.loopexit
  br i1 %17, label %.preheader.us.prol.loopexit, label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.us.preheader
  %98 = load double, double* %3, align 8
  %99 = load double, double* %sunkaddr43, align 8
  %100 = fadd double %98, %99
  %101 = load double, double* %sunkaddr46, align 8
  %102 = fadd double %100, %101
  %103 = fmul double %102, 3.333300e-01
  store double %103, double* %sunkaddr49, align 8
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.preheader, %.preheader.us.prol
  %indvars.iv36.us.unr.ph = phi i64 [ 2, %.preheader.us.prol ], [ 1, %.preheader.us.preheader ]
  br i1 %18, label %.preheader._crit_edge.us, label %.preheader.us.preheader32

.preheader.us.preheader32:                        ; preds = %.preheader.us.prol.loopexit
  %104 = sub nsw i64 %11, %indvars.iv36.us.unr.ph
  %105 = lshr i64 %104, 1
  %106 = add nuw i64 %105, 1
  %min.iters.check = icmp ult i64 %106, 2
  br i1 %min.iters.check, label %.preheader.us.preheader112, label %min.iters.checked

.preheader.us.preheader112:                       ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us.preheader32
  %indvars.iv36.us.ph = phi i64 [ %indvars.iv36.us.unr.ph, %vector.memcheck ], [ %indvars.iv36.us.unr.ph, %min.iters.checked ], [ %indvars.iv36.us.unr.ph, %.preheader.us.preheader32 ], [ %ind.end, %middle.block ]
  br label %.preheader.us

min.iters.checked:                                ; preds = %.preheader.us.preheader32
  %n.mod.vf = and i64 %106, 1
  %n.vec = sub i64 %106, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader.us.preheader112, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %2, i64 %indvars.iv36.us.unr.ph
  %107 = sub nsw i64 %12, %indvars.iv36.us.unr.ph
  %108 = and i64 %107, -2
  %109 = add nsw i64 %indvars.iv36.us.unr.ph, %108
  %scevgep52 = getelementptr double, double* %scevgep51, i64 %109
  %scevgep55 = getelementptr double, double* %scevgep54, i64 %indvars.iv36.us.unr.ph
  %scevgep58 = getelementptr double, double* %scevgep57, i64 %109
  %bound0 = icmp ult double* %scevgep, %scevgep58
  %bound1 = icmp ult double* %scevgep55, %scevgep52
  %memcheck.conflict = and i1 %bound0, %bound1
  %110 = add nuw nsw i64 %indvars.iv36.us.unr.ph, 2
  %111 = shl nuw i64 %105, 1
  %112 = add i64 %110, %111
  %113 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %112, %113
  br i1 %memcheck.conflict, label %.preheader.us.preheader112, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %114 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv36.us.unr.ph, %114
  %115 = add nsw i64 %offset.idx, -1
  %116 = getelementptr inbounds double, double* %3, i64 %115
  %117 = bitcast double* %116 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %117, align 8, !alias.scope !18
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec60 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %118 = fadd <2 x double> %strided.vec, %strided.vec60
  %119 = add nuw nsw i64 %offset.idx, 1
  %120 = getelementptr inbounds double, double* %3, i64 %119
  %121 = getelementptr double, double* %120, i64 -1
  %122 = bitcast double* %121 to <4 x double>*
  %wide.vec61 = load <4 x double>, <4 x double>* %122, align 8, !alias.scope !18
  %strided.vec63 = shufflevector <4 x double> %wide.vec61, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %123 = fadd <2 x double> %118, %strided.vec63
  %124 = fmul <2 x double> %123, <double 3.333300e-01, double 3.333300e-01>
  %125 = bitcast double* %120 to <4 x double>*
  %wide.vec64 = load <4 x double>, <4 x double>* %125, align 8, !alias.scope !18
  %strided.vec66 = shufflevector <4 x double> %wide.vec64, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %126 = fadd <4 x double> %wide.vec61, %wide.vec64
  %127 = shufflevector <4 x double> %126, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %128 = fadd <2 x double> %127, %strided.vec66
  %129 = fmul <2 x double> %128, <double 3.333300e-01, double 3.333300e-01>
  %130 = getelementptr inbounds double, double* %2, i64 %119
  %131 = getelementptr double, double* %130, i64 -1
  %132 = bitcast double* %131 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %124, <2 x double> %129, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %132, align 8, !alias.scope !21, !noalias !18
  %index.next = add i64 %index, 2
  %133 = icmp eq i64 %index.next, %n.vec
  br i1 %133, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader._crit_edge.us, label %.preheader.us.preheader112

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %14
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %14 ], [ 0, %.lr.ph.preheader ]
  %9 = trunc i64 %indvars.iv1 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %.lr.ph
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %.lr.ph
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %7
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %14
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

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
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
!17 = distinct !{!17, !7, !8}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !7, !8}

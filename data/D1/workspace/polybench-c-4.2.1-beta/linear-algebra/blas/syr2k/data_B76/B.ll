; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_syr2k(double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array([1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
._crit_edge.preheader.lr.ph:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge.preheader.lr.ph, %._crit_edge._crit_edge.us
  %indvars.iv4049.us = phi i64 [ %indvars.iv.next41.us, %._crit_edge._crit_edge.us ], [ 0, %._crit_edge.preheader.lr.ph ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv3847.us = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next39.us, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv3847.us, %indvars.iv4049.us
  %6 = add nuw nsw i64 %5, 1
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 1200
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.200000e+03
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv4049.us, i64 %indvars.iv3847.us
  store double %10, double* %11, align 8
  %12 = add nuw nsw i64 %5, 2
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 1000
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.000000e+03
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv4049.us, i64 %indvars.iv3847.us
  store double %16, double* %17, align 8
  %indvars.iv.next39.us = add nuw nsw i64 %indvars.iv3847.us, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next39.us, 1000
  br i1 %exitcond53, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next41.us = add nuw nsw i64 %indvars.iv4049.us, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next41.us, 1200
  br i1 %exitcond54, label %._crit_edge35.preheader.us.preheader, label %._crit_edge.preheader.us

._crit_edge35.preheader.us.preheader:             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge35.preheader.us

._crit_edge35.preheader.us:                       ; preds = %._crit_edge35.preheader.us.preheader, %._crit_edge35._crit_edge.us
  %indvars.iv3644.us = phi i64 [ %indvars.iv.next37.us, %._crit_edge35._crit_edge.us ], [ 0, %._crit_edge35.preheader.us.preheader ]
  br label %._crit_edge35.us

._crit_edge35.us:                                 ; preds = %._crit_edge35.us, %._crit_edge35.preheader.us
  %indvars.iv43.us = phi i64 [ 0, %._crit_edge35.preheader.us ], [ %indvars.iv.next.us, %._crit_edge35.us ]
  %18 = mul nuw nsw i64 %indvars.iv43.us, %indvars.iv3644.us
  %19 = add nuw nsw i64 %18, 3
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 1200
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 1.000000e+03
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv3644.us, i64 %indvars.iv43.us
  store double %23, double* %24, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv43.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %._crit_edge35._crit_edge.us, label %._crit_edge35.us

._crit_edge35._crit_edge.us:                      ; preds = %._crit_edge35.us
  %indvars.iv.next37.us = add nuw nsw i64 %indvars.iv3644.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next37.us, 1200
  br i1 %exitcond, label %._crit_edge46, label %._crit_edge35.preheader.us

._crit_edge46:                                    ; preds = %._crit_edge35._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
._crit_edge.preheader.lr.ph:
  %broadcast.splatinsert26 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat27 = shufflevector <2 x double> %broadcast.splatinsert26, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert47 = insertelement <2 x double> undef, double %1, i32 0
  %broadcast.splat48 = shufflevector <2 x double> %broadcast.splatinsert47, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge.preheader.lr.ph, %._crit_edge34._crit_edge.us
  %indvars.iv = phi i2 [ 1, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next, %._crit_edge34._crit_edge.us ]
  %indvars.iv4655.us = phi i64 [ 1, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next47.us, %._crit_edge34._crit_edge.us ]
  %indvars.iv4853.us = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %10, %._crit_edge34._crit_edge.us ]
  %5 = zext i2 %indvars.iv to i64
  %6 = add nsw i64 %indvars.iv4853.us, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853.us, i64 0
  %7 = mul nuw nsw i64 %indvars.iv4853.us, 1201
  %8 = add nuw nsw i64 %7, 1
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %2, i64 0, i64 %8
  %9 = add nuw nsw i64 %indvars.iv4853.us, 1
  %10 = add nuw nsw i64 %indvars.iv4853.us, 1
  %xtraiter = and i64 %10, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %._crit_edge.preheader.us
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv50.us.prol = phi i64 [ %indvars.iv.next.us.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853.us, i64 %indvars.iv50.us.prol
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %1
  store double %13, double* %11, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv50.us.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !1

._crit_edge.us.prol.loopexit.loopexit:            ; preds = %._crit_edge.us.prol
  br label %._crit_edge.us.prol.loopexit

._crit_edge.us.prol.loopexit:                     ; preds = %._crit_edge.us.prol.loopexit.loopexit, %._crit_edge.preheader.us
  %indvars.iv50.us.unr = phi i64 [ 0, %._crit_edge.preheader.us ], [ %5, %._crit_edge.us.prol.loopexit.loopexit ]
  %14 = icmp ult i64 %indvars.iv4853.us, 3
  br i1 %14, label %._crit_edge35.preheader.us.preheader, label %._crit_edge.us.preheader

._crit_edge.us.preheader:                         ; preds = %._crit_edge.us.prol.loopexit
  %15 = sub i64 %6, %indvars.iv50.us.unr
  %16 = lshr i64 %15, 2
  %17 = add nuw nsw i64 %16, 1
  %min.iters.check31 = icmp ult i64 %17, 2
  br i1 %min.iters.check31, label %._crit_edge.us.preheader49, label %min.iters.checked32

min.iters.checked32:                              ; preds = %._crit_edge.us.preheader
  %n.mod.vf33 = and i64 %17, 1
  %n.vec34 = sub nsw i64 %17, %n.mod.vf33
  %cmp.zero35 = icmp eq i64 %n.vec34, 0
  %18 = or i64 %indvars.iv50.us.unr, 4
  %19 = shl nuw i64 %16, 2
  %20 = add i64 %18, %19
  %21 = shl nuw nsw i64 %n.mod.vf33, 2
  %ind.end = sub i64 %20, %21
  br i1 %cmp.zero35, label %._crit_edge.us.preheader49, label %vector.ph36

vector.ph36:                                      ; preds = %min.iters.checked32
  br label %vector.body28

vector.body28:                                    ; preds = %vector.body28, %vector.ph36
  %index37 = phi i64 [ 0, %vector.ph36 ], [ %index.next38, %vector.body28 ]
  %22 = shl i64 %index37, 2
  %23 = or i64 %indvars.iv50.us.unr, %22
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853.us, i64 %23
  %25 = bitcast double* %24 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %25, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec44 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec45 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec46 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %26 = fmul <2 x double> %strided.vec, %broadcast.splat48
  %27 = fmul <2 x double> %strided.vec44, %broadcast.splat48
  %28 = fmul <2 x double> %strided.vec45, %broadcast.splat48
  %29 = add nsw i64 %23, 3
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853.us, i64 %29
  %31 = fmul <2 x double> %strided.vec46, %broadcast.splat48
  %32 = getelementptr double, double* %30, i64 -3
  %33 = bitcast double* %32 to <8 x double>*
  %34 = shufflevector <2 x double> %26, <2 x double> %27, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %35 = shufflevector <2 x double> %28, <2 x double> %31, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %34, <4 x double> %35, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %33, align 8
  %index.next38 = add i64 %index37, 2
  %36 = icmp eq i64 %index.next38, %n.vec34
  br i1 %36, label %middle.block29, label %vector.body28, !llvm.loop !3

middle.block29:                                   ; preds = %vector.body28
  %cmp.n40 = icmp eq i64 %n.mod.vf33, 0
  br i1 %cmp.n40, label %._crit_edge35.preheader.us.preheader, label %._crit_edge.us.preheader49

._crit_edge.us.preheader49:                       ; preds = %middle.block29, %min.iters.checked32, %._crit_edge.us.preheader
  %indvars.iv50.us.ph = phi i64 [ %indvars.iv50.us.unr, %min.iters.checked32 ], [ %indvars.iv50.us.unr, %._crit_edge.us.preheader ], [ %ind.end, %middle.block29 ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader49, %._crit_edge.us
  %indvars.iv50.us = phi i64 [ %indvars.iv.next.us.3, %._crit_edge.us ], [ %indvars.iv50.us.ph, %._crit_edge.us.preheader49 ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853.us, i64 %indvars.iv50.us
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %1
  store double %39, double* %37, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv50.us, 1
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853.us, i64 %indvars.iv.next.us
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %1
  store double %42, double* %40, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv50.us, 2
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853.us, i64 %indvars.iv.next.us.1
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %1
  store double %45, double* %43, align 8
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv50.us, 3
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853.us, i64 %indvars.iv.next.us.2
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %1
  store double %48, double* %46, align 8
  %indvars.iv.next.us.3 = add nsw i64 %indvars.iv50.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, %indvars.iv4655.us
  br i1 %exitcond.us.3, label %._crit_edge35.preheader.us.preheader.loopexit, label %._crit_edge.us, !llvm.loop !6

._crit_edge35.preheader.us.preheader.loopexit:    ; preds = %._crit_edge.us
  br label %._crit_edge35.preheader.us.preheader

._crit_edge35.preheader.us.preheader:             ; preds = %._crit_edge35.preheader.us.preheader.loopexit, %middle.block29, %._crit_edge.us.prol.loopexit
  %min.iters.check = icmp ult i64 %9, 2
  %n.vec = and i64 %9, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %9, %n.vec
  br label %._crit_edge35.preheader.us

._crit_edge35.us:                                 ; preds = %._crit_edge35.us.preheader, %._crit_edge35.us
  %indvars.iv3851.us = phi i64 [ %indvars.iv.next39.us, %._crit_edge35.us ], [ %indvars.iv3851.us.ph, %._crit_edge35.us.preheader ]
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3851.us, i64 %indvars.iv4452.us
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %0
  %52 = load double, double* %64, align 8
  %53 = fmul double %51, %52
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv3851.us, i64 %indvars.iv4452.us
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %0
  %57 = load double, double* %65, align 8
  %58 = fmul double %56, %57
  %59 = fadd double %53, %58
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853.us, i64 %indvars.iv3851.us
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %59
  store double %62, double* %60, align 8
  %indvars.iv.next39.us = add nuw nsw i64 %indvars.iv3851.us, 1
  %exitcond43.us = icmp eq i64 %indvars.iv.next39.us, %indvars.iv4655.us
  br i1 %exitcond43.us, label %._crit_edge34.us.loopexit, label %._crit_edge35.us, !llvm.loop !8

._crit_edge34.us.loopexit:                        ; preds = %._crit_edge35.us
  br label %._crit_edge34.us

._crit_edge34.us:                                 ; preds = %._crit_edge34.us.loopexit, %middle.block
  %indvars.iv.next45.us = add nuw nsw i64 %indvars.iv4452.us, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next45.us, 1000
  br i1 %exitcond59, label %._crit_edge34._crit_edge.us, label %._crit_edge35.preheader.us

._crit_edge35.preheader.us:                       ; preds = %._crit_edge35.preheader.us.preheader, %._crit_edge34.us
  %indvars.iv4452.us = phi i64 [ %indvars.iv.next45.us, %._crit_edge34.us ], [ 0, %._crit_edge35.preheader.us.preheader ]
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv4452.us
  %63 = add nuw nsw i64 %indvars.iv4452.us, 1
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %3, i64 %indvars.iv4853.us, i64 %63
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %4, i64 0, i64 %indvars.iv4452.us
  %scevgep10 = getelementptr [1000 x double], [1000 x double]* %4, i64 %indvars.iv4853.us, i64 %63
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv4853.us, i64 %indvars.iv4452.us
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv4853.us, i64 %indvars.iv4452.us
  br i1 %min.iters.check, label %._crit_edge35.us.preheader, label %min.iters.checked

._crit_edge35.us.preheader:                       ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge35.preheader.us
  %indvars.iv3851.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge35.preheader.us ], [ %n.vec, %middle.block ]
  br label %._crit_edge35.us

min.iters.checked:                                ; preds = %._crit_edge35.preheader.us
  br i1 %cmp.zero, label %._crit_edge35.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %65
  %bound1 = icmp ult double* %65, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound013 = icmp ult double* %scevgep, %scevgep6
  %bound114 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict15 = and i1 %bound013, %bound114
  %conflict.rdx = or i1 %found.conflict, %found.conflict15
  %bound016 = icmp ult double* %scevgep, %scevgep10
  %bound117 = icmp ult double* %scevgep8, %scevgep2
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx19 = or i1 %conflict.rdx, %found.conflict18
  %bound022 = icmp ult double* %scevgep, %64
  %bound123 = icmp ult double* %64, %scevgep2
  %found.conflict24 = and i1 %bound022, %bound123
  %conflict.rdx25 = or i1 %conflict.rdx19, %found.conflict24
  br i1 %conflict.rdx25, label %._crit_edge35.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %66 = load double, double* %64, align 8, !alias.scope !9
  %67 = insertelement <2 x double> undef, double %66, i32 0
  %68 = shufflevector <2 x double> %67, <2 x double> undef, <2 x i32> zeroinitializer
  %69 = load double, double* %65, align 8, !alias.scope !12
  %70 = insertelement <2 x double> undef, double %69, i32 0
  %71 = shufflevector <2 x double> %70, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %72 = or i64 %index, 1
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %index, i64 %indvars.iv4452.us
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %72, i64 %indvars.iv4452.us
  %75 = load double, double* %73, align 8, !alias.scope !14
  %76 = load double, double* %74, align 8, !alias.scope !14
  %77 = insertelement <2 x double> undef, double %75, i32 0
  %78 = insertelement <2 x double> %77, double %76, i32 1
  %79 = fmul <2 x double> %78, %broadcast.splat27
  %80 = fmul <2 x double> %79, %68
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %index, i64 %indvars.iv4452.us
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %72, i64 %indvars.iv4452.us
  %83 = load double, double* %81, align 8, !alias.scope !16
  %84 = load double, double* %82, align 8, !alias.scope !16
  %85 = insertelement <2 x double> undef, double %83, i32 0
  %86 = insertelement <2 x double> %85, double %84, i32 1
  %87 = fmul <2 x double> %86, %broadcast.splat27
  %88 = fmul <2 x double> %87, %71
  %89 = fadd <2 x double> %80, %88
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4853.us, i64 %index
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !18, !noalias !20
  %92 = fadd <2 x double> %wide.load, %89
  %93 = bitcast double* %90 to <2 x double>*
  store <2 x double> %92, <2 x double>* %93, align 8, !alias.scope !18, !noalias !20
  %index.next = add i64 %index, 2
  %94 = icmp eq i64 %index.next, %n.vec
  br i1 %94, label %middle.block, label %vector.body, !llvm.loop !21

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge34.us, label %._crit_edge35.us.preheader

._crit_edge34._crit_edge.us:                      ; preds = %._crit_edge34.us
  %indvars.iv.next47.us = add nuw nsw i64 %indvars.iv4655.us, 1
  %exitcond60 = icmp eq i64 %10, 1200
  %indvars.iv.next = add i2 %indvars.iv, 1
  br i1 %exitcond60, label %._crit_edge57, label %._crit_edge.preheader.us

._crit_edge57:                                    ; preds = %._crit_edge34._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv1216.us = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next13.us, %._crit_edge._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv1216.us, 1200
  br label %._crit_edge11.us._crit_edge

._crit_edge11.us._crit_edge:                      ; preds = %._crit_edge11.us, %._crit_edge.preheader.us
  %indvars.iv15.us = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next.us, %._crit_edge11.us ]
  %6 = add nuw nsw i64 %indvars.iv15.us, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge11.us

; <label>:10:                                     ; preds = %._crit_edge11.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1216.us, i64 %indvars.iv15.us
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv15.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %._crit_edge._crit_edge.us, label %._crit_edge11.us._crit_edge

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge11.us
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv1216.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next13.us, 1200
  br i1 %exitcond, label %._crit_edge, label %._crit_edge.preheader.us

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = distinct !{!8, !4, !5}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = !{!15}
!15 = distinct !{!15, !11}
!16 = !{!17}
!17 = distinct !{!17, !11}
!18 = !{!19}
!19 = distinct !{!19, !11}
!20 = !{!13, !15, !17, !10}
!21 = distinct !{!21, !4, !5}

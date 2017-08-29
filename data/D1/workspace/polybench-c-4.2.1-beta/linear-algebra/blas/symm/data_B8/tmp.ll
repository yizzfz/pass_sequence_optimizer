; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  %13 = bitcast i8* %5 to [1200 x double]*
  %14 = bitcast i8* %6 to [1000 x double]*
  %15 = bitcast i8* %7 to [1200 x double]*
  call void @kernel_symm(double %11, double %12, [1200 x double]* %13, [1000 x double]* %14, [1200 x double]* %15)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %16 = icmp sgt i32 %0, 42
  br i1 %16, label %17, label %22

; <label>:17:                                     ; preds = %2
  %18 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %18, align 1
  %19 = icmp eq i8 %strcmpload, 0
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %17
  %21 = bitcast i8* %5 to [1200 x double]*
  call void @print_array([1200 x double]* %21)
  br label %22

; <label>:22:                                     ; preds = %17, %20, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
.preheader40.preheader.us.preheader:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader40.preheader.us

.preheader40.preheader.us:                        ; preds = %.preheader40._crit_edge.us, %.preheader40.preheader.us.preheader
  %indvars.iv5568.us = phi i64 [ %indvars.iv.next56.us, %.preheader40._crit_edge.us ], [ 0, %.preheader40.preheader.us.preheader ]
  %5 = add nuw nsw i64 %indvars.iv5568.us, 1200
  br label %.preheader40.us

.preheader40.us:                                  ; preds = %.preheader40.us, %.preheader40.preheader.us
  %indvars.iv5366.us = phi i64 [ 0, %.preheader40.preheader.us ], [ %indvars.iv.next54.us, %.preheader40.us ]
  %6 = add nuw nsw i64 %indvars.iv5366.us, %indvars.iv5568.us
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 100
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.000000e+03
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv5568.us, i64 %indvars.iv5366.us
  store double %10, double* %11, align 8
  %12 = sub nsw i64 %5, %indvars.iv5366.us
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 100
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.000000e+03
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv5568.us, i64 %indvars.iv5366.us
  store double %16, double* %17, align 8
  %indvars.iv.next54.us = add nuw nsw i64 %indvars.iv5366.us, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next54.us, 1200
  br i1 %exitcond74, label %.preheader40._crit_edge.us, label %.preheader40.us

.preheader40._crit_edge.us:                       ; preds = %.preheader40.us
  %indvars.iv.next56.us = add nuw nsw i64 %indvars.iv5568.us, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next56.us, 1000
  br i1 %exitcond75, label %.preheader.preheader.preheader, label %.preheader40.preheader.us

.preheader.preheader.preheader:                   ; preds = %.preheader40._crit_edge.us
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next73, %._crit_edge ], [ 1, %.preheader.preheader.preheader ]
  %indvars.iv5161 = phi i64 [ %indvars.iv.next52, %._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %18 = sub i64 1007, %indvars.iv5161
  %19 = sub i64 998, %indvars.iv5161
  %20 = and i64 %indvars.iv5161, 1
  %lcmp.mod = icmp eq i64 %20, 0
  br i1 %lcmp.mod, label %.preheader.prol, label %.preheader.prol.loopexit

.preheader.prol:                                  ; preds = %.preheader.preheader
  %21 = trunc i64 %indvars.iv5161 to i32
  %22 = srem i32 %21, 100
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 1.000000e+03
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv5161, i64 0
  store double %24, double* %25, align 8
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol, %.preheader.preheader
  %indvars.iv58.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.preheader.preheader ]
  %26 = icmp eq i64 %indvars.iv5161, 0
  br i1 %26, label %.preheader57, label %.preheader.preheader82

.preheader.preheader82:                           ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader57.loopexit:                            ; preds = %.preheader
  br label %.preheader57

.preheader57:                                     ; preds = %.preheader57.loopexit, %.preheader.prol.loopexit
  %exitcond4859 = icmp eq i64 %indvars.iv, 1000
  br i1 %exitcond4859, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader57
  %xtraiter71 = and i64 %18, 7
  %lcmp.mod72 = icmp eq i64 %xtraiter71, 0
  br i1 %lcmp.mod72, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv4560.prol = phi i64 [ %indvars.iv.next46.prol, %.lr.ph.prol ], [ %indvars.iv, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter71, %.lr.ph.prol.preheader ]
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv5161, i64 %indvars.iv4560.prol
  store double -9.990000e+02, double* %27, align 8
  %indvars.iv.next46.prol = add nuw nsw i64 %indvars.iv4560.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv4560.unr = phi i64 [ %indvars.iv, %.lr.ph.preheader ], [ %indvars.iv.next46.prol, %.lr.ph.prol.loopexit.loopexit ]
  %28 = icmp ult i64 %19, 7
  br i1 %28, label %._crit_edge, label %.lr.ph.preheader79

.lr.ph.preheader79:                               ; preds = %.lr.ph.prol.loopexit
  %29 = sub i64 992, %indvars.iv4560.unr
  %30 = lshr i64 %29, 3
  %31 = add nuw nsw i64 %30, 1
  %min.iters.check = icmp ult i64 %31, 2
  br i1 %min.iters.check, label %.lr.ph.preheader81, label %min.iters.checked

.lr.ph.preheader81:                               ; preds = %middle.block, %min.iters.checked, %.lr.ph.preheader79
  %indvars.iv4560.ph = phi i64 [ %indvars.iv4560.unr, %min.iters.checked ], [ %indvars.iv4560.unr, %.lr.ph.preheader79 ], [ %ind.end, %middle.block ]
  br label %.lr.ph

min.iters.checked:                                ; preds = %.lr.ph.preheader79
  %n.mod.vf = and i64 %31, 1
  %n.vec = sub nsw i64 %31, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %32 = add i64 %indvars.iv4560.unr, 8
  %33 = shl nuw i64 %30, 3
  %34 = add i64 %32, %33
  %35 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %34, %35
  br i1 %cmp.zero, label %.lr.ph.preheader81, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %36 = shl i64 %index, 3
  %37 = add i64 %indvars.iv4560.unr, %36
  %38 = add nsw i64 %37, 7
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv5161, i64 %38
  %40 = getelementptr double, double* %39, i64 -7
  %41 = bitcast double* %40 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %41, align 8
  %index.next = add i64 %index, 2
  %42 = icmp eq i64 %index.next, %n.vec
  br i1 %42, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph.preheader81

.preheader:                                       ; preds = %.preheader.preheader82, %.preheader
  %indvars.iv58 = phi i64 [ %indvars.iv.next.1, %.preheader ], [ %indvars.iv58.unr.ph, %.preheader.preheader82 ]
  %43 = add nuw nsw i64 %indvars.iv58, %indvars.iv5161
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, 100
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, 1.000000e+03
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv5161, i64 %indvars.iv58
  store double %47, double* %48, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv58, 1
  %49 = add nuw nsw i64 %indvars.iv.next, %indvars.iv5161
  %50 = trunc i64 %49 to i32
  %51 = srem i32 %50, 100
  %52 = sitofp i32 %51 to double
  %53 = fdiv double %52, 1.000000e+03
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv5161, i64 %indvars.iv.next
  store double %53, double* %54, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv58, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv
  br i1 %exitcond.1, label %.preheader57.loopexit, label %.preheader

.lr.ph:                                           ; preds = %.lr.ph.preheader81, %.lr.ph
  %indvars.iv4560 = phi i64 [ %indvars.iv.next46.7, %.lr.ph ], [ %indvars.iv4560.ph, %.lr.ph.preheader81 ]
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv5161, i64 %indvars.iv4560
  store double -9.990000e+02, double* %55, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv4560, 1
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv5161, i64 %indvars.iv.next46
  store double -9.990000e+02, double* %56, align 8
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv4560, 2
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv5161, i64 %indvars.iv.next46.1
  store double -9.990000e+02, double* %57, align 8
  %indvars.iv.next46.2 = add nsw i64 %indvars.iv4560, 3
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv5161, i64 %indvars.iv.next46.2
  store double -9.990000e+02, double* %58, align 8
  %indvars.iv.next46.3 = add nsw i64 %indvars.iv4560, 4
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv5161, i64 %indvars.iv.next46.3
  store double -9.990000e+02, double* %59, align 8
  %indvars.iv.next46.4 = add nsw i64 %indvars.iv4560, 5
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv5161, i64 %indvars.iv.next46.4
  store double -9.990000e+02, double* %60, align 8
  %indvars.iv.next46.5 = add nsw i64 %indvars.iv4560, 6
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv5161, i64 %indvars.iv.next46.5
  store double -9.990000e+02, double* %61, align 8
  %indvars.iv.next46.6 = add nsw i64 %indvars.iv4560, 7
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv5161, i64 %indvars.iv.next46.6
  store double -9.990000e+02, double* %62, align 8
  %indvars.iv.next46.7 = add nsw i64 %indvars.iv4560, 8
  %exitcond48.7 = icmp eq i64 %indvars.iv.next46.7, 1000
  br i1 %exitcond48.7, label %._crit_edge.loopexit, label %.lr.ph, !llvm.loop !6

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %.lr.ph.prol.loopexit, %.preheader57
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv5161, 1
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next52, 1000
  br i1 %exitcond, label %._crit_edge65, label %.preheader.preheader

._crit_edge65:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
.preheader44.preheader.us.preheader:
  %5 = fmul double %0, 0.000000e+00
  %broadcast.splatinsert93 = insertelement <2 x double> undef, double %1, i32 0
  %broadcast.splat94 = shufflevector <2 x double> %broadcast.splatinsert93, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert97 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat98 = shufflevector <2 x double> %broadcast.splatinsert97, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert99 = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat100 = shufflevector <2 x double> %broadcast.splatinsert99, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader44.preheader.us

.preheader44.preheader.us:                        ; preds = %.preheader44._crit_edge.us, %.preheader44.preheader.us.preheader
  %indvars.iv4955.us = phi i64 [ %indvars.iv.next50.us, %.preheader44._crit_edge.us ], [ 0, %.preheader44.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv4955.us, i64 0
  %6 = add i64 %indvars.iv4955.us, 1
  %scevgep81 = getelementptr [1200 x double], [1200 x double]* %2, i64 %6, i64 0
  %exitcond51.us = icmp eq i64 %indvars.iv4955.us, 0
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv4955.us, i64 %indvars.iv4955.us
  br i1 %exitcond51.us, label %vector.memcheck, label %.preheader.preheader.us66.preheader

.preheader.preheader.us66.preheader:              ; preds = %.preheader44.preheader.us
  br label %.preheader.preheader.us66

vector.memcheck:                                  ; preds = %.preheader44.preheader.us
  %scevgep85 = getelementptr [1200 x double], [1200 x double]* %4, i64 %6, i64 0
  %scevgep83 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv4955.us, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep85
  %bound1 = icmp ult double* %scevgep83, %scevgep81
  %found.conflict = and i1 %bound0, %bound1
  %bound088 = icmp ult double* %scevgep, %7
  %bound189 = icmp ult double* %7, %scevgep81
  %found.conflict90 = and i1 %bound088, %bound189
  %conflict.rdx = or i1 %found.conflict, %found.conflict90
  br i1 %conflict.rdx, label %.preheader.preheader.us.us.preheader, label %vector.ph

.preheader.preheader.us.us.preheader:             ; preds = %vector.memcheck
  br label %.preheader.preheader.us.us

vector.ph:                                        ; preds = %vector.memcheck
  %8 = load double, double* %7, align 8, !alias.scope !8
  %9 = insertelement <2 x double> undef, double %8, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  %11 = insertelement <2 x double> undef, double %8, i32 0
  %12 = shufflevector <2 x double> %11, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4955.us, i64 %index
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !11, !noalias !13
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !11, !noalias !13
  %17 = fmul <2 x double> %wide.load, %broadcast.splat94
  %18 = fmul <2 x double> %wide.load92, %broadcast.splat94
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4955.us, i64 %index
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !15
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !15
  %23 = fmul <2 x double> %wide.load95, %broadcast.splat98
  %24 = fmul <2 x double> %wide.load96, %broadcast.splat98
  %25 = fmul <2 x double> %23, %10
  %26 = fmul <2 x double> %24, %12
  %27 = fadd <2 x double> %17, %25
  %28 = fadd <2 x double> %18, %26
  %29 = fadd <2 x double> %broadcast.splat100, %27
  %30 = fadd <2 x double> %broadcast.splat100, %28
  %31 = bitcast double* %13 to <2 x double>*
  store <2 x double> %29, <2 x double>* %31, align 8, !alias.scope !11, !noalias !13
  %32 = bitcast double* %15 to <2 x double>*
  store <2 x double> %30, <2 x double>* %32, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %33 = icmp eq i64 %index.next, 1200
  br i1 %33, label %.preheader44._crit_edge.us.loopexit101, label %vector.body, !llvm.loop !16

.preheader.us58:                                  ; preds = %.preheader.preheader.us66, %.preheader.us58
  %.053.us59 = phi double [ 0.000000e+00, %.preheader.preheader.us66 ], [ %47, %.preheader.us58 ]
  %indvars.iv52.us60 = phi i64 [ 0, %.preheader.preheader.us66 ], [ %indvars.iv.next.us61, %.preheader.us58 ]
  %34 = load double, double* %48, align 8
  %35 = fmul double %34, %0
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv4955.us, i64 %indvars.iv52.us60
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv52.us60, i64 %indvars.iv4754.us67
  %40 = load double, double* %39, align 8
  %41 = fadd double %40, %38
  store double %41, double* %39, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52.us60, i64 %indvars.iv4754.us67
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv4955.us, i64 %indvars.iv52.us60
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %.053.us59, %46
  %indvars.iv.next.us61 = add nuw nsw i64 %indvars.iv52.us60, 1
  %exitcond.us62 = icmp eq i64 %indvars.iv.next.us61, %indvars.iv4955.us
  br i1 %exitcond.us62, label %.preheader._crit_edge.us69, label %.preheader.us58

.preheader.preheader.us66:                        ; preds = %.preheader.preheader.us66.preheader, %.preheader._crit_edge.us69
  %indvars.iv4754.us67 = phi i64 [ %indvars.iv.next48.us65, %.preheader._crit_edge.us69 ], [ 0, %.preheader.preheader.us66.preheader ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4955.us, i64 %indvars.iv4754.us67
  br label %.preheader.us58

.preheader._crit_edge.us69:                       ; preds = %.preheader.us58
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4955.us, i64 %indvars.iv4754.us67
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %1
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4955.us, i64 %indvars.iv4754.us67
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %0
  %55 = load double, double* %7, align 8
  %56 = fmul double %54, %55
  %57 = fadd double %51, %56
  %58 = fmul double %47, %0
  %59 = fadd double %58, %57
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4955.us, i64 %indvars.iv4754.us67
  store double %59, double* %60, align 8
  %indvars.iv.next48.us65 = add nuw nsw i64 %indvars.iv4754.us67, 1
  %exitcond = icmp eq i64 %indvars.iv.next48.us65, 1200
  br i1 %exitcond, label %.preheader44._crit_edge.us.loopexit102, label %.preheader.preheader.us66

.preheader44._crit_edge.us.loopexit:              ; preds = %.preheader.preheader.us.us
  br label %.preheader44._crit_edge.us

.preheader44._crit_edge.us.loopexit101:           ; preds = %vector.body
  br label %.preheader44._crit_edge.us

.preheader44._crit_edge.us.loopexit102:           ; preds = %.preheader._crit_edge.us69
  br label %.preheader44._crit_edge.us

.preheader44._crit_edge.us:                       ; preds = %.preheader44._crit_edge.us.loopexit102, %.preheader44._crit_edge.us.loopexit101, %.preheader44._crit_edge.us.loopexit
  %indvars.iv.next50.us = add nuw nsw i64 %indvars.iv4955.us, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next50.us, 1000
  br i1 %exitcond76, label %._crit_edge, label %.preheader44.preheader.us

.preheader.preheader.us.us:                       ; preds = %.preheader.preheader.us.us, %.preheader.preheader.us.us.preheader
  %indvars.iv4754.us.us = phi i64 [ 0, %.preheader.preheader.us.us.preheader ], [ %indvars.iv.next48.us.us.1, %.preheader.preheader.us.us ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4955.us, i64 %indvars.iv4754.us.us
  %62 = load double, double* %61, align 8
  %63 = fmul double %62, %1
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4955.us, i64 %indvars.iv4754.us.us
  %65 = load double, double* %64, align 8
  %66 = fmul double %65, %0
  %67 = load double, double* %7, align 8
  %68 = fmul double %66, %67
  %69 = fadd double %63, %68
  %70 = fadd double %5, %69
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4955.us, i64 %indvars.iv4754.us.us
  store double %70, double* %71, align 8
  %indvars.iv.next48.us.us = or i64 %indvars.iv4754.us.us, 1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4955.us, i64 %indvars.iv.next48.us.us
  %73 = load double, double* %72, align 8
  %74 = fmul double %73, %1
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4955.us, i64 %indvars.iv.next48.us.us
  %76 = load double, double* %75, align 8
  %77 = fmul double %76, %0
  %78 = load double, double* %7, align 8
  %79 = fmul double %77, %78
  %80 = fadd double %74, %79
  %81 = fadd double %5, %80
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4955.us, i64 %indvars.iv.next48.us.us
  store double %81, double* %82, align 8
  %indvars.iv.next48.us.us.1 = add nsw i64 %indvars.iv4754.us.us, 2
  %exitcond75.1 = icmp eq i64 %indvars.iv.next48.us.us.1, 1200
  br i1 %exitcond75.1, label %.preheader44._crit_edge.us.loopexit, label %.preheader.preheader.us.us, !llvm.loop !17

._crit_edge:                                      ; preds = %.preheader44._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*) #0 {
.preheader.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.us.preheader
  %indvars.iv1114.us = phi i64 [ %indvars.iv.next12.us, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  %5 = mul nsw i64 %indvars.iv1114.us, 1000
  br label %6

; <label>:6:                                      ; preds = %.preheader.us, %.preheader.preheader.us
  %indvars.iv13.us = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next.us, %.preheader.us ]
  %7 = add nsw i64 %indvars.iv13.us, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.preheader.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %11, %6
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1114.us, i64 %indvars.iv13.us
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv13.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %.preheader._crit_edge.us, label %6

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1114.us, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next12.us, 1000
  br i1 %exitcond17, label %._crit_edge, label %.preheader.preheader.us

._crit_edge:                                      ; preds = %.preheader._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14, !9}
!14 = distinct !{!14, !10}
!15 = !{!14}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}

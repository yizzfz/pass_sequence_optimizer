; ModuleID = 'A.ll'
source_filename = "symm.c"
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
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %21, %7
  %indvars.iv31 = phi i64 [ 0, %7 ], [ %indvars.iv.next32, %21 ]
  %8 = add nuw nsw i64 %indvars.iv31, 1200
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv28 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next29, %._crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv28, %indvars.iv31
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 100
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 1.000000e+03
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv28
  store double %13, double* %14, align 8
  %15 = sub nuw nsw i64 %8, %indvars.iv28
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 100
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.000000e+03
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv31, i64 %indvars.iv28
  store double %19, double* %20, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 1200
  br i1 %exitcond30, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %._crit_edge
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond33, label %.lr.ph.preheader, label %._crit_edge.preheader

.lr.ph.preheader:                                 ; preds = %21
  br label %.lr.ph

._crit_edge3.loopexit.loopexit:                   ; preds = %.lr.ph9.new
  br label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge3.loopexit.loopexit, %middle.block, %.prol.loopexit, %._crit_edge4._crit_edge
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, 1000
  br i1 %exitcond, label %69, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge3.loopexit
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %._crit_edge3.loopexit ], [ 0, %.lr.ph.preheader ]
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge3.loopexit ], [ 1, %.lr.ph.preheader ]
  %22 = sub i64 999, %indvars.iv26
  %23 = sub i64 998, %indvars.iv26
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %xtraiter34 = and i64 %indvars.iv.next27, 1
  %lcmp.mod = icmp eq i64 %xtraiter34, 0
  br i1 %lcmp.mod, label %._crit_edge4.prol.loopexit, label %._crit_edge4.prol

._crit_edge4.prol:                                ; preds = %.lr.ph
  %24 = trunc i64 %indvars.iv26 to i32
  %25 = srem i32 %24, 100
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 1.000000e+03
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 0
  store double %27, double* %28, align 8
  br label %._crit_edge4.prol.loopexit

._crit_edge4.prol.loopexit:                       ; preds = %._crit_edge4.prol, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge4.prol ], [ 0, %.lr.ph ]
  %29 = icmp eq i64 %indvars.iv26, 0
  br i1 %29, label %._crit_edge4._crit_edge, label %._crit_edge4.preheader

._crit_edge4.preheader:                           ; preds = %._crit_edge4.prol.loopexit
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.preheader, %._crit_edge4
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge4 ], [ %indvars.iv.unr.ph, %._crit_edge4.preheader ]
  %30 = add nuw nsw i64 %indvars.iv, %indvars.iv26
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 100
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, 1.000000e+03
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv
  store double %34, double* %35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %36 = add nuw nsw i64 %indvars.iv.next, %indvars.iv26
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 100
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, 1.000000e+03
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv.next
  store double %40, double* %41, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv24
  br i1 %exitcond.1, label %._crit_edge4._crit_edge.loopexit, label %._crit_edge4

._crit_edge4._crit_edge.loopexit:                 ; preds = %._crit_edge4
  br label %._crit_edge4._crit_edge

._crit_edge4._crit_edge:                          ; preds = %._crit_edge4._crit_edge.loopexit, %._crit_edge4.prol.loopexit
  %42 = icmp slt i64 %indvars.iv.next27, 1000
  br i1 %42, label %.lr.ph9, label %._crit_edge3.loopexit

.lr.ph9:                                          ; preds = %._crit_edge4._crit_edge
  %43 = trunc i64 %22 to i32
  %xtraiter20 = and i32 %43, 7
  %lcmp.mod21 = icmp eq i32 %xtraiter20, 0
  br i1 %lcmp.mod21, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph9
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv18.prol = phi i64 [ %indvars.iv.next19.prol, %.prol.preheader ], [ %indvars.iv24, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter20, %.prol.preheader.preheader ]
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv18.prol
  store double -9.990000e+02, double* %44, align 8
  %indvars.iv.next19.prol = add nuw nsw i64 %indvars.iv18.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph9
  %indvars.iv18.unr = phi i64 [ %indvars.iv24, %.lr.ph9 ], [ %indvars.iv.next19.prol, %.prol.loopexit.loopexit ]
  %45 = trunc i64 %23 to i32
  %46 = icmp ult i32 %45, 7
  br i1 %46, label %._crit_edge3.loopexit, label %.lr.ph9.new.preheader

.lr.ph9.new.preheader:                            ; preds = %.prol.loopexit
  %47 = sub i64 992, %indvars.iv18.unr
  %48 = lshr i64 %47, 3
  %49 = add nuw nsw i64 %48, 1
  %min.iters.check = icmp ult i64 %49, 2
  br i1 %min.iters.check, label %.lr.ph9.new.preheader35, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph9.new.preheader
  %n.mod.vf = and i64 %49, 1
  %n.vec = sub nsw i64 %49, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %50 = add i64 %indvars.iv18.unr, 8
  %51 = shl nuw i64 %48, 3
  %52 = add i64 %50, %51
  %53 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %52, %53
  br i1 %cmp.zero, label %.lr.ph9.new.preheader35, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %54 = shl i64 %index, 3
  %55 = add i64 %indvars.iv18.unr, %54
  %56 = add nsw i64 %55, 7
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %56
  %58 = getelementptr double, double* %57, i64 -7
  %59 = bitcast double* %58 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %59, align 8
  %index.next = add i64 %index, 2
  %60 = icmp eq i64 %index.next, %n.vec
  br i1 %60, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge3.loopexit, label %.lr.ph9.new.preheader35

.lr.ph9.new.preheader35:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph9.new.preheader
  %indvars.iv18.ph = phi i64 [ %indvars.iv18.unr, %min.iters.checked ], [ %indvars.iv18.unr, %.lr.ph9.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph9.new

.lr.ph9.new:                                      ; preds = %.lr.ph9.new.preheader35, %.lr.ph9.new
  %indvars.iv18 = phi i64 [ %indvars.iv.next19.7, %.lr.ph9.new ], [ %indvars.iv18.ph, %.lr.ph9.new.preheader35 ]
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv18
  store double -9.990000e+02, double* %61, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv.next19
  store double -9.990000e+02, double* %62, align 8
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv.next19.1
  store double -9.990000e+02, double* %63, align 8
  %indvars.iv.next19.2 = add nsw i64 %indvars.iv18, 3
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv.next19.2
  store double -9.990000e+02, double* %64, align 8
  %indvars.iv.next19.3 = add nsw i64 %indvars.iv18, 4
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv.next19.3
  store double -9.990000e+02, double* %65, align 8
  %indvars.iv.next19.4 = add nsw i64 %indvars.iv18, 5
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv.next19.4
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next19.5 = add nsw i64 %indvars.iv18, 6
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv.next19.5
  store double -9.990000e+02, double* %67, align 8
  %indvars.iv.next19.6 = add nsw i64 %indvars.iv18, 7
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv.next19.6
  store double -9.990000e+02, double* %68, align 8
  %indvars.iv.next19.7 = add nsw i64 %indvars.iv18, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next19.7, 1000
  br i1 %exitcond.7, label %._crit_edge3.loopexit.loopexit, label %.lr.ph9.new, !llvm.loop !6

; <label>:69:                                     ; preds = %._crit_edge3.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #2 {
  %8 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert40 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat41 = shufflevector <2 x double> %broadcast.splatinsert40, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert44 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat45 = shufflevector <2 x double> %broadcast.splatinsert44, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert46 = insertelement <2 x double> undef, double %8, i32 0
  %broadcast.splat47 = shufflevector <2 x double> %broadcast.splatinsert46, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %.us-lcssa.us, %7
  %indvars.iv22 = phi i64 [ 0, %7 ], [ %9, %.us-lcssa.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 0
  %9 = add i64 %indvars.iv22, 1
  %scevgep28 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 0
  %10 = icmp sgt i64 %indvars.iv22, 0
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv22, i64 %indvars.iv22
  br i1 %10, label %._crit_edge4.preheader.us.preheader, label %vector.memcheck

._crit_edge4.preheader.us.preheader:              ; preds = %._crit_edge.preheader
  br label %._crit_edge4.preheader.us

vector.memcheck:                                  ; preds = %._crit_edge.preheader
  %scevgep32 = getelementptr [1200 x double], [1200 x double]* %6, i64 %9, i64 0
  %scevgep30 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv22, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep32
  %bound1 = icmp ult double* %scevgep30, %scevgep28
  %found.conflict = and i1 %bound0, %bound1
  %bound035 = icmp ult double* %scevgep, %11
  %bound136 = icmp ult double* %11, %scevgep28
  %found.conflict37 = and i1 %bound035, %bound136
  %conflict.rdx = or i1 %found.conflict, %found.conflict37
  br i1 %conflict.rdx, label %._crit_edge4.preheader.preheader, label %vector.ph

._crit_edge4.preheader.preheader:                 ; preds = %vector.memcheck
  br label %._crit_edge4.preheader

vector.ph:                                        ; preds = %vector.memcheck
  %.pre = load double, double* %11, align 8, !alias.scope !8
  %12 = insertelement <2 x double> undef, double %.pre, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %index
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !11, !noalias !13
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !11, !noalias !13
  %18 = fmul <2 x double> %wide.load, %broadcast.splat41
  %19 = fmul <2 x double> %wide.load39, %broadcast.splat41
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv22, i64 %index
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !15
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !15
  %24 = fmul <2 x double> %wide.load42, %broadcast.splat45
  %25 = fmul <2 x double> %wide.load43, %broadcast.splat45
  %26 = fmul <2 x double> %24, %13
  %27 = fmul <2 x double> %25, %13
  %28 = fadd <2 x double> %18, %26
  %29 = fadd <2 x double> %19, %27
  %30 = fadd <2 x double> %broadcast.splat47, %28
  %31 = fadd <2 x double> %broadcast.splat47, %29
  store <2 x double> %30, <2 x double>* %15, align 8, !alias.scope !11, !noalias !13
  store <2 x double> %31, <2 x double>* %17, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %32 = icmp eq i64 %index.next, 1200
  br i1 %32, label %.us-lcssa.us.loopexit49, label %vector.body, !llvm.loop !16

._crit_edge4.preheader.us:                        ; preds = %._crit_edge4.preheader.us.preheader, %._crit_edge4._crit_edge.us
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge4._crit_edge.us ], [ 0, %._crit_edge4.preheader.us.preheader ]
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv22, i64 %indvars.iv19
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us, %._crit_edge4.preheader.us
  %indvars.iv14 = phi i64 [ 0, %._crit_edge4.preheader.us ], [ %indvars.iv.next15, %._crit_edge4.us ]
  %.07.us = phi double [ 0.000000e+00, %._crit_edge4.preheader.us ], [ %46, %._crit_edge4.us ]
  %34 = load double, double* %33, align 8
  %35 = fmul double %34, %2
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv22, i64 %indvars.iv14
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv19
  %40 = load double, double* %39, align 8
  %41 = fadd double %40, %38
  store double %41, double* %39, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv14, i64 %indvars.iv19
  %43 = load double, double* %42, align 8
  %44 = load double, double* %36, align 8
  %45 = fmul double %43, %44
  %46 = fadd double %.07.us, %45
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next15, %indvars.iv22
  br i1 %exitcond18, label %._crit_edge4._crit_edge.us, label %._crit_edge4.us

._crit_edge4._crit_edge.us:                       ; preds = %._crit_edge4.us
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv19
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %3
  %50 = load double, double* %33, align 8
  %51 = fmul double %50, %2
  %52 = load double, double* %11, align 8
  %53 = fmul double %51, %52
  %54 = fadd double %49, %53
  %55 = fmul double %46, %2
  %56 = fadd double %55, %54
  store double %56, double* %47, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 1200
  br i1 %exitcond21, label %.us-lcssa.us.loopexit, label %._crit_edge4.preheader.us

._crit_edge4.preheader:                           ; preds = %._crit_edge4.preheader, %._crit_edge4.preheader.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge4.preheader.preheader ], [ %indvars.iv.next.1, %._crit_edge4.preheader ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, %3
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv22, i64 %indvars.iv
  %61 = load double, double* %60, align 8
  %62 = fmul double %61, %2
  %63 = load double, double* %11, align 8
  %64 = fmul double %62, %63
  %65 = fadd double %59, %64
  %66 = fadd double %8, %65
  store double %66, double* %57, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv.next
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %3
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv22, i64 %indvars.iv.next
  %71 = load double, double* %70, align 8
  %72 = fmul double %71, %2
  %73 = load double, double* %11, align 8
  %74 = fmul double %72, %73
  %75 = fadd double %69, %74
  %76 = fadd double %8, %75
  store double %76, double* %67, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %.us-lcssa.us.loopexit48, label %._crit_edge4.preheader, !llvm.loop !17

.us-lcssa.us.loopexit:                            ; preds = %._crit_edge4._crit_edge.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit48:                          ; preds = %._crit_edge4.preheader
  br label %.us-lcssa.us

.us-lcssa.us.loopexit49:                          ; preds = %vector.body
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit49, %.us-lcssa.us.loopexit48, %.us-lcssa.us.loopexit
  %exitcond24 = icmp eq i64 %9, 1000
  br i1 %exitcond24, label %77, label %._crit_edge.preheader

; <label>:77:                                     ; preds = %.us-lcssa.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %20, %3
  %indvars.iv5 = phi i64 [ 0, %3 ], [ %indvars.iv.next6, %20 ]
  %8 = mul nuw nsw i64 %indvars.iv5, 1000
  br label %9

; <label>:9:                                      ; preds = %._crit_edge2, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge2 ]
  %10 = add nuw nsw i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge2

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %20, label %9

; <label>:20:                                     ; preds = %._crit_edge2
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %21, label %._crit_edge.preheader

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

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

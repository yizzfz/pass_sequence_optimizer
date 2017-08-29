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
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
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
  %18 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader2.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge7.us, %.preheader2.lr.ph
  %indvars.iv30 = phi i64 [ 0, %.preheader2.lr.ph ], [ %indvars.iv.next31, %._crit_edge7.us ]
  %7 = add nuw nsw i64 %indvars.iv30, 1200
  %8 = trunc i64 %7 to i32
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader2.us
  %indvars.iv27 = phi i64 [ 0, %.preheader2.us ], [ %indvars.iv.next28, %9 ]
  %10 = add nuw nsw i64 %indvars.iv27, %indvars.iv30
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 100
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.000000e+03
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv27
  store double %14, double* %15, align 8
  %16 = trunc i64 %indvars.iv27 to i32
  %17 = sub i32 %8, %16
  %18 = srem i32 %17, 100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv30, i64 %indvars.iv27
  store double %20, double* %21, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next28, 1200
  br i1 %exitcond29, label %._crit_edge7.us, label %9

._crit_edge7.us:                                  ; preds = %9
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, 1000
  br i1 %exitcond33, label %.lr.ph.preheader, label %.preheader2.us

.lr.ph.preheader:                                 ; preds = %._crit_edge7.us
  br label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph4.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %.prol.loopexit17, %._crit_edge
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond = icmp eq i64 %indvars.iv.next25, 1000
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %indvars.iv.next40 = add i3 %indvars.iv39, -1
  br i1 %exitcond, label %._crit_edge5, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.loopexit
  %indvars.iv39 = phi i3 [ %indvars.iv.next40, %.loopexit ], [ -1, %.lr.ph.preheader ]
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %.loopexit ], [ 2, %.lr.ph.preheader ]
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %.loopexit ], [ 0, %.lr.ph.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %.loopexit ], [ 1, %.lr.ph.preheader ]
  %22 = zext i3 %indvars.iv39 to i64
  %23 = add nuw nsw i64 %22, 4294967295
  %24 = and i64 %23, 4294967295
  %25 = add i64 %indvars.iv37, %24
  %26 = sub nsw i64 0, %indvars.iv24
  %27 = trunc i64 %26 to i32
  %28 = add i32 %27, 7
  %29 = add i32 %27, 998
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %xtraiter35 = and i64 %indvars.iv.next25, 1
  %lcmp.mod = icmp eq i64 %xtraiter35, 0
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %30 = trunc i64 %indvars.iv24 to i32
  %31 = srem i32 %30, 100
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 1.000000e+03
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 0
  store double %33, double* %34, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %35 = icmp eq i64 %indvars.iv24, 0
  br i1 %35, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit.unr-lcssa
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %36 = add nuw nsw i64 %indvars.iv, %indvars.iv24
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 100
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, 1.000000e+03
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv
  store double %40, double* %41, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = add nuw nsw i64 %indvars.iv.next, %indvars.iv24
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, 100
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, 1.000000e+03
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv.next
  store double %46, double* %47, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv22
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit.unr-lcssa
  %48 = icmp slt i64 %indvars.iv.next25, 1000
  br i1 %48, label %.lr.ph4, label %.loopexit

.lr.ph4:                                          ; preds = %._crit_edge
  %xtraiter18 = and i32 %28, 7
  %lcmp.mod19 = icmp eq i32 %xtraiter18, 0
  br i1 %lcmp.mod19, label %.prol.loopexit17, label %.prol.preheader16.preheader

.prol.preheader16.preheader:                      ; preds = %.lr.ph4
  br label %.prol.preheader16

.prol.preheader16:                                ; preds = %.prol.preheader16.preheader, %.prol.preheader16
  %indvars.iv13.prol = phi i64 [ %indvars.iv.next14.prol, %.prol.preheader16 ], [ %indvars.iv22, %.prol.preheader16.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader16 ], [ %xtraiter18, %.prol.preheader16.preheader ]
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv13.prol
  store double -9.990000e+02, double* %49, align 8
  %indvars.iv.next14.prol = add nuw nsw i64 %indvars.iv13.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit17.loopexit, label %.prol.preheader16, !llvm.loop !1

.prol.loopexit17.loopexit:                        ; preds = %.prol.preheader16
  br label %.prol.loopexit17

.prol.loopexit17:                                 ; preds = %.prol.loopexit17.loopexit, %.lr.ph4
  %indvars.iv13.unr = phi i64 [ %indvars.iv22, %.lr.ph4 ], [ %25, %.prol.loopexit17.loopexit ]
  %50 = icmp ult i32 %29, 7
  br i1 %50, label %.loopexit, label %.lr.ph4.new.preheader

.lr.ph4.new.preheader:                            ; preds = %.prol.loopexit17
  %51 = sub i64 992, %indvars.iv13.unr
  %52 = lshr i64 %51, 3
  %53 = add nuw nsw i64 %52, 1
  %min.iters.check = icmp ult i64 %53, 2
  br i1 %min.iters.check, label %.lr.ph4.new.preheader41, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph4.new.preheader
  %n.mod.vf = and i64 %53, 1
  %n.vec = sub nsw i64 %53, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %54 = add i64 %indvars.iv13.unr, 8
  %55 = shl nuw i64 %52, 3
  %56 = add i64 %54, %55
  %57 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %56, %57
  br i1 %cmp.zero, label %.lr.ph4.new.preheader41, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %58 = shl i64 %index, 3
  %59 = add i64 %indvars.iv13.unr, %58
  %60 = add nsw i64 %59, 7
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %60
  %62 = getelementptr double, double* %61, i64 -7
  %63 = bitcast double* %62 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %63, align 8
  %index.next = add i64 %index, 2
  %64 = icmp eq i64 %index.next, %n.vec
  br i1 %64, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.loopexit, label %.lr.ph4.new.preheader41

.lr.ph4.new.preheader41:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph4.new.preheader
  %indvars.iv13.ph = phi i64 [ %indvars.iv13.unr, %min.iters.checked ], [ %indvars.iv13.unr, %.lr.ph4.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph4.new

.lr.ph4.new:                                      ; preds = %.lr.ph4.new.preheader41, %.lr.ph4.new
  %indvars.iv13 = phi i64 [ %indvars.iv.next14.7, %.lr.ph4.new ], [ %indvars.iv13.ph, %.lr.ph4.new.preheader41 ]
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv13
  store double -9.990000e+02, double* %65, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv.next14
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv.next14.1
  store double -9.990000e+02, double* %67, align 8
  %indvars.iv.next14.2 = add nsw i64 %indvars.iv13, 3
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv.next14.2
  store double -9.990000e+02, double* %68, align 8
  %indvars.iv.next14.3 = add nsw i64 %indvars.iv13, 4
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv.next14.3
  store double -9.990000e+02, double* %69, align 8
  %indvars.iv.next14.4 = add nsw i64 %indvars.iv13, 5
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv.next14.4
  store double -9.990000e+02, double* %70, align 8
  %indvars.iv.next14.5 = add nsw i64 %indvars.iv13, 6
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv.next14.5
  store double -9.990000e+02, double* %71, align 8
  %indvars.iv.next14.6 = add nsw i64 %indvars.iv13, 7
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv.next14.6
  store double -9.990000e+02, double* %72, align 8
  %indvars.iv.next14.7 = add nsw i64 %indvars.iv13, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next14.7, 1000
  br i1 %exitcond.7, label %.loopexit.loopexit, label %.lr.ph4.new, !llvm.loop !6

._crit_edge5:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]* readonly, [1200 x double]* readonly) unnamed_addr #2 {
.preheader3.us.preheader:
  %7 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert54 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat55 = shufflevector <2 x double> %broadcast.splatinsert54, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert58 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat59 = shufflevector <2 x double> %broadcast.splatinsert58, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert60 = insertelement <2 x double> undef, double %7, i32 0
  %broadcast.splat61 = shufflevector <2 x double> %broadcast.splatinsert60, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge8.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge8.us ], [ 0, %.preheader3.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 0
  %8 = add i64 %indvars.iv34, 1
  %scevgep42 = getelementptr [1200 x double], [1200 x double]* %4, i64 %8, i64 0
  %9 = icmp sgt i64 %indvars.iv34, 0
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv34, i64 %indvars.iv34
  br i1 %9, label %.preheader.us.us.preheader, label %vector.memcheck

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  br label %.preheader.us.us

vector.memcheck:                                  ; preds = %.preheader3.us
  %scevgep46 = getelementptr [1200 x double], [1200 x double]* %6, i64 %8, i64 0
  %scevgep44 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep46
  %bound1 = icmp ult double* %scevgep44, %scevgep42
  %found.conflict = and i1 %bound0, %bound1
  %bound049 = icmp ult double* %scevgep, %10
  %bound150 = icmp ult double* %10, %scevgep42
  %found.conflict51 = and i1 %bound049, %bound150
  %conflict.rdx = or i1 %found.conflict, %found.conflict51
  br i1 %conflict.rdx, label %.preheader.us14.preheader, label %vector.ph

.preheader.us14.preheader:                        ; preds = %vector.memcheck
  br label %.preheader.us14

vector.ph:                                        ; preds = %vector.memcheck
  %11 = load double, double* %10, align 8, !alias.scope !8
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  %14 = insertelement <2 x double> undef, double %11, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 %index
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !11, !noalias !13
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !11, !noalias !13
  %20 = fmul <2 x double> %wide.load, %broadcast.splat55
  %21 = fmul <2 x double> %wide.load53, %broadcast.splat55
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 %index
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !15
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !15
  %26 = fmul <2 x double> %wide.load56, %broadcast.splat59
  %27 = fmul <2 x double> %wide.load57, %broadcast.splat59
  %28 = fmul <2 x double> %26, %13
  %29 = fmul <2 x double> %27, %15
  %30 = fadd <2 x double> %20, %28
  %31 = fadd <2 x double> %21, %29
  %32 = fadd <2 x double> %broadcast.splat61, %30
  %33 = fadd <2 x double> %broadcast.splat61, %31
  %34 = bitcast double* %16 to <2 x double>*
  store <2 x double> %32, <2 x double>* %34, align 8, !alias.scope !11, !noalias !13
  %35 = bitcast double* %18 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %36 = icmp eq i64 %index.next, 1200
  br i1 %36, label %._crit_edge8.us.loopexit63, label %vector.body, !llvm.loop !16

.preheader.us14:                                  ; preds = %.preheader.us14, %.preheader.us14.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.us14.preheader ], [ %indvars.iv.next.1, %.preheader.us14 ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %3
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %2
  %43 = load double, double* %10, align 8
  %44 = fmul double %42, %43
  %45 = fadd double %39, %44
  %46 = fadd double %7, %45
  store double %46, double* %37, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %3
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %2
  %53 = load double, double* %10, align 8
  %54 = fmul double %52, %53
  %55 = fadd double %49, %54
  %56 = fadd double %7, %55
  store double %56, double* %47, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %._crit_edge8.us.loopexit62, label %.preheader.us14, !llvm.loop !17

._crit_edge8.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge8.us

._crit_edge8.us.loopexit62:                       ; preds = %.preheader.us14
  br label %._crit_edge8.us

._crit_edge8.us.loopexit63:                       ; preds = %vector.body
  br label %._crit_edge8.us

._crit_edge8.us:                                  ; preds = %._crit_edge8.us.loopexit63, %._crit_edge8.us.loopexit62, %._crit_edge8.us.loopexit
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 1000
  br i1 %exitcond37, label %._crit_edge9, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 %indvars.iv30
  br label %68

._crit_edge.us.us:                                ; preds = %68
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 %indvars.iv30
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %3
  %61 = load double, double* %57, align 8
  %62 = fmul double %61, %2
  %63 = load double, double* %10, align 8
  %64 = fmul double %62, %63
  %65 = fadd double %60, %64
  %66 = fmul double %81, %2
  %67 = fadd double %66, %65
  store double %67, double* %58, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, 1200
  br i1 %exitcond33, label %._crit_edge8.us.loopexit, label %.preheader.us.us

; <label>:68:                                     ; preds = %68, %.preheader.us.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %68 ], [ 0, %.preheader.us.us ]
  %.05.us.us = phi double [ %81, %68 ], [ 0.000000e+00, %.preheader.us.us ]
  %69 = load double, double* %57, align 8
  %70 = fmul double %69, %2
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv34, i64 %indvars.iv24
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv24, i64 %indvars.iv30
  %75 = load double, double* %74, align 8
  %76 = fadd double %75, %73
  store double %76, double* %74, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv24, i64 %indvars.iv30
  %78 = load double, double* %77, align 8
  %79 = load double, double* %71, align 8
  %80 = fmul double %78, %79
  %81 = fadd double %.05.us.us, %80
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next25, %indvars.iv34
  br i1 %exitcond29, label %._crit_edge.us.us, label %68

._crit_edge9:                                     ; preds = %._crit_edge8.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge1.us, %.preheader.us.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next5, %._crit_edge1.us ]
  %7 = mul nuw nsw i64 %indvars.iv4, 1000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %13, %8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge1.us, label %8

._crit_edge1.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond7, label %._crit_edge2, label %.preheader.us

._crit_edge2:                                     ; preds = %._crit_edge1.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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

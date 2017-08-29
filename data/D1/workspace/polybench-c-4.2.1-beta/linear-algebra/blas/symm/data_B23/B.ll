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
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
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
  %7 = add i64 %indvars.iv30, 1200
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
  %exitcond = icmp eq i64 %indvars.iv.next28, 1200
  br i1 %exitcond, label %._crit_edge7.us, label %9

._crit_edge7.us:                                  ; preds = %9
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next31, 1000
  br i1 %exitcond41, label %.lr.ph.preheader, label %.preheader2.us

.lr.ph.preheader:                                 ; preds = %._crit_edge7.us
  br label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph4.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %.prol.loopexit17, %._crit_edge
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %indvars.iv.next37 = add nuw i64 %indvars.iv36, 1
  %indvars.iv.next39 = add i3 %indvars.iv38, -1
  %exitcond40 = icmp eq i64 %indvars.iv.next25, 1000
  br i1 %exitcond40, label %._crit_edge5, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.loopexit
  %indvars.iv38 = phi i3 [ %indvars.iv.next39, %.loopexit ], [ -1, %.lr.ph.preheader ]
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %.loopexit ], [ 2, %.lr.ph.preheader ]
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %.loopexit ], [ 0, %.lr.ph.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %.loopexit ], [ 1, %.lr.ph.preheader ]
  %22 = zext i3 %indvars.iv38 to i64
  %23 = add nuw nsw i64 %22, 4294967295
  %24 = and i64 %23, 4294967295
  %25 = add i64 %indvars.iv36, %24
  %26 = sub nsw i64 0, %indvars.iv24
  %27 = trunc i64 %26 to i32
  %28 = add i32 %27, 7
  %29 = add i32 %27, 998
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %xtraiter35 = and i64 %indvars.iv.next25, 1
  %lcmp.mod = icmp eq i64 %xtraiter35, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %30 = trunc i64 %indvars.iv24 to i32
  %31 = srem i32 %30, 100
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 1.000000e+03
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 0
  store double %33, double* %34, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %35 = icmp eq i64 %indvars.iv24, 0
  br i1 %35, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %36 = add nuw nsw i64 %indvars.iv, %indvars.iv24
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 100
  %39 = sitofp i32 %38 to double
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = add nuw nsw i64 %indvars.iv.next, %indvars.iv24
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, 100
  %44 = sitofp i32 %43 to double
  %45 = insertelement <2 x double> undef, double %39, i32 0
  %46 = insertelement <2 x double> %45, double %44, i32 1
  %47 = fdiv <2 x double> %46, <double 1.000000e+03, double 1.000000e+03>
  %48 = bitcast double* %40 to <2 x double>*
  store <2 x double> %47, <2 x double>* %48, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv22
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %49 = icmp slt i64 %indvars.iv.next25, 1000
  br i1 %49, label %.lr.ph4, label %.loopexit

.lr.ph4:                                          ; preds = %._crit_edge
  %xtraiter18 = and i32 %28, 7
  %lcmp.mod19 = icmp eq i32 %xtraiter18, 0
  br i1 %lcmp.mod19, label %.prol.loopexit17, label %.prol.preheader16.preheader

.prol.preheader16.preheader:                      ; preds = %.lr.ph4
  br label %.prol.preheader16

.prol.preheader16:                                ; preds = %.prol.preheader16.preheader, %.prol.preheader16
  %indvars.iv13.prol = phi i64 [ %indvars.iv.next14.prol, %.prol.preheader16 ], [ %indvars.iv22, %.prol.preheader16.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader16 ], [ %xtraiter18, %.prol.preheader16.preheader ]
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv13.prol
  store double -9.990000e+02, double* %50, align 8
  %indvars.iv.next14.prol = add nuw nsw i64 %indvars.iv13.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit17.loopexit, label %.prol.preheader16, !llvm.loop !1

.prol.loopexit17.loopexit:                        ; preds = %.prol.preheader16
  br label %.prol.loopexit17

.prol.loopexit17:                                 ; preds = %.prol.loopexit17.loopexit, %.lr.ph4
  %indvars.iv13.unr = phi i64 [ %indvars.iv22, %.lr.ph4 ], [ %25, %.prol.loopexit17.loopexit ]
  %51 = icmp ult i32 %29, 7
  br i1 %51, label %.loopexit, label %.lr.ph4.new.preheader

.lr.ph4.new.preheader:                            ; preds = %.prol.loopexit17
  %52 = sub i64 992, %indvars.iv13.unr
  %53 = lshr i64 %52, 3
  %54 = add nuw nsw i64 %53, 1
  %min.iters.check = icmp ult i64 %54, 2
  br i1 %min.iters.check, label %.lr.ph4.new.preheader43, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph4.new.preheader
  %n.mod.vf = and i64 %54, 1
  %n.vec = sub nsw i64 %54, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %55 = add i64 %indvars.iv13.unr, 8
  %56 = shl nuw i64 %53, 3
  %57 = add i64 %55, %56
  %58 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %57, %58
  br i1 %cmp.zero, label %.lr.ph4.new.preheader43, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %59 = shl i64 %index, 3
  %60 = add i64 %indvars.iv13.unr, %59
  %61 = add nsw i64 %60, 7
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %61
  %63 = getelementptr double, double* %62, i64 -7
  %64 = bitcast double* %63 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %64, align 8
  %index.next = add i64 %index, 2
  %65 = icmp eq i64 %index.next, %n.vec
  br i1 %65, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.loopexit, label %.lr.ph4.new.preheader43

.lr.ph4.new.preheader43:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph4.new.preheader
  %indvars.iv13.ph = phi i64 [ %indvars.iv13.unr, %min.iters.checked ], [ %indvars.iv13.unr, %.lr.ph4.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph4.new

.lr.ph4.new:                                      ; preds = %.lr.ph4.new.preheader43, %.lr.ph4.new
  %indvars.iv13 = phi i64 [ %indvars.iv.next14.7, %.lr.ph4.new ], [ %indvars.iv13.ph, %.lr.ph4.new.preheader43 ]
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv13
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv.next14
  store double -9.990000e+02, double* %67, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv.next14.1
  store double -9.990000e+02, double* %68, align 8
  %indvars.iv.next14.2 = add nsw i64 %indvars.iv13, 3
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv.next14.2
  store double -9.990000e+02, double* %69, align 8
  %indvars.iv.next14.3 = add nsw i64 %indvars.iv13, 4
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv.next14.3
  store double -9.990000e+02, double* %70, align 8
  %indvars.iv.next14.4 = add nsw i64 %indvars.iv13, 5
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv.next14.4
  store double -9.990000e+02, double* %71, align 8
  %indvars.iv.next14.5 = add nsw i64 %indvars.iv13, 6
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv.next14.5
  store double -9.990000e+02, double* %72, align 8
  %indvars.iv.next14.6 = add nsw i64 %indvars.iv13, 7
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv.next14.6
  store double -9.990000e+02, double* %73, align 8
  %indvars.iv.next14.7 = add nsw i64 %indvars.iv13, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next14.7, 1000
  br i1 %exitcond.7, label %.loopexit.loopexit, label %.lr.ph4.new, !llvm.loop !6

._crit_edge5:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]* readonly, [1200 x double]* readonly) unnamed_addr #2 {
.preheader.lr.ph:
  %7 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert62 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat63 = shufflevector <2 x double> %broadcast.splatinsert62, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert66 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat67 = shufflevector <2 x double> %broadcast.splatinsert66, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert68 = insertelement <2 x double> undef, double %7, i32 0
  %broadcast.splat69 = shufflevector <2 x double> %broadcast.splatinsert68, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge18, %.preheader.lr.ph
  %indvars.iv37 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next38, %._crit_edge18 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 0
  %scevgep50 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 1200
  %8 = icmp sgt i64 %indvars.iv37, 0
  br i1 %8, label %.lr.ph17.split.us.preheader, label %.lr.ph17.split.preheader

.lr.ph17.split.us.preheader:                      ; preds = %.preheader
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv37
  br label %.lr.ph17.split.us

.lr.ph17.split.preheader:                         ; preds = %.preheader
  %scevgep54 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv37, i64 1200
  %scevgep52 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv37, i64 0
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv37
  %bound0 = icmp ult double* %scevgep, %scevgep54
  %bound1 = icmp ult double* %scevgep52, %scevgep50
  %found.conflict = and i1 %bound0, %bound1
  %bound057 = icmp ult double* %scevgep, %10
  %bound158 = icmp ult double* %10, %scevgep50
  %found.conflict59 = and i1 %bound057, %bound158
  %conflict.rdx = or i1 %found.conflict, %found.conflict59
  br i1 %conflict.rdx, label %.lr.ph17.split.preheader70, label %vector.ph

.lr.ph17.split.preheader70:                       ; preds = %.lr.ph17.split.preheader
  br label %.lr.ph17.split

vector.ph:                                        ; preds = %.lr.ph17.split.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %index
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !8, !noalias !11
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load61 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !8, !noalias !11
  %15 = fmul <2 x double> %wide.load, %broadcast.splat63
  %16 = fmul <2 x double> %wide.load61, %broadcast.splat63
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv37, i64 %index
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load64 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !14
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !14
  %21 = fmul <2 x double> %wide.load64, %broadcast.splat67
  %22 = fmul <2 x double> %wide.load65, %broadcast.splat67
  %23 = load double, double* %10, align 8, !alias.scope !15
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = insertelement <2 x double> undef, double %23, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = fmul <2 x double> %21, %25
  %29 = fmul <2 x double> %22, %27
  %30 = fadd <2 x double> %15, %28
  %31 = fadd <2 x double> %16, %29
  %32 = fadd <2 x double> %broadcast.splat69, %30
  %33 = fadd <2 x double> %broadcast.splat69, %31
  %34 = bitcast double* %11 to <2 x double>*
  store <2 x double> %32, <2 x double>* %34, align 8, !alias.scope !8, !noalias !11
  %35 = bitcast double* %13 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %36 = icmp eq i64 %index.next, 1200
  br i1 %36, label %._crit_edge18.loopexit72, label %vector.body, !llvm.loop !16

.lr.ph17.split.us:                                ; preds = %.lr.ph17.split.us.preheader, %._crit_edge.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge.us ], [ 0, %.lr.ph17.split.us.preheader ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv37, i64 %indvars.iv33
  br label %38

; <label>:38:                                     ; preds = %38, %.lr.ph17.split.us
  %39 = phi double [ 0.000000e+00, %.lr.ph17.split.us ], [ %53, %38 ]
  %indvars.iv27 = phi i64 [ 0, %.lr.ph17.split.us ], [ %indvars.iv.next28, %38 ]
  %40 = load double, double* %37, align 8
  %41 = fmul double %40, %2
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv27
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv33
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %45, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv27, i64 %indvars.iv33
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv27
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %39, %52
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next28, %indvars.iv37
  br i1 %exitcond32, label %._crit_edge.us, label %38

._crit_edge.us:                                   ; preds = %38
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv33
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %3
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv37, i64 %indvars.iv33
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, %2
  %60 = load double, double* %9, align 8
  %61 = fmul double %59, %60
  %62 = fadd double %56, %61
  %63 = fmul double %53, %2
  %64 = fadd double %63, %62
  store double %64, double* %54, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond = icmp eq i64 %indvars.iv.next34, 1200
  br i1 %exitcond, label %._crit_edge18.loopexit, label %.lr.ph17.split.us

.lr.ph17.split:                                   ; preds = %.lr.ph17.split, %.lr.ph17.split.preheader70
  %indvars.iv = phi i64 [ 0, %.lr.ph17.split.preheader70 ], [ %indvars.iv.next.1, %.lr.ph17.split ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = fmul double %66, %3
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv37, i64 %indvars.iv
  %69 = load double, double* %68, align 8
  %70 = fmul double %69, %2
  %71 = load double, double* %10, align 8
  %72 = fmul double %70, %71
  %73 = fadd double %67, %72
  %74 = fadd double %7, %73
  store double %74, double* %65, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next
  %76 = load double, double* %75, align 8
  %77 = fmul double %76, %3
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv37, i64 %indvars.iv.next
  %79 = load double, double* %78, align 8
  %80 = fmul double %79, %2
  %81 = load double, double* %10, align 8
  %82 = fmul double %80, %81
  %83 = fadd double %77, %82
  %84 = fadd double %7, %83
  store double %84, double* %75, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond43.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond43.1, label %._crit_edge18.loopexit71, label %.lr.ph17.split, !llvm.loop !17

._crit_edge18.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge18

._crit_edge18.loopexit71:                         ; preds = %.lr.ph17.split
  br label %._crit_edge18

._crit_edge18.loopexit72:                         ; preds = %vector.body
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit72, %._crit_edge18.loopexit71, %._crit_edge18.loopexit
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond44, label %._crit_edge21, label %.preheader

._crit_edge21:                                    ; preds = %._crit_edge18
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
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge1.us, %.preheader.us.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next5, %._crit_edge1.us ]
  %7 = mul nsw i64 %indvars.iv4, 1000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %9 = add nsw i64 %indvars.iv, %7
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
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond9, label %._crit_edge1.us, label %8

._crit_edge1.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond, label %._crit_edge2, label %.preheader.us

._crit_edge2:                                     ; preds = %._crit_edge1.us
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
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{!12}
!15 = !{!13}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}

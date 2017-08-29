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
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  %13 = bitcast i8* %5 to [1200 x double]*
  %14 = bitcast i8* %6 to [1000 x double]*
  %15 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @kernel_symm(double %11, double %12, [1200 x double]* %13, [1000 x double]* %14, [1200 x double]* %15)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %16 = icmp sgt i32 %0, 42
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %2
  %18 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %18, align 1
  %19 = icmp eq i8 %strcmpload, 0
  br i1 %19, label %20, label %._crit_edge

; <label>:20:                                     ; preds = %17
  %21 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %21)
  br label %._crit_edge

._crit_edge:                                      ; preds = %17, %2, %20
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader41

.preheader41:                                     ; preds = %20, %5
  %indvars.iv25 = phi i64 [ 0, %5 ], [ %indvars.iv.next26, %20 ]
  %6 = add nuw nsw i64 %indvars.iv25, 1200
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader41
  %indvars.iv22 = phi i64 [ 0, %.preheader41 ], [ %indvars.iv.next23, %7 ]
  %8 = add nuw nsw i64 %indvars.iv22, %indvars.iv25
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 100
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.000000e+03
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv22
  store double %12, double* %13, align 8
  %14 = sub nuw nsw i64 %6, %indvars.iv22
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 100
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv22
  store double %18, double* %19, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond24, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next26, 1000
  br i1 %exitcond27, label %.lr.ph.preheader, label %.preheader41

.lr.ph.preheader:                                 ; preds = %20
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge
  %indvars.iv31 = phi i3 [ %indvars.iv.next32, %._crit_edge ], [ -1, %.lr.ph.preheader ]
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %._crit_edge ], [ 2, %.lr.ph.preheader ]
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge ], [ 0, %.lr.ph.preheader ]
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge ], [ 1, %.lr.ph.preheader ]
  %21 = zext i3 %indvars.iv31 to i64
  %22 = add nuw nsw i64 %21, 4294967295
  %23 = and i64 %22, 4294967295
  %24 = add i64 %indvars.iv29, %23
  %25 = sub nuw nsw i64 999, %indvars.iv20
  %26 = sub nsw i64 998, %indvars.iv20
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %xtraiter28 = and i64 %indvars.iv.next21, 1
  %lcmp.mod = icmp eq i64 %xtraiter28, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %27 = trunc i64 %indvars.iv20 to i32
  %28 = srem i32 %27, 100
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 1.000000e+03
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 0
  store double %30, double* %31, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %32 = icmp eq i64 %indvars.iv20, 0
  br i1 %32, label %.preheader, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.preheader.loopexit:                              ; preds = %.lr.ph.new
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.prol.loopexit
  %33 = icmp slt i64 %indvars.iv.next21, 1000
  br i1 %33, label %.lr.ph2, label %._crit_edge

.lr.ph2:                                          ; preds = %.preheader
  %34 = trunc i64 %25 to i32
  %xtraiter14 = and i32 %34, 7
  %lcmp.mod15 = icmp eq i32 %xtraiter14, 0
  br i1 %lcmp.mod15, label %.prol.loopexit13, label %.prol.preheader12.preheader

.prol.preheader12.preheader:                      ; preds = %.lr.ph2
  br label %.prol.preheader12

.prol.preheader12:                                ; preds = %.prol.preheader12.preheader, %.prol.preheader12
  %indvars.iv10.prol = phi i64 [ %indvars.iv.next11.prol, %.prol.preheader12 ], [ %indvars.iv18, %.prol.preheader12.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader12 ], [ %xtraiter14, %.prol.preheader12.preheader ]
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv10.prol
  store double -9.990000e+02, double* %35, align 8
  %indvars.iv.next11.prol = add nuw nsw i64 %indvars.iv10.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit13.loopexit, label %.prol.preheader12, !llvm.loop !1

.prol.loopexit13.loopexit:                        ; preds = %.prol.preheader12
  br label %.prol.loopexit13

.prol.loopexit13:                                 ; preds = %.prol.loopexit13.loopexit, %.lr.ph2
  %indvars.iv10.unr = phi i64 [ %indvars.iv18, %.lr.ph2 ], [ %24, %.prol.loopexit13.loopexit ]
  %36 = trunc i64 %26 to i32
  %37 = icmp ult i32 %36, 7
  br i1 %37, label %._crit_edge, label %.lr.ph2.new.preheader

.lr.ph2.new.preheader:                            ; preds = %.prol.loopexit13
  %38 = sub i64 992, %indvars.iv10.unr
  %39 = lshr i64 %38, 3
  %40 = add nuw nsw i64 %39, 1
  %min.iters.check = icmp ult i64 %40, 2
  br i1 %min.iters.check, label %.lr.ph2.new.preheader33, label %min.iters.checked

.lr.ph2.new.preheader33:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph2.new.preheader
  %indvars.iv10.ph = phi i64 [ %indvars.iv10.unr, %min.iters.checked ], [ %indvars.iv10.unr, %.lr.ph2.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph2.new

min.iters.checked:                                ; preds = %.lr.ph2.new.preheader
  %n.mod.vf = and i64 %40, 1
  %n.vec = sub nsw i64 %40, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %41 = add i64 %indvars.iv10.unr, 8
  %42 = shl nuw i64 %39, 3
  %43 = add i64 %41, %42
  %44 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %43, %44
  br i1 %cmp.zero, label %.lr.ph2.new.preheader33, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %45 = shl i64 %index, 3
  %46 = add i64 %indvars.iv10.unr, %45
  %47 = add nsw i64 %46, 7
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %47
  %49 = getelementptr double, double* %48, i64 -7
  %50 = bitcast double* %49 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %50, align 8
  %index.next = add i64 %index, 2
  %51 = icmp eq i64 %index.next, %n.vec
  br i1 %51, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph2.new.preheader33

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %52 = add nuw nsw i64 %indvars.iv, %indvars.iv20
  %53 = trunc i64 %52 to i32
  %54 = srem i32 %53, 100
  %55 = sitofp i32 %54 to double
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %57 = add nuw nsw i64 %indvars.iv.next, %indvars.iv20
  %58 = trunc i64 %57 to i32
  %59 = srem i32 %58, 100
  %60 = sitofp i32 %59 to double
  %61 = insertelement <2 x double> undef, double %55, i32 0
  %62 = insertelement <2 x double> %61, double %60, i32 1
  %63 = fdiv <2 x double> %62, <double 1.000000e+03, double 1.000000e+03>
  %64 = bitcast double* %56 to <2 x double>*
  store <2 x double> %63, <2 x double>* %64, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv18
  br i1 %exitcond.1, label %.preheader.loopexit, label %.lr.ph.new

.lr.ph2.new:                                      ; preds = %.lr.ph2.new.preheader33, %.lr.ph2.new
  %indvars.iv10 = phi i64 [ %indvars.iv.next11.7, %.lr.ph2.new ], [ %indvars.iv10.ph, %.lr.ph2.new.preheader33 ]
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv10
  store double -9.990000e+02, double* %65, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv.next11
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next11.1 = add nsw i64 %indvars.iv10, 2
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv.next11.1
  store double -9.990000e+02, double* %67, align 8
  %indvars.iv.next11.2 = add nsw i64 %indvars.iv10, 3
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv.next11.2
  store double -9.990000e+02, double* %68, align 8
  %indvars.iv.next11.3 = add nsw i64 %indvars.iv10, 4
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv.next11.3
  store double -9.990000e+02, double* %69, align 8
  %indvars.iv.next11.4 = add nsw i64 %indvars.iv10, 5
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv.next11.4
  store double -9.990000e+02, double* %70, align 8
  %indvars.iv.next11.5 = add nsw i64 %indvars.iv10, 6
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv.next11.5
  store double -9.990000e+02, double* %71, align 8
  %indvars.iv.next11.6 = add nsw i64 %indvars.iv10, 7
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv.next11.6
  store double -9.990000e+02, double* %72, align 8
  %indvars.iv.next11.7 = add nsw i64 %indvars.iv10, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next11.7, 1000
  br i1 %exitcond.7, label %._crit_edge.loopexit, label %.lr.ph2.new, !llvm.loop !6

._crit_edge.loopexit:                             ; preds = %.lr.ph2.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %.prol.loopexit13, %.preheader
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next21, 1000
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %indvars.iv.next32 = add i3 %indvars.iv31, -1
  br i1 %exitcond, label %73, label %.lr.ph

; <label>:73:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #2 {
  %6 = fmul double %0, 0.000000e+00
  %broadcast.splatinsert36 = insertelement <2 x double> undef, double %1, i32 0
  %broadcast.splat37 = shufflevector <2 x double> %broadcast.splatinsert36, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert40 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat41 = shufflevector <2 x double> %broadcast.splatinsert40, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert42 = insertelement <2 x double> undef, double %6, i32 0
  %broadcast.splat43 = shufflevector <2 x double> %broadcast.splatinsert42, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader44

.preheader44:                                     ; preds = %.us-lcssa.us, %5
  %indvars.iv17 = phi i64 [ 0, %5 ], [ %indvars.iv.next18, %.us-lcssa.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 0
  %7 = add i64 %indvars.iv17, 1
  %scevgep24 = getelementptr [1200 x double], [1200 x double]* %2, i64 %7, i64 0
  %8 = icmp sgt i64 %indvars.iv17, 0
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv17, i64 %indvars.iv17
  br i1 %8, label %.preheader.us.preheader, label %vector.memcheck

.preheader.us.preheader:                          ; preds = %.preheader44
  br label %.preheader.us

vector.memcheck:                                  ; preds = %.preheader44
  %scevgep28 = getelementptr [1200 x double], [1200 x double]* %4, i64 %7, i64 0
  %scevgep26 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep28
  %bound1 = icmp ult double* %scevgep26, %scevgep24
  %found.conflict = and i1 %bound0, %bound1
  %bound031 = icmp ult double* %scevgep, %9
  %bound132 = icmp ult double* %9, %scevgep24
  %found.conflict33 = and i1 %bound031, %bound132
  %conflict.rdx = or i1 %found.conflict, %found.conflict33
  br i1 %conflict.rdx, label %.preheader.preheader, label %vector.ph

.preheader.preheader:                             ; preds = %vector.memcheck
  br label %.preheader

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !8, !noalias !11
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load35 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !8, !noalias !11
  %14 = fmul <2 x double> %wide.load, %broadcast.splat37
  %15 = fmul <2 x double> %wide.load35, %broadcast.splat37
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %index
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !14
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !14
  %20 = fmul <2 x double> %wide.load38, %broadcast.splat41
  %21 = fmul <2 x double> %wide.load39, %broadcast.splat41
  %22 = load double, double* %9, align 8, !alias.scope !15
  %23 = insertelement <2 x double> undef, double %22, i32 0
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = insertelement <2 x double> undef, double %22, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  %27 = fmul <2 x double> %20, %24
  %28 = fmul <2 x double> %21, %26
  %29 = fadd <2 x double> %14, %27
  %30 = fadd <2 x double> %15, %28
  %31 = fadd <2 x double> %broadcast.splat43, %29
  %32 = fadd <2 x double> %broadcast.splat43, %30
  %33 = bitcast double* %10 to <2 x double>*
  store <2 x double> %31, <2 x double>* %33, align 8, !alias.scope !8, !noalias !11
  %34 = bitcast double* %12 to <2 x double>*
  store <2 x double> %32, <2 x double>* %34, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %35 = icmp eq i64 %index.next, 1200
  br i1 %35, label %.us-lcssa.us.loopexit45, label %vector.body, !llvm.loop !16

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv14
  br label %37

; <label>:37:                                     ; preds = %37, %.preheader.us
  %indvars.iv9 = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next10, %37 ]
  %.02.us = phi double [ 0.000000e+00, %.preheader.us ], [ %51, %37 ]
  %38 = load double, double* %36, align 8
  %39 = fmul double %38, %0
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv17, i64 %indvars.iv9
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv14
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, %42
  store double %45, double* %43, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv9, i64 %indvars.iv14
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv17, i64 %indvars.iv9
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %.02.us, %50
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next10, %indvars.iv17
  br i1 %exitcond13, label %._crit_edge.us, label %37

._crit_edge.us:                                   ; preds = %37
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv14
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %1
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv14
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %0
  %58 = load double, double* %9, align 8
  %59 = fmul double %57, %58
  %60 = fadd double %54, %59
  %61 = fmul double %51, %0
  %62 = fadd double %61, %60
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv14
  store double %62, double* %63, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %.us-lcssa.us.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next.1, %.preheader ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv
  %65 = load double, double* %64, align 8
  %66 = fmul double %65, %1
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %0
  %70 = load double, double* %9, align 8
  %71 = fmul double %69, %70
  %72 = fadd double %66, %71
  %73 = fadd double %6, %72
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv
  store double %73, double* %74, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv.next
  %76 = load double, double* %75, align 8
  %77 = fmul double %76, %1
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv.next
  %79 = load double, double* %78, align 8
  %80 = fmul double %79, %0
  %81 = load double, double* %9, align 8
  %82 = fmul double %80, %81
  %83 = fadd double %77, %82
  %84 = fadd double %6, %83
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv.next
  store double %84, double* %85, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %.us-lcssa.us.loopexit44, label %.preheader, !llvm.loop !17

.us-lcssa.us.loopexit:                            ; preds = %._crit_edge.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit44:                          ; preds = %.preheader
  br label %.us-lcssa.us

.us-lcssa.us.loopexit45:                          ; preds = %vector.body
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit45, %.us-lcssa.us.loopexit44, %.us-lcssa.us.loopexit
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 1000
  br i1 %exitcond19, label %86, label %.preheader44

; <label>:86:                                     ; preds = %.us-lcssa.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %18, %1
  %indvars.iv3 = phi i64 [ 0, %1 ], [ %indvars.iv.next4, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv3, 1000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %18, label %7

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1000
  br i1 %exitcond5, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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

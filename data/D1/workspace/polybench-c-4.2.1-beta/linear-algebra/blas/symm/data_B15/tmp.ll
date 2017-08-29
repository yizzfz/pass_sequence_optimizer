; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  call void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
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
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader40.lr.ph, label %._crit_edge47

.preheader40.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  br i1 %9, label %.preheader40.us.preheader, label %.preheader.lr.ph

.preheader40.us.preheader:                        ; preds = %.preheader40.lr.ph
  %11 = zext i32 %1 to i64
  %wide.trip.count80 = zext i32 %1 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader40.us

.preheader40.us:                                  ; preds = %._crit_edge50.us, %.preheader40.us.preheader
  %indvars.iv71 = phi i64 [ 0, %.preheader40.us.preheader ], [ %indvars.iv.next72, %._crit_edge50.us ]
  %12 = add i64 %indvars.iv71, %11
  %13 = trunc i64 %12 to i32
  br label %._crit_edge83

._crit_edge83:                                    ; preds = %._crit_edge83, %.preheader40.us
  %indvars.iv68 = phi i64 [ 0, %.preheader40.us ], [ %indvars.iv.next69, %._crit_edge83 ]
  %14 = add nuw nsw i64 %indvars.iv68, %indvars.iv71
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 100
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %10
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv71, i64 %indvars.iv68
  store double %18, double* %19, align 8
  %20 = trunc i64 %indvars.iv68 to i32
  %21 = sub i32 %13, %20
  %22 = srem i32 %21, 100
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %10
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv71, i64 %indvars.iv68
  store double %24, double* %25, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next69, %wide.trip.count80
  br i1 %exitcond81, label %._crit_edge50.us, label %._crit_edge83

._crit_edge50.us:                                 ; preds = %._crit_edge83
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next72, %wide.trip.count
  br i1 %exitcond82, label %.preheader39, label %.preheader40.us

.preheader39:                                     ; preds = %._crit_edge50.us
  %26 = icmp sgt i32 %0, 0
  br i1 %26, label %.preheader.lr.ph, label %._crit_edge47

.preheader.lr.ph:                                 ; preds = %.preheader40.lr.ph, %.preheader39
  %27 = sitofp i32 %0 to double
  %28 = sext i32 %0 to i64
  %wide.trip.count78 = zext i32 %0 to i64
  %wide.trip.count76 = zext i32 %0 to i64
  %29 = add nsw i64 %wide.trip.count78, -1
  br label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph44
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %._crit_edge
  %exitcond79 = icmp eq i64 %indvars.iv.next65, %wide.trip.count78
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  br i1 %exitcond79, label %._crit_edge47.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.loopexit, %.preheader.lr.ph
  %indvars.iv64 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next65, %.loopexit ]
  %indvars.iv62 = phi i64 [ 1, %.preheader.lr.ph ], [ %indvars.iv.next63, %.loopexit ]
  %30 = sub i64 %29, %indvars.iv64
  %31 = add i64 %30, -4
  %32 = lshr i64 %31, 2
  %33 = add nuw nsw i64 %32, 1
  %34 = sub i64 %29, %indvars.iv64
  %35 = and i64 %indvars.iv64, 1
  %lcmp.mod = icmp eq i64 %35, 0
  br i1 %lcmp.mod, label %._crit_edge84.prol.preheader, label %._crit_edge84.prol.loopexit.unr-lcssa

._crit_edge84.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge84.prol

._crit_edge84.prol:                               ; preds = %._crit_edge84.prol.preheader
  %36 = trunc i64 %indvars.iv64 to i32
  %37 = srem i32 %36, 100
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %27
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 0
  store double %39, double* %40, align 8
  br label %._crit_edge84.prol.loopexit.unr-lcssa

._crit_edge84.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph, %._crit_edge84.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge84.prol ], [ 0, %.lr.ph ]
  br label %._crit_edge84.prol.loopexit

._crit_edge84.prol.loopexit:                      ; preds = %._crit_edge84.prol.loopexit.unr-lcssa
  %41 = icmp eq i64 %indvars.iv64, 0
  br i1 %41, label %._crit_edge, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge84.prol.loopexit
  br label %._crit_edge84

._crit_edge84:                                    ; preds = %._crit_edge84, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %._crit_edge84 ]
  %42 = add nuw nsw i64 %indvars.iv, %indvars.iv64
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, 100
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, %27
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %indvars.iv
  store double %46, double* %47, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = add nuw nsw i64 %indvars.iv.next, %indvars.iv64
  %49 = trunc i64 %48 to i32
  %50 = srem i32 %49, 100
  %51 = sitofp i32 %50 to double
  %52 = fdiv double %51, %27
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %indvars.iv.next
  store double %52, double* %53, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv62
  br i1 %exitcond.1, label %._crit_edge.unr-lcssa, label %._crit_edge84

._crit_edge.unr-lcssa:                            ; preds = %._crit_edge84
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge84.prol.loopexit, %._crit_edge.unr-lcssa
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %54 = icmp slt i64 %indvars.iv.next65, %28
  br i1 %54, label %.lr.ph44.preheader, label %.loopexit

.lr.ph44.preheader:                               ; preds = %._crit_edge
  %min.iters.check = icmp ult i64 %34, 4
  br i1 %min.iters.check, label %.lr.ph44.preheader88, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph44.preheader
  %n.vec = and i64 %34, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv62, %n.vec
  br i1 %cmp.zero, label %.lr.ph44.preheader88, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter89 = and i64 %33, 3
  %lcmp.mod90 = icmp eq i64 %xtraiter89, 0
  br i1 %lcmp.mod90, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter89, %vector.body.prol.preheader ]
  %55 = add i64 %indvars.iv62, %index.prol
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %55
  %57 = bitcast double* %56 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %57, align 8
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %59, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %60 = icmp ult i64 %31, 12
  br i1 %60, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %61 = add i64 %indvars.iv62, %index
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %61
  %63 = bitcast double* %62 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %63, align 8
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %65, align 8
  %index.next = add i64 %index, 4
  %66 = add i64 %indvars.iv62, %index.next
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %66
  %68 = bitcast double* %67 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %68, align 8
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %70, align 8
  %index.next.1 = add i64 %index, 8
  %71 = add i64 %indvars.iv62, %index.next.1
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %71
  %73 = bitcast double* %72 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %73, align 8
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %75, align 8
  %index.next.2 = add i64 %index, 12
  %76 = add i64 %indvars.iv62, %index.next.2
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %76
  %78 = bitcast double* %77 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %78, align 8
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %80, align 8
  %index.next.3 = add i64 %index, 16
  %81 = icmp eq i64 %index.next.3, %n.vec
  br i1 %81, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %34, %n.vec
  br i1 %cmp.n, label %.loopexit, label %.lr.ph44.preheader88

.lr.ph44.preheader88:                             ; preds = %middle.block, %min.iters.checked, %.lr.ph44.preheader
  %indvars.iv58.ph = phi i64 [ %indvars.iv62, %min.iters.checked ], [ %indvars.iv62, %.lr.ph44.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph44

.lr.ph44:                                         ; preds = %.lr.ph44.preheader88, %.lr.ph44
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %.lr.ph44 ], [ %indvars.iv58.ph, %.lr.ph44.preheader88 ]
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %indvars.iv58
  store double -9.990000e+02, double* %82, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next59, %wide.trip.count76
  br i1 %exitcond77, label %.loopexit.loopexit, label %.lr.ph44, !llvm.loop !6

._crit_edge47.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge47

._crit_edge47:                                    ; preds = %._crit_edge47.loopexit, %7, %.preheader39
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader44.us.preheader, label %._crit_edge55

.preheader44.us.preheader:                        ; preds = %7
  %wide.trip.count89 = zext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %10 = fmul double %2, 0.000000e+00
  %wide.trip.count87 = zext i32 %1 to i64
  %11 = add nsw i64 %wide.trip.count, -1
  %min.iters.check = icmp ult i32 %1, 4
  %12 = and i32 %1, 3
  %n.mod.vf = zext i32 %12 to i64
  %n.vec = sub nsw i64 %wide.trip.count, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert106 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat107 = shufflevector <2 x double> %broadcast.splatinsert106, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert110 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat111 = shufflevector <2 x double> %broadcast.splatinsert110, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert112 = insertelement <2 x double> undef, double %10, i32 0
  %broadcast.splat113 = shufflevector <2 x double> %broadcast.splatinsert112, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %12, 0
  br label %.preheader44.us

.preheader44.us:                                  ; preds = %.preheader44.us.preheader, %._crit_edge51.us
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %._crit_edge51.us ], [ 0, %.preheader44.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 0
  %scevgep94 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %wide.trip.count
  %scevgep96 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 0
  %scevgep98 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %wide.trip.count
  %13 = icmp sgt i64 %indvars.iv82, 0
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv82
  br i1 %13, label %.preheader.us.us.preheader, label %.preheader.us61.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader44.us
  br label %.preheader.us.us

.preheader.us61.preheader:                        ; preds = %.preheader44.us
  br i1 %min.iters.check, label %.preheader.us61.preheader114, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us61.preheader
  br i1 %cmp.zero, label %.preheader.us61.preheader114, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep98
  %bound1 = icmp ult double* %scevgep96, %scevgep94
  %found.conflict = and i1 %bound0, %bound1
  %bound0101 = icmp ult double* %scevgep, %14
  %bound1102 = icmp ult double* %14, %scevgep94
  %found.conflict103 = and i1 %bound0101, %bound1102
  %conflict.rdx = or i1 %found.conflict, %found.conflict103
  br i1 %conflict.rdx, label %.preheader.us61.preheader114, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %15 = load double, double* %14, align 8, !alias.scope !8
  %16 = insertelement <2 x double> undef, double %15, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = insertelement <2 x double> undef, double %15, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %index
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !11, !noalias !13
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !11, !noalias !13
  %24 = fmul <2 x double> %wide.load, %broadcast.splat107
  %25 = fmul <2 x double> %wide.load105, %broadcast.splat107
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %index
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load108 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !15
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load109 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !15
  %30 = fmul <2 x double> %wide.load108, %broadcast.splat111
  %31 = fmul <2 x double> %wide.load109, %broadcast.splat111
  %32 = fmul <2 x double> %30, %17
  %33 = fmul <2 x double> %31, %19
  %34 = fadd <2 x double> %24, %32
  %35 = fadd <2 x double> %25, %33
  %36 = fadd <2 x double> %broadcast.splat113, %34
  %37 = fadd <2 x double> %broadcast.splat113, %35
  %38 = bitcast double* %20 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8, !alias.scope !11, !noalias !13
  %39 = bitcast double* %22 to <2 x double>*
  store <2 x double> %37, <2 x double>* %39, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %40 = icmp eq i64 %index.next, %n.vec
  br i1 %40, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge51.us, label %.preheader.us61.preheader114

.preheader.us61.preheader114:                     ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us61.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us61.preheader ], [ %n.vec, %middle.block ]
  %41 = sub nsw i64 %wide.trip.count, %indvars.iv.ph
  %xtraiter = and i64 %41, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us61.prol.loopexit.unr-lcssa, label %.preheader.us61.prol.preheader

.preheader.us61.prol.preheader:                   ; preds = %.preheader.us61.preheader114
  br label %.preheader.us61.prol

.preheader.us61.prol:                             ; preds = %.preheader.us61.prol.preheader
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv.ph
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %3
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv.ph
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %2
  %48 = load double, double* %14, align 8
  %49 = fmul double %47, %48
  %50 = fadd double %44, %49
  %51 = fadd double %10, %50
  store double %51, double* %42, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  br label %.preheader.us61.prol.loopexit.unr-lcssa

.preheader.us61.prol.loopexit.unr-lcssa:          ; preds = %.preheader.us61.preheader114, %.preheader.us61.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.preheader.us61.prol ], [ %indvars.iv.ph, %.preheader.us61.preheader114 ]
  br label %.preheader.us61.prol.loopexit

.preheader.us61.prol.loopexit:                    ; preds = %.preheader.us61.prol.loopexit.unr-lcssa
  %52 = icmp eq i64 %11, %indvars.iv.ph
  br i1 %52, label %._crit_edge51.us.loopexit115, label %.preheader.us61.preheader114.new

.preheader.us61.preheader114.new:                 ; preds = %.preheader.us61.prol.loopexit
  br label %.preheader.us61

.preheader.us61:                                  ; preds = %.preheader.us61, %.preheader.us61.preheader114.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us61.preheader114.new ], [ %indvars.iv.next.1, %.preheader.us61 ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %3
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, %2
  %59 = load double, double* %14, align 8
  %60 = fmul double %58, %59
  %61 = fadd double %55, %60
  %62 = fadd double %10, %61
  store double %62, double* %53, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv.next
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %3
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv.next
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %2
  %69 = load double, double* %14, align 8
  %70 = fmul double %68, %69
  %71 = fadd double %65, %70
  %72 = fadd double %10, %71
  store double %72, double* %63, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond88.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count87
  br i1 %exitcond88.1, label %._crit_edge51.us.loopexit115.unr-lcssa, label %.preheader.us61, !llvm.loop !17

._crit_edge51.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge51.us

._crit_edge51.us.loopexit115.unr-lcssa:           ; preds = %.preheader.us61
  br label %._crit_edge51.us.loopexit115

._crit_edge51.us.loopexit115:                     ; preds = %.preheader.us61.prol.loopexit, %._crit_edge51.us.loopexit115.unr-lcssa
  br label %._crit_edge51.us

._crit_edge51.us:                                 ; preds = %._crit_edge51.us.loopexit115, %._crit_edge51.us.loopexit, %middle.block
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond90 = icmp eq i64 %indvars.iv.next83, %wide.trip.count89
  br i1 %exitcond90, label %._crit_edge55.loopexit, label %.preheader44.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv78
  br label %._crit_edge

._crit_edge.us.us:                                ; preds = %._crit_edge
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv78
  %75 = load double, double* %74, align 8
  %76 = fmul double %75, %3
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv78
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %2
  %80 = load double, double* %14, align 8
  %81 = fmul double %79, %80
  %82 = fadd double %76, %81
  %83 = fmul double %97, %2
  %84 = fadd double %83, %82
  store double %84, double* %74, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond = icmp eq i64 %indvars.iv.next79, %wide.trip.count
  br i1 %exitcond, label %._crit_edge51.us.loopexit, label %.preheader.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv72 = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next73, %._crit_edge ]
  %.047.us.us = phi double [ 0.000000e+00, %.preheader.us.us ], [ %97, %._crit_edge ]
  %85 = load double, double* %73, align 8
  %86 = fmul double %85, %2
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv72
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv72, i64 %indvars.iv78
  %91 = load double, double* %90, align 8
  %92 = fadd double %91, %89
  store double %92, double* %90, align 8
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv72, i64 %indvars.iv78
  %94 = load double, double* %93, align 8
  %95 = load double, double* %87, align 8
  %96 = fmul double %94, %95
  %97 = fadd double %.047.us.us, %96
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next73, %indvars.iv82
  br i1 %exitcond77, label %._crit_edge.us.us, label %._crit_edge

._crit_edge55.loopexit:                           ; preds = %._crit_edge51.us
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count20 = zext i32 %1 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv15, %10
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge22
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge22, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next, %wide.trip.count20
  br i1 %exitcond21, label %._crit_edge.us, label %._crit_edge22

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, %wide.trip.count
  br i1 %exitcond, label %._crit_edge13.loopexit, label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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

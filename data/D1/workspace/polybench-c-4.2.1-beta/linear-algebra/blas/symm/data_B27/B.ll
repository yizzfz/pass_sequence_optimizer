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
define i32 @main(i32, i8** nocapture readonly) #0 {
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
  %13 = bitcast i8* %5 to [1200 x double]*
  %14 = bitcast i8* %6 to [1000 x double]*
  %15 = bitcast i8* %7 to [1200 x double]*
  call void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %13, [1000 x double]* %14, [1200 x double]* %15)
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
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %21)
  br label %._crit_edge

._crit_edge:                                      ; preds = %17, %2, %20
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br i1 true, label %.preheader43.lr.ph, label %._crit_edge47

.preheader43.lr.ph:                               ; preds = %7
  br i1 true, label %.preheader43.us.preheader, label %.preheader41.lr.ph

.preheader43.us.preheader:                        ; preds = %.preheader43.lr.ph
  br label %.preheader43.us

.preheader43.us:                                  ; preds = %._crit_edge50.us, %.preheader43.us.preheader
  %indvars.iv70 = phi i64 [ 0, %.preheader43.us.preheader ], [ %indvars.iv.next71, %._crit_edge50.us ]
  %8 = add nuw nsw i64 %indvars.iv70, 1200
  %9 = trunc i64 %8 to i32
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader43.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %10 ], [ 0, %.preheader43.us ]
  %11 = add nuw nsw i64 %indvars.iv67, %indvars.iv70
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 100
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.000000e+03
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv70, i64 %indvars.iv67
  store double %15, double* %16, align 8
  %17 = trunc i64 %indvars.iv67 to i32
  %18 = sub i32 %9, %17
  %19 = srem i32 %18, 100
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 1.000000e+03
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv70, i64 %indvars.iv67
  store double %21, double* %22, align 8
  %exitcond69 = icmp eq i64 %indvars.iv67, 1199
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  br i1 %exitcond69, label %._crit_edge50.us, label %10

._crit_edge50.us:                                 ; preds = %10
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next71, 1000
  br i1 %exitcond78, label %.preheader42, label %.preheader43.us

.preheader42:                                     ; preds = %._crit_edge50.us
  br i1 true, label %.preheader41.lr.ph, label %._crit_edge47

.preheader41.lr.ph:                               ; preds = %.preheader43.lr.ph, %.preheader42
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader41.lr.ph
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %._crit_edge ], [ 1, %.preheader41.lr.ph ]
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge ], [ 0, %.preheader41.lr.ph ]
  %23 = sub i64 999, %indvars.iv65
  %24 = add i64 %23, -4
  %25 = lshr i64 %24, 2
  %26 = add nuw nsw i64 %25, 1
  %27 = sub nsw i64 999, %indvars.iv65
  %28 = and i64 %indvars.iv65, 1
  %lcmp.mod = icmp eq i64 %28, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %29

; <label>:29:                                     ; preds = %.prol.preheader
  %30 = trunc i64 %indvars.iv65 to i32
  %31 = srem i32 %30, 100
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 1.000000e+03
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 0
  store double %33, double* %34, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %29
  %indvars.iv.unr.ph = phi i64 [ 1, %29 ], [ 0, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %35 = icmp eq i64 %indvars.iv65, 0
  br i1 %35, label %.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %64

.preheader.unr-lcssa:                             ; preds = %64
  br label %.preheader

.preheader:                                       ; preds = %.prol.loopexit, %.preheader.unr-lcssa
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %36 = icmp slt i64 %indvars.iv.next66, 1000
  br i1 %36, label %.lr.ph45.preheader, label %._crit_edge

.lr.ph45.preheader:                               ; preds = %.preheader
  %min.iters.check = icmp ult i64 %27, 4
  br i1 %min.iters.check, label %.lr.ph45.preheader75, label %min.iters.checked

.lr.ph45.preheader75:                             ; preds = %middle.block, %min.iters.checked, %.lr.ph45.preheader
  %indvars.iv61.ph = phi i64 [ %indvars.iv76, %min.iters.checked ], [ %indvars.iv76, %.lr.ph45.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph45

min.iters.checked:                                ; preds = %.lr.ph45.preheader
  %n.vec = and i64 %27, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv76, %n.vec
  br i1 %cmp.zero, label %.lr.ph45.preheader75, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter79 = and i64 %26, 3
  %lcmp.mod80 = icmp eq i64 %xtraiter79, 0
  br i1 %lcmp.mod80, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter79, %vector.body.prol.preheader ]
  %37 = add i64 %indvars.iv76, %index.prol
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %37
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %39, align 8
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %41, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %42 = icmp ult i64 %24, 12
  br i1 %42, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %43 = add i64 %indvars.iv76, %index
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %43
  %45 = bitcast double* %44 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %45, align 8
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %47, align 8
  %index.next = add i64 %index, 4
  %48 = add i64 %indvars.iv76, %index.next
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %48
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %50, align 8
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %52, align 8
  %index.next.1 = add i64 %index, 8
  %53 = add i64 %indvars.iv76, %index.next.1
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %53
  %55 = bitcast double* %54 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %55, align 8
  %56 = getelementptr double, double* %54, i64 2
  %57 = bitcast double* %56 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %57, align 8
  %index.next.2 = add i64 %index, 12
  %58 = add i64 %indvars.iv76, %index.next.2
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %58
  %60 = bitcast double* %59 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %60, align 8
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %62, align 8
  %index.next.3 = add i64 %index, 16
  %63 = icmp eq i64 %index.next.3, %n.vec
  br i1 %63, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %27, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph45.preheader75

; <label>:64:                                     ; preds = %64, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %64 ]
  %65 = add nuw nsw i64 %indvars.iv, %indvars.iv65
  %66 = trunc i64 %65 to i32
  %67 = srem i32 %66, 100
  %68 = sitofp i32 %67 to double
  %69 = fdiv double %68, 1.000000e+03
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %indvars.iv
  store double %69, double* %70, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %71 = add nuw nsw i64 %indvars.iv.next, %indvars.iv65
  %72 = trunc i64 %71 to i32
  %73 = srem i32 %72, 100
  %74 = sitofp i32 %73 to double
  %75 = fdiv double %74, 1.000000e+03
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %indvars.iv.next
  store double %75, double* %76, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %indvars.iv65
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.preheader.unr-lcssa, label %64

.lr.ph45:                                         ; preds = %.lr.ph45.preheader75, %.lr.ph45
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %.lr.ph45 ], [ %indvars.iv61.ph, %.lr.ph45.preheader75 ]
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %indvars.iv61
  store double -9.990000e+02, double* %77, align 8
  %exitcond64 = icmp eq i64 %indvars.iv61, 999
  %indvars.iv.next62 = add nsw i64 %indvars.iv61, 1
  br i1 %exitcond64, label %._crit_edge.loopexit, label %.lr.ph45, !llvm.loop !6

._crit_edge.loopexit:                             ; preds = %.lr.ph45
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %.preheader
  %78 = icmp slt i64 %indvars.iv.next66, 1000
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  br i1 %78, label %.lr.ph, label %._crit_edge47.loopexit

._crit_edge47.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge47

._crit_edge47:                                    ; preds = %._crit_edge47.loopexit, %7, %.preheader42
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #2 {
  br i1 true, label %.preheader44.lr.ph, label %._crit_edge55

.preheader44.lr.ph:                               ; preds = %7
  %8 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert82 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat83 = shufflevector <2 x double> %broadcast.splatinsert82, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert86 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat87 = shufflevector <2 x double> %broadcast.splatinsert86, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert88 = insertelement <2 x double> undef, double %8, i32 0
  %broadcast.splat89 = shufflevector <2 x double> %broadcast.splatinsert88, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader44

.preheader44:                                     ; preds = %._crit_edge51, %.preheader44.lr.ph
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge51 ], [ 0, %.preheader44.lr.ph ]
  %indvars.iv59 = phi i32 [ %indvars.iv.next60, %._crit_edge51 ], [ -1, %.preheader44.lr.ph ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 0
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 1200
  %scevgep72 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv65, i64 0
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv65, i64 1200
  br i1 true, label %.preheader.lr.ph, label %._crit_edge51

.preheader.lr.ph:                                 ; preds = %.preheader44
  %9 = icmp sgt i64 %indvars.iv65, 0
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %indvars.iv65
  br i1 %9, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br i1 false, label %.preheader.preheader90, label %min.iters.checked

.preheader.preheader90:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.preheader ], [ 1200, %middle.block ]
  br i1 true, label %.preheader.prol.loopexit.unr-lcssa, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.preheader.preheader90
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol.preheader
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.ph
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %3
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv65, i64 %indvars.iv.ph
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %2
  %17 = load double, double* %10, align 8
  %18 = fmul double %16, %17
  %19 = fadd double %13, %18
  %20 = fadd double %8, %19
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.ph
  store double %20, double* %21, align 8
  %indvars.iv.next.prol = or i64 %indvars.iv.ph, 1
  br label %.preheader.prol.loopexit.unr-lcssa

.preheader.prol.loopexit.unr-lcssa:               ; preds = %.preheader.preheader90, %.preheader.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.preheader.prol ], [ %indvars.iv.ph, %.preheader.preheader90 ]
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge51.loopexit91, label %.preheader.preheader90.new

.preheader.preheader90.new:                       ; preds = %.preheader.prol.loopexit
  br label %.preheader

min.iters.checked:                                ; preds = %.preheader.preheader
  br i1 false, label %.preheader.preheader90, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep74
  %bound1 = icmp ult double* %scevgep72, %scevgep70
  %found.conflict = and i1 %bound0, %bound1
  %bound077 = icmp ult double* %scevgep, %10
  %bound178 = icmp ult double* %10, %scevgep70
  %found.conflict79 = and i1 %bound077, %bound178
  %conflict.rdx = or i1 %found.conflict, %found.conflict79
  br i1 %conflict.rdx, label %.preheader.preheader90, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %index
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !8, !noalias !11
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !8, !noalias !11
  %26 = fmul <2 x double> %wide.load, %broadcast.splat83
  %27 = fmul <2 x double> %wide.load81, %broadcast.splat83
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv65, i64 %index
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !14
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !14
  %32 = fmul <2 x double> %wide.load84, %broadcast.splat87
  %33 = fmul <2 x double> %wide.load85, %broadcast.splat87
  %34 = load double, double* %10, align 8, !alias.scope !15
  %35 = insertelement <2 x double> undef, double %34, i32 0
  %36 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  %37 = insertelement <2 x double> undef, double %34, i32 0
  %38 = shufflevector <2 x double> %37, <2 x double> undef, <2 x i32> zeroinitializer
  %39 = fmul <2 x double> %32, %36
  %40 = fmul <2 x double> %33, %38
  %41 = fadd <2 x double> %26, %39
  %42 = fadd <2 x double> %27, %40
  %43 = fadd <2 x double> %broadcast.splat89, %41
  %44 = fadd <2 x double> %broadcast.splat89, %42
  %45 = bitcast double* %22 to <2 x double>*
  store <2 x double> %43, <2 x double>* %45, align 8, !alias.scope !8, !noalias !11
  %46 = bitcast double* %24 to <2 x double>*
  store <2 x double> %44, <2 x double>* %46, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %47 = icmp eq i64 %index.next, 1200
  br i1 %47, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge51, label %.preheader.preheader90

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count61 = zext i32 %indvars.iv59 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv65, i64 %indvars.iv63
  br label %49

; <label>:49:                                     ; preds = %49, %.preheader.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %49 ], [ 0, %.preheader.us ]
  %.047.us = phi double [ %63, %49 ], [ 0.000000e+00, %.preheader.us ]
  %50 = load double, double* %48, align 8
  %51 = fmul double %50, %2
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %indvars.iv57
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv63
  %56 = load double, double* %55, align 8
  %57 = fadd double %56, %54
  store double %57, double* %55, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv57, i64 %indvars.iv63
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %indvars.iv57
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %.047.us, %62
  %exitcond62 = icmp eq i64 %indvars.iv57, %wide.trip.count61
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  br i1 %exitcond62, label %._crit_edge.us, label %49

._crit_edge.us:                                   ; preds = %49
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv63
  %65 = load double, double* %64, align 8
  %66 = fmul double %65, %3
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv65, i64 %indvars.iv63
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %2
  %70 = load double, double* %10, align 8
  %71 = fmul double %69, %70
  %72 = fadd double %66, %71
  %73 = fmul double %63, %2
  %74 = fadd double %73, %72
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv63
  store double %74, double* %75, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next64, 1200
  br i1 %exitcond92, label %._crit_edge51.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader, %.preheader.preheader90.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.preheader90.new ], [ %indvars.iv.next.1, %.preheader ]
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv
  %77 = load double, double* %76, align 8
  %78 = fmul double %77, %3
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv65, i64 %indvars.iv
  %80 = load double, double* %79, align 8
  %81 = fmul double %80, %2
  %82 = load double, double* %10, align 8
  %83 = fmul double %81, %82
  %84 = fadd double %78, %83
  %85 = fadd double %8, %84
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv
  store double %85, double* %86, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next
  %88 = load double, double* %87, align 8
  %89 = fmul double %88, %3
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv65, i64 %indvars.iv.next
  %91 = load double, double* %90, align 8
  %92 = fmul double %91, %2
  %93 = load double, double* %10, align 8
  %94 = fmul double %92, %93
  %95 = fadd double %89, %94
  %96 = fadd double %8, %95
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next
  store double %96, double* %97, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1199
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge51.loopexit91.unr-lcssa, label %.preheader, !llvm.loop !17

._crit_edge51.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge51

._crit_edge51.loopexit91.unr-lcssa:               ; preds = %.preheader
  br label %._crit_edge51.loopexit91

._crit_edge51.loopexit91:                         ; preds = %.preheader.prol.loopexit, %._crit_edge51.loopexit91.unr-lcssa
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit91, %._crit_edge51.loopexit, %middle.block, %.preheader44
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %indvars.iv.next60 = add nsw i32 %indvars.iv59, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next66, 1000
  br i1 %exitcond93, label %._crit_edge55.loopexit, label %.preheader44

._crit_edge55.loopexit:                           ; preds = %._crit_edge51
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]* nocapture readonly) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %3
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv17 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next18, %._crit_edge.us ]
  %8 = mul nsw i64 %indvars.iv17, 1000
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %9 = add nsw i64 %indvars.iv, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge16
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge16, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge16

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 1000
  br i1 %exitcond19, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %3
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{!12}
!15 = !{!13}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}

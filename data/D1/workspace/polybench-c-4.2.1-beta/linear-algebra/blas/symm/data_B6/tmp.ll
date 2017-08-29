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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = sext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = zext i32 %1 to i64
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.preheader36.preheader.lr.ph, label %._crit_edge

.preheader36.preheader.lr.ph:                     ; preds = %7
  %12 = icmp sgt i32 %1, 0
  %13 = sitofp i32 %0 to double
  br i1 %12, label %.preheader36.preheader.us.preheader, label %.preheader34.preheader.lr.ph

.preheader36.preheader.us.preheader:              ; preds = %.preheader36.preheader.lr.ph
  br label %.preheader36.preheader.us

.preheader36.preheader.us:                        ; preds = %.preheader36.preheader.us.preheader, %.preheader36._crit_edge.us
  %indvars.iv5162.us = phi i64 [ %indvars.iv.next52.us, %.preheader36._crit_edge.us ], [ 0, %.preheader36.preheader.us.preheader ]
  %14 = add nuw nsw i64 %indvars.iv5162.us, %10
  br label %.preheader36.us

.preheader36.us:                                  ; preds = %.preheader36.us, %.preheader36.preheader.us
  %indvars.iv4960.us = phi i64 [ 0, %.preheader36.preheader.us ], [ %indvars.iv.next50.us, %.preheader36.us ]
  %15 = add nuw nsw i64 %indvars.iv4960.us, %indvars.iv5162.us
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 100
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %13
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv5162.us, i64 %indvars.iv4960.us
  store double %19, double* %20, align 8
  %21 = sub nsw i64 %14, %indvars.iv4960.us
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 100
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %13
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv5162.us, i64 %indvars.iv4960.us
  store double %25, double* %26, align 8
  %indvars.iv.next50.us = add nuw nsw i64 %indvars.iv4960.us, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next50.us, %8
  br i1 %exitcond67, label %.preheader36._crit_edge.us, label %.preheader36.us

.preheader36._crit_edge.us:                       ; preds = %.preheader36.us
  %indvars.iv.next52.us = add nuw nsw i64 %indvars.iv5162.us, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next52.us, %9
  br i1 %exitcond68, label %.preheader35, label %.preheader36.preheader.us

.preheader35:                                     ; preds = %.preheader36._crit_edge.us
  %27 = icmp sgt i32 %0, 0
  br i1 %27, label %.preheader34.preheader.lr.ph, label %._crit_edge

.preheader34.preheader.lr.ph:                     ; preds = %.preheader36.preheader.lr.ph, %.preheader35
  %28 = add i32 %0, -1
  %29 = sitofp i32 %0 to double
  %wide.trip.count43 = zext i32 %28 to i64
  br label %.preheader34.preheader

.preheader34.preheader:                           ; preds = %.preheader._crit_edge, %.preheader34.preheader.lr.ph
  %indvars.iv4559 = phi i64 [ 1, %.preheader34.preheader.lr.ph ], [ %indvars.iv.next46, %.preheader._crit_edge ]
  %indvars.iv4757 = phi i64 [ 0, %.preheader34.preheader.lr.ph ], [ %indvars.iv.next48, %.preheader._crit_edge ]
  %30 = sub i64 %wide.trip.count43, %indvars.iv4757
  %31 = add i64 %30, -4
  %32 = lshr i64 %31, 2
  %33 = add nuw nsw i64 %32, 1
  %34 = sub i64 %wide.trip.count43, %indvars.iv4757
  %35 = and i64 %indvars.iv4757, 1
  %lcmp.mod = icmp eq i64 %35, 0
  br i1 %lcmp.mod, label %.preheader34.prol.preheader, label %.preheader34.prol.loopexit.unr-lcssa

.preheader34.prol.preheader:                      ; preds = %.preheader34.preheader
  br label %.preheader34.prol

.preheader34.prol:                                ; preds = %.preheader34.prol.preheader
  %36 = trunc i64 %indvars.iv4757 to i32
  %37 = srem i32 %36, 100
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %29
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv4757, i64 0
  store double %39, double* %40, align 8
  br label %.preheader34.prol.loopexit.unr-lcssa

.preheader34.prol.loopexit.unr-lcssa:             ; preds = %.preheader34.preheader, %.preheader34.prol
  %indvars.iv53.unr.ph = phi i64 [ 1, %.preheader34.prol ], [ 0, %.preheader34.preheader ]
  br label %.preheader34.prol.loopexit

.preheader34.prol.loopexit:                       ; preds = %.preheader34.prol.loopexit.unr-lcssa
  %41 = icmp eq i64 %indvars.iv4757, 0
  br i1 %41, label %.preheader.preheader, label %.preheader34.preheader.new

.preheader34.preheader.new:                       ; preds = %.preheader34.prol.loopexit
  br label %.preheader34

.preheader.preheader.unr-lcssa:                   ; preds = %.preheader34
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader34.prol.loopexit, %.preheader.preheader.unr-lcssa
  %exitcond4455 = icmp eq i64 %wide.trip.count43, %indvars.iv4757
  br i1 %exitcond4455, label %.preheader._crit_edge, label %.preheader.preheader72

.preheader.preheader72:                           ; preds = %.preheader.preheader
  %min.iters.check = icmp ult i64 %34, 4
  br i1 %min.iters.check, label %.preheader.preheader74, label %min.iters.checked

.preheader.preheader74:                           ; preds = %middle.block, %min.iters.checked, %.preheader.preheader72
  %indvars.iv.next4256.in.ph = phi i64 [ %indvars.iv4757, %min.iters.checked ], [ %indvars.iv4757, %.preheader.preheader72 ], [ %ind.end, %middle.block ]
  br label %.preheader

min.iters.checked:                                ; preds = %.preheader.preheader72
  %n.vec = and i64 %34, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv4757, %n.vec
  br i1 %cmp.zero, label %.preheader.preheader74, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter75 = and i64 %33, 3
  %lcmp.mod76 = icmp eq i64 %xtraiter75, 0
  br i1 %lcmp.mod76, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter75, %vector.body.prol.preheader ]
  %42 = add i64 %indvars.iv4757, %index.prol
  %43 = add nuw nsw i64 %42, 1
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv4757, i64 %43
  %45 = bitcast double* %44 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %45, align 8
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %47, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %48 = icmp ult i64 %31, 12
  br i1 %48, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %49 = add i64 %indvars.iv4757, %index
  %50 = add nuw nsw i64 %49, 1
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv4757, i64 %50
  %52 = bitcast double* %51 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %52, align 8
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %54, align 8
  %index.next = add i64 %index, 4
  %55 = add i64 %indvars.iv4757, %index.next
  %56 = add nuw nsw i64 %55, 1
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv4757, i64 %56
  %58 = bitcast double* %57 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %58, align 8
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %60, align 8
  %index.next.1 = add i64 %index, 8
  %61 = add i64 %indvars.iv4757, %index.next.1
  %62 = add nuw nsw i64 %61, 1
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv4757, i64 %62
  %64 = bitcast double* %63 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %64, align 8
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %66, align 8
  %index.next.2 = add i64 %index, 12
  %67 = add i64 %indvars.iv4757, %index.next.2
  %68 = add nuw nsw i64 %67, 1
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv4757, i64 %68
  %70 = bitcast double* %69 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %70, align 8
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %72, align 8
  %index.next.3 = add i64 %index, 16
  %73 = icmp eq i64 %index.next.3, %n.vec
  br i1 %73, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %34, %n.vec
  br i1 %cmp.n, label %.preheader._crit_edge, label %.preheader.preheader74

.preheader34:                                     ; preds = %.preheader34, %.preheader34.preheader.new
  %indvars.iv53 = phi i64 [ %indvars.iv53.unr.ph, %.preheader34.preheader.new ], [ %indvars.iv.next.1, %.preheader34 ]
  %74 = add nuw nsw i64 %indvars.iv53, %indvars.iv4757
  %75 = trunc i64 %74 to i32
  %76 = srem i32 %75, 100
  %77 = sitofp i32 %76 to double
  %78 = fdiv double %77, %29
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv4757, i64 %indvars.iv53
  store double %78, double* %79, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv53, 1
  %80 = add nuw nsw i64 %indvars.iv.next, %indvars.iv4757
  %81 = trunc i64 %80 to i32
  %82 = srem i32 %81, 100
  %83 = sitofp i32 %82 to double
  %84 = fdiv double %83, %29
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv4757, i64 %indvars.iv.next
  store double %84, double* %85, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv53, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv4559
  br i1 %exitcond.1, label %.preheader.preheader.unr-lcssa, label %.preheader34

.preheader:                                       ; preds = %.preheader.preheader74, %.preheader
  %indvars.iv.next4256.in = phi i64 [ %indvars.iv.next4256, %.preheader ], [ %indvars.iv.next4256.in.ph, %.preheader.preheader74 ]
  %indvars.iv.next4256 = add nuw nsw i64 %indvars.iv.next4256.in, 1
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv4757, i64 %indvars.iv.next4256
  store double -9.990000e+02, double* %86, align 8
  %exitcond44 = icmp eq i64 %indvars.iv.next4256, %wide.trip.count43
  br i1 %exitcond44, label %.preheader._crit_edge.loopexit, label %.preheader, !llvm.loop !6

.preheader._crit_edge.loopexit:                   ; preds = %.preheader
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %middle.block, %.preheader.preheader
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv4757, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next48, %9
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv4559, 1
  br i1 %exitcond66, label %._crit_edge.loopexit, label %.preheader34.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %7, %.preheader35
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  %8 = sext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  %11 = icmp sgt i32 %1, 0
  %or.cond = and i1 %10, %11
  br i1 %or.cond, label %.preheader.preheader.us.preheader, label %._crit_edge53

.preheader.preheader.us.preheader:                ; preds = %7
  %12 = fmul double %2, 0.000000e+00
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %8
  %scevgep78 = getelementptr [1200 x double], [1200 x double]* %6, i64 0, i64 %8
  %13 = add nsw i64 %8, -1
  %min.iters.check = icmp ult i32 %1, 4
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %14 = bitcast double* %scevgep78 to [1200 x double]*
  %bound0 = icmp ugt [1200 x double]* %14, %4
  %15 = bitcast double* %scevgep to [1200 x double]*
  %bound1 = icmp ugt [1200 x double]* %15, %6
  %found.conflict = and i1 %bound0, %bound1
  %broadcast.splatinsert86 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat87 = shufflevector <2 x double> %broadcast.splatinsert86, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert90 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat91 = shufflevector <2 x double> %broadcast.splatinsert90, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert92 = insertelement <2 x double> undef, double %12, i32 0
  %broadcast.splat93 = shufflevector <2 x double> %broadcast.splatinsert92, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %8, %n.vec
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader.preheader.us.preheader, %.preheader._crit_edge.us
  %indvars.iv4250.us = phi i64 [ %indvars.iv.next43.us, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  %exitcond45.us = icmp eq i64 %indvars.iv4250.us, 0
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv4250.us, i64 %indvars.iv4250.us
  br i1 %exitcond45.us, label %.preheader44.us.us.preheader, label %.preheader44.us62.preheader

.preheader44.us62.preheader:                      ; preds = %.preheader.preheader.us
  br label %.preheader44.us62

.preheader44.us.us.preheader:                     ; preds = %.preheader.preheader.us
  br i1 %min.iters.check, label %.preheader44.us.us.preheader94, label %min.iters.checked

.preheader44.us.us.preheader94:                   ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader44.us.us.preheader
  %indvars.iv4048.us.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader44.us.us.preheader ], [ %n.vec, %middle.block ]
  %17 = sub nsw i64 %8, %indvars.iv4048.us.us.ph
  %xtraiter = and i64 %17, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader44.us.us.prol.loopexit.unr-lcssa, label %.preheader44.us.us.prol.preheader

.preheader44.us.us.prol.preheader:                ; preds = %.preheader44.us.us.preheader94
  br label %.preheader44.us.us.prol

.preheader44.us.us.prol:                          ; preds = %.preheader44.us.us.prol.preheader
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv4048.us.us.ph
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %3
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 0, i64 %indvars.iv4048.us.us.ph
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %2
  %24 = load double, double* %16, align 8
  %25 = fmul double %23, %24
  %26 = fadd double %20, %25
  %27 = fadd double %12, %26
  store double %27, double* %18, align 8
  %indvars.iv.next41.us.us.prol = or i64 %indvars.iv4048.us.us.ph, 1
  br label %.preheader44.us.us.prol.loopexit.unr-lcssa

.preheader44.us.us.prol.loopexit.unr-lcssa:       ; preds = %.preheader44.us.us.preheader94, %.preheader44.us.us.prol
  %indvars.iv4048.us.us.unr.ph = phi i64 [ %indvars.iv.next41.us.us.prol, %.preheader44.us.us.prol ], [ %indvars.iv4048.us.us.ph, %.preheader44.us.us.preheader94 ]
  br label %.preheader44.us.us.prol.loopexit

.preheader44.us.us.prol.loopexit:                 ; preds = %.preheader44.us.us.prol.loopexit.unr-lcssa
  %28 = icmp eq i64 %13, %indvars.iv4048.us.us.ph
  br i1 %28, label %.preheader._crit_edge.us.loopexit, label %.preheader44.us.us.preheader94.new

.preheader44.us.us.preheader94.new:               ; preds = %.preheader44.us.us.prol.loopexit
  br label %.preheader44.us.us

min.iters.checked:                                ; preds = %.preheader44.us.us.preheader
  br i1 %cmp.zero, label %.preheader44.us.us.preheader94, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %29 = bitcast double* %16 to [1200 x double]*
  %bound081 = icmp ugt [1200 x double]* %29, %4
  %bound182 = icmp ult double* %16, %scevgep
  %found.conflict83 = and i1 %bound081, %bound182
  %conflict.rdx = or i1 %found.conflict, %found.conflict83
  br i1 %conflict.rdx, label %.preheader44.us.us.preheader94, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %30 = load double, double* %16, align 8, !alias.scope !8
  %31 = insertelement <2 x double> undef, double %30, i32 0
  %32 = shufflevector <2 x double> %31, <2 x double> undef, <2 x i32> zeroinitializer
  %33 = insertelement <2 x double> undef, double %30, i32 0
  %34 = shufflevector <2 x double> %33, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %index
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !11, !noalias !13
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !11, !noalias !13
  %39 = fmul <2 x double> %wide.load, %broadcast.splat87
  %40 = fmul <2 x double> %wide.load85, %broadcast.splat87
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 0, i64 %index
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !15
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !15
  %45 = fmul <2 x double> %wide.load88, %broadcast.splat91
  %46 = fmul <2 x double> %wide.load89, %broadcast.splat91
  %47 = fmul <2 x double> %45, %32
  %48 = fmul <2 x double> %46, %34
  %49 = fadd <2 x double> %39, %47
  %50 = fadd <2 x double> %40, %48
  %51 = fadd <2 x double> %broadcast.splat93, %49
  %52 = fadd <2 x double> %broadcast.splat93, %50
  %53 = bitcast double* %35 to <2 x double>*
  store <2 x double> %51, <2 x double>* %53, align 8, !alias.scope !11, !noalias !13
  %54 = bitcast double* %37 to <2 x double>*
  store <2 x double> %52, <2 x double>* %54, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %55 = icmp eq i64 %index.next, %n.vec
  br i1 %55, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %.preheader._crit_edge.us, label %.preheader44.us.us.preheader94

._crit_edge:                                      ; preds = %._crit_edge, %.preheader44.us62
  %.047.us54 = phi double [ 0.000000e+00, %.preheader44.us62 ], [ %68, %._crit_edge ]
  %indvars.iv46.us55 = phi i64 [ 0, %.preheader44.us62 ], [ %indvars.iv.next.us56, %._crit_edge ]
  %56 = load double, double* %69, align 8
  %57 = fmul double %56, %2
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv4250.us, i64 %indvars.iv46.us55
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46.us55, i64 %indvars.iv4048.us63
  %62 = load double, double* %61, align 8
  %63 = fadd double %62, %60
  store double %63, double* %61, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv46.us55, i64 %indvars.iv4048.us63
  %65 = load double, double* %64, align 8
  %66 = load double, double* %58, align 8
  %67 = fmul double %65, %66
  %68 = fadd double %.047.us54, %67
  %indvars.iv.next.us56 = add nuw nsw i64 %indvars.iv46.us55, 1
  %exitcond.us57 = icmp eq i64 %indvars.iv.next.us56, %indvars.iv4250.us
  br i1 %exitcond.us57, label %._crit_edge.us65, label %._crit_edge

.preheader44.us62:                                ; preds = %.preheader44.us62.preheader, %._crit_edge.us65
  %indvars.iv4048.us63 = phi i64 [ %indvars.iv.next41.us61, %._crit_edge.us65 ], [ 0, %.preheader44.us62.preheader ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv4250.us, i64 %indvars.iv4048.us63
  br label %._crit_edge

._crit_edge.us65:                                 ; preds = %._crit_edge
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4250.us, i64 %indvars.iv4048.us63
  %71 = load double, double* %70, align 8
  %72 = fmul double %71, %3
  %73 = load double, double* %69, align 8
  %74 = fmul double %73, %2
  %75 = load double, double* %16, align 8
  %76 = fmul double %74, %75
  %77 = fadd double %72, %76
  %78 = fmul double %68, %2
  %79 = fadd double %78, %77
  store double %79, double* %70, align 8
  %indvars.iv.next41.us61 = add nuw nsw i64 %indvars.iv4048.us63, 1
  %exitcond = icmp eq i64 %indvars.iv.next41.us61, %8
  br i1 %exitcond, label %.preheader._crit_edge.us.loopexit95, label %.preheader44.us62

.preheader._crit_edge.us.loopexit.unr-lcssa:      ; preds = %.preheader44.us.us
  br label %.preheader._crit_edge.us.loopexit

.preheader._crit_edge.us.loopexit:                ; preds = %.preheader44.us.us.prol.loopexit, %.preheader._crit_edge.us.loopexit.unr-lcssa
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us.loopexit95:              ; preds = %._crit_edge.us65
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit95, %.preheader._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next43.us = add nuw nsw i64 %indvars.iv4250.us, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next43.us, %9
  br i1 %exitcond72, label %._crit_edge53.loopexit, label %.preheader.preheader.us

.preheader44.us.us:                               ; preds = %.preheader44.us.us, %.preheader44.us.us.preheader94.new
  %indvars.iv4048.us.us = phi i64 [ %indvars.iv4048.us.us.unr.ph, %.preheader44.us.us.preheader94.new ], [ %indvars.iv.next41.us.us.1, %.preheader44.us.us ]
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv4048.us.us
  %81 = load double, double* %80, align 8
  %82 = fmul double %81, %3
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 0, i64 %indvars.iv4048.us.us
  %84 = load double, double* %83, align 8
  %85 = fmul double %84, %2
  %86 = load double, double* %16, align 8
  %87 = fmul double %85, %86
  %88 = fadd double %82, %87
  %89 = fadd double %12, %88
  store double %89, double* %80, align 8
  %indvars.iv.next41.us.us = add nuw nsw i64 %indvars.iv4048.us.us, 1
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next41.us.us
  %91 = load double, double* %90, align 8
  %92 = fmul double %91, %3
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 0, i64 %indvars.iv.next41.us.us
  %94 = load double, double* %93, align 8
  %95 = fmul double %94, %2
  %96 = load double, double* %16, align 8
  %97 = fmul double %95, %96
  %98 = fadd double %92, %97
  %99 = fadd double %12, %98
  store double %99, double* %90, align 8
  %indvars.iv.next41.us.us.1 = add nsw i64 %indvars.iv4048.us.us, 2
  %exitcond71.1 = icmp eq i64 %indvars.iv.next41.us.us.1, %8
  br i1 %exitcond71.1, label %.preheader._crit_edge.us.loopexit.unr-lcssa, label %.preheader44.us.us, !llvm.loop !17

._crit_edge53.loopexit:                           ; preds = %.preheader._crit_edge.us
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge53.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = sext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  %11 = icmp sgt i32 %1, 0
  %or.cond = and i1 %10, %11
  br i1 %or.cond, label %.preheader.preheader.us.preheader, label %._crit_edge14

.preheader.preheader.us.preheader:                ; preds = %3
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader.preheader.us.preheader, %.preheader._crit_edge.us
  %indvars.iv912.us = phi i64 [ %indvars.iv.next10.us, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  %12 = mul nsw i64 %indvars.iv912.us, %9
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.preheader.preheader.us
  %indvars.iv11.us = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next.us, %._crit_edge.us ]
  %13 = add nsw i64 %indvars.iv11.us, %12
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge.us

; <label>:17:                                     ; preds = %._crit_edge.us._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv912.us, i64 %indvars.iv11.us
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv11.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, %8
  br i1 %exitcond, label %.preheader._crit_edge.us, label %._crit_edge.us._crit_edge

.preheader._crit_edge.us:                         ; preds = %._crit_edge.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv912.us, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next10.us, %9
  br i1 %exitcond16, label %._crit_edge14.loopexit, label %.preheader.preheader.us

._crit_edge14.loopexit:                           ; preds = %.preheader._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %3
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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

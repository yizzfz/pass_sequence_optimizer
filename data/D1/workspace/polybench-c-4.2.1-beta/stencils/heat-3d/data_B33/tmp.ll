; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to [120 x [120 x double]]*
  %8 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %4 = zext i32 %0 to i64
  %5 = sext i32 %0 to i64
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader19.preheader.us.preheader, label %._crit_edge

.preheader19.preheader.us.preheader:              ; preds = %3
  %wide.trip.count22 = zext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %7 = sitofp i32 %0 to double
  %xtraiter = and i64 %wide.trip.count, 1
  %8 = icmp eq i64 %xtraiter, 0
  %9 = icmp eq i32 %0, 1
  br label %.preheader.preheader.us.us.preheader

.preheader.preheader.us.us.preheader:             ; preds = %.preheader19._crit_edge.us, %.preheader19.preheader.us.preheader
  %indvars.iv2431.us = phi i64 [ %indvars.iv.next25.us, %.preheader19._crit_edge.us ], [ 0, %.preheader19.preheader.us.preheader ]
  %10 = add nuw nsw i64 %indvars.iv2431.us, %4
  br label %.preheader.preheader.us.us

.preheader19._crit_edge.us:                       ; preds = %.preheader._crit_edge.us.us
  %indvars.iv.next25.us = add nuw nsw i64 %indvars.iv2431.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next25.us, %5
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader.preheader.us.us.preheader

.preheader.preheader.us.us:                       ; preds = %.preheader._crit_edge.us.us, %.preheader.preheader.us.us.preheader
  %indvars.iv2029.us.us = phi i64 [ %indvars.iv.next21.us.us, %.preheader._crit_edge.us.us ], [ 0, %.preheader.preheader.us.us.preheader ]
  %11 = add i64 %10, %indvars.iv2029.us.us
  br i1 %8, label %.preheader.us.us.prol.loopexit, label %.preheader.us.us.prol

.preheader.us.us.prol:                            ; preds = %.preheader.preheader.us.us
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = fmul double %13, 1.000000e+01
  %15 = fdiv double %14, %7
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv2431.us, i64 %indvars.iv2029.us.us, i64 0
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv2431.us, i64 %indvars.iv2029.us.us, i64 0
  store double %15, double* %17, align 8
  br label %.preheader.us.us.prol.loopexit

.preheader.us.us.prol.loopexit:                   ; preds = %.preheader.preheader.us.us, %.preheader.us.us.prol
  %indvars.iv27.us.us.unr.ph = phi i64 [ 1, %.preheader.us.us.prol ], [ 0, %.preheader.preheader.us.us ]
  br i1 %9, label %.preheader._crit_edge.us.us, label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader.us.us.prol.loopexit
  br label %.preheader.us.us

.preheader._crit_edge.us.us.loopexit:             ; preds = %.preheader.us.us
  br label %.preheader._crit_edge.us.us

.preheader._crit_edge.us.us:                      ; preds = %.preheader._crit_edge.us.us.loopexit, %.preheader.us.us.prol.loopexit
  %indvars.iv.next21.us.us = add nuw nsw i64 %indvars.iv2029.us.us, 1
  %exitcond23.us.us = icmp eq i64 %indvars.iv.next21.us.us, %wide.trip.count22
  br i1 %exitcond23.us.us, label %.preheader19._crit_edge.us, label %.preheader.preheader.us.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %.preheader.us.us
  %indvars.iv27.us.us = phi i64 [ %indvars.iv.next.us.us.1, %.preheader.us.us ], [ %indvars.iv27.us.us.unr.ph, %.preheader.us.us.preheader ]
  %18 = sub i64 %11, %indvars.iv27.us.us
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = fmul double %20, 1.000000e+01
  %22 = fdiv double %21, %7
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv2431.us, i64 %indvars.iv2029.us.us, i64 %indvars.iv27.us.us
  store double %22, double* %23, align 8
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv2431.us, i64 %indvars.iv2029.us.us, i64 %indvars.iv27.us.us
  store double %22, double* %24, align 8
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv27.us.us, 1
  %25 = sub i64 %11, %indvars.iv.next.us.us
  %26 = trunc i64 %25 to i32
  %27 = sitofp i32 %26 to double
  %28 = fmul double %27, 1.000000e+01
  %29 = fdiv double %28, %7
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv2431.us, i64 %indvars.iv2029.us.us, i64 %indvars.iv.next.us.us
  store double %29, double* %30, align 8
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv2431.us, i64 %indvars.iv2029.us.us, i64 %indvars.iv.next.us.us
  store double %29, double* %31, align 8
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv27.us.us, 2
  %exitcond.us.us.1 = icmp eq i64 %indvars.iv.next.us.us.1, %wide.trip.count
  br i1 %exitcond.us.us.1, label %.preheader._crit_edge.us.us.loopexit, label %.preheader.us.us

._crit_edge.loopexit:                             ; preds = %.preheader19._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %4 = add i32 %0, -1
  %5 = add nsw i32 %0, -1
  %6 = sext i32 %5 to i64
  %wide.trip.count113 = zext i32 %4 to i64
  %wide.trip.count = zext i32 %4 to i64
  %wide.trip.count123 = zext i32 %4 to i64
  %wide.trip.count119 = zext i32 %4 to i64
  %7 = add nsw i64 %wide.trip.count119, -1
  %8 = icmp eq i32 %4, 1
  %.not = icmp slt i32 %0, 3
  %brmerge = or i1 %.not, %8
  %9 = icmp sgt i32 %4, 1
  %10 = icmp eq i32 %4, 1
  %min.iters.check = icmp ult i64 %7, 2
  %n.vec = and i64 %7, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %7, 1
  %cmp.n = icmp eq i64 %7, %n.vec
  %11 = icmp eq i32 %4, 1
  %min.iters.check19 = icmp ult i64 %7, 2
  %n.vec22 = and i64 %7, -2
  %cmp.zero23 = icmp eq i64 %n.vec22, 0
  %ind.end46 = or i64 %7, 1
  %cmp.n47 = icmp eq i64 %7, %n.vec22
  br label %.preheader110.preheader

.preheader110.preheader:                          ; preds = %.preheader109._crit_edge, %3
  %storemerge173 = phi i32 [ 1, %3 ], [ %148, %.preheader109._crit_edge ]
  br i1 %brmerge, label %.preheader109.preheader, label %.preheader108.preheader.us.preheader

.preheader108.preheader.us.preheader:             ; preds = %.preheader110.preheader
  br label %.preheader108.preheader.us

.preheader108.preheader.us:                       ; preds = %.preheader108.preheader.us.preheader, %.preheader108._crit_edge.us
  %indvar25 = phi i64 [ %indvar.next26, %.preheader108._crit_edge.us ], [ 0, %.preheader108.preheader.us.preheader ]
  %indvars.iv115133.us = phi i64 [ %indvars.iv.next116.us, %.preheader108._crit_edge.us ], [ 1, %.preheader108.preheader.us.preheader ]
  %12 = add i64 %indvar25, 1
  %13 = add i64 %indvar25, 2
  %14 = add nuw nsw i64 %indvars.iv115133.us, 1
  %15 = add nsw i64 %indvars.iv115133.us, -1
  br i1 %11, label %.preheader108._crit_edge.us, label %.preheader106.preheader.us.us.preheader

.preheader106.preheader.us.us.preheader:          ; preds = %.preheader108.preheader.us
  br label %.preheader106.preheader.us.us

.preheader108._crit_edge.us.loopexit:             ; preds = %.preheader106._crit_edge.us.us
  br label %.preheader108._crit_edge.us

.preheader108._crit_edge.us:                      ; preds = %.preheader108._crit_edge.us.loopexit, %.preheader108.preheader.us
  %indvars.iv.next116.us = add nuw nsw i64 %indvars.iv115133.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next116.us, %6
  %indvar.next26 = add i64 %indvar25, 1
  br i1 %exitcond, label %.preheader109.preheader.loopexit, label %.preheader108.preheader.us

.preheader106.preheader.us.us:                    ; preds = %.preheader106.preheader.us.us.preheader, %.preheader106._crit_edge.us.us
  %indvar27 = phi i64 [ %indvar.next28, %.preheader106._crit_edge.us.us ], [ 0, %.preheader106.preheader.us.us.preheader ]
  %indvars.iv111131.us.us = phi i64 [ %indvars.iv.next112.us.us, %.preheader106._crit_edge.us.us ], [ 1, %.preheader106.preheader.us.us.preheader ]
  %16 = add i64 %indvar27, 1
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %12, i64 %16, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %12, i64 %16, i64 %wide.trip.count119
  %scevgep33 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar25, i64 %16, i64 1
  %scevgep35 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %13, i64 %16, i64 %wide.trip.count119
  %17 = add nuw nsw i64 %indvars.iv111131.us.us, 1
  %18 = add nsw i64 %indvars.iv111131.us.us, -1
  br i1 %min.iters.check19, label %.preheader106.us.us.preheader, label %min.iters.checked20

.preheader106.us.us.preheader:                    ; preds = %middle.block17, %vector.memcheck41, %min.iters.checked20, %.preheader106.preheader.us.us
  %indvars.iv129.us.us.ph = phi i64 [ 1, %vector.memcheck41 ], [ 1, %min.iters.checked20 ], [ 1, %.preheader106.preheader.us.us ], [ %ind.end46, %middle.block17 ]
  br label %.preheader106.us.us

min.iters.checked20:                              ; preds = %.preheader106.preheader.us.us
  br i1 %cmp.zero23, label %.preheader106.us.us.preheader, label %vector.memcheck41

vector.memcheck41:                                ; preds = %min.iters.checked20
  %bound037 = icmp ult double* %scevgep29, %scevgep35
  %bound138 = icmp ult double* %scevgep33, %scevgep31
  %memcheck.conflict40 = and i1 %bound037, %bound138
  br i1 %memcheck.conflict40, label %.preheader106.us.us.preheader, label %vector.body16.preheader

vector.body16.preheader:                          ; preds = %vector.memcheck41
  br label %vector.body16

vector.body16:                                    ; preds = %vector.body16.preheader, %vector.body16
  %index43 = phi i64 [ %index.next44, %vector.body16 ], [ 0, %vector.body16.preheader ]
  %offset.idx48 = or i64 %index43, 1
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %14, i64 %indvars.iv111131.us.us, i64 %offset.idx48
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv115133.us, i64 %indvars.iv111131.us.us, i64 %offset.idx48
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fmul <2 x double> %wide.load53, <double 2.000000e+00, double 2.000000e+00>
  %24 = fsub <2 x double> %wide.load52, %23
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %15, i64 %indvars.iv111131.us.us, i64 %offset.idx48
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fadd <2 x double> %wide.load54, %24
  %28 = fmul <2 x double> %27, <double 1.250000e-01, double 1.250000e-01>
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv115133.us, i64 %17, i64 %offset.idx48
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fsub <2 x double> %wide.load55, %23
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv115133.us, i64 %18, i64 %offset.idx48
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = fadd <2 x double> %31, %wide.load56
  %35 = fmul <2 x double> %34, <double 1.250000e-01, double 1.250000e-01>
  %36 = fadd <2 x double> %28, %35
  %37 = add nuw nsw i64 %offset.idx48, 1
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv115133.us, i64 %indvars.iv111131.us.us, i64 %37
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !1
  %40 = fsub <2 x double> %wide.load57, %23
  %41 = add nsw i64 %offset.idx48, -1
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv115133.us, i64 %indvars.iv111131.us.us, i64 %41
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !1
  %44 = fadd <2 x double> %40, %wide.load58
  %45 = fmul <2 x double> %44, <double 1.250000e-01, double 1.250000e-01>
  %46 = fadd <2 x double> %36, %45
  %47 = fadd <2 x double> %wide.load53, %46
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv115133.us, i64 %indvars.iv111131.us.us, i64 %offset.idx48
  %49 = bitcast double* %48 to <2 x double>*
  store <2 x double> %47, <2 x double>* %49, align 8, !alias.scope !4, !noalias !1
  %index.next44 = add i64 %index43, 2
  %50 = icmp eq i64 %index.next44, %n.vec22
  br i1 %50, label %middle.block17, label %vector.body16, !llvm.loop !6

middle.block17:                                   ; preds = %vector.body16
  br i1 %cmp.n47, label %.preheader106._crit_edge.us.us, label %.preheader106.us.us.preheader

.preheader106._crit_edge.us.us.loopexit:          ; preds = %.preheader106.us.us
  br label %.preheader106._crit_edge.us.us

.preheader106._crit_edge.us.us:                   ; preds = %.preheader106._crit_edge.us.us.loopexit, %middle.block17
  %indvars.iv.next112.us.us = add nuw nsw i64 %indvars.iv111131.us.us, 1
  %exitcond114.us.us = icmp eq i64 %indvars.iv.next112.us.us, %wide.trip.count113
  %indvar.next28 = add i64 %indvar27, 1
  br i1 %exitcond114.us.us, label %.preheader108._crit_edge.us.loopexit, label %.preheader106.preheader.us.us

.preheader106.us.us:                              ; preds = %.preheader106.us.us.preheader, %.preheader106.us.us
  %indvars.iv129.us.us = phi i64 [ %indvars.iv.next.us.us, %.preheader106.us.us ], [ %indvars.iv129.us.us.ph, %.preheader106.us.us.preheader ]
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %14, i64 %indvars.iv111131.us.us, i64 %indvars.iv129.us.us
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv115133.us, i64 %indvars.iv111131.us.us, i64 %indvars.iv129.us.us
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, 2.000000e+00
  %56 = fsub double %52, %55
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %15, i64 %indvars.iv111131.us.us, i64 %indvars.iv129.us.us
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  %60 = fmul double %59, 1.250000e-01
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv115133.us, i64 %17, i64 %indvars.iv129.us.us
  %62 = load double, double* %61, align 8
  %63 = fsub double %62, %55
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv115133.us, i64 %18, i64 %indvars.iv129.us.us
  %65 = load double, double* %64, align 8
  %66 = fadd double %63, %65
  %67 = fmul double %66, 1.250000e-01
  %68 = fadd double %60, %67
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv129.us.us, 1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv115133.us, i64 %indvars.iv111131.us.us, i64 %indvars.iv.next.us.us
  %70 = load double, double* %69, align 8
  %71 = fsub double %70, %55
  %72 = add nsw i64 %indvars.iv129.us.us, -1
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv115133.us, i64 %indvars.iv111131.us.us, i64 %72
  %74 = load double, double* %73, align 8
  %75 = fadd double %71, %74
  %76 = fmul double %75, 1.250000e-01
  %77 = fadd double %68, %76
  %78 = fadd double %54, %77
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv115133.us, i64 %indvars.iv111131.us.us, i64 %indvars.iv129.us.us
  store double %78, double* %79, align 8
  %exitcond.us.us = icmp eq i64 %indvars.iv.next.us.us, %wide.trip.count
  br i1 %exitcond.us.us, label %.preheader106._crit_edge.us.us.loopexit, label %.preheader106.us.us, !llvm.loop !9

.preheader109.preheader.loopexit:                 ; preds = %.preheader108._crit_edge.us
  br label %.preheader109.preheader

.preheader109.preheader:                          ; preds = %.preheader109.preheader.loopexit, %.preheader110.preheader
  br i1 %9, label %.preheader107.preheader.us.preheader, label %.preheader109._crit_edge

.preheader107.preheader.us.preheader:             ; preds = %.preheader109.preheader
  br label %.preheader107.preheader.us

.preheader107.preheader.us:                       ; preds = %.preheader107.preheader.us.preheader, %.preheader107._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %.preheader107._crit_edge.us ], [ 0, %.preheader107.preheader.us.preheader ]
  %indvars.iv125156.us = phi i64 [ %indvars.iv.next126.us, %.preheader107._crit_edge.us ], [ 1, %.preheader107.preheader.us.preheader ]
  %80 = add i64 %indvar, 1
  %81 = add i64 %indvar, 2
  %82 = add nuw nsw i64 %indvars.iv125156.us, 1
  %83 = add nsw i64 %indvars.iv125156.us, -1
  br i1 %10, label %.preheader107._crit_edge.us, label %.preheader.preheader.us.us.preheader

.preheader.preheader.us.us.preheader:             ; preds = %.preheader107.preheader.us
  br label %.preheader.preheader.us.us

.preheader107._crit_edge.us.loopexit:             ; preds = %.preheader._crit_edge.us.us
  br label %.preheader107._crit_edge.us

.preheader107._crit_edge.us:                      ; preds = %.preheader107._crit_edge.us.loopexit, %.preheader107.preheader.us
  %indvars.iv.next126.us = add nuw nsw i64 %indvars.iv125156.us, 1
  %exitcond179 = icmp eq i64 %indvars.iv.next126.us, %6
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond179, label %.preheader109._crit_edge.loopexit, label %.preheader107.preheader.us

.preheader.preheader.us.us:                       ; preds = %.preheader.preheader.us.us.preheader, %.preheader._crit_edge.us.us
  %indvar1 = phi i64 [ %indvar.next2, %.preheader._crit_edge.us.us ], [ 0, %.preheader.preheader.us.us.preheader ]
  %indvars.iv121154.us.us = phi i64 [ %indvars.iv.next122.us.us, %.preheader._crit_edge.us.us ], [ 1, %.preheader.preheader.us.us.preheader ]
  %84 = add i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %80, i64 %84, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %80, i64 %84, i64 %wide.trip.count119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar, i64 %84, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %81, i64 %84, i64 %wide.trip.count119
  %85 = add nuw nsw i64 %indvars.iv121154.us.us, 1
  %86 = add nsw i64 %indvars.iv121154.us.us, -1
  br i1 %min.iters.check, label %.preheader.us.us.preheader, label %min.iters.checked

.preheader.us.us.preheader:                       ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.preheader.us.us
  %indvars.iv117151.us.us.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.preheader.us.us ], [ %ind.end, %middle.block ]
  br label %.preheader.us.us

min.iters.checked:                                ; preds = %.preheader.preheader.us.us
  br i1 %cmp.zero, label %.preheader.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.preheader.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %82, i64 %indvars.iv121154.us.us, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv125156.us, i64 %indvars.iv121154.us.us, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %92 = fsub <2 x double> %wide.load, %91
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %83, i64 %indvars.iv121154.us.us, i64 %offset.idx
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !10
  %95 = fadd <2 x double> %wide.load11, %92
  %96 = fmul <2 x double> %95, <double 1.250000e-01, double 1.250000e-01>
  %97 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv125156.us, i64 %85, i64 %offset.idx
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !10
  %99 = fsub <2 x double> %wide.load12, %91
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv125156.us, i64 %86, i64 %offset.idx
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !10
  %102 = fadd <2 x double> %99, %wide.load13
  %103 = fmul <2 x double> %102, <double 1.250000e-01, double 1.250000e-01>
  %104 = fadd <2 x double> %96, %103
  %105 = add nuw nsw i64 %offset.idx, 1
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv125156.us, i64 %indvars.iv121154.us.us, i64 %105
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !10
  %108 = fsub <2 x double> %wide.load14, %91
  %109 = add nsw i64 %offset.idx, -1
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv125156.us, i64 %indvars.iv121154.us.us, i64 %109
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !10
  %112 = fadd <2 x double> %108, %wide.load15
  %113 = fmul <2 x double> %112, <double 1.250000e-01, double 1.250000e-01>
  %114 = fadd <2 x double> %104, %113
  %115 = fadd <2 x double> %wide.load10, %114
  %116 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv125156.us, i64 %indvars.iv121154.us.us, i64 %offset.idx
  %117 = bitcast double* %116 to <2 x double>*
  store <2 x double> %115, <2 x double>* %117, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %118 = icmp eq i64 %index.next, %n.vec
  br i1 %118, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %.preheader._crit_edge.us.us, label %.preheader.us.us.preheader

.preheader._crit_edge.us.us.loopexit:             ; preds = %.preheader.us.us
  br label %.preheader._crit_edge.us.us

.preheader._crit_edge.us.us:                      ; preds = %.preheader._crit_edge.us.us.loopexit, %middle.block
  %indvars.iv.next122.us.us = add nuw nsw i64 %indvars.iv121154.us.us, 1
  %exitcond124.us.us = icmp eq i64 %indvars.iv.next122.us.us, %wide.trip.count123
  %indvar.next2 = add i64 %indvar1, 1
  br i1 %exitcond124.us.us, label %.preheader107._crit_edge.us.loopexit, label %.preheader.preheader.us.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %.preheader.us.us
  %indvars.iv117151.us.us = phi i64 [ %indvars.iv.next118.us.us, %.preheader.us.us ], [ %indvars.iv117151.us.us.ph, %.preheader.us.us.preheader ]
  %119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %82, i64 %indvars.iv121154.us.us, i64 %indvars.iv117151.us.us
  %120 = load double, double* %119, align 8
  %121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv125156.us, i64 %indvars.iv121154.us.us, i64 %indvars.iv117151.us.us
  %122 = load double, double* %121, align 8
  %123 = fmul double %122, 2.000000e+00
  %124 = fsub double %120, %123
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %83, i64 %indvars.iv121154.us.us, i64 %indvars.iv117151.us.us
  %126 = load double, double* %125, align 8
  %127 = fadd double %126, %124
  %128 = fmul double %127, 1.250000e-01
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv125156.us, i64 %85, i64 %indvars.iv117151.us.us
  %130 = load double, double* %129, align 8
  %131 = fsub double %130, %123
  %132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv125156.us, i64 %86, i64 %indvars.iv117151.us.us
  %133 = load double, double* %132, align 8
  %134 = fadd double %131, %133
  %135 = fmul double %134, 1.250000e-01
  %136 = fadd double %128, %135
  %indvars.iv.next118.us.us = add nuw nsw i64 %indvars.iv117151.us.us, 1
  %137 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv125156.us, i64 %indvars.iv121154.us.us, i64 %indvars.iv.next118.us.us
  %138 = load double, double* %137, align 8
  %139 = fsub double %138, %123
  %140 = add nsw i64 %indvars.iv117151.us.us, -1
  %141 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv125156.us, i64 %indvars.iv121154.us.us, i64 %140
  %142 = load double, double* %141, align 8
  %143 = fadd double %139, %142
  %144 = fmul double %143, 1.250000e-01
  %145 = fadd double %136, %144
  %146 = fadd double %122, %145
  %147 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv125156.us, i64 %indvars.iv121154.us.us, i64 %indvars.iv117151.us.us
  store double %146, double* %147, align 8
  %exitcond120.us.us = icmp eq i64 %indvars.iv.next118.us.us, %wide.trip.count119
  br i1 %exitcond120.us.us, label %.preheader._crit_edge.us.us.loopexit, label %.preheader.us.us, !llvm.loop !16

.preheader109._crit_edge.loopexit:                ; preds = %.preheader107._crit_edge.us
  br label %.preheader109._crit_edge

.preheader109._crit_edge:                         ; preds = %.preheader109._crit_edge.loopexit, %.preheader109.preheader
  %148 = add nuw nsw i32 %storemerge173, 1
  %exitcond127 = icmp eq i32 %148, 501
  br i1 %exitcond127, label %149, label %.preheader110.preheader

; <label>:149:                                    ; preds = %.preheader109._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader15.preheader.us.preheader, label %._crit_edge

.preheader15.preheader.us.preheader:              ; preds = %2
  %wide.trip.count18 = zext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.preheader.us.us.preheader

.preheader.preheader.us.us.preheader:             ; preds = %.preheader15._crit_edge.us, %.preheader15.preheader.us.preheader
  %indvars.iv2027.us = phi i64 [ %indvars.iv.next21.us, %.preheader15._crit_edge.us ], [ 0, %.preheader15.preheader.us.preheader ]
  %9 = mul nsw i64 %indvars.iv2027.us, %7
  %10 = trunc i64 %9 to i32
  br label %.preheader.preheader.us.us

.preheader15._crit_edge.us:                       ; preds = %.preheader._crit_edge.us.us
  %indvars.iv.next21.us = add nuw nsw i64 %indvars.iv2027.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next21.us, %7
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader.preheader.us.us.preheader

.preheader.preheader.us.us:                       ; preds = %.preheader._crit_edge.us.us, %.preheader.preheader.us.us.preheader
  %indvars.iv1625.us.us = phi i64 [ %indvars.iv.next17.us.us, %.preheader._crit_edge.us.us ], [ 0, %.preheader.preheader.us.us.preheader ]
  %11 = trunc i64 %indvars.iv1625.us.us to i32
  %12 = add i32 %11, %10
  %13 = mul i32 %12, %0
  %14 = zext i32 %13 to i64
  br label %15

.preheader._crit_edge.us.us:                      ; preds = %.preheader.us.us
  %indvars.iv.next17.us.us = add nuw nsw i64 %indvars.iv1625.us.us, 1
  %exitcond19.us.us = icmp eq i64 %indvars.iv.next17.us.us, %wide.trip.count18
  br i1 %exitcond19.us.us, label %.preheader15._crit_edge.us, label %.preheader.preheader.us.us

; <label>:15:                                     ; preds = %.preheader.us.us, %.preheader.preheader.us.us
  %indvars.iv23.us.us = phi i64 [ 0, %.preheader.preheader.us.us ], [ %indvars.iv.next.us.us, %.preheader.us.us ]
  %16 = add i64 %indvars.iv23.us.us, %14
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 20
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %.preheader.us.us

; <label>:20:                                     ; preds = %15
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %21) #5
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %15, %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv2027.us, i64 %indvars.iv1625.us.us, i64 %indvars.iv23.us.us
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #5
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv23.us.us, 1
  %exitcond.us.us = icmp eq i64 %indvars.iv.next.us.us, %wide.trip.count
  br i1 %exitcond.us.us, label %.preheader._crit_edge.us.us, label %15

._crit_edge.loopexit:                             ; preds = %.preheader15._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #5
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

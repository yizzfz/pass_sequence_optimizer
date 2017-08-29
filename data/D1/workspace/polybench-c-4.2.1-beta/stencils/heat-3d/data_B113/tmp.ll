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
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca [120 x [120 x [120 x double]]]*, align 8
  %7 = alloca [120 x [120 x [120 x double]]]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 120, i32* %5, align 4
  %8 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #3
  %9 = bitcast [120 x [120 x [120 x double]]]** %6 to i8**
  store i8* %8, i8** %9, align 8
  %10 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #3
  %11 = bitcast [120 x [120 x [120 x double]]]** %7 to i8**
  store i8* %10, i8** %11, align 8
  %12 = load i32, i32* %5, align 4
  %13 = bitcast i8* %8 to [120 x [120 x double]]*
  %14 = bitcast i8* %10 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 %12, [120 x [120 x double]]* %13, [120 x [120 x double]]* %14)
  tail call void (...) @polybench_timer_start() #3
  %15 = bitcast [120 x [120 x [120 x double]]]** %6 to [120 x [120 x double]]**
  %16 = load [120 x [120 x double]]*, [120 x [120 x double]]** %15, align 8
  %17 = bitcast [120 x [120 x [120 x double]]]** %7 to [120 x [120 x double]]**
  %18 = load [120 x [120 x double]]*, [120 x [120 x double]]** %17, align 8
  tail call fastcc void @kernel_heat_3d(i32 %12, [120 x [120 x double]]* %16, [120 x [120 x double]]* %18)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %19 = load i32, i32* %3, align 4
  %20 = icmp sgt i32 %19, 42
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %2
  %22 = load i8**, i8*** %4, align 8
  %23 = load i8*, i8** %22, align 8
  %strcmpload = load i8, i8* %23, align 1
  %24 = icmp eq i8 %strcmpload, 0
  br i1 %24, label %25, label %._crit_edge

; <label>:25:                                     ; preds = %21
  %26 = load i32, i32* %5, align 4
  %27 = bitcast [120 x [120 x [120 x double]]]** %6 to [120 x [120 x double]]**
  %28 = load [120 x [120 x double]]*, [120 x [120 x double]]** %27, align 8
  tail call fastcc void @print_array(i32 %26, [120 x [120 x double]]* %28)
  br label %._crit_edge

._crit_edge:                                      ; preds = %21, %2, %25
  %29 = bitcast [120 x [120 x [120 x double]]]** %6 to i8**
  %30 = load i8*, i8** %29, align 8
  tail call void @free(i8* %30) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = alloca [120 x [120 x double]]*, align 8
  %6 = alloca [120 x [120 x double]]*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store [120 x [120 x double]]* %1, [120 x [120 x double]]** %5, align 8
  store [120 x [120 x double]]* %2, [120 x [120 x double]]** %6, align 8
  store i32 0, i32* %7, align 4
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader3.lr.ph, label %48

.preheader3.lr.ph:                                ; preds = %3
  %10 = load i32, i32* %4, align 4
  %wide.trip.count.1 = zext i32 %10 to i64
  %11 = icmp sgt i32 %10, 0
  %12 = sitofp i32 %10 to double
  %13 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %14 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %.promoted = load i32, i32* %7, align 4
  br i1 %11, label %.preheader3.us.preheader, label %._crit_edge5.loopexit27

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %15 = and i32 %10, 1
  %16 = icmp sgt i32 %10, 0
  %17 = icmp eq i32 %15, 0
  %18 = icmp eq i32 %10, 1
  %19 = sext i32 %.promoted to i64
  %20 = sext i32 %10 to i64
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge4.us
  %indvars.iv33 = phi i64 [ %19, %.preheader3.us.preheader ], [ %indvars.iv.next34, %._crit_edge4.us ]
  br i1 %16, label %.preheader.us.us.preheader, label %._crit_edge4.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  br label %.preheader.us.us

._crit_edge4.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us.loopexit, %.preheader3.us
  %.lcssa9.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %10, %._crit_edge4.us.loopexit ]
  %indvars.iv.next34 = add nsw i64 %indvars.iv33, 1
  %21 = icmp slt i64 %indvars.iv.next34, %20
  br i1 %21, label %.preheader3.us, label %._crit_edge5.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv31 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next32, %._crit_edge.us.us ]
  %22 = trunc i64 %indvars.iv31 to i32
  %23 = trunc i64 %indvars.iv33 to i32
  %24 = add i32 %22, %23
  %25 = add i32 %24, %10
  br i1 %17, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %26 = sitofp i32 %25 to double
  %27 = fmul double %26, 1.000000e+01
  %28 = fdiv double %27, %12
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv33, i64 %indvars.iv31, i64 0
  store double %28, double* %29, align 8
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv33, i64 %indvars.iv31, i64 0
  store double %28, double* %30, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %18, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %wide.trip.count = zext i32 %10 to i64
  %exitcond = icmp ne i64 %indvars.iv.next32, %wide.trip.count
  br i1 %exitcond, label %.preheader.us.us, label %._crit_edge4.us.loopexit

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %31 = trunc i64 %indvars.iv to i32
  %32 = sub i32 %25, %31
  %33 = sitofp i32 %32 to double
  %34 = fmul double %33, 1.000000e+01
  %35 = fdiv double %34, %12
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv33, i64 %indvars.iv31, i64 %indvars.iv
  store double %35, double* %36, align 8
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv33, i64 %indvars.iv31, i64 %indvars.iv
  store double %35, double* %37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %38 = trunc i64 %indvars.iv.next to i32
  %39 = sub i32 %25, %38
  %40 = sitofp i32 %39 to double
  %41 = fmul double %40, 1.000000e+01
  %42 = fdiv double %41, %12
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv33, i64 %indvars.iv31, i64 %indvars.iv.next
  store double %42, double* %43, align 8
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv33, i64 %indvars.iv31, i64 %indvars.iv.next
  store double %42, double* %44, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge5.loopexit27:                          ; preds = %.preheader3.lr.ph
  %.promoted13 = load i32, i32* %8, align 4
  %45 = add i32 %.promoted, 1
  %46 = icmp sgt i32 %10, %45
  %smax = select i1 %46, i32 %10, i32 %45
  br label %._crit_edge5

._crit_edge5.loopexit:                            ; preds = %._crit_edge4.us
  %47 = trunc i64 %indvars.iv.next34 to i32
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %._crit_edge5.loopexit27
  %.lcssa9.lcssa15.lcssa = phi i32 [ %.promoted13, %._crit_edge5.loopexit27 ], [ %.lcssa9.lcssa.us, %._crit_edge5.loopexit ]
  %.lcssa10 = phi i32 [ %smax, %._crit_edge5.loopexit27 ], [ %47, %._crit_edge5.loopexit ]
  store i32 %.lcssa10, i32* %7, align 4
  store i32 %.lcssa9.lcssa15.lcssa, i32* %8, align 4
  br label %48

; <label>:48:                                     ; preds = %._crit_edge5, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = alloca [120 x [120 x double]]*, align 8
  %6 = alloca [120 x [120 x double]]*, align 8
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store [120 x [120 x double]]* %1, [120 x [120 x double]]** %5, align 8
  store [120 x [120 x double]]* %2, [120 x [120 x double]]** %6, align 8
  store i32 1, i32* %7, align 4
  %8 = add nsw i32 %0, -1
  %9 = add nsw i32 %0, -1
  %10 = add nsw i32 %0, -1
  %11 = add nsw i32 %0, -1
  %12 = load i32, i32* %4, align 4
  %13 = sext i32 %12 to i64
  %14 = add nsw i64 %13, -1
  %15 = add nsw i32 %12, -1
  %16 = add nsw i32 %12, -1
  %17 = add nsw i32 %12, -1
  %18 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %19 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %20 = load i32, i32* %4, align 4
  %21 = sext i32 %20 to i64
  %22 = sext i32 %20 to i64
  %23 = add nsw i64 %22, -1
  %24 = add nsw i32 %20, -1
  %25 = add nsw i64 %21, -1
  %.promoted49 = load i32, i32* %7, align 4
  %wide.trip.count = zext i32 %11 to i64
  %26 = icmp sgt i64 %23, 2
  %smax = select i1 %26, i64 %23, i64 2
  %27 = add nsw i64 %smax, -1
  %28 = icmp sgt i64 %23, 2
  %smax4 = select i1 %28, i64 %23, i64 2
  %29 = add nsw i64 %wide.trip.count, -1
  %30 = icmp sgt i32 %8, 1
  %31 = icmp sgt i32 %9, 1
  %32 = icmp sgt i32 %10, 1
  %min.iters.check23 = icmp ult i64 %29, 2
  %n.vec26 = and i64 %29, -2
  %cmp.zero27 = icmp eq i64 %n.vec26, 0
  %ind.end50 = or i64 %29, 1
  %cmp.n51 = icmp eq i64 %29, %n.vec26
  %33 = icmp sgt i32 %15, 1
  %34 = icmp sgt i32 %16, 1
  %35 = icmp sgt i32 %17, 1
  %min.iters.check = icmp ult i64 %27, 2
  %n.vec = and i64 %27, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %27, 1
  %cmp.n = icmp eq i64 %27, %n.vec
  %36 = add i32 %0, -2
  %37 = sext i32 %24 to i64
  br label %.preheader11

.preheader11:                                     ; preds = %3, %._crit_edge16
  %38 = phi i32 [ %.promoted49, %3 ], [ %209, %._crit_edge16 ]
  br i1 %30, label %.preheader9.preheader, label %.preheader10

.preheader9.preheader:                            ; preds = %.preheader11
  br label %.preheader9

.preheader10.loopexit:                            ; preds = %._crit_edge12
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader11
  br i1 %33, label %.preheader8.preheader, label %._crit_edge16

.preheader8.preheader:                            ; preds = %.preheader10
  br label %.preheader8

.preheader9:                                      ; preds = %.preheader9.preheader, %._crit_edge12
  %indvar29 = phi i64 [ %indvar.next30, %._crit_edge12 ], [ 0, %.preheader9.preheader ]
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge12 ], [ 1, %.preheader9.preheader ]
  %39 = add nuw nsw i64 %indvar29, 1
  %40 = add nuw nsw i64 %indvar29, 2
  br i1 %31, label %.preheader7.lr.ph, label %._crit_edge12

.preheader7.lr.ph:                                ; preds = %.preheader9
  %41 = add nuw nsw i64 %indvars.iv59, 1
  %42 = add nsw i64 %indvars.iv59, -1
  br i1 %32, label %.preheader7.us.preheader, label %._crit_edge12

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge.us
  %indvars.iv67 = phi i64 [ 1, %.preheader7.us.preheader ], [ %indvars.iv.next68, %._crit_edge.us ]
  %indvar31 = phi i64 [ %indvar.next32, %._crit_edge.us ], [ 0, %.preheader7.us.preheader ]
  %43 = add nuw nsw i64 %indvar31, 1
  %scevgep33 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %39, i64 %43, i64 1
  %scevgep35 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %39, i64 %43, i64 %wide.trip.count
  %scevgep37 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar29, i64 %43, i64 1
  %scevgep39 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %40, i64 %43, i64 %wide.trip.count
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %44 = add nsw i64 %indvars.iv67, -1
  br i1 %min.iters.check23, label %scalar.ph22.preheader, label %min.iters.checked24

min.iters.checked24:                              ; preds = %.preheader7.us
  br i1 %cmp.zero27, label %scalar.ph22.preheader, label %vector.memcheck45

vector.memcheck45:                                ; preds = %min.iters.checked24
  %bound041 = icmp ult double* %scevgep33, %scevgep39
  %bound142 = icmp ult double* %scevgep37, %scevgep35
  %memcheck.conflict44 = and i1 %bound041, %bound142
  br i1 %memcheck.conflict44, label %scalar.ph22.preheader, label %vector.body20.preheader

vector.body20.preheader:                          ; preds = %vector.memcheck45
  br label %vector.body20

vector.body20:                                    ; preds = %vector.body20.preheader, %vector.body20
  %index47 = phi i64 [ %index.next48, %vector.body20 ], [ 0, %vector.body20.preheader ]
  %offset.idx52 = or i64 %index47, 1
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %41, i64 %indvars.iv67, i64 %offset.idx52
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !1
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %indvars.iv67, i64 %offset.idx52
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !1
  %49 = fmul <2 x double> %wide.load57, <double 2.000000e+00, double 2.000000e+00>
  %50 = fsub <2 x double> %wide.load56, %49
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %42, i64 %indvars.iv67, i64 %offset.idx52
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !1
  %53 = fadd <2 x double> %50, %wide.load58
  %54 = fmul <2 x double> %53, <double 1.250000e-01, double 1.250000e-01>
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %indvars.iv.next68, i64 %offset.idx52
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !1
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %indvars.iv67, i64 %offset.idx52
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !1
  %59 = fmul <2 x double> %wide.load60, <double 2.000000e+00, double 2.000000e+00>
  %60 = fsub <2 x double> %wide.load59, %59
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %44, i64 %offset.idx52
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load61 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !1
  %63 = fadd <2 x double> %60, %wide.load61
  %64 = fmul <2 x double> %63, <double 1.250000e-01, double 1.250000e-01>
  %65 = fadd <2 x double> %54, %64
  %66 = add nuw nsw i64 %offset.idx52, 1
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %indvars.iv67, i64 %66
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load62 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %indvars.iv67, i64 %offset.idx52
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load63 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !1
  %71 = fmul <2 x double> %wide.load63, <double 2.000000e+00, double 2.000000e+00>
  %72 = fsub <2 x double> %wide.load62, %71
  %73 = add nsw i64 %offset.idx52, -1
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %indvars.iv67, i64 %73
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load64 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !1
  %76 = fadd <2 x double> %72, %wide.load64
  %77 = fmul <2 x double> %76, <double 1.250000e-01, double 1.250000e-01>
  %78 = fadd <2 x double> %65, %77
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %indvars.iv67, i64 %offset.idx52
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !1
  %81 = fadd <2 x double> %78, %wide.load65
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv59, i64 %indvars.iv67, i64 %offset.idx52
  %83 = bitcast double* %82 to <2 x double>*
  store <2 x double> %81, <2 x double>* %83, align 8, !alias.scope !4, !noalias !1
  %index.next48 = add i64 %index47, 2
  %84 = icmp eq i64 %index.next48, %n.vec26
  br i1 %84, label %middle.block21, label %vector.body20, !llvm.loop !6

middle.block21:                                   ; preds = %vector.body20
  br i1 %cmp.n51, label %._crit_edge.us, label %scalar.ph22.preheader

scalar.ph22.preheader:                            ; preds = %middle.block21, %vector.memcheck45, %min.iters.checked24, %.preheader7.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck45 ], [ 1, %min.iters.checked24 ], [ 1, %.preheader7.us ], [ %ind.end50, %middle.block21 ]
  br label %scalar.ph22

scalar.ph22:                                      ; preds = %scalar.ph22.preheader, %scalar.ph22
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph22 ], [ %indvars.iv.ph, %scalar.ph22.preheader ]
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %41, i64 %indvars.iv67, i64 %indvars.iv
  %86 = load double, double* %85, align 8
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %indvars.iv67, i64 %indvars.iv
  %88 = load double, double* %87, align 8
  %89 = fmul double %88, 2.000000e+00
  %90 = fsub double %86, %89
  %91 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %42, i64 %indvars.iv67, i64 %indvars.iv
  %92 = load double, double* %91, align 8
  %93 = fadd double %90, %92
  %94 = fmul double %93, 1.250000e-01
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %indvars.iv.next68, i64 %indvars.iv
  %96 = load double, double* %95, align 8
  %97 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %indvars.iv67, i64 %indvars.iv
  %98 = load double, double* %97, align 8
  %99 = fmul double %98, 2.000000e+00
  %100 = fsub double %96, %99
  %101 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %44, i64 %indvars.iv
  %102 = load double, double* %101, align 8
  %103 = fadd double %100, %102
  %104 = fmul double %103, 1.250000e-01
  %105 = fadd double %94, %104
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %indvars.iv67, i64 %indvars.iv.next
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %indvars.iv67, i64 %indvars.iv
  %109 = load double, double* %108, align 8
  %110 = fmul double %109, 2.000000e+00
  %111 = fsub double %107, %110
  %112 = add nsw i64 %indvars.iv, -1
  %113 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %indvars.iv67, i64 %112
  %114 = load double, double* %113, align 8
  %115 = fadd double %111, %114
  %116 = fmul double %115, 1.250000e-01
  %117 = fadd double %105, %116
  %118 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %indvars.iv67, i64 %indvars.iv
  %119 = load double, double* %118, align 8
  %120 = fadd double %117, %119
  %121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv59, i64 %indvars.iv67, i64 %indvars.iv
  store double %120, double* %121, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph22, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph22
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block21
  %indvar.next32 = add nuw nsw i64 %indvar31, 1
  %wide.trip.count69 = zext i32 %36 to i64
  %exitcond70 = icmp ne i64 %indvar.next32, %wide.trip.count69
  br i1 %exitcond70, label %.preheader7.us, label %._crit_edge12.loopexit

._crit_edge12.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.preheader7.lr.ph, %.preheader9
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %122 = icmp slt i64 %indvars.iv.next60, %14
  %indvar.next30 = add nuw nsw i64 %indvar29, 1
  br i1 %122, label %.preheader9, label %.preheader10.loopexit

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge15
  %indvar = phi i64 [ %indvar.next, %._crit_edge15 ], [ 0, %.preheader8.preheader ]
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge15 ], [ 1, %.preheader8.preheader ]
  %123 = add nuw nsw i64 %indvar, 1
  %124 = add nuw nsw i64 %indvar, 2
  br i1 %34, label %.preheader.lr.ph, label %._crit_edge15

.preheader.lr.ph:                                 ; preds = %.preheader8
  %125 = add nuw nsw i64 %indvars.iv66, 1
  %126 = add nsw i64 %indvars.iv66, -1
  br i1 %35, label %.preheader.us.preheader, label %._crit_edge15

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge14.us
  %indvars.iv71 = phi i64 [ 1, %.preheader.us.preheader ], [ %indvars.iv.next72, %._crit_edge14.us ]
  %indvar1 = phi i64 [ %indvar.next2, %._crit_edge14.us ], [ 0, %.preheader.us.preheader ]
  %127 = add nuw nsw i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %123, i64 %127, i64 1
  %scevgep5 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %123, i64 %127, i64 %smax4
  %scevgep7 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvar, i64 %127, i64 1
  %scevgep9 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %124, i64 %127, i64 %smax4
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %128 = add nsw i64 %indvars.iv71, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep9
  %bound1 = icmp ult double* %scevgep7, %scevgep5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %125, i64 %indvars.iv71, i64 %offset.idx
  %130 = bitcast double* %129 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %130, align 8, !alias.scope !10
  %131 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %indvars.iv71, i64 %offset.idx
  %132 = bitcast double* %131 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %132, align 8, !alias.scope !10
  %133 = fmul <2 x double> %wide.load11, <double 2.000000e+00, double 2.000000e+00>
  %134 = fsub <2 x double> %wide.load, %133
  %135 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %126, i64 %indvars.iv71, i64 %offset.idx
  %136 = bitcast double* %135 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %136, align 8, !alias.scope !10
  %137 = fadd <2 x double> %134, %wide.load12
  %138 = fmul <2 x double> %137, <double 1.250000e-01, double 1.250000e-01>
  %139 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %indvars.iv.next72, i64 %offset.idx
  %140 = bitcast double* %139 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %140, align 8, !alias.scope !10
  %141 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %indvars.iv71, i64 %offset.idx
  %142 = bitcast double* %141 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %142, align 8, !alias.scope !10
  %143 = fmul <2 x double> %wide.load14, <double 2.000000e+00, double 2.000000e+00>
  %144 = fsub <2 x double> %wide.load13, %143
  %145 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %128, i64 %offset.idx
  %146 = bitcast double* %145 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %146, align 8, !alias.scope !10
  %147 = fadd <2 x double> %144, %wide.load15
  %148 = fmul <2 x double> %147, <double 1.250000e-01, double 1.250000e-01>
  %149 = fadd <2 x double> %138, %148
  %150 = add nuw nsw i64 %offset.idx, 1
  %151 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %indvars.iv71, i64 %150
  %152 = bitcast double* %151 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %152, align 8, !alias.scope !10
  %153 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %indvars.iv71, i64 %offset.idx
  %154 = bitcast double* %153 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %154, align 8, !alias.scope !10
  %155 = fmul <2 x double> %wide.load17, <double 2.000000e+00, double 2.000000e+00>
  %156 = fsub <2 x double> %wide.load16, %155
  %157 = add nsw i64 %offset.idx, -1
  %158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %indvars.iv71, i64 %157
  %159 = bitcast double* %158 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %159, align 8, !alias.scope !10
  %160 = fadd <2 x double> %156, %wide.load18
  %161 = fmul <2 x double> %160, <double 1.250000e-01, double 1.250000e-01>
  %162 = fadd <2 x double> %149, %161
  %163 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %indvars.iv71, i64 %offset.idx
  %164 = bitcast double* %163 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %164, align 8, !alias.scope !10
  %165 = fadd <2 x double> %162, %wide.load19
  %166 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %indvars.iv66, i64 %indvars.iv71, i64 %offset.idx
  %167 = bitcast double* %166 to <2 x double>*
  store <2 x double> %165, <2 x double>* %167, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %168 = icmp eq i64 %index.next, %n.vec
  br i1 %168, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge14.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv62.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %scalar.ph ], [ %indvars.iv62.ph, %scalar.ph.preheader ]
  %169 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %125, i64 %indvars.iv71, i64 %indvars.iv62
  %170 = load double, double* %169, align 8
  %171 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %indvars.iv71, i64 %indvars.iv62
  %172 = load double, double* %171, align 8
  %173 = fmul double %172, 2.000000e+00
  %174 = fsub double %170, %173
  %175 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %126, i64 %indvars.iv71, i64 %indvars.iv62
  %176 = load double, double* %175, align 8
  %177 = fadd double %174, %176
  %178 = fmul double %177, 1.250000e-01
  %179 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %indvars.iv.next72, i64 %indvars.iv62
  %180 = load double, double* %179, align 8
  %181 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %indvars.iv71, i64 %indvars.iv62
  %182 = load double, double* %181, align 8
  %183 = fmul double %182, 2.000000e+00
  %184 = fsub double %180, %183
  %185 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %128, i64 %indvars.iv62
  %186 = load double, double* %185, align 8
  %187 = fadd double %184, %186
  %188 = fmul double %187, 1.250000e-01
  %189 = fadd double %178, %188
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %190 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %indvars.iv71, i64 %indvars.iv.next63
  %191 = load double, double* %190, align 8
  %192 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %indvars.iv71, i64 %indvars.iv62
  %193 = load double, double* %192, align 8
  %194 = fmul double %193, 2.000000e+00
  %195 = fsub double %191, %194
  %196 = add nsw i64 %indvars.iv62, -1
  %197 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %indvars.iv71, i64 %196
  %198 = load double, double* %197, align 8
  %199 = fadd double %195, %198
  %200 = fmul double %199, 1.250000e-01
  %201 = fadd double %189, %200
  %202 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %indvars.iv71, i64 %indvars.iv62
  %203 = load double, double* %202, align 8
  %204 = fadd double %201, %203
  %205 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %indvars.iv66, i64 %indvars.iv71, i64 %indvars.iv62
  store double %204, double* %205, align 8
  %206 = icmp slt i64 %indvars.iv.next63, %23
  br i1 %206, label %scalar.ph, label %._crit_edge14.us.loopexit, !llvm.loop !16

._crit_edge14.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.loopexit, %middle.block
  %207 = icmp slt i64 %indvars.iv.next72, %37
  %indvar.next2 = add nuw nsw i64 %indvar1, 1
  br i1 %207, label %.preheader.us, label %._crit_edge15.loopexit

._crit_edge15.loopexit:                           ; preds = %._crit_edge14.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %.preheader.lr.ph, %.preheader8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %208 = icmp slt i64 %indvars.iv.next67, %25
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %208, label %.preheader8, label %._crit_edge16.loopexit

._crit_edge16.loopexit:                           ; preds = %._crit_edge15
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.preheader10
  %209 = add nsw i32 %38, 1
  %210 = icmp slt i32 %209, 501
  br i1 %210, label %.preheader11, label %211

; <label>:211:                                    ; preds = %._crit_edge16
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca [120 x [120 x double]]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [120 x [120 x double]]* %1, [120 x [120 x double]]** %4, align 8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %7) #4
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  store i32 0, i32* %5, align 4
  %11 = load i32, i32* %3, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %.preheader3.lr.ph, label %41

.preheader3.lr.ph:                                ; preds = %2
  %13 = load i32, i32* %3, align 4
  %wide.trip.count = zext i32 %13 to i64
  %14 = icmp sgt i32 %13, 0
  %15 = load [120 x [120 x double]]*, [120 x [120 x double]]** %4, align 8
  %.promoted = load i32, i32* %5, align 4
  br i1 %14, label %.preheader3.us.preheader, label %._crit_edge6.loopexit29

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %16 = icmp sgt i32 %13, 0
  %17 = sext i32 %.promoted to i64
  %18 = sext i32 %13 to i64
  %19 = sext i32 %13 to i64
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %indvars.iv37 = phi i64 [ %17, %.preheader3.us.preheader ], [ %indvars.iv.next38, %._crit_edge5.us ]
  %20 = mul nsw i64 %18, %indvars.iv37
  br i1 %16, label %.preheader.us.us.preheader, label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge4.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.preheader3.us
  %.lcssa10.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %13, %._crit_edge5.us.loopexit ]
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %21 = icmp slt i64 %indvars.iv.next38, %19
  br i1 %21, label %.preheader3.us, label %._crit_edge6.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge4.us.us
  %indvars.iv33 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next34, %._crit_edge4.us.us ]
  %22 = trunc i64 %indvars.iv33 to i32
  %23 = trunc i64 %20 to i32
  %24 = add i32 %23, %22
  %25 = mul i32 %24, %13
  %26 = zext i32 %25 to i64
  br label %27

._crit_edge4.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %wide.trip.count35 = zext i32 %13 to i64
  %exitcond36 = icmp ne i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %.preheader.us.us, label %._crit_edge5.us.loopexit

; <label>:27:                                     ; preds = %._crit_edge.us.us, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.preheader.us.us ]
  %28 = add i64 %26, %indvars.iv
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %._crit_edge.us.us

; <label>:32:                                     ; preds = %27
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #4
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %32, %27
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %15, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  %36 = load double, double* %35, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %36) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge4.us.us, label %27

._crit_edge6.loopexit29:                          ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %6, align 4
  %38 = add i32 %.promoted, 1
  %39 = icmp sgt i32 %13, %38
  %smax = select i1 %39, i32 %13, i32 %38
  br label %._crit_edge6

._crit_edge6.loopexit:                            ; preds = %._crit_edge5.us
  %40 = trunc i64 %indvars.iv.next38 to i32
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %._crit_edge6.loopexit29
  %.lcssa10.lcssa16.lcssa = phi i32 [ %.promoted14, %._crit_edge6.loopexit29 ], [ %.lcssa10.lcssa.us, %._crit_edge6.loopexit ]
  %.lcssa11 = phi i32 [ %smax, %._crit_edge6.loopexit29 ], [ %40, %._crit_edge6.loopexit ]
  store i32 %.lcssa11, i32* %5, align 4
  store i32 %.lcssa10.lcssa16.lcssa, i32* %6, align 4
  br label %41

; <label>:41:                                     ; preds = %._crit_edge6, %2
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %44) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

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

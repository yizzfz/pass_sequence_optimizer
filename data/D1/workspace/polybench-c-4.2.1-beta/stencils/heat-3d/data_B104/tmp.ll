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
  %8 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %9 = bitcast [120 x [120 x [120 x double]]]** %6 to i8**
  store i8* %8, i8** %9, align 8
  %10 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %11 = bitcast [120 x [120 x [120 x double]]]** %7 to i8**
  store i8* %10, i8** %11, align 8
  %12 = load i32, i32* %5, align 4
  %13 = bitcast i8* %8 to [120 x [120 x double]]*
  %14 = bitcast i8* %10 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 %12, [120 x [120 x double]]* %13, [120 x [120 x double]]* %14)
  tail call void (...) @polybench_timer_start() #4
  %15 = bitcast [120 x [120 x [120 x double]]]** %6 to [120 x [120 x double]]**
  %16 = load [120 x [120 x double]]*, [120 x [120 x double]]** %15, align 8
  %17 = bitcast [120 x [120 x [120 x double]]]** %7 to [120 x [120 x double]]**
  %18 = load [120 x [120 x double]]*, [120 x [120 x double]]** %17, align 8
  tail call fastcc void @kernel_heat_3d(i32 %12, [120 x [120 x double]]* %16, [120 x [120 x double]]* %18)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
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
  tail call void @free(i8* %30) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
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
  br i1 %9, label %.preheader3.lr.ph, label %38

.preheader3.lr.ph:                                ; preds = %3
  %10 = load i32, i32* %4, align 4
  %wide.trip.count = zext i32 %10 to i64
  %11 = icmp sgt i32 %10, 0
  %12 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %13 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %.promoted = load i32, i32* %7, align 4
  br i1 %11, label %.preheader3.us.preheader, label %._crit_edge6.loopexit29

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %14 = sitofp i32 %10 to double
  %15 = icmp sgt i32 %10, 0
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %16 = phi i32 [ %19, %._crit_edge5.us ], [ %.promoted, %.preheader3.us.preheader ]
  %17 = sext i32 %16 to i64
  %18 = sext i32 %16 to i64
  br i1 %15, label %.preheader.us.us.preheader, label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.preheader3.us
  %.lcssa10.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %10, %._crit_edge5.us.loopexit ]
  %19 = add nsw i32 %16, 1
  %20 = icmp slt i32 %19, %10
  br i1 %20, label %.preheader3.us, label %._crit_edge6.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %21 = phi i32 [ %24, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %22 = sext i32 %21 to i64
  %23 = sext i32 %21 to i64
  br label %26

._crit_edge.us.us:                                ; preds = %26
  %24 = add nsw i32 %21, 1
  %25 = icmp slt i32 %24, %10
  br i1 %25, label %.preheader.us.us, label %._crit_edge5.us.loopexit

; <label>:26:                                     ; preds = %26, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %26 ], [ 0, %.preheader.us.us ]
  %27 = trunc i64 %indvars.iv to i32
  %28 = sub i32 %10, %27
  %29 = add i32 %28, %16
  %30 = add i32 %29, %21
  %31 = sitofp i32 %30 to double
  %32 = fmul double %31, 1.000000e+01
  %33 = fdiv double %32, %14
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %12, i64 %17, i64 %22, i64 %indvars.iv
  store double %33, double* %34, align 8
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %18, i64 %23, i64 %indvars.iv
  store double %33, double* %35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %26

._crit_edge6.loopexit29:                          ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %8, align 4
  %36 = add i32 %.promoted, 1
  %37 = icmp sgt i32 %10, %36
  %smax = select i1 %37, i32 %10, i32 %36
  br label %._crit_edge6

._crit_edge6.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %._crit_edge6.loopexit29
  %.lcssa10.lcssa16.lcssa = phi i32 [ %.promoted14, %._crit_edge6.loopexit29 ], [ %.lcssa10.lcssa.us, %._crit_edge6.loopexit ]
  %.lcssa11 = phi i32 [ %smax, %._crit_edge6.loopexit29 ], [ %19, %._crit_edge6.loopexit ]
  store i32 %.lcssa11, i32* %7, align 4
  store i32 %.lcssa10.lcssa16.lcssa, i32* %8, align 4
  br label %38

; <label>:38:                                     ; preds = %._crit_edge6, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
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
  %.promoted51 = load i32, i32* %7, align 4
  %wide.trip.count = zext i32 %11 to i64
  %26 = icmp sgt i64 %23, 2
  %smax = select i1 %26, i64 %23, i64 2
  %27 = add nsw i64 %smax, -1
  %28 = icmp sgt i64 %23, 2
  %smax5 = select i1 %28, i64 %23, i64 2
  %29 = add nsw i64 %wide.trip.count, -1
  %30 = icmp sgt i32 %8, 1
  %31 = icmp sgt i32 %9, 1
  %32 = icmp sgt i32 %10, 1
  %min.iters.check21 = icmp ult i64 %29, 2
  %n.vec24 = and i64 %29, -2
  %cmp.zero25 = icmp eq i64 %n.vec24, 0
  %ind.end48 = or i64 %29, 1
  %cmp.n49 = icmp eq i64 %29, %n.vec24
  %33 = icmp sgt i32 %15, 1
  %34 = icmp sgt i32 %16, 1
  %35 = icmp sgt i32 %17, 1
  %min.iters.check = icmp ult i64 %27, 2
  %n.vec = and i64 %27, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %27, 1
  %cmp.n = icmp eq i64 %27, %n.vec
  br label %.preheader11

.preheader11:                                     ; preds = %3, %._crit_edge18
  %36 = phi i32 [ %.promoted51, %3 ], [ %188, %._crit_edge18 ]
  br i1 %30, label %.preheader9.preheader, label %.preheader10

.preheader9.preheader:                            ; preds = %.preheader11
  br label %.preheader9

.preheader10.loopexit:                            ; preds = %._crit_edge13
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader11
  br i1 %33, label %.preheader8.preheader, label %._crit_edge18

.preheader8.preheader:                            ; preds = %.preheader10
  br label %.preheader8

.preheader9:                                      ; preds = %.preheader9.preheader, %._crit_edge13
  %indvar27 = phi i64 [ %indvar.next28, %._crit_edge13 ], [ 0, %.preheader9.preheader ]
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge13 ], [ 1, %.preheader9.preheader ]
  %37 = add i64 %indvar27, 1
  %38 = add i64 %indvar27, 2
  br i1 %31, label %.preheader7.lr.ph, label %._crit_edge13

.preheader7.lr.ph:                                ; preds = %.preheader9
  %39 = add nuw nsw i64 %indvars.iv61, 1
  %40 = add nsw i64 %indvars.iv61, -1
  br i1 %32, label %.preheader7.us.preheader, label %._crit_edge13

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge.us
  %indvar29 = phi i64 [ %indvar.next30, %._crit_edge.us ], [ 0, %.preheader7.us.preheader ]
  %41 = phi i32 [ %109, %._crit_edge.us ], [ 1, %.preheader7.us.preheader ]
  %42 = add i64 %indvar29, 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %37, i64 %42, i64 1
  %scevgep33 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %37, i64 %42, i64 %wide.trip.count
  %scevgep35 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar27, i64 %42, i64 1
  %scevgep37 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %38, i64 %42, i64 %wide.trip.count
  %43 = sext i32 %41 to i64
  %44 = add nuw nsw i32 %41, 1
  %45 = sext i32 %44 to i64
  %46 = add nsw i32 %41, -1
  %47 = sext i32 %46 to i64
  br i1 %min.iters.check21, label %scalar.ph20.preheader, label %min.iters.checked22

min.iters.checked22:                              ; preds = %.preheader7.us
  br i1 %cmp.zero25, label %scalar.ph20.preheader, label %vector.memcheck43

vector.memcheck43:                                ; preds = %min.iters.checked22
  %bound039 = icmp ult double* %scevgep31, %scevgep37
  %bound140 = icmp ult double* %scevgep35, %scevgep33
  %memcheck.conflict42 = and i1 %bound039, %bound140
  br i1 %memcheck.conflict42, label %scalar.ph20.preheader, label %vector.body18.preheader

vector.body18.preheader:                          ; preds = %vector.memcheck43
  br label %vector.body18

vector.body18:                                    ; preds = %vector.body18.preheader, %vector.body18
  %index45 = phi i64 [ %index.next46, %vector.body18 ], [ 0, %vector.body18.preheader ]
  %offset.idx50 = or i64 %index45, 1
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %39, i64 %43, i64 %offset.idx50
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !1
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %43, i64 %offset.idx50
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !1
  %52 = fmul <2 x double> %wide.load55, <double 2.000000e+00, double 2.000000e+00>
  %53 = fsub <2 x double> %wide.load54, %52
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %40, i64 %43, i64 %offset.idx50
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !1
  %56 = fadd <2 x double> %wide.load56, %53
  %57 = fmul <2 x double> %56, <double 1.250000e-01, double 1.250000e-01>
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %45, i64 %offset.idx50
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !1
  %60 = fsub <2 x double> %wide.load57, %52
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %47, i64 %offset.idx50
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !1
  %63 = fadd <2 x double> %60, %wide.load58
  %64 = fmul <2 x double> %63, <double 1.250000e-01, double 1.250000e-01>
  %65 = fadd <2 x double> %57, %64
  %66 = add nuw nsw i64 %offset.idx50, 1
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %43, i64 %66
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !1
  %69 = fsub <2 x double> %wide.load59, %52
  %70 = add nsw i64 %offset.idx50, -1
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %43, i64 %70
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !1
  %73 = fadd <2 x double> %69, %wide.load60
  %74 = fmul <2 x double> %73, <double 1.250000e-01, double 1.250000e-01>
  %75 = fadd <2 x double> %65, %74
  %76 = fadd <2 x double> %wide.load55, %75
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv61, i64 %43, i64 %offset.idx50
  %78 = bitcast double* %77 to <2 x double>*
  store <2 x double> %76, <2 x double>* %78, align 8, !alias.scope !4, !noalias !1
  %index.next46 = add i64 %index45, 2
  %79 = icmp eq i64 %index.next46, %n.vec24
  br i1 %79, label %middle.block19, label %vector.body18, !llvm.loop !6

middle.block19:                                   ; preds = %vector.body18
  br i1 %cmp.n49, label %._crit_edge.us, label %scalar.ph20.preheader

scalar.ph20.preheader:                            ; preds = %middle.block19, %vector.memcheck43, %min.iters.checked22, %.preheader7.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck43 ], [ 1, %min.iters.checked22 ], [ 1, %.preheader7.us ], [ %ind.end48, %middle.block19 ]
  br label %scalar.ph20

scalar.ph20:                                      ; preds = %scalar.ph20.preheader, %scalar.ph20
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph20 ], [ %indvars.iv.ph, %scalar.ph20.preheader ]
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %39, i64 %43, i64 %indvars.iv
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %43, i64 %indvars.iv
  %83 = load double, double* %82, align 8
  %84 = fmul double %83, 2.000000e+00
  %85 = fsub double %81, %84
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %40, i64 %43, i64 %indvars.iv
  %87 = load double, double* %86, align 8
  %88 = fadd double %87, %85
  %89 = fmul double %88, 1.250000e-01
  %90 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %45, i64 %indvars.iv
  %91 = load double, double* %90, align 8
  %92 = fsub double %91, %84
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %47, i64 %indvars.iv
  %94 = load double, double* %93, align 8
  %95 = fadd double %92, %94
  %96 = fmul double %95, 1.250000e-01
  %97 = fadd double %89, %96
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %98 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %43, i64 %indvars.iv.next
  %99 = load double, double* %98, align 8
  %100 = fsub double %99, %84
  %101 = add nsw i64 %indvars.iv, -1
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %43, i64 %101
  %103 = load double, double* %102, align 8
  %104 = fadd double %100, %103
  %105 = fmul double %104, 1.250000e-01
  %106 = fadd double %97, %105
  %107 = fadd double %83, %106
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv61, i64 %43, i64 %indvars.iv
  store double %107, double* %108, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph20, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph20
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block19
  %109 = add nsw i32 %41, 1
  %110 = icmp slt i32 %109, %11
  %indvar.next30 = add i64 %indvar29, 1
  br i1 %110, label %.preheader7.us, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.preheader7.lr.ph, %.preheader9
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %111 = icmp slt i64 %indvars.iv.next62, %14
  %indvar.next28 = add i64 %indvar27, 1
  br i1 %111, label %.preheader9, label %.preheader10.loopexit

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge17
  %indvar = phi i64 [ %indvar.next, %._crit_edge17 ], [ 0, %.preheader8.preheader ]
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge17 ], [ 1, %.preheader8.preheader ]
  %112 = add i64 %indvar, 1
  %113 = add i64 %indvar, 2
  br i1 %34, label %.preheader.lr.ph, label %._crit_edge17

.preheader.lr.ph:                                 ; preds = %.preheader8
  %114 = add nuw nsw i64 %indvars.iv68, 1
  %115 = add nsw i64 %indvars.iv68, -1
  br i1 %35, label %.preheader.us.preheader, label %._crit_edge17

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge16.us
  %indvar2 = phi i64 [ %indvar.next3, %._crit_edge16.us ], [ 0, %.preheader.us.preheader ]
  %116 = phi i32 [ %185, %._crit_edge16.us ], [ 1, %.preheader.us.preheader ]
  %117 = add i64 %indvar2, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %112, i64 %117, i64 1
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %112, i64 %117, i64 %smax5
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvar, i64 %117, i64 1
  %scevgep10 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %113, i64 %117, i64 %smax5
  %118 = sext i32 %116 to i64
  %119 = add nuw nsw i32 %116, 1
  %120 = sext i32 %119 to i64
  %121 = add nsw i32 %116, -1
  %122 = sext i32 %121 to i64
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep10
  %bound1 = icmp ult double* %scevgep8, %scevgep6
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %123 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %114, i64 %118, i64 %offset.idx
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !10
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %118, i64 %offset.idx
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !10
  %127 = fmul <2 x double> %wide.load12, <double 2.000000e+00, double 2.000000e+00>
  %128 = fsub <2 x double> %wide.load, %127
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %115, i64 %118, i64 %offset.idx
  %130 = bitcast double* %129 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %130, align 8, !alias.scope !10
  %131 = fadd <2 x double> %wide.load13, %128
  %132 = fmul <2 x double> %131, <double 1.250000e-01, double 1.250000e-01>
  %133 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %120, i64 %offset.idx
  %134 = bitcast double* %133 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %134, align 8, !alias.scope !10
  %135 = fsub <2 x double> %wide.load14, %127
  %136 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %122, i64 %offset.idx
  %137 = bitcast double* %136 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %137, align 8, !alias.scope !10
  %138 = fadd <2 x double> %135, %wide.load15
  %139 = fmul <2 x double> %138, <double 1.250000e-01, double 1.250000e-01>
  %140 = fadd <2 x double> %132, %139
  %141 = add nuw nsw i64 %offset.idx, 1
  %142 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %118, i64 %141
  %143 = bitcast double* %142 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %143, align 8, !alias.scope !10
  %144 = fsub <2 x double> %wide.load16, %127
  %145 = add nsw i64 %offset.idx, -1
  %146 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %118, i64 %145
  %147 = bitcast double* %146 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %147, align 8, !alias.scope !10
  %148 = fadd <2 x double> %144, %wide.load17
  %149 = fmul <2 x double> %148, <double 1.250000e-01, double 1.250000e-01>
  %150 = fadd <2 x double> %140, %149
  %151 = fadd <2 x double> %wide.load12, %150
  %152 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %indvars.iv68, i64 %118, i64 %offset.idx
  %153 = bitcast double* %152 to <2 x double>*
  store <2 x double> %151, <2 x double>* %153, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %154 = icmp eq i64 %index.next, %n.vec
  br i1 %154, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge16.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv64.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %scalar.ph ], [ %indvars.iv64.ph, %scalar.ph.preheader ]
  %155 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %114, i64 %118, i64 %indvars.iv64
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %118, i64 %indvars.iv64
  %158 = load double, double* %157, align 8
  %159 = fmul double %158, 2.000000e+00
  %160 = fsub double %156, %159
  %161 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %115, i64 %118, i64 %indvars.iv64
  %162 = load double, double* %161, align 8
  %163 = fadd double %162, %160
  %164 = fmul double %163, 1.250000e-01
  %165 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %120, i64 %indvars.iv64
  %166 = load double, double* %165, align 8
  %167 = fsub double %166, %159
  %168 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %122, i64 %indvars.iv64
  %169 = load double, double* %168, align 8
  %170 = fadd double %167, %169
  %171 = fmul double %170, 1.250000e-01
  %172 = fadd double %164, %171
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %173 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %118, i64 %indvars.iv.next65
  %174 = load double, double* %173, align 8
  %175 = fsub double %174, %159
  %176 = add nsw i64 %indvars.iv64, -1
  %177 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %118, i64 %176
  %178 = load double, double* %177, align 8
  %179 = fadd double %175, %178
  %180 = fmul double %179, 1.250000e-01
  %181 = fadd double %172, %180
  %182 = fadd double %158, %181
  %183 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %indvars.iv68, i64 %118, i64 %indvars.iv64
  store double %182, double* %183, align 8
  %184 = icmp slt i64 %indvars.iv.next65, %23
  br i1 %184, label %scalar.ph, label %._crit_edge16.us.loopexit, !llvm.loop !16

._crit_edge16.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge16.us.loopexit, %middle.block
  %185 = add nsw i32 %116, 1
  %186 = icmp slt i32 %185, %24
  %indvar.next3 = add i64 %indvar2, 1
  br i1 %186, label %.preheader.us, label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %._crit_edge16.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %.preheader.lr.ph, %.preheader8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %187 = icmp slt i64 %indvars.iv.next69, %25
  %indvar.next = add i64 %indvar, 1
  br i1 %187, label %.preheader8, label %._crit_edge18.loopexit

._crit_edge18.loopexit:                           ; preds = %._crit_edge17
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %.preheader10
  %188 = add nsw i32 %36, 1
  %189 = icmp slt i32 %188, 501
  br i1 %189, label %.preheader11, label %190

; <label>:190:                                    ; preds = %._crit_edge18
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
  %8 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %7) #5
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  store i32 0, i32* %5, align 4
  %11 = load i32, i32* %3, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %.preheader3.lr.ph, label %43

.preheader3.lr.ph:                                ; preds = %2
  %13 = load i32, i32* %3, align 4
  %wide.trip.count = zext i32 %13 to i64
  %14 = icmp sgt i32 %13, 0
  %15 = load [120 x [120 x double]]*, [120 x [120 x double]]** %4, align 8
  %.promoted = load i32, i32* %5, align 4
  br i1 %14, label %.preheader3.us.preheader, label %._crit_edge6.loopexit29

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %16 = icmp sgt i32 %13, 0
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %17 = phi i32 [ %20, %._crit_edge5.us ], [ %.promoted, %.preheader3.us.preheader ]
  %18 = sext i32 %17 to i64
  br i1 %16, label %.preheader.us.us.preheader, label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %19 = mul nsw i32 %17, %13
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.preheader3.us
  %.lcssa10.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %13, %._crit_edge5.us.loopexit ]
  %20 = add nsw i32 %17, 1
  %21 = icmp slt i32 %20, %13
  br i1 %21, label %.preheader3.us, label %._crit_edge6.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %22 = phi i32 [ %27, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %23 = sext i32 %22 to i64
  %24 = add i32 %19, %22
  %25 = mul i32 %24, %13
  %26 = zext i32 %25 to i64
  br label %29

._crit_edge.us.us:                                ; preds = %36
  %27 = add nsw i32 %22, 1
  %28 = icmp slt i32 %27, %13
  br i1 %28, label %.preheader.us.us, label %._crit_edge5.us.loopexit

; <label>:29:                                     ; preds = %36, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %36 ], [ 0, %.preheader.us.us ]
  %30 = add i64 %26, %indvars.iv
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 20
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %29
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %35) #5
  br label %36

; <label>:36:                                     ; preds = %34, %29
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %15, i64 %18, i64 %23, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %39) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %29

._crit_edge6.loopexit29:                          ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %6, align 4
  %41 = add i32 %.promoted, 1
  %42 = icmp sgt i32 %13, %41
  %smax = select i1 %42, i32 %13, i32 %41
  br label %._crit_edge6

._crit_edge6.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %._crit_edge6.loopexit29
  %.lcssa10.lcssa16.lcssa = phi i32 [ %.promoted14, %._crit_edge6.loopexit29 ], [ %.lcssa10.lcssa.us, %._crit_edge6.loopexit ]
  %.lcssa11 = phi i32 [ %smax, %._crit_edge6.loopexit29 ], [ %20, %._crit_edge6.loopexit ]
  store i32 %.lcssa11, i32* %5, align 4
  store i32 %.lcssa10.lcssa16.lcssa, i32* %6, align 4
  br label %43

; <label>:43:                                     ; preds = %._crit_edge6, %2
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %46) #5
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

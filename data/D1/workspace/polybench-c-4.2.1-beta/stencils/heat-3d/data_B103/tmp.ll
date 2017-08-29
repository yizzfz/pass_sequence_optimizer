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
  br i1 %20, label %21, label %29

; <label>:21:                                     ; preds = %2
  %22 = load i8**, i8*** %4, align 8
  %23 = load i8*, i8** %22, align 8
  %strcmpload = load i8, i8* %23, align 1
  %24 = icmp eq i8 %strcmpload, 0
  br i1 %24, label %25, label %29

; <label>:25:                                     ; preds = %21
  %26 = load i32, i32* %5, align 4
  %27 = bitcast [120 x [120 x [120 x double]]]** %6 to [120 x [120 x double]]**
  %28 = load [120 x [120 x double]]*, [120 x [120 x double]]** %27, align 8
  tail call fastcc void @print_array(i32 %26, [120 x [120 x double]]* %28)
  br label %29

; <label>:29:                                     ; preds = %21, %25, %2
  %30 = bitcast [120 x [120 x [120 x double]]]** %6 to i8**
  %31 = load i8*, i8** %30, align 8
  tail call void @free(i8* %31) #4
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
  br i1 %9, label %.preheader3.lr.ph, label %52

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
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge4.us
  %19 = phi i32 [ %22, %._crit_edge4.us ], [ %.promoted, %.preheader3.us.preheader ]
  %20 = sext i32 %19 to i64
  %21 = sext i32 %19 to i64
  br i1 %16, label %.preheader.us.us.preheader, label %._crit_edge4.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  br label %.preheader.us.us

._crit_edge4.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us.loopexit, %.preheader3.us
  %.lcssa9.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %10, %._crit_edge4.us.loopexit ]
  %22 = add nsw i32 %19, 1
  %23 = icmp slt i32 %22, %10
  br i1 %23, label %.preheader3.us, label %._crit_edge5.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %24 = phi i32 [ %34, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %25 = add i32 %24, %19
  %26 = add i32 %25, %10
  %27 = sext i32 %24 to i64
  %28 = sext i32 %24 to i64
  br i1 %17, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %29 = sitofp i32 %26 to double
  %30 = fmul double %29, 1.000000e+01
  %31 = fdiv double %30, %12
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %20, i64 %27, i64 0
  store double %31, double* %32, align 8
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %21, i64 %28, i64 0
  store double %31, double* %33, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %18, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %34 = add nsw i32 %24, 1
  %35 = icmp slt i32 %34, %10
  br i1 %35, label %.preheader.us.us, label %._crit_edge4.us.loopexit

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %36 = trunc i64 %indvars.iv to i32
  %37 = sub i32 %26, %36
  %38 = sitofp i32 %37 to double
  %39 = fmul double %38, 1.000000e+01
  %40 = fdiv double %39, %12
  %41 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %20, i64 %27, i64 %indvars.iv
  store double %40, double* %41, align 8
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %21, i64 %28, i64 %indvars.iv
  store double %40, double* %42, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %43 = trunc i64 %indvars.iv.next to i32
  %44 = sub i32 %26, %43
  %45 = sitofp i32 %44 to double
  %46 = fmul double %45, 1.000000e+01
  %47 = fdiv double %46, %12
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %20, i64 %27, i64 %indvars.iv.next
  store double %47, double* %48, align 8
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %21, i64 %28, i64 %indvars.iv.next
  store double %47, double* %49, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge5.loopexit27:                          ; preds = %.preheader3.lr.ph
  %.promoted13 = load i32, i32* %8, align 4
  %50 = add i32 %.promoted, 1
  %51 = icmp sgt i32 %10, %50
  %smax = select i1 %51, i32 %10, i32 %50
  br label %._crit_edge5

._crit_edge5.loopexit:                            ; preds = %._crit_edge4.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %._crit_edge5.loopexit27
  %.lcssa9.lcssa15.lcssa = phi i32 [ %.promoted13, %._crit_edge5.loopexit27 ], [ %.lcssa9.lcssa.us, %._crit_edge5.loopexit ]
  %.lcssa10 = phi i32 [ %smax, %._crit_edge5.loopexit27 ], [ %22, %._crit_edge5.loopexit ]
  store i32 %.lcssa10, i32* %7, align 4
  store i32 %.lcssa9.lcssa15.lcssa, i32* %8, align 4
  br label %52

; <label>:52:                                     ; preds = %._crit_edge5, %3
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
  br label %.preheader11

.preheader11:                                     ; preds = %3, %._crit_edge16
  %36 = phi i32 [ %.promoted49, %3 ], [ %236, %._crit_edge16 ]
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
  %37 = add i64 %indvar29, 1
  %38 = add i64 %indvar29, 2
  br i1 %31, label %.preheader7.lr.ph, label %._crit_edge12

.preheader7.lr.ph:                                ; preds = %.preheader9
  %39 = add nuw nsw i64 %indvars.iv59, 1
  %40 = add nsw i64 %indvars.iv59, -1
  br i1 %32, label %.preheader7.us.preheader, label %._crit_edge12

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge.us
  %indvar31 = phi i64 [ %indvar.next32, %._crit_edge.us ], [ 0, %.preheader7.us.preheader ]
  %41 = phi i32 [ %133, %._crit_edge.us ], [ 1, %.preheader7.us.preheader ]
  %42 = add i64 %indvar31, 1
  %scevgep33 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %37, i64 %42, i64 1
  %scevgep35 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %37, i64 %42, i64 %wide.trip.count
  %scevgep37 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar29, i64 %42, i64 1
  %scevgep39 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %38, i64 %42, i64 %wide.trip.count
  %43 = sext i32 %41 to i64
  %44 = sext i32 %41 to i64
  %45 = sext i32 %41 to i64
  %46 = add nuw nsw i32 %41, 1
  %47 = sext i32 %46 to i64
  %48 = sext i32 %41 to i64
  %49 = add nsw i32 %41, -1
  %50 = sext i32 %49 to i64
  %51 = sext i32 %41 to i64
  %52 = sext i32 %41 to i64
  %53 = sext i32 %41 to i64
  %54 = sext i32 %41 to i64
  %55 = sext i32 %41 to i64
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
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %39, i64 %43, i64 %offset.idx52
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !1
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %44, i64 %offset.idx52
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !1
  %60 = fmul <2 x double> %wide.load57, <double 2.000000e+00, double 2.000000e+00>
  %61 = fsub <2 x double> %wide.load56, %60
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %40, i64 %45, i64 %offset.idx52
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !1
  %64 = fadd <2 x double> %61, %wide.load58
  %65 = fmul <2 x double> %64, <double 1.250000e-01, double 1.250000e-01>
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %47, i64 %offset.idx52
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !1
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %48, i64 %offset.idx52
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !1
  %70 = fmul <2 x double> %wide.load60, <double 2.000000e+00, double 2.000000e+00>
  %71 = fsub <2 x double> %wide.load59, %70
  %72 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %50, i64 %offset.idx52
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load61 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !1
  %74 = fadd <2 x double> %71, %wide.load61
  %75 = fmul <2 x double> %74, <double 1.250000e-01, double 1.250000e-01>
  %76 = fadd <2 x double> %65, %75
  %77 = add nuw nsw i64 %offset.idx52, 1
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %51, i64 %77
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load62 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !1
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %52, i64 %offset.idx52
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load63 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !1
  %82 = fmul <2 x double> %wide.load63, <double 2.000000e+00, double 2.000000e+00>
  %83 = fsub <2 x double> %wide.load62, %82
  %84 = add nsw i64 %offset.idx52, -1
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %53, i64 %84
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load64 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !1
  %87 = fadd <2 x double> %83, %wide.load64
  %88 = fmul <2 x double> %87, <double 1.250000e-01, double 1.250000e-01>
  %89 = fadd <2 x double> %76, %88
  %90 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %54, i64 %offset.idx52
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !1
  %92 = fadd <2 x double> %89, %wide.load65
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv59, i64 %55, i64 %offset.idx52
  %94 = bitcast double* %93 to <2 x double>*
  store <2 x double> %92, <2 x double>* %94, align 8, !alias.scope !4, !noalias !1
  %index.next48 = add i64 %index47, 2
  %95 = icmp eq i64 %index.next48, %n.vec26
  br i1 %95, label %middle.block21, label %vector.body20, !llvm.loop !6

middle.block21:                                   ; preds = %vector.body20
  br i1 %cmp.n51, label %._crit_edge.us, label %scalar.ph22.preheader

scalar.ph22.preheader:                            ; preds = %middle.block21, %vector.memcheck45, %min.iters.checked24, %.preheader7.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck45 ], [ 1, %min.iters.checked24 ], [ 1, %.preheader7.us ], [ %ind.end50, %middle.block21 ]
  br label %scalar.ph22

scalar.ph22:                                      ; preds = %scalar.ph22.preheader, %scalar.ph22
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph22 ], [ %indvars.iv.ph, %scalar.ph22.preheader ]
  %96 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %39, i64 %43, i64 %indvars.iv
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %44, i64 %indvars.iv
  %99 = load double, double* %98, align 8
  %100 = fmul double %99, 2.000000e+00
  %101 = fsub double %97, %100
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %40, i64 %45, i64 %indvars.iv
  %103 = load double, double* %102, align 8
  %104 = fadd double %101, %103
  %105 = fmul double %104, 1.250000e-01
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %47, i64 %indvars.iv
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %48, i64 %indvars.iv
  %109 = load double, double* %108, align 8
  %110 = fmul double %109, 2.000000e+00
  %111 = fsub double %107, %110
  %112 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %50, i64 %indvars.iv
  %113 = load double, double* %112, align 8
  %114 = fadd double %111, %113
  %115 = fmul double %114, 1.250000e-01
  %116 = fadd double %105, %115
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %51, i64 %indvars.iv.next
  %118 = load double, double* %117, align 8
  %119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %52, i64 %indvars.iv
  %120 = load double, double* %119, align 8
  %121 = fmul double %120, 2.000000e+00
  %122 = fsub double %118, %121
  %123 = add nsw i64 %indvars.iv, -1
  %124 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %53, i64 %123
  %125 = load double, double* %124, align 8
  %126 = fadd double %122, %125
  %127 = fmul double %126, 1.250000e-01
  %128 = fadd double %116, %127
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %54, i64 %indvars.iv
  %130 = load double, double* %129, align 8
  %131 = fadd double %128, %130
  %132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv59, i64 %55, i64 %indvars.iv
  store double %131, double* %132, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph22, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph22
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block21
  %133 = add nsw i32 %41, 1
  %134 = icmp slt i32 %133, %11
  %indvar.next32 = add i64 %indvar31, 1
  br i1 %134, label %.preheader7.us, label %._crit_edge12.loopexit

._crit_edge12.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.preheader7.lr.ph, %.preheader9
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %135 = icmp slt i64 %indvars.iv.next60, %14
  %indvar.next30 = add i64 %indvar29, 1
  br i1 %135, label %.preheader9, label %.preheader10.loopexit

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge15
  %indvar = phi i64 [ %indvar.next, %._crit_edge15 ], [ 0, %.preheader8.preheader ]
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge15 ], [ 1, %.preheader8.preheader ]
  %136 = add i64 %indvar, 1
  %137 = add i64 %indvar, 2
  br i1 %34, label %.preheader.lr.ph, label %._crit_edge15

.preheader.lr.ph:                                 ; preds = %.preheader8
  %138 = add nuw nsw i64 %indvars.iv66, 1
  %139 = add nsw i64 %indvars.iv66, -1
  br i1 %35, label %.preheader.us.preheader, label %._crit_edge15

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge14.us
  %indvar1 = phi i64 [ %indvar.next2, %._crit_edge14.us ], [ 0, %.preheader.us.preheader ]
  %140 = phi i32 [ %233, %._crit_edge14.us ], [ 1, %.preheader.us.preheader ]
  %141 = add i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %136, i64 %141, i64 1
  %scevgep5 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %136, i64 %141, i64 %smax4
  %scevgep7 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvar, i64 %141, i64 1
  %scevgep9 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %137, i64 %141, i64 %smax4
  %142 = sext i32 %140 to i64
  %143 = sext i32 %140 to i64
  %144 = sext i32 %140 to i64
  %145 = add nuw nsw i32 %140, 1
  %146 = sext i32 %145 to i64
  %147 = sext i32 %140 to i64
  %148 = add nsw i32 %140, -1
  %149 = sext i32 %148 to i64
  %150 = sext i32 %140 to i64
  %151 = sext i32 %140 to i64
  %152 = sext i32 %140 to i64
  %153 = sext i32 %140 to i64
  %154 = sext i32 %140 to i64
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
  %155 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %138, i64 %142, i64 %offset.idx
  %156 = bitcast double* %155 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %156, align 8, !alias.scope !10
  %157 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %143, i64 %offset.idx
  %158 = bitcast double* %157 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %158, align 8, !alias.scope !10
  %159 = fmul <2 x double> %wide.load11, <double 2.000000e+00, double 2.000000e+00>
  %160 = fsub <2 x double> %wide.load, %159
  %161 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %139, i64 %144, i64 %offset.idx
  %162 = bitcast double* %161 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %162, align 8, !alias.scope !10
  %163 = fadd <2 x double> %160, %wide.load12
  %164 = fmul <2 x double> %163, <double 1.250000e-01, double 1.250000e-01>
  %165 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %146, i64 %offset.idx
  %166 = bitcast double* %165 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %166, align 8, !alias.scope !10
  %167 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %147, i64 %offset.idx
  %168 = bitcast double* %167 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %168, align 8, !alias.scope !10
  %169 = fmul <2 x double> %wide.load14, <double 2.000000e+00, double 2.000000e+00>
  %170 = fsub <2 x double> %wide.load13, %169
  %171 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %149, i64 %offset.idx
  %172 = bitcast double* %171 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %172, align 8, !alias.scope !10
  %173 = fadd <2 x double> %170, %wide.load15
  %174 = fmul <2 x double> %173, <double 1.250000e-01, double 1.250000e-01>
  %175 = fadd <2 x double> %164, %174
  %176 = add nuw nsw i64 %offset.idx, 1
  %177 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %150, i64 %176
  %178 = bitcast double* %177 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %178, align 8, !alias.scope !10
  %179 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %151, i64 %offset.idx
  %180 = bitcast double* %179 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %180, align 8, !alias.scope !10
  %181 = fmul <2 x double> %wide.load17, <double 2.000000e+00, double 2.000000e+00>
  %182 = fsub <2 x double> %wide.load16, %181
  %183 = add nsw i64 %offset.idx, -1
  %184 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %152, i64 %183
  %185 = bitcast double* %184 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %185, align 8, !alias.scope !10
  %186 = fadd <2 x double> %182, %wide.load18
  %187 = fmul <2 x double> %186, <double 1.250000e-01, double 1.250000e-01>
  %188 = fadd <2 x double> %175, %187
  %189 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %153, i64 %offset.idx
  %190 = bitcast double* %189 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %190, align 8, !alias.scope !10
  %191 = fadd <2 x double> %188, %wide.load19
  %192 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %indvars.iv66, i64 %154, i64 %offset.idx
  %193 = bitcast double* %192 to <2 x double>*
  store <2 x double> %191, <2 x double>* %193, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %194 = icmp eq i64 %index.next, %n.vec
  br i1 %194, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge14.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv62.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %scalar.ph ], [ %indvars.iv62.ph, %scalar.ph.preheader ]
  %195 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %138, i64 %142, i64 %indvars.iv62
  %196 = load double, double* %195, align 8
  %197 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %143, i64 %indvars.iv62
  %198 = load double, double* %197, align 8
  %199 = fmul double %198, 2.000000e+00
  %200 = fsub double %196, %199
  %201 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %139, i64 %144, i64 %indvars.iv62
  %202 = load double, double* %201, align 8
  %203 = fadd double %200, %202
  %204 = fmul double %203, 1.250000e-01
  %205 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %146, i64 %indvars.iv62
  %206 = load double, double* %205, align 8
  %207 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %147, i64 %indvars.iv62
  %208 = load double, double* %207, align 8
  %209 = fmul double %208, 2.000000e+00
  %210 = fsub double %206, %209
  %211 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %149, i64 %indvars.iv62
  %212 = load double, double* %211, align 8
  %213 = fadd double %210, %212
  %214 = fmul double %213, 1.250000e-01
  %215 = fadd double %204, %214
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %216 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %150, i64 %indvars.iv.next63
  %217 = load double, double* %216, align 8
  %218 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %151, i64 %indvars.iv62
  %219 = load double, double* %218, align 8
  %220 = fmul double %219, 2.000000e+00
  %221 = fsub double %217, %220
  %222 = add nsw i64 %indvars.iv62, -1
  %223 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %152, i64 %222
  %224 = load double, double* %223, align 8
  %225 = fadd double %221, %224
  %226 = fmul double %225, 1.250000e-01
  %227 = fadd double %215, %226
  %228 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv66, i64 %153, i64 %indvars.iv62
  %229 = load double, double* %228, align 8
  %230 = fadd double %227, %229
  %231 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %indvars.iv66, i64 %154, i64 %indvars.iv62
  store double %230, double* %231, align 8
  %232 = icmp slt i64 %indvars.iv.next63, %23
  br i1 %232, label %scalar.ph, label %._crit_edge14.us.loopexit, !llvm.loop !16

._crit_edge14.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.loopexit, %middle.block
  %233 = add nsw i32 %140, 1
  %234 = icmp slt i32 %233, %24
  %indvar.next2 = add i64 %indvar1, 1
  br i1 %234, label %.preheader.us, label %._crit_edge15.loopexit

._crit_edge15.loopexit:                           ; preds = %._crit_edge14.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %.preheader.lr.ph, %.preheader8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %235 = icmp slt i64 %indvars.iv.next67, %25
  %indvar.next = add i64 %indvar, 1
  br i1 %235, label %.preheader8, label %._crit_edge16.loopexit

._crit_edge16.loopexit:                           ; preds = %._crit_edge15
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.preheader10
  %236 = add nsw i32 %36, 1
  %237 = icmp slt i32 %236, 501
  br i1 %237, label %.preheader11, label %238

; <label>:238:                                    ; preds = %._crit_edge16
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
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  br i1 %14, label %.preheader3.us.preheader, label %._crit_edge5.loopexit27

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %16 = icmp sgt i32 %13, 0
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge4.us
  %17 = phi i32 [ %20, %._crit_edge4.us ], [ %.promoted, %.preheader3.us.preheader ]
  %18 = mul nsw i32 %13, %17
  %19 = sext i32 %17 to i64
  br i1 %16, label %.preheader.us.us.preheader, label %._crit_edge4.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  br label %.preheader.us.us

._crit_edge4.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us.loopexit, %.preheader3.us
  %.lcssa9.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %13, %._crit_edge4.us.loopexit ]
  %20 = add nsw i32 %17, 1
  %21 = icmp slt i32 %20, %13
  br i1 %21, label %.preheader3.us, label %._crit_edge5.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %22 = phi i32 [ %27, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %23 = add i32 %18, %22
  %24 = mul i32 %23, %13
  %25 = sext i32 %22 to i64
  %26 = zext i32 %24 to i64
  br label %29

._crit_edge.us.us:                                ; preds = %36
  %27 = add nsw i32 %22, 1
  %28 = icmp slt i32 %27, %13
  br i1 %28, label %.preheader.us.us, label %._crit_edge4.us.loopexit

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
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %15, i64 %19, i64 %25, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %39) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %29

._crit_edge5.loopexit27:                          ; preds = %.preheader3.lr.ph
  %.promoted13 = load i32, i32* %6, align 4
  %41 = add i32 %.promoted, 1
  %42 = icmp sgt i32 %13, %41
  %smax = select i1 %42, i32 %13, i32 %41
  br label %._crit_edge5

._crit_edge5.loopexit:                            ; preds = %._crit_edge4.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %._crit_edge5.loopexit27
  %.lcssa9.lcssa15.lcssa = phi i32 [ %.promoted13, %._crit_edge5.loopexit27 ], [ %.lcssa9.lcssa.us, %._crit_edge5.loopexit ]
  %.lcssa10 = phi i32 [ %smax, %._crit_edge5.loopexit27 ], [ %20, %._crit_edge5.loopexit ]
  store i32 %.lcssa10, i32* %5, align 4
  store i32 %.lcssa9.lcssa15.lcssa, i32* %6, align 4
  br label %43

; <label>:43:                                     ; preds = %._crit_edge5, %2
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %46) #5
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

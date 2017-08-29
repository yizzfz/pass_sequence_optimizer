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
  %12 = bitcast i8* %8 to [120 x [120 x double]]*
  %13 = bitcast i8* %10 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %12, [120 x [120 x double]]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = ptrtoint i8* %8 to i64
  %15 = inttoptr i64 %14 to [120 x [120 x double]]*
  %16 = ptrtoint i8* %10 to i64
  %17 = inttoptr i64 %16 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %15, [120 x [120 x double]]* %17)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %18 = icmp sgt i32 %0, 42
  br i1 %18, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %2
  %20 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %20, align 1
  %21 = icmp eq i8 %strcmpload, 0
  br i1 %21, label %22, label %._crit_edge

; <label>:22:                                     ; preds = %19
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %15)
  br label %._crit_edge

._crit_edge:                                      ; preds = %19, %2, %22
  tail call void @free(i8* %8) #4
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
  br i1 %9, label %.preheader3.lr.ph, label %29

.preheader3.lr.ph:                                ; preds = %3
  %wide.trip.count = zext i32 %0 to i64
  br i1 true, label %.preheader3.us.preheader, label %._crit_edge6.loopexit29

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %10 = sitofp i32 %0 to double
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %11 = phi i32 [ %13, %._crit_edge5.us ], [ 0, %.preheader3.us.preheader ]
  %12 = sext i32 %11 to i64
  br i1 true, label %.preheader.us.us.preheader, label %.preheader3.us.._crit_edge5.us_crit_edge

.preheader3.us.._crit_edge5.us_crit_edge:         ; preds = %.preheader3.us
  br label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %.preheader3.us.._crit_edge5.us_crit_edge, %._crit_edge5.us.loopexit
  %13 = add nsw i32 %11, 1
  %14 = icmp slt i32 %13, %0
  br i1 %14, label %.preheader3.us, label %._crit_edge6.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %15 = phi i32 [ %17, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %16 = sext i32 %15 to i64
  br label %19

._crit_edge.us.us:                                ; preds = %19
  %17 = add nsw i32 %15, 1
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %.preheader.us.us, label %._crit_edge5.us.loopexit

; <label>:19:                                     ; preds = %19, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %19 ], [ 0, %.preheader.us.us ]
  %20 = trunc i64 %indvars.iv to i32
  %21 = sub i32 %0, %20
  %22 = add i32 %21, %11
  %23 = add i32 %22, %15
  %24 = sitofp i32 %23 to double
  %25 = fmul double %24, 1.000000e+01
  %26 = fdiv double %25, %10
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %12, i64 %16, i64 %indvars.iv
  store double %26, double* %27, align 8
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %12, i64 %16, i64 %indvars.iv
  store double %26, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %19

._crit_edge6.loopexit29:                          ; preds = %.preheader3.lr.ph
  br label %._crit_edge6

._crit_edge6.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %._crit_edge6.loopexit29
  %.lcssa11 = phi i32 [ undef, %._crit_edge6.loopexit29 ], [ %13, %._crit_edge6.loopexit ]
  store i32 %.lcssa11, i32* %7, align 4
  store i32 %0, i32* %8, align 4
  br label %29

; <label>:29:                                     ; preds = %._crit_edge6, %3
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
  %9 = sext i32 %0 to i64
  %10 = add nsw i64 %9, -1
  %wide.trip.count = zext i32 %8 to i64
  %11 = icmp sgt i64 %10, 2
  %smax = select i1 %11, i64 %10, i64 2
  %12 = add nsw i64 %smax, -1
  %13 = add nsw i64 %wide.trip.count, -1
  %14 = icmp sgt i32 %8, 1
  %min.iters.check = icmp ult i64 %12, 2
  %n.vec = and i64 %12, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %12, 1
  %cmp.n = icmp eq i64 %12, %n.vec
  %min.iters.check21 = icmp ult i64 %13, 2
  %n.vec24 = and i64 %13, -2
  %cmp.zero25 = icmp eq i64 %n.vec24, 0
  %ind.end48 = or i64 %13, 1
  %cmp.n49 = icmp eq i64 %13, %n.vec24
  br label %.preheader11

.preheader11:                                     ; preds = %3, %._crit_edge18
  %15 = phi i32 [ 1, %3 ], [ %165, %._crit_edge18 ]
  br i1 %14, label %.preheader9.preheader, label %.preheader10

.preheader9.preheader:                            ; preds = %.preheader11
  br label %.preheader9

.preheader10.loopexit:                            ; preds = %._crit_edge13
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader11
  br i1 %14, label %.preheader8.preheader, label %._crit_edge18

.preheader8.preheader:                            ; preds = %.preheader10
  br label %.preheader8

.preheader9:                                      ; preds = %.preheader9.preheader, %._crit_edge13
  %indvar27 = phi i64 [ %16, %._crit_edge13 ], [ 0, %.preheader9.preheader ]
  %indvars.iv61 = phi i64 [ %indvars.iv.next62.pre-phi, %._crit_edge13 ], [ 1, %.preheader9.preheader ]
  %16 = add i64 %indvar27, 1
  %17 = add i64 %indvar27, 2
  br i1 true, label %.preheader7.lr.ph, label %.preheader9.._crit_edge13_crit_edge

.preheader9.._crit_edge13_crit_edge:              ; preds = %.preheader9
  %.pre = add nuw nsw i64 %indvars.iv61, 1
  br label %._crit_edge13

.preheader7.lr.ph:                                ; preds = %.preheader9
  %18 = add nuw nsw i64 %indvars.iv61, 1
  %19 = add nsw i64 %indvars.iv61, -1
  br i1 true, label %.preheader7.us.preheader, label %.preheader7.lr.ph.._crit_edge13_crit_edge

.preheader7.lr.ph.._crit_edge13_crit_edge:        ; preds = %.preheader7.lr.ph
  br label %._crit_edge13

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge.us
  %indvar29 = phi i64 [ %21, %._crit_edge.us ], [ 0, %.preheader7.us.preheader ]
  %20 = phi i32 [ %23, %._crit_edge.us ], [ 1, %.preheader7.us.preheader ]
  %21 = add i64 %indvar29, 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %16, i64 %21, i64 1
  %scevgep33 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %16, i64 %21, i64 %wide.trip.count
  %scevgep35 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar27, i64 %21, i64 1
  %scevgep37 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %17, i64 %21, i64 %wide.trip.count
  %22 = sext i32 %20 to i64
  %23 = add nsw i32 %20, 1
  %24 = sext i32 %23 to i64
  %25 = add nsw i32 %20, -1
  %26 = sext i32 %25 to i64
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
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %18, i64 %22, i64 %offset.idx50
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %22, i64 %offset.idx50
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fmul <2 x double> %wide.load55, <double 2.000000e+00, double 2.000000e+00>
  %32 = fsub <2 x double> %wide.load54, %31
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %19, i64 %22, i64 %offset.idx50
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %wide.load56, %32
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %24, i64 %offset.idx50
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !1
  %39 = fsub <2 x double> %wide.load57, %31
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %26, i64 %offset.idx50
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !1
  %42 = fadd <2 x double> %39, %wide.load58
  %43 = fmul <2 x double> %42, <double 1.250000e-01, double 1.250000e-01>
  %44 = fadd <2 x double> %36, %43
  %45 = add nuw nsw i64 %offset.idx50, 1
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %22, i64 %45
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !1
  %48 = fsub <2 x double> %wide.load59, %31
  %49 = add nsw i64 %offset.idx50, -1
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %22, i64 %49
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !1
  %52 = fadd <2 x double> %48, %wide.load60
  %53 = fmul <2 x double> %52, <double 1.250000e-01, double 1.250000e-01>
  %54 = fadd <2 x double> %44, %53
  %55 = fadd <2 x double> %wide.load55, %54
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv61, i64 %22, i64 %offset.idx50
  %57 = bitcast double* %56 to <2 x double>*
  store <2 x double> %55, <2 x double>* %57, align 8, !alias.scope !4, !noalias !1
  %index.next46 = add i64 %index45, 2
  %58 = icmp eq i64 %index.next46, %n.vec24
  br i1 %58, label %middle.block19, label %vector.body18, !llvm.loop !6

middle.block19:                                   ; preds = %vector.body18
  br i1 %cmp.n49, label %._crit_edge.us, label %scalar.ph20.preheader

scalar.ph20.preheader:                            ; preds = %middle.block19, %vector.memcheck43, %min.iters.checked22, %.preheader7.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck43 ], [ 1, %min.iters.checked22 ], [ 1, %.preheader7.us ], [ %ind.end48, %middle.block19 ]
  br label %scalar.ph20

scalar.ph20:                                      ; preds = %scalar.ph20.preheader, %scalar.ph20
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph20 ], [ %indvars.iv.ph, %scalar.ph20.preheader ]
  %59 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %18, i64 %22, i64 %indvars.iv
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %22, i64 %indvars.iv
  %62 = load double, double* %61, align 8
  %63 = fmul double %62, 2.000000e+00
  %64 = fsub double %60, %63
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %19, i64 %22, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = fadd double %66, %64
  %68 = fmul double %67, 1.250000e-01
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %24, i64 %indvars.iv
  %70 = load double, double* %69, align 8
  %71 = fsub double %70, %63
  %72 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %26, i64 %indvars.iv
  %73 = load double, double* %72, align 8
  %74 = fadd double %71, %73
  %75 = fmul double %74, 1.250000e-01
  %76 = fadd double %68, %75
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %22, i64 %indvars.iv.next
  %78 = load double, double* %77, align 8
  %79 = fsub double %78, %63
  %80 = add nsw i64 %indvars.iv, -1
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %22, i64 %80
  %82 = load double, double* %81, align 8
  %83 = fadd double %79, %82
  %84 = fmul double %83, 1.250000e-01
  %85 = fadd double %76, %84
  %86 = fadd double %62, %85
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv61, i64 %22, i64 %indvars.iv
  store double %86, double* %87, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph20, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph20
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block19
  %88 = icmp slt i32 %23, %8
  br i1 %88, label %.preheader7.us, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.preheader7.lr.ph.._crit_edge13_crit_edge, %.preheader9.._crit_edge13_crit_edge, %._crit_edge13.loopexit
  %indvars.iv.next62.pre-phi = phi i64 [ %18, %.preheader7.lr.ph.._crit_edge13_crit_edge ], [ %.pre, %.preheader9.._crit_edge13_crit_edge ], [ %18, %._crit_edge13.loopexit ]
  %89 = icmp slt i64 %indvars.iv.next62.pre-phi, %10
  br i1 %89, label %.preheader9, label %.preheader10.loopexit

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge17
  %indvar = phi i64 [ %90, %._crit_edge17 ], [ 0, %.preheader8.preheader ]
  %indvars.iv68 = phi i64 [ %indvars.iv.next69.pre-phi, %._crit_edge17 ], [ 1, %.preheader8.preheader ]
  %90 = add i64 %indvar, 1
  %91 = add i64 %indvar, 2
  br i1 true, label %.preheader.lr.ph, label %.preheader8.._crit_edge17_crit_edge

.preheader8.._crit_edge17_crit_edge:              ; preds = %.preheader8
  %.pre61 = add nuw nsw i64 %indvars.iv68, 1
  br label %._crit_edge17

.preheader.lr.ph:                                 ; preds = %.preheader8
  %92 = add nuw nsw i64 %indvars.iv68, 1
  %93 = add nsw i64 %indvars.iv68, -1
  br i1 true, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge17_crit_edge

.preheader.lr.ph.._crit_edge17_crit_edge:         ; preds = %.preheader.lr.ph
  br label %._crit_edge17

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge16.us
  %indvar2 = phi i64 [ %95, %._crit_edge16.us ], [ 0, %.preheader.us.preheader ]
  %94 = phi i32 [ %97, %._crit_edge16.us ], [ 1, %.preheader.us.preheader ]
  %95 = add i64 %indvar2, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %90, i64 %95, i64 1
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %90, i64 %95, i64 %smax
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar, i64 %95, i64 1
  %scevgep10 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %91, i64 %95, i64 %smax
  %96 = sext i32 %94 to i64
  %97 = add nsw i32 %94, 1
  %98 = sext i32 %97 to i64
  %99 = add nsw i32 %94, -1
  %100 = sext i32 %99 to i64
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
  %101 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %92, i64 %96, i64 %offset.idx
  %102 = bitcast double* %101 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %102, align 8, !alias.scope !10
  %103 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv68, i64 %96, i64 %offset.idx
  %104 = bitcast double* %103 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %104, align 8, !alias.scope !10
  %105 = fmul <2 x double> %wide.load12, <double 2.000000e+00, double 2.000000e+00>
  %106 = fsub <2 x double> %wide.load, %105
  %107 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %93, i64 %96, i64 %offset.idx
  %108 = bitcast double* %107 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %108, align 8, !alias.scope !10
  %109 = fadd <2 x double> %wide.load13, %106
  %110 = fmul <2 x double> %109, <double 1.250000e-01, double 1.250000e-01>
  %111 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv68, i64 %98, i64 %offset.idx
  %112 = bitcast double* %111 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %112, align 8, !alias.scope !10
  %113 = fsub <2 x double> %wide.load14, %105
  %114 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv68, i64 %100, i64 %offset.idx
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !10
  %116 = fadd <2 x double> %113, %wide.load15
  %117 = fmul <2 x double> %116, <double 1.250000e-01, double 1.250000e-01>
  %118 = fadd <2 x double> %110, %117
  %119 = add nuw nsw i64 %offset.idx, 1
  %120 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv68, i64 %96, i64 %119
  %121 = bitcast double* %120 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %121, align 8, !alias.scope !10
  %122 = fsub <2 x double> %wide.load16, %105
  %123 = add nsw i64 %offset.idx, -1
  %124 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv68, i64 %96, i64 %123
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !10
  %126 = fadd <2 x double> %122, %wide.load17
  %127 = fmul <2 x double> %126, <double 1.250000e-01, double 1.250000e-01>
  %128 = fadd <2 x double> %118, %127
  %129 = fadd <2 x double> %wide.load12, %128
  %130 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv68, i64 %96, i64 %offset.idx
  %131 = bitcast double* %130 to <2 x double>*
  store <2 x double> %129, <2 x double>* %131, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %132 = icmp eq i64 %index.next, %n.vec
  br i1 %132, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge16.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv64.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %scalar.ph ], [ %indvars.iv64.ph, %scalar.ph.preheader ]
  %133 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %92, i64 %96, i64 %indvars.iv64
  %134 = load double, double* %133, align 8
  %135 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv68, i64 %96, i64 %indvars.iv64
  %136 = load double, double* %135, align 8
  %137 = fmul double %136, 2.000000e+00
  %138 = fsub double %134, %137
  %139 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %93, i64 %96, i64 %indvars.iv64
  %140 = load double, double* %139, align 8
  %141 = fadd double %140, %138
  %142 = fmul double %141, 1.250000e-01
  %143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv68, i64 %98, i64 %indvars.iv64
  %144 = load double, double* %143, align 8
  %145 = fsub double %144, %137
  %146 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv68, i64 %100, i64 %indvars.iv64
  %147 = load double, double* %146, align 8
  %148 = fadd double %145, %147
  %149 = fmul double %148, 1.250000e-01
  %150 = fadd double %142, %149
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %151 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv68, i64 %96, i64 %indvars.iv.next65
  %152 = load double, double* %151, align 8
  %153 = fsub double %152, %137
  %154 = add nsw i64 %indvars.iv64, -1
  %155 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv68, i64 %96, i64 %154
  %156 = load double, double* %155, align 8
  %157 = fadd double %153, %156
  %158 = fmul double %157, 1.250000e-01
  %159 = fadd double %150, %158
  %160 = fadd double %136, %159
  %161 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv68, i64 %96, i64 %indvars.iv64
  store double %160, double* %161, align 8
  %162 = icmp slt i64 %indvars.iv.next65, %10
  br i1 %162, label %scalar.ph, label %._crit_edge16.us.loopexit, !llvm.loop !16

._crit_edge16.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge16.us.loopexit, %middle.block
  %163 = icmp slt i32 %97, %8
  br i1 %163, label %.preheader.us, label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %._crit_edge16.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %.preheader.lr.ph.._crit_edge17_crit_edge, %.preheader8.._crit_edge17_crit_edge, %._crit_edge17.loopexit
  %indvars.iv.next69.pre-phi = phi i64 [ %92, %.preheader.lr.ph.._crit_edge17_crit_edge ], [ %.pre61, %.preheader8.._crit_edge17_crit_edge ], [ %92, %._crit_edge17.loopexit ]
  %164 = icmp slt i64 %indvars.iv.next69.pre-phi, %10
  br i1 %164, label %.preheader8, label %._crit_edge18.loopexit

._crit_edge18.loopexit:                           ; preds = %._crit_edge17
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %.preheader10
  %165 = add nsw i32 %15, 1
  %166 = icmp slt i32 %165, 501
  br i1 %166, label %.preheader11, label %167

; <label>:167:                                    ; preds = %._crit_edge18
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
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.preheader3.lr.ph, label %36

.preheader3.lr.ph:                                ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br i1 true, label %.preheader3.us.preheader, label %._crit_edge6.loopexit29

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %12 = phi i32 [ %15, %._crit_edge5.us ], [ 0, %.preheader3.us.preheader ]
  %13 = sext i32 %12 to i64
  br i1 true, label %.preheader.us.us.preheader, label %.preheader3.us.._crit_edge5.us_crit_edge

.preheader3.us.._crit_edge5.us_crit_edge:         ; preds = %.preheader3.us
  br label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %14 = mul nsw i32 %12, %0
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %.preheader3.us.._crit_edge5.us_crit_edge, %._crit_edge5.us.loopexit
  %15 = add nsw i32 %12, 1
  %16 = icmp slt i32 %15, %0
  br i1 %16, label %.preheader3.us, label %._crit_edge6.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %17 = phi i32 [ %22, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %18 = sext i32 %17 to i64
  %19 = add i32 %14, %17
  %20 = mul i32 %19, %0
  %21 = zext i32 %20 to i64
  br label %24

._crit_edge.us.us:                                ; preds = %31
  %22 = add nsw i32 %17, 1
  %23 = icmp slt i32 %22, %0
  br i1 %23, label %.preheader.us.us, label %._crit_edge5.us.loopexit

; <label>:24:                                     ; preds = %31, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %31 ], [ 0, %.preheader.us.us ]
  %25 = add i64 %21, %indvars.iv
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %24
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #5
  br label %31

; <label>:31:                                     ; preds = %29, %24
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %13, i64 %18, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %34) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %24

._crit_edge6.loopexit29:                          ; preds = %.preheader3.lr.ph
  br label %._crit_edge6

._crit_edge6.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %._crit_edge6.loopexit29
  %.lcssa11 = phi i32 [ undef, %._crit_edge6.loopexit29 ], [ %15, %._crit_edge6.loopexit ]
  store i32 %.lcssa11, i32* %5, align 4
  store i32 %0, i32* %6, align 4
  br label %36

; <label>:36:                                     ; preds = %._crit_edge6, %2
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %39) #5
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

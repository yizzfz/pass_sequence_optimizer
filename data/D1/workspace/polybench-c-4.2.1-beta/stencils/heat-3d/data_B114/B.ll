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
  br i1 %20, label %21, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:21:                                     ; preds = %2
  %22 = load i8**, i8*** %4, align 8
  %23 = load i8*, i8** %22, align 8
  %strcmpload = load i8, i8* %23, align 1
  %24 = icmp eq i8 %strcmpload, 0
  br i1 %24, label %25, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %21
  br label %._crit_edge

; <label>:25:                                     ; preds = %21
  %26 = load i32, i32* %5, align 4
  %27 = bitcast [120 x [120 x [120 x double]]]** %6 to [120 x [120 x double]]**
  %28 = load [120 x [120 x double]]*, [120 x [120 x double]]** %27, align 8
  tail call fastcc void @print_array(i32 %26, [120 x [120 x double]]* %28)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %25
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
  br i1 %9, label %.preheader3.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %3
  br label %38

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

.preheader3.us:                                   ; preds = %._crit_edge5.us..preheader3.us_crit_edge, %.preheader3.us.preheader
  %16 = phi i32 [ %19, %._crit_edge5.us..preheader3.us_crit_edge ], [ %.promoted, %.preheader3.us.preheader ]
  %17 = sext i32 %16 to i64
  %18 = sext i32 %16 to i64
  br i1 %15, label %.preheader.us.us.preheader, label %.preheader3.us.._crit_edge5.us_crit_edge

.preheader3.us.._crit_edge5.us_crit_edge:         ; preds = %.preheader3.us
  br label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %.preheader3.us.._crit_edge5.us_crit_edge, %._crit_edge5.us.loopexit
  %.lcssa10.lcssa.us = phi i32 [ 0, %.preheader3.us.._crit_edge5.us_crit_edge ], [ %10, %._crit_edge5.us.loopexit ]
  %19 = add nsw i32 %16, 1
  %20 = icmp slt i32 %19, %10
  br i1 %20, label %._crit_edge5.us..preheader3.us_crit_edge, label %._crit_edge6.loopexit

._crit_edge5.us..preheader3.us_crit_edge:         ; preds = %._crit_edge5.us
  br label %.preheader3.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us..preheader.us.us_crit_edge, %.preheader.us.us.preheader
  %21 = phi i32 [ %24, %._crit_edge.us.us..preheader.us.us_crit_edge ], [ 0, %.preheader.us.us.preheader ]
  %22 = sext i32 %21 to i64
  %23 = sext i32 %21 to i64
  br label %26

._crit_edge.us.us:                                ; preds = %26
  %24 = add nsw i32 %21, 1
  %25 = icmp slt i32 %24, %10
  br i1 %25, label %._crit_edge.us.us..preheader.us.us_crit_edge, label %._crit_edge5.us.loopexit

._crit_edge.us.us..preheader.us.us_crit_edge:     ; preds = %._crit_edge.us.us
  br label %.preheader.us.us

; <label>:26:                                     ; preds = %._crit_edge33, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge33 ], [ 0, %.preheader.us.us ]
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
  br i1 %exitcond, label %._crit_edge.us.us, label %._crit_edge33

._crit_edge33:                                    ; preds = %26
  br label %26

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

; <label>:38:                                     ; preds = %._crit_edge, %._crit_edge6
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
  %smax4 = select i1 %28, i64 %23, i64 2
  %29 = add nsw i64 %wide.trip.count, -1
  %30 = icmp sgt i32 %8, 1
  %31 = icmp sgt i32 %15, 1
  %32 = icmp sgt i32 %16, 1
  %33 = icmp sgt i32 %17, 1
  %min.iters.check = icmp ult i64 %27, 2
  %n.vec = and i64 %27, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %27, 1
  %cmp.n = icmp eq i64 %27, %n.vec
  %34 = icmp sgt i32 %9, 1
  %35 = icmp sgt i32 %10, 1
  %min.iters.check20 = icmp ult i64 %29, 2
  %n.vec23 = and i64 %29, -2
  %cmp.zero24 = icmp eq i64 %n.vec23, 0
  %ind.end47 = or i64 %29, 1
  %cmp.n48 = icmp eq i64 %29, %n.vec23
  br label %.preheader11

.preheader11:                                     ; preds = %._crit_edge18..preheader11_crit_edge, %3
  %36 = phi i32 [ %.promoted51, %3 ], [ %188, %._crit_edge18..preheader11_crit_edge ]
  br i1 %30, label %.preheader9.preheader, label %.preheader11..preheader10_crit_edge

.preheader11..preheader10_crit_edge:              ; preds = %.preheader11
  br label %.preheader10

.preheader9.preheader:                            ; preds = %.preheader11
  br label %.preheader9

.preheader10.loopexit:                            ; preds = %._crit_edge13
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader11..preheader10_crit_edge, %.preheader10.loopexit
  br i1 %31, label %.preheader8.preheader, label %.preheader10.._crit_edge18_crit_edge

.preheader10.._crit_edge18_crit_edge:             ; preds = %.preheader10
  br label %._crit_edge18

.preheader8.preheader:                            ; preds = %.preheader10
  br label %.preheader8

.preheader9:                                      ; preds = %._crit_edge13..preheader9_crit_edge, %.preheader9.preheader
  %indvar26 = phi i64 [ %indvar.next27, %._crit_edge13..preheader9_crit_edge ], [ 0, %.preheader9.preheader ]
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge13..preheader9_crit_edge ], [ 1, %.preheader9.preheader ]
  %37 = add i64 %indvar26, 1
  %38 = add i64 %indvar26, 2
  br i1 %34, label %.preheader7.lr.ph, label %.preheader9.._crit_edge13_crit_edge

.preheader9.._crit_edge13_crit_edge:              ; preds = %.preheader9
  br label %._crit_edge13

.preheader7.lr.ph:                                ; preds = %.preheader9
  %39 = add nuw nsw i64 %indvars.iv61, 1
  %40 = add nsw i64 %indvars.iv61, -1
  br i1 %35, label %.preheader7.us.preheader, label %.preheader7.lr.ph.._crit_edge13_crit_edge

.preheader7.lr.ph.._crit_edge13_crit_edge:        ; preds = %.preheader7.lr.ph
  br label %._crit_edge13

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge.us..preheader7.us_crit_edge, %.preheader7.us.preheader
  %indvar28 = phi i64 [ %indvar.next29, %._crit_edge.us..preheader7.us_crit_edge ], [ 0, %.preheader7.us.preheader ]
  %41 = phi i32 [ %109, %._crit_edge.us..preheader7.us_crit_edge ], [ 1, %.preheader7.us.preheader ]
  %42 = add i64 %indvar28, 1
  %scevgep30 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %37, i64 %42, i64 1
  %scevgep32 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %37, i64 %42, i64 %wide.trip.count
  %scevgep34 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar26, i64 %42, i64 1
  %scevgep36 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %38, i64 %42, i64 %wide.trip.count
  %43 = sext i32 %41 to i64
  %44 = sext i32 %41 to i64
  %45 = sext i32 %41 to i64
  %46 = add nsw i64 %44, 1
  %47 = add nsw i64 %43, -1
  br i1 %min.iters.check20, label %.preheader7.us.scalar.ph19.preheader_crit_edge, label %min.iters.checked21

.preheader7.us.scalar.ph19.preheader_crit_edge:   ; preds = %.preheader7.us
  br label %scalar.ph19.preheader

min.iters.checked21:                              ; preds = %.preheader7.us
  br i1 %cmp.zero24, label %min.iters.checked21.scalar.ph19.preheader_crit_edge, label %vector.memcheck42

min.iters.checked21.scalar.ph19.preheader_crit_edge: ; preds = %min.iters.checked21
  br label %scalar.ph19.preheader

vector.memcheck42:                                ; preds = %min.iters.checked21
  %bound038 = icmp ult double* %scevgep30, %scevgep36
  %bound139 = icmp ult double* %scevgep34, %scevgep32
  %memcheck.conflict41 = and i1 %bound038, %bound139
  br i1 %memcheck.conflict41, label %vector.memcheck42.scalar.ph19.preheader_crit_edge, label %vector.body17.preheader

vector.memcheck42.scalar.ph19.preheader_crit_edge: ; preds = %vector.memcheck42
  br label %scalar.ph19.preheader

vector.body17.preheader:                          ; preds = %vector.memcheck42
  br label %vector.body17

vector.body17:                                    ; preds = %vector.body17.vector.body17_crit_edge, %vector.body17.preheader
  %index44 = phi i64 [ %index.next45, %vector.body17.vector.body17_crit_edge ], [ 0, %vector.body17.preheader ]
  %offset.idx49 = or i64 %index44, 1
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %39, i64 %45, i64 %offset.idx49
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !1
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %45, i64 %offset.idx49
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !1
  %52 = fmul <2 x double> %wide.load54, <double 2.000000e+00, double 2.000000e+00>
  %53 = fsub <2 x double> %wide.load53, %52
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %40, i64 %45, i64 %offset.idx49
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !1
  %56 = fadd <2 x double> %wide.load55, %53
  %57 = fmul <2 x double> %56, <double 1.250000e-01, double 1.250000e-01>
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %46, i64 %offset.idx49
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !1
  %60 = fsub <2 x double> %wide.load56, %52
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %47, i64 %offset.idx49
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !1
  %63 = fadd <2 x double> %60, %wide.load57
  %64 = fmul <2 x double> %63, <double 1.250000e-01, double 1.250000e-01>
  %65 = fadd <2 x double> %57, %64
  %66 = add nuw nsw i64 %offset.idx49, 1
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %45, i64 %66
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !1
  %69 = fsub <2 x double> %wide.load58, %52
  %70 = add nsw i64 %offset.idx49, -1
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %45, i64 %70
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !1
  %73 = fadd <2 x double> %69, %wide.load59
  %74 = fmul <2 x double> %73, <double 1.250000e-01, double 1.250000e-01>
  %75 = fadd <2 x double> %65, %74
  %76 = fadd <2 x double> %wide.load54, %75
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv61, i64 %45, i64 %offset.idx49
  %78 = bitcast double* %77 to <2 x double>*
  store <2 x double> %76, <2 x double>* %78, align 8, !alias.scope !4, !noalias !1
  %index.next45 = add i64 %index44, 2
  %79 = icmp eq i64 %index.next45, %n.vec23
  br i1 %79, label %middle.block18, label %vector.body17.vector.body17_crit_edge, !llvm.loop !6

vector.body17.vector.body17_crit_edge:            ; preds = %vector.body17
  br label %vector.body17

middle.block18:                                   ; preds = %vector.body17
  br i1 %cmp.n48, label %middle.block18.._crit_edge.us_crit_edge, label %middle.block18.scalar.ph19.preheader_crit_edge

middle.block18.scalar.ph19.preheader_crit_edge:   ; preds = %middle.block18
  br label %scalar.ph19.preheader

middle.block18.._crit_edge.us_crit_edge:          ; preds = %middle.block18
  br label %._crit_edge.us

scalar.ph19.preheader:                            ; preds = %middle.block18.scalar.ph19.preheader_crit_edge, %vector.memcheck42.scalar.ph19.preheader_crit_edge, %min.iters.checked21.scalar.ph19.preheader_crit_edge, %.preheader7.us.scalar.ph19.preheader_crit_edge
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck42.scalar.ph19.preheader_crit_edge ], [ 1, %min.iters.checked21.scalar.ph19.preheader_crit_edge ], [ 1, %.preheader7.us.scalar.ph19.preheader_crit_edge ], [ %ind.end47, %middle.block18.scalar.ph19.preheader_crit_edge ]
  br label %scalar.ph19

scalar.ph19:                                      ; preds = %scalar.ph19.scalar.ph19_crit_edge, %scalar.ph19.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph19.scalar.ph19_crit_edge ], [ %indvars.iv.ph, %scalar.ph19.preheader ]
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %39, i64 %45, i64 %indvars.iv
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %45, i64 %indvars.iv
  %83 = load double, double* %82, align 8
  %84 = fmul double %83, 2.000000e+00
  %85 = fsub double %81, %84
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %40, i64 %45, i64 %indvars.iv
  %87 = load double, double* %86, align 8
  %88 = fadd double %87, %85
  %89 = fmul double %88, 1.250000e-01
  %90 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %46, i64 %indvars.iv
  %91 = load double, double* %90, align 8
  %92 = fsub double %91, %84
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %47, i64 %indvars.iv
  %94 = load double, double* %93, align 8
  %95 = fadd double %92, %94
  %96 = fmul double %95, 1.250000e-01
  %97 = fadd double %89, %96
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %98 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %45, i64 %indvars.iv.next
  %99 = load double, double* %98, align 8
  %100 = fsub double %99, %84
  %101 = add nsw i64 %indvars.iv, -1
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %45, i64 %101
  %103 = load double, double* %102, align 8
  %104 = fadd double %100, %103
  %105 = fmul double %104, 1.250000e-01
  %106 = fadd double %97, %105
  %107 = fadd double %83, %106
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv61, i64 %45, i64 %indvars.iv
  store double %107, double* %108, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph19.scalar.ph19_crit_edge, !llvm.loop !9

scalar.ph19.scalar.ph19_crit_edge:                ; preds = %scalar.ph19
  br label %scalar.ph19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph19
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %middle.block18.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %109 = add nsw i32 %41, 1
  %110 = icmp slt i32 %109, %11
  br i1 %110, label %._crit_edge.us..preheader7.us_crit_edge, label %._crit_edge13.loopexit

._crit_edge.us..preheader7.us_crit_edge:          ; preds = %._crit_edge.us
  %indvar.next29 = add i64 %indvar28, 1
  br label %.preheader7.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.preheader7.lr.ph.._crit_edge13_crit_edge, %.preheader9.._crit_edge13_crit_edge, %._crit_edge13.loopexit
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %111 = icmp slt i64 %indvars.iv.next62, %14
  br i1 %111, label %._crit_edge13..preheader9_crit_edge, label %.preheader10.loopexit

._crit_edge13..preheader9_crit_edge:              ; preds = %._crit_edge13
  %indvar.next27 = add i64 %indvar26, 1
  br label %.preheader9

.preheader8:                                      ; preds = %._crit_edge17..preheader8_crit_edge, %.preheader8.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge17..preheader8_crit_edge ], [ 0, %.preheader8.preheader ]
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge17..preheader8_crit_edge ], [ 1, %.preheader8.preheader ]
  %112 = add i64 %indvar, 1
  %113 = add i64 %indvar, 2
  br i1 %32, label %.preheader.lr.ph, label %.preheader8.._crit_edge17_crit_edge

.preheader8.._crit_edge17_crit_edge:              ; preds = %.preheader8
  br label %._crit_edge17

.preheader.lr.ph:                                 ; preds = %.preheader8
  %114 = add nuw nsw i64 %indvars.iv68, 1
  %115 = add nsw i64 %indvars.iv68, -1
  br i1 %33, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge17_crit_edge

.preheader.lr.ph.._crit_edge17_crit_edge:         ; preds = %.preheader.lr.ph
  br label %._crit_edge17

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge16.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvar1 = phi i64 [ %indvar.next2, %._crit_edge16.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %116 = phi i32 [ %185, %._crit_edge16.us..preheader.us_crit_edge ], [ 1, %.preheader.us.preheader ]
  %117 = add i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %112, i64 %117, i64 1
  %scevgep5 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %112, i64 %117, i64 %smax4
  %scevgep7 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvar, i64 %117, i64 1
  %scevgep9 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %113, i64 %117, i64 %smax4
  %118 = sext i32 %116 to i64
  %119 = sext i32 %116 to i64
  %120 = sext i32 %116 to i64
  %121 = add nsw i64 %119, 1
  %122 = add nsw i64 %118, -1
  br i1 %min.iters.check, label %.preheader.us.scalar.ph.preheader_crit_edge, label %min.iters.checked

.preheader.us.scalar.ph.preheader_crit_edge:      ; preds = %.preheader.us
  br label %scalar.ph.preheader

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %min.iters.checked.scalar.ph.preheader_crit_edge, label %vector.memcheck

min.iters.checked.scalar.ph.preheader_crit_edge:  ; preds = %min.iters.checked
  br label %scalar.ph.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep9
  %bound1 = icmp ult double* %scevgep7, %scevgep5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %vector.memcheck.scalar.ph.preheader_crit_edge, label %vector.body.preheader

vector.memcheck.scalar.ph.preheader_crit_edge:    ; preds = %vector.memcheck
  br label %scalar.ph.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %123 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %114, i64 %120, i64 %offset.idx
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !10
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %120, i64 %offset.idx
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !10
  %127 = fmul <2 x double> %wide.load11, <double 2.000000e+00, double 2.000000e+00>
  %128 = fsub <2 x double> %wide.load, %127
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %115, i64 %120, i64 %offset.idx
  %130 = bitcast double* %129 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %130, align 8, !alias.scope !10
  %131 = fadd <2 x double> %wide.load12, %128
  %132 = fmul <2 x double> %131, <double 1.250000e-01, double 1.250000e-01>
  %133 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %121, i64 %offset.idx
  %134 = bitcast double* %133 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %134, align 8, !alias.scope !10
  %135 = fsub <2 x double> %wide.load13, %127
  %136 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %122, i64 %offset.idx
  %137 = bitcast double* %136 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %137, align 8, !alias.scope !10
  %138 = fadd <2 x double> %135, %wide.load14
  %139 = fmul <2 x double> %138, <double 1.250000e-01, double 1.250000e-01>
  %140 = fadd <2 x double> %132, %139
  %141 = add nuw nsw i64 %offset.idx, 1
  %142 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %120, i64 %141
  %143 = bitcast double* %142 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %143, align 8, !alias.scope !10
  %144 = fsub <2 x double> %wide.load15, %127
  %145 = add nsw i64 %offset.idx, -1
  %146 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %120, i64 %145
  %147 = bitcast double* %146 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %147, align 8, !alias.scope !10
  %148 = fadd <2 x double> %144, %wide.load16
  %149 = fmul <2 x double> %148, <double 1.250000e-01, double 1.250000e-01>
  %150 = fadd <2 x double> %140, %149
  %151 = fadd <2 x double> %wide.load11, %150
  %152 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %indvars.iv68, i64 %120, i64 %offset.idx
  %153 = bitcast double* %152 to <2 x double>*
  store <2 x double> %151, <2 x double>* %153, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %154 = icmp eq i64 %index.next, %n.vec
  br i1 %154, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !15

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.._crit_edge16.us_crit_edge, label %middle.block.scalar.ph.preheader_crit_edge

middle.block.scalar.ph.preheader_crit_edge:       ; preds = %middle.block
  br label %scalar.ph.preheader

middle.block.._crit_edge16.us_crit_edge:          ; preds = %middle.block
  br label %._crit_edge16.us

scalar.ph.preheader:                              ; preds = %middle.block.scalar.ph.preheader_crit_edge, %vector.memcheck.scalar.ph.preheader_crit_edge, %min.iters.checked.scalar.ph.preheader_crit_edge, %.preheader.us.scalar.ph.preheader_crit_edge
  %indvars.iv64.ph = phi i64 [ 1, %vector.memcheck.scalar.ph.preheader_crit_edge ], [ 1, %min.iters.checked.scalar.ph.preheader_crit_edge ], [ 1, %.preheader.us.scalar.ph.preheader_crit_edge ], [ %ind.end, %middle.block.scalar.ph.preheader_crit_edge ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %scalar.ph.scalar.ph_crit_edge ], [ %indvars.iv64.ph, %scalar.ph.preheader ]
  %155 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %114, i64 %120, i64 %indvars.iv64
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %120, i64 %indvars.iv64
  %158 = load double, double* %157, align 8
  %159 = fmul double %158, 2.000000e+00
  %160 = fsub double %156, %159
  %161 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %115, i64 %120, i64 %indvars.iv64
  %162 = load double, double* %161, align 8
  %163 = fadd double %162, %160
  %164 = fmul double %163, 1.250000e-01
  %165 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %121, i64 %indvars.iv64
  %166 = load double, double* %165, align 8
  %167 = fsub double %166, %159
  %168 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %122, i64 %indvars.iv64
  %169 = load double, double* %168, align 8
  %170 = fadd double %167, %169
  %171 = fmul double %170, 1.250000e-01
  %172 = fadd double %164, %171
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %173 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %120, i64 %indvars.iv.next65
  %174 = load double, double* %173, align 8
  %175 = fsub double %174, %159
  %176 = add nsw i64 %indvars.iv64, -1
  %177 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %120, i64 %176
  %178 = load double, double* %177, align 8
  %179 = fadd double %175, %178
  %180 = fmul double %179, 1.250000e-01
  %181 = fadd double %172, %180
  %182 = fadd double %158, %181
  %183 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %indvars.iv68, i64 %120, i64 %indvars.iv64
  store double %182, double* %183, align 8
  %184 = icmp slt i64 %indvars.iv.next65, %23
  br i1 %184, label %scalar.ph.scalar.ph_crit_edge, label %._crit_edge16.us.loopexit, !llvm.loop !16

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  br label %scalar.ph

._crit_edge16.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %middle.block.._crit_edge16.us_crit_edge, %._crit_edge16.us.loopexit
  %185 = add nsw i32 %116, 1
  %186 = icmp slt i32 %185, %24
  br i1 %186, label %._crit_edge16.us..preheader.us_crit_edge, label %._crit_edge17.loopexit

._crit_edge16.us..preheader.us_crit_edge:         ; preds = %._crit_edge16.us
  %indvar.next2 = add i64 %indvar1, 1
  br label %.preheader.us

._crit_edge17.loopexit:                           ; preds = %._crit_edge16.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %.preheader.lr.ph.._crit_edge17_crit_edge, %.preheader8.._crit_edge17_crit_edge, %._crit_edge17.loopexit
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %187 = icmp slt i64 %indvars.iv.next69, %25
  br i1 %187, label %._crit_edge17..preheader8_crit_edge, label %._crit_edge18.loopexit

._crit_edge17..preheader8_crit_edge:              ; preds = %._crit_edge17
  %indvar.next = add i64 %indvar, 1
  br label %.preheader8

._crit_edge18.loopexit:                           ; preds = %._crit_edge17
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %.preheader10.._crit_edge18_crit_edge, %._crit_edge18.loopexit
  %188 = add nsw i32 %36, 1
  %189 = icmp slt i32 %188, 501
  br i1 %189, label %._crit_edge18..preheader11_crit_edge, label %190

._crit_edge18..preheader11_crit_edge:             ; preds = %._crit_edge18
  br label %.preheader11

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
  br i1 %12, label %.preheader3.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %42

.preheader3.lr.ph:                                ; preds = %2
  %13 = load i32, i32* %3, align 4
  %wide.trip.count = zext i32 %13 to i64
  %14 = icmp sgt i32 %13, 0
  %15 = load [120 x [120 x double]]*, [120 x [120 x double]]** %4, align 8
  %.promoted = load i32, i32* %5, align 4
  br i1 %14, label %.preheader3.us.preheader, label %._crit_edge7.loopexit31

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %16 = icmp sgt i32 %13, 0
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge6.us..preheader3.us_crit_edge, %.preheader3.us.preheader
  %17 = phi i32 [ %20, %._crit_edge6.us..preheader3.us_crit_edge ], [ %.promoted, %.preheader3.us.preheader ]
  %18 = sext i32 %17 to i64
  br i1 %16, label %.preheader.us.us.preheader, label %.preheader3.us.._crit_edge6.us_crit_edge

.preheader3.us.._crit_edge6.us_crit_edge:         ; preds = %.preheader3.us
  br label %._crit_edge6.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %19 = mul nsw i32 %17, %13
  br label %.preheader.us.us

._crit_edge6.us.loopexit:                         ; preds = %._crit_edge5.us.us
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %.preheader3.us.._crit_edge6.us_crit_edge, %._crit_edge6.us.loopexit
  %.lcssa11.lcssa.us = phi i32 [ 0, %.preheader3.us.._crit_edge6.us_crit_edge ], [ %13, %._crit_edge6.us.loopexit ]
  %20 = add nsw i32 %17, 1
  %21 = icmp slt i32 %20, %13
  br i1 %21, label %._crit_edge6.us..preheader3.us_crit_edge, label %._crit_edge7.loopexit

._crit_edge6.us..preheader3.us_crit_edge:         ; preds = %._crit_edge6.us
  br label %.preheader3.us

.preheader.us.us:                                 ; preds = %._crit_edge5.us.us..preheader.us.us_crit_edge, %.preheader.us.us.preheader
  %22 = phi i32 [ %27, %._crit_edge5.us.us..preheader.us.us_crit_edge ], [ 0, %.preheader.us.us.preheader ]
  %23 = sext i32 %22 to i64
  %24 = add i32 %19, %22
  %25 = mul i32 %24, %13
  %26 = zext i32 %25 to i64
  br label %29

._crit_edge5.us.us:                               ; preds = %._crit_edge.us.us
  %27 = add nsw i32 %22, 1
  %28 = icmp slt i32 %27, %13
  br i1 %28, label %._crit_edge5.us.us..preheader.us.us_crit_edge, label %._crit_edge6.us.loopexit

._crit_edge5.us.us..preheader.us.us_crit_edge:    ; preds = %._crit_edge5.us.us
  br label %.preheader.us.us

; <label>:29:                                     ; preds = %._crit_edge.us.us._crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us._crit_edge ], [ 0, %.preheader.us.us ]
  %30 = add i64 %26, %indvars.iv
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 20
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %.._crit_edge.us.us_crit_edge

.._crit_edge.us.us_crit_edge:                     ; preds = %29
  br label %._crit_edge.us.us

; <label>:34:                                     ; preds = %29
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %35) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.._crit_edge.us.us_crit_edge, %34
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %15, i64 %18, i64 %23, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %38) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge5.us.us, label %._crit_edge.us.us._crit_edge

._crit_edge.us.us._crit_edge:                     ; preds = %._crit_edge.us.us
  br label %29

._crit_edge7.loopexit31:                          ; preds = %.preheader3.lr.ph
  %.promoted15 = load i32, i32* %6, align 4
  %40 = add i32 %.promoted, 1
  %41 = icmp sgt i32 %13, %40
  %smax = select i1 %41, i32 %13, i32 %40
  br label %._crit_edge7

._crit_edge7.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %._crit_edge7.loopexit31
  %.lcssa11.lcssa17.lcssa = phi i32 [ %.promoted15, %._crit_edge7.loopexit31 ], [ %.lcssa11.lcssa.us, %._crit_edge7.loopexit ]
  %.lcssa12 = phi i32 [ %smax, %._crit_edge7.loopexit31 ], [ %20, %._crit_edge7.loopexit ]
  store i32 %.lcssa12, i32* %5, align 4
  store i32 %.lcssa11.lcssa17.lcssa, i32* %6, align 4
  br label %42

; <label>:42:                                     ; preds = %._crit_edge, %._crit_edge7
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %45) #5
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

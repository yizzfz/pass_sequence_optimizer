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

._crit_edge:                                      ; preds = %2
  br label %29

; <label>:21:                                     ; preds = %2
  %22 = load i8**, i8*** %4, align 8
  %23 = load i8*, i8** %22, align 8
  %strcmpload = load i8, i8* %23, align 1
  %24 = icmp eq i8 %strcmpload, 0
  br i1 %24, label %25, label %._crit_edge1

._crit_edge1:                                     ; preds = %21
  br label %29

; <label>:25:                                     ; preds = %21
  %26 = load i32, i32* %5, align 4
  %27 = bitcast [120 x [120 x [120 x double]]]** %6 to [120 x [120 x double]]**
  %28 = load [120 x [120 x double]]*, [120 x [120 x double]]** %27, align 8
  tail call fastcc void @print_array(i32 %26, [120 x [120 x double]]* %28)
  br label %29

; <label>:29:                                     ; preds = %._crit_edge1, %._crit_edge, %25
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
  br i1 %9, label %.preheader3.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %3
  br label %34

.preheader3.lr.ph:                                ; preds = %3
  %10 = load i32, i32* %4, align 4
  %wide.trip.count34 = zext i32 %10 to i64
  %wide.trip.count = zext i32 %10 to i64
  %11 = sext i32 %10 to i64
  %12 = icmp sgt i32 %10, 0
  %13 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %14 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %.promoted = load i32, i32* %7, align 4
  br i1 %12, label %.preheader3.us.preheader, label %._crit_edge10.loopexit29

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %15 = sext i32 %.promoted to i64
  %16 = sitofp i32 %10 to double
  %17 = icmp sgt i32 %10, 0
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge5.us..preheader3.us_crit_edge, %.preheader3.us.preheader
  %indvars.iv36 = phi i64 [ %15, %.preheader3.us.preheader ], [ %indvars.iv.next37, %._crit_edge5.us..preheader3.us_crit_edge ]
  br i1 %17, label %.preheader.us.us.preheader, label %.preheader3.us.._crit_edge5.us_crit_edge

.preheader3.us.._crit_edge5.us_crit_edge:         ; preds = %.preheader3.us
  br label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %18 = trunc i64 %indvars.iv36 to i32
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %.preheader3.us.._crit_edge5.us_crit_edge, %._crit_edge5.us.loopexit
  %.lcssa9.lcssa.us = phi i32 [ 0, %.preheader3.us.._crit_edge5.us_crit_edge ], [ %10, %._crit_edge5.us.loopexit ]
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %19 = icmp slt i64 %indvars.iv.next37, %11
  br i1 %19, label %._crit_edge5.us..preheader3.us_crit_edge, label %._crit_edge10.loopexit

._crit_edge5.us..preheader3.us_crit_edge:         ; preds = %._crit_edge5.us
  br label %.preheader3.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us..preheader.us.us_crit_edge, %.preheader.us.us.preheader
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us.us..preheader.us.us_crit_edge ], [ 0, %.preheader.us.us.preheader ]
  %20 = trunc i64 %indvars.iv32 to i32
  br label %21

._crit_edge.us.us:                                ; preds = %21
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %._crit_edge5.us.loopexit, label %._crit_edge.us.us..preheader.us.us_crit_edge

._crit_edge.us.us..preheader.us.us_crit_edge:     ; preds = %._crit_edge.us.us
  br label %.preheader.us.us

; <label>:21:                                     ; preds = %._crit_edge39, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge39 ], [ 0, %.preheader.us.us ]
  %22 = trunc i64 %indvars.iv to i32
  %23 = sub i32 %10, %22
  %24 = add i32 %23, %18
  %25 = add i32 %24, %20
  %26 = sitofp i32 %25 to double
  %27 = fmul double %26, 1.000000e+01
  %28 = fdiv double %27, %16
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  store double %28, double* %29, align 8
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  store double %28, double* %30, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %._crit_edge39

._crit_edge39:                                    ; preds = %21
  br label %21

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  %31 = trunc i64 %indvars.iv.next37 to i32
  br label %._crit_edge10

._crit_edge10.loopexit29:                         ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %8, align 4
  %32 = add i32 %.promoted, 1
  %33 = icmp sgt i32 %10, %32
  %smax = select i1 %33, i32 %10, i32 %32
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit29, %._crit_edge10.loopexit
  %.lcssa9.lcssa16.lcssa = phi i32 [ %.lcssa9.lcssa.us, %._crit_edge10.loopexit ], [ %.promoted14, %._crit_edge10.loopexit29 ]
  %.lcssa11 = phi i32 [ %31, %._crit_edge10.loopexit ], [ %smax, %._crit_edge10.loopexit29 ]
  store i32 %.lcssa11, i32* %7, align 4
  store i32 %.lcssa9.lcssa16.lcssa, i32* %8, align 4
  br label %34

; <label>:34:                                     ; preds = %._crit_edge, %._crit_edge10
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
  %10 = sext i32 %0 to i64
  %11 = add nsw i32 %0, -1
  %12 = add nsw i32 %0, -1
  %13 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %14 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %15 = add nsw i64 %10, -1
  %16 = add nsw i32 %0, -1
  %17 = add nsw i32 %0, -1
  %18 = add nsw i32 %0, -1
  %19 = load i32, i32* %4, align 4
  %20 = sext i32 %19 to i64
  %21 = sext i32 %19 to i64
  %22 = sext i32 %19 to i64
  %23 = add nsw i64 %21, -1
  %24 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %25 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %26 = add nsw i64 %22, -1
  %27 = add nsw i64 %20, -1
  %.promoted51 = load i32, i32* %7, align 4
  %wide.trip.count63 = zext i32 %12 to i64
  %wide.trip.count = zext i32 %12 to i64
  %28 = icmp sgt i64 %26, 2
  %smax = select i1 %28, i64 %26, i64 2
  %29 = add nsw i64 %smax, -1
  %30 = icmp sgt i64 %26, 2
  %smax4 = select i1 %30, i64 %26, i64 2
  %31 = add nsw i64 %wide.trip.count, -1
  %32 = icmp sgt i32 %8, 1
  %33 = icmp sgt i32 %9, 1
  %34 = icmp sgt i32 %11, 1
  %min.iters.check20 = icmp ult i64 %31, 2
  %n.vec23 = and i64 %31, -2
  %cmp.zero24 = icmp eq i64 %n.vec23, 0
  %ind.end47 = or i64 %31, 1
  %cmp.n48 = icmp eq i64 %31, %n.vec23
  %35 = icmp sgt i32 %16, 1
  %36 = icmp sgt i32 %17, 1
  %37 = icmp sgt i32 %18, 1
  %min.iters.check = icmp ult i64 %29, 2
  %n.vec = and i64 %29, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %29, 1
  %cmp.n = icmp eq i64 %29, %n.vec
  br label %.preheader11

.preheader11:                                     ; preds = %._crit_edge34..preheader11_crit_edge, %3
  %38 = phi i32 [ %.promoted51, %3 ], [ %177, %._crit_edge34..preheader11_crit_edge ]
  br i1 %32, label %.preheader9.preheader, label %.preheader11..preheader10_crit_edge

.preheader11..preheader10_crit_edge:              ; preds = %.preheader11
  br label %.preheader10

.preheader9.preheader:                            ; preds = %.preheader11
  br label %.preheader9

.preheader10.loopexit:                            ; preds = %._crit_edge13
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader11..preheader10_crit_edge, %.preheader10.loopexit
  br i1 %35, label %.preheader8.preheader, label %.preheader10.._crit_edge34_crit_edge

.preheader10.._crit_edge34_crit_edge:             ; preds = %.preheader10
  br label %._crit_edge34

.preheader8.preheader:                            ; preds = %.preheader10
  br label %.preheader8

.preheader9:                                      ; preds = %._crit_edge13..preheader9_crit_edge, %.preheader9.preheader
  %indvar26 = phi i64 [ %indvar.next27, %._crit_edge13..preheader9_crit_edge ], [ 0, %.preheader9.preheader ]
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge13..preheader9_crit_edge ], [ 1, %.preheader9.preheader ]
  %39 = add i64 %indvar26, 1
  %40 = add i64 %indvar26, 2
  br i1 %33, label %.preheader7.lr.ph, label %.preheader9.._crit_edge13_crit_edge

.preheader9.._crit_edge13_crit_edge:              ; preds = %.preheader9
  br label %._crit_edge13

.preheader7.lr.ph:                                ; preds = %.preheader9
  %41 = add nuw nsw i64 %indvars.iv65, 1
  %42 = add nsw i64 %indvars.iv65, -1
  br i1 %34, label %.preheader7.us.preheader, label %.preheader7.lr.ph.._crit_edge13_crit_edge

.preheader7.lr.ph.._crit_edge13_crit_edge:        ; preds = %.preheader7.lr.ph
  br label %._crit_edge13

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge.us..preheader7.us_crit_edge, %.preheader7.us.preheader
  %indvar28 = phi i64 [ %indvar.next29, %._crit_edge.us..preheader7.us_crit_edge ], [ 0, %.preheader7.us.preheader ]
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us..preheader7.us_crit_edge ], [ 1, %.preheader7.us.preheader ]
  %43 = add i64 %indvar28, 1
  %scevgep30 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %39, i64 %43, i64 1
  %scevgep32 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %39, i64 %43, i64 %wide.trip.count
  %scevgep34 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvar26, i64 %43, i64 1
  %scevgep36 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %40, i64 %43, i64 %wide.trip.count
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %44 = add nsw i64 %indvars.iv61, -1
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
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %41, i64 %indvars.iv61, i64 %offset.idx49
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !1
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv65, i64 %indvars.iv61, i64 %offset.idx49
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !1
  %49 = fmul <2 x double> %wide.load54, <double 2.000000e+00, double 2.000000e+00>
  %50 = fsub <2 x double> %wide.load53, %49
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %42, i64 %indvars.iv61, i64 %offset.idx49
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !1
  %53 = fadd <2 x double> %wide.load55, %50
  %54 = fmul <2 x double> %53, <double 1.250000e-01, double 1.250000e-01>
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv65, i64 %indvars.iv.next62, i64 %offset.idx49
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !1
  %57 = fsub <2 x double> %wide.load56, %49
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv65, i64 %44, i64 %offset.idx49
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !1
  %60 = fadd <2 x double> %57, %wide.load57
  %61 = fmul <2 x double> %60, <double 1.250000e-01, double 1.250000e-01>
  %62 = fadd <2 x double> %54, %61
  %63 = add nuw nsw i64 %offset.idx49, 1
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv65, i64 %indvars.iv61, i64 %63
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !1
  %66 = fsub <2 x double> %wide.load58, %49
  %67 = add nsw i64 %offset.idx49, -1
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv65, i64 %indvars.iv61, i64 %67
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !1
  %70 = fadd <2 x double> %66, %wide.load59
  %71 = fmul <2 x double> %70, <double 1.250000e-01, double 1.250000e-01>
  %72 = fadd <2 x double> %62, %71
  %73 = fadd <2 x double> %wide.load54, %72
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv65, i64 %indvars.iv61, i64 %offset.idx49
  %75 = bitcast double* %74 to <2 x double>*
  store <2 x double> %73, <2 x double>* %75, align 8, !alias.scope !4, !noalias !1
  %index.next45 = add i64 %index44, 2
  %76 = icmp eq i64 %index.next45, %n.vec23
  br i1 %76, label %middle.block18, label %vector.body17.vector.body17_crit_edge, !llvm.loop !6

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
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %41, i64 %indvars.iv61, i64 %indvars.iv
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv65, i64 %indvars.iv61, i64 %indvars.iv
  %80 = load double, double* %79, align 8
  %81 = fmul double %80, 2.000000e+00
  %82 = fsub double %78, %81
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %42, i64 %indvars.iv61, i64 %indvars.iv
  %84 = load double, double* %83, align 8
  %85 = fadd double %84, %82
  %86 = fmul double %85, 1.250000e-01
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv65, i64 %indvars.iv.next62, i64 %indvars.iv
  %88 = load double, double* %87, align 8
  %89 = fsub double %88, %81
  %90 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv65, i64 %44, i64 %indvars.iv
  %91 = load double, double* %90, align 8
  %92 = fadd double %89, %91
  %93 = fmul double %92, 1.250000e-01
  %94 = fadd double %86, %93
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv65, i64 %indvars.iv61, i64 %indvars.iv.next
  %96 = load double, double* %95, align 8
  %97 = fsub double %96, %81
  %98 = add nsw i64 %indvars.iv, -1
  %99 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv65, i64 %indvars.iv61, i64 %98
  %100 = load double, double* %99, align 8
  %101 = fadd double %97, %100
  %102 = fmul double %101, 1.250000e-01
  %103 = fadd double %94, %102
  %104 = fadd double %80, %103
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv65, i64 %indvars.iv61, i64 %indvars.iv
  store double %104, double* %105, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph19.scalar.ph19_crit_edge, !llvm.loop !9

scalar.ph19.scalar.ph19_crit_edge:                ; preds = %scalar.ph19
  br label %scalar.ph19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph19
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %middle.block18.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %._crit_edge13.loopexit, label %._crit_edge.us..preheader7.us_crit_edge

._crit_edge.us..preheader7.us_crit_edge:          ; preds = %._crit_edge.us
  %indvar.next29 = add i64 %indvar28, 1
  br label %.preheader7.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.preheader7.lr.ph.._crit_edge13_crit_edge, %.preheader9.._crit_edge13_crit_edge, %._crit_edge13.loopexit
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %106 = icmp slt i64 %indvars.iv.next66, %15
  br i1 %106, label %._crit_edge13..preheader9_crit_edge, label %.preheader10.loopexit

._crit_edge13..preheader9_crit_edge:              ; preds = %._crit_edge13
  %indvar.next27 = add i64 %indvar26, 1
  br label %.preheader9

.preheader8:                                      ; preds = %._crit_edge29..preheader8_crit_edge, %.preheader8.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge29..preheader8_crit_edge ], [ 0, %.preheader8.preheader ]
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge29..preheader8_crit_edge ], [ 1, %.preheader8.preheader ]
  %107 = add i64 %indvar, 1
  %108 = add i64 %indvar, 2
  br i1 %36, label %.preheader.lr.ph, label %.preheader8.._crit_edge29_crit_edge

.preheader8.._crit_edge29_crit_edge:              ; preds = %.preheader8
  br label %._crit_edge29

.preheader.lr.ph:                                 ; preds = %.preheader8
  %109 = add nuw nsw i64 %indvars.iv74, 1
  %110 = add nsw i64 %indvars.iv74, -1
  br i1 %37, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge29_crit_edge

.preheader.lr.ph.._crit_edge29_crit_edge:         ; preds = %.preheader.lr.ph
  br label %._crit_edge29

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge26.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvar1 = phi i64 [ %indvar.next2, %._crit_edge26.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %._crit_edge26.us..preheader.us_crit_edge ], [ 1, %.preheader.us.preheader ]
  %111 = add i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %107, i64 %111, i64 1
  %scevgep5 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %107, i64 %111, i64 %smax4
  %scevgep7 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvar, i64 %111, i64 1
  %scevgep9 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %108, i64 %111, i64 %smax4
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %112 = add nsw i64 %indvars.iv71, -1
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
  %113 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %109, i64 %indvars.iv71, i64 %offset.idx
  %114 = bitcast double* %113 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %114, align 8, !alias.scope !10
  %115 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv74, i64 %indvars.iv71, i64 %offset.idx
  %116 = bitcast double* %115 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %116, align 8, !alias.scope !10
  %117 = fmul <2 x double> %wide.load11, <double 2.000000e+00, double 2.000000e+00>
  %118 = fsub <2 x double> %wide.load, %117
  %119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %110, i64 %indvars.iv71, i64 %offset.idx
  %120 = bitcast double* %119 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !10
  %121 = fadd <2 x double> %wide.load12, %118
  %122 = fmul <2 x double> %121, <double 1.250000e-01, double 1.250000e-01>
  %123 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv74, i64 %indvars.iv.next72, i64 %offset.idx
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !10
  %125 = fsub <2 x double> %wide.load13, %117
  %126 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv74, i64 %112, i64 %offset.idx
  %127 = bitcast double* %126 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %127, align 8, !alias.scope !10
  %128 = fadd <2 x double> %125, %wide.load14
  %129 = fmul <2 x double> %128, <double 1.250000e-01, double 1.250000e-01>
  %130 = fadd <2 x double> %122, %129
  %131 = add nuw nsw i64 %offset.idx, 1
  %132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv74, i64 %indvars.iv71, i64 %131
  %133 = bitcast double* %132 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %133, align 8, !alias.scope !10
  %134 = fsub <2 x double> %wide.load15, %117
  %135 = add nsw i64 %offset.idx, -1
  %136 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv74, i64 %indvars.iv71, i64 %135
  %137 = bitcast double* %136 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %137, align 8, !alias.scope !10
  %138 = fadd <2 x double> %134, %wide.load16
  %139 = fmul <2 x double> %138, <double 1.250000e-01, double 1.250000e-01>
  %140 = fadd <2 x double> %130, %139
  %141 = fadd <2 x double> %wide.load11, %140
  %142 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv74, i64 %indvars.iv71, i64 %offset.idx
  %143 = bitcast double* %142 to <2 x double>*
  store <2 x double> %141, <2 x double>* %143, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %144 = icmp eq i64 %index.next, %n.vec
  br i1 %144, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !15

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.._crit_edge26.us_crit_edge, label %middle.block.scalar.ph.preheader_crit_edge

middle.block.scalar.ph.preheader_crit_edge:       ; preds = %middle.block
  br label %scalar.ph.preheader

middle.block.._crit_edge26.us_crit_edge:          ; preds = %middle.block
  br label %._crit_edge26.us

scalar.ph.preheader:                              ; preds = %middle.block.scalar.ph.preheader_crit_edge, %vector.memcheck.scalar.ph.preheader_crit_edge, %min.iters.checked.scalar.ph.preheader_crit_edge, %.preheader.us.scalar.ph.preheader_crit_edge
  %indvars.iv68.ph = phi i64 [ 1, %vector.memcheck.scalar.ph.preheader_crit_edge ], [ 1, %min.iters.checked.scalar.ph.preheader_crit_edge ], [ 1, %.preheader.us.scalar.ph.preheader_crit_edge ], [ %ind.end, %middle.block.scalar.ph.preheader_crit_edge ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %scalar.ph.scalar.ph_crit_edge ], [ %indvars.iv68.ph, %scalar.ph.preheader ]
  %145 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %109, i64 %indvars.iv71, i64 %indvars.iv68
  %146 = load double, double* %145, align 8
  %147 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv74, i64 %indvars.iv71, i64 %indvars.iv68
  %148 = load double, double* %147, align 8
  %149 = fmul double %148, 2.000000e+00
  %150 = fsub double %146, %149
  %151 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %110, i64 %indvars.iv71, i64 %indvars.iv68
  %152 = load double, double* %151, align 8
  %153 = fadd double %152, %150
  %154 = fmul double %153, 1.250000e-01
  %155 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv74, i64 %indvars.iv.next72, i64 %indvars.iv68
  %156 = load double, double* %155, align 8
  %157 = fsub double %156, %149
  %158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv74, i64 %112, i64 %indvars.iv68
  %159 = load double, double* %158, align 8
  %160 = fadd double %157, %159
  %161 = fmul double %160, 1.250000e-01
  %162 = fadd double %154, %161
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %163 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv74, i64 %indvars.iv71, i64 %indvars.iv.next69
  %164 = load double, double* %163, align 8
  %165 = fsub double %164, %149
  %166 = add nsw i64 %indvars.iv68, -1
  %167 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv74, i64 %indvars.iv71, i64 %166
  %168 = load double, double* %167, align 8
  %169 = fadd double %165, %168
  %170 = fmul double %169, 1.250000e-01
  %171 = fadd double %162, %170
  %172 = fadd double %148, %171
  %173 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv74, i64 %indvars.iv71, i64 %indvars.iv68
  store double %172, double* %173, align 8
  %174 = icmp slt i64 %indvars.iv.next69, %26
  br i1 %174, label %scalar.ph.scalar.ph_crit_edge, label %._crit_edge26.us.loopexit, !llvm.loop !16

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  br label %scalar.ph

._crit_edge26.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %middle.block.._crit_edge26.us_crit_edge, %._crit_edge26.us.loopexit
  %175 = icmp slt i64 %indvars.iv.next72, %23
  br i1 %175, label %._crit_edge26.us..preheader.us_crit_edge, label %._crit_edge29.loopexit

._crit_edge26.us..preheader.us_crit_edge:         ; preds = %._crit_edge26.us
  %indvar.next2 = add i64 %indvar1, 1
  br label %.preheader.us

._crit_edge29.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %.preheader.lr.ph.._crit_edge29_crit_edge, %.preheader8.._crit_edge29_crit_edge, %._crit_edge29.loopexit
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %176 = icmp slt i64 %indvars.iv.next75, %27
  br i1 %176, label %._crit_edge29..preheader8_crit_edge, label %._crit_edge34.loopexit

._crit_edge29..preheader8_crit_edge:              ; preds = %._crit_edge29
  %indvar.next = add i64 %indvar, 1
  br label %.preheader8

._crit_edge34.loopexit:                           ; preds = %._crit_edge29
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %.preheader10.._crit_edge34_crit_edge, %._crit_edge34.loopexit
  %177 = add nsw i32 %38, 1
  %178 = icmp slt i32 %177, 501
  br i1 %178, label %._crit_edge34..preheader11_crit_edge, label %179

._crit_edge34..preheader11_crit_edge:             ; preds = %._crit_edge34
  br label %.preheader11

; <label>:179:                                    ; preds = %._crit_edge34
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
  %wide.trip.count34 = zext i32 %13 to i64
  %wide.trip.count = zext i32 %13 to i64
  %14 = sext i32 %13 to i64
  %15 = sext i32 %13 to i64
  %16 = icmp sgt i32 %13, 0
  %17 = load [120 x [120 x double]]*, [120 x [120 x double]]** %4, align 8
  %.promoted = load i32, i32* %5, align 4
  br i1 %16, label %.preheader3.us.preheader, label %._crit_edge10.loopexit29

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %18 = sext i32 %.promoted to i64
  %19 = icmp sgt i32 %13, 0
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge5.us..preheader3.us_crit_edge, %.preheader3.us.preheader
  %indvars.iv36 = phi i64 [ %18, %.preheader3.us.preheader ], [ %indvars.iv.next37, %._crit_edge5.us..preheader3.us_crit_edge ]
  br i1 %19, label %.preheader.us.us.preheader, label %.preheader3.us.._crit_edge5.us_crit_edge

.preheader3.us.._crit_edge5.us_crit_edge:         ; preds = %.preheader3.us
  br label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %20 = mul nsw i64 %indvars.iv36, %14
  %21 = trunc i64 %20 to i32
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %.preheader3.us.._crit_edge5.us_crit_edge, %._crit_edge5.us.loopexit
  %.lcssa9.lcssa.us = phi i32 [ 0, %.preheader3.us.._crit_edge5.us_crit_edge ], [ %13, %._crit_edge5.us.loopexit ]
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %22 = icmp slt i64 %indvars.iv.next37, %15
  br i1 %22, label %._crit_edge5.us..preheader3.us_crit_edge, label %._crit_edge10.loopexit

._crit_edge5.us..preheader3.us_crit_edge:         ; preds = %._crit_edge5.us
  br label %.preheader3.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us..preheader.us.us_crit_edge, %.preheader.us.us.preheader
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us.us..preheader.us.us_crit_edge ], [ 0, %.preheader.us.us.preheader ]
  %23 = trunc i64 %indvars.iv32 to i32
  %24 = add i32 %21, %23
  %25 = mul i32 %24, %13
  %26 = zext i32 %25 to i64
  br label %27

._crit_edge.us.us:                                ; preds = %34
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %._crit_edge5.us.loopexit, label %._crit_edge.us.us..preheader.us.us_crit_edge

._crit_edge.us.us..preheader.us.us_crit_edge:     ; preds = %._crit_edge.us.us
  br label %.preheader.us.us

; <label>:27:                                     ; preds = %._crit_edge40, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge40 ], [ 0, %.preheader.us.us ]
  %28 = add i64 %26, %indvars.iv
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %._crit_edge39

._crit_edge39:                                    ; preds = %27
  br label %34

; <label>:32:                                     ; preds = %27
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #5
  br label %34

; <label>:34:                                     ; preds = %._crit_edge39, %32
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %17, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %._crit_edge40

._crit_edge40:                                    ; preds = %34
  br label %27

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  %39 = trunc i64 %indvars.iv.next37 to i32
  br label %._crit_edge10

._crit_edge10.loopexit29:                         ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %6, align 4
  %40 = add i32 %.promoted, 1
  %41 = icmp sgt i32 %13, %40
  %smax = select i1 %41, i32 %13, i32 %40
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit29, %._crit_edge10.loopexit
  %.lcssa9.lcssa16.lcssa = phi i32 [ %.lcssa9.lcssa.us, %._crit_edge10.loopexit ], [ %.promoted14, %._crit_edge10.loopexit29 ]
  %.lcssa11 = phi i32 [ %39, %._crit_edge10.loopexit ], [ %smax, %._crit_edge10.loopexit29 ]
  store i32 %.lcssa11, i32* %5, align 4
  store i32 %.lcssa9.lcssa16.lcssa, i32* %6, align 4
  br label %42

; <label>:42:                                     ; preds = %._crit_edge, %._crit_edge10
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

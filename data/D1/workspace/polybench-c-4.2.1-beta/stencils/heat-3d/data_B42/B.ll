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
  %6 = alloca i32, align 4
  %7 = alloca [120 x [120 x [120 x double]]]*, align 8
  %8 = alloca [120 x [120 x [120 x double]]]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 120, i32* %5, align 4
  store i32 500, i32* %6, align 4
  %9 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %10 = bitcast [120 x [120 x [120 x double]]]** %7 to i8**
  store i8* %9, i8** %10, align 8
  %11 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %12 = bitcast [120 x [120 x [120 x double]]]** %8 to i8**
  store i8* %11, i8** %12, align 8
  %13 = load i32, i32* %5, align 4
  %14 = bitcast i8* %9 to [120 x [120 x double]]*
  %15 = bitcast i8* %11 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 %13, [120 x [120 x double]]* %14, [120 x [120 x double]]* %15)
  tail call void (...) @polybench_timer_start() #4
  %16 = load i32, i32* %6, align 4
  %17 = bitcast [120 x [120 x [120 x double]]]** %7 to [120 x [120 x double]]**
  %18 = load [120 x [120 x double]]*, [120 x [120 x double]]** %17, align 8
  %19 = bitcast [120 x [120 x [120 x double]]]** %8 to [120 x [120 x double]]**
  %20 = load [120 x [120 x double]]*, [120 x [120 x double]]** %19, align 8
  tail call fastcc void @kernel_heat_3d(i32 %16, i32 %13, [120 x [120 x double]]* %18, [120 x [120 x double]]* %20)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %21 = load i32, i32* %3, align 4
  %22 = icmp sgt i32 %21, 42
  br i1 %22, label %23, label %31

; <label>:23:                                     ; preds = %2
  %24 = load i8**, i8*** %4, align 8
  %25 = load i8*, i8** %24, align 8
  %strcmpload = load i8, i8* %25, align 1
  %26 = icmp eq i8 %strcmpload, 0
  br i1 %26, label %27, label %31

; <label>:27:                                     ; preds = %23
  %28 = load i32, i32* %5, align 4
  %29 = bitcast [120 x [120 x [120 x double]]]** %7 to [120 x [120 x double]]**
  %30 = load [120 x [120 x double]]*, [120 x [120 x double]]** %29, align 8
  tail call fastcc void @print_array(i32 %28, [120 x [120 x double]]* %30)
  br label %31

; <label>:31:                                     ; preds = %23, %27, %2
  %32 = bitcast [120 x [120 x [120 x double]]]** %7 to i8**
  %33 = load i8*, i8** %32, align 8
  tail call void @free(i8* %33) #4
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
  br i1 %9, label %.preheader3.lr.ph, label %34

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

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %indvars.iv36 = phi i64 [ %15, %.preheader3.us.preheader ], [ %indvars.iv.next37, %._crit_edge5.us ]
  br i1 %17, label %.preheader.us.us.preheader, label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %18 = trunc i64 %indvars.iv36 to i32
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.preheader3.us
  %.lcssa9.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %10, %._crit_edge5.us.loopexit ]
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %19 = icmp slt i64 %indvars.iv.next37, %11
  br i1 %19, label %.preheader3.us, label %._crit_edge10.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %20 = trunc i64 %indvars.iv32 to i32
  br label %21

._crit_edge.us.us:                                ; preds = %21
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %._crit_edge5.us.loopexit, label %.preheader.us.us

; <label>:21:                                     ; preds = %21, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %21 ], [ 0, %.preheader.us.us ]
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
  br i1 %exitcond, label %._crit_edge.us.us, label %21

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

; <label>:34:                                     ; preds = %._crit_edge10, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %5 = alloca i32, align 4
  %6 = alloca [120 x [120 x double]]*, align 8
  %7 = alloca [120 x [120 x double]]*, align 8
  %8 = alloca i32, align 4
  store i32 %1, i32* %5, align 4
  store [120 x [120 x double]]* %2, [120 x [120 x double]]** %6, align 8
  store [120 x [120 x double]]* %3, [120 x [120 x double]]** %7, align 8
  store i32 1, i32* %8, align 4
  %9 = add nsw i32 %1, -1
  %10 = add nsw i32 %1, -1
  %11 = sext i32 %1 to i64
  %12 = add nsw i32 %1, -1
  %13 = add nsw i32 %1, -1
  %14 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %15 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %16 = add nsw i64 %11, -1
  %17 = add nsw i32 %1, -1
  %18 = add nsw i32 %1, -1
  %19 = add nsw i32 %1, -1
  %20 = load i32, i32* %5, align 4
  %21 = sext i32 %20 to i64
  %22 = sext i32 %20 to i64
  %23 = sext i32 %20 to i64
  %24 = add nsw i64 %22, -1
  %25 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %26 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %27 = add nsw i64 %23, -1
  %28 = add nsw i64 %21, -1
  %.promoted51 = load i32, i32* %8, align 4
  %wide.trip.count63 = zext i32 %13 to i64
  %wide.trip.count = zext i32 %13 to i64
  %29 = icmp sgt i64 %27, 2
  %smax = select i1 %29, i64 %27, i64 2
  %30 = add nsw i64 %smax, -1
  %31 = icmp sgt i64 %27, 2
  %smax80 = select i1 %31, i64 %27, i64 2
  %32 = add nsw i64 %wide.trip.count, -1
  %33 = icmp sgt i32 %9, 1
  %34 = icmp sgt i32 %17, 1
  %35 = icmp sgt i32 %18, 1
  %36 = icmp sgt i32 %19, 1
  %min.iters.check = icmp ult i64 %30, 2
  %n.vec = and i64 %30, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %30, 1
  %cmp.n = icmp eq i64 %30, %n.vec
  %37 = icmp sgt i32 %10, 1
  %38 = icmp sgt i32 %12, 1
  %min.iters.check96 = icmp ult i64 %32, 2
  %n.vec99 = and i64 %32, -2
  %cmp.zero100 = icmp eq i64 %n.vec99, 0
  %ind.end123 = or i64 %32, 1
  %cmp.n124 = icmp eq i64 %32, %n.vec99
  br label %.preheader11

.preheader11:                                     ; preds = %4, %._crit_edge34
  %39 = phi i32 [ %.promoted51, %4 ], [ %178, %._crit_edge34 ]
  br i1 %33, label %.preheader9.preheader, label %.preheader10

.preheader9.preheader:                            ; preds = %.preheader11
  br label %.preheader9

.preheader10.loopexit:                            ; preds = %._crit_edge13
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader11
  br i1 %34, label %.preheader8.preheader, label %._crit_edge34

.preheader8.preheader:                            ; preds = %.preheader10
  br label %.preheader8

.preheader9:                                      ; preds = %.preheader9.preheader, %._crit_edge13
  %indvar102 = phi i64 [ %indvar.next103, %._crit_edge13 ], [ 0, %.preheader9.preheader ]
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge13 ], [ 1, %.preheader9.preheader ]
  %40 = add i64 %indvar102, 1
  %41 = add i64 %indvar102, 2
  br i1 %37, label %.preheader7.lr.ph, label %._crit_edge13

.preheader7.lr.ph:                                ; preds = %.preheader9
  %42 = add nuw nsw i64 %indvars.iv65, 1
  %43 = add nsw i64 %indvars.iv65, -1
  br i1 %38, label %.preheader7.us.preheader, label %._crit_edge13

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge.us
  %indvar104 = phi i64 [ %indvar.next105, %._crit_edge.us ], [ 0, %.preheader7.us.preheader ]
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us ], [ 1, %.preheader7.us.preheader ]
  %44 = add i64 %indvar104, 1
  %scevgep106 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %15, i64 %40, i64 %44, i64 1
  %scevgep108 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %15, i64 %40, i64 %44, i64 %wide.trip.count
  %scevgep110 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvar102, i64 %44, i64 1
  %scevgep112 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %41, i64 %44, i64 %wide.trip.count
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %45 = add nsw i64 %indvars.iv61, -1
  br i1 %min.iters.check96, label %scalar.ph95.preheader, label %min.iters.checked97

min.iters.checked97:                              ; preds = %.preheader7.us
  br i1 %cmp.zero100, label %scalar.ph95.preheader, label %vector.memcheck118

vector.memcheck118:                               ; preds = %min.iters.checked97
  %bound0114 = icmp ult double* %scevgep106, %scevgep112
  %bound1115 = icmp ult double* %scevgep110, %scevgep108
  %memcheck.conflict117 = and i1 %bound0114, %bound1115
  br i1 %memcheck.conflict117, label %scalar.ph95.preheader, label %vector.body93.preheader

vector.body93.preheader:                          ; preds = %vector.memcheck118
  br label %vector.body93

vector.body93:                                    ; preds = %vector.body93.preheader, %vector.body93
  %index120 = phi i64 [ %index.next121, %vector.body93 ], [ 0, %vector.body93.preheader ]
  %offset.idx125 = or i64 %index120, 1
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %42, i64 %indvars.iv61, i64 %offset.idx125
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !1
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv65, i64 %indvars.iv61, i64 %offset.idx125
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !1
  %50 = fmul <2 x double> %wide.load130, <double 2.000000e+00, double 2.000000e+00>
  %51 = fsub <2 x double> %wide.load129, %50
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %43, i64 %indvars.iv61, i64 %offset.idx125
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !1
  %54 = fadd <2 x double> %wide.load131, %51
  %55 = fmul <2 x double> %54, <double 1.250000e-01, double 1.250000e-01>
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv65, i64 %indvars.iv.next62, i64 %offset.idx125
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !1
  %58 = fsub <2 x double> %wide.load132, %50
  %59 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv65, i64 %45, i64 %offset.idx125
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !1
  %61 = fadd <2 x double> %58, %wide.load133
  %62 = fmul <2 x double> %61, <double 1.250000e-01, double 1.250000e-01>
  %63 = fadd <2 x double> %55, %62
  %64 = add nuw nsw i64 %offset.idx125, 1
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv65, i64 %indvars.iv61, i64 %64
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !1
  %67 = fsub <2 x double> %wide.load134, %50
  %68 = add nsw i64 %offset.idx125, -1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv65, i64 %indvars.iv61, i64 %68
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !1
  %71 = fadd <2 x double> %67, %wide.load135
  %72 = fmul <2 x double> %71, <double 1.250000e-01, double 1.250000e-01>
  %73 = fadd <2 x double> %63, %72
  %74 = fadd <2 x double> %wide.load130, %73
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %15, i64 %indvars.iv65, i64 %indvars.iv61, i64 %offset.idx125
  %76 = bitcast double* %75 to <2 x double>*
  store <2 x double> %74, <2 x double>* %76, align 8, !alias.scope !4, !noalias !1
  %index.next121 = add i64 %index120, 2
  %77 = icmp eq i64 %index.next121, %n.vec99
  br i1 %77, label %middle.block94, label %vector.body93, !llvm.loop !6

middle.block94:                                   ; preds = %vector.body93
  br i1 %cmp.n124, label %._crit_edge.us, label %scalar.ph95.preheader

scalar.ph95.preheader:                            ; preds = %middle.block94, %vector.memcheck118, %min.iters.checked97, %.preheader7.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck118 ], [ 1, %min.iters.checked97 ], [ 1, %.preheader7.us ], [ %ind.end123, %middle.block94 ]
  br label %scalar.ph95

scalar.ph95:                                      ; preds = %scalar.ph95.preheader, %scalar.ph95
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph95 ], [ %indvars.iv.ph, %scalar.ph95.preheader ]
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %42, i64 %indvars.iv61, i64 %indvars.iv
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv65, i64 %indvars.iv61, i64 %indvars.iv
  %81 = load double, double* %80, align 8
  %82 = fmul double %81, 2.000000e+00
  %83 = fsub double %79, %82
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %43, i64 %indvars.iv61, i64 %indvars.iv
  %85 = load double, double* %84, align 8
  %86 = fadd double %85, %83
  %87 = fmul double %86, 1.250000e-01
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv65, i64 %indvars.iv.next62, i64 %indvars.iv
  %89 = load double, double* %88, align 8
  %90 = fsub double %89, %82
  %91 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv65, i64 %45, i64 %indvars.iv
  %92 = load double, double* %91, align 8
  %93 = fadd double %90, %92
  %94 = fmul double %93, 1.250000e-01
  %95 = fadd double %87, %94
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %96 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv65, i64 %indvars.iv61, i64 %indvars.iv.next
  %97 = load double, double* %96, align 8
  %98 = fsub double %97, %82
  %99 = add nsw i64 %indvars.iv, -1
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv65, i64 %indvars.iv61, i64 %99
  %101 = load double, double* %100, align 8
  %102 = fadd double %98, %101
  %103 = fmul double %102, 1.250000e-01
  %104 = fadd double %95, %103
  %105 = fadd double %81, %104
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %15, i64 %indvars.iv65, i64 %indvars.iv61, i64 %indvars.iv
  store double %105, double* %106, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph95, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph95
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block94
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  %indvar.next105 = add i64 %indvar104, 1
  br i1 %exitcond64, label %._crit_edge13.loopexit, label %.preheader7.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.preheader7.lr.ph, %.preheader9
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %107 = icmp slt i64 %indvars.iv.next66, %16
  %indvar.next103 = add i64 %indvar102, 1
  br i1 %107, label %.preheader9, label %.preheader10.loopexit

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge29
  %indvar = phi i64 [ %indvar.next, %._crit_edge29 ], [ 0, %.preheader8.preheader ]
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge29 ], [ 1, %.preheader8.preheader ]
  %108 = add i64 %indvar, 1
  %109 = add i64 %indvar, 2
  br i1 %35, label %.preheader.lr.ph, label %._crit_edge29

.preheader.lr.ph:                                 ; preds = %.preheader8
  %110 = add nuw nsw i64 %indvars.iv74, 1
  %111 = add nsw i64 %indvars.iv74, -1
  br i1 %36, label %.preheader.us.preheader, label %._crit_edge29

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge26.us
  %indvar77 = phi i64 [ %indvar.next78, %._crit_edge26.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %._crit_edge26.us ], [ 1, %.preheader.us.preheader ]
  %112 = add i64 %indvar77, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %26, i64 %108, i64 %112, i64 1
  %scevgep81 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %26, i64 %108, i64 %112, i64 %smax80
  %scevgep83 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvar, i64 %112, i64 1
  %scevgep85 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %109, i64 %112, i64 %smax80
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %113 = add nsw i64 %indvars.iv71, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep85
  %bound1 = icmp ult double* %scevgep83, %scevgep81
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %114 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %110, i64 %indvars.iv71, i64 %offset.idx
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !10
  %116 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv74, i64 %indvars.iv71, i64 %offset.idx
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %117, align 8, !alias.scope !10
  %118 = fmul <2 x double> %wide.load87, <double 2.000000e+00, double 2.000000e+00>
  %119 = fsub <2 x double> %wide.load, %118
  %120 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %111, i64 %indvars.iv71, i64 %offset.idx
  %121 = bitcast double* %120 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %121, align 8, !alias.scope !10
  %122 = fadd <2 x double> %wide.load88, %119
  %123 = fmul <2 x double> %122, <double 1.250000e-01, double 1.250000e-01>
  %124 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv74, i64 %indvars.iv.next72, i64 %offset.idx
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !10
  %126 = fsub <2 x double> %wide.load89, %118
  %127 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv74, i64 %113, i64 %offset.idx
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !10
  %129 = fadd <2 x double> %126, %wide.load90
  %130 = fmul <2 x double> %129, <double 1.250000e-01, double 1.250000e-01>
  %131 = fadd <2 x double> %123, %130
  %132 = add nuw nsw i64 %offset.idx, 1
  %133 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv74, i64 %indvars.iv71, i64 %132
  %134 = bitcast double* %133 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %134, align 8, !alias.scope !10
  %135 = fsub <2 x double> %wide.load91, %118
  %136 = add nsw i64 %offset.idx, -1
  %137 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv74, i64 %indvars.iv71, i64 %136
  %138 = bitcast double* %137 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %138, align 8, !alias.scope !10
  %139 = fadd <2 x double> %135, %wide.load92
  %140 = fmul <2 x double> %139, <double 1.250000e-01, double 1.250000e-01>
  %141 = fadd <2 x double> %131, %140
  %142 = fadd <2 x double> %wide.load87, %141
  %143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %26, i64 %indvars.iv74, i64 %indvars.iv71, i64 %offset.idx
  %144 = bitcast double* %143 to <2 x double>*
  store <2 x double> %142, <2 x double>* %144, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %145 = icmp eq i64 %index.next, %n.vec
  br i1 %145, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge26.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv68.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %scalar.ph ], [ %indvars.iv68.ph, %scalar.ph.preheader ]
  %146 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %110, i64 %indvars.iv71, i64 %indvars.iv68
  %147 = load double, double* %146, align 8
  %148 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv74, i64 %indvars.iv71, i64 %indvars.iv68
  %149 = load double, double* %148, align 8
  %150 = fmul double %149, 2.000000e+00
  %151 = fsub double %147, %150
  %152 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %111, i64 %indvars.iv71, i64 %indvars.iv68
  %153 = load double, double* %152, align 8
  %154 = fadd double %153, %151
  %155 = fmul double %154, 1.250000e-01
  %156 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv74, i64 %indvars.iv.next72, i64 %indvars.iv68
  %157 = load double, double* %156, align 8
  %158 = fsub double %157, %150
  %159 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv74, i64 %113, i64 %indvars.iv68
  %160 = load double, double* %159, align 8
  %161 = fadd double %158, %160
  %162 = fmul double %161, 1.250000e-01
  %163 = fadd double %155, %162
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %164 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv74, i64 %indvars.iv71, i64 %indvars.iv.next69
  %165 = load double, double* %164, align 8
  %166 = fsub double %165, %150
  %167 = add nsw i64 %indvars.iv68, -1
  %168 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv74, i64 %indvars.iv71, i64 %167
  %169 = load double, double* %168, align 8
  %170 = fadd double %166, %169
  %171 = fmul double %170, 1.250000e-01
  %172 = fadd double %163, %171
  %173 = fadd double %149, %172
  %174 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %26, i64 %indvars.iv74, i64 %indvars.iv71, i64 %indvars.iv68
  store double %173, double* %174, align 8
  %175 = icmp slt i64 %indvars.iv.next69, %27
  br i1 %175, label %scalar.ph, label %._crit_edge26.us.loopexit, !llvm.loop !16

._crit_edge26.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %._crit_edge26.us.loopexit, %middle.block
  %176 = icmp slt i64 %indvars.iv.next72, %24
  %indvar.next78 = add i64 %indvar77, 1
  br i1 %176, label %.preheader.us, label %._crit_edge29.loopexit

._crit_edge29.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %.preheader.lr.ph, %.preheader8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %177 = icmp slt i64 %indvars.iv.next75, %28
  %indvar.next = add i64 %indvar, 1
  br i1 %177, label %.preheader8, label %._crit_edge34.loopexit

._crit_edge34.loopexit:                           ; preds = %._crit_edge29
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.loopexit, %.preheader10
  %178 = add nsw i32 %39, 1
  %179 = icmp slt i32 %178, 501
  br i1 %179, label %.preheader11, label %180

; <label>:180:                                    ; preds = %._crit_edge34
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
  br i1 %12, label %.preheader3.lr.ph, label %42

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

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %indvars.iv36 = phi i64 [ %18, %.preheader3.us.preheader ], [ %indvars.iv.next37, %._crit_edge5.us ]
  br i1 %19, label %.preheader.us.us.preheader, label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %20 = mul nsw i64 %indvars.iv36, %14
  %21 = trunc i64 %20 to i32
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.preheader3.us
  %.lcssa9.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %13, %._crit_edge5.us.loopexit ]
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %22 = icmp slt i64 %indvars.iv.next37, %15
  br i1 %22, label %.preheader3.us, label %._crit_edge10.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %23 = trunc i64 %indvars.iv32 to i32
  %24 = add i32 %21, %23
  %25 = mul i32 %24, %13
  %26 = zext i32 %25 to i64
  br label %27

._crit_edge.us.us:                                ; preds = %34
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %._crit_edge5.us.loopexit, label %.preheader.us.us

; <label>:27:                                     ; preds = %34, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %34 ], [ 0, %.preheader.us.us ]
  %28 = add i64 %26, %indvars.iv
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %27
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #5
  br label %34

; <label>:34:                                     ; preds = %32, %27
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %17, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %27

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

; <label>:42:                                     ; preds = %._crit_edge10, %2
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %45) #5
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

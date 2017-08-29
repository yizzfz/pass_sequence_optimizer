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
  br i1 %9, label %.preheader3.lr.ph, label %38

.preheader3.lr.ph:                                ; preds = %3
  %10 = load i32, i32* %4, align 4
  %wide.trip.count = zext i32 %10 to i64
  %11 = icmp sgt i32 %10, 0
  %12 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %13 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %.promoted = load i32, i32* %7, align 4
  br i1 %11, label %.preheader3.us.preheader, label %._crit_edge10.loopexit29

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
  %.lcssa9.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %10, %._crit_edge5.us.loopexit ]
  %19 = add nsw i32 %16, 1
  %20 = icmp slt i32 %19, %10
  br i1 %20, label %.preheader3.us, label %._crit_edge10.loopexit

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

._crit_edge10.loopexit29:                         ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %8, align 4
  %36 = add i32 %.promoted, 1
  %37 = icmp sgt i32 %10, %36
  %smax = select i1 %37, i32 %10, i32 %36
  br label %._crit_edge10

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %._crit_edge10.loopexit29
  %.lcssa9.lcssa16.lcssa = phi i32 [ %.promoted14, %._crit_edge10.loopexit29 ], [ %.lcssa9.lcssa.us, %._crit_edge10.loopexit ]
  %.lcssa11 = phi i32 [ %smax, %._crit_edge10.loopexit29 ], [ %19, %._crit_edge10.loopexit ]
  store i32 %.lcssa11, i32* %7, align 4
  store i32 %.lcssa9.lcssa16.lcssa, i32* %8, align 4
  br label %38

; <label>:38:                                     ; preds = %._crit_edge10, %3
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
  %11 = add nsw i32 %1, -1
  %12 = add nsw i32 %1, -1
  %13 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %14 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %15 = load i32, i32* %5, align 4
  %16 = sext i32 %15 to i64
  %17 = sext i32 %15 to i64
  %18 = sext i32 %15 to i64
  %19 = add nsw i64 %18, -1
  %20 = add nsw i32 %15, -1
  %21 = add nsw i32 %15, -1
  %22 = add nsw i32 %15, -1
  %23 = add nsw i32 %15, -1
  %24 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %25 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %26 = add nsw i64 %17, -1
  %27 = add nsw i64 %16, -1
  %.promoted51 = load i32, i32* %8, align 4
  %wide.trip.count = zext i32 %12 to i64
  %28 = icmp sgt i64 %26, 2
  %smax = select i1 %28, i64 %26, i64 2
  %29 = add nsw i64 %smax, -1
  %30 = icmp sgt i64 %26, 2
  %smax74 = select i1 %30, i64 %26, i64 2
  %31 = add nsw i64 %wide.trip.count, -1
  %32 = icmp sgt i32 %9, 1
  %33 = icmp sgt i32 %20, 1
  %34 = icmp sgt i32 %21, 1
  %35 = icmp sgt i32 %22, 1
  %min.iters.check = icmp ult i64 %29, 2
  %n.vec = and i64 %29, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %29, 1
  %cmp.n = icmp eq i64 %29, %n.vec
  %36 = icmp sgt i32 %10, 1
  %37 = icmp sgt i32 %11, 1
  %min.iters.check90 = icmp ult i64 %31, 2
  %n.vec93 = and i64 %31, -2
  %cmp.zero94 = icmp eq i64 %n.vec93, 0
  %ind.end117 = or i64 %31, 1
  %cmp.n118 = icmp eq i64 %31, %n.vec93
  br label %.preheader11

.preheader11:                                     ; preds = %4, %._crit_edge34
  %38 = phi i32 [ %.promoted51, %4 ], [ %190, %._crit_edge34 ]
  br i1 %32, label %.preheader9.preheader, label %.preheader10

.preheader9.preheader:                            ; preds = %.preheader11
  br label %.preheader9

.preheader10.loopexit:                            ; preds = %._crit_edge13
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader11
  br i1 %33, label %.preheader8.preheader, label %._crit_edge34

.preheader8.preheader:                            ; preds = %.preheader10
  br label %.preheader8

.preheader9:                                      ; preds = %.preheader9.preheader, %._crit_edge13
  %indvar96 = phi i64 [ %indvar.next97, %._crit_edge13 ], [ 0, %.preheader9.preheader ]
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge13 ], [ 1, %.preheader9.preheader ]
  %39 = add i64 %indvar96, 1
  %40 = add i64 %indvar96, 2
  br i1 %36, label %.preheader7.lr.ph, label %._crit_edge13

.preheader7.lr.ph:                                ; preds = %.preheader9
  %41 = add nuw nsw i64 %indvars.iv61, 1
  %42 = add nsw i64 %indvars.iv61, -1
  br i1 %37, label %.preheader7.us.preheader, label %._crit_edge13

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge.us
  %indvar98 = phi i64 [ %indvar.next99, %._crit_edge.us ], [ 0, %.preheader7.us.preheader ]
  %43 = phi i32 [ %111, %._crit_edge.us ], [ 1, %.preheader7.us.preheader ]
  %44 = add i64 %indvar98, 1
  %scevgep100 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %39, i64 %44, i64 1
  %scevgep102 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %39, i64 %44, i64 %wide.trip.count
  %scevgep104 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvar96, i64 %44, i64 1
  %scevgep106 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %40, i64 %44, i64 %wide.trip.count
  %45 = sext i32 %43 to i64
  %46 = add nuw nsw i32 %43, 1
  %47 = sext i32 %46 to i64
  %48 = add nsw i32 %43, -1
  %49 = sext i32 %48 to i64
  br i1 %min.iters.check90, label %scalar.ph89.preheader, label %min.iters.checked91

min.iters.checked91:                              ; preds = %.preheader7.us
  br i1 %cmp.zero94, label %scalar.ph89.preheader, label %vector.memcheck112

vector.memcheck112:                               ; preds = %min.iters.checked91
  %bound0108 = icmp ult double* %scevgep100, %scevgep106
  %bound1109 = icmp ult double* %scevgep104, %scevgep102
  %memcheck.conflict111 = and i1 %bound0108, %bound1109
  br i1 %memcheck.conflict111, label %scalar.ph89.preheader, label %vector.body87.preheader

vector.body87.preheader:                          ; preds = %vector.memcheck112
  br label %vector.body87

vector.body87:                                    ; preds = %vector.body87.preheader, %vector.body87
  %index114 = phi i64 [ %index.next115, %vector.body87 ], [ 0, %vector.body87.preheader ]
  %offset.idx119 = or i64 %index114, 1
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %41, i64 %45, i64 %offset.idx119
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load123 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !1
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv61, i64 %45, i64 %offset.idx119
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load124 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !1
  %54 = fmul <2 x double> %wide.load124, <double 2.000000e+00, double 2.000000e+00>
  %55 = fsub <2 x double> %wide.load123, %54
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %42, i64 %45, i64 %offset.idx119
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load125 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !1
  %58 = fadd <2 x double> %wide.load125, %55
  %59 = fmul <2 x double> %58, <double 1.250000e-01, double 1.250000e-01>
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv61, i64 %47, i64 %offset.idx119
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load126 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !1
  %62 = fsub <2 x double> %wide.load126, %54
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv61, i64 %49, i64 %offset.idx119
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load127 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !1
  %65 = fadd <2 x double> %62, %wide.load127
  %66 = fmul <2 x double> %65, <double 1.250000e-01, double 1.250000e-01>
  %67 = fadd <2 x double> %59, %66
  %68 = add nuw nsw i64 %offset.idx119, 1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv61, i64 %45, i64 %68
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load128 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !1
  %71 = fsub <2 x double> %wide.load128, %54
  %72 = add nsw i64 %offset.idx119, -1
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv61, i64 %45, i64 %72
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !1
  %75 = fadd <2 x double> %71, %wide.load129
  %76 = fmul <2 x double> %75, <double 1.250000e-01, double 1.250000e-01>
  %77 = fadd <2 x double> %67, %76
  %78 = fadd <2 x double> %wide.load124, %77
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv61, i64 %45, i64 %offset.idx119
  %80 = bitcast double* %79 to <2 x double>*
  store <2 x double> %78, <2 x double>* %80, align 8, !alias.scope !4, !noalias !1
  %index.next115 = add i64 %index114, 2
  %81 = icmp eq i64 %index.next115, %n.vec93
  br i1 %81, label %middle.block88, label %vector.body87, !llvm.loop !6

middle.block88:                                   ; preds = %vector.body87
  br i1 %cmp.n118, label %._crit_edge.us, label %scalar.ph89.preheader

scalar.ph89.preheader:                            ; preds = %middle.block88, %vector.memcheck112, %min.iters.checked91, %.preheader7.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck112 ], [ 1, %min.iters.checked91 ], [ 1, %.preheader7.us ], [ %ind.end117, %middle.block88 ]
  br label %scalar.ph89

scalar.ph89:                                      ; preds = %scalar.ph89.preheader, %scalar.ph89
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph89 ], [ %indvars.iv.ph, %scalar.ph89.preheader ]
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %41, i64 %45, i64 %indvars.iv
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv61, i64 %45, i64 %indvars.iv
  %85 = load double, double* %84, align 8
  %86 = fmul double %85, 2.000000e+00
  %87 = fsub double %83, %86
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %42, i64 %45, i64 %indvars.iv
  %89 = load double, double* %88, align 8
  %90 = fadd double %89, %87
  %91 = fmul double %90, 1.250000e-01
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv61, i64 %47, i64 %indvars.iv
  %93 = load double, double* %92, align 8
  %94 = fsub double %93, %86
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv61, i64 %49, i64 %indvars.iv
  %96 = load double, double* %95, align 8
  %97 = fadd double %94, %96
  %98 = fmul double %97, 1.250000e-01
  %99 = fadd double %91, %98
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv61, i64 %45, i64 %indvars.iv.next
  %101 = load double, double* %100, align 8
  %102 = fsub double %101, %86
  %103 = add nsw i64 %indvars.iv, -1
  %104 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv61, i64 %45, i64 %103
  %105 = load double, double* %104, align 8
  %106 = fadd double %102, %105
  %107 = fmul double %106, 1.250000e-01
  %108 = fadd double %99, %107
  %109 = fadd double %85, %108
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv61, i64 %45, i64 %indvars.iv
  store double %109, double* %110, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph89, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph89
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block88
  %111 = add nsw i32 %43, 1
  %112 = icmp slt i32 %111, %12
  %indvar.next99 = add i64 %indvar98, 1
  br i1 %112, label %.preheader7.us, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.preheader7.lr.ph, %.preheader9
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %113 = icmp slt i64 %indvars.iv.next62, %19
  %indvar.next97 = add i64 %indvar96, 1
  br i1 %113, label %.preheader9, label %.preheader10.loopexit

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge29
  %indvar = phi i64 [ %indvar.next, %._crit_edge29 ], [ 0, %.preheader8.preheader ]
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge29 ], [ 1, %.preheader8.preheader ]
  %114 = add i64 %indvar, 1
  %115 = add i64 %indvar, 2
  br i1 %34, label %.preheader.lr.ph, label %._crit_edge29

.preheader.lr.ph:                                 ; preds = %.preheader8
  %116 = add nuw nsw i64 %indvars.iv68, 1
  %117 = add nsw i64 %indvars.iv68, -1
  br i1 %35, label %.preheader.us.preheader, label %._crit_edge29

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge26.us
  %indvar71 = phi i64 [ %indvar.next72, %._crit_edge26.us ], [ 0, %.preheader.us.preheader ]
  %118 = phi i32 [ %187, %._crit_edge26.us ], [ 1, %.preheader.us.preheader ]
  %119 = add i64 %indvar71, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %114, i64 %119, i64 1
  %scevgep75 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %114, i64 %119, i64 %smax74
  %scevgep77 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvar, i64 %119, i64 1
  %scevgep79 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %115, i64 %119, i64 %smax74
  %120 = sext i32 %118 to i64
  %121 = add nuw nsw i32 %118, 1
  %122 = sext i32 %121 to i64
  %123 = add nsw i32 %118, -1
  %124 = sext i32 %123 to i64
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep79
  %bound1 = icmp ult double* %scevgep77, %scevgep75
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %116, i64 %120, i64 %offset.idx
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !10
  %127 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv68, i64 %120, i64 %offset.idx
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !10
  %129 = fmul <2 x double> %wide.load81, <double 2.000000e+00, double 2.000000e+00>
  %130 = fsub <2 x double> %wide.load, %129
  %131 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %117, i64 %120, i64 %offset.idx
  %132 = bitcast double* %131 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %132, align 8, !alias.scope !10
  %133 = fadd <2 x double> %wide.load82, %130
  %134 = fmul <2 x double> %133, <double 1.250000e-01, double 1.250000e-01>
  %135 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv68, i64 %122, i64 %offset.idx
  %136 = bitcast double* %135 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %136, align 8, !alias.scope !10
  %137 = fsub <2 x double> %wide.load83, %129
  %138 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv68, i64 %124, i64 %offset.idx
  %139 = bitcast double* %138 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %139, align 8, !alias.scope !10
  %140 = fadd <2 x double> %137, %wide.load84
  %141 = fmul <2 x double> %140, <double 1.250000e-01, double 1.250000e-01>
  %142 = fadd <2 x double> %134, %141
  %143 = add nuw nsw i64 %offset.idx, 1
  %144 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv68, i64 %120, i64 %143
  %145 = bitcast double* %144 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %145, align 8, !alias.scope !10
  %146 = fsub <2 x double> %wide.load85, %129
  %147 = add nsw i64 %offset.idx, -1
  %148 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv68, i64 %120, i64 %147
  %149 = bitcast double* %148 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %149, align 8, !alias.scope !10
  %150 = fadd <2 x double> %146, %wide.load86
  %151 = fmul <2 x double> %150, <double 1.250000e-01, double 1.250000e-01>
  %152 = fadd <2 x double> %142, %151
  %153 = fadd <2 x double> %wide.load81, %152
  %154 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv68, i64 %120, i64 %offset.idx
  %155 = bitcast double* %154 to <2 x double>*
  store <2 x double> %153, <2 x double>* %155, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %156 = icmp eq i64 %index.next, %n.vec
  br i1 %156, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge26.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv64.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %scalar.ph ], [ %indvars.iv64.ph, %scalar.ph.preheader ]
  %157 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %116, i64 %120, i64 %indvars.iv64
  %158 = load double, double* %157, align 8
  %159 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv68, i64 %120, i64 %indvars.iv64
  %160 = load double, double* %159, align 8
  %161 = fmul double %160, 2.000000e+00
  %162 = fsub double %158, %161
  %163 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %117, i64 %120, i64 %indvars.iv64
  %164 = load double, double* %163, align 8
  %165 = fadd double %164, %162
  %166 = fmul double %165, 1.250000e-01
  %167 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv68, i64 %122, i64 %indvars.iv64
  %168 = load double, double* %167, align 8
  %169 = fsub double %168, %161
  %170 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv68, i64 %124, i64 %indvars.iv64
  %171 = load double, double* %170, align 8
  %172 = fadd double %169, %171
  %173 = fmul double %172, 1.250000e-01
  %174 = fadd double %166, %173
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %175 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv68, i64 %120, i64 %indvars.iv.next65
  %176 = load double, double* %175, align 8
  %177 = fsub double %176, %161
  %178 = add nsw i64 %indvars.iv64, -1
  %179 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %24, i64 %indvars.iv68, i64 %120, i64 %178
  %180 = load double, double* %179, align 8
  %181 = fadd double %177, %180
  %182 = fmul double %181, 1.250000e-01
  %183 = fadd double %174, %182
  %184 = fadd double %160, %183
  %185 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %25, i64 %indvars.iv68, i64 %120, i64 %indvars.iv64
  store double %184, double* %185, align 8
  %186 = icmp slt i64 %indvars.iv.next65, %26
  br i1 %186, label %scalar.ph, label %._crit_edge26.us.loopexit, !llvm.loop !16

._crit_edge26.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %._crit_edge26.us.loopexit, %middle.block
  %187 = add nsw i32 %118, 1
  %188 = icmp slt i32 %187, %23
  %indvar.next72 = add i64 %indvar71, 1
  br i1 %188, label %.preheader.us, label %._crit_edge29.loopexit

._crit_edge29.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %.preheader.lr.ph, %.preheader8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %189 = icmp slt i64 %indvars.iv.next69, %27
  %indvar.next = add i64 %indvar, 1
  br i1 %189, label %.preheader8, label %._crit_edge34.loopexit

._crit_edge34.loopexit:                           ; preds = %._crit_edge29
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.loopexit, %.preheader10
  %190 = add nsw i32 %38, 1
  %191 = icmp slt i32 %190, 501
  br i1 %191, label %.preheader11, label %192

; <label>:192:                                    ; preds = %._crit_edge34
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
  br i1 %14, label %.preheader3.us.preheader, label %._crit_edge10.loopexit29

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
  %.lcssa9.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %13, %._crit_edge5.us.loopexit ]
  %20 = add nsw i32 %17, 1
  %21 = icmp slt i32 %20, %13
  br i1 %21, label %.preheader3.us, label %._crit_edge10.loopexit

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
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %39) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %29

._crit_edge10.loopexit29:                         ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %6, align 4
  %41 = add i32 %.promoted, 1
  %42 = icmp sgt i32 %13, %41
  %smax = select i1 %42, i32 %13, i32 %41
  br label %._crit_edge10

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %._crit_edge10.loopexit29
  %.lcssa9.lcssa16.lcssa = phi i32 [ %.promoted14, %._crit_edge10.loopexit29 ], [ %.lcssa9.lcssa.us, %._crit_edge10.loopexit ]
  %.lcssa11 = phi i32 [ %smax, %._crit_edge10.loopexit29 ], [ %20, %._crit_edge10.loopexit ]
  store i32 %.lcssa11, i32* %5, align 4
  store i32 %.lcssa9.lcssa16.lcssa, i32* %6, align 4
  br label %43

; <label>:43:                                     ; preds = %._crit_edge10, %2
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

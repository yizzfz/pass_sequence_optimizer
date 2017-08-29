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
  br i1 %9, label %.preheader3.lr.ph, label %34

.preheader3.lr.ph:                                ; preds = %3
  %10 = load i32, i32* %4, align 4
  %wide.trip.count35 = zext i32 %10 to i64
  %11 = sext i32 %10 to i64
  %wide.trip.count = zext i32 %10 to i64
  %12 = icmp sgt i32 %10, 0
  %13 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %14 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %.promoted = load i32, i32* %7, align 4
  br i1 %12, label %.preheader3.us.preheader, label %._crit_edge6.loopexit29

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %15 = sext i32 %.promoted to i64
  %16 = sitofp i32 %10 to double
  %17 = icmp sgt i32 %10, 0
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %indvars.iv37 = phi i64 [ %15, %.preheader3.us.preheader ], [ %indvars.iv.next38, %._crit_edge5.us ]
  br i1 %17, label %.preheader.us.us.preheader, label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %18 = trunc i64 %indvars.iv37 to i32
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.preheader3.us
  %.lcssa10.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %10, %._crit_edge5.us.loopexit ]
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %19 = icmp slt i64 %indvars.iv.next38, %11
  br i1 %19, label %.preheader3.us, label %._crit_edge6.loopexit

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next34, %._crit_edge.us.us ]
  %20 = trunc i64 %indvars.iv33 to i32
  br label %21

._crit_edge.us.us:                                ; preds = %21
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %._crit_edge5.us.loopexit, label %.preheader.us.us

; <label>:21:                                     ; preds = %21, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %21 ], [ 0, %.preheader.us.us ]
  %22 = trunc i64 %indvars.iv to i32
  %23 = sub i32 %10, %22
  %24 = add i32 %23, %18
  %25 = add i32 %24, %20
  %26 = sitofp i32 %25 to double
  %27 = fmul double %26, 1.000000e+01
  %28 = fdiv double %27, %16
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  store double %28, double* %29, align 8
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  store double %28, double* %30, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %21

._crit_edge6.loopexit29:                          ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %8, align 4
  %31 = add i32 %.promoted, 1
  %32 = icmp sgt i32 %10, %31
  %smax = select i1 %32, i32 %10, i32 %31
  br label %._crit_edge6

._crit_edge6.loopexit:                            ; preds = %._crit_edge5.us
  %33 = trunc i64 %indvars.iv.next38 to i32
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %._crit_edge6.loopexit29
  %.lcssa10.lcssa16.lcssa = phi i32 [ %.promoted14, %._crit_edge6.loopexit29 ], [ %.lcssa10.lcssa.us, %._crit_edge6.loopexit ]
  %.lcssa11 = phi i32 [ %smax, %._crit_edge6.loopexit29 ], [ %33, %._crit_edge6.loopexit ]
  store i32 %.lcssa11, i32* %7, align 4
  store i32 %.lcssa10.lcssa16.lcssa, i32* %8, align 4
  br label %34

; <label>:34:                                     ; preds = %._crit_edge6, %3
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
  %11 = load i32, i32* %4, align 4
  %12 = sext i32 %11 to i64
  %13 = add nsw i64 %12, -1
  %14 = add nsw i32 %11, -1
  %15 = add nsw i32 %11, -1
  %16 = add nsw i32 %11, -1
  %17 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %18 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %19 = load i32, i32* %4, align 4
  %20 = sext i32 %19 to i64
  %21 = sext i32 %19 to i64
  %22 = sext i32 %19 to i64
  %23 = add nsw i64 %22, -1
  %24 = add nsw i64 %20, -1
  %25 = add nsw i64 %21, -1
  %.promoted51 = load i32, i32* %7, align 4
  %26 = zext i32 %8 to i64
  %wide.trip.count = zext i32 %8 to i64
  %27 = icmp sgt i32 %8, 1
  %28 = icmp sgt i32 %9, 1
  %29 = icmp sgt i32 %10, 1
  %30 = icmp sgt i32 %14, 1
  %31 = icmp sgt i32 %15, 1
  %32 = icmp sgt i32 %16, 1
  br label %.preheader11

.preheader11:                                     ; preds = %3, %._crit_edge18
  %33 = phi i32 [ %.promoted51, %3 ], [ %120, %._crit_edge18 ]
  br i1 %27, label %.preheader9.preheader, label %.preheader10

.preheader9.preheader:                            ; preds = %.preheader11
  br label %.preheader9

.preheader10.loopexit:                            ; preds = %._crit_edge13
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader11
  br i1 %30, label %.preheader8.preheader, label %._crit_edge18

.preheader8.preheader:                            ; preds = %.preheader10
  br label %.preheader8

.preheader9:                                      ; preds = %.preheader9.preheader, %._crit_edge13
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge13 ], [ 1, %.preheader9.preheader ]
  br i1 %28, label %.preheader7.lr.ph, label %._crit_edge13

.preheader7.lr.ph:                                ; preds = %.preheader9
  %34 = add nuw nsw i64 %indvars.iv61, 1
  %35 = add nsw i64 %indvars.iv61, -1
  br i1 %29, label %.preheader7.us.preheader, label %._crit_edge13

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge.us
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge.us ], [ 1, %.preheader7.us.preheader ]
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %36 = add nsw i64 %indvars.iv5, -1
  br label %37

; <label>:37:                                     ; preds = %37, %.preheader7.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %37 ], [ 1, %.preheader7.us ]
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %34, i64 %indvars.iv5, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %indvars.iv5, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, 2.000000e+00
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %35, i64 %indvars.iv5, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %indvars.iv.next6, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = insertelement <2 x double> undef, double %42, i32 0
  %48 = shufflevector <2 x double> %47, <2 x double> undef, <2 x i32> zeroinitializer
  %49 = insertelement <2 x double> undef, double %39, i32 0
  %50 = insertelement <2 x double> %49, double %46, i32 1
  %51 = fsub <2 x double> %50, %48
  %52 = extractelement <2 x double> %51, i32 0
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %36, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = insertelement <2 x double> undef, double %52, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  %57 = insertelement <2 x double> undef, double %44, i32 0
  %58 = shufflevector <2 x double> %57, <2 x double> %51, <2 x i32> <i32 0, i32 3>
  %59 = fadd <2 x double> %58, %56
  %60 = fmul <2 x double> %59, <double 1.250000e-01, double 1.250000e-01>
  %61 = extractelement <2 x double> %60, i32 0
  %62 = extractelement <2 x double> %60, i32 1
  %63 = fadd double %61, %62
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %indvars.iv5, i64 %indvars.iv.next
  %65 = load double, double* %64, align 8
  %66 = fsub double %65, %42
  %67 = add nsw i64 %indvars.iv, -1
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %indvars.iv5, i64 %67
  %69 = load double, double* %68, align 8
  %70 = fadd double %66, %69
  %71 = fmul double %70, 1.250000e-01
  %72 = fadd double %63, %71
  %73 = fadd double %41, %72
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv61, i64 %indvars.iv5, i64 %indvars.iv
  store double %73, double* %74, align 8
  %exitcond4 = icmp eq i64 %indvars.iv.next, %26
  br i1 %exitcond4, label %._crit_edge.us, label %37

._crit_edge.us:                                   ; preds = %37
  %exitcond = icmp eq i64 %indvars.iv.next6, %wide.trip.count
  br i1 %exitcond, label %._crit_edge13.loopexit, label %.preheader7.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.preheader7.lr.ph, %.preheader9
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %75 = icmp slt i64 %indvars.iv.next62, %13
  br i1 %75, label %.preheader9, label %.preheader10.loopexit

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge17
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge17 ], [ 1, %.preheader8.preheader ]
  br i1 %31, label %.preheader.lr.ph, label %._crit_edge17

.preheader.lr.ph:                                 ; preds = %.preheader8
  %76 = add nuw nsw i64 %indvars.iv68, 1
  %77 = add nsw i64 %indvars.iv68, -1
  br i1 %32, label %.preheader.us.preheader, label %._crit_edge17

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge16.us
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %._crit_edge16.us ], [ 1, %.preheader.us.preheader ]
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %78 = add nsw i64 %indvars.iv8, -1
  br label %79

; <label>:79:                                     ; preds = %79, %.preheader.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %79 ], [ 1, %.preheader.us ]
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %17, i64 %76, i64 %indvars.iv8, i64 %indvars.iv64
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %17, i64 %indvars.iv68, i64 %indvars.iv8, i64 %indvars.iv64
  %83 = load double, double* %82, align 8
  %84 = fmul double %83, 2.000000e+00
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %17, i64 %77, i64 %indvars.iv8, i64 %indvars.iv64
  %86 = load double, double* %85, align 8
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %17, i64 %indvars.iv68, i64 %indvars.iv.next9, i64 %indvars.iv64
  %88 = load double, double* %87, align 8
  %89 = insertelement <2 x double> undef, double %84, i32 0
  %90 = shufflevector <2 x double> %89, <2 x double> undef, <2 x i32> zeroinitializer
  %91 = insertelement <2 x double> undef, double %81, i32 0
  %92 = insertelement <2 x double> %91, double %88, i32 1
  %93 = fsub <2 x double> %92, %90
  %94 = extractelement <2 x double> %93, i32 0
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %17, i64 %indvars.iv68, i64 %78, i64 %indvars.iv64
  %96 = load double, double* %95, align 8
  %97 = insertelement <2 x double> undef, double %94, i32 0
  %98 = insertelement <2 x double> %97, double %96, i32 1
  %99 = insertelement <2 x double> undef, double %86, i32 0
  %100 = shufflevector <2 x double> %99, <2 x double> %93, <2 x i32> <i32 0, i32 3>
  %101 = fadd <2 x double> %100, %98
  %102 = fmul <2 x double> %101, <double 1.250000e-01, double 1.250000e-01>
  %103 = extractelement <2 x double> %102, i32 0
  %104 = extractelement <2 x double> %102, i32 1
  %105 = fadd double %103, %104
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %17, i64 %indvars.iv68, i64 %indvars.iv8, i64 %indvars.iv.next65
  %107 = load double, double* %106, align 8
  %108 = fsub double %107, %84
  %109 = add nsw i64 %indvars.iv64, -1
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %17, i64 %indvars.iv68, i64 %indvars.iv8, i64 %109
  %111 = load double, double* %110, align 8
  %112 = fadd double %108, %111
  %113 = fmul double %112, 1.250000e-01
  %114 = fadd double %105, %113
  %115 = fadd double %83, %114
  %116 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %indvars.iv8, i64 %indvars.iv64
  store double %115, double* %116, align 8
  %117 = icmp slt i64 %indvars.iv.next65, %23
  br i1 %117, label %79, label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %79
  %118 = icmp slt i64 %indvars.iv.next9, %24
  br i1 %118, label %.preheader.us, label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %._crit_edge16.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %.preheader.lr.ph, %.preheader8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %119 = icmp slt i64 %indvars.iv.next69, %25
  br i1 %119, label %.preheader8, label %._crit_edge18.loopexit

._crit_edge18.loopexit:                           ; preds = %._crit_edge17
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %.preheader10
  %120 = add nsw i32 %33, 1
  %121 = icmp slt i32 %120, 501
  br i1 %121, label %.preheader11, label %122

; <label>:122:                                    ; preds = %._crit_edge18
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
  %wide.trip.count35 = zext i32 %13 to i64
  %14 = sext i32 %13 to i64
  %15 = sext i32 %13 to i64
  %wide.trip.count = zext i32 %13 to i64
  %16 = icmp sgt i32 %13, 0
  %17 = load [120 x [120 x double]]*, [120 x [120 x double]]** %4, align 8
  %.promoted = load i32, i32* %5, align 4
  br i1 %16, label %.preheader3.us.preheader, label %._crit_edge6.loopexit29

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %18 = sext i32 %.promoted to i64
  %19 = icmp sgt i32 %13, 0
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge5.us ], [ %18, %.preheader3.us.preheader ]
  br i1 %19, label %.preheader.us.us.preheader, label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %20 = mul nsw i64 %indvars.iv37, %14
  %21 = trunc i64 %20 to i32
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.preheader3.us
  %.lcssa10.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %13, %._crit_edge5.us.loopexit ]
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %22 = icmp slt i64 %indvars.iv.next38, %15
  br i1 %22, label %.preheader3.us, label %._crit_edge6.loopexit

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next34, %._crit_edge.us.us ]
  %23 = trunc i64 %indvars.iv33 to i32
  %24 = add i32 %21, %23
  %25 = mul i32 %24, %13
  %26 = zext i32 %25 to i64
  br label %27

._crit_edge.us.us:                                ; preds = %34
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %._crit_edge5.us.loopexit, label %.preheader.us.us

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
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %17, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %27

._crit_edge6.loopexit29:                          ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %6, align 4
  %39 = add i32 %.promoted, 1
  %40 = icmp sgt i32 %13, %39
  %smax = select i1 %40, i32 %13, i32 %39
  br label %._crit_edge6

._crit_edge6.loopexit:                            ; preds = %._crit_edge5.us
  %41 = trunc i64 %indvars.iv.next38 to i32
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %._crit_edge6.loopexit29
  %.lcssa10.lcssa16.lcssa = phi i32 [ %.promoted14, %._crit_edge6.loopexit29 ], [ %.lcssa10.lcssa.us, %._crit_edge6.loopexit ]
  %.lcssa11 = phi i32 [ %smax, %._crit_edge6.loopexit29 ], [ %41, %._crit_edge6.loopexit ]
  store i32 %.lcssa11, i32* %5, align 4
  store i32 %.lcssa10.lcssa16.lcssa, i32* %6, align 4
  br label %42

; <label>:42:                                     ; preds = %._crit_edge6, %2
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

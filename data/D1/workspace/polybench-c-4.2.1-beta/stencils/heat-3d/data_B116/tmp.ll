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
  tail call void @free(i8* %31) #3
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
  %23 = sext i32 %20 to i64
  %24 = add nsw i64 %23, -1
  %25 = add nsw i64 %21, -1
  %26 = add nsw i64 %22, -1
  %.promoted51 = load i32, i32* %7, align 4
  %27 = zext i32 %11 to i64
  %wide.trip.count = zext i32 %11 to i64
  %28 = icmp sgt i32 %8, 1
  %29 = icmp sgt i32 %15, 1
  %30 = icmp sgt i32 %16, 1
  %31 = icmp sgt i32 %17, 1
  %32 = icmp sgt i32 %9, 1
  %33 = icmp sgt i32 %10, 1
  br label %.preheader11

.preheader11:                                     ; preds = %3, %._crit_edge18
  %34 = phi i32 [ %.promoted51, %3 ], [ %121, %._crit_edge18 ]
  br i1 %28, label %.preheader9.preheader, label %.preheader10

.preheader9.preheader:                            ; preds = %.preheader11
  br label %.preheader9

.preheader10.loopexit:                            ; preds = %._crit_edge13
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader11
  br i1 %29, label %.preheader8.preheader, label %._crit_edge18

.preheader8.preheader:                            ; preds = %.preheader10
  br label %.preheader8

.preheader9:                                      ; preds = %.preheader9.preheader, %._crit_edge13
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge13 ], [ 1, %.preheader9.preheader ]
  br i1 %32, label %.preheader7.lr.ph, label %._crit_edge13

.preheader7.lr.ph:                                ; preds = %.preheader9
  %35 = add nuw nsw i64 %indvars.iv61, 1
  %36 = add nsw i64 %indvars.iv61, -1
  br i1 %33, label %.preheader7.us.preheader, label %._crit_edge13

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge.us
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %._crit_edge.us ], [ 1, %.preheader7.us.preheader ]
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %37 = add nsw i64 %indvars.iv3, -1
  br label %38

; <label>:38:                                     ; preds = %38, %.preheader7.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %38 ], [ 1, %.preheader7.us ]
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %35, i64 %indvars.iv3, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %indvars.iv3, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = fmul double %42, 2.000000e+00
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %36, i64 %indvars.iv3, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %indvars.iv.next4, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = insertelement <2 x double> undef, double %43, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = insertelement <2 x double> undef, double %40, i32 0
  %51 = insertelement <2 x double> %50, double %47, i32 1
  %52 = fsub <2 x double> %51, %49
  %53 = extractelement <2 x double> %52, i32 0
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %37, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = insertelement <2 x double> undef, double %53, i32 0
  %57 = insertelement <2 x double> %56, double %55, i32 1
  %58 = insertelement <2 x double> undef, double %45, i32 0
  %59 = shufflevector <2 x double> %58, <2 x double> %52, <2 x i32> <i32 0, i32 3>
  %60 = fadd <2 x double> %59, %57
  %61 = fmul <2 x double> %60, <double 1.250000e-01, double 1.250000e-01>
  %62 = extractelement <2 x double> %61, i32 0
  %63 = extractelement <2 x double> %61, i32 1
  %64 = fadd double %62, %63
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %indvars.iv3, i64 %indvars.iv.next
  %66 = load double, double* %65, align 8
  %67 = fsub double %66, %43
  %68 = add nsw i64 %indvars.iv, -1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %indvars.iv3, i64 %68
  %70 = load double, double* %69, align 8
  %71 = fadd double %67, %70
  %72 = fmul double %71, 1.250000e-01
  %73 = fadd double %64, %72
  %74 = fadd double %42, %73
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv61, i64 %indvars.iv3, i64 %indvars.iv
  store double %74, double* %75, align 8
  %exitcond2 = icmp eq i64 %indvars.iv.next, %27
  br i1 %exitcond2, label %._crit_edge.us, label %38

._crit_edge.us:                                   ; preds = %38
  %exitcond = icmp eq i64 %indvars.iv.next4, %wide.trip.count
  br i1 %exitcond, label %._crit_edge13.loopexit, label %.preheader7.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.preheader7.lr.ph, %.preheader9
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %76 = icmp slt i64 %indvars.iv.next62, %14
  br i1 %76, label %.preheader9, label %.preheader10.loopexit

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge17
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge17 ], [ 1, %.preheader8.preheader ]
  br i1 %30, label %.preheader.lr.ph, label %._crit_edge17

.preheader.lr.ph:                                 ; preds = %.preheader8
  %77 = add nuw nsw i64 %indvars.iv68, 1
  %78 = add nsw i64 %indvars.iv68, -1
  br i1 %31, label %.preheader.us.preheader, label %._crit_edge17

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge16.us
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge16.us ], [ 1, %.preheader.us.preheader ]
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %79 = add nsw i64 %indvars.iv6, -1
  br label %80

; <label>:80:                                     ; preds = %80, %.preheader.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %80 ], [ 1, %.preheader.us ]
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %77, i64 %indvars.iv6, i64 %indvars.iv64
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %indvars.iv6, i64 %indvars.iv64
  %84 = load double, double* %83, align 8
  %85 = fmul double %84, 2.000000e+00
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %78, i64 %indvars.iv6, i64 %indvars.iv64
  %87 = load double, double* %86, align 8
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %indvars.iv.next7, i64 %indvars.iv64
  %89 = load double, double* %88, align 8
  %90 = insertelement <2 x double> undef, double %85, i32 0
  %91 = shufflevector <2 x double> %90, <2 x double> undef, <2 x i32> zeroinitializer
  %92 = insertelement <2 x double> undef, double %82, i32 0
  %93 = insertelement <2 x double> %92, double %89, i32 1
  %94 = fsub <2 x double> %93, %91
  %95 = extractelement <2 x double> %94, i32 0
  %96 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %79, i64 %indvars.iv64
  %97 = load double, double* %96, align 8
  %98 = insertelement <2 x double> undef, double %95, i32 0
  %99 = insertelement <2 x double> %98, double %97, i32 1
  %100 = insertelement <2 x double> undef, double %87, i32 0
  %101 = shufflevector <2 x double> %100, <2 x double> %94, <2 x i32> <i32 0, i32 3>
  %102 = fadd <2 x double> %101, %99
  %103 = fmul <2 x double> %102, <double 1.250000e-01, double 1.250000e-01>
  %104 = extractelement <2 x double> %103, i32 0
  %105 = extractelement <2 x double> %103, i32 1
  %106 = fadd double %104, %105
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %107 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %indvars.iv6, i64 %indvars.iv.next65
  %108 = load double, double* %107, align 8
  %109 = fsub double %108, %85
  %110 = add nsw i64 %indvars.iv64, -1
  %111 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %indvars.iv6, i64 %110
  %112 = load double, double* %111, align 8
  %113 = fadd double %109, %112
  %114 = fmul double %113, 1.250000e-01
  %115 = fadd double %106, %114
  %116 = fadd double %84, %115
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %indvars.iv68, i64 %indvars.iv6, i64 %indvars.iv64
  store double %116, double* %117, align 8
  %118 = icmp slt i64 %indvars.iv.next65, %24
  br i1 %118, label %80, label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %80
  %119 = icmp slt i64 %indvars.iv.next7, %25
  br i1 %119, label %.preheader.us, label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %._crit_edge16.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %.preheader.lr.ph, %.preheader8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %120 = icmp slt i64 %indvars.iv.next69, %26
  br i1 %120, label %.preheader8, label %._crit_edge18.loopexit

._crit_edge18.loopexit:                           ; preds = %._crit_edge17
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %.preheader10
  %121 = add nsw i32 %34, 1
  %122 = icmp slt i32 %121, 501
  br i1 %122, label %.preheader11, label %123

; <label>:123:                                    ; preds = %._crit_edge18
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
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
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
  %indvars.iv37 = phi i64 [ %18, %.preheader3.us.preheader ], [ %indvars.iv.next38, %._crit_edge5.us ]
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
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #4
  br label %34

; <label>:34:                                     ; preds = %32, %27
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %17, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #4
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
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %45) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

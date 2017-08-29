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
  br i1 %9, label %.preheader3.lr.ph, label %39

.preheader3.lr.ph:                                ; preds = %3
  %10 = load i32, i32* %4, align 4
  %11 = zext i32 %10 to i64
  %12 = icmp sgt i32 %10, 0
  %13 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %14 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %.promoted = load i32, i32* %7, align 4
  br i1 %12, label %.preheader3.us.preheader, label %._crit_edge6.loopexit29

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %15 = sitofp i32 %10 to double
  %16 = icmp sgt i32 %10, 0
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %17 = phi i32 [ %20, %._crit_edge5.us ], [ %.promoted, %.preheader3.us.preheader ]
  %18 = sext i32 %17 to i64
  %19 = sext i32 %17 to i64
  br i1 %16, label %.preheader.us.us.preheader, label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.preheader3.us
  %.lcssa10.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %10, %._crit_edge5.us.loopexit ]
  %20 = add nsw i32 %17, 1
  %21 = icmp slt i32 %20, %10
  br i1 %21, label %.preheader3.us, label %._crit_edge6.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %22 = phi i32 [ %25, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %23 = sext i32 %22 to i64
  %24 = sext i32 %22 to i64
  br label %27

._crit_edge.us.us:                                ; preds = %27
  %25 = add nsw i32 %22, 1
  %26 = icmp slt i32 %25, %10
  br i1 %26, label %.preheader.us.us, label %._crit_edge5.us.loopexit

; <label>:27:                                     ; preds = %27, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %27 ], [ 0, %.preheader.us.us ]
  %28 = trunc i64 %indvars.iv to i32
  %29 = sub i32 %10, %28
  %30 = add i32 %29, %17
  %31 = add i32 %30, %22
  %32 = sitofp i32 %31 to double
  %33 = fmul double %32, 1.000000e+01
  %34 = fdiv double %33, %15
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %18, i64 %23, i64 %indvars.iv
  store double %34, double* %35, align 8
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %14, i64 %19, i64 %24, i64 %indvars.iv
  store double %34, double* %36, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %11
  br i1 %exitcond, label %._crit_edge.us.us, label %27

._crit_edge6.loopexit29:                          ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %8, align 4
  %37 = add i32 %.promoted, 1
  %38 = icmp sgt i32 %10, %37
  %smax = select i1 %38, i32 %10, i32 %37
  br label %._crit_edge6

._crit_edge6.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %._crit_edge6.loopexit29
  %.lcssa10.lcssa16.lcssa = phi i32 [ %.promoted14, %._crit_edge6.loopexit29 ], [ %.lcssa10.lcssa.us, %._crit_edge6.loopexit ]
  %.lcssa11 = phi i32 [ %smax, %._crit_edge6.loopexit29 ], [ %20, %._crit_edge6.loopexit ]
  store i32 %.lcssa11, i32* %7, align 4
  store i32 %.lcssa10.lcssa16.lcssa, i32* %8, align 4
  br label %39

; <label>:39:                                     ; preds = %._crit_edge6, %3
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
  %26 = zext i32 %11 to i64
  %27 = icmp sgt i32 %8, 1
  %28 = icmp sgt i32 %15, 1
  %29 = icmp sgt i32 %16, 1
  %30 = icmp sgt i32 %17, 1
  %31 = icmp sgt i32 %9, 1
  %32 = icmp sgt i32 %10, 1
  br label %.preheader11

.preheader11:                                     ; preds = %3, %._crit_edge18
  %33 = phi i32 [ %.promoted51, %3 ], [ %127, %._crit_edge18 ]
  br i1 %27, label %.preheader9.preheader, label %.preheader10

.preheader9.preheader:                            ; preds = %.preheader11
  br label %.preheader9

.preheader10.loopexit:                            ; preds = %._crit_edge13
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader11
  br i1 %28, label %.preheader8.preheader, label %._crit_edge18

.preheader8.preheader:                            ; preds = %.preheader10
  br label %.preheader8

.preheader9:                                      ; preds = %.preheader9.preheader, %._crit_edge13
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge13 ], [ 1, %.preheader9.preheader ]
  br i1 %31, label %.preheader7.lr.ph, label %._crit_edge13

.preheader7.lr.ph:                                ; preds = %.preheader9
  %34 = add nuw nsw i64 %indvars.iv61, 1
  %35 = add nsw i64 %indvars.iv61, -1
  br i1 %32, label %.preheader7.us.preheader, label %._crit_edge13

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge.us
  %36 = phi i32 [ %77, %._crit_edge.us ], [ 1, %.preheader7.us.preheader ]
  %37 = sext i32 %36 to i64
  %38 = add nuw nsw i32 %36, 1
  %39 = sext i32 %38 to i64
  %40 = add nsw i32 %36, -1
  %41 = sext i32 %40 to i64
  br label %42

; <label>:42:                                     ; preds = %42, %.preheader7.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %42 ], [ 1, %.preheader7.us ]
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %34, i64 %37, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %37, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, 2.000000e+00
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %35, i64 %37, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %39, i64 %indvars.iv
  %51 = load double, double* %50, align 8
  %52 = insertelement <2 x double> undef, double %47, i32 0
  %53 = shufflevector <2 x double> %52, <2 x double> undef, <2 x i32> zeroinitializer
  %54 = insertelement <2 x double> undef, double %44, i32 0
  %55 = insertelement <2 x double> %54, double %51, i32 1
  %56 = fsub <2 x double> %55, %53
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %41, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = insertelement <2 x double> undef, double %49, i32 0
  %60 = insertelement <2 x double> %59, double %58, i32 1
  %61 = fadd <2 x double> %56, %60
  %62 = fmul <2 x double> %61, <double 1.250000e-01, double 1.250000e-01>
  %63 = extractelement <2 x double> %62, i32 0
  %64 = extractelement <2 x double> %62, i32 1
  %65 = fadd double %63, %64
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %37, i64 %indvars.iv.next
  %67 = load double, double* %66, align 8
  %68 = fsub double %67, %47
  %69 = add nsw i64 %indvars.iv, -1
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %37, i64 %69
  %71 = load double, double* %70, align 8
  %72 = fadd double %68, %71
  %73 = fmul double %72, 1.250000e-01
  %74 = fadd double %73, %65
  %75 = fadd double %46, %74
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv61, i64 %37, i64 %indvars.iv
  store double %75, double* %76, align 8
  %exitcond71 = icmp eq i64 %indvars.iv.next, %26
  br i1 %exitcond71, label %._crit_edge.us, label %42

._crit_edge.us:                                   ; preds = %42
  %77 = add nsw i32 %36, 1
  %78 = icmp slt i32 %77, %11
  br i1 %78, label %.preheader7.us, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.preheader7.lr.ph, %.preheader9
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %79 = icmp slt i64 %indvars.iv.next62, %14
  br i1 %79, label %.preheader9, label %.preheader10.loopexit

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge17
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge17 ], [ 1, %.preheader8.preheader ]
  br i1 %29, label %.preheader.lr.ph, label %._crit_edge17

.preheader.lr.ph:                                 ; preds = %.preheader8
  %80 = add nuw nsw i64 %indvars.iv68, 1
  %81 = add nsw i64 %indvars.iv68, -1
  br i1 %30, label %.preheader.us.preheader, label %._crit_edge17

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge16.us
  %82 = phi i32 [ %124, %._crit_edge16.us ], [ 1, %.preheader.us.preheader ]
  %83 = sext i32 %82 to i64
  %84 = add nuw nsw i32 %82, 1
  %85 = sext i32 %84 to i64
  %86 = add nsw i32 %82, -1
  %87 = sext i32 %86 to i64
  br label %88

; <label>:88:                                     ; preds = %88, %.preheader.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %88 ], [ 1, %.preheader.us ]
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %80, i64 %83, i64 %indvars.iv64
  %90 = load double, double* %89, align 8
  %91 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %83, i64 %indvars.iv64
  %92 = load double, double* %91, align 8
  %93 = fmul double %92, 2.000000e+00
  %94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %81, i64 %83, i64 %indvars.iv64
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %85, i64 %indvars.iv64
  %97 = load double, double* %96, align 8
  %98 = insertelement <2 x double> undef, double %93, i32 0
  %99 = shufflevector <2 x double> %98, <2 x double> undef, <2 x i32> zeroinitializer
  %100 = insertelement <2 x double> undef, double %90, i32 0
  %101 = insertelement <2 x double> %100, double %97, i32 1
  %102 = fsub <2 x double> %101, %99
  %103 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %87, i64 %indvars.iv64
  %104 = load double, double* %103, align 8
  %105 = insertelement <2 x double> undef, double %95, i32 0
  %106 = insertelement <2 x double> %105, double %104, i32 1
  %107 = fadd <2 x double> %102, %106
  %108 = fmul <2 x double> %107, <double 1.250000e-01, double 1.250000e-01>
  %109 = extractelement <2 x double> %108, i32 0
  %110 = extractelement <2 x double> %108, i32 1
  %111 = fadd double %109, %110
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %112 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %83, i64 %indvars.iv.next65
  %113 = load double, double* %112, align 8
  %114 = fsub double %113, %93
  %115 = add nsw i64 %indvars.iv64, -1
  %116 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %83, i64 %115
  %117 = load double, double* %116, align 8
  %118 = fadd double %114, %117
  %119 = fmul double %118, 1.250000e-01
  %120 = fadd double %119, %111
  %121 = fadd double %92, %120
  %122 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %indvars.iv68, i64 %83, i64 %indvars.iv64
  store double %121, double* %122, align 8
  %123 = icmp slt i64 %indvars.iv.next65, %23
  br i1 %123, label %88, label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %88
  %124 = add nsw i32 %82, 1
  %125 = icmp slt i32 %124, %24
  br i1 %125, label %.preheader.us, label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %._crit_edge16.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %.preheader.lr.ph, %.preheader8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %126 = icmp slt i64 %indvars.iv.next69, %25
  br i1 %126, label %.preheader8, label %._crit_edge18.loopexit

._crit_edge18.loopexit:                           ; preds = %._crit_edge17
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %.preheader10
  %127 = add nsw i32 %33, 1
  %128 = icmp slt i32 %127, 501
  br i1 %128, label %.preheader11, label %129

; <label>:129:                                    ; preds = %._crit_edge18
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
  br i1 %12, label %.preheader3.lr.ph, label %44

.preheader3.lr.ph:                                ; preds = %2
  %13 = load i32, i32* %3, align 4
  %14 = zext i32 %13 to i64
  %15 = icmp sgt i32 %13, 0
  %16 = load [120 x [120 x double]]*, [120 x [120 x double]]** %4, align 8
  %.promoted = load i32, i32* %5, align 4
  br i1 %15, label %.preheader3.us.preheader, label %._crit_edge6.loopexit29

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %17 = icmp sgt i32 %13, 0
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %18 = phi i32 [ %21, %._crit_edge5.us ], [ %.promoted, %.preheader3.us.preheader ]
  %19 = sext i32 %18 to i64
  br i1 %17, label %.preheader.us.us.preheader, label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %20 = mul nsw i32 %18, %13
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.preheader3.us
  %.lcssa10.lcssa.us = phi i32 [ 0, %.preheader3.us ], [ %13, %._crit_edge5.us.loopexit ]
  %21 = add nsw i32 %18, 1
  %22 = icmp slt i32 %21, %13
  br i1 %22, label %.preheader3.us, label %._crit_edge6.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %23 = phi i32 [ %28, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %24 = sext i32 %23 to i64
  %25 = add i32 %20, %23
  %26 = mul i32 %25, %13
  %27 = zext i32 %26 to i64
  br label %30

._crit_edge.us.us:                                ; preds = %37
  %28 = add nsw i32 %23, 1
  %29 = icmp slt i32 %28, %13
  br i1 %29, label %.preheader.us.us, label %._crit_edge5.us.loopexit

; <label>:30:                                     ; preds = %37, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %37 ], [ 0, %.preheader.us.us ]
  %31 = add i64 %27, %indvars.iv
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 20
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %30
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %36) #5
  br label %37

; <label>:37:                                     ; preds = %35, %30
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %16, i64 %19, i64 %24, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %40) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %14
  br i1 %exitcond, label %._crit_edge.us.us, label %30

._crit_edge6.loopexit29:                          ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %6, align 4
  %42 = add i32 %.promoted, 1
  %43 = icmp sgt i32 %13, %42
  %smax = select i1 %43, i32 %13, i32 %42
  br label %._crit_edge6

._crit_edge6.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %._crit_edge6.loopexit29
  %.lcssa10.lcssa16.lcssa = phi i32 [ %.promoted14, %._crit_edge6.loopexit29 ], [ %.lcssa10.lcssa.us, %._crit_edge6.loopexit ]
  %.lcssa11 = phi i32 [ %smax, %._crit_edge6.loopexit29 ], [ %21, %._crit_edge6.loopexit ]
  store i32 %.lcssa11, i32* %5, align 4
  store i32 %.lcssa10.lcssa16.lcssa, i32* %6, align 4
  br label %44

; <label>:44:                                     ; preds = %._crit_edge6, %2
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %48 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %47) #5
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

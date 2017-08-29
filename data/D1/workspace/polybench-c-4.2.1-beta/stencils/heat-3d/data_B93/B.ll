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
  %.cast = bitcast i8* %8 to [120 x [120 x double]]*
  %13 = bitcast i8* %10 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 %12, [120 x [120 x double]]* %.cast, [120 x [120 x double]]* %13)
  tail call void (...) @polybench_timer_start() #3
  %14 = bitcast [120 x [120 x [120 x double]]]** %6 to [120 x [120 x double]]**
  %15 = load [120 x [120 x double]]*, [120 x [120 x double]]** %14, align 8
  %16 = bitcast [120 x [120 x [120 x double]]]** %7 to [120 x [120 x double]]**
  %17 = load [120 x [120 x double]]*, [120 x [120 x double]]** %16, align 8
  tail call fastcc void @kernel_heat_3d(i32 %12, [120 x [120 x double]]* %15, [120 x [120 x double]]* %17)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %18 = load i32, i32* %3, align 4
  %19 = icmp sgt i32 %18, 42
  br i1 %19, label %20, label %._crit_edge

; <label>:20:                                     ; preds = %2
  %21 = load i8**, i8*** %4, align 8
  %22 = load i8*, i8** %21, align 8
  %strcmpload = load i8, i8* %22, align 1
  %23 = icmp eq i8 %strcmpload, 0
  br i1 %23, label %24, label %._crit_edge

; <label>:24:                                     ; preds = %20
  %25 = load i32, i32* %5, align 4
  %26 = bitcast [120 x [120 x [120 x double]]]** %6 to [120 x [120 x double]]**
  %27 = load [120 x [120 x double]]*, [120 x [120 x double]]** %26, align 8
  tail call fastcc void @print_array(i32 %25, [120 x [120 x double]]* %27)
  br label %._crit_edge

._crit_edge:                                      ; preds = %20, %2, %24
  %28 = bitcast [120 x [120 x [120 x double]]]** %6 to i8**
  %29 = load i8*, i8** %28, align 8
  tail call void @free(i8* %29) #3
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
  br i1 %9, label %.preheader3.lr.ph, label %._crit_edge

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

.preheader3.us:                                   ; preds = %._crit_edge5.us, %.preheader3.us.preheader
  %16 = phi i32 [ %.promoted, %.preheader3.us.preheader ], [ %19, %._crit_edge5.us ]
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
  br label %._crit_edge33

._crit_edge.us.us:                                ; preds = %._crit_edge33
  %24 = add nsw i32 %21, 1
  %25 = icmp slt i32 %24, %10
  br i1 %25, label %.preheader.us.us, label %._crit_edge5.us.loopexit

._crit_edge33:                                    ; preds = %._crit_edge33, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge33 ]
  %26 = trunc i64 %indvars.iv to i32
  %27 = sub i32 %10, %26
  %28 = add i32 %27, %16
  %29 = add i32 %28, %21
  %30 = sitofp i32 %29 to double
  %31 = fmul double %30, 1.000000e+01
  %32 = fdiv double %31, %14
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %12, i64 %17, i64 %22, i64 %indvars.iv
  store double %32, double* %33, align 8
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %13, i64 %18, i64 %23, i64 %indvars.iv
  store double %32, double* %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %._crit_edge33

._crit_edge6.loopexit29:                          ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %8, align 4
  %35 = add i32 %.promoted, 1
  %36 = icmp sgt i32 %10, %35
  %smax = select i1 %36, i32 %10, i32 %35
  br label %._crit_edge6

._crit_edge6.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %._crit_edge6.loopexit29
  %.lcssa10.lcssa16.lcssa = phi i32 [ %.promoted14, %._crit_edge6.loopexit29 ], [ %.lcssa10.lcssa.us, %._crit_edge6.loopexit ]
  %.lcssa11 = phi i32 [ %smax, %._crit_edge6.loopexit29 ], [ %19, %._crit_edge6.loopexit ]
  store i32 %.lcssa11, i32* %7, align 4
  store i32 %.lcssa10.lcssa16.lcssa, i32* %8, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %3, %._crit_edge6
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
  %23 = add nsw i64 %22, -1
  %24 = add nsw i32 %20, -1
  %25 = add nsw i64 %21, -1
  %.promoted51 = load i32, i32* %7, align 4
  %wide.trip.count = zext i32 %11 to i64
  %26 = icmp sgt i32 %8, 1
  %27 = icmp sgt i32 %15, 1
  %28 = icmp sgt i32 %16, 1
  %29 = icmp sgt i32 %17, 1
  %30 = icmp sgt i32 %9, 1
  %31 = icmp sgt i32 %10, 1
  br label %.preheader11

.preheader11:                                     ; preds = %._crit_edge18, %3
  %32 = phi i32 [ %.promoted51, %3 ], [ %116, %._crit_edge18 ]
  br i1 %26, label %.preheader9.preheader, label %.preheader10

.preheader9.preheader:                            ; preds = %.preheader11
  br label %.preheader9

.preheader10.loopexit:                            ; preds = %._crit_edge13
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader11
  br i1 %27, label %.preheader8.preheader, label %._crit_edge18

.preheader8.preheader:                            ; preds = %.preheader10
  br label %.preheader8

.preheader9:                                      ; preds = %.preheader9.preheader, %._crit_edge13
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge13 ], [ 1, %.preheader9.preheader ]
  br i1 %30, label %.preheader7.lr.ph, label %._crit_edge13

.preheader7.lr.ph:                                ; preds = %.preheader9
  %33 = add nuw nsw i64 %indvars.iv61, 1
  %34 = add nsw i64 %indvars.iv61, -1
  br i1 %31, label %.preheader7.us.preheader, label %._crit_edge13

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge.us
  %35 = phi i32 [ %71, %._crit_edge.us ], [ 1, %.preheader7.us.preheader ]
  %36 = sext i32 %35 to i64
  %37 = sext i32 %35 to i64
  %38 = sext i32 %35 to i64
  %39 = add nsw i64 %37, 1
  %40 = add nsw i64 %36, -1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader7.us
  %indvars.iv = phi i64 [ 1, %.preheader7.us ], [ %indvars.iv.next, %._crit_edge ]
  %41 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %33, i64 %38, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %38, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, 2.000000e+00
  %46 = fsub double %42, %45
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %34, i64 %38, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = fadd double %48, %46
  %50 = fmul double %49, 1.250000e-01
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %39, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = fsub double %52, %45
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %40, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fadd double %53, %55
  %57 = fmul double %56, 1.250000e-01
  %58 = fadd double %50, %57
  %59 = add nuw nsw i64 %indvars.iv, 1
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %38, i64 %59
  %61 = load double, double* %60, align 8
  %62 = fsub double %61, %45
  %63 = add nsw i64 %indvars.iv, -1
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %38, i64 %63
  %65 = load double, double* %64, align 8
  %66 = fadd double %62, %65
  %67 = fmul double %66, 1.250000e-01
  %68 = fadd double %58, %67
  %69 = fadd double %44, %68
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv61, i64 %38, i64 %indvars.iv
  store double %69, double* %70, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %71 = add nsw i32 %35, 1
  %72 = icmp slt i32 %71, %11
  br i1 %72, label %.preheader7.us, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.preheader7.lr.ph, %.preheader9
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %73 = icmp slt i64 %indvars.iv.next62, %14
  br i1 %73, label %.preheader9, label %.preheader10.loopexit

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge17
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge17 ], [ 1, %.preheader8.preheader ]
  br i1 %28, label %.preheader.lr.ph, label %._crit_edge17

.preheader.lr.ph:                                 ; preds = %.preheader8
  %74 = add nuw nsw i64 %indvars.iv68, 1
  %75 = add nsw i64 %indvars.iv68, -1
  br i1 %29, label %.preheader.us.preheader, label %._crit_edge17

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge16.us
  %76 = phi i32 [ %113, %._crit_edge16.us ], [ 1, %.preheader.us.preheader ]
  %77 = sext i32 %76 to i64
  %78 = sext i32 %76 to i64
  %79 = sext i32 %76 to i64
  %80 = add nsw i64 %78, 1
  %81 = add nsw i64 %77, -1
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.preheader.us
  %indvars.iv64 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next65, %._crit_edge1 ]
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %74, i64 %79, i64 %indvars.iv64
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %79, i64 %indvars.iv64
  %85 = load double, double* %84, align 8
  %86 = fmul double %85, 2.000000e+00
  %87 = fsub double %83, %86
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %75, i64 %79, i64 %indvars.iv64
  %89 = load double, double* %88, align 8
  %90 = fadd double %89, %87
  %91 = fmul double %90, 1.250000e-01
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %80, i64 %indvars.iv64
  %93 = load double, double* %92, align 8
  %94 = fsub double %93, %86
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %81, i64 %indvars.iv64
  %96 = load double, double* %95, align 8
  %97 = fadd double %94, %96
  %98 = fmul double %97, 1.250000e-01
  %99 = fadd double %91, %98
  %100 = add nuw nsw i64 %indvars.iv64, 1
  %101 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %79, i64 %100
  %102 = load double, double* %101, align 8
  %103 = fsub double %102, %86
  %104 = add nsw i64 %indvars.iv64, -1
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %18, i64 %indvars.iv68, i64 %79, i64 %104
  %106 = load double, double* %105, align 8
  %107 = fadd double %103, %106
  %108 = fmul double %107, 1.250000e-01
  %109 = fadd double %99, %108
  %110 = fadd double %85, %109
  %111 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %19, i64 %indvars.iv68, i64 %79, i64 %indvars.iv64
  store double %110, double* %111, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %112 = icmp slt i64 %indvars.iv.next65, %23
  br i1 %112, label %._crit_edge1, label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge1
  %113 = add nsw i32 %76, 1
  %114 = icmp slt i32 %113, %24
  br i1 %114, label %.preheader.us, label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %._crit_edge16.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %.preheader.lr.ph, %.preheader8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %115 = icmp slt i64 %indvars.iv.next69, %25
  br i1 %115, label %.preheader8, label %._crit_edge18.loopexit

._crit_edge18.loopexit:                           ; preds = %._crit_edge17
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %.preheader10
  %116 = add nsw i32 %32, 1
  %117 = icmp slt i32 %116, 501
  br i1 %117, label %.preheader11, label %118

; <label>:118:                                    ; preds = %._crit_edge18
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
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  store i32 0, i32* %5, align 4
  %11 = load i32, i32* %3, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %.preheader3.lr.ph, label %._crit_edge

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

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %22 = phi i32 [ 0, %.preheader.us.us.preheader ], [ %27, %._crit_edge.us.us ]
  %23 = sext i32 %22 to i64
  %24 = add i32 %19, %22
  %25 = mul i32 %24, %13
  %26 = zext i32 %25 to i64
  br label %._crit_edge34

._crit_edge.us.us:                                ; preds = %._crit_edge33
  %27 = add nsw i32 %22, 1
  %28 = icmp slt i32 %27, %13
  br i1 %28, label %.preheader.us.us, label %._crit_edge5.us.loopexit

._crit_edge34:                                    ; preds = %._crit_edge33, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge33 ]
  %29 = add i64 %26, %indvars.iv
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 20
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %._crit_edge33

; <label>:33:                                     ; preds = %._crit_edge34
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %34) #4
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge34, %33
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %15, i64 %18, i64 %23, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %._crit_edge34

._crit_edge6.loopexit29:                          ; preds = %.preheader3.lr.ph
  %.promoted14 = load i32, i32* %6, align 4
  %39 = add i32 %.promoted, 1
  %40 = icmp sgt i32 %13, %39
  %smax = select i1 %40, i32 %13, i32 %39
  br label %._crit_edge6

._crit_edge6.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %._crit_edge6.loopexit29
  %.lcssa10.lcssa16.lcssa = phi i32 [ %.promoted14, %._crit_edge6.loopexit29 ], [ %.lcssa10.lcssa.us, %._crit_edge6.loopexit ]
  %.lcssa11 = phi i32 [ %smax, %._crit_edge6.loopexit29 ], [ %20, %._crit_edge6.loopexit ]
  store i32 %.lcssa11, i32* %5, align 4
  store i32 %.lcssa10.lcssa16.lcssa, i32* %6, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %2, %._crit_edge6
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %43) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

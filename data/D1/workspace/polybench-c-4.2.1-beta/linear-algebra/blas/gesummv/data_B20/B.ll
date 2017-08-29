; ModuleID = 'A.ll'
source_filename = "gesummv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca [1300 x [1300 x double]]*, align 8
  %9 = alloca [1300 x [1300 x double]]*, align 8
  %10 = alloca [1300 x double]*, align 8
  %11 = alloca [1300 x double]*, align 8
  %12 = alloca [1300 x double]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 1300, i32* %5, align 4
  %13 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %14 = bitcast [1300 x [1300 x double]]** %8 to i8**
  store i8* %13, i8** %14, align 8
  %15 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %16 = bitcast [1300 x [1300 x double]]** %9 to i8**
  store i8* %15, i8** %16, align 8
  %17 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %18 = bitcast [1300 x double]** %10 to i8**
  store i8* %17, i8** %18, align 8
  %19 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %20 = bitcast [1300 x double]** %11 to i8**
  store i8* %19, i8** %20, align 8
  %21 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %22 = bitcast [1300 x double]** %12 to i8**
  store i8* %21, i8** %22, align 8
  %23 = load i32, i32* %5, align 4
  %24 = bitcast [1300 x [1300 x double]]** %8 to [1300 x double]**
  %25 = load [1300 x double]*, [1300 x double]** %24, align 8
  %26 = bitcast [1300 x [1300 x double]]** %9 to [1300 x double]**
  %27 = load [1300 x double]*, [1300 x double]** %26, align 8
  %28 = bitcast [1300 x double]** %11 to double**
  %29 = load double*, double** %28, align 8
  call fastcc void @init_array(i32 %23, double* nonnull %6, double* nonnull %7, [1300 x double]* %25, [1300 x double]* %27, double* %29)
  tail call void (...) @polybench_timer_start() #4
  %30 = load i32, i32* %5, align 4
  %31 = load double, double* %6, align 8
  %32 = load double, double* %7, align 8
  %33 = bitcast [1300 x [1300 x double]]** %8 to [1300 x double]**
  %34 = load [1300 x double]*, [1300 x double]** %33, align 8
  %35 = bitcast [1300 x [1300 x double]]** %9 to [1300 x double]**
  %36 = load [1300 x double]*, [1300 x double]** %35, align 8
  %37 = bitcast [1300 x double]** %10 to double**
  %38 = load double*, double** %37, align 8
  %39 = bitcast [1300 x double]** %11 to double**
  %40 = load double*, double** %39, align 8
  %41 = bitcast [1300 x double]** %12 to double**
  %42 = load double*, double** %41, align 8
  tail call fastcc void @kernel_gesummv(i32 %30, double %31, double %32, [1300 x double]* %34, [1300 x double]* %36, double* %38, double* %40, double* %42)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %43 = load i32, i32* %3, align 4
  %44 = icmp sgt i32 %43, 42
  br i1 %44, label %45, label %._crit_edge

; <label>:45:                                     ; preds = %2
  %46 = load i8**, i8*** %4, align 8
  %47 = load i8*, i8** %46, align 8
  %strcmpload = load i8, i8* %47, align 1
  %48 = icmp eq i8 %strcmpload, 0
  br i1 %48, label %49, label %._crit_edge

; <label>:49:                                     ; preds = %45
  %50 = load i32, i32* %5, align 4
  %51 = bitcast [1300 x double]** %12 to double**
  %52 = load double*, double** %51, align 8
  tail call fastcc void @print_array(i32 %50, double* %52)
  br label %._crit_edge

._crit_edge:                                      ; preds = %45, %2, %49
  %53 = bitcast [1300 x double]** %12 to i8**
  %54 = bitcast [1300 x double]** %11 to i8**
  %55 = bitcast [1300 x double]** %10 to i8**
  %56 = bitcast [1300 x [1300 x double]]** %9 to i8**
  %57 = bitcast [1300 x [1300 x double]]** %8 to i8**
  %58 = load i8*, i8** %57, align 8
  tail call void @free(i8* %58) #4
  %59 = load i8*, i8** %56, align 8
  tail call void @free(i8* %59) #4
  %60 = load i8*, i8** %55, align 8
  tail call void @free(i8* %60) #4
  %61 = load i8*, i8** %54, align 8
  tail call void @free(i8* %61) #4
  %62 = load i8*, i8** %53, align 8
  tail call void @free(i8* %62) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture, [1300 x double]*, [1300 x double]*, double*) unnamed_addr #2 {
  %7 = alloca i32, align 4
  %8 = alloca [1300 x double]*, align 8
  %9 = alloca [1300 x double]*, align 8
  %10 = alloca double*, align 8
  %11 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store [1300 x double]* %3, [1300 x double]** %8, align 8
  store [1300 x double]* %4, [1300 x double]** %9, align 8
  store double* %5, double** %10, align 8
  store double 1.500000e+00, double* %1, align 8
  store double 1.200000e+00, double* %2, align 8
  store i32 0, i32* %11, align 4
  %12 = load i32, i32* %7, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %.lr.ph6, label %62

.lr.ph6:                                          ; preds = %6
  %14 = load double*, double** %10, align 8
  %15 = load i32, i32* %7, align 4
  %wide.trip.count = zext i32 %15 to i64
  %16 = sext i32 %15 to i64
  %17 = icmp sgt i32 %15, 0
  %18 = load [1300 x double]*, [1300 x double]** %8, align 8
  %19 = sitofp i32 %15 to double
  %20 = load [1300 x double]*, [1300 x double]** %9, align 8
  %.promoted8 = load i32, i32* %11, align 4
  br i1 %17, label %.lr.ph6.split.us.preheader, label %.lr.ph6.split.preheader

.lr.ph6.split.preheader:                          ; preds = %.lr.ph6
  br label %.lr.ph6.split

.lr.ph6.split.us.preheader:                       ; preds = %.lr.ph6
  %21 = sext i32 %.promoted8 to i64
  %22 = sitofp i32 %15 to double
  %23 = insertelement <2 x double> undef, double %22, i32 0
  %24 = insertelement <2 x double> %23, double %19, i32 1
  br label %.lr.ph6.split.us

.lr.ph6.split.us:                                 ; preds = %.lr.ph6.split.us.preheader, %._crit_edge.us
  %indvars.iv14 = phi i64 [ %21, %.lr.ph6.split.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %25 = phi i32 [ %12, %.lr.ph6.split.us.preheader ], [ %15, %._crit_edge.us ]
  %storemerge4.us = phi i32 [ 0, %.lr.ph6.split.us.preheader ], [ %50, %._crit_edge.us ]
  %26 = srem i32 %storemerge4.us, %25
  %27 = sitofp i32 %26 to double
  %28 = sitofp i32 %25 to double
  %29 = fdiv double %27, %28
  %30 = sext i32 %storemerge4.us to i64
  %31 = getelementptr inbounds double, double* %14, i64 %30
  store double %29, double* %31, align 8
  br label %32

; <label>:32:                                     ; preds = %32, %.lr.ph6.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph6.split.us ], [ %indvars.iv.next, %32 ]
  %33 = mul nsw i64 %indvars.iv14, %indvars.iv
  %34 = add nsw i64 %33, 1
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, %15
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds [1300 x double], [1300 x double]* %18, i64 %indvars.iv14, i64 %indvars.iv
  %39 = add nsw i64 %33, 2
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, %15
  %42 = sitofp i32 %41 to double
  %43 = insertelement <2 x double> undef, double %37, i32 0
  %44 = insertelement <2 x double> %43, double %42, i32 1
  %45 = fdiv <2 x double> %44, %24
  %46 = extractelement <2 x double> %45, i32 0
  %47 = extractelement <2 x double> %45, i32 1
  store double %46, double* %38, align 8
  %48 = getelementptr inbounds [1300 x double], [1300 x double]* %20, i64 %indvars.iv14, i64 %indvars.iv
  store double %47, double* %48, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %32

._crit_edge.us:                                   ; preds = %32
  %indvars.iv.next15 = add nsw i64 %indvars.iv14, 1
  %49 = icmp slt i64 %indvars.iv.next15, %16
  %50 = trunc i64 %indvars.iv.next15 to i32
  br i1 %49, label %.lr.ph6.split.us, label %._crit_edge7.loopexit

.lr.ph6.split:                                    ; preds = %.lr.ph6.split.preheader, %.lr.ph6.split
  %51 = phi i32 [ %59, %.lr.ph6.split ], [ %.promoted8, %.lr.ph6.split.preheader ]
  %52 = phi i32 [ %15, %.lr.ph6.split ], [ %12, %.lr.ph6.split.preheader ]
  %storemerge4 = phi i32 [ %59, %.lr.ph6.split ], [ 0, %.lr.ph6.split.preheader ]
  %53 = srem i32 %storemerge4, %52
  %54 = sitofp i32 %53 to double
  %55 = sitofp i32 %52 to double
  %56 = fdiv double %54, %55
  %57 = sext i32 %storemerge4 to i64
  %58 = getelementptr inbounds double, double* %14, i64 %57
  store double %56, double* %58, align 8
  %59 = add nsw i32 %51, 1
  %60 = icmp slt i32 %59, %15
  br i1 %60, label %.lr.ph6.split, label %._crit_edge7.loopexit19

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  %61 = trunc i64 %indvars.iv.next15 to i32
  br label %._crit_edge7

._crit_edge7.loopexit19:                          ; preds = %.lr.ph6.split
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit19, %._crit_edge7.loopexit
  %.lcssa9 = phi i32 [ %61, %._crit_edge7.loopexit ], [ %59, %._crit_edge7.loopexit19 ]
  store i32 %.lcssa9, i32* %11, align 4
  br label %62

; <label>:62:                                     ; preds = %._crit_edge7, %6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gesummv(i32, double, double, [1300 x double]*, [1300 x double]*, double*, double*, double*) unnamed_addr #2 {
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca [1300 x double]*, align 8
  %13 = alloca [1300 x double]*, align 8
  %14 = alloca double*, align 8
  %15 = alloca double*, align 8
  %16 = alloca double*, align 8
  %17 = alloca i32, align 4
  store i32 %0, i32* %9, align 4
  store double %1, double* %10, align 8
  store double %2, double* %11, align 8
  store [1300 x double]* %3, [1300 x double]** %12, align 8
  store [1300 x double]* %4, [1300 x double]** %13, align 8
  store double* %5, double** %14, align 8
  store double* %6, double** %15, align 8
  store double* %7, double** %16, align 8
  store i32 0, i32* %17, align 4
  %18 = load i32, i32* %9, align 4
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %.lr.ph5, label %77

.lr.ph5:                                          ; preds = %8
  %20 = load double*, double** %14, align 8
  %21 = load double*, double** %16, align 8
  %22 = load i32, i32* %9, align 4
  %23 = sext i32 %22 to i64
  %24 = icmp sgt i32 %22, 0
  %25 = load double, double* %10, align 8
  %26 = load double, double* %11, align 8
  %27 = load [1300 x double]*, [1300 x double]** %12, align 8
  %28 = load double*, double** %15, align 8
  %29 = bitcast double** %14 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = load [1300 x double]*, [1300 x double]** %13, align 8
  %32 = bitcast double** %16 to i64*
  %33 = load i64, i64* %32, align 8
  %.promoted7 = load i32, i32* %17, align 4
  br i1 %24, label %.lr.ph5.split.us.preheader, label %.lr.ph5.split.preheader

.lr.ph5.split.preheader:                          ; preds = %.lr.ph5
  %34 = sext i32 %.promoted7 to i64
  br label %.lr.ph5.split

.lr.ph5.split.us.preheader:                       ; preds = %.lr.ph5
  %35 = load i32, i32* %9, align 4
  %36 = sext i32 %35 to i64
  %37 = sext i32 %.promoted7 to i64
  %38 = sext i32 %22 to i64
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %.lr.ph5.split.us.preheader, %._crit_edge.us
  %indvars.iv13 = phi i64 [ %37, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us ]
  %storemerge3.us = phi i64 [ 0, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us ]
  %sext17 = shl i64 %storemerge3.us, 32
  %39 = ashr exact i64 %sext17, 32
  %40 = getelementptr inbounds double, double* %20, i64 %39
  store double 0.000000e+00, double* %40, align 8
  %41 = getelementptr inbounds double, double* %21, i64 %39
  store double 0.000000e+00, double* %41, align 8
  %sunkaddr20 = shl i64 %indvars.iv13, 3
  %sunkaddr21 = add i64 %30, %sunkaddr20
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to double*
  %sunkaddr24 = shl i64 %indvars.iv13, 3
  %sunkaddr25 = add i64 %33, %sunkaddr24
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to double*
  br label %42

; <label>:42:                                     ; preds = %.lr.ph5.split.us, %42
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %42 ]
  %43 = getelementptr inbounds [1300 x double], [1300 x double]* %27, i64 %indvars.iv13, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds double, double* %28, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = load double, double* %sunkaddr22, align 8
  %49 = fadd double %47, %48
  store double %49, double* %sunkaddr22, align 8
  %50 = getelementptr inbounds [1300 x double], [1300 x double]* %31, i64 %indvars.iv13, i64 %indvars.iv
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds double, double* %28, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = load double, double* %sunkaddr26, align 8
  %56 = fadd double %54, %55
  store double %56, double* %sunkaddr26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %57 = icmp slt i64 %indvars.iv.next, %36
  br i1 %57, label %42, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %42
  %58 = getelementptr inbounds double, double* %20, i64 %indvars.iv13
  %59 = load double, double* %58, align 8
  %60 = fmul double %25, %59
  %61 = getelementptr inbounds double, double* %21, i64 %indvars.iv13
  %62 = load double, double* %61, align 8
  %63 = fmul double %26, %62
  %64 = fadd double %60, %63
  store double %64, double* %61, align 8
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %65 = icmp slt i64 %indvars.iv.next14, %38
  br i1 %65, label %.lr.ph5.split.us, label %._crit_edge6.loopexit

.lr.ph5.split:                                    ; preds = %.lr.ph5.split.preheader, %.lr.ph5.split
  %indvars.iv15 = phi i64 [ %34, %.lr.ph5.split.preheader ], [ %indvars.iv.next16, %.lr.ph5.split ]
  %storemerge3 = phi i64 [ 0, %.lr.ph5.split.preheader ], [ %indvars.iv.next16, %.lr.ph5.split ]
  %sext = shl i64 %storemerge3, 32
  %66 = ashr exact i64 %sext, 32
  %67 = getelementptr inbounds double, double* %20, i64 %66
  store double 0.000000e+00, double* %67, align 8
  %68 = getelementptr inbounds double, double* %21, i64 %66
  store double 0.000000e+00, double* %68, align 8
  %69 = getelementptr inbounds double, double* %20, i64 %indvars.iv15
  %70 = load double, double* %69, align 8
  %71 = fmul double %25, %70
  %72 = getelementptr inbounds double, double* %21, i64 %indvars.iv15
  %73 = load double, double* %72, align 8
  %74 = fmul double %26, %73
  %75 = fadd double %71, %74
  store double %75, double* %72, align 8
  %indvars.iv.next16 = add nsw i64 %indvars.iv15, 1
  %76 = icmp slt i64 %indvars.iv.next16, %23
  br i1 %76, label %.lr.ph5.split, label %._crit_edge6.loopexit28

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge6

._crit_edge6.loopexit28:                          ; preds = %.lr.ph5.split
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit28, %._crit_edge6.loopexit
  %.lcssa8.in = phi i64 [ %indvars.iv.next14, %._crit_edge6.loopexit ], [ %indvars.iv.next16, %._crit_edge6.loopexit28 ]
  %.lcssa8 = trunc i64 %.lcssa8.in to i32
  store i32 %.lcssa8, i32* %17, align 4
  br label %77

; <label>:77:                                     ; preds = %._crit_edge6, %8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca double*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store double* %1, double** %4, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  store i32 0, i32* %5, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph, label %28

.lr.ph:                                           ; preds = %2
  %12 = load double*, double** %4, align 8
  %13 = load i32, i32* %3, align 4
  %.promoted = load i32, i32* %5, align 4
  %14 = sext i32 %.promoted to i64
  %15 = sext i32 %13 to i64
  br label %16

; <label>:16:                                     ; preds = %.lr.ph, %._crit_edge
  %indvars.iv = phi i64 [ %14, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %26, %._crit_edge ]
  %17 = srem i32 %storemerge1, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %16
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %16, %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds double, double* %12, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %25 = icmp slt i64 %indvars.iv.next, %15
  %26 = trunc i64 %indvars.iv.next to i32
  br i1 %25, label %16, label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge
  %27 = trunc i64 %indvars.iv.next to i32
  store i32 %27, i32* %5, align 4
  br label %28

; <label>:28:                                     ; preds = %._crit_edge3, %2
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %31) #5
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

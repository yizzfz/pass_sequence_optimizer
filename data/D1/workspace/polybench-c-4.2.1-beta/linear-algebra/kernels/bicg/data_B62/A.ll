; ModuleID = 'bicg.c'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [2100 x [1900 x double]]*, align 8
  %9 = alloca [1900 x double]*, align 8
  %10 = alloca [2100 x double]*, align 8
  %11 = alloca [1900 x double]*, align 8
  %12 = alloca [2100 x double]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 2100, i32* %6, align 4
  store i32 1900, i32* %7, align 4
  %13 = call i8* @polybench_alloc_data(i64 3990000, i32 8)
  %14 = bitcast i8* %13 to [2100 x [1900 x double]]*
  store [2100 x [1900 x double]]* %14, [2100 x [1900 x double]]** %8, align 8
  %15 = call i8* @polybench_alloc_data(i64 1900, i32 8)
  %16 = bitcast i8* %15 to [1900 x double]*
  store [1900 x double]* %16, [1900 x double]** %9, align 8
  %17 = call i8* @polybench_alloc_data(i64 2100, i32 8)
  %18 = bitcast i8* %17 to [2100 x double]*
  store [2100 x double]* %18, [2100 x double]** %10, align 8
  %19 = call i8* @polybench_alloc_data(i64 1900, i32 8)
  %20 = bitcast i8* %19 to [1900 x double]*
  store [1900 x double]* %20, [1900 x double]** %11, align 8
  %21 = call i8* @polybench_alloc_data(i64 2100, i32 8)
  %22 = bitcast i8* %21 to [2100 x double]*
  store [2100 x double]* %22, [2100 x double]** %12, align 8
  %23 = load i32, i32* %7, align 4
  %24 = load i32, i32* %6, align 4
  %25 = load [2100 x [1900 x double]]*, [2100 x [1900 x double]]** %8, align 8
  %26 = getelementptr inbounds [2100 x [1900 x double]], [2100 x [1900 x double]]* %25, i32 0, i32 0
  %27 = load [2100 x double]*, [2100 x double]** %12, align 8
  %28 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i32 0, i32 0
  %29 = load [1900 x double]*, [1900 x double]** %11, align 8
  %30 = getelementptr inbounds [1900 x double], [1900 x double]* %29, i32 0, i32 0
  call void @init_array(i32 %23, i32 %24, [1900 x double]* %26, double* %28, double* %30)
  call void (...) @polybench_timer_start()
  %31 = load i32, i32* %7, align 4
  %32 = load i32, i32* %6, align 4
  %33 = load [2100 x [1900 x double]]*, [2100 x [1900 x double]]** %8, align 8
  %34 = getelementptr inbounds [2100 x [1900 x double]], [2100 x [1900 x double]]* %33, i32 0, i32 0
  %35 = load [1900 x double]*, [1900 x double]** %9, align 8
  %36 = getelementptr inbounds [1900 x double], [1900 x double]* %35, i32 0, i32 0
  %37 = load [2100 x double]*, [2100 x double]** %10, align 8
  %38 = getelementptr inbounds [2100 x double], [2100 x double]* %37, i32 0, i32 0
  %39 = load [1900 x double]*, [1900 x double]** %11, align 8
  %40 = getelementptr inbounds [1900 x double], [1900 x double]* %39, i32 0, i32 0
  %41 = load [2100 x double]*, [2100 x double]** %12, align 8
  %42 = getelementptr inbounds [2100 x double], [2100 x double]* %41, i32 0, i32 0
  call void @kernel_bicg(i32 %31, i32 %32, [1900 x double]* %34, double* %36, double* %38, double* %40, double* %42)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %43 = load i32, i32* %4, align 4
  %44 = icmp sgt i32 %43, 42
  br i1 %44, label %45, label %58

; <label>:45:                                     ; preds = %2
  %46 = load i8**, i8*** %5, align 8
  %47 = getelementptr inbounds i8*, i8** %46, i64 0
  %48 = load i8*, i8** %47, align 8
  %49 = call i32 @strcmp(i8* %48, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %58, label %51

; <label>:51:                                     ; preds = %45
  %52 = load i32, i32* %7, align 4
  %53 = load i32, i32* %6, align 4
  %54 = load [1900 x double]*, [1900 x double]** %9, align 8
  %55 = getelementptr inbounds [1900 x double], [1900 x double]* %54, i32 0, i32 0
  %56 = load [2100 x double]*, [2100 x double]** %10, align 8
  %57 = getelementptr inbounds [2100 x double], [2100 x double]* %56, i32 0, i32 0
  call void @print_array(i32 %52, i32 %53, double* %55, double* %57)
  br label %58

; <label>:58:                                     ; preds = %51, %45, %2
  %59 = load [2100 x [1900 x double]]*, [2100 x [1900 x double]]** %8, align 8
  %60 = bitcast [2100 x [1900 x double]]* %59 to i8*
  call void @free(i8* %60) #5
  %61 = load [1900 x double]*, [1900 x double]** %9, align 8
  %62 = bitcast [1900 x double]* %61 to i8*
  call void @free(i8* %62) #5
  %63 = load [2100 x double]*, [2100 x double]** %10, align 8
  %64 = bitcast [2100 x double]* %63 to i8*
  call void @free(i8* %64) #5
  %65 = load [1900 x double]*, [1900 x double]** %11, align 8
  %66 = bitcast [1900 x double]* %65 to i8*
  call void @free(i8* %66) #5
  %67 = load [2100 x double]*, [2100 x double]** %12, align 8
  %68 = bitcast [2100 x double]* %67 to i8*
  call void @free(i8* %68) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, [1900 x double]*, double*, double*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [1900 x double]*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store [1900 x double]* %2, [1900 x double]** %8, align 8
  store double* %3, double** %9, align 8
  store double* %4, double** %10, align 8
  store i32 0, i32* %11, align 4
  br label %13

; <label>:13:                                     ; preds = %29, %5
  %14 = load i32, i32* %11, align 4
  %15 = load i32, i32* %6, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %32

; <label>:17:                                     ; preds = %13
  %18 = load i32, i32* %11, align 4
  %19 = load i32, i32* %6, align 4
  %20 = srem i32 %18, %19
  %21 = sitofp i32 %20 to double
  %22 = load i32, i32* %6, align 4
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %21, %23
  %25 = load double*, double** %10, align 8
  %26 = load i32, i32* %11, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds double, double* %25, i64 %27
  store double %24, double* %28, align 8
  br label %29

; <label>:29:                                     ; preds = %17
  %30 = load i32, i32* %11, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %11, align 4
  br label %13

; <label>:32:                                     ; preds = %13
  store i32 0, i32* %11, align 4
  br label %33

; <label>:33:                                     ; preds = %75, %32
  %34 = load i32, i32* %11, align 4
  %35 = load i32, i32* %7, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %78

; <label>:37:                                     ; preds = %33
  %38 = load i32, i32* %11, align 4
  %39 = load i32, i32* %7, align 4
  %40 = srem i32 %38, %39
  %41 = sitofp i32 %40 to double
  %42 = load i32, i32* %7, align 4
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %41, %43
  %45 = load double*, double** %9, align 8
  %46 = load i32, i32* %11, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, double* %45, i64 %47
  store double %44, double* %48, align 8
  store i32 0, i32* %12, align 4
  br label %49

; <label>:49:                                     ; preds = %71, %37
  %50 = load i32, i32* %12, align 4
  %51 = load i32, i32* %6, align 4
  %52 = icmp slt i32 %50, %51
  br i1 %52, label %53, label %74

; <label>:53:                                     ; preds = %49
  %54 = load i32, i32* %11, align 4
  %55 = load i32, i32* %12, align 4
  %56 = add nsw i32 %55, 1
  %57 = mul nsw i32 %54, %56
  %58 = load i32, i32* %7, align 4
  %59 = srem i32 %57, %58
  %60 = sitofp i32 %59 to double
  %61 = load i32, i32* %7, align 4
  %62 = sitofp i32 %61 to double
  %63 = fdiv double %60, %62
  %64 = load [1900 x double]*, [1900 x double]** %8, align 8
  %65 = load i32, i32* %11, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [1900 x double], [1900 x double]* %64, i64 %66
  %68 = load i32, i32* %12, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [1900 x double], [1900 x double]* %67, i64 0, i64 %69
  store double %63, double* %70, align 8
  br label %71

; <label>:71:                                     ; preds = %53
  %72 = load i32, i32* %12, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* %12, align 4
  br label %49

; <label>:74:                                     ; preds = %49
  br label %75

; <label>:75:                                     ; preds = %74
  %76 = load i32, i32* %11, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, i32* %11, align 4
  br label %33

; <label>:78:                                     ; preds = %33
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_bicg(i32, i32, [1900 x double]*, double*, double*, double*, double*) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [1900 x double]*, align 8
  %11 = alloca double*, align 8
  %12 = alloca double*, align 8
  %13 = alloca double*, align 8
  %14 = alloca double*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 %0, i32* %8, align 4
  store i32 %1, i32* %9, align 4
  store [1900 x double]* %2, [1900 x double]** %10, align 8
  store double* %3, double** %11, align 8
  store double* %4, double** %12, align 8
  store double* %5, double** %13, align 8
  store double* %6, double** %14, align 8
  store i32 0, i32* %15, align 4
  br label %17

; <label>:17:                                     ; preds = %26, %7
  %18 = load i32, i32* %15, align 4
  %19 = load i32, i32* %8, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %29

; <label>:21:                                     ; preds = %17
  %22 = load double*, double** %11, align 8
  %23 = load i32, i32* %15, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds double, double* %22, i64 %24
  store double 0.000000e+00, double* %25, align 8
  br label %26

; <label>:26:                                     ; preds = %21
  %27 = load i32, i32* %15, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %15, align 4
  br label %17

; <label>:29:                                     ; preds = %17
  store i32 0, i32* %15, align 4
  br label %30

; <label>:30:                                     ; preds = %96, %29
  %31 = load i32, i32* %15, align 4
  %32 = load i32, i32* %9, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %99

; <label>:34:                                     ; preds = %30
  %35 = load double*, double** %12, align 8
  %36 = load i32, i32* %15, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, double* %35, i64 %37
  store double 0.000000e+00, double* %38, align 8
  store i32 0, i32* %16, align 4
  br label %39

; <label>:39:                                     ; preds = %92, %34
  %40 = load i32, i32* %16, align 4
  %41 = load i32, i32* %8, align 4
  %42 = icmp slt i32 %40, %41
  br i1 %42, label %43, label %95

; <label>:43:                                     ; preds = %39
  %44 = load double*, double** %11, align 8
  %45 = load i32, i32* %16, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double* %44, i64 %46
  %48 = load double, double* %47, align 8
  %49 = load double*, double** %14, align 8
  %50 = load i32, i32* %15, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double* %49, i64 %51
  %53 = load double, double* %52, align 8
  %54 = load [1900 x double]*, [1900 x double]** %10, align 8
  %55 = load i32, i32* %15, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [1900 x double], [1900 x double]* %54, i64 %56
  %58 = load i32, i32* %16, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [1900 x double], [1900 x double]* %57, i64 0, i64 %59
  %61 = load double, double* %60, align 8
  %62 = fmul double %53, %61
  %63 = fadd double %48, %62
  %64 = load double*, double** %11, align 8
  %65 = load i32, i32* %16, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds double, double* %64, i64 %66
  store double %63, double* %67, align 8
  %68 = load double*, double** %12, align 8
  %69 = load i32, i32* %15, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds double, double* %68, i64 %70
  %72 = load double, double* %71, align 8
  %73 = load [1900 x double]*, [1900 x double]** %10, align 8
  %74 = load i32, i32* %15, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [1900 x double], [1900 x double]* %73, i64 %75
  %77 = load i32, i32* %16, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [1900 x double], [1900 x double]* %76, i64 0, i64 %78
  %80 = load double, double* %79, align 8
  %81 = load double*, double** %13, align 8
  %82 = load i32, i32* %16, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds double, double* %81, i64 %83
  %85 = load double, double* %84, align 8
  %86 = fmul double %80, %85
  %87 = fadd double %72, %86
  %88 = load double*, double** %12, align 8
  %89 = load i32, i32* %15, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds double, double* %88, i64 %90
  store double %87, double* %91, align 8
  br label %92

; <label>:92:                                     ; preds = %43
  %93 = load i32, i32* %16, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %16, align 4
  br label %39

; <label>:95:                                     ; preds = %39
  br label %96

; <label>:96:                                     ; preds = %95
  %97 = load i32, i32* %15, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %15, align 4
  br label %30

; <label>:99:                                     ; preds = %30
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, double*, double*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca double*, align 8
  %8 = alloca double*, align 8
  %9 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store double* %2, double** %7, align 8
  store double* %3, double** %8, align 8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %9, align 4
  br label %14

; <label>:14:                                     ; preds = %33, %4
  %15 = load i32, i32* %9, align 4
  %16 = load i32, i32* %5, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %36

; <label>:18:                                     ; preds = %14
  %19 = load i32, i32* %9, align 4
  %20 = srem i32 %19, 20
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %25

; <label>:22:                                     ; preds = %18
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %25

; <label>:25:                                     ; preds = %22, %18
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = load double*, double** %7, align 8
  %28 = load i32, i32* %9, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double, double* %27, i64 %29
  %31 = load double, double* %30, align 8
  %32 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %31)
  br label %33

; <label>:33:                                     ; preds = %25
  %34 = load i32, i32* %9, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %9, align 4
  br label %14

; <label>:36:                                     ; preds = %14
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store i32 0, i32* %9, align 4
  br label %41

; <label>:41:                                     ; preds = %60, %36
  %42 = load i32, i32* %9, align 4
  %43 = load i32, i32* %6, align 4
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %45, label %63

; <label>:45:                                     ; preds = %41
  %46 = load i32, i32* %9, align 4
  %47 = srem i32 %46, 20
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %52

; <label>:49:                                     ; preds = %45
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %52

; <label>:52:                                     ; preds = %49, %45
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %54 = load double*, double** %8, align 8
  %55 = load i32, i32* %9, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, double* %54, i64 %56
  %58 = load double, double* %57, align 8
  %59 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %53, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %58)
  br label %60

; <label>:60:                                     ; preds = %52
  %61 = load i32, i32* %9, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %9, align 4
  br label %41

; <label>:63:                                     ; preds = %41
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %65 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  %66 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %67 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %66, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

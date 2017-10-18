; ModuleID = 'mvt.c'
source_filename = "mvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca [2000 x [2000 x double]]*, align 8
  %8 = alloca [2000 x double]*, align 8
  %9 = alloca [2000 x double]*, align 8
  %10 = alloca [2000 x double]*, align 8
  %11 = alloca [2000 x double]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 2000, i32* %6, align 4
  %12 = call i8* @polybench_alloc_data(i64 4000000, i32 8)
  %13 = bitcast i8* %12 to [2000 x [2000 x double]]*
  store [2000 x [2000 x double]]* %13, [2000 x [2000 x double]]** %7, align 8
  %14 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %15 = bitcast i8* %14 to [2000 x double]*
  store [2000 x double]* %15, [2000 x double]** %8, align 8
  %16 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %17 = bitcast i8* %16 to [2000 x double]*
  store [2000 x double]* %17, [2000 x double]** %9, align 8
  %18 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %19 = bitcast i8* %18 to [2000 x double]*
  store [2000 x double]* %19, [2000 x double]** %10, align 8
  %20 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %21 = bitcast i8* %20 to [2000 x double]*
  store [2000 x double]* %21, [2000 x double]** %11, align 8
  %22 = load i32, i32* %6, align 4
  %23 = load [2000 x double]*, [2000 x double]** %8, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %23, i32 0, i32 0
  %25 = load [2000 x double]*, [2000 x double]** %9, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %25, i32 0, i32 0
  %27 = load [2000 x double]*, [2000 x double]** %10, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %27, i32 0, i32 0
  %29 = load [2000 x double]*, [2000 x double]** %11, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i32 0, i32 0
  %31 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %32 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i32 0, i32 0
  call void @init_array(i32 %22, double* %24, double* %26, double* %28, double* %30, [2000 x double]* %32)
  call void (...) @polybench_timer_start()
  %33 = load i32, i32* %6, align 4
  %34 = load [2000 x double]*, [2000 x double]** %8, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %34, i32 0, i32 0
  %36 = load [2000 x double]*, [2000 x double]** %9, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %36, i32 0, i32 0
  %38 = load [2000 x double]*, [2000 x double]** %10, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i32 0, i32 0
  %40 = load [2000 x double]*, [2000 x double]** %11, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i32 0, i32 0
  %42 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %43 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i32 0, i32 0
  call void @kernel_mvt(i32 %33, double* %35, double* %37, double* %39, double* %41, [2000 x double]* %43)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %44 = load i32, i32* %4, align 4
  %45 = icmp sgt i32 %44, 42
  br i1 %45, label %46, label %58

; <label>:46:                                     ; preds = %2
  %47 = load i8**, i8*** %5, align 8
  %48 = getelementptr inbounds i8*, i8** %47, i64 0
  %49 = load i8*, i8** %48, align 8
  %50 = call i32 @strcmp(i8* %49, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %58, label %52

; <label>:52:                                     ; preds = %46
  %53 = load i32, i32* %6, align 4
  %54 = load [2000 x double]*, [2000 x double]** %8, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %54, i32 0, i32 0
  %56 = load [2000 x double]*, [2000 x double]** %9, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %56, i32 0, i32 0
  call void @print_array(i32 %53, double* %55, double* %57)
  br label %58

; <label>:58:                                     ; preds = %52, %46, %2
  %59 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %60 = bitcast [2000 x [2000 x double]]* %59 to i8*
  call void @free(i8* %60) #5
  %61 = load [2000 x double]*, [2000 x double]** %8, align 8
  %62 = bitcast [2000 x double]* %61 to i8*
  call void @free(i8* %62) #5
  %63 = load [2000 x double]*, [2000 x double]** %9, align 8
  %64 = bitcast [2000 x double]* %63 to i8*
  call void @free(i8* %64) #5
  %65 = load [2000 x double]*, [2000 x double]** %10, align 8
  %66 = bitcast [2000 x double]* %65 to i8*
  call void @free(i8* %66) #5
  %67 = load [2000 x double]*, [2000 x double]** %11, align 8
  %68 = bitcast [2000 x double]* %67 to i8*
  call void @free(i8* %68) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, double*, double*, double*, double*, [2000 x double]*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca double*, align 8
  %12 = alloca [2000 x double]*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store double* %1, double** %8, align 8
  store double* %2, double** %9, align 8
  store double* %3, double** %10, align 8
  store double* %4, double** %11, align 8
  store [2000 x double]* %5, [2000 x double]** %12, align 8
  store i32 0, i32* %13, align 4
  br label %15

; <label>:15:                                     ; preds = %92, %6
  %16 = load i32, i32* %13, align 4
  %17 = load i32, i32* %7, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %95

; <label>:19:                                     ; preds = %15
  %20 = load i32, i32* %13, align 4
  %21 = load i32, i32* %7, align 4
  %22 = srem i32 %20, %21
  %23 = sitofp i32 %22 to double
  %24 = load i32, i32* %7, align 4
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %23, %25
  %27 = load double*, double** %8, align 8
  %28 = load i32, i32* %13, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double, double* %27, i64 %29
  store double %26, double* %30, align 8
  %31 = load i32, i32* %13, align 4
  %32 = add nsw i32 %31, 1
  %33 = load i32, i32* %7, align 4
  %34 = srem i32 %32, %33
  %35 = sitofp i32 %34 to double
  %36 = load i32, i32* %7, align 4
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %35, %37
  %39 = load double*, double** %9, align 8
  %40 = load i32, i32* %13, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double, double* %39, i64 %41
  store double %38, double* %42, align 8
  %43 = load i32, i32* %13, align 4
  %44 = add nsw i32 %43, 3
  %45 = load i32, i32* %7, align 4
  %46 = srem i32 %44, %45
  %47 = sitofp i32 %46 to double
  %48 = load i32, i32* %7, align 4
  %49 = sitofp i32 %48 to double
  %50 = fdiv double %47, %49
  %51 = load double*, double** %10, align 8
  %52 = load i32, i32* %13, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, double* %51, i64 %53
  store double %50, double* %54, align 8
  %55 = load i32, i32* %13, align 4
  %56 = add nsw i32 %55, 4
  %57 = load i32, i32* %7, align 4
  %58 = srem i32 %56, %57
  %59 = sitofp i32 %58 to double
  %60 = load i32, i32* %7, align 4
  %61 = sitofp i32 %60 to double
  %62 = fdiv double %59, %61
  %63 = load double*, double** %11, align 8
  %64 = load i32, i32* %13, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds double, double* %63, i64 %65
  store double %62, double* %66, align 8
  store i32 0, i32* %14, align 4
  br label %67

; <label>:67:                                     ; preds = %88, %19
  %68 = load i32, i32* %14, align 4
  %69 = load i32, i32* %7, align 4
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %71, label %91

; <label>:71:                                     ; preds = %67
  %72 = load i32, i32* %13, align 4
  %73 = load i32, i32* %14, align 4
  %74 = mul nsw i32 %72, %73
  %75 = load i32, i32* %7, align 4
  %76 = srem i32 %74, %75
  %77 = sitofp i32 %76 to double
  %78 = load i32, i32* %7, align 4
  %79 = sitofp i32 %78 to double
  %80 = fdiv double %77, %79
  %81 = load [2000 x double]*, [2000 x double]** %12, align 8
  %82 = load i32, i32* %13, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %83
  %85 = load i32, i32* %14, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %84, i64 0, i64 %86
  store double %80, double* %87, align 8
  br label %88

; <label>:88:                                     ; preds = %71
  %89 = load i32, i32* %14, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, i32* %14, align 4
  br label %67

; <label>:91:                                     ; preds = %67
  br label %92

; <label>:92:                                     ; preds = %91
  %93 = load i32, i32* %13, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %13, align 4
  br label %15

; <label>:95:                                     ; preds = %15
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_mvt(i32, double*, double*, double*, double*, [2000 x double]*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca double*, align 8
  %12 = alloca [2000 x double]*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store double* %1, double** %8, align 8
  store double* %2, double** %9, align 8
  store double* %3, double** %10, align 8
  store double* %4, double** %11, align 8
  store [2000 x double]* %5, [2000 x double]** %12, align 8
  store i32 0, i32* %13, align 4
  br label %15

; <label>:15:                                     ; preds = %53, %6
  %16 = load i32, i32* %13, align 4
  %17 = load i32, i32* %7, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %56

; <label>:19:                                     ; preds = %15
  store i32 0, i32* %14, align 4
  br label %20

; <label>:20:                                     ; preds = %49, %19
  %21 = load i32, i32* %14, align 4
  %22 = load i32, i32* %7, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %52

; <label>:24:                                     ; preds = %20
  %25 = load double*, double** %8, align 8
  %26 = load i32, i32* %13, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds double, double* %25, i64 %27
  %29 = load double, double* %28, align 8
  %30 = load [2000 x double]*, [2000 x double]** %12, align 8
  %31 = load i32, i32* %13, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %32
  %34 = load i32, i32* %14, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 0, i64 %35
  %37 = load double, double* %36, align 8
  %38 = load double*, double** %10, align 8
  %39 = load i32, i32* %14, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds double, double* %38, i64 %40
  %42 = load double, double* %41, align 8
  %43 = fmul double %37, %42
  %44 = fadd double %29, %43
  %45 = load double*, double** %8, align 8
  %46 = load i32, i32* %13, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, double* %45, i64 %47
  store double %44, double* %48, align 8
  br label %49

; <label>:49:                                     ; preds = %24
  %50 = load i32, i32* %14, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %14, align 4
  br label %20

; <label>:52:                                     ; preds = %20
  br label %53

; <label>:53:                                     ; preds = %52
  %54 = load i32, i32* %13, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %13, align 4
  br label %15

; <label>:56:                                     ; preds = %15
  store i32 0, i32* %13, align 4
  br label %57

; <label>:57:                                     ; preds = %95, %56
  %58 = load i32, i32* %13, align 4
  %59 = load i32, i32* %7, align 4
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %61, label %98

; <label>:61:                                     ; preds = %57
  store i32 0, i32* %14, align 4
  br label %62

; <label>:62:                                     ; preds = %91, %61
  %63 = load i32, i32* %14, align 4
  %64 = load i32, i32* %7, align 4
  %65 = icmp slt i32 %63, %64
  br i1 %65, label %66, label %94

; <label>:66:                                     ; preds = %62
  %67 = load double*, double** %9, align 8
  %68 = load i32, i32* %13, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double* %67, i64 %69
  %71 = load double, double* %70, align 8
  %72 = load [2000 x double]*, [2000 x double]** %12, align 8
  %73 = load i32, i32* %14, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %74
  %76 = load i32, i32* %13, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %75, i64 0, i64 %77
  %79 = load double, double* %78, align 8
  %80 = load double*, double** %11, align 8
  %81 = load i32, i32* %14, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds double, double* %80, i64 %82
  %84 = load double, double* %83, align 8
  %85 = fmul double %79, %84
  %86 = fadd double %71, %85
  %87 = load double*, double** %9, align 8
  %88 = load i32, i32* %13, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds double, double* %87, i64 %89
  store double %86, double* %90, align 8
  br label %91

; <label>:91:                                     ; preds = %66
  %92 = load i32, i32* %14, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %14, align 4
  br label %62

; <label>:94:                                     ; preds = %62
  br label %95

; <label>:95:                                     ; preds = %94
  %96 = load i32, i32* %13, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %13, align 4
  br label %57

; <label>:98:                                     ; preds = %57
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*, double*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca double*, align 8
  %6 = alloca double*, align 8
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store double* %1, double** %5, align 8
  store double* %2, double** %6, align 8
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %7, align 4
  br label %12

; <label>:12:                                     ; preds = %31, %3
  %13 = load i32, i32* %7, align 4
  %14 = load i32, i32* %4, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %34

; <label>:16:                                     ; preds = %12
  %17 = load i32, i32* %7, align 4
  %18 = srem i32 %17, 20
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %23

; <label>:20:                                     ; preds = %16
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %23

; <label>:23:                                     ; preds = %20, %16
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = load double*, double** %5, align 8
  %26 = load i32, i32* %7, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds double, double* %25, i64 %27
  %29 = load double, double* %28, align 8
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %29)
  br label %31

; <label>:31:                                     ; preds = %23
  %32 = load i32, i32* %7, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %7, align 4
  br label %12

; <label>:34:                                     ; preds = %12
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0))
  store i32 0, i32* %7, align 4
  br label %39

; <label>:39:                                     ; preds = %58, %34
  %40 = load i32, i32* %7, align 4
  %41 = load i32, i32* %4, align 4
  %42 = icmp slt i32 %40, %41
  br i1 %42, label %43, label %61

; <label>:43:                                     ; preds = %39
  %44 = load i32, i32* %7, align 4
  %45 = srem i32 %44, 20
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %50

; <label>:47:                                     ; preds = %43
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %50

; <label>:50:                                     ; preds = %47, %43
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = load double*, double** %6, align 8
  %53 = load i32, i32* %7, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double, double* %52, i64 %54
  %56 = load double, double* %55, align 8
  %57 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %56)
  br label %58

; <label>:58:                                     ; preds = %50
  %59 = load i32, i32* %7, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %7, align 4
  br label %39

; <label>:61:                                     ; preds = %39
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %63 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %62, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0))
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %65 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i32 0, i32 0))
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

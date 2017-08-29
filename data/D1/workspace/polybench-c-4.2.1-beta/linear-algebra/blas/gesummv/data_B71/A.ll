; ModuleID = 'gesummv.c'
source_filename = "gesummv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca [1300 x [1300 x double]]*, align 8
  %10 = alloca [1300 x [1300 x double]]*, align 8
  %11 = alloca [1300 x double]*, align 8
  %12 = alloca [1300 x double]*, align 8
  %13 = alloca [1300 x double]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1300, i32* %6, align 4
  %14 = call i8* @polybench_alloc_data(i64 1690000, i32 8)
  %15 = bitcast i8* %14 to [1300 x [1300 x double]]*
  store [1300 x [1300 x double]]* %15, [1300 x [1300 x double]]** %9, align 8
  %16 = call i8* @polybench_alloc_data(i64 1690000, i32 8)
  %17 = bitcast i8* %16 to [1300 x [1300 x double]]*
  store [1300 x [1300 x double]]* %17, [1300 x [1300 x double]]** %10, align 8
  %18 = call i8* @polybench_alloc_data(i64 1300, i32 8)
  %19 = bitcast i8* %18 to [1300 x double]*
  store [1300 x double]* %19, [1300 x double]** %11, align 8
  %20 = call i8* @polybench_alloc_data(i64 1300, i32 8)
  %21 = bitcast i8* %20 to [1300 x double]*
  store [1300 x double]* %21, [1300 x double]** %12, align 8
  %22 = call i8* @polybench_alloc_data(i64 1300, i32 8)
  %23 = bitcast i8* %22 to [1300 x double]*
  store [1300 x double]* %23, [1300 x double]** %13, align 8
  %24 = load i32, i32* %6, align 4
  %25 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %9, align 8
  %26 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %25, i32 0, i32 0
  %27 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %10, align 8
  %28 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %27, i32 0, i32 0
  %29 = load [1300 x double]*, [1300 x double]** %12, align 8
  %30 = getelementptr inbounds [1300 x double], [1300 x double]* %29, i32 0, i32 0
  call void @init_array(i32 %24, double* %7, double* %8, [1300 x double]* %26, [1300 x double]* %28, double* %30)
  call void (...) @polybench_timer_start()
  %31 = load i32, i32* %6, align 4
  %32 = load double, double* %7, align 8
  %33 = load double, double* %8, align 8
  %34 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %9, align 8
  %35 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %34, i32 0, i32 0
  %36 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %10, align 8
  %37 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %36, i32 0, i32 0
  %38 = load [1300 x double]*, [1300 x double]** %11, align 8
  %39 = getelementptr inbounds [1300 x double], [1300 x double]* %38, i32 0, i32 0
  %40 = load [1300 x double]*, [1300 x double]** %12, align 8
  %41 = getelementptr inbounds [1300 x double], [1300 x double]* %40, i32 0, i32 0
  %42 = load [1300 x double]*, [1300 x double]** %13, align 8
  %43 = getelementptr inbounds [1300 x double], [1300 x double]* %42, i32 0, i32 0
  call void @kernel_gesummv(i32 %31, double %32, double %33, [1300 x double]* %35, [1300 x double]* %37, double* %39, double* %41, double* %43)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %44 = load i32, i32* %4, align 4
  %45 = icmp sgt i32 %44, 42
  br i1 %45, label %46, label %56

; <label>:46:                                     ; preds = %2
  %47 = load i8**, i8*** %5, align 8
  %48 = getelementptr inbounds i8*, i8** %47, i64 0
  %49 = load i8*, i8** %48, align 8
  %50 = call i32 @strcmp(i8* %49, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %56, label %52

; <label>:52:                                     ; preds = %46
  %53 = load i32, i32* %6, align 4
  %54 = load [1300 x double]*, [1300 x double]** %13, align 8
  %55 = getelementptr inbounds [1300 x double], [1300 x double]* %54, i32 0, i32 0
  call void @print_array(i32 %53, double* %55)
  br label %56

; <label>:56:                                     ; preds = %52, %46, %2
  %57 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %9, align 8
  %58 = bitcast [1300 x [1300 x double]]* %57 to i8*
  call void @free(i8* %58) #5
  %59 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %10, align 8
  %60 = bitcast [1300 x [1300 x double]]* %59 to i8*
  call void @free(i8* %60) #5
  %61 = load [1300 x double]*, [1300 x double]** %11, align 8
  %62 = bitcast [1300 x double]* %61 to i8*
  call void @free(i8* %62) #5
  %63 = load [1300 x double]*, [1300 x double]** %12, align 8
  %64 = bitcast [1300 x double]* %63 to i8*
  call void @free(i8* %64) #5
  %65 = load [1300 x double]*, [1300 x double]** %13, align 8
  %66 = bitcast [1300 x double]* %65 to i8*
  call void @free(i8* %66) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, double*, double*, [1300 x double]*, [1300 x double]*, double*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca [1300 x double]*, align 8
  %11 = alloca [1300 x double]*, align 8
  %12 = alloca double*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store double* %1, double** %8, align 8
  store double* %2, double** %9, align 8
  store [1300 x double]* %3, [1300 x double]** %10, align 8
  store [1300 x double]* %4, [1300 x double]** %11, align 8
  store double* %5, double** %12, align 8
  %15 = load double*, double** %8, align 8
  store double 1.500000e+00, double* %15, align 8
  %16 = load double*, double** %9, align 8
  store double 1.200000e+00, double* %16, align 8
  store i32 0, i32* %13, align 4
  br label %17

; <label>:17:                                     ; preds = %76, %6
  %18 = load i32, i32* %13, align 4
  %19 = load i32, i32* %7, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %79

; <label>:21:                                     ; preds = %17
  %22 = load i32, i32* %13, align 4
  %23 = load i32, i32* %7, align 4
  %24 = srem i32 %22, %23
  %25 = sitofp i32 %24 to double
  %26 = load i32, i32* %7, align 4
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %25, %27
  %29 = load double*, double** %12, align 8
  %30 = load i32, i32* %13, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds double, double* %29, i64 %31
  store double %28, double* %32, align 8
  store i32 0, i32* %14, align 4
  br label %33

; <label>:33:                                     ; preds = %72, %21
  %34 = load i32, i32* %14, align 4
  %35 = load i32, i32* %7, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %75

; <label>:37:                                     ; preds = %33
  %38 = load i32, i32* %13, align 4
  %39 = load i32, i32* %14, align 4
  %40 = mul nsw i32 %38, %39
  %41 = add nsw i32 %40, 1
  %42 = load i32, i32* %7, align 4
  %43 = srem i32 %41, %42
  %44 = sitofp i32 %43 to double
  %45 = load i32, i32* %7, align 4
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %44, %46
  %48 = load [1300 x double]*, [1300 x double]** %10, align 8
  %49 = load i32, i32* %13, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [1300 x double], [1300 x double]* %48, i64 %50
  %52 = load i32, i32* %14, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [1300 x double], [1300 x double]* %51, i64 0, i64 %53
  store double %47, double* %54, align 8
  %55 = load i32, i32* %13, align 4
  %56 = load i32, i32* %14, align 4
  %57 = mul nsw i32 %55, %56
  %58 = add nsw i32 %57, 2
  %59 = load i32, i32* %7, align 4
  %60 = srem i32 %58, %59
  %61 = sitofp i32 %60 to double
  %62 = load i32, i32* %7, align 4
  %63 = sitofp i32 %62 to double
  %64 = fdiv double %61, %63
  %65 = load [1300 x double]*, [1300 x double]** %11, align 8
  %66 = load i32, i32* %13, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [1300 x double], [1300 x double]* %65, i64 %67
  %69 = load i32, i32* %14, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [1300 x double], [1300 x double]* %68, i64 0, i64 %70
  store double %64, double* %71, align 8
  br label %72

; <label>:72:                                     ; preds = %37
  %73 = load i32, i32* %14, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %14, align 4
  br label %33

; <label>:75:                                     ; preds = %33
  br label %76

; <label>:76:                                     ; preds = %75
  %77 = load i32, i32* %13, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %13, align 4
  br label %17

; <label>:79:                                     ; preds = %17
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gesummv(i32, double, double, [1300 x double]*, [1300 x double]*, double*, double*, double*) #0 {
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca [1300 x double]*, align 8
  %13 = alloca [1300 x double]*, align 8
  %14 = alloca double*, align 8
  %15 = alloca double*, align 8
  %16 = alloca double*, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store i32 %0, i32* %9, align 4
  store double %1, double* %10, align 8
  store double %2, double* %11, align 8
  store [1300 x double]* %3, [1300 x double]** %12, align 8
  store [1300 x double]* %4, [1300 x double]** %13, align 8
  store double* %5, double** %14, align 8
  store double* %6, double** %15, align 8
  store double* %7, double** %16, align 8
  store i32 0, i32* %17, align 4
  br label %19

; <label>:19:                                     ; preds = %108, %8
  %20 = load i32, i32* %17, align 4
  %21 = load i32, i32* %9, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %111

; <label>:23:                                     ; preds = %19
  %24 = load double*, double** %14, align 8
  %25 = load i32, i32* %17, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, double* %24, i64 %26
  store double 0.000000e+00, double* %27, align 8
  %28 = load double*, double** %16, align 8
  %29 = load i32, i32* %17, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds double, double* %28, i64 %30
  store double 0.000000e+00, double* %31, align 8
  store i32 0, i32* %18, align 4
  br label %32

; <label>:32:                                     ; preds = %85, %23
  %33 = load i32, i32* %18, align 4
  %34 = load i32, i32* %9, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %88

; <label>:36:                                     ; preds = %32
  %37 = load [1300 x double]*, [1300 x double]** %12, align 8
  %38 = load i32, i32* %17, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1300 x double], [1300 x double]* %37, i64 %39
  %41 = load i32, i32* %18, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [1300 x double], [1300 x double]* %40, i64 0, i64 %42
  %44 = load double, double* %43, align 8
  %45 = load double*, double** %15, align 8
  %46 = load i32, i32* %18, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, double* %45, i64 %47
  %49 = load double, double* %48, align 8
  %50 = fmul double %44, %49
  %51 = load double*, double** %14, align 8
  %52 = load i32, i32* %17, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, double* %51, i64 %53
  %55 = load double, double* %54, align 8
  %56 = fadd double %50, %55
  %57 = load double*, double** %14, align 8
  %58 = load i32, i32* %17, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double* %57, i64 %59
  store double %56, double* %60, align 8
  %61 = load [1300 x double]*, [1300 x double]** %13, align 8
  %62 = load i32, i32* %17, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [1300 x double], [1300 x double]* %61, i64 %63
  %65 = load i32, i32* %18, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [1300 x double], [1300 x double]* %64, i64 0, i64 %66
  %68 = load double, double* %67, align 8
  %69 = load double*, double** %15, align 8
  %70 = load i32, i32* %18, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds double, double* %69, i64 %71
  %73 = load double, double* %72, align 8
  %74 = fmul double %68, %73
  %75 = load double*, double** %16, align 8
  %76 = load i32, i32* %17, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds double, double* %75, i64 %77
  %79 = load double, double* %78, align 8
  %80 = fadd double %74, %79
  %81 = load double*, double** %16, align 8
  %82 = load i32, i32* %17, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds double, double* %81, i64 %83
  store double %80, double* %84, align 8
  br label %85

; <label>:85:                                     ; preds = %36
  %86 = load i32, i32* %18, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %18, align 4
  br label %32

; <label>:88:                                     ; preds = %32
  %89 = load double, double* %10, align 8
  %90 = load double*, double** %14, align 8
  %91 = load i32, i32* %17, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds double, double* %90, i64 %92
  %94 = load double, double* %93, align 8
  %95 = fmul double %89, %94
  %96 = load double, double* %11, align 8
  %97 = load double*, double** %16, align 8
  %98 = load i32, i32* %17, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds double, double* %97, i64 %99
  %101 = load double, double* %100, align 8
  %102 = fmul double %96, %101
  %103 = fadd double %95, %102
  %104 = load double*, double** %16, align 8
  %105 = load i32, i32* %17, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds double, double* %104, i64 %106
  store double %103, double* %107, align 8
  br label %108

; <label>:108:                                    ; preds = %88
  %109 = load i32, i32* %17, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, i32* %17, align 4
  br label %19

; <label>:111:                                    ; preds = %19
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca double*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store double* %1, double** %4, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  br label %10

; <label>:10:                                     ; preds = %29, %2
  %11 = load i32, i32* %5, align 4
  %12 = load i32, i32* %3, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %32

; <label>:14:                                     ; preds = %10
  %15 = load i32, i32* %5, align 4
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %21

; <label>:18:                                     ; preds = %14
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %21

; <label>:21:                                     ; preds = %18, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = load double*, double** %4, align 8
  %24 = load i32, i32* %5, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds double, double* %23, i64 %25
  %27 = load double, double* %26, align 8
  %28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %27)
  br label %29

; <label>:29:                                     ; preds = %21
  %30 = load i32, i32* %5, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %5, align 4
  br label %10

; <label>:32:                                     ; preds = %10
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
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

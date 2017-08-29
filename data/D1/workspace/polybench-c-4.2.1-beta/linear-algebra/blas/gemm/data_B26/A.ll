; ModuleID = 'gemm.c'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
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
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca [1000 x [1100 x double]]*, align 8
  %12 = alloca [1000 x [1200 x double]]*, align 8
  %13 = alloca [1200 x [1100 x double]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1000, i32* %6, align 4
  store i32 1100, i32* %7, align 4
  store i32 1200, i32* %8, align 4
  %14 = call i8* @polybench_alloc_data(i64 1100000, i32 8)
  %15 = bitcast i8* %14 to [1000 x [1100 x double]]*
  store [1000 x [1100 x double]]* %15, [1000 x [1100 x double]]** %11, align 8
  %16 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %17 = bitcast i8* %16 to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %17, [1000 x [1200 x double]]** %12, align 8
  %18 = call i8* @polybench_alloc_data(i64 1320000, i32 8)
  %19 = bitcast i8* %18 to [1200 x [1100 x double]]*
  store [1200 x [1100 x double]]* %19, [1200 x [1100 x double]]** %13, align 8
  %20 = load i32, i32* %6, align 4
  %21 = load i32, i32* %7, align 4
  %22 = load i32, i32* %8, align 4
  %23 = load [1000 x [1100 x double]]*, [1000 x [1100 x double]]** %11, align 8
  %24 = getelementptr inbounds [1000 x [1100 x double]], [1000 x [1100 x double]]* %23, i32 0, i32 0
  %25 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %12, align 8
  %26 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %25, i32 0, i32 0
  %27 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %13, align 8
  %28 = getelementptr inbounds [1200 x [1100 x double]], [1200 x [1100 x double]]* %27, i32 0, i32 0
  call void @init_array(i32 %20, i32 %21, i32 %22, double* %9, double* %10, [1100 x double]* %24, [1200 x double]* %26, [1100 x double]* %28)
  call void (...) @polybench_timer_start()
  %29 = load i32, i32* %6, align 4
  %30 = load i32, i32* %7, align 4
  %31 = load i32, i32* %8, align 4
  %32 = load double, double* %9, align 8
  %33 = load double, double* %10, align 8
  %34 = load [1000 x [1100 x double]]*, [1000 x [1100 x double]]** %11, align 8
  %35 = getelementptr inbounds [1000 x [1100 x double]], [1000 x [1100 x double]]* %34, i32 0, i32 0
  %36 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %12, align 8
  %37 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %36, i32 0, i32 0
  %38 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %13, align 8
  %39 = getelementptr inbounds [1200 x [1100 x double]], [1200 x [1100 x double]]* %38, i32 0, i32 0
  call void @kernel_gemm(i32 %29, i32 %30, i32 %31, double %32, double %33, [1100 x double]* %35, [1200 x double]* %37, [1100 x double]* %39)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %40 = load i32, i32* %4, align 4
  %41 = icmp sgt i32 %40, 42
  br i1 %41, label %42, label %53

; <label>:42:                                     ; preds = %2
  %43 = load i8**, i8*** %5, align 8
  %44 = getelementptr inbounds i8*, i8** %43, i64 0
  %45 = load i8*, i8** %44, align 8
  %46 = call i32 @strcmp(i8* %45, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %53, label %48

; <label>:48:                                     ; preds = %42
  %49 = load i32, i32* %6, align 4
  %50 = load i32, i32* %7, align 4
  %51 = load [1000 x [1100 x double]]*, [1000 x [1100 x double]]** %11, align 8
  %52 = getelementptr inbounds [1000 x [1100 x double]], [1000 x [1100 x double]]* %51, i32 0, i32 0
  call void @print_array(i32 %49, i32 %50, [1100 x double]* %52)
  br label %53

; <label>:53:                                     ; preds = %48, %42, %2
  %54 = load [1000 x [1100 x double]]*, [1000 x [1100 x double]]** %11, align 8
  %55 = bitcast [1000 x [1100 x double]]* %54 to i8*
  call void @free(i8* %55) #5
  %56 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %12, align 8
  %57 = bitcast [1000 x [1200 x double]]* %56 to i8*
  call void @free(i8* %57) #5
  %58 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %13, align 8
  %59 = bitcast [1200 x [1100 x double]]* %58 to i8*
  call void @free(i8* %59) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, i32, double*, double*, [1100 x double]*, [1200 x double]*, [1100 x double]*) #0 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca double*, align 8
  %13 = alloca double*, align 8
  %14 = alloca [1100 x double]*, align 8
  %15 = alloca [1200 x double]*, align 8
  %16 = alloca [1100 x double]*, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store i32 %0, i32* %9, align 4
  store i32 %1, i32* %10, align 4
  store i32 %2, i32* %11, align 4
  store double* %3, double** %12, align 8
  store double* %4, double** %13, align 8
  store [1100 x double]* %5, [1100 x double]** %14, align 8
  store [1200 x double]* %6, [1200 x double]** %15, align 8
  store [1100 x double]* %7, [1100 x double]** %16, align 8
  %19 = load double*, double** %12, align 8
  store double 1.500000e+00, double* %19, align 8
  %20 = load double*, double** %13, align 8
  store double 1.200000e+00, double* %20, align 8
  store i32 0, i32* %17, align 4
  br label %21

; <label>:21:                                     ; preds = %52, %8
  %22 = load i32, i32* %17, align 4
  %23 = load i32, i32* %9, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %55

; <label>:25:                                     ; preds = %21
  store i32 0, i32* %18, align 4
  br label %26

; <label>:26:                                     ; preds = %48, %25
  %27 = load i32, i32* %18, align 4
  %28 = load i32, i32* %10, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %51

; <label>:30:                                     ; preds = %26
  %31 = load i32, i32* %17, align 4
  %32 = load i32, i32* %18, align 4
  %33 = mul nsw i32 %31, %32
  %34 = add nsw i32 %33, 1
  %35 = load i32, i32* %9, align 4
  %36 = srem i32 %34, %35
  %37 = sitofp i32 %36 to double
  %38 = load i32, i32* %9, align 4
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %37, %39
  %41 = load [1100 x double]*, [1100 x double]** %14, align 8
  %42 = load i32, i32* %17, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [1100 x double], [1100 x double]* %41, i64 %43
  %45 = load i32, i32* %18, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [1100 x double], [1100 x double]* %44, i64 0, i64 %46
  store double %40, double* %47, align 8
  br label %48

; <label>:48:                                     ; preds = %30
  %49 = load i32, i32* %18, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %18, align 4
  br label %26

; <label>:51:                                     ; preds = %26
  br label %52

; <label>:52:                                     ; preds = %51
  %53 = load i32, i32* %17, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %17, align 4
  br label %21

; <label>:55:                                     ; preds = %21
  store i32 0, i32* %17, align 4
  br label %56

; <label>:56:                                     ; preds = %87, %55
  %57 = load i32, i32* %17, align 4
  %58 = load i32, i32* %9, align 4
  %59 = icmp slt i32 %57, %58
  br i1 %59, label %60, label %90

; <label>:60:                                     ; preds = %56
  store i32 0, i32* %18, align 4
  br label %61

; <label>:61:                                     ; preds = %83, %60
  %62 = load i32, i32* %18, align 4
  %63 = load i32, i32* %11, align 4
  %64 = icmp slt i32 %62, %63
  br i1 %64, label %65, label %86

; <label>:65:                                     ; preds = %61
  %66 = load i32, i32* %17, align 4
  %67 = load i32, i32* %18, align 4
  %68 = add nsw i32 %67, 1
  %69 = mul nsw i32 %66, %68
  %70 = load i32, i32* %11, align 4
  %71 = srem i32 %69, %70
  %72 = sitofp i32 %71 to double
  %73 = load i32, i32* %11, align 4
  %74 = sitofp i32 %73 to double
  %75 = fdiv double %72, %74
  %76 = load [1200 x double]*, [1200 x double]** %15, align 8
  %77 = load i32, i32* %17, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %76, i64 %78
  %80 = load i32, i32* %18, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %79, i64 0, i64 %81
  store double %75, double* %82, align 8
  br label %83

; <label>:83:                                     ; preds = %65
  %84 = load i32, i32* %18, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %18, align 4
  br label %61

; <label>:86:                                     ; preds = %61
  br label %87

; <label>:87:                                     ; preds = %86
  %88 = load i32, i32* %17, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %17, align 4
  br label %56

; <label>:90:                                     ; preds = %56
  store i32 0, i32* %17, align 4
  br label %91

; <label>:91:                                     ; preds = %122, %90
  %92 = load i32, i32* %17, align 4
  %93 = load i32, i32* %11, align 4
  %94 = icmp slt i32 %92, %93
  br i1 %94, label %95, label %125

; <label>:95:                                     ; preds = %91
  store i32 0, i32* %18, align 4
  br label %96

; <label>:96:                                     ; preds = %118, %95
  %97 = load i32, i32* %18, align 4
  %98 = load i32, i32* %10, align 4
  %99 = icmp slt i32 %97, %98
  br i1 %99, label %100, label %121

; <label>:100:                                    ; preds = %96
  %101 = load i32, i32* %17, align 4
  %102 = load i32, i32* %18, align 4
  %103 = add nsw i32 %102, 2
  %104 = mul nsw i32 %101, %103
  %105 = load i32, i32* %10, align 4
  %106 = srem i32 %104, %105
  %107 = sitofp i32 %106 to double
  %108 = load i32, i32* %10, align 4
  %109 = sitofp i32 %108 to double
  %110 = fdiv double %107, %109
  %111 = load [1100 x double]*, [1100 x double]** %16, align 8
  %112 = load i32, i32* %17, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [1100 x double], [1100 x double]* %111, i64 %113
  %115 = load i32, i32* %18, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [1100 x double], [1100 x double]* %114, i64 0, i64 %116
  store double %110, double* %117, align 8
  br label %118

; <label>:118:                                    ; preds = %100
  %119 = load i32, i32* %18, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, i32* %18, align 4
  br label %96

; <label>:121:                                    ; preds = %96
  br label %122

; <label>:122:                                    ; preds = %121
  %123 = load i32, i32* %17, align 4
  %124 = add nsw i32 %123, 1
  store i32 %124, i32* %17, align 4
  br label %91

; <label>:125:                                    ; preds = %91
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]*, [1200 x double]*, [1100 x double]*) #0 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca [1100 x double]*, align 8
  %15 = alloca [1200 x double]*, align 8
  %16 = alloca [1100 x double]*, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store i32 %0, i32* %9, align 4
  store i32 %1, i32* %10, align 4
  store i32 %2, i32* %11, align 4
  store double %3, double* %12, align 8
  store double %4, double* %13, align 8
  store [1100 x double]* %5, [1100 x double]** %14, align 8
  store [1200 x double]* %6, [1200 x double]** %15, align 8
  store [1100 x double]* %7, [1100 x double]** %16, align 8
  store i32 0, i32* %17, align 4
  br label %20

; <label>:20:                                     ; preds = %90, %8
  %21 = load i32, i32* %17, align 4
  %22 = load i32, i32* %9, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %93

; <label>:24:                                     ; preds = %20
  store i32 0, i32* %18, align 4
  br label %25

; <label>:25:                                     ; preds = %40, %24
  %26 = load i32, i32* %18, align 4
  %27 = load i32, i32* %10, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %43

; <label>:29:                                     ; preds = %25
  %30 = load double, double* %13, align 8
  %31 = load [1100 x double]*, [1100 x double]** %14, align 8
  %32 = load i32, i32* %17, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [1100 x double], [1100 x double]* %31, i64 %33
  %35 = load i32, i32* %18, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %34, i64 0, i64 %36
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %30
  store double %39, double* %37, align 8
  br label %40

; <label>:40:                                     ; preds = %29
  %41 = load i32, i32* %18, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %18, align 4
  br label %25

; <label>:43:                                     ; preds = %25
  store i32 0, i32* %19, align 4
  br label %44

; <label>:44:                                     ; preds = %86, %43
  %45 = load i32, i32* %19, align 4
  %46 = load i32, i32* %11, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %89

; <label>:48:                                     ; preds = %44
  store i32 0, i32* %18, align 4
  br label %49

; <label>:49:                                     ; preds = %82, %48
  %50 = load i32, i32* %18, align 4
  %51 = load i32, i32* %10, align 4
  %52 = icmp slt i32 %50, %51
  br i1 %52, label %53, label %85

; <label>:53:                                     ; preds = %49
  %54 = load double, double* %12, align 8
  %55 = load [1200 x double]*, [1200 x double]** %15, align 8
  %56 = load i32, i32* %17, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %55, i64 %57
  %59 = load i32, i32* %19, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %58, i64 0, i64 %60
  %62 = load double, double* %61, align 8
  %63 = fmul double %54, %62
  %64 = load [1100 x double]*, [1100 x double]** %16, align 8
  %65 = load i32, i32* %19, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [1100 x double], [1100 x double]* %64, i64 %66
  %68 = load i32, i32* %18, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [1100 x double], [1100 x double]* %67, i64 0, i64 %69
  %71 = load double, double* %70, align 8
  %72 = fmul double %63, %71
  %73 = load [1100 x double]*, [1100 x double]** %14, align 8
  %74 = load i32, i32* %17, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [1100 x double], [1100 x double]* %73, i64 %75
  %77 = load i32, i32* %18, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [1100 x double], [1100 x double]* %76, i64 0, i64 %78
  %80 = load double, double* %79, align 8
  %81 = fadd double %80, %72
  store double %81, double* %79, align 8
  br label %82

; <label>:82:                                     ; preds = %53
  %83 = load i32, i32* %18, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %18, align 4
  br label %49

; <label>:85:                                     ; preds = %49
  br label %86

; <label>:86:                                     ; preds = %85
  %87 = load i32, i32* %19, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %19, align 4
  br label %44

; <label>:89:                                     ; preds = %44
  br label %90

; <label>:90:                                     ; preds = %89
  %91 = load i32, i32* %17, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %17, align 4
  br label %20

; <label>:93:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1100 x double]*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [1100 x double]*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store [1100 x double]* %2, [1100 x double]** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %7, align 4
  br label %13

; <label>:13:                                     ; preds = %48, %3
  %14 = load i32, i32* %7, align 4
  %15 = load i32, i32* %4, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %51

; <label>:17:                                     ; preds = %13
  store i32 0, i32* %8, align 4
  br label %18

; <label>:18:                                     ; preds = %44, %17
  %19 = load i32, i32* %8, align 4
  %20 = load i32, i32* %5, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %47

; <label>:22:                                     ; preds = %18
  %23 = load i32, i32* %7, align 4
  %24 = load i32, i32* %4, align 4
  %25 = mul nsw i32 %23, %24
  %26 = load i32, i32* %8, align 4
  %27 = add nsw i32 %25, %26
  %28 = srem i32 %27, 20
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %33

; <label>:30:                                     ; preds = %22
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %33

; <label>:33:                                     ; preds = %30, %22
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = load [1100 x double]*, [1100 x double]** %6, align 8
  %36 = load i32, i32* %7, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [1100 x double], [1100 x double]* %35, i64 %37
  %39 = load i32, i32* %8, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [1100 x double], [1100 x double]* %38, i64 0, i64 %40
  %42 = load double, double* %41, align 8
  %43 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %42)
  br label %44

; <label>:44:                                     ; preds = %33
  %45 = load i32, i32* %8, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %8, align 4
  br label %18

; <label>:47:                                     ; preds = %18
  br label %48

; <label>:48:                                     ; preds = %47
  %49 = load i32, i32* %7, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %7, align 4
  br label %13

; <label>:51:                                     ; preds = %13
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %55 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
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

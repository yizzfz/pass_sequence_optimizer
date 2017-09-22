; ModuleID = 'syr2k.c'
source_filename = "syr2k.c"
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
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca [1200 x [1200 x double]]*, align 8
  %11 = alloca [1200 x [1000 x double]]*, align 8
  %12 = alloca [1200 x [1000 x double]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1200, i32* %6, align 4
  store i32 1000, i32* %7, align 4
  %13 = call i8* @polybench_alloc_data(i64 1440000, i32 8)
  %14 = bitcast i8* %13 to [1200 x [1200 x double]]*
  store [1200 x [1200 x double]]* %14, [1200 x [1200 x double]]** %10, align 8
  %15 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %16 = bitcast i8* %15 to [1200 x [1000 x double]]*
  store [1200 x [1000 x double]]* %16, [1200 x [1000 x double]]** %11, align 8
  %17 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %18 = bitcast i8* %17 to [1200 x [1000 x double]]*
  store [1200 x [1000 x double]]* %18, [1200 x [1000 x double]]** %12, align 8
  %19 = load i32, i32* %6, align 4
  %20 = load i32, i32* %7, align 4
  %21 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %22 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %21, i32 0, i32 0
  %23 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %11, align 8
  %24 = getelementptr inbounds [1200 x [1000 x double]], [1200 x [1000 x double]]* %23, i32 0, i32 0
  %25 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %12, align 8
  %26 = getelementptr inbounds [1200 x [1000 x double]], [1200 x [1000 x double]]* %25, i32 0, i32 0
  call void @init_array(i32 %19, i32 %20, double* %8, double* %9, [1200 x double]* %22, [1000 x double]* %24, [1000 x double]* %26)
  call void (...) @polybench_timer_start()
  %27 = load i32, i32* %6, align 4
  %28 = load i32, i32* %7, align 4
  %29 = load double, double* %8, align 8
  %30 = load double, double* %9, align 8
  %31 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %32 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %31, i32 0, i32 0
  %33 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %11, align 8
  %34 = getelementptr inbounds [1200 x [1000 x double]], [1200 x [1000 x double]]* %33, i32 0, i32 0
  %35 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %12, align 8
  %36 = getelementptr inbounds [1200 x [1000 x double]], [1200 x [1000 x double]]* %35, i32 0, i32 0
  call void @kernel_syr2k(i32 %27, i32 %28, double %29, double %30, [1200 x double]* %32, [1000 x double]* %34, [1000 x double]* %36)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %37 = load i32, i32* %4, align 4
  %38 = icmp sgt i32 %37, 42
  br i1 %38, label %39, label %49

; <label>:39:                                     ; preds = %2
  %40 = load i8**, i8*** %5, align 8
  %41 = getelementptr inbounds i8*, i8** %40, i64 0
  %42 = load i8*, i8** %41, align 8
  %43 = call i32 @strcmp(i8* %42, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %49, label %45

; <label>:45:                                     ; preds = %39
  %46 = load i32, i32* %6, align 4
  %47 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %48 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %47, i32 0, i32 0
  call void @print_array(i32 %46, [1200 x double]* %48)
  br label %49

; <label>:49:                                     ; preds = %45, %39, %2
  %50 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %51 = bitcast [1200 x [1200 x double]]* %50 to i8*
  call void @free(i8* %51) #5
  %52 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %11, align 8
  %53 = bitcast [1200 x [1000 x double]]* %52 to i8*
  call void @free(i8* %53) #5
  %54 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %12, align 8
  %55 = bitcast [1200 x [1000 x double]]* %54 to i8*
  call void @free(i8* %55) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1000 x double]*) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double*, align 8
  %11 = alloca double*, align 8
  %12 = alloca [1200 x double]*, align 8
  %13 = alloca [1000 x double]*, align 8
  %14 = alloca [1000 x double]*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 %0, i32* %8, align 4
  store i32 %1, i32* %9, align 4
  store double* %2, double** %10, align 8
  store double* %3, double** %11, align 8
  store [1200 x double]* %4, [1200 x double]** %12, align 8
  store [1000 x double]* %5, [1000 x double]** %13, align 8
  store [1000 x double]* %6, [1000 x double]** %14, align 8
  %17 = load double*, double** %10, align 8
  store double 1.500000e+00, double* %17, align 8
  %18 = load double*, double** %11, align 8
  store double 1.200000e+00, double* %18, align 8
  store i32 0, i32* %15, align 4
  br label %19

; <label>:19:                                     ; preds = %67, %7
  %20 = load i32, i32* %15, align 4
  %21 = load i32, i32* %8, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %70

; <label>:23:                                     ; preds = %19
  store i32 0, i32* %16, align 4
  br label %24

; <label>:24:                                     ; preds = %63, %23
  %25 = load i32, i32* %16, align 4
  %26 = load i32, i32* %9, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %66

; <label>:28:                                     ; preds = %24
  %29 = load i32, i32* %15, align 4
  %30 = load i32, i32* %16, align 4
  %31 = mul nsw i32 %29, %30
  %32 = add nsw i32 %31, 1
  %33 = load i32, i32* %8, align 4
  %34 = srem i32 %32, %33
  %35 = sitofp i32 %34 to double
  %36 = load i32, i32* %8, align 4
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %35, %37
  %39 = load [1000 x double]*, [1000 x double]** %13, align 8
  %40 = load i32, i32* %15, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %39, i64 %41
  %43 = load i32, i32* %16, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %42, i64 0, i64 %44
  store double %38, double* %45, align 8
  %46 = load i32, i32* %15, align 4
  %47 = load i32, i32* %16, align 4
  %48 = mul nsw i32 %46, %47
  %49 = add nsw i32 %48, 2
  %50 = load i32, i32* %9, align 4
  %51 = srem i32 %49, %50
  %52 = sitofp i32 %51 to double
  %53 = load i32, i32* %9, align 4
  %54 = sitofp i32 %53 to double
  %55 = fdiv double %52, %54
  %56 = load [1000 x double]*, [1000 x double]** %14, align 8
  %57 = load i32, i32* %15, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %56, i64 %58
  %60 = load i32, i32* %16, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %59, i64 0, i64 %61
  store double %55, double* %62, align 8
  br label %63

; <label>:63:                                     ; preds = %28
  %64 = load i32, i32* %16, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %16, align 4
  br label %24

; <label>:66:                                     ; preds = %24
  br label %67

; <label>:67:                                     ; preds = %66
  %68 = load i32, i32* %15, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %15, align 4
  br label %19

; <label>:70:                                     ; preds = %19
  store i32 0, i32* %15, align 4
  br label %71

; <label>:71:                                     ; preds = %102, %70
  %72 = load i32, i32* %15, align 4
  %73 = load i32, i32* %8, align 4
  %74 = icmp slt i32 %72, %73
  br i1 %74, label %75, label %105

; <label>:75:                                     ; preds = %71
  store i32 0, i32* %16, align 4
  br label %76

; <label>:76:                                     ; preds = %98, %75
  %77 = load i32, i32* %16, align 4
  %78 = load i32, i32* %8, align 4
  %79 = icmp slt i32 %77, %78
  br i1 %79, label %80, label %101

; <label>:80:                                     ; preds = %76
  %81 = load i32, i32* %15, align 4
  %82 = load i32, i32* %16, align 4
  %83 = mul nsw i32 %81, %82
  %84 = add nsw i32 %83, 3
  %85 = load i32, i32* %8, align 4
  %86 = srem i32 %84, %85
  %87 = sitofp i32 %86 to double
  %88 = load i32, i32* %9, align 4
  %89 = sitofp i32 %88 to double
  %90 = fdiv double %87, %89
  %91 = load [1200 x double]*, [1200 x double]** %12, align 8
  %92 = load i32, i32* %15, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %91, i64 %93
  %95 = load i32, i32* %16, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %94, i64 0, i64 %96
  store double %90, double* %97, align 8
  br label %98

; <label>:98:                                     ; preds = %80
  %99 = load i32, i32* %16, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %16, align 4
  br label %76

; <label>:101:                                    ; preds = %76
  br label %102

; <label>:102:                                    ; preds = %101
  %103 = load i32, i32* %15, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, i32* %15, align 4
  br label %71

; <label>:105:                                    ; preds = %71
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1000 x double]*) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca [1200 x double]*, align 8
  %13 = alloca [1000 x double]*, align 8
  %14 = alloca [1000 x double]*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 %0, i32* %8, align 4
  store i32 %1, i32* %9, align 4
  store double %2, double* %10, align 8
  store double %3, double* %11, align 8
  store [1200 x double]* %4, [1200 x double]** %12, align 8
  store [1000 x double]* %5, [1000 x double]** %13, align 8
  store [1000 x double]* %6, [1000 x double]** %14, align 8
  store i32 0, i32* %15, align 4
  br label %18

; <label>:18:                                     ; preds = %108, %7
  %19 = load i32, i32* %15, align 4
  %20 = load i32, i32* %8, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %111

; <label>:22:                                     ; preds = %18
  store i32 0, i32* %16, align 4
  br label %23

; <label>:23:                                     ; preds = %38, %22
  %24 = load i32, i32* %16, align 4
  %25 = load i32, i32* %15, align 4
  %26 = icmp sle i32 %24, %25
  br i1 %26, label %27, label %41

; <label>:27:                                     ; preds = %23
  %28 = load double, double* %11, align 8
  %29 = load [1200 x double]*, [1200 x double]** %12, align 8
  %30 = load i32, i32* %15, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %29, i64 %31
  %33 = load i32, i32* %16, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %32, i64 0, i64 %34
  %36 = load double, double* %35, align 8
  %37 = fmul double %36, %28
  store double %37, double* %35, align 8
  br label %38

; <label>:38:                                     ; preds = %27
  %39 = load i32, i32* %16, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %16, align 4
  br label %23

; <label>:41:                                     ; preds = %23
  store i32 0, i32* %17, align 4
  br label %42

; <label>:42:                                     ; preds = %104, %41
  %43 = load i32, i32* %17, align 4
  %44 = load i32, i32* %9, align 4
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %46, label %107

; <label>:46:                                     ; preds = %42
  store i32 0, i32* %16, align 4
  br label %47

; <label>:47:                                     ; preds = %100, %46
  %48 = load i32, i32* %16, align 4
  %49 = load i32, i32* %15, align 4
  %50 = icmp sle i32 %48, %49
  br i1 %50, label %51, label %103

; <label>:51:                                     ; preds = %47
  %52 = load [1000 x double]*, [1000 x double]** %13, align 8
  %53 = load i32, i32* %16, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %52, i64 %54
  %56 = load i32, i32* %17, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %55, i64 0, i64 %57
  %59 = load double, double* %58, align 8
  %60 = load double, double* %10, align 8
  %61 = fmul double %59, %60
  %62 = load [1000 x double]*, [1000 x double]** %14, align 8
  %63 = load i32, i32* %15, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %62, i64 %64
  %66 = load i32, i32* %17, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %65, i64 0, i64 %67
  %69 = load double, double* %68, align 8
  %70 = fmul double %61, %69
  %71 = load [1000 x double]*, [1000 x double]** %14, align 8
  %72 = load i32, i32* %16, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %71, i64 %73
  %75 = load i32, i32* %17, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %74, i64 0, i64 %76
  %78 = load double, double* %77, align 8
  %79 = load double, double* %10, align 8
  %80 = fmul double %78, %79
  %81 = load [1000 x double]*, [1000 x double]** %13, align 8
  %82 = load i32, i32* %15, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %81, i64 %83
  %85 = load i32, i32* %17, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 0, i64 %86
  %88 = load double, double* %87, align 8
  %89 = fmul double %80, %88
  %90 = fadd double %70, %89
  %91 = load [1200 x double]*, [1200 x double]** %12, align 8
  %92 = load i32, i32* %15, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %91, i64 %93
  %95 = load i32, i32* %16, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %94, i64 0, i64 %96
  %98 = load double, double* %97, align 8
  %99 = fadd double %98, %90
  store double %99, double* %97, align 8
  br label %100

; <label>:100:                                    ; preds = %51
  %101 = load i32, i32* %16, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* %16, align 4
  br label %47

; <label>:103:                                    ; preds = %47
  br label %104

; <label>:104:                                    ; preds = %103
  %105 = load i32, i32* %17, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, i32* %17, align 4
  br label %42

; <label>:107:                                    ; preds = %42
  br label %108

; <label>:108:                                    ; preds = %107
  %109 = load i32, i32* %15, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, i32* %15, align 4
  br label %18

; <label>:111:                                    ; preds = %18
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca [1200 x double]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [1200 x double]* %1, [1200 x double]** %4, align 8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  br label %11

; <label>:11:                                     ; preds = %46, %2
  %12 = load i32, i32* %5, align 4
  %13 = load i32, i32* %3, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %49

; <label>:15:                                     ; preds = %11
  store i32 0, i32* %6, align 4
  br label %16

; <label>:16:                                     ; preds = %42, %15
  %17 = load i32, i32* %6, align 4
  %18 = load i32, i32* %3, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %45

; <label>:20:                                     ; preds = %16
  %21 = load i32, i32* %5, align 4
  %22 = load i32, i32* %3, align 4
  %23 = mul nsw i32 %21, %22
  %24 = load i32, i32* %6, align 4
  %25 = add nsw i32 %23, %24
  %26 = srem i32 %25, 20
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %31

; <label>:28:                                     ; preds = %20
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %31

; <label>:31:                                     ; preds = %28, %20
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = load [1200 x double]*, [1200 x double]** %4, align 8
  %34 = load i32, i32* %5, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %33, i64 %35
  %37 = load i32, i32* %6, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %36, i64 0, i64 %38
  %40 = load double, double* %39, align 8
  %41 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %40)
  br label %42

; <label>:42:                                     ; preds = %31
  %43 = load i32, i32* %6, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %6, align 4
  br label %16

; <label>:45:                                     ; preds = %16
  br label %46

; <label>:46:                                     ; preds = %45
  %47 = load i32, i32* %5, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %5, align 4
  br label %11

; <label>:49:                                     ; preds = %11
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
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

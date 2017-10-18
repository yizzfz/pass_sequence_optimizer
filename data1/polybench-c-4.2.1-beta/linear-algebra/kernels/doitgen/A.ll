; ModuleID = 'doitgen.c'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [140 x [160 x double]]*, align 8
  %11 = alloca [160 x double]*, align 8
  %12 = alloca double*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store i32 %2, i32* %9, align 4
  store [140 x [160 x double]]* %3, [140 x [160 x double]]** %10, align 8
  store [160 x double]* %4, [160 x double]** %11, align 8
  store double* %5, double** %12, align 8
  store i32 0, i32* %13, align 4
  br label %17

; <label>:17:                                     ; preds = %103, %6
  %18 = load i32, i32* %13, align 4
  %19 = load i32, i32* %7, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %106

; <label>:21:                                     ; preds = %17
  store i32 0, i32* %14, align 4
  br label %22

; <label>:22:                                     ; preds = %99, %21
  %23 = load i32, i32* %14, align 4
  %24 = load i32, i32* %8, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %102

; <label>:26:                                     ; preds = %22
  store i32 0, i32* %15, align 4
  br label %27

; <label>:27:                                     ; preds = %71, %26
  %28 = load i32, i32* %15, align 4
  %29 = load i32, i32* %9, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %74

; <label>:31:                                     ; preds = %27
  %32 = load double*, double** %12, align 8
  %33 = load i32, i32* %15, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double* %32, i64 %34
  store double 0.000000e+00, double* %35, align 8
  store i32 0, i32* %16, align 4
  br label %36

; <label>:36:                                     ; preds = %67, %31
  %37 = load i32, i32* %16, align 4
  %38 = load i32, i32* %9, align 4
  %39 = icmp slt i32 %37, %38
  br i1 %39, label %40, label %70

; <label>:40:                                     ; preds = %36
  %41 = load [140 x [160 x double]]*, [140 x [160 x double]]** %10, align 8
  %42 = load i32, i32* %13, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %41, i64 %43
  %45 = load i32, i32* %14, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %44, i64 0, i64 %46
  %48 = load i32, i32* %16, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [160 x double], [160 x double]* %47, i64 0, i64 %49
  %51 = load double, double* %50, align 8
  %52 = load [160 x double]*, [160 x double]** %11, align 8
  %53 = load i32, i32* %16, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [160 x double], [160 x double]* %52, i64 %54
  %56 = load i32, i32* %15, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [160 x double], [160 x double]* %55, i64 0, i64 %57
  %59 = load double, double* %58, align 8
  %60 = fmul double %51, %59
  %61 = load double*, double** %12, align 8
  %62 = load i32, i32* %15, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, double* %61, i64 %63
  %65 = load double, double* %64, align 8
  %66 = fadd double %65, %60
  store double %66, double* %64, align 8
  br label %67

; <label>:67:                                     ; preds = %40
  %68 = load i32, i32* %16, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %16, align 4
  br label %36

; <label>:70:                                     ; preds = %36
  br label %71

; <label>:71:                                     ; preds = %70
  %72 = load i32, i32* %15, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* %15, align 4
  br label %27

; <label>:74:                                     ; preds = %27
  store i32 0, i32* %15, align 4
  br label %75

; <label>:75:                                     ; preds = %95, %74
  %76 = load i32, i32* %15, align 4
  %77 = load i32, i32* %9, align 4
  %78 = icmp slt i32 %76, %77
  br i1 %78, label %79, label %98

; <label>:79:                                     ; preds = %75
  %80 = load double*, double** %12, align 8
  %81 = load i32, i32* %15, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds double, double* %80, i64 %82
  %84 = load double, double* %83, align 8
  %85 = load [140 x [160 x double]]*, [140 x [160 x double]]** %10, align 8
  %86 = load i32, i32* %13, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %85, i64 %87
  %89 = load i32, i32* %14, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %88, i64 0, i64 %90
  %92 = load i32, i32* %15, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [160 x double], [160 x double]* %91, i64 0, i64 %93
  store double %84, double* %94, align 8
  br label %95

; <label>:95:                                     ; preds = %79
  %96 = load i32, i32* %15, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %15, align 4
  br label %75

; <label>:98:                                     ; preds = %75
  br label %99

; <label>:99:                                     ; preds = %98
  %100 = load i32, i32* %14, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, i32* %14, align 4
  br label %22

; <label>:102:                                    ; preds = %22
  br label %103

; <label>:103:                                    ; preds = %102
  %104 = load i32, i32* %13, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %13, align 4
  br label %17

; <label>:106:                                    ; preds = %17
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [150 x [140 x [160 x double]]]*, align 8
  %10 = alloca [160 x double]*, align 8
  %11 = alloca [160 x [160 x double]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 150, i32* %6, align 4
  store i32 140, i32* %7, align 4
  store i32 160, i32* %8, align 4
  %12 = call i8* @polybench_alloc_data(i64 3360000, i32 8)
  %13 = bitcast i8* %12 to [150 x [140 x [160 x double]]]*
  store [150 x [140 x [160 x double]]]* %13, [150 x [140 x [160 x double]]]** %9, align 8
  %14 = call i8* @polybench_alloc_data(i64 160, i32 8)
  %15 = bitcast i8* %14 to [160 x double]*
  store [160 x double]* %15, [160 x double]** %10, align 8
  %16 = call i8* @polybench_alloc_data(i64 25600, i32 8)
  %17 = bitcast i8* %16 to [160 x [160 x double]]*
  store [160 x [160 x double]]* %17, [160 x [160 x double]]** %11, align 8
  %18 = load i32, i32* %6, align 4
  %19 = load i32, i32* %7, align 4
  %20 = load i32, i32* %8, align 4
  %21 = load [150 x [140 x [160 x double]]]*, [150 x [140 x [160 x double]]]** %9, align 8
  %22 = getelementptr inbounds [150 x [140 x [160 x double]]], [150 x [140 x [160 x double]]]* %21, i32 0, i32 0
  %23 = load [160 x [160 x double]]*, [160 x [160 x double]]** %11, align 8
  %24 = getelementptr inbounds [160 x [160 x double]], [160 x [160 x double]]* %23, i32 0, i32 0
  call void @init_array(i32 %18, i32 %19, i32 %20, [140 x [160 x double]]* %22, [160 x double]* %24)
  call void (...) @polybench_timer_start()
  %25 = load i32, i32* %6, align 4
  %26 = load i32, i32* %7, align 4
  %27 = load i32, i32* %8, align 4
  %28 = load [150 x [140 x [160 x double]]]*, [150 x [140 x [160 x double]]]** %9, align 8
  %29 = getelementptr inbounds [150 x [140 x [160 x double]]], [150 x [140 x [160 x double]]]* %28, i32 0, i32 0
  %30 = load [160 x [160 x double]]*, [160 x [160 x double]]** %11, align 8
  %31 = getelementptr inbounds [160 x [160 x double]], [160 x [160 x double]]* %30, i32 0, i32 0
  %32 = load [160 x double]*, [160 x double]** %10, align 8
  %33 = getelementptr inbounds [160 x double], [160 x double]* %32, i32 0, i32 0
  call void @kernel_doitgen(i32 %25, i32 %26, i32 %27, [140 x [160 x double]]* %29, [160 x double]* %31, double* %33)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %34 = load i32, i32* %4, align 4
  %35 = icmp sgt i32 %34, 42
  br i1 %35, label %36, label %48

; <label>:36:                                     ; preds = %2
  %37 = load i8**, i8*** %5, align 8
  %38 = getelementptr inbounds i8*, i8** %37, i64 0
  %39 = load i8*, i8** %38, align 8
  %40 = call i32 @strcmp(i8* %39, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %48, label %42

; <label>:42:                                     ; preds = %36
  %43 = load i32, i32* %6, align 4
  %44 = load i32, i32* %7, align 4
  %45 = load i32, i32* %8, align 4
  %46 = load [150 x [140 x [160 x double]]]*, [150 x [140 x [160 x double]]]** %9, align 8
  %47 = getelementptr inbounds [150 x [140 x [160 x double]]], [150 x [140 x [160 x double]]]* %46, i32 0, i32 0
  call void @print_array(i32 %43, i32 %44, i32 %45, [140 x [160 x double]]* %47)
  br label %48

; <label>:48:                                     ; preds = %42, %36, %2
  %49 = load [150 x [140 x [160 x double]]]*, [150 x [140 x [160 x double]]]** %9, align 8
  %50 = bitcast [150 x [140 x [160 x double]]]* %49 to i8*
  call void @free(i8* %50) #5
  %51 = load [160 x double]*, [160 x double]** %10, align 8
  %52 = bitcast [160 x double]* %51 to i8*
  call void @free(i8* %52) #5
  %53 = load [160 x [160 x double]]*, [160 x [160 x double]]** %11, align 8
  %54 = bitcast [160 x [160 x double]]* %53 to i8*
  call void @free(i8* %54) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [140 x [160 x double]]*, align 8
  %10 = alloca [160 x double]*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store [140 x [160 x double]]* %3, [140 x [160 x double]]** %9, align 8
  store [160 x double]* %4, [160 x double]** %10, align 8
  store i32 0, i32* %11, align 4
  br label %14

; <label>:14:                                     ; preds = %58, %5
  %15 = load i32, i32* %11, align 4
  %16 = load i32, i32* %6, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %61

; <label>:18:                                     ; preds = %14
  store i32 0, i32* %12, align 4
  br label %19

; <label>:19:                                     ; preds = %54, %18
  %20 = load i32, i32* %12, align 4
  %21 = load i32, i32* %7, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %57

; <label>:23:                                     ; preds = %19
  store i32 0, i32* %13, align 4
  br label %24

; <label>:24:                                     ; preds = %50, %23
  %25 = load i32, i32* %13, align 4
  %26 = load i32, i32* %8, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %53

; <label>:28:                                     ; preds = %24
  %29 = load i32, i32* %11, align 4
  %30 = load i32, i32* %12, align 4
  %31 = mul nsw i32 %29, %30
  %32 = load i32, i32* %13, align 4
  %33 = add nsw i32 %31, %32
  %34 = load i32, i32* %8, align 4
  %35 = srem i32 %33, %34
  %36 = sitofp i32 %35 to double
  %37 = load i32, i32* %8, align 4
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %36, %38
  %40 = load [140 x [160 x double]]*, [140 x [160 x double]]** %9, align 8
  %41 = load i32, i32* %11, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %40, i64 %42
  %44 = load i32, i32* %12, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %43, i64 0, i64 %45
  %47 = load i32, i32* %13, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [160 x double], [160 x double]* %46, i64 0, i64 %48
  store double %39, double* %49, align 8
  br label %50

; <label>:50:                                     ; preds = %28
  %51 = load i32, i32* %13, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %13, align 4
  br label %24

; <label>:53:                                     ; preds = %24
  br label %54

; <label>:54:                                     ; preds = %53
  %55 = load i32, i32* %12, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %12, align 4
  br label %19

; <label>:57:                                     ; preds = %19
  br label %58

; <label>:58:                                     ; preds = %57
  %59 = load i32, i32* %11, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %11, align 4
  br label %14

; <label>:61:                                     ; preds = %14
  store i32 0, i32* %11, align 4
  br label %62

; <label>:62:                                     ; preds = %92, %61
  %63 = load i32, i32* %11, align 4
  %64 = load i32, i32* %8, align 4
  %65 = icmp slt i32 %63, %64
  br i1 %65, label %66, label %95

; <label>:66:                                     ; preds = %62
  store i32 0, i32* %12, align 4
  br label %67

; <label>:67:                                     ; preds = %88, %66
  %68 = load i32, i32* %12, align 4
  %69 = load i32, i32* %8, align 4
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %71, label %91

; <label>:71:                                     ; preds = %67
  %72 = load i32, i32* %11, align 4
  %73 = load i32, i32* %12, align 4
  %74 = mul nsw i32 %72, %73
  %75 = load i32, i32* %8, align 4
  %76 = srem i32 %74, %75
  %77 = sitofp i32 %76 to double
  %78 = load i32, i32* %8, align 4
  %79 = sitofp i32 %78 to double
  %80 = fdiv double %77, %79
  %81 = load [160 x double]*, [160 x double]** %10, align 8
  %82 = load i32, i32* %11, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [160 x double], [160 x double]* %81, i64 %83
  %85 = load i32, i32* %12, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [160 x double], [160 x double]* %84, i64 0, i64 %86
  store double %80, double* %87, align 8
  br label %88

; <label>:88:                                     ; preds = %71
  %89 = load i32, i32* %12, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, i32* %12, align 4
  br label %67

; <label>:91:                                     ; preds = %67
  br label %92

; <label>:92:                                     ; preds = %91
  %93 = load i32, i32* %11, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %11, align 4
  br label %62

; <label>:95:                                     ; preds = %62
  ret void
}

declare void @polybench_timer_start(...) #1

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, i32, [140 x [160 x double]]*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [140 x [160 x double]]*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store [140 x [160 x double]]* %3, [140 x [160 x double]]** %8, align 8
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %9, align 4
  br label %16

; <label>:16:                                     ; preds = %69, %4
  %17 = load i32, i32* %9, align 4
  %18 = load i32, i32* %5, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %72

; <label>:20:                                     ; preds = %16
  store i32 0, i32* %10, align 4
  br label %21

; <label>:21:                                     ; preds = %65, %20
  %22 = load i32, i32* %10, align 4
  %23 = load i32, i32* %6, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %68

; <label>:25:                                     ; preds = %21
  store i32 0, i32* %11, align 4
  br label %26

; <label>:26:                                     ; preds = %61, %25
  %27 = load i32, i32* %11, align 4
  %28 = load i32, i32* %7, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %64

; <label>:30:                                     ; preds = %26
  %31 = load i32, i32* %9, align 4
  %32 = load i32, i32* %6, align 4
  %33 = mul nsw i32 %31, %32
  %34 = load i32, i32* %7, align 4
  %35 = mul nsw i32 %33, %34
  %36 = load i32, i32* %10, align 4
  %37 = load i32, i32* %7, align 4
  %38 = mul nsw i32 %36, %37
  %39 = add nsw i32 %35, %38
  %40 = load i32, i32* %11, align 4
  %41 = add nsw i32 %39, %40
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %47

; <label>:44:                                     ; preds = %30
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %47

; <label>:47:                                     ; preds = %44, %30
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = load [140 x [160 x double]]*, [140 x [160 x double]]** %8, align 8
  %50 = load i32, i32* %9, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %49, i64 %51
  %53 = load i32, i32* %10, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %52, i64 0, i64 %54
  %56 = load i32, i32* %11, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [160 x double], [160 x double]* %55, i64 0, i64 %57
  %59 = load double, double* %58, align 8
  %60 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %59)
  br label %61

; <label>:61:                                     ; preds = %47
  %62 = load i32, i32* %11, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %11, align 4
  br label %26

; <label>:64:                                     ; preds = %26
  br label %65

; <label>:65:                                     ; preds = %64
  %66 = load i32, i32* %10, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %10, align 4
  br label %21

; <label>:68:                                     ; preds = %21
  br label %69

; <label>:69:                                     ; preds = %68
  %70 = load i32, i32* %9, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %9, align 4
  br label %16

; <label>:72:                                     ; preds = %16
  %73 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %74 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %73, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %76 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %75, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
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

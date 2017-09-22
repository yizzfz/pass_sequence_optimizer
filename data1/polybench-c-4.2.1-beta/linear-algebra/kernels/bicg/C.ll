; ModuleID = 'B.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

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
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_bicg = private constant [16 x i8] c"B.ll:kernel_bicg"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 73744657289, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_bicg = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_bicg = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4464262574321485026, i64 73744657289, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_bicg, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 81480409073, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00main\01B.ll:init_array\01B.ll:kernel_bicg\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_bicg to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

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
  br i1 %44, label %45, label %60

; <label>:45:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %46 = add i64 %pgocount, 1
  store i64 %46, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %47 = load i8**, i8*** %5, align 8
  %48 = getelementptr inbounds i8*, i8** %47, i64 0
  %49 = load i8*, i8** %48, align 8
  %50 = call i32 @strcmp(i8* %49, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %60, label %52

; <label>:52:                                     ; preds = %45
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %53 = add i64 %pgocount1, 1
  store i64 %53, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %54 = load i32, i32* %7, align 4
  %55 = load i32, i32* %6, align 4
  %56 = load [1900 x double]*, [1900 x double]** %9, align 8
  %57 = getelementptr inbounds [1900 x double], [1900 x double]* %56, i32 0, i32 0
  %58 = load [2100 x double]*, [2100 x double]** %10, align 8
  %59 = getelementptr inbounds [2100 x double], [2100 x double]* %58, i32 0, i32 0
  call void @print_array(i32 %54, i32 %55, double* %57, double* %59)
  br label %60

; <label>:60:                                     ; preds = %52, %45, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %61 = add i64 %pgocount2, 1
  store i64 %61, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %62 = load [2100 x [1900 x double]]*, [2100 x [1900 x double]]** %8, align 8
  %63 = bitcast [2100 x [1900 x double]]* %62 to i8*
  call void @free(i8* %63) #4
  %64 = load [1900 x double]*, [1900 x double]** %9, align 8
  %65 = bitcast [1900 x double]* %64 to i8*
  call void @free(i8* %65) #4
  %66 = load [2100 x double]*, [2100 x double]** %10, align 8
  %67 = bitcast [2100 x double]* %66 to i8*
  call void @free(i8* %67) #4
  %68 = load [1900 x double]*, [1900 x double]** %11, align 8
  %69 = bitcast [1900 x double]* %68 to i8*
  call void @free(i8* %69) #4
  %70 = load [2100 x double]*, [2100 x double]** %12, align 8
  %71 = bitcast [2100 x double]* %70 to i8*
  call void @free(i8* %71) #4
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
  br i1 %16, label %17, label %33

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
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %31 = load i32, i32* %11, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %11, align 4
  br label %13

; <label>:33:                                     ; preds = %13
  store i32 0, i32* %11, align 4
  br label %34

; <label>:34:                                     ; preds = %77, %33
  %35 = load i32, i32* %11, align 4
  %36 = load i32, i32* %7, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %81

; <label>:38:                                     ; preds = %34
  %39 = load i32, i32* %11, align 4
  %40 = load i32, i32* %7, align 4
  %41 = srem i32 %39, %40
  %42 = sitofp i32 %41 to double
  %43 = load i32, i32* %7, align 4
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %42, %44
  %46 = load double*, double** %9, align 8
  %47 = load i32, i32* %11, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds double, double* %46, i64 %48
  store double %45, double* %49, align 8
  store i32 0, i32* %12, align 4
  br label %50

; <label>:50:                                     ; preds = %72, %38
  %51 = load i32, i32* %12, align 4
  %52 = load i32, i32* %6, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %54, label %76

; <label>:54:                                     ; preds = %50
  %55 = load i32, i32* %11, align 4
  %56 = load i32, i32* %12, align 4
  %57 = add nsw i32 %56, 1
  %58 = mul nsw i32 %55, %57
  %59 = load i32, i32* %7, align 4
  %60 = srem i32 %58, %59
  %61 = sitofp i32 %60 to double
  %62 = load i32, i32* %7, align 4
  %63 = sitofp i32 %62 to double
  %64 = fdiv double %61, %63
  %65 = load [1900 x double]*, [1900 x double]** %8, align 8
  %66 = load i32, i32* %11, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [1900 x double], [1900 x double]* %65, i64 %67
  %69 = load i32, i32* %12, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [1900 x double], [1900 x double]* %68, i64 0, i64 %70
  store double %64, double* %71, align 8
  br label %72

; <label>:72:                                     ; preds = %54
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %73 = add i64 %pgocount1, 1
  store i64 %73, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %74 = load i32, i32* %12, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %12, align 4
  br label %50

; <label>:76:                                     ; preds = %50
  br label %77

; <label>:77:                                     ; preds = %76
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %78 = add i64 %pgocount2, 1
  store i64 %78, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %79 = load i32, i32* %11, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %11, align 4
  br label %34

; <label>:81:                                     ; preds = %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %82 = add i64 %pgocount3, 1
  store i64 %82, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
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
  br i1 %20, label %21, label %30

; <label>:21:                                     ; preds = %17
  %22 = load double*, double** %11, align 8
  %23 = load i32, i32* %15, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds double, double* %22, i64 %24
  store double 0.000000e+00, double* %25, align 8
  br label %26

; <label>:26:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 1)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 1)
  %28 = load i32, i32* %15, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %15, align 4
  br label %17

; <label>:30:                                     ; preds = %17
  store i32 0, i32* %15, align 4
  br label %31

; <label>:31:                                     ; preds = %98, %30
  %32 = load i32, i32* %15, align 4
  %33 = load i32, i32* %9, align 4
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %102

; <label>:35:                                     ; preds = %31
  %36 = load double*, double** %12, align 8
  %37 = load i32, i32* %15, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double, double* %36, i64 %38
  store double 0.000000e+00, double* %39, align 8
  store i32 0, i32* %16, align 4
  br label %40

; <label>:40:                                     ; preds = %93, %35
  %41 = load i32, i32* %16, align 4
  %42 = load i32, i32* %8, align 4
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %97

; <label>:44:                                     ; preds = %40
  %45 = load double*, double** %11, align 8
  %46 = load i32, i32* %16, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, double* %45, i64 %47
  %49 = load double, double* %48, align 8
  %50 = load double*, double** %14, align 8
  %51 = load i32, i32* %15, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, double* %50, i64 %52
  %54 = load double, double* %53, align 8
  %55 = load [1900 x double]*, [1900 x double]** %10, align 8
  %56 = load i32, i32* %15, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [1900 x double], [1900 x double]* %55, i64 %57
  %59 = load i32, i32* %16, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [1900 x double], [1900 x double]* %58, i64 0, i64 %60
  %62 = load double, double* %61, align 8
  %63 = fmul double %54, %62
  %64 = fadd double %49, %63
  %65 = load double*, double** %11, align 8
  %66 = load i32, i32* %16, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double* %65, i64 %67
  store double %64, double* %68, align 8
  %69 = load double*, double** %12, align 8
  %70 = load i32, i32* %15, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds double, double* %69, i64 %71
  %73 = load double, double* %72, align 8
  %74 = load [1900 x double]*, [1900 x double]** %10, align 8
  %75 = load i32, i32* %15, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [1900 x double], [1900 x double]* %74, i64 %76
  %78 = load i32, i32* %16, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [1900 x double], [1900 x double]* %77, i64 0, i64 %79
  %81 = load double, double* %80, align 8
  %82 = load double*, double** %13, align 8
  %83 = load i32, i32* %16, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds double, double* %82, i64 %84
  %86 = load double, double* %85, align 8
  %87 = fmul double %81, %86
  %88 = fadd double %73, %87
  %89 = load double*, double** %12, align 8
  %90 = load i32, i32* %15, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds double, double* %89, i64 %91
  store double %88, double* %92, align 8
  br label %93

; <label>:93:                                     ; preds = %44
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 0)
  %94 = add i64 %pgocount1, 1
  store i64 %94, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 0)
  %95 = load i32, i32* %16, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* %16, align 4
  br label %40

; <label>:97:                                     ; preds = %40
  br label %98

; <label>:98:                                     ; preds = %97
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 2)
  %99 = add i64 %pgocount2, 1
  store i64 %99, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 2)
  %100 = load i32, i32* %15, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, i32* %15, align 4
  br label %31

; <label>:102:                                    ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 3)
  %103 = add i64 %pgocount3, 1
  store i64 %103, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 3)
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

; <label>:14:                                     ; preds = %34, %4
  %15 = load i32, i32* %9, align 4
  %16 = load i32, i32* %5, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %38

; <label>:18:                                     ; preds = %14
  %19 = load i32, i32* %9, align 4
  %20 = srem i32 %19, 20
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %26

; <label>:22:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %26

; <label>:26:                                     ; preds = %22, %18
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = load double*, double** %7, align 8
  %29 = load i32, i32* %9, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds double, double* %28, i64 %30
  %32 = load double, double* %31, align 8
  %33 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %32)
  br label %34

; <label>:34:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %36 = load i32, i32* %9, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %9, align 4
  br label %14

; <label>:38:                                     ; preds = %14
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store i32 0, i32* %9, align 4
  br label %43

; <label>:43:                                     ; preds = %63, %38
  %44 = load i32, i32* %9, align 4
  %45 = load i32, i32* %6, align 4
  %46 = icmp slt i32 %44, %45
  br i1 %46, label %47, label %67

; <label>:47:                                     ; preds = %43
  %48 = load i32, i32* %9, align 4
  %49 = srem i32 %48, 20
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %55

; <label>:51:                                     ; preds = %47
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %54 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %53, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %55

; <label>:55:                                     ; preds = %51, %47
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %57 = load double*, double** %8, align 8
  %58 = load i32, i32* %9, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double* %57, i64 %59
  %61 = load double, double* %60, align 8
  %62 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %61)
  br label %63

; <label>:63:                                     ; preds = %55
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %64 = add i64 %pgocount3, 1
  store i64 %64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %65 = load i32, i32* %9, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* %9, align 4
  br label %43

; <label>:67:                                     ; preds = %43
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %68 = add i64 %pgocount4, 1
  store i64 %68, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %70 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %69, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %72 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %71, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

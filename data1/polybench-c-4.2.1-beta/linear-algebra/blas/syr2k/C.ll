; ModuleID = 'B.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_syr2k = private constant [17 x i8] c"B.ll:kernel_syr2k"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 95009293522, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_syr2k = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_syr2k = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4484451777959451810, i64 96569690461, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syr2k, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [57 x i8] c"7\00main\01B.ll:init_array\01B.ll:kernel_syr2k\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_syr2k to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

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
  br i1 %38, label %39, label %51

; <label>:39:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %41 = load i8**, i8*** %5, align 8
  %42 = getelementptr inbounds i8*, i8** %41, i64 0
  %43 = load i8*, i8** %42, align 8
  %44 = call i32 @strcmp(i8* %43, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %51, label %46

; <label>:46:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %48 = load i32, i32* %6, align 4
  %49 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %50 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %49, i32 0, i32 0
  call void @print_array(i32 %48, [1200 x double]* %50)
  br label %51

; <label>:51:                                     ; preds = %46, %39, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %53 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %54 = bitcast [1200 x [1200 x double]]* %53 to i8*
  call void @free(i8* %54) #4
  %55 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %11, align 8
  %56 = bitcast [1200 x [1000 x double]]* %55 to i8*
  call void @free(i8* %56) #4
  %57 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %12, align 8
  %58 = bitcast [1200 x [1000 x double]]* %57 to i8*
  call void @free(i8* %58) #4
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

; <label>:19:                                     ; preds = %68, %7
  %20 = load i32, i32* %15, align 4
  %21 = load i32, i32* %8, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %72

; <label>:23:                                     ; preds = %19
  store i32 0, i32* %16, align 4
  br label %24

; <label>:24:                                     ; preds = %63, %23
  %25 = load i32, i32* %16, align 4
  %26 = load i32, i32* %9, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %67

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
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %64 = add i64 %pgocount, 1
  store i64 %64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %65 = load i32, i32* %16, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* %16, align 4
  br label %24

; <label>:67:                                     ; preds = %24
  br label %68

; <label>:68:                                     ; preds = %67
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %69 = add i64 %pgocount1, 1
  store i64 %69, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %70 = load i32, i32* %15, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %15, align 4
  br label %19

; <label>:72:                                     ; preds = %19
  store i32 0, i32* %15, align 4
  br label %73

; <label>:73:                                     ; preds = %105, %72
  %74 = load i32, i32* %15, align 4
  %75 = load i32, i32* %8, align 4
  %76 = icmp slt i32 %74, %75
  br i1 %76, label %77, label %109

; <label>:77:                                     ; preds = %73
  store i32 0, i32* %16, align 4
  br label %78

; <label>:78:                                     ; preds = %100, %77
  %79 = load i32, i32* %16, align 4
  %80 = load i32, i32* %8, align 4
  %81 = icmp slt i32 %79, %80
  br i1 %81, label %82, label %104

; <label>:82:                                     ; preds = %78
  %83 = load i32, i32* %15, align 4
  %84 = load i32, i32* %16, align 4
  %85 = mul nsw i32 %83, %84
  %86 = add nsw i32 %85, 3
  %87 = load i32, i32* %8, align 4
  %88 = srem i32 %86, %87
  %89 = sitofp i32 %88 to double
  %90 = load i32, i32* %9, align 4
  %91 = sitofp i32 %90 to double
  %92 = fdiv double %89, %91
  %93 = load [1200 x double]*, [1200 x double]** %12, align 8
  %94 = load i32, i32* %15, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %93, i64 %95
  %97 = load i32, i32* %16, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %96, i64 0, i64 %98
  store double %92, double* %99, align 8
  br label %100

; <label>:100:                                    ; preds = %82
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %101 = add i64 %pgocount2, 1
  store i64 %101, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %102 = load i32, i32* %16, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, i32* %16, align 4
  br label %78

; <label>:104:                                    ; preds = %78
  br label %105

; <label>:105:                                    ; preds = %104
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %106 = add i64 %pgocount3, 1
  store i64 %106, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %107 = load i32, i32* %15, align 4
  %108 = add nsw i32 %107, 1
  store i32 %108, i32* %15, align 4
  br label %73

; <label>:109:                                    ; preds = %73
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %110 = add i64 %pgocount4, 1
  store i64 %110, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
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

; <label>:18:                                     ; preds = %111, %7
  %19 = load i32, i32* %15, align 4
  %20 = load i32, i32* %8, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %115

; <label>:22:                                     ; preds = %18
  store i32 0, i32* %16, align 4
  br label %23

; <label>:23:                                     ; preds = %38, %22
  %24 = load i32, i32* %16, align 4
  %25 = load i32, i32* %15, align 4
  %26 = icmp sle i32 %24, %25
  br i1 %26, label %27, label %42

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
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 1)
  %39 = add i64 %pgocount, 1
  store i64 %39, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 1)
  %40 = load i32, i32* %16, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %16, align 4
  br label %23

; <label>:42:                                     ; preds = %23
  store i32 0, i32* %17, align 4
  br label %43

; <label>:43:                                     ; preds = %106, %42
  %44 = load i32, i32* %17, align 4
  %45 = load i32, i32* %9, align 4
  %46 = icmp slt i32 %44, %45
  br i1 %46, label %47, label %110

; <label>:47:                                     ; preds = %43
  store i32 0, i32* %16, align 4
  br label %48

; <label>:48:                                     ; preds = %101, %47
  %49 = load i32, i32* %16, align 4
  %50 = load i32, i32* %15, align 4
  %51 = icmp sle i32 %49, %50
  br i1 %51, label %52, label %105

; <label>:52:                                     ; preds = %48
  %53 = load [1000 x double]*, [1000 x double]** %13, align 8
  %54 = load i32, i32* %16, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %53, i64 %55
  %57 = load i32, i32* %17, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %56, i64 0, i64 %58
  %60 = load double, double* %59, align 8
  %61 = load double, double* %10, align 8
  %62 = fmul double %60, %61
  %63 = load [1000 x double]*, [1000 x double]** %14, align 8
  %64 = load i32, i32* %15, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %63, i64 %65
  %67 = load i32, i32* %17, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %66, i64 0, i64 %68
  %70 = load double, double* %69, align 8
  %71 = fmul double %62, %70
  %72 = load [1000 x double]*, [1000 x double]** %14, align 8
  %73 = load i32, i32* %16, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %72, i64 %74
  %76 = load i32, i32* %17, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %75, i64 0, i64 %77
  %79 = load double, double* %78, align 8
  %80 = load double, double* %10, align 8
  %81 = fmul double %79, %80
  %82 = load [1000 x double]*, [1000 x double]** %13, align 8
  %83 = load i32, i32* %15, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %82, i64 %84
  %86 = load i32, i32* %17, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %85, i64 0, i64 %87
  %89 = load double, double* %88, align 8
  %90 = fmul double %81, %89
  %91 = fadd double %71, %90
  %92 = load [1200 x double]*, [1200 x double]** %12, align 8
  %93 = load i32, i32* %15, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %92, i64 %94
  %96 = load i32, i32* %16, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %95, i64 0, i64 %97
  %99 = load double, double* %98, align 8
  %100 = fadd double %99, %91
  store double %100, double* %98, align 8
  br label %101

; <label>:101:                                    ; preds = %52
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 0)
  %102 = add i64 %pgocount1, 1
  store i64 %102, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 0)
  %103 = load i32, i32* %16, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, i32* %16, align 4
  br label %48

; <label>:105:                                    ; preds = %48
  br label %106

; <label>:106:                                    ; preds = %105
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 2)
  %107 = add i64 %pgocount2, 1
  store i64 %107, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 2)
  %108 = load i32, i32* %17, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %17, align 4
  br label %43

; <label>:110:                                    ; preds = %43
  br label %111

; <label>:111:                                    ; preds = %110
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 3)
  %112 = add i64 %pgocount3, 1
  store i64 %112, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 3)
  %113 = load i32, i32* %15, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, i32* %15, align 4
  br label %18

; <label>:115:                                    ; preds = %18
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 4)
  %116 = add i64 %pgocount4, 1
  store i64 %116, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 4)
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

; <label>:11:                                     ; preds = %48, %2
  %12 = load i32, i32* %5, align 4
  %13 = load i32, i32* %3, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %52

; <label>:15:                                     ; preds = %11
  store i32 0, i32* %6, align 4
  br label %16

; <label>:16:                                     ; preds = %43, %15
  %17 = load i32, i32* %6, align 4
  %18 = load i32, i32* %3, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %47

; <label>:20:                                     ; preds = %16
  %21 = load i32, i32* %5, align 4
  %22 = load i32, i32* %3, align 4
  %23 = mul nsw i32 %21, %22
  %24 = load i32, i32* %6, align 4
  %25 = add nsw i32 %23, %24
  %26 = srem i32 %25, 20
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %32

; <label>:28:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %32

; <label>:32:                                     ; preds = %28, %20
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = load [1200 x double]*, [1200 x double]** %4, align 8
  %35 = load i32, i32* %5, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %34, i64 %36
  %38 = load i32, i32* %6, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %37, i64 0, i64 %39
  %41 = load double, double* %40, align 8
  %42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %41)
  br label %43

; <label>:43:                                     ; preds = %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %45 = load i32, i32* %6, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %6, align 4
  br label %16

; <label>:47:                                     ; preds = %16
  br label %48

; <label>:48:                                     ; preds = %47
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %49 = add i64 %pgocount2, 1
  store i64 %49, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %50 = load i32, i32* %5, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %5, align 4
  br label %11

; <label>:52:                                     ; preds = %11
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %53 = add i64 %pgocount3, 1
  store i64 %53, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %55 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %57 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
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

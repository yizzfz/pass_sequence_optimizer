; ModuleID = 'B.ll'
source_filename = "syrk.c"
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
@__profn_B.ll_kernel_syrk = private constant [16 x i8] c"B.ll:kernel_syrk"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 95009293522, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_syrk = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_syrk = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5417141688726560687, i64 96569690461, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syrk, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00main\01B.ll:init_array\01B.ll:kernel_syrk\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_syrk to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

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
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1200, i32* %6, align 4
  store i32 1000, i32* %7, align 4
  %12 = call i8* @polybench_alloc_data(i64 1440000, i32 8)
  %13 = bitcast i8* %12 to [1200 x [1200 x double]]*
  store [1200 x [1200 x double]]* %13, [1200 x [1200 x double]]** %10, align 8
  %14 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %15 = bitcast i8* %14 to [1200 x [1000 x double]]*
  store [1200 x [1000 x double]]* %15, [1200 x [1000 x double]]** %11, align 8
  %16 = load i32, i32* %6, align 4
  %17 = load i32, i32* %7, align 4
  %18 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %19 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %18, i32 0, i32 0
  %20 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %11, align 8
  %21 = getelementptr inbounds [1200 x [1000 x double]], [1200 x [1000 x double]]* %20, i32 0, i32 0
  call void @init_array(i32 %16, i32 %17, double* %8, double* %9, [1200 x double]* %19, [1000 x double]* %21)
  call void (...) @polybench_timer_start()
  %22 = load i32, i32* %6, align 4
  %23 = load i32, i32* %7, align 4
  %24 = load double, double* %8, align 8
  %25 = load double, double* %9, align 8
  %26 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %27 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %26, i32 0, i32 0
  %28 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %11, align 8
  %29 = getelementptr inbounds [1200 x [1000 x double]], [1200 x [1000 x double]]* %28, i32 0, i32 0
  call void @kernel_syrk(i32 %22, i32 %23, double %24, double %25, [1200 x double]* %27, [1000 x double]* %29)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %30 = load i32, i32* %4, align 4
  %31 = icmp sgt i32 %30, 42
  br i1 %31, label %32, label %44

; <label>:32:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %33 = add i64 %pgocount, 1
  store i64 %33, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %34 = load i8**, i8*** %5, align 8
  %35 = getelementptr inbounds i8*, i8** %34, i64 0
  %36 = load i8*, i8** %35, align 8
  %37 = call i32 @strcmp(i8* %36, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %44, label %39

; <label>:39:                                     ; preds = %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %40 = add i64 %pgocount1, 1
  store i64 %40, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %41 = load i32, i32* %6, align 4
  %42 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %43 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %42, i32 0, i32 0
  call void @print_array(i32 %41, [1200 x double]* %43)
  br label %44

; <label>:44:                                     ; preds = %39, %32, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %45 = add i64 %pgocount2, 1
  store i64 %45, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %46 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %47 = bitcast [1200 x [1200 x double]]* %46 to i8*
  call void @free(i8* %47) #4
  %48 = load [1200 x [1000 x double]]*, [1200 x [1000 x double]]** %11, align 8
  %49 = bitcast [1200 x [1000 x double]]* %48 to i8*
  call void @free(i8* %49) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca [1200 x double]*, align 8
  %12 = alloca [1000 x double]*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store double* %2, double** %9, align 8
  store double* %3, double** %10, align 8
  store [1200 x double]* %4, [1200 x double]** %11, align 8
  store [1000 x double]* %5, [1000 x double]** %12, align 8
  %15 = load double*, double** %9, align 8
  store double 1.500000e+00, double* %15, align 8
  %16 = load double*, double** %10, align 8
  store double 1.200000e+00, double* %16, align 8
  store i32 0, i32* %13, align 4
  br label %17

; <label>:17:                                     ; preds = %49, %6
  %18 = load i32, i32* %13, align 4
  %19 = load i32, i32* %7, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %53

; <label>:21:                                     ; preds = %17
  store i32 0, i32* %14, align 4
  br label %22

; <label>:22:                                     ; preds = %44, %21
  %23 = load i32, i32* %14, align 4
  %24 = load i32, i32* %8, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %48

; <label>:26:                                     ; preds = %22
  %27 = load i32, i32* %13, align 4
  %28 = load i32, i32* %14, align 4
  %29 = mul nsw i32 %27, %28
  %30 = add nsw i32 %29, 1
  %31 = load i32, i32* %7, align 4
  %32 = srem i32 %30, %31
  %33 = sitofp i32 %32 to double
  %34 = load i32, i32* %7, align 4
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %33, %35
  %37 = load [1000 x double]*, [1000 x double]** %12, align 8
  %38 = load i32, i32* %13, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %37, i64 %39
  %41 = load i32, i32* %14, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %40, i64 0, i64 %42
  store double %36, double* %43, align 8
  br label %44

; <label>:44:                                     ; preds = %26
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %45 = add i64 %pgocount, 1
  store i64 %45, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %46 = load i32, i32* %14, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %14, align 4
  br label %22

; <label>:48:                                     ; preds = %22
  br label %49

; <label>:49:                                     ; preds = %48
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %50 = add i64 %pgocount1, 1
  store i64 %50, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %51 = load i32, i32* %13, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %13, align 4
  br label %17

; <label>:53:                                     ; preds = %17
  store i32 0, i32* %13, align 4
  br label %54

; <label>:54:                                     ; preds = %86, %53
  %55 = load i32, i32* %13, align 4
  %56 = load i32, i32* %7, align 4
  %57 = icmp slt i32 %55, %56
  br i1 %57, label %58, label %90

; <label>:58:                                     ; preds = %54
  store i32 0, i32* %14, align 4
  br label %59

; <label>:59:                                     ; preds = %81, %58
  %60 = load i32, i32* %14, align 4
  %61 = load i32, i32* %7, align 4
  %62 = icmp slt i32 %60, %61
  br i1 %62, label %63, label %85

; <label>:63:                                     ; preds = %59
  %64 = load i32, i32* %13, align 4
  %65 = load i32, i32* %14, align 4
  %66 = mul nsw i32 %64, %65
  %67 = add nsw i32 %66, 2
  %68 = load i32, i32* %8, align 4
  %69 = srem i32 %67, %68
  %70 = sitofp i32 %69 to double
  %71 = load i32, i32* %8, align 4
  %72 = sitofp i32 %71 to double
  %73 = fdiv double %70, %72
  %74 = load [1200 x double]*, [1200 x double]** %11, align 8
  %75 = load i32, i32* %13, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %74, i64 %76
  %78 = load i32, i32* %14, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %77, i64 0, i64 %79
  store double %73, double* %80, align 8
  br label %81

; <label>:81:                                     ; preds = %63
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %82 = add i64 %pgocount2, 1
  store i64 %82, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %83 = load i32, i32* %14, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %14, align 4
  br label %59

; <label>:85:                                     ; preds = %59
  br label %86

; <label>:86:                                     ; preds = %85
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %87 = add i64 %pgocount3, 1
  store i64 %87, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %88 = load i32, i32* %13, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %13, align 4
  br label %54

; <label>:90:                                     ; preds = %54
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %91 = add i64 %pgocount4, 1
  store i64 %91, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_syrk(i32, i32, double, double, [1200 x double]*, [1000 x double]*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca [1200 x double]*, align 8
  %12 = alloca [1000 x double]*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store double %2, double* %9, align 8
  store double %3, double* %10, align 8
  store [1200 x double]* %4, [1200 x double]** %11, align 8
  store [1000 x double]* %5, [1000 x double]** %12, align 8
  store i32 0, i32* %13, align 4
  br label %16

; <label>:16:                                     ; preds = %89, %6
  %17 = load i32, i32* %13, align 4
  %18 = load i32, i32* %7, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %93

; <label>:20:                                     ; preds = %16
  store i32 0, i32* %14, align 4
  br label %21

; <label>:21:                                     ; preds = %36, %20
  %22 = load i32, i32* %14, align 4
  %23 = load i32, i32* %13, align 4
  %24 = icmp sle i32 %22, %23
  br i1 %24, label %25, label %40

; <label>:25:                                     ; preds = %21
  %26 = load double, double* %10, align 8
  %27 = load [1200 x double]*, [1200 x double]** %11, align 8
  %28 = load i32, i32* %13, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %27, i64 %29
  %31 = load i32, i32* %14, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %30, i64 0, i64 %32
  %34 = load double, double* %33, align 8
  %35 = fmul double %34, %26
  store double %35, double* %33, align 8
  br label %36

; <label>:36:                                     ; preds = %25
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 1)
  %37 = add i64 %pgocount, 1
  store i64 %37, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 1)
  %38 = load i32, i32* %14, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %14, align 4
  br label %21

; <label>:40:                                     ; preds = %21
  store i32 0, i32* %15, align 4
  br label %41

; <label>:41:                                     ; preds = %84, %40
  %42 = load i32, i32* %15, align 4
  %43 = load i32, i32* %8, align 4
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %45, label %88

; <label>:45:                                     ; preds = %41
  store i32 0, i32* %14, align 4
  br label %46

; <label>:46:                                     ; preds = %79, %45
  %47 = load i32, i32* %14, align 4
  %48 = load i32, i32* %13, align 4
  %49 = icmp sle i32 %47, %48
  br i1 %49, label %50, label %83

; <label>:50:                                     ; preds = %46
  %51 = load double, double* %9, align 8
  %52 = load [1000 x double]*, [1000 x double]** %12, align 8
  %53 = load i32, i32* %13, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %52, i64 %54
  %56 = load i32, i32* %15, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %55, i64 0, i64 %57
  %59 = load double, double* %58, align 8
  %60 = fmul double %51, %59
  %61 = load [1000 x double]*, [1000 x double]** %12, align 8
  %62 = load i32, i32* %14, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %63
  %65 = load i32, i32* %15, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %64, i64 0, i64 %66
  %68 = load double, double* %67, align 8
  %69 = fmul double %60, %68
  %70 = load [1200 x double]*, [1200 x double]** %11, align 8
  %71 = load i32, i32* %13, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %72
  %74 = load i32, i32* %14, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %73, i64 0, i64 %75
  %77 = load double, double* %76, align 8
  %78 = fadd double %77, %69
  store double %78, double* %76, align 8
  br label %79

; <label>:79:                                     ; preds = %50
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 0)
  %80 = add i64 %pgocount1, 1
  store i64 %80, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 0)
  %81 = load i32, i32* %14, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* %14, align 4
  br label %46

; <label>:83:                                     ; preds = %46
  br label %84

; <label>:84:                                     ; preds = %83
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 2)
  %85 = add i64 %pgocount2, 1
  store i64 %85, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 2)
  %86 = load i32, i32* %15, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %15, align 4
  br label %41

; <label>:88:                                     ; preds = %41
  br label %89

; <label>:89:                                     ; preds = %88
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 3)
  %90 = add i64 %pgocount3, 1
  store i64 %90, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 3)
  %91 = load i32, i32* %13, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %13, align 4
  br label %16

; <label>:93:                                     ; preds = %16
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 4)
  %94 = add i64 %pgocount4, 1
  store i64 %94, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 4)
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

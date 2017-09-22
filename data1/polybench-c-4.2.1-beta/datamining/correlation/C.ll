; ModuleID = 'B.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_correlation = private constant [23 x i8] c"B.ll:kernel_correlation"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_correlation = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_correlation = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1350359969428179236, i64 221391415523, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i32 0, i32 0), i8* null, i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [63 x i8] c"=\00main\01B.ll:init_array\01B.ll:kernel_correlation\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_correlation to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca double, align 8
  %9 = alloca [1400 x [1200 x double]]*, align 8
  %10 = alloca [1200 x [1200 x double]]*, align 8
  %11 = alloca [1200 x double]*, align 8
  %12 = alloca [1200 x double]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1400, i32* %6, align 4
  store i32 1200, i32* %7, align 4
  %13 = call i8* @polybench_alloc_data(i64 1680000, i32 8)
  %14 = bitcast i8* %13 to [1400 x [1200 x double]]*
  store [1400 x [1200 x double]]* %14, [1400 x [1200 x double]]** %9, align 8
  %15 = call i8* @polybench_alloc_data(i64 1440000, i32 8)
  %16 = bitcast i8* %15 to [1200 x [1200 x double]]*
  store [1200 x [1200 x double]]* %16, [1200 x [1200 x double]]** %10, align 8
  %17 = call i8* @polybench_alloc_data(i64 1200, i32 8)
  %18 = bitcast i8* %17 to [1200 x double]*
  store [1200 x double]* %18, [1200 x double]** %11, align 8
  %19 = call i8* @polybench_alloc_data(i64 1200, i32 8)
  %20 = bitcast i8* %19 to [1200 x double]*
  store [1200 x double]* %20, [1200 x double]** %12, align 8
  %21 = load i32, i32* %7, align 4
  %22 = load i32, i32* %6, align 4
  %23 = load [1400 x [1200 x double]]*, [1400 x [1200 x double]]** %9, align 8
  %24 = getelementptr inbounds [1400 x [1200 x double]], [1400 x [1200 x double]]* %23, i32 0, i32 0
  call void @init_array(i32 %21, i32 %22, double* %8, [1200 x double]* %24)
  call void (...) @polybench_timer_start()
  %25 = load i32, i32* %7, align 4
  %26 = load i32, i32* %6, align 4
  %27 = load double, double* %8, align 8
  %28 = load [1400 x [1200 x double]]*, [1400 x [1200 x double]]** %9, align 8
  %29 = getelementptr inbounds [1400 x [1200 x double]], [1400 x [1200 x double]]* %28, i32 0, i32 0
  %30 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %31 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %30, i32 0, i32 0
  %32 = load [1200 x double]*, [1200 x double]** %11, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %32, i32 0, i32 0
  %34 = load [1200 x double]*, [1200 x double]** %12, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %34, i32 0, i32 0
  call void @kernel_correlation(i32 %25, i32 %26, double %27, [1200 x double]* %29, [1200 x double]* %31, double* %33, double* %35)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %36 = load i32, i32* %4, align 4
  %37 = icmp sgt i32 %36, 42
  br i1 %37, label %38, label %50

; <label>:38:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %39 = add i64 %pgocount, 1
  store i64 %39, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %40 = load i8**, i8*** %5, align 8
  %41 = getelementptr inbounds i8*, i8** %40, i64 0
  %42 = load i8*, i8** %41, align 8
  %43 = call i32 @strcmp(i8* %42, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %50, label %45

; <label>:45:                                     ; preds = %38
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %47 = load i32, i32* %7, align 4
  %48 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %49 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %48, i32 0, i32 0
  call void @print_array(i32 %47, [1200 x double]* %49)
  br label %50

; <label>:50:                                     ; preds = %45, %38, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %52 = load [1400 x [1200 x double]]*, [1400 x [1200 x double]]** %9, align 8
  %53 = bitcast [1400 x [1200 x double]]* %52 to i8*
  call void @free(i8* %53) #4
  %54 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %55 = bitcast [1200 x [1200 x double]]* %54 to i8*
  call void @free(i8* %55) #4
  %56 = load [1200 x double]*, [1200 x double]** %11, align 8
  %57 = bitcast [1200 x double]* %56 to i8*
  call void @free(i8* %57) #4
  %58 = load [1200 x double]*, [1200 x double]** %12, align 8
  %59 = bitcast [1200 x double]* %58 to i8*
  call void @free(i8* %59) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, double*, [1200 x double]*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca double*, align 8
  %8 = alloca [1200 x double]*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store double* %2, double** %7, align 8
  store [1200 x double]* %3, [1200 x double]** %8, align 8
  %11 = load double*, double** %7, align 8
  store double 1.400000e+03, double* %11, align 8
  store i32 0, i32* %9, align 4
  br label %12

; <label>:12:                                     ; preds = %40, %4
  %13 = load i32, i32* %9, align 4
  %14 = icmp slt i32 %13, 1400
  br i1 %14, label %15, label %44

; <label>:15:                                     ; preds = %12
  store i32 0, i32* %10, align 4
  br label %16

; <label>:16:                                     ; preds = %35, %15
  %17 = load i32, i32* %10, align 4
  %18 = icmp slt i32 %17, 1200
  br i1 %18, label %19, label %39

; <label>:19:                                     ; preds = %16
  %20 = load i32, i32* %9, align 4
  %21 = load i32, i32* %10, align 4
  %22 = mul nsw i32 %20, %21
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 1.200000e+03
  %25 = load i32, i32* %9, align 4
  %26 = sitofp i32 %25 to double
  %27 = fadd double %24, %26
  %28 = load [1200 x double]*, [1200 x double]** %8, align 8
  %29 = load i32, i32* %9, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %28, i64 %30
  %32 = load i32, i32* %10, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %31, i64 0, i64 %33
  store double %27, double* %34, align 8
  br label %35

; <label>:35:                                     ; preds = %19
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %37 = load i32, i32* %10, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %10, align 4
  br label %16

; <label>:39:                                     ; preds = %16
  br label %40

; <label>:40:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %42 = load i32, i32* %9, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %9, align 4
  br label %12

; <label>:44:                                     ; preds = %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %45 = add i64 %pgocount2, 1
  store i64 %45, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca [1200 x double]*, align 8
  %12 = alloca [1200 x double]*, align 8
  %13 = alloca double*, align 8
  %14 = alloca double*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca double, align 8
  store i32 %0, i32* %8, align 4
  store i32 %1, i32* %9, align 4
  store double %2, double* %10, align 8
  store [1200 x double]* %3, [1200 x double]** %11, align 8
  store [1200 x double]* %4, [1200 x double]** %12, align 8
  store double* %5, double** %13, align 8
  store double* %6, double** %14, align 8
  store double 1.000000e-01, double* %18, align 8
  store i32 0, i32* %16, align 4
  br label %19

; <label>:19:                                     ; preds = %59, %7
  %20 = load i32, i32* %16, align 4
  %21 = load i32, i32* %8, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %63

; <label>:23:                                     ; preds = %19
  %24 = load double*, double** %13, align 8
  %25 = load i32, i32* %16, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, double* %24, i64 %26
  store double 0.000000e+00, double* %27, align 8
  store i32 0, i32* %15, align 4
  br label %28

; <label>:28:                                     ; preds = %47, %23
  %29 = load i32, i32* %15, align 4
  %30 = load i32, i32* %9, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %51

; <label>:32:                                     ; preds = %28
  %33 = load [1200 x double]*, [1200 x double]** %11, align 8
  %34 = load i32, i32* %15, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %33, i64 %35
  %37 = load i32, i32* %16, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %36, i64 0, i64 %38
  %40 = load double, double* %39, align 8
  %41 = load double*, double** %13, align 8
  %42 = load i32, i32* %16, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, double* %41, i64 %43
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %40
  store double %46, double* %44, align 8
  br label %47

; <label>:47:                                     ; preds = %32
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 1)
  %48 = add i64 %pgocount, 1
  store i64 %48, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 1)
  %49 = load i32, i32* %15, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %15, align 4
  br label %28

; <label>:51:                                     ; preds = %28
  %52 = load double, double* %10, align 8
  %53 = load double*, double** %13, align 8
  %54 = load i32, i32* %16, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double, double* %53, i64 %55
  %57 = load double, double* %56, align 8
  %58 = fdiv double %57, %52
  store double %58, double* %56, align 8
  br label %59

; <label>:59:                                     ; preds = %51
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 5)
  %60 = add i64 %pgocount1, 1
  store i64 %60, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 5)
  %61 = load i32, i32* %16, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %16, align 4
  br label %19

; <label>:63:                                     ; preds = %19
  store i32 0, i32* %16, align 4
  br label %64

; <label>:64:                                     ; preds = %157, %63
  %65 = load i32, i32* %16, align 4
  %66 = load i32, i32* %8, align 4
  %67 = icmp slt i32 %65, %66
  br i1 %67, label %68, label %160

; <label>:68:                                     ; preds = %64
  %69 = load double*, double** %14, align 8
  %70 = load i32, i32* %16, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds double, double* %69, i64 %71
  store double 0.000000e+00, double* %72, align 8
  store i32 0, i32* %15, align 4
  br label %73

; <label>:73:                                     ; preds = %113, %68
  %74 = load i32, i32* %15, align 4
  %75 = load i32, i32* %9, align 4
  %76 = icmp slt i32 %74, %75
  br i1 %76, label %77, label %117

; <label>:77:                                     ; preds = %73
  %78 = load [1200 x double]*, [1200 x double]** %11, align 8
  %79 = load i32, i32* %15, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %78, i64 %80
  %82 = load i32, i32* %16, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %81, i64 0, i64 %83
  %85 = load double, double* %84, align 8
  %86 = load double*, double** %13, align 8
  %87 = load i32, i32* %16, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds double, double* %86, i64 %88
  %90 = load double, double* %89, align 8
  %91 = fsub double %85, %90
  %92 = load [1200 x double]*, [1200 x double]** %11, align 8
  %93 = load i32, i32* %15, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %92, i64 %94
  %96 = load i32, i32* %16, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %95, i64 0, i64 %97
  %99 = load double, double* %98, align 8
  %100 = load double*, double** %13, align 8
  %101 = load i32, i32* %16, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds double, double* %100, i64 %102
  %104 = load double, double* %103, align 8
  %105 = fsub double %99, %104
  %106 = fmul double %91, %105
  %107 = load double*, double** %14, align 8
  %108 = load i32, i32* %16, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds double, double* %107, i64 %109
  %111 = load double, double* %110, align 8
  %112 = fadd double %111, %106
  store double %112, double* %110, align 8
  br label %113

; <label>:113:                                    ; preds = %77
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 2)
  %114 = add i64 %pgocount2, 1
  store i64 %114, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 2)
  %115 = load i32, i32* %15, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, i32* %15, align 4
  br label %73

; <label>:117:                                    ; preds = %73
  %118 = load double, double* %10, align 8
  %119 = load double*, double** %14, align 8
  %120 = load i32, i32* %16, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds double, double* %119, i64 %121
  %123 = load double, double* %122, align 8
  %124 = fdiv double %123, %118
  store double %124, double* %122, align 8
  %125 = load double*, double** %14, align 8
  %126 = load i32, i32* %16, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds double, double* %125, i64 %127
  %129 = load double, double* %128, align 8
  %130 = call double @sqrt(double %129) #4
  %131 = load double*, double** %14, align 8
  %132 = load i32, i32* %16, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds double, double* %131, i64 %133
  store double %130, double* %134, align 8
  %135 = load double*, double** %14, align 8
  %136 = load i32, i32* %16, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds double, double* %135, i64 %137
  %139 = load double, double* %138, align 8
  %140 = load double, double* %18, align 8
  %141 = fcmp ole double %139, %140
  br i1 %141, label %142, label %144

; <label>:142:                                    ; preds = %117
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 8)
  %143 = add i64 %pgocount3, 1
  store i64 %143, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 8)
  br label %151

; <label>:144:                                    ; preds = %117
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 9)
  %145 = add i64 %pgocount4, 1
  store i64 %145, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 9)
  %146 = load double*, double** %14, align 8
  %147 = load i32, i32* %16, align 4
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds double, double* %146, i64 %148
  %150 = load double, double* %149, align 8
  br label %151

; <label>:151:                                    ; preds = %144, %142
  %152 = phi double [ 1.000000e+00, %142 ], [ %150, %144 ]
  %153 = load double*, double** %14, align 8
  %154 = load i32, i32* %16, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds double, double* %153, i64 %155
  store double %152, double* %156, align 8
  br label %157

; <label>:157:                                    ; preds = %151
  %158 = load i32, i32* %16, align 4
  %159 = add nsw i32 %158, 1
  store i32 %159, i32* %16, align 4
  br label %64

; <label>:160:                                    ; preds = %64
  store i32 0, i32* %15, align 4
  br label %161

; <label>:161:                                    ; preds = %207, %160
  %162 = load i32, i32* %15, align 4
  %163 = load i32, i32* %9, align 4
  %164 = icmp slt i32 %162, %163
  br i1 %164, label %165, label %211

; <label>:165:                                    ; preds = %161
  store i32 0, i32* %16, align 4
  br label %166

; <label>:166:                                    ; preds = %202, %165
  %167 = load i32, i32* %16, align 4
  %168 = load i32, i32* %8, align 4
  %169 = icmp slt i32 %167, %168
  br i1 %169, label %170, label %206

; <label>:170:                                    ; preds = %166
  %171 = load double*, double** %13, align 8
  %172 = load i32, i32* %16, align 4
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds double, double* %171, i64 %173
  %175 = load double, double* %174, align 8
  %176 = load [1200 x double]*, [1200 x double]** %11, align 8
  %177 = load i32, i32* %15, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %176, i64 %178
  %180 = load i32, i32* %16, align 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %179, i64 0, i64 %181
  %183 = load double, double* %182, align 8
  %184 = fsub double %183, %175
  store double %184, double* %182, align 8
  %185 = load double, double* %10, align 8
  %186 = call double @sqrt(double %185) #4
  %187 = load double*, double** %14, align 8
  %188 = load i32, i32* %16, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds double, double* %187, i64 %189
  %191 = load double, double* %190, align 8
  %192 = fmul double %186, %191
  %193 = load [1200 x double]*, [1200 x double]** %11, align 8
  %194 = load i32, i32* %15, align 4
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds [1200 x double], [1200 x double]* %193, i64 %195
  %197 = load i32, i32* %16, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [1200 x double], [1200 x double]* %196, i64 0, i64 %198
  %200 = load double, double* %199, align 8
  %201 = fdiv double %200, %192
  store double %201, double* %199, align 8
  br label %202

; <label>:202:                                    ; preds = %170
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 3)
  %203 = add i64 %pgocount5, 1
  store i64 %203, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 3)
  %204 = load i32, i32* %16, align 4
  %205 = add nsw i32 %204, 1
  store i32 %205, i32* %16, align 4
  br label %166

; <label>:206:                                    ; preds = %166
  br label %207

; <label>:207:                                    ; preds = %206
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 6)
  %208 = add i64 %pgocount6, 1
  store i64 %208, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 6)
  %209 = load i32, i32* %15, align 4
  %210 = add nsw i32 %209, 1
  store i32 %210, i32* %15, align 4
  br label %161

; <label>:211:                                    ; preds = %161
  store i32 0, i32* %15, align 4
  br label %212

; <label>:212:                                    ; preds = %295, %211
  %213 = load i32, i32* %15, align 4
  %214 = load i32, i32* %8, align 4
  %215 = sub nsw i32 %214, 1
  %216 = icmp slt i32 %213, %215
  br i1 %216, label %217, label %299

; <label>:217:                                    ; preds = %212
  %218 = load [1200 x double]*, [1200 x double]** %12, align 8
  %219 = load i32, i32* %15, align 4
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds [1200 x double], [1200 x double]* %218, i64 %220
  %222 = load i32, i32* %15, align 4
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds [1200 x double], [1200 x double]* %221, i64 0, i64 %223
  store double 1.000000e+00, double* %224, align 8
  %225 = load i32, i32* %15, align 4
  %226 = add nsw i32 %225, 1
  store i32 %226, i32* %16, align 4
  br label %227

; <label>:227:                                    ; preds = %290, %217
  %228 = load i32, i32* %16, align 4
  %229 = load i32, i32* %8, align 4
  %230 = icmp slt i32 %228, %229
  br i1 %230, label %231, label %294

; <label>:231:                                    ; preds = %227
  %232 = load [1200 x double]*, [1200 x double]** %12, align 8
  %233 = load i32, i32* %15, align 4
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds [1200 x double], [1200 x double]* %232, i64 %234
  %236 = load i32, i32* %16, align 4
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds [1200 x double], [1200 x double]* %235, i64 0, i64 %237
  store double 0.000000e+00, double* %238, align 8
  store i32 0, i32* %17, align 4
  br label %239

; <label>:239:                                    ; preds = %270, %231
  %240 = load i32, i32* %17, align 4
  %241 = load i32, i32* %9, align 4
  %242 = icmp slt i32 %240, %241
  br i1 %242, label %243, label %274

; <label>:243:                                    ; preds = %239
  %244 = load [1200 x double]*, [1200 x double]** %11, align 8
  %245 = load i32, i32* %17, align 4
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds [1200 x double], [1200 x double]* %244, i64 %246
  %248 = load i32, i32* %15, align 4
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds [1200 x double], [1200 x double]* %247, i64 0, i64 %249
  %251 = load double, double* %250, align 8
  %252 = load [1200 x double]*, [1200 x double]** %11, align 8
  %253 = load i32, i32* %17, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds [1200 x double], [1200 x double]* %252, i64 %254
  %256 = load i32, i32* %16, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [1200 x double], [1200 x double]* %255, i64 0, i64 %257
  %259 = load double, double* %258, align 8
  %260 = fmul double %251, %259
  %261 = load [1200 x double]*, [1200 x double]** %12, align 8
  %262 = load i32, i32* %15, align 4
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds [1200 x double], [1200 x double]* %261, i64 %263
  %265 = load i32, i32* %16, align 4
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds [1200 x double], [1200 x double]* %264, i64 0, i64 %266
  %268 = load double, double* %267, align 8
  %269 = fadd double %268, %260
  store double %269, double* %267, align 8
  br label %270

; <label>:270:                                    ; preds = %243
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 0)
  %271 = add i64 %pgocount7, 1
  store i64 %271, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 0)
  %272 = load i32, i32* %17, align 4
  %273 = add nsw i32 %272, 1
  store i32 %273, i32* %17, align 4
  br label %239

; <label>:274:                                    ; preds = %239
  %275 = load [1200 x double]*, [1200 x double]** %12, align 8
  %276 = load i32, i32* %15, align 4
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds [1200 x double], [1200 x double]* %275, i64 %277
  %279 = load i32, i32* %16, align 4
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds [1200 x double], [1200 x double]* %278, i64 0, i64 %280
  %282 = load double, double* %281, align 8
  %283 = load [1200 x double]*, [1200 x double]** %12, align 8
  %284 = load i32, i32* %16, align 4
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds [1200 x double], [1200 x double]* %283, i64 %285
  %287 = load i32, i32* %15, align 4
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds [1200 x double], [1200 x double]* %286, i64 0, i64 %288
  store double %282, double* %289, align 8
  br label %290

; <label>:290:                                    ; preds = %274
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 4)
  %291 = add i64 %pgocount8, 1
  store i64 %291, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 4)
  %292 = load i32, i32* %16, align 4
  %293 = add nsw i32 %292, 1
  store i32 %293, i32* %16, align 4
  br label %227

; <label>:294:                                    ; preds = %227
  br label %295

; <label>:295:                                    ; preds = %294
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 7)
  %296 = add i64 %pgocount9, 1
  store i64 %296, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 7)
  %297 = load i32, i32* %15, align 4
  %298 = add nsw i32 %297, 1
  store i32 %298, i32* %15, align 4
  br label %212

; <label>:299:                                    ; preds = %212
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 10)
  %300 = add i64 %pgocount10, 1
  store i64 %300, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 10)
  %301 = load [1200 x double]*, [1200 x double]** %12, align 8
  %302 = load i32, i32* %8, align 4
  %303 = sub nsw i32 %302, 1
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds [1200 x double], [1200 x double]* %301, i64 %304
  %306 = load i32, i32* %8, align 4
  %307 = sub nsw i32 %306, 1
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds [1200 x double], [1200 x double]* %305, i64 0, i64 %308
  store double 1.000000e+00, double* %309, align 8
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
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0))
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
  %55 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0))
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %57 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

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

; ModuleID = 'B.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_atax = private constant [16 x i8] c"B.ll:kernel_atax"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 73744657289, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_atax = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_atax = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7745204956806891293, i64 96223633794, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_atax, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 45130900406, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00main\01B.ll:init_array\01B.ll:kernel_atax\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_atax to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [1900 x [2100 x double]]*, align 8
  %9 = alloca [2100 x double]*, align 8
  %10 = alloca [2100 x double]*, align 8
  %11 = alloca [1900 x double]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1900, i32* %6, align 4
  store i32 2100, i32* %7, align 4
  %12 = call i8* @polybench_alloc_data(i64 3990000, i32 8)
  %13 = bitcast i8* %12 to [1900 x [2100 x double]]*
  store [1900 x [2100 x double]]* %13, [1900 x [2100 x double]]** %8, align 8
  %14 = call i8* @polybench_alloc_data(i64 2100, i32 8)
  %15 = bitcast i8* %14 to [2100 x double]*
  store [2100 x double]* %15, [2100 x double]** %9, align 8
  %16 = call i8* @polybench_alloc_data(i64 2100, i32 8)
  %17 = bitcast i8* %16 to [2100 x double]*
  store [2100 x double]* %17, [2100 x double]** %10, align 8
  %18 = call i8* @polybench_alloc_data(i64 1900, i32 8)
  %19 = bitcast i8* %18 to [1900 x double]*
  store [1900 x double]* %19, [1900 x double]** %11, align 8
  %20 = load i32, i32* %6, align 4
  %21 = load i32, i32* %7, align 4
  %22 = load [1900 x [2100 x double]]*, [1900 x [2100 x double]]** %8, align 8
  %23 = getelementptr inbounds [1900 x [2100 x double]], [1900 x [2100 x double]]* %22, i32 0, i32 0
  %24 = load [2100 x double]*, [2100 x double]** %9, align 8
  %25 = getelementptr inbounds [2100 x double], [2100 x double]* %24, i32 0, i32 0
  call void @init_array(i32 %20, i32 %21, [2100 x double]* %23, double* %25)
  call void (...) @polybench_timer_start()
  %26 = load i32, i32* %6, align 4
  %27 = load i32, i32* %7, align 4
  %28 = load [1900 x [2100 x double]]*, [1900 x [2100 x double]]** %8, align 8
  %29 = getelementptr inbounds [1900 x [2100 x double]], [1900 x [2100 x double]]* %28, i32 0, i32 0
  %30 = load [2100 x double]*, [2100 x double]** %9, align 8
  %31 = getelementptr inbounds [2100 x double], [2100 x double]* %30, i32 0, i32 0
  %32 = load [2100 x double]*, [2100 x double]** %10, align 8
  %33 = getelementptr inbounds [2100 x double], [2100 x double]* %32, i32 0, i32 0
  %34 = load [1900 x double]*, [1900 x double]** %11, align 8
  %35 = getelementptr inbounds [1900 x double], [1900 x double]* %34, i32 0, i32 0
  call void @kernel_atax(i32 %26, i32 %27, [2100 x double]* %29, double* %31, double* %33, double* %35)
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
  %48 = load [2100 x double]*, [2100 x double]** %10, align 8
  %49 = getelementptr inbounds [2100 x double], [2100 x double]* %48, i32 0, i32 0
  call void @print_array(i32 %47, double* %49)
  br label %50

; <label>:50:                                     ; preds = %45, %38, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %52 = load [1900 x [2100 x double]]*, [1900 x [2100 x double]]** %8, align 8
  %53 = bitcast [1900 x [2100 x double]]* %52 to i8*
  call void @free(i8* %53) #4
  %54 = load [2100 x double]*, [2100 x double]** %9, align 8
  %55 = bitcast [2100 x double]* %54 to i8*
  call void @free(i8* %55) #4
  %56 = load [2100 x double]*, [2100 x double]** %10, align 8
  %57 = bitcast [2100 x double]* %56 to i8*
  call void @free(i8* %57) #4
  %58 = load [1900 x double]*, [1900 x double]** %11, align 8
  %59 = bitcast [1900 x double]* %58 to i8*
  call void @free(i8* %59) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, [2100 x double]*, double*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [2100 x double]*, align 8
  %8 = alloca double*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca double, align 8
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store [2100 x double]* %2, [2100 x double]** %7, align 8
  store double* %3, double** %8, align 8
  %12 = load i32, i32* %6, align 4
  %13 = sitofp i32 %12 to double
  store double %13, double* %11, align 8
  store i32 0, i32* %9, align 4
  br label %14

; <label>:14:                                     ; preds = %28, %4
  %15 = load i32, i32* %9, align 4
  %16 = load i32, i32* %6, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %32

; <label>:18:                                     ; preds = %14
  %19 = load i32, i32* %9, align 4
  %20 = sitofp i32 %19 to double
  %21 = load double, double* %11, align 8
  %22 = fdiv double %20, %21
  %23 = fadd double 1.000000e+00, %22
  %24 = load double*, double** %8, align 8
  %25 = load i32, i32* %9, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, double* %24, i64 %26
  store double %23, double* %27, align 8
  br label %28

; <label>:28:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %30 = load i32, i32* %9, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %9, align 4
  br label %14

; <label>:32:                                     ; preds = %14
  store i32 0, i32* %9, align 4
  br label %33

; <label>:33:                                     ; preds = %65, %32
  %34 = load i32, i32* %9, align 4
  %35 = load i32, i32* %5, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %69

; <label>:37:                                     ; preds = %33
  store i32 0, i32* %10, align 4
  br label %38

; <label>:38:                                     ; preds = %60, %37
  %39 = load i32, i32* %10, align 4
  %40 = load i32, i32* %6, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %64

; <label>:42:                                     ; preds = %38
  %43 = load i32, i32* %9, align 4
  %44 = load i32, i32* %10, align 4
  %45 = add nsw i32 %43, %44
  %46 = load i32, i32* %6, align 4
  %47 = srem i32 %45, %46
  %48 = sitofp i32 %47 to double
  %49 = load i32, i32* %5, align 4
  %50 = mul nsw i32 5, %49
  %51 = sitofp i32 %50 to double
  %52 = fdiv double %48, %51
  %53 = load [2100 x double]*, [2100 x double]** %7, align 8
  %54 = load i32, i32* %9, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [2100 x double], [2100 x double]* %53, i64 %55
  %57 = load i32, i32* %10, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [2100 x double], [2100 x double]* %56, i64 0, i64 %58
  store double %52, double* %59, align 8
  br label %60

; <label>:60:                                     ; preds = %42
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %61 = add i64 %pgocount1, 1
  store i64 %61, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %62 = load i32, i32* %10, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %10, align 4
  br label %38

; <label>:64:                                     ; preds = %38
  br label %65

; <label>:65:                                     ; preds = %64
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %66 = add i64 %pgocount2, 1
  store i64 %66, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %67 = load i32, i32* %9, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %9, align 4
  br label %33

; <label>:69:                                     ; preds = %33
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %70 = add i64 %pgocount3, 1
  store i64 %70, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_atax(i32, i32, [2100 x double]*, double*, double*, double*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [2100 x double]*, align 8
  %10 = alloca double*, align 8
  %11 = alloca double*, align 8
  %12 = alloca double*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store [2100 x double]* %2, [2100 x double]** %9, align 8
  store double* %3, double** %10, align 8
  store double* %4, double** %11, align 8
  store double* %5, double** %12, align 8
  store i32 0, i32* %13, align 4
  br label %15

; <label>:15:                                     ; preds = %24, %6
  %16 = load i32, i32* %13, align 4
  %17 = load i32, i32* %8, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %28

; <label>:19:                                     ; preds = %15
  %20 = load double*, double** %11, align 8
  %21 = load i32, i32* %13, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds double, double* %20, i64 %22
  store double 0.000000e+00, double* %23, align 8
  br label %24

; <label>:24:                                     ; preds = %19
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 2)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 2)
  %26 = load i32, i32* %13, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %13, align 4
  br label %15

; <label>:28:                                     ; preds = %15
  store i32 0, i32* %13, align 4
  br label %29

; <label>:29:                                     ; preds = %106, %28
  %30 = load i32, i32* %13, align 4
  %31 = load i32, i32* %7, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %110

; <label>:33:                                     ; preds = %29
  %34 = load double*, double** %12, align 8
  %35 = load i32, i32* %13, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds double, double* %34, i64 %36
  store double 0.000000e+00, double* %37, align 8
  store i32 0, i32* %14, align 4
  br label %38

; <label>:38:                                     ; preds = %67, %33
  %39 = load i32, i32* %14, align 4
  %40 = load i32, i32* %8, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %71

; <label>:42:                                     ; preds = %38
  %43 = load double*, double** %12, align 8
  %44 = load i32, i32* %13, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds double, double* %43, i64 %45
  %47 = load double, double* %46, align 8
  %48 = load [2100 x double]*, [2100 x double]** %9, align 8
  %49 = load i32, i32* %13, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [2100 x double], [2100 x double]* %48, i64 %50
  %52 = load i32, i32* %14, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [2100 x double], [2100 x double]* %51, i64 0, i64 %53
  %55 = load double, double* %54, align 8
  %56 = load double*, double** %10, align 8
  %57 = load i32, i32* %14, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, double* %56, i64 %58
  %60 = load double, double* %59, align 8
  %61 = fmul double %55, %60
  %62 = fadd double %47, %61
  %63 = load double*, double** %12, align 8
  %64 = load i32, i32* %13, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds double, double* %63, i64 %65
  store double %62, double* %66, align 8
  br label %67

; <label>:67:                                     ; preds = %42
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 0)
  %68 = add i64 %pgocount1, 1
  store i64 %68, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 0)
  %69 = load i32, i32* %14, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %14, align 4
  br label %38

; <label>:71:                                     ; preds = %38
  store i32 0, i32* %14, align 4
  br label %72

; <label>:72:                                     ; preds = %101, %71
  %73 = load i32, i32* %14, align 4
  %74 = load i32, i32* %8, align 4
  %75 = icmp slt i32 %73, %74
  br i1 %75, label %76, label %105

; <label>:76:                                     ; preds = %72
  %77 = load double*, double** %11, align 8
  %78 = load i32, i32* %14, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds double, double* %77, i64 %79
  %81 = load double, double* %80, align 8
  %82 = load [2100 x double]*, [2100 x double]** %9, align 8
  %83 = load i32, i32* %13, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [2100 x double], [2100 x double]* %82, i64 %84
  %86 = load i32, i32* %14, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [2100 x double], [2100 x double]* %85, i64 0, i64 %87
  %89 = load double, double* %88, align 8
  %90 = load double*, double** %12, align 8
  %91 = load i32, i32* %13, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds double, double* %90, i64 %92
  %94 = load double, double* %93, align 8
  %95 = fmul double %89, %94
  %96 = fadd double %81, %95
  %97 = load double*, double** %11, align 8
  %98 = load i32, i32* %14, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds double, double* %97, i64 %99
  store double %96, double* %100, align 8
  br label %101

; <label>:101:                                    ; preds = %76
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 1)
  %102 = add i64 %pgocount2, 1
  store i64 %102, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 1)
  %103 = load i32, i32* %14, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, i32* %14, align 4
  br label %72

; <label>:105:                                    ; preds = %72
  br label %106

; <label>:106:                                    ; preds = %105
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 3)
  %107 = add i64 %pgocount3, 1
  store i64 %107, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 3)
  %108 = load i32, i32* %13, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %13, align 4
  br label %29

; <label>:110:                                    ; preds = %29
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 4)
  %111 = add i64 %pgocount4, 1
  store i64 %111, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_atax, i64 0, i64 4)
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

; <label>:10:                                     ; preds = %30, %2
  %11 = load i32, i32* %5, align 4
  %12 = load i32, i32* %3, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %34

; <label>:14:                                     ; preds = %10
  %15 = load i32, i32* %5, align 4
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %22

; <label>:22:                                     ; preds = %18, %14
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = load double*, double** %4, align 8
  %25 = load i32, i32* %5, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, double* %24, i64 %26
  %28 = load double, double* %27, align 8
  %29 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %28)
  br label %30

; <label>:30:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %32 = load i32, i32* %5, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %5, align 4
  br label %10

; <label>:34:                                     ; preds = %10
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
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

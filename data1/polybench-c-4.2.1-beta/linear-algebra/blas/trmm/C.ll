; ModuleID = 'B.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_trmm = private constant [16 x i8] c"B.ll:kernel_trmm"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 76979402370, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_trmm = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_trmm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1172305909204374240, i64 74483645111, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_trmm, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00main\01B.ll:init_array\01B.ll:kernel_trmm\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_trmm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca double, align 8
  %9 = alloca [1000 x [1000 x double]]*, align 8
  %10 = alloca [1000 x [1200 x double]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1000, i32* %6, align 4
  store i32 1200, i32* %7, align 4
  %11 = call i8* @polybench_alloc_data(i64 1000000, i32 8)
  %12 = bitcast i8* %11 to [1000 x [1000 x double]]*
  store [1000 x [1000 x double]]* %12, [1000 x [1000 x double]]** %9, align 8
  %13 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %14 = bitcast i8* %13 to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %14, [1000 x [1200 x double]]** %10, align 8
  %15 = load i32, i32* %6, align 4
  %16 = load i32, i32* %7, align 4
  %17 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %9, align 8
  %18 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %17, i32 0, i32 0
  %19 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %20 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %19, i32 0, i32 0
  call void @init_array(i32 %15, i32 %16, double* %8, [1000 x double]* %18, [1200 x double]* %20)
  call void (...) @polybench_timer_start()
  %21 = load i32, i32* %6, align 4
  %22 = load i32, i32* %7, align 4
  %23 = load double, double* %8, align 8
  %24 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %9, align 8
  %25 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %24, i32 0, i32 0
  %26 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %27 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %26, i32 0, i32 0
  call void @kernel_trmm(i32 %21, i32 %22, double %23, [1000 x double]* %25, [1200 x double]* %27)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %28 = load i32, i32* %4, align 4
  %29 = icmp sgt i32 %28, 42
  br i1 %29, label %30, label %43

; <label>:30:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %32 = load i8**, i8*** %5, align 8
  %33 = getelementptr inbounds i8*, i8** %32, i64 0
  %34 = load i8*, i8** %33, align 8
  %35 = call i32 @strcmp(i8* %34, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %43, label %37

; <label>:37:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %39 = load i32, i32* %6, align 4
  %40 = load i32, i32* %7, align 4
  %41 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %42 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %41, i32 0, i32 0
  call void @print_array(i32 %39, i32 %40, [1200 x double]* %42)
  br label %43

; <label>:43:                                     ; preds = %37, %30, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %45 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %9, align 8
  %46 = bitcast [1000 x [1000 x double]]* %45 to i8*
  call void @free(i8* %46) #4
  %47 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %48 = bitcast [1000 x [1200 x double]]* %47 to i8*
  call void @free(i8* %48) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, double*, [1000 x double]*, [1200 x double]*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca double*, align 8
  %9 = alloca [1000 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store double* %2, double** %8, align 8
  store [1000 x double]* %3, [1000 x double]** %9, align 8
  store [1200 x double]* %4, [1200 x double]** %10, align 8
  %13 = load double*, double** %8, align 8
  store double 1.500000e+00, double* %13, align 8
  store i32 0, i32* %11, align 4
  br label %14

; <label>:14:                                     ; preds = %80, %5
  %15 = load i32, i32* %11, align 4
  %16 = load i32, i32* %6, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %84

; <label>:18:                                     ; preds = %14
  store i32 0, i32* %12, align 4
  br label %19

; <label>:19:                                     ; preds = %40, %18
  %20 = load i32, i32* %12, align 4
  %21 = load i32, i32* %11, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %44

; <label>:23:                                     ; preds = %19
  %24 = load i32, i32* %11, align 4
  %25 = load i32, i32* %12, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32, i32* %6, align 4
  %28 = srem i32 %26, %27
  %29 = sitofp i32 %28 to double
  %30 = load i32, i32* %6, align 4
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %29, %31
  %33 = load [1000 x double]*, [1000 x double]** %9, align 8
  %34 = load i32, i32* %11, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %35
  %37 = load i32, i32* %12, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %36, i64 0, i64 %38
  store double %32, double* %39, align 8
  br label %40

; <label>:40:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %41 = add i64 %pgocount, 1
  store i64 %41, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %42 = load i32, i32* %12, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %12, align 4
  br label %19

; <label>:44:                                     ; preds = %19
  %45 = load [1000 x double]*, [1000 x double]** %9, align 8
  %46 = load i32, i32* %11, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %45, i64 %47
  %49 = load i32, i32* %11, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 0, i64 %50
  store double 1.000000e+00, double* %51, align 8
  store i32 0, i32* %12, align 4
  br label %52

; <label>:52:                                     ; preds = %75, %44
  %53 = load i32, i32* %12, align 4
  %54 = load i32, i32* %7, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %79

; <label>:56:                                     ; preds = %52
  %57 = load i32, i32* %7, align 4
  %58 = load i32, i32* %11, align 4
  %59 = load i32, i32* %12, align 4
  %60 = sub nsw i32 %58, %59
  %61 = add nsw i32 %57, %60
  %62 = load i32, i32* %7, align 4
  %63 = srem i32 %61, %62
  %64 = sitofp i32 %63 to double
  %65 = load i32, i32* %7, align 4
  %66 = sitofp i32 %65 to double
  %67 = fdiv double %64, %66
  %68 = load [1200 x double]*, [1200 x double]** %10, align 8
  %69 = load i32, i32* %11, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %70
  %72 = load i32, i32* %12, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 0, i64 %73
  store double %67, double* %74, align 8
  br label %75

; <label>:75:                                     ; preds = %56
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %76 = add i64 %pgocount1, 1
  store i64 %76, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %77 = load i32, i32* %12, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %12, align 4
  br label %52

; <label>:79:                                     ; preds = %52
  br label %80

; <label>:80:                                     ; preds = %79
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %81 = add i64 %pgocount2, 1
  store i64 %81, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %82 = load i32, i32* %11, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, i32* %11, align 4
  br label %14

; <label>:84:                                     ; preds = %14
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %85 = add i64 %pgocount3, 1
  store i64 %85, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_trmm(i32, i32, double, [1000 x double]*, [1200 x double]*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca double, align 8
  %9 = alloca [1000 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store double %2, double* %8, align 8
  store [1000 x double]* %3, [1000 x double]** %9, align 8
  store [1200 x double]* %4, [1200 x double]** %10, align 8
  store i32 0, i32* %11, align 4
  br label %14

; <label>:14:                                     ; preds = %84, %5
  %15 = load i32, i32* %11, align 4
  %16 = load i32, i32* %6, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %88

; <label>:18:                                     ; preds = %14
  store i32 0, i32* %12, align 4
  br label %19

; <label>:19:                                     ; preds = %79, %18
  %20 = load i32, i32* %12, align 4
  %21 = load i32, i32* %7, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %83

; <label>:23:                                     ; preds = %19
  %24 = load i32, i32* %11, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %13, align 4
  br label %26

; <label>:26:                                     ; preds = %57, %23
  %27 = load i32, i32* %13, align 4
  %28 = load i32, i32* %6, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %61

; <label>:30:                                     ; preds = %26
  %31 = load [1000 x double]*, [1000 x double]** %9, align 8
  %32 = load i32, i32* %13, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %31, i64 %33
  %35 = load i32, i32* %11, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %34, i64 0, i64 %36
  %38 = load double, double* %37, align 8
  %39 = load [1200 x double]*, [1200 x double]** %10, align 8
  %40 = load i32, i32* %13, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %39, i64 %41
  %43 = load i32, i32* %12, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %42, i64 0, i64 %44
  %46 = load double, double* %45, align 8
  %47 = fmul double %38, %46
  %48 = load [1200 x double]*, [1200 x double]** %10, align 8
  %49 = load i32, i32* %11, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %48, i64 %50
  %52 = load i32, i32* %12, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %51, i64 0, i64 %53
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %47
  store double %56, double* %54, align 8
  br label %57

; <label>:57:                                     ; preds = %30
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 0)
  %58 = add i64 %pgocount, 1
  store i64 %58, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 0)
  %59 = load i32, i32* %13, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %13, align 4
  br label %26

; <label>:61:                                     ; preds = %26
  %62 = load double, double* %8, align 8
  %63 = load [1200 x double]*, [1200 x double]** %10, align 8
  %64 = load i32, i32* %11, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %63, i64 %65
  %67 = load i32, i32* %12, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 0, i64 %68
  %70 = load double, double* %69, align 8
  %71 = fmul double %62, %70
  %72 = load [1200 x double]*, [1200 x double]** %10, align 8
  %73 = load i32, i32* %11, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %74
  %76 = load i32, i32* %12, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %75, i64 0, i64 %77
  store double %71, double* %78, align 8
  br label %79

; <label>:79:                                     ; preds = %61
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 1)
  %80 = add i64 %pgocount1, 1
  store i64 %80, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 1)
  %81 = load i32, i32* %12, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* %12, align 4
  br label %19

; <label>:83:                                     ; preds = %19
  br label %84

; <label>:84:                                     ; preds = %83
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 2)
  %85 = add i64 %pgocount2, 1
  store i64 %85, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 2)
  %86 = load i32, i32* %11, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %11, align 4
  br label %14

; <label>:88:                                     ; preds = %14
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 3)
  %89 = add i64 %pgocount3, 1
  store i64 %89, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 3)
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store [1200 x double]* %2, [1200 x double]** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %7, align 4
  br label %13

; <label>:13:                                     ; preds = %50, %3
  %14 = load i32, i32* %7, align 4
  %15 = load i32, i32* %4, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %54

; <label>:17:                                     ; preds = %13
  store i32 0, i32* %8, align 4
  br label %18

; <label>:18:                                     ; preds = %45, %17
  %19 = load i32, i32* %8, align 4
  %20 = load i32, i32* %5, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %49

; <label>:22:                                     ; preds = %18
  %23 = load i32, i32* %7, align 4
  %24 = load i32, i32* %4, align 4
  %25 = mul nsw i32 %23, %24
  %26 = load i32, i32* %8, align 4
  %27 = add nsw i32 %25, %26
  %28 = srem i32 %27, 20
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %34

; <label>:30:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %34

; <label>:34:                                     ; preds = %30, %22
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = load [1200 x double]*, [1200 x double]** %6, align 8
  %37 = load i32, i32* %7, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %36, i64 %38
  %40 = load i32, i32* %8, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %39, i64 0, i64 %41
  %43 = load double, double* %42, align 8
  %44 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %43)
  br label %45

; <label>:45:                                     ; preds = %34
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %47 = load i32, i32* %8, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %8, align 4
  br label %18

; <label>:49:                                     ; preds = %18
  br label %50

; <label>:50:                                     ; preds = %49
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %52 = load i32, i32* %7, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %7, align 4
  br label %13

; <label>:54:                                     ; preds = %13
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %55 = add i64 %pgocount3, 1
  store i64 %55, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %57 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %59 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %58, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
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

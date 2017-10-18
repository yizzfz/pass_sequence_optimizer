; ModuleID = 'B.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_fdtd_2d = private constant [19 x i8] c"B.ll:kernel_fdtd_2d"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 73744657289, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_fdtd_2d = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_fdtd_2d = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8235799579896179938, i64 181634893873, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 178670999348, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [59 x i8] c"9\00main\01B.ll:init_array\01B.ll:kernel_fdtd_2d\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_fdtd_2d to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [1000 x [1200 x double]]*, align 8
  %10 = alloca [1000 x [1200 x double]]*, align 8
  %11 = alloca [1000 x [1200 x double]]*, align 8
  %12 = alloca [500 x double]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 500, i32* %6, align 4
  store i32 1000, i32* %7, align 4
  store i32 1200, i32* %8, align 4
  %13 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %14 = bitcast i8* %13 to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %14, [1000 x [1200 x double]]** %9, align 8
  %15 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %16 = bitcast i8* %15 to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %16, [1000 x [1200 x double]]** %10, align 8
  %17 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %18 = bitcast i8* %17 to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %18, [1000 x [1200 x double]]** %11, align 8
  %19 = call i8* @polybench_alloc_data(i64 500, i32 8)
  %20 = bitcast i8* %19 to [500 x double]*
  store [500 x double]* %20, [500 x double]** %12, align 8
  %21 = load i32, i32* %6, align 4
  %22 = load i32, i32* %7, align 4
  %23 = load i32, i32* %8, align 4
  %24 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %9, align 8
  %25 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %24, i32 0, i32 0
  %26 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %27 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %26, i32 0, i32 0
  %28 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %11, align 8
  %29 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %28, i32 0, i32 0
  %30 = load [500 x double]*, [500 x double]** %12, align 8
  %31 = getelementptr inbounds [500 x double], [500 x double]* %30, i32 0, i32 0
  call void @init_array(i32 %21, i32 %22, i32 %23, [1200 x double]* %25, [1200 x double]* %27, [1200 x double]* %29, double* %31)
  call void (...) @polybench_timer_start()
  %32 = load i32, i32* %6, align 4
  %33 = load i32, i32* %7, align 4
  %34 = load i32, i32* %8, align 4
  %35 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %9, align 8
  %36 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %35, i32 0, i32 0
  %37 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %38 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %37, i32 0, i32 0
  %39 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %11, align 8
  %40 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %39, i32 0, i32 0
  %41 = load [500 x double]*, [500 x double]** %12, align 8
  %42 = getelementptr inbounds [500 x double], [500 x double]* %41, i32 0, i32 0
  call void @kernel_fdtd_2d(i32 %32, i32 %33, i32 %34, [1200 x double]* %36, [1200 x double]* %38, [1200 x double]* %40, double* %42)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %43 = load i32, i32* %4, align 4
  %44 = icmp sgt i32 %43, 42
  br i1 %44, label %45, label %62

; <label>:45:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %46 = add i64 %pgocount, 1
  store i64 %46, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %47 = load i8**, i8*** %5, align 8
  %48 = getelementptr inbounds i8*, i8** %47, i64 0
  %49 = load i8*, i8** %48, align 8
  %50 = call i32 @strcmp(i8* %49, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %62, label %52

; <label>:52:                                     ; preds = %45
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %53 = add i64 %pgocount1, 1
  store i64 %53, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %54 = load i32, i32* %7, align 4
  %55 = load i32, i32* %8, align 4
  %56 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %9, align 8
  %57 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %56, i32 0, i32 0
  %58 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %59 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %58, i32 0, i32 0
  %60 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %11, align 8
  %61 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %60, i32 0, i32 0
  call void @print_array(i32 %54, i32 %55, [1200 x double]* %57, [1200 x double]* %59, [1200 x double]* %61)
  br label %62

; <label>:62:                                     ; preds = %52, %45, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %63 = add i64 %pgocount2, 1
  store i64 %63, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %64 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %9, align 8
  %65 = bitcast [1000 x [1200 x double]]* %64 to i8*
  call void @free(i8* %65) #4
  %66 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %67 = bitcast [1000 x [1200 x double]]* %66 to i8*
  call void @free(i8* %67) #4
  %68 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %11, align 8
  %69 = bitcast [1000 x [1200 x double]]* %68 to i8*
  call void @free(i8* %69) #4
  %70 = load [500 x double]*, [500 x double]** %12, align 8
  %71 = bitcast [500 x double]* %70 to i8*
  call void @free(i8* %71) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca [1200 x double]*, align 8
  %12 = alloca [1200 x double]*, align 8
  %13 = alloca [1200 x double]*, align 8
  %14 = alloca double*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 %0, i32* %8, align 4
  store i32 %1, i32* %9, align 4
  store i32 %2, i32* %10, align 4
  store [1200 x double]* %3, [1200 x double]** %11, align 8
  store [1200 x double]* %4, [1200 x double]** %12, align 8
  store [1200 x double]* %5, [1200 x double]** %13, align 8
  store double* %6, double** %14, align 8
  store i32 0, i32* %15, align 4
  br label %17

; <label>:17:                                     ; preds = %28, %7
  %18 = load i32, i32* %15, align 4
  %19 = load i32, i32* %8, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %32

; <label>:21:                                     ; preds = %17
  %22 = load i32, i32* %15, align 4
  %23 = sitofp i32 %22 to double
  %24 = load double*, double** %14, align 8
  %25 = load i32, i32* %15, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, double* %24, i64 %26
  store double %23, double* %27, align 8
  br label %28

; <label>:28:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %30 = load i32, i32* %15, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %15, align 4
  br label %17

; <label>:32:                                     ; preds = %17
  store i32 0, i32* %15, align 4
  br label %33

; <label>:33:                                     ; preds = %96, %32
  %34 = load i32, i32* %15, align 4
  %35 = load i32, i32* %9, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %100

; <label>:37:                                     ; preds = %33
  store i32 0, i32* %16, align 4
  br label %38

; <label>:38:                                     ; preds = %91, %37
  %39 = load i32, i32* %16, align 4
  %40 = load i32, i32* %10, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %95

; <label>:42:                                     ; preds = %38
  %43 = load i32, i32* %15, align 4
  %44 = sitofp i32 %43 to double
  %45 = load i32, i32* %16, align 4
  %46 = add nsw i32 %45, 1
  %47 = sitofp i32 %46 to double
  %48 = fmul double %44, %47
  %49 = load i32, i32* %9, align 4
  %50 = sitofp i32 %49 to double
  %51 = fdiv double %48, %50
  %52 = load [1200 x double]*, [1200 x double]** %11, align 8
  %53 = load i32, i32* %15, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %52, i64 %54
  %56 = load i32, i32* %16, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %55, i64 0, i64 %57
  store double %51, double* %58, align 8
  %59 = load i32, i32* %15, align 4
  %60 = sitofp i32 %59 to double
  %61 = load i32, i32* %16, align 4
  %62 = add nsw i32 %61, 2
  %63 = sitofp i32 %62 to double
  %64 = fmul double %60, %63
  %65 = load i32, i32* %10, align 4
  %66 = sitofp i32 %65 to double
  %67 = fdiv double %64, %66
  %68 = load [1200 x double]*, [1200 x double]** %12, align 8
  %69 = load i32, i32* %15, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %70
  %72 = load i32, i32* %16, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 0, i64 %73
  store double %67, double* %74, align 8
  %75 = load i32, i32* %15, align 4
  %76 = sitofp i32 %75 to double
  %77 = load i32, i32* %16, align 4
  %78 = add nsw i32 %77, 3
  %79 = sitofp i32 %78 to double
  %80 = fmul double %76, %79
  %81 = load i32, i32* %9, align 4
  %82 = sitofp i32 %81 to double
  %83 = fdiv double %80, %82
  %84 = load [1200 x double]*, [1200 x double]** %13, align 8
  %85 = load i32, i32* %15, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %84, i64 %86
  %88 = load i32, i32* %16, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %87, i64 0, i64 %89
  store double %83, double* %90, align 8
  br label %91

; <label>:91:                                     ; preds = %42
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %92 = add i64 %pgocount1, 1
  store i64 %92, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %93 = load i32, i32* %16, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %16, align 4
  br label %38

; <label>:95:                                     ; preds = %38
  br label %96

; <label>:96:                                     ; preds = %95
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %97 = add i64 %pgocount2, 1
  store i64 %97, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %98 = load i32, i32* %15, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, i32* %15, align 4
  br label %33

; <label>:100:                                    ; preds = %33
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %101 = add i64 %pgocount3, 1
  store i64 %101, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca [1200 x double]*, align 8
  %12 = alloca [1200 x double]*, align 8
  %13 = alloca [1200 x double]*, align 8
  %14 = alloca double*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 %0, i32* %8, align 4
  store i32 %1, i32* %9, align 4
  store i32 %2, i32* %10, align 4
  store [1200 x double]* %3, [1200 x double]** %11, align 8
  store [1200 x double]* %4, [1200 x double]** %12, align 8
  store [1200 x double]* %5, [1200 x double]** %13, align 8
  store double* %6, double** %14, align 8
  store i32 0, i32* %15, align 4
  br label %18

; <label>:18:                                     ; preds = %229, %7
  %19 = load i32, i32* %15, align 4
  %20 = load i32, i32* %8, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %233

; <label>:22:                                     ; preds = %18
  store i32 0, i32* %17, align 4
  br label %23

; <label>:23:                                     ; preds = %38, %22
  %24 = load i32, i32* %17, align 4
  %25 = load i32, i32* %10, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %42

; <label>:27:                                     ; preds = %23
  %28 = load double*, double** %14, align 8
  %29 = load i32, i32* %15, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds double, double* %28, i64 %30
  %32 = load double, double* %31, align 8
  %33 = load [1200 x double]*, [1200 x double]** %12, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %33, i64 0
  %35 = load i32, i32* %17, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %34, i64 0, i64 %36
  store double %32, double* %37, align 8
  br label %38

; <label>:38:                                     ; preds = %27
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 3)
  %39 = add i64 %pgocount, 1
  store i64 %39, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 3)
  %40 = load i32, i32* %17, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %17, align 4
  br label %23

; <label>:42:                                     ; preds = %23
  store i32 1, i32* %16, align 4
  br label %43

; <label>:43:                                     ; preds = %93, %42
  %44 = load i32, i32* %16, align 4
  %45 = load i32, i32* %9, align 4
  %46 = icmp slt i32 %44, %45
  br i1 %46, label %47, label %97

; <label>:47:                                     ; preds = %43
  store i32 0, i32* %17, align 4
  br label %48

; <label>:48:                                     ; preds = %88, %47
  %49 = load i32, i32* %17, align 4
  %50 = load i32, i32* %10, align 4
  %51 = icmp slt i32 %49, %50
  br i1 %51, label %52, label %92

; <label>:52:                                     ; preds = %48
  %53 = load [1200 x double]*, [1200 x double]** %12, align 8
  %54 = load i32, i32* %16, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %53, i64 %55
  %57 = load i32, i32* %17, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %56, i64 0, i64 %58
  %60 = load double, double* %59, align 8
  %61 = load [1200 x double]*, [1200 x double]** %13, align 8
  %62 = load i32, i32* %16, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %61, i64 %63
  %65 = load i32, i32* %17, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %64, i64 0, i64 %66
  %68 = load double, double* %67, align 8
  %69 = load [1200 x double]*, [1200 x double]** %13, align 8
  %70 = load i32, i32* %16, align 4
  %71 = sub nsw i32 %70, 1
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %69, i64 %72
  %74 = load i32, i32* %17, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %73, i64 0, i64 %75
  %77 = load double, double* %76, align 8
  %78 = fsub double %68, %77
  %79 = fmul double 5.000000e-01, %78
  %80 = fsub double %60, %79
  %81 = load [1200 x double]*, [1200 x double]** %12, align 8
  %82 = load i32, i32* %16, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %81, i64 %83
  %85 = load i32, i32* %17, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %84, i64 0, i64 %86
  store double %80, double* %87, align 8
  br label %88

; <label>:88:                                     ; preds = %52
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 0)
  %89 = add i64 %pgocount1, 1
  store i64 %89, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 0)
  %90 = load i32, i32* %17, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %17, align 4
  br label %48

; <label>:92:                                     ; preds = %48
  br label %93

; <label>:93:                                     ; preds = %92
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 4)
  %94 = add i64 %pgocount2, 1
  store i64 %94, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 4)
  %95 = load i32, i32* %16, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* %16, align 4
  br label %43

; <label>:97:                                     ; preds = %43
  store i32 0, i32* %16, align 4
  br label %98

; <label>:98:                                     ; preds = %148, %97
  %99 = load i32, i32* %16, align 4
  %100 = load i32, i32* %9, align 4
  %101 = icmp slt i32 %99, %100
  br i1 %101, label %102, label %152

; <label>:102:                                    ; preds = %98
  store i32 1, i32* %17, align 4
  br label %103

; <label>:103:                                    ; preds = %143, %102
  %104 = load i32, i32* %17, align 4
  %105 = load i32, i32* %10, align 4
  %106 = icmp slt i32 %104, %105
  br i1 %106, label %107, label %147

; <label>:107:                                    ; preds = %103
  %108 = load [1200 x double]*, [1200 x double]** %11, align 8
  %109 = load i32, i32* %16, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %108, i64 %110
  %112 = load i32, i32* %17, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %111, i64 0, i64 %113
  %115 = load double, double* %114, align 8
  %116 = load [1200 x double]*, [1200 x double]** %13, align 8
  %117 = load i32, i32* %16, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %116, i64 %118
  %120 = load i32, i32* %17, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %119, i64 0, i64 %121
  %123 = load double, double* %122, align 8
  %124 = load [1200 x double]*, [1200 x double]** %13, align 8
  %125 = load i32, i32* %16, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %124, i64 %126
  %128 = load i32, i32* %17, align 4
  %129 = sub nsw i32 %128, 1
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %127, i64 0, i64 %130
  %132 = load double, double* %131, align 8
  %133 = fsub double %123, %132
  %134 = fmul double 5.000000e-01, %133
  %135 = fsub double %115, %134
  %136 = load [1200 x double]*, [1200 x double]** %11, align 8
  %137 = load i32, i32* %16, align 4
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %136, i64 %138
  %140 = load i32, i32* %17, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %139, i64 0, i64 %141
  store double %135, double* %142, align 8
  br label %143

; <label>:143:                                    ; preds = %107
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 1)
  %144 = add i64 %pgocount3, 1
  store i64 %144, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 1)
  %145 = load i32, i32* %17, align 4
  %146 = add nsw i32 %145, 1
  store i32 %146, i32* %17, align 4
  br label %103

; <label>:147:                                    ; preds = %103
  br label %148

; <label>:148:                                    ; preds = %147
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 5)
  %149 = add i64 %pgocount4, 1
  store i64 %149, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 5)
  %150 = load i32, i32* %16, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* %16, align 4
  br label %98

; <label>:152:                                    ; preds = %98
  store i32 0, i32* %16, align 4
  br label %153

; <label>:153:                                    ; preds = %224, %152
  %154 = load i32, i32* %16, align 4
  %155 = load i32, i32* %9, align 4
  %156 = sub nsw i32 %155, 1
  %157 = icmp slt i32 %154, %156
  br i1 %157, label %158, label %228

; <label>:158:                                    ; preds = %153
  store i32 0, i32* %17, align 4
  br label %159

; <label>:159:                                    ; preds = %219, %158
  %160 = load i32, i32* %17, align 4
  %161 = load i32, i32* %10, align 4
  %162 = sub nsw i32 %161, 1
  %163 = icmp slt i32 %160, %162
  br i1 %163, label %164, label %223

; <label>:164:                                    ; preds = %159
  %165 = load [1200 x double]*, [1200 x double]** %13, align 8
  %166 = load i32, i32* %16, align 4
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds [1200 x double], [1200 x double]* %165, i64 %167
  %169 = load i32, i32* %17, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %168, i64 0, i64 %170
  %172 = load double, double* %171, align 8
  %173 = load [1200 x double]*, [1200 x double]** %11, align 8
  %174 = load i32, i32* %16, align 4
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %173, i64 %175
  %177 = load i32, i32* %17, align 4
  %178 = add nsw i32 %177, 1
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %176, i64 0, i64 %179
  %181 = load double, double* %180, align 8
  %182 = load [1200 x double]*, [1200 x double]** %11, align 8
  %183 = load i32, i32* %16, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [1200 x double], [1200 x double]* %182, i64 %184
  %186 = load i32, i32* %17, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [1200 x double], [1200 x double]* %185, i64 0, i64 %187
  %189 = load double, double* %188, align 8
  %190 = fsub double %181, %189
  %191 = load [1200 x double]*, [1200 x double]** %12, align 8
  %192 = load i32, i32* %16, align 4
  %193 = add nsw i32 %192, 1
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds [1200 x double], [1200 x double]* %191, i64 %194
  %196 = load i32, i32* %17, align 4
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %195, i64 0, i64 %197
  %199 = load double, double* %198, align 8
  %200 = fadd double %190, %199
  %201 = load [1200 x double]*, [1200 x double]** %12, align 8
  %202 = load i32, i32* %16, align 4
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds [1200 x double], [1200 x double]* %201, i64 %203
  %205 = load i32, i32* %17, align 4
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds [1200 x double], [1200 x double]* %204, i64 0, i64 %206
  %208 = load double, double* %207, align 8
  %209 = fsub double %200, %208
  %210 = fmul double 7.000000e-01, %209
  %211 = fsub double %172, %210
  %212 = load [1200 x double]*, [1200 x double]** %13, align 8
  %213 = load i32, i32* %16, align 4
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [1200 x double], [1200 x double]* %212, i64 %214
  %216 = load i32, i32* %17, align 4
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds [1200 x double], [1200 x double]* %215, i64 0, i64 %217
  store double %211, double* %218, align 8
  br label %219

; <label>:219:                                    ; preds = %164
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 2)
  %220 = add i64 %pgocount5, 1
  store i64 %220, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 2)
  %221 = load i32, i32* %17, align 4
  %222 = add nsw i32 %221, 1
  store i32 %222, i32* %17, align 4
  br label %159

; <label>:223:                                    ; preds = %159
  br label %224

; <label>:224:                                    ; preds = %223
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 6)
  %225 = add i64 %pgocount6, 1
  store i64 %225, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 6)
  %226 = load i32, i32* %16, align 4
  %227 = add nsw i32 %226, 1
  store i32 %227, i32* %16, align 4
  br label %153

; <label>:228:                                    ; preds = %153
  br label %229

; <label>:229:                                    ; preds = %228
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 7)
  %230 = add i64 %pgocount7, 1
  store i64 %230, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 7)
  %231 = load i32, i32* %15, align 4
  %232 = add nsw i32 %231, 1
  store i32 %232, i32* %15, align 4
  br label %18

; <label>:233:                                    ; preds = %18
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 8)
  %234 = add i64 %pgocount8, 1
  store i64 %234, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 8)
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [1200 x double]*, align 8
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store [1200 x double]* %2, [1200 x double]** %8, align 8
  store [1200 x double]* %3, [1200 x double]** %9, align 8
  store [1200 x double]* %4, [1200 x double]** %10, align 8
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %11, align 4
  br label %17

; <label>:17:                                     ; preds = %54, %5
  %18 = load i32, i32* %11, align 4
  %19 = load i32, i32* %6, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %58

; <label>:21:                                     ; preds = %17
  store i32 0, i32* %12, align 4
  br label %22

; <label>:22:                                     ; preds = %49, %21
  %23 = load i32, i32* %12, align 4
  %24 = load i32, i32* %7, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %53

; <label>:26:                                     ; preds = %22
  %27 = load i32, i32* %11, align 4
  %28 = load i32, i32* %6, align 4
  %29 = mul nsw i32 %27, %28
  %30 = load i32, i32* %12, align 4
  %31 = add nsw i32 %29, %30
  %32 = srem i32 %31, 20
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %38

; <label>:34:                                     ; preds = %26
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %35 = add i64 %pgocount, 1
  store i64 %35, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %38

; <label>:38:                                     ; preds = %34, %26
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = load [1200 x double]*, [1200 x double]** %8, align 8
  %41 = load i32, i32* %11, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %40, i64 %42
  %44 = load i32, i32* %12, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %43, i64 0, i64 %45
  %47 = load double, double* %46, align 8
  %48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %47)
  br label %49

; <label>:49:                                     ; preds = %38
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %50 = add i64 %pgocount1, 1
  store i64 %50, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %51 = load i32, i32* %12, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %12, align 4
  br label %22

; <label>:53:                                     ; preds = %22
  br label %54

; <label>:54:                                     ; preds = %53
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 6)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 6)
  %56 = load i32, i32* %11, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %11, align 4
  br label %17

; <label>:58:                                     ; preds = %17
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %60 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %59, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %62 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %61, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %64 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %63, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0))
  store i32 0, i32* %11, align 4
  br label %65

; <label>:65:                                     ; preds = %102, %58
  %66 = load i32, i32* %11, align 4
  %67 = load i32, i32* %6, align 4
  %68 = icmp slt i32 %66, %67
  br i1 %68, label %69, label %106

; <label>:69:                                     ; preds = %65
  store i32 0, i32* %12, align 4
  br label %70

; <label>:70:                                     ; preds = %97, %69
  %71 = load i32, i32* %12, align 4
  %72 = load i32, i32* %7, align 4
  %73 = icmp slt i32 %71, %72
  br i1 %73, label %74, label %101

; <label>:74:                                     ; preds = %70
  %75 = load i32, i32* %11, align 4
  %76 = load i32, i32* %6, align 4
  %77 = mul nsw i32 %75, %76
  %78 = load i32, i32* %12, align 4
  %79 = add nsw i32 %77, %78
  %80 = srem i32 %79, 20
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %82, label %86

; <label>:82:                                     ; preds = %74
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %83 = add i64 %pgocount3, 1
  store i64 %83, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %84 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %85 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %84, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %86

; <label>:86:                                     ; preds = %82, %74
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %88 = load [1200 x double]*, [1200 x double]** %9, align 8
  %89 = load i32, i32* %11, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %88, i64 %90
  %92 = load i32, i32* %12, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %91, i64 0, i64 %93
  %95 = load double, double* %94, align 8
  %96 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %87, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %95)
  br label %97

; <label>:97:                                     ; preds = %86
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %98 = add i64 %pgocount4, 1
  store i64 %98, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %99 = load i32, i32* %12, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %12, align 4
  br label %70

; <label>:101:                                    ; preds = %70
  br label %102

; <label>:102:                                    ; preds = %101
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 7)
  %103 = add i64 %pgocount5, 1
  store i64 %103, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 7)
  %104 = load i32, i32* %11, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %11, align 4
  br label %65

; <label>:106:                                    ; preds = %65
  %107 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %108 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %107, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0))
  %109 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %110 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %109, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0))
  store i32 0, i32* %11, align 4
  br label %111

; <label>:111:                                    ; preds = %148, %106
  %112 = load i32, i32* %11, align 4
  %113 = load i32, i32* %6, align 4
  %114 = icmp slt i32 %112, %113
  br i1 %114, label %115, label %152

; <label>:115:                                    ; preds = %111
  store i32 0, i32* %12, align 4
  br label %116

; <label>:116:                                    ; preds = %143, %115
  %117 = load i32, i32* %12, align 4
  %118 = load i32, i32* %7, align 4
  %119 = icmp slt i32 %117, %118
  br i1 %119, label %120, label %147

; <label>:120:                                    ; preds = %116
  %121 = load i32, i32* %11, align 4
  %122 = load i32, i32* %6, align 4
  %123 = mul nsw i32 %121, %122
  %124 = load i32, i32* %12, align 4
  %125 = add nsw i32 %123, %124
  %126 = srem i32 %125, 20
  %127 = icmp eq i32 %126, 0
  br i1 %127, label %128, label %132

; <label>:128:                                    ; preds = %120
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  %129 = add i64 %pgocount6, 1
  store i64 %129, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  %130 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %131 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %130, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %132

; <label>:132:                                    ; preds = %128, %120
  %133 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %134 = load [1200 x double]*, [1200 x double]** %10, align 8
  %135 = load i32, i32* %11, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %134, i64 %136
  %138 = load i32, i32* %12, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %137, i64 0, i64 %139
  %141 = load double, double* %140, align 8
  %142 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %133, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %141)
  br label %143

; <label>:143:                                    ; preds = %132
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %144 = add i64 %pgocount7, 1
  store i64 %144, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %145 = load i32, i32* %12, align 4
  %146 = add nsw i32 %145, 1
  store i32 %146, i32* %12, align 4
  br label %116

; <label>:147:                                    ; preds = %116
  br label %148

; <label>:148:                                    ; preds = %147
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 8)
  %149 = add i64 %pgocount8, 1
  store i64 %149, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 8)
  %150 = load i32, i32* %11, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* %11, align 4
  br label %111

; <label>:152:                                    ; preds = %111
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 9)
  %153 = add i64 %pgocount9, 1
  store i64 %153, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_print_array, i64 0, i64 9)
  %154 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %155 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %154, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0))
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

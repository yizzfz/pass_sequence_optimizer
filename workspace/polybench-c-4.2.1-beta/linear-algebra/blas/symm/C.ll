; ModuleID = 'B.ll'
source_filename = "symm.c"
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
@__profn_B.ll_kernel_symm = private constant [16 x i8] c"B.ll:kernel_symm"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 118085364847, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_symm = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_symm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7942146524714263212, i64 74483645111, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_symm, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00main\01B.ll:init_array\01B.ll:kernel_symm\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_symm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca [1000 x [1200 x double]]*, align 8
  %11 = alloca [1000 x [1000 x double]]*, align 8
  %12 = alloca [1000 x [1200 x double]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1000, i32* %6, align 4
  store i32 1200, i32* %7, align 4
  %13 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %14 = bitcast i8* %13 to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %14, [1000 x [1200 x double]]** %10, align 8
  %15 = call i8* @polybench_alloc_data(i64 1000000, i32 8)
  %16 = bitcast i8* %15 to [1000 x [1000 x double]]*
  store [1000 x [1000 x double]]* %16, [1000 x [1000 x double]]** %11, align 8
  %17 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %18 = bitcast i8* %17 to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %18, [1000 x [1200 x double]]** %12, align 8
  %19 = load i32, i32* %6, align 4
  %20 = load i32, i32* %7, align 4
  %21 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %22 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %21, i32 0, i32 0
  %23 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %11, align 8
  %24 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %23, i32 0, i32 0
  %25 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %12, align 8
  %26 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %25, i32 0, i32 0
  call void @init_array(i32 %19, i32 %20, double* %8, double* %9, [1200 x double]* %22, [1000 x double]* %24, [1200 x double]* %26)
  call void (...) @polybench_timer_start()
  %27 = load i32, i32* %6, align 4
  %28 = load i32, i32* %7, align 4
  %29 = load double, double* %8, align 8
  %30 = load double, double* %9, align 8
  %31 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %32 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %31, i32 0, i32 0
  %33 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %11, align 8
  %34 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %33, i32 0, i32 0
  %35 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %12, align 8
  %36 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %35, i32 0, i32 0
  call void @kernel_symm(i32 %27, i32 %28, double %29, double %30, [1200 x double]* %32, [1000 x double]* %34, [1200 x double]* %36)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %37 = load i32, i32* %4, align 4
  %38 = icmp sgt i32 %37, 42
  br i1 %38, label %39, label %52

; <label>:39:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %41 = load i8**, i8*** %5, align 8
  %42 = getelementptr inbounds i8*, i8** %41, i64 0
  %43 = load i8*, i8** %42, align 8
  %44 = call i32 @strcmp(i8* %43, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %52, label %46

; <label>:46:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %48 = load i32, i32* %6, align 4
  %49 = load i32, i32* %7, align 4
  %50 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %51 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %50, i32 0, i32 0
  call void @print_array(i32 %48, i32 %49, [1200 x double]* %51)
  br label %52

; <label>:52:                                     ; preds = %46, %39, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %53 = add i64 %pgocount2, 1
  store i64 %53, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %54 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %55 = bitcast [1000 x [1200 x double]]* %54 to i8*
  call void @free(i8* %55) #4
  %56 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %11, align 8
  %57 = bitcast [1000 x [1000 x double]]* %56 to i8*
  call void @free(i8* %57) #4
  %58 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %12, align 8
  %59 = bitcast [1000 x [1200 x double]]* %58 to i8*
  call void @free(i8* %59) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double*, align 8
  %11 = alloca double*, align 8
  %12 = alloca [1200 x double]*, align 8
  %13 = alloca [1000 x double]*, align 8
  %14 = alloca [1200 x double]*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 %0, i32* %8, align 4
  store i32 %1, i32* %9, align 4
  store double* %2, double** %10, align 8
  store double* %3, double** %11, align 8
  store [1200 x double]* %4, [1200 x double]** %12, align 8
  store [1000 x double]* %5, [1000 x double]** %13, align 8
  store [1200 x double]* %6, [1200 x double]** %14, align 8
  %17 = load double*, double** %10, align 8
  store double 1.500000e+00, double* %17, align 8
  %18 = load double*, double** %11, align 8
  store double 1.200000e+00, double* %18, align 8
  store i32 0, i32* %15, align 4
  br label %19

; <label>:19:                                     ; preds = %66, %7
  %20 = load i32, i32* %15, align 4
  %21 = load i32, i32* %8, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %70

; <label>:23:                                     ; preds = %19
  store i32 0, i32* %16, align 4
  br label %24

; <label>:24:                                     ; preds = %61, %23
  %25 = load i32, i32* %16, align 4
  %26 = load i32, i32* %9, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %65

; <label>:28:                                     ; preds = %24
  %29 = load i32, i32* %15, align 4
  %30 = load i32, i32* %16, align 4
  %31 = add nsw i32 %29, %30
  %32 = srem i32 %31, 100
  %33 = sitofp i32 %32 to double
  %34 = load i32, i32* %8, align 4
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %33, %35
  %37 = load [1200 x double]*, [1200 x double]** %12, align 8
  %38 = load i32, i32* %15, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %37, i64 %39
  %41 = load i32, i32* %16, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %40, i64 0, i64 %42
  store double %36, double* %43, align 8
  %44 = load i32, i32* %9, align 4
  %45 = load i32, i32* %15, align 4
  %46 = add nsw i32 %44, %45
  %47 = load i32, i32* %16, align 4
  %48 = sub nsw i32 %46, %47
  %49 = srem i32 %48, 100
  %50 = sitofp i32 %49 to double
  %51 = load i32, i32* %8, align 4
  %52 = sitofp i32 %51 to double
  %53 = fdiv double %50, %52
  %54 = load [1200 x double]*, [1200 x double]** %14, align 8
  %55 = load i32, i32* %15, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %54, i64 %56
  %58 = load i32, i32* %16, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %57, i64 0, i64 %59
  store double %53, double* %60, align 8
  br label %61

; <label>:61:                                     ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %62 = add i64 %pgocount, 1
  store i64 %62, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %63 = load i32, i32* %16, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %16, align 4
  br label %24

; <label>:65:                                     ; preds = %24
  br label %66

; <label>:66:                                     ; preds = %65
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %67 = add i64 %pgocount1, 1
  store i64 %67, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %68 = load i32, i32* %15, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %15, align 4
  br label %19

; <label>:70:                                     ; preds = %19
  store i32 0, i32* %15, align 4
  br label %71

; <label>:71:                                     ; preds = %120, %70
  %72 = load i32, i32* %15, align 4
  %73 = load i32, i32* %8, align 4
  %74 = icmp slt i32 %72, %73
  br i1 %74, label %75, label %124

; <label>:75:                                     ; preds = %71
  store i32 0, i32* %16, align 4
  br label %76

; <label>:76:                                     ; preds = %96, %75
  %77 = load i32, i32* %16, align 4
  %78 = load i32, i32* %15, align 4
  %79 = icmp sle i32 %77, %78
  br i1 %79, label %80, label %100

; <label>:80:                                     ; preds = %76
  %81 = load i32, i32* %15, align 4
  %82 = load i32, i32* %16, align 4
  %83 = add nsw i32 %81, %82
  %84 = srem i32 %83, 100
  %85 = sitofp i32 %84 to double
  %86 = load i32, i32* %8, align 4
  %87 = sitofp i32 %86 to double
  %88 = fdiv double %85, %87
  %89 = load [1000 x double]*, [1000 x double]** %13, align 8
  %90 = load i32, i32* %15, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %89, i64 %91
  %93 = load i32, i32* %16, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %92, i64 0, i64 %94
  store double %88, double* %95, align 8
  br label %96

; <label>:96:                                     ; preds = %80
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %97 = add i64 %pgocount2, 1
  store i64 %97, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %98 = load i32, i32* %16, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, i32* %16, align 4
  br label %76

; <label>:100:                                    ; preds = %76
  %101 = load i32, i32* %15, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* %16, align 4
  br label %103

; <label>:103:                                    ; preds = %115, %100
  %104 = load i32, i32* %16, align 4
  %105 = load i32, i32* %8, align 4
  %106 = icmp slt i32 %104, %105
  br i1 %106, label %107, label %119

; <label>:107:                                    ; preds = %103
  %108 = load [1000 x double]*, [1000 x double]** %13, align 8
  %109 = load i32, i32* %15, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 %110
  %112 = load i32, i32* %16, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %111, i64 0, i64 %113
  store double -9.990000e+02, double* %114, align 8
  br label %115

; <label>:115:                                    ; preds = %107
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %116 = add i64 %pgocount3, 1
  store i64 %116, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %117 = load i32, i32* %16, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, i32* %16, align 4
  br label %103

; <label>:119:                                    ; preds = %103
  br label %120

; <label>:120:                                    ; preds = %119
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %121 = add i64 %pgocount4, 1
  store i64 %121, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %122 = load i32, i32* %15, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %15, align 4
  br label %71

; <label>:124:                                    ; preds = %71
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %125 = add i64 %pgocount5, 1
  store i64 %125, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca [1200 x double]*, align 8
  %13 = alloca [1000 x double]*, align 8
  %14 = alloca [1200 x double]*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca double, align 8
  store i32 %0, i32* %8, align 4
  store i32 %1, i32* %9, align 4
  store double %2, double* %10, align 8
  store double %3, double* %11, align 8
  store [1200 x double]* %4, [1200 x double]** %12, align 8
  store [1000 x double]* %5, [1000 x double]** %13, align 8
  store [1200 x double]* %6, [1200 x double]** %14, align 8
  store i32 0, i32* %15, align 4
  br label %19

; <label>:19:                                     ; preds = %132, %7
  %20 = load i32, i32* %15, align 4
  %21 = load i32, i32* %8, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %136

; <label>:23:                                     ; preds = %19
  store i32 0, i32* %16, align 4
  br label %24

; <label>:24:                                     ; preds = %127, %23
  %25 = load i32, i32* %16, align 4
  %26 = load i32, i32* %9, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %131

; <label>:28:                                     ; preds = %24
  store double 0.000000e+00, double* %18, align 8
  store i32 0, i32* %17, align 4
  br label %29

; <label>:29:                                     ; preds = %81, %28
  %30 = load i32, i32* %17, align 4
  %31 = load i32, i32* %15, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %85

; <label>:33:                                     ; preds = %29
  %34 = load double, double* %10, align 8
  %35 = load [1200 x double]*, [1200 x double]** %14, align 8
  %36 = load i32, i32* %15, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %35, i64 %37
  %39 = load i32, i32* %16, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %38, i64 0, i64 %40
  %42 = load double, double* %41, align 8
  %43 = fmul double %34, %42
  %44 = load [1000 x double]*, [1000 x double]** %13, align 8
  %45 = load i32, i32* %15, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %44, i64 %46
  %48 = load i32, i32* %17, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 0, i64 %49
  %51 = load double, double* %50, align 8
  %52 = fmul double %43, %51
  %53 = load [1200 x double]*, [1200 x double]** %12, align 8
  %54 = load i32, i32* %17, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %53, i64 %55
  %57 = load i32, i32* %16, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %56, i64 0, i64 %58
  %60 = load double, double* %59, align 8
  %61 = fadd double %60, %52
  store double %61, double* %59, align 8
  %62 = load [1200 x double]*, [1200 x double]** %14, align 8
  %63 = load i32, i32* %17, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %62, i64 %64
  %66 = load i32, i32* %16, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %65, i64 0, i64 %67
  %69 = load double, double* %68, align 8
  %70 = load [1000 x double]*, [1000 x double]** %13, align 8
  %71 = load i32, i32* %15, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %70, i64 %72
  %74 = load i32, i32* %17, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %73, i64 0, i64 %75
  %77 = load double, double* %76, align 8
  %78 = fmul double %69, %77
  %79 = load double, double* %18, align 8
  %80 = fadd double %79, %78
  store double %80, double* %18, align 8
  br label %81

; <label>:81:                                     ; preds = %33
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 0)
  %82 = add i64 %pgocount, 1
  store i64 %82, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 0)
  %83 = load i32, i32* %17, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %17, align 4
  br label %29

; <label>:85:                                     ; preds = %29
  %86 = load double, double* %11, align 8
  %87 = load [1200 x double]*, [1200 x double]** %12, align 8
  %88 = load i32, i32* %15, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %87, i64 %89
  %91 = load i32, i32* %16, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %90, i64 0, i64 %92
  %94 = load double, double* %93, align 8
  %95 = fmul double %86, %94
  %96 = load double, double* %10, align 8
  %97 = load [1200 x double]*, [1200 x double]** %14, align 8
  %98 = load i32, i32* %15, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %97, i64 %99
  %101 = load i32, i32* %16, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %100, i64 0, i64 %102
  %104 = load double, double* %103, align 8
  %105 = fmul double %96, %104
  %106 = load [1000 x double]*, [1000 x double]** %13, align 8
  %107 = load i32, i32* %15, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %106, i64 %108
  %110 = load i32, i32* %15, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %109, i64 0, i64 %111
  %113 = load double, double* %112, align 8
  %114 = fmul double %105, %113
  %115 = fadd double %95, %114
  %116 = load double, double* %10, align 8
  %117 = load double, double* %18, align 8
  %118 = fmul double %116, %117
  %119 = fadd double %115, %118
  %120 = load [1200 x double]*, [1200 x double]** %12, align 8
  %121 = load i32, i32* %15, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %120, i64 %122
  %124 = load i32, i32* %16, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %123, i64 0, i64 %125
  store double %119, double* %126, align 8
  br label %127

; <label>:127:                                    ; preds = %85
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 1)
  %128 = add i64 %pgocount1, 1
  store i64 %128, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 1)
  %129 = load i32, i32* %16, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, i32* %16, align 4
  br label %24

; <label>:131:                                    ; preds = %24
  br label %132

; <label>:132:                                    ; preds = %131
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 2)
  %133 = add i64 %pgocount2, 1
  store i64 %133, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 2)
  %134 = load i32, i32* %15, align 4
  %135 = add nsw i32 %134, 1
  store i32 %135, i32* %15, align 4
  br label %19

; <label>:136:                                    ; preds = %19
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 3)
  %137 = add i64 %pgocount3, 1
  store i64 %137, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 3)
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

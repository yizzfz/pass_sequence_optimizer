; ModuleID = 'B.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_gramschmidt = private constant [23 x i8] c"B.ll:kernel_gramschmidt"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 95009293522, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_gramschmidt = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_gramschmidt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -101542260496489068, i64 138755384297, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_gramschmidt, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 121388042714, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [63 x i8] c"=\00main\01B.ll:init_array\01B.ll:kernel_gramschmidt\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_gramschmidt to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [1000 x [1200 x double]]*, align 8
  %9 = alloca [1200 x [1200 x double]]*, align 8
  %10 = alloca [1000 x [1200 x double]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1000, i32* %6, align 4
  store i32 1200, i32* %7, align 4
  %11 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %12 = bitcast i8* %11 to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %12, [1000 x [1200 x double]]** %8, align 8
  %13 = call i8* @polybench_alloc_data(i64 1440000, i32 8)
  %14 = bitcast i8* %13 to [1200 x [1200 x double]]*
  store [1200 x [1200 x double]]* %14, [1200 x [1200 x double]]** %9, align 8
  %15 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %16 = bitcast i8* %15 to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %16, [1000 x [1200 x double]]** %10, align 8
  %17 = load i32, i32* %6, align 4
  %18 = load i32, i32* %7, align 4
  %19 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %8, align 8
  %20 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %19, i32 0, i32 0
  %21 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %9, align 8
  %22 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %21, i32 0, i32 0
  %23 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %24 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %23, i32 0, i32 0
  call void @init_array(i32 %17, i32 %18, [1200 x double]* %20, [1200 x double]* %22, [1200 x double]* %24)
  call void (...) @polybench_timer_start()
  %25 = load i32, i32* %6, align 4
  %26 = load i32, i32* %7, align 4
  %27 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %8, align 8
  %28 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %27, i32 0, i32 0
  %29 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %9, align 8
  %30 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %29, i32 0, i32 0
  %31 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %32 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %31, i32 0, i32 0
  call void @kernel_gramschmidt(i32 %25, i32 %26, [1200 x double]* %28, [1200 x double]* %30, [1200 x double]* %32)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %33 = load i32, i32* %4, align 4
  %34 = icmp sgt i32 %33, 42
  br i1 %34, label %35, label %52

; <label>:35:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %37 = load i8**, i8*** %5, align 8
  %38 = getelementptr inbounds i8*, i8** %37, i64 0
  %39 = load i8*, i8** %38, align 8
  %40 = call i32 @strcmp(i8* %39, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %52, label %42

; <label>:42:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %44 = load i32, i32* %6, align 4
  %45 = load i32, i32* %7, align 4
  %46 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %8, align 8
  %47 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %46, i32 0, i32 0
  %48 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %9, align 8
  %49 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %48, i32 0, i32 0
  %50 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %51 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %50, i32 0, i32 0
  call void @print_array(i32 %44, i32 %45, [1200 x double]* %47, [1200 x double]* %49, [1200 x double]* %51)
  br label %52

; <label>:52:                                     ; preds = %42, %35, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %53 = add i64 %pgocount2, 1
  store i64 %53, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %54 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %8, align 8
  %55 = bitcast [1000 x [1200 x double]]* %54 to i8*
  call void @free(i8* %55) #4
  %56 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %9, align 8
  %57 = bitcast [1200 x [1200 x double]]* %56 to i8*
  call void @free(i8* %57) #4
  %58 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %59 = bitcast [1000 x [1200 x double]]* %58 to i8*
  call void @free(i8* %59) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
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
  store i32 0, i32* %11, align 4
  br label %13

; <label>:13:                                     ; preds = %53, %5
  %14 = load i32, i32* %11, align 4
  %15 = load i32, i32* %6, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %57

; <label>:17:                                     ; preds = %13
  store i32 0, i32* %12, align 4
  br label %18

; <label>:18:                                     ; preds = %48, %17
  %19 = load i32, i32* %12, align 4
  %20 = load i32, i32* %7, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %52

; <label>:22:                                     ; preds = %18
  %23 = load i32, i32* %11, align 4
  %24 = load i32, i32* %12, align 4
  %25 = mul nsw i32 %23, %24
  %26 = load i32, i32* %6, align 4
  %27 = srem i32 %25, %26
  %28 = sitofp i32 %27 to double
  %29 = load i32, i32* %6, align 4
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %28, %30
  %32 = fmul double %31, 1.000000e+02
  %33 = fadd double %32, 1.000000e+01
  %34 = load [1200 x double]*, [1200 x double]** %8, align 8
  %35 = load i32, i32* %11, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %34, i64 %36
  %38 = load i32, i32* %12, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %37, i64 0, i64 %39
  store double %33, double* %40, align 8
  %41 = load [1200 x double]*, [1200 x double]** %10, align 8
  %42 = load i32, i32* %11, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %41, i64 %43
  %45 = load i32, i32* %12, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %44, i64 0, i64 %46
  store double 0.000000e+00, double* %47, align 8
  br label %48

; <label>:48:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %49 = add i64 %pgocount, 1
  store i64 %49, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %50 = load i32, i32* %12, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %12, align 4
  br label %18

; <label>:52:                                     ; preds = %18
  br label %53

; <label>:53:                                     ; preds = %52
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %54 = add i64 %pgocount1, 1
  store i64 %54, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %55 = load i32, i32* %11, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %11, align 4
  br label %13

; <label>:57:                                     ; preds = %13
  store i32 0, i32* %11, align 4
  br label %58

; <label>:58:                                     ; preds = %80, %57
  %59 = load i32, i32* %11, align 4
  %60 = load i32, i32* %7, align 4
  %61 = icmp slt i32 %59, %60
  br i1 %61, label %62, label %84

; <label>:62:                                     ; preds = %58
  store i32 0, i32* %12, align 4
  br label %63

; <label>:63:                                     ; preds = %75, %62
  %64 = load i32, i32* %12, align 4
  %65 = load i32, i32* %7, align 4
  %66 = icmp slt i32 %64, %65
  br i1 %66, label %67, label %79

; <label>:67:                                     ; preds = %63
  %68 = load [1200 x double]*, [1200 x double]** %9, align 8
  %69 = load i32, i32* %11, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %70
  %72 = load i32, i32* %12, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 0, i64 %73
  store double 0.000000e+00, double* %74, align 8
  br label %75

; <label>:75:                                     ; preds = %67
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %76 = add i64 %pgocount2, 1
  store i64 %76, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %77 = load i32, i32* %12, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %12, align 4
  br label %63

; <label>:79:                                     ; preds = %63
  br label %80

; <label>:80:                                     ; preds = %79
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %81 = add i64 %pgocount3, 1
  store i64 %81, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %82 = load i32, i32* %11, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, i32* %11, align 4
  br label %58

; <label>:84:                                     ; preds = %58
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %85 = add i64 %pgocount4, 1
  store i64 %85, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gramschmidt(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [1200 x double]*, align 8
  %9 = alloca [1200 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca double, align 8
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store [1200 x double]* %2, [1200 x double]** %8, align 8
  store [1200 x double]* %3, [1200 x double]** %9, align 8
  store [1200 x double]* %4, [1200 x double]** %10, align 8
  store i32 0, i32* %13, align 4
  br label %15

; <label>:15:                                     ; preds = %190, %5
  %16 = load i32, i32* %13, align 4
  %17 = load i32, i32* %7, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %194

; <label>:19:                                     ; preds = %15
  store double 0.000000e+00, double* %14, align 8
  store i32 0, i32* %11, align 4
  br label %20

; <label>:20:                                     ; preds = %44, %19
  %21 = load i32, i32* %11, align 4
  %22 = load i32, i32* %6, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %48

; <label>:24:                                     ; preds = %20
  %25 = load [1200 x double]*, [1200 x double]** %8, align 8
  %26 = load i32, i32* %11, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %25, i64 %27
  %29 = load i32, i32* %13, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %28, i64 0, i64 %30
  %32 = load double, double* %31, align 8
  %33 = load [1200 x double]*, [1200 x double]** %8, align 8
  %34 = load i32, i32* %11, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %33, i64 %35
  %37 = load i32, i32* %13, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %36, i64 0, i64 %38
  %40 = load double, double* %39, align 8
  %41 = fmul double %32, %40
  %42 = load double, double* %14, align 8
  %43 = fadd double %42, %41
  store double %43, double* %14, align 8
  br label %44

; <label>:44:                                     ; preds = %24
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 2)
  %45 = add i64 %pgocount, 1
  store i64 %45, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 2)
  %46 = load i32, i32* %11, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %11, align 4
  br label %20

; <label>:48:                                     ; preds = %20
  %49 = load double, double* %14, align 8
  %50 = call double @sqrt(double %49) #4
  %51 = load [1200 x double]*, [1200 x double]** %9, align 8
  %52 = load i32, i32* %13, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %51, i64 %53
  %55 = load i32, i32* %13, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %54, i64 0, i64 %56
  store double %50, double* %57, align 8
  store i32 0, i32* %11, align 4
  br label %58

; <label>:58:                                     ; preds = %87, %48
  %59 = load i32, i32* %11, align 4
  %60 = load i32, i32* %6, align 4
  %61 = icmp slt i32 %59, %60
  br i1 %61, label %62, label %91

; <label>:62:                                     ; preds = %58
  %63 = load [1200 x double]*, [1200 x double]** %8, align 8
  %64 = load i32, i32* %11, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %63, i64 %65
  %67 = load i32, i32* %13, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 0, i64 %68
  %70 = load double, double* %69, align 8
  %71 = load [1200 x double]*, [1200 x double]** %9, align 8
  %72 = load i32, i32* %13, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %73
  %75 = load i32, i32* %13, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %74, i64 0, i64 %76
  %78 = load double, double* %77, align 8
  %79 = fdiv double %70, %78
  %80 = load [1200 x double]*, [1200 x double]** %10, align 8
  %81 = load i32, i32* %11, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %80, i64 %82
  %84 = load i32, i32* %13, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %83, i64 0, i64 %85
  store double %79, double* %86, align 8
  br label %87

; <label>:87:                                     ; preds = %62
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 3)
  %88 = add i64 %pgocount1, 1
  store i64 %88, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 3)
  %89 = load i32, i32* %11, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, i32* %11, align 4
  br label %58

; <label>:91:                                     ; preds = %58
  %92 = load i32, i32* %13, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %12, align 4
  br label %94

; <label>:94:                                     ; preds = %185, %91
  %95 = load i32, i32* %12, align 4
  %96 = load i32, i32* %7, align 4
  %97 = icmp slt i32 %95, %96
  br i1 %97, label %98, label %189

; <label>:98:                                     ; preds = %94
  %99 = load [1200 x double]*, [1200 x double]** %9, align 8
  %100 = load i32, i32* %13, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %99, i64 %101
  %103 = load i32, i32* %12, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %102, i64 0, i64 %104
  store double 0.000000e+00, double* %105, align 8
  store i32 0, i32* %11, align 4
  br label %106

; <label>:106:                                    ; preds = %137, %98
  %107 = load i32, i32* %11, align 4
  %108 = load i32, i32* %6, align 4
  %109 = icmp slt i32 %107, %108
  br i1 %109, label %110, label %141

; <label>:110:                                    ; preds = %106
  %111 = load [1200 x double]*, [1200 x double]** %10, align 8
  %112 = load i32, i32* %11, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %111, i64 %113
  %115 = load i32, i32* %13, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %114, i64 0, i64 %116
  %118 = load double, double* %117, align 8
  %119 = load [1200 x double]*, [1200 x double]** %8, align 8
  %120 = load i32, i32* %11, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %119, i64 %121
  %123 = load i32, i32* %12, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %122, i64 0, i64 %124
  %126 = load double, double* %125, align 8
  %127 = fmul double %118, %126
  %128 = load [1200 x double]*, [1200 x double]** %9, align 8
  %129 = load i32, i32* %13, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %128, i64 %130
  %132 = load i32, i32* %12, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %131, i64 0, i64 %133
  %135 = load double, double* %134, align 8
  %136 = fadd double %135, %127
  store double %136, double* %134, align 8
  br label %137

; <label>:137:                                    ; preds = %110
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 0)
  %138 = add i64 %pgocount2, 1
  store i64 %138, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 0)
  %139 = load i32, i32* %11, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, i32* %11, align 4
  br label %106

; <label>:141:                                    ; preds = %106
  store i32 0, i32* %11, align 4
  br label %142

; <label>:142:                                    ; preds = %180, %141
  %143 = load i32, i32* %11, align 4
  %144 = load i32, i32* %6, align 4
  %145 = icmp slt i32 %143, %144
  br i1 %145, label %146, label %184

; <label>:146:                                    ; preds = %142
  %147 = load [1200 x double]*, [1200 x double]** %8, align 8
  %148 = load i32, i32* %11, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %147, i64 %149
  %151 = load i32, i32* %12, align 4
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %150, i64 0, i64 %152
  %154 = load double, double* %153, align 8
  %155 = load [1200 x double]*, [1200 x double]** %10, align 8
  %156 = load i32, i32* %11, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 %157
  %159 = load i32, i32* %13, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %158, i64 0, i64 %160
  %162 = load double, double* %161, align 8
  %163 = load [1200 x double]*, [1200 x double]** %9, align 8
  %164 = load i32, i32* %13, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %163, i64 %165
  %167 = load i32, i32* %12, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %166, i64 0, i64 %168
  %170 = load double, double* %169, align 8
  %171 = fmul double %162, %170
  %172 = fsub double %154, %171
  %173 = load [1200 x double]*, [1200 x double]** %8, align 8
  %174 = load i32, i32* %11, align 4
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %173, i64 %175
  %177 = load i32, i32* %12, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %176, i64 0, i64 %178
  store double %172, double* %179, align 8
  br label %180

; <label>:180:                                    ; preds = %146
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 1)
  %181 = add i64 %pgocount3, 1
  store i64 %181, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 1)
  %182 = load i32, i32* %11, align 4
  %183 = add nsw i32 %182, 1
  store i32 %183, i32* %11, align 4
  br label %142

; <label>:184:                                    ; preds = %142
  br label %185

; <label>:185:                                    ; preds = %184
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 4)
  %186 = add i64 %pgocount4, 1
  store i64 %186, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 4)
  %187 = load i32, i32* %12, align 4
  %188 = add nsw i32 %187, 1
  store i32 %188, i32* %12, align 4
  br label %94

; <label>:189:                                    ; preds = %94
  br label %190

; <label>:190:                                    ; preds = %189
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 5)
  %191 = add i64 %pgocount5, 1
  store i64 %191, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 5)
  %192 = load i32, i32* %13, align 4
  %193 = add nsw i32 %192, 1
  store i32 %193, i32* %13, align 4
  br label %15

; <label>:194:                                    ; preds = %15
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 6)
  %195 = add i64 %pgocount6, 1
  store i64 %195, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 6)
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
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %11, align 4
  br label %17

; <label>:17:                                     ; preds = %54, %5
  %18 = load i32, i32* %11, align 4
  %19 = load i32, i32* %7, align 4
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
  %28 = load i32, i32* %7, align 4
  %29 = mul nsw i32 %27, %28
  %30 = load i32, i32* %12, align 4
  %31 = add nsw i32 %29, %30
  %32 = srem i32 %31, 20
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %38

; <label>:34:                                     ; preds = %26
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %35 = add i64 %pgocount, 1
  store i64 %35, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %38

; <label>:38:                                     ; preds = %34, %26
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = load [1200 x double]*, [1200 x double]** %9, align 8
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
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %50 = add i64 %pgocount1, 1
  store i64 %50, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %51 = load i32, i32* %12, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %12, align 4
  br label %22

; <label>:53:                                     ; preds = %22
  br label %54

; <label>:54:                                     ; preds = %53
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %56 = load i32, i32* %11, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %11, align 4
  br label %17

; <label>:58:                                     ; preds = %17
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %60 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %59, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %62 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %61, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store i32 0, i32* %11, align 4
  br label %63

; <label>:63:                                     ; preds = %100, %58
  %64 = load i32, i32* %11, align 4
  %65 = load i32, i32* %6, align 4
  %66 = icmp slt i32 %64, %65
  br i1 %66, label %67, label %104

; <label>:67:                                     ; preds = %63
  store i32 0, i32* %12, align 4
  br label %68

; <label>:68:                                     ; preds = %95, %67
  %69 = load i32, i32* %12, align 4
  %70 = load i32, i32* %7, align 4
  %71 = icmp slt i32 %69, %70
  br i1 %71, label %72, label %99

; <label>:72:                                     ; preds = %68
  %73 = load i32, i32* %11, align 4
  %74 = load i32, i32* %7, align 4
  %75 = mul nsw i32 %73, %74
  %76 = load i32, i32* %12, align 4
  %77 = add nsw i32 %75, %76
  %78 = srem i32 %77, 20
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %84

; <label>:80:                                     ; preds = %72
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %81 = add i64 %pgocount3, 1
  store i64 %81, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %82 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %83 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %82, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %84

; <label>:84:                                     ; preds = %80, %72
  %85 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %86 = load [1200 x double]*, [1200 x double]** %10, align 8
  %87 = load i32, i32* %11, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %86, i64 %88
  %90 = load i32, i32* %12, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %89, i64 0, i64 %91
  %93 = load double, double* %92, align 8
  %94 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %85, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %93)
  br label %95

; <label>:95:                                     ; preds = %84
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %96 = add i64 %pgocount4, 1
  store i64 %96, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %97 = load i32, i32* %12, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %12, align 4
  br label %68

; <label>:99:                                     ; preds = %68
  br label %100

; <label>:100:                                    ; preds = %99
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  %101 = add i64 %pgocount5, 1
  store i64 %101, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  %102 = load i32, i32* %11, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, i32* %11, align 4
  br label %63

; <label>:104:                                    ; preds = %63
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 6)
  %105 = add i64 %pgocount6, 1
  store i64 %105, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 6)
  %106 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %107 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %106, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  %108 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %109 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %108, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i32 0, i32 0))
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

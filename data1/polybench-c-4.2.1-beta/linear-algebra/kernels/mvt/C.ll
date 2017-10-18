; ModuleID = 'B.ll'
source_filename = "mvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_mvt = private constant [15 x i8] c"B.ll:kernel_mvt"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_mvt = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_mvt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -598483100572296020, i64 95009293522, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_mvt, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 81480409073, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [55 x i8] c"5\00main\01B.ll:init_array\01B.ll:kernel_mvt\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_mvt to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca [2000 x [2000 x double]]*, align 8
  %8 = alloca [2000 x double]*, align 8
  %9 = alloca [2000 x double]*, align 8
  %10 = alloca [2000 x double]*, align 8
  %11 = alloca [2000 x double]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 2000, i32* %6, align 4
  %12 = call i8* @polybench_alloc_data(i64 4000000, i32 8)
  %13 = bitcast i8* %12 to [2000 x [2000 x double]]*
  store [2000 x [2000 x double]]* %13, [2000 x [2000 x double]]** %7, align 8
  %14 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %15 = bitcast i8* %14 to [2000 x double]*
  store [2000 x double]* %15, [2000 x double]** %8, align 8
  %16 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %17 = bitcast i8* %16 to [2000 x double]*
  store [2000 x double]* %17, [2000 x double]** %9, align 8
  %18 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %19 = bitcast i8* %18 to [2000 x double]*
  store [2000 x double]* %19, [2000 x double]** %10, align 8
  %20 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %21 = bitcast i8* %20 to [2000 x double]*
  store [2000 x double]* %21, [2000 x double]** %11, align 8
  %22 = load i32, i32* %6, align 4
  %23 = load [2000 x double]*, [2000 x double]** %8, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %23, i32 0, i32 0
  %25 = load [2000 x double]*, [2000 x double]** %9, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %25, i32 0, i32 0
  %27 = load [2000 x double]*, [2000 x double]** %10, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %27, i32 0, i32 0
  %29 = load [2000 x double]*, [2000 x double]** %11, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %29, i32 0, i32 0
  %31 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %32 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i32 0, i32 0
  call void @init_array(i32 %22, double* %24, double* %26, double* %28, double* %30, [2000 x double]* %32)
  call void (...) @polybench_timer_start()
  %33 = load i32, i32* %6, align 4
  %34 = load [2000 x double]*, [2000 x double]** %8, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %34, i32 0, i32 0
  %36 = load [2000 x double]*, [2000 x double]** %9, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %36, i32 0, i32 0
  %38 = load [2000 x double]*, [2000 x double]** %10, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i32 0, i32 0
  %40 = load [2000 x double]*, [2000 x double]** %11, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i32 0, i32 0
  %42 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %43 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i32 0, i32 0
  call void @kernel_mvt(i32 %33, double* %35, double* %37, double* %39, double* %41, [2000 x double]* %43)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %44 = load i32, i32* %4, align 4
  %45 = icmp sgt i32 %44, 42
  br i1 %45, label %46, label %60

; <label>:46:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %47 = add i64 %pgocount, 1
  store i64 %47, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %48 = load i8**, i8*** %5, align 8
  %49 = getelementptr inbounds i8*, i8** %48, i64 0
  %50 = load i8*, i8** %49, align 8
  %51 = call i32 @strcmp(i8* %50, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %60, label %53

; <label>:53:                                     ; preds = %46
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %54 = add i64 %pgocount1, 1
  store i64 %54, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %55 = load i32, i32* %6, align 4
  %56 = load [2000 x double]*, [2000 x double]** %8, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %56, i32 0, i32 0
  %58 = load [2000 x double]*, [2000 x double]** %9, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %58, i32 0, i32 0
  call void @print_array(i32 %55, double* %57, double* %59)
  br label %60

; <label>:60:                                     ; preds = %53, %46, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %61 = add i64 %pgocount2, 1
  store i64 %61, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %62 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %63 = bitcast [2000 x [2000 x double]]* %62 to i8*
  call void @free(i8* %63) #4
  %64 = load [2000 x double]*, [2000 x double]** %8, align 8
  %65 = bitcast [2000 x double]* %64 to i8*
  call void @free(i8* %65) #4
  %66 = load [2000 x double]*, [2000 x double]** %9, align 8
  %67 = bitcast [2000 x double]* %66 to i8*
  call void @free(i8* %67) #4
  %68 = load [2000 x double]*, [2000 x double]** %10, align 8
  %69 = bitcast [2000 x double]* %68 to i8*
  call void @free(i8* %69) #4
  %70 = load [2000 x double]*, [2000 x double]** %11, align 8
  %71 = bitcast [2000 x double]* %70 to i8*
  call void @free(i8* %71) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, double*, double*, double*, double*, [2000 x double]*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca double*, align 8
  %12 = alloca [2000 x double]*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store double* %1, double** %8, align 8
  store double* %2, double** %9, align 8
  store double* %3, double** %10, align 8
  store double* %4, double** %11, align 8
  store [2000 x double]* %5, [2000 x double]** %12, align 8
  store i32 0, i32* %13, align 4
  br label %15

; <label>:15:                                     ; preds = %93, %6
  %16 = load i32, i32* %13, align 4
  %17 = load i32, i32* %7, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %97

; <label>:19:                                     ; preds = %15
  %20 = load i32, i32* %13, align 4
  %21 = load i32, i32* %7, align 4
  %22 = srem i32 %20, %21
  %23 = sitofp i32 %22 to double
  %24 = load i32, i32* %7, align 4
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %23, %25
  %27 = load double*, double** %8, align 8
  %28 = load i32, i32* %13, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double, double* %27, i64 %29
  store double %26, double* %30, align 8
  %31 = load i32, i32* %13, align 4
  %32 = add nsw i32 %31, 1
  %33 = load i32, i32* %7, align 4
  %34 = srem i32 %32, %33
  %35 = sitofp i32 %34 to double
  %36 = load i32, i32* %7, align 4
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %35, %37
  %39 = load double*, double** %9, align 8
  %40 = load i32, i32* %13, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double, double* %39, i64 %41
  store double %38, double* %42, align 8
  %43 = load i32, i32* %13, align 4
  %44 = add nsw i32 %43, 3
  %45 = load i32, i32* %7, align 4
  %46 = srem i32 %44, %45
  %47 = sitofp i32 %46 to double
  %48 = load i32, i32* %7, align 4
  %49 = sitofp i32 %48 to double
  %50 = fdiv double %47, %49
  %51 = load double*, double** %10, align 8
  %52 = load i32, i32* %13, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, double* %51, i64 %53
  store double %50, double* %54, align 8
  %55 = load i32, i32* %13, align 4
  %56 = add nsw i32 %55, 4
  %57 = load i32, i32* %7, align 4
  %58 = srem i32 %56, %57
  %59 = sitofp i32 %58 to double
  %60 = load i32, i32* %7, align 4
  %61 = sitofp i32 %60 to double
  %62 = fdiv double %59, %61
  %63 = load double*, double** %11, align 8
  %64 = load i32, i32* %13, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds double, double* %63, i64 %65
  store double %62, double* %66, align 8
  store i32 0, i32* %14, align 4
  br label %67

; <label>:67:                                     ; preds = %88, %19
  %68 = load i32, i32* %14, align 4
  %69 = load i32, i32* %7, align 4
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %71, label %92

; <label>:71:                                     ; preds = %67
  %72 = load i32, i32* %13, align 4
  %73 = load i32, i32* %14, align 4
  %74 = mul nsw i32 %72, %73
  %75 = load i32, i32* %7, align 4
  %76 = srem i32 %74, %75
  %77 = sitofp i32 %76 to double
  %78 = load i32, i32* %7, align 4
  %79 = sitofp i32 %78 to double
  %80 = fdiv double %77, %79
  %81 = load [2000 x double]*, [2000 x double]** %12, align 8
  %82 = load i32, i32* %13, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %81, i64 %83
  %85 = load i32, i32* %14, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %84, i64 0, i64 %86
  store double %80, double* %87, align 8
  br label %88

; <label>:88:                                     ; preds = %71
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %89 = add i64 %pgocount, 1
  store i64 %89, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %90 = load i32, i32* %14, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %14, align 4
  br label %67

; <label>:92:                                     ; preds = %67
  br label %93

; <label>:93:                                     ; preds = %92
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %94 = add i64 %pgocount1, 1
  store i64 %94, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %95 = load i32, i32* %13, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* %13, align 4
  br label %15

; <label>:97:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %98 = add i64 %pgocount2, 1
  store i64 %98, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_mvt(i32, double*, double*, double*, double*, [2000 x double]*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca double*, align 8
  %12 = alloca [2000 x double]*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store double* %1, double** %8, align 8
  store double* %2, double** %9, align 8
  store double* %3, double** %10, align 8
  store double* %4, double** %11, align 8
  store [2000 x double]* %5, [2000 x double]** %12, align 8
  store i32 0, i32* %13, align 4
  br label %15

; <label>:15:                                     ; preds = %54, %6
  %16 = load i32, i32* %13, align 4
  %17 = load i32, i32* %7, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %58

; <label>:19:                                     ; preds = %15
  store i32 0, i32* %14, align 4
  br label %20

; <label>:20:                                     ; preds = %49, %19
  %21 = load i32, i32* %14, align 4
  %22 = load i32, i32* %7, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %53

; <label>:24:                                     ; preds = %20
  %25 = load double*, double** %8, align 8
  %26 = load i32, i32* %13, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds double, double* %25, i64 %27
  %29 = load double, double* %28, align 8
  %30 = load [2000 x double]*, [2000 x double]** %12, align 8
  %31 = load i32, i32* %13, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %32
  %34 = load i32, i32* %14, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 0, i64 %35
  %37 = load double, double* %36, align 8
  %38 = load double*, double** %10, align 8
  %39 = load i32, i32* %14, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds double, double* %38, i64 %40
  %42 = load double, double* %41, align 8
  %43 = fmul double %37, %42
  %44 = fadd double %29, %43
  %45 = load double*, double** %8, align 8
  %46 = load i32, i32* %13, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, double* %45, i64 %47
  store double %44, double* %48, align 8
  br label %49

; <label>:49:                                     ; preds = %24
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 0)
  %50 = add i64 %pgocount, 1
  store i64 %50, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 0)
  %51 = load i32, i32* %14, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %14, align 4
  br label %20

; <label>:53:                                     ; preds = %20
  br label %54

; <label>:54:                                     ; preds = %53
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 2)
  %55 = add i64 %pgocount1, 1
  store i64 %55, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 2)
  %56 = load i32, i32* %13, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %13, align 4
  br label %15

; <label>:58:                                     ; preds = %15
  store i32 0, i32* %13, align 4
  br label %59

; <label>:59:                                     ; preds = %98, %58
  %60 = load i32, i32* %13, align 4
  %61 = load i32, i32* %7, align 4
  %62 = icmp slt i32 %60, %61
  br i1 %62, label %63, label %102

; <label>:63:                                     ; preds = %59
  store i32 0, i32* %14, align 4
  br label %64

; <label>:64:                                     ; preds = %93, %63
  %65 = load i32, i32* %14, align 4
  %66 = load i32, i32* %7, align 4
  %67 = icmp slt i32 %65, %66
  br i1 %67, label %68, label %97

; <label>:68:                                     ; preds = %64
  %69 = load double*, double** %9, align 8
  %70 = load i32, i32* %13, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds double, double* %69, i64 %71
  %73 = load double, double* %72, align 8
  %74 = load [2000 x double]*, [2000 x double]** %12, align 8
  %75 = load i32, i32* %14, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %76
  %78 = load i32, i32* %13, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %77, i64 0, i64 %79
  %81 = load double, double* %80, align 8
  %82 = load double*, double** %11, align 8
  %83 = load i32, i32* %14, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds double, double* %82, i64 %84
  %86 = load double, double* %85, align 8
  %87 = fmul double %81, %86
  %88 = fadd double %73, %87
  %89 = load double*, double** %9, align 8
  %90 = load i32, i32* %13, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds double, double* %89, i64 %91
  store double %88, double* %92, align 8
  br label %93

; <label>:93:                                     ; preds = %68
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 1)
  %94 = add i64 %pgocount2, 1
  store i64 %94, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 1)
  %95 = load i32, i32* %14, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* %14, align 4
  br label %64

; <label>:97:                                     ; preds = %64
  br label %98

; <label>:98:                                     ; preds = %97
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 3)
  %99 = add i64 %pgocount3, 1
  store i64 %99, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 3)
  %100 = load i32, i32* %13, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, i32* %13, align 4
  br label %59

; <label>:102:                                    ; preds = %59
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 4)
  %103 = add i64 %pgocount4, 1
  store i64 %103, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 4)
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*, double*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca double*, align 8
  %6 = alloca double*, align 8
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store double* %1, double** %5, align 8
  store double* %2, double** %6, align 8
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %7, align 4
  br label %12

; <label>:12:                                     ; preds = %32, %3
  %13 = load i32, i32* %7, align 4
  %14 = load i32, i32* %4, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %36

; <label>:16:                                     ; preds = %12
  %17 = load i32, i32* %7, align 4
  %18 = srem i32 %17, 20
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %16
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %24

; <label>:24:                                     ; preds = %20, %16
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = load double*, double** %5, align 8
  %27 = load i32, i32* %7, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds double, double* %26, i64 %28
  %30 = load double, double* %29, align 8
  %31 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %30)
  br label %32

; <label>:32:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %34 = load i32, i32* %7, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %7, align 4
  br label %12

; <label>:36:                                     ; preds = %12
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0))
  store i32 0, i32* %7, align 4
  br label %41

; <label>:41:                                     ; preds = %61, %36
  %42 = load i32, i32* %7, align 4
  %43 = load i32, i32* %4, align 4
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %45, label %65

; <label>:45:                                     ; preds = %41
  %46 = load i32, i32* %7, align 4
  %47 = srem i32 %46, 20
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %53

; <label>:49:                                     ; preds = %45
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %53

; <label>:53:                                     ; preds = %49, %45
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %55 = load double*, double** %6, align 8
  %56 = load i32, i32* %7, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, double* %55, i64 %57
  %59 = load double, double* %58, align 8
  %60 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %59)
  br label %61

; <label>:61:                                     ; preds = %53
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %62 = add i64 %pgocount3, 1
  store i64 %62, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %63 = load i32, i32* %7, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %7, align 4
  br label %41

; <label>:65:                                     ; preds = %41
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %66 = add i64 %pgocount4, 1
  store i64 %66, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %68 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %67, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0))
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %70 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %69, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i32 0, i32 0))
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

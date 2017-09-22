; ModuleID = 'B.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_kernel_doitgen = private constant [14 x i8] c"kernel_doitgen"
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_kernel_doitgen = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_kernel_doitgen = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7952097593059838232, i64 116504336003, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_kernel_doitgen, i32 0, i32 0), i8* bitcast (void (i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*)* @kernel_doitgen to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 117703606068, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 89615196140, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [54 x i8] c"4\00kernel_doitgen\01main\01B.ll:init_array\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_kernel_doitgen to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [140 x [160 x double]]*, align 8
  %11 = alloca [160 x double]*, align 8
  %12 = alloca double*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store i32 %2, i32* %9, align 4
  store [140 x [160 x double]]* %3, [140 x [160 x double]]** %10, align 8
  store [160 x double]* %4, [160 x double]** %11, align 8
  store double* %5, double** %12, align 8
  store i32 0, i32* %13, align 4
  br label %17

; <label>:17:                                     ; preds = %107, %6
  %18 = load i32, i32* %13, align 4
  %19 = load i32, i32* %7, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %111

; <label>:21:                                     ; preds = %17
  store i32 0, i32* %14, align 4
  br label %22

; <label>:22:                                     ; preds = %102, %21
  %23 = load i32, i32* %14, align 4
  %24 = load i32, i32* %8, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %106

; <label>:26:                                     ; preds = %22
  store i32 0, i32* %15, align 4
  br label %27

; <label>:27:                                     ; preds = %72, %26
  %28 = load i32, i32* %15, align 4
  %29 = load i32, i32* %9, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %76

; <label>:31:                                     ; preds = %27
  %32 = load double*, double** %12, align 8
  %33 = load i32, i32* %15, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double* %32, i64 %34
  store double 0.000000e+00, double* %35, align 8
  store i32 0, i32* %16, align 4
  br label %36

; <label>:36:                                     ; preds = %67, %31
  %37 = load i32, i32* %16, align 4
  %38 = load i32, i32* %9, align 4
  %39 = icmp slt i32 %37, %38
  br i1 %39, label %40, label %71

; <label>:40:                                     ; preds = %36
  %41 = load [140 x [160 x double]]*, [140 x [160 x double]]** %10, align 8
  %42 = load i32, i32* %13, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %41, i64 %43
  %45 = load i32, i32* %14, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %44, i64 0, i64 %46
  %48 = load i32, i32* %16, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [160 x double], [160 x double]* %47, i64 0, i64 %49
  %51 = load double, double* %50, align 8
  %52 = load [160 x double]*, [160 x double]** %11, align 8
  %53 = load i32, i32* %16, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [160 x double], [160 x double]* %52, i64 %54
  %56 = load i32, i32* %15, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [160 x double], [160 x double]* %55, i64 0, i64 %57
  %59 = load double, double* %58, align 8
  %60 = fmul double %51, %59
  %61 = load double*, double** %12, align 8
  %62 = load i32, i32* %15, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, double* %61, i64 %63
  %65 = load double, double* %64, align 8
  %66 = fadd double %65, %60
  store double %66, double* %64, align 8
  br label %67

; <label>:67:                                     ; preds = %40
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_kernel_doitgen, i64 0, i64 0)
  %68 = add i64 %pgocount, 1
  store i64 %68, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_kernel_doitgen, i64 0, i64 0)
  %69 = load i32, i32* %16, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %16, align 4
  br label %36

; <label>:71:                                     ; preds = %36
  br label %72

; <label>:72:                                     ; preds = %71
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_kernel_doitgen, i64 0, i64 1)
  %73 = add i64 %pgocount1, 1
  store i64 %73, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_kernel_doitgen, i64 0, i64 1)
  %74 = load i32, i32* %15, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %15, align 4
  br label %27

; <label>:76:                                     ; preds = %27
  store i32 0, i32* %15, align 4
  br label %77

; <label>:77:                                     ; preds = %97, %76
  %78 = load i32, i32* %15, align 4
  %79 = load i32, i32* %9, align 4
  %80 = icmp slt i32 %78, %79
  br i1 %80, label %81, label %101

; <label>:81:                                     ; preds = %77
  %82 = load double*, double** %12, align 8
  %83 = load i32, i32* %15, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds double, double* %82, i64 %84
  %86 = load double, double* %85, align 8
  %87 = load [140 x [160 x double]]*, [140 x [160 x double]]** %10, align 8
  %88 = load i32, i32* %13, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %87, i64 %89
  %91 = load i32, i32* %14, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %90, i64 0, i64 %92
  %94 = load i32, i32* %15, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [160 x double], [160 x double]* %93, i64 0, i64 %95
  store double %86, double* %96, align 8
  br label %97

; <label>:97:                                     ; preds = %81
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_kernel_doitgen, i64 0, i64 2)
  %98 = add i64 %pgocount2, 1
  store i64 %98, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_kernel_doitgen, i64 0, i64 2)
  %99 = load i32, i32* %15, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %15, align 4
  br label %77

; <label>:101:                                    ; preds = %77
  br label %102

; <label>:102:                                    ; preds = %101
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_kernel_doitgen, i64 0, i64 3)
  %103 = add i64 %pgocount3, 1
  store i64 %103, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_kernel_doitgen, i64 0, i64 3)
  %104 = load i32, i32* %14, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %14, align 4
  br label %22

; <label>:106:                                    ; preds = %22
  br label %107

; <label>:107:                                    ; preds = %106
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_kernel_doitgen, i64 0, i64 4)
  %108 = add i64 %pgocount4, 1
  store i64 %108, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_kernel_doitgen, i64 0, i64 4)
  %109 = load i32, i32* %13, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, i32* %13, align 4
  br label %17

; <label>:111:                                    ; preds = %17
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_kernel_doitgen, i64 0, i64 5)
  %112 = add i64 %pgocount5, 1
  store i64 %112, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_kernel_doitgen, i64 0, i64 5)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [150 x [140 x [160 x double]]]*, align 8
  %10 = alloca [160 x double]*, align 8
  %11 = alloca [160 x [160 x double]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 150, i32* %6, align 4
  store i32 140, i32* %7, align 4
  store i32 160, i32* %8, align 4
  %12 = call i8* @polybench_alloc_data(i64 3360000, i32 8)
  %13 = bitcast i8* %12 to [150 x [140 x [160 x double]]]*
  store [150 x [140 x [160 x double]]]* %13, [150 x [140 x [160 x double]]]** %9, align 8
  %14 = call i8* @polybench_alloc_data(i64 160, i32 8)
  %15 = bitcast i8* %14 to [160 x double]*
  store [160 x double]* %15, [160 x double]** %10, align 8
  %16 = call i8* @polybench_alloc_data(i64 25600, i32 8)
  %17 = bitcast i8* %16 to [160 x [160 x double]]*
  store [160 x [160 x double]]* %17, [160 x [160 x double]]** %11, align 8
  %18 = load i32, i32* %6, align 4
  %19 = load i32, i32* %7, align 4
  %20 = load i32, i32* %8, align 4
  %21 = load [150 x [140 x [160 x double]]]*, [150 x [140 x [160 x double]]]** %9, align 8
  %22 = getelementptr inbounds [150 x [140 x [160 x double]]], [150 x [140 x [160 x double]]]* %21, i32 0, i32 0
  %23 = load [160 x [160 x double]]*, [160 x [160 x double]]** %11, align 8
  %24 = getelementptr inbounds [160 x [160 x double]], [160 x [160 x double]]* %23, i32 0, i32 0
  call void @init_array(i32 %18, i32 %19, i32 %20, [140 x [160 x double]]* %22, [160 x double]* %24)
  call void (...) @polybench_timer_start()
  %25 = load i32, i32* %6, align 4
  %26 = load i32, i32* %7, align 4
  %27 = load i32, i32* %8, align 4
  %28 = load [150 x [140 x [160 x double]]]*, [150 x [140 x [160 x double]]]** %9, align 8
  %29 = getelementptr inbounds [150 x [140 x [160 x double]]], [150 x [140 x [160 x double]]]* %28, i32 0, i32 0
  %30 = load [160 x [160 x double]]*, [160 x [160 x double]]** %11, align 8
  %31 = getelementptr inbounds [160 x [160 x double]], [160 x [160 x double]]* %30, i32 0, i32 0
  %32 = load [160 x double]*, [160 x double]** %10, align 8
  %33 = getelementptr inbounds [160 x double], [160 x double]* %32, i32 0, i32 0
  call void @kernel_doitgen(i32 %25, i32 %26, i32 %27, [140 x [160 x double]]* %29, [160 x double]* %31, double* %33)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %34 = load i32, i32* %4, align 4
  %35 = icmp sgt i32 %34, 42
  br i1 %35, label %36, label %50

; <label>:36:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %37 = add i64 %pgocount, 1
  store i64 %37, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %38 = load i8**, i8*** %5, align 8
  %39 = getelementptr inbounds i8*, i8** %38, i64 0
  %40 = load i8*, i8** %39, align 8
  %41 = call i32 @strcmp(i8* %40, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %50, label %43

; <label>:43:                                     ; preds = %36
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %45 = load i32, i32* %6, align 4
  %46 = load i32, i32* %7, align 4
  %47 = load i32, i32* %8, align 4
  %48 = load [150 x [140 x [160 x double]]]*, [150 x [140 x [160 x double]]]** %9, align 8
  %49 = getelementptr inbounds [150 x [140 x [160 x double]]], [150 x [140 x [160 x double]]]* %48, i32 0, i32 0
  call void @print_array(i32 %45, i32 %46, i32 %47, [140 x [160 x double]]* %49)
  br label %50

; <label>:50:                                     ; preds = %43, %36, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %52 = load [150 x [140 x [160 x double]]]*, [150 x [140 x [160 x double]]]** %9, align 8
  %53 = bitcast [150 x [140 x [160 x double]]]* %52 to i8*
  call void @free(i8* %53) #4
  %54 = load [160 x double]*, [160 x double]** %10, align 8
  %55 = bitcast [160 x double]* %54 to i8*
  call void @free(i8* %55) #4
  %56 = load [160 x [160 x double]]*, [160 x [160 x double]]** %11, align 8
  %57 = bitcast [160 x [160 x double]]* %56 to i8*
  call void @free(i8* %57) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [140 x [160 x double]]*, align 8
  %10 = alloca [160 x double]*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store [140 x [160 x double]]* %3, [140 x [160 x double]]** %9, align 8
  store [160 x double]* %4, [160 x double]** %10, align 8
  store i32 0, i32* %11, align 4
  br label %14

; <label>:14:                                     ; preds = %60, %5
  %15 = load i32, i32* %11, align 4
  %16 = load i32, i32* %6, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %64

; <label>:18:                                     ; preds = %14
  store i32 0, i32* %12, align 4
  br label %19

; <label>:19:                                     ; preds = %55, %18
  %20 = load i32, i32* %12, align 4
  %21 = load i32, i32* %7, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %59

; <label>:23:                                     ; preds = %19
  store i32 0, i32* %13, align 4
  br label %24

; <label>:24:                                     ; preds = %50, %23
  %25 = load i32, i32* %13, align 4
  %26 = load i32, i32* %8, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %54

; <label>:28:                                     ; preds = %24
  %29 = load i32, i32* %11, align 4
  %30 = load i32, i32* %12, align 4
  %31 = mul nsw i32 %29, %30
  %32 = load i32, i32* %13, align 4
  %33 = add nsw i32 %31, %32
  %34 = load i32, i32* %8, align 4
  %35 = srem i32 %33, %34
  %36 = sitofp i32 %35 to double
  %37 = load i32, i32* %8, align 4
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %36, %38
  %40 = load [140 x [160 x double]]*, [140 x [160 x double]]** %9, align 8
  %41 = load i32, i32* %11, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %40, i64 %42
  %44 = load i32, i32* %12, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %43, i64 0, i64 %45
  %47 = load i32, i32* %13, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [160 x double], [160 x double]* %46, i64 0, i64 %48
  store double %39, double* %49, align 8
  br label %50

; <label>:50:                                     ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %51 = add i64 %pgocount, 1
  store i64 %51, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %52 = load i32, i32* %13, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %13, align 4
  br label %24

; <label>:54:                                     ; preds = %24
  br label %55

; <label>:55:                                     ; preds = %54
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %56 = add i64 %pgocount1, 1
  store i64 %56, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %57 = load i32, i32* %12, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %12, align 4
  br label %19

; <label>:59:                                     ; preds = %19
  br label %60

; <label>:60:                                     ; preds = %59
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %61 = add i64 %pgocount2, 1
  store i64 %61, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %62 = load i32, i32* %11, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %11, align 4
  br label %14

; <label>:64:                                     ; preds = %14
  store i32 0, i32* %11, align 4
  br label %65

; <label>:65:                                     ; preds = %96, %64
  %66 = load i32, i32* %11, align 4
  %67 = load i32, i32* %8, align 4
  %68 = icmp slt i32 %66, %67
  br i1 %68, label %69, label %100

; <label>:69:                                     ; preds = %65
  store i32 0, i32* %12, align 4
  br label %70

; <label>:70:                                     ; preds = %91, %69
  %71 = load i32, i32* %12, align 4
  %72 = load i32, i32* %8, align 4
  %73 = icmp slt i32 %71, %72
  br i1 %73, label %74, label %95

; <label>:74:                                     ; preds = %70
  %75 = load i32, i32* %11, align 4
  %76 = load i32, i32* %12, align 4
  %77 = mul nsw i32 %75, %76
  %78 = load i32, i32* %8, align 4
  %79 = srem i32 %77, %78
  %80 = sitofp i32 %79 to double
  %81 = load i32, i32* %8, align 4
  %82 = sitofp i32 %81 to double
  %83 = fdiv double %80, %82
  %84 = load [160 x double]*, [160 x double]** %10, align 8
  %85 = load i32, i32* %11, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [160 x double], [160 x double]* %84, i64 %86
  %88 = load i32, i32* %12, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [160 x double], [160 x double]* %87, i64 0, i64 %89
  store double %83, double* %90, align 8
  br label %91

; <label>:91:                                     ; preds = %74
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %92 = add i64 %pgocount3, 1
  store i64 %92, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %93 = load i32, i32* %12, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %12, align 4
  br label %70

; <label>:95:                                     ; preds = %70
  br label %96

; <label>:96:                                     ; preds = %95
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %97 = add i64 %pgocount4, 1
  store i64 %97, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %98 = load i32, i32* %11, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, i32* %11, align 4
  br label %65

; <label>:100:                                    ; preds = %65
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %101 = add i64 %pgocount5, 1
  store i64 %101, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  ret void
}

declare void @polybench_timer_start(...) #1

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, i32, [140 x [160 x double]]*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [140 x [160 x double]]*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store [140 x [160 x double]]* %3, [140 x [160 x double]]** %8, align 8
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %9, align 4
  br label %16

; <label>:16:                                     ; preds = %72, %4
  %17 = load i32, i32* %9, align 4
  %18 = load i32, i32* %5, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %76

; <label>:20:                                     ; preds = %16
  store i32 0, i32* %10, align 4
  br label %21

; <label>:21:                                     ; preds = %67, %20
  %22 = load i32, i32* %10, align 4
  %23 = load i32, i32* %6, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %71

; <label>:25:                                     ; preds = %21
  store i32 0, i32* %11, align 4
  br label %26

; <label>:26:                                     ; preds = %62, %25
  %27 = load i32, i32* %11, align 4
  %28 = load i32, i32* %7, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %66

; <label>:30:                                     ; preds = %26
  %31 = load i32, i32* %9, align 4
  %32 = load i32, i32* %6, align 4
  %33 = mul nsw i32 %31, %32
  %34 = load i32, i32* %7, align 4
  %35 = mul nsw i32 %33, %34
  %36 = load i32, i32* %10, align 4
  %37 = load i32, i32* %7, align 4
  %38 = mul nsw i32 %36, %37
  %39 = add nsw i32 %35, %38
  %40 = load i32, i32* %11, align 4
  %41 = add nsw i32 %39, %40
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %48

; <label>:44:                                     ; preds = %30
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %45 = add i64 %pgocount, 1
  store i64 %45, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %48

; <label>:48:                                     ; preds = %44, %30
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %50 = load [140 x [160 x double]]*, [140 x [160 x double]]** %8, align 8
  %51 = load i32, i32* %9, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %50, i64 %52
  %54 = load i32, i32* %10, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %53, i64 0, i64 %55
  %57 = load i32, i32* %11, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [160 x double], [160 x double]* %56, i64 0, i64 %58
  %60 = load double, double* %59, align 8
  %61 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %49, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %60)
  br label %62

; <label>:62:                                     ; preds = %48
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %63 = add i64 %pgocount1, 1
  store i64 %63, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %64 = load i32, i32* %11, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %11, align 4
  br label %26

; <label>:66:                                     ; preds = %26
  br label %67

; <label>:67:                                     ; preds = %66
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %68 = add i64 %pgocount2, 1
  store i64 %68, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %69 = load i32, i32* %10, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %10, align 4
  br label %21

; <label>:71:                                     ; preds = %21
  br label %72

; <label>:72:                                     ; preds = %71
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %73 = add i64 %pgocount3, 1
  store i64 %73, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %74 = load i32, i32* %9, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %9, align 4
  br label %16

; <label>:76:                                     ; preds = %16
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %77 = add i64 %pgocount4, 1
  store i64 %77, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %78 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %79 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %78, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %80 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %81 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %80, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
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

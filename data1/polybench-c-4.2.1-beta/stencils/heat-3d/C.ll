; ModuleID = 'B.ll'
source_filename = "heat-3d.c"
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
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_heat_3d = private constant [19 x i8] c"B.ll:kernel_heat_3d"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 74483645111, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_heat_3d = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_heat_3d = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2431518469571330303, i64 158928700190, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_heat_3d, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 89615196140, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [59 x i8] c"9\00main\01B.ll:init_array\01B.ll:kernel_heat_3d\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_heat_3d to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [120 x [120 x [120 x double]]]*, align 8
  %9 = alloca [120 x [120 x [120 x double]]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 120, i32* %6, align 4
  store i32 500, i32* %7, align 4
  %10 = call i8* @polybench_alloc_data(i64 1728000, i32 8)
  %11 = bitcast i8* %10 to [120 x [120 x [120 x double]]]*
  store [120 x [120 x [120 x double]]]* %11, [120 x [120 x [120 x double]]]** %8, align 8
  %12 = call i8* @polybench_alloc_data(i64 1728000, i32 8)
  %13 = bitcast i8* %12 to [120 x [120 x [120 x double]]]*
  store [120 x [120 x [120 x double]]]* %13, [120 x [120 x [120 x double]]]** %9, align 8
  %14 = load i32, i32* %6, align 4
  %15 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %8, align 8
  %16 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %15, i32 0, i32 0
  %17 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %9, align 8
  %18 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %17, i32 0, i32 0
  call void @init_array(i32 %14, [120 x [120 x double]]* %16, [120 x [120 x double]]* %18)
  call void (...) @polybench_timer_start()
  %19 = load i32, i32* %7, align 4
  %20 = load i32, i32* %6, align 4
  %21 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %8, align 8
  %22 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %21, i32 0, i32 0
  %23 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %9, align 8
  %24 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %23, i32 0, i32 0
  call void @kernel_heat_3d(i32 %19, i32 %20, [120 x [120 x double]]* %22, [120 x [120 x double]]* %24)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %25 = load i32, i32* %4, align 4
  %26 = icmp sgt i32 %25, 42
  br i1 %26, label %27, label %39

; <label>:27:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %29 = load i8**, i8*** %5, align 8
  %30 = getelementptr inbounds i8*, i8** %29, i64 0
  %31 = load i8*, i8** %30, align 8
  %32 = call i32 @strcmp(i8* %31, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %39, label %34

; <label>:34:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %36 = load i32, i32* %6, align 4
  %37 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %8, align 8
  %38 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %37, i32 0, i32 0
  call void @print_array(i32 %36, [120 x [120 x double]]* %38)
  br label %39

; <label>:39:                                     ; preds = %34, %27, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %40 = add i64 %pgocount2, 1
  store i64 %40, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %41 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %8, align 8
  %42 = bitcast [120 x [120 x [120 x double]]]* %41 to i8*
  call void @free(i8* %42) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca [120 x [120 x double]]*, align 8
  %6 = alloca [120 x [120 x double]]*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store [120 x [120 x double]]* %1, [120 x [120 x double]]** %5, align 8
  store [120 x [120 x double]]* %2, [120 x [120 x double]]** %6, align 8
  store i32 0, i32* %7, align 4
  br label %10

; <label>:10:                                     ; preds = %67, %3
  %11 = load i32, i32* %7, align 4
  %12 = load i32, i32* %4, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %71

; <label>:14:                                     ; preds = %10
  store i32 0, i32* %8, align 4
  br label %15

; <label>:15:                                     ; preds = %62, %14
  %16 = load i32, i32* %8, align 4
  %17 = load i32, i32* %4, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %66

; <label>:19:                                     ; preds = %15
  store i32 0, i32* %9, align 4
  br label %20

; <label>:20:                                     ; preds = %57, %19
  %21 = load i32, i32* %9, align 4
  %22 = load i32, i32* %4, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %61

; <label>:24:                                     ; preds = %20
  %25 = load i32, i32* %7, align 4
  %26 = load i32, i32* %8, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, i32* %4, align 4
  %29 = load i32, i32* %9, align 4
  %30 = sub nsw i32 %28, %29
  %31 = add nsw i32 %27, %30
  %32 = sitofp i32 %31 to double
  %33 = fmul double %32, 1.000000e+01
  %34 = load i32, i32* %4, align 4
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %33, %35
  %37 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %38 = load i32, i32* %7, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %37, i64 %39
  %41 = load i32, i32* %8, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %40, i64 0, i64 %42
  %44 = load i32, i32* %9, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [120 x double], [120 x double]* %43, i64 0, i64 %45
  store double %36, double* %46, align 8
  %47 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %48 = load i32, i32* %7, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %47, i64 %49
  %51 = load i32, i32* %8, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %50, i64 0, i64 %52
  %54 = load i32, i32* %9, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [120 x double], [120 x double]* %53, i64 0, i64 %55
  store double %36, double* %56, align 8
  br label %57

; <label>:57:                                     ; preds = %24
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %58 = add i64 %pgocount, 1
  store i64 %58, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %59 = load i32, i32* %9, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %9, align 4
  br label %20

; <label>:61:                                     ; preds = %20
  br label %62

; <label>:62:                                     ; preds = %61
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %63 = add i64 %pgocount1, 1
  store i64 %63, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %64 = load i32, i32* %8, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %8, align 4
  br label %15

; <label>:66:                                     ; preds = %15
  br label %67

; <label>:67:                                     ; preds = %66
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %68 = add i64 %pgocount2, 1
  store i64 %68, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %69 = load i32, i32* %7, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %7, align 4
  br label %10

; <label>:71:                                     ; preds = %10
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %72 = add i64 %pgocount3, 1
  store i64 %72, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [120 x [120 x double]]*, align 8
  %8 = alloca [120 x [120 x double]]*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store [120 x [120 x double]]* %2, [120 x [120 x double]]** %7, align 8
  store [120 x [120 x double]]* %3, [120 x [120 x double]]** %8, align 8
  store i32 1, i32* %9, align 4
  br label %13

; <label>:13:                                     ; preds = %365, %4
  %14 = load i32, i32* %9, align 4
  %15 = icmp sle i32 %14, 500
  br i1 %15, label %16, label %369

; <label>:16:                                     ; preds = %13
  store i32 1, i32* %10, align 4
  br label %17

; <label>:17:                                     ; preds = %186, %16
  %18 = load i32, i32* %10, align 4
  %19 = load i32, i32* %6, align 4
  %20 = sub nsw i32 %19, 1
  %21 = icmp slt i32 %18, %20
  br i1 %21, label %22, label %190

; <label>:22:                                     ; preds = %17
  store i32 1, i32* %11, align 4
  br label %23

; <label>:23:                                     ; preds = %181, %22
  %24 = load i32, i32* %11, align 4
  %25 = load i32, i32* %6, align 4
  %26 = sub nsw i32 %25, 1
  %27 = icmp slt i32 %24, %26
  br i1 %27, label %28, label %185

; <label>:28:                                     ; preds = %23
  store i32 1, i32* %12, align 4
  br label %29

; <label>:29:                                     ; preds = %176, %28
  %30 = load i32, i32* %12, align 4
  %31 = load i32, i32* %6, align 4
  %32 = sub nsw i32 %31, 1
  %33 = icmp slt i32 %30, %32
  br i1 %33, label %34, label %180

; <label>:34:                                     ; preds = %29
  %35 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %36 = load i32, i32* %10, align 4
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %35, i64 %38
  %40 = load i32, i32* %11, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %39, i64 0, i64 %41
  %43 = load i32, i32* %12, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [120 x double], [120 x double]* %42, i64 0, i64 %44
  %46 = load double, double* %45, align 8
  %47 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %48 = load i32, i32* %10, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %47, i64 %49
  %51 = load i32, i32* %11, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %50, i64 0, i64 %52
  %54 = load i32, i32* %12, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [120 x double], [120 x double]* %53, i64 0, i64 %55
  %57 = load double, double* %56, align 8
  %58 = fmul double 2.000000e+00, %57
  %59 = fsub double %46, %58
  %60 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %61 = load i32, i32* %10, align 4
  %62 = sub nsw i32 %61, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %60, i64 %63
  %65 = load i32, i32* %11, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %64, i64 0, i64 %66
  %68 = load i32, i32* %12, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [120 x double], [120 x double]* %67, i64 0, i64 %69
  %71 = load double, double* %70, align 8
  %72 = fadd double %59, %71
  %73 = fmul double 1.250000e-01, %72
  %74 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %75 = load i32, i32* %10, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %74, i64 %76
  %78 = load i32, i32* %11, align 4
  %79 = add nsw i32 %78, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %77, i64 0, i64 %80
  %82 = load i32, i32* %12, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [120 x double], [120 x double]* %81, i64 0, i64 %83
  %85 = load double, double* %84, align 8
  %86 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %87 = load i32, i32* %10, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %86, i64 %88
  %90 = load i32, i32* %11, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %89, i64 0, i64 %91
  %93 = load i32, i32* %12, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [120 x double], [120 x double]* %92, i64 0, i64 %94
  %96 = load double, double* %95, align 8
  %97 = fmul double 2.000000e+00, %96
  %98 = fsub double %85, %97
  %99 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %100 = load i32, i32* %10, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %99, i64 %101
  %103 = load i32, i32* %11, align 4
  %104 = sub nsw i32 %103, 1
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %102, i64 0, i64 %105
  %107 = load i32, i32* %12, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [120 x double], [120 x double]* %106, i64 0, i64 %108
  %110 = load double, double* %109, align 8
  %111 = fadd double %98, %110
  %112 = fmul double 1.250000e-01, %111
  %113 = fadd double %73, %112
  %114 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %115 = load i32, i32* %10, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %114, i64 %116
  %118 = load i32, i32* %11, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %117, i64 0, i64 %119
  %121 = load i32, i32* %12, align 4
  %122 = add nsw i32 %121, 1
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [120 x double], [120 x double]* %120, i64 0, i64 %123
  %125 = load double, double* %124, align 8
  %126 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %127 = load i32, i32* %10, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %126, i64 %128
  %130 = load i32, i32* %11, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %129, i64 0, i64 %131
  %133 = load i32, i32* %12, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [120 x double], [120 x double]* %132, i64 0, i64 %134
  %136 = load double, double* %135, align 8
  %137 = fmul double 2.000000e+00, %136
  %138 = fsub double %125, %137
  %139 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %140 = load i32, i32* %10, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %139, i64 %141
  %143 = load i32, i32* %11, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %142, i64 0, i64 %144
  %146 = load i32, i32* %12, align 4
  %147 = sub nsw i32 %146, 1
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [120 x double], [120 x double]* %145, i64 0, i64 %148
  %150 = load double, double* %149, align 8
  %151 = fadd double %138, %150
  %152 = fmul double 1.250000e-01, %151
  %153 = fadd double %113, %152
  %154 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %155 = load i32, i32* %10, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %154, i64 %156
  %158 = load i32, i32* %11, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %157, i64 0, i64 %159
  %161 = load i32, i32* %12, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds [120 x double], [120 x double]* %160, i64 0, i64 %162
  %164 = load double, double* %163, align 8
  %165 = fadd double %153, %164
  %166 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %167 = load i32, i32* %10, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %166, i64 %168
  %170 = load i32, i32* %11, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %169, i64 0, i64 %171
  %173 = load i32, i32* %12, align 4
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [120 x double], [120 x double]* %172, i64 0, i64 %174
  store double %165, double* %175, align 8
  br label %176

; <label>:176:                                    ; preds = %34
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 0)
  %177 = add i64 %pgocount, 1
  store i64 %177, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 0)
  %178 = load i32, i32* %12, align 4
  %179 = add nsw i32 %178, 1
  store i32 %179, i32* %12, align 4
  br label %29

; <label>:180:                                    ; preds = %29
  br label %181

; <label>:181:                                    ; preds = %180
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 2)
  %182 = add i64 %pgocount1, 1
  store i64 %182, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 2)
  %183 = load i32, i32* %11, align 4
  %184 = add nsw i32 %183, 1
  store i32 %184, i32* %11, align 4
  br label %23

; <label>:185:                                    ; preds = %23
  br label %186

; <label>:186:                                    ; preds = %185
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 4)
  %187 = add i64 %pgocount2, 1
  store i64 %187, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 4)
  %188 = load i32, i32* %10, align 4
  %189 = add nsw i32 %188, 1
  store i32 %189, i32* %10, align 4
  br label %17

; <label>:190:                                    ; preds = %17
  store i32 1, i32* %10, align 4
  br label %191

; <label>:191:                                    ; preds = %360, %190
  %192 = load i32, i32* %10, align 4
  %193 = load i32, i32* %6, align 4
  %194 = sub nsw i32 %193, 1
  %195 = icmp slt i32 %192, %194
  br i1 %195, label %196, label %364

; <label>:196:                                    ; preds = %191
  store i32 1, i32* %11, align 4
  br label %197

; <label>:197:                                    ; preds = %355, %196
  %198 = load i32, i32* %11, align 4
  %199 = load i32, i32* %6, align 4
  %200 = sub nsw i32 %199, 1
  %201 = icmp slt i32 %198, %200
  br i1 %201, label %202, label %359

; <label>:202:                                    ; preds = %197
  store i32 1, i32* %12, align 4
  br label %203

; <label>:203:                                    ; preds = %350, %202
  %204 = load i32, i32* %12, align 4
  %205 = load i32, i32* %6, align 4
  %206 = sub nsw i32 %205, 1
  %207 = icmp slt i32 %204, %206
  br i1 %207, label %208, label %354

; <label>:208:                                    ; preds = %203
  %209 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %210 = load i32, i32* %10, align 4
  %211 = add nsw i32 %210, 1
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %209, i64 %212
  %214 = load i32, i32* %11, align 4
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %213, i64 0, i64 %215
  %217 = load i32, i32* %12, align 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [120 x double], [120 x double]* %216, i64 0, i64 %218
  %220 = load double, double* %219, align 8
  %221 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %222 = load i32, i32* %10, align 4
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %221, i64 %223
  %225 = load i32, i32* %11, align 4
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %224, i64 0, i64 %226
  %228 = load i32, i32* %12, align 4
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds [120 x double], [120 x double]* %227, i64 0, i64 %229
  %231 = load double, double* %230, align 8
  %232 = fmul double 2.000000e+00, %231
  %233 = fsub double %220, %232
  %234 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %235 = load i32, i32* %10, align 4
  %236 = sub nsw i32 %235, 1
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %234, i64 %237
  %239 = load i32, i32* %11, align 4
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %238, i64 0, i64 %240
  %242 = load i32, i32* %12, align 4
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds [120 x double], [120 x double]* %241, i64 0, i64 %243
  %245 = load double, double* %244, align 8
  %246 = fadd double %233, %245
  %247 = fmul double 1.250000e-01, %246
  %248 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %249 = load i32, i32* %10, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %248, i64 %250
  %252 = load i32, i32* %11, align 4
  %253 = add nsw i32 %252, 1
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %251, i64 0, i64 %254
  %256 = load i32, i32* %12, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [120 x double], [120 x double]* %255, i64 0, i64 %257
  %259 = load double, double* %258, align 8
  %260 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %261 = load i32, i32* %10, align 4
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %260, i64 %262
  %264 = load i32, i32* %11, align 4
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %263, i64 0, i64 %265
  %267 = load i32, i32* %12, align 4
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds [120 x double], [120 x double]* %266, i64 0, i64 %268
  %270 = load double, double* %269, align 8
  %271 = fmul double 2.000000e+00, %270
  %272 = fsub double %259, %271
  %273 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %274 = load i32, i32* %10, align 4
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %273, i64 %275
  %277 = load i32, i32* %11, align 4
  %278 = sub nsw i32 %277, 1
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %276, i64 0, i64 %279
  %281 = load i32, i32* %12, align 4
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds [120 x double], [120 x double]* %280, i64 0, i64 %282
  %284 = load double, double* %283, align 8
  %285 = fadd double %272, %284
  %286 = fmul double 1.250000e-01, %285
  %287 = fadd double %247, %286
  %288 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %289 = load i32, i32* %10, align 4
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %288, i64 %290
  %292 = load i32, i32* %11, align 4
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %291, i64 0, i64 %293
  %295 = load i32, i32* %12, align 4
  %296 = add nsw i32 %295, 1
  %297 = sext i32 %296 to i64
  %298 = getelementptr inbounds [120 x double], [120 x double]* %294, i64 0, i64 %297
  %299 = load double, double* %298, align 8
  %300 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %301 = load i32, i32* %10, align 4
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %300, i64 %302
  %304 = load i32, i32* %11, align 4
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %303, i64 0, i64 %305
  %307 = load i32, i32* %12, align 4
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds [120 x double], [120 x double]* %306, i64 0, i64 %308
  %310 = load double, double* %309, align 8
  %311 = fmul double 2.000000e+00, %310
  %312 = fsub double %299, %311
  %313 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %314 = load i32, i32* %10, align 4
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %313, i64 %315
  %317 = load i32, i32* %11, align 4
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %316, i64 0, i64 %318
  %320 = load i32, i32* %12, align 4
  %321 = sub nsw i32 %320, 1
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds [120 x double], [120 x double]* %319, i64 0, i64 %322
  %324 = load double, double* %323, align 8
  %325 = fadd double %312, %324
  %326 = fmul double 1.250000e-01, %325
  %327 = fadd double %287, %326
  %328 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %329 = load i32, i32* %10, align 4
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %328, i64 %330
  %332 = load i32, i32* %11, align 4
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %331, i64 0, i64 %333
  %335 = load i32, i32* %12, align 4
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds [120 x double], [120 x double]* %334, i64 0, i64 %336
  %338 = load double, double* %337, align 8
  %339 = fadd double %327, %338
  %340 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %341 = load i32, i32* %10, align 4
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %340, i64 %342
  %344 = load i32, i32* %11, align 4
  %345 = sext i32 %344 to i64
  %346 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %343, i64 0, i64 %345
  %347 = load i32, i32* %12, align 4
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds [120 x double], [120 x double]* %346, i64 0, i64 %348
  store double %339, double* %349, align 8
  br label %350

; <label>:350:                                    ; preds = %208
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 1)
  %351 = add i64 %pgocount3, 1
  store i64 %351, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 1)
  %352 = load i32, i32* %12, align 4
  %353 = add nsw i32 %352, 1
  store i32 %353, i32* %12, align 4
  br label %203

; <label>:354:                                    ; preds = %203
  br label %355

; <label>:355:                                    ; preds = %354
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 3)
  %356 = add i64 %pgocount4, 1
  store i64 %356, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 3)
  %357 = load i32, i32* %11, align 4
  %358 = add nsw i32 %357, 1
  store i32 %358, i32* %11, align 4
  br label %197

; <label>:359:                                    ; preds = %197
  br label %360

; <label>:360:                                    ; preds = %359
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 5)
  %361 = add i64 %pgocount5, 1
  store i64 %361, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 5)
  %362 = load i32, i32* %10, align 4
  %363 = add nsw i32 %362, 1
  store i32 %363, i32* %10, align 4
  br label %191

; <label>:364:                                    ; preds = %191
  br label %365

; <label>:365:                                    ; preds = %364
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 6)
  %366 = add i64 %pgocount6, 1
  store i64 %366, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 6)
  %367 = load i32, i32* %9, align 4
  %368 = add nsw i32 %367, 1
  store i32 %368, i32* %9, align 4
  br label %13

; <label>:369:                                    ; preds = %13
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 7)
  %370 = add i64 %pgocount7, 1
  store i64 %370, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 7)
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [120 x [120 x double]]*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca [120 x [120 x double]]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [120 x [120 x double]]* %1, [120 x [120 x double]]** %4, align 8
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  br label %12

; <label>:12:                                     ; preds = %68, %2
  %13 = load i32, i32* %5, align 4
  %14 = load i32, i32* %3, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %72

; <label>:16:                                     ; preds = %12
  store i32 0, i32* %6, align 4
  br label %17

; <label>:17:                                     ; preds = %63, %16
  %18 = load i32, i32* %6, align 4
  %19 = load i32, i32* %3, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %67

; <label>:21:                                     ; preds = %17
  store i32 0, i32* %7, align 4
  br label %22

; <label>:22:                                     ; preds = %58, %21
  %23 = load i32, i32* %7, align 4
  %24 = load i32, i32* %3, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %62

; <label>:26:                                     ; preds = %22
  %27 = load i32, i32* %5, align 4
  %28 = load i32, i32* %3, align 4
  %29 = mul nsw i32 %27, %28
  %30 = load i32, i32* %3, align 4
  %31 = mul nsw i32 %29, %30
  %32 = load i32, i32* %6, align 4
  %33 = load i32, i32* %3, align 4
  %34 = mul nsw i32 %32, %33
  %35 = add nsw i32 %31, %34
  %36 = load i32, i32* %7, align 4
  %37 = add nsw i32 %35, %36
  %38 = srem i32 %37, 20
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %44

; <label>:40:                                     ; preds = %26
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %41 = add i64 %pgocount, 1
  store i64 %41, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %44

; <label>:44:                                     ; preds = %40, %26
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = load [120 x [120 x double]]*, [120 x [120 x double]]** %4, align 8
  %47 = load i32, i32* %5, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %46, i64 %48
  %50 = load i32, i32* %6, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %49, i64 0, i64 %51
  %53 = load i32, i32* %7, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [120 x double], [120 x double]* %52, i64 0, i64 %54
  %56 = load double, double* %55, align 8
  %57 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %56)
  br label %58

; <label>:58:                                     ; preds = %44
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %59 = add i64 %pgocount1, 1
  store i64 %59, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %60 = load i32, i32* %7, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %7, align 4
  br label %22

; <label>:62:                                     ; preds = %22
  br label %63

; <label>:63:                                     ; preds = %62
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %64 = add i64 %pgocount2, 1
  store i64 %64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %65 = load i32, i32* %6, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* %6, align 4
  br label %17

; <label>:67:                                     ; preds = %17
  br label %68

; <label>:68:                                     ; preds = %67
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %69 = add i64 %pgocount3, 1
  store i64 %69, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %70 = load i32, i32* %5, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %5, align 4
  br label %12

; <label>:72:                                     ; preds = %12
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %73 = add i64 %pgocount4, 1
  store i64 %73, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %75 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %74, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %77 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %76, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
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

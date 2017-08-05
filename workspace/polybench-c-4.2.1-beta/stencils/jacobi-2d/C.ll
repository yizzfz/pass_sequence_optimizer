; ModuleID = 'B.ll'
source_filename = "jacobi-2d.c"
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
@__profn_B.ll_kernel_jacobi_2d = private constant [21 x i8] c"B.ll:kernel_jacobi_2d"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_jacobi_2d = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_jacobi_2d = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9078208458297787858, i64 119074655252, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_jacobi_2d, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [55 x i8] c";5x\DA\CBM\CC\CCct\D2\CB\C9\B1\CA\CC\CB,\89O,*J\AC\84\F0\B3S\8B\F2Rs\E2\B3\12\93\F3\932\E3\8DR \A2\05E\99yPe\00p3\15I", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_jacobi_2d to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [1300 x [1300 x double]]*, align 8
  %9 = alloca [1300 x [1300 x double]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1300, i32* %6, align 4
  store i32 500, i32* %7, align 4
  %10 = call i8* @polybench_alloc_data(i64 1690000, i32 8)
  %11 = bitcast i8* %10 to [1300 x [1300 x double]]*
  store [1300 x [1300 x double]]* %11, [1300 x [1300 x double]]** %8, align 8
  %12 = call i8* @polybench_alloc_data(i64 1690000, i32 8)
  %13 = bitcast i8* %12 to [1300 x [1300 x double]]*
  store [1300 x [1300 x double]]* %13, [1300 x [1300 x double]]** %9, align 8
  %14 = load i32, i32* %6, align 4
  %15 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %8, align 8
  %16 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %15, i32 0, i32 0
  %17 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %9, align 8
  %18 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %17, i32 0, i32 0
  call void @init_array(i32 %14, [1300 x double]* %16, [1300 x double]* %18)
  call void (...) @polybench_timer_start()
  %19 = load i32, i32* %7, align 4
  %20 = load i32, i32* %6, align 4
  %21 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %8, align 8
  %22 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %21, i32 0, i32 0
  %23 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %9, align 8
  %24 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %23, i32 0, i32 0
  call void @kernel_jacobi_2d(i32 %19, i32 %20, [1300 x double]* %22, [1300 x double]* %24)
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
  %37 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %8, align 8
  %38 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %37, i32 0, i32 0
  call void @print_array(i32 %36, [1300 x double]* %38)
  br label %39

; <label>:39:                                     ; preds = %34, %27, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %40 = add i64 %pgocount2, 1
  store i64 %40, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %41 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %8, align 8
  %42 = bitcast [1300 x [1300 x double]]* %41 to i8*
  call void @free(i8* %42) #4
  %43 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %9, align 8
  %44 = bitcast [1300 x [1300 x double]]* %43 to i8*
  call void @free(i8* %44) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: nounwind uwtable
define internal void @init_array(i32, [1300 x double]*, [1300 x double]*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca [1300 x double]*, align 8
  %6 = alloca [1300 x double]*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store [1300 x double]* %1, [1300 x double]** %5, align 8
  store [1300 x double]* %2, [1300 x double]** %6, align 8
  store i32 0, i32* %7, align 4
  br label %9

; <label>:9:                                      ; preds = %58, %3
  %10 = load i32, i32* %7, align 4
  %11 = load i32, i32* %4, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %62

; <label>:13:                                     ; preds = %9
  store i32 0, i32* %8, align 4
  br label %14

; <label>:14:                                     ; preds = %53, %13
  %15 = load i32, i32* %8, align 4
  %16 = load i32, i32* %4, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %57

; <label>:18:                                     ; preds = %14
  %19 = load i32, i32* %7, align 4
  %20 = sitofp i32 %19 to double
  %21 = load i32, i32* %8, align 4
  %22 = add nsw i32 %21, 2
  %23 = sitofp i32 %22 to double
  %24 = fmul double %20, %23
  %25 = fadd double %24, 2.000000e+00
  %26 = load i32, i32* %4, align 4
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %25, %27
  %29 = load [1300 x double]*, [1300 x double]** %5, align 8
  %30 = load i32, i32* %7, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [1300 x double], [1300 x double]* %29, i64 %31
  %33 = load i32, i32* %8, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [1300 x double], [1300 x double]* %32, i64 0, i64 %34
  store double %28, double* %35, align 8
  %36 = load i32, i32* %7, align 4
  %37 = sitofp i32 %36 to double
  %38 = load i32, i32* %8, align 4
  %39 = add nsw i32 %38, 3
  %40 = sitofp i32 %39 to double
  %41 = fmul double %37, %40
  %42 = fadd double %41, 3.000000e+00
  %43 = load i32, i32* %4, align 4
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %42, %44
  %46 = load [1300 x double]*, [1300 x double]** %6, align 8
  %47 = load i32, i32* %7, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [1300 x double], [1300 x double]* %46, i64 %48
  %50 = load i32, i32* %8, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [1300 x double], [1300 x double]* %49, i64 0, i64 %51
  store double %45, double* %52, align 8
  br label %53

; <label>:53:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %54 = add i64 %pgocount, 1
  store i64 %54, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %55 = load i32, i32* %8, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %8, align 4
  br label %14

; <label>:57:                                     ; preds = %14
  br label %58

; <label>:58:                                     ; preds = %57
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %59 = add i64 %pgocount1, 1
  store i64 %59, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %60 = load i32, i32* %7, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %7, align 4
  br label %9

; <label>:62:                                     ; preds = %9
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %63 = add i64 %pgocount2, 1
  store i64 %63, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: nounwind uwtable
define internal void @kernel_jacobi_2d(i32, i32, [1300 x double]*, [1300 x double]*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [1300 x double]*, align 8
  %8 = alloca [1300 x double]*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store [1300 x double]* %2, [1300 x double]** %7, align 8
  store [1300 x double]* %3, [1300 x double]** %8, align 8
  store i32 0, i32* %9, align 4
  br label %12

; <label>:12:                                     ; preds = %173, %4
  %13 = load i32, i32* %9, align 4
  %14 = load i32, i32* %5, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %177

; <label>:16:                                     ; preds = %12
  store i32 1, i32* %10, align 4
  br label %17

; <label>:17:                                     ; preds = %90, %16
  %18 = load i32, i32* %10, align 4
  %19 = load i32, i32* %6, align 4
  %20 = sub nsw i32 %19, 1
  %21 = icmp slt i32 %18, %20
  br i1 %21, label %22, label %94

; <label>:22:                                     ; preds = %17
  store i32 1, i32* %11, align 4
  br label %23

; <label>:23:                                     ; preds = %85, %22
  %24 = load i32, i32* %11, align 4
  %25 = load i32, i32* %6, align 4
  %26 = sub nsw i32 %25, 1
  %27 = icmp slt i32 %24, %26
  br i1 %27, label %28, label %89

; <label>:28:                                     ; preds = %23
  %29 = load [1300 x double]*, [1300 x double]** %7, align 8
  %30 = load i32, i32* %10, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [1300 x double], [1300 x double]* %29, i64 %31
  %33 = load i32, i32* %11, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [1300 x double], [1300 x double]* %32, i64 0, i64 %34
  %36 = load double, double* %35, align 8
  %37 = load [1300 x double]*, [1300 x double]** %7, align 8
  %38 = load i32, i32* %10, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1300 x double], [1300 x double]* %37, i64 %39
  %41 = load i32, i32* %11, align 4
  %42 = sub nsw i32 %41, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [1300 x double], [1300 x double]* %40, i64 0, i64 %43
  %45 = load double, double* %44, align 8
  %46 = fadd double %36, %45
  %47 = load [1300 x double]*, [1300 x double]** %7, align 8
  %48 = load i32, i32* %10, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [1300 x double], [1300 x double]* %47, i64 %49
  %51 = load i32, i32* %11, align 4
  %52 = add nsw i32 1, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [1300 x double], [1300 x double]* %50, i64 0, i64 %53
  %55 = load double, double* %54, align 8
  %56 = fadd double %46, %55
  %57 = load [1300 x double]*, [1300 x double]** %7, align 8
  %58 = load i32, i32* %10, align 4
  %59 = add nsw i32 1, %58
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [1300 x double], [1300 x double]* %57, i64 %60
  %62 = load i32, i32* %11, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [1300 x double], [1300 x double]* %61, i64 0, i64 %63
  %65 = load double, double* %64, align 8
  %66 = fadd double %56, %65
  %67 = load [1300 x double]*, [1300 x double]** %7, align 8
  %68 = load i32, i32* %10, align 4
  %69 = sub nsw i32 %68, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [1300 x double], [1300 x double]* %67, i64 %70
  %72 = load i32, i32* %11, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [1300 x double], [1300 x double]* %71, i64 0, i64 %73
  %75 = load double, double* %74, align 8
  %76 = fadd double %66, %75
  %77 = fmul double 2.000000e-01, %76
  %78 = load [1300 x double]*, [1300 x double]** %8, align 8
  %79 = load i32, i32* %10, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [1300 x double], [1300 x double]* %78, i64 %80
  %82 = load i32, i32* %11, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [1300 x double], [1300 x double]* %81, i64 0, i64 %83
  store double %77, double* %84, align 8
  br label %85

; <label>:85:                                     ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 0)
  %86 = add i64 %pgocount, 1
  store i64 %86, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 0)
  %87 = load i32, i32* %11, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %11, align 4
  br label %23

; <label>:89:                                     ; preds = %23
  br label %90

; <label>:90:                                     ; preds = %89
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 2)
  %91 = add i64 %pgocount1, 1
  store i64 %91, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 2)
  %92 = load i32, i32* %10, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %10, align 4
  br label %17

; <label>:94:                                     ; preds = %17
  store i32 1, i32* %10, align 4
  br label %95

; <label>:95:                                     ; preds = %168, %94
  %96 = load i32, i32* %10, align 4
  %97 = load i32, i32* %6, align 4
  %98 = sub nsw i32 %97, 1
  %99 = icmp slt i32 %96, %98
  br i1 %99, label %100, label %172

; <label>:100:                                    ; preds = %95
  store i32 1, i32* %11, align 4
  br label %101

; <label>:101:                                    ; preds = %163, %100
  %102 = load i32, i32* %11, align 4
  %103 = load i32, i32* %6, align 4
  %104 = sub nsw i32 %103, 1
  %105 = icmp slt i32 %102, %104
  br i1 %105, label %106, label %167

; <label>:106:                                    ; preds = %101
  %107 = load [1300 x double]*, [1300 x double]** %8, align 8
  %108 = load i32, i32* %10, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [1300 x double], [1300 x double]* %107, i64 %109
  %111 = load i32, i32* %11, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [1300 x double], [1300 x double]* %110, i64 0, i64 %112
  %114 = load double, double* %113, align 8
  %115 = load [1300 x double]*, [1300 x double]** %8, align 8
  %116 = load i32, i32* %10, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [1300 x double], [1300 x double]* %115, i64 %117
  %119 = load i32, i32* %11, align 4
  %120 = sub nsw i32 %119, 1
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [1300 x double], [1300 x double]* %118, i64 0, i64 %121
  %123 = load double, double* %122, align 8
  %124 = fadd double %114, %123
  %125 = load [1300 x double]*, [1300 x double]** %8, align 8
  %126 = load i32, i32* %10, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [1300 x double], [1300 x double]* %125, i64 %127
  %129 = load i32, i32* %11, align 4
  %130 = add nsw i32 1, %129
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [1300 x double], [1300 x double]* %128, i64 0, i64 %131
  %133 = load double, double* %132, align 8
  %134 = fadd double %124, %133
  %135 = load [1300 x double]*, [1300 x double]** %8, align 8
  %136 = load i32, i32* %10, align 4
  %137 = add nsw i32 1, %136
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds [1300 x double], [1300 x double]* %135, i64 %138
  %140 = load i32, i32* %11, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [1300 x double], [1300 x double]* %139, i64 0, i64 %141
  %143 = load double, double* %142, align 8
  %144 = fadd double %134, %143
  %145 = load [1300 x double]*, [1300 x double]** %8, align 8
  %146 = load i32, i32* %10, align 4
  %147 = sub nsw i32 %146, 1
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [1300 x double], [1300 x double]* %145, i64 %148
  %150 = load i32, i32* %11, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [1300 x double], [1300 x double]* %149, i64 0, i64 %151
  %153 = load double, double* %152, align 8
  %154 = fadd double %144, %153
  %155 = fmul double 2.000000e-01, %154
  %156 = load [1300 x double]*, [1300 x double]** %7, align 8
  %157 = load i32, i32* %10, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [1300 x double], [1300 x double]* %156, i64 %158
  %160 = load i32, i32* %11, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [1300 x double], [1300 x double]* %159, i64 0, i64 %161
  store double %155, double* %162, align 8
  br label %163

; <label>:163:                                    ; preds = %106
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 1)
  %164 = add i64 %pgocount2, 1
  store i64 %164, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 1)
  %165 = load i32, i32* %11, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, i32* %11, align 4
  br label %101

; <label>:167:                                    ; preds = %101
  br label %168

; <label>:168:                                    ; preds = %167
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 3)
  %169 = add i64 %pgocount3, 1
  store i64 %169, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 3)
  %170 = load i32, i32* %10, align 4
  %171 = add nsw i32 %170, 1
  store i32 %171, i32* %10, align 4
  br label %95

; <label>:172:                                    ; preds = %95
  br label %173

; <label>:173:                                    ; preds = %172
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 4)
  %174 = add i64 %pgocount4, 1
  store i64 %174, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 4)
  %175 = load i32, i32* %9, align 4
  %176 = add nsw i32 %175, 1
  store i32 %176, i32* %9, align 4
  br label %12

; <label>:177:                                    ; preds = %12
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 5)
  %178 = add i64 %pgocount5, 1
  store i64 %178, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 5)
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind uwtable
define internal void @print_array(i32, [1300 x double]*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca [1300 x double]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [1300 x double]* %1, [1300 x double]** %4, align 8
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
  %34 = load [1300 x double]*, [1300 x double]** %4, align 8
  %35 = load i32, i32* %5, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [1300 x double], [1300 x double]* %34, i64 %36
  %38 = load i32, i32* %6, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1300 x double], [1300 x double]* %37, i64 0, i64 %39
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

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

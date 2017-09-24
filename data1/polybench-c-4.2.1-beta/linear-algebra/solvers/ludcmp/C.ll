; ModuleID = 'B.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_ludcmp = private constant [18 x i8] c"B.ll:kernel_ludcmp"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 246217486477, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_ludcmp = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_ludcmp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2723921114217419270, i64 202275645223, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i32 0, i32 0), i8* null, i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 45130900406, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [58 x i8] c"8\00main\01B.ll:init_array\01B.ll:kernel_ludcmp\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_ludcmp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

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
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 2000, i32* %6, align 4
  %11 = call i8* @polybench_alloc_data(i64 4000000, i32 8)
  %12 = bitcast i8* %11 to [2000 x [2000 x double]]*
  store [2000 x [2000 x double]]* %12, [2000 x [2000 x double]]** %7, align 8
  %13 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %14 = bitcast i8* %13 to [2000 x double]*
  store [2000 x double]* %14, [2000 x double]** %8, align 8
  %15 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %16 = bitcast i8* %15 to [2000 x double]*
  store [2000 x double]* %16, [2000 x double]** %9, align 8
  %17 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %18 = bitcast i8* %17 to [2000 x double]*
  store [2000 x double]* %18, [2000 x double]** %10, align 8
  %19 = load i32, i32* %6, align 4
  %20 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %21 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i32 0, i32 0
  %22 = load [2000 x double]*, [2000 x double]** %8, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %22, i32 0, i32 0
  %24 = load [2000 x double]*, [2000 x double]** %9, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %24, i32 0, i32 0
  %26 = load [2000 x double]*, [2000 x double]** %10, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %26, i32 0, i32 0
  call void @init_array(i32 %19, [2000 x double]* %21, double* %23, double* %25, double* %27)
  call void (...) @polybench_timer_start()
  %28 = load i32, i32* %6, align 4
  %29 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %30 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i32 0, i32 0
  %31 = load [2000 x double]*, [2000 x double]** %8, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i32 0, i32 0
  %33 = load [2000 x double]*, [2000 x double]** %9, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i32 0, i32 0
  %35 = load [2000 x double]*, [2000 x double]** %10, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %35, i32 0, i32 0
  call void @kernel_ludcmp(i32 %28, [2000 x double]* %30, double* %32, double* %34, double* %36)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %37 = load i32, i32* %4, align 4
  %38 = icmp sgt i32 %37, 42
  br i1 %38, label %39, label %51

; <label>:39:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %41 = load i8**, i8*** %5, align 8
  %42 = getelementptr inbounds i8*, i8** %41, i64 0
  %43 = load i8*, i8** %42, align 8
  %44 = call i32 @strcmp(i8* %43, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %51, label %46

; <label>:46:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %48 = load i32, i32* %6, align 4
  %49 = load [2000 x double]*, [2000 x double]** %9, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %49, i32 0, i32 0
  call void @print_array(i32 %48, double* %50)
  br label %51

; <label>:51:                                     ; preds = %46, %39, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %53 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %54 = bitcast [2000 x [2000 x double]]* %53 to i8*
  call void @free(i8* %54) #4
  %55 = load [2000 x double]*, [2000 x double]** %8, align 8
  %56 = bitcast [2000 x double]* %55 to i8*
  call void @free(i8* %56) #4
  %57 = load [2000 x double]*, [2000 x double]** %9, align 8
  %58 = bitcast [2000 x double]* %57 to i8*
  call void @free(i8* %58) #4
  %59 = load [2000 x double]*, [2000 x double]** %10, align 8
  %60 = bitcast [2000 x double]* %59 to i8*
  call void @free(i8* %60) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, [2000 x double]*, double*, double*, double*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca [2000 x double]*, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca double, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca [2000 x [2000 x double]]*, align 8
  store i32 %0, i32* %6, align 4
  store [2000 x double]* %1, [2000 x double]** %7, align 8
  store double* %2, double** %8, align 8
  store double* %3, double** %9, align 8
  store double* %4, double** %10, align 8
  %18 = load i32, i32* %6, align 4
  %19 = sitofp i32 %18 to double
  store double %19, double* %13, align 8
  store i32 0, i32* %11, align 4
  br label %20

; <label>:20:                                     ; preds = %44, %5
  %21 = load i32, i32* %11, align 4
  %22 = load i32, i32* %6, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %48

; <label>:24:                                     ; preds = %20
  %25 = load double*, double** %9, align 8
  %26 = load i32, i32* %11, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds double, double* %25, i64 %27
  store double 0.000000e+00, double* %28, align 8
  %29 = load double*, double** %10, align 8
  %30 = load i32, i32* %11, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds double, double* %29, i64 %31
  store double 0.000000e+00, double* %32, align 8
  %33 = load i32, i32* %11, align 4
  %34 = add nsw i32 %33, 1
  %35 = sitofp i32 %34 to double
  %36 = load double, double* %13, align 8
  %37 = fdiv double %35, %36
  %38 = fdiv double %37, 2.000000e+00
  %39 = fadd double %38, 4.000000e+00
  %40 = load double*, double** %8, align 8
  %41 = load i32, i32* %11, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds double, double* %40, i64 %42
  store double %39, double* %43, align 8
  br label %44

; <label>:44:                                     ; preds = %24
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %45 = add i64 %pgocount, 1
  store i64 %45, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %46 = load i32, i32* %11, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %11, align 4
  br label %20

; <label>:48:                                     ; preds = %20
  store i32 0, i32* %11, align 4
  br label %49

; <label>:49:                                     ; preds = %106, %48
  %50 = load i32, i32* %11, align 4
  %51 = load i32, i32* %6, align 4
  %52 = icmp slt i32 %50, %51
  br i1 %52, label %53, label %110

; <label>:53:                                     ; preds = %49
  store i32 0, i32* %12, align 4
  br label %54

; <label>:54:                                     ; preds = %75, %53
  %55 = load i32, i32* %12, align 4
  %56 = load i32, i32* %11, align 4
  %57 = icmp sle i32 %55, %56
  br i1 %57, label %58, label %79

; <label>:58:                                     ; preds = %54
  %59 = load i32, i32* %12, align 4
  %60 = sub nsw i32 0, %59
  %61 = load i32, i32* %6, align 4
  %62 = srem i32 %60, %61
  %63 = sitofp i32 %62 to double
  %64 = load i32, i32* %6, align 4
  %65 = sitofp i32 %64 to double
  %66 = fdiv double %63, %65
  %67 = fadd double %66, 1.000000e+00
  %68 = load [2000 x double]*, [2000 x double]** %7, align 8
  %69 = load i32, i32* %11, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 %70
  %72 = load i32, i32* %12, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %71, i64 0, i64 %73
  store double %67, double* %74, align 8
  br label %75

; <label>:75:                                     ; preds = %58
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %76 = add i64 %pgocount1, 1
  store i64 %76, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %77 = load i32, i32* %12, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %12, align 4
  br label %54

; <label>:79:                                     ; preds = %54
  %80 = load i32, i32* %11, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, i32* %12, align 4
  br label %82

; <label>:82:                                     ; preds = %94, %79
  %83 = load i32, i32* %12, align 4
  %84 = load i32, i32* %6, align 4
  %85 = icmp slt i32 %83, %84
  br i1 %85, label %86, label %98

; <label>:86:                                     ; preds = %82
  %87 = load [2000 x double]*, [2000 x double]** %7, align 8
  %88 = load i32, i32* %11, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %87, i64 %89
  %91 = load i32, i32* %12, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %90, i64 0, i64 %92
  store double 0.000000e+00, double* %93, align 8
  br label %94

; <label>:94:                                     ; preds = %86
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %95 = add i64 %pgocount2, 1
  store i64 %95, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %96 = load i32, i32* %12, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %12, align 4
  br label %82

; <label>:98:                                     ; preds = %82
  %99 = load [2000 x double]*, [2000 x double]** %7, align 8
  %100 = load i32, i32* %11, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %99, i64 %101
  %103 = load i32, i32* %11, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %102, i64 0, i64 %104
  store double 1.000000e+00, double* %105, align 8
  br label %106

; <label>:106:                                    ; preds = %98
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %107 = add i64 %pgocount3, 1
  store i64 %107, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %108 = load i32, i32* %11, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %11, align 4
  br label %49

; <label>:110:                                    ; preds = %49
  %111 = call i8* @polybench_alloc_data(i64 4000000, i32 8)
  %112 = bitcast i8* %111 to [2000 x [2000 x double]]*
  store [2000 x [2000 x double]]* %112, [2000 x [2000 x double]]** %17, align 8
  store i32 0, i32* %14, align 4
  br label %113

; <label>:113:                                    ; preds = %135, %110
  %114 = load i32, i32* %14, align 4
  %115 = load i32, i32* %6, align 4
  %116 = icmp slt i32 %114, %115
  br i1 %116, label %117, label %139

; <label>:117:                                    ; preds = %113
  store i32 0, i32* %15, align 4
  br label %118

; <label>:118:                                    ; preds = %130, %117
  %119 = load i32, i32* %15, align 4
  %120 = load i32, i32* %6, align 4
  %121 = icmp slt i32 %119, %120
  br i1 %121, label %122, label %134

; <label>:122:                                    ; preds = %118
  %123 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %17, align 8
  %124 = load i32, i32* %14, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %123, i64 0, i64 %125
  %127 = load i32, i32* %15, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %126, i64 0, i64 %128
  store double 0.000000e+00, double* %129, align 8
  br label %130

; <label>:130:                                    ; preds = %122
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %131 = add i64 %pgocount4, 1
  store i64 %131, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %132 = load i32, i32* %15, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %15, align 4
  br label %118

; <label>:134:                                    ; preds = %118
  br label %135

; <label>:135:                                    ; preds = %134
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %136 = add i64 %pgocount5, 1
  store i64 %136, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %137 = load i32, i32* %14, align 4
  %138 = add nsw i32 %137, 1
  store i32 %138, i32* %14, align 4
  br label %113

; <label>:139:                                    ; preds = %113
  store i32 0, i32* %16, align 4
  br label %140

; <label>:140:                                    ; preds = %191, %139
  %141 = load i32, i32* %16, align 4
  %142 = load i32, i32* %6, align 4
  %143 = icmp slt i32 %141, %142
  br i1 %143, label %144, label %195

; <label>:144:                                    ; preds = %140
  store i32 0, i32* %14, align 4
  br label %145

; <label>:145:                                    ; preds = %186, %144
  %146 = load i32, i32* %14, align 4
  %147 = load i32, i32* %6, align 4
  %148 = icmp slt i32 %146, %147
  br i1 %148, label %149, label %190

; <label>:149:                                    ; preds = %145
  store i32 0, i32* %15, align 4
  br label %150

; <label>:150:                                    ; preds = %181, %149
  %151 = load i32, i32* %15, align 4
  %152 = load i32, i32* %6, align 4
  %153 = icmp slt i32 %151, %152
  br i1 %153, label %154, label %185

; <label>:154:                                    ; preds = %150
  %155 = load [2000 x double]*, [2000 x double]** %7, align 8
  %156 = load i32, i32* %14, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [2000 x double], [2000 x double]* %155, i64 %157
  %159 = load i32, i32* %16, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [2000 x double], [2000 x double]* %158, i64 0, i64 %160
  %162 = load double, double* %161, align 8
  %163 = load [2000 x double]*, [2000 x double]** %7, align 8
  %164 = load i32, i32* %15, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [2000 x double], [2000 x double]* %163, i64 %165
  %167 = load i32, i32* %16, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [2000 x double], [2000 x double]* %166, i64 0, i64 %168
  %170 = load double, double* %169, align 8
  %171 = fmul double %162, %170
  %172 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %17, align 8
  %173 = load i32, i32* %14, align 4
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %172, i64 0, i64 %174
  %176 = load i32, i32* %15, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [2000 x double], [2000 x double]* %175, i64 0, i64 %177
  %179 = load double, double* %178, align 8
  %180 = fadd double %179, %171
  store double %180, double* %178, align 8
  br label %181

; <label>:181:                                    ; preds = %154
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %182 = add i64 %pgocount6, 1
  store i64 %182, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %183 = load i32, i32* %15, align 4
  %184 = add nsw i32 %183, 1
  store i32 %184, i32* %15, align 4
  br label %150

; <label>:185:                                    ; preds = %150
  br label %186

; <label>:186:                                    ; preds = %185
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %187 = add i64 %pgocount7, 1
  store i64 %187, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %188 = load i32, i32* %14, align 4
  %189 = add nsw i32 %188, 1
  store i32 %189, i32* %14, align 4
  br label %145

; <label>:190:                                    ; preds = %145
  br label %191

; <label>:191:                                    ; preds = %190
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %192 = add i64 %pgocount8, 1
  store i64 %192, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %193 = load i32, i32* %16, align 4
  %194 = add nsw i32 %193, 1
  store i32 %194, i32* %16, align 4
  br label %140

; <label>:195:                                    ; preds = %140
  store i32 0, i32* %14, align 4
  br label %196

; <label>:196:                                    ; preds = %226, %195
  %197 = load i32, i32* %14, align 4
  %198 = load i32, i32* %6, align 4
  %199 = icmp slt i32 %197, %198
  br i1 %199, label %200, label %230

; <label>:200:                                    ; preds = %196
  store i32 0, i32* %15, align 4
  br label %201

; <label>:201:                                    ; preds = %221, %200
  %202 = load i32, i32* %15, align 4
  %203 = load i32, i32* %6, align 4
  %204 = icmp slt i32 %202, %203
  br i1 %204, label %205, label %225

; <label>:205:                                    ; preds = %201
  %206 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %17, align 8
  %207 = load i32, i32* %14, align 4
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %206, i64 0, i64 %208
  %210 = load i32, i32* %15, align 4
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds [2000 x double], [2000 x double]* %209, i64 0, i64 %211
  %213 = load double, double* %212, align 8
  %214 = load [2000 x double]*, [2000 x double]** %7, align 8
  %215 = load i32, i32* %14, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds [2000 x double], [2000 x double]* %214, i64 %216
  %218 = load i32, i32* %15, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [2000 x double], [2000 x double]* %217, i64 0, i64 %219
  store double %213, double* %220, align 8
  br label %221

; <label>:221:                                    ; preds = %205
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %222 = add i64 %pgocount9, 1
  store i64 %222, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %223 = load i32, i32* %15, align 4
  %224 = add nsw i32 %223, 1
  store i32 %224, i32* %15, align 4
  br label %201

; <label>:225:                                    ; preds = %201
  br label %226

; <label>:226:                                    ; preds = %225
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %227 = add i64 %pgocount10, 1
  store i64 %227, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %228 = load i32, i32* %14, align 4
  %229 = add nsw i32 %228, 1
  store i32 %229, i32* %14, align 4
  br label %196

; <label>:230:                                    ; preds = %196
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %231 = add i64 %pgocount11, 1
  store i64 %231, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %232 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %17, align 8
  %233 = bitcast [2000 x [2000 x double]]* %232 to i8*
  call void @free(i8* %233) #4
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_ludcmp(i32, [2000 x double]*, double*, double*, double*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca [2000 x double]*, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca double, align 8
  store i32 %0, i32* %6, align 4
  store [2000 x double]* %1, [2000 x double]** %7, align 8
  store double* %2, double** %8, align 8
  store double* %3, double** %9, align 8
  store double* %4, double** %10, align 8
  store i32 0, i32* %11, align 4
  br label %15

; <label>:15:                                     ; preds = %140, %5
  %16 = load i32, i32* %11, align 4
  %17 = load i32, i32* %6, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %144

; <label>:19:                                     ; preds = %15
  store i32 0, i32* %12, align 4
  br label %20

; <label>:20:                                     ; preds = %79, %19
  %21 = load i32, i32* %12, align 4
  %22 = load i32, i32* %11, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %83

; <label>:24:                                     ; preds = %20
  %25 = load [2000 x double]*, [2000 x double]** %7, align 8
  %26 = load i32, i32* %11, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %25, i64 %27
  %29 = load i32, i32* %12, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %28, i64 0, i64 %30
  %32 = load double, double* %31, align 8
  store double %32, double* %14, align 8
  store i32 0, i32* %13, align 4
  br label %33

; <label>:33:                                     ; preds = %57, %24
  %34 = load i32, i32* %13, align 4
  %35 = load i32, i32* %12, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %61

; <label>:37:                                     ; preds = %33
  %38 = load [2000 x double]*, [2000 x double]** %7, align 8
  %39 = load i32, i32* %11, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %40
  %42 = load i32, i32* %13, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %41, i64 0, i64 %43
  %45 = load double, double* %44, align 8
  %46 = load [2000 x double]*, [2000 x double]** %7, align 8
  %47 = load i32, i32* %13, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %48
  %50 = load i32, i32* %12, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %49, i64 0, i64 %51
  %53 = load double, double* %52, align 8
  %54 = fmul double %45, %53
  %55 = load double, double* %14, align 8
  %56 = fsub double %55, %54
  store double %56, double* %14, align 8
  br label %57

; <label>:57:                                     ; preds = %37
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 0)
  %58 = add i64 %pgocount, 1
  store i64 %58, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 0)
  %59 = load i32, i32* %13, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %13, align 4
  br label %33

; <label>:61:                                     ; preds = %33
  %62 = load double, double* %14, align 8
  %63 = load [2000 x double]*, [2000 x double]** %7, align 8
  %64 = load i32, i32* %12, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %63, i64 %65
  %67 = load i32, i32* %12, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i64 0, i64 %68
  %70 = load double, double* %69, align 8
  %71 = fdiv double %62, %70
  %72 = load [2000 x double]*, [2000 x double]** %7, align 8
  %73 = load i32, i32* %11, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 %74
  %76 = load i32, i32* %12, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %75, i64 0, i64 %77
  store double %71, double* %78, align 8
  br label %79

; <label>:79:                                     ; preds = %61
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 2)
  %80 = add i64 %pgocount1, 1
  store i64 %80, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 2)
  %81 = load i32, i32* %12, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* %12, align 4
  br label %20

; <label>:83:                                     ; preds = %20
  %84 = load i32, i32* %11, align 4
  store i32 %84, i32* %12, align 4
  br label %85

; <label>:85:                                     ; preds = %135, %83
  %86 = load i32, i32* %12, align 4
  %87 = load i32, i32* %6, align 4
  %88 = icmp slt i32 %86, %87
  br i1 %88, label %89, label %139

; <label>:89:                                     ; preds = %85
  %90 = load [2000 x double]*, [2000 x double]** %7, align 8
  %91 = load i32, i32* %11, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %90, i64 %92
  %94 = load i32, i32* %12, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %93, i64 0, i64 %95
  %97 = load double, double* %96, align 8
  store double %97, double* %14, align 8
  store i32 0, i32* %13, align 4
  br label %98

; <label>:98:                                     ; preds = %122, %89
  %99 = load i32, i32* %13, align 4
  %100 = load i32, i32* %11, align 4
  %101 = icmp slt i32 %99, %100
  br i1 %101, label %102, label %126

; <label>:102:                                    ; preds = %98
  %103 = load [2000 x double]*, [2000 x double]** %7, align 8
  %104 = load i32, i32* %11, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %103, i64 %105
  %107 = load i32, i32* %13, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %106, i64 0, i64 %108
  %110 = load double, double* %109, align 8
  %111 = load [2000 x double]*, [2000 x double]** %7, align 8
  %112 = load i32, i32* %13, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %111, i64 %113
  %115 = load i32, i32* %12, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %114, i64 0, i64 %116
  %118 = load double, double* %117, align 8
  %119 = fmul double %110, %118
  %120 = load double, double* %14, align 8
  %121 = fsub double %120, %119
  store double %121, double* %14, align 8
  br label %122

; <label>:122:                                    ; preds = %102
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 1)
  %123 = add i64 %pgocount2, 1
  store i64 %123, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 1)
  %124 = load i32, i32* %13, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %13, align 4
  br label %98

; <label>:126:                                    ; preds = %98
  %127 = load double, double* %14, align 8
  %128 = load [2000 x double]*, [2000 x double]** %7, align 8
  %129 = load i32, i32* %11, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 %130
  %132 = load i32, i32* %12, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %131, i64 0, i64 %133
  store double %127, double* %134, align 8
  br label %135

; <label>:135:                                    ; preds = %126
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 3)
  %136 = add i64 %pgocount3, 1
  store i64 %136, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 3)
  %137 = load i32, i32* %12, align 4
  %138 = add nsw i32 %137, 1
  store i32 %138, i32* %12, align 4
  br label %85

; <label>:139:                                    ; preds = %85
  br label %140

; <label>:140:                                    ; preds = %139
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 6)
  %141 = add i64 %pgocount4, 1
  store i64 %141, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 6)
  %142 = load i32, i32* %11, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, i32* %11, align 4
  br label %15

; <label>:144:                                    ; preds = %15
  store i32 0, i32* %11, align 4
  br label %145

; <label>:145:                                    ; preds = %186, %144
  %146 = load i32, i32* %11, align 4
  %147 = load i32, i32* %6, align 4
  %148 = icmp slt i32 %146, %147
  br i1 %148, label %149, label %190

; <label>:149:                                    ; preds = %145
  %150 = load double*, double** %8, align 8
  %151 = load i32, i32* %11, align 4
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds double, double* %150, i64 %152
  %154 = load double, double* %153, align 8
  store double %154, double* %14, align 8
  store i32 0, i32* %12, align 4
  br label %155

; <label>:155:                                    ; preds = %176, %149
  %156 = load i32, i32* %12, align 4
  %157 = load i32, i32* %11, align 4
  %158 = icmp slt i32 %156, %157
  br i1 %158, label %159, label %180

; <label>:159:                                    ; preds = %155
  %160 = load [2000 x double]*, [2000 x double]** %7, align 8
  %161 = load i32, i32* %11, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds [2000 x double], [2000 x double]* %160, i64 %162
  %164 = load i32, i32* %12, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [2000 x double], [2000 x double]* %163, i64 0, i64 %165
  %167 = load double, double* %166, align 8
  %168 = load double*, double** %10, align 8
  %169 = load i32, i32* %12, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds double, double* %168, i64 %170
  %172 = load double, double* %171, align 8
  %173 = fmul double %167, %172
  %174 = load double, double* %14, align 8
  %175 = fsub double %174, %173
  store double %175, double* %14, align 8
  br label %176

; <label>:176:                                    ; preds = %159
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 4)
  %177 = add i64 %pgocount5, 1
  store i64 %177, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 4)
  %178 = load i32, i32* %12, align 4
  %179 = add nsw i32 %178, 1
  store i32 %179, i32* %12, align 4
  br label %155

; <label>:180:                                    ; preds = %155
  %181 = load double, double* %14, align 8
  %182 = load double*, double** %10, align 8
  %183 = load i32, i32* %11, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds double, double* %182, i64 %184
  store double %181, double* %185, align 8
  br label %186

; <label>:186:                                    ; preds = %180
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 7)
  %187 = add i64 %pgocount6, 1
  store i64 %187, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 7)
  %188 = load i32, i32* %11, align 4
  %189 = add nsw i32 %188, 1
  store i32 %189, i32* %11, align 4
  br label %145

; <label>:190:                                    ; preds = %145
  %191 = load i32, i32* %6, align 4
  %192 = sub nsw i32 %191, 1
  store i32 %192, i32* %11, align 4
  br label %193

; <label>:193:                                    ; preds = %244, %190
  %194 = load i32, i32* %11, align 4
  %195 = icmp sge i32 %194, 0
  br i1 %195, label %196, label %248

; <label>:196:                                    ; preds = %193
  %197 = load double*, double** %10, align 8
  %198 = load i32, i32* %11, align 4
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds double, double* %197, i64 %199
  %201 = load double, double* %200, align 8
  store double %201, double* %14, align 8
  %202 = load i32, i32* %11, align 4
  %203 = add nsw i32 %202, 1
  store i32 %203, i32* %12, align 4
  br label %204

; <label>:204:                                    ; preds = %225, %196
  %205 = load i32, i32* %12, align 4
  %206 = load i32, i32* %6, align 4
  %207 = icmp slt i32 %205, %206
  br i1 %207, label %208, label %229

; <label>:208:                                    ; preds = %204
  %209 = load [2000 x double]*, [2000 x double]** %7, align 8
  %210 = load i32, i32* %11, align 4
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds [2000 x double], [2000 x double]* %209, i64 %211
  %213 = load i32, i32* %12, align 4
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [2000 x double], [2000 x double]* %212, i64 0, i64 %214
  %216 = load double, double* %215, align 8
  %217 = load double*, double** %9, align 8
  %218 = load i32, i32* %12, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds double, double* %217, i64 %219
  %221 = load double, double* %220, align 8
  %222 = fmul double %216, %221
  %223 = load double, double* %14, align 8
  %224 = fsub double %223, %222
  store double %224, double* %14, align 8
  br label %225

; <label>:225:                                    ; preds = %208
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 5)
  %226 = add i64 %pgocount7, 1
  store i64 %226, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 5)
  %227 = load i32, i32* %12, align 4
  %228 = add nsw i32 %227, 1
  store i32 %228, i32* %12, align 4
  br label %204

; <label>:229:                                    ; preds = %204
  %230 = load double, double* %14, align 8
  %231 = load [2000 x double]*, [2000 x double]** %7, align 8
  %232 = load i32, i32* %11, align 4
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds [2000 x double], [2000 x double]* %231, i64 %233
  %235 = load i32, i32* %11, align 4
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds [2000 x double], [2000 x double]* %234, i64 0, i64 %236
  %238 = load double, double* %237, align 8
  %239 = fdiv double %230, %238
  %240 = load double*, double** %9, align 8
  %241 = load i32, i32* %11, align 4
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds double, double* %240, i64 %242
  store double %239, double* %243, align 8
  br label %244

; <label>:244:                                    ; preds = %229
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 8)
  %245 = add i64 %pgocount8, 1
  store i64 %245, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 8)
  %246 = load i32, i32* %11, align 4
  %247 = add nsw i32 %246, -1
  store i32 %247, i32* %11, align 4
  br label %193

; <label>:248:                                    ; preds = %193
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 9)
  %249 = add i64 %pgocount9, 1
  store i64 %249, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 9)
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

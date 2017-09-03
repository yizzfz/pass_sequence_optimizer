; ModuleID = 'B.ll'
source_filename = "lu.c"
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
@__profn_B.ll_kernel_lu = private constant [14 x i8] c"B.ll:kernel_lu"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 226616306279, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_lu = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_lu = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4376252712048593566, i64 119074655252, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_lu, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [54 x i8] c"4\00main\01B.ll:init_array\01B.ll:kernel_lu\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_lu to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca [2000 x [2000 x double]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 2000, i32* %6, align 4
  %8 = call i8* @polybench_alloc_data(i64 4000000, i32 8)
  %9 = bitcast i8* %8 to [2000 x [2000 x double]]*
  store [2000 x [2000 x double]]* %9, [2000 x [2000 x double]]** %7, align 8
  %10 = load i32, i32* %6, align 4
  %11 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %12 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i32 0, i32 0
  call void @init_array(i32 %10, [2000 x double]* %12)
  call void (...) @polybench_timer_start()
  %13 = load i32, i32* %6, align 4
  %14 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %15 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i32 0, i32 0
  call void @kernel_lu(i32 %13, [2000 x double]* %15)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %16 = load i32, i32* %4, align 4
  %17 = icmp sgt i32 %16, 42
  br i1 %17, label %18, label %30

; <label>:18:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %20 = load i8**, i8*** %5, align 8
  %21 = getelementptr inbounds i8*, i8** %20, i64 0
  %22 = load i8*, i8** %21, align 8
  %23 = call i32 @strcmp(i8* %22, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %30, label %25

; <label>:25:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %27 = load i32, i32* %6, align 4
  %28 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %29 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i32 0, i32 0
  call void @print_array(i32 %27, [2000 x double]* %29)
  br label %30

; <label>:30:                                     ; preds = %25, %18, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %32 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %33 = bitcast [2000 x [2000 x double]]* %32 to i8*
  call void @free(i8* %33) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, [2000 x double]*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca [2000 x double]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [2000 x [2000 x double]]*, align 8
  store i32 %0, i32* %3, align 4
  store [2000 x double]* %1, [2000 x double]** %4, align 8
  store i32 0, i32* %5, align 4
  br label %11

; <label>:11:                                     ; preds = %68, %2
  %12 = load i32, i32* %5, align 4
  %13 = load i32, i32* %3, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %72

; <label>:15:                                     ; preds = %11
  store i32 0, i32* %6, align 4
  br label %16

; <label>:16:                                     ; preds = %37, %15
  %17 = load i32, i32* %6, align 4
  %18 = load i32, i32* %5, align 4
  %19 = icmp sle i32 %17, %18
  br i1 %19, label %20, label %41

; <label>:20:                                     ; preds = %16
  %21 = load i32, i32* %6, align 4
  %22 = sub nsw i32 0, %21
  %23 = load i32, i32* %3, align 4
  %24 = srem i32 %22, %23
  %25 = sitofp i32 %24 to double
  %26 = load i32, i32* %3, align 4
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %25, %27
  %29 = fadd double %28, 1.000000e+00
  %30 = load [2000 x double]*, [2000 x double]** %4, align 8
  %31 = load i32, i32* %5, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %32
  %34 = load i32, i32* %6, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i64 0, i64 %35
  store double %29, double* %36, align 8
  br label %37

; <label>:37:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %38 = add i64 %pgocount, 1
  store i64 %38, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %39 = load i32, i32* %6, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %6, align 4
  br label %16

; <label>:41:                                     ; preds = %16
  %42 = load i32, i32* %5, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %6, align 4
  br label %44

; <label>:44:                                     ; preds = %56, %41
  %45 = load i32, i32* %6, align 4
  %46 = load i32, i32* %3, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %60

; <label>:48:                                     ; preds = %44
  %49 = load [2000 x double]*, [2000 x double]** %4, align 8
  %50 = load i32, i32* %5, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %49, i64 %51
  %53 = load i32, i32* %6, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %52, i64 0, i64 %54
  store double 0.000000e+00, double* %55, align 8
  br label %56

; <label>:56:                                     ; preds = %48
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %57 = add i64 %pgocount1, 1
  store i64 %57, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %58 = load i32, i32* %6, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %6, align 4
  br label %44

; <label>:60:                                     ; preds = %44
  %61 = load [2000 x double]*, [2000 x double]** %4, align 8
  %62 = load i32, i32* %5, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %61, i64 %63
  %65 = load i32, i32* %5, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %64, i64 0, i64 %66
  store double 1.000000e+00, double* %67, align 8
  br label %68

; <label>:68:                                     ; preds = %60
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %69 = add i64 %pgocount2, 1
  store i64 %69, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %70 = load i32, i32* %5, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %5, align 4
  br label %11

; <label>:72:                                     ; preds = %11
  %73 = call i8* @polybench_alloc_data(i64 4000000, i32 8)
  %74 = bitcast i8* %73 to [2000 x [2000 x double]]*
  store [2000 x [2000 x double]]* %74, [2000 x [2000 x double]]** %10, align 8
  store i32 0, i32* %7, align 4
  br label %75

; <label>:75:                                     ; preds = %97, %72
  %76 = load i32, i32* %7, align 4
  %77 = load i32, i32* %3, align 4
  %78 = icmp slt i32 %76, %77
  br i1 %78, label %79, label %101

; <label>:79:                                     ; preds = %75
  store i32 0, i32* %8, align 4
  br label %80

; <label>:80:                                     ; preds = %92, %79
  %81 = load i32, i32* %8, align 4
  %82 = load i32, i32* %3, align 4
  %83 = icmp slt i32 %81, %82
  br i1 %83, label %84, label %96

; <label>:84:                                     ; preds = %80
  %85 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %10, align 8
  %86 = load i32, i32* %7, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %85, i64 0, i64 %87
  %89 = load i32, i32* %8, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %88, i64 0, i64 %90
  store double 0.000000e+00, double* %91, align 8
  br label %92

; <label>:92:                                     ; preds = %84
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %93 = add i64 %pgocount3, 1
  store i64 %93, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %94 = load i32, i32* %8, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %8, align 4
  br label %80

; <label>:96:                                     ; preds = %80
  br label %97

; <label>:97:                                     ; preds = %96
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %98 = add i64 %pgocount4, 1
  store i64 %98, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %99 = load i32, i32* %7, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %7, align 4
  br label %75

; <label>:101:                                    ; preds = %75
  store i32 0, i32* %9, align 4
  br label %102

; <label>:102:                                    ; preds = %153, %101
  %103 = load i32, i32* %9, align 4
  %104 = load i32, i32* %3, align 4
  %105 = icmp slt i32 %103, %104
  br i1 %105, label %106, label %157

; <label>:106:                                    ; preds = %102
  store i32 0, i32* %7, align 4
  br label %107

; <label>:107:                                    ; preds = %148, %106
  %108 = load i32, i32* %7, align 4
  %109 = load i32, i32* %3, align 4
  %110 = icmp slt i32 %108, %109
  br i1 %110, label %111, label %152

; <label>:111:                                    ; preds = %107
  store i32 0, i32* %8, align 4
  br label %112

; <label>:112:                                    ; preds = %143, %111
  %113 = load i32, i32* %8, align 4
  %114 = load i32, i32* %3, align 4
  %115 = icmp slt i32 %113, %114
  br i1 %115, label %116, label %147

; <label>:116:                                    ; preds = %112
  %117 = load [2000 x double]*, [2000 x double]** %4, align 8
  %118 = load i32, i32* %7, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %117, i64 %119
  %121 = load i32, i32* %9, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %120, i64 0, i64 %122
  %124 = load double, double* %123, align 8
  %125 = load [2000 x double]*, [2000 x double]** %4, align 8
  %126 = load i32, i32* %8, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %125, i64 %127
  %129 = load i32, i32* %9, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 0, i64 %130
  %132 = load double, double* %131, align 8
  %133 = fmul double %124, %132
  %134 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %10, align 8
  %135 = load i32, i32* %7, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %134, i64 0, i64 %136
  %138 = load i32, i32* %8, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %137, i64 0, i64 %139
  %141 = load double, double* %140, align 8
  %142 = fadd double %141, %133
  store double %142, double* %140, align 8
  br label %143

; <label>:143:                                    ; preds = %116
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %144 = add i64 %pgocount5, 1
  store i64 %144, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %145 = load i32, i32* %8, align 4
  %146 = add nsw i32 %145, 1
  store i32 %146, i32* %8, align 4
  br label %112

; <label>:147:                                    ; preds = %112
  br label %148

; <label>:148:                                    ; preds = %147
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %149 = add i64 %pgocount6, 1
  store i64 %149, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %150 = load i32, i32* %7, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* %7, align 4
  br label %107

; <label>:152:                                    ; preds = %107
  br label %153

; <label>:153:                                    ; preds = %152
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %154 = add i64 %pgocount7, 1
  store i64 %154, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %155 = load i32, i32* %9, align 4
  %156 = add nsw i32 %155, 1
  store i32 %156, i32* %9, align 4
  br label %102

; <label>:157:                                    ; preds = %102
  store i32 0, i32* %7, align 4
  br label %158

; <label>:158:                                    ; preds = %188, %157
  %159 = load i32, i32* %7, align 4
  %160 = load i32, i32* %3, align 4
  %161 = icmp slt i32 %159, %160
  br i1 %161, label %162, label %192

; <label>:162:                                    ; preds = %158
  store i32 0, i32* %8, align 4
  br label %163

; <label>:163:                                    ; preds = %183, %162
  %164 = load i32, i32* %8, align 4
  %165 = load i32, i32* %3, align 4
  %166 = icmp slt i32 %164, %165
  br i1 %166, label %167, label %187

; <label>:167:                                    ; preds = %163
  %168 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %10, align 8
  %169 = load i32, i32* %7, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %168, i64 0, i64 %170
  %172 = load i32, i32* %8, align 4
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [2000 x double], [2000 x double]* %171, i64 0, i64 %173
  %175 = load double, double* %174, align 8
  %176 = load [2000 x double]*, [2000 x double]** %4, align 8
  %177 = load i32, i32* %7, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds [2000 x double], [2000 x double]* %176, i64 %178
  %180 = load i32, i32* %8, align 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [2000 x double], [2000 x double]* %179, i64 0, i64 %181
  store double %175, double* %182, align 8
  br label %183

; <label>:183:                                    ; preds = %167
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %184 = add i64 %pgocount8, 1
  store i64 %184, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %185 = load i32, i32* %8, align 4
  %186 = add nsw i32 %185, 1
  store i32 %186, i32* %8, align 4
  br label %163

; <label>:187:                                    ; preds = %163
  br label %188

; <label>:188:                                    ; preds = %187
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %189 = add i64 %pgocount9, 1
  store i64 %189, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %190 = load i32, i32* %7, align 4
  %191 = add nsw i32 %190, 1
  store i32 %191, i32* %7, align 4
  br label %158

; <label>:192:                                    ; preds = %158
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %193 = add i64 %pgocount10, 1
  store i64 %193, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %194 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %10, align 8
  %195 = bitcast [2000 x [2000 x double]]* %194 to i8*
  call void @free(i8* %195) #4
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_lu(i32, [2000 x double]*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca [2000 x double]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [2000 x double]* %1, [2000 x double]** %4, align 8
  store i32 0, i32* %5, align 4
  br label %8

; <label>:8:                                      ; preds = %123, %2
  %9 = load i32, i32* %5, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %127

; <label>:12:                                     ; preds = %8
  store i32 0, i32* %6, align 4
  br label %13

; <label>:13:                                     ; preds = %71, %12
  %14 = load i32, i32* %6, align 4
  %15 = load i32, i32* %5, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %75

; <label>:17:                                     ; preds = %13
  store i32 0, i32* %7, align 4
  br label %18

; <label>:18:                                     ; preds = %49, %17
  %19 = load i32, i32* %7, align 4
  %20 = load i32, i32* %6, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %53

; <label>:22:                                     ; preds = %18
  %23 = load [2000 x double]*, [2000 x double]** %4, align 8
  %24 = load i32, i32* %5, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %23, i64 %25
  %27 = load i32, i32* %7, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %26, i64 0, i64 %28
  %30 = load double, double* %29, align 8
  %31 = load [2000 x double]*, [2000 x double]** %4, align 8
  %32 = load i32, i32* %7, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i64 %33
  %35 = load i32, i32* %6, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %34, i64 0, i64 %36
  %38 = load double, double* %37, align 8
  %39 = fmul double %30, %38
  %40 = load [2000 x double]*, [2000 x double]** %4, align 8
  %41 = load i32, i32* %5, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 %42
  %44 = load i32, i32* %6, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %43, i64 0, i64 %45
  %47 = load double, double* %46, align 8
  %48 = fsub double %47, %39
  store double %48, double* %46, align 8
  br label %49

; <label>:49:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 0)
  %50 = add i64 %pgocount, 1
  store i64 %50, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 0)
  %51 = load i32, i32* %7, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %7, align 4
  br label %18

; <label>:53:                                     ; preds = %18
  %54 = load [2000 x double]*, [2000 x double]** %4, align 8
  %55 = load i32, i32* %6, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %54, i64 %56
  %58 = load i32, i32* %6, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %57, i64 0, i64 %59
  %61 = load double, double* %60, align 8
  %62 = load [2000 x double]*, [2000 x double]** %4, align 8
  %63 = load i32, i32* %5, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %62, i64 %64
  %66 = load i32, i32* %6, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 0, i64 %67
  %69 = load double, double* %68, align 8
  %70 = fdiv double %69, %61
  store double %70, double* %68, align 8
  br label %71

; <label>:71:                                     ; preds = %53
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 2)
  %72 = add i64 %pgocount1, 1
  store i64 %72, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 2)
  %73 = load i32, i32* %6, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %6, align 4
  br label %13

; <label>:75:                                     ; preds = %13
  %76 = load i32, i32* %5, align 4
  store i32 %76, i32* %6, align 4
  br label %77

; <label>:77:                                     ; preds = %118, %75
  %78 = load i32, i32* %6, align 4
  %79 = load i32, i32* %3, align 4
  %80 = icmp slt i32 %78, %79
  br i1 %80, label %81, label %122

; <label>:81:                                     ; preds = %77
  store i32 0, i32* %7, align 4
  br label %82

; <label>:82:                                     ; preds = %113, %81
  %83 = load i32, i32* %7, align 4
  %84 = load i32, i32* %5, align 4
  %85 = icmp slt i32 %83, %84
  br i1 %85, label %86, label %117

; <label>:86:                                     ; preds = %82
  %87 = load [2000 x double]*, [2000 x double]** %4, align 8
  %88 = load i32, i32* %5, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %87, i64 %89
  %91 = load i32, i32* %7, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %90, i64 0, i64 %92
  %94 = load double, double* %93, align 8
  %95 = load [2000 x double]*, [2000 x double]** %4, align 8
  %96 = load i32, i32* %7, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %95, i64 %97
  %99 = load i32, i32* %6, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %98, i64 0, i64 %100
  %102 = load double, double* %101, align 8
  %103 = fmul double %94, %102
  %104 = load [2000 x double]*, [2000 x double]** %4, align 8
  %105 = load i32, i32* %5, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %104, i64 %106
  %108 = load i32, i32* %6, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %107, i64 0, i64 %109
  %111 = load double, double* %110, align 8
  %112 = fsub double %111, %103
  store double %112, double* %110, align 8
  br label %113

; <label>:113:                                    ; preds = %86
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 1)
  %114 = add i64 %pgocount2, 1
  store i64 %114, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 1)
  %115 = load i32, i32* %7, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, i32* %7, align 4
  br label %82

; <label>:117:                                    ; preds = %82
  br label %118

; <label>:118:                                    ; preds = %117
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 3)
  %119 = add i64 %pgocount3, 1
  store i64 %119, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 3)
  %120 = load i32, i32* %6, align 4
  %121 = add nsw i32 %120, 1
  store i32 %121, i32* %6, align 4
  br label %77

; <label>:122:                                    ; preds = %77
  br label %123

; <label>:123:                                    ; preds = %122
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 4)
  %124 = add i64 %pgocount4, 1
  store i64 %124, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 4)
  %125 = load i32, i32* %5, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, i32* %5, align 4
  br label %8

; <label>:127:                                    ; preds = %8
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 5)
  %128 = add i64 %pgocount5, 1
  store i64 %128, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 5)
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [2000 x double]*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca [2000 x double]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [2000 x double]* %1, [2000 x double]** %4, align 8
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
  %34 = load [2000 x double]*, [2000 x double]** %4, align 8
  %35 = load i32, i32* %5, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %34, i64 %36
  %38 = load i32, i32* %6, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %37, i64 0, i64 %39
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

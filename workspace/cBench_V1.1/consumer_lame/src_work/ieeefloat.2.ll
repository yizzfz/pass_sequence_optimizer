; ModuleID = 'tmp1.ll'
source_filename = "ieeefloat.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_ConvertFromIeeeSingle = private constant [21 x i8] c"ConvertFromIeeeSingle"
@__profn_ConvertToIeeeSingle = private constant [19 x i8] c"ConvertToIeeeSingle"
@__profn_ConvertFromIeeeDouble = private constant [21 x i8] c"ConvertFromIeeeDouble"
@__profn_ConvertToIeeeDouble = private constant [19 x i8] c"ConvertToIeeeDouble"
@__profn_ConvertFromIeeeExtended = private constant [23 x i8] c"ConvertFromIeeeExtended"
@__profn_ConvertToIeeeExtended = private constant [21 x i8] c"ConvertToIeeeExtended"
@__profc_ConvertFromIeeeSingle = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ConvertFromIeeeSingle = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4684715971676764266, i64 81339574905, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ConvertFromIeeeSingle, i32 0, i32 0), i8* bitcast (double (i8*)* @ConvertFromIeeeSingle to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ConvertToIeeeSingle = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ConvertToIeeeSingle = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7101042011580117700, i64 103763399454, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ConvertToIeeeSingle, i32 0, i32 0), i8* bitcast (void (double, i8*)* @ConvertToIeeeSingle to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ConvertFromIeeeDouble = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ConvertFromIeeeDouble = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7421614306861482988, i64 88974028827, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeDouble, i32 0, i32 0), i8* bitcast (double (i8*)* @ConvertFromIeeeDouble to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ConvertToIeeeDouble = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ConvertToIeeeDouble = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -340485511294988495, i64 124452717577, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_ConvertToIeeeDouble, i32 0, i32 0), i8* bitcast (void (double, i8*)* @ConvertToIeeeDouble to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ConvertFromIeeeExtended = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ConvertFromIeeeExtended = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6897021170712910162, i64 77778590578, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeExtended, i32 0, i32 0), i8* bitcast (double (i8*)* @ConvertFromIeeeExtended to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ConvertToIeeeExtended = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ConvertToIeeeExtended = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8384964486541879302, i64 83984096092, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertToIeeeExtended, i32 0, i32 0), i8* bitcast (void (double, i8*)* @ConvertToIeeeExtended to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [64 x i8] c"\81\01=x\DAs\CE\CF+K-*q+\CA\CF\F5LMM\0D\CE\CCK\CFIet\86\88\86\E4c\8A\C1T\BA\E4\97&\A1\ABD\15\83\A9t\AD(I\CDKIMAU\0B\13\05\00m;0\FD", section "__llvm_prf_names"
@llvm.used = appending global [7 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ConvertFromIeeeSingle to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ConvertToIeeeSingle to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ConvertFromIeeeDouble to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ConvertToIeeeDouble to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ConvertFromIeeeExtended to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ConvertToIeeeExtended to i8*), i8* getelementptr inbounds ([64 x i8], [64 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define double @ConvertFromIeeeSingle(i8*) #0 {
  %2 = alloca double, align 8
  %3 = alloca i8*, align 8
  %4 = alloca double, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  %8 = load i8*, i8** %3, align 8
  %9 = getelementptr inbounds i8, i8* %8, i64 0
  %10 = load i8, i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = and i32 %11, 255
  %13 = sext i32 %12 to i64
  %14 = shl i64 %13, 24
  %15 = load i8*, i8** %3, align 8
  %16 = getelementptr inbounds i8, i8* %15, i64 1
  %17 = load i8, i8* %16, align 1
  %18 = sext i8 %17 to i32
  %19 = and i32 %18, 255
  %20 = sext i32 %19 to i64
  %21 = shl i64 %20, 16
  %22 = or i64 %14, %21
  %23 = load i8*, i8** %3, align 8
  %24 = getelementptr inbounds i8, i8* %23, i64 2
  %25 = load i8, i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = and i32 %26, 255
  %28 = sext i32 %27 to i64
  %29 = shl i64 %28, 8
  %30 = or i64 %22, %29
  %31 = load i8*, i8** %3, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 3
  %33 = load i8, i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = and i32 %34, 255
  %36 = sext i32 %35 to i64
  %37 = or i64 %30, %36
  store i64 %37, i64* %7, align 8
  %38 = load i64, i64* %7, align 8
  %39 = and i64 %38, 2147483647
  %40 = icmp eq i64 %39, 0
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ConvertFromIeeeSingle, i64 0, i64 1)
  %42 = add i64 %pgocount, 1
  store i64 %42, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ConvertFromIeeeSingle, i64 0, i64 1)
  store double 0.000000e+00, double* %4, align 8
  br label %80

; <label>:43:                                     ; preds = %1
  %44 = load i64, i64* %7, align 8
  %45 = and i64 %44, 2139095040
  %46 = ashr i64 %45, 23
  store i64 %46, i64* %6, align 8
  %47 = load i64, i64* %6, align 8
  %48 = icmp eq i64 %47, 255
  br i1 %48, label %49, label %51

; <label>:49:                                     ; preds = %43
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ConvertFromIeeeSingle, i64 0, i64 2)
  %50 = add i64 %pgocount1, 1
  store i64 %50, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ConvertFromIeeeSingle, i64 0, i64 2)
  store double 0x7FF0000000000000, double* %4, align 8
  br label %79

; <label>:51:                                     ; preds = %43
  %52 = load i64, i64* %6, align 8
  %53 = icmp eq i64 %52, 0
  br i1 %53, label %54, label %66

; <label>:54:                                     ; preds = %51
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ConvertFromIeeeSingle, i64 0, i64 4)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ConvertFromIeeeSingle, i64 0, i64 4)
  %56 = load i64, i64* %7, align 8
  %57 = and i64 %56, 8388607
  store i64 %57, i64* %5, align 8
  %58 = load i64, i64* %5, align 8
  %59 = sitofp i64 %58 to double
  %60 = load i64, i64* %6, align 8
  %61 = sub nsw i64 %60, 127
  %62 = sub nsw i64 %61, 23
  %63 = add nsw i64 %62, 1
  %64 = trunc i64 %63 to i32
  %65 = call double @ldexp(double %59, i32 %64) #3
  store double %65, double* %4, align 8
  br label %78

; <label>:66:                                     ; preds = %51
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ConvertFromIeeeSingle, i64 0, i64 3)
  %67 = add i64 %pgocount3, 1
  store i64 %67, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ConvertFromIeeeSingle, i64 0, i64 3)
  %68 = load i64, i64* %7, align 8
  %69 = and i64 %68, 8388607
  %70 = add nsw i64 %69, 8388608
  store i64 %70, i64* %5, align 8
  %71 = load i64, i64* %5, align 8
  %72 = sitofp i64 %71 to double
  %73 = load i64, i64* %6, align 8
  %74 = sub nsw i64 %73, 127
  %75 = sub nsw i64 %74, 23
  %76 = trunc i64 %75 to i32
  %77 = call double @ldexp(double %72, i32 %76) #3
  store double %77, double* %4, align 8
  br label %78

; <label>:78:                                     ; preds = %66, %54
  br label %79

; <label>:79:                                     ; preds = %78, %49
  br label %80

; <label>:80:                                     ; preds = %79, %41
  %81 = load i64, i64* %7, align 8
  %82 = and i64 %81, -9223372036854775808
  %83 = icmp ne i64 %82, 0
  br i1 %83, label %84, label %87

; <label>:84:                                     ; preds = %80
  %85 = load double, double* %4, align 8
  %86 = fsub double -0.000000e+00, %85
  store double %86, double* %2, align 8
  br label %90

; <label>:87:                                     ; preds = %80
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ConvertFromIeeeSingle, i64 0, i64 0)
  %88 = add i64 %pgocount4, 1
  store i64 %88, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_ConvertFromIeeeSingle, i64 0, i64 0)
  %89 = load double, double* %4, align 8
  store double %89, double* %2, align 8
  br label %90

; <label>:90:                                     ; preds = %87, %84
  %91 = load double, double* %2, align 8
  ret double %91
}

; Function Attrs: nounwind
declare double @ldexp(double, i32) #1

; Function Attrs: nounwind uwtable
define void @ConvertToIeeeSingle(double, i8*) #0 {
  %3 = alloca double, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca double, align 8
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  store double %0, double* %3, align 8
  store i8* %1, i8** %4, align 8
  %11 = load double, double* %3, align 8
  %12 = fcmp olt double %11, 0.000000e+00
  br i1 %12, label %13, label %17

; <label>:13:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ConvertToIeeeSingle, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ConvertToIeeeSingle, i64 0, i64 0)
  store i64 -9223372036854775808, i64* %5, align 8
  %15 = load double, double* %3, align 8
  %16 = fmul double %15, -1.000000e+00
  store double %16, double* %3, align 8
  br label %19

; <label>:17:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ConvertToIeeeSingle, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ConvertToIeeeSingle, i64 0, i64 1)
  store i64 0, i64* %5, align 8
  br label %19

; <label>:19:                                     ; preds = %17, %13
  %20 = load double, double* %3, align 8
  %21 = fcmp oeq double %20, 0.000000e+00
  br i1 %21, label %22, label %23

; <label>:22:                                     ; preds = %19
  store i64 0, i64* %6, align 8
  br label %79

; <label>:23:                                     ; preds = %19
  %24 = load double, double* %3, align 8
  %25 = call double @frexp(double %24, i32* %8) #3
  store double %25, double* %7, align 8
  %26 = load i32, i32* %8, align 4
  %27 = icmp sgt i32 %26, 129
  br i1 %27, label %32, label %28

; <label>:28:                                     ; preds = %23
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ConvertToIeeeSingle, i64 0, i64 3)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ConvertToIeeeSingle, i64 0, i64 3)
  %30 = load double, double* %7, align 8
  %31 = fcmp olt double %30, 1.000000e+00
  br i1 %31, label %36, label %32

; <label>:32:                                     ; preds = %28, %23
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ConvertToIeeeSingle, i64 0, i64 2)
  %33 = add i64 %pgocount3, 1
  store i64 %33, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ConvertToIeeeSingle, i64 0, i64 2)
  %34 = load i64, i64* %5, align 8
  %35 = or i64 %34, 2139095040
  store i64 %35, i64* %6, align 8
  br label %78

; <label>:36:                                     ; preds = %28
  %37 = load i32, i32* %8, align 4
  %38 = icmp slt i32 %37, -125
  br i1 %38, label %39, label %60

; <label>:39:                                     ; preds = %36
  %40 = load i32, i32* %8, align 4
  %41 = add nsw i32 149, %40
  store i32 %41, i32* %10, align 4
  %42 = load i32, i32* %10, align 4
  %43 = icmp slt i32 %42, 0
  br i1 %43, label %44, label %47

; <label>:44:                                     ; preds = %39
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ConvertToIeeeSingle, i64 0, i64 6)
  %45 = add i64 %pgocount4, 1
  store i64 %45, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ConvertToIeeeSingle, i64 0, i64 6)
  %46 = load i64, i64* %5, align 8
  store i64 %46, i64* %6, align 8
  br label %59

; <label>:47:                                     ; preds = %39
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ConvertToIeeeSingle, i64 0, i64 5)
  %48 = add i64 %pgocount5, 1
  store i64 %48, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ConvertToIeeeSingle, i64 0, i64 5)
  %49 = load double, double* %7, align 8
  %50 = load i32, i32* %10, align 4
  %51 = zext i32 %50 to i64
  %52 = shl i64 1, %51
  %53 = sitofp i64 %52 to double
  %54 = fmul double %49, %53
  %55 = fptosi double %54 to i64
  store i64 %55, i64* %9, align 8
  %56 = load i64, i64* %5, align 8
  %57 = load i64, i64* %9, align 8
  %58 = or i64 %56, %57
  store i64 %58, i64* %6, align 8
  br label %59

; <label>:59:                                     ; preds = %47, %44
  br label %77

; <label>:60:                                     ; preds = %36
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ConvertToIeeeSingle, i64 0, i64 4)
  %61 = add i64 %pgocount6, 1
  store i64 %61, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_ConvertToIeeeSingle, i64 0, i64 4)
  %62 = load double, double* %7, align 8
  %63 = fmul double %62, 0x4170000000000000
  %64 = call double @floor(double %63) #4
  %65 = fptosi double %64 to i64
  store i64 %65, i64* %9, align 8
  %66 = load i64, i64* %9, align 8
  %67 = sub nsw i64 %66, 8388608
  store i64 %67, i64* %9, align 8
  %68 = load i64, i64* %5, align 8
  %69 = load i32, i32* %8, align 4
  %70 = add nsw i32 %69, 127
  %71 = sub nsw i32 %70, 1
  %72 = sext i32 %71 to i64
  %73 = shl i64 %72, 23
  %74 = or i64 %68, %73
  %75 = load i64, i64* %9, align 8
  %76 = or i64 %74, %75
  store i64 %76, i64* %6, align 8
  br label %77

; <label>:77:                                     ; preds = %60, %59
  br label %78

; <label>:78:                                     ; preds = %77, %32
  br label %79

; <label>:79:                                     ; preds = %78, %22
  %80 = load i64, i64* %6, align 8
  %81 = ashr i64 %80, 24
  %82 = trunc i64 %81 to i8
  %83 = load i8*, i8** %4, align 8
  %84 = getelementptr inbounds i8, i8* %83, i64 0
  store i8 %82, i8* %84, align 1
  %85 = load i64, i64* %6, align 8
  %86 = ashr i64 %85, 16
  %87 = trunc i64 %86 to i8
  %88 = load i8*, i8** %4, align 8
  %89 = getelementptr inbounds i8, i8* %88, i64 1
  store i8 %87, i8* %89, align 1
  %90 = load i64, i64* %6, align 8
  %91 = ashr i64 %90, 8
  %92 = trunc i64 %91 to i8
  %93 = load i8*, i8** %4, align 8
  %94 = getelementptr inbounds i8, i8* %93, i64 2
  store i8 %92, i8* %94, align 1
  %95 = load i64, i64* %6, align 8
  %96 = trunc i64 %95 to i8
  %97 = load i8*, i8** %4, align 8
  %98 = getelementptr inbounds i8, i8* %97, i64 3
  store i8 %96, i8* %98, align 1
  ret void
}

; Function Attrs: nounwind
declare double @frexp(double, i32*) #1

; Function Attrs: nounwind readnone
declare double @floor(double) #2

; Function Attrs: nounwind uwtable
define double @ConvertFromIeeeDouble(i8*) #0 {
  %2 = alloca double, align 8
  %3 = alloca i8*, align 8
  %4 = alloca double, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  %9 = load i8*, i8** %3, align 8
  %10 = getelementptr inbounds i8, i8* %9, i64 0
  %11 = load i8, i8* %10, align 1
  %12 = sext i8 %11 to i32
  %13 = and i32 %12, 255
  %14 = sext i32 %13 to i64
  %15 = shl i64 %14, 24
  %16 = load i8*, i8** %3, align 8
  %17 = getelementptr inbounds i8, i8* %16, i64 1
  %18 = load i8, i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = and i32 %19, 255
  %21 = sext i32 %20 to i64
  %22 = shl i64 %21, 16
  %23 = or i64 %15, %22
  %24 = load i8*, i8** %3, align 8
  %25 = getelementptr inbounds i8, i8* %24, i64 2
  %26 = load i8, i8* %25, align 1
  %27 = sext i8 %26 to i32
  %28 = and i32 %27, 255
  %29 = sext i32 %28 to i64
  %30 = shl i64 %29, 8
  %31 = or i64 %23, %30
  %32 = load i8*, i8** %3, align 8
  %33 = getelementptr inbounds i8, i8* %32, i64 3
  %34 = load i8, i8* %33, align 1
  %35 = sext i8 %34 to i32
  %36 = and i32 %35, 255
  %37 = sext i32 %36 to i64
  %38 = or i64 %31, %37
  store i64 %38, i64* %7, align 8
  %39 = load i8*, i8** %3, align 8
  %40 = getelementptr inbounds i8, i8* %39, i64 4
  %41 = load i8, i8* %40, align 1
  %42 = sext i8 %41 to i32
  %43 = and i32 %42, 255
  %44 = sext i32 %43 to i64
  %45 = shl i64 %44, 24
  %46 = load i8*, i8** %3, align 8
  %47 = getelementptr inbounds i8, i8* %46, i64 5
  %48 = load i8, i8* %47, align 1
  %49 = sext i8 %48 to i32
  %50 = and i32 %49, 255
  %51 = sext i32 %50 to i64
  %52 = shl i64 %51, 16
  %53 = or i64 %45, %52
  %54 = load i8*, i8** %3, align 8
  %55 = getelementptr inbounds i8, i8* %54, i64 6
  %56 = load i8, i8* %55, align 1
  %57 = sext i8 %56 to i32
  %58 = and i32 %57, 255
  %59 = sext i32 %58 to i64
  %60 = shl i64 %59, 8
  %61 = or i64 %53, %60
  %62 = load i8*, i8** %3, align 8
  %63 = getelementptr inbounds i8, i8* %62, i64 7
  %64 = load i8, i8* %63, align 1
  %65 = sext i8 %64 to i32
  %66 = and i32 %65, 255
  %67 = sext i32 %66 to i64
  %68 = or i64 %61, %67
  store i64 %68, i64* %8, align 8
  %69 = load i64, i64* %7, align 8
  %70 = icmp eq i64 %69, 0
  br i1 %70, label %71, label %77

; <label>:71:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeDouble, i64 0, i64 2)
  %72 = add i64 %pgocount, 1
  store i64 %72, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeDouble, i64 0, i64 2)
  %73 = load i64, i64* %8, align 8
  %74 = icmp eq i64 %73, 0
  br i1 %74, label %75, label %77

; <label>:75:                                     ; preds = %71
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeDouble, i64 0, i64 5)
  %76 = add i64 %pgocount1, 1
  store i64 %76, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeDouble, i64 0, i64 5)
  store double 0.000000e+00, double* %4, align 8
  br label %141

; <label>:77:                                     ; preds = %71, %1
  %78 = load i64, i64* %7, align 8
  %79 = and i64 %78, 2146435072
  %80 = lshr i64 %79, 20
  store i64 %80, i64* %6, align 8
  %81 = load i64, i64* %6, align 8
  %82 = icmp eq i64 %81, 2047
  br i1 %82, label %83, label %85

; <label>:83:                                     ; preds = %77
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeDouble, i64 0, i64 1)
  %84 = add i64 %pgocount2, 1
  store i64 %84, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeDouble, i64 0, i64 1)
  store double 0x7FF0000000000000, double* %4, align 8
  br label %140

; <label>:85:                                     ; preds = %77
  %86 = load i64, i64* %6, align 8
  %87 = icmp eq i64 %86, 0
  br i1 %87, label %88, label %114

; <label>:88:                                     ; preds = %85
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeDouble, i64 0, i64 4)
  %89 = add i64 %pgocount3, 1
  store i64 %89, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeDouble, i64 0, i64 4)
  %90 = load i64, i64* %7, align 8
  %91 = and i64 %90, 1048575
  store i64 %91, i64* %5, align 8
  %92 = load i64, i64* %5, align 8
  %93 = sitofp i64 %92 to double
  %94 = load i64, i64* %6, align 8
  %95 = sub nsw i64 %94, 1023
  %96 = sub nsw i64 %95, 20
  %97 = add nsw i64 %96, 1
  %98 = trunc i64 %97 to i32
  %99 = call double @ldexp(double %93, i32 %98) #3
  store double %99, double* %4, align 8
  %100 = load i64, i64* %8, align 8
  %101 = sub i64 %100, 2147483647
  %102 = sub i64 %101, 1
  %103 = sitofp i64 %102 to double
  %104 = fadd double %103, 0x41E0000000000000
  %105 = load i64, i64* %6, align 8
  %106 = sub nsw i64 %105, 1023
  %107 = sub nsw i64 %106, 20
  %108 = add nsw i64 %107, 1
  %109 = sub nsw i64 %108, 32
  %110 = trunc i64 %109 to i32
  %111 = call double @ldexp(double %104, i32 %110) #3
  %112 = load double, double* %4, align 8
  %113 = fadd double %112, %111
  store double %113, double* %4, align 8
  br label %139

; <label>:114:                                    ; preds = %85
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeDouble, i64 0, i64 3)
  %115 = add i64 %pgocount4, 1
  store i64 %115, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeDouble, i64 0, i64 3)
  %116 = load i64, i64* %7, align 8
  %117 = and i64 %116, 1048575
  %118 = add i64 %117, 1048576
  store i64 %118, i64* %5, align 8
  %119 = load i64, i64* %5, align 8
  %120 = sitofp i64 %119 to double
  %121 = load i64, i64* %6, align 8
  %122 = sub nsw i64 %121, 1023
  %123 = sub nsw i64 %122, 20
  %124 = trunc i64 %123 to i32
  %125 = call double @ldexp(double %120, i32 %124) #3
  store double %125, double* %4, align 8
  %126 = load i64, i64* %8, align 8
  %127 = sub i64 %126, 2147483647
  %128 = sub i64 %127, 1
  %129 = sitofp i64 %128 to double
  %130 = fadd double %129, 0x41E0000000000000
  %131 = load i64, i64* %6, align 8
  %132 = sub nsw i64 %131, 1023
  %133 = sub nsw i64 %132, 20
  %134 = sub nsw i64 %133, 32
  %135 = trunc i64 %134 to i32
  %136 = call double @ldexp(double %130, i32 %135) #3
  %137 = load double, double* %4, align 8
  %138 = fadd double %137, %136
  store double %138, double* %4, align 8
  br label %139

; <label>:139:                                    ; preds = %114, %88
  br label %140

; <label>:140:                                    ; preds = %139, %83
  br label %141

; <label>:141:                                    ; preds = %140, %75
  %142 = load i64, i64* %7, align 8
  %143 = and i64 %142, 2147483648
  %144 = icmp ne i64 %143, 0
  br i1 %144, label %145, label %148

; <label>:145:                                    ; preds = %141
  %146 = load double, double* %4, align 8
  %147 = fsub double -0.000000e+00, %146
  store double %147, double* %2, align 8
  br label %151

; <label>:148:                                    ; preds = %141
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeDouble, i64 0, i64 0)
  %149 = add i64 %pgocount5, 1
  store i64 %149, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeDouble, i64 0, i64 0)
  %150 = load double, double* %4, align 8
  store double %150, double* %2, align 8
  br label %151

; <label>:151:                                    ; preds = %148, %145
  %152 = load double, double* %2, align 8
  ret double %152
}

; Function Attrs: nounwind uwtable
define void @ConvertToIeeeDouble(double, i8*) #0 {
  %3 = alloca double, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca i32, align 4
  %11 = alloca i64, align 8
  %12 = alloca i32, align 4
  store double %0, double* %3, align 8
  store i8* %1, i8** %4, align 8
  %13 = load double, double* %3, align 8
  %14 = fcmp olt double %13, 0.000000e+00
  br i1 %14, label %15, label %19

; <label>:15:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_ConvertToIeeeDouble, i64 0, i64 0)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_ConvertToIeeeDouble, i64 0, i64 0)
  store i64 -9223372036854775808, i64* %5, align 8
  %17 = load double, double* %3, align 8
  %18 = fmul double %17, -1.000000e+00
  store double %18, double* %3, align 8
  br label %21

; <label>:19:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_ConvertToIeeeDouble, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_ConvertToIeeeDouble, i64 0, i64 1)
  store i64 0, i64* %5, align 8
  br label %21

; <label>:21:                                     ; preds = %19, %15
  %22 = load double, double* %3, align 8
  %23 = fcmp oeq double %22, 0.000000e+00
  br i1 %23, label %24, label %25

; <label>:24:                                     ; preds = %21
  store i64 0, i64* %6, align 8
  store i64 0, i64* %7, align 8
  br label %119

; <label>:25:                                     ; preds = %21
  %26 = load double, double* %3, align 8
  %27 = call double @frexp(double %26, i32* %10) #3
  store double %27, double* %8, align 8
  %28 = load i32, i32* %10, align 4
  %29 = icmp sgt i32 %28, 1025
  br i1 %29, label %34, label %30

; <label>:30:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_ConvertToIeeeDouble, i64 0, i64 3)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_ConvertToIeeeDouble, i64 0, i64 3)
  %32 = load double, double* %8, align 8
  %33 = fcmp olt double %32, 1.000000e+00
  br i1 %33, label %38, label %34

; <label>:34:                                     ; preds = %30, %25
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_ConvertToIeeeDouble, i64 0, i64 2)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_ConvertToIeeeDouble, i64 0, i64 2)
  %36 = load i64, i64* %5, align 8
  %37 = or i64 %36, 2146435072
  store i64 %37, i64* %6, align 8
  store i64 0, i64* %7, align 8
  br label %118

; <label>:38:                                     ; preds = %30
  %39 = load i32, i32* %10, align 4
  %40 = icmp slt i32 %39, -1021
  br i1 %40, label %41, label %87

; <label>:41:                                     ; preds = %38
  %42 = load i32, i32* %10, align 4
  %43 = add nsw i32 1042, %42
  store i32 %43, i32* %12, align 4
  %44 = load i32, i32* %12, align 4
  %45 = icmp slt i32 %44, 0
  br i1 %45, label %46, label %65

; <label>:46:                                     ; preds = %41
  %47 = load i64, i64* %5, align 8
  store i64 %47, i64* %6, align 8
  %48 = load i32, i32* %12, align 4
  %49 = add nsw i32 %48, 32
  store i32 %49, i32* %12, align 4
  %50 = load i32, i32* %12, align 4
  %51 = icmp slt i32 %50, 0
  br i1 %51, label %52, label %54

; <label>:52:                                     ; preds = %46
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_ConvertToIeeeDouble, i64 0, i64 7)
  %53 = add i64 %pgocount4, 1
  store i64 %53, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_ConvertToIeeeDouble, i64 0, i64 7)
  store i64 0, i64* %7, align 8
  br label %64

; <label>:54:                                     ; preds = %46
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_ConvertToIeeeDouble, i64 0, i64 6)
  %55 = add i64 %pgocount5, 1
  store i64 %55, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_ConvertToIeeeDouble, i64 0, i64 6)
  %56 = load double, double* %8, align 8
  %57 = load i32, i32* %12, align 4
  %58 = call double @ldexp(double %56, i32 %57) #3
  %59 = call double @floor(double %58) #4
  %60 = fsub double %59, 0x41E0000000000000
  %61 = fptosi double %60 to i64
  %62 = add nsw i64 %61, 2147483647
  %63 = add nsw i64 %62, 1
  store i64 %63, i64* %7, align 8
  br label %64

; <label>:64:                                     ; preds = %54, %52
  br label %86

; <label>:65:                                     ; preds = %41
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_ConvertToIeeeDouble, i64 0, i64 5)
  %66 = add i64 %pgocount6, 1
  store i64 %66, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_ConvertToIeeeDouble, i64 0, i64 5)
  %67 = load double, double* %8, align 8
  %68 = load i32, i32* %12, align 4
  %69 = call double @ldexp(double %67, i32 %68) #3
  store double %69, double* %9, align 8
  %70 = load double, double* %9, align 8
  %71 = call double @floor(double %70) #4
  %72 = fptosi double %71 to i64
  store i64 %72, i64* %11, align 8
  %73 = load i64, i64* %5, align 8
  %74 = load i64, i64* %11, align 8
  %75 = or i64 %73, %74
  store i64 %75, i64* %6, align 8
  %76 = load double, double* %9, align 8
  %77 = load i64, i64* %11, align 8
  %78 = sitofp i64 %77 to double
  %79 = fsub double %76, %78
  %80 = call double @ldexp(double %79, i32 32) #3
  %81 = call double @floor(double %80) #4
  %82 = fsub double %81, 0x41E0000000000000
  %83 = fptosi double %82 to i64
  %84 = add nsw i64 %83, 2147483647
  %85 = add nsw i64 %84, 1
  store i64 %85, i64* %7, align 8
  br label %86

; <label>:86:                                     ; preds = %65, %64
  br label %117

; <label>:87:                                     ; preds = %38
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_ConvertToIeeeDouble, i64 0, i64 4)
  %88 = add i64 %pgocount7, 1
  store i64 %88, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_ConvertToIeeeDouble, i64 0, i64 4)
  %89 = load double, double* %8, align 8
  %90 = call double @ldexp(double %89, i32 21) #3
  store double %90, double* %9, align 8
  %91 = load double, double* %9, align 8
  %92 = call double @floor(double %91) #4
  %93 = fptosi double %92 to i64
  store i64 %93, i64* %11, align 8
  %94 = load i64, i64* %11, align 8
  %95 = sub nsw i64 %94, 1048576
  store i64 %95, i64* %11, align 8
  %96 = load double, double* %9, align 8
  %97 = fsub double %96, 1.048576e+06
  store double %97, double* %9, align 8
  %98 = load i64, i64* %5, align 8
  %99 = load i32, i32* %10, align 4
  %100 = add nsw i32 %99, 1023
  %101 = sub nsw i32 %100, 1
  %102 = sext i32 %101 to i64
  %103 = shl i64 %102, 20
  %104 = or i64 %98, %103
  %105 = load i64, i64* %11, align 8
  %106 = or i64 %104, %105
  store i64 %106, i64* %6, align 8
  %107 = load double, double* %9, align 8
  %108 = load i64, i64* %11, align 8
  %109 = sitofp i64 %108 to double
  %110 = fsub double %107, %109
  %111 = call double @ldexp(double %110, i32 32) #3
  %112 = call double @floor(double %111) #4
  %113 = fsub double %112, 0x41E0000000000000
  %114 = fptosi double %113 to i64
  %115 = add nsw i64 %114, 2147483647
  %116 = add nsw i64 %115, 1
  store i64 %116, i64* %7, align 8
  br label %117

; <label>:117:                                    ; preds = %87, %86
  br label %118

; <label>:118:                                    ; preds = %117, %34
  br label %119

; <label>:119:                                    ; preds = %118, %24
  %120 = load i64, i64* %6, align 8
  %121 = ashr i64 %120, 24
  %122 = trunc i64 %121 to i8
  %123 = load i8*, i8** %4, align 8
  %124 = getelementptr inbounds i8, i8* %123, i64 0
  store i8 %122, i8* %124, align 1
  %125 = load i64, i64* %6, align 8
  %126 = ashr i64 %125, 16
  %127 = trunc i64 %126 to i8
  %128 = load i8*, i8** %4, align 8
  %129 = getelementptr inbounds i8, i8* %128, i64 1
  store i8 %127, i8* %129, align 1
  %130 = load i64, i64* %6, align 8
  %131 = ashr i64 %130, 8
  %132 = trunc i64 %131 to i8
  %133 = load i8*, i8** %4, align 8
  %134 = getelementptr inbounds i8, i8* %133, i64 2
  store i8 %132, i8* %134, align 1
  %135 = load i64, i64* %6, align 8
  %136 = trunc i64 %135 to i8
  %137 = load i8*, i8** %4, align 8
  %138 = getelementptr inbounds i8, i8* %137, i64 3
  store i8 %136, i8* %138, align 1
  %139 = load i64, i64* %7, align 8
  %140 = ashr i64 %139, 24
  %141 = trunc i64 %140 to i8
  %142 = load i8*, i8** %4, align 8
  %143 = getelementptr inbounds i8, i8* %142, i64 4
  store i8 %141, i8* %143, align 1
  %144 = load i64, i64* %7, align 8
  %145 = ashr i64 %144, 16
  %146 = trunc i64 %145 to i8
  %147 = load i8*, i8** %4, align 8
  %148 = getelementptr inbounds i8, i8* %147, i64 5
  store i8 %146, i8* %148, align 1
  %149 = load i64, i64* %7, align 8
  %150 = ashr i64 %149, 8
  %151 = trunc i64 %150 to i8
  %152 = load i8*, i8** %4, align 8
  %153 = getelementptr inbounds i8, i8* %152, i64 6
  store i8 %151, i8* %153, align 1
  %154 = load i64, i64* %7, align 8
  %155 = trunc i64 %154 to i8
  %156 = load i8*, i8** %4, align 8
  %157 = getelementptr inbounds i8, i8* %156, i64 7
  store i8 %155, i8* %157, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define double @ConvertFromIeeeExtended(i8*) #0 {
  %2 = alloca double, align 8
  %3 = alloca i8*, align 8
  %4 = alloca double, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  %8 = load i8*, i8** %3, align 8
  %9 = getelementptr inbounds i8, i8* %8, i64 0
  %10 = load i8, i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = and i32 %11, 127
  %13 = shl i32 %12, 8
  %14 = load i8*, i8** %3, align 8
  %15 = getelementptr inbounds i8, i8* %14, i64 1
  %16 = load i8, i8* %15, align 1
  %17 = sext i8 %16 to i32
  %18 = and i32 %17, 255
  %19 = or i32 %13, %18
  %20 = sext i32 %19 to i64
  store i64 %20, i64* %5, align 8
  %21 = load i8*, i8** %3, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 2
  %23 = load i8, i8* %22, align 1
  %24 = sext i8 %23 to i32
  %25 = and i32 %24, 255
  %26 = sext i32 %25 to i64
  %27 = shl i64 %26, 24
  %28 = load i8*, i8** %3, align 8
  %29 = getelementptr inbounds i8, i8* %28, i64 3
  %30 = load i8, i8* %29, align 1
  %31 = sext i8 %30 to i32
  %32 = and i32 %31, 255
  %33 = sext i32 %32 to i64
  %34 = shl i64 %33, 16
  %35 = or i64 %27, %34
  %36 = load i8*, i8** %3, align 8
  %37 = getelementptr inbounds i8, i8* %36, i64 4
  %38 = load i8, i8* %37, align 1
  %39 = sext i8 %38 to i32
  %40 = and i32 %39, 255
  %41 = sext i32 %40 to i64
  %42 = shl i64 %41, 8
  %43 = or i64 %35, %42
  %44 = load i8*, i8** %3, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 5
  %46 = load i8, i8* %45, align 1
  %47 = sext i8 %46 to i32
  %48 = and i32 %47, 255
  %49 = sext i32 %48 to i64
  %50 = or i64 %43, %49
  store i64 %50, i64* %6, align 8
  %51 = load i8*, i8** %3, align 8
  %52 = getelementptr inbounds i8, i8* %51, i64 6
  %53 = load i8, i8* %52, align 1
  %54 = sext i8 %53 to i32
  %55 = and i32 %54, 255
  %56 = sext i32 %55 to i64
  %57 = shl i64 %56, 24
  %58 = load i8*, i8** %3, align 8
  %59 = getelementptr inbounds i8, i8* %58, i64 7
  %60 = load i8, i8* %59, align 1
  %61 = sext i8 %60 to i32
  %62 = and i32 %61, 255
  %63 = sext i32 %62 to i64
  %64 = shl i64 %63, 16
  %65 = or i64 %57, %64
  %66 = load i8*, i8** %3, align 8
  %67 = getelementptr inbounds i8, i8* %66, i64 8
  %68 = load i8, i8* %67, align 1
  %69 = sext i8 %68 to i32
  %70 = and i32 %69, 255
  %71 = sext i32 %70 to i64
  %72 = shl i64 %71, 8
  %73 = or i64 %65, %72
  %74 = load i8*, i8** %3, align 8
  %75 = getelementptr inbounds i8, i8* %74, i64 9
  %76 = load i8, i8* %75, align 1
  %77 = sext i8 %76 to i32
  %78 = and i32 %77, 255
  %79 = sext i32 %78 to i64
  %80 = or i64 %73, %79
  store i64 %80, i64* %7, align 8
  %81 = load i64, i64* %5, align 8
  %82 = icmp eq i64 %81, 0
  br i1 %82, label %83, label %93

; <label>:83:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeExtended, i64 0, i64 3)
  %84 = add i64 %pgocount, 1
  store i64 %84, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeExtended, i64 0, i64 3)
  %85 = load i64, i64* %6, align 8
  %86 = icmp eq i64 %85, 0
  br i1 %86, label %87, label %93

; <label>:87:                                     ; preds = %83
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeExtended, i64 0, i64 4)
  %88 = add i64 %pgocount1, 1
  store i64 %88, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeExtended, i64 0, i64 4)
  %89 = load i64, i64* %7, align 8
  %90 = icmp eq i64 %89, 0
  br i1 %90, label %91, label %93

; <label>:91:                                     ; preds = %87
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeExtended, i64 0, i64 5)
  %92 = add i64 %pgocount2, 1
  store i64 %92, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeExtended, i64 0, i64 5)
  store double 0.000000e+00, double* %4, align 8
  br label %123

; <label>:93:                                     ; preds = %87, %83, %1
  %94 = load i64, i64* %5, align 8
  %95 = icmp eq i64 %94, 32767
  br i1 %95, label %96, label %98

; <label>:96:                                     ; preds = %93
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeExtended, i64 0, i64 1)
  %97 = add i64 %pgocount3, 1
  store i64 %97, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeExtended, i64 0, i64 1)
  store double 0x7FF0000000000000, double* %4, align 8
  br label %122

; <label>:98:                                     ; preds = %93
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeExtended, i64 0, i64 2)
  %99 = add i64 %pgocount4, 1
  store i64 %99, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeExtended, i64 0, i64 2)
  %100 = load i64, i64* %5, align 8
  %101 = sub nsw i64 %100, 16383
  store i64 %101, i64* %5, align 8
  %102 = load i64, i64* %6, align 8
  %103 = sub i64 %102, 2147483647
  %104 = sub i64 %103, 1
  %105 = sitofp i64 %104 to double
  %106 = fadd double %105, 0x41E0000000000000
  %107 = load i64, i64* %5, align 8
  %108 = sub nsw i64 %107, 31
  store i64 %108, i64* %5, align 8
  %109 = trunc i64 %108 to i32
  %110 = call double @ldexp(double %106, i32 %109) #3
  store double %110, double* %4, align 8
  %111 = load i64, i64* %7, align 8
  %112 = sub i64 %111, 2147483647
  %113 = sub i64 %112, 1
  %114 = sitofp i64 %113 to double
  %115 = fadd double %114, 0x41E0000000000000
  %116 = load i64, i64* %5, align 8
  %117 = sub nsw i64 %116, 32
  store i64 %117, i64* %5, align 8
  %118 = trunc i64 %117 to i32
  %119 = call double @ldexp(double %115, i32 %118) #3
  %120 = load double, double* %4, align 8
  %121 = fadd double %120, %119
  store double %121, double* %4, align 8
  br label %122

; <label>:122:                                    ; preds = %98, %96
  br label %123

; <label>:123:                                    ; preds = %122, %91
  %124 = load i8*, i8** %3, align 8
  %125 = getelementptr inbounds i8, i8* %124, i64 0
  %126 = load i8, i8* %125, align 1
  %127 = sext i8 %126 to i32
  %128 = and i32 %127, 128
  %129 = icmp ne i32 %128, 0
  br i1 %129, label %130, label %133

; <label>:130:                                    ; preds = %123
  %131 = load double, double* %4, align 8
  %132 = fsub double -0.000000e+00, %131
  store double %132, double* %2, align 8
  br label %136

; <label>:133:                                    ; preds = %123
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeExtended, i64 0, i64 0)
  %134 = add i64 %pgocount5, 1
  store i64 %134, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertFromIeeeExtended, i64 0, i64 0)
  %135 = load double, double* %4, align 8
  store double %135, double* %2, align 8
  br label %136

; <label>:136:                                    ; preds = %133, %130
  %137 = load double, double* %2, align 8
  ret double %137
}

; Function Attrs: nounwind uwtable
define void @ConvertToIeeeExtended(double, i8*) #0 {
  %3 = alloca double, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  store double %0, double* %3, align 8
  store i8* %1, i8** %4, align 8
  %11 = load double, double* %3, align 8
  %12 = fcmp olt double %11, 0.000000e+00
  br i1 %12, label %13, label %17

; <label>:13:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertToIeeeExtended, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertToIeeeExtended, i64 0, i64 0)
  store i32 32768, i32* %5, align 4
  %15 = load double, double* %3, align 8
  %16 = fmul double %15, -1.000000e+00
  store double %16, double* %3, align 8
  br label %19

; <label>:17:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertToIeeeExtended, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertToIeeeExtended, i64 0, i64 1)
  store i32 0, i32* %5, align 4
  br label %19

; <label>:19:                                     ; preds = %17, %13
  %20 = load double, double* %3, align 8
  %21 = fcmp oeq double %20, 0.000000e+00
  br i1 %21, label %22, label %23

; <label>:22:                                     ; preds = %19
  store i32 0, i32* %6, align 4
  store i64 0, i64* %9, align 8
  store i64 0, i64* %10, align 8
  br label %72

; <label>:23:                                     ; preds = %19
  %24 = load double, double* %3, align 8
  %25 = call double @frexp(double %24, i32* %6) #3
  store double %25, double* %7, align 8
  %26 = load i32, i32* %6, align 4
  %27 = icmp sgt i32 %26, 16384
  br i1 %27, label %32, label %28

; <label>:28:                                     ; preds = %23
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertToIeeeExtended, i64 0, i64 3)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertToIeeeExtended, i64 0, i64 3)
  %30 = load double, double* %7, align 8
  %31 = fcmp olt double %30, 1.000000e+00
  br i1 %31, label %36, label %32

; <label>:32:                                     ; preds = %28, %23
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertToIeeeExtended, i64 0, i64 2)
  %33 = add i64 %pgocount3, 1
  store i64 %33, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertToIeeeExtended, i64 0, i64 2)
  %34 = load i32, i32* %5, align 4
  %35 = or i32 %34, 32767
  store i32 %35, i32* %6, align 4
  store i64 0, i64* %9, align 8
  store i64 0, i64* %10, align 8
  br label %71

; <label>:36:                                     ; preds = %28
  %37 = load i32, i32* %6, align 4
  %38 = add nsw i32 %37, 16382
  store i32 %38, i32* %6, align 4
  %39 = load i32, i32* %6, align 4
  %40 = icmp slt i32 %39, 0
  br i1 %40, label %41, label %46

; <label>:41:                                     ; preds = %36
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertToIeeeExtended, i64 0, i64 5)
  %42 = add i64 %pgocount4, 1
  store i64 %42, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertToIeeeExtended, i64 0, i64 5)
  %43 = load double, double* %7, align 8
  %44 = load i32, i32* %6, align 4
  %45 = call double @ldexp(double %43, i32 %44) #3
  store double %45, double* %7, align 8
  store i32 0, i32* %6, align 4
  br label %46

; <label>:46:                                     ; preds = %41, %36
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertToIeeeExtended, i64 0, i64 4)
  %47 = add i64 %pgocount5, 1
  store i64 %47, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_ConvertToIeeeExtended, i64 0, i64 4)
  %48 = load i32, i32* %5, align 4
  %49 = load i32, i32* %6, align 4
  %50 = or i32 %49, %48
  store i32 %50, i32* %6, align 4
  %51 = load double, double* %7, align 8
  %52 = call double @ldexp(double %51, i32 32) #3
  store double %52, double* %7, align 8
  %53 = load double, double* %7, align 8
  %54 = call double @floor(double %53) #4
  store double %54, double* %8, align 8
  %55 = load double, double* %8, align 8
  %56 = fsub double %55, 0x41E0000000000000
  %57 = fptosi double %56 to i64
  %58 = add nsw i64 %57, 2147483647
  %59 = add nsw i64 %58, 1
  store i64 %59, i64* %9, align 8
  %60 = load double, double* %7, align 8
  %61 = load double, double* %8, align 8
  %62 = fsub double %60, %61
  %63 = call double @ldexp(double %62, i32 32) #3
  store double %63, double* %7, align 8
  %64 = load double, double* %7, align 8
  %65 = call double @floor(double %64) #4
  store double %65, double* %8, align 8
  %66 = load double, double* %8, align 8
  %67 = fsub double %66, 0x41E0000000000000
  %68 = fptosi double %67 to i64
  %69 = add nsw i64 %68, 2147483647
  %70 = add nsw i64 %69, 1
  store i64 %70, i64* %10, align 8
  br label %71

; <label>:71:                                     ; preds = %46, %32
  br label %72

; <label>:72:                                     ; preds = %71, %22
  %73 = load i32, i32* %6, align 4
  %74 = ashr i32 %73, 8
  %75 = trunc i32 %74 to i8
  %76 = load i8*, i8** %4, align 8
  %77 = getelementptr inbounds i8, i8* %76, i64 0
  store i8 %75, i8* %77, align 1
  %78 = load i32, i32* %6, align 4
  %79 = trunc i32 %78 to i8
  %80 = load i8*, i8** %4, align 8
  %81 = getelementptr inbounds i8, i8* %80, i64 1
  store i8 %79, i8* %81, align 1
  %82 = load i64, i64* %9, align 8
  %83 = lshr i64 %82, 24
  %84 = trunc i64 %83 to i8
  %85 = load i8*, i8** %4, align 8
  %86 = getelementptr inbounds i8, i8* %85, i64 2
  store i8 %84, i8* %86, align 1
  %87 = load i64, i64* %9, align 8
  %88 = lshr i64 %87, 16
  %89 = trunc i64 %88 to i8
  %90 = load i8*, i8** %4, align 8
  %91 = getelementptr inbounds i8, i8* %90, i64 3
  store i8 %89, i8* %91, align 1
  %92 = load i64, i64* %9, align 8
  %93 = lshr i64 %92, 8
  %94 = trunc i64 %93 to i8
  %95 = load i8*, i8** %4, align 8
  %96 = getelementptr inbounds i8, i8* %95, i64 4
  store i8 %94, i8* %96, align 1
  %97 = load i64, i64* %9, align 8
  %98 = trunc i64 %97 to i8
  %99 = load i8*, i8** %4, align 8
  %100 = getelementptr inbounds i8, i8* %99, i64 5
  store i8 %98, i8* %100, align 1
  %101 = load i64, i64* %10, align 8
  %102 = lshr i64 %101, 24
  %103 = trunc i64 %102 to i8
  %104 = load i8*, i8** %4, align 8
  %105 = getelementptr inbounds i8, i8* %104, i64 6
  store i8 %103, i8* %105, align 1
  %106 = load i64, i64* %10, align 8
  %107 = lshr i64 %106, 16
  %108 = trunc i64 %107 to i8
  %109 = load i8*, i8** %4, align 8
  %110 = getelementptr inbounds i8, i8* %109, i64 7
  store i8 %108, i8* %110, align 1
  %111 = load i64, i64* %10, align 8
  %112 = lshr i64 %111, 8
  %113 = trunc i64 %112 to i8
  %114 = load i8*, i8** %4, align 8
  %115 = getelementptr inbounds i8, i8* %114, i64 8
  store i8 %113, i8* %115, align 1
  %116 = load i64, i64* %10, align 8
  %117 = trunc i64 %116 to i8
  %118 = load i8*, i8** %4, align 8
  %119 = getelementptr inbounds i8, i8* %118, i64 9
  store i8 %117, i8* %119, align 1
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

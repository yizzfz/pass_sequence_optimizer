; ModuleID = 'tmp1.ll'
source_filename = "vbrquantize.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.scalefac_struct = type { [23 x i32], [14 x i32] }
%struct.gr_info = type { i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, [4 x i32] }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.III_psy_ratio = type { %struct.III_psy_xmin, %struct.III_psy_xmin }
%struct.III_psy_xmin = type { [22 x double], [13 x [3 x double]] }
%struct.III_side_info_t = type { i32, i32, i32, [2 x [4 x i32]], [2 x %struct.anon] }
%struct.anon = type { [2 x %struct.gr_info_ss] }
%struct.gr_info_ss = type { %struct.gr_info }
%struct.III_scalefac_t = type { [22 x i32], [13 x [3 x i32]] }

$__llvm_profile_raw_version = comdat any

@pow43 = external global [8208 x double], align 16
@.str = private unnamed_addr constant [13 x i8] c"sf_ok!=10000\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"vbrquantize.c\00", align 1
@__PRETTY_FUNCTION__.find_scalefac = private unnamed_addr constant [64 x i8] c"FLOAT8 find_scalefac(FLOAT8 *, FLOAT8 *, int, int, FLOAT8, int)\00", align 1
@pretab = external global [21 x i32], align 16
@masking_lower = external global float, align 4
@convert_mdct = external global i32, align 4
@scalefac_band = external global %struct.scalefac_struct, align 4
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_calc_sfb_ave_noise = private constant [18 x i8] c"calc_sfb_ave_noise"
@__profn_find_scalefac = private constant [13 x i8] c"find_scalefac"
@__profn_compute_scalefacs_short = private constant [23 x i8] c"compute_scalefacs_short"
@__profn_compute_scalefacs_long = private constant [22 x i8] c"compute_scalefacs_long"
@__profn_VBR_iteration_loop_new = private constant [22 x i8] c"VBR_iteration_loop_new"
@__profc_calc_sfb_ave_noise = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_calc_sfb_ave_noise = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3853334322524993474, i64 77061255780, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_calc_sfb_ave_noise, i32 0, i32 0), i8* bitcast (double (double*, double*, i32, i32, double)* @calc_sfb_ave_noise to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_find_scalefac = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_find_scalefac = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6844174067025449490, i64 184821188149, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i32 0, i32 0), i8* bitcast (double (double*, double*, i32, i32, double, i32)* @find_scalefac to i8*), i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_compute_scalefacs_short = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_compute_scalefacs_short = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1960563777870778244, i64 72057679033294206, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_compute_scalefacs_short, i32 0, i32 0), i8* bitcast (double ([3 x double]*, %struct.gr_info*, [3 x i32]*)* @compute_scalefacs_short to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_compute_scalefacs_long = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_compute_scalefacs_long = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3530842720929024827, i64 72057727054407252, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i32 0, i32 0), i8* bitcast (double (double*, %struct.gr_info*, i32*)* @compute_scalefacs_long to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_VBR_iteration_loop_new = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_VBR_iteration_loop_new = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4908528264090665689, i64 328994882370, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, [2 x double]*, double*, [2 x [576 x double]]*, [2 x %struct.III_psy_ratio]*, %struct.III_side_info_t*, [2 x [576 x i32]]*, [2 x %struct.III_scalefac_t]*)* @VBR_iteration_loop_new to i8*), i8* null, i32 19, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [80 x i8] c"fNx\DAm\C81\0E\800\08\05\D0\F4j\1E\C1\C1\F5\07\91*I\85FP\AF\AF\93\93o|L\8D\11u\06]\02s\0D)UmA05\A9\C4\85}\EFg\CA\17\81\D8\FC\C8\9Fonk\99\86\11\9ArP\AA\DB[\DEar?\FE\8B'\F6", section "__llvm_prf_names"
@llvm.used = appending global [6 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_calc_sfb_ave_noise to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_find_scalefac to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_compute_scalefacs_short to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_compute_scalefacs_long to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_VBR_iteration_loop_new to i8*), i8* getelementptr inbounds ([80 x i8], [80 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define double @calc_sfb_ave_noise(double*, double*, i32, i32, double) #0 {
  %6 = alloca double, align 8
  %7 = alloca double*, align 8
  %8 = alloca double*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca double, align 8
  %12 = alloca i32, align 4
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca i32, align 4
  %16 = alloca double, align 8
  %17 = alloca double, align 8
  store double* %0, double** %7, align 8
  store double* %1, double** %8, align 8
  store i32 %2, i32* %9, align 4
  store i32 %3, i32* %10, align 4
  store double %4, double* %11, align 8
  store double 0.000000e+00, double* %13, align 8
  %18 = load double, double* %11, align 8
  %19 = call double @pow(double %18, double 7.500000e-01) #6
  store double %19, double* %14, align 8
  store i32 0, i32* %12, align 4
  br label %20

; <label>:20:                                     ; preds = %87, %5
  %21 = load i32, i32* %12, align 4
  %22 = load i32, i32* %9, align 4
  %23 = load i32, i32* %10, align 4
  %24 = mul nsw i32 %22, %23
  %25 = icmp slt i32 %21, %24
  br i1 %25, label %26, label %92

; <label>:26:                                     ; preds = %20
  %27 = load double*, double** %8, align 8
  %28 = load i32, i32* %12, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double, double* %27, i64 %29
  %31 = load double, double* %30, align 8
  %32 = load double, double* %14, align 8
  %33 = fdiv double %31, %32
  %34 = call double @floor(double %33) #7
  %35 = fptosi double %34 to i32
  store i32 %35, i32* %15, align 4
  %36 = load i32, i32* %15, align 4
  %37 = icmp sgt i32 %36, 8206
  br i1 %37, label %38, label %40

; <label>:38:                                     ; preds = %26
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_calc_sfb_ave_noise, i64 0, i64 4)
  %39 = add i64 %pgocount, 1
  store i64 %39, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_calc_sfb_ave_noise, i64 0, i64 4)
  store double -1.000000e+00, double* %6, align 8
  br label %98

; <label>:40:                                     ; preds = %26
  %41 = load double*, double** %7, align 8
  %42 = load i32, i32* %12, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, double* %41, i64 %43
  %45 = load double, double* %44, align 8
  %46 = call double @fabs(double %45) #7
  %47 = load i32, i32* %15, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %48
  %50 = load double, double* %49, align 8
  %51 = load double, double* %11, align 8
  %52 = fmul double %50, %51
  %53 = fsub double %46, %52
  store double %53, double* %16, align 8
  %54 = load i32, i32* %15, align 4
  %55 = icmp slt i32 %54, 8206
  br i1 %55, label %56, label %81

; <label>:56:                                     ; preds = %40
  %57 = load double*, double** %7, align 8
  %58 = load i32, i32* %12, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double* %57, i64 %59
  %61 = load double, double* %60, align 8
  %62 = call double @fabs(double %61) #7
  %63 = load i32, i32* %15, align 4
  %64 = add nsw i32 %63, 1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %65
  %67 = load double, double* %66, align 8
  %68 = load double, double* %11, align 8
  %69 = fmul double %67, %68
  %70 = fsub double %62, %69
  store double %70, double* %17, align 8
  %71 = load double, double* %17, align 8
  %72 = call double @fabs(double %71) #7
  %73 = load double, double* %16, align 8
  %74 = call double @fabs(double %73) #7
  %75 = fcmp olt double %72, %74
  br i1 %75, label %76, label %79

; <label>:76:                                     ; preds = %56
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_calc_sfb_ave_noise, i64 0, i64 2)
  %77 = add i64 %pgocount1, 1
  store i64 %77, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_calc_sfb_ave_noise, i64 0, i64 2)
  %78 = load double, double* %17, align 8
  store double %78, double* %16, align 8
  br label %79

; <label>:79:                                     ; preds = %76, %56
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_calc_sfb_ave_noise, i64 0, i64 1)
  %80 = add i64 %pgocount2, 1
  store i64 %80, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_calc_sfb_ave_noise, i64 0, i64 1)
  br label %81

; <label>:81:                                     ; preds = %79, %40
  %82 = load double, double* %16, align 8
  %83 = load double, double* %16, align 8
  %84 = fmul double %82, %83
  %85 = load double, double* %13, align 8
  %86 = fadd double %85, %84
  store double %86, double* %13, align 8
  br label %87

; <label>:87:                                     ; preds = %81
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_calc_sfb_ave_noise, i64 0, i64 0)
  %88 = add i64 %pgocount3, 1
  store i64 %88, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_calc_sfb_ave_noise, i64 0, i64 0)
  %89 = load i32, i32* %9, align 4
  %90 = load i32, i32* %12, align 4
  %91 = add nsw i32 %90, %89
  store i32 %91, i32* %12, align 4
  br label %20

; <label>:92:                                     ; preds = %20
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_calc_sfb_ave_noise, i64 0, i64 3)
  %93 = add i64 %pgocount4, 1
  store i64 %93, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_calc_sfb_ave_noise, i64 0, i64 3)
  %94 = load double, double* %13, align 8
  %95 = load i32, i32* %10, align 4
  %96 = sitofp i32 %95 to double
  %97 = fdiv double %94, %96
  store double %97, double* %6, align 8
  br label %98

; <label>:98:                                     ; preds = %92, %38
  %99 = load double, double* %6, align 8
  ret double %99
}

; Function Attrs: nounwind
declare double @pow(double, double) #1

; Function Attrs: nounwind readnone
declare double @floor(double) #2

; Function Attrs: nounwind readnone
declare double @fabs(double) #2

; Function Attrs: nounwind uwtable
define double @find_scalefac(double*, double*, i32, i32, double, i32) #0 {
  %7 = alloca double, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca double, align 8
  %13 = alloca i32, align 4
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca double, align 8
  %17 = alloca double, align 8
  %18 = alloca double, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  store double* %0, double** %8, align 8
  store double* %1, double** %9, align 8
  store i32 %2, i32* %10, align 4
  store i32 %3, i32* %11, align 4
  store double %4, double* %12, align 8
  store i32 %5, i32* %13, align 4
  store double -2.050000e+01, double* %16, align 8
  store i32 -82, i32* %19, align 4
  store double 3.200000e+01, double* %18, align 8
  store i32 128, i32* %21, align 4
  store double 1.000000e+04, double* %17, align 8
  store i32 10000, i32* %20, align 4
  store i32 0, i32* %22, align 4
  br label %23

; <label>:23:                                     ; preds = %85, %6
  %24 = load i32, i32* %22, align 4
  %25 = icmp slt i32 %24, 7
  br i1 %25, label %26, label %88

; <label>:26:                                     ; preds = %23
  %27 = load double, double* %18, align 8
  %28 = fdiv double %27, 2.000000e+00
  store double %28, double* %18, align 8
  %29 = load i32, i32* %21, align 4
  %30 = sdiv i32 %29, 2
  store i32 %30, i32* %21, align 4
  %31 = load double, double* %16, align 8
  %32 = call double @pow(double 2.000000e+00, double %31) #6
  store double %32, double* %15, align 8
  %33 = load double*, double** %8, align 8
  %34 = load double*, double** %9, align 8
  %35 = load i32, i32* %10, align 4
  %36 = load i32, i32* %13, align 4
  %37 = load double, double* %15, align 8
  %38 = call double @calc_sfb_ave_noise(double* %33, double* %34, i32 %35, i32 %36, double %37)
  store double %38, double* %14, align 8
  %39 = load double, double* %14, align 8
  %40 = fcmp olt double %39, 0.000000e+00
  br i1 %40, label %41, label %49

; <label>:41:                                     ; preds = %26
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 1)
  %42 = add i64 %pgocount, 1
  store i64 %42, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 1)
  %43 = load double, double* %18, align 8
  %44 = load double, double* %16, align 8
  %45 = fadd double %44, %43
  store double %45, double* %16, align 8
  %46 = load i32, i32* %21, align 4
  %47 = load i32, i32* %19, align 4
  %48 = add nsw i32 %47, %46
  store i32 %48, i32* %19, align 4
  br label %84

; <label>:49:                                     ; preds = %26
  %50 = load double, double* %17, align 8
  %51 = fcmp oeq double %50, 1.000000e+04
  br i1 %51, label %52, label %55

; <label>:52:                                     ; preds = %49
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 5)
  %53 = add i64 %pgocount1, 1
  store i64 %53, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 5)
  %54 = load double, double* %16, align 8
  store double %54, double* %17, align 8
  br label %55

; <label>:55:                                     ; preds = %52, %49
  %56 = load i32, i32* %20, align 4
  %57 = icmp eq i32 %56, 10000
  br i1 %57, label %58, label %61

; <label>:58:                                     ; preds = %55
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 6)
  %59 = add i64 %pgocount2, 1
  store i64 %59, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 6)
  %60 = load i32, i32* %19, align 4
  store i32 %60, i32* %20, align 4
  br label %61

; <label>:61:                                     ; preds = %58, %55
  %62 = load double, double* %14, align 8
  %63 = load double, double* %12, align 8
  %64 = fcmp ogt double %62, %63
  br i1 %64, label %65, label %73

; <label>:65:                                     ; preds = %61
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 7)
  %66 = add i64 %pgocount3, 1
  store i64 %66, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 7)
  %67 = load double, double* %18, align 8
  %68 = load double, double* %16, align 8
  %69 = fsub double %68, %67
  store double %69, double* %16, align 8
  %70 = load i32, i32* %21, align 4
  %71 = load i32, i32* %19, align 4
  %72 = sub nsw i32 %71, %70
  store i32 %72, i32* %19, align 4
  br label %83

; <label>:73:                                     ; preds = %61
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 8)
  %74 = add i64 %pgocount4, 1
  store i64 %74, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 8)
  %75 = load double, double* %16, align 8
  store double %75, double* %17, align 8
  %76 = load i32, i32* %19, align 4
  store i32 %76, i32* %20, align 4
  %77 = load double, double* %18, align 8
  %78 = load double, double* %16, align 8
  %79 = fadd double %78, %77
  store double %79, double* %16, align 8
  %80 = load i32, i32* %21, align 4
  %81 = load i32, i32* %19, align 4
  %82 = add nsw i32 %81, %80
  store i32 %82, i32* %19, align 4
  br label %83

; <label>:83:                                     ; preds = %73, %65
  br label %84

; <label>:84:                                     ; preds = %83, %41
  br label %85

; <label>:85:                                     ; preds = %84
  %86 = load i32, i32* %22, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %22, align 4
  br label %23

; <label>:88:                                     ; preds = %23
  %89 = load double, double* %17, align 8
  %90 = fcmp une double %89, 1.000000e+04
  br i1 %90, label %91, label %92

; <label>:91:                                     ; preds = %88
  br label %95

; <label>:92:                                     ; preds = %88
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 11)
  %93 = add i64 %pgocount5, 1
  store i64 %93, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 11)
  call void @__assert_fail(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 108, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @__PRETTY_FUNCTION__.find_scalefac, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %95

; <label>:95:                                     ; preds = %94, %91
  %96 = load double, double* %17, align 8
  %97 = fadd double %96, 7.500000e-01
  store double %97, double* %16, align 8
  %98 = load i32, i32* %20, align 4
  %99 = add nsw i32 %98, 3
  store i32 %99, i32* %19, align 4
  br label %100

; <label>:100:                                    ; preds = %149, %95
  %101 = load double, double* %16, align 8
  %102 = load double, double* %17, align 8
  %103 = fadd double %102, 1.000000e-02
  %104 = fcmp ogt double %101, %103
  br i1 %104, label %105, label %155

; <label>:105:                                    ; preds = %100
  %106 = load double, double* %16, align 8
  %107 = load double, double* %17, align 8
  %108 = load double, double* %18, align 8
  %109 = fmul double 2.000000e+00, %108
  %110 = fadd double %107, %109
  %111 = fsub double %106, %110
  %112 = call double @fabs(double %111) #7
  %113 = fcmp olt double %112, 1.000000e-02
  br i1 %113, label %114, label %118

; <label>:114:                                    ; preds = %105
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 2)
  %115 = add i64 %pgocount6, 1
  store i64 %115, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 2)
  %116 = load double, double* %16, align 8
  %117 = fsub double %116, 2.500000e-01
  store double %117, double* %16, align 8
  br label %118

; <label>:118:                                    ; preds = %114, %105
  %119 = load i32, i32* %19, align 4
  %120 = load i32, i32* %20, align 4
  %121 = load i32, i32* %21, align 4
  %122 = mul nsw i32 2, %121
  %123 = add nsw i32 %120, %122
  %124 = icmp eq i32 %119, %123
  br i1 %124, label %125, label %129

; <label>:125:                                    ; preds = %118
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 3)
  %126 = add i64 %pgocount7, 1
  store i64 %126, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 3)
  %127 = load i32, i32* %19, align 4
  %128 = sub nsw i32 %127, 1
  store i32 %128, i32* %19, align 4
  br label %129

; <label>:129:                                    ; preds = %125, %118
  %130 = load double, double* %16, align 8
  %131 = call double @pow(double 2.000000e+00, double %130) #6
  store double %131, double* %15, align 8
  %132 = load double*, double** %8, align 8
  %133 = load double*, double** %9, align 8
  %134 = load i32, i32* %10, align 4
  %135 = load i32, i32* %13, align 4
  %136 = load double, double* %15, align 8
  %137 = call double @calc_sfb_ave_noise(double* %132, double* %133, i32 %134, i32 %135, double %136)
  store double %137, double* %14, align 8
  %138 = load double, double* %14, align 8
  %139 = fcmp ogt double %138, 0.000000e+00
  br i1 %139, label %140, label %149

; <label>:140:                                    ; preds = %129
  %141 = load double, double* %14, align 8
  %142 = load double, double* %12, align 8
  %143 = fcmp ole double %141, %142
  br i1 %143, label %144, label %147

; <label>:144:                                    ; preds = %140
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 10)
  %145 = add i64 %pgocount8, 1
  store i64 %145, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 10)
  %146 = load double, double* %16, align 8
  store double %146, double* %7, align 8
  br label %158

; <label>:147:                                    ; preds = %140
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 4)
  %148 = add i64 %pgocount9, 1
  store i64 %148, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 4)
  br label %149

; <label>:149:                                    ; preds = %147, %129
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 0)
  %150 = add i64 %pgocount10, 1
  store i64 %150, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 0)
  %151 = load double, double* %16, align 8
  %152 = fsub double %151, 2.500000e-01
  store double %152, double* %16, align 8
  %153 = load i32, i32* %19, align 4
  %154 = sub nsw i32 %153, 1
  store i32 %154, i32* %19, align 4
  br label %100

; <label>:155:                                    ; preds = %100
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 9)
  %156 = add i64 %pgocount11, 1
  store i64 %156, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_find_scalefac, i64 0, i64 9)
  %157 = load double, double* %17, align 8
  store double %157, double* %7, align 8
  br label %158

; <label>:158:                                    ; preds = %155, %144
  %159 = load double, double* %7, align 8
  ret double %159
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: nounwind uwtable
define double @compute_scalefacs_short([3 x double]*, %struct.gr_info*, [3 x i32]*) #0 {
  %4 = alloca [3 x double]*, align 8
  %5 = alloca %struct.gr_info*, align 8
  %6 = alloca [3 x i32]*, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca [12 x [3 x double]], align 16
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store [3 x double]* %0, [3 x double]** %4, align 8
  store %struct.gr_info* %1, %struct.gr_info** %5, align 8
  store [3 x i32]* %2, [3 x i32]** %6, align 8
  %13 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %14 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %13, i32 0, i32 13
  %15 = load i32, i32* %14, align 4
  %16 = icmp eq i32 %15, 0
  %17 = zext i1 %16 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_compute_scalefacs_short, i64 0, i64 5)
  %18 = add i64 %pgocount, %17
  store i64 %18, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_compute_scalefacs_short, i64 0, i64 5)
  %19 = select i1 %16, i32 2, i32 1
  store i32 %19, i32* %12, align 4
  %20 = getelementptr inbounds [12 x [3 x double]], [12 x [3 x double]]* %9, i32 0, i32 0
  %21 = bitcast [3 x double]* %20 to i8*
  %22 = load [3 x double]*, [3 x double]** %4, align 8
  %23 = bitcast [3 x double]* %22 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %21, i8* %23, i64 288, i32 8, i1 false)
  store double 0.000000e+00, double* %8, align 8
  store i32 0, i32* %10, align 4
  br label %24

; <label>:24:                                     ; preds = %94, %3
  %25 = load i32, i32* %10, align 4
  %26 = icmp slt i32 %25, 12
  br i1 %26, label %27, label %98

; <label>:27:                                     ; preds = %24
  store i32 0, i32* %11, align 4
  br label %28

; <label>:28:                                     ; preds = %90, %27
  %29 = load i32, i32* %11, align 4
  %30 = icmp slt i32 %29, 3
  br i1 %30, label %31, label %93

; <label>:31:                                     ; preds = %28
  %32 = load i32, i32* %10, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [12 x [3 x double]], [12 x [3 x double]]* %9, i64 0, i64 %33
  %35 = load i32, i32* %11, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [3 x double], [3 x double]* %34, i64 0, i64 %36
  %38 = load double, double* %37, align 8
  %39 = fsub double -0.000000e+00, %38
  %40 = load i32, i32* %12, align 4
  %41 = sitofp i32 %40 to double
  %42 = fmul double %39, %41
  %43 = fadd double %42, 7.500000e-01
  %44 = fadd double %43, 1.000000e-04
  %45 = call double @floor(double %44) #7
  %46 = fptosi double %45 to i32
  %47 = load [3 x i32]*, [3 x i32]** %6, align 8
  %48 = load i32, i32* %10, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [3 x i32], [3 x i32]* %47, i64 %49
  %51 = load i32, i32* %11, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [3 x i32], [3 x i32]* %50, i64 0, i64 %52
  store i32 %46, i32* %53, align 4
  %54 = load i32, i32* %10, align 4
  %55 = icmp slt i32 %54, 6
  br i1 %55, label %56, label %61

; <label>:56:                                     ; preds = %31
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_compute_scalefacs_short, i64 0, i64 0)
  %57 = add i64 %pgocount1, 1
  store i64 %57, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_compute_scalefacs_short, i64 0, i64 0)
  %58 = load i32, i32* %12, align 4
  %59 = sitofp i32 %58 to double
  %60 = fdiv double 1.500000e+01, %59
  store double %60, double* %7, align 8
  br label %66

; <label>:61:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_compute_scalefacs_short, i64 0, i64 1)
  %62 = add i64 %pgocount2, 1
  store i64 %62, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_compute_scalefacs_short, i64 0, i64 1)
  %63 = load i32, i32* %12, align 4
  %64 = sitofp i32 %63 to double
  %65 = fdiv double 7.000000e+00, %64
  store double %65, double* %7, align 8
  br label %66

; <label>:66:                                     ; preds = %61, %56
  %67 = load double, double* %7, align 8
  %68 = load i32, i32* %10, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [12 x [3 x double]], [12 x [3 x double]]* %9, i64 0, i64 %69
  %71 = load i32, i32* %11, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [3 x double], [3 x double]* %70, i64 0, i64 %72
  %74 = load double, double* %73, align 8
  %75 = fadd double %67, %74
  %76 = load double, double* %8, align 8
  %77 = fcmp ogt double %75, %76
  br i1 %77, label %78, label %89

; <label>:78:                                     ; preds = %66
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_compute_scalefacs_short, i64 0, i64 2)
  %79 = add i64 %pgocount3, 1
  store i64 %79, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_compute_scalefacs_short, i64 0, i64 2)
  %80 = load double, double* %7, align 8
  %81 = load i32, i32* %10, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [12 x [3 x double]], [12 x [3 x double]]* %9, i64 0, i64 %82
  %84 = load i32, i32* %11, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [3 x double], [3 x double]* %83, i64 0, i64 %85
  %87 = load double, double* %86, align 8
  %88 = fadd double %80, %87
  store double %88, double* %8, align 8
  br label %89

; <label>:89:                                     ; preds = %78, %66
  br label %90

; <label>:90:                                     ; preds = %89
  %91 = load i32, i32* %11, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %11, align 4
  br label %28

; <label>:93:                                     ; preds = %28
  br label %94

; <label>:94:                                     ; preds = %93
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_compute_scalefacs_short, i64 0, i64 3)
  %95 = add i64 %pgocount4, 1
  store i64 %95, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_compute_scalefacs_short, i64 0, i64 3)
  %96 = load i32, i32* %10, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %10, align 4
  br label %24

; <label>:98:                                     ; preds = %24
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_compute_scalefacs_short, i64 0, i64 4)
  %99 = add i64 %pgocount5, 1
  store i64 %99, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_compute_scalefacs_short, i64 0, i64 4)
  %100 = load double, double* %8, align 8
  ret double %100
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: nounwind uwtable
define double @compute_scalefacs_long(double*, %struct.gr_info*, i32*) #0 {
  %4 = alloca double*, align 8
  %5 = alloca %struct.gr_info*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca [21 x double], align 16
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca i32, align 4
  store double* %0, double** %4, align 8
  store %struct.gr_info* %1, %struct.gr_info** %5, align 8
  store i32* %2, i32** %6, align 8
  %12 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %13 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %12, i32 0, i32 13
  %14 = load i32, i32* %13, align 4
  %15 = icmp eq i32 %14, 0
  %16 = zext i1 %15 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 8)
  %17 = add i64 %pgocount, %16
  store i64 %17, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 8)
  %18 = select i1 %15, i32 2, i32 1
  store i32 %18, i32* %11, align 4
  %19 = getelementptr inbounds [21 x double], [21 x double]* %8, i32 0, i32 0
  %20 = bitcast double* %19 to i8*
  %21 = load double*, double** %4, align 8
  %22 = bitcast double* %21 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %20, i8* %22, i64 168, i32 8, i1 false)
  %23 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %24 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %23, i32 0, i32 12
  store i32 0, i32* %24, align 8
  store i32 11, i32* %7, align 4
  br label %25

; <label>:25:                                     ; preds = %45, %3
  %26 = load i32, i32* %7, align 4
  %27 = icmp slt i32 %26, 21
  br i1 %27, label %28, label %49

; <label>:28:                                     ; preds = %25
  %29 = load i32, i32* %7, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [21 x double], [21 x double]* %8, i64 0, i64 %30
  %32 = load double, double* %31, align 8
  %33 = load i32, i32* %7, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [21 x i32], [21 x i32]* @pretab, i64 0, i64 %34
  %36 = load i32, i32* %35, align 4
  %37 = load i32, i32* %11, align 4
  %38 = sdiv i32 %36, %37
  %39 = sitofp i32 %38 to double
  %40 = fadd double %32, %39
  %41 = fcmp ogt double %40, 0.000000e+00
  br i1 %41, label %42, label %44

; <label>:42:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 7)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 7)
  br label %49

; <label>:44:                                     ; preds = %28
  br label %45

; <label>:45:                                     ; preds = %44
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 4)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 4)
  %47 = load i32, i32* %7, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %7, align 4
  br label %25

; <label>:49:                                     ; preds = %42, %25
  %50 = load i32, i32* %7, align 4
  %51 = icmp eq i32 %50, 21
  br i1 %51, label %52, label %77

; <label>:52:                                     ; preds = %49
  %53 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %54 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %53, i32 0, i32 12
  store i32 1, i32* %54, align 8
  store i32 11, i32* %7, align 4
  br label %55

; <label>:55:                                     ; preds = %71, %52
  %56 = load i32, i32* %7, align 4
  %57 = icmp slt i32 %56, 21
  br i1 %57, label %58, label %75

; <label>:58:                                     ; preds = %55
  %59 = load i32, i32* %7, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [21 x i32], [21 x i32]* @pretab, i64 0, i64 %60
  %62 = load i32, i32* %61, align 4
  %63 = load i32, i32* %11, align 4
  %64 = sdiv i32 %62, %63
  %65 = sitofp i32 %64 to double
  %66 = load i32, i32* %7, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [21 x double], [21 x double]* %8, i64 0, i64 %67
  %69 = load double, double* %68, align 8
  %70 = fadd double %69, %65
  store double %70, double* %68, align 8
  br label %71

; <label>:71:                                     ; preds = %58
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 0)
  %72 = add i64 %pgocount3, 1
  store i64 %72, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 0)
  %73 = load i32, i32* %7, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %7, align 4
  br label %55

; <label>:75:                                     ; preds = %55
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 6)
  %76 = add i64 %pgocount4, 1
  store i64 %76, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 6)
  br label %77

; <label>:77:                                     ; preds = %75, %49
  store double 0.000000e+00, double* %10, align 8
  store i32 0, i32* %7, align 4
  br label %78

; <label>:78:                                     ; preds = %128, %77
  %79 = load i32, i32* %7, align 4
  %80 = icmp slt i32 %79, 21
  br i1 %80, label %81, label %131

; <label>:81:                                     ; preds = %78
  %82 = load i32, i32* %7, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [21 x double], [21 x double]* %8, i64 0, i64 %83
  %85 = load double, double* %84, align 8
  %86 = fsub double -0.000000e+00, %85
  %87 = load i32, i32* %11, align 4
  %88 = sitofp i32 %87 to double
  %89 = fmul double %86, %88
  %90 = fadd double %89, 7.500000e-01
  %91 = fadd double %90, 1.000000e-04
  %92 = call double @floor(double %91) #7
  %93 = fptosi double %92 to i32
  %94 = load i32*, i32** %6, align 8
  %95 = load i32, i32* %7, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32* %94, i64 %96
  store i32 %93, i32* %97, align 4
  %98 = load i32, i32* %7, align 4
  %99 = icmp slt i32 %98, 11
  br i1 %99, label %100, label %105

; <label>:100:                                    ; preds = %81
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 1)
  %101 = add i64 %pgocount5, 1
  store i64 %101, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 1)
  %102 = load i32, i32* %11, align 4
  %103 = sitofp i32 %102 to double
  %104 = fdiv double 1.500000e+01, %103
  store double %104, double* %9, align 8
  br label %110

; <label>:105:                                    ; preds = %81
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 2)
  %106 = add i64 %pgocount6, 1
  store i64 %106, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 2)
  %107 = load i32, i32* %11, align 4
  %108 = sitofp i32 %107 to double
  %109 = fdiv double 7.000000e+00, %108
  store double %109, double* %9, align 8
  br label %110

; <label>:110:                                    ; preds = %105, %100
  %111 = load double, double* %9, align 8
  %112 = load i32, i32* %7, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [21 x double], [21 x double]* %8, i64 0, i64 %113
  %115 = load double, double* %114, align 8
  %116 = fadd double %111, %115
  %117 = load double, double* %10, align 8
  %118 = fcmp ogt double %116, %117
  br i1 %118, label %119, label %127

; <label>:119:                                    ; preds = %110
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 3)
  %120 = add i64 %pgocount7, 1
  store i64 %120, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 3)
  %121 = load double, double* %9, align 8
  %122 = load i32, i32* %7, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [21 x double], [21 x double]* %8, i64 0, i64 %123
  %125 = load double, double* %124, align 8
  %126 = fadd double %121, %125
  store double %126, double* %10, align 8
  br label %127

; <label>:127:                                    ; preds = %119, %110
  br label %128

; <label>:128:                                    ; preds = %127
  %129 = load i32, i32* %7, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, i32* %7, align 4
  br label %78

; <label>:131:                                    ; preds = %78
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 5)
  %132 = add i64 %pgocount8, 1
  store i64 %132, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_compute_scalefacs_long, i64 0, i64 5)
  %133 = load double, double* %10, align 8
  ret double %133
}

; Function Attrs: nounwind uwtable
define void @VBR_iteration_loop_new(%struct.lame_global_flags*, [2 x double]*, double*, [2 x [576 x double]]*, [2 x %struct.III_psy_ratio]*, %struct.III_side_info_t*, [2 x [576 x i32]]*, [2 x %struct.III_scalefac_t]*) #0 {
  %9 = alloca %struct.lame_global_flags*, align 8
  %10 = alloca [2 x double]*, align 8
  %11 = alloca double*, align 8
  %12 = alloca [2 x [576 x double]]*, align 8
  %13 = alloca [2 x %struct.III_psy_ratio]*, align 8
  %14 = alloca %struct.III_side_info_t*, align 8
  %15 = alloca [2 x [576 x i32]]*, align 8
  %16 = alloca [2 x %struct.III_scalefac_t]*, align 8
  %17 = alloca [2 x [2 x %struct.III_psy_xmin]], align 16
  %18 = alloca double, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca %struct.III_psy_xmin, align 8
  %28 = alloca double, align 8
  %29 = alloca [576 x double], align 16
  %30 = alloca %struct.gr_info*, align 8
  %31 = alloca i32, align 4
  %32 = alloca double, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %9, align 8
  store [2 x double]* %1, [2 x double]** %10, align 8
  store double* %2, double** %11, align 8
  store [2 x [576 x double]]* %3, [2 x [576 x double]]** %12, align 8
  store [2 x %struct.III_psy_ratio]* %4, [2 x %struct.III_psy_ratio]** %13, align 8
  store %struct.III_side_info_t* %5, %struct.III_side_info_t** %14, align 8
  store [2 x [576 x i32]]* %6, [2 x [576 x i32]]** %15, align 8
  store [2 x %struct.III_scalefac_t]* %7, [2 x %struct.III_scalefac_t]** %16, align 8
  %33 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %34 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %35 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %15, align 8
  call void @iteration_init(%struct.lame_global_flags* %33, %struct.III_side_info_t* %34, [2 x [576 x i32]]* %35)
  %36 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %37 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %36, i32 0, i32 22
  %38 = load i32, i32* %37, align 4
  %39 = mul nsw i32 2, %38
  %40 = add nsw i32 -10, %39
  %41 = sitofp i32 %40 to double
  store double %41, double* %18, align 8
  %42 = load double, double* %18, align 8
  %43 = fdiv double %42, 1.000000e+01
  %44 = call double @pow(double 1.000000e+01, double %43) #6
  %45 = fptrunc double %44 to float
  store float %45, float* @masking_lower, align 4
  store float 1.000000e+00, float* @masking_lower, align 4
  store i32 0, i32* %25, align 4
  br label %46

; <label>:46:                                     ; preds = %455, %8
  %47 = load i32, i32* %25, align 4
  %48 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %49 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %48, i32 0, i32 45
  %50 = load i32, i32* %49, align 8
  %51 = icmp slt i32 %47, %50
  br i1 %51, label %52, label %459

; <label>:52:                                     ; preds = %46
  %53 = load i32, i32* @convert_mdct, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %67

; <label>:55:                                     ; preds = %52
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 15)
  %56 = add i64 %pgocount, 1
  store i64 %56, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 15)
  %57 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %58 = load i32, i32* %25, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %57, i64 %59
  %61 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %60, i32 0, i32 0
  %62 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %63 = load i32, i32* %25, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %62, i64 %64
  %66 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %65, i32 0, i32 0
  call void @ms_convert([576 x double]* %61, [576 x double]* %66)
  br label %67

; <label>:67:                                     ; preds = %55, %52
  store i32 0, i32* %24, align 4
  br label %68

; <label>:68:                                     ; preds = %451, %67
  %69 = load i32, i32* %24, align 4
  %70 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %71 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %70, i32 0, i32 46
  %72 = load i32, i32* %71, align 4
  %73 = icmp slt i32 %69, %72
  br i1 %73, label %74, label %454

; <label>:74:                                     ; preds = %68
  %75 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %76 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %75, i32 0, i32 4
  %77 = load i32, i32* %25, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* %76, i64 0, i64 %78
  %80 = getelementptr inbounds %struct.anon, %struct.anon* %79, i32 0, i32 0
  %81 = load i32, i32* %24, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %80, i64 0, i64 %82
  %84 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %83, i32 0, i32 0
  store %struct.gr_info* %84, %struct.gr_info** %30, align 8
  store i32 0, i32* %26, align 4
  %85 = load %struct.gr_info*, %struct.gr_info** %30, align 8
  %86 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %85, i32 0, i32 6
  %87 = load i32, i32* %86, align 8
  %88 = icmp eq i32 %87, 2
  %89 = zext i1 %88 to i32
  store i32 %89, i32* %31, align 4
  store i32 0, i32* %23, align 4
  br label %90

; <label>:90:                                     ; preds = %115, %74
  %91 = load i32, i32* %23, align 4
  %92 = icmp slt i32 %91, 576
  br i1 %92, label %93, label %118

; <label>:93:                                     ; preds = %90
  %pgocount1 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 0)
  %94 = add i64 %pgocount1, 1
  store i64 %94, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 0)
  %95 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %96 = load i32, i32* %25, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %95, i64 %97
  %99 = load i32, i32* %24, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %98, i64 0, i64 %100
  %102 = load i32, i32* %23, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [576 x double], [576 x double]* %101, i64 0, i64 %103
  %105 = load double, double* %104, align 8
  %106 = call double @fabs(double %105) #7
  store double %106, double* %32, align 8
  %107 = load double, double* %32, align 8
  %108 = call double @sqrt(double %107) #6
  %109 = load double, double* %32, align 8
  %110 = fmul double %108, %109
  %111 = call double @sqrt(double %110) #6
  %112 = load i32, i32* %23, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [576 x double], [576 x double]* %29, i64 0, i64 %113
  store double %111, double* %114, align 8
  br label %115

; <label>:115:                                    ; preds = %93
  %116 = load i32, i32* %23, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, i32* %23, align 4
  br label %90

; <label>:118:                                    ; preds = %90
  %119 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %120 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %121 = load i32, i32* %25, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %120, i64 %122
  %124 = load i32, i32* %24, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %123, i64 0, i64 %125
  %127 = getelementptr inbounds [576 x double], [576 x double]* %126, i32 0, i32 0
  %128 = load [2 x %struct.III_psy_ratio]*, [2 x %struct.III_psy_ratio]** %13, align 8
  %129 = load i32, i32* %25, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %128, i64 %130
  %132 = load i32, i32* %24, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %131, i64 0, i64 %133
  %135 = load %struct.gr_info*, %struct.gr_info** %30, align 8
  %136 = load i32, i32* %25, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds [2 x [2 x %struct.III_psy_xmin]], [2 x [2 x %struct.III_psy_xmin]]* %17, i64 0, i64 %137
  %139 = load i32, i32* %24, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [2 x %struct.III_psy_xmin], [2 x %struct.III_psy_xmin]* %138, i64 0, i64 %140
  %142 = call i32 @calc_xmin(%struct.lame_global_flags* %119, double* %127, %struct.III_psy_ratio* %134, %struct.gr_info* %135, %struct.III_psy_xmin* %141)
  store double 0.000000e+00, double* %28, align 8
  %143 = load i32, i32* %31, align 4
  %144 = icmp ne i32 %143, 0
  br i1 %144, label %145, label %243

; <label>:145:                                    ; preds = %118
  store i32 0, i32* %22, align 4
  br label %146

; <label>:146:                                    ; preds = %238, %145
  %147 = load i32, i32* %22, align 4
  %148 = icmp slt i32 %147, 12
  br i1 %148, label %149, label %242

; <label>:149:                                    ; preds = %146
  store i32 0, i32* %23, align 4
  br label %150

; <label>:150:                                    ; preds = %234, %149
  %151 = load i32, i32* %23, align 4
  %152 = icmp slt i32 %151, 3
  br i1 %152, label %153, label %237

; <label>:153:                                    ; preds = %150
  %154 = load i32, i32* %22, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds [14 x i32], [14 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 1), i64 0, i64 %155
  %157 = load i32, i32* %156, align 4
  store i32 %157, i32* %19, align 4
  %158 = load i32, i32* %22, align 4
  %159 = add nsw i32 %158, 1
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [14 x i32], [14 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 1), i64 0, i64 %160
  %162 = load i32, i32* %161, align 4
  store i32 %162, i32* %20, align 4
  %163 = load i32, i32* %20, align 4
  %164 = load i32, i32* %19, align 4
  %165 = sub nsw i32 %163, %164
  store i32 %165, i32* %21, align 4
  %166 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %167 = load i32, i32* %25, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %166, i64 %168
  %170 = load i32, i32* %24, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %169, i64 0, i64 %171
  %173 = load i32, i32* %19, align 4
  %174 = mul nsw i32 3, %173
  %175 = load i32, i32* %23, align 4
  %176 = add nsw i32 %174, %175
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [576 x double], [576 x double]* %172, i64 0, i64 %177
  %179 = load i32, i32* %19, align 4
  %180 = mul nsw i32 3, %179
  %181 = load i32, i32* %23, align 4
  %182 = add nsw i32 %180, %181
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds [576 x double], [576 x double]* %29, i64 0, i64 %183
  %185 = load i32, i32* %22, align 4
  %186 = load float, float* @masking_lower, align 4
  %187 = fpext float %186 to double
  %188 = load i32, i32* %25, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds [2 x [2 x %struct.III_psy_xmin]], [2 x [2 x %struct.III_psy_xmin]]* %17, i64 0, i64 %189
  %191 = load i32, i32* %24, align 4
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds [2 x %struct.III_psy_xmin], [2 x %struct.III_psy_xmin]* %190, i64 0, i64 %192
  %194 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %193, i32 0, i32 1
  %195 = load i32, i32* %22, align 4
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %194, i64 0, i64 %196
  %198 = load i32, i32* %23, align 4
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds [3 x double], [3 x double]* %197, i64 0, i64 %199
  %201 = load double, double* %200, align 8
  %202 = fmul double %187, %201
  %203 = load i32, i32* %21, align 4
  %204 = call double @find_scalefac(double* %178, double* %184, i32 3, i32 %185, double %202, i32 %203)
  %205 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %27, i32 0, i32 1
  %206 = load i32, i32* %22, align 4
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %205, i64 0, i64 %207
  %209 = load i32, i32* %23, align 4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [3 x double], [3 x double]* %208, i64 0, i64 %210
  store double %204, double* %211, align 8
  %212 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %27, i32 0, i32 1
  %213 = load i32, i32* %22, align 4
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %212, i64 0, i64 %214
  %216 = load i32, i32* %23, align 4
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds [3 x double], [3 x double]* %215, i64 0, i64 %217
  %219 = load double, double* %218, align 8
  %220 = load double, double* %28, align 8
  %221 = fcmp ogt double %219, %220
  br i1 %221, label %223, label %._crit_edge

._crit_edge:                                      ; preds = %153
  %pgocount2 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 2)
  %222 = add i64 %pgocount2, 1
  store i64 %222, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 2)
  br label %233

; <label>:223:                                    ; preds = %153
  %pgocount3 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 5)
  %224 = add i64 %pgocount3, 1
  store i64 %224, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 5)
  %225 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %27, i32 0, i32 1
  %226 = load i32, i32* %22, align 4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %225, i64 0, i64 %227
  %229 = load i32, i32* %23, align 4
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [3 x double], [3 x double]* %228, i64 0, i64 %230
  %232 = load double, double* %231, align 8
  store double %232, double* %28, align 8
  br label %233

; <label>:233:                                    ; preds = %._crit_edge, %223
  br label %234

; <label>:234:                                    ; preds = %233
  %235 = load i32, i32* %23, align 4
  %236 = add nsw i32 %235, 1
  store i32 %236, i32* %23, align 4
  br label %150

; <label>:237:                                    ; preds = %150
  br label %238

; <label>:238:                                    ; preds = %237
  %pgocount4 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 3)
  %239 = add i64 %pgocount4, 1
  store i64 %239, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 3)
  %240 = load i32, i32* %22, align 4
  %241 = add nsw i32 %240, 1
  store i32 %241, i32* %22, align 4
  br label %146

; <label>:242:                                    ; preds = %146
  br label %315

; <label>:243:                                    ; preds = %118
  store i32 0, i32* %22, align 4
  br label %244

; <label>:244:                                    ; preds = %310, %243
  %245 = load i32, i32* %22, align 4
  %246 = icmp slt i32 %245, 21
  br i1 %246, label %247, label %313

; <label>:247:                                    ; preds = %244
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 6)
  %248 = add i64 %pgocount5, 1
  store i64 %248, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 6)
  %249 = load i32, i32* %22, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %250
  %252 = load i32, i32* %251, align 4
  store i32 %252, i32* %19, align 4
  %253 = load i32, i32* %22, align 4
  %254 = add nsw i32 %253, 1
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %255
  %257 = load i32, i32* %256, align 4
  store i32 %257, i32* %20, align 4
  %258 = load i32, i32* %20, align 4
  %259 = load i32, i32* %19, align 4
  %260 = sub nsw i32 %258, %259
  store i32 %260, i32* %21, align 4
  %261 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %262 = load i32, i32* %25, align 4
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %261, i64 %263
  %265 = load i32, i32* %24, align 4
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %264, i64 0, i64 %266
  %268 = load i32, i32* %19, align 4
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds [576 x double], [576 x double]* %267, i64 0, i64 %269
  %271 = load i32, i32* %19, align 4
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds [576 x double], [576 x double]* %29, i64 0, i64 %272
  %274 = load i32, i32* %22, align 4
  %275 = load float, float* @masking_lower, align 4
  %276 = fpext float %275 to double
  %277 = load i32, i32* %25, align 4
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds [2 x [2 x %struct.III_psy_xmin]], [2 x [2 x %struct.III_psy_xmin]]* %17, i64 0, i64 %278
  %280 = load i32, i32* %24, align 4
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds [2 x %struct.III_psy_xmin], [2 x %struct.III_psy_xmin]* %279, i64 0, i64 %281
  %283 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %282, i32 0, i32 0
  %284 = load i32, i32* %22, align 4
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds [22 x double], [22 x double]* %283, i64 0, i64 %285
  %287 = load double, double* %286, align 8
  %288 = fmul double %276, %287
  %289 = load i32, i32* %21, align 4
  %290 = call double @find_scalefac(double* %270, double* %273, i32 1, i32 %274, double %288, i32 %289)
  %291 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %27, i32 0, i32 0
  %292 = load i32, i32* %22, align 4
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds [22 x double], [22 x double]* %291, i64 0, i64 %293
  store double %290, double* %294, align 8
  %295 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %27, i32 0, i32 0
  %296 = load i32, i32* %22, align 4
  %297 = sext i32 %296 to i64
  %298 = getelementptr inbounds [22 x double], [22 x double]* %295, i64 0, i64 %297
  %299 = load double, double* %298, align 8
  %300 = load double, double* %28, align 8
  %301 = fcmp ogt double %299, %300
  br i1 %301, label %302, label %309

; <label>:302:                                    ; preds = %247
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 8)
  %303 = add i64 %pgocount6, 1
  store i64 %303, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 8)
  %304 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %27, i32 0, i32 0
  %305 = load i32, i32* %22, align 4
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds [22 x double], [22 x double]* %304, i64 0, i64 %306
  %308 = load double, double* %307, align 8
  store double %308, double* %28, align 8
  br label %309

; <label>:309:                                    ; preds = %302, %247
  br label %310

; <label>:310:                                    ; preds = %309
  %311 = load i32, i32* %22, align 4
  %312 = add nsw i32 %311, 1
  store i32 %312, i32* %22, align 4
  br label %244

; <label>:313:                                    ; preds = %244
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 10)
  %314 = add i64 %pgocount7, 1
  store i64 %314, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 10)
  br label %315

; <label>:315:                                    ; preds = %313, %242
  %316 = load double, double* %28, align 8
  %317 = fmul double 4.000000e+00, %316
  %318 = fadd double %317, 2.100000e+02
  %319 = fadd double %318, 5.000000e-01
  %320 = call double @floor(double %319) #7
  %321 = fptoui double %320 to i32
  %322 = load %struct.gr_info*, %struct.gr_info** %30, align 8
  %323 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %322, i32 0, i32 3
  store i32 %321, i32* %323, align 4
  %324 = load i32, i32* %31, align 4
  %325 = icmp ne i32 %324, 0
  br i1 %325, label %326, label %394

; <label>:326:                                    ; preds = %315
  store i32 0, i32* %22, align 4
  br label %327

; <label>:327:                                    ; preds = %350, %326
  %328 = load i32, i32* %22, align 4
  %329 = icmp slt i32 %328, 12
  br i1 %329, label %330, label %354

; <label>:330:                                    ; preds = %327
  store i32 0, i32* %23, align 4
  br label %331

; <label>:331:                                    ; preds = %346, %330
  %332 = load i32, i32* %23, align 4
  %333 = icmp slt i32 %332, 3
  br i1 %333, label %334, label %349

; <label>:334:                                    ; preds = %331
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 1)
  %335 = add i64 %pgocount8, 1
  store i64 %335, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 1)
  %336 = load double, double* %28, align 8
  %337 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %27, i32 0, i32 1
  %338 = load i32, i32* %22, align 4
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %337, i64 0, i64 %339
  %341 = load i32, i32* %23, align 4
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds [3 x double], [3 x double]* %340, i64 0, i64 %342
  %344 = load double, double* %343, align 8
  %345 = fsub double %344, %336
  store double %345, double* %343, align 8
  br label %346

; <label>:346:                                    ; preds = %334
  %347 = load i32, i32* %23, align 4
  %348 = add nsw i32 %347, 1
  store i32 %348, i32* %23, align 4
  br label %331

; <label>:349:                                    ; preds = %331
  br label %350

; <label>:350:                                    ; preds = %349
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 4)
  %351 = add i64 %pgocount9, 1
  store i64 %351, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 4)
  %352 = load i32, i32* %22, align 4
  %353 = add nsw i32 %352, 1
  store i32 %353, i32* %22, align 4
  br label %327

; <label>:354:                                    ; preds = %327
  %355 = load %struct.gr_info*, %struct.gr_info** %30, align 8
  %356 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %355, i32 0, i32 13
  store i32 0, i32* %356, align 4
  %357 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %27, i32 0, i32 1
  %358 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %357, i32 0, i32 0
  %359 = load %struct.gr_info*, %struct.gr_info** %30, align 8
  %360 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %16, align 8
  %361 = load i32, i32* %25, align 4
  %362 = sext i32 %361 to i64
  %363 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %360, i64 %362
  %364 = load i32, i32* %24, align 4
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %363, i64 0, i64 %365
  %367 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %366, i32 0, i32 1
  %368 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %367, i32 0, i32 0
  %369 = call double @compute_scalefacs_short([3 x double]* %358, %struct.gr_info* %359, [3 x i32]* %368)
  %370 = fcmp ogt double %369, 0.000000e+00
  br i1 %370, label %371, label %392

; <label>:371:                                    ; preds = %354
  %372 = load %struct.gr_info*, %struct.gr_info** %30, align 8
  %373 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %372, i32 0, i32 13
  store i32 1, i32* %373, align 4
  %374 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %27, i32 0, i32 1
  %375 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %374, i32 0, i32 0
  %376 = load %struct.gr_info*, %struct.gr_info** %30, align 8
  %377 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %16, align 8
  %378 = load i32, i32* %25, align 4
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %377, i64 %379
  %381 = load i32, i32* %24, align 4
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %380, i64 0, i64 %382
  %384 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %383, i32 0, i32 1
  %385 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %384, i32 0, i32 0
  %386 = call double @compute_scalefacs_short([3 x double]* %375, %struct.gr_info* %376, [3 x i32]* %385)
  %387 = fcmp ogt double %386, 0.000000e+00
  br i1 %387, label %388, label %390

; <label>:388:                                    ; preds = %371
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 17)
  %389 = add i64 %pgocount10, 1
  store i64 %389, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 17)
  call void @exit(i32 32) #8
  unreachable

; <label>:390:                                    ; preds = %371
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 12)
  %391 = add i64 %pgocount11, 1
  store i64 %391, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 12)
  br label %392

; <label>:392:                                    ; preds = %390, %354
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 9)
  %393 = add i64 %pgocount12, 1
  store i64 %393, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 9)
  br label %450

; <label>:394:                                    ; preds = %315
  store i32 0, i32* %22, align 4
  br label %395

; <label>:395:                                    ; preds = %407, %394
  %396 = load i32, i32* %22, align 4
  %397 = icmp slt i32 %396, 21
  br i1 %397, label %398, label %410

; <label>:398:                                    ; preds = %395
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 7)
  %399 = add i64 %pgocount13, 1
  store i64 %399, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 7)
  %400 = load double, double* %28, align 8
  %401 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %27, i32 0, i32 0
  %402 = load i32, i32* %22, align 4
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds [22 x double], [22 x double]* %401, i64 0, i64 %403
  %405 = load double, double* %404, align 8
  %406 = fsub double %405, %400
  store double %406, double* %404, align 8
  br label %407

; <label>:407:                                    ; preds = %398
  %408 = load i32, i32* %22, align 4
  %409 = add nsw i32 %408, 1
  store i32 %409, i32* %22, align 4
  br label %395

; <label>:410:                                    ; preds = %395
  %411 = load %struct.gr_info*, %struct.gr_info** %30, align 8
  %412 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %411, i32 0, i32 13
  store i32 0, i32* %412, align 4
  %413 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %27, i32 0, i32 0
  %414 = getelementptr inbounds [22 x double], [22 x double]* %413, i32 0, i32 0
  %415 = load %struct.gr_info*, %struct.gr_info** %30, align 8
  %416 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %16, align 8
  %417 = load i32, i32* %25, align 4
  %418 = sext i32 %417 to i64
  %419 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %416, i64 %418
  %420 = load i32, i32* %24, align 4
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %419, i64 0, i64 %421
  %423 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %422, i32 0, i32 0
  %424 = getelementptr inbounds [22 x i32], [22 x i32]* %423, i32 0, i32 0
  %425 = call double @compute_scalefacs_long(double* %414, %struct.gr_info* %415, i32* %424)
  %426 = fcmp ogt double %425, 0.000000e+00
  br i1 %426, label %427, label %448

; <label>:427:                                    ; preds = %410
  %428 = load %struct.gr_info*, %struct.gr_info** %30, align 8
  %429 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %428, i32 0, i32 13
  store i32 1, i32* %429, align 4
  %430 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %27, i32 0, i32 0
  %431 = getelementptr inbounds [22 x double], [22 x double]* %430, i32 0, i32 0
  %432 = load %struct.gr_info*, %struct.gr_info** %30, align 8
  %433 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %16, align 8
  %434 = load i32, i32* %25, align 4
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %433, i64 %435
  %437 = load i32, i32* %24, align 4
  %438 = sext i32 %437 to i64
  %439 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %436, i64 0, i64 %438
  %440 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %439, i32 0, i32 0
  %441 = getelementptr inbounds [22 x i32], [22 x i32]* %440, i32 0, i32 0
  %442 = call double @compute_scalefacs_long(double* %431, %struct.gr_info* %432, i32* %441)
  %443 = fcmp ogt double %442, 0.000000e+00
  br i1 %443, label %444, label %446

; <label>:444:                                    ; preds = %427
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 18)
  %445 = add i64 %pgocount14, 1
  store i64 %445, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 18)
  call void @exit(i32 32) #8
  unreachable

; <label>:446:                                    ; preds = %427
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 13)
  %447 = add i64 %pgocount15, 1
  store i64 %447, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 13)
  br label %448

; <label>:448:                                    ; preds = %446, %410
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 11)
  %449 = add i64 %pgocount16, 1
  store i64 %449, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 11)
  br label %450

; <label>:450:                                    ; preds = %448, %392
  br label %451

; <label>:451:                                    ; preds = %450
  %452 = load i32, i32* %24, align 4
  %453 = add nsw i32 %452, 1
  store i32 %453, i32* %24, align 4
  br label %68

; <label>:454:                                    ; preds = %68
  br label %455

; <label>:455:                                    ; preds = %454
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 14)
  %456 = add i64 %pgocount17, 1
  store i64 %456, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 14)
  %457 = load i32, i32* %25, align 4
  %458 = add nsw i32 %457, 1
  store i32 %458, i32* %25, align 4
  br label %46

; <label>:459:                                    ; preds = %46
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 16)
  %460 = add i64 %pgocount18, 1
  store i64 %460, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_VBR_iteration_loop_new, i64 0, i64 16)
  ret void
}

declare void @iteration_init(%struct.lame_global_flags*, %struct.III_side_info_t*, [2 x [576 x i32]]*) #5

declare void @ms_convert([576 x double]*, [576 x double]*) #5

; Function Attrs: nounwind
declare double @sqrt(double) #1

declare i32 @calc_xmin(%struct.lame_global_flags*, double*, %struct.III_psy_ratio*, %struct.gr_info*, %struct.III_psy_xmin*) #5

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #6

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #6

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readnone }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

; ModuleID = 'tmp1.ll'
source_filename = "holmes.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Elm_s = type { i8*, i8, i8, i8, i8, i8*, i8*, i64, [19 x %struct.interp_t] }
%struct.interp_t = type { float, float, i8, i8, i8 }
%struct.klatt_frame_t = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.klatt_global_t = type { i32, i32, i32, i32, i64, i64, i64, i64 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.filter_t = type { float, float, float }
%struct.slope_t = type { float, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [63 x i8] c"$Id: holmes.c,v 1.13 1994/11/08 13:30:50 a904209 Exp a904209 $\00", align 1
@holmes_id = global i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str, i32 0, i32 0), align 8
@speed = global i32 1, align 4
@frac = global double 1.000000e+00, align 8
@Elements = external global [0 x %struct.Elm_s], align 8
@def_pars = external global %struct.klatt_frame_t, align 8
@klatt_global = external global %struct.klatt_global_t, align 8
@par_file = common global %struct._IO_FILE* null, align 8
@.str.1 = private unnamed_addr constant [11 x i8] c"# %s < %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"# %s >= %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"# %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"%c%6s\00", align 1
@Ep_name = external global [19 x i8*], align 16
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"%c%6.4g\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"%c%6d\00", align 1
@.str.8 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"f0\00", align 1
@.str.10 = private unnamed_addr constant [7 x i8] c" %6.4g\00", align 1
@jsru_file = common global %struct._IO_FILE* null, align 8
@.str.11 = private unnamed_addr constant [7 x i8] c"Holmes\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c"p\00", align 1
@.str.13 = private unnamed_addr constant [24 x i8] c"Parameter file for plot\00", align 1
@.str.14 = private unnamed_addr constant [2 x i8] c"j\00", align 1
@.str.15 = private unnamed_addr constant [32 x i8] c"Data for alternate synth (JSRU)\00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c"S\00", align 1
@.str.17 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.18 = private unnamed_addr constant [24 x i8] c"Speed (1.0 is 'normal')\00", align 1
@.str.19 = private unnamed_addr constant [2 x i8] c"K\00", align 1
@.str.20 = private unnamed_addr constant [4 x i8] c"%lg\00", align 1
@.str.21 = private unnamed_addr constant [28 x i8] c"Parameter filter 'fraction'\00", align 1
@help_only = external global i32, align 4
@.str.22 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_holmes = private constant [6 x i8] c"holmes"
@__profn_tmp1.ll_set_trans = private constant [17 x i8] c"tmp1.ll:set_trans"
@__profn_tmp1.ll_filter = private constant [14 x i8] c"tmp1.ll:filter"
@__profn_tmp1.ll_interpolate = private constant [19 x i8] c"tmp1.ll:interpolate"
@__profn_tmp1.ll_jsru_save = private constant [17 x i8] c"tmp1.ll:jsru_save"
@__profn_init_holmes = private constant [11 x i8] c"init_holmes"
@__profn_term_holmes = private constant [11 x i8] c"term_holmes"
@__profn_tmp1.ll_linear = private constant [14 x i8] c"tmp1.ll:linear"
@__profn_tmp1.ll_jsru_freq = private constant [17 x i8] c"tmp1.ll:jsru_freq"
@__profn_tmp1.ll_jsru_amp = private constant [16 x i8] c"tmp1.ll:jsru_amp"
@__profc_holmes = private global [39 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_holmes = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3647256257765048897, i64 360288527645863070, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i32 0, i32 0), i8* bitcast (i32 (i32, i8*, i32, i16*)* @holmes to i8*), i8* null, i32 39, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_set_trans = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_set_trans = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1798571409981966224, i64 67778923713, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_trans, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_filter = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_filter = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5938593540975081918, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_filter, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_interpolate = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_interpolate = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3697664192651470762, i64 54487158795, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_interpolate, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_jsru_save = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_jsru_save = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9009761337536696244, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_jsru_save, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_init_holmes = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_init_holmes = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3094853220088248952, i64 78937515388, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_init_holmes, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @init_holmes to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_term_holmes = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_term_holmes = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 626979431242368261, i64 36496524737, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_term_holmes, i32 0, i32 0), i8* bitcast (void ()* @term_holmes to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_linear = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_linear = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3452226230734780311, i64 42754363654, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_linear, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_jsru_freq = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_jsru_freq = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8366668597540881233, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_jsru_freq, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_jsru_amp = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_jsru_amp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4630398545458495543, i64 36496524737, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_jsru_amp, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [91 x i8] c"\97\01Xx\DAU\8CA\0A\800\0C\04\E9\87\04\AF~\A6\E4\90\D2H\92\D6$\FA~=\94Jo;\C3\EE\D6\C6\82\9EB\FA\BE1\1F\8E\91\C3@\7FS\88\03m\22\E9G\BD1\04Nw\BA\DD\D9\E1\C1DJ\91\EB\B8D\93\99G\93I\11l\1D\16\C3k5 \FD\05v\197\99", section "__llvm_prf_names"
@llvm.used = appending global [11 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_holmes to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_set_trans to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_filter to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_interpolate to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_jsru_save to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_init_holmes to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_term_holmes to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_linear to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_jsru_freq to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_jsru_amp to i8*), i8* getelementptr inbounds ([91 x i8], [91 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @holmes(i32, i8*, i32, i16*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16*, align 8
  %9 = alloca [19 x %struct.filter_t], align 16
  %10 = alloca %struct.klatt_frame_t, align 8
  %11 = alloca i16*, align 8
  %12 = alloca %struct.Elm_s*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca %struct.slope_t, align 4
  %17 = alloca %struct.slope_t, align 4
  %18 = alloca float, align 4
  %19 = alloca i32, align 4
  %20 = alloca %struct.Elm_s*, align 8
  %21 = alloca i32, align 4
  %22 = alloca %struct.Elm_s*, align 8
  %23 = alloca [19 x %struct.slope_t], align 16
  %24 = alloca [19 x %struct.slope_t], align 16
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca float, align 4
  %28 = alloca [19 x float], align 16
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca %struct.Elm_s*, align 8
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i16* %3, i16** %8, align 8
  %36 = load i16*, i16** %8, align 8
  store i16* %36, i16** %11, align 8
  store %struct.Elm_s* getelementptr inbounds ([0 x %struct.Elm_s], [0 x %struct.Elm_s]* @Elements, i64 0, i64 0), %struct.Elm_s** %12, align 8
  store i32 0, i32* %13, align 4
  store i32 0, i32* %14, align 4
  store i32 0, i32* %15, align 4
  %37 = load i64, i64* getelementptr inbounds (%struct.klatt_frame_t, %struct.klatt_frame_t* @def_pars, i32 0, i32 0), align 8
  %38 = sitofp i64 %37 to double
  %39 = fmul double 1.100000e+00, %38
  %40 = fptrunc double %39 to float
  store float %40, float* %18, align 4
  %41 = bitcast %struct.klatt_frame_t* %10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %41, i8* bitcast (%struct.klatt_frame_t* @def_pars to i8*), i64 320, i32 8, i1 false)
  %42 = load %struct.Elm_s*, %struct.Elm_s** %12, align 8
  %43 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %42, i32 0, i32 8
  %44 = getelementptr inbounds [19 x %struct.interp_t], [19 x %struct.interp_t]* %43, i64 0, i64 0
  %45 = getelementptr inbounds %struct.interp_t, %struct.interp_t* %44, i32 0, i32 0
  %46 = load float, float* %45, align 8
  %47 = fptosi float %46 to i64
  %48 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 16
  store i64 %47, i64* %48, align 8
  %49 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 3
  store i64 60, i64* %49, align 8
  %50 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 25
  store i64 60, i64* %50, align 8
  %51 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 5
  store i64 90, i64* %51, align 8
  %52 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 27
  store i64 90, i64* %52, align 8
  %53 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 7
  store i64 150, i64* %53, align 8
  %54 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 29
  store i64 150, i64* %54, align 8
  %55 = load i64, i64* getelementptr inbounds (%struct.klatt_frame_t, %struct.klatt_frame_t* @def_pars, i32 0, i32 31), align 8
  %56 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 31
  store i64 %55, i64* %56, align 8
  call void @parwave_init(%struct.klatt_global_t* @klatt_global)
  %57 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %16, i32 0, i32 1
  store i32 40, i32* %57, align 4
  %58 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %17, i32 0, i32 1
  store i32 40, i32* %58, align 4
  %59 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %17, i32 0, i32 0
  store float 0.000000e+00, float* %59, align 4
  store i32 0, i32* %19, align 4
  br label %60

; <label>:60:                                     ; preds = %88, %4
  %61 = load i32, i32* %19, align 4
  %62 = icmp slt i32 %61, 19
  br i1 %62, label %63, label %92

; <label>:63:                                     ; preds = %60
  %64 = load %struct.Elm_s*, %struct.Elm_s** %12, align 8
  %65 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %64, i32 0, i32 8
  %66 = load i32, i32* %19, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [19 x %struct.interp_t], [19 x %struct.interp_t]* %65, i64 0, i64 %67
  %69 = getelementptr inbounds %struct.interp_t, %struct.interp_t* %68, i32 0, i32 0
  %70 = load float, float* %69, align 4
  %71 = load i32, i32* %19, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [19 x %struct.filter_t], [19 x %struct.filter_t]* %9, i64 0, i64 %72
  %74 = getelementptr inbounds %struct.filter_t, %struct.filter_t* %73, i32 0, i32 2
  store float %70, float* %74, align 4
  %75 = load double, double* @frac, align 8
  %76 = fptrunc double %75 to float
  %77 = load i32, i32* %19, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [19 x %struct.filter_t], [19 x %struct.filter_t]* %9, i64 0, i64 %78
  %80 = getelementptr inbounds %struct.filter_t, %struct.filter_t* %79, i32 0, i32 0
  store float %76, float* %80, align 4
  %81 = load double, double* @frac, align 8
  %82 = fptrunc double %81 to float
  %83 = fsub float 1.000000e+00, %82
  %84 = load i32, i32* %19, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [19 x %struct.filter_t], [19 x %struct.filter_t]* %9, i64 0, i64 %85
  %87 = getelementptr inbounds %struct.filter_t, %struct.filter_t* %86, i32 0, i32 1
  store float %83, float* %87, align 4
  br label %88

; <label>:88:                                     ; preds = %63
  %pgocount = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 21)
  %89 = add i64 %pgocount, 1
  store i64 %89, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 21)
  %90 = load i32, i32* %19, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %19, align 4
  br label %60

; <label>:92:                                     ; preds = %60
  br label %93

; <label>:93:                                     ; preds = %687, %92
  %94 = load i32, i32* %13, align 4
  %95 = load i32, i32* %5, align 4
  %96 = icmp ult i32 %94, %95
  br i1 %96, label %97, label %690

; <label>:97:                                     ; preds = %93
  %98 = load i8*, i8** %6, align 8
  %99 = load i32, i32* %13, align 4
  %100 = add i32 %99, 1
  store i32 %100, i32* %13, align 4
  %101 = zext i32 %99 to i64
  %102 = getelementptr inbounds i8, i8* %98, i64 %101
  %103 = load i8, i8* %102, align 1
  %104 = zext i8 %103 to i64
  %105 = getelementptr inbounds [0 x %struct.Elm_s], [0 x %struct.Elm_s]* @Elements, i64 0, i64 %104
  store %struct.Elm_s* %105, %struct.Elm_s** %20, align 8
  %106 = load i8*, i8** %6, align 8
  %107 = load i32, i32* %13, align 4
  %108 = add i32 %107, 1
  store i32 %108, i32* %13, align 4
  %109 = zext i32 %107 to i64
  %110 = getelementptr inbounds i8, i8* %106, i64 %109
  %111 = load i8, i8* %110, align 1
  %112 = zext i8 %111 to i32
  store i32 %112, i32* %21, align 4
  %113 = load i32, i32* %13, align 4
  %114 = add i32 %113, 1
  store i32 %114, i32* %13, align 4
  %115 = load i32, i32* %21, align 4
  %116 = icmp ugt i32 %115, 0
  br i1 %116, label %117, label %687

; <label>:117:                                    ; preds = %97
  %118 = load i32, i32* %13, align 4
  %119 = load i32, i32* %5, align 4
  %120 = icmp ult i32 %118, %119
  br i1 %120, label %121, label %129

; <label>:121:                                    ; preds = %117
  %122 = load i8*, i8** %6, align 8
  %123 = load i32, i32* %13, align 4
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds i8, i8* %122, i64 %124
  %126 = load i8, i8* %125, align 1
  %127 = zext i8 %126 to i64
  %128 = getelementptr inbounds [0 x %struct.Elm_s], [0 x %struct.Elm_s]* @Elements, i64 0, i64 %127
  br label %131

; <label>:129:                                    ; preds = %117
  %pgocount1 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 25)
  %130 = add i64 %pgocount1, 1
  store i64 %130, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 25)
  br label %131

; <label>:131:                                    ; preds = %129, %121
  %132 = phi %struct.Elm_s* [ %128, %121 ], [ getelementptr inbounds ([0 x %struct.Elm_s], [0 x %struct.Elm_s]* @Elements, i64 0, i64 0), %129 ]
  store %struct.Elm_s* %132, %struct.Elm_s** %22, align 8
  %133 = load %struct.Elm_s*, %struct.Elm_s** %20, align 8
  %134 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %133, i32 0, i32 1
  %135 = load i8, i8* %134, align 8
  %136 = sext i8 %135 to i32
  %137 = load %struct.Elm_s*, %struct.Elm_s** %12, align 8
  %138 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %137, i32 0, i32 1
  %139 = load i8, i8* %138, align 8
  %140 = sext i8 %139 to i32
  %141 = icmp sgt i32 %136, %140
  br i1 %141, label %142, label %159

; <label>:142:                                    ; preds = %131
  %143 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %144 = icmp ne %struct._IO_FILE* %143, null
  br i1 %144, label %145, label %155

; <label>:145:                                    ; preds = %142
  %pgocount2 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 29)
  %146 = add i64 %pgocount2, 1
  store i64 %146, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 29)
  %147 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %148 = load %struct.Elm_s*, %struct.Elm_s** %12, align 8
  %149 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %148, i32 0, i32 0
  %150 = load i8*, i8** %149, align 8
  %151 = load %struct.Elm_s*, %struct.Elm_s** %20, align 8
  %152 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %151, i32 0, i32 0
  %153 = load i8*, i8** %152, align 8
  %154 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %147, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i8* %150, i8* %153)
  br label %155

; <label>:155:                                    ; preds = %145, %142
  %156 = getelementptr inbounds [19 x %struct.slope_t], [19 x %struct.slope_t]* %23, i32 0, i32 0
  %157 = load %struct.Elm_s*, %struct.Elm_s** %20, align 8
  %158 = load %struct.Elm_s*, %struct.Elm_s** %12, align 8
  call void @set_trans(%struct.slope_t* %156, %struct.Elm_s* %157, %struct.Elm_s* %158, i32 0, i32 115)
  br label %177

; <label>:159:                                    ; preds = %131
  %160 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %161 = icmp ne %struct._IO_FILE* %160, null
  br i1 %161, label %162, label %172

; <label>:162:                                    ; preds = %159
  %pgocount3 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 30)
  %163 = add i64 %pgocount3, 1
  store i64 %163, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 30)
  %164 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %165 = load %struct.Elm_s*, %struct.Elm_s** %12, align 8
  %166 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %165, i32 0, i32 0
  %167 = load i8*, i8** %166, align 8
  %168 = load %struct.Elm_s*, %struct.Elm_s** %20, align 8
  %169 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %168, i32 0, i32 0
  %170 = load i8*, i8** %169, align 8
  %171 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %164, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i8* %167, i8* %170)
  br label %172

; <label>:172:                                    ; preds = %162, %159
  %pgocount4 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 26)
  %173 = add i64 %pgocount4, 1
  store i64 %173, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 26)
  %174 = getelementptr inbounds [19 x %struct.slope_t], [19 x %struct.slope_t]* %23, i32 0, i32 0
  %175 = load %struct.Elm_s*, %struct.Elm_s** %12, align 8
  %176 = load %struct.Elm_s*, %struct.Elm_s** %20, align 8
  call void @set_trans(%struct.slope_t* %174, %struct.Elm_s* %175, %struct.Elm_s* %176, i32 1, i32 115)
  br label %177

; <label>:177:                                    ; preds = %172, %155
  %178 = load %struct.Elm_s*, %struct.Elm_s** %22, align 8
  %179 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %178, i32 0, i32 1
  %180 = load i8, i8* %179, align 8
  %181 = sext i8 %180 to i32
  %182 = load %struct.Elm_s*, %struct.Elm_s** %20, align 8
  %183 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %182, i32 0, i32 1
  %184 = load i8, i8* %183, align 8
  %185 = sext i8 %184 to i32
  %186 = icmp sgt i32 %181, %185
  br i1 %186, label %187, label %205

; <label>:187:                                    ; preds = %177
  %188 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %189 = icmp ne %struct._IO_FILE* %188, null
  br i1 %189, label %190, label %200

; <label>:190:                                    ; preds = %187
  %pgocount5 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 31)
  %191 = add i64 %pgocount5, 1
  store i64 %191, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 31)
  %192 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %193 = load %struct.Elm_s*, %struct.Elm_s** %20, align 8
  %194 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %193, i32 0, i32 0
  %195 = load i8*, i8** %194, align 8
  %196 = load %struct.Elm_s*, %struct.Elm_s** %22, align 8
  %197 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %196, i32 0, i32 0
  %198 = load i8*, i8** %197, align 8
  %199 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %192, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i8* %195, i8* %198)
  br label %200

; <label>:200:                                    ; preds = %190, %187
  %pgocount6 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 27)
  %201 = add i64 %pgocount6, 1
  store i64 %201, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 27)
  %202 = getelementptr inbounds [19 x %struct.slope_t], [19 x %struct.slope_t]* %24, i32 0, i32 0
  %203 = load %struct.Elm_s*, %struct.Elm_s** %22, align 8
  %204 = load %struct.Elm_s*, %struct.Elm_s** %20, align 8
  call void @set_trans(%struct.slope_t* %202, %struct.Elm_s* %203, %struct.Elm_s* %204, i32 1, i32 101)
  br label %223

; <label>:205:                                    ; preds = %177
  %206 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %207 = icmp ne %struct._IO_FILE* %206, null
  br i1 %207, label %208, label %218

; <label>:208:                                    ; preds = %205
  %pgocount7 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 32)
  %209 = add i64 %pgocount7, 1
  store i64 %209, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 32)
  %210 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %211 = load %struct.Elm_s*, %struct.Elm_s** %20, align 8
  %212 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %211, i32 0, i32 0
  %213 = load i8*, i8** %212, align 8
  %214 = load %struct.Elm_s*, %struct.Elm_s** %22, align 8
  %215 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %214, i32 0, i32 0
  %216 = load i8*, i8** %215, align 8
  %217 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %210, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i8* %213, i8* %216)
  br label %218

; <label>:218:                                    ; preds = %208, %205
  %pgocount8 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 28)
  %219 = add i64 %pgocount8, 1
  store i64 %219, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 28)
  %220 = getelementptr inbounds [19 x %struct.slope_t], [19 x %struct.slope_t]* %24, i32 0, i32 0
  %221 = load %struct.Elm_s*, %struct.Elm_s** %20, align 8
  %222 = load %struct.Elm_s*, %struct.Elm_s** %22, align 8
  call void @set_trans(%struct.slope_t* %220, %struct.Elm_s* %221, %struct.Elm_s* %222, i32 0, i32 101)
  br label %223

; <label>:223:                                    ; preds = %218, %200
  %224 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %225 = icmp ne %struct._IO_FILE* %224, null
  br i1 %225, label %226, label %302

; <label>:226:                                    ; preds = %223
  %227 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %228 = load %struct.Elm_s*, %struct.Elm_s** %20, align 8
  %229 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %228, i32 0, i32 0
  %230 = load i8*, i8** %229, align 8
  %231 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %227, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i8* %230)
  store i32 0, i32* %26, align 4
  br label %232

; <label>:232:                                    ; preds = %247, %226
  %233 = load i32, i32* %26, align 4
  %234 = icmp slt i32 %233, 19
  br i1 %234, label %235, label %251

; <label>:235:                                    ; preds = %232
  %236 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %237 = load i32, i32* %26, align 4
  %238 = icmp ne i32 %237, 0
  %239 = zext i1 %238 to i64
  %pgocount9 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 34)
  %240 = add i64 %pgocount9, %239
  store i64 %240, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 34)
  %241 = select i1 %238, i32 32, i32 35
  %242 = load i32, i32* %26, align 4
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds [19 x i8*], [19 x i8*]* @Ep_name, i64 0, i64 %243
  %245 = load i8*, i8** %244, align 8
  %246 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %236, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0), i32 %241, i8* %245)
  br label %247

; <label>:247:                                    ; preds = %235
  %pgocount10 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 11)
  %248 = add i64 %pgocount10, 1
  store i64 %248, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 11)
  %249 = load i32, i32* %26, align 4
  %250 = add nsw i32 %249, 1
  store i32 %250, i32* %26, align 4
  br label %232

; <label>:251:                                    ; preds = %232
  %252 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %253 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %252, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  store i32 0, i32* %26, align 4
  br label %254

; <label>:254:                                    ; preds = %271, %251
  %255 = load i32, i32* %26, align 4
  %256 = icmp slt i32 %255, 19
  br i1 %256, label %257, label %275

; <label>:257:                                    ; preds = %254
  %258 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %259 = load i32, i32* %26, align 4
  %260 = icmp ne i32 %259, 0
  %261 = zext i1 %260 to i64
  %pgocount11 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 35)
  %262 = add i64 %pgocount11, %261
  store i64 %262, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 35)
  %263 = select i1 %260, i32 32, i32 35
  %264 = load i32, i32* %26, align 4
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds [19 x %struct.slope_t], [19 x %struct.slope_t]* %23, i64 0, i64 %265
  %267 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %266, i32 0, i32 0
  %268 = load float, float* %267, align 8
  %269 = fpext float %268 to double
  %270 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %258, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i32 0, i32 0), i32 %263, double %269)
  br label %271

; <label>:271:                                    ; preds = %257
  %pgocount12 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 12)
  %272 = add i64 %pgocount12, 1
  store i64 %272, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 12)
  %273 = load i32, i32* %26, align 4
  %274 = add nsw i32 %273, 1
  store i32 %274, i32* %26, align 4
  br label %254

; <label>:275:                                    ; preds = %254
  %276 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %277 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %276, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  store i32 0, i32* %26, align 4
  br label %278

; <label>:278:                                    ; preds = %294, %275
  %279 = load i32, i32* %26, align 4
  %280 = icmp slt i32 %279, 19
  br i1 %280, label %281, label %298

; <label>:281:                                    ; preds = %278
  %282 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %283 = load i32, i32* %26, align 4
  %284 = icmp ne i32 %283, 0
  %285 = zext i1 %284 to i64
  %pgocount13 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 36)
  %286 = add i64 %pgocount13, %285
  store i64 %286, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 36)
  %287 = select i1 %284, i32 32, i32 35
  %288 = load i32, i32* %26, align 4
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds [19 x %struct.slope_t], [19 x %struct.slope_t]* %23, i64 0, i64 %289
  %291 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %290, i32 0, i32 1
  %292 = load i32, i32* %291, align 4
  %293 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %282, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0), i32 %287, i32 %292)
  br label %294

; <label>:294:                                    ; preds = %281
  %pgocount14 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 13)
  %295 = add i64 %pgocount14, 1
  store i64 %295, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 13)
  %296 = load i32, i32* %26, align 4
  %297 = add nsw i32 %296, 1
  store i32 %297, i32* %26, align 4
  br label %278

; <label>:298:                                    ; preds = %278
  %pgocount15 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 23)
  %299 = add i64 %pgocount15, 1
  store i64 %299, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 23)
  %300 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %301 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %300, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  br label %302

; <label>:302:                                    ; preds = %298, %223
  store i32 0, i32* %25, align 4
  br label %303

; <label>:303:                                    ; preds = %628, %302
  %304 = load i32, i32* %25, align 4
  %305 = load i32, i32* %21, align 4
  %306 = icmp ult i32 %304, %305
  br i1 %306, label %307, label %634

; <label>:307:                                    ; preds = %303
  %308 = load float, float* %18, align 4
  %309 = fpext float %308 to double
  %310 = fmul double %309, 8.000000e-01
  %311 = fptrunc double %310 to float
  store float %311, float* %27, align 4
  %312 = load i32, i32* %14, align 4
  %313 = load i32, i32* %15, align 4
  %314 = icmp eq i32 %312, %313
  br i1 %314, label %315, label %452

; <label>:315:                                    ; preds = %307
  %316 = load i32, i32* %13, align 4
  store i32 %316, i32* %30, align 4
  %317 = bitcast %struct.slope_t* %16 to i8*
  %318 = bitcast %struct.slope_t* %17 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %317, i8* %318, i64 8, i32 4, i1 false)
  store i32 0, i32* %14, align 4
  %319 = load i32, i32* %21, align 4
  store i32 %319, i32* %15, align 4
  br label %320

; <label>:320:                                    ; preds = %446, %315
  %321 = load i32, i32* %30, align 4
  %322 = load i32, i32* %5, align 4
  %323 = icmp ule i32 %321, %322
  br i1 %323, label %324, label %450

; <label>:324:                                    ; preds = %320
  %325 = load i32, i32* %30, align 4
  %326 = load i32, i32* %5, align 4
  %327 = icmp ult i32 %325, %326
  br i1 %327, label %328, label %337

; <label>:328:                                    ; preds = %324
  %329 = load i8*, i8** %6, align 8
  %330 = load i32, i32* %30, align 4
  %331 = add i32 %330, 1
  store i32 %331, i32* %30, align 4
  %332 = zext i32 %330 to i64
  %333 = getelementptr inbounds i8, i8* %329, i64 %332
  %334 = load i8, i8* %333, align 1
  %335 = zext i8 %334 to i64
  %336 = getelementptr inbounds [0 x %struct.Elm_s], [0 x %struct.Elm_s]* @Elements, i64 0, i64 %335
  br label %339

; <label>:337:                                    ; preds = %324
  %pgocount16 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 6)
  %338 = add i64 %pgocount16, 1
  store i64 %338, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 6)
  br label %339

; <label>:339:                                    ; preds = %337, %328
  %340 = phi %struct.Elm_s* [ %336, %328 ], [ getelementptr inbounds ([0 x %struct.Elm_s], [0 x %struct.Elm_s]* @Elements, i64 0, i64 0), %337 ]
  store %struct.Elm_s* %340, %struct.Elm_s** %31, align 8
  %341 = load i32, i32* %30, align 4
  %342 = load i32, i32* %5, align 4
  %343 = icmp ult i32 %341, %342
  br i1 %343, label %344, label %352

; <label>:344:                                    ; preds = %339
  %345 = load i8*, i8** %6, align 8
  %346 = load i32, i32* %30, align 4
  %347 = add i32 %346, 1
  store i32 %347, i32* %30, align 4
  %348 = zext i32 %346 to i64
  %349 = getelementptr inbounds i8, i8* %345, i64 %348
  %350 = load i8, i8* %349, align 1
  %351 = zext i8 %350 to i32
  br label %354

; <label>:352:                                    ; preds = %339
  %pgocount17 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 7)
  %353 = add i64 %pgocount17, 1
  store i64 %353, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 7)
  br label %354

; <label>:354:                                    ; preds = %352, %344
  %355 = phi i32 [ %351, %344 ], [ 0, %352 ]
  store i32 %355, i32* %32, align 4
  %356 = load i32, i32* %30, align 4
  %357 = load i32, i32* %5, align 4
  %358 = icmp ult i32 %356, %357
  br i1 %358, label %359, label %368

; <label>:359:                                    ; preds = %354
  %pgocount18 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 8)
  %360 = add i64 %pgocount18, 1
  store i64 %360, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 8)
  %361 = load i8*, i8** %6, align 8
  %362 = load i32, i32* %30, align 4
  %363 = add i32 %362, 1
  store i32 %363, i32* %30, align 4
  %364 = zext i32 %362 to i64
  %365 = getelementptr inbounds i8, i8* %361, i64 %364
  %366 = load i8, i8* %365, align 1
  %367 = zext i8 %366 to i32
  br label %370

; <label>:368:                                    ; preds = %354
  %pgocount19 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 9)
  %369 = add i64 %pgocount19, 1
  store i64 %369, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 9)
  br label %370

; <label>:370:                                    ; preds = %368, %359
  %371 = phi i32 [ %367, %359 ], [ 3, %368 ]
  store i32 %371, i32* %33, align 4
  %372 = load i32, i32* %33, align 4
  %373 = icmp ne i32 %372, 0
  br i1 %373, label %381, label %374

; <label>:374:                                    ; preds = %370
  %pgocount20 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 5)
  %375 = add i64 %pgocount20, 1
  store i64 %375, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 5)
  %376 = load %struct.Elm_s*, %struct.Elm_s** %31, align 8
  %377 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %376, i32 0, i32 7
  %378 = load i64, i64* %377, align 8
  %379 = and i64 %378, 268435456
  %380 = icmp ne i64 %379, 0
  br i1 %380, label %381, label %446

; <label>:381:                                    ; preds = %374, %370
  store i32 0, i32* %34, align 4
  %382 = load i32, i32* %33, align 4
  %383 = icmp ne i32 %382, 0
  br i1 %383, label %384, label %390

; <label>:384:                                    ; preds = %381
  %pgocount21 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 19)
  %385 = add i64 %pgocount21, 1
  store i64 %385, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 19)
  %386 = load i32, i32* %33, align 4
  %387 = uitofp i32 %386 to float
  %388 = fdiv float %387, 3.000000e+00
  %389 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %17, i32 0, i32 0
  store float %388, float* %389, align 4
  br label %393

; <label>:390:                                    ; preds = %381
  %pgocount22 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 20)
  %391 = add i64 %pgocount22, 1
  store i64 %391, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 20)
  %392 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %17, i32 0, i32 0
  store float 0x3FB99999A0000000, float* %392, align 4
  br label %393

; <label>:393:                                    ; preds = %390, %384
  br label %394

; <label>:394:                                    ; preds = %439, %393
  %395 = load i32, i32* %32, align 4
  %396 = load i32, i32* %34, align 4
  %397 = add i32 %396, %395
  store i32 %397, i32* %34, align 4
  %398 = load i32, i32* %30, align 4
  %399 = load i32, i32* %5, align 4
  %400 = icmp ult i32 %398, %399
  br i1 %400, label %401, label %411

; <label>:401:                                    ; preds = %394
  %pgocount23 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 2)
  %402 = add i64 %pgocount23, 1
  store i64 %402, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 2)
  %403 = load i8*, i8** %6, align 8
  %404 = load i32, i32* %30, align 4
  %405 = add i32 %404, 1
  store i32 %405, i32* %30, align 4
  %406 = zext i32 %404 to i64
  %407 = getelementptr inbounds i8, i8* %403, i64 %406
  %408 = load i8, i8* %407, align 1
  %409 = zext i8 %408 to i64
  %410 = getelementptr inbounds [0 x %struct.Elm_s], [0 x %struct.Elm_s]* @Elements, i64 0, i64 %409
  br label %413

; <label>:411:                                    ; preds = %394
  %pgocount24 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 3)
  %412 = add i64 %pgocount24, 1
  store i64 %412, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 3)
  br label %413

; <label>:413:                                    ; preds = %411, %401
  %414 = phi %struct.Elm_s* [ %410, %401 ], [ getelementptr inbounds ([0 x %struct.Elm_s], [0 x %struct.Elm_s]* @Elements, i64 0, i64 0), %411 ]
  store %struct.Elm_s* %414, %struct.Elm_s** %31, align 8
  %415 = load i8*, i8** %6, align 8
  %416 = load i32, i32* %30, align 4
  %417 = add i32 %416, 1
  store i32 %417, i32* %30, align 4
  %418 = zext i32 %416 to i64
  %419 = getelementptr inbounds i8, i8* %415, i64 %418
  %420 = load i8, i8* %419, align 1
  %421 = zext i8 %420 to i32
  store i32 %421, i32* %32, align 4
  br label %422

; <label>:422:                                    ; preds = %413
  %423 = load %struct.Elm_s*, %struct.Elm_s** %31, align 8
  %424 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %423, i32 0, i32 7
  %425 = load i64, i64* %424, align 8
  %426 = and i64 %425, 268435456
  %427 = icmp ne i64 %426, 0
  br i1 %427, label %428, label %439

; <label>:428:                                    ; preds = %422
  %pgocount25 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 4)
  %429 = add i64 %pgocount25, 1
  store i64 %429, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 4)
  %430 = load i8*, i8** %6, align 8
  %431 = load i32, i32* %30, align 4
  %432 = add i32 %431, 1
  store i32 %432, i32* %30, align 4
  %433 = zext i32 %431 to i64
  %434 = getelementptr inbounds i8, i8* %430, i64 %433
  %435 = load i8, i8* %434, align 1
  %436 = zext i8 %435 to i32
  %437 = load i32, i32* %33, align 4
  %438 = icmp eq i32 %436, %437
  br label %439

; <label>:439:                                    ; preds = %428, %422
  %440 = phi i1 [ false, %422 ], [ %438, %428 ]
  br i1 %440, label %394, label %441

; <label>:441:                                    ; preds = %439
  %442 = load i32, i32* %34, align 4
  %443 = udiv i32 %442, 2
  %444 = load i32, i32* %15, align 4
  %445 = add i32 %444, %443
  store i32 %445, i32* %15, align 4
  br label %450

; <label>:446:                                    ; preds = %374
  %447 = load i32, i32* %32, align 4
  %448 = load i32, i32* %15, align 4
  %449 = add i32 %448, %447
  store i32 %449, i32* %15, align 4
  br label %320

; <label>:450:                                    ; preds = %441, %320
  %pgocount26 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 18)
  %451 = add i64 %pgocount26, 1
  store i64 %451, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 18)
  br label %452

; <label>:452:                                    ; preds = %450, %307
  store i32 0, i32* %29, align 4
  br label %453

; <label>:453:                                    ; preds = %488, %452
  %454 = load i32, i32* %29, align 4
  %455 = icmp slt i32 %454, 19
  br i1 %455, label %456, label %492

; <label>:456:                                    ; preds = %453
  %457 = getelementptr inbounds [19 x %struct.filter_t], [19 x %struct.filter_t]* %9, i32 0, i32 0
  %458 = load i32, i32* %29, align 4
  %459 = sext i32 %458 to i64
  %460 = getelementptr inbounds %struct.filter_t, %struct.filter_t* %457, i64 %459
  %461 = load %struct.Elm_s*, %struct.Elm_s** %20, align 8
  %462 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %461, i32 0, i32 0
  %463 = load i8*, i8** %462, align 8
  %464 = load i32, i32* %29, align 4
  %465 = sext i32 %464 to i64
  %466 = getelementptr inbounds [19 x i8*], [19 x i8*]* @Ep_name, i64 0, i64 %465
  %467 = load i8*, i8** %466, align 8
  %468 = load i32, i32* %29, align 4
  %469 = sext i32 %468 to i64
  %470 = getelementptr inbounds [19 x %struct.slope_t], [19 x %struct.slope_t]* %23, i64 0, i64 %469
  %471 = load i32, i32* %29, align 4
  %472 = sext i32 %471 to i64
  %473 = getelementptr inbounds [19 x %struct.slope_t], [19 x %struct.slope_t]* %24, i64 0, i64 %472
  %474 = load %struct.Elm_s*, %struct.Elm_s** %20, align 8
  %475 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %474, i32 0, i32 8
  %476 = load i32, i32* %29, align 4
  %477 = sext i32 %476 to i64
  %478 = getelementptr inbounds [19 x %struct.interp_t], [19 x %struct.interp_t]* %475, i64 0, i64 %477
  %479 = getelementptr inbounds %struct.interp_t, %struct.interp_t* %478, i32 0, i32 0
  %480 = load float, float* %479, align 4
  %481 = load i32, i32* %25, align 4
  %482 = load i32, i32* %21, align 4
  %483 = call float @interpolate(i8* %463, i8* %467, %struct.slope_t* %470, %struct.slope_t* %473, float %480, i32 %481, i32 %482)
  %484 = call float @filter(%struct.filter_t* %460, float %483)
  %485 = load i32, i32* %29, align 4
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 %486
  store float %484, float* %487, align 4
  br label %488

; <label>:488:                                    ; preds = %456
  %pgocount27 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 0)
  %489 = add i64 %pgocount27, 1
  store i64 %489, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 0)
  %490 = load i32, i32* %29, align 4
  %491 = add nsw i32 %490, 1
  store i32 %491, i32* %29, align 4
  br label %453

; <label>:492:                                    ; preds = %453
  %493 = load float, float* %27, align 4
  %494 = load float, float* %18, align 4
  %495 = load float, float* %27, align 4
  %496 = fsub float %494, %495
  %497 = load i32, i32* %14, align 4
  %498 = load i32, i32* %15, align 4
  %499 = call float @interpolate(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), %struct.slope_t* %16, %struct.slope_t* %17, float 0.000000e+00, i32 %497, i32 %498)
  %500 = fmul float %496, %499
  %501 = fadd float %493, %500
  %502 = fptosi float %501 to i64
  %503 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 0
  store i64 %502, i64* %503, align 8
  %504 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 15
  %505 = load float, float* %504, align 4
  %506 = fptosi float %505 to i64
  %507 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 38
  store i64 %506, i64* %507, align 8
  %508 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 1
  store i64 %506, i64* %508, align 8
  %509 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 18
  %510 = load float, float* %509, align 8
  %511 = fptosi float %510 to i64
  %512 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 22
  store i64 %511, i64* %512, align 8
  %513 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 0
  %514 = load float, float* %513, align 16
  %515 = fptosi float %514 to i64
  %516 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 14
  store i64 %515, i64* %516, align 8
  %517 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 17
  %518 = load float, float* %517, align 4
  %519 = fptosi float %518 to i64
  %520 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 18
  store i64 %519, i64* %520, align 8
  %521 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 16
  %522 = load float, float* %521, align 16
  %523 = fptosi float %522 to i64
  %524 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 20
  store i64 %523, i64* %524, align 8
  %525 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 4
  %526 = load float, float* %525, align 16
  %527 = fptosi float %526 to i64
  %528 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 3
  store i64 %527, i64* %528, align 8
  %529 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 25
  store i64 %527, i64* %529, align 8
  %530 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 5
  %531 = load float, float* %530, align 4
  %532 = fptosi float %531 to i64
  %533 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 5
  store i64 %532, i64* %533, align 8
  %534 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 27
  store i64 %532, i64* %534, align 8
  %535 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 6
  %536 = load float, float* %535, align 8
  %537 = fptosi float %536 to i64
  %538 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 7
  store i64 %537, i64* %538, align 8
  %539 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 29
  store i64 %537, i64* %539, align 8
  %540 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 1
  %541 = load float, float* %540, align 4
  %542 = fptosi float %541 to i64
  %543 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 2
  store i64 %542, i64* %543, align 8
  %544 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 2
  %545 = load float, float* %544, align 8
  %546 = fptosi float %545 to i64
  %547 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 4
  store i64 %546, i64* %547, align 8
  %548 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 3
  %549 = load float, float* %548, align 4
  %550 = fptosi float %549 to i64
  %551 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 6
  store i64 %550, i64* %551, align 8
  %552 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 14
  %553 = load float, float* %552, align 8
  %554 = fadd float 1.400000e+01, %553
  %555 = fptosi float %554 to i64
  %556 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 37
  store i64 %555, i64* %556, align 8
  %557 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 12
  %558 = load float, float* %557, align 16
  %559 = fadd float 1.400000e+01, %558
  %560 = fptosi float %559 to i64
  %561 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 32
  store i64 %560, i64* %561, align 8
  %562 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 13
  %563 = load float, float* %562, align 4
  %564 = fadd float 1.400000e+01, %563
  %565 = fptosi float %564 to i64
  %566 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 34
  store i64 %565, i64* %566, align 8
  %567 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 8
  %568 = load float, float* %567, align 16
  %569 = fadd float 1.400000e+01, %568
  %570 = fptosi float %569 to i64
  %571 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 24
  store i64 %570, i64* %571, align 8
  %572 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 9
  %573 = load float, float* %572, align 4
  %574 = fadd float 1.400000e+01, %573
  %575 = fptosi float %574 to i64
  %576 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 26
  store i64 %575, i64* %576, align 8
  %577 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 10
  %578 = load float, float* %577, align 8
  %579 = fadd float 1.400000e+01, %578
  %580 = fptosi float %579 to i64
  %581 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 28
  store i64 %580, i64* %581, align 8
  %582 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 11
  %583 = load float, float* %582, align 4
  %584 = fadd float 1.400000e+01, %583
  %585 = fptosi float %584 to i64
  %586 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 30
  store i64 %585, i64* %586, align 8
  %587 = load i16*, i16** %11, align 8
  call void @parwave(%struct.klatt_global_t* @klatt_global, %struct.klatt_frame_t* %10, i16* %587)
  %588 = load i64, i64* getelementptr inbounds (%struct.klatt_global_t, %struct.klatt_global_t* @klatt_global, i32 0, i32 7), align 8
  %589 = load i16*, i16** %11, align 8
  %590 = getelementptr inbounds i16, i16* %589, i64 %588
  store i16* %590, i16** %11, align 8
  %591 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %592 = icmp ne %struct._IO_FILE* %591, null
  br i1 %592, label %593, label %613

; <label>:593:                                    ; preds = %492
  store i32 0, i32* %29, align 4
  br label %594

; <label>:594:                                    ; preds = %605, %593
  %595 = load i32, i32* %29, align 4
  %596 = icmp slt i32 %595, 19
  br i1 %596, label %597, label %609

; <label>:597:                                    ; preds = %594
  %598 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %599 = load i32, i32* %29, align 4
  %600 = sext i32 %599 to i64
  %601 = getelementptr inbounds [19 x float], [19 x float]* %28, i64 0, i64 %600
  %602 = load float, float* %601, align 4
  %603 = fpext float %602 to double
  %604 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %598, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i32 0, i32 0), double %603)
  br label %605

; <label>:605:                                    ; preds = %597
  %pgocount28 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 1)
  %606 = add i64 %pgocount28, 1
  store i64 %606, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 1)
  %607 = load i32, i32* %29, align 4
  %608 = add nsw i32 %607, 1
  store i32 %608, i32* %29, align 4
  br label %594

; <label>:609:                                    ; preds = %594
  %pgocount29 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 14)
  %610 = add i64 %pgocount29, 1
  store i64 %610, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 14)
  %611 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %612 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %611, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  br label %613

; <label>:613:                                    ; preds = %609, %492
  %614 = load %struct._IO_FILE*, %struct._IO_FILE** @jsru_file, align 8
  %615 = icmp ne %struct._IO_FILE* %614, null
  br i1 %615, label %616, label %623

; <label>:616:                                    ; preds = %613
  %pgocount30 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 15)
  %617 = add i64 %pgocount30, 1
  store i64 %617, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 15)
  %618 = getelementptr inbounds %struct.klatt_frame_t, %struct.klatt_frame_t* %10, i32 0, i32 0
  %619 = load i64, i64* %618, align 8
  %620 = sitofp i64 %619 to double
  %621 = fmul double %620, 1.000000e-01
  %622 = getelementptr inbounds [19 x float], [19 x float]* %28, i32 0, i32 0
  call void @jsru_save(double %621, float* %622)
  br label %623

; <label>:623:                                    ; preds = %616, %613
  %624 = load float, float* %18, align 4
  %625 = fpext float %624 to double
  %626 = fsub double %625, 5.000000e-01
  %627 = fptrunc double %626 to float
  store float %627, float* %18, align 4
  br label %628

; <label>:628:                                    ; preds = %623
  %pgocount31 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 10)
  %629 = add i64 %pgocount31, 1
  store i64 %629, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 10)
  %630 = load i32, i32* %25, align 4
  %631 = add i32 %630, 1
  store i32 %631, i32* %25, align 4
  %632 = load i32, i32* %14, align 4
  %633 = add i32 %632, 1
  store i32 %633, i32* %14, align 4
  br label %303

; <label>:634:                                    ; preds = %303
  %635 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %636 = icmp ne %struct._IO_FILE* %635, null
  br i1 %636, label %637, label %686

; <label>:637:                                    ; preds = %634
  store i32 0, i32* %35, align 4
  br label %638

; <label>:638:                                    ; preds = %655, %637
  %639 = load i32, i32* %35, align 4
  %640 = icmp slt i32 %639, 19
  br i1 %640, label %641, label %659

; <label>:641:                                    ; preds = %638
  %642 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %643 = load i32, i32* %35, align 4
  %644 = icmp ne i32 %643, 0
  %645 = zext i1 %644 to i64
  %pgocount32 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 37)
  %646 = add i64 %pgocount32, %645
  store i64 %646, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 37)
  %647 = select i1 %644, i32 32, i32 35
  %648 = load i32, i32* %35, align 4
  %649 = sext i32 %648 to i64
  %650 = getelementptr inbounds [19 x %struct.slope_t], [19 x %struct.slope_t]* %24, i64 0, i64 %649
  %651 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %650, i32 0, i32 0
  %652 = load float, float* %651, align 8
  %653 = fpext float %652 to double
  %654 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %642, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i32 0, i32 0), i32 %647, double %653)
  br label %655

; <label>:655:                                    ; preds = %641
  %pgocount33 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 16)
  %656 = add i64 %pgocount33, 1
  store i64 %656, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 16)
  %657 = load i32, i32* %35, align 4
  %658 = add nsw i32 %657, 1
  store i32 %658, i32* %35, align 4
  br label %638

; <label>:659:                                    ; preds = %638
  %660 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %661 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %660, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  store i32 0, i32* %35, align 4
  br label %662

; <label>:662:                                    ; preds = %678, %659
  %663 = load i32, i32* %35, align 4
  %664 = icmp slt i32 %663, 19
  br i1 %664, label %665, label %682

; <label>:665:                                    ; preds = %662
  %666 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %667 = load i32, i32* %35, align 4
  %668 = icmp ne i32 %667, 0
  %669 = zext i1 %668 to i64
  %pgocount34 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 38)
  %670 = add i64 %pgocount34, %669
  store i64 %670, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 38)
  %671 = select i1 %668, i32 32, i32 35
  %672 = load i32, i32* %35, align 4
  %673 = sext i32 %672 to i64
  %674 = getelementptr inbounds [19 x %struct.slope_t], [19 x %struct.slope_t]* %24, i64 0, i64 %673
  %675 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %674, i32 0, i32 1
  %676 = load i32, i32* %675, align 4
  %677 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %666, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0), i32 %671, i32 %676)
  br label %678

; <label>:678:                                    ; preds = %665
  %pgocount35 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 17)
  %679 = add i64 %pgocount35, 1
  store i64 %679, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 17)
  %680 = load i32, i32* %35, align 4
  %681 = add nsw i32 %680, 1
  store i32 %681, i32* %35, align 4
  br label %662

; <label>:682:                                    ; preds = %662
  %pgocount36 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 24)
  %683 = add i64 %pgocount36, 1
  store i64 %683, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 24)
  %684 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %685 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %684, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  br label %686

; <label>:686:                                    ; preds = %682, %634
  br label %687

; <label>:687:                                    ; preds = %686, %97
  %pgocount37 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 22)
  %688 = add i64 %pgocount37, 1
  store i64 %688, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 22)
  %689 = load %struct.Elm_s*, %struct.Elm_s** %20, align 8
  store %struct.Elm_s* %689, %struct.Elm_s** %12, align 8
  br label %93

; <label>:690:                                    ; preds = %93
  %pgocount38 = load i64, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 33)
  %691 = add i64 %pgocount38, 1
  store i64 %691, i64* getelementptr inbounds ([39 x i64], [39 x i64]* @__profc_holmes, i64 0, i64 33)
  %692 = load i16*, i16** %11, align 8
  %693 = load i16*, i16** %8, align 8
  %694 = ptrtoint i16* %692 to i64
  %695 = ptrtoint i16* %693 to i64
  %696 = sub i64 %694, %695
  %697 = sdiv exact i64 %696, 2
  %698 = trunc i64 %697 to i32
  ret i32 %698
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

declare void @parwave_init(%struct.klatt_global_t*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define internal void @set_trans(%struct.slope_t*, %struct.Elm_s*, %struct.Elm_s*, i32, i32) #0 {
  %6 = alloca %struct.slope_t*, align 8
  %7 = alloca %struct.Elm_s*, align 8
  %8 = alloca %struct.Elm_s*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store %struct.slope_t* %0, %struct.slope_t** %6, align 8
  store %struct.Elm_s* %1, %struct.Elm_s** %7, align 8
  store %struct.Elm_s* %2, %struct.Elm_s** %8, align 8
  store i32 %3, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  store i32 0, i32* %11, align 4
  br label %12

; <label>:12:                                     ; preds = %101, %5
  %13 = load i32, i32* %11, align 4
  %14 = icmp slt i32 %13, 19
  br i1 %14, label %15, label %104

; <label>:15:                                     ; preds = %12
  %16 = load i32, i32* %9, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %27

; <label>:18:                                     ; preds = %15
  %19 = load %struct.Elm_s*, %struct.Elm_s** %7, align 8
  %20 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %19, i32 0, i32 8
  %21 = load i32, i32* %11, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [19 x %struct.interp_t], [19 x %struct.interp_t]* %20, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.interp_t, %struct.interp_t* %23, i32 0, i32 3
  %25 = load i8, i8* %24, align 1
  %26 = sext i8 %25 to i32
  br label %37

; <label>:27:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_trans, i64 0, i64 1)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_trans, i64 0, i64 1)
  %29 = load %struct.Elm_s*, %struct.Elm_s** %7, align 8
  %30 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %29, i32 0, i32 8
  %31 = load i32, i32* %11, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [19 x %struct.interp_t], [19 x %struct.interp_t]* %30, i64 0, i64 %32
  %34 = getelementptr inbounds %struct.interp_t, %struct.interp_t* %33, i32 0, i32 4
  %35 = load i8, i8* %34, align 2
  %36 = sext i8 %35 to i32
  br label %37

; <label>:37:                                     ; preds = %27, %18
  %38 = phi i32 [ %26, %18 ], [ %36, %27 ]
  %39 = load i32, i32* @speed, align 4
  %40 = mul nsw i32 %38, %39
  %41 = load %struct.slope_t*, %struct.slope_t** %6, align 8
  %42 = load i32, i32* %11, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %41, i64 %43
  %45 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %44, i32 0, i32 1
  store i32 %40, i32* %45, align 4
  %46 = load %struct.slope_t*, %struct.slope_t** %6, align 8
  %47 = load i32, i32* %11, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %46, i64 %48
  %50 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %49, i32 0, i32 1
  %51 = load i32, i32* %50, align 4
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %86

; <label>:53:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_trans, i64 0, i64 0)
  %54 = add i64 %pgocount1, 1
  store i64 %54, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_trans, i64 0, i64 0)
  %55 = load %struct.Elm_s*, %struct.Elm_s** %7, align 8
  %56 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %55, i32 0, i32 8
  %57 = load i32, i32* %11, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [19 x %struct.interp_t], [19 x %struct.interp_t]* %56, i64 0, i64 %58
  %60 = getelementptr inbounds %struct.interp_t, %struct.interp_t* %59, i32 0, i32 1
  %61 = load float, float* %60, align 4
  %62 = load %struct.Elm_s*, %struct.Elm_s** %7, align 8
  %63 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %62, i32 0, i32 8
  %64 = load i32, i32* %11, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [19 x %struct.interp_t], [19 x %struct.interp_t]* %63, i64 0, i64 %65
  %67 = getelementptr inbounds %struct.interp_t, %struct.interp_t* %66, i32 0, i32 2
  %68 = load i8, i8* %67, align 4
  %69 = sext i8 %68 to i32
  %70 = sitofp i32 %69 to float
  %71 = load %struct.Elm_s*, %struct.Elm_s** %8, align 8
  %72 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %71, i32 0, i32 8
  %73 = load i32, i32* %11, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [19 x %struct.interp_t], [19 x %struct.interp_t]* %72, i64 0, i64 %74
  %76 = getelementptr inbounds %struct.interp_t, %struct.interp_t* %75, i32 0, i32 0
  %77 = load float, float* %76, align 4
  %78 = fmul float %70, %77
  %79 = fmul float %78, 0x3F847AE140000000
  %80 = fadd float %61, %79
  %81 = load %struct.slope_t*, %struct.slope_t** %6, align 8
  %82 = load i32, i32* %11, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %81, i64 %83
  %85 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %84, i32 0, i32 0
  store float %80, float* %85, align 4
  br label %100

; <label>:86:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_trans, i64 0, i64 2)
  %87 = add i64 %pgocount2, 1
  store i64 %87, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_trans, i64 0, i64 2)
  %88 = load %struct.Elm_s*, %struct.Elm_s** %8, align 8
  %89 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %88, i32 0, i32 8
  %90 = load i32, i32* %11, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [19 x %struct.interp_t], [19 x %struct.interp_t]* %89, i64 0, i64 %91
  %93 = getelementptr inbounds %struct.interp_t, %struct.interp_t* %92, i32 0, i32 0
  %94 = load float, float* %93, align 4
  %95 = load %struct.slope_t*, %struct.slope_t** %6, align 8
  %96 = load i32, i32* %11, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %95, i64 %97
  %99 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %98, i32 0, i32 0
  store float %94, float* %99, align 4
  br label %100

; <label>:100:                                    ; preds = %86, %53
  br label %101

; <label>:101:                                    ; preds = %100
  %102 = load i32, i32* %11, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, i32* %11, align 4
  br label %12

; <label>:104:                                    ; preds = %12
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_trans, i64 0, i64 3)
  %105 = add i64 %pgocount3, 1
  store i64 %105, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_set_trans, i64 0, i64 3)
  ret void
}

; Function Attrs: nounwind uwtable
define internal float @filter(%struct.filter_t*, float) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_filter, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_filter, i64 0, i64 0)
  %4 = alloca %struct.filter_t*, align 8
  %5 = alloca float, align 4
  store %struct.filter_t* %0, %struct.filter_t** %4, align 8
  store float %1, float* %5, align 4
  %6 = load %struct.filter_t*, %struct.filter_t** %4, align 8
  %7 = getelementptr inbounds %struct.filter_t, %struct.filter_t* %6, i32 0, i32 0
  %8 = load float, float* %7, align 4
  %9 = load float, float* %5, align 4
  %10 = fmul float %8, %9
  %11 = load %struct.filter_t*, %struct.filter_t** %4, align 8
  %12 = getelementptr inbounds %struct.filter_t, %struct.filter_t* %11, i32 0, i32 1
  %13 = load float, float* %12, align 4
  %14 = load %struct.filter_t*, %struct.filter_t** %4, align 8
  %15 = getelementptr inbounds %struct.filter_t, %struct.filter_t* %14, i32 0, i32 2
  %16 = load float, float* %15, align 4
  %17 = fmul float %13, %16
  %18 = fadd float %10, %17
  %19 = load %struct.filter_t*, %struct.filter_t** %4, align 8
  %20 = getelementptr inbounds %struct.filter_t, %struct.filter_t* %19, i32 0, i32 2
  store float %18, float* %20, align 4
  ret float %18
}

; Function Attrs: nounwind uwtable
define internal float @interpolate(i8*, i8*, %struct.slope_t*, %struct.slope_t*, float, i32, i32) #0 {
  %8 = alloca float, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca %struct.slope_t*, align 8
  %12 = alloca %struct.slope_t*, align 8
  %13 = alloca float, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca float, align 4
  %17 = alloca float, align 4
  %18 = alloca float, align 4
  %19 = alloca float, align 4
  store i8* %0, i8** %9, align 8
  store i8* %1, i8** %10, align 8
  store %struct.slope_t* %2, %struct.slope_t** %11, align 8
  store %struct.slope_t* %3, %struct.slope_t** %12, align 8
  store float %4, float* %13, align 4
  store i32 %5, i32* %14, align 4
  store i32 %6, i32* %15, align 4
  %20 = load i32, i32* %15, align 4
  %21 = load %struct.slope_t*, %struct.slope_t** %11, align 8
  %22 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %21, i32 0, i32 1
  %23 = load i32, i32* %22, align 4
  %24 = load %struct.slope_t*, %struct.slope_t** %12, align 8
  %25 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %24, i32 0, i32 1
  %26 = load i32, i32* %25, align 4
  %27 = add nsw i32 %23, %26
  %28 = sub nsw i32 %20, %27
  %29 = sitofp i32 %28 to float
  store float %29, float* %16, align 4
  %30 = load float, float* %16, align 4
  %31 = fcmp oge float %30, 0.000000e+00
  br i1 %31, label %32, label %77

; <label>:32:                                     ; preds = %7
  %33 = load i32, i32* %14, align 4
  %34 = load %struct.slope_t*, %struct.slope_t** %11, align 8
  %35 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %34, i32 0, i32 1
  %36 = load i32, i32* %35, align 4
  %37 = icmp slt i32 %33, %36
  br i1 %37, label %38, label %49

; <label>:38:                                     ; preds = %32
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_interpolate, i64 0, i64 1)
  %39 = add i64 %pgocount, 1
  store i64 %39, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_interpolate, i64 0, i64 1)
  %40 = load %struct.slope_t*, %struct.slope_t** %11, align 8
  %41 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %40, i32 0, i32 0
  %42 = load float, float* %41, align 4
  %43 = load float, float* %13, align 4
  %44 = load i32, i32* %14, align 4
  %45 = load %struct.slope_t*, %struct.slope_t** %11, align 8
  %46 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %45, i32 0, i32 1
  %47 = load i32, i32* %46, align 4
  %48 = call float @linear(float %42, float %43, i32 %44, i32 %47)
  store float %48, float* %8, align 4
  br label %113

; <label>:49:                                     ; preds = %32
  %50 = load %struct.slope_t*, %struct.slope_t** %11, align 8
  %51 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %50, i32 0, i32 1
  %52 = load i32, i32* %51, align 4
  %53 = load i32, i32* %14, align 4
  %54 = sub nsw i32 %53, %52
  store i32 %54, i32* %14, align 4
  %55 = load i32, i32* %14, align 4
  %56 = sitofp i32 %55 to float
  %57 = load float, float* %16, align 4
  %58 = fcmp ole float %56, %57
  br i1 %58, label %59, label %62

; <label>:59:                                     ; preds = %49
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_interpolate, i64 0, i64 2)
  %60 = add i64 %pgocount1, 1
  store i64 %60, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_interpolate, i64 0, i64 2)
  %61 = load float, float* %13, align 4
  store float %61, float* %8, align 4
  br label %113

; <label>:62:                                     ; preds = %49
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_interpolate, i64 0, i64 3)
  %63 = add i64 %pgocount2, 1
  store i64 %63, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_interpolate, i64 0, i64 3)
  %64 = load float, float* %13, align 4
  %65 = load %struct.slope_t*, %struct.slope_t** %12, align 8
  %66 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %65, i32 0, i32 0
  %67 = load float, float* %66, align 4
  %68 = load i32, i32* %14, align 4
  %69 = sitofp i32 %68 to float
  %70 = load float, float* %16, align 4
  %71 = fsub float %69, %70
  %72 = fptosi float %71 to i32
  %73 = load %struct.slope_t*, %struct.slope_t** %12, align 8
  %74 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %73, i32 0, i32 1
  %75 = load i32, i32* %74, align 4
  %76 = call float @linear(float %64, float %67, i32 %72, i32 %75)
  store float %76, float* %8, align 4
  br label %113

; <label>:77:                                     ; preds = %7
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_interpolate, i64 0, i64 0)
  %78 = add i64 %pgocount3, 1
  store i64 %78, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_interpolate, i64 0, i64 0)
  %79 = load i32, i32* %14, align 4
  %80 = sitofp i32 %79 to float
  %81 = load i32, i32* %15, align 4
  %82 = sitofp i32 %81 to float
  %83 = fdiv float %80, %82
  %84 = fsub float 1.000000e+00, %83
  store float %84, float* %17, align 4
  %85 = load %struct.slope_t*, %struct.slope_t** %11, align 8
  %86 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %85, i32 0, i32 0
  %87 = load float, float* %86, align 4
  %88 = load float, float* %13, align 4
  %89 = load i32, i32* %14, align 4
  %90 = load %struct.slope_t*, %struct.slope_t** %11, align 8
  %91 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %90, i32 0, i32 1
  %92 = load i32, i32* %91, align 4
  %93 = call float @linear(float %87, float %88, i32 %89, i32 %92)
  store float %93, float* %18, align 4
  %94 = load %struct.slope_t*, %struct.slope_t** %12, align 8
  %95 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %94, i32 0, i32 0
  %96 = load float, float* %95, align 4
  %97 = load float, float* %13, align 4
  %98 = load i32, i32* %15, align 4
  %99 = load i32, i32* %14, align 4
  %100 = sub nsw i32 %98, %99
  %101 = load %struct.slope_t*, %struct.slope_t** %12, align 8
  %102 = getelementptr inbounds %struct.slope_t, %struct.slope_t* %101, i32 0, i32 1
  %103 = load i32, i32* %102, align 4
  %104 = call float @linear(float %96, float %97, i32 %100, i32 %103)
  store float %104, float* %19, align 4
  %105 = load float, float* %17, align 4
  %106 = load float, float* %18, align 4
  %107 = fmul float %105, %106
  %108 = load float, float* %17, align 4
  %109 = fsub float 1.000000e+00, %108
  %110 = load float, float* %19, align 4
  %111 = fmul float %109, %110
  %112 = fadd float %107, %111
  store float %112, float* %8, align 4
  br label %113

; <label>:113:                                    ; preds = %77, %62, %59, %38
  %114 = load float, float* %8, align 4
  ret float %114
}

declare void @parwave(%struct.klatt_global_t*, %struct.klatt_frame_t*, i16*) #2

; Function Attrs: nounwind uwtable
define internal void @jsru_save(double, float*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_jsru_save, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_jsru_save, i64 0, i64 0)
  %4 = alloca double, align 8
  %5 = alloca float*, align 8
  store double %0, double* %4, align 8
  store float* %1, float** %5, align 8
  %6 = load double, double* %4, align 8
  %7 = fdiv double %6, 2.500000e+01
  %8 = call double @log(double %7) #4
  %9 = call double @log(double 2.000000e+00) #4
  %10 = fdiv double %8, %9
  %11 = fmul double 1.600000e+01, %10
  %12 = fsub double %11, 1.000000e+00
  store double %12, double* %4, align 8
  %13 = load float*, float** %5, align 8
  %14 = getelementptr inbounds float, float* %13, i64 0
  %15 = load float, float* %14, align 4
  %16 = call i32 @jsru_freq(float %15, float 9.500000e+01, float 5.000000e+00)
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @jsru_file, align 8
  %18 = call i32 @fputc(i32 %16, %struct._IO_FILE* %17)
  %19 = load float*, float** %5, align 8
  %20 = getelementptr inbounds float, float* %19, i64 7
  %21 = load float, float* %20, align 4
  %22 = call i32 @jsru_amp(float %21)
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @jsru_file, align 8
  %24 = call i32 @fputc(i32 %22, %struct._IO_FILE* %23)
  %25 = load float*, float** %5, align 8
  %26 = getelementptr inbounds float, float* %25, i64 1
  %27 = load float, float* %26, align 4
  %28 = call i32 @jsru_freq(float %27, float 1.250000e+02, float 2.500000e+01)
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @jsru_file, align 8
  %30 = call i32 @fputc(i32 %28, %struct._IO_FILE* %29)
  %31 = load float*, float** %5, align 8
  %32 = getelementptr inbounds float, float* %31, i64 8
  %33 = load float, float* %32, align 4
  %34 = call i32 @jsru_amp(float %33)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @jsru_file, align 8
  %36 = call i32 @fputc(i32 %34, %struct._IO_FILE* %35)
  %37 = load float*, float** %5, align 8
  %38 = getelementptr inbounds float, float* %37, i64 2
  %39 = load float, float* %38, align 4
  %40 = call i32 @jsru_freq(float %39, float 5.500000e+02, float 5.000000e+01)
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @jsru_file, align 8
  %42 = call i32 @fputc(i32 %40, %struct._IO_FILE* %41)
  %43 = load float*, float** %5, align 8
  %44 = getelementptr inbounds float, float* %43, i64 9
  %45 = load float, float* %44, align 4
  %46 = call i32 @jsru_amp(float %45)
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @jsru_file, align 8
  %48 = call i32 @fputc(i32 %46, %struct._IO_FILE* %47)
  %49 = load float*, float** %5, align 8
  %50 = getelementptr inbounds float, float* %49, i64 3
  %51 = load float, float* %50, align 4
  %52 = call i32 @jsru_freq(float %51, float 1.350000e+03, float 5.000000e+01)
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @jsru_file, align 8
  %54 = call i32 @fputc(i32 %52, %struct._IO_FILE* %53)
  %55 = load float*, float** %5, align 8
  %56 = getelementptr inbounds float, float* %55, i64 10
  %57 = load float, float* %56, align 4
  %58 = call i32 @jsru_amp(float %57)
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** @jsru_file, align 8
  %60 = call i32 @fputc(i32 %58, %struct._IO_FILE* %59)
  %61 = load float*, float** %5, align 8
  %62 = getelementptr inbounds float, float* %61, i64 11
  %63 = load float, float* %62, align 4
  %64 = call i32 @jsru_amp(float %63)
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** @jsru_file, align 8
  %66 = call i32 @fputc(i32 %64, %struct._IO_FILE* %65)
  %67 = load float*, float** %5, align 8
  %68 = getelementptr inbounds float, float* %67, i64 15
  %69 = load float, float* %68, align 4
  %70 = call i32 @jsru_amp(float %69)
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** @jsru_file, align 8
  %72 = call i32 @fputc(i32 %70, %struct._IO_FILE* %71)
  %73 = load double, double* %4, align 8
  %74 = fptosi double %73 to i32
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** @jsru_file, align 8
  %76 = call i32 @fputc(i32 %74, %struct._IO_FILE* %75)
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** @jsru_file, align 8
  %78 = call i32 @fputc(i32 32, %struct._IO_FILE* %77)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @init_holmes(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i8* null, i8** %6, align 8
  store i8* null, i8** %7, align 8
  %8 = load i32, i32* %4, align 4
  %9 = load i8**, i8*** %5, align 8
  %10 = call i32 (i8*, i32, i8**, ...) @getargs(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0), i32 %8, i8** %9, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.8, i32 0, i32 0), i8** %6, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.8, i32 0, i32 0), i8** %7, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.17, i32 0, i32 0), i32* @speed, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0), double* @frac, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.21, i32 0, i32 0), i8* null)
  store i32 %10, i32* %4, align 4
  %11 = load i32, i32* @help_only, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_init_holmes, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_init_holmes, i64 0, i64 0)
  %15 = load i32, i32* %4, align 4
  store i32 %15, i32* %3, align 4
  br label %45

; <label>:16:                                     ; preds = %2
  %17 = load i8*, i8** %6, align 8
  %18 = icmp ne i8* %17, null
  br i1 %18, label %19, label %29

; <label>:19:                                     ; preds = %16
  %20 = load i8*, i8** %6, align 8
  %21 = call %struct._IO_FILE* @fopen(i8* %20, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22, i32 0, i32 0))
  store %struct._IO_FILE* %21, %struct._IO_FILE** @par_file, align 8
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %23 = icmp ne %struct._IO_FILE* %22, null
  br i1 %23, label %27, label %24

; <label>:24:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_init_holmes, i64 0, i64 4)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_init_holmes, i64 0, i64 4)
  %26 = load i8*, i8** %6, align 8
  call void @perror(i8* %26)
  br label %27

; <label>:27:                                     ; preds = %24, %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_init_holmes, i64 0, i64 2)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_init_holmes, i64 0, i64 2)
  br label %29

; <label>:29:                                     ; preds = %27, %16
  %30 = load i8*, i8** %7, align 8
  %31 = icmp ne i8* %30, null
  br i1 %31, label %32, label %42

; <label>:32:                                     ; preds = %29
  %33 = load i8*, i8** %7, align 8
  %34 = call %struct._IO_FILE* @fopen(i8* %33, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22, i32 0, i32 0))
  store %struct._IO_FILE* %34, %struct._IO_FILE** @jsru_file, align 8
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @jsru_file, align 8
  %36 = icmp ne %struct._IO_FILE* %35, null
  br i1 %36, label %40, label %37

; <label>:37:                                     ; preds = %32
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_init_holmes, i64 0, i64 5)
  %38 = add i64 %pgocount3, 1
  store i64 %38, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_init_holmes, i64 0, i64 5)
  %39 = load i8*, i8** %7, align 8
  call void @perror(i8* %39)
  br label %40

; <label>:40:                                     ; preds = %37, %32
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_init_holmes, i64 0, i64 3)
  %41 = add i64 %pgocount4, 1
  store i64 %41, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_init_holmes, i64 0, i64 3)
  br label %42

; <label>:42:                                     ; preds = %40, %29
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_init_holmes, i64 0, i64 1)
  %43 = add i64 %pgocount5, 1
  store i64 %43, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_init_holmes, i64 0, i64 1)
  %44 = load i32, i32* %4, align 4
  store i32 %44, i32* %3, align 4
  br label %45

; <label>:45:                                     ; preds = %42, %13
  %46 = load i32, i32* %3, align 4
  ret i32 %46
}

declare i32 @getargs(i8*, i32, i8**, ...) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare void @perror(i8*) #2

; Function Attrs: nounwind uwtable
define void @term_holmes() #0 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %2 = icmp ne %struct._IO_FILE* %1, null
  br i1 %2, label %3, label %7

; <label>:3:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_term_holmes, i64 0, i64 1)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_term_holmes, i64 0, i64 1)
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @par_file, align 8
  %6 = call i32 @fclose(%struct._IO_FILE* %5)
  br label %7

; <label>:7:                                      ; preds = %3, %0
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @jsru_file, align 8
  %9 = icmp ne %struct._IO_FILE* %8, null
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_term_holmes, i64 0, i64 2)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_term_holmes, i64 0, i64 2)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @jsru_file, align 8
  %13 = call i32 @fclose(%struct._IO_FILE* %12)
  br label %14

; <label>:14:                                     ; preds = %10, %7
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_term_holmes, i64 0, i64 0)
  %15 = add i64 %pgocount2, 1
  store i64 %15, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_term_holmes, i64 0, i64 0)
  ret void
}

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define internal float @linear(float, float, i32, i32) #0 {
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca float, align 4
  store float %0, float* %6, align 4
  store float %1, float* %7, align 4
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  %11 = load i32, i32* %8, align 4
  %12 = icmp sle i32 %11, 0
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_linear, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_linear, i64 0, i64 0)
  %15 = load float, float* %6, align 4
  store float %15, float* %5, align 4
  br label %37

; <label>:16:                                     ; preds = %4
  %17 = load i32, i32* %8, align 4
  %18 = load i32, i32* %9, align 4
  %19 = icmp sge i32 %17, %18
  br i1 %19, label %20, label %23

; <label>:20:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_linear, i64 0, i64 1)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_linear, i64 0, i64 1)
  %22 = load float, float* %7, align 4
  store float %22, float* %5, align 4
  br label %37

; <label>:23:                                     ; preds = %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_linear, i64 0, i64 2)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_linear, i64 0, i64 2)
  %25 = load i32, i32* %8, align 4
  %26 = sitofp i32 %25 to float
  %27 = load i32, i32* %9, align 4
  %28 = sitofp i32 %27 to float
  %29 = fdiv float %26, %28
  store float %29, float* %10, align 4
  %30 = load float, float* %6, align 4
  %31 = load float, float* %7, align 4
  %32 = load float, float* %6, align 4
  %33 = fsub float %31, %32
  %34 = load float, float* %10, align 4
  %35 = fmul float %33, %34
  %36 = fadd float %30, %35
  store float %36, float* %5, align 4
  br label %37

; <label>:37:                                     ; preds = %23, %20, %13
  %38 = load float, float* %5, align 4
  ret float %38
}

; Function Attrs: nounwind
declare double @log(double) #3

declare i32 @fputc(i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define internal i32 @jsru_freq(float, float, float) #0 {
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  %7 = alloca i32, align 4
  store float %0, float* %4, align 4
  store float %1, float* %5, align 4
  store float %2, float* %6, align 4
  %8 = load float, float* %4, align 4
  %9 = load float, float* %5, align 4
  %10 = fsub float %8, %9
  %11 = load float, float* %6, align 4
  %12 = fdiv float %10, %11
  store float %12, float* %4, align 4
  %13 = load float, float* %4, align 4
  %14 = fptosi float %13 to i32
  store i32 %14, i32* %7, align 4
  %15 = load i32, i32* %7, align 4
  %16 = icmp sge i32 %15, 64
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_jsru_freq, i64 0, i64 1)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_jsru_freq, i64 0, i64 1)
  store i32 63, i32* %7, align 4
  br label %19

; <label>:19:                                     ; preds = %17, %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_jsru_freq, i64 0, i64 0)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_jsru_freq, i64 0, i64 0)
  %21 = load i32, i32* %7, align 4
  ret i32 %21
}

; Function Attrs: nounwind uwtable
define internal i32 @jsru_amp(float) #0 {
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  store float %0, float* %2, align 4
  %4 = load float, float* %2, align 4
  %5 = fptosi float %4 to i32
  store i32 %5, i32* %3, align 4
  %6 = load i32, i32* %3, align 4
  %7 = icmp sle i32 %6, 0
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_jsru_amp, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_jsru_amp, i64 0, i64 1)
  store i32 1, i32* %3, align 4
  br label %10

; <label>:10:                                     ; preds = %8, %1
  %11 = load i32, i32* %3, align 4
  %12 = icmp sge i32 %11, 64
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_jsru_amp, i64 0, i64 2)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_jsru_amp, i64 0, i64 2)
  store i32 63, i32* %3, align 4
  br label %15

; <label>:15:                                     ; preds = %13, %10
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_jsru_amp, i64 0, i64 0)
  %16 = add i64 %pgocount2, 1
  store i64 %16, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_jsru_amp, i64 0, i64 0)
  %17 = load i32, i32* %3, align 4
  ret i32 %17
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

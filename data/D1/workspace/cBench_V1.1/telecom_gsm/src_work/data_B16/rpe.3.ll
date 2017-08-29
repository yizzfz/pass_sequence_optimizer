; ModuleID = 'rpe.2.ll'
source_filename = "rpe.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [9 x i8] c"exp <= 5\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"rpe.c\00", align 1
@__PRETTY_FUNCTION__.APCM_quantization = private unnamed_addr constant [63 x i8] c"void APCM_quantization(word *, word *, word *, word *, word *)\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"exp <= 6 && exp >= 0\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"temp <= 11 && temp >= 0\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"exp <= 4096 && exp >= -4096\00", align 1
@.str.5 = private unnamed_addr constant [23 x i8] c"mant >= 0 && mant <= 7\00", align 1
@gsm_NRFAC = external global [8 x i16], align 16
@.str.6 = private unnamed_addr constant [25 x i8] c"temp1 >= 0 && temp1 < 16\00", align 1
@__PRETTY_FUNCTION__.APCM_inverse_quantization = private unnamed_addr constant [59 x i8] c"void APCM_inverse_quantization(word *, word, word, word *)\00", align 1
@gsm_FAC = external global [8 x i16], align 16
@.str.7 = private unnamed_addr constant [23 x i8] c"*xMc <= 7 && *xMc >= 0\00", align 1
@.str.8 = private unnamed_addr constant [24 x i8] c"temp <= 7 && temp >= -7\00", align 1
@.str.9 = private unnamed_addr constant [19 x i8] c"0 <= Mc && Mc <= 3\00", align 1
@__PRETTY_FUNCTION__.RPE_grid_positioning = private unnamed_addr constant [48 x i8] c"void RPE_grid_positioning(word, word *, word *)\00", align 1
@.str.10 = private unnamed_addr constant [22 x i8] c"exp >= -4 && exp <= 6\00", align 1
@__PRETTY_FUNCTION__.APCM_quantization_xmaxc_to_exp_mant = private unnamed_addr constant [63 x i8] c"void APCM_quantization_xmaxc_to_exp_mant(word, word *, word *)\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_Gsm_RPE_Encoding = private constant [16 x i8] c"Gsm_RPE_Encoding"
@__profn_tmp1.ll_Weighting_filter = private constant [24 x i8] c"tmp1.ll:Weighting_filter"
@__profn_tmp1.ll_RPE_grid_selection = private constant [26 x i8] c"tmp1.ll:RPE_grid_selection"
@__profn_tmp1.ll_APCM_quantization = private constant [25 x i8] c"tmp1.ll:APCM_quantization"
@__profn_tmp1.ll_APCM_inverse_quantization = private constant [33 x i8] c"tmp1.ll:APCM_inverse_quantization"
@__profn_tmp1.ll_RPE_grid_positioning = private constant [28 x i8] c"tmp1.ll:RPE_grid_positioning"
@__profn_Gsm_RPE_Decoding = private constant [16 x i8] c"Gsm_RPE_Decoding"
@__profn_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant = private constant [43 x i8] c"tmp1.ll:APCM_quantization_xmaxc_to_exp_mant"
@__profc_Gsm_RPE_Encoding = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Gsm_RPE_Encoding = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8453951827834113886, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Gsm_RPE_Encoding, i32 0, i32 0), i8* bitcast (void (%struct.gsm_state*, i16*, i16*, i16*, i16*)* @Gsm_RPE_Encoding to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Weighting_filter = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Weighting_filter = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2899622067820985221, i64 66546138745, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Weighting_filter, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_RPE_grid_selection = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_RPE_grid_selection = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5297513213475424161, i64 72473913302, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_RPE_grid_selection, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_APCM_quantization = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_APCM_quantization = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4199328953063945214, i64 307195787366, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i32 0, i32 0), i8* null, i8* null, i32 19, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_APCM_inverse_quantization = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_APCM_inverse_quantization = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1233057196461337585, i64 72057730927473739, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i32 0, i32 0), i8* null, i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_RPE_grid_positioning = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_RPE_grid_positioning = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1083228610549154665, i64 113505375389, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_Gsm_RPE_Decoding = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Gsm_RPE_Decoding = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5448763320249802347, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Gsm_RPE_Decoding, i32 0, i32 0), i8* bitcast (void (%struct.gsm_state*, i16, i16, i16*, i16*)* @Gsm_RPE_Decoding to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6413460210896264228, i64 118275819204, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [221 x i8] c"\DA\01\00Gsm_RPE_Encoding\01tmp1.ll:Weighting_filter\01tmp1.ll:RPE_grid_selection\01tmp1.ll:APCM_quantization\01tmp1.ll:APCM_inverse_quantization\01tmp1.ll:RPE_grid_positioning\01Gsm_RPE_Decoding\01tmp1.ll:APCM_quantization_xmaxc_to_exp_mant", section "__llvm_prf_names"
@llvm.used = appending global [9 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Gsm_RPE_Encoding to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Weighting_filter to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_RPE_grid_selection to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_APCM_quantization to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_APCM_inverse_quantization to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_RPE_grid_positioning to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Gsm_RPE_Decoding to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant to i8*), i8* getelementptr inbounds ([221 x i8], [221 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @Gsm_RPE_Encoding(%struct.gsm_state*, i16*, i16*, i16*, i16*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Gsm_RPE_Encoding, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Gsm_RPE_Encoding, i64 0, i64 0)
  %7 = alloca %struct.gsm_state*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca [40 x i16], align 16
  %13 = alloca [13 x i16], align 16
  %14 = alloca [13 x i16], align 16
  %15 = alloca i16, align 2
  %16 = alloca i16, align 2
  store %struct.gsm_state* %0, %struct.gsm_state** %7, align 8
  store i16* %1, i16** %8, align 8
  store i16* %2, i16** %9, align 8
  store i16* %3, i16** %10, align 8
  store i16* %4, i16** %11, align 8
  %17 = load i16*, i16** %8, align 8
  %18 = getelementptr inbounds [40 x i16], [40 x i16]* %12, i32 0, i32 0
  call void @Weighting_filter(i16* %17, i16* %18)
  %19 = getelementptr inbounds [40 x i16], [40 x i16]* %12, i32 0, i32 0
  %20 = getelementptr inbounds [13 x i16], [13 x i16]* %13, i32 0, i32 0
  %21 = load i16*, i16** %10, align 8
  call void @RPE_grid_selection(i16* %19, i16* %20, i16* %21)
  %22 = getelementptr inbounds [13 x i16], [13 x i16]* %13, i32 0, i32 0
  %23 = load i16*, i16** %11, align 8
  %24 = load i16*, i16** %9, align 8
  call void @APCM_quantization(i16* %22, i16* %23, i16* %15, i16* %16, i16* %24)
  %25 = load i16*, i16** %11, align 8
  %26 = load i16, i16* %15, align 2
  %27 = load i16, i16* %16, align 2
  %28 = getelementptr inbounds [13 x i16], [13 x i16]* %14, i32 0, i32 0
  call void @APCM_inverse_quantization(i16* %25, i16 signext %26, i16 signext %27, i16* %28)
  %29 = load i16*, i16** %10, align 8
  %30 = load i16, i16* %29, align 2
  %31 = getelementptr inbounds [13 x i16], [13 x i16]* %14, i32 0, i32 0
  %32 = load i16*, i16** %8, align 8
  call void @RPE_grid_positioning(i16 signext %30, i16* %31, i16* %32)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Weighting_filter(i16*, i16*) #0 {
  %3 = alloca i16*, align 8
  %4 = alloca i16*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  store i16* %0, i16** %3, align 8
  store i16* %1, i16** %4, align 8
  %7 = load i16*, i16** %3, align 8
  %8 = getelementptr inbounds i16, i16* %7, i64 -5
  store i16* %8, i16** %3, align 8
  store i32 0, i32* %6, align 4
  br label %9

; <label>:9:                                      ; preds = %126, %2
  %10 = load i32, i32* %6, align 4
  %11 = icmp sle i32 %10, 39
  br i1 %11, label %12, label %129

; <label>:12:                                     ; preds = %9
  store i64 4096, i64* %5, align 8
  %13 = load i16*, i16** %3, align 8
  %14 = load i32, i32* %6, align 4
  %15 = add nsw i32 %14, 0
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i16, i16* %13, i64 %16
  %18 = load i16, i16* %17, align 2
  %19 = sext i16 %18 to i64
  %20 = mul nsw i64 %19, -134
  %21 = load i64, i64* %5, align 8
  %22 = add nsw i64 %21, %20
  store i64 %22, i64* %5, align 8
  %23 = load i16*, i16** %3, align 8
  %24 = load i32, i32* %6, align 4
  %25 = add nsw i32 %24, 1
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i16, i16* %23, i64 %26
  %28 = load i16, i16* %27, align 2
  %29 = sext i16 %28 to i64
  %30 = mul nsw i64 %29, -374
  %31 = load i64, i64* %5, align 8
  %32 = add nsw i64 %31, %30
  store i64 %32, i64* %5, align 8
  %33 = load i16*, i16** %3, align 8
  %34 = load i32, i32* %6, align 4
  %35 = add nsw i32 %34, 3
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i16, i16* %33, i64 %36
  %38 = load i16, i16* %37, align 2
  %39 = sext i16 %38 to i64
  %40 = mul nsw i64 %39, 2054
  %41 = load i64, i64* %5, align 8
  %42 = add nsw i64 %41, %40
  store i64 %42, i64* %5, align 8
  %43 = load i16*, i16** %3, align 8
  %44 = load i32, i32* %6, align 4
  %45 = add nsw i32 %44, 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i16, i16* %43, i64 %46
  %48 = load i16, i16* %47, align 2
  %49 = sext i16 %48 to i64
  %50 = mul nsw i64 %49, 5741
  %51 = load i64, i64* %5, align 8
  %52 = add nsw i64 %51, %50
  store i64 %52, i64* %5, align 8
  %53 = load i16*, i16** %3, align 8
  %54 = load i32, i32* %6, align 4
  %55 = add nsw i32 %54, 5
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i16, i16* %53, i64 %56
  %58 = load i16, i16* %57, align 2
  %59 = sext i16 %58 to i64
  %60 = mul nsw i64 %59, 8192
  %61 = load i64, i64* %5, align 8
  %62 = add nsw i64 %61, %60
  store i64 %62, i64* %5, align 8
  %63 = load i16*, i16** %3, align 8
  %64 = load i32, i32* %6, align 4
  %65 = add nsw i32 %64, 6
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i16, i16* %63, i64 %66
  %68 = load i16, i16* %67, align 2
  %69 = sext i16 %68 to i64
  %70 = mul nsw i64 %69, 5741
  %71 = load i64, i64* %5, align 8
  %72 = add nsw i64 %71, %70
  store i64 %72, i64* %5, align 8
  %73 = load i16*, i16** %3, align 8
  %74 = load i32, i32* %6, align 4
  %75 = add nsw i32 %74, 7
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i16, i16* %73, i64 %76
  %78 = load i16, i16* %77, align 2
  %79 = sext i16 %78 to i64
  %80 = mul nsw i64 %79, 2054
  %81 = load i64, i64* %5, align 8
  %82 = add nsw i64 %81, %80
  store i64 %82, i64* %5, align 8
  %83 = load i16*, i16** %3, align 8
  %84 = load i32, i32* %6, align 4
  %85 = add nsw i32 %84, 9
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i16, i16* %83, i64 %86
  %88 = load i16, i16* %87, align 2
  %89 = sext i16 %88 to i64
  %90 = mul nsw i64 %89, -374
  %91 = load i64, i64* %5, align 8
  %92 = add nsw i64 %91, %90
  store i64 %92, i64* %5, align 8
  %93 = load i16*, i16** %3, align 8
  %94 = load i32, i32* %6, align 4
  %95 = add nsw i32 %94, 10
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i16, i16* %93, i64 %96
  %98 = load i16, i16* %97, align 2
  %99 = sext i16 %98 to i64
  %100 = mul nsw i64 %99, -134
  %101 = load i64, i64* %5, align 8
  %102 = add nsw i64 %101, %100
  store i64 %102, i64* %5, align 8
  %103 = load i64, i64* %5, align 8
  %104 = ashr i64 %103, 13
  store i64 %104, i64* %5, align 8
  %105 = load i64, i64* %5, align 8
  %106 = icmp slt i64 %105, -32768
  br i1 %106, label %107, label %109

; <label>:107:                                    ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Weighting_filter, i64 0, i64 0)
  %108 = add i64 %pgocount, 1
  store i64 %108, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Weighting_filter, i64 0, i64 0)
  br label %119

; <label>:109:                                    ; preds = %12
  %110 = load i64, i64* %5, align 8
  %111 = icmp sgt i64 %110, 32767
  br i1 %111, label %112, label %114

; <label>:112:                                    ; preds = %109
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Weighting_filter, i64 0, i64 1)
  %113 = add i64 %pgocount1, 1
  store i64 %113, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Weighting_filter, i64 0, i64 1)
  br label %117

; <label>:114:                                    ; preds = %109
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Weighting_filter, i64 0, i64 2)
  %115 = add i64 %pgocount2, 1
  store i64 %115, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Weighting_filter, i64 0, i64 2)
  %116 = load i64, i64* %5, align 8
  br label %117

; <label>:117:                                    ; preds = %114, %112
  %118 = phi i64 [ 32767, %112 ], [ %116, %114 ]
  br label %119

; <label>:119:                                    ; preds = %117, %107
  %120 = phi i64 [ -32768, %107 ], [ %118, %117 ]
  %121 = trunc i64 %120 to i16
  %122 = load i16*, i16** %4, align 8
  %123 = load i32, i32* %6, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i16, i16* %122, i64 %124
  store i16 %121, i16* %125, align 2
  br label %126

; <label>:126:                                    ; preds = %119
  %127 = load i32, i32* %6, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, i32* %6, align 4
  br label %9

; <label>:129:                                    ; preds = %9
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Weighting_filter, i64 0, i64 3)
  %130 = add i64 %pgocount3, 1
  store i64 %130, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Weighting_filter, i64 0, i64 3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @RPE_grid_selection(i16*, i16*, i16*) #0 {
  %4 = alloca i16*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i16, align 2
  %12 = alloca i64, align 8
  store i16* %0, i16** %4, align 8
  store i16* %1, i16** %5, align 8
  store i16* %2, i16** %6, align 8
  store i64 0, i64* %10, align 8
  store i16 0, i16* %11, align 2
  store i64 0, i64* %8, align 8
  %13 = load i16*, i16** %4, align 8
  %14 = getelementptr inbounds i16, i16* %13, i64 3
  %15 = load i16, i16* %14, align 2
  %16 = sext i16 %15 to i32
  %17 = ashr i32 %16, 2
  %18 = sext i32 %17 to i64
  store i64 %18, i64* %9, align 8
  %19 = load i64, i64* %9, align 8
  %20 = load i64, i64* %9, align 8
  %21 = mul nsw i64 %19, %20
  %22 = load i64, i64* %8, align 8
  %23 = add nsw i64 %22, %21
  store i64 %23, i64* %8, align 8
  %24 = load i16*, i16** %4, align 8
  %25 = getelementptr inbounds i16, i16* %24, i64 6
  %26 = load i16, i16* %25, align 2
  %27 = sext i16 %26 to i32
  %28 = ashr i32 %27, 2
  %29 = sext i32 %28 to i64
  store i64 %29, i64* %9, align 8
  %30 = load i64, i64* %9, align 8
  %31 = load i64, i64* %9, align 8
  %32 = mul nsw i64 %30, %31
  %33 = load i64, i64* %8, align 8
  %34 = add nsw i64 %33, %32
  store i64 %34, i64* %8, align 8
  %35 = load i16*, i16** %4, align 8
  %36 = getelementptr inbounds i16, i16* %35, i64 9
  %37 = load i16, i16* %36, align 2
  %38 = sext i16 %37 to i32
  %39 = ashr i32 %38, 2
  %40 = sext i32 %39 to i64
  store i64 %40, i64* %9, align 8
  %41 = load i64, i64* %9, align 8
  %42 = load i64, i64* %9, align 8
  %43 = mul nsw i64 %41, %42
  %44 = load i64, i64* %8, align 8
  %45 = add nsw i64 %44, %43
  store i64 %45, i64* %8, align 8
  %46 = load i16*, i16** %4, align 8
  %47 = getelementptr inbounds i16, i16* %46, i64 12
  %48 = load i16, i16* %47, align 2
  %49 = sext i16 %48 to i32
  %50 = ashr i32 %49, 2
  %51 = sext i32 %50 to i64
  store i64 %51, i64* %9, align 8
  %52 = load i64, i64* %9, align 8
  %53 = load i64, i64* %9, align 8
  %54 = mul nsw i64 %52, %53
  %55 = load i64, i64* %8, align 8
  %56 = add nsw i64 %55, %54
  store i64 %56, i64* %8, align 8
  %57 = load i16*, i16** %4, align 8
  %58 = getelementptr inbounds i16, i16* %57, i64 15
  %59 = load i16, i16* %58, align 2
  %60 = sext i16 %59 to i32
  %61 = ashr i32 %60, 2
  %62 = sext i32 %61 to i64
  store i64 %62, i64* %9, align 8
  %63 = load i64, i64* %9, align 8
  %64 = load i64, i64* %9, align 8
  %65 = mul nsw i64 %63, %64
  %66 = load i64, i64* %8, align 8
  %67 = add nsw i64 %66, %65
  store i64 %67, i64* %8, align 8
  %68 = load i16*, i16** %4, align 8
  %69 = getelementptr inbounds i16, i16* %68, i64 18
  %70 = load i16, i16* %69, align 2
  %71 = sext i16 %70 to i32
  %72 = ashr i32 %71, 2
  %73 = sext i32 %72 to i64
  store i64 %73, i64* %9, align 8
  %74 = load i64, i64* %9, align 8
  %75 = load i64, i64* %9, align 8
  %76 = mul nsw i64 %74, %75
  %77 = load i64, i64* %8, align 8
  %78 = add nsw i64 %77, %76
  store i64 %78, i64* %8, align 8
  %79 = load i16*, i16** %4, align 8
  %80 = getelementptr inbounds i16, i16* %79, i64 21
  %81 = load i16, i16* %80, align 2
  %82 = sext i16 %81 to i32
  %83 = ashr i32 %82, 2
  %84 = sext i32 %83 to i64
  store i64 %84, i64* %9, align 8
  %85 = load i64, i64* %9, align 8
  %86 = load i64, i64* %9, align 8
  %87 = mul nsw i64 %85, %86
  %88 = load i64, i64* %8, align 8
  %89 = add nsw i64 %88, %87
  store i64 %89, i64* %8, align 8
  %90 = load i16*, i16** %4, align 8
  %91 = getelementptr inbounds i16, i16* %90, i64 24
  %92 = load i16, i16* %91, align 2
  %93 = sext i16 %92 to i32
  %94 = ashr i32 %93, 2
  %95 = sext i32 %94 to i64
  store i64 %95, i64* %9, align 8
  %96 = load i64, i64* %9, align 8
  %97 = load i64, i64* %9, align 8
  %98 = mul nsw i64 %96, %97
  %99 = load i64, i64* %8, align 8
  %100 = add nsw i64 %99, %98
  store i64 %100, i64* %8, align 8
  %101 = load i16*, i16** %4, align 8
  %102 = getelementptr inbounds i16, i16* %101, i64 27
  %103 = load i16, i16* %102, align 2
  %104 = sext i16 %103 to i32
  %105 = ashr i32 %104, 2
  %106 = sext i32 %105 to i64
  store i64 %106, i64* %9, align 8
  %107 = load i64, i64* %9, align 8
  %108 = load i64, i64* %9, align 8
  %109 = mul nsw i64 %107, %108
  %110 = load i64, i64* %8, align 8
  %111 = add nsw i64 %110, %109
  store i64 %111, i64* %8, align 8
  %112 = load i16*, i16** %4, align 8
  %113 = getelementptr inbounds i16, i16* %112, i64 30
  %114 = load i16, i16* %113, align 2
  %115 = sext i16 %114 to i32
  %116 = ashr i32 %115, 2
  %117 = sext i32 %116 to i64
  store i64 %117, i64* %9, align 8
  %118 = load i64, i64* %9, align 8
  %119 = load i64, i64* %9, align 8
  %120 = mul nsw i64 %118, %119
  %121 = load i64, i64* %8, align 8
  %122 = add nsw i64 %121, %120
  store i64 %122, i64* %8, align 8
  %123 = load i16*, i16** %4, align 8
  %124 = getelementptr inbounds i16, i16* %123, i64 33
  %125 = load i16, i16* %124, align 2
  %126 = sext i16 %125 to i32
  %127 = ashr i32 %126, 2
  %128 = sext i32 %127 to i64
  store i64 %128, i64* %9, align 8
  %129 = load i64, i64* %9, align 8
  %130 = load i64, i64* %9, align 8
  %131 = mul nsw i64 %129, %130
  %132 = load i64, i64* %8, align 8
  %133 = add nsw i64 %132, %131
  store i64 %133, i64* %8, align 8
  %134 = load i16*, i16** %4, align 8
  %135 = getelementptr inbounds i16, i16* %134, i64 36
  %136 = load i16, i16* %135, align 2
  %137 = sext i16 %136 to i32
  %138 = ashr i32 %137, 2
  %139 = sext i32 %138 to i64
  store i64 %139, i64* %9, align 8
  %140 = load i64, i64* %9, align 8
  %141 = load i64, i64* %9, align 8
  %142 = mul nsw i64 %140, %141
  %143 = load i64, i64* %8, align 8
  %144 = add nsw i64 %143, %142
  store i64 %144, i64* %8, align 8
  %145 = load i64, i64* %8, align 8
  store i64 %145, i64* %12, align 8
  %146 = load i16*, i16** %4, align 8
  %147 = getelementptr inbounds i16, i16* %146, i64 0
  %148 = load i16, i16* %147, align 2
  %149 = sext i16 %148 to i32
  %150 = ashr i32 %149, 2
  %151 = sext i32 %150 to i64
  store i64 %151, i64* %9, align 8
  %152 = load i64, i64* %9, align 8
  %153 = load i64, i64* %9, align 8
  %154 = mul nsw i64 %152, %153
  %155 = load i64, i64* %8, align 8
  %156 = add nsw i64 %155, %154
  store i64 %156, i64* %8, align 8
  %157 = load i64, i64* %8, align 8
  %158 = shl i64 %157, 1
  store i64 %158, i64* %8, align 8
  %159 = load i64, i64* %8, align 8
  store i64 %159, i64* %10, align 8
  store i64 0, i64* %8, align 8
  %160 = load i16*, i16** %4, align 8
  %161 = getelementptr inbounds i16, i16* %160, i64 1
  %162 = load i16, i16* %161, align 2
  %163 = sext i16 %162 to i32
  %164 = ashr i32 %163, 2
  %165 = sext i32 %164 to i64
  store i64 %165, i64* %9, align 8
  %166 = load i64, i64* %9, align 8
  %167 = load i64, i64* %9, align 8
  %168 = mul nsw i64 %166, %167
  %169 = load i64, i64* %8, align 8
  %170 = add nsw i64 %169, %168
  store i64 %170, i64* %8, align 8
  %171 = load i16*, i16** %4, align 8
  %172 = getelementptr inbounds i16, i16* %171, i64 4
  %173 = load i16, i16* %172, align 2
  %174 = sext i16 %173 to i32
  %175 = ashr i32 %174, 2
  %176 = sext i32 %175 to i64
  store i64 %176, i64* %9, align 8
  %177 = load i64, i64* %9, align 8
  %178 = load i64, i64* %9, align 8
  %179 = mul nsw i64 %177, %178
  %180 = load i64, i64* %8, align 8
  %181 = add nsw i64 %180, %179
  store i64 %181, i64* %8, align 8
  %182 = load i16*, i16** %4, align 8
  %183 = getelementptr inbounds i16, i16* %182, i64 7
  %184 = load i16, i16* %183, align 2
  %185 = sext i16 %184 to i32
  %186 = ashr i32 %185, 2
  %187 = sext i32 %186 to i64
  store i64 %187, i64* %9, align 8
  %188 = load i64, i64* %9, align 8
  %189 = load i64, i64* %9, align 8
  %190 = mul nsw i64 %188, %189
  %191 = load i64, i64* %8, align 8
  %192 = add nsw i64 %191, %190
  store i64 %192, i64* %8, align 8
  %193 = load i16*, i16** %4, align 8
  %194 = getelementptr inbounds i16, i16* %193, i64 10
  %195 = load i16, i16* %194, align 2
  %196 = sext i16 %195 to i32
  %197 = ashr i32 %196, 2
  %198 = sext i32 %197 to i64
  store i64 %198, i64* %9, align 8
  %199 = load i64, i64* %9, align 8
  %200 = load i64, i64* %9, align 8
  %201 = mul nsw i64 %199, %200
  %202 = load i64, i64* %8, align 8
  %203 = add nsw i64 %202, %201
  store i64 %203, i64* %8, align 8
  %204 = load i16*, i16** %4, align 8
  %205 = getelementptr inbounds i16, i16* %204, i64 13
  %206 = load i16, i16* %205, align 2
  %207 = sext i16 %206 to i32
  %208 = ashr i32 %207, 2
  %209 = sext i32 %208 to i64
  store i64 %209, i64* %9, align 8
  %210 = load i64, i64* %9, align 8
  %211 = load i64, i64* %9, align 8
  %212 = mul nsw i64 %210, %211
  %213 = load i64, i64* %8, align 8
  %214 = add nsw i64 %213, %212
  store i64 %214, i64* %8, align 8
  %215 = load i16*, i16** %4, align 8
  %216 = getelementptr inbounds i16, i16* %215, i64 16
  %217 = load i16, i16* %216, align 2
  %218 = sext i16 %217 to i32
  %219 = ashr i32 %218, 2
  %220 = sext i32 %219 to i64
  store i64 %220, i64* %9, align 8
  %221 = load i64, i64* %9, align 8
  %222 = load i64, i64* %9, align 8
  %223 = mul nsw i64 %221, %222
  %224 = load i64, i64* %8, align 8
  %225 = add nsw i64 %224, %223
  store i64 %225, i64* %8, align 8
  %226 = load i16*, i16** %4, align 8
  %227 = getelementptr inbounds i16, i16* %226, i64 19
  %228 = load i16, i16* %227, align 2
  %229 = sext i16 %228 to i32
  %230 = ashr i32 %229, 2
  %231 = sext i32 %230 to i64
  store i64 %231, i64* %9, align 8
  %232 = load i64, i64* %9, align 8
  %233 = load i64, i64* %9, align 8
  %234 = mul nsw i64 %232, %233
  %235 = load i64, i64* %8, align 8
  %236 = add nsw i64 %235, %234
  store i64 %236, i64* %8, align 8
  %237 = load i16*, i16** %4, align 8
  %238 = getelementptr inbounds i16, i16* %237, i64 22
  %239 = load i16, i16* %238, align 2
  %240 = sext i16 %239 to i32
  %241 = ashr i32 %240, 2
  %242 = sext i32 %241 to i64
  store i64 %242, i64* %9, align 8
  %243 = load i64, i64* %9, align 8
  %244 = load i64, i64* %9, align 8
  %245 = mul nsw i64 %243, %244
  %246 = load i64, i64* %8, align 8
  %247 = add nsw i64 %246, %245
  store i64 %247, i64* %8, align 8
  %248 = load i16*, i16** %4, align 8
  %249 = getelementptr inbounds i16, i16* %248, i64 25
  %250 = load i16, i16* %249, align 2
  %251 = sext i16 %250 to i32
  %252 = ashr i32 %251, 2
  %253 = sext i32 %252 to i64
  store i64 %253, i64* %9, align 8
  %254 = load i64, i64* %9, align 8
  %255 = load i64, i64* %9, align 8
  %256 = mul nsw i64 %254, %255
  %257 = load i64, i64* %8, align 8
  %258 = add nsw i64 %257, %256
  store i64 %258, i64* %8, align 8
  %259 = load i16*, i16** %4, align 8
  %260 = getelementptr inbounds i16, i16* %259, i64 28
  %261 = load i16, i16* %260, align 2
  %262 = sext i16 %261 to i32
  %263 = ashr i32 %262, 2
  %264 = sext i32 %263 to i64
  store i64 %264, i64* %9, align 8
  %265 = load i64, i64* %9, align 8
  %266 = load i64, i64* %9, align 8
  %267 = mul nsw i64 %265, %266
  %268 = load i64, i64* %8, align 8
  %269 = add nsw i64 %268, %267
  store i64 %269, i64* %8, align 8
  %270 = load i16*, i16** %4, align 8
  %271 = getelementptr inbounds i16, i16* %270, i64 31
  %272 = load i16, i16* %271, align 2
  %273 = sext i16 %272 to i32
  %274 = ashr i32 %273, 2
  %275 = sext i32 %274 to i64
  store i64 %275, i64* %9, align 8
  %276 = load i64, i64* %9, align 8
  %277 = load i64, i64* %9, align 8
  %278 = mul nsw i64 %276, %277
  %279 = load i64, i64* %8, align 8
  %280 = add nsw i64 %279, %278
  store i64 %280, i64* %8, align 8
  %281 = load i16*, i16** %4, align 8
  %282 = getelementptr inbounds i16, i16* %281, i64 34
  %283 = load i16, i16* %282, align 2
  %284 = sext i16 %283 to i32
  %285 = ashr i32 %284, 2
  %286 = sext i32 %285 to i64
  store i64 %286, i64* %9, align 8
  %287 = load i64, i64* %9, align 8
  %288 = load i64, i64* %9, align 8
  %289 = mul nsw i64 %287, %288
  %290 = load i64, i64* %8, align 8
  %291 = add nsw i64 %290, %289
  store i64 %291, i64* %8, align 8
  %292 = load i16*, i16** %4, align 8
  %293 = getelementptr inbounds i16, i16* %292, i64 37
  %294 = load i16, i16* %293, align 2
  %295 = sext i16 %294 to i32
  %296 = ashr i32 %295, 2
  %297 = sext i32 %296 to i64
  store i64 %297, i64* %9, align 8
  %298 = load i64, i64* %9, align 8
  %299 = load i64, i64* %9, align 8
  %300 = mul nsw i64 %298, %299
  %301 = load i64, i64* %8, align 8
  %302 = add nsw i64 %301, %300
  store i64 %302, i64* %8, align 8
  %303 = load i64, i64* %8, align 8
  %304 = shl i64 %303, 1
  store i64 %304, i64* %8, align 8
  %305 = load i64, i64* %8, align 8
  %306 = load i64, i64* %10, align 8
  %307 = icmp sgt i64 %305, %306
  br i1 %307, label %308, label %311

; <label>:308:                                    ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_RPE_grid_selection, i64 0, i64 2)
  %309 = add i64 %pgocount, 1
  store i64 %309, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_RPE_grid_selection, i64 0, i64 2)
  store i16 1, i16* %11, align 2
  %310 = load i64, i64* %8, align 8
  store i64 %310, i64* %10, align 8
  br label %311

; <label>:311:                                    ; preds = %308, %3
  store i64 0, i64* %8, align 8
  %312 = load i16*, i16** %4, align 8
  %313 = getelementptr inbounds i16, i16* %312, i64 2
  %314 = load i16, i16* %313, align 2
  %315 = sext i16 %314 to i32
  %316 = ashr i32 %315, 2
  %317 = sext i32 %316 to i64
  store i64 %317, i64* %9, align 8
  %318 = load i64, i64* %9, align 8
  %319 = load i64, i64* %9, align 8
  %320 = mul nsw i64 %318, %319
  %321 = load i64, i64* %8, align 8
  %322 = add nsw i64 %321, %320
  store i64 %322, i64* %8, align 8
  %323 = load i16*, i16** %4, align 8
  %324 = getelementptr inbounds i16, i16* %323, i64 5
  %325 = load i16, i16* %324, align 2
  %326 = sext i16 %325 to i32
  %327 = ashr i32 %326, 2
  %328 = sext i32 %327 to i64
  store i64 %328, i64* %9, align 8
  %329 = load i64, i64* %9, align 8
  %330 = load i64, i64* %9, align 8
  %331 = mul nsw i64 %329, %330
  %332 = load i64, i64* %8, align 8
  %333 = add nsw i64 %332, %331
  store i64 %333, i64* %8, align 8
  %334 = load i16*, i16** %4, align 8
  %335 = getelementptr inbounds i16, i16* %334, i64 8
  %336 = load i16, i16* %335, align 2
  %337 = sext i16 %336 to i32
  %338 = ashr i32 %337, 2
  %339 = sext i32 %338 to i64
  store i64 %339, i64* %9, align 8
  %340 = load i64, i64* %9, align 8
  %341 = load i64, i64* %9, align 8
  %342 = mul nsw i64 %340, %341
  %343 = load i64, i64* %8, align 8
  %344 = add nsw i64 %343, %342
  store i64 %344, i64* %8, align 8
  %345 = load i16*, i16** %4, align 8
  %346 = getelementptr inbounds i16, i16* %345, i64 11
  %347 = load i16, i16* %346, align 2
  %348 = sext i16 %347 to i32
  %349 = ashr i32 %348, 2
  %350 = sext i32 %349 to i64
  store i64 %350, i64* %9, align 8
  %351 = load i64, i64* %9, align 8
  %352 = load i64, i64* %9, align 8
  %353 = mul nsw i64 %351, %352
  %354 = load i64, i64* %8, align 8
  %355 = add nsw i64 %354, %353
  store i64 %355, i64* %8, align 8
  %356 = load i16*, i16** %4, align 8
  %357 = getelementptr inbounds i16, i16* %356, i64 14
  %358 = load i16, i16* %357, align 2
  %359 = sext i16 %358 to i32
  %360 = ashr i32 %359, 2
  %361 = sext i32 %360 to i64
  store i64 %361, i64* %9, align 8
  %362 = load i64, i64* %9, align 8
  %363 = load i64, i64* %9, align 8
  %364 = mul nsw i64 %362, %363
  %365 = load i64, i64* %8, align 8
  %366 = add nsw i64 %365, %364
  store i64 %366, i64* %8, align 8
  %367 = load i16*, i16** %4, align 8
  %368 = getelementptr inbounds i16, i16* %367, i64 17
  %369 = load i16, i16* %368, align 2
  %370 = sext i16 %369 to i32
  %371 = ashr i32 %370, 2
  %372 = sext i32 %371 to i64
  store i64 %372, i64* %9, align 8
  %373 = load i64, i64* %9, align 8
  %374 = load i64, i64* %9, align 8
  %375 = mul nsw i64 %373, %374
  %376 = load i64, i64* %8, align 8
  %377 = add nsw i64 %376, %375
  store i64 %377, i64* %8, align 8
  %378 = load i16*, i16** %4, align 8
  %379 = getelementptr inbounds i16, i16* %378, i64 20
  %380 = load i16, i16* %379, align 2
  %381 = sext i16 %380 to i32
  %382 = ashr i32 %381, 2
  %383 = sext i32 %382 to i64
  store i64 %383, i64* %9, align 8
  %384 = load i64, i64* %9, align 8
  %385 = load i64, i64* %9, align 8
  %386 = mul nsw i64 %384, %385
  %387 = load i64, i64* %8, align 8
  %388 = add nsw i64 %387, %386
  store i64 %388, i64* %8, align 8
  %389 = load i16*, i16** %4, align 8
  %390 = getelementptr inbounds i16, i16* %389, i64 23
  %391 = load i16, i16* %390, align 2
  %392 = sext i16 %391 to i32
  %393 = ashr i32 %392, 2
  %394 = sext i32 %393 to i64
  store i64 %394, i64* %9, align 8
  %395 = load i64, i64* %9, align 8
  %396 = load i64, i64* %9, align 8
  %397 = mul nsw i64 %395, %396
  %398 = load i64, i64* %8, align 8
  %399 = add nsw i64 %398, %397
  store i64 %399, i64* %8, align 8
  %400 = load i16*, i16** %4, align 8
  %401 = getelementptr inbounds i16, i16* %400, i64 26
  %402 = load i16, i16* %401, align 2
  %403 = sext i16 %402 to i32
  %404 = ashr i32 %403, 2
  %405 = sext i32 %404 to i64
  store i64 %405, i64* %9, align 8
  %406 = load i64, i64* %9, align 8
  %407 = load i64, i64* %9, align 8
  %408 = mul nsw i64 %406, %407
  %409 = load i64, i64* %8, align 8
  %410 = add nsw i64 %409, %408
  store i64 %410, i64* %8, align 8
  %411 = load i16*, i16** %4, align 8
  %412 = getelementptr inbounds i16, i16* %411, i64 29
  %413 = load i16, i16* %412, align 2
  %414 = sext i16 %413 to i32
  %415 = ashr i32 %414, 2
  %416 = sext i32 %415 to i64
  store i64 %416, i64* %9, align 8
  %417 = load i64, i64* %9, align 8
  %418 = load i64, i64* %9, align 8
  %419 = mul nsw i64 %417, %418
  %420 = load i64, i64* %8, align 8
  %421 = add nsw i64 %420, %419
  store i64 %421, i64* %8, align 8
  %422 = load i16*, i16** %4, align 8
  %423 = getelementptr inbounds i16, i16* %422, i64 32
  %424 = load i16, i16* %423, align 2
  %425 = sext i16 %424 to i32
  %426 = ashr i32 %425, 2
  %427 = sext i32 %426 to i64
  store i64 %427, i64* %9, align 8
  %428 = load i64, i64* %9, align 8
  %429 = load i64, i64* %9, align 8
  %430 = mul nsw i64 %428, %429
  %431 = load i64, i64* %8, align 8
  %432 = add nsw i64 %431, %430
  store i64 %432, i64* %8, align 8
  %433 = load i16*, i16** %4, align 8
  %434 = getelementptr inbounds i16, i16* %433, i64 35
  %435 = load i16, i16* %434, align 2
  %436 = sext i16 %435 to i32
  %437 = ashr i32 %436, 2
  %438 = sext i32 %437 to i64
  store i64 %438, i64* %9, align 8
  %439 = load i64, i64* %9, align 8
  %440 = load i64, i64* %9, align 8
  %441 = mul nsw i64 %439, %440
  %442 = load i64, i64* %8, align 8
  %443 = add nsw i64 %442, %441
  store i64 %443, i64* %8, align 8
  %444 = load i16*, i16** %4, align 8
  %445 = getelementptr inbounds i16, i16* %444, i64 38
  %446 = load i16, i16* %445, align 2
  %447 = sext i16 %446 to i32
  %448 = ashr i32 %447, 2
  %449 = sext i32 %448 to i64
  store i64 %449, i64* %9, align 8
  %450 = load i64, i64* %9, align 8
  %451 = load i64, i64* %9, align 8
  %452 = mul nsw i64 %450, %451
  %453 = load i64, i64* %8, align 8
  %454 = add nsw i64 %453, %452
  store i64 %454, i64* %8, align 8
  %455 = load i64, i64* %8, align 8
  %456 = shl i64 %455, 1
  store i64 %456, i64* %8, align 8
  %457 = load i64, i64* %8, align 8
  %458 = load i64, i64* %10, align 8
  %459 = icmp sgt i64 %457, %458
  br i1 %459, label %460, label %463

; <label>:460:                                    ; preds = %311
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_RPE_grid_selection, i64 0, i64 3)
  %461 = add i64 %pgocount1, 1
  store i64 %461, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_RPE_grid_selection, i64 0, i64 3)
  store i16 2, i16* %11, align 2
  %462 = load i64, i64* %8, align 8
  store i64 %462, i64* %10, align 8
  br label %463

; <label>:463:                                    ; preds = %460, %311
  %464 = load i64, i64* %12, align 8
  store i64 %464, i64* %8, align 8
  %465 = load i16*, i16** %4, align 8
  %466 = getelementptr inbounds i16, i16* %465, i64 39
  %467 = load i16, i16* %466, align 2
  %468 = sext i16 %467 to i32
  %469 = ashr i32 %468, 2
  %470 = sext i32 %469 to i64
  store i64 %470, i64* %9, align 8
  %471 = load i64, i64* %9, align 8
  %472 = load i64, i64* %9, align 8
  %473 = mul nsw i64 %471, %472
  %474 = load i64, i64* %8, align 8
  %475 = add nsw i64 %474, %473
  store i64 %475, i64* %8, align 8
  %476 = load i64, i64* %8, align 8
  %477 = shl i64 %476, 1
  store i64 %477, i64* %8, align 8
  %478 = load i64, i64* %8, align 8
  %479 = load i64, i64* %10, align 8
  %480 = icmp sgt i64 %478, %479
  br i1 %480, label %481, label %484

; <label>:481:                                    ; preds = %463
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_RPE_grid_selection, i64 0, i64 4)
  %482 = add i64 %pgocount2, 1
  store i64 %482, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_RPE_grid_selection, i64 0, i64 4)
  store i16 3, i16* %11, align 2
  %483 = load i64, i64* %8, align 8
  store i64 %483, i64* %10, align 8
  br label %484

; <label>:484:                                    ; preds = %481, %463
  store i32 0, i32* %7, align 4
  br label %485

; <label>:485:                                    ; preds = %502, %484
  %486 = load i32, i32* %7, align 4
  %487 = icmp sle i32 %486, 12
  br i1 %487, label %488, label %506

; <label>:488:                                    ; preds = %485
  %489 = load i16*, i16** %4, align 8
  %490 = load i16, i16* %11, align 2
  %491 = sext i16 %490 to i32
  %492 = load i32, i32* %7, align 4
  %493 = mul nsw i32 3, %492
  %494 = add nsw i32 %491, %493
  %495 = sext i32 %494 to i64
  %496 = getelementptr inbounds i16, i16* %489, i64 %495
  %497 = load i16, i16* %496, align 2
  %498 = load i16*, i16** %5, align 8
  %499 = load i32, i32* %7, align 4
  %500 = sext i32 %499 to i64
  %501 = getelementptr inbounds i16, i16* %498, i64 %500
  store i16 %497, i16* %501, align 2
  br label %502

; <label>:502:                                    ; preds = %488
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_RPE_grid_selection, i64 0, i64 0)
  %503 = add i64 %pgocount3, 1
  store i64 %503, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_RPE_grid_selection, i64 0, i64 0)
  %504 = load i32, i32* %7, align 4
  %505 = add nsw i32 %504, 1
  store i32 %505, i32* %7, align 4
  br label %485

; <label>:506:                                    ; preds = %485
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_RPE_grid_selection, i64 0, i64 1)
  %507 = add i64 %pgocount4, 1
  store i64 %507, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_RPE_grid_selection, i64 0, i64 1)
  %508 = load i16, i16* %11, align 2
  %509 = load i16*, i16** %6, align 8
  store i16 %508, i16* %509, align 2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @APCM_quantization(i16*, i16*, i16*, i16*, i16*) #0 {
  %6 = alloca i16*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i16, align 2
  %14 = alloca i16, align 2
  %15 = alloca i16, align 2
  %16 = alloca i16, align 2
  %17 = alloca i16, align 2
  %18 = alloca i16, align 2
  %19 = alloca i16, align 2
  store i16* %0, i16** %6, align 8
  store i16* %1, i16** %7, align 8
  store i16* %2, i16** %8, align 8
  store i16* %3, i16** %9, align 8
  store i16* %4, i16** %10, align 8
  store i16 0, i16* %13, align 2
  store i32 0, i32* %11, align 4
  br label %20

; <label>:20:                                     ; preds = %61, %5
  %21 = load i32, i32* %11, align 4
  %22 = icmp sle i32 %21, 12
  br i1 %22, label %23, label %64

; <label>:23:                                     ; preds = %20
  %24 = load i16*, i16** %6, align 8
  %25 = load i32, i32* %11, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i16, i16* %24, i64 %26
  %28 = load i16, i16* %27, align 2
  store i16 %28, i16* %15, align 2
  %29 = load i16, i16* %15, align 2
  %30 = sext i16 %29 to i32
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %32, label %45

; <label>:32:                                     ; preds = %23
  %33 = load i16, i16* %15, align 2
  %34 = sext i16 %33 to i32
  %35 = icmp eq i32 %34, -32768
  br i1 %35, label %36, label %38

; <label>:36:                                     ; preds = %32
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 5)
  %37 = add i64 %pgocount, 1
  store i64 %37, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 5)
  br label %43

; <label>:38:                                     ; preds = %32
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 6)
  %39 = add i64 %pgocount5, 1
  store i64 %39, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 6)
  %40 = load i16, i16* %15, align 2
  %41 = sext i16 %40 to i32
  %42 = sub nsw i32 0, %41
  br label %43

; <label>:43:                                     ; preds = %38, %36
  %44 = phi i32 [ 32767, %36 ], [ %42, %38 ]
  br label %49

; <label>:45:                                     ; preds = %23
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 2)
  %46 = add i64 %pgocount6, 1
  store i64 %46, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 2)
  %47 = load i16, i16* %15, align 2
  %48 = sext i16 %47 to i32
  br label %49

; <label>:49:                                     ; preds = %45, %43
  %50 = phi i32 [ %44, %43 ], [ %48, %45 ]
  %51 = trunc i32 %50 to i16
  store i16 %51, i16* %15, align 2
  %52 = load i16, i16* %15, align 2
  %53 = sext i16 %52 to i32
  %54 = load i16, i16* %13, align 2
  %55 = sext i16 %54 to i32
  %56 = icmp sgt i32 %53, %55
  br i1 %56, label %57, label %60

; <label>:57:                                     ; preds = %49
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 3)
  %58 = add i64 %pgocount7, 1
  store i64 %58, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 3)
  %59 = load i16, i16* %15, align 2
  store i16 %59, i16* %13, align 2
  br label %60

; <label>:60:                                     ; preds = %57, %49
  br label %61

; <label>:61:                                     ; preds = %60
  %62 = load i32, i32* %11, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %11, align 4
  br label %20

; <label>:64:                                     ; preds = %20
  store i16 0, i16* %18, align 2
  %65 = load i16, i16* %13, align 2
  %66 = sext i16 %65 to i32
  %67 = ashr i32 %66, 9
  %68 = trunc i32 %67 to i16
  store i16 %68, i16* %15, align 2
  store i32 0, i32* %12, align 4
  store i32 0, i32* %11, align 4
  br label %69

; <label>:69:                                     ; preds = %99, %64
  %70 = load i32, i32* %11, align 4
  %71 = icmp sle i32 %70, 5
  br i1 %71, label %72, label %102

; <label>:72:                                     ; preds = %69
  %73 = load i16, i16* %15, align 2
  %74 = sext i16 %73 to i32
  %75 = icmp sle i32 %74, 0
  %76 = zext i1 %75 to i32
  %77 = load i32, i32* %12, align 4
  %78 = or i32 %77, %76
  store i32 %78, i32* %12, align 4
  %79 = load i16, i16* %15, align 2
  %80 = sext i16 %79 to i32
  %81 = ashr i32 %80, 1
  %82 = trunc i32 %81 to i16
  store i16 %82, i16* %15, align 2
  %83 = load i16, i16* %18, align 2
  %84 = sext i16 %83 to i32
  %85 = icmp sle i32 %84, 5
  br i1 %85, label %86, label %88

; <label>:86:                                     ; preds = %72
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 0)
  %87 = add i64 %pgocount8, 1
  store i64 %87, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 0)
  br label %91

; <label>:88:                                     ; preds = %72
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 14)
  %89 = add i64 %pgocount9, 1
  store i64 %89, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 14)
  call void @__assert_fail(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 293, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.APCM_quantization, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %91

; <label>:91:                                     ; preds = %90, %86
  %92 = load i32, i32* %12, align 4
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %94, label %98

; <label>:94:                                     ; preds = %91
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 4)
  %95 = add i64 %pgocount10, 1
  store i64 %95, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 4)
  %96 = load i16, i16* %18, align 2
  %97 = add i16 %96, 1
  store i16 %97, i16* %18, align 2
  br label %98

; <label>:98:                                     ; preds = %94, %91
  br label %99

; <label>:99:                                     ; preds = %98
  %100 = load i32, i32* %11, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, i32* %11, align 4
  br label %69

; <label>:102:                                    ; preds = %69
  %103 = load i16, i16* %18, align 2
  %104 = sext i16 %103 to i32
  %105 = icmp sle i32 %104, 6
  br i1 %105, label %106, label %112

; <label>:106:                                    ; preds = %102
  %107 = load i16, i16* %18, align 2
  %108 = sext i16 %107 to i32
  %109 = icmp sge i32 %108, 0
  br i1 %109, label %111, label %._crit_edge1

._crit_edge1:                                     ; preds = %106
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 9)
  %110 = add i64 %pgocount11, 1
  store i64 %110, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 9)
  br label %112

; <label>:111:                                    ; preds = %106
  br label %115

; <label>:112:                                    ; preds = %._crit_edge1, %102
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 15)
  %113 = add i64 %pgocount12, 1
  store i64 %113, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 15)
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 297, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.APCM_quantization, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %115

; <label>:115:                                    ; preds = %114, %111
  %116 = load i16, i16* %18, align 2
  %117 = sext i16 %116 to i32
  %118 = add nsw i32 %117, 5
  %119 = trunc i32 %118 to i16
  store i16 %119, i16* %15, align 2
  %120 = load i16, i16* %15, align 2
  %121 = sext i16 %120 to i32
  %122 = icmp sle i32 %121, 11
  br i1 %122, label %123, label %129

; <label>:123:                                    ; preds = %115
  %124 = load i16, i16* %15, align 2
  %125 = sext i16 %124 to i32
  %126 = icmp sge i32 %125, 0
  br i1 %126, label %128, label %._crit_edge2

._crit_edge2:                                     ; preds = %123
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 10)
  %127 = add i64 %pgocount13, 1
  store i64 %127, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 10)
  br label %129

; <label>:128:                                    ; preds = %123
  br label %132

; <label>:129:                                    ; preds = %._crit_edge2, %115
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 16)
  %130 = add i64 %pgocount14, 1
  store i64 %130, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 16)
  call void @__assert_fail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 300, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.APCM_quantization, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %132

; <label>:132:                                    ; preds = %131, %128
  %133 = load i16, i16* %13, align 2
  %134 = sext i16 %133 to i32
  %135 = load i16, i16* %15, align 2
  %136 = sext i16 %135 to i32
  %137 = ashr i32 %134, %136
  %138 = trunc i32 %137 to i16
  %139 = load i16, i16* %18, align 2
  %140 = sext i16 %139 to i32
  %141 = shl i32 %140, 3
  %142 = trunc i32 %141 to i16
  %143 = call signext i16 @gsm_add(i16 signext %138, i16 signext %142)
  store i16 %143, i16* %14, align 2
  %144 = load i16, i16* %14, align 2
  call void @APCM_quantization_xmaxc_to_exp_mant(i16 signext %144, i16* %18, i16* %19)
  %145 = load i16, i16* %18, align 2
  %146 = sext i16 %145 to i32
  %147 = icmp sle i32 %146, 4096
  br i1 %147, label %148, label %154

; <label>:148:                                    ; preds = %132
  %149 = load i16, i16* %18, align 2
  %150 = sext i16 %149 to i32
  %151 = icmp sge i32 %150, -4096
  br i1 %151, label %153, label %._crit_edge3

._crit_edge3:                                     ; preds = %148
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 11)
  %152 = add i64 %pgocount15, 1
  store i64 %152, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 11)
  br label %154

; <label>:153:                                    ; preds = %148
  br label %157

; <label>:154:                                    ; preds = %._crit_edge3, %132
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 17)
  %155 = add i64 %pgocount16, 1
  store i64 %155, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 17)
  call void @__assert_fail(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 323, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.APCM_quantization, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %157

; <label>:157:                                    ; preds = %156, %153
  %158 = load i16, i16* %19, align 2
  %159 = sext i16 %158 to i32
  %160 = icmp sge i32 %159, 0
  br i1 %160, label %161, label %167

; <label>:161:                                    ; preds = %157
  %162 = load i16, i16* %19, align 2
  %163 = sext i16 %162 to i32
  %164 = icmp sle i32 %163, 7
  br i1 %164, label %166, label %._crit_edge4

._crit_edge4:                                     ; preds = %161
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 12)
  %165 = add i64 %pgocount17, 1
  store i64 %165, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 12)
  br label %167

; <label>:166:                                    ; preds = %161
  br label %170

; <label>:167:                                    ; preds = %._crit_edge4, %157
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 18)
  %168 = add i64 %pgocount18, 1
  store i64 %168, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 18)
  call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 324, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.APCM_quantization, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %170

; <label>:170:                                    ; preds = %169, %166
  %171 = load i16, i16* %18, align 2
  %172 = sext i16 %171 to i32
  %173 = sub nsw i32 6, %172
  %174 = trunc i32 %173 to i16
  store i16 %174, i16* %16, align 2
  %175 = load i16, i16* %19, align 2
  %176 = sext i16 %175 to i64
  %177 = getelementptr inbounds [8 x i16], [8 x i16]* @gsm_NRFAC, i64 0, i64 %176
  %178 = load i16, i16* %177, align 2
  store i16 %178, i16* %17, align 2
  store i32 0, i32* %11, align 4
  br label %179

; <label>:179:                                    ; preds = %225, %170
  %180 = load i32, i32* %11, align 4
  %181 = icmp sle i32 %180, 12
  br i1 %181, label %182, label %229

; <label>:182:                                    ; preds = %179
  %183 = load i16, i16* %16, align 2
  %184 = sext i16 %183 to i32
  %185 = icmp sge i32 %184, 0
  br i1 %185, label %186, label %192

; <label>:186:                                    ; preds = %182
  %187 = load i16, i16* %16, align 2
  %188 = sext i16 %187 to i32
  %189 = icmp slt i32 %188, 16
  br i1 %189, label %191, label %._crit_edge

._crit_edge:                                      ; preds = %186
  %pgocount19 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 8)
  %190 = add i64 %pgocount19, 1
  store i64 %190, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 8)
  br label %192

; <label>:191:                                    ; preds = %186
  br label %195

; <label>:192:                                    ; preds = %._crit_edge, %182
  %pgocount20 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 13)
  %193 = add i64 %pgocount20, 1
  store i64 %193, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 13)
  call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 331, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.APCM_quantization, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %195

; <label>:195:                                    ; preds = %194, %191
  %196 = load i16*, i16** %6, align 8
  %197 = load i32, i32* %11, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds i16, i16* %196, i64 %198
  %200 = load i16, i16* %199, align 2
  %201 = sext i16 %200 to i32
  %202 = load i16, i16* %16, align 2
  %203 = sext i16 %202 to i32
  %204 = shl i32 %201, %203
  %205 = trunc i32 %204 to i16
  store i16 %205, i16* %15, align 2
  %206 = load i16, i16* %15, align 2
  %207 = sext i16 %206 to i64
  %208 = load i16, i16* %17, align 2
  %209 = sext i16 %208 to i64
  %210 = mul nsw i64 %207, %209
  %211 = ashr i64 %210, 15
  %212 = trunc i64 %211 to i16
  store i16 %212, i16* %15, align 2
  %213 = load i16, i16* %15, align 2
  %214 = sext i16 %213 to i32
  %215 = ashr i32 %214, 12
  %216 = trunc i32 %215 to i16
  store i16 %216, i16* %15, align 2
  %217 = load i16, i16* %15, align 2
  %218 = sext i16 %217 to i32
  %219 = add nsw i32 %218, 4
  %220 = trunc i32 %219 to i16
  %221 = load i16*, i16** %7, align 8
  %222 = load i32, i32* %11, align 4
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds i16, i16* %221, i64 %223
  store i16 %220, i16* %224, align 2
  br label %225

; <label>:225:                                    ; preds = %195
  %pgocount21 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 1)
  %226 = add i64 %pgocount21, 1
  store i64 %226, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 1)
  %227 = load i32, i32* %11, align 4
  %228 = add nsw i32 %227, 1
  store i32 %228, i32* %11, align 4
  br label %179

; <label>:229:                                    ; preds = %179
  %pgocount22 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 7)
  %230 = add i64 %pgocount22, 1
  store i64 %230, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_APCM_quantization, i64 0, i64 7)
  %231 = load i16, i16* %19, align 2
  %232 = load i16*, i16** %8, align 8
  store i16 %231, i16* %232, align 2
  %233 = load i16, i16* %18, align 2
  %234 = load i16*, i16** %9, align 8
  store i16 %233, i16* %234, align 2
  %235 = load i16, i16* %14, align 2
  %236 = load i16*, i16** %10, align 8
  store i16 %235, i16* %236, align 2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @APCM_inverse_quantization(i16*, i16 signext, i16 signext, i16*) #0 {
  %5 = alloca i16*, align 8
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca i16*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i16, align 2
  %11 = alloca i16, align 2
  %12 = alloca i16, align 2
  %13 = alloca i16, align 2
  %14 = alloca i64, align 8
  store i16* %0, i16** %5, align 8
  store i16 %1, i16* %6, align 2
  store i16 %2, i16* %7, align 2
  store i16* %3, i16** %8, align 8
  %15 = load i16, i16* %6, align 2
  %16 = sext i16 %15 to i32
  %17 = icmp sge i32 %16, 0
  br i1 %17, label %18, label %24

; <label>:18:                                     ; preds = %4
  %19 = load i16, i16* %6, align 2
  %20 = sext i16 %19 to i32
  %21 = icmp sle i32 %20, 7
  br i1 %21, label %23, label %._crit_edge2

._crit_edge2:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 5)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 5)
  br label %24

; <label>:23:                                     ; preds = %18
  br label %27

; <label>:24:                                     ; preds = %._crit_edge2, %4
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 8)
  %25 = add i64 %pgocount3, 1
  store i64 %25, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 8)
  call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 364, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__PRETTY_FUNCTION__.APCM_inverse_quantization, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %27

; <label>:27:                                     ; preds = %26, %23
  %28 = load i16, i16* %6, align 2
  %29 = sext i16 %28 to i64
  %30 = getelementptr inbounds [8 x i16], [8 x i16]* @gsm_FAC, i64 0, i64 %29
  %31 = load i16, i16* %30, align 2
  store i16 %31, i16* %11, align 2
  %32 = load i16, i16* %7, align 2
  %33 = call signext i16 @gsm_sub(i16 signext 6, i16 signext %32)
  store i16 %33, i16* %12, align 2
  %34 = load i16, i16* %12, align 2
  %35 = call signext i16 @gsm_sub(i16 signext %34, i16 signext 1)
  %36 = sext i16 %35 to i32
  %37 = call signext i16 @gsm_asl(i16 signext 1, i32 %36)
  store i16 %37, i16* %13, align 2
  store i32 13, i32* %9, align 4
  br label %38

; <label>:38:                                     ; preds = %108, %27
  %39 = load i32, i32* %9, align 4
  %40 = add nsw i32 %39, -1
  store i32 %40, i32* %9, align 4
  %41 = icmp ne i32 %39, 0
  br i1 %41, label %42, label %117

; <label>:42:                                     ; preds = %38
  %43 = load i16*, i16** %5, align 8
  %44 = load i16, i16* %43, align 2
  %45 = sext i16 %44 to i32
  %46 = icmp sle i32 %45, 7
  br i1 %46, label %47, label %54

; <label>:47:                                     ; preds = %42
  %48 = load i16*, i16** %5, align 8
  %49 = load i16, i16* %48, align 2
  %50 = sext i16 %49 to i32
  %51 = icmp sge i32 %50, 0
  br i1 %51, label %53, label %._crit_edge

._crit_edge:                                      ; preds = %47
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 3)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 3)
  br label %54

; <label>:53:                                     ; preds = %47
  br label %57

; <label>:54:                                     ; preds = %._crit_edge, %42
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 6)
  %55 = add i64 %pgocount5, 1
  store i64 %55, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 6)
  call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 372, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__PRETTY_FUNCTION__.APCM_inverse_quantization, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %57

; <label>:57:                                     ; preds = %56, %53
  %58 = load i16*, i16** %5, align 8
  %59 = getelementptr inbounds i16, i16* %58, i32 1
  store i16* %59, i16** %5, align 8
  %60 = load i16, i16* %58, align 2
  %61 = sext i16 %60 to i32
  %62 = shl i32 %61, 1
  %63 = sub nsw i32 %62, 7
  %64 = trunc i32 %63 to i16
  store i16 %64, i16* %10, align 2
  %65 = load i16, i16* %10, align 2
  %66 = sext i16 %65 to i32
  %67 = icmp sle i32 %66, 7
  br i1 %67, label %68, label %74

; <label>:68:                                     ; preds = %57
  %69 = load i16, i16* %10, align 2
  %70 = sext i16 %69 to i32
  %71 = icmp sge i32 %70, -7
  br i1 %71, label %73, label %._crit_edge1

._crit_edge1:                                     ; preds = %68
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 4)
  %72 = add i64 %pgocount6, 1
  store i64 %72, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 4)
  br label %74

; <label>:73:                                     ; preds = %68
  br label %77

; <label>:74:                                     ; preds = %._crit_edge1, %57
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 7)
  %75 = add i64 %pgocount7, 1
  store i64 %75, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 7)
  call void @__assert_fail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 376, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__PRETTY_FUNCTION__.APCM_inverse_quantization, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %77

; <label>:77:                                     ; preds = %76, %73
  %78 = load i16, i16* %10, align 2
  %79 = sext i16 %78 to i32
  %80 = shl i32 %79, 12
  %81 = trunc i32 %80 to i16
  store i16 %81, i16* %10, align 2
  %82 = load i16, i16* %11, align 2
  %83 = sext i16 %82 to i64
  %84 = load i16, i16* %10, align 2
  %85 = sext i16 %84 to i64
  %86 = mul nsw i64 %83, %85
  %87 = add nsw i64 %86, 16384
  %88 = ashr i64 %87, 15
  %89 = trunc i64 %88 to i16
  store i16 %89, i16* %10, align 2
  %90 = load i16, i16* %10, align 2
  %91 = sext i16 %90 to i64
  %92 = load i16, i16* %13, align 2
  %93 = sext i16 %92 to i64
  %94 = add nsw i64 %91, %93
  store i64 %94, i64* %14, align 8
  %95 = sub nsw i64 %94, -32768
  %96 = icmp ugt i64 %95, 65535
  br i1 %96, label %97, label %105

; <label>:97:                                     ; preds = %77
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 0)
  %98 = add i64 %pgocount8, 1
  store i64 %98, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 0)
  %99 = load i64, i64* %14, align 8
  %100 = icmp sgt i64 %99, 0
  %101 = zext i1 %100 to i64
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 9)
  %102 = add i64 %pgocount9, %101
  store i64 %102, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 9)
  %103 = select i1 %100, i32 32767, i32 -32768
  %104 = sext i32 %103 to i64
  br label %108

; <label>:105:                                    ; preds = %77
  %pgocount10 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 1)
  %106 = add i64 %pgocount10, 1
  store i64 %106, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 1)
  %107 = load i64, i64* %14, align 8
  br label %108

; <label>:108:                                    ; preds = %105, %97
  %109 = phi i64 [ %104, %97 ], [ %107, %105 ]
  %110 = trunc i64 %109 to i16
  store i16 %110, i16* %10, align 2
  %111 = load i16, i16* %10, align 2
  %112 = load i16, i16* %12, align 2
  %113 = sext i16 %112 to i32
  %114 = call signext i16 @gsm_asr(i16 signext %111, i32 %113)
  %115 = load i16*, i16** %8, align 8
  %116 = getelementptr inbounds i16, i16* %115, i32 1
  store i16* %116, i16** %8, align 8
  store i16 %114, i16* %115, align 2
  br label %38

; <label>:117:                                    ; preds = %38
  %pgocount11 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 2)
  %118 = add i64 %pgocount11, 1
  store i64 %118, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_APCM_inverse_quantization, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @RPE_grid_positioning(i16 signext, i16*, i16*) #0 {
  %4 = alloca i16, align 2
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i32, align 4
  store i16 %0, i16* %4, align 2
  store i16* %1, i16** %5, align 8
  store i16* %2, i16** %6, align 8
  store i32 13, i32* %7, align 4
  %8 = load i16, i16* %4, align 2
  %9 = sext i16 %8 to i32
  %10 = icmp sle i32 0, %9
  br i1 %10, label %11, label %18

; <label>:11:                                     ; preds = %3
  %12 = load i16, i16* %4, align 2
  %13 = sext i16 %12 to i32
  %14 = icmp sle i32 %13, 3
  br i1 %14, label %16, label %._crit_edge

._crit_edge:                                      ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 7)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 7)
  br label %18

; <label>:16:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 3)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 3)
  br label %21

; <label>:18:                                     ; preds = %._crit_edge, %3
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 8)
  %19 = add i64 %pgocount2, 1
  store i64 %19, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 8)
  call void @__assert_fail(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 402, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__PRETTY_FUNCTION__.RPE_grid_positioning, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %21

; <label>:21:                                     ; preds = %20, %16
  %22 = load i16, i16* %4, align 2
  %23 = sext i16 %22 to i32
  switch i32 %23, label %50 [
    i32 3, label %24
    i32 2, label %28
    i32 1, label %34
    i32 0, label %38
  ]

; <label>:24:                                     ; preds = %21
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 6)
  %25 = add i64 %pgocount3, 1
  store i64 %25, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 6)
  %26 = load i16*, i16** %6, align 8
  %27 = getelementptr inbounds i16, i16* %26, i32 1
  store i16* %27, i16** %6, align 8
  store i16 0, i16* %26, align 2
  br label %28

; <label>:28:                                     ; preds = %24, %21
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 5)
  %29 = add i64 %pgocount4, 1
  store i64 %29, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 5)
  br label %30

; <label>:30:                                     ; preds = %44, %28
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 2)
  %31 = add i64 %pgocount5, 1
  store i64 %31, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 2)
  %32 = load i16*, i16** %6, align 8
  %33 = getelementptr inbounds i16, i16* %32, i32 1
  store i16* %33, i16** %6, align 8
  store i16 0, i16* %32, align 2
  br label %34

; <label>:34:                                     ; preds = %30, %21
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 1)
  %35 = add i64 %pgocount6, 1
  store i64 %35, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 1)
  %36 = load i16*, i16** %6, align 8
  %37 = getelementptr inbounds i16, i16* %36, i32 1
  store i16* %37, i16** %6, align 8
  store i16 0, i16* %36, align 2
  br label %38

; <label>:38:                                     ; preds = %34, %21
  %39 = load i16*, i16** %5, align 8
  %40 = getelementptr inbounds i16, i16* %39, i32 1
  store i16* %40, i16** %5, align 8
  %41 = load i16, i16* %39, align 2
  %42 = load i16*, i16** %6, align 8
  %43 = getelementptr inbounds i16, i16* %42, i32 1
  store i16* %43, i16** %6, align 8
  store i16 %41, i16* %42, align 2
  br label %44

; <label>:44:                                     ; preds = %38
  %45 = load i32, i32* %7, align 4
  %46 = add nsw i32 %45, -1
  store i32 %46, i32* %7, align 4
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %30, label %48

; <label>:48:                                     ; preds = %44
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 4)
  %49 = add i64 %pgocount7, 1
  store i64 %49, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 4)
  br label %50

; <label>:50:                                     ; preds = %48, %21
  br label %51

; <label>:51:                                     ; preds = %56, %50
  %52 = load i16, i16* %4, align 2
  %53 = add i16 %52, 1
  store i16 %53, i16* %4, align 2
  %54 = sext i16 %53 to i32
  %55 = icmp slt i32 %54, 4
  br i1 %55, label %56, label %60

; <label>:56:                                     ; preds = %51
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 0)
  %57 = add i64 %pgocount8, 1
  store i64 %57, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_RPE_grid_positioning, i64 0, i64 0)
  %58 = load i16*, i16** %6, align 8
  %59 = getelementptr inbounds i16, i16* %58, i32 1
  store i16* %59, i16** %6, align 8
  store i16 0, i16* %58, align 2
  br label %51

; <label>:60:                                     ; preds = %51
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @Gsm_RPE_Decoding(%struct.gsm_state*, i16 signext, i16 signext, i16*, i16*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Gsm_RPE_Decoding, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Gsm_RPE_Decoding, i64 0, i64 0)
  %7 = alloca %struct.gsm_state*, align 8
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  %10 = alloca i16*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca i16, align 2
  %13 = alloca i16, align 2
  %14 = alloca [13 x i16], align 16
  store %struct.gsm_state* %0, %struct.gsm_state** %7, align 8
  store i16 %1, i16* %8, align 2
  store i16 %2, i16* %9, align 2
  store i16* %3, i16** %10, align 8
  store i16* %4, i16** %11, align 8
  %15 = load i16, i16* %8, align 2
  call void @APCM_quantization_xmaxc_to_exp_mant(i16 signext %15, i16* %12, i16* %13)
  %16 = load i16*, i16** %10, align 8
  %17 = load i16, i16* %13, align 2
  %18 = load i16, i16* %12, align 2
  %19 = getelementptr inbounds [13 x i16], [13 x i16]* %14, i32 0, i32 0
  call void @APCM_inverse_quantization(i16* %16, i16 signext %17, i16 signext %18, i16* %19)
  %20 = load i16, i16* %9, align 2
  %21 = getelementptr inbounds [13 x i16], [13 x i16]* %14, i32 0, i32 0
  %22 = load i16*, i16** %11, align 8
  call void @RPE_grid_positioning(i16 signext %20, i16* %21, i16* %22)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @APCM_quantization_xmaxc_to_exp_mant(i16 signext, i16*, i16*) #0 {
  %4 = alloca i16, align 2
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  store i16 %0, i16* %4, align 2
  store i16* %1, i16** %5, align 8
  store i16* %2, i16** %6, align 8
  store i16 0, i16* %7, align 2
  %9 = load i16, i16* %4, align 2
  %10 = sext i16 %9 to i32
  %11 = icmp sgt i32 %10, 15
  br i1 %11, label %12, label %19

; <label>:12:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 2)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 2)
  %14 = load i16, i16* %4, align 2
  %15 = sext i16 %14 to i32
  %16 = ashr i32 %15, 3
  %17 = sub nsw i32 %16, 1
  %18 = trunc i32 %17 to i16
  store i16 %18, i16* %7, align 2
  br label %19

; <label>:19:                                     ; preds = %12, %3
  %20 = load i16, i16* %4, align 2
  %21 = sext i16 %20 to i32
  %22 = load i16, i16* %7, align 2
  %23 = sext i16 %22 to i32
  %24 = shl i32 %23, 3
  %25 = sub nsw i32 %21, %24
  %26 = trunc i32 %25 to i16
  store i16 %26, i16* %8, align 2
  %27 = load i16, i16* %8, align 2
  %28 = sext i16 %27 to i32
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 3)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 3)
  store i16 -4, i16* %7, align 2
  store i16 7, i16* %8, align 2
  br label %52

; <label>:32:                                     ; preds = %19
  br label %33

; <label>:33:                                     ; preds = %37, %32
  %34 = load i16, i16* %8, align 2
  %35 = sext i16 %34 to i32
  %36 = icmp sle i32 %35, 7
  br i1 %36, label %37, label %46

; <label>:37:                                     ; preds = %33
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 0)
  %38 = add i64 %pgocount3, 1
  store i64 %38, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 0)
  %39 = load i16, i16* %8, align 2
  %40 = sext i16 %39 to i32
  %41 = shl i32 %40, 1
  %42 = or i32 %41, 1
  %43 = trunc i32 %42 to i16
  store i16 %43, i16* %8, align 2
  %44 = load i16, i16* %7, align 2
  %45 = add i16 %44, -1
  store i16 %45, i16* %7, align 2
  br label %33

; <label>:46:                                     ; preds = %33
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 1)
  %47 = add i64 %pgocount4, 1
  store i64 %47, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 1)
  %48 = load i16, i16* %8, align 2
  %49 = sext i16 %48 to i32
  %50 = sub nsw i32 %49, 8
  %51 = trunc i32 %50 to i16
  store i16 %51, i16* %8, align 2
  br label %52

; <label>:52:                                     ; preds = %46, %30
  %53 = load i16, i16* %7, align 2
  %54 = sext i16 %53 to i32
  %55 = icmp sge i32 %54, -4
  br i1 %55, label %56, label %62

; <label>:56:                                     ; preds = %52
  %57 = load i16, i16* %7, align 2
  %58 = sext i16 %57 to i32
  %59 = icmp sle i32 %58, 6
  br i1 %59, label %61, label %._crit_edge

._crit_edge:                                      ; preds = %56
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 4)
  %60 = add i64 %pgocount5, 1
  store i64 %60, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 4)
  br label %62

; <label>:61:                                     ; preds = %56
  br label %65

; <label>:62:                                     ; preds = %._crit_edge, %52
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 6)
  %63 = add i64 %pgocount6, 1
  store i64 %63, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 6)
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 249, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.APCM_quantization_xmaxc_to_exp_mant, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %65

; <label>:65:                                     ; preds = %64, %61
  %66 = load i16, i16* %8, align 2
  %67 = sext i16 %66 to i32
  %68 = icmp sge i32 %67, 0
  br i1 %68, label %69, label %75

; <label>:69:                                     ; preds = %65
  %70 = load i16, i16* %8, align 2
  %71 = sext i16 %70 to i32
  %72 = icmp sle i32 %71, 7
  br i1 %72, label %74, label %._crit_edge1

._crit_edge1:                                     ; preds = %69
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 5)
  %73 = add i64 %pgocount7, 1
  store i64 %73, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 5)
  br label %75

; <label>:74:                                     ; preds = %69
  br label %78

; <label>:75:                                     ; preds = %._crit_edge1, %65
  %pgocount8 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 7)
  %76 = add i64 %pgocount8, 1
  store i64 %76, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_APCM_quantization_xmaxc_to_exp_mant, i64 0, i64 7)
  call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 250, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.APCM_quantization_xmaxc_to_exp_mant, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %78

; <label>:78:                                     ; preds = %77, %74
  %79 = load i16, i16* %7, align 2
  %80 = load i16*, i16** %5, align 8
  store i16 %79, i16* %80, align 2
  %81 = load i16, i16* %8, align 2
  %82 = load i16*, i16** %6, align 8
  store i16 %81, i16* %82, align 2
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

declare signext i16 @gsm_add(i16 signext, i16 signext) #2

declare signext i16 @gsm_sub(i16 signext, i16 signext) #2

declare signext i16 @gsm_asl(i16 signext, i32) #2

declare signext i16 @gsm_asr(i16 signext, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

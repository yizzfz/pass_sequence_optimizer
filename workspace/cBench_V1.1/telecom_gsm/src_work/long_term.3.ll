; ModuleID = 'long_term.2.ll'
source_filename = "long_term.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [2 x i8] c"d\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"long_term.c\00", align 1
@__PRETTY_FUNCTION__.Gsm_Long_Term_Predictor = private unnamed_addr constant [97 x i8] c"void Gsm_Long_Term_Predictor(struct gsm_state *, word *, word *, word *, word *, word *, word *)\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"dp\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"e\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"dpp\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"Nc\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"bc\00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"Nr >= 40 && Nr <= 120\00", align 1
@__PRETTY_FUNCTION__.Gsm_Long_Term_Synthesis_Filtering = private unnamed_addr constant [87 x i8] c"void Gsm_Long_Term_Synthesis_Filtering(struct gsm_state *, word, word, word *, word *)\00", align 1
@gsm_QLB = external global [4 x i16], align 2
@.str.8 = private unnamed_addr constant [16 x i8] c"brp != MIN_WORD\00", align 1
@.str.9 = private unnamed_addr constant [9 x i8] c"dmax > 0\00", align 1
@__PRETTY_FUNCTION__.Calculation_of_the_LTP_parameters = private unnamed_addr constant [71 x i8] c"void Calculation_of_the_LTP_parameters(word *, word *, word *, word *)\00", align 1
@.str.10 = private unnamed_addr constant [10 x i8] c"scal >= 0\00", align 1
@.str.11 = private unnamed_addr constant [28 x i8] c"scal <= 100 && scal >= -100\00", align 1
@.str.12 = private unnamed_addr constant [22 x i8] c"Nc <= 120 && Nc >= 40\00", align 1
@gsm_DLB = external global [4 x i16], align 2
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_Gsm_Long_Term_Predictor = private constant [23 x i8] c"Gsm_Long_Term_Predictor"
@__profn_tmp1.ll_Calculation_of_the_LTP_parameters = private constant [41 x i8] c"tmp1.ll:Calculation_of_the_LTP_parameters"
@__profn_tmp1.ll_Long_term_analysis_filtering = private constant [36 x i8] c"tmp1.ll:Long_term_analysis_filtering"
@__profn_Gsm_Long_Term_Synthesis_Filtering = private constant [33 x i8] c"Gsm_Long_Term_Synthesis_Filtering"
@__profc_Gsm_Long_Term_Predictor = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Gsm_Long_Term_Predictor = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5857776861110496367, i64 137467677881, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_Gsm_Long_Term_Predictor, i32 0, i32 0), i8* bitcast (void (%struct.gsm_state*, i16*, i16*, i16*, i16*, i16*, i16*)* @Gsm_Long_Term_Predictor to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Calculation_of_the_LTP_parameters = private global [21 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Calculation_of_the_LTP_parameters = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3605681663368903101, i64 359206825058, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i32 0, i32 0), i8* null, i8* null, i32 21, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Long_term_analysis_filtering = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Long_term_analysis_filtering = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4844936518885711069, i64 273275180690, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i32 0, i32 0), i8* null, i8* null, i32 17, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_Gsm_Long_Term_Synthesis_Filtering = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Gsm_Long_Term_Synthesis_Filtering = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3308236873509166971, i64 72057743632922560, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i32 0, i32 0), i8* bitcast (void (%struct.gsm_state*, i16, i16, i16*, i16*)* @Gsm_Long_Term_Synthesis_Filtering to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [110 x i8] c"\88\01kx\DAU\CD\BB\0A\80@\0CDQ\FC!\C1\D6V\D0\C6B\D0>\04\8D\1A\C8f%\1B\0B\FF\DE\07(\D8\0E\87;M\0A\D0F]` \0B\D0\19M<z\B4\CC\C3V\E4\22e\852\EE\82\CEQ!\CE\E0+A;t\B0\A1a 'K\9F|*~WPQ\8E\C4\09f\96k`]\B2\E6w\D3\1Fz\85nQ\BF\E2\04\E2}4\8B", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Gsm_Long_Term_Predictor to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Calculation_of_the_LTP_parameters to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Long_term_analysis_filtering to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Gsm_Long_Term_Synthesis_Filtering to i8*), i8* getelementptr inbounds ([110 x i8], [110 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @Gsm_Long_Term_Predictor(%struct.gsm_state*, i16*, i16*, i16*, i16*, i16*, i16*) #0 {
  %8 = alloca %struct.gsm_state*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca i16*, align 8
  %13 = alloca i16*, align 8
  %14 = alloca i16*, align 8
  store %struct.gsm_state* %0, %struct.gsm_state** %8, align 8
  store i16* %1, i16** %9, align 8
  store i16* %2, i16** %10, align 8
  store i16* %3, i16** %11, align 8
  store i16* %4, i16** %12, align 8
  store i16* %5, i16** %13, align 8
  store i16* %6, i16** %14, align 8
  %15 = load i16*, i16** %9, align 8
  %16 = icmp ne i16* %15, null
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %7
  br label %21

; <label>:18:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_Gsm_Long_Term_Predictor, i64 0, i64 1)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_Gsm_Long_Term_Predictor, i64 0, i64 1)
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 545, i8* getelementptr inbounds ([97 x i8], [97 x i8]* @__PRETTY_FUNCTION__.Gsm_Long_Term_Predictor, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %21

; <label>:21:                                     ; preds = %20, %17
  %22 = load i16*, i16** %10, align 8
  %23 = icmp ne i16* %22, null
  br i1 %23, label %24, label %25

; <label>:24:                                     ; preds = %21
  br label %28

; <label>:25:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_Gsm_Long_Term_Predictor, i64 0, i64 2)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_Gsm_Long_Term_Predictor, i64 0, i64 2)
  call void @__assert_fail(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 545, i8* getelementptr inbounds ([97 x i8], [97 x i8]* @__PRETTY_FUNCTION__.Gsm_Long_Term_Predictor, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %28

; <label>:28:                                     ; preds = %27, %24
  %29 = load i16*, i16** %11, align 8
  %30 = icmp ne i16* %29, null
  br i1 %30, label %31, label %32

; <label>:31:                                     ; preds = %28
  br label %35

; <label>:32:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_Gsm_Long_Term_Predictor, i64 0, i64 3)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_Gsm_Long_Term_Predictor, i64 0, i64 3)
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 545, i8* getelementptr inbounds ([97 x i8], [97 x i8]* @__PRETTY_FUNCTION__.Gsm_Long_Term_Predictor, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %35

; <label>:35:                                     ; preds = %34, %31
  %36 = load i16*, i16** %12, align 8
  %37 = icmp ne i16* %36, null
  br i1 %37, label %38, label %39

; <label>:38:                                     ; preds = %35
  br label %42

; <label>:39:                                     ; preds = %35
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_Gsm_Long_Term_Predictor, i64 0, i64 4)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_Gsm_Long_Term_Predictor, i64 0, i64 4)
  call void @__assert_fail(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 546, i8* getelementptr inbounds ([97 x i8], [97 x i8]* @__PRETTY_FUNCTION__.Gsm_Long_Term_Predictor, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %42

; <label>:42:                                     ; preds = %41, %38
  %43 = load i16*, i16** %13, align 8
  %44 = icmp ne i16* %43, null
  br i1 %44, label %45, label %46

; <label>:45:                                     ; preds = %42
  br label %49

; <label>:46:                                     ; preds = %42
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_Gsm_Long_Term_Predictor, i64 0, i64 5)
  %47 = add i64 %pgocount4, 1
  store i64 %47, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_Gsm_Long_Term_Predictor, i64 0, i64 5)
  call void @__assert_fail(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 546, i8* getelementptr inbounds ([97 x i8], [97 x i8]* @__PRETTY_FUNCTION__.Gsm_Long_Term_Predictor, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %49

; <label>:49:                                     ; preds = %48, %45
  %50 = load i16*, i16** %14, align 8
  %51 = icmp ne i16* %50, null
  br i1 %51, label %52, label %53

; <label>:52:                                     ; preds = %49
  br label %56

; <label>:53:                                     ; preds = %49
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_Gsm_Long_Term_Predictor, i64 0, i64 6)
  %54 = add i64 %pgocount5, 1
  store i64 %54, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_Gsm_Long_Term_Predictor, i64 0, i64 6)
  call void @__assert_fail(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 546, i8* getelementptr inbounds ([97 x i8], [97 x i8]* @__PRETTY_FUNCTION__.Gsm_Long_Term_Predictor, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %56

; <label>:56:                                     ; preds = %55, %52
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_Gsm_Long_Term_Predictor, i64 0, i64 0)
  %57 = add i64 %pgocount6, 1
  store i64 %57, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_Gsm_Long_Term_Predictor, i64 0, i64 0)
  %58 = load i16*, i16** %9, align 8
  %59 = load i16*, i16** %10, align 8
  %60 = load i16*, i16** %14, align 8
  %61 = load i16*, i16** %13, align 8
  call void @Calculation_of_the_LTP_parameters(i16* %58, i16* %59, i16* %60, i16* %61)
  %62 = load i16*, i16** %14, align 8
  %63 = load i16, i16* %62, align 2
  %64 = load i16*, i16** %13, align 8
  %65 = load i16, i16* %64, align 2
  %66 = load i16*, i16** %10, align 8
  %67 = load i16*, i16** %9, align 8
  %68 = load i16*, i16** %12, align 8
  %69 = load i16*, i16** %11, align 8
  call void @Long_term_analysis_filtering(i16 signext %63, i16 signext %65, i16* %66, i16* %67, i16* %68, i16* %69)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

; Function Attrs: nounwind uwtable
define internal void @Calculation_of_the_LTP_parameters(i16*, i16*, i16*, i16*) #0 {
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i16, align 2
  %12 = alloca i16, align 2
  %13 = alloca [40 x i16], align 16
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i16, align 2
  %17 = alloca i16, align 2
  %18 = alloca i16, align 2
  %19 = alloca i16, align 2
  %20 = alloca i16, align 2
  %21 = alloca i64, align 8
  %22 = alloca i64, align 8
  store i16* %0, i16** %5, align 8
  store i16* %1, i16** %6, align 8
  store i16* %2, i16** %7, align 8
  store i16* %3, i16** %8, align 8
  store i16 0, i16* %18, align 2
  store i32 0, i32* %9, align 4
  br label %23

; <label>:23:                                     ; preds = %64, %4
  %24 = load i32, i32* %9, align 4
  %25 = icmp sle i32 %24, 39
  br i1 %25, label %26, label %67

; <label>:26:                                     ; preds = %23
  %27 = load i16*, i16** %5, align 8
  %28 = load i32, i32* %9, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i16, i16* %27, i64 %29
  %31 = load i16, i16* %30, align 2
  store i16 %31, i16* %20, align 2
  %32 = load i16, i16* %20, align 2
  %33 = sext i16 %32 to i32
  %34 = icmp slt i32 %33, 0
  br i1 %34, label %35, label %48

; <label>:35:                                     ; preds = %26
  %36 = load i16, i16* %20, align 2
  %37 = sext i16 %36 to i32
  %38 = icmp eq i32 %37, -32768
  br i1 %38, label %39, label %41

; <label>:39:                                     ; preds = %35
  %pgocount = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 6)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 6)
  br label %46

; <label>:41:                                     ; preds = %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 7)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 7)
  %43 = load i16, i16* %20, align 2
  %44 = sext i16 %43 to i32
  %45 = sub nsw i32 0, %44
  br label %46

; <label>:46:                                     ; preds = %41, %39
  %47 = phi i32 [ 32767, %39 ], [ %45, %41 ]
  br label %52

; <label>:48:                                     ; preds = %26
  %pgocount3 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 3)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 3)
  %50 = load i16, i16* %20, align 2
  %51 = sext i16 %50 to i32
  br label %52

; <label>:52:                                     ; preds = %48, %46
  %53 = phi i32 [ %47, %46 ], [ %51, %48 ]
  %54 = trunc i32 %53 to i16
  store i16 %54, i16* %20, align 2
  %55 = load i16, i16* %20, align 2
  %56 = sext i16 %55 to i32
  %57 = load i16, i16* %18, align 2
  %58 = sext i16 %57 to i32
  %59 = icmp sgt i32 %56, %58
  br i1 %59, label %60, label %63

; <label>:60:                                     ; preds = %52
  %pgocount4 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 4)
  %61 = add i64 %pgocount4, 1
  store i64 %61, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 4)
  %62 = load i16, i16* %20, align 2
  store i16 %62, i16* %18, align 2
  br label %63

; <label>:63:                                     ; preds = %60, %52
  br label %64

; <label>:64:                                     ; preds = %63
  %65 = load i32, i32* %9, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* %9, align 4
  br label %23

; <label>:67:                                     ; preds = %23
  store i16 0, i16* %20, align 2
  %68 = load i16, i16* %18, align 2
  %69 = sext i16 %68 to i32
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %73

; <label>:71:                                     ; preds = %67
  %pgocount5 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 11)
  %72 = add i64 %pgocount5, 1
  store i64 %72, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 11)
  store i16 0, i16* %19, align 2
  br label %86

; <label>:73:                                     ; preds = %67
  %74 = load i16, i16* %18, align 2
  %75 = sext i16 %74 to i32
  %76 = icmp sgt i32 %75, 0
  br i1 %76, label %77, label %78

; <label>:77:                                     ; preds = %73
  br label %81

; <label>:78:                                     ; preds = %73
  %pgocount6 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 20)
  %79 = add i64 %pgocount6, 1
  store i64 %79, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 20)
  call void @__assert_fail(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 101, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @__PRETTY_FUNCTION__.Calculation_of_the_LTP_parameters, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %81

; <label>:81:                                     ; preds = %80, %77
  %82 = load i16, i16* %18, align 2
  %83 = sext i16 %82 to i64
  %84 = shl i64 %83, 16
  %85 = call signext i16 @gsm_norm(i64 %84)
  store i16 %85, i16* %20, align 2
  br label %86

; <label>:86:                                     ; preds = %81, %71
  %87 = load i16, i16* %20, align 2
  %88 = sext i16 %87 to i32
  %89 = icmp sgt i32 %88, 6
  br i1 %89, label %90, label %91

; <label>:90:                                     ; preds = %86
  store i16 0, i16* %19, align 2
  br label %97

; <label>:91:                                     ; preds = %86
  %pgocount7 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 9)
  %92 = add i64 %pgocount7, 1
  store i64 %92, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 9)
  %93 = load i16, i16* %20, align 2
  %94 = sext i16 %93 to i32
  %95 = sub nsw i32 6, %94
  %96 = trunc i32 %95 to i16
  store i16 %96, i16* %19, align 2
  br label %97

; <label>:97:                                     ; preds = %91, %90
  %98 = load i16, i16* %19, align 2
  %99 = sext i16 %98 to i32
  %100 = icmp sge i32 %99, 0
  br i1 %100, label %101, label %102

; <label>:101:                                    ; preds = %97
  br label %105

; <label>:102:                                    ; preds = %97
  %pgocount8 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 19)
  %103 = add i64 %pgocount8, 1
  store i64 %103, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 19)
  call void @__assert_fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 108, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @__PRETTY_FUNCTION__.Calculation_of_the_LTP_parameters, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %105

; <label>:105:                                    ; preds = %104, %101
  store i32 0, i32* %9, align 4
  br label %106

; <label>:106:                                    ; preds = %123, %105
  %107 = load i32, i32* %9, align 4
  %108 = icmp sle i32 %107, 39
  br i1 %108, label %109, label %127

; <label>:109:                                    ; preds = %106
  %110 = load i16*, i16** %5, align 8
  %111 = load i32, i32* %9, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i16, i16* %110, i64 %112
  %114 = load i16, i16* %113, align 2
  %115 = sext i16 %114 to i32
  %116 = load i16, i16* %19, align 2
  %117 = sext i16 %116 to i32
  %118 = ashr i32 %115, %117
  %119 = trunc i32 %118 to i16
  %120 = load i32, i32* %9, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 %121
  store i16 %119, i16* %122, align 2
  br label %123

; <label>:123:                                    ; preds = %109
  %pgocount9 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 0)
  %124 = add i64 %pgocount9, 1
  store i64 %124, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 0)
  %125 = load i32, i32* %9, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, i32* %9, align 4
  br label %106

; <label>:127:                                    ; preds = %106
  store i64 0, i64* %14, align 8
  store i16 40, i16* %11, align 2
  store i32 40, i32* %10, align 4
  br label %128

; <label>:128:                                    ; preds = %699, %127
  %129 = load i32, i32* %10, align 4
  %130 = icmp sle i32 %129, 120
  br i1 %130, label %131, label %703

; <label>:131:                                    ; preds = %128
  %132 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 0
  %133 = load i16, i16* %132, align 16
  %134 = sext i16 %133 to i32
  %135 = load i16*, i16** %6, align 8
  %136 = load i32, i32* %10, align 4
  %137 = sub nsw i32 0, %136
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i16, i16* %135, i64 %138
  %140 = load i16, i16* %139, align 2
  %141 = sext i16 %140 to i32
  %142 = mul nsw i32 %134, %141
  %143 = sext i32 %142 to i64
  store i64 %143, i64* %21, align 8
  %144 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 1
  %145 = load i16, i16* %144, align 2
  %146 = sext i16 %145 to i32
  %147 = load i16*, i16** %6, align 8
  %148 = load i32, i32* %10, align 4
  %149 = sub nsw i32 1, %148
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i16, i16* %147, i64 %150
  %152 = load i16, i16* %151, align 2
  %153 = sext i16 %152 to i32
  %154 = mul nsw i32 %146, %153
  %155 = sext i32 %154 to i64
  %156 = load i64, i64* %21, align 8
  %157 = add nsw i64 %156, %155
  store i64 %157, i64* %21, align 8
  %158 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 2
  %159 = load i16, i16* %158, align 4
  %160 = sext i16 %159 to i32
  %161 = load i16*, i16** %6, align 8
  %162 = load i32, i32* %10, align 4
  %163 = sub nsw i32 2, %162
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i16, i16* %161, i64 %164
  %166 = load i16, i16* %165, align 2
  %167 = sext i16 %166 to i32
  %168 = mul nsw i32 %160, %167
  %169 = sext i32 %168 to i64
  %170 = load i64, i64* %21, align 8
  %171 = add nsw i64 %170, %169
  store i64 %171, i64* %21, align 8
  %172 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 3
  %173 = load i16, i16* %172, align 2
  %174 = sext i16 %173 to i32
  %175 = load i16*, i16** %6, align 8
  %176 = load i32, i32* %10, align 4
  %177 = sub nsw i32 3, %176
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i16, i16* %175, i64 %178
  %180 = load i16, i16* %179, align 2
  %181 = sext i16 %180 to i32
  %182 = mul nsw i32 %174, %181
  %183 = sext i32 %182 to i64
  %184 = load i64, i64* %21, align 8
  %185 = add nsw i64 %184, %183
  store i64 %185, i64* %21, align 8
  %186 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 4
  %187 = load i16, i16* %186, align 8
  %188 = sext i16 %187 to i32
  %189 = load i16*, i16** %6, align 8
  %190 = load i32, i32* %10, align 4
  %191 = sub nsw i32 4, %190
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds i16, i16* %189, i64 %192
  %194 = load i16, i16* %193, align 2
  %195 = sext i16 %194 to i32
  %196 = mul nsw i32 %188, %195
  %197 = sext i32 %196 to i64
  %198 = load i64, i64* %21, align 8
  %199 = add nsw i64 %198, %197
  store i64 %199, i64* %21, align 8
  %200 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 5
  %201 = load i16, i16* %200, align 2
  %202 = sext i16 %201 to i32
  %203 = load i16*, i16** %6, align 8
  %204 = load i32, i32* %10, align 4
  %205 = sub nsw i32 5, %204
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds i16, i16* %203, i64 %206
  %208 = load i16, i16* %207, align 2
  %209 = sext i16 %208 to i32
  %210 = mul nsw i32 %202, %209
  %211 = sext i32 %210 to i64
  %212 = load i64, i64* %21, align 8
  %213 = add nsw i64 %212, %211
  store i64 %213, i64* %21, align 8
  %214 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 6
  %215 = load i16, i16* %214, align 4
  %216 = sext i16 %215 to i32
  %217 = load i16*, i16** %6, align 8
  %218 = load i32, i32* %10, align 4
  %219 = sub nsw i32 6, %218
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds i16, i16* %217, i64 %220
  %222 = load i16, i16* %221, align 2
  %223 = sext i16 %222 to i32
  %224 = mul nsw i32 %216, %223
  %225 = sext i32 %224 to i64
  %226 = load i64, i64* %21, align 8
  %227 = add nsw i64 %226, %225
  store i64 %227, i64* %21, align 8
  %228 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 7
  %229 = load i16, i16* %228, align 2
  %230 = sext i16 %229 to i32
  %231 = load i16*, i16** %6, align 8
  %232 = load i32, i32* %10, align 4
  %233 = sub nsw i32 7, %232
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds i16, i16* %231, i64 %234
  %236 = load i16, i16* %235, align 2
  %237 = sext i16 %236 to i32
  %238 = mul nsw i32 %230, %237
  %239 = sext i32 %238 to i64
  %240 = load i64, i64* %21, align 8
  %241 = add nsw i64 %240, %239
  store i64 %241, i64* %21, align 8
  %242 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 8
  %243 = load i16, i16* %242, align 16
  %244 = sext i16 %243 to i32
  %245 = load i16*, i16** %6, align 8
  %246 = load i32, i32* %10, align 4
  %247 = sub nsw i32 8, %246
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds i16, i16* %245, i64 %248
  %250 = load i16, i16* %249, align 2
  %251 = sext i16 %250 to i32
  %252 = mul nsw i32 %244, %251
  %253 = sext i32 %252 to i64
  %254 = load i64, i64* %21, align 8
  %255 = add nsw i64 %254, %253
  store i64 %255, i64* %21, align 8
  %256 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 9
  %257 = load i16, i16* %256, align 2
  %258 = sext i16 %257 to i32
  %259 = load i16*, i16** %6, align 8
  %260 = load i32, i32* %10, align 4
  %261 = sub nsw i32 9, %260
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds i16, i16* %259, i64 %262
  %264 = load i16, i16* %263, align 2
  %265 = sext i16 %264 to i32
  %266 = mul nsw i32 %258, %265
  %267 = sext i32 %266 to i64
  %268 = load i64, i64* %21, align 8
  %269 = add nsw i64 %268, %267
  store i64 %269, i64* %21, align 8
  %270 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 10
  %271 = load i16, i16* %270, align 4
  %272 = sext i16 %271 to i32
  %273 = load i16*, i16** %6, align 8
  %274 = load i32, i32* %10, align 4
  %275 = sub nsw i32 10, %274
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds i16, i16* %273, i64 %276
  %278 = load i16, i16* %277, align 2
  %279 = sext i16 %278 to i32
  %280 = mul nsw i32 %272, %279
  %281 = sext i32 %280 to i64
  %282 = load i64, i64* %21, align 8
  %283 = add nsw i64 %282, %281
  store i64 %283, i64* %21, align 8
  %284 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 11
  %285 = load i16, i16* %284, align 2
  %286 = sext i16 %285 to i32
  %287 = load i16*, i16** %6, align 8
  %288 = load i32, i32* %10, align 4
  %289 = sub nsw i32 11, %288
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds i16, i16* %287, i64 %290
  %292 = load i16, i16* %291, align 2
  %293 = sext i16 %292 to i32
  %294 = mul nsw i32 %286, %293
  %295 = sext i32 %294 to i64
  %296 = load i64, i64* %21, align 8
  %297 = add nsw i64 %296, %295
  store i64 %297, i64* %21, align 8
  %298 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 12
  %299 = load i16, i16* %298, align 8
  %300 = sext i16 %299 to i32
  %301 = load i16*, i16** %6, align 8
  %302 = load i32, i32* %10, align 4
  %303 = sub nsw i32 12, %302
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds i16, i16* %301, i64 %304
  %306 = load i16, i16* %305, align 2
  %307 = sext i16 %306 to i32
  %308 = mul nsw i32 %300, %307
  %309 = sext i32 %308 to i64
  %310 = load i64, i64* %21, align 8
  %311 = add nsw i64 %310, %309
  store i64 %311, i64* %21, align 8
  %312 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 13
  %313 = load i16, i16* %312, align 2
  %314 = sext i16 %313 to i32
  %315 = load i16*, i16** %6, align 8
  %316 = load i32, i32* %10, align 4
  %317 = sub nsw i32 13, %316
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds i16, i16* %315, i64 %318
  %320 = load i16, i16* %319, align 2
  %321 = sext i16 %320 to i32
  %322 = mul nsw i32 %314, %321
  %323 = sext i32 %322 to i64
  %324 = load i64, i64* %21, align 8
  %325 = add nsw i64 %324, %323
  store i64 %325, i64* %21, align 8
  %326 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 14
  %327 = load i16, i16* %326, align 4
  %328 = sext i16 %327 to i32
  %329 = load i16*, i16** %6, align 8
  %330 = load i32, i32* %10, align 4
  %331 = sub nsw i32 14, %330
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds i16, i16* %329, i64 %332
  %334 = load i16, i16* %333, align 2
  %335 = sext i16 %334 to i32
  %336 = mul nsw i32 %328, %335
  %337 = sext i32 %336 to i64
  %338 = load i64, i64* %21, align 8
  %339 = add nsw i64 %338, %337
  store i64 %339, i64* %21, align 8
  %340 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 15
  %341 = load i16, i16* %340, align 2
  %342 = sext i16 %341 to i32
  %343 = load i16*, i16** %6, align 8
  %344 = load i32, i32* %10, align 4
  %345 = sub nsw i32 15, %344
  %346 = sext i32 %345 to i64
  %347 = getelementptr inbounds i16, i16* %343, i64 %346
  %348 = load i16, i16* %347, align 2
  %349 = sext i16 %348 to i32
  %350 = mul nsw i32 %342, %349
  %351 = sext i32 %350 to i64
  %352 = load i64, i64* %21, align 8
  %353 = add nsw i64 %352, %351
  store i64 %353, i64* %21, align 8
  %354 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 16
  %355 = load i16, i16* %354, align 16
  %356 = sext i16 %355 to i32
  %357 = load i16*, i16** %6, align 8
  %358 = load i32, i32* %10, align 4
  %359 = sub nsw i32 16, %358
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds i16, i16* %357, i64 %360
  %362 = load i16, i16* %361, align 2
  %363 = sext i16 %362 to i32
  %364 = mul nsw i32 %356, %363
  %365 = sext i32 %364 to i64
  %366 = load i64, i64* %21, align 8
  %367 = add nsw i64 %366, %365
  store i64 %367, i64* %21, align 8
  %368 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 17
  %369 = load i16, i16* %368, align 2
  %370 = sext i16 %369 to i32
  %371 = load i16*, i16** %6, align 8
  %372 = load i32, i32* %10, align 4
  %373 = sub nsw i32 17, %372
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds i16, i16* %371, i64 %374
  %376 = load i16, i16* %375, align 2
  %377 = sext i16 %376 to i32
  %378 = mul nsw i32 %370, %377
  %379 = sext i32 %378 to i64
  %380 = load i64, i64* %21, align 8
  %381 = add nsw i64 %380, %379
  store i64 %381, i64* %21, align 8
  %382 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 18
  %383 = load i16, i16* %382, align 4
  %384 = sext i16 %383 to i32
  %385 = load i16*, i16** %6, align 8
  %386 = load i32, i32* %10, align 4
  %387 = sub nsw i32 18, %386
  %388 = sext i32 %387 to i64
  %389 = getelementptr inbounds i16, i16* %385, i64 %388
  %390 = load i16, i16* %389, align 2
  %391 = sext i16 %390 to i32
  %392 = mul nsw i32 %384, %391
  %393 = sext i32 %392 to i64
  %394 = load i64, i64* %21, align 8
  %395 = add nsw i64 %394, %393
  store i64 %395, i64* %21, align 8
  %396 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 19
  %397 = load i16, i16* %396, align 2
  %398 = sext i16 %397 to i32
  %399 = load i16*, i16** %6, align 8
  %400 = load i32, i32* %10, align 4
  %401 = sub nsw i32 19, %400
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds i16, i16* %399, i64 %402
  %404 = load i16, i16* %403, align 2
  %405 = sext i16 %404 to i32
  %406 = mul nsw i32 %398, %405
  %407 = sext i32 %406 to i64
  %408 = load i64, i64* %21, align 8
  %409 = add nsw i64 %408, %407
  store i64 %409, i64* %21, align 8
  %410 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 20
  %411 = load i16, i16* %410, align 8
  %412 = sext i16 %411 to i32
  %413 = load i16*, i16** %6, align 8
  %414 = load i32, i32* %10, align 4
  %415 = sub nsw i32 20, %414
  %416 = sext i32 %415 to i64
  %417 = getelementptr inbounds i16, i16* %413, i64 %416
  %418 = load i16, i16* %417, align 2
  %419 = sext i16 %418 to i32
  %420 = mul nsw i32 %412, %419
  %421 = sext i32 %420 to i64
  %422 = load i64, i64* %21, align 8
  %423 = add nsw i64 %422, %421
  store i64 %423, i64* %21, align 8
  %424 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 21
  %425 = load i16, i16* %424, align 2
  %426 = sext i16 %425 to i32
  %427 = load i16*, i16** %6, align 8
  %428 = load i32, i32* %10, align 4
  %429 = sub nsw i32 21, %428
  %430 = sext i32 %429 to i64
  %431 = getelementptr inbounds i16, i16* %427, i64 %430
  %432 = load i16, i16* %431, align 2
  %433 = sext i16 %432 to i32
  %434 = mul nsw i32 %426, %433
  %435 = sext i32 %434 to i64
  %436 = load i64, i64* %21, align 8
  %437 = add nsw i64 %436, %435
  store i64 %437, i64* %21, align 8
  %438 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 22
  %439 = load i16, i16* %438, align 4
  %440 = sext i16 %439 to i32
  %441 = load i16*, i16** %6, align 8
  %442 = load i32, i32* %10, align 4
  %443 = sub nsw i32 22, %442
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds i16, i16* %441, i64 %444
  %446 = load i16, i16* %445, align 2
  %447 = sext i16 %446 to i32
  %448 = mul nsw i32 %440, %447
  %449 = sext i32 %448 to i64
  %450 = load i64, i64* %21, align 8
  %451 = add nsw i64 %450, %449
  store i64 %451, i64* %21, align 8
  %452 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 23
  %453 = load i16, i16* %452, align 2
  %454 = sext i16 %453 to i32
  %455 = load i16*, i16** %6, align 8
  %456 = load i32, i32* %10, align 4
  %457 = sub nsw i32 23, %456
  %458 = sext i32 %457 to i64
  %459 = getelementptr inbounds i16, i16* %455, i64 %458
  %460 = load i16, i16* %459, align 2
  %461 = sext i16 %460 to i32
  %462 = mul nsw i32 %454, %461
  %463 = sext i32 %462 to i64
  %464 = load i64, i64* %21, align 8
  %465 = add nsw i64 %464, %463
  store i64 %465, i64* %21, align 8
  %466 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 24
  %467 = load i16, i16* %466, align 16
  %468 = sext i16 %467 to i32
  %469 = load i16*, i16** %6, align 8
  %470 = load i32, i32* %10, align 4
  %471 = sub nsw i32 24, %470
  %472 = sext i32 %471 to i64
  %473 = getelementptr inbounds i16, i16* %469, i64 %472
  %474 = load i16, i16* %473, align 2
  %475 = sext i16 %474 to i32
  %476 = mul nsw i32 %468, %475
  %477 = sext i32 %476 to i64
  %478 = load i64, i64* %21, align 8
  %479 = add nsw i64 %478, %477
  store i64 %479, i64* %21, align 8
  %480 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 25
  %481 = load i16, i16* %480, align 2
  %482 = sext i16 %481 to i32
  %483 = load i16*, i16** %6, align 8
  %484 = load i32, i32* %10, align 4
  %485 = sub nsw i32 25, %484
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds i16, i16* %483, i64 %486
  %488 = load i16, i16* %487, align 2
  %489 = sext i16 %488 to i32
  %490 = mul nsw i32 %482, %489
  %491 = sext i32 %490 to i64
  %492 = load i64, i64* %21, align 8
  %493 = add nsw i64 %492, %491
  store i64 %493, i64* %21, align 8
  %494 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 26
  %495 = load i16, i16* %494, align 4
  %496 = sext i16 %495 to i32
  %497 = load i16*, i16** %6, align 8
  %498 = load i32, i32* %10, align 4
  %499 = sub nsw i32 26, %498
  %500 = sext i32 %499 to i64
  %501 = getelementptr inbounds i16, i16* %497, i64 %500
  %502 = load i16, i16* %501, align 2
  %503 = sext i16 %502 to i32
  %504 = mul nsw i32 %496, %503
  %505 = sext i32 %504 to i64
  %506 = load i64, i64* %21, align 8
  %507 = add nsw i64 %506, %505
  store i64 %507, i64* %21, align 8
  %508 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 27
  %509 = load i16, i16* %508, align 2
  %510 = sext i16 %509 to i32
  %511 = load i16*, i16** %6, align 8
  %512 = load i32, i32* %10, align 4
  %513 = sub nsw i32 27, %512
  %514 = sext i32 %513 to i64
  %515 = getelementptr inbounds i16, i16* %511, i64 %514
  %516 = load i16, i16* %515, align 2
  %517 = sext i16 %516 to i32
  %518 = mul nsw i32 %510, %517
  %519 = sext i32 %518 to i64
  %520 = load i64, i64* %21, align 8
  %521 = add nsw i64 %520, %519
  store i64 %521, i64* %21, align 8
  %522 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 28
  %523 = load i16, i16* %522, align 8
  %524 = sext i16 %523 to i32
  %525 = load i16*, i16** %6, align 8
  %526 = load i32, i32* %10, align 4
  %527 = sub nsw i32 28, %526
  %528 = sext i32 %527 to i64
  %529 = getelementptr inbounds i16, i16* %525, i64 %528
  %530 = load i16, i16* %529, align 2
  %531 = sext i16 %530 to i32
  %532 = mul nsw i32 %524, %531
  %533 = sext i32 %532 to i64
  %534 = load i64, i64* %21, align 8
  %535 = add nsw i64 %534, %533
  store i64 %535, i64* %21, align 8
  %536 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 29
  %537 = load i16, i16* %536, align 2
  %538 = sext i16 %537 to i32
  %539 = load i16*, i16** %6, align 8
  %540 = load i32, i32* %10, align 4
  %541 = sub nsw i32 29, %540
  %542 = sext i32 %541 to i64
  %543 = getelementptr inbounds i16, i16* %539, i64 %542
  %544 = load i16, i16* %543, align 2
  %545 = sext i16 %544 to i32
  %546 = mul nsw i32 %538, %545
  %547 = sext i32 %546 to i64
  %548 = load i64, i64* %21, align 8
  %549 = add nsw i64 %548, %547
  store i64 %549, i64* %21, align 8
  %550 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 30
  %551 = load i16, i16* %550, align 4
  %552 = sext i16 %551 to i32
  %553 = load i16*, i16** %6, align 8
  %554 = load i32, i32* %10, align 4
  %555 = sub nsw i32 30, %554
  %556 = sext i32 %555 to i64
  %557 = getelementptr inbounds i16, i16* %553, i64 %556
  %558 = load i16, i16* %557, align 2
  %559 = sext i16 %558 to i32
  %560 = mul nsw i32 %552, %559
  %561 = sext i32 %560 to i64
  %562 = load i64, i64* %21, align 8
  %563 = add nsw i64 %562, %561
  store i64 %563, i64* %21, align 8
  %564 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 31
  %565 = load i16, i16* %564, align 2
  %566 = sext i16 %565 to i32
  %567 = load i16*, i16** %6, align 8
  %568 = load i32, i32* %10, align 4
  %569 = sub nsw i32 31, %568
  %570 = sext i32 %569 to i64
  %571 = getelementptr inbounds i16, i16* %567, i64 %570
  %572 = load i16, i16* %571, align 2
  %573 = sext i16 %572 to i32
  %574 = mul nsw i32 %566, %573
  %575 = sext i32 %574 to i64
  %576 = load i64, i64* %21, align 8
  %577 = add nsw i64 %576, %575
  store i64 %577, i64* %21, align 8
  %578 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 32
  %579 = load i16, i16* %578, align 16
  %580 = sext i16 %579 to i32
  %581 = load i16*, i16** %6, align 8
  %582 = load i32, i32* %10, align 4
  %583 = sub nsw i32 32, %582
  %584 = sext i32 %583 to i64
  %585 = getelementptr inbounds i16, i16* %581, i64 %584
  %586 = load i16, i16* %585, align 2
  %587 = sext i16 %586 to i32
  %588 = mul nsw i32 %580, %587
  %589 = sext i32 %588 to i64
  %590 = load i64, i64* %21, align 8
  %591 = add nsw i64 %590, %589
  store i64 %591, i64* %21, align 8
  %592 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 33
  %593 = load i16, i16* %592, align 2
  %594 = sext i16 %593 to i32
  %595 = load i16*, i16** %6, align 8
  %596 = load i32, i32* %10, align 4
  %597 = sub nsw i32 33, %596
  %598 = sext i32 %597 to i64
  %599 = getelementptr inbounds i16, i16* %595, i64 %598
  %600 = load i16, i16* %599, align 2
  %601 = sext i16 %600 to i32
  %602 = mul nsw i32 %594, %601
  %603 = sext i32 %602 to i64
  %604 = load i64, i64* %21, align 8
  %605 = add nsw i64 %604, %603
  store i64 %605, i64* %21, align 8
  %606 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 34
  %607 = load i16, i16* %606, align 4
  %608 = sext i16 %607 to i32
  %609 = load i16*, i16** %6, align 8
  %610 = load i32, i32* %10, align 4
  %611 = sub nsw i32 34, %610
  %612 = sext i32 %611 to i64
  %613 = getelementptr inbounds i16, i16* %609, i64 %612
  %614 = load i16, i16* %613, align 2
  %615 = sext i16 %614 to i32
  %616 = mul nsw i32 %608, %615
  %617 = sext i32 %616 to i64
  %618 = load i64, i64* %21, align 8
  %619 = add nsw i64 %618, %617
  store i64 %619, i64* %21, align 8
  %620 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 35
  %621 = load i16, i16* %620, align 2
  %622 = sext i16 %621 to i32
  %623 = load i16*, i16** %6, align 8
  %624 = load i32, i32* %10, align 4
  %625 = sub nsw i32 35, %624
  %626 = sext i32 %625 to i64
  %627 = getelementptr inbounds i16, i16* %623, i64 %626
  %628 = load i16, i16* %627, align 2
  %629 = sext i16 %628 to i32
  %630 = mul nsw i32 %622, %629
  %631 = sext i32 %630 to i64
  %632 = load i64, i64* %21, align 8
  %633 = add nsw i64 %632, %631
  store i64 %633, i64* %21, align 8
  %634 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 36
  %635 = load i16, i16* %634, align 8
  %636 = sext i16 %635 to i32
  %637 = load i16*, i16** %6, align 8
  %638 = load i32, i32* %10, align 4
  %639 = sub nsw i32 36, %638
  %640 = sext i32 %639 to i64
  %641 = getelementptr inbounds i16, i16* %637, i64 %640
  %642 = load i16, i16* %641, align 2
  %643 = sext i16 %642 to i32
  %644 = mul nsw i32 %636, %643
  %645 = sext i32 %644 to i64
  %646 = load i64, i64* %21, align 8
  %647 = add nsw i64 %646, %645
  store i64 %647, i64* %21, align 8
  %648 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 37
  %649 = load i16, i16* %648, align 2
  %650 = sext i16 %649 to i32
  %651 = load i16*, i16** %6, align 8
  %652 = load i32, i32* %10, align 4
  %653 = sub nsw i32 37, %652
  %654 = sext i32 %653 to i64
  %655 = getelementptr inbounds i16, i16* %651, i64 %654
  %656 = load i16, i16* %655, align 2
  %657 = sext i16 %656 to i32
  %658 = mul nsw i32 %650, %657
  %659 = sext i32 %658 to i64
  %660 = load i64, i64* %21, align 8
  %661 = add nsw i64 %660, %659
  store i64 %661, i64* %21, align 8
  %662 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 38
  %663 = load i16, i16* %662, align 4
  %664 = sext i16 %663 to i32
  %665 = load i16*, i16** %6, align 8
  %666 = load i32, i32* %10, align 4
  %667 = sub nsw i32 38, %666
  %668 = sext i32 %667 to i64
  %669 = getelementptr inbounds i16, i16* %665, i64 %668
  %670 = load i16, i16* %669, align 2
  %671 = sext i16 %670 to i32
  %672 = mul nsw i32 %664, %671
  %673 = sext i32 %672 to i64
  %674 = load i64, i64* %21, align 8
  %675 = add nsw i64 %674, %673
  store i64 %675, i64* %21, align 8
  %676 = getelementptr inbounds [40 x i16], [40 x i16]* %13, i64 0, i64 39
  %677 = load i16, i16* %676, align 2
  %678 = sext i16 %677 to i32
  %679 = load i16*, i16** %6, align 8
  %680 = load i32, i32* %10, align 4
  %681 = sub nsw i32 39, %680
  %682 = sext i32 %681 to i64
  %683 = getelementptr inbounds i16, i16* %679, i64 %682
  %684 = load i16, i16* %683, align 2
  %685 = sext i16 %684 to i32
  %686 = mul nsw i32 %678, %685
  %687 = sext i32 %686 to i64
  %688 = load i64, i64* %21, align 8
  %689 = add nsw i64 %688, %687
  store i64 %689, i64* %21, align 8
  %690 = load i64, i64* %21, align 8
  %691 = load i64, i64* %14, align 8
  %692 = icmp sgt i64 %690, %691
  br i1 %692, label %693, label %698

; <label>:693:                                    ; preds = %131
  %pgocount10 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 5)
  %694 = add i64 %pgocount10, 1
  store i64 %694, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 5)
  %695 = load i32, i32* %10, align 4
  %696 = trunc i32 %695 to i16
  store i16 %696, i16* %11, align 2
  %697 = load i64, i64* %21, align 8
  store i64 %697, i64* %14, align 8
  br label %698

; <label>:698:                                    ; preds = %693, %131
  br label %699

; <label>:699:                                    ; preds = %698
  %pgocount11 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 1)
  %700 = add i64 %pgocount11, 1
  store i64 %700, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 1)
  %701 = load i32, i32* %10, align 4
  %702 = add nsw i32 %701, 1
  store i32 %702, i32* %10, align 4
  br label %128

; <label>:703:                                    ; preds = %128
  %704 = load i16, i16* %11, align 2
  %705 = load i16*, i16** %8, align 8
  store i16 %704, i16* %705, align 2
  %706 = load i64, i64* %14, align 8
  %707 = shl i64 %706, 1
  store i64 %707, i64* %14, align 8
  %708 = load i16, i16* %19, align 2
  %709 = sext i16 %708 to i32
  %710 = icmp sle i32 %709, 100
  br i1 %710, label %711, label %717

; <label>:711:                                    ; preds = %703
  %712 = load i16, i16* %19, align 2
  %713 = sext i16 %712 to i32
  %714 = icmp sge i32 %713, -100
  br i1 %714, label %716, label %._crit_edge

._crit_edge:                                      ; preds = %711
  %pgocount12 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 15)
  %715 = add i64 %pgocount12, 1
  store i64 %715, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 15)
  br label %717

; <label>:716:                                    ; preds = %711
  br label %720

; <label>:717:                                    ; preds = %._crit_edge, %703
  %pgocount13 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 17)
  %718 = add i64 %pgocount13, 1
  store i64 %718, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 17)
  call void @__assert_fail(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 165, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @__PRETTY_FUNCTION__.Calculation_of_the_LTP_parameters, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %720

; <label>:720:                                    ; preds = %719, %716
  %721 = load i64, i64* %14, align 8
  %722 = load i16, i16* %19, align 2
  %723 = sext i16 %722 to i32
  %724 = sub nsw i32 6, %723
  %725 = zext i32 %724 to i64
  %726 = ashr i64 %721, %725
  store i64 %726, i64* %14, align 8
  %727 = load i16, i16* %11, align 2
  %728 = sext i16 %727 to i32
  %729 = icmp sle i32 %728, 120
  br i1 %729, label %730, label %736

; <label>:730:                                    ; preds = %720
  %731 = load i16, i16* %11, align 2
  %732 = sext i16 %731 to i32
  %733 = icmp sge i32 %732, 40
  br i1 %733, label %735, label %._crit_edge1

._crit_edge1:                                     ; preds = %730
  %pgocount14 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 16)
  %734 = add i64 %pgocount14, 1
  store i64 %734, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 16)
  br label %736

; <label>:735:                                    ; preds = %730
  br label %739

; <label>:736:                                    ; preds = %._crit_edge1, %720
  %pgocount15 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 18)
  %737 = add i64 %pgocount15, 1
  store i64 %737, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 18)
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 168, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @__PRETTY_FUNCTION__.Calculation_of_the_LTP_parameters, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %739

; <label>:739:                                    ; preds = %738, %735
  store i64 0, i64* %15, align 8
  store i32 0, i32* %9, align 4
  br label %740

; <label>:740:                                    ; preds = %760, %739
  %741 = load i32, i32* %9, align 4
  %742 = icmp sle i32 %741, 39
  br i1 %742, label %743, label %764

; <label>:743:                                    ; preds = %740
  %744 = load i16*, i16** %6, align 8
  %745 = load i32, i32* %9, align 4
  %746 = load i16, i16* %11, align 2
  %747 = sext i16 %746 to i32
  %748 = sub nsw i32 %745, %747
  %749 = sext i32 %748 to i64
  %750 = getelementptr inbounds i16, i16* %744, i64 %749
  %751 = load i16, i16* %750, align 2
  %752 = sext i16 %751 to i32
  %753 = ashr i32 %752, 3
  %754 = sext i32 %753 to i64
  store i64 %754, i64* %22, align 8
  %755 = load i64, i64* %22, align 8
  %756 = load i64, i64* %22, align 8
  %757 = mul nsw i64 %755, %756
  %758 = load i64, i64* %15, align 8
  %759 = add nsw i64 %758, %757
  store i64 %759, i64* %15, align 8
  br label %760

; <label>:760:                                    ; preds = %743
  %pgocount16 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 2)
  %761 = add i64 %pgocount16, 1
  store i64 %761, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 2)
  %762 = load i32, i32* %9, align 4
  %763 = add nsw i32 %762, 1
  store i32 %763, i32* %9, align 4
  br label %740

; <label>:764:                                    ; preds = %740
  %765 = load i64, i64* %15, align 8
  %766 = shl i64 %765, 1
  store i64 %766, i64* %15, align 8
  %767 = load i64, i64* %14, align 8
  %768 = icmp sle i64 %767, 0
  br i1 %768, label %769, label %772

; <label>:769:                                    ; preds = %764
  %pgocount17 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 10)
  %770 = add i64 %pgocount17, 1
  store i64 %770, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 10)
  %771 = load i16*, i16** %7, align 8
  store i16 0, i16* %771, align 2
  br label %822

; <label>:772:                                    ; preds = %764
  %773 = load i64, i64* %14, align 8
  %774 = load i64, i64* %15, align 8
  %775 = icmp sge i64 %773, %774
  br i1 %775, label %776, label %779

; <label>:776:                                    ; preds = %772
  %pgocount18 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 12)
  %777 = add i64 %pgocount18, 1
  store i64 %777, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 12)
  %778 = load i16*, i16** %7, align 8
  store i16 3, i16* %778, align 2
  br label %822

; <label>:779:                                    ; preds = %772
  %780 = load i64, i64* %15, align 8
  %781 = call signext i16 @gsm_norm(i64 %780)
  store i16 %781, i16* %20, align 2
  %782 = load i64, i64* %14, align 8
  %783 = load i16, i16* %20, align 2
  %784 = sext i16 %783 to i32
  %785 = zext i32 %784 to i64
  %786 = shl i64 %782, %785
  %787 = ashr i64 %786, 16
  %788 = trunc i64 %787 to i16
  store i16 %788, i16* %16, align 2
  %789 = load i64, i64* %15, align 8
  %790 = load i16, i16* %20, align 2
  %791 = sext i16 %790 to i32
  %792 = zext i32 %791 to i64
  %793 = shl i64 %789, %792
  %794 = ashr i64 %793, 16
  %795 = trunc i64 %794 to i16
  store i16 %795, i16* %17, align 2
  store i16 0, i16* %12, align 2
  br label %796

; <label>:796:                                    ; preds = %815, %779
  %797 = load i16, i16* %12, align 2
  %798 = sext i16 %797 to i32
  %799 = icmp sle i32 %798, 2
  br i1 %799, label %800, label %818

; <label>:800:                                    ; preds = %796
  %801 = load i16, i16* %16, align 2
  %802 = sext i16 %801 to i32
  %803 = load i16, i16* %17, align 2
  %804 = load i16, i16* %12, align 2
  %805 = sext i16 %804 to i64
  %806 = getelementptr inbounds [4 x i16], [4 x i16]* @gsm_DLB, i64 0, i64 %805
  %807 = load i16, i16* %806, align 2
  %808 = call signext i16 @gsm_mult(i16 signext %803, i16 signext %807)
  %809 = sext i16 %808 to i32
  %810 = icmp sle i32 %802, %809
  br i1 %810, label %811, label %813

; <label>:811:                                    ; preds = %800
  %pgocount19 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 14)
  %812 = add i64 %pgocount19, 1
  store i64 %812, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 14)
  br label %818

; <label>:813:                                    ; preds = %800
  %pgocount20 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 8)
  %814 = add i64 %pgocount20, 1
  store i64 %814, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 8)
  br label %815

; <label>:815:                                    ; preds = %813
  %816 = load i16, i16* %12, align 2
  %817 = add i16 %816, 1
  store i16 %817, i16* %12, align 2
  br label %796

; <label>:818:                                    ; preds = %811, %796
  %pgocount21 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 13)
  %819 = add i64 %pgocount21, 1
  store i64 %819, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Calculation_of_the_LTP_parameters, i64 0, i64 13)
  %820 = load i16, i16* %12, align 2
  %821 = load i16*, i16** %7, align 8
  store i16 %820, i16* %821, align 2
  br label %822

; <label>:822:                                    ; preds = %818, %776, %769
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @Long_term_analysis_filtering(i16 signext, i16 signext, i16*, i16*, i16*, i16*) #0 {
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca i16*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i64, align 8
  store i16 %0, i16* %7, align 2
  store i16 %1, i16* %8, align 2
  store i16* %2, i16** %9, align 8
  store i16* %3, i16** %10, align 8
  store i16* %4, i16** %11, align 8
  store i16* %5, i16** %12, align 8
  %15 = load i16, i16* %7, align 2
  %16 = sext i16 %15 to i32
  switch i32 %16, label %257 [
    i32 0, label %17
    i32 1, label %77
    i32 2, label %137
    i32 3, label %197
  ]

; <label>:17:                                     ; preds = %6
  store i32 0, i32* %13, align 4
  br label %18

; <label>:18:                                     ; preds = %72, %17
  %19 = load i32, i32* %13, align 4
  %20 = icmp sle i32 %19, 39
  br i1 %20, label %21, label %75

; <label>:21:                                     ; preds = %18
  %22 = load i16*, i16** %9, align 8
  %23 = load i32, i32* %13, align 4
  %24 = load i16, i16* %8, align 2
  %25 = sext i16 %24 to i32
  %26 = sub nsw i32 %23, %25
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i16, i16* %22, i64 %27
  %29 = load i16, i16* %28, align 2
  %30 = sext i16 %29 to i64
  %31 = mul nsw i64 3277, %30
  %32 = add nsw i64 %31, 16384
  %33 = ashr i64 %32, 15
  %34 = trunc i64 %33 to i16
  %35 = load i16*, i16** %11, align 8
  %36 = load i32, i32* %13, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i16, i16* %35, i64 %37
  store i16 %34, i16* %38, align 2
  %39 = load i16*, i16** %10, align 8
  %40 = load i32, i32* %13, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i16, i16* %39, i64 %41
  %43 = load i16, i16* %42, align 2
  %44 = sext i16 %43 to i64
  %45 = load i16*, i16** %11, align 8
  %46 = load i32, i32* %13, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i16, i16* %45, i64 %47
  %49 = load i16, i16* %48, align 2
  %50 = sext i16 %49 to i64
  %51 = sub nsw i64 %44, %50
  store i64 %51, i64* %14, align 8
  %52 = icmp sge i64 %51, 32767
  br i1 %52, label %53, label %55

; <label>:53:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 0)
  %54 = add i64 %pgocount, 1
  store i64 %54, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 0)
  br label %65

; <label>:55:                                     ; preds = %21
  %56 = load i64, i64* %14, align 8
  %57 = icmp sle i64 %56, -32768
  br i1 %57, label %58, label %60

; <label>:58:                                     ; preds = %55
  %pgocount1 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 4)
  %59 = add i64 %pgocount1, 1
  store i64 %59, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 4)
  br label %63

; <label>:60:                                     ; preds = %55
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 5)
  %61 = add i64 %pgocount2, 1
  store i64 %61, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 5)
  %62 = load i64, i64* %14, align 8
  br label %63

; <label>:63:                                     ; preds = %60, %58
  %64 = phi i64 [ -32768, %58 ], [ %62, %60 ]
  br label %65

; <label>:65:                                     ; preds = %63, %53
  %66 = phi i64 [ 32767, %53 ], [ %64, %63 ]
  %67 = trunc i64 %66 to i16
  %68 = load i16*, i16** %12, align 8
  %69 = load i32, i32* %13, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i16, i16* %68, i64 %70
  store i16 %67, i16* %71, align 2
  br label %72

; <label>:72:                                     ; preds = %65
  %73 = load i32, i32* %13, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %13, align 4
  br label %18

; <label>:75:                                     ; preds = %18
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 13)
  %76 = add i64 %pgocount3, 1
  store i64 %76, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 13)
  br label %257

; <label>:77:                                     ; preds = %6
  store i32 0, i32* %13, align 4
  br label %78

; <label>:78:                                     ; preds = %132, %77
  %79 = load i32, i32* %13, align 4
  %80 = icmp sle i32 %79, 39
  br i1 %80, label %81, label %135

; <label>:81:                                     ; preds = %78
  %82 = load i16*, i16** %9, align 8
  %83 = load i32, i32* %13, align 4
  %84 = load i16, i16* %8, align 2
  %85 = sext i16 %84 to i32
  %86 = sub nsw i32 %83, %85
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i16, i16* %82, i64 %87
  %89 = load i16, i16* %88, align 2
  %90 = sext i16 %89 to i64
  %91 = mul nsw i64 11469, %90
  %92 = add nsw i64 %91, 16384
  %93 = ashr i64 %92, 15
  %94 = trunc i64 %93 to i16
  %95 = load i16*, i16** %11, align 8
  %96 = load i32, i32* %13, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i16, i16* %95, i64 %97
  store i16 %94, i16* %98, align 2
  %99 = load i16*, i16** %10, align 8
  %100 = load i32, i32* %13, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i16, i16* %99, i64 %101
  %103 = load i16, i16* %102, align 2
  %104 = sext i16 %103 to i64
  %105 = load i16*, i16** %11, align 8
  %106 = load i32, i32* %13, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i16, i16* %105, i64 %107
  %109 = load i16, i16* %108, align 2
  %110 = sext i16 %109 to i64
  %111 = sub nsw i64 %104, %110
  store i64 %111, i64* %14, align 8
  %112 = icmp sge i64 %111, 32767
  br i1 %112, label %113, label %115

; <label>:113:                                    ; preds = %81
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 1)
  %114 = add i64 %pgocount4, 1
  store i64 %114, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 1)
  br label %125

; <label>:115:                                    ; preds = %81
  %116 = load i64, i64* %14, align 8
  %117 = icmp sle i64 %116, -32768
  br i1 %117, label %118, label %120

; <label>:118:                                    ; preds = %115
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 6)
  %119 = add i64 %pgocount5, 1
  store i64 %119, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 6)
  br label %123

; <label>:120:                                    ; preds = %115
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 7)
  %121 = add i64 %pgocount6, 1
  store i64 %121, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 7)
  %122 = load i64, i64* %14, align 8
  br label %123

; <label>:123:                                    ; preds = %120, %118
  %124 = phi i64 [ -32768, %118 ], [ %122, %120 ]
  br label %125

; <label>:125:                                    ; preds = %123, %113
  %126 = phi i64 [ 32767, %113 ], [ %124, %123 ]
  %127 = trunc i64 %126 to i16
  %128 = load i16*, i16** %12, align 8
  %129 = load i32, i32* %13, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i16, i16* %128, i64 %130
  store i16 %127, i16* %131, align 2
  br label %132

; <label>:132:                                    ; preds = %125
  %133 = load i32, i32* %13, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, i32* %13, align 4
  br label %78

; <label>:135:                                    ; preds = %78
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 14)
  %136 = add i64 %pgocount7, 1
  store i64 %136, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 14)
  br label %257

; <label>:137:                                    ; preds = %6
  store i32 0, i32* %13, align 4
  br label %138

; <label>:138:                                    ; preds = %192, %137
  %139 = load i32, i32* %13, align 4
  %140 = icmp sle i32 %139, 39
  br i1 %140, label %141, label %195

; <label>:141:                                    ; preds = %138
  %142 = load i16*, i16** %9, align 8
  %143 = load i32, i32* %13, align 4
  %144 = load i16, i16* %8, align 2
  %145 = sext i16 %144 to i32
  %146 = sub nsw i32 %143, %145
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds i16, i16* %142, i64 %147
  %149 = load i16, i16* %148, align 2
  %150 = sext i16 %149 to i64
  %151 = mul nsw i64 21299, %150
  %152 = add nsw i64 %151, 16384
  %153 = ashr i64 %152, 15
  %154 = trunc i64 %153 to i16
  %155 = load i16*, i16** %11, align 8
  %156 = load i32, i32* %13, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i16, i16* %155, i64 %157
  store i16 %154, i16* %158, align 2
  %159 = load i16*, i16** %10, align 8
  %160 = load i32, i32* %13, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds i16, i16* %159, i64 %161
  %163 = load i16, i16* %162, align 2
  %164 = sext i16 %163 to i64
  %165 = load i16*, i16** %11, align 8
  %166 = load i32, i32* %13, align 4
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds i16, i16* %165, i64 %167
  %169 = load i16, i16* %168, align 2
  %170 = sext i16 %169 to i64
  %171 = sub nsw i64 %164, %170
  store i64 %171, i64* %14, align 8
  %172 = icmp sge i64 %171, 32767
  br i1 %172, label %173, label %175

; <label>:173:                                    ; preds = %141
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 2)
  %174 = add i64 %pgocount8, 1
  store i64 %174, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 2)
  br label %185

; <label>:175:                                    ; preds = %141
  %176 = load i64, i64* %14, align 8
  %177 = icmp sle i64 %176, -32768
  br i1 %177, label %178, label %180

; <label>:178:                                    ; preds = %175
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 8)
  %179 = add i64 %pgocount9, 1
  store i64 %179, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 8)
  br label %183

; <label>:180:                                    ; preds = %175
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 9)
  %181 = add i64 %pgocount10, 1
  store i64 %181, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 9)
  %182 = load i64, i64* %14, align 8
  br label %183

; <label>:183:                                    ; preds = %180, %178
  %184 = phi i64 [ -32768, %178 ], [ %182, %180 ]
  br label %185

; <label>:185:                                    ; preds = %183, %173
  %186 = phi i64 [ 32767, %173 ], [ %184, %183 ]
  %187 = trunc i64 %186 to i16
  %188 = load i16*, i16** %12, align 8
  %189 = load i32, i32* %13, align 4
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds i16, i16* %188, i64 %190
  store i16 %187, i16* %191, align 2
  br label %192

; <label>:192:                                    ; preds = %185
  %193 = load i32, i32* %13, align 4
  %194 = add nsw i32 %193, 1
  store i32 %194, i32* %13, align 4
  br label %138

; <label>:195:                                    ; preds = %138
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 15)
  %196 = add i64 %pgocount11, 1
  store i64 %196, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 15)
  br label %257

; <label>:197:                                    ; preds = %6
  store i32 0, i32* %13, align 4
  br label %198

; <label>:198:                                    ; preds = %252, %197
  %199 = load i32, i32* %13, align 4
  %200 = icmp sle i32 %199, 39
  br i1 %200, label %201, label %255

; <label>:201:                                    ; preds = %198
  %202 = load i16*, i16** %9, align 8
  %203 = load i32, i32* %13, align 4
  %204 = load i16, i16* %8, align 2
  %205 = sext i16 %204 to i32
  %206 = sub nsw i32 %203, %205
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds i16, i16* %202, i64 %207
  %209 = load i16, i16* %208, align 2
  %210 = sext i16 %209 to i64
  %211 = mul nsw i64 32767, %210
  %212 = add nsw i64 %211, 16384
  %213 = ashr i64 %212, 15
  %214 = trunc i64 %213 to i16
  %215 = load i16*, i16** %11, align 8
  %216 = load i32, i32* %13, align 4
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds i16, i16* %215, i64 %217
  store i16 %214, i16* %218, align 2
  %219 = load i16*, i16** %10, align 8
  %220 = load i32, i32* %13, align 4
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds i16, i16* %219, i64 %221
  %223 = load i16, i16* %222, align 2
  %224 = sext i16 %223 to i64
  %225 = load i16*, i16** %11, align 8
  %226 = load i32, i32* %13, align 4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds i16, i16* %225, i64 %227
  %229 = load i16, i16* %228, align 2
  %230 = sext i16 %229 to i64
  %231 = sub nsw i64 %224, %230
  store i64 %231, i64* %14, align 8
  %232 = icmp sge i64 %231, 32767
  br i1 %232, label %233, label %235

; <label>:233:                                    ; preds = %201
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 3)
  %234 = add i64 %pgocount12, 1
  store i64 %234, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 3)
  br label %245

; <label>:235:                                    ; preds = %201
  %236 = load i64, i64* %14, align 8
  %237 = icmp sle i64 %236, -32768
  br i1 %237, label %238, label %240

; <label>:238:                                    ; preds = %235
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 10)
  %239 = add i64 %pgocount13, 1
  store i64 %239, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 10)
  br label %243

; <label>:240:                                    ; preds = %235
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 11)
  %241 = add i64 %pgocount14, 1
  store i64 %241, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 11)
  %242 = load i64, i64* %14, align 8
  br label %243

; <label>:243:                                    ; preds = %240, %238
  %244 = phi i64 [ -32768, %238 ], [ %242, %240 ]
  br label %245

; <label>:245:                                    ; preds = %243, %233
  %246 = phi i64 [ 32767, %233 ], [ %244, %243 ]
  %247 = trunc i64 %246 to i16
  %248 = load i16*, i16** %12, align 8
  %249 = load i32, i32* %13, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds i16, i16* %248, i64 %250
  store i16 %247, i16* %251, align 2
  br label %252

; <label>:252:                                    ; preds = %245
  %253 = load i32, i32* %13, align 4
  %254 = add nsw i32 %253, 1
  store i32 %254, i32* %13, align 4
  br label %198

; <label>:255:                                    ; preds = %198
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 16)
  %256 = add i64 %pgocount15, 1
  store i64 %256, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 16)
  br label %257

; <label>:257:                                    ; preds = %255, %195, %135, %75, %6
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 12)
  %258 = add i64 %pgocount16, 1
  store i64 %258, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_Long_term_analysis_filtering, i64 0, i64 12)
  ret void
}

; Function Attrs: nounwind uwtable
define void @Gsm_Long_Term_Synthesis_Filtering(%struct.gsm_state*, i16 signext, i16 signext, i16*, i16*) #0 {
  %6 = alloca %struct.gsm_state*, align 8
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i32, align 4
  %13 = alloca i16, align 2
  %14 = alloca i16, align 2
  %15 = alloca i16, align 2
  store %struct.gsm_state* %0, %struct.gsm_state** %6, align 8
  store i16 %1, i16* %7, align 2
  store i16 %2, i16* %8, align 2
  store i16* %3, i16** %9, align 8
  store i16* %4, i16** %10, align 8
  %16 = load i16, i16* %7, align 2
  %17 = sext i16 %16 to i32
  %18 = icmp slt i32 %17, 40
  br i1 %18, label %24, label %19

; <label>:19:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 4)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 4)
  %21 = load i16, i16* %7, align 2
  %22 = sext i16 %21 to i32
  %23 = icmp sgt i32 %22, 120
  br i1 %23, label %24, label %30

; <label>:24:                                     ; preds = %19, %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 3)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 3)
  %26 = load %struct.gsm_state*, %struct.gsm_state** %6, align 8
  %27 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %26, i32 0, i32 7
  %28 = load i16, i16* %27, align 2
  %29 = sext i16 %28 to i32
  br label %34

; <label>:30:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 5)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 5)
  %32 = load i16, i16* %7, align 2
  %33 = sext i16 %32 to i32
  br label %34

; <label>:34:                                     ; preds = %30, %24
  %35 = phi i32 [ %29, %24 ], [ %33, %30 ]
  %36 = trunc i32 %35 to i16
  store i16 %36, i16* %15, align 2
  %37 = load i16, i16* %15, align 2
  %38 = load %struct.gsm_state*, %struct.gsm_state** %6, align 8
  %39 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %38, i32 0, i32 7
  store i16 %37, i16* %39, align 2
  %40 = load i16, i16* %15, align 2
  %41 = sext i16 %40 to i32
  %42 = icmp sge i32 %41, 40
  br i1 %42, label %43, label %49

; <label>:43:                                     ; preds = %34
  %44 = load i16, i16* %15, align 2
  %45 = sext i16 %44 to i32
  %46 = icmp sle i32 %45, 120
  br i1 %46, label %48, label %._crit_edge

._crit_edge:                                      ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 6)
  %47 = add i64 %pgocount3, 1
  store i64 %47, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 6)
  br label %49

; <label>:48:                                     ; preds = %43
  br label %52

; <label>:49:                                     ; preds = %._crit_edge, %34
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 7)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 7)
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 581, i8* getelementptr inbounds ([87 x i8], [87 x i8]* @__PRETTY_FUNCTION__.Gsm_Long_Term_Synthesis_Filtering, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %52

; <label>:52:                                     ; preds = %51, %48
  %53 = load i16, i16* %8, align 2
  %54 = sext i16 %53 to i64
  %55 = getelementptr inbounds [4 x i16], [4 x i16]* @gsm_QLB, i64 0, i64 %54
  %56 = load i16, i16* %55, align 2
  store i16 %56, i16* %13, align 2
  %57 = load i16, i16* %13, align 2
  %58 = sext i16 %57 to i32
  %59 = icmp ne i32 %58, -32768
  br i1 %59, label %60, label %61

; <label>:60:                                     ; preds = %52
  br label %64

; <label>:61:                                     ; preds = %52
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 8)
  %62 = add i64 %pgocount5, 1
  store i64 %62, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 8)
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 590, i8* getelementptr inbounds ([87 x i8], [87 x i8]* @__PRETTY_FUNCTION__.Gsm_Long_Term_Synthesis_Filtering, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %64

; <label>:64:                                     ; preds = %63, %60
  store i32 0, i32* %12, align 4
  br label %65

; <label>:65:                                     ; preds = %113, %64
  %66 = load i32, i32* %12, align 4
  %67 = icmp sle i32 %66, 39
  br i1 %67, label %68, label %116

; <label>:68:                                     ; preds = %65
  %69 = load i16, i16* %13, align 2
  %70 = sext i16 %69 to i64
  %71 = load i16*, i16** %10, align 8
  %72 = load i32, i32* %12, align 4
  %73 = load i16, i16* %15, align 2
  %74 = sext i16 %73 to i32
  %75 = sub nsw i32 %72, %74
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i16, i16* %71, i64 %76
  %78 = load i16, i16* %77, align 2
  %79 = sext i16 %78 to i64
  %80 = mul nsw i64 %70, %79
  %81 = add nsw i64 %80, 16384
  %82 = ashr i64 %81, 15
  %83 = trunc i64 %82 to i16
  store i16 %83, i16* %14, align 2
  %84 = load i16*, i16** %9, align 8
  %85 = load i32, i32* %12, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i16, i16* %84, i64 %86
  %88 = load i16, i16* %87, align 2
  %89 = sext i16 %88 to i64
  %90 = load i16, i16* %14, align 2
  %91 = sext i16 %90 to i64
  %92 = add nsw i64 %89, %91
  store i64 %92, i64* %11, align 8
  %93 = sub nsw i64 %92, -32768
  %94 = icmp ugt i64 %93, 65535
  br i1 %94, label %95, label %103

; <label>:95:                                     ; preds = %68
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 1)
  %96 = add i64 %pgocount6, 1
  store i64 %96, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 1)
  %97 = load i64, i64* %11, align 8
  %98 = icmp sgt i64 %97, 0
  %99 = zext i1 %98 to i64
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 9)
  %100 = add i64 %pgocount7, %99
  store i64 %100, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 9)
  %101 = select i1 %98, i32 32767, i32 -32768
  %102 = sext i32 %101 to i64
  br label %106

; <label>:103:                                    ; preds = %68
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 2)
  %104 = add i64 %pgocount8, 1
  store i64 %104, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 2)
  %105 = load i64, i64* %11, align 8
  br label %106

; <label>:106:                                    ; preds = %103, %95
  %107 = phi i64 [ %102, %95 ], [ %105, %103 ]
  %108 = trunc i64 %107 to i16
  %109 = load i16*, i16** %10, align 8
  %110 = load i32, i32* %12, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i16, i16* %109, i64 %111
  store i16 %108, i16* %112, align 2
  br label %113

; <label>:113:                                    ; preds = %106
  %114 = load i32, i32* %12, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, i32* %12, align 4
  br label %65

; <label>:116:                                    ; preds = %65
  store i32 0, i32* %12, align 4
  br label %117

; <label>:117:                                    ; preds = %132, %116
  %118 = load i32, i32* %12, align 4
  %119 = icmp sle i32 %118, 119
  br i1 %119, label %120, label %136

; <label>:120:                                    ; preds = %117
  %121 = load i16*, i16** %10, align 8
  %122 = load i32, i32* %12, align 4
  %123 = add nsw i32 -80, %122
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i16, i16* %121, i64 %124
  %126 = load i16, i16* %125, align 2
  %127 = load i16*, i16** %10, align 8
  %128 = load i32, i32* %12, align 4
  %129 = add nsw i32 -120, %128
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i16, i16* %127, i64 %130
  store i16 %126, i16* %131, align 2
  br label %132

; <label>:132:                                    ; preds = %120
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 0)
  %133 = add i64 %pgocount9, 1
  store i64 %133, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Gsm_Long_Term_Synthesis_Filtering, i64 0, i64 0)
  %134 = load i32, i32* %12, align 4
  %135 = add nsw i32 %134, 1
  store i32 %135, i32* %12, align 4
  br label %117

; <label>:136:                                    ; preds = %117
  ret void
}

declare signext i16 @gsm_norm(i64) #2

declare signext i16 @gsm_mult(i16 signext, i16 signext) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

; ModuleID = 'tmp1.ll'
source_filename = "short_term.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_Gsm_Short_Term_Analysis_Filter = private constant [30 x i8] c"Gsm_Short_Term_Analysis_Filter"
@__profn_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios = private constant [45 x i8] c"tmp1.ll:Decoding_of_the_coded_Log_Area_Ratios"
@__profn_tmp1.ll_Coefficients_0_12 = private constant [25 x i8] c"tmp1.ll:Coefficients_0_12"
@__profn_tmp1.ll_LARp_to_rp = private constant [18 x i8] c"tmp1.ll:LARp_to_rp"
@__profn_tmp1.ll_Short_term_analysis_filtering = private constant [37 x i8] c"tmp1.ll:Short_term_analysis_filtering"
@__profn_tmp1.ll_Coefficients_13_26 = private constant [26 x i8] c"tmp1.ll:Coefficients_13_26"
@__profn_tmp1.ll_Coefficients_27_39 = private constant [26 x i8] c"tmp1.ll:Coefficients_27_39"
@__profn_tmp1.ll_Coefficients_40_159 = private constant [27 x i8] c"tmp1.ll:Coefficients_40_159"
@__profn_Gsm_Short_Term_Synthesis_Filter = private constant [31 x i8] c"Gsm_Short_Term_Synthesis_Filter"
@__profn_tmp1.ll_Short_term_synthesis_filtering = private constant [38 x i8] c"tmp1.ll:Short_term_synthesis_filtering"
@__profc_Gsm_Short_Term_Analysis_Filter = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Gsm_Short_Term_Analysis_Filter = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6125103629364718138, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Gsm_Short_Term_Analysis_Filter, i32 0, i32 0), i8* bitcast (void (%struct.gsm_state*, i16*, i16*)* @Gsm_Short_Term_Analysis_Filter to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios = private global [49 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1141181294598421876, i64 1152922065767591288, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i32 0, i32 0), i8* null, i8* null, i32 49, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Coefficients_0_12 = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Coefficients_0_12 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2246713579215704495, i64 144115255854779585, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_0_12, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LARp_to_rp = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_LARp_to_rp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7269553693832691855, i64 144115358258310732, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i32 0, i32 0), i8* null, i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Short_term_analysis_filtering = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Short_term_analysis_filtering = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3720172358595460733, i64 144115277650741747, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_Short_term_analysis_filtering, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Coefficients_13_26 = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Coefficients_13_26 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5157887927372888833, i64 72057642215586531, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Coefficients_13_26, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Coefficients_27_39 = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Coefficients_27_39 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6060680938281794231, i64 144115255854779585, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_27_39, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Coefficients_40_159 = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Coefficients_40_159 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4170226843838868240, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Coefficients_40_159, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_Gsm_Short_Term_Synthesis_Filter = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Gsm_Short_Term_Synthesis_Filter = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 999952780929611622, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Gsm_Short_Term_Synthesis_Filter, i32 0, i32 0), i8* bitcast (void (%struct.gsm_state*, i16*, i16*, i16*)* @Gsm_Short_Term_Synthesis_Filter to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Short_term_synthesis_filtering = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Short_term_synthesis_filtering = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1093273524986528210, i64 72057740998356943, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i32 0, i32 0), i8* null, i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [315 x i8] c"\B8\02\00Gsm_Short_Term_Analysis_Filter\01tmp1.ll:Decoding_of_the_coded_Log_Area_Ratios\01tmp1.ll:Coefficients_0_12\01tmp1.ll:LARp_to_rp\01tmp1.ll:Short_term_analysis_filtering\01tmp1.ll:Coefficients_13_26\01tmp1.ll:Coefficients_27_39\01tmp1.ll:Coefficients_40_159\01Gsm_Short_Term_Synthesis_Filter\01tmp1.ll:Short_term_synthesis_filtering", section "__llvm_prf_names"
@llvm.used = appending global [11 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Gsm_Short_Term_Analysis_Filter to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Coefficients_0_12 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LARp_to_rp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Short_term_analysis_filtering to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Coefficients_13_26 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Coefficients_27_39 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Coefficients_40_159 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Gsm_Short_Term_Synthesis_Filter to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Short_term_synthesis_filtering to i8*), i8* getelementptr inbounds ([315 x i8], [315 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @Gsm_Short_Term_Analysis_Filter(%struct.gsm_state*, i16*, i16*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Gsm_Short_Term_Analysis_Filter, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Gsm_Short_Term_Analysis_Filter, i64 0, i64 0)
  %5 = alloca %struct.gsm_state*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca [8 x i16], align 16
  store %struct.gsm_state* %0, %struct.gsm_state** %5, align 8
  store i16* %1, i16** %6, align 8
  store i16* %2, i16** %7, align 8
  %11 = load %struct.gsm_state*, %struct.gsm_state** %5, align 8
  %12 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %11, i32 0, i32 5
  %13 = load %struct.gsm_state*, %struct.gsm_state** %5, align 8
  %14 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %13, i32 0, i32 6
  %15 = load i16, i16* %14, align 4
  %16 = sext i16 %15 to i64
  %17 = getelementptr inbounds [2 x [8 x i16]], [2 x [8 x i16]]* %12, i64 0, i64 %16
  %18 = getelementptr inbounds [8 x i16], [8 x i16]* %17, i32 0, i32 0
  store i16* %18, i16** %8, align 8
  %19 = load %struct.gsm_state*, %struct.gsm_state** %5, align 8
  %20 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %19, i32 0, i32 5
  %21 = load %struct.gsm_state*, %struct.gsm_state** %5, align 8
  %22 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %21, i32 0, i32 6
  %23 = load i16, i16* %22, align 4
  %24 = sext i16 %23 to i32
  %25 = xor i32 %24, 1
  %26 = trunc i32 %25 to i16
  store i16 %26, i16* %22, align 4
  %27 = sext i16 %26 to i64
  %28 = getelementptr inbounds [2 x [8 x i16]], [2 x [8 x i16]]* %20, i64 0, i64 %27
  %29 = getelementptr inbounds [8 x i16], [8 x i16]* %28, i32 0, i32 0
  store i16* %29, i16** %9, align 8
  %30 = load i16*, i16** %6, align 8
  %31 = load i16*, i16** %8, align 8
  call void @Decoding_of_the_coded_Log_Area_Ratios(i16* %30, i16* %31)
  %32 = load i16*, i16** %9, align 8
  %33 = load i16*, i16** %8, align 8
  %34 = getelementptr inbounds [8 x i16], [8 x i16]* %10, i32 0, i32 0
  call void @Coefficients_0_12(i16* %32, i16* %33, i16* %34)
  %35 = getelementptr inbounds [8 x i16], [8 x i16]* %10, i32 0, i32 0
  call void @LARp_to_rp(i16* %35)
  %36 = load %struct.gsm_state*, %struct.gsm_state** %5, align 8
  %37 = getelementptr inbounds [8 x i16], [8 x i16]* %10, i32 0, i32 0
  %38 = load i16*, i16** %7, align 8
  call void @Short_term_analysis_filtering(%struct.gsm_state* %36, i16* %37, i32 13, i16* %38)
  %39 = load i16*, i16** %9, align 8
  %40 = load i16*, i16** %8, align 8
  %41 = getelementptr inbounds [8 x i16], [8 x i16]* %10, i32 0, i32 0
  call void @Coefficients_13_26(i16* %39, i16* %40, i16* %41)
  %42 = getelementptr inbounds [8 x i16], [8 x i16]* %10, i32 0, i32 0
  call void @LARp_to_rp(i16* %42)
  %43 = load %struct.gsm_state*, %struct.gsm_state** %5, align 8
  %44 = getelementptr inbounds [8 x i16], [8 x i16]* %10, i32 0, i32 0
  %45 = load i16*, i16** %7, align 8
  %46 = getelementptr inbounds i16, i16* %45, i64 13
  call void @Short_term_analysis_filtering(%struct.gsm_state* %43, i16* %44, i32 14, i16* %46)
  %47 = load i16*, i16** %9, align 8
  %48 = load i16*, i16** %8, align 8
  %49 = getelementptr inbounds [8 x i16], [8 x i16]* %10, i32 0, i32 0
  call void @Coefficients_27_39(i16* %47, i16* %48, i16* %49)
  %50 = getelementptr inbounds [8 x i16], [8 x i16]* %10, i32 0, i32 0
  call void @LARp_to_rp(i16* %50)
  %51 = load %struct.gsm_state*, %struct.gsm_state** %5, align 8
  %52 = getelementptr inbounds [8 x i16], [8 x i16]* %10, i32 0, i32 0
  %53 = load i16*, i16** %7, align 8
  %54 = getelementptr inbounds i16, i16* %53, i64 27
  call void @Short_term_analysis_filtering(%struct.gsm_state* %51, i16* %52, i32 13, i16* %54)
  %55 = load i16*, i16** %8, align 8
  %56 = getelementptr inbounds [8 x i16], [8 x i16]* %10, i32 0, i32 0
  call void @Coefficients_40_159(i16* %55, i16* %56)
  %57 = getelementptr inbounds [8 x i16], [8 x i16]* %10, i32 0, i32 0
  call void @LARp_to_rp(i16* %57)
  %58 = load %struct.gsm_state*, %struct.gsm_state** %5, align 8
  %59 = getelementptr inbounds [8 x i16], [8 x i16]* %10, i32 0, i32 0
  %60 = load i16*, i16** %7, align 8
  %61 = getelementptr inbounds i16, i16* %60, i64 40
  call void @Short_term_analysis_filtering(%struct.gsm_state* %58, i16* %59, i32 120, i16* %61)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Decoding_of_the_coded_Log_Area_Ratios(i16*, i16*) #0 {
  %3 = alloca i16*, align 8
  %4 = alloca i16*, align 8
  %5 = alloca i16, align 2
  %6 = alloca i64, align 8
  store i16* %0, i16** %3, align 8
  store i16* %1, i16** %4, align 8
  %7 = load i16*, i16** %3, align 8
  %8 = getelementptr inbounds i16, i16* %7, i32 1
  store i16* %8, i16** %3, align 8
  %9 = load i16, i16* %7, align 2
  %10 = sext i16 %9 to i64
  %11 = add nsw i64 %10, -32
  store i64 %11, i64* %6, align 8
  %12 = sub nsw i64 %11, -32768
  %13 = icmp ugt i64 %12, 65535
  br i1 %13, label %14, label %21

; <label>:14:                                     ; preds = %2
  %15 = load i64, i64* %6, align 8
  %16 = icmp sgt i64 %15, 0
  %17 = zext i1 %16 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 33)
  %18 = add i64 %pgocount, %17
  store i64 %18, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 33)
  %19 = select i1 %16, i32 32767, i32 -32768
  %20 = sext i32 %19 to i64
  br label %24

; <label>:21:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 0)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 0)
  %23 = load i64, i64* %6, align 8
  br label %24

; <label>:24:                                     ; preds = %21, %14
  %25 = phi i64 [ %20, %14 ], [ %23, %21 ]
  %26 = shl i64 %25, 10
  %27 = trunc i64 %26 to i16
  store i16 %27, i16* %5, align 2
  %28 = load i16, i16* %5, align 2
  %29 = sext i16 %28 to i64
  %30 = sub nsw i64 %29, 0
  store i64 %30, i64* %6, align 8
  %31 = icmp sge i64 %30, 32767
  br i1 %31, label %32, label %33

; <label>:32:                                     ; preds = %24
  br label %43

; <label>:33:                                     ; preds = %24
  %34 = load i64, i64* %6, align 8
  %35 = icmp sle i64 %34, -32768
  br i1 %35, label %36, label %38

; <label>:36:                                     ; preds = %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 17)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 17)
  br label %41

; <label>:38:                                     ; preds = %33
  %pgocount3 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 18)
  %39 = add i64 %pgocount3, 1
  store i64 %39, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 18)
  %40 = load i64, i64* %6, align 8
  br label %41

; <label>:41:                                     ; preds = %38, %36
  %42 = phi i64 [ -32768, %36 ], [ %40, %38 ]
  br label %43

; <label>:43:                                     ; preds = %41, %32
  %44 = phi i64 [ 32767, %32 ], [ %42, %41 ]
  %45 = trunc i64 %44 to i16
  store i16 %45, i16* %5, align 2
  %46 = load i16, i16* %5, align 2
  %47 = sext i16 %46 to i64
  %48 = mul nsw i64 13107, %47
  %49 = add nsw i64 %48, 16384
  %50 = ashr i64 %49, 15
  %51 = trunc i64 %50 to i16
  store i16 %51, i16* %5, align 2
  %52 = load i16, i16* %5, align 2
  %53 = sext i16 %52 to i64
  %54 = load i16, i16* %5, align 2
  %55 = sext i16 %54 to i64
  %56 = add nsw i64 %53, %55
  store i64 %56, i64* %6, align 8
  %57 = sub nsw i64 %56, -32768
  %58 = icmp ugt i64 %57, 65535
  br i1 %58, label %59, label %66

; <label>:59:                                     ; preds = %43
  %60 = load i64, i64* %6, align 8
  %61 = icmp sgt i64 %60, 0
  %62 = zext i1 %61 to i64
  %pgocount4 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 34)
  %63 = add i64 %pgocount4, %62
  store i64 %63, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 34)
  %64 = select i1 %61, i32 32767, i32 -32768
  %65 = sext i32 %64 to i64
  br label %69

; <label>:66:                                     ; preds = %43
  %pgocount5 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 1)
  %67 = add i64 %pgocount5, 1
  store i64 %67, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 1)
  %68 = load i64, i64* %6, align 8
  br label %69

; <label>:69:                                     ; preds = %66, %59
  %70 = phi i64 [ %65, %59 ], [ %68, %66 ]
  %71 = trunc i64 %70 to i16
  %72 = load i16*, i16** %4, align 8
  %73 = getelementptr inbounds i16, i16* %72, i32 1
  store i16* %73, i16** %4, align 8
  store i16 %71, i16* %72, align 2
  %74 = load i16*, i16** %3, align 8
  %75 = getelementptr inbounds i16, i16* %74, i32 1
  store i16* %75, i16** %3, align 8
  %76 = load i16, i16* %74, align 2
  %77 = sext i16 %76 to i64
  %78 = add nsw i64 %77, -32
  store i64 %78, i64* %6, align 8
  %79 = sub nsw i64 %78, -32768
  %80 = icmp ugt i64 %79, 65535
  br i1 %80, label %81, label %88

; <label>:81:                                     ; preds = %69
  %82 = load i64, i64* %6, align 8
  %83 = icmp sgt i64 %82, 0
  %84 = zext i1 %83 to i64
  %pgocount6 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 35)
  %85 = add i64 %pgocount6, %84
  store i64 %85, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 35)
  %86 = select i1 %83, i32 32767, i32 -32768
  %87 = sext i32 %86 to i64
  br label %91

; <label>:88:                                     ; preds = %69
  %pgocount7 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 2)
  %89 = add i64 %pgocount7, 1
  store i64 %89, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 2)
  %90 = load i64, i64* %6, align 8
  br label %91

; <label>:91:                                     ; preds = %88, %81
  %92 = phi i64 [ %87, %81 ], [ %90, %88 ]
  %93 = shl i64 %92, 10
  %94 = trunc i64 %93 to i16
  store i16 %94, i16* %5, align 2
  %95 = load i16, i16* %5, align 2
  %96 = sext i16 %95 to i64
  %97 = sub nsw i64 %96, 0
  store i64 %97, i64* %6, align 8
  %98 = icmp sge i64 %97, 32767
  br i1 %98, label %99, label %100

; <label>:99:                                     ; preds = %91
  br label %110

; <label>:100:                                    ; preds = %91
  %101 = load i64, i64* %6, align 8
  %102 = icmp sle i64 %101, -32768
  br i1 %102, label %103, label %105

; <label>:103:                                    ; preds = %100
  %pgocount8 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 19)
  %104 = add i64 %pgocount8, 1
  store i64 %104, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 19)
  br label %108

; <label>:105:                                    ; preds = %100
  %pgocount9 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 20)
  %106 = add i64 %pgocount9, 1
  store i64 %106, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 20)
  %107 = load i64, i64* %6, align 8
  br label %108

; <label>:108:                                    ; preds = %105, %103
  %109 = phi i64 [ -32768, %103 ], [ %107, %105 ]
  br label %110

; <label>:110:                                    ; preds = %108, %99
  %111 = phi i64 [ 32767, %99 ], [ %109, %108 ]
  %112 = trunc i64 %111 to i16
  store i16 %112, i16* %5, align 2
  %113 = load i16, i16* %5, align 2
  %114 = sext i16 %113 to i64
  %115 = mul nsw i64 13107, %114
  %116 = add nsw i64 %115, 16384
  %117 = ashr i64 %116, 15
  %118 = trunc i64 %117 to i16
  store i16 %118, i16* %5, align 2
  %119 = load i16, i16* %5, align 2
  %120 = sext i16 %119 to i64
  %121 = load i16, i16* %5, align 2
  %122 = sext i16 %121 to i64
  %123 = add nsw i64 %120, %122
  store i64 %123, i64* %6, align 8
  %124 = sub nsw i64 %123, -32768
  %125 = icmp ugt i64 %124, 65535
  br i1 %125, label %126, label %133

; <label>:126:                                    ; preds = %110
  %127 = load i64, i64* %6, align 8
  %128 = icmp sgt i64 %127, 0
  %129 = zext i1 %128 to i64
  %pgocount10 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 36)
  %130 = add i64 %pgocount10, %129
  store i64 %130, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 36)
  %131 = select i1 %128, i32 32767, i32 -32768
  %132 = sext i32 %131 to i64
  br label %136

; <label>:133:                                    ; preds = %110
  %pgocount11 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 3)
  %134 = add i64 %pgocount11, 1
  store i64 %134, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 3)
  %135 = load i64, i64* %6, align 8
  br label %136

; <label>:136:                                    ; preds = %133, %126
  %137 = phi i64 [ %132, %126 ], [ %135, %133 ]
  %138 = trunc i64 %137 to i16
  %139 = load i16*, i16** %4, align 8
  %140 = getelementptr inbounds i16, i16* %139, i32 1
  store i16* %140, i16** %4, align 8
  store i16 %138, i16* %139, align 2
  %141 = load i16*, i16** %3, align 8
  %142 = getelementptr inbounds i16, i16* %141, i32 1
  store i16* %142, i16** %3, align 8
  %143 = load i16, i16* %141, align 2
  %144 = sext i16 %143 to i64
  %145 = add nsw i64 %144, -16
  store i64 %145, i64* %6, align 8
  %146 = sub nsw i64 %145, -32768
  %147 = icmp ugt i64 %146, 65535
  br i1 %147, label %148, label %155

; <label>:148:                                    ; preds = %136
  %149 = load i64, i64* %6, align 8
  %150 = icmp sgt i64 %149, 0
  %151 = zext i1 %150 to i64
  %pgocount12 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 37)
  %152 = add i64 %pgocount12, %151
  store i64 %152, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 37)
  %153 = select i1 %150, i32 32767, i32 -32768
  %154 = sext i32 %153 to i64
  br label %158

; <label>:155:                                    ; preds = %136
  %pgocount13 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 4)
  %156 = add i64 %pgocount13, 1
  store i64 %156, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 4)
  %157 = load i64, i64* %6, align 8
  br label %158

; <label>:158:                                    ; preds = %155, %148
  %159 = phi i64 [ %154, %148 ], [ %157, %155 ]
  %160 = shl i64 %159, 10
  %161 = trunc i64 %160 to i16
  store i16 %161, i16* %5, align 2
  %162 = load i16, i16* %5, align 2
  %163 = sext i16 %162 to i64
  %164 = sub nsw i64 %163, 4096
  store i64 %164, i64* %6, align 8
  %165 = icmp sge i64 %164, 32767
  br i1 %165, label %166, label %167

; <label>:166:                                    ; preds = %158
  br label %177

; <label>:167:                                    ; preds = %158
  %168 = load i64, i64* %6, align 8
  %169 = icmp sle i64 %168, -32768
  br i1 %169, label %170, label %172

; <label>:170:                                    ; preds = %167
  %pgocount14 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 21)
  %171 = add i64 %pgocount14, 1
  store i64 %171, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 21)
  br label %175

; <label>:172:                                    ; preds = %167
  %pgocount15 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 22)
  %173 = add i64 %pgocount15, 1
  store i64 %173, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 22)
  %174 = load i64, i64* %6, align 8
  br label %175

; <label>:175:                                    ; preds = %172, %170
  %176 = phi i64 [ -32768, %170 ], [ %174, %172 ]
  br label %177

; <label>:177:                                    ; preds = %175, %166
  %178 = phi i64 [ 32767, %166 ], [ %176, %175 ]
  %179 = trunc i64 %178 to i16
  store i16 %179, i16* %5, align 2
  %180 = load i16, i16* %5, align 2
  %181 = sext i16 %180 to i64
  %182 = mul nsw i64 13107, %181
  %183 = add nsw i64 %182, 16384
  %184 = ashr i64 %183, 15
  %185 = trunc i64 %184 to i16
  store i16 %185, i16* %5, align 2
  %186 = load i16, i16* %5, align 2
  %187 = sext i16 %186 to i64
  %188 = load i16, i16* %5, align 2
  %189 = sext i16 %188 to i64
  %190 = add nsw i64 %187, %189
  store i64 %190, i64* %6, align 8
  %191 = sub nsw i64 %190, -32768
  %192 = icmp ugt i64 %191, 65535
  br i1 %192, label %193, label %200

; <label>:193:                                    ; preds = %177
  %194 = load i64, i64* %6, align 8
  %195 = icmp sgt i64 %194, 0
  %196 = zext i1 %195 to i64
  %pgocount16 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 38)
  %197 = add i64 %pgocount16, %196
  store i64 %197, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 38)
  %198 = select i1 %195, i32 32767, i32 -32768
  %199 = sext i32 %198 to i64
  br label %203

; <label>:200:                                    ; preds = %177
  %pgocount17 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 5)
  %201 = add i64 %pgocount17, 1
  store i64 %201, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 5)
  %202 = load i64, i64* %6, align 8
  br label %203

; <label>:203:                                    ; preds = %200, %193
  %204 = phi i64 [ %199, %193 ], [ %202, %200 ]
  %205 = trunc i64 %204 to i16
  %206 = load i16*, i16** %4, align 8
  %207 = getelementptr inbounds i16, i16* %206, i32 1
  store i16* %207, i16** %4, align 8
  store i16 %205, i16* %206, align 2
  %208 = load i16*, i16** %3, align 8
  %209 = getelementptr inbounds i16, i16* %208, i32 1
  store i16* %209, i16** %3, align 8
  %210 = load i16, i16* %208, align 2
  %211 = sext i16 %210 to i64
  %212 = add nsw i64 %211, -16
  store i64 %212, i64* %6, align 8
  %213 = sub nsw i64 %212, -32768
  %214 = icmp ugt i64 %213, 65535
  br i1 %214, label %215, label %222

; <label>:215:                                    ; preds = %203
  %216 = load i64, i64* %6, align 8
  %217 = icmp sgt i64 %216, 0
  %218 = zext i1 %217 to i64
  %pgocount18 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 39)
  %219 = add i64 %pgocount18, %218
  store i64 %219, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 39)
  %220 = select i1 %217, i32 32767, i32 -32768
  %221 = sext i32 %220 to i64
  br label %225

; <label>:222:                                    ; preds = %203
  %pgocount19 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 6)
  %223 = add i64 %pgocount19, 1
  store i64 %223, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 6)
  %224 = load i64, i64* %6, align 8
  br label %225

; <label>:225:                                    ; preds = %222, %215
  %226 = phi i64 [ %221, %215 ], [ %224, %222 ]
  %227 = shl i64 %226, 10
  %228 = trunc i64 %227 to i16
  store i16 %228, i16* %5, align 2
  %229 = load i16, i16* %5, align 2
  %230 = sext i16 %229 to i64
  %231 = sub nsw i64 %230, -5120
  store i64 %231, i64* %6, align 8
  %232 = icmp sge i64 %231, 32767
  br i1 %232, label %233, label %234

; <label>:233:                                    ; preds = %225
  br label %244

; <label>:234:                                    ; preds = %225
  %235 = load i64, i64* %6, align 8
  %236 = icmp sle i64 %235, -32768
  br i1 %236, label %237, label %239

; <label>:237:                                    ; preds = %234
  %pgocount20 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 23)
  %238 = add i64 %pgocount20, 1
  store i64 %238, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 23)
  br label %242

; <label>:239:                                    ; preds = %234
  %pgocount21 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 24)
  %240 = add i64 %pgocount21, 1
  store i64 %240, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 24)
  %241 = load i64, i64* %6, align 8
  br label %242

; <label>:242:                                    ; preds = %239, %237
  %243 = phi i64 [ -32768, %237 ], [ %241, %239 ]
  br label %244

; <label>:244:                                    ; preds = %242, %233
  %245 = phi i64 [ 32767, %233 ], [ %243, %242 ]
  %246 = trunc i64 %245 to i16
  store i16 %246, i16* %5, align 2
  %247 = load i16, i16* %5, align 2
  %248 = sext i16 %247 to i64
  %249 = mul nsw i64 13107, %248
  %250 = add nsw i64 %249, 16384
  %251 = ashr i64 %250, 15
  %252 = trunc i64 %251 to i16
  store i16 %252, i16* %5, align 2
  %253 = load i16, i16* %5, align 2
  %254 = sext i16 %253 to i64
  %255 = load i16, i16* %5, align 2
  %256 = sext i16 %255 to i64
  %257 = add nsw i64 %254, %256
  store i64 %257, i64* %6, align 8
  %258 = sub nsw i64 %257, -32768
  %259 = icmp ugt i64 %258, 65535
  br i1 %259, label %260, label %267

; <label>:260:                                    ; preds = %244
  %261 = load i64, i64* %6, align 8
  %262 = icmp sgt i64 %261, 0
  %263 = zext i1 %262 to i64
  %pgocount22 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 40)
  %264 = add i64 %pgocount22, %263
  store i64 %264, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 40)
  %265 = select i1 %262, i32 32767, i32 -32768
  %266 = sext i32 %265 to i64
  br label %270

; <label>:267:                                    ; preds = %244
  %pgocount23 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 7)
  %268 = add i64 %pgocount23, 1
  store i64 %268, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 7)
  %269 = load i64, i64* %6, align 8
  br label %270

; <label>:270:                                    ; preds = %267, %260
  %271 = phi i64 [ %266, %260 ], [ %269, %267 ]
  %272 = trunc i64 %271 to i16
  %273 = load i16*, i16** %4, align 8
  %274 = getelementptr inbounds i16, i16* %273, i32 1
  store i16* %274, i16** %4, align 8
  store i16 %272, i16* %273, align 2
  %275 = load i16*, i16** %3, align 8
  %276 = getelementptr inbounds i16, i16* %275, i32 1
  store i16* %276, i16** %3, align 8
  %277 = load i16, i16* %275, align 2
  %278 = sext i16 %277 to i64
  %279 = add nsw i64 %278, -8
  store i64 %279, i64* %6, align 8
  %280 = sub nsw i64 %279, -32768
  %281 = icmp ugt i64 %280, 65535
  br i1 %281, label %282, label %289

; <label>:282:                                    ; preds = %270
  %283 = load i64, i64* %6, align 8
  %284 = icmp sgt i64 %283, 0
  %285 = zext i1 %284 to i64
  %pgocount24 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 41)
  %286 = add i64 %pgocount24, %285
  store i64 %286, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 41)
  %287 = select i1 %284, i32 32767, i32 -32768
  %288 = sext i32 %287 to i64
  br label %292

; <label>:289:                                    ; preds = %270
  %pgocount25 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 8)
  %290 = add i64 %pgocount25, 1
  store i64 %290, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 8)
  %291 = load i64, i64* %6, align 8
  br label %292

; <label>:292:                                    ; preds = %289, %282
  %293 = phi i64 [ %288, %282 ], [ %291, %289 ]
  %294 = shl i64 %293, 10
  %295 = trunc i64 %294 to i16
  store i16 %295, i16* %5, align 2
  %296 = load i16, i16* %5, align 2
  %297 = sext i16 %296 to i64
  %298 = sub nsw i64 %297, 188
  store i64 %298, i64* %6, align 8
  %299 = icmp sge i64 %298, 32767
  br i1 %299, label %300, label %301

; <label>:300:                                    ; preds = %292
  br label %311

; <label>:301:                                    ; preds = %292
  %302 = load i64, i64* %6, align 8
  %303 = icmp sle i64 %302, -32768
  br i1 %303, label %304, label %306

; <label>:304:                                    ; preds = %301
  %pgocount26 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 25)
  %305 = add i64 %pgocount26, 1
  store i64 %305, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 25)
  br label %309

; <label>:306:                                    ; preds = %301
  %pgocount27 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 26)
  %307 = add i64 %pgocount27, 1
  store i64 %307, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 26)
  %308 = load i64, i64* %6, align 8
  br label %309

; <label>:309:                                    ; preds = %306, %304
  %310 = phi i64 [ -32768, %304 ], [ %308, %306 ]
  br label %311

; <label>:311:                                    ; preds = %309, %300
  %312 = phi i64 [ 32767, %300 ], [ %310, %309 ]
  %313 = trunc i64 %312 to i16
  store i16 %313, i16* %5, align 2
  %314 = load i16, i16* %5, align 2
  %315 = sext i16 %314 to i64
  %316 = mul nsw i64 19223, %315
  %317 = add nsw i64 %316, 16384
  %318 = ashr i64 %317, 15
  %319 = trunc i64 %318 to i16
  store i16 %319, i16* %5, align 2
  %320 = load i16, i16* %5, align 2
  %321 = sext i16 %320 to i64
  %322 = load i16, i16* %5, align 2
  %323 = sext i16 %322 to i64
  %324 = add nsw i64 %321, %323
  store i64 %324, i64* %6, align 8
  %325 = sub nsw i64 %324, -32768
  %326 = icmp ugt i64 %325, 65535
  br i1 %326, label %327, label %334

; <label>:327:                                    ; preds = %311
  %328 = load i64, i64* %6, align 8
  %329 = icmp sgt i64 %328, 0
  %330 = zext i1 %329 to i64
  %pgocount28 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 42)
  %331 = add i64 %pgocount28, %330
  store i64 %331, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 42)
  %332 = select i1 %329, i32 32767, i32 -32768
  %333 = sext i32 %332 to i64
  br label %337

; <label>:334:                                    ; preds = %311
  %pgocount29 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 9)
  %335 = add i64 %pgocount29, 1
  store i64 %335, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 9)
  %336 = load i64, i64* %6, align 8
  br label %337

; <label>:337:                                    ; preds = %334, %327
  %338 = phi i64 [ %333, %327 ], [ %336, %334 ]
  %339 = trunc i64 %338 to i16
  %340 = load i16*, i16** %4, align 8
  %341 = getelementptr inbounds i16, i16* %340, i32 1
  store i16* %341, i16** %4, align 8
  store i16 %339, i16* %340, align 2
  %342 = load i16*, i16** %3, align 8
  %343 = getelementptr inbounds i16, i16* %342, i32 1
  store i16* %343, i16** %3, align 8
  %344 = load i16, i16* %342, align 2
  %345 = sext i16 %344 to i64
  %346 = add nsw i64 %345, -8
  store i64 %346, i64* %6, align 8
  %347 = sub nsw i64 %346, -32768
  %348 = icmp ugt i64 %347, 65535
  br i1 %348, label %349, label %356

; <label>:349:                                    ; preds = %337
  %350 = load i64, i64* %6, align 8
  %351 = icmp sgt i64 %350, 0
  %352 = zext i1 %351 to i64
  %pgocount30 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 43)
  %353 = add i64 %pgocount30, %352
  store i64 %353, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 43)
  %354 = select i1 %351, i32 32767, i32 -32768
  %355 = sext i32 %354 to i64
  br label %359

; <label>:356:                                    ; preds = %337
  %pgocount31 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 10)
  %357 = add i64 %pgocount31, 1
  store i64 %357, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 10)
  %358 = load i64, i64* %6, align 8
  br label %359

; <label>:359:                                    ; preds = %356, %349
  %360 = phi i64 [ %355, %349 ], [ %358, %356 ]
  %361 = shl i64 %360, 10
  %362 = trunc i64 %361 to i16
  store i16 %362, i16* %5, align 2
  %363 = load i16, i16* %5, align 2
  %364 = sext i16 %363 to i64
  %365 = sub nsw i64 %364, -3584
  store i64 %365, i64* %6, align 8
  %366 = icmp sge i64 %365, 32767
  br i1 %366, label %367, label %368

; <label>:367:                                    ; preds = %359
  br label %378

; <label>:368:                                    ; preds = %359
  %369 = load i64, i64* %6, align 8
  %370 = icmp sle i64 %369, -32768
  br i1 %370, label %371, label %373

; <label>:371:                                    ; preds = %368
  %pgocount32 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 27)
  %372 = add i64 %pgocount32, 1
  store i64 %372, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 27)
  br label %376

; <label>:373:                                    ; preds = %368
  %pgocount33 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 28)
  %374 = add i64 %pgocount33, 1
  store i64 %374, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 28)
  %375 = load i64, i64* %6, align 8
  br label %376

; <label>:376:                                    ; preds = %373, %371
  %377 = phi i64 [ -32768, %371 ], [ %375, %373 ]
  br label %378

; <label>:378:                                    ; preds = %376, %367
  %379 = phi i64 [ 32767, %367 ], [ %377, %376 ]
  %380 = trunc i64 %379 to i16
  store i16 %380, i16* %5, align 2
  %381 = load i16, i16* %5, align 2
  %382 = sext i16 %381 to i64
  %383 = mul nsw i64 17476, %382
  %384 = add nsw i64 %383, 16384
  %385 = ashr i64 %384, 15
  %386 = trunc i64 %385 to i16
  store i16 %386, i16* %5, align 2
  %387 = load i16, i16* %5, align 2
  %388 = sext i16 %387 to i64
  %389 = load i16, i16* %5, align 2
  %390 = sext i16 %389 to i64
  %391 = add nsw i64 %388, %390
  store i64 %391, i64* %6, align 8
  %392 = sub nsw i64 %391, -32768
  %393 = icmp ugt i64 %392, 65535
  br i1 %393, label %394, label %401

; <label>:394:                                    ; preds = %378
  %395 = load i64, i64* %6, align 8
  %396 = icmp sgt i64 %395, 0
  %397 = zext i1 %396 to i64
  %pgocount34 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 44)
  %398 = add i64 %pgocount34, %397
  store i64 %398, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 44)
  %399 = select i1 %396, i32 32767, i32 -32768
  %400 = sext i32 %399 to i64
  br label %404

; <label>:401:                                    ; preds = %378
  %pgocount35 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 11)
  %402 = add i64 %pgocount35, 1
  store i64 %402, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 11)
  %403 = load i64, i64* %6, align 8
  br label %404

; <label>:404:                                    ; preds = %401, %394
  %405 = phi i64 [ %400, %394 ], [ %403, %401 ]
  %406 = trunc i64 %405 to i16
  %407 = load i16*, i16** %4, align 8
  %408 = getelementptr inbounds i16, i16* %407, i32 1
  store i16* %408, i16** %4, align 8
  store i16 %406, i16* %407, align 2
  %409 = load i16*, i16** %3, align 8
  %410 = getelementptr inbounds i16, i16* %409, i32 1
  store i16* %410, i16** %3, align 8
  %411 = load i16, i16* %409, align 2
  %412 = sext i16 %411 to i64
  %413 = add nsw i64 %412, -4
  store i64 %413, i64* %6, align 8
  %414 = sub nsw i64 %413, -32768
  %415 = icmp ugt i64 %414, 65535
  br i1 %415, label %416, label %423

; <label>:416:                                    ; preds = %404
  %417 = load i64, i64* %6, align 8
  %418 = icmp sgt i64 %417, 0
  %419 = zext i1 %418 to i64
  %pgocount36 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 45)
  %420 = add i64 %pgocount36, %419
  store i64 %420, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 45)
  %421 = select i1 %418, i32 32767, i32 -32768
  %422 = sext i32 %421 to i64
  br label %426

; <label>:423:                                    ; preds = %404
  %pgocount37 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 12)
  %424 = add i64 %pgocount37, 1
  store i64 %424, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 12)
  %425 = load i64, i64* %6, align 8
  br label %426

; <label>:426:                                    ; preds = %423, %416
  %427 = phi i64 [ %422, %416 ], [ %425, %423 ]
  %428 = shl i64 %427, 10
  %429 = trunc i64 %428 to i16
  store i16 %429, i16* %5, align 2
  %430 = load i16, i16* %5, align 2
  %431 = sext i16 %430 to i64
  %432 = sub nsw i64 %431, -682
  store i64 %432, i64* %6, align 8
  %433 = icmp sge i64 %432, 32767
  br i1 %433, label %434, label %435

; <label>:434:                                    ; preds = %426
  br label %445

; <label>:435:                                    ; preds = %426
  %436 = load i64, i64* %6, align 8
  %437 = icmp sle i64 %436, -32768
  br i1 %437, label %438, label %440

; <label>:438:                                    ; preds = %435
  %pgocount38 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 29)
  %439 = add i64 %pgocount38, 1
  store i64 %439, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 29)
  br label %443

; <label>:440:                                    ; preds = %435
  %pgocount39 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 30)
  %441 = add i64 %pgocount39, 1
  store i64 %441, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 30)
  %442 = load i64, i64* %6, align 8
  br label %443

; <label>:443:                                    ; preds = %440, %438
  %444 = phi i64 [ -32768, %438 ], [ %442, %440 ]
  br label %445

; <label>:445:                                    ; preds = %443, %434
  %446 = phi i64 [ 32767, %434 ], [ %444, %443 ]
  %447 = trunc i64 %446 to i16
  store i16 %447, i16* %5, align 2
  %448 = load i16, i16* %5, align 2
  %449 = sext i16 %448 to i64
  %450 = mul nsw i64 31454, %449
  %451 = add nsw i64 %450, 16384
  %452 = ashr i64 %451, 15
  %453 = trunc i64 %452 to i16
  store i16 %453, i16* %5, align 2
  %454 = load i16, i16* %5, align 2
  %455 = sext i16 %454 to i64
  %456 = load i16, i16* %5, align 2
  %457 = sext i16 %456 to i64
  %458 = add nsw i64 %455, %457
  store i64 %458, i64* %6, align 8
  %459 = sub nsw i64 %458, -32768
  %460 = icmp ugt i64 %459, 65535
  br i1 %460, label %461, label %468

; <label>:461:                                    ; preds = %445
  %462 = load i64, i64* %6, align 8
  %463 = icmp sgt i64 %462, 0
  %464 = zext i1 %463 to i64
  %pgocount40 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 46)
  %465 = add i64 %pgocount40, %464
  store i64 %465, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 46)
  %466 = select i1 %463, i32 32767, i32 -32768
  %467 = sext i32 %466 to i64
  br label %471

; <label>:468:                                    ; preds = %445
  %pgocount41 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 13)
  %469 = add i64 %pgocount41, 1
  store i64 %469, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 13)
  %470 = load i64, i64* %6, align 8
  br label %471

; <label>:471:                                    ; preds = %468, %461
  %472 = phi i64 [ %467, %461 ], [ %470, %468 ]
  %473 = trunc i64 %472 to i16
  %474 = load i16*, i16** %4, align 8
  %475 = getelementptr inbounds i16, i16* %474, i32 1
  store i16* %475, i16** %4, align 8
  store i16 %473, i16* %474, align 2
  %476 = load i16*, i16** %3, align 8
  %477 = getelementptr inbounds i16, i16* %476, i32 1
  store i16* %477, i16** %3, align 8
  %478 = load i16, i16* %476, align 2
  %479 = sext i16 %478 to i64
  %480 = add nsw i64 %479, -4
  store i64 %480, i64* %6, align 8
  %481 = sub nsw i64 %480, -32768
  %482 = icmp ugt i64 %481, 65535
  br i1 %482, label %483, label %490

; <label>:483:                                    ; preds = %471
  %484 = load i64, i64* %6, align 8
  %485 = icmp sgt i64 %484, 0
  %486 = zext i1 %485 to i64
  %pgocount42 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 47)
  %487 = add i64 %pgocount42, %486
  store i64 %487, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 47)
  %488 = select i1 %485, i32 32767, i32 -32768
  %489 = sext i32 %488 to i64
  br label %493

; <label>:490:                                    ; preds = %471
  %pgocount43 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 14)
  %491 = add i64 %pgocount43, 1
  store i64 %491, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 14)
  %492 = load i64, i64* %6, align 8
  br label %493

; <label>:493:                                    ; preds = %490, %483
  %494 = phi i64 [ %489, %483 ], [ %492, %490 ]
  %495 = shl i64 %494, 10
  %496 = trunc i64 %495 to i16
  store i16 %496, i16* %5, align 2
  %497 = load i16, i16* %5, align 2
  %498 = sext i16 %497 to i64
  %499 = sub nsw i64 %498, -2288
  store i64 %499, i64* %6, align 8
  %500 = icmp sge i64 %499, 32767
  br i1 %500, label %501, label %502

; <label>:501:                                    ; preds = %493
  br label %512

; <label>:502:                                    ; preds = %493
  %503 = load i64, i64* %6, align 8
  %504 = icmp sle i64 %503, -32768
  br i1 %504, label %505, label %507

; <label>:505:                                    ; preds = %502
  %pgocount44 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 31)
  %506 = add i64 %pgocount44, 1
  store i64 %506, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 31)
  br label %510

; <label>:507:                                    ; preds = %502
  %pgocount45 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 32)
  %508 = add i64 %pgocount45, 1
  store i64 %508, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 32)
  %509 = load i64, i64* %6, align 8
  br label %510

; <label>:510:                                    ; preds = %507, %505
  %511 = phi i64 [ -32768, %505 ], [ %509, %507 ]
  br label %512

; <label>:512:                                    ; preds = %510, %501
  %513 = phi i64 [ 32767, %501 ], [ %511, %510 ]
  %514 = trunc i64 %513 to i16
  store i16 %514, i16* %5, align 2
  %515 = load i16, i16* %5, align 2
  %516 = sext i16 %515 to i64
  %517 = mul nsw i64 29708, %516
  %518 = add nsw i64 %517, 16384
  %519 = ashr i64 %518, 15
  %520 = trunc i64 %519 to i16
  store i16 %520, i16* %5, align 2
  %521 = load i16, i16* %5, align 2
  %522 = sext i16 %521 to i64
  %523 = load i16, i16* %5, align 2
  %524 = sext i16 %523 to i64
  %525 = add nsw i64 %522, %524
  store i64 %525, i64* %6, align 8
  %526 = sub nsw i64 %525, -32768
  %527 = icmp ugt i64 %526, 65535
  br i1 %527, label %528, label %536

; <label>:528:                                    ; preds = %512
  %pgocount46 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 15)
  %529 = add i64 %pgocount46, 1
  store i64 %529, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 15)
  %530 = load i64, i64* %6, align 8
  %531 = icmp sgt i64 %530, 0
  %532 = zext i1 %531 to i64
  %pgocount47 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 48)
  %533 = add i64 %pgocount47, %532
  store i64 %533, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 48)
  %534 = select i1 %531, i32 32767, i32 -32768
  %535 = sext i32 %534 to i64
  br label %539

; <label>:536:                                    ; preds = %512
  %pgocount48 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 16)
  %537 = add i64 %pgocount48, 1
  store i64 %537, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_tmp1.ll_Decoding_of_the_coded_Log_Area_Ratios, i64 0, i64 16)
  %538 = load i64, i64* %6, align 8
  br label %539

; <label>:539:                                    ; preds = %536, %528
  %540 = phi i64 [ %535, %528 ], [ %538, %536 ]
  %541 = trunc i64 %540 to i16
  %542 = load i16*, i16** %4, align 8
  %543 = getelementptr inbounds i16, i16* %542, i32 1
  store i16* %543, i16** %4, align 8
  store i16 %541, i16* %542, align 2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Coefficients_0_12(i16*, i16*, i16*) #0 {
  %4 = alloca i16*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  store i16* %0, i16** %4, align 8
  store i16* %1, i16** %5, align 8
  store i16* %2, i16** %6, align 8
  store i32 1, i32* %7, align 4
  br label %9

; <label>:9:                                      ; preds = %66, %3
  %10 = load i32, i32* %7, align 4
  %11 = icmp sle i32 %10, 8
  br i1 %11, label %12, label %75

; <label>:12:                                     ; preds = %9
  %13 = load i16*, i16** %4, align 8
  %14 = load i16, i16* %13, align 2
  %15 = sext i16 %14 to i32
  %16 = ashr i32 %15, 2
  %17 = sext i32 %16 to i64
  %18 = load i16*, i16** %5, align 8
  %19 = load i16, i16* %18, align 2
  %20 = sext i16 %19 to i32
  %21 = ashr i32 %20, 2
  %22 = sext i32 %21 to i64
  %23 = add nsw i64 %17, %22
  store i64 %23, i64* %8, align 8
  %24 = sub nsw i64 %23, -32768
  %25 = icmp ugt i64 %24, 65535
  br i1 %25, label %26, label %33

; <label>:26:                                     ; preds = %12
  %27 = load i64, i64* %8, align 8
  %28 = icmp sgt i64 %27, 0
  %29 = zext i1 %28 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_0_12, i64 0, i64 4)
  %30 = add i64 %pgocount, %29
  store i64 %30, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_0_12, i64 0, i64 4)
  %31 = select i1 %28, i32 32767, i32 -32768
  %32 = sext i32 %31 to i64
  br label %36

; <label>:33:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_0_12, i64 0, i64 0)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_0_12, i64 0, i64 0)
  %35 = load i64, i64* %8, align 8
  br label %36

; <label>:36:                                     ; preds = %33, %26
  %37 = phi i64 [ %32, %26 ], [ %35, %33 ]
  %38 = trunc i64 %37 to i16
  %39 = load i16*, i16** %6, align 8
  store i16 %38, i16* %39, align 2
  %40 = load i16*, i16** %6, align 8
  %41 = load i16, i16* %40, align 2
  %42 = sext i16 %41 to i64
  %43 = load i16*, i16** %4, align 8
  %44 = load i16, i16* %43, align 2
  %45 = sext i16 %44 to i32
  %46 = ashr i32 %45, 1
  %47 = sext i32 %46 to i64
  %48 = add nsw i64 %42, %47
  store i64 %48, i64* %8, align 8
  %49 = sub nsw i64 %48, -32768
  %50 = icmp ugt i64 %49, 65535
  br i1 %50, label %51, label %59

; <label>:51:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_0_12, i64 0, i64 1)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_0_12, i64 0, i64 1)
  %53 = load i64, i64* %8, align 8
  %54 = icmp sgt i64 %53, 0
  %55 = zext i1 %54 to i64
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_0_12, i64 0, i64 5)
  %56 = add i64 %pgocount3, %55
  store i64 %56, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_0_12, i64 0, i64 5)
  %57 = select i1 %54, i32 32767, i32 -32768
  %58 = sext i32 %57 to i64
  br label %62

; <label>:59:                                     ; preds = %36
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_0_12, i64 0, i64 2)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_0_12, i64 0, i64 2)
  %61 = load i64, i64* %8, align 8
  br label %62

; <label>:62:                                     ; preds = %59, %51
  %63 = phi i64 [ %58, %51 ], [ %61, %59 ]
  %64 = trunc i64 %63 to i16
  %65 = load i16*, i16** %6, align 8
  store i16 %64, i16* %65, align 2
  br label %66

; <label>:66:                                     ; preds = %62
  %67 = load i32, i32* %7, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %7, align 4
  %69 = load i16*, i16** %6, align 8
  %70 = getelementptr inbounds i16, i16* %69, i32 1
  store i16* %70, i16** %6, align 8
  %71 = load i16*, i16** %4, align 8
  %72 = getelementptr inbounds i16, i16* %71, i32 1
  store i16* %72, i16** %4, align 8
  %73 = load i16*, i16** %5, align 8
  %74 = getelementptr inbounds i16, i16* %73, i32 1
  store i16* %74, i16** %5, align 8
  br label %9

; <label>:75:                                     ; preds = %9
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_0_12, i64 0, i64 3)
  %76 = add i64 %pgocount5, 1
  store i64 %76, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_0_12, i64 0, i64 3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @LARp_to_rp(i16*) #0 {
  %2 = alloca i16*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i16, align 2
  %5 = alloca i64, align 8
  store i16* %0, i16** %2, align 8
  store i32 1, i32* %3, align 4
  br label %6

; <label>:6:                                      ; preds = %126, %1
  %7 = load i32, i32* %3, align 4
  %8 = icmp sle i32 %7, 8
  br i1 %8, label %9, label %131

; <label>:9:                                      ; preds = %6
  %10 = load i16*, i16** %2, align 8
  %11 = load i16, i16* %10, align 2
  %12 = sext i16 %11 to i32
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %14, label %76

; <label>:14:                                     ; preds = %9
  %15 = load i16*, i16** %2, align 8
  %16 = load i16, i16* %15, align 2
  %17 = sext i16 %16 to i32
  %18 = icmp eq i32 %17, -32768
  br i1 %18, label %19, label %20

; <label>:19:                                     ; preds = %14
  br label %26

; <label>:20:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 1)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 1)
  %22 = load i16*, i16** %2, align 8
  %23 = load i16, i16* %22, align 2
  %24 = sext i16 %23 to i32
  %25 = sub nsw i32 0, %24
  br label %26

; <label>:26:                                     ; preds = %20, %19
  %27 = phi i32 [ 32767, %19 ], [ %25, %20 ]
  %28 = trunc i32 %27 to i16
  store i16 %28, i16* %4, align 2
  %29 = load i16, i16* %4, align 2
  %30 = sext i16 %29 to i32
  %31 = icmp slt i32 %30, 11059
  br i1 %31, label %32, label %38

; <label>:32:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 2)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 2)
  %34 = load i16, i16* %4, align 2
  %35 = sext i16 %34 to i32
  %36 = shl i32 %35, 1
  %37 = sext i32 %36 to i64
  br label %71

; <label>:38:                                     ; preds = %26
  %39 = load i16, i16* %4, align 2
  %40 = sext i16 %39 to i32
  %41 = icmp slt i32 %40, 20070
  br i1 %41, label %42, label %48

; <label>:42:                                     ; preds = %38
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 4)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 4)
  %44 = load i16, i16* %4, align 2
  %45 = sext i16 %44 to i32
  %46 = add nsw i32 %45, 11059
  %47 = sext i32 %46 to i64
  br label %69

; <label>:48:                                     ; preds = %38
  %49 = load i16, i16* %4, align 2
  %50 = sext i16 %49 to i32
  %51 = ashr i32 %50, 2
  %52 = sext i32 %51 to i64
  %53 = add nsw i64 %52, 26112
  store i64 %53, i64* %5, align 8
  %54 = sub nsw i64 %53, -32768
  %55 = icmp ugt i64 %54, 65535
  br i1 %55, label %56, label %64

; <label>:56:                                     ; preds = %48
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 7)
  %57 = add i64 %pgocount3, 1
  store i64 %57, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 7)
  %58 = load i64, i64* %5, align 8
  %59 = icmp sgt i64 %58, 0
  %60 = zext i1 %59 to i64
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 10)
  %61 = add i64 %pgocount4, %60
  store i64 %61, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 10)
  %62 = select i1 %59, i32 32767, i32 -32768
  %63 = sext i32 %62 to i64
  br label %67

; <label>:64:                                     ; preds = %48
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 8)
  %65 = add i64 %pgocount5, 1
  store i64 %65, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 8)
  %66 = load i64, i64* %5, align 8
  br label %67

; <label>:67:                                     ; preds = %64, %56
  %68 = phi i64 [ %63, %56 ], [ %66, %64 ]
  br label %69

; <label>:69:                                     ; preds = %67, %42
  %70 = phi i64 [ %47, %42 ], [ %68, %67 ]
  br label %71

; <label>:71:                                     ; preds = %69, %32
  %72 = phi i64 [ %37, %32 ], [ %70, %69 ]
  %73 = sub nsw i64 0, %72
  %74 = trunc i64 %73 to i16
  %75 = load i16*, i16** %2, align 8
  store i16 %74, i16* %75, align 2
  br label %125

; <label>:76:                                     ; preds = %9
  %77 = load i16*, i16** %2, align 8
  %78 = load i16, i16* %77, align 2
  store i16 %78, i16* %4, align 2
  %79 = load i16, i16* %4, align 2
  %80 = sext i16 %79 to i32
  %81 = icmp slt i32 %80, 11059
  br i1 %81, label %82, label %88

; <label>:82:                                     ; preds = %76
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 0)
  %83 = add i64 %pgocount6, 1
  store i64 %83, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 0)
  %84 = load i16, i16* %4, align 2
  %85 = sext i16 %84 to i32
  %86 = shl i32 %85, 1
  %87 = sext i32 %86 to i64
  br label %121

; <label>:88:                                     ; preds = %76
  %89 = load i16, i16* %4, align 2
  %90 = sext i16 %89 to i32
  %91 = icmp slt i32 %90, 20070
  br i1 %91, label %92, label %98

; <label>:92:                                     ; preds = %88
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 3)
  %93 = add i64 %pgocount7, 1
  store i64 %93, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 3)
  %94 = load i16, i16* %4, align 2
  %95 = sext i16 %94 to i32
  %96 = add nsw i32 %95, 11059
  %97 = sext i32 %96 to i64
  br label %119

; <label>:98:                                     ; preds = %88
  %99 = load i16, i16* %4, align 2
  %100 = sext i16 %99 to i32
  %101 = ashr i32 %100, 2
  %102 = sext i32 %101 to i64
  %103 = add nsw i64 %102, 26112
  store i64 %103, i64* %5, align 8
  %104 = sub nsw i64 %103, -32768
  %105 = icmp ugt i64 %104, 65535
  br i1 %105, label %106, label %114

; <label>:106:                                    ; preds = %98
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 5)
  %107 = add i64 %pgocount8, 1
  store i64 %107, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 5)
  %108 = load i64, i64* %5, align 8
  %109 = icmp sgt i64 %108, 0
  %110 = zext i1 %109 to i64
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 11)
  %111 = add i64 %pgocount9, %110
  store i64 %111, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 11)
  %112 = select i1 %109, i32 32767, i32 -32768
  %113 = sext i32 %112 to i64
  br label %117

; <label>:114:                                    ; preds = %98
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 6)
  %115 = add i64 %pgocount10, 1
  store i64 %115, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 6)
  %116 = load i64, i64* %5, align 8
  br label %117

; <label>:117:                                    ; preds = %114, %106
  %118 = phi i64 [ %113, %106 ], [ %116, %114 ]
  br label %119

; <label>:119:                                    ; preds = %117, %92
  %120 = phi i64 [ %97, %92 ], [ %118, %117 ]
  br label %121

; <label>:121:                                    ; preds = %119, %82
  %122 = phi i64 [ %87, %82 ], [ %120, %119 ]
  %123 = trunc i64 %122 to i16
  %124 = load i16*, i16** %2, align 8
  store i16 %123, i16* %124, align 2
  br label %125

; <label>:125:                                    ; preds = %121, %71
  br label %126

; <label>:126:                                    ; preds = %125
  %127 = load i32, i32* %3, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, i32* %3, align 4
  %129 = load i16*, i16** %2, align 8
  %130 = getelementptr inbounds i16, i16* %129, i32 1
  store i16* %130, i16** %2, align 8
  br label %6

; <label>:131:                                    ; preds = %6
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 9)
  %132 = add i64 %pgocount11, 1
  store i64 %132, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_LARp_to_rp, i64 0, i64 9)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Short_term_analysis_filtering(%struct.gsm_state*, i16*, i32, i16*) #0 {
  %5 = alloca %struct.gsm_state*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i16, align 2
  %12 = alloca i16, align 2
  %13 = alloca i16, align 2
  %14 = alloca i16, align 2
  %15 = alloca i16, align 2
  %16 = alloca i64, align 8
  store %struct.gsm_state* %0, %struct.gsm_state** %5, align 8
  store i16* %1, i16** %6, align 8
  store i32 %2, i32* %7, align 4
  store i16* %3, i16** %8, align 8
  %17 = load %struct.gsm_state*, %struct.gsm_state** %5, align 8
  %18 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %17, i32 0, i32 4
  %19 = getelementptr inbounds [8 x i16], [8 x i16]* %18, i32 0, i32 0
  store i16* %19, i16** %9, align 8
  br label %20

; <label>:20:                                     ; preds = %109, %4
  %21 = load i32, i32* %7, align 4
  %22 = add nsw i32 %21, -1
  store i32 %22, i32* %7, align 4
  %23 = icmp ne i32 %21, 0
  br i1 %23, label %24, label %113

; <label>:24:                                     ; preds = %20
  %25 = load i16*, i16** %8, align 8
  %26 = load i16, i16* %25, align 2
  store i16 %26, i16* %14, align 2
  store i16 %26, i16* %11, align 2
  store i32 0, i32* %10, align 4
  br label %27

; <label>:27:                                     ; preds = %103, %24
  %28 = load i32, i32* %10, align 4
  %29 = icmp slt i32 %28, 8
  br i1 %29, label %30, label %106

; <label>:30:                                     ; preds = %27
  %31 = load i16*, i16** %9, align 8
  %32 = load i32, i32* %10, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i16, i16* %31, i64 %33
  %35 = load i16, i16* %34, align 2
  store i16 %35, i16* %13, align 2
  %36 = load i16*, i16** %6, align 8
  %37 = load i32, i32* %10, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i16, i16* %36, i64 %38
  %40 = load i16, i16* %39, align 2
  store i16 %40, i16* %15, align 2
  %41 = load i16, i16* %14, align 2
  %42 = load i16*, i16** %9, align 8
  %43 = load i32, i32* %10, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i16, i16* %42, i64 %44
  store i16 %41, i16* %45, align 2
  %46 = load i16, i16* %15, align 2
  %47 = sext i16 %46 to i64
  %48 = load i16, i16* %11, align 2
  %49 = sext i16 %48 to i64
  %50 = mul nsw i64 %47, %49
  %51 = add nsw i64 %50, 16384
  %52 = ashr i64 %51, 15
  %53 = trunc i64 %52 to i16
  store i16 %53, i16* %12, align 2
  %54 = load i16, i16* %13, align 2
  %55 = sext i16 %54 to i64
  %56 = load i16, i16* %12, align 2
  %57 = sext i16 %56 to i64
  %58 = add nsw i64 %55, %57
  store i64 %58, i64* %16, align 8
  %59 = sub nsw i64 %58, -32768
  %60 = icmp ugt i64 %59, 65535
  br i1 %60, label %61, label %68

; <label>:61:                                     ; preds = %30
  %62 = load i64, i64* %16, align 8
  %63 = icmp sgt i64 %62, 0
  %64 = zext i1 %63 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_Short_term_analysis_filtering, i64 0, i64 5)
  %65 = add i64 %pgocount, %64
  store i64 %65, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_Short_term_analysis_filtering, i64 0, i64 5)
  %66 = select i1 %63, i32 32767, i32 -32768
  %67 = sext i32 %66 to i64
  br label %71

; <label>:68:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_Short_term_analysis_filtering, i64 0, i64 0)
  %69 = add i64 %pgocount1, 1
  store i64 %69, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_Short_term_analysis_filtering, i64 0, i64 0)
  %70 = load i64, i64* %16, align 8
  br label %71

; <label>:71:                                     ; preds = %68, %61
  %72 = phi i64 [ %67, %61 ], [ %70, %68 ]
  %73 = trunc i64 %72 to i16
  store i16 %73, i16* %14, align 2
  %74 = load i16, i16* %15, align 2
  %75 = sext i16 %74 to i64
  %76 = load i16, i16* %13, align 2
  %77 = sext i16 %76 to i64
  %78 = mul nsw i64 %75, %77
  %79 = add nsw i64 %78, 16384
  %80 = ashr i64 %79, 15
  %81 = trunc i64 %80 to i16
  store i16 %81, i16* %12, align 2
  %82 = load i16, i16* %11, align 2
  %83 = sext i16 %82 to i64
  %84 = load i16, i16* %12, align 2
  %85 = sext i16 %84 to i64
  %86 = add nsw i64 %83, %85
  store i64 %86, i64* %16, align 8
  %87 = sub nsw i64 %86, -32768
  %88 = icmp ugt i64 %87, 65535
  br i1 %88, label %89, label %97

; <label>:89:                                     ; preds = %71
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_Short_term_analysis_filtering, i64 0, i64 1)
  %90 = add i64 %pgocount2, 1
  store i64 %90, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_Short_term_analysis_filtering, i64 0, i64 1)
  %91 = load i64, i64* %16, align 8
  %92 = icmp sgt i64 %91, 0
  %93 = zext i1 %92 to i64
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_Short_term_analysis_filtering, i64 0, i64 6)
  %94 = add i64 %pgocount3, %93
  store i64 %94, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_Short_term_analysis_filtering, i64 0, i64 6)
  %95 = select i1 %92, i32 32767, i32 -32768
  %96 = sext i32 %95 to i64
  br label %100

; <label>:97:                                     ; preds = %71
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_Short_term_analysis_filtering, i64 0, i64 2)
  %98 = add i64 %pgocount4, 1
  store i64 %98, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_Short_term_analysis_filtering, i64 0, i64 2)
  %99 = load i64, i64* %16, align 8
  br label %100

; <label>:100:                                    ; preds = %97, %89
  %101 = phi i64 [ %96, %89 ], [ %99, %97 ]
  %102 = trunc i64 %101 to i16
  store i16 %102, i16* %11, align 2
  br label %103

; <label>:103:                                    ; preds = %100
  %104 = load i32, i32* %10, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %10, align 4
  br label %27

; <label>:106:                                    ; preds = %27
  %107 = load i16, i16* %11, align 2
  %108 = load i16*, i16** %8, align 8
  store i16 %107, i16* %108, align 2
  br label %109

; <label>:109:                                    ; preds = %106
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_Short_term_analysis_filtering, i64 0, i64 3)
  %110 = add i64 %pgocount5, 1
  store i64 %110, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_Short_term_analysis_filtering, i64 0, i64 3)
  %111 = load i16*, i16** %8, align 8
  %112 = getelementptr inbounds i16, i16* %111, i32 1
  store i16* %112, i16** %8, align 8
  br label %20

; <label>:113:                                    ; preds = %20
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_Short_term_analysis_filtering, i64 0, i64 4)
  %114 = add i64 %pgocount6, 1
  store i64 %114, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_Short_term_analysis_filtering, i64 0, i64 4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Coefficients_13_26(i16*, i16*, i16*) #0 {
  %4 = alloca i16*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  store i16* %0, i16** %4, align 8
  store i16* %1, i16** %5, align 8
  store i16* %2, i16** %6, align 8
  store i32 1, i32* %7, align 4
  br label %9

; <label>:9:                                      ; preds = %41, %3
  %10 = load i32, i32* %7, align 4
  %11 = icmp sle i32 %10, 8
  br i1 %11, label %12, label %50

; <label>:12:                                     ; preds = %9
  %13 = load i16*, i16** %4, align 8
  %14 = load i16, i16* %13, align 2
  %15 = sext i16 %14 to i32
  %16 = ashr i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = load i16*, i16** %5, align 8
  %19 = load i16, i16* %18, align 2
  %20 = sext i16 %19 to i32
  %21 = ashr i32 %20, 1
  %22 = sext i32 %21 to i64
  %23 = add nsw i64 %17, %22
  store i64 %23, i64* %8, align 8
  %24 = sub nsw i64 %23, -32768
  %25 = icmp ugt i64 %24, 65535
  br i1 %25, label %26, label %34

; <label>:26:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Coefficients_13_26, i64 0, i64 0)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Coefficients_13_26, i64 0, i64 0)
  %28 = load i64, i64* %8, align 8
  %29 = icmp sgt i64 %28, 0
  %30 = zext i1 %29 to i64
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Coefficients_13_26, i64 0, i64 3)
  %31 = add i64 %pgocount1, %30
  store i64 %31, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Coefficients_13_26, i64 0, i64 3)
  %32 = select i1 %29, i32 32767, i32 -32768
  %33 = sext i32 %32 to i64
  br label %37

; <label>:34:                                     ; preds = %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Coefficients_13_26, i64 0, i64 1)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Coefficients_13_26, i64 0, i64 1)
  %36 = load i64, i64* %8, align 8
  br label %37

; <label>:37:                                     ; preds = %34, %26
  %38 = phi i64 [ %33, %26 ], [ %36, %34 ]
  %39 = trunc i64 %38 to i16
  %40 = load i16*, i16** %6, align 8
  store i16 %39, i16* %40, align 2
  br label %41

; <label>:41:                                     ; preds = %37
  %42 = load i32, i32* %7, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %7, align 4
  %44 = load i16*, i16** %4, align 8
  %45 = getelementptr inbounds i16, i16* %44, i32 1
  store i16* %45, i16** %4, align 8
  %46 = load i16*, i16** %5, align 8
  %47 = getelementptr inbounds i16, i16* %46, i32 1
  store i16* %47, i16** %5, align 8
  %48 = load i16*, i16** %6, align 8
  %49 = getelementptr inbounds i16, i16* %48, i32 1
  store i16* %49, i16** %6, align 8
  br label %9

; <label>:50:                                     ; preds = %9
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Coefficients_13_26, i64 0, i64 2)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Coefficients_13_26, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Coefficients_27_39(i16*, i16*, i16*) #0 {
  %4 = alloca i16*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  store i16* %0, i16** %4, align 8
  store i16* %1, i16** %5, align 8
  store i16* %2, i16** %6, align 8
  store i32 1, i32* %7, align 4
  br label %9

; <label>:9:                                      ; preds = %66, %3
  %10 = load i32, i32* %7, align 4
  %11 = icmp sle i32 %10, 8
  br i1 %11, label %12, label %75

; <label>:12:                                     ; preds = %9
  %13 = load i16*, i16** %4, align 8
  %14 = load i16, i16* %13, align 2
  %15 = sext i16 %14 to i32
  %16 = ashr i32 %15, 2
  %17 = sext i32 %16 to i64
  %18 = load i16*, i16** %5, align 8
  %19 = load i16, i16* %18, align 2
  %20 = sext i16 %19 to i32
  %21 = ashr i32 %20, 2
  %22 = sext i32 %21 to i64
  %23 = add nsw i64 %17, %22
  store i64 %23, i64* %8, align 8
  %24 = sub nsw i64 %23, -32768
  %25 = icmp ugt i64 %24, 65535
  br i1 %25, label %26, label %33

; <label>:26:                                     ; preds = %12
  %27 = load i64, i64* %8, align 8
  %28 = icmp sgt i64 %27, 0
  %29 = zext i1 %28 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_27_39, i64 0, i64 4)
  %30 = add i64 %pgocount, %29
  store i64 %30, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_27_39, i64 0, i64 4)
  %31 = select i1 %28, i32 32767, i32 -32768
  %32 = sext i32 %31 to i64
  br label %36

; <label>:33:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_27_39, i64 0, i64 0)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_27_39, i64 0, i64 0)
  %35 = load i64, i64* %8, align 8
  br label %36

; <label>:36:                                     ; preds = %33, %26
  %37 = phi i64 [ %32, %26 ], [ %35, %33 ]
  %38 = trunc i64 %37 to i16
  %39 = load i16*, i16** %6, align 8
  store i16 %38, i16* %39, align 2
  %40 = load i16*, i16** %6, align 8
  %41 = load i16, i16* %40, align 2
  %42 = sext i16 %41 to i64
  %43 = load i16*, i16** %5, align 8
  %44 = load i16, i16* %43, align 2
  %45 = sext i16 %44 to i32
  %46 = ashr i32 %45, 1
  %47 = sext i32 %46 to i64
  %48 = add nsw i64 %42, %47
  store i64 %48, i64* %8, align 8
  %49 = sub nsw i64 %48, -32768
  %50 = icmp ugt i64 %49, 65535
  br i1 %50, label %51, label %59

; <label>:51:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_27_39, i64 0, i64 1)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_27_39, i64 0, i64 1)
  %53 = load i64, i64* %8, align 8
  %54 = icmp sgt i64 %53, 0
  %55 = zext i1 %54 to i64
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_27_39, i64 0, i64 5)
  %56 = add i64 %pgocount3, %55
  store i64 %56, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_27_39, i64 0, i64 5)
  %57 = select i1 %54, i32 32767, i32 -32768
  %58 = sext i32 %57 to i64
  br label %62

; <label>:59:                                     ; preds = %36
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_27_39, i64 0, i64 2)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_27_39, i64 0, i64 2)
  %61 = load i64, i64* %8, align 8
  br label %62

; <label>:62:                                     ; preds = %59, %51
  %63 = phi i64 [ %58, %51 ], [ %61, %59 ]
  %64 = trunc i64 %63 to i16
  %65 = load i16*, i16** %6, align 8
  store i16 %64, i16* %65, align 2
  br label %66

; <label>:66:                                     ; preds = %62
  %67 = load i32, i32* %7, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %7, align 4
  %69 = load i16*, i16** %4, align 8
  %70 = getelementptr inbounds i16, i16* %69, i32 1
  store i16* %70, i16** %4, align 8
  %71 = load i16*, i16** %5, align 8
  %72 = getelementptr inbounds i16, i16* %71, i32 1
  store i16* %72, i16** %5, align 8
  %73 = load i16*, i16** %6, align 8
  %74 = getelementptr inbounds i16, i16* %73, i32 1
  store i16* %74, i16** %6, align 8
  br label %9

; <label>:75:                                     ; preds = %9
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_27_39, i64 0, i64 3)
  %76 = add i64 %pgocount5, 1
  store i64 %76, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Coefficients_27_39, i64 0, i64 3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Coefficients_40_159(i16*, i16*) #0 {
  %3 = alloca i16*, align 8
  %4 = alloca i16*, align 8
  %5 = alloca i32, align 4
  store i16* %0, i16** %3, align 8
  store i16* %1, i16** %4, align 8
  store i32 1, i32* %5, align 4
  br label %6

; <label>:6:                                      ; preds = %13, %2
  %7 = load i32, i32* %5, align 4
  %8 = icmp sle i32 %7, 8
  br i1 %8, label %9, label %21

; <label>:9:                                      ; preds = %6
  %10 = load i16*, i16** %3, align 8
  %11 = load i16, i16* %10, align 2
  %12 = load i16*, i16** %4, align 8
  store i16 %11, i16* %12, align 2
  br label %13

; <label>:13:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Coefficients_40_159, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Coefficients_40_159, i64 0, i64 0)
  %15 = load i32, i32* %5, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %5, align 4
  %17 = load i16*, i16** %4, align 8
  %18 = getelementptr inbounds i16, i16* %17, i32 1
  store i16* %18, i16** %4, align 8
  %19 = load i16*, i16** %3, align 8
  %20 = getelementptr inbounds i16, i16* %19, i32 1
  store i16* %20, i16** %3, align 8
  br label %6

; <label>:21:                                     ; preds = %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Coefficients_40_159, i64 0, i64 1)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Coefficients_40_159, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @Gsm_Short_Term_Synthesis_Filter(%struct.gsm_state*, i16*, i16*, i16*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Gsm_Short_Term_Synthesis_Filter, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Gsm_Short_Term_Synthesis_Filter, i64 0, i64 0)
  %6 = alloca %struct.gsm_state*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca [8 x i16], align 16
  store %struct.gsm_state* %0, %struct.gsm_state** %6, align 8
  store i16* %1, i16** %7, align 8
  store i16* %2, i16** %8, align 8
  store i16* %3, i16** %9, align 8
  %13 = load %struct.gsm_state*, %struct.gsm_state** %6, align 8
  %14 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %13, i32 0, i32 5
  %15 = load %struct.gsm_state*, %struct.gsm_state** %6, align 8
  %16 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %15, i32 0, i32 6
  %17 = load i16, i16* %16, align 4
  %18 = sext i16 %17 to i64
  %19 = getelementptr inbounds [2 x [8 x i16]], [2 x [8 x i16]]* %14, i64 0, i64 %18
  %20 = getelementptr inbounds [8 x i16], [8 x i16]* %19, i32 0, i32 0
  store i16* %20, i16** %10, align 8
  %21 = load %struct.gsm_state*, %struct.gsm_state** %6, align 8
  %22 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %21, i32 0, i32 5
  %23 = load %struct.gsm_state*, %struct.gsm_state** %6, align 8
  %24 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %23, i32 0, i32 6
  %25 = load i16, i16* %24, align 4
  %26 = sext i16 %25 to i32
  %27 = xor i32 %26, 1
  %28 = trunc i32 %27 to i16
  store i16 %28, i16* %24, align 4
  %29 = sext i16 %28 to i64
  %30 = getelementptr inbounds [2 x [8 x i16]], [2 x [8 x i16]]* %22, i64 0, i64 %29
  %31 = getelementptr inbounds [8 x i16], [8 x i16]* %30, i32 0, i32 0
  store i16* %31, i16** %11, align 8
  %32 = load i16*, i16** %7, align 8
  %33 = load i16*, i16** %10, align 8
  call void @Decoding_of_the_coded_Log_Area_Ratios(i16* %32, i16* %33)
  %34 = load i16*, i16** %11, align 8
  %35 = load i16*, i16** %10, align 8
  %36 = getelementptr inbounds [8 x i16], [8 x i16]* %12, i32 0, i32 0
  call void @Coefficients_0_12(i16* %34, i16* %35, i16* %36)
  %37 = getelementptr inbounds [8 x i16], [8 x i16]* %12, i32 0, i32 0
  call void @LARp_to_rp(i16* %37)
  %38 = load %struct.gsm_state*, %struct.gsm_state** %6, align 8
  %39 = getelementptr inbounds [8 x i16], [8 x i16]* %12, i32 0, i32 0
  %40 = load i16*, i16** %8, align 8
  %41 = load i16*, i16** %9, align 8
  call void @Short_term_synthesis_filtering(%struct.gsm_state* %38, i16* %39, i32 13, i16* %40, i16* %41)
  %42 = load i16*, i16** %11, align 8
  %43 = load i16*, i16** %10, align 8
  %44 = getelementptr inbounds [8 x i16], [8 x i16]* %12, i32 0, i32 0
  call void @Coefficients_13_26(i16* %42, i16* %43, i16* %44)
  %45 = getelementptr inbounds [8 x i16], [8 x i16]* %12, i32 0, i32 0
  call void @LARp_to_rp(i16* %45)
  %46 = load %struct.gsm_state*, %struct.gsm_state** %6, align 8
  %47 = getelementptr inbounds [8 x i16], [8 x i16]* %12, i32 0, i32 0
  %48 = load i16*, i16** %8, align 8
  %49 = getelementptr inbounds i16, i16* %48, i64 13
  %50 = load i16*, i16** %9, align 8
  %51 = getelementptr inbounds i16, i16* %50, i64 13
  call void @Short_term_synthesis_filtering(%struct.gsm_state* %46, i16* %47, i32 14, i16* %49, i16* %51)
  %52 = load i16*, i16** %11, align 8
  %53 = load i16*, i16** %10, align 8
  %54 = getelementptr inbounds [8 x i16], [8 x i16]* %12, i32 0, i32 0
  call void @Coefficients_27_39(i16* %52, i16* %53, i16* %54)
  %55 = getelementptr inbounds [8 x i16], [8 x i16]* %12, i32 0, i32 0
  call void @LARp_to_rp(i16* %55)
  %56 = load %struct.gsm_state*, %struct.gsm_state** %6, align 8
  %57 = getelementptr inbounds [8 x i16], [8 x i16]* %12, i32 0, i32 0
  %58 = load i16*, i16** %8, align 8
  %59 = getelementptr inbounds i16, i16* %58, i64 27
  %60 = load i16*, i16** %9, align 8
  %61 = getelementptr inbounds i16, i16* %60, i64 27
  call void @Short_term_synthesis_filtering(%struct.gsm_state* %56, i16* %57, i32 13, i16* %59, i16* %61)
  %62 = load i16*, i16** %10, align 8
  %63 = getelementptr inbounds [8 x i16], [8 x i16]* %12, i32 0, i32 0
  call void @Coefficients_40_159(i16* %62, i16* %63)
  %64 = getelementptr inbounds [8 x i16], [8 x i16]* %12, i32 0, i32 0
  call void @LARp_to_rp(i16* %64)
  %65 = load %struct.gsm_state*, %struct.gsm_state** %6, align 8
  %66 = getelementptr inbounds [8 x i16], [8 x i16]* %12, i32 0, i32 0
  %67 = load i16*, i16** %8, align 8
  %68 = getelementptr inbounds i16, i16* %67, i64 40
  %69 = load i16*, i16** %9, align 8
  %70 = getelementptr inbounds i16, i16* %69, i64 40
  call void @Short_term_synthesis_filtering(%struct.gsm_state* %65, i16* %66, i32 120, i16* %68, i16* %70)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Short_term_synthesis_filtering(%struct.gsm_state*, i16*, i32, i16*, i16*) #0 {
  %6 = alloca %struct.gsm_state*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i16, align 2
  %14 = alloca i16, align 2
  %15 = alloca i16, align 2
  %16 = alloca i64, align 8
  store %struct.gsm_state* %0, %struct.gsm_state** %6, align 8
  store i16* %1, i16** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16* %3, i16** %9, align 8
  store i16* %4, i16** %10, align 8
  %17 = load %struct.gsm_state*, %struct.gsm_state** %6, align 8
  %18 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %17, i32 0, i32 8
  %19 = getelementptr inbounds [9 x i16], [9 x i16]* %18, i32 0, i32 0
  store i16* %19, i16** %11, align 8
  br label %20

; <label>:20:                                     ; preds = %137, %5
  %21 = load i32, i32* %8, align 4
  %22 = add nsw i32 %21, -1
  store i32 %22, i32* %8, align 4
  %23 = icmp ne i32 %21, 0
  br i1 %23, label %24, label %144

; <label>:24:                                     ; preds = %20
  %25 = load i16*, i16** %9, align 8
  %26 = getelementptr inbounds i16, i16* %25, i32 1
  store i16* %26, i16** %9, align 8
  %27 = load i16, i16* %25, align 2
  store i16 %27, i16* %13, align 2
  store i32 8, i32* %12, align 4
  br label %28

; <label>:28:                                     ; preds = %129, %24
  %29 = load i32, i32* %12, align 4
  %30 = add nsw i32 %29, -1
  store i32 %30, i32* %12, align 4
  %31 = icmp ne i32 %29, 0
  br i1 %31, label %32, label %137

; <label>:32:                                     ; preds = %28
  %33 = load i16*, i16** %7, align 8
  %34 = load i32, i32* %12, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i16, i16* %33, i64 %35
  %37 = load i16, i16* %36, align 2
  store i16 %37, i16* %14, align 2
  %38 = load i16*, i16** %11, align 8
  %39 = load i32, i32* %12, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i16, i16* %38, i64 %40
  %42 = load i16, i16* %41, align 2
  store i16 %42, i16* %15, align 2
  %43 = load i16, i16* %14, align 2
  %44 = sext i16 %43 to i32
  %45 = icmp eq i32 %44, -32768
  br i1 %45, label %46, label %53

; <label>:46:                                     ; preds = %32
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 0)
  %47 = add i64 %pgocount, 1
  store i64 %47, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 0)
  %48 = load i16, i16* %15, align 2
  %49 = sext i16 %48 to i32
  %50 = icmp eq i32 %49, -32768
  br i1 %50, label %51, label %53

; <label>:51:                                     ; preds = %46
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 4)
  %52 = add i64 %pgocount1, 1
  store i64 %52, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 4)
  br label %62

; <label>:53:                                     ; preds = %46, %32
  %54 = load i16, i16* %14, align 2
  %55 = sext i16 %54 to i64
  %56 = load i16, i16* %15, align 2
  %57 = sext i16 %56 to i64
  %58 = mul nsw i64 %55, %57
  %59 = add nsw i64 %58, 16384
  %60 = ashr i64 %59, 15
  %61 = and i64 65535, %60
  br label %62

; <label>:62:                                     ; preds = %53, %51
  %63 = phi i64 [ 32767, %51 ], [ %61, %53 ]
  %64 = trunc i64 %63 to i16
  store i16 %64, i16* %15, align 2
  %65 = load i16, i16* %13, align 2
  %66 = sext i16 %65 to i64
  %67 = load i16, i16* %15, align 2
  %68 = sext i16 %67 to i64
  %69 = sub nsw i64 %66, %68
  store i64 %69, i64* %16, align 8
  %70 = icmp sge i64 %69, 32767
  br i1 %70, label %71, label %72

; <label>:71:                                     ; preds = %62
  br label %82

; <label>:72:                                     ; preds = %62
  %73 = load i64, i64* %16, align 8
  %74 = icmp sle i64 %73, -32768
  br i1 %74, label %75, label %77

; <label>:75:                                     ; preds = %72
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 5)
  %76 = add i64 %pgocount2, 1
  store i64 %76, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 5)
  br label %80

; <label>:77:                                     ; preds = %72
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 6)
  %78 = add i64 %pgocount3, 1
  store i64 %78, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 6)
  %79 = load i64, i64* %16, align 8
  br label %80

; <label>:80:                                     ; preds = %77, %75
  %81 = phi i64 [ -32768, %75 ], [ %79, %77 ]
  br label %82

; <label>:82:                                     ; preds = %80, %71
  %83 = phi i64 [ 32767, %71 ], [ %81, %80 ]
  %84 = trunc i64 %83 to i16
  store i16 %84, i16* %13, align 2
  %85 = load i16, i16* %14, align 2
  %86 = sext i16 %85 to i32
  %87 = icmp eq i32 %86, -32768
  br i1 %87, label %88, label %95

; <label>:88:                                     ; preds = %82
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 1)
  %89 = add i64 %pgocount4, 1
  store i64 %89, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 1)
  %90 = load i16, i16* %13, align 2
  %91 = sext i16 %90 to i32
  %92 = icmp eq i32 %91, -32768
  br i1 %92, label %93, label %95

; <label>:93:                                     ; preds = %88
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 7)
  %94 = add i64 %pgocount5, 1
  store i64 %94, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 7)
  br label %104

; <label>:95:                                     ; preds = %88, %82
  %96 = load i16, i16* %14, align 2
  %97 = sext i16 %96 to i64
  %98 = load i16, i16* %13, align 2
  %99 = sext i16 %98 to i64
  %100 = mul nsw i64 %97, %99
  %101 = add nsw i64 %100, 16384
  %102 = ashr i64 %101, 15
  %103 = and i64 65535, %102
  br label %104

; <label>:104:                                    ; preds = %95, %93
  %105 = phi i64 [ 32767, %93 ], [ %103, %95 ]
  %106 = trunc i64 %105 to i16
  store i16 %106, i16* %14, align 2
  %107 = load i16*, i16** %11, align 8
  %108 = load i32, i32* %12, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i16, i16* %107, i64 %109
  %111 = load i16, i16* %110, align 2
  %112 = sext i16 %111 to i64
  %113 = load i16, i16* %14, align 2
  %114 = sext i16 %113 to i64
  %115 = add nsw i64 %112, %114
  store i64 %115, i64* %16, align 8
  %116 = sub nsw i64 %115, -32768
  %117 = icmp ugt i64 %116, 65535
  br i1 %117, label %118, label %126

; <label>:118:                                    ; preds = %104
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 2)
  %119 = add i64 %pgocount6, 1
  store i64 %119, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 2)
  %120 = load i64, i64* %16, align 8
  %121 = icmp sgt i64 %120, 0
  %122 = zext i1 %121 to i64
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 10)
  %123 = add i64 %pgocount7, %122
  store i64 %123, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 10)
  %124 = select i1 %121, i32 32767, i32 -32768
  %125 = sext i32 %124 to i64
  br label %129

; <label>:126:                                    ; preds = %104
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 3)
  %127 = add i64 %pgocount8, 1
  store i64 %127, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 3)
  %128 = load i64, i64* %16, align 8
  br label %129

; <label>:129:                                    ; preds = %126, %118
  %130 = phi i64 [ %125, %118 ], [ %128, %126 ]
  %131 = trunc i64 %130 to i16
  %132 = load i16*, i16** %11, align 8
  %133 = load i32, i32* %12, align 4
  %134 = add nsw i32 %133, 1
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i16, i16* %132, i64 %135
  store i16 %131, i16* %136, align 2
  br label %28

; <label>:137:                                    ; preds = %28
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 8)
  %138 = add i64 %pgocount9, 1
  store i64 %138, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 8)
  %139 = load i16, i16* %13, align 2
  %140 = load i16*, i16** %11, align 8
  %141 = getelementptr inbounds i16, i16* %140, i64 0
  store i16 %139, i16* %141, align 2
  %142 = load i16*, i16** %10, align 8
  %143 = getelementptr inbounds i16, i16* %142, i32 1
  store i16* %143, i16** %10, align 8
  store i16 %139, i16* %142, align 2
  br label %20

; <label>:144:                                    ; preds = %20
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 9)
  %145 = add i64 %pgocount10, 1
  store i64 %145, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Short_term_synthesis_filtering, i64 0, i64 9)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

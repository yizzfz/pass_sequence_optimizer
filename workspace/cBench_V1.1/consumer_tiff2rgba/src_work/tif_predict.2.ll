; ModuleID = 'tmp1.ll'
source_filename = "tif_predict.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, {}*, i32 (%struct.tiff*, i16)*, {}*, i32 (%struct.tiff*, i16)*, {}*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.TIFFPredictorState = type { i32, i32, i32, void (%struct.tiff*, i8*, i32)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*)* }

$__llvm_profile_raw_version = comdat any

@predictFieldInfo = internal constant [1 x %struct.TIFFFieldInfo] [%struct.TIFFFieldInfo { i32 317, i16 1, i16 1, i32 3, i16 62, i8 0, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0) }], align 16
@.str = private unnamed_addr constant [10 x i8] c"Predictor\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"  Predictor: \00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"none \00", align 1
@.str.3 = private unnamed_addr constant [25 x i8] c"horizontal differencing \00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"%u (0x%x)\0A\00", align 1
@.str.5 = private unnamed_addr constant [35 x i8] c"\22Predictor\22 value %d not supported\00", align 1
@.str.6 = private unnamed_addr constant [70 x i8] c"Horizontal differencing \22Predictor\22 not supported with %d-bit samples\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"sp != NULL\00", align 1
@.str.8 = private unnamed_addr constant [14 x i8] c"tif_predict.c\00", align 1
@__PRETTY_FUNCTION__.PredictorDecodeRow = private unnamed_addr constant [61 x i8] c"int PredictorDecodeRow(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@.str.9 = private unnamed_addr constant [20 x i8] c"sp->coderow != NULL\00", align 1
@.str.10 = private unnamed_addr constant [18 x i8] c"sp->pfunc != NULL\00", align 1
@__PRETTY_FUNCTION__.PredictorDecodeTile = private unnamed_addr constant [62 x i8] c"int PredictorDecodeTile(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@.str.11 = private unnamed_addr constant [21 x i8] c"sp->codetile != NULL\00", align 1
@.str.12 = private unnamed_addr constant [12 x i8] c"rowsize > 0\00", align 1
@__PRETTY_FUNCTION__.PredictorEncodeRow = private unnamed_addr constant [61 x i8] c"int PredictorEncodeRow(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@__PRETTY_FUNCTION__.PredictorEncodeTile = private unnamed_addr constant [62 x i8] c"int PredictorEncodeTile(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFPredictorInit = private constant [17 x i8] c"TIFFPredictorInit"
@__profn_tmp1.ll_PredictorVGetField = private constant [26 x i8] c"tmp1.ll:PredictorVGetField"
@__profn_tmp1.ll_PredictorVSetField = private constant [26 x i8] c"tmp1.ll:PredictorVSetField"
@__profn_tmp1.ll_PredictorPrintDir = private constant [25 x i8] c"tmp1.ll:PredictorPrintDir"
@__profn_tmp1.ll_PredictorSetupDecode = private constant [28 x i8] c"tmp1.ll:PredictorSetupDecode"
@__profn_tmp1.ll_PredictorSetupEncode = private constant [28 x i8] c"tmp1.ll:PredictorSetupEncode"
@__profn_tmp1.ll_PredictorSetup = private constant [22 x i8] c"tmp1.ll:PredictorSetup"
@__profn_tmp1.ll_horAcc8 = private constant [15 x i8] c"tmp1.ll:horAcc8"
@__profn_tmp1.ll_horAcc16 = private constant [16 x i8] c"tmp1.ll:horAcc16"
@__profn_tmp1.ll_PredictorDecodeRow = private constant [26 x i8] c"tmp1.ll:PredictorDecodeRow"
@__profn_tmp1.ll_PredictorDecodeTile = private constant [27 x i8] c"tmp1.ll:PredictorDecodeTile"
@__profn_tmp1.ll_swabHorAcc16 = private constant [20 x i8] c"tmp1.ll:swabHorAcc16"
@__profn_tmp1.ll_horDiff8 = private constant [16 x i8] c"tmp1.ll:horDiff8"
@__profn_tmp1.ll_horDiff16 = private constant [17 x i8] c"tmp1.ll:horDiff16"
@__profn_tmp1.ll_PredictorEncodeRow = private constant [26 x i8] c"tmp1.ll:PredictorEncodeRow"
@__profn_tmp1.ll_PredictorEncodeTile = private constant [27 x i8] c"tmp1.ll:PredictorEncodeTile"
@__profc_TIFFPredictorInit = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFPredictorInit = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3402358805753916066, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFPredictorInit, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFPredictorInit to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_PredictorVGetField = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_PredictorVGetField = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_PredictorVGetField = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8116950188406592398, i64 281526353382166, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_PredictorVGetField, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @PredictorVGetField to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_PredictorVGetField to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_PredictorVSetField = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_PredictorVSetField = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_PredictorVSetField = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -469983386082444088, i64 281526353382166, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_PredictorVSetField, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @PredictorVSetField to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_PredictorVSetField to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_PredictorPrintDir = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_PredictorPrintDir = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_PredictorPrintDir = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8048005857301260939, i64 281534357638103, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorPrintDir, i32 0, i32 0), i8* bitcast (void (%struct.tiff*, %struct._IO_FILE*, i64)* @PredictorPrintDir to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_PredictorPrintDir to i8*), i32 5, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_PredictorSetupDecode = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_PredictorSetupDecode = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_PredictorSetupDecode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -433444268929075076, i64 281569909613063, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PredictorSetupDecode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @PredictorSetupDecode to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_PredictorSetupDecode to i8*), i32 8, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_PredictorSetupEncode = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_PredictorSetupEncode = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_PredictorSetupEncode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2530791256240427372, i64 281545490413565, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorSetupEncode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @PredictorSetupEncode to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_PredictorSetupEncode to i8*), i32 6, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_PredictorSetup = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_PredictorSetup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2218133850497199543, i64 97275118697, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorSetup, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_horAcc8 = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_horAcc8 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 974077643677416203, i64 181686583149, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i32 0, i32 0), i8* bitcast (void (%struct.tiff*, i8*, i32)* @horAcc8 to i8*), i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_horAcc16 = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_horAcc16 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5552570705813229113, i64 112998179443, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i32 0, i32 0), i8* bitcast (void (%struct.tiff*, i8*, i32)* @horAcc16 to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_PredictorDecodeRow = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_PredictorDecodeRow = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_PredictorDecodeRow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3845351583202527692, i64 563041540003974, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorDecodeRow, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @PredictorDecodeRow to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_PredictorDecodeRow to i8*), i32 5, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_PredictorDecodeTile = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_PredictorDecodeTile = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_PredictorDecodeTile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6680560893892865984, i64 563079963036178, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorDecodeTile, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @PredictorDecodeTile to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_PredictorDecodeTile to i8*), i32 7, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_swabHorAcc16 = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_swabHorAcc16 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7324410738049939272, i64 112998179443, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i32 0, i32 0), i8* bitcast (void (%struct.tiff*, i8*, i32)* @swabHorAcc16 to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_horDiff8 = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_horDiff8 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6843850832865236358, i64 181686583149, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i32 0, i32 0), i8* bitcast (void (%struct.tiff*, i8*, i32)* @horDiff8 to i8*), i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_horDiff16 = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_horDiff16 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4261761929463628928, i64 112998179443, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i32 0, i32 0), i8* bitcast (void (%struct.tiff*, i8*, i32)* @horDiff16 to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_PredictorEncodeRow = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_PredictorEncodeRow = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_PredictorEncodeRow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7697225210168811585, i64 563025022385289, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PredictorEncodeRow, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @PredictorEncodeRow to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_PredictorEncodeRow to i8*), i32 4, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_PredictorEncodeTile = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_PredictorEncodeTile = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_PredictorEncodeTile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1767113007471581207, i64 563063713654561, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorEncodeTile, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @PredictorEncodeTile to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_PredictorEncodeTile to i8*), i32 6, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [13 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [135 x i8] c"\F9\02\83\01x\DA\0B\F1ts\0B(JM\C9L.\C9/\F2\CC\CB,a,\C9-0\D4\CB\C9\B1\82\8B\86\B9\A7\96\B8e\A6\E6\A4`\91\0A\C6)\15P\94\99W\E2\92Y\84)\03\D4SZ\E0\92\9A\9C\9F\92\8AC\D25\0F\8F$\5C8#\BF\C819\D9\02\8Doh\86\A9\0FbYP~9.\A9\90\CC\1C\84u\C5\E5\89I\1E\E8f\01\0Dw\C9LK\B3@\17\C0f\1D\C4\F9X\AD\83H\81\AC\03\00\A6D\87\96", section "__llvm_prf_names"
@llvm.used = appending global [18 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFPredictorInit to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorVGetField to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorVSetField to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorPrintDir to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorSetupDecode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorSetupEncode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorSetup to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_horAcc8 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_horAcc16 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorDecodeRow to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorDecodeTile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_swabHorAcc16 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_horDiff8 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_horDiff16 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorEncodeRow to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorEncodeTile to i8*), i8* bitcast ([13 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([135 x i8], [135 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @TIFFPredictorInit(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFPredictorInit, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFPredictorInit, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFPredictorState*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %5 = load %struct.tiff*, %struct.tiff** %3, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %5, i32 0, i32 37
  %7 = load i8*, i8** %6, align 8
  %8 = bitcast i8* %7 to %struct.TIFFPredictorState*
  store %struct.TIFFPredictorState* %8, %struct.TIFFPredictorState** %4, align 8
  %9 = load %struct.tiff*, %struct.tiff** %3, align 8
  call void @_TIFFMergeFieldInfo(%struct.tiff* %9, %struct.TIFFFieldInfo* getelementptr inbounds ([1 x %struct.TIFFFieldInfo], [1 x %struct.TIFFFieldInfo]* @predictFieldInfo, i32 0, i32 0), i32 1)
  %10 = load %struct.tiff*, %struct.tiff** %3, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 58
  %12 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %11, align 8
  %13 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %14 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %13, i32 0, i32 7
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* %12, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %14, align 8
  %15 = load %struct.tiff*, %struct.tiff** %3, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %15, i32 0, i32 58
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @PredictorVGetField, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %16, align 8
  %17 = load %struct.tiff*, %struct.tiff** %3, align 8
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %17, i32 0, i32 57
  %19 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %18, align 8
  %20 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %21 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %20, i32 0, i32 8
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* %19, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %21, align 8
  %22 = load %struct.tiff*, %struct.tiff** %3, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %22, i32 0, i32 57
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @PredictorVSetField, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %23, align 8
  %24 = load %struct.tiff*, %struct.tiff** %3, align 8
  %25 = getelementptr inbounds %struct.tiff, %struct.tiff* %24, i32 0, i32 59
  %26 = load void (%struct.tiff*, %struct._IO_FILE*, i64)*, void (%struct.tiff*, %struct._IO_FILE*, i64)** %25, align 8
  %27 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %28 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %27, i32 0, i32 9
  store void (%struct.tiff*, %struct._IO_FILE*, i64)* %26, void (%struct.tiff*, %struct._IO_FILE*, i64)** %28, align 8
  %29 = load %struct.tiff*, %struct.tiff** %3, align 8
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %29, i32 0, i32 59
  store void (%struct.tiff*, %struct._IO_FILE*, i64)* @PredictorPrintDir, void (%struct.tiff*, %struct._IO_FILE*, i64)** %30, align 8
  %31 = load %struct.tiff*, %struct.tiff** %3, align 8
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %31, i32 0, i32 21
  %33 = bitcast {}** %32 to i32 (%struct.tiff*)**
  %34 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %33, align 8
  %35 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %36 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %35, i32 0, i32 10
  store i32 (%struct.tiff*)* %34, i32 (%struct.tiff*)** %36, align 8
  %37 = load %struct.tiff*, %struct.tiff** %3, align 8
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %37, i32 0, i32 21
  %39 = bitcast {}** %38 to i32 (%struct.tiff*)**
  store i32 (%struct.tiff*)* @PredictorSetupDecode, i32 (%struct.tiff*)** %39, align 8
  %40 = load %struct.tiff*, %struct.tiff** %3, align 8
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %40, i32 0, i32 23
  %42 = bitcast {}** %41 to i32 (%struct.tiff*)**
  %43 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %42, align 8
  %44 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %45 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %44, i32 0, i32 11
  store i32 (%struct.tiff*)* %43, i32 (%struct.tiff*)** %45, align 8
  %46 = load %struct.tiff*, %struct.tiff** %3, align 8
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %46, i32 0, i32 23
  %48 = bitcast {}** %47 to i32 (%struct.tiff*)**
  store i32 (%struct.tiff*)* @PredictorSetupEncode, i32 (%struct.tiff*)** %48, align 8
  %49 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %50 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %49, i32 0, i32 0
  store i32 1, i32* %50, align 8
  %51 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %52 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %51, i32 0, i32 3
  store void (%struct.tiff*, i8*, i32)* null, void (%struct.tiff*, i8*, i32)** %52, align 8
  ret i32 1
}

declare void @_TIFFMergeFieldInfo(%struct.tiff*, %struct.TIFFFieldInfo*, i32) #1

; Function Attrs: nounwind uwtable
define internal i32 @PredictorVGetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.__va_list_tag*, align 8
  %8 = alloca %struct.TIFFPredictorState*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store %struct.__va_list_tag* %2, %struct.__va_list_tag** %7, align 8
  %9 = load %struct.tiff*, %struct.tiff** %5, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 37
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast i8* %11 to %struct.TIFFPredictorState*
  store %struct.TIFFPredictorState* %12, %struct.TIFFPredictorState** %8, align 8
  %13 = load i32, i32* %6, align 4
  switch i32 %13, label %39 [
    i32 317, label %14
  ]

; <label>:14:                                     ; preds = %3
  %15 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %8, align 8
  %16 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %15, i32 0, i32 0
  %17 = load i32, i32* %16, align 8
  %18 = trunc i32 %17 to i16
  %19 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %20 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %19, i32 0, i32 0
  %21 = load i32, i32* %20, align 8
  %22 = icmp ule i32 %21, 40
  br i1 %22, label %23, label %30

; <label>:23:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_PredictorVGetField, i64 0, i64 1)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_PredictorVGetField, i64 0, i64 1)
  %25 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %19, i32 0, i32 3
  %26 = load i8*, i8** %25, align 8
  %27 = getelementptr i8, i8* %26, i32 %21
  %28 = bitcast i8* %27 to i16**
  %29 = add i32 %21, 8
  store i32 %29, i32* %20, align 8
  br label %36

; <label>:30:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_PredictorVGetField, i64 0, i64 2)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_PredictorVGetField, i64 0, i64 2)
  %32 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %19, i32 0, i32 2
  %33 = load i8*, i8** %32, align 8
  %34 = bitcast i8* %33 to i16**
  %35 = getelementptr i8, i8* %33, i32 8
  store i8* %35, i8** %32, align 8
  br label %36

; <label>:36:                                     ; preds = %30, %23
  %37 = phi i16** [ %28, %23 ], [ %34, %30 ]
  %38 = load i16*, i16** %37, align 8
  store i16 %18, i16* %38, align 2
  br label %49

; <label>:39:                                     ; preds = %3
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_PredictorVGetField, i64 0, i64 0)
  %40 = add i64 %pgocount2, 1
  store i64 %40, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_PredictorVGetField, i64 0, i64 0)
  %41 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %8, align 8
  %42 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %41, i32 0, i32 7
  %43 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %42, align 8
  %44 = load %struct.tiff*, %struct.tiff** %5, align 8
  %45 = load i32, i32* %6, align 4
  %46 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %47 = ptrtoint i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* %43 to i64
  call void @__llvm_profile_instrument_target(i64 %47, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorVGetField to i8*), i32 0)
  %48 = call i32 %43(%struct.tiff* %44, i32 %45, %struct.__va_list_tag* %46)
  store i32 %48, i32* %4, align 4
  br label %50

; <label>:49:                                     ; preds = %36
  store i32 1, i32* %4, align 4
  br label %50

; <label>:50:                                     ; preds = %49, %39
  %51 = load i32, i32* %4, align 4
  ret i32 %51
}

; Function Attrs: nounwind uwtable
define internal i32 @PredictorVSetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.__va_list_tag*, align 8
  %8 = alloca %struct.TIFFPredictorState*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store %struct.__va_list_tag* %2, %struct.__va_list_tag** %7, align 8
  %9 = load %struct.tiff*, %struct.tiff** %5, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 37
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast i8* %11 to %struct.TIFFPredictorState*
  store %struct.TIFFPredictorState* %12, %struct.TIFFPredictorState** %8, align 8
  %13 = load i32, i32* %6, align 4
  switch i32 %13, label %45 [
    i32 317, label %14
  ]

; <label>:14:                                     ; preds = %3
  %15 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %16 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %15, i32 0, i32 0
  %17 = load i32, i32* %16, align 8
  %18 = icmp ule i32 %17, 40
  br i1 %18, label %19, label %26

; <label>:19:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_PredictorVSetField, i64 0, i64 1)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_PredictorVSetField, i64 0, i64 1)
  %21 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %15, i32 0, i32 3
  %22 = load i8*, i8** %21, align 8
  %23 = getelementptr i8, i8* %22, i32 %17
  %24 = bitcast i8* %23 to i32*
  %25 = add i32 %17, 8
  store i32 %25, i32* %16, align 8
  br label %32

; <label>:26:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_PredictorVSetField, i64 0, i64 2)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_PredictorVSetField, i64 0, i64 2)
  %28 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %15, i32 0, i32 2
  %29 = load i8*, i8** %28, align 8
  %30 = bitcast i8* %29 to i32*
  %31 = getelementptr i8, i8* %29, i32 8
  store i8* %31, i8** %28, align 8
  br label %32

; <label>:32:                                     ; preds = %26, %19
  %33 = phi i32* [ %24, %19 ], [ %30, %26 ]
  %34 = load i32, i32* %33, align 4
  %35 = trunc i32 %34 to i16
  %36 = zext i16 %35 to i32
  %37 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %8, align 8
  %38 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %37, i32 0, i32 0
  store i32 %36, i32* %38, align 8
  %39 = load %struct.tiff*, %struct.tiff** %5, align 8
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %39, i32 0, i32 6
  %41 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %40, i32 0, i32 0
  %42 = getelementptr inbounds [3 x i64], [3 x i64]* %41, i64 0, i64 1
  %43 = load i64, i64* %42, align 8
  %44 = or i64 %43, 1073741824
  store i64 %44, i64* %42, align 8
  br label %55

; <label>:45:                                     ; preds = %3
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_PredictorVSetField, i64 0, i64 0)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_PredictorVSetField, i64 0, i64 0)
  %47 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %8, align 8
  %48 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %47, i32 0, i32 8
  %49 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %48, align 8
  %50 = load %struct.tiff*, %struct.tiff** %5, align 8
  %51 = load i32, i32* %6, align 4
  %52 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %53 = ptrtoint i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* %49 to i64
  call void @__llvm_profile_instrument_target(i64 %53, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorVSetField to i8*), i32 0)
  %54 = call i32 %49(%struct.tiff* %50, i32 %51, %struct.__va_list_tag* %52)
  store i32 %54, i32* %4, align 4
  br label %60

; <label>:55:                                     ; preds = %32
  %56 = load %struct.tiff*, %struct.tiff** %5, align 8
  %57 = getelementptr inbounds %struct.tiff, %struct.tiff* %56, i32 0, i32 3
  %58 = load i32, i32* %57, align 8
  %59 = or i32 %58, 8
  store i32 %59, i32* %57, align 8
  store i32 1, i32* %4, align 4
  br label %60

; <label>:60:                                     ; preds = %55, %45
  %61 = load i32, i32* %4, align 4
  ret i32 %61
}

; Function Attrs: nounwind uwtable
define internal void @PredictorPrintDir(%struct.tiff*, %struct._IO_FILE*, i64) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i64, align 8
  %7 = alloca %struct.TIFFPredictorState*, align 8
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %5, align 8
  store i64 %2, i64* %6, align 8
  %8 = load %struct.tiff*, %struct.tiff** %4, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %8, i32 0, i32 37
  %10 = load i8*, i8** %9, align 8
  %11 = bitcast i8* %10 to %struct.TIFFPredictorState*
  store %struct.TIFFPredictorState* %11, %struct.TIFFPredictorState** %7, align 8
  %12 = load i64, i64* %6, align 8
  %13 = load %struct.tiff*, %struct.tiff** %4, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %13, i32 0, i32 6
  %15 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %14, i32 0, i32 0
  %16 = getelementptr inbounds [3 x i64], [3 x i64]* %15, i64 0, i64 1
  %17 = load i64, i64* %16, align 8
  %18 = and i64 %17, 1073741824
  %19 = icmp ne i64 %18, 0
  br i1 %19, label %20, label %44

; <label>:20:                                     ; preds = %3
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0))
  %23 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %7, align 8
  %24 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %23, i32 0, i32 0
  %25 = load i32, i32* %24, align 8
  switch i32 %25, label %34 [
    i32 1, label %26
    i32 2, label %30
  ]

; <label>:26:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorPrintDir, i64 0, i64 3)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorPrintDir, i64 0, i64 3)
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %29 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0))
  br label %34

; <label>:30:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorPrintDir, i64 0, i64 4)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorPrintDir, i64 0, i64 4)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %33 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.3, i32 0, i32 0))
  br label %34

; <label>:34:                                     ; preds = %30, %26, %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorPrintDir, i64 0, i64 2)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorPrintDir, i64 0, i64 2)
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %37 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %7, align 8
  %38 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %37, i32 0, i32 0
  %39 = load i32, i32* %38, align 8
  %40 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %7, align 8
  %41 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %40, i32 0, i32 0
  %42 = load i32, i32* %41, align 8
  %43 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i32 0, i32 0), i32 %39, i32 %42)
  br label %44

; <label>:44:                                     ; preds = %34, %3
  %45 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %7, align 8
  %46 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %45, i32 0, i32 9
  %47 = load void (%struct.tiff*, %struct._IO_FILE*, i64)*, void (%struct.tiff*, %struct._IO_FILE*, i64)** %46, align 8
  %48 = icmp ne void (%struct.tiff*, %struct._IO_FILE*, i64)* %47, null
  br i1 %48, label %49, label %58

; <label>:49:                                     ; preds = %44
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorPrintDir, i64 0, i64 1)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorPrintDir, i64 0, i64 1)
  %51 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %7, align 8
  %52 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %51, i32 0, i32 9
  %53 = load void (%struct.tiff*, %struct._IO_FILE*, i64)*, void (%struct.tiff*, %struct._IO_FILE*, i64)** %52, align 8
  %54 = load %struct.tiff*, %struct.tiff** %4, align 8
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %56 = load i64, i64* %6, align 8
  %57 = ptrtoint void (%struct.tiff*, %struct._IO_FILE*, i64)* %53 to i64
  call void @__llvm_profile_instrument_target(i64 %57, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorPrintDir to i8*), i32 0)
  call void %53(%struct.tiff* %54, %struct._IO_FILE* %55, i64 %56)
  br label %58

; <label>:58:                                     ; preds = %49, %44
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorPrintDir, i64 0, i64 0)
  %59 = add i64 %pgocount4, 1
  store i64 %59, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorPrintDir, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @PredictorSetupDecode(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFPredictorState*, align 8
  %5 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 37
  %8 = load i8*, i8** %7, align 8
  %9 = bitcast i8* %8 to %struct.TIFFPredictorState*
  store %struct.TIFFPredictorState* %9, %struct.TIFFPredictorState** %4, align 8
  %10 = load %struct.tiff*, %struct.tiff** %3, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 6
  store %struct.TIFFDirectory* %11, %struct.TIFFDirectory** %5, align 8
  %12 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %13 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %12, i32 0, i32 10
  %14 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %13, align 8
  %15 = load %struct.tiff*, %struct.tiff** %3, align 8
  %16 = ptrtoint i32 (%struct.tiff*)* %14 to i64
  call void @__llvm_profile_instrument_target(i64 %16, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorSetupDecode to i8*), i32 0)
  %17 = call i32 %14(%struct.tiff* %15)
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %24

; <label>:19:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PredictorSetupDecode, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PredictorSetupDecode, i64 0, i64 0)
  %21 = load %struct.tiff*, %struct.tiff** %3, align 8
  %22 = call i32 @PredictorSetup(%struct.tiff* %21)
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %26, label %24

; <label>:24:                                     ; preds = %19, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PredictorSetupDecode, i64 0, i64 1)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PredictorSetupDecode, i64 0, i64 1)
  store i32 0, i32* %2, align 4
  br label %88

; <label>:26:                                     ; preds = %19
  %27 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %28 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %27, i32 0, i32 0
  %29 = load i32, i32* %28, align 8
  %30 = icmp eq i32 %29, 2
  br i1 %30, label %31, label %86

; <label>:31:                                     ; preds = %26
  %32 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %33 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %32, i32 0, i32 8
  %34 = load i16, i16* %33, align 4
  %35 = zext i16 %34 to i32
  switch i32 %35, label %44 [
    i32 8, label %36
    i32 16, label %40
  ]

; <label>:36:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PredictorSetupDecode, i64 0, i64 5)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PredictorSetupDecode, i64 0, i64 5)
  %38 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %39 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %38, i32 0, i32 3
  store void (%struct.tiff*, i8*, i32)* @horAcc8, void (%struct.tiff*, i8*, i32)** %39, align 8
  br label %44

; <label>:40:                                     ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PredictorSetupDecode, i64 0, i64 6)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PredictorSetupDecode, i64 0, i64 6)
  %42 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %43 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %42, i32 0, i32 3
  store void (%struct.tiff*, i8*, i32)* @horAcc16, void (%struct.tiff*, i8*, i32)** %43, align 8
  br label %44

; <label>:44:                                     ; preds = %40, %36, %31
  %45 = load %struct.tiff*, %struct.tiff** %3, align 8
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %45, i32 0, i32 26
  %47 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %46, align 8
  %48 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %49 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %48, i32 0, i32 4
  store i32 (%struct.tiff*, i8*, i32, i16)* %47, i32 (%struct.tiff*, i8*, i32, i16)** %49, align 8
  %50 = load %struct.tiff*, %struct.tiff** %3, align 8
  %51 = getelementptr inbounds %struct.tiff, %struct.tiff* %50, i32 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @PredictorDecodeRow, i32 (%struct.tiff*, i8*, i32, i16)** %51, align 8
  %52 = load %struct.tiff*, %struct.tiff** %3, align 8
  %53 = getelementptr inbounds %struct.tiff, %struct.tiff* %52, i32 0, i32 28
  %54 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %53, align 8
  %55 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %56 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %55, i32 0, i32 5
  store i32 (%struct.tiff*, i8*, i32, i16)* %54, i32 (%struct.tiff*, i8*, i32, i16)** %56, align 8
  %57 = load %struct.tiff*, %struct.tiff** %3, align 8
  %58 = getelementptr inbounds %struct.tiff, %struct.tiff* %57, i32 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @PredictorDecodeTile, i32 (%struct.tiff*, i8*, i32, i16)** %58, align 8
  %59 = load %struct.tiff*, %struct.tiff** %3, align 8
  %60 = getelementptr inbounds %struct.tiff, %struct.tiff* %59, i32 0, i32 30
  %61 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %60, align 8
  %62 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %63 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %62, i32 0, i32 6
  store i32 (%struct.tiff*, i8*, i32, i16)* %61, i32 (%struct.tiff*, i8*, i32, i16)** %63, align 8
  %64 = load %struct.tiff*, %struct.tiff** %3, align 8
  %65 = getelementptr inbounds %struct.tiff, %struct.tiff* %64, i32 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @PredictorDecodeTile, i32 (%struct.tiff*, i8*, i32, i16)** %65, align 8
  %66 = load %struct.tiff*, %struct.tiff** %3, align 8
  %67 = getelementptr inbounds %struct.tiff, %struct.tiff* %66, i32 0, i32 3
  %68 = load i32, i32* %67, align 8
  %69 = and i32 %68, 128
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %84

; <label>:71:                                     ; preds = %44
  %72 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %73 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %72, i32 0, i32 3
  %74 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %73, align 8
  %75 = icmp eq void (%struct.tiff*, i8*, i32)* %74, @horAcc16
  br i1 %75, label %76, label %82

; <label>:76:                                     ; preds = %71
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PredictorSetupDecode, i64 0, i64 7)
  %77 = add i64 %pgocount4, 1
  store i64 %77, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PredictorSetupDecode, i64 0, i64 7)
  %78 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %79 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %78, i32 0, i32 3
  store void (%struct.tiff*, i8*, i32)* @swabHorAcc16, void (%struct.tiff*, i8*, i32)** %79, align 8
  %80 = load %struct.tiff*, %struct.tiff** %3, align 8
  %81 = getelementptr inbounds %struct.tiff, %struct.tiff* %80, i32 0, i32 54
  store void (%struct.tiff*, i8*, i32)* @_TIFFNoPostDecode, void (%struct.tiff*, i8*, i32)** %81, align 8
  br label %82

; <label>:82:                                     ; preds = %76, %71
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PredictorSetupDecode, i64 0, i64 4)
  %83 = add i64 %pgocount5, 1
  store i64 %83, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PredictorSetupDecode, i64 0, i64 4)
  br label %84

; <label>:84:                                     ; preds = %82, %44
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PredictorSetupDecode, i64 0, i64 3)
  %85 = add i64 %pgocount6, 1
  store i64 %85, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PredictorSetupDecode, i64 0, i64 3)
  br label %86

; <label>:86:                                     ; preds = %84, %26
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PredictorSetupDecode, i64 0, i64 2)
  %87 = add i64 %pgocount7, 1
  store i64 %87, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PredictorSetupDecode, i64 0, i64 2)
  store i32 1, i32* %2, align 4
  br label %88

; <label>:88:                                     ; preds = %86, %24
  %89 = load i32, i32* %2, align 4
  ret i32 %89
}

; Function Attrs: nounwind uwtable
define internal i32 @PredictorSetupEncode(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFPredictorState*, align 8
  %5 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 37
  %8 = load i8*, i8** %7, align 8
  %9 = bitcast i8* %8 to %struct.TIFFPredictorState*
  store %struct.TIFFPredictorState* %9, %struct.TIFFPredictorState** %4, align 8
  %10 = load %struct.tiff*, %struct.tiff** %3, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 6
  store %struct.TIFFDirectory* %11, %struct.TIFFDirectory** %5, align 8
  %12 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %13 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %12, i32 0, i32 11
  %14 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %13, align 8
  %15 = load %struct.tiff*, %struct.tiff** %3, align 8
  %16 = ptrtoint i32 (%struct.tiff*)* %14 to i64
  call void @__llvm_profile_instrument_target(i64 %16, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorSetupEncode to i8*), i32 0)
  %17 = call i32 %14(%struct.tiff* %15)
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %24

; <label>:19:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorSetupEncode, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorSetupEncode, i64 0, i64 0)
  %21 = load %struct.tiff*, %struct.tiff** %3, align 8
  %22 = call i32 @PredictorSetup(%struct.tiff* %21)
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %26, label %24

; <label>:24:                                     ; preds = %19, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorSetupEncode, i64 0, i64 1)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorSetupEncode, i64 0, i64 1)
  store i32 0, i32* %2, align 4
  br label %69

; <label>:26:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorSetupEncode, i64 0, i64 2)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorSetupEncode, i64 0, i64 2)
  %28 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %29 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %28, i32 0, i32 0
  %30 = load i32, i32* %29, align 8
  %31 = icmp eq i32 %30, 2
  br i1 %31, label %32, label %68

; <label>:32:                                     ; preds = %26
  %33 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %34 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %33, i32 0, i32 8
  %35 = load i16, i16* %34, align 4
  %36 = zext i16 %35 to i32
  switch i32 %36, label %45 [
    i32 8, label %37
    i32 16, label %41
  ]

; <label>:37:                                     ; preds = %32
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorSetupEncode, i64 0, i64 4)
  %38 = add i64 %pgocount3, 1
  store i64 %38, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorSetupEncode, i64 0, i64 4)
  %39 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %40 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %39, i32 0, i32 3
  store void (%struct.tiff*, i8*, i32)* @horDiff8, void (%struct.tiff*, i8*, i32)** %40, align 8
  br label %45

; <label>:41:                                     ; preds = %32
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorSetupEncode, i64 0, i64 5)
  %42 = add i64 %pgocount4, 1
  store i64 %42, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorSetupEncode, i64 0, i64 5)
  %43 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %44 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %43, i32 0, i32 3
  store void (%struct.tiff*, i8*, i32)* @horDiff16, void (%struct.tiff*, i8*, i32)** %44, align 8
  br label %45

; <label>:45:                                     ; preds = %41, %37, %32
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorSetupEncode, i64 0, i64 3)
  %46 = add i64 %pgocount5, 1
  store i64 %46, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorSetupEncode, i64 0, i64 3)
  %47 = load %struct.tiff*, %struct.tiff** %3, align 8
  %48 = getelementptr inbounds %struct.tiff, %struct.tiff* %47, i32 0, i32 27
  %49 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %48, align 8
  %50 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %51 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %50, i32 0, i32 4
  store i32 (%struct.tiff*, i8*, i32, i16)* %49, i32 (%struct.tiff*, i8*, i32, i16)** %51, align 8
  %52 = load %struct.tiff*, %struct.tiff** %3, align 8
  %53 = getelementptr inbounds %struct.tiff, %struct.tiff* %52, i32 0, i32 27
  store i32 (%struct.tiff*, i8*, i32, i16)* @PredictorEncodeRow, i32 (%struct.tiff*, i8*, i32, i16)** %53, align 8
  %54 = load %struct.tiff*, %struct.tiff** %3, align 8
  %55 = getelementptr inbounds %struct.tiff, %struct.tiff* %54, i32 0, i32 29
  %56 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %55, align 8
  %57 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %58 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %57, i32 0, i32 5
  store i32 (%struct.tiff*, i8*, i32, i16)* %56, i32 (%struct.tiff*, i8*, i32, i16)** %58, align 8
  %59 = load %struct.tiff*, %struct.tiff** %3, align 8
  %60 = getelementptr inbounds %struct.tiff, %struct.tiff* %59, i32 0, i32 29
  store i32 (%struct.tiff*, i8*, i32, i16)* @PredictorEncodeTile, i32 (%struct.tiff*, i8*, i32, i16)** %60, align 8
  %61 = load %struct.tiff*, %struct.tiff** %3, align 8
  %62 = getelementptr inbounds %struct.tiff, %struct.tiff* %61, i32 0, i32 31
  %63 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %62, align 8
  %64 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %65 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %64, i32 0, i32 6
  store i32 (%struct.tiff*, i8*, i32, i16)* %63, i32 (%struct.tiff*, i8*, i32, i16)** %65, align 8
  %66 = load %struct.tiff*, %struct.tiff** %3, align 8
  %67 = getelementptr inbounds %struct.tiff, %struct.tiff* %66, i32 0, i32 31
  store i32 (%struct.tiff*, i8*, i32, i16)* @PredictorEncodeTile, i32 (%struct.tiff*, i8*, i32, i16)** %67, align 8
  br label %68

; <label>:68:                                     ; preds = %45, %26
  store i32 1, i32* %2, align 4
  br label %69

; <label>:69:                                     ; preds = %68, %24
  %70 = load i32, i32* %2, align 4
  ret i32 %70
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal i32 @PredictorSetup(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFPredictorState*, align 8
  %5 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 37
  %8 = load i8*, i8** %7, align 8
  %9 = bitcast i8* %8 to %struct.TIFFPredictorState*
  store %struct.TIFFPredictorState* %9, %struct.TIFFPredictorState** %4, align 8
  %10 = load %struct.tiff*, %struct.tiff** %3, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 6
  store %struct.TIFFDirectory* %11, %struct.TIFFDirectory** %5, align 8
  %12 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %13 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %12, i32 0, i32 0
  %14 = load i32, i32* %13, align 8
  %15 = icmp eq i32 %14, 1
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorSetup, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorSetup, i64 0, i64 0)
  store i32 1, i32* %2, align 4
  br label %88

; <label>:18:                                     ; preds = %1
  %19 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %20 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %19, i32 0, i32 0
  %21 = load i32, i32* %20, align 8
  %22 = icmp ne i32 %21, 2
  br i1 %22, label %23, label %31

; <label>:23:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorSetup, i64 0, i64 1)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorSetup, i64 0, i64 1)
  %25 = load %struct.tiff*, %struct.tiff** %3, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %25, i32 0, i32 0
  %27 = load i8*, i8** %26, align 8
  %28 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %29 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %28, i32 0, i32 0
  %30 = load i32, i32* %29, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %27, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5, i32 0, i32 0), i32 %30)
  store i32 0, i32* %2, align 4
  br label %88

; <label>:31:                                     ; preds = %18
  %32 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %33 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %32, i32 0, i32 8
  %34 = load i16, i16* %33, align 4
  %35 = zext i16 %34 to i32
  %36 = icmp ne i32 %35, 8
  br i1 %36, label %37, label %53

; <label>:37:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorSetup, i64 0, i64 2)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorSetup, i64 0, i64 2)
  %39 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %40 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %39, i32 0, i32 8
  %41 = load i16, i16* %40, align 4
  %42 = zext i16 %41 to i32
  %43 = icmp ne i32 %42, 16
  br i1 %43, label %44, label %53

; <label>:44:                                     ; preds = %37
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorSetup, i64 0, i64 6)
  %45 = add i64 %pgocount3, 1
  store i64 %45, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorSetup, i64 0, i64 6)
  %46 = load %struct.tiff*, %struct.tiff** %3, align 8
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %46, i32 0, i32 0
  %48 = load i8*, i8** %47, align 8
  %49 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %50 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %49, i32 0, i32 8
  %51 = load i16, i16* %50, align 4
  %52 = zext i16 %51 to i32
  call void (i8*, i8*, ...) @TIFFError(i8* %48, i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.6, i32 0, i32 0), i32 %52)
  store i32 0, i32* %2, align 4
  br label %88

; <label>:53:                                     ; preds = %37, %31
  %54 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %55 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %54, i32 0, i32 24
  %56 = load i16, i16* %55, align 2
  %57 = zext i16 %56 to i32
  %58 = icmp eq i32 %57, 1
  br i1 %58, label %59, label %64

; <label>:59:                                     ; preds = %53
  %60 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %61 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %60, i32 0, i32 15
  %62 = load i16, i16* %61, align 2
  %63 = zext i16 %62 to i32
  br label %66

; <label>:64:                                     ; preds = %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorSetup, i64 0, i64 3)
  %65 = add i64 %pgocount4, 1
  store i64 %65, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorSetup, i64 0, i64 3)
  br label %66

; <label>:66:                                     ; preds = %64, %59
  %67 = phi i32 [ %63, %59 ], [ 1, %64 ]
  %68 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %69 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %68, i32 0, i32 1
  store i32 %67, i32* %69, align 4
  %70 = load %struct.tiff*, %struct.tiff** %3, align 8
  %71 = getelementptr inbounds %struct.tiff, %struct.tiff* %70, i32 0, i32 3
  %72 = load i32, i32* %71, align 8
  %73 = and i32 %72, 1024
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %81

; <label>:75:                                     ; preds = %66
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorSetup, i64 0, i64 4)
  %76 = add i64 %pgocount5, 1
  store i64 %76, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorSetup, i64 0, i64 4)
  %77 = load %struct.tiff*, %struct.tiff** %3, align 8
  %78 = call i32 @TIFFTileRowSize(%struct.tiff* %77)
  %79 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %80 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %79, i32 0, i32 2
  store i32 %78, i32* %80, align 8
  br label %87

; <label>:81:                                     ; preds = %66
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorSetup, i64 0, i64 5)
  %82 = add i64 %pgocount6, 1
  store i64 %82, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorSetup, i64 0, i64 5)
  %83 = load %struct.tiff*, %struct.tiff** %3, align 8
  %84 = call i32 @TIFFScanlineSize(%struct.tiff* %83)
  %85 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %4, align 8
  %86 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %85, i32 0, i32 2
  store i32 %84, i32* %86, align 8
  br label %87

; <label>:87:                                     ; preds = %81, %75
  store i32 1, i32* %2, align 4
  br label %88

; <label>:88:                                     ; preds = %87, %44, %23, %16
  %89 = load i32, i32* %2, align 4
  ret i32 %89
}

; Function Attrs: nounwind uwtable
define internal void @horAcc8(%struct.tiff*, i8*, i32) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.TIFFPredictorState*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %18 = load %struct.tiff*, %struct.tiff** %4, align 8
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %18, i32 0, i32 37
  %20 = load i8*, i8** %19, align 8
  %21 = bitcast i8* %20 to %struct.TIFFPredictorState*
  store %struct.TIFFPredictorState* %21, %struct.TIFFPredictorState** %7, align 8
  %22 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %7, align 8
  %23 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %22, i32 0, i32 1
  %24 = load i32, i32* %23, align 4
  store i32 %24, i32* %8, align 4
  %25 = load i8*, i8** %5, align 8
  store i8* %25, i8** %9, align 8
  %26 = load i32, i32* %6, align 4
  %27 = load i32, i32* %8, align 4
  %28 = icmp sgt i32 %26, %27
  br i1 %28, label %29, label %255

; <label>:29:                                     ; preds = %3
  %30 = load i32, i32* %8, align 4
  %31 = load i32, i32* %6, align 4
  %32 = sub nsw i32 %31, %30
  store i32 %32, i32* %6, align 4
  %33 = load i32, i32* %8, align 4
  %34 = icmp eq i32 %33, 3
  br i1 %34, label %35, label %86

; <label>:35:                                     ; preds = %29
  %36 = load i8*, i8** %9, align 8
  %37 = getelementptr inbounds i8, i8* %36, i64 0
  %38 = load i8, i8* %37, align 1
  %39 = sext i8 %38 to i32
  store i32 %39, i32* %10, align 4
  %40 = load i8*, i8** %9, align 8
  %41 = getelementptr inbounds i8, i8* %40, i64 1
  %42 = load i8, i8* %41, align 1
  %43 = sext i8 %42 to i32
  store i32 %43, i32* %11, align 4
  %44 = load i8*, i8** %9, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 2
  %46 = load i8, i8* %45, align 1
  %47 = sext i8 %46 to i32
  store i32 %47, i32* %12, align 4
  br label %48

; <label>:48:                                     ; preds = %81, %35
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 1)
  %49 = add i64 %pgocount, 1
  store i64 %49, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 1)
  %50 = load i32, i32* %6, align 4
  %51 = sub nsw i32 %50, 3
  store i32 %51, i32* %6, align 4
  %52 = load i8*, i8** %9, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 3
  store i8* %53, i8** %9, align 8
  %54 = load i8*, i8** %9, align 8
  %55 = getelementptr inbounds i8, i8* %54, i64 0
  %56 = load i8, i8* %55, align 1
  %57 = sext i8 %56 to i32
  %58 = load i32, i32* %10, align 4
  %59 = add i32 %58, %57
  store i32 %59, i32* %10, align 4
  %60 = trunc i32 %59 to i8
  %61 = load i8*, i8** %9, align 8
  %62 = getelementptr inbounds i8, i8* %61, i64 0
  store i8 %60, i8* %62, align 1
  %63 = load i8*, i8** %9, align 8
  %64 = getelementptr inbounds i8, i8* %63, i64 1
  %65 = load i8, i8* %64, align 1
  %66 = sext i8 %65 to i32
  %67 = load i32, i32* %11, align 4
  %68 = add i32 %67, %66
  store i32 %68, i32* %11, align 4
  %69 = trunc i32 %68 to i8
  %70 = load i8*, i8** %9, align 8
  %71 = getelementptr inbounds i8, i8* %70, i64 1
  store i8 %69, i8* %71, align 1
  %72 = load i8*, i8** %9, align 8
  %73 = getelementptr inbounds i8, i8* %72, i64 2
  %74 = load i8, i8* %73, align 1
  %75 = sext i8 %74 to i32
  %76 = load i32, i32* %12, align 4
  %77 = add i32 %76, %75
  store i32 %77, i32* %12, align 4
  %78 = trunc i32 %77 to i8
  %79 = load i8*, i8** %9, align 8
  %80 = getelementptr inbounds i8, i8* %79, i64 2
  store i8 %78, i8* %80, align 1
  br label %81

; <label>:81:                                     ; preds = %48
  %82 = load i32, i32* %6, align 4
  %83 = icmp sgt i32 %82, 0
  br i1 %83, label %48, label %84

; <label>:84:                                     ; preds = %81
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 10)
  %85 = add i64 %pgocount1, 1
  store i64 %85, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 10)
  br label %254

; <label>:86:                                     ; preds = %29
  %87 = load i32, i32* %8, align 4
  %88 = icmp eq i32 %87, 4
  br i1 %88, label %89, label %153

; <label>:89:                                     ; preds = %86
  %90 = load i8*, i8** %9, align 8
  %91 = getelementptr inbounds i8, i8* %90, i64 0
  %92 = load i8, i8* %91, align 1
  %93 = sext i8 %92 to i32
  store i32 %93, i32* %13, align 4
  %94 = load i8*, i8** %9, align 8
  %95 = getelementptr inbounds i8, i8* %94, i64 1
  %96 = load i8, i8* %95, align 1
  %97 = sext i8 %96 to i32
  store i32 %97, i32* %14, align 4
  %98 = load i8*, i8** %9, align 8
  %99 = getelementptr inbounds i8, i8* %98, i64 2
  %100 = load i8, i8* %99, align 1
  %101 = sext i8 %100 to i32
  store i32 %101, i32* %15, align 4
  %102 = load i8*, i8** %9, align 8
  %103 = getelementptr inbounds i8, i8* %102, i64 3
  %104 = load i8, i8* %103, align 1
  %105 = sext i8 %104 to i32
  store i32 %105, i32* %16, align 4
  br label %106

; <label>:106:                                    ; preds = %148, %89
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 2)
  %107 = add i64 %pgocount2, 1
  store i64 %107, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 2)
  %108 = load i32, i32* %6, align 4
  %109 = sub nsw i32 %108, 4
  store i32 %109, i32* %6, align 4
  %110 = load i8*, i8** %9, align 8
  %111 = getelementptr inbounds i8, i8* %110, i64 4
  store i8* %111, i8** %9, align 8
  %112 = load i8*, i8** %9, align 8
  %113 = getelementptr inbounds i8, i8* %112, i64 0
  %114 = load i8, i8* %113, align 1
  %115 = sext i8 %114 to i32
  %116 = load i32, i32* %13, align 4
  %117 = add i32 %116, %115
  store i32 %117, i32* %13, align 4
  %118 = trunc i32 %117 to i8
  %119 = load i8*, i8** %9, align 8
  %120 = getelementptr inbounds i8, i8* %119, i64 0
  store i8 %118, i8* %120, align 1
  %121 = load i8*, i8** %9, align 8
  %122 = getelementptr inbounds i8, i8* %121, i64 1
  %123 = load i8, i8* %122, align 1
  %124 = sext i8 %123 to i32
  %125 = load i32, i32* %14, align 4
  %126 = add i32 %125, %124
  store i32 %126, i32* %14, align 4
  %127 = trunc i32 %126 to i8
  %128 = load i8*, i8** %9, align 8
  %129 = getelementptr inbounds i8, i8* %128, i64 1
  store i8 %127, i8* %129, align 1
  %130 = load i8*, i8** %9, align 8
  %131 = getelementptr inbounds i8, i8* %130, i64 2
  %132 = load i8, i8* %131, align 1
  %133 = sext i8 %132 to i32
  %134 = load i32, i32* %15, align 4
  %135 = add i32 %134, %133
  store i32 %135, i32* %15, align 4
  %136 = trunc i32 %135 to i8
  %137 = load i8*, i8** %9, align 8
  %138 = getelementptr inbounds i8, i8* %137, i64 2
  store i8 %136, i8* %138, align 1
  %139 = load i8*, i8** %9, align 8
  %140 = getelementptr inbounds i8, i8* %139, i64 3
  %141 = load i8, i8* %140, align 1
  %142 = sext i8 %141 to i32
  %143 = load i32, i32* %16, align 4
  %144 = add i32 %143, %142
  store i32 %144, i32* %16, align 4
  %145 = trunc i32 %144 to i8
  %146 = load i8*, i8** %9, align 8
  %147 = getelementptr inbounds i8, i8* %146, i64 3
  store i8 %145, i8* %147, align 1
  br label %148

; <label>:148:                                    ; preds = %106
  %149 = load i32, i32* %6, align 4
  %150 = icmp sgt i32 %149, 0
  br i1 %150, label %106, label %151

; <label>:151:                                    ; preds = %148
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 11)
  %152 = add i64 %pgocount3, 1
  store i64 %152, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 11)
  br label %253

; <label>:153:                                    ; preds = %86
  br label %154

; <label>:154:                                    ; preds = %248, %153
  %155 = load i32, i32* %8, align 4
  switch i32 %155, label %156 [
    i32 4, label %182
    i32 3, label %197
    i32 2, label %212
    i32 1, label %227
    i32 0, label %242
  ]

; <label>:156:                                    ; preds = %154
  %157 = load i32, i32* %8, align 4
  %158 = sub nsw i32 %157, 4
  store i32 %158, i32* %17, align 4
  br label %159

; <label>:159:                                    ; preds = %176, %156
  %160 = load i32, i32* %17, align 4
  %161 = icmp sgt i32 %160, 0
  br i1 %161, label %162, label %180

; <label>:162:                                    ; preds = %159
  %163 = load i8*, i8** %9, align 8
  %164 = load i8, i8* %163, align 1
  %165 = sext i8 %164 to i32
  %166 = load i8*, i8** %9, align 8
  %167 = load i32, i32* %8, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i8, i8* %166, i64 %168
  %170 = load i8, i8* %169, align 1
  %171 = sext i8 %170 to i32
  %172 = add nsw i32 %171, %165
  %173 = trunc i32 %172 to i8
  store i8 %173, i8* %169, align 1
  %174 = load i8*, i8** %9, align 8
  %175 = getelementptr inbounds i8, i8* %174, i32 1
  store i8* %175, i8** %9, align 8
  br label %176

; <label>:176:                                    ; preds = %162
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 0)
  %177 = add i64 %pgocount4, 1
  store i64 %177, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 0)
  %178 = load i32, i32* %17, align 4
  %179 = add nsw i32 %178, -1
  store i32 %179, i32* %17, align 4
  br label %159

; <label>:180:                                    ; preds = %159
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 9)
  %181 = add i64 %pgocount5, 1
  store i64 %181, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 9)
  br label %182

; <label>:182:                                    ; preds = %180, %154
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 7)
  %183 = add i64 %pgocount6, 1
  store i64 %183, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 7)
  %184 = load i8*, i8** %9, align 8
  %185 = load i8, i8* %184, align 1
  %186 = sext i8 %185 to i32
  %187 = load i8*, i8** %9, align 8
  %188 = load i32, i32* %8, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds i8, i8* %187, i64 %189
  %191 = load i8, i8* %190, align 1
  %192 = sext i8 %191 to i32
  %193 = add nsw i32 %192, %186
  %194 = trunc i32 %193 to i8
  store i8 %194, i8* %190, align 1
  %195 = load i8*, i8** %9, align 8
  %196 = getelementptr inbounds i8, i8* %195, i32 1
  store i8* %196, i8** %9, align 8
  br label %197

; <label>:197:                                    ; preds = %182, %154
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 6)
  %198 = add i64 %pgocount7, 1
  store i64 %198, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 6)
  %199 = load i8*, i8** %9, align 8
  %200 = load i8, i8* %199, align 1
  %201 = sext i8 %200 to i32
  %202 = load i8*, i8** %9, align 8
  %203 = load i32, i32* %8, align 4
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds i8, i8* %202, i64 %204
  %206 = load i8, i8* %205, align 1
  %207 = sext i8 %206 to i32
  %208 = add nsw i32 %207, %201
  %209 = trunc i32 %208 to i8
  store i8 %209, i8* %205, align 1
  %210 = load i8*, i8** %9, align 8
  %211 = getelementptr inbounds i8, i8* %210, i32 1
  store i8* %211, i8** %9, align 8
  br label %212

; <label>:212:                                    ; preds = %197, %154
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 5)
  %213 = add i64 %pgocount8, 1
  store i64 %213, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 5)
  %214 = load i8*, i8** %9, align 8
  %215 = load i8, i8* %214, align 1
  %216 = sext i8 %215 to i32
  %217 = load i8*, i8** %9, align 8
  %218 = load i32, i32* %8, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds i8, i8* %217, i64 %219
  %221 = load i8, i8* %220, align 1
  %222 = sext i8 %221 to i32
  %223 = add nsw i32 %222, %216
  %224 = trunc i32 %223 to i8
  store i8 %224, i8* %220, align 1
  %225 = load i8*, i8** %9, align 8
  %226 = getelementptr inbounds i8, i8* %225, i32 1
  store i8* %226, i8** %9, align 8
  br label %227

; <label>:227:                                    ; preds = %212, %154
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 4)
  %228 = add i64 %pgocount9, 1
  store i64 %228, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 4)
  %229 = load i8*, i8** %9, align 8
  %230 = load i8, i8* %229, align 1
  %231 = sext i8 %230 to i32
  %232 = load i8*, i8** %9, align 8
  %233 = load i32, i32* %8, align 4
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds i8, i8* %232, i64 %234
  %236 = load i8, i8* %235, align 1
  %237 = sext i8 %236 to i32
  %238 = add nsw i32 %237, %231
  %239 = trunc i32 %238 to i8
  store i8 %239, i8* %235, align 1
  %240 = load i8*, i8** %9, align 8
  %241 = getelementptr inbounds i8, i8* %240, i32 1
  store i8* %241, i8** %9, align 8
  br label %242

; <label>:242:                                    ; preds = %227, %154
  br label %243

; <label>:243:                                    ; preds = %242
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 3)
  %244 = add i64 %pgocount10, 1
  store i64 %244, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 3)
  %245 = load i32, i32* %8, align 4
  %246 = load i32, i32* %6, align 4
  %247 = sub nsw i32 %246, %245
  store i32 %247, i32* %6, align 4
  br label %248

; <label>:248:                                    ; preds = %243
  %249 = load i32, i32* %6, align 4
  %250 = icmp sgt i32 %249, 0
  br i1 %250, label %154, label %251

; <label>:251:                                    ; preds = %248
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 12)
  %252 = add i64 %pgocount11, 1
  store i64 %252, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 12)
  br label %253

; <label>:253:                                    ; preds = %251, %151
  br label %254

; <label>:254:                                    ; preds = %253, %84
  br label %255

; <label>:255:                                    ; preds = %254, %3
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 8)
  %256 = add i64 %pgocount12, 1
  store i64 %256, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horAcc8, i64 0, i64 8)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @horAcc16(%struct.tiff*, i8*, i32) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i16*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %11 = load %struct.tiff*, %struct.tiff** %4, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 37
  %13 = load i8*, i8** %12, align 8
  %14 = bitcast i8* %13 to %struct.TIFFPredictorState*
  %15 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %14, i32 0, i32 1
  %16 = load i32, i32* %15, align 4
  store i32 %16, i32* %7, align 4
  %17 = load i8*, i8** %5, align 8
  %18 = bitcast i8* %17 to i16*
  store i16* %18, i16** %8, align 8
  %19 = load i32, i32* %6, align 4
  %20 = sdiv i32 %19, 2
  store i32 %20, i32* %9, align 4
  %21 = load i32, i32* %9, align 4
  %22 = load i32, i32* %7, align 4
  %23 = icmp sgt i32 %21, %22
  br i1 %23, label %24, label %132

; <label>:24:                                     ; preds = %3
  %25 = load i32, i32* %7, align 4
  %26 = load i32, i32* %9, align 4
  %27 = sub nsw i32 %26, %25
  store i32 %27, i32* %9, align 4
  br label %28

; <label>:28:                                     ; preds = %127, %24
  %29 = load i32, i32* %7, align 4
  switch i32 %29, label %30 [
    i32 4, label %57
    i32 3, label %73
    i32 2, label %89
    i32 1, label %105
    i32 0, label %121
  ]

; <label>:30:                                     ; preds = %28
  %31 = load i32, i32* %7, align 4
  %32 = sub nsw i32 %31, 4
  store i32 %32, i32* %10, align 4
  br label %33

; <label>:33:                                     ; preds = %51, %30
  %34 = load i32, i32* %10, align 4
  %35 = icmp sgt i32 %34, 0
  br i1 %35, label %36, label %55

; <label>:36:                                     ; preds = %33
  %37 = load i16*, i16** %8, align 8
  %38 = getelementptr inbounds i16, i16* %37, i64 0
  %39 = load i16, i16* %38, align 2
  %40 = zext i16 %39 to i32
  %41 = load i16*, i16** %8, align 8
  %42 = load i32, i32* %7, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i16, i16* %41, i64 %43
  %45 = load i16, i16* %44, align 2
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %46, %40
  %48 = trunc i32 %47 to i16
  store i16 %48, i16* %44, align 2
  %49 = load i16*, i16** %8, align 8
  %50 = getelementptr inbounds i16, i16* %49, i32 1
  store i16* %50, i16** %8, align 8
  br label %51

; <label>:51:                                     ; preds = %36
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 0)
  %52 = add i64 %pgocount, 1
  store i64 %52, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 0)
  %53 = load i32, i32* %10, align 4
  %54 = add nsw i32 %53, -1
  store i32 %54, i32* %10, align 4
  br label %33

; <label>:55:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 6)
  %56 = add i64 %pgocount1, 1
  store i64 %56, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 6)
  br label %57

; <label>:57:                                     ; preds = %55, %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 5)
  %58 = add i64 %pgocount2, 1
  store i64 %58, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 5)
  %59 = load i16*, i16** %8, align 8
  %60 = getelementptr inbounds i16, i16* %59, i64 0
  %61 = load i16, i16* %60, align 2
  %62 = zext i16 %61 to i32
  %63 = load i16*, i16** %8, align 8
  %64 = load i32, i32* %7, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i16, i16* %63, i64 %65
  %67 = load i16, i16* %66, align 2
  %68 = zext i16 %67 to i32
  %69 = add nsw i32 %68, %62
  %70 = trunc i32 %69 to i16
  store i16 %70, i16* %66, align 2
  %71 = load i16*, i16** %8, align 8
  %72 = getelementptr inbounds i16, i16* %71, i32 1
  store i16* %72, i16** %8, align 8
  br label %73

; <label>:73:                                     ; preds = %57, %28
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 4)
  %74 = add i64 %pgocount3, 1
  store i64 %74, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 4)
  %75 = load i16*, i16** %8, align 8
  %76 = getelementptr inbounds i16, i16* %75, i64 0
  %77 = load i16, i16* %76, align 2
  %78 = zext i16 %77 to i32
  %79 = load i16*, i16** %8, align 8
  %80 = load i32, i32* %7, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i16, i16* %79, i64 %81
  %83 = load i16, i16* %82, align 2
  %84 = zext i16 %83 to i32
  %85 = add nsw i32 %84, %78
  %86 = trunc i32 %85 to i16
  store i16 %86, i16* %82, align 2
  %87 = load i16*, i16** %8, align 8
  %88 = getelementptr inbounds i16, i16* %87, i32 1
  store i16* %88, i16** %8, align 8
  br label %89

; <label>:89:                                     ; preds = %73, %28
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 3)
  %90 = add i64 %pgocount4, 1
  store i64 %90, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 3)
  %91 = load i16*, i16** %8, align 8
  %92 = getelementptr inbounds i16, i16* %91, i64 0
  %93 = load i16, i16* %92, align 2
  %94 = zext i16 %93 to i32
  %95 = load i16*, i16** %8, align 8
  %96 = load i32, i32* %7, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i16, i16* %95, i64 %97
  %99 = load i16, i16* %98, align 2
  %100 = zext i16 %99 to i32
  %101 = add nsw i32 %100, %94
  %102 = trunc i32 %101 to i16
  store i16 %102, i16* %98, align 2
  %103 = load i16*, i16** %8, align 8
  %104 = getelementptr inbounds i16, i16* %103, i32 1
  store i16* %104, i16** %8, align 8
  br label %105

; <label>:105:                                    ; preds = %89, %28
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 2)
  %106 = add i64 %pgocount5, 1
  store i64 %106, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 2)
  %107 = load i16*, i16** %8, align 8
  %108 = getelementptr inbounds i16, i16* %107, i64 0
  %109 = load i16, i16* %108, align 2
  %110 = zext i16 %109 to i32
  %111 = load i16*, i16** %8, align 8
  %112 = load i32, i32* %7, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i16, i16* %111, i64 %113
  %115 = load i16, i16* %114, align 2
  %116 = zext i16 %115 to i32
  %117 = add nsw i32 %116, %110
  %118 = trunc i32 %117 to i16
  store i16 %118, i16* %114, align 2
  %119 = load i16*, i16** %8, align 8
  %120 = getelementptr inbounds i16, i16* %119, i32 1
  store i16* %120, i16** %8, align 8
  br label %121

; <label>:121:                                    ; preds = %105, %28
  br label %122

; <label>:122:                                    ; preds = %121
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 1)
  %123 = add i64 %pgocount6, 1
  store i64 %123, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 1)
  %124 = load i32, i32* %7, align 4
  %125 = load i32, i32* %9, align 4
  %126 = sub nsw i32 %125, %124
  store i32 %126, i32* %9, align 4
  br label %127

; <label>:127:                                    ; preds = %122
  %128 = load i32, i32* %9, align 4
  %129 = icmp sgt i32 %128, 0
  br i1 %129, label %28, label %130

; <label>:130:                                    ; preds = %127
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 8)
  %131 = add i64 %pgocount7, 1
  store i64 %131, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 8)
  br label %132

; <label>:132:                                    ; preds = %130, %3
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 7)
  %133 = add i64 %pgocount8, 1
  store i64 %133, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horAcc16, i64 0, i64 7)
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @PredictorDecodeRow(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca %struct.TIFFPredictorState*, align 8
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %11 = load %struct.tiff*, %struct.tiff** %6, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 37
  %13 = load i8*, i8** %12, align 8
  %14 = bitcast i8* %13 to %struct.TIFFPredictorState*
  store %struct.TIFFPredictorState* %14, %struct.TIFFPredictorState** %10, align 8
  %15 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %10, align 8
  %16 = icmp ne %struct.TIFFPredictorState* %15, null
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %4
  br label %21

; <label>:18:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorDecodeRow, i64 0, i64 2)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorDecodeRow, i64 0, i64 2)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0), i32 244, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.PredictorDecodeRow, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %21

; <label>:21:                                     ; preds = %20, %17
  %22 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %10, align 8
  %23 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %22, i32 0, i32 4
  %24 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %23, align 8
  %25 = icmp ne i32 (%struct.tiff*, i8*, i32, i16)* %24, null
  br i1 %25, label %26, label %27

; <label>:26:                                     ; preds = %21
  br label %30

; <label>:27:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorDecodeRow, i64 0, i64 3)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorDecodeRow, i64 0, i64 3)
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0), i32 245, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.PredictorDecodeRow, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %30

; <label>:30:                                     ; preds = %29, %26
  %31 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %10, align 8
  %32 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %31, i32 0, i32 3
  %33 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %32, align 8
  %34 = icmp ne void (%struct.tiff*, i8*, i32)* %33, null
  br i1 %34, label %35, label %36

; <label>:35:                                     ; preds = %30
  br label %39

; <label>:36:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorDecodeRow, i64 0, i64 4)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorDecodeRow, i64 0, i64 4)
  call void @__assert_fail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0), i32 246, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.PredictorDecodeRow, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %39

; <label>:39:                                     ; preds = %38, %35
  %40 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %10, align 8
  %41 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %40, i32 0, i32 4
  %42 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %41, align 8
  %43 = load %struct.tiff*, %struct.tiff** %6, align 8
  %44 = load i8*, i8** %7, align 8
  %45 = load i32, i32* %8, align 4
  %46 = load i16, i16* %9, align 2
  %47 = ptrtoint i32 (%struct.tiff*, i8*, i32, i16)* %42 to i64
  call void @__llvm_profile_instrument_target(i64 %47, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorDecodeRow to i8*), i32 0)
  %48 = call i32 %42(%struct.tiff* %43, i8* %44, i32 %45, i16 zeroext %46)
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %59

; <label>:50:                                     ; preds = %39
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorDecodeRow, i64 0, i64 0)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorDecodeRow, i64 0, i64 0)
  %52 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %10, align 8
  %53 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %52, i32 0, i32 3
  %54 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %53, align 8
  %55 = load %struct.tiff*, %struct.tiff** %6, align 8
  %56 = load i8*, i8** %7, align 8
  %57 = load i32, i32* %8, align 4
  %58 = ptrtoint void (%struct.tiff*, i8*, i32)* %54 to i64
  call void @__llvm_profile_instrument_target(i64 %58, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorDecodeRow to i8*), i32 1)
  call void %54(%struct.tiff* %55, i8* %56, i32 %57)
  store i32 1, i32* %5, align 4
  br label %61

; <label>:59:                                     ; preds = %39
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorDecodeRow, i64 0, i64 1)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_PredictorDecodeRow, i64 0, i64 1)
  store i32 0, i32* %5, align 4
  br label %61

; <label>:61:                                     ; preds = %59, %50
  %62 = load i32, i32* %5, align 4
  ret i32 %62
}

; Function Attrs: nounwind uwtable
define internal i32 @PredictorDecodeTile(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca %struct.TIFFPredictorState*, align 8
  %11 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %12 = load %struct.tiff*, %struct.tiff** %6, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 37
  %14 = load i8*, i8** %13, align 8
  %15 = bitcast i8* %14 to %struct.TIFFPredictorState*
  store %struct.TIFFPredictorState* %15, %struct.TIFFPredictorState** %10, align 8
  %16 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %10, align 8
  %17 = icmp ne %struct.TIFFPredictorState* %16, null
  br i1 %17, label %18, label %19

; <label>:18:                                     ; preds = %4
  br label %22

; <label>:19:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorDecodeTile, i64 0, i64 3)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorDecodeTile, i64 0, i64 3)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0), i32 266, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PredictorDecodeTile, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %22

; <label>:22:                                     ; preds = %21, %18
  %23 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %10, align 8
  %24 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %23, i32 0, i32 6
  %25 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %24, align 8
  %26 = icmp ne i32 (%struct.tiff*, i8*, i32, i16)* %25, null
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %22
  br label %31

; <label>:28:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorDecodeTile, i64 0, i64 4)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorDecodeTile, i64 0, i64 4)
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0), i32 267, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PredictorDecodeTile, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %31

; <label>:31:                                     ; preds = %30, %27
  %32 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %10, align 8
  %33 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %32, i32 0, i32 6
  %34 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %33, align 8
  %35 = load %struct.tiff*, %struct.tiff** %6, align 8
  %36 = load i8*, i8** %7, align 8
  %37 = load i32, i32* %8, align 4
  %38 = load i16, i16* %9, align 2
  %39 = ptrtoint i32 (%struct.tiff*, i8*, i32, i16)* %34 to i64
  call void @__llvm_profile_instrument_target(i64 %39, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorDecodeTile to i8*), i32 0)
  %40 = call i32 %34(%struct.tiff* %35, i8* %36, i32 %37, i16 zeroext %38)
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %84

; <label>:42:                                     ; preds = %31
  %43 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %10, align 8
  %44 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %43, i32 0, i32 2
  %45 = load i32, i32* %44, align 8
  store i32 %45, i32* %11, align 4
  %46 = load i32, i32* %11, align 4
  %47 = icmp sgt i32 %46, 0
  br i1 %47, label %48, label %49

; <label>:48:                                     ; preds = %42
  br label %52

; <label>:49:                                     ; preds = %42
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorDecodeTile, i64 0, i64 5)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorDecodeTile, i64 0, i64 5)
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0), i32 270, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PredictorDecodeTile, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %52

; <label>:52:                                     ; preds = %51, %48
  %53 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %10, align 8
  %54 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %53, i32 0, i32 3
  %55 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %54, align 8
  %56 = icmp ne void (%struct.tiff*, i8*, i32)* %55, null
  br i1 %56, label %57, label %58

; <label>:57:                                     ; preds = %52
  br label %61

; <label>:58:                                     ; preds = %52
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorDecodeTile, i64 0, i64 6)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorDecodeTile, i64 0, i64 6)
  call void @__assert_fail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0), i32 271, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PredictorDecodeTile, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %61

; <label>:61:                                     ; preds = %60, %57
  br label %62

; <label>:62:                                     ; preds = %66, %61
  %63 = load i32, i32* %8, align 4
  %64 = sext i32 %63 to i64
  %65 = icmp sgt i64 %64, 0
  br i1 %65, label %66, label %82

; <label>:66:                                     ; preds = %62
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorDecodeTile, i64 0, i64 0)
  %67 = add i64 %pgocount4, 1
  store i64 %67, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorDecodeTile, i64 0, i64 0)
  %68 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %10, align 8
  %69 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %68, i32 0, i32 3
  %70 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %69, align 8
  %71 = load %struct.tiff*, %struct.tiff** %6, align 8
  %72 = load i8*, i8** %7, align 8
  %73 = load i32, i32* %11, align 4
  %74 = ptrtoint void (%struct.tiff*, i8*, i32)* %70 to i64
  call void @__llvm_profile_instrument_target(i64 %74, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorDecodeTile to i8*), i32 1)
  call void %70(%struct.tiff* %71, i8* %72, i32 %73)
  %75 = load i32, i32* %11, align 4
  %76 = load i32, i32* %8, align 4
  %77 = sub nsw i32 %76, %75
  store i32 %77, i32* %8, align 4
  %78 = load i32, i32* %11, align 4
  %79 = load i8*, i8** %7, align 8
  %80 = sext i32 %78 to i64
  %81 = getelementptr inbounds i8, i8* %79, i64 %80
  store i8* %81, i8** %7, align 8
  br label %62

; <label>:82:                                     ; preds = %62
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorDecodeTile, i64 0, i64 1)
  %83 = add i64 %pgocount5, 1
  store i64 %83, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorDecodeTile, i64 0, i64 1)
  store i32 1, i32* %5, align 4
  br label %86

; <label>:84:                                     ; preds = %31
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorDecodeTile, i64 0, i64 2)
  %85 = add i64 %pgocount6, 1
  store i64 %85, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_PredictorDecodeTile, i64 0, i64 2)
  store i32 0, i32* %5, align 4
  br label %86

; <label>:86:                                     ; preds = %84, %82
  %87 = load i32, i32* %5, align 4
  ret i32 %87
}

; Function Attrs: nounwind uwtable
define internal void @swabHorAcc16(%struct.tiff*, i8*, i32) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.TIFFPredictorState*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %12 = load %struct.tiff*, %struct.tiff** %4, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 37
  %14 = load i8*, i8** %13, align 8
  %15 = bitcast i8* %14 to %struct.TIFFPredictorState*
  store %struct.TIFFPredictorState* %15, %struct.TIFFPredictorState** %7, align 8
  %16 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %7, align 8
  %17 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %16, i32 0, i32 1
  %18 = load i32, i32* %17, align 4
  store i32 %18, i32* %8, align 4
  %19 = load i8*, i8** %5, align 8
  %20 = bitcast i8* %19 to i16*
  store i16* %20, i16** %9, align 8
  %21 = load i32, i32* %6, align 4
  %22 = sdiv i32 %21, 2
  store i32 %22, i32* %10, align 4
  %23 = load i32, i32* %10, align 4
  %24 = load i32, i32* %8, align 4
  %25 = icmp sgt i32 %23, %24
  br i1 %25, label %26, label %137

; <label>:26:                                     ; preds = %3
  %27 = load i16*, i16** %9, align 8
  %28 = load i32, i32* %10, align 4
  %29 = sext i32 %28 to i64
  call void @TIFFSwabArrayOfShort(i16* %27, i64 %29)
  %30 = load i32, i32* %8, align 4
  %31 = load i32, i32* %10, align 4
  %32 = sub nsw i32 %31, %30
  store i32 %32, i32* %10, align 4
  br label %33

; <label>:33:                                     ; preds = %132, %26
  %34 = load i32, i32* %8, align 4
  switch i32 %34, label %35 [
    i32 4, label %62
    i32 3, label %78
    i32 2, label %94
    i32 1, label %110
    i32 0, label %126
  ]

; <label>:35:                                     ; preds = %33
  %36 = load i32, i32* %8, align 4
  %37 = sub nsw i32 %36, 4
  store i32 %37, i32* %11, align 4
  br label %38

; <label>:38:                                     ; preds = %56, %35
  %39 = load i32, i32* %11, align 4
  %40 = icmp sgt i32 %39, 0
  br i1 %40, label %41, label %60

; <label>:41:                                     ; preds = %38
  %42 = load i16*, i16** %9, align 8
  %43 = getelementptr inbounds i16, i16* %42, i64 0
  %44 = load i16, i16* %43, align 2
  %45 = zext i16 %44 to i32
  %46 = load i16*, i16** %9, align 8
  %47 = load i32, i32* %8, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i16, i16* %46, i64 %48
  %50 = load i16, i16* %49, align 2
  %51 = zext i16 %50 to i32
  %52 = add nsw i32 %51, %45
  %53 = trunc i32 %52 to i16
  store i16 %53, i16* %49, align 2
  %54 = load i16*, i16** %9, align 8
  %55 = getelementptr inbounds i16, i16* %54, i32 1
  store i16* %55, i16** %9, align 8
  br label %56

; <label>:56:                                     ; preds = %41
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 0)
  %57 = add i64 %pgocount, 1
  store i64 %57, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 0)
  %58 = load i32, i32* %11, align 4
  %59 = add nsw i32 %58, -1
  store i32 %59, i32* %11, align 4
  br label %38

; <label>:60:                                     ; preds = %38
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 6)
  %61 = add i64 %pgocount1, 1
  store i64 %61, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 6)
  br label %62

; <label>:62:                                     ; preds = %60, %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 5)
  %63 = add i64 %pgocount2, 1
  store i64 %63, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 5)
  %64 = load i16*, i16** %9, align 8
  %65 = getelementptr inbounds i16, i16* %64, i64 0
  %66 = load i16, i16* %65, align 2
  %67 = zext i16 %66 to i32
  %68 = load i16*, i16** %9, align 8
  %69 = load i32, i32* %8, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i16, i16* %68, i64 %70
  %72 = load i16, i16* %71, align 2
  %73 = zext i16 %72 to i32
  %74 = add nsw i32 %73, %67
  %75 = trunc i32 %74 to i16
  store i16 %75, i16* %71, align 2
  %76 = load i16*, i16** %9, align 8
  %77 = getelementptr inbounds i16, i16* %76, i32 1
  store i16* %77, i16** %9, align 8
  br label %78

; <label>:78:                                     ; preds = %62, %33
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 4)
  %79 = add i64 %pgocount3, 1
  store i64 %79, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 4)
  %80 = load i16*, i16** %9, align 8
  %81 = getelementptr inbounds i16, i16* %80, i64 0
  %82 = load i16, i16* %81, align 2
  %83 = zext i16 %82 to i32
  %84 = load i16*, i16** %9, align 8
  %85 = load i32, i32* %8, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i16, i16* %84, i64 %86
  %88 = load i16, i16* %87, align 2
  %89 = zext i16 %88 to i32
  %90 = add nsw i32 %89, %83
  %91 = trunc i32 %90 to i16
  store i16 %91, i16* %87, align 2
  %92 = load i16*, i16** %9, align 8
  %93 = getelementptr inbounds i16, i16* %92, i32 1
  store i16* %93, i16** %9, align 8
  br label %94

; <label>:94:                                     ; preds = %78, %33
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 3)
  %95 = add i64 %pgocount4, 1
  store i64 %95, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 3)
  %96 = load i16*, i16** %9, align 8
  %97 = getelementptr inbounds i16, i16* %96, i64 0
  %98 = load i16, i16* %97, align 2
  %99 = zext i16 %98 to i32
  %100 = load i16*, i16** %9, align 8
  %101 = load i32, i32* %8, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i16, i16* %100, i64 %102
  %104 = load i16, i16* %103, align 2
  %105 = zext i16 %104 to i32
  %106 = add nsw i32 %105, %99
  %107 = trunc i32 %106 to i16
  store i16 %107, i16* %103, align 2
  %108 = load i16*, i16** %9, align 8
  %109 = getelementptr inbounds i16, i16* %108, i32 1
  store i16* %109, i16** %9, align 8
  br label %110

; <label>:110:                                    ; preds = %94, %33
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 2)
  %111 = add i64 %pgocount5, 1
  store i64 %111, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 2)
  %112 = load i16*, i16** %9, align 8
  %113 = getelementptr inbounds i16, i16* %112, i64 0
  %114 = load i16, i16* %113, align 2
  %115 = zext i16 %114 to i32
  %116 = load i16*, i16** %9, align 8
  %117 = load i32, i32* %8, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i16, i16* %116, i64 %118
  %120 = load i16, i16* %119, align 2
  %121 = zext i16 %120 to i32
  %122 = add nsw i32 %121, %115
  %123 = trunc i32 %122 to i16
  store i16 %123, i16* %119, align 2
  %124 = load i16*, i16** %9, align 8
  %125 = getelementptr inbounds i16, i16* %124, i32 1
  store i16* %125, i16** %9, align 8
  br label %126

; <label>:126:                                    ; preds = %110, %33
  br label %127

; <label>:127:                                    ; preds = %126
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 1)
  %128 = add i64 %pgocount6, 1
  store i64 %128, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 1)
  %129 = load i32, i32* %8, align 4
  %130 = load i32, i32* %10, align 4
  %131 = sub nsw i32 %130, %129
  store i32 %131, i32* %10, align 4
  br label %132

; <label>:132:                                    ; preds = %127
  %133 = load i32, i32* %10, align 4
  %134 = icmp sgt i32 %133, 0
  br i1 %134, label %33, label %135

; <label>:135:                                    ; preds = %132
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 8)
  %136 = add i64 %pgocount7, 1
  store i64 %136, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 8)
  br label %137

; <label>:137:                                    ; preds = %135, %3
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 7)
  %138 = add i64 %pgocount8, 1
  store i64 %138, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_swabHorAcc16, i64 0, i64 7)
  ret void
}

declare void @_TIFFNoPostDecode(%struct.tiff*, i8*, i32) #1

declare void @TIFFError(i8*, i8*, ...) #1

declare i32 @TIFFTileRowSize(%struct.tiff*) #1

declare i32 @TIFFScanlineSize(%struct.tiff*) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

declare void @TIFFSwabArrayOfShort(i16*, i64) #1

; Function Attrs: nounwind uwtable
define internal void @horDiff8(%struct.tiff*, i8*, i32) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.TIFFPredictorState*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %25 = load %struct.tiff*, %struct.tiff** %4, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %25, i32 0, i32 37
  %27 = load i8*, i8** %26, align 8
  %28 = bitcast i8* %27 to %struct.TIFFPredictorState*
  store %struct.TIFFPredictorState* %28, %struct.TIFFPredictorState** %7, align 8
  %29 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %7, align 8
  %30 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %29, i32 0, i32 1
  %31 = load i32, i32* %30, align 4
  store i32 %31, i32* %8, align 4
  %32 = load i8*, i8** %5, align 8
  store i8* %32, i8** %9, align 8
  %33 = load i32, i32* %6, align 4
  %34 = load i32, i32* %8, align 4
  %35 = icmp sgt i32 %33, %34
  br i1 %35, label %36, label %283

; <label>:36:                                     ; preds = %3
  %37 = load i32, i32* %8, align 4
  %38 = load i32, i32* %6, align 4
  %39 = sub nsw i32 %38, %37
  store i32 %39, i32* %6, align 4
  %40 = load i32, i32* %8, align 4
  %41 = icmp eq i32 %40, 3
  br i1 %41, label %42, label %98

; <label>:42:                                     ; preds = %36
  %43 = load i8*, i8** %9, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 0
  %45 = load i8, i8* %44, align 1
  %46 = sext i8 %45 to i32
  store i32 %46, i32* %13, align 4
  %47 = load i8*, i8** %9, align 8
  %48 = getelementptr inbounds i8, i8* %47, i64 1
  %49 = load i8, i8* %48, align 1
  %50 = sext i8 %49 to i32
  store i32 %50, i32* %14, align 4
  %51 = load i8*, i8** %9, align 8
  %52 = getelementptr inbounds i8, i8* %51, i64 2
  %53 = load i8, i8* %52, align 1
  %54 = sext i8 %53 to i32
  store i32 %54, i32* %15, align 4
  br label %55

; <label>:55:                                     ; preds = %92, %42
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 1)
  %56 = add i64 %pgocount, 1
  store i64 %56, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 1)
  %57 = load i8*, i8** %9, align 8
  %58 = getelementptr inbounds i8, i8* %57, i64 3
  %59 = load i8, i8* %58, align 1
  %60 = sext i8 %59 to i32
  store i32 %60, i32* %10, align 4
  %61 = load i32, i32* %10, align 4
  %62 = load i32, i32* %13, align 4
  %63 = sub nsw i32 %61, %62
  %64 = trunc i32 %63 to i8
  %65 = load i8*, i8** %9, align 8
  %66 = getelementptr inbounds i8, i8* %65, i64 3
  store i8 %64, i8* %66, align 1
  %67 = load i32, i32* %10, align 4
  store i32 %67, i32* %13, align 4
  %68 = load i8*, i8** %9, align 8
  %69 = getelementptr inbounds i8, i8* %68, i64 4
  %70 = load i8, i8* %69, align 1
  %71 = sext i8 %70 to i32
  store i32 %71, i32* %11, align 4
  %72 = load i32, i32* %11, align 4
  %73 = load i32, i32* %14, align 4
  %74 = sub nsw i32 %72, %73
  %75 = trunc i32 %74 to i8
  %76 = load i8*, i8** %9, align 8
  %77 = getelementptr inbounds i8, i8* %76, i64 4
  store i8 %75, i8* %77, align 1
  %78 = load i32, i32* %11, align 4
  store i32 %78, i32* %14, align 4
  %79 = load i8*, i8** %9, align 8
  %80 = getelementptr inbounds i8, i8* %79, i64 5
  %81 = load i8, i8* %80, align 1
  %82 = sext i8 %81 to i32
  store i32 %82, i32* %12, align 4
  %83 = load i32, i32* %12, align 4
  %84 = load i32, i32* %15, align 4
  %85 = sub nsw i32 %83, %84
  %86 = trunc i32 %85 to i8
  %87 = load i8*, i8** %9, align 8
  %88 = getelementptr inbounds i8, i8* %87, i64 5
  store i8 %86, i8* %88, align 1
  %89 = load i32, i32* %12, align 4
  store i32 %89, i32* %15, align 4
  %90 = load i8*, i8** %9, align 8
  %91 = getelementptr inbounds i8, i8* %90, i64 3
  store i8* %91, i8** %9, align 8
  br label %92

; <label>:92:                                     ; preds = %55
  %93 = load i32, i32* %6, align 4
  %94 = sub nsw i32 %93, 3
  store i32 %94, i32* %6, align 4
  %95 = icmp sgt i32 %94, 0
  br i1 %95, label %55, label %96

; <label>:96:                                     ; preds = %92
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 10)
  %97 = add i64 %pgocount1, 1
  store i64 %97, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 10)
  br label %282

; <label>:98:                                     ; preds = %36
  %99 = load i32, i32* %8, align 4
  %100 = icmp eq i32 %99, 4
  br i1 %100, label %101, label %172

; <label>:101:                                    ; preds = %98
  %102 = load i8*, i8** %9, align 8
  %103 = getelementptr inbounds i8, i8* %102, i64 0
  %104 = load i8, i8* %103, align 1
  %105 = sext i8 %104 to i32
  store i32 %105, i32* %20, align 4
  %106 = load i8*, i8** %9, align 8
  %107 = getelementptr inbounds i8, i8* %106, i64 1
  %108 = load i8, i8* %107, align 1
  %109 = sext i8 %108 to i32
  store i32 %109, i32* %21, align 4
  %110 = load i8*, i8** %9, align 8
  %111 = getelementptr inbounds i8, i8* %110, i64 2
  %112 = load i8, i8* %111, align 1
  %113 = sext i8 %112 to i32
  store i32 %113, i32* %22, align 4
  %114 = load i8*, i8** %9, align 8
  %115 = getelementptr inbounds i8, i8* %114, i64 3
  %116 = load i8, i8* %115, align 1
  %117 = sext i8 %116 to i32
  store i32 %117, i32* %23, align 4
  br label %118

; <label>:118:                                    ; preds = %166, %101
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 2)
  %119 = add i64 %pgocount2, 1
  store i64 %119, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 2)
  %120 = load i8*, i8** %9, align 8
  %121 = getelementptr inbounds i8, i8* %120, i64 4
  %122 = load i8, i8* %121, align 1
  %123 = sext i8 %122 to i32
  store i32 %123, i32* %16, align 4
  %124 = load i32, i32* %16, align 4
  %125 = load i32, i32* %20, align 4
  %126 = sub nsw i32 %124, %125
  %127 = trunc i32 %126 to i8
  %128 = load i8*, i8** %9, align 8
  %129 = getelementptr inbounds i8, i8* %128, i64 4
  store i8 %127, i8* %129, align 1
  %130 = load i32, i32* %16, align 4
  store i32 %130, i32* %20, align 4
  %131 = load i8*, i8** %9, align 8
  %132 = getelementptr inbounds i8, i8* %131, i64 5
  %133 = load i8, i8* %132, align 1
  %134 = sext i8 %133 to i32
  store i32 %134, i32* %17, align 4
  %135 = load i32, i32* %17, align 4
  %136 = load i32, i32* %21, align 4
  %137 = sub nsw i32 %135, %136
  %138 = trunc i32 %137 to i8
  %139 = load i8*, i8** %9, align 8
  %140 = getelementptr inbounds i8, i8* %139, i64 5
  store i8 %138, i8* %140, align 1
  %141 = load i32, i32* %17, align 4
  store i32 %141, i32* %21, align 4
  %142 = load i8*, i8** %9, align 8
  %143 = getelementptr inbounds i8, i8* %142, i64 6
  %144 = load i8, i8* %143, align 1
  %145 = sext i8 %144 to i32
  store i32 %145, i32* %18, align 4
  %146 = load i32, i32* %18, align 4
  %147 = load i32, i32* %22, align 4
  %148 = sub nsw i32 %146, %147
  %149 = trunc i32 %148 to i8
  %150 = load i8*, i8** %9, align 8
  %151 = getelementptr inbounds i8, i8* %150, i64 6
  store i8 %149, i8* %151, align 1
  %152 = load i32, i32* %18, align 4
  store i32 %152, i32* %22, align 4
  %153 = load i8*, i8** %9, align 8
  %154 = getelementptr inbounds i8, i8* %153, i64 7
  %155 = load i8, i8* %154, align 1
  %156 = sext i8 %155 to i32
  store i32 %156, i32* %19, align 4
  %157 = load i32, i32* %19, align 4
  %158 = load i32, i32* %23, align 4
  %159 = sub nsw i32 %157, %158
  %160 = trunc i32 %159 to i8
  %161 = load i8*, i8** %9, align 8
  %162 = getelementptr inbounds i8, i8* %161, i64 7
  store i8 %160, i8* %162, align 1
  %163 = load i32, i32* %19, align 4
  store i32 %163, i32* %23, align 4
  %164 = load i8*, i8** %9, align 8
  %165 = getelementptr inbounds i8, i8* %164, i64 4
  store i8* %165, i8** %9, align 8
  br label %166

; <label>:166:                                    ; preds = %118
  %167 = load i32, i32* %6, align 4
  %168 = sub nsw i32 %167, 4
  store i32 %168, i32* %6, align 4
  %169 = icmp sgt i32 %168, 0
  br i1 %169, label %118, label %170

; <label>:170:                                    ; preds = %166
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 11)
  %171 = add i64 %pgocount3, 1
  store i64 %171, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 11)
  br label %281

; <label>:172:                                    ; preds = %98
  %173 = load i32, i32* %6, align 4
  %174 = sub nsw i32 %173, 1
  %175 = load i8*, i8** %9, align 8
  %176 = sext i32 %174 to i64
  %177 = getelementptr inbounds i8, i8* %175, i64 %176
  store i8* %177, i8** %9, align 8
  br label %178

; <label>:178:                                    ; preds = %274, %172
  %179 = load i32, i32* %8, align 4
  switch i32 %179, label %180 [
    i32 4, label %207
    i32 3, label %223
    i32 2, label %239
    i32 1, label %255
    i32 0, label %271
  ]

; <label>:180:                                    ; preds = %178
  %181 = load i32, i32* %8, align 4
  %182 = sub nsw i32 %181, 4
  store i32 %182, i32* %24, align 4
  br label %183

; <label>:183:                                    ; preds = %201, %180
  %184 = load i32, i32* %24, align 4
  %185 = icmp sgt i32 %184, 0
  br i1 %185, label %186, label %205

; <label>:186:                                    ; preds = %183
  %187 = load i8*, i8** %9, align 8
  %188 = getelementptr inbounds i8, i8* %187, i64 0
  %189 = load i8, i8* %188, align 1
  %190 = sext i8 %189 to i32
  %191 = load i8*, i8** %9, align 8
  %192 = load i32, i32* %8, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds i8, i8* %191, i64 %193
  %195 = load i8, i8* %194, align 1
  %196 = sext i8 %195 to i32
  %197 = sub nsw i32 %196, %190
  %198 = trunc i32 %197 to i8
  store i8 %198, i8* %194, align 1
  %199 = load i8*, i8** %9, align 8
  %200 = getelementptr inbounds i8, i8* %199, i32 -1
  store i8* %200, i8** %9, align 8
  br label %201

; <label>:201:                                    ; preds = %186
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 0)
  %202 = add i64 %pgocount4, 1
  store i64 %202, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 0)
  %203 = load i32, i32* %24, align 4
  %204 = add nsw i32 %203, -1
  store i32 %204, i32* %24, align 4
  br label %183

; <label>:205:                                    ; preds = %183
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 9)
  %206 = add i64 %pgocount5, 1
  store i64 %206, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 9)
  br label %207

; <label>:207:                                    ; preds = %205, %178
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 7)
  %208 = add i64 %pgocount6, 1
  store i64 %208, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 7)
  %209 = load i8*, i8** %9, align 8
  %210 = getelementptr inbounds i8, i8* %209, i64 0
  %211 = load i8, i8* %210, align 1
  %212 = sext i8 %211 to i32
  %213 = load i8*, i8** %9, align 8
  %214 = load i32, i32* %8, align 4
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds i8, i8* %213, i64 %215
  %217 = load i8, i8* %216, align 1
  %218 = sext i8 %217 to i32
  %219 = sub nsw i32 %218, %212
  %220 = trunc i32 %219 to i8
  store i8 %220, i8* %216, align 1
  %221 = load i8*, i8** %9, align 8
  %222 = getelementptr inbounds i8, i8* %221, i32 -1
  store i8* %222, i8** %9, align 8
  br label %223

; <label>:223:                                    ; preds = %207, %178
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 6)
  %224 = add i64 %pgocount7, 1
  store i64 %224, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 6)
  %225 = load i8*, i8** %9, align 8
  %226 = getelementptr inbounds i8, i8* %225, i64 0
  %227 = load i8, i8* %226, align 1
  %228 = sext i8 %227 to i32
  %229 = load i8*, i8** %9, align 8
  %230 = load i32, i32* %8, align 4
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds i8, i8* %229, i64 %231
  %233 = load i8, i8* %232, align 1
  %234 = sext i8 %233 to i32
  %235 = sub nsw i32 %234, %228
  %236 = trunc i32 %235 to i8
  store i8 %236, i8* %232, align 1
  %237 = load i8*, i8** %9, align 8
  %238 = getelementptr inbounds i8, i8* %237, i32 -1
  store i8* %238, i8** %9, align 8
  br label %239

; <label>:239:                                    ; preds = %223, %178
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 5)
  %240 = add i64 %pgocount8, 1
  store i64 %240, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 5)
  %241 = load i8*, i8** %9, align 8
  %242 = getelementptr inbounds i8, i8* %241, i64 0
  %243 = load i8, i8* %242, align 1
  %244 = sext i8 %243 to i32
  %245 = load i8*, i8** %9, align 8
  %246 = load i32, i32* %8, align 4
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds i8, i8* %245, i64 %247
  %249 = load i8, i8* %248, align 1
  %250 = sext i8 %249 to i32
  %251 = sub nsw i32 %250, %244
  %252 = trunc i32 %251 to i8
  store i8 %252, i8* %248, align 1
  %253 = load i8*, i8** %9, align 8
  %254 = getelementptr inbounds i8, i8* %253, i32 -1
  store i8* %254, i8** %9, align 8
  br label %255

; <label>:255:                                    ; preds = %239, %178
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 4)
  %256 = add i64 %pgocount9, 1
  store i64 %256, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 4)
  %257 = load i8*, i8** %9, align 8
  %258 = getelementptr inbounds i8, i8* %257, i64 0
  %259 = load i8, i8* %258, align 1
  %260 = sext i8 %259 to i32
  %261 = load i8*, i8** %9, align 8
  %262 = load i32, i32* %8, align 4
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds i8, i8* %261, i64 %263
  %265 = load i8, i8* %264, align 1
  %266 = sext i8 %265 to i32
  %267 = sub nsw i32 %266, %260
  %268 = trunc i32 %267 to i8
  store i8 %268, i8* %264, align 1
  %269 = load i8*, i8** %9, align 8
  %270 = getelementptr inbounds i8, i8* %269, i32 -1
  store i8* %270, i8** %9, align 8
  br label %271

; <label>:271:                                    ; preds = %255, %178
  br label %272

; <label>:272:                                    ; preds = %271
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 3)
  %273 = add i64 %pgocount10, 1
  store i64 %273, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 3)
  br label %274

; <label>:274:                                    ; preds = %272
  %275 = load i32, i32* %8, align 4
  %276 = load i32, i32* %6, align 4
  %277 = sub nsw i32 %276, %275
  store i32 %277, i32* %6, align 4
  %278 = icmp sgt i32 %277, 0
  br i1 %278, label %178, label %279

; <label>:279:                                    ; preds = %274
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 12)
  %280 = add i64 %pgocount11, 1
  store i64 %280, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 12)
  br label %281

; <label>:281:                                    ; preds = %279, %170
  br label %282

; <label>:282:                                    ; preds = %281, %96
  br label %283

; <label>:283:                                    ; preds = %282, %3
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 8)
  %284 = add i64 %pgocount12, 1
  store i64 %284, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_horDiff8, i64 0, i64 8)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @horDiff16(%struct.tiff*, i8*, i32) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.TIFFPredictorState*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %12 = load %struct.tiff*, %struct.tiff** %4, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 37
  %14 = load i8*, i8** %13, align 8
  %15 = bitcast i8* %14 to %struct.TIFFPredictorState*
  store %struct.TIFFPredictorState* %15, %struct.TIFFPredictorState** %7, align 8
  %16 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %7, align 8
  %17 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %16, i32 0, i32 1
  %18 = load i32, i32* %17, align 4
  store i32 %18, i32* %8, align 4
  %19 = load i8*, i8** %5, align 8
  %20 = bitcast i8* %19 to i16*
  store i16* %20, i16** %9, align 8
  %21 = load i32, i32* %6, align 4
  %22 = sdiv i32 %21, 2
  store i32 %22, i32* %10, align 4
  %23 = load i32, i32* %10, align 4
  %24 = load i32, i32* %8, align 4
  %25 = icmp sgt i32 %23, %24
  br i1 %25, label %26, label %139

; <label>:26:                                     ; preds = %3
  %27 = load i32, i32* %8, align 4
  %28 = load i32, i32* %10, align 4
  %29 = sub nsw i32 %28, %27
  store i32 %29, i32* %10, align 4
  %30 = load i32, i32* %10, align 4
  %31 = sub nsw i32 %30, 1
  %32 = load i16*, i16** %9, align 8
  %33 = sext i32 %31 to i64
  %34 = getelementptr inbounds i16, i16* %32, i64 %33
  store i16* %34, i16** %9, align 8
  br label %35

; <label>:35:                                     ; preds = %134, %26
  %36 = load i32, i32* %8, align 4
  switch i32 %36, label %37 [
    i32 4, label %64
    i32 3, label %80
    i32 2, label %96
    i32 1, label %112
    i32 0, label %128
  ]

; <label>:37:                                     ; preds = %35
  %38 = load i32, i32* %8, align 4
  %39 = sub nsw i32 %38, 4
  store i32 %39, i32* %11, align 4
  br label %40

; <label>:40:                                     ; preds = %58, %37
  %41 = load i32, i32* %11, align 4
  %42 = icmp sgt i32 %41, 0
  br i1 %42, label %43, label %62

; <label>:43:                                     ; preds = %40
  %44 = load i16*, i16** %9, align 8
  %45 = getelementptr inbounds i16, i16* %44, i64 0
  %46 = load i16, i16* %45, align 2
  %47 = sext i16 %46 to i32
  %48 = load i16*, i16** %9, align 8
  %49 = load i32, i32* %8, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i16, i16* %48, i64 %50
  %52 = load i16, i16* %51, align 2
  %53 = sext i16 %52 to i32
  %54 = sub nsw i32 %53, %47
  %55 = trunc i32 %54 to i16
  store i16 %55, i16* %51, align 2
  %56 = load i16*, i16** %9, align 8
  %57 = getelementptr inbounds i16, i16* %56, i32 -1
  store i16* %57, i16** %9, align 8
  br label %58

; <label>:58:                                     ; preds = %43
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 0)
  %59 = add i64 %pgocount, 1
  store i64 %59, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 0)
  %60 = load i32, i32* %11, align 4
  %61 = add nsw i32 %60, -1
  store i32 %61, i32* %11, align 4
  br label %40

; <label>:62:                                     ; preds = %40
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 6)
  %63 = add i64 %pgocount1, 1
  store i64 %63, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 6)
  br label %64

; <label>:64:                                     ; preds = %62, %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 5)
  %65 = add i64 %pgocount2, 1
  store i64 %65, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 5)
  %66 = load i16*, i16** %9, align 8
  %67 = getelementptr inbounds i16, i16* %66, i64 0
  %68 = load i16, i16* %67, align 2
  %69 = sext i16 %68 to i32
  %70 = load i16*, i16** %9, align 8
  %71 = load i32, i32* %8, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i16, i16* %70, i64 %72
  %74 = load i16, i16* %73, align 2
  %75 = sext i16 %74 to i32
  %76 = sub nsw i32 %75, %69
  %77 = trunc i32 %76 to i16
  store i16 %77, i16* %73, align 2
  %78 = load i16*, i16** %9, align 8
  %79 = getelementptr inbounds i16, i16* %78, i32 -1
  store i16* %79, i16** %9, align 8
  br label %80

; <label>:80:                                     ; preds = %64, %35
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 4)
  %81 = add i64 %pgocount3, 1
  store i64 %81, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 4)
  %82 = load i16*, i16** %9, align 8
  %83 = getelementptr inbounds i16, i16* %82, i64 0
  %84 = load i16, i16* %83, align 2
  %85 = sext i16 %84 to i32
  %86 = load i16*, i16** %9, align 8
  %87 = load i32, i32* %8, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i16, i16* %86, i64 %88
  %90 = load i16, i16* %89, align 2
  %91 = sext i16 %90 to i32
  %92 = sub nsw i32 %91, %85
  %93 = trunc i32 %92 to i16
  store i16 %93, i16* %89, align 2
  %94 = load i16*, i16** %9, align 8
  %95 = getelementptr inbounds i16, i16* %94, i32 -1
  store i16* %95, i16** %9, align 8
  br label %96

; <label>:96:                                     ; preds = %80, %35
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 3)
  %97 = add i64 %pgocount4, 1
  store i64 %97, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 3)
  %98 = load i16*, i16** %9, align 8
  %99 = getelementptr inbounds i16, i16* %98, i64 0
  %100 = load i16, i16* %99, align 2
  %101 = sext i16 %100 to i32
  %102 = load i16*, i16** %9, align 8
  %103 = load i32, i32* %8, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i16, i16* %102, i64 %104
  %106 = load i16, i16* %105, align 2
  %107 = sext i16 %106 to i32
  %108 = sub nsw i32 %107, %101
  %109 = trunc i32 %108 to i16
  store i16 %109, i16* %105, align 2
  %110 = load i16*, i16** %9, align 8
  %111 = getelementptr inbounds i16, i16* %110, i32 -1
  store i16* %111, i16** %9, align 8
  br label %112

; <label>:112:                                    ; preds = %96, %35
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 2)
  %113 = add i64 %pgocount5, 1
  store i64 %113, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 2)
  %114 = load i16*, i16** %9, align 8
  %115 = getelementptr inbounds i16, i16* %114, i64 0
  %116 = load i16, i16* %115, align 2
  %117 = sext i16 %116 to i32
  %118 = load i16*, i16** %9, align 8
  %119 = load i32, i32* %8, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i16, i16* %118, i64 %120
  %122 = load i16, i16* %121, align 2
  %123 = sext i16 %122 to i32
  %124 = sub nsw i32 %123, %117
  %125 = trunc i32 %124 to i16
  store i16 %125, i16* %121, align 2
  %126 = load i16*, i16** %9, align 8
  %127 = getelementptr inbounds i16, i16* %126, i32 -1
  store i16* %127, i16** %9, align 8
  br label %128

; <label>:128:                                    ; preds = %112, %35
  br label %129

; <label>:129:                                    ; preds = %128
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 1)
  %130 = add i64 %pgocount6, 1
  store i64 %130, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 1)
  %131 = load i32, i32* %8, align 4
  %132 = load i32, i32* %10, align 4
  %133 = sub nsw i32 %132, %131
  store i32 %133, i32* %10, align 4
  br label %134

; <label>:134:                                    ; preds = %129
  %135 = load i32, i32* %10, align 4
  %136 = icmp sgt i32 %135, 0
  br i1 %136, label %35, label %137

; <label>:137:                                    ; preds = %134
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 8)
  %138 = add i64 %pgocount7, 1
  store i64 %138, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 8)
  br label %139

; <label>:139:                                    ; preds = %137, %3
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 7)
  %140 = add i64 %pgocount8, 1
  store i64 %140, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_horDiff16, i64 0, i64 7)
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @PredictorEncodeRow(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca %struct.TIFFPredictorState*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i16 %3, i16* %8, align 2
  %10 = load %struct.tiff*, %struct.tiff** %5, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 37
  %12 = load i8*, i8** %11, align 8
  %13 = bitcast i8* %12 to %struct.TIFFPredictorState*
  store %struct.TIFFPredictorState* %13, %struct.TIFFPredictorState** %9, align 8
  %14 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %9, align 8
  %15 = icmp ne %struct.TIFFPredictorState* %14, null
  br i1 %15, label %16, label %17

; <label>:16:                                     ; preds = %4
  br label %20

; <label>:17:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PredictorEncodeRow, i64 0, i64 1)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PredictorEncodeRow, i64 0, i64 1)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0), i32 350, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.PredictorEncodeRow, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %20

; <label>:20:                                     ; preds = %19, %16
  %21 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %9, align 8
  %22 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %21, i32 0, i32 3
  %23 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %22, align 8
  %24 = icmp ne void (%struct.tiff*, i8*, i32)* %23, null
  br i1 %24, label %25, label %26

; <label>:25:                                     ; preds = %20
  br label %29

; <label>:26:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PredictorEncodeRow, i64 0, i64 2)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PredictorEncodeRow, i64 0, i64 2)
  call void @__assert_fail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0), i32 351, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.PredictorEncodeRow, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %29

; <label>:29:                                     ; preds = %28, %25
  %30 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %9, align 8
  %31 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %30, i32 0, i32 4
  %32 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %31, align 8
  %33 = icmp ne i32 (%struct.tiff*, i8*, i32, i16)* %32, null
  br i1 %33, label %34, label %35

; <label>:34:                                     ; preds = %29
  br label %38

; <label>:35:                                     ; preds = %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PredictorEncodeRow, i64 0, i64 3)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PredictorEncodeRow, i64 0, i64 3)
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0), i32 352, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.PredictorEncodeRow, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %38

; <label>:38:                                     ; preds = %37, %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PredictorEncodeRow, i64 0, i64 0)
  %39 = add i64 %pgocount3, 1
  store i64 %39, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PredictorEncodeRow, i64 0, i64 0)
  %40 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %9, align 8
  %41 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %40, i32 0, i32 3
  %42 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %41, align 8
  %43 = load %struct.tiff*, %struct.tiff** %5, align 8
  %44 = load i8*, i8** %6, align 8
  %45 = load i32, i32* %7, align 4
  %46 = ptrtoint void (%struct.tiff*, i8*, i32)* %42 to i64
  call void @__llvm_profile_instrument_target(i64 %46, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorEncodeRow to i8*), i32 0)
  call void %42(%struct.tiff* %43, i8* %44, i32 %45)
  %47 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %9, align 8
  %48 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %47, i32 0, i32 4
  %49 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %48, align 8
  %50 = load %struct.tiff*, %struct.tiff** %5, align 8
  %51 = load i8*, i8** %6, align 8
  %52 = load i32, i32* %7, align 4
  %53 = load i16, i16* %8, align 2
  %54 = ptrtoint i32 (%struct.tiff*, i8*, i32, i16)* %49 to i64
  call void @__llvm_profile_instrument_target(i64 %54, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorEncodeRow to i8*), i32 1)
  %55 = call i32 %49(%struct.tiff* %50, i8* %51, i32 %52, i16 zeroext %53)
  ret i32 %55
}

; Function Attrs: nounwind uwtable
define internal i32 @PredictorEncodeTile(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca %struct.TIFFPredictorState*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i16 %3, i16* %8, align 2
  %13 = load %struct.tiff*, %struct.tiff** %5, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %13, i32 0, i32 37
  %15 = load i8*, i8** %14, align 8
  %16 = bitcast i8* %15 to %struct.TIFFPredictorState*
  store %struct.TIFFPredictorState* %16, %struct.TIFFPredictorState** %9, align 8
  %17 = load i32, i32* %7, align 4
  store i32 %17, i32* %10, align 4
  %18 = load i8*, i8** %6, align 8
  store i8* %18, i8** %12, align 8
  %19 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %9, align 8
  %20 = icmp ne %struct.TIFFPredictorState* %19, null
  br i1 %20, label %21, label %22

; <label>:21:                                     ; preds = %4
  br label %25

; <label>:22:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorEncodeTile, i64 0, i64 2)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorEncodeTile, i64 0, i64 2)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0), i32 365, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PredictorEncodeTile, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %25

; <label>:25:                                     ; preds = %24, %21
  %26 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %9, align 8
  %27 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %26, i32 0, i32 3
  %28 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %27, align 8
  %29 = icmp ne void (%struct.tiff*, i8*, i32)* %28, null
  br i1 %29, label %30, label %31

; <label>:30:                                     ; preds = %25
  br label %34

; <label>:31:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorEncodeTile, i64 0, i64 3)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorEncodeTile, i64 0, i64 3)
  call void @__assert_fail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0), i32 366, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PredictorEncodeTile, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %34

; <label>:34:                                     ; preds = %33, %30
  %35 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %9, align 8
  %36 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %35, i32 0, i32 6
  %37 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %36, align 8
  %38 = icmp ne i32 (%struct.tiff*, i8*, i32, i16)* %37, null
  br i1 %38, label %39, label %40

; <label>:39:                                     ; preds = %34
  br label %43

; <label>:40:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorEncodeTile, i64 0, i64 4)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorEncodeTile, i64 0, i64 4)
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0), i32 367, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PredictorEncodeTile, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %43

; <label>:43:                                     ; preds = %42, %39
  %44 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %9, align 8
  %45 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %44, i32 0, i32 2
  %46 = load i32, i32* %45, align 8
  store i32 %46, i32* %11, align 4
  %47 = load i32, i32* %11, align 4
  %48 = icmp sgt i32 %47, 0
  br i1 %48, label %49, label %50

; <label>:49:                                     ; preds = %43
  br label %53

; <label>:50:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorEncodeTile, i64 0, i64 5)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorEncodeTile, i64 0, i64 5)
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0), i32 369, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PredictorEncodeTile, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %53

; <label>:53:                                     ; preds = %52, %49
  br label %54

; <label>:54:                                     ; preds = %58, %53
  %55 = load i32, i32* %10, align 4
  %56 = sext i32 %55 to i64
  %57 = icmp sgt i64 %56, 0
  br i1 %57, label %58, label %74

; <label>:58:                                     ; preds = %54
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorEncodeTile, i64 0, i64 0)
  %59 = add i64 %pgocount4, 1
  store i64 %59, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorEncodeTile, i64 0, i64 0)
  %60 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %9, align 8
  %61 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %60, i32 0, i32 3
  %62 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %61, align 8
  %63 = load %struct.tiff*, %struct.tiff** %5, align 8
  %64 = load i8*, i8** %12, align 8
  %65 = load i32, i32* %11, align 4
  %66 = ptrtoint void (%struct.tiff*, i8*, i32)* %62 to i64
  call void @__llvm_profile_instrument_target(i64 %66, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorEncodeTile to i8*), i32 0)
  call void %62(%struct.tiff* %63, i8* %64, i32 %65)
  %67 = load i32, i32* %11, align 4
  %68 = load i32, i32* %10, align 4
  %69 = sub nsw i32 %68, %67
  store i32 %69, i32* %10, align 4
  %70 = load i32, i32* %11, align 4
  %71 = load i8*, i8** %12, align 8
  %72 = sext i32 %70 to i64
  %73 = getelementptr inbounds i8, i8* %71, i64 %72
  store i8* %73, i8** %12, align 8
  br label %54

; <label>:74:                                     ; preds = %54
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorEncodeTile, i64 0, i64 1)
  %75 = add i64 %pgocount5, 1
  store i64 %75, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_PredictorEncodeTile, i64 0, i64 1)
  %76 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %9, align 8
  %77 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %76, i32 0, i32 6
  %78 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %77, align 8
  %79 = load %struct.tiff*, %struct.tiff** %5, align 8
  %80 = load i8*, i8** %6, align 8
  %81 = load i32, i32* %7, align 4
  %82 = load i16, i16* %8, align 2
  %83 = ptrtoint i32 (%struct.tiff*, i8*, i32, i16)* %78 to i64
  call void @__llvm_profile_instrument_target(i64 %83, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PredictorEncodeTile to i8*), i32 1)
  %84 = call i32 %78(%struct.tiff* %79, i8* %80, i32 %81, i16 zeroext %82)
  ret i32 %84
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

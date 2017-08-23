; ModuleID = 'tif_dir.2.ll'
source_filename = "tif_dir.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@_TIFFextender = internal global void (%struct.tiff*)* null, align 8
@TIFFUnlinkDirectory.module = internal constant [20 x i8] c"TIFFUnlinkDirectory\00", align 16
@.str = private unnamed_addr constant [43 x i8] c"Can not unlink directory in read-only file\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"Directory %d does not exist\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"Error writing directory link\00", align 1
@TIFFReassignTagToIgnore.TIFFignoretags = internal global [95 x i32] zeroinitializer, align 16
@TIFFReassignTagToIgnore.tagcount = internal global i32 0, align 4
@.str.3 = private unnamed_addr constant [13 x i8] c"TIFFSetField\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"%s: Unknown %stag %u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"pseudo-\00", align 1
@.str.6 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.7 = private unnamed_addr constant [41 x i8] c"%s: Cannot modify tag \22%s\22 while writing\00", align 1
@.str.8 = private unnamed_addr constant [69 x i8] c"LZW compression no longer supported due to Unisys patent enforcement\00", align 1
@.str.9 = private unnamed_addr constant [35 x i8] c"Bad value %ld for \22%s\22 tag ignored\00", align 1
@.str.10 = private unnamed_addr constant [40 x i8] c"Nonstandard tile width %d, convert file\00", align 1
@.str.11 = private unnamed_addr constant [41 x i8] c"Nonstandard tile length %d, convert file\00", align 1
@.str.12 = private unnamed_addr constant [27 x i8] c"Sorry, cannot nest SubIFDs\00", align 1
@.str.13 = private unnamed_addr constant [48 x i8] c"%s: Invalid %stag \22%s\22 (not supported by codec)\00", align 1
@.str.14 = private unnamed_addr constant [8 x i8] c"pseduo-\00", align 1
@.str.15 = private unnamed_addr constant [23 x i8] c"%d: Bad value for \22%s\22\00", align 1
@.str.16 = private unnamed_addr constant [24 x i8] c"%ld: Bad value for \22%s\22\00", align 1
@.str.17 = private unnamed_addr constant [23 x i8] c"%f: Bad value for \22%s\22\00", align 1
@.str.18 = private unnamed_addr constant [57 x i8] c"%s: Invalid InkNames value; expecting %d names, found %d\00", align 1
@.str.19 = private unnamed_addr constant [13 x i8] c"TIFFGetField\00", align 1
@TIFFAdvanceDirectory.module = internal constant [21 x i8] c"TIFFAdvanceDirectory\00", align 16
@.str.20 = private unnamed_addr constant [35 x i8] c"%s: Error fetching directory count\00", align 1
@.str.21 = private unnamed_addr constant [34 x i8] c"%s: Error fetching directory link\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn__TIFFsetByteArray = private constant [17 x i8] c"_TIFFsetByteArray"
@__profn__TIFFsetString = private constant [14 x i8] c"_TIFFsetString"
@__profn__TIFFsetNString = private constant [15 x i8] c"_TIFFsetNString"
@__profn__TIFFsetShortArray = private constant [18 x i8] c"_TIFFsetShortArray"
@__profn__TIFFsetLongArray = private constant [17 x i8] c"_TIFFsetLongArray"
@__profn__TIFFsetFloatArray = private constant [18 x i8] c"_TIFFsetFloatArray"
@__profn__TIFFsetDoubleArray = private constant [19 x i8] c"_TIFFsetDoubleArray"
@__profn_TIFFSetField = private constant [12 x i8] c"TIFFSetField"
@__profn_TIFFVSetField = private constant [13 x i8] c"TIFFVSetField"
@__profn_tmp1.ll_OkToChangeTag = private constant [21 x i8] c"tmp1.ll:OkToChangeTag"
@__profn_TIFFGetField = private constant [12 x i8] c"TIFFGetField"
@__profn_TIFFVGetField = private constant [13 x i8] c"TIFFVGetField"
@__profn_TIFFFreeDirectory = private constant [17 x i8] c"TIFFFreeDirectory"
@__profn_TIFFSetTagExtender = private constant [18 x i8] c"TIFFSetTagExtender"
@__profn_TIFFDefaultDirectory = private constant [20 x i8] c"TIFFDefaultDirectory"
@__profn_tmp1.ll__TIFFVSetField = private constant [22 x i8] c"tmp1.ll:_TIFFVSetField"
@__profn_tmp1.ll__TIFFVGetField = private constant [22 x i8] c"tmp1.ll:_TIFFVGetField"
@__profn_TIFFNumberOfDirectories = private constant [23 x i8] c"TIFFNumberOfDirectories"
@__profn_tmp1.ll_TIFFAdvanceDirectory = private constant [28 x i8] c"tmp1.ll:TIFFAdvanceDirectory"
@__profn_TIFFSetDirectory = private constant [16 x i8] c"TIFFSetDirectory"
@__profn_TIFFSetSubDirectory = private constant [19 x i8] c"TIFFSetSubDirectory"
@__profn_TIFFCurrentDirOffset = private constant [20 x i8] c"TIFFCurrentDirOffset"
@__profn_TIFFLastDirectory = private constant [17 x i8] c"TIFFLastDirectory"
@__profn_TIFFUnlinkDirectory = private constant [19 x i8] c"TIFFUnlinkDirectory"
@__profn_TIFFReassignTagToIgnore = private constant [23 x i8] c"TIFFReassignTagToIgnore"
@__profn_tmp1.ll_setExtraSamples = private constant [23 x i8] c"tmp1.ll:setExtraSamples"
@__profn_tmp1.ll_checkInkNamesString = private constant [27 x i8] c"tmp1.ll:checkInkNamesString"
@__profc__TIFFsetByteArray = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFsetByteArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6423394811572288432, i64 43491222705, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFsetByteArray, i32 0, i32 0), i8* bitcast (void (i8**, i8*, i64)* @_TIFFsetByteArray to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFsetString = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFsetString = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7576224552903944587, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetString, i32 0, i32 0), i8* bitcast (void (i8**, i8*)* @_TIFFsetString to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFsetNString = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFsetNString = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1198634616368802173, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetNString, i32 0, i32 0), i8* bitcast (void (i8**, i8*, i64)* @_TIFFsetNString to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFsetShortArray = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFsetShortArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7919404561191481680, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetShortArray, i32 0, i32 0), i8* bitcast (void (i16**, i16*, i64)* @_TIFFsetShortArray to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFsetLongArray = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFsetLongArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4302876990081740414, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetLongArray, i32 0, i32 0), i8* bitcast (void (i32**, i32*, i64)* @_TIFFsetLongArray to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFsetFloatArray = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFsetFloatArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3629614724288611937, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetFloatArray, i32 0, i32 0), i8* bitcast (void (float**, float*, i64)* @_TIFFsetFloatArray to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFsetDoubleArray = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFsetDoubleArray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5894904304735113261, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetDoubleArray, i32 0, i32 0), i8* bitcast (void (double**, double*, i64)* @_TIFFsetDoubleArray to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFSetField = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFSetField = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2563247766574264095, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSetField, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, ...)* @TIFFSetField to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFVSetField = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFVSetField = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFVSetField = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4481130747165635142, i64 281504644258452, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFVSetField, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @TIFFVSetField to i8*), i8* bitcast ([1 x i64]* @__profvp_TIFFVSetField to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_OkToChangeTag = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_OkToChangeTag = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6265993817608345103, i64 72057651282132195, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_OkToChangeTag, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFGetField = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFGetField = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 351223594357501132, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFGetField, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, ...)* @TIFFGetField to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFVGetField = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFVGetField = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFVGetField = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4602912631222578909, i64 281521664108044, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFVGetField, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @TIFFVGetField to i8*), i8* bitcast ([1 x i64]* @__profvp_TIFFVGetField to i8*), i32 4, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_TIFFFreeDirectory = private global [33 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFFreeDirectory = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6331108473620795957, i64 422080663482, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i32 0, i32 0), i8* bitcast (void (%struct.tiff*)* @TIFFFreeDirectory to i8*), i8* null, i32 33, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFSetTagExtender = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFSetTagExtender = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1227487160340415688, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSetTagExtender, i32 0, i32 0), i8* bitcast (void (%struct.tiff*)* (void (%struct.tiff*)*)* @TIFFSetTagExtender to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFDefaultDirectory = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFDefaultDirectory = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFDefaultDirectory = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6476522804258839359, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFDefaultDirectory, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFDefaultDirectory to i8*), i8* bitcast ([1 x i64]* @__profvp_TIFFDefaultDirectory to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll__TIFFVSetField = private global [181 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll__TIFFVSetField = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll__TIFFVSetField = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8411786934893369237, i64 144399032659336467, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @_TIFFVSetField to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll__TIFFVSetField to i8*), i32 181, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll__TIFFVGetField = private global [160 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll__TIFFVGetField = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 162268485660770542, i64 72059688850629934, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @_TIFFVGetField to i8*), i8* null, i32 160, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFNumberOfDirectories = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFNumberOfDirectories = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2706470087958785335, i64 39911148230, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFNumberOfDirectories, i32 0, i32 0), i8* bitcast (i16 (%struct.tiff*)* @TIFFNumberOfDirectories to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFAdvanceDirectory = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_TIFFAdvanceDirectory = private global [5 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_TIFFAdvanceDirectory = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6681421155849650514, i64 1407546617310693, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i32 0, i32 0), i8* null, i8* bitcast ([5 x i64]* @__profvp_tmp1.ll_TIFFAdvanceDirectory to i8*), i32 13, [1 x i16] [i16 5] }, section "__llvm_prf_data", align 8
@__profc_TIFFSetDirectory = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFSetDirectory = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1944846227912058480, i64 63383509119, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFSetDirectory, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i16)* @TIFFSetDirectory to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFSetSubDirectory = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFSetSubDirectory = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 978705646861758352, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSetSubDirectory, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @TIFFSetSubDirectory to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFCurrentDirOffset = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFCurrentDirOffset = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9124711331976916306, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFCurrentDirOffset, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFCurrentDirOffset to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFLastDirectory = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFLastDirectory = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1932224262314318356, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFLastDirectory, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFLastDirectory to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFUnlinkDirectory = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFUnlinkDirectory = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFUnlinkDirectory = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 257470203854107648, i64 844562340745601, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i16)* @TIFFUnlinkDirectory to i8*), i8* bitcast ([3 x i64]* @__profvp_TIFFUnlinkDirectory to i8*), i32 10, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_TIFFReassignTagToIgnore = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFReassignTagToIgnore = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2189222059520583369, i64 131660689655, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i32 0, i32 0), i8* bitcast (i32 (i32, i32)* @TIFFReassignTagToIgnore to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_setExtraSamples = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_setExtraSamples = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7637023765711544143, i64 117117988274, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setExtraSamples, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_checkInkNamesString = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_checkInkNamesString = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1145226566179996525, i64 86733636326, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkInkNamesString, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [12 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [236 x i8] c"\91\04\E8\01x\DAm\91AO\840\10\85\E3\1F2\F1\EAm]\C4\90l \D9\A2W2\C0P\1A\CAt3m\8D\FB\EF-\B8[-x|_\DF\9Bym\9B\BA\C8s\8B\EE\E5\EA\F0\C0\0C\D7\87\E6F\84cE2\CAr\A3\C5h\D8\A5\89\93!\99\92\5C\1B\D8\982\E3[}[\B5 \11\5C\0Au\BF\8A\8F\A8\DC|yz\D4\FA\B9\9Ajs\1C\81$\D6 W\CF[\12HT\CE\88\99b\EC\9C\E18=\E4^\BF\1CR\8F\BC\A2\0C\07\F0\DA\FD\FA\EE\AB\9A\FF\1B4\FB=\A5\9F[\E4j\B8\CFPh\A3}9?\F4\9F@\DD\BE\CA\0E\08\DF\A6\EC\E8\99\91\16c5\0C\E1\B5Vx\02\BB\89\BE\93V4\A5\EC\8C`\AD\92\14\EE[\9BB\92a\8C\A5\C2\A4\F0\06\0C\02\E6\8B\FES\B6\1B\B1\9B\0A\9AJ\98\D1\FE|\F07\D2\A3\BBF", section "__llvm_prf_names"
@llvm.used = appending global [29 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFsetByteArray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFsetString to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFsetNString to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFsetShortArray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFsetLongArray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFsetFloatArray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFsetDoubleArray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFSetField to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFVSetField to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_OkToChangeTag to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFGetField to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFVGetField to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFFreeDirectory to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFSetTagExtender to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFDefaultDirectory to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll__TIFFVSetField to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll__TIFFVGetField to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFNumberOfDirectories to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFAdvanceDirectory to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFSetDirectory to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFSetSubDirectory to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFCurrentDirOffset to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFLastDirectory to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFUnlinkDirectory to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReassignTagToIgnore to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_setExtraSamples to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_checkInkNamesString to i8*), i8* bitcast ([12 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([236 x i8], [236 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @_TIFFsetByteArray(i8**, i8*, i64) #0 {
  %4 = alloca i8**, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  store i8** %0, i8*** %4, align 8
  store i8* %1, i8** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load i8**, i8*** %4, align 8
  %8 = load i8*, i8** %7, align 8
  %9 = icmp ne i8* %8, null
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFsetByteArray, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFsetByteArray, i64 0, i64 1)
  %12 = load i8**, i8*** %4, align 8
  %13 = load i8*, i8** %12, align 8
  call void @_TIFFfree(i8* %13)
  %14 = load i8**, i8*** %4, align 8
  store i8* null, i8** %14, align 8
  br label %15

; <label>:15:                                     ; preds = %10, %3
  %16 = load i8*, i8** %5, align 8
  %17 = icmp ne i8* %16, null
  br i1 %17, label %18, label %32

; <label>:18:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFsetByteArray, i64 0, i64 2)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFsetByteArray, i64 0, i64 2)
  %20 = load i64, i64* %6, align 8
  %21 = trunc i64 %20 to i32
  %22 = call i8* @_TIFFmalloc(i32 %21)
  %23 = load i8**, i8*** %4, align 8
  store i8* %22, i8** %23, align 8
  %24 = icmp ne i8* %22, null
  br i1 %24, label %25, label %32

; <label>:25:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFsetByteArray, i64 0, i64 3)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFsetByteArray, i64 0, i64 3)
  %27 = load i8**, i8*** %4, align 8
  %28 = load i8*, i8** %27, align 8
  %29 = load i8*, i8** %5, align 8
  %30 = load i64, i64* %6, align 8
  %31 = trunc i64 %30 to i32
  call void @_TIFFmemcpy(i8* %28, i8* %29, i32 %31)
  br label %32

; <label>:32:                                     ; preds = %25, %18, %15
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFsetByteArray, i64 0, i64 0)
  %33 = add i64 %pgocount3, 1
  store i64 %33, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFsetByteArray, i64 0, i64 0)
  ret void
}

declare void @_TIFFfree(i8*) #1

declare i8* @_TIFFmalloc(i32) #1

declare void @_TIFFmemcpy(i8*, i8*, i32) #1

; Function Attrs: nounwind uwtable
define void @_TIFFsetString(i8**, i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetString, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetString, i64 0, i64 0)
  %4 = alloca i8**, align 8
  %5 = alloca i8*, align 8
  store i8** %0, i8*** %4, align 8
  store i8* %1, i8** %5, align 8
  %6 = load i8**, i8*** %4, align 8
  %7 = load i8*, i8** %5, align 8
  %8 = load i8*, i8** %5, align 8
  %9 = call i64 @strlen(i8* %8) #4
  %10 = add i64 %9, 1
  call void @_TIFFsetByteArray(i8** %6, i8* %7, i64 %10)
  ret void
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind uwtable
define void @_TIFFsetNString(i8**, i8*, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetNString, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetNString, i64 0, i64 0)
  %5 = alloca i8**, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  store i8** %0, i8*** %5, align 8
  store i8* %1, i8** %6, align 8
  store i64 %2, i64* %7, align 8
  %8 = load i8**, i8*** %5, align 8
  %9 = load i8*, i8** %6, align 8
  %10 = load i64, i64* %7, align 8
  call void @_TIFFsetByteArray(i8** %8, i8* %9, i64 %10)
  ret void
}

; Function Attrs: nounwind uwtable
define void @_TIFFsetShortArray(i16**, i16*, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetShortArray, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetShortArray, i64 0, i64 0)
  %5 = alloca i16**, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i64, align 8
  store i16** %0, i16*** %5, align 8
  store i16* %1, i16** %6, align 8
  store i64 %2, i64* %7, align 8
  %8 = load i16**, i16*** %5, align 8
  %9 = bitcast i16** %8 to i8**
  %10 = load i16*, i16** %6, align 8
  %11 = bitcast i16* %10 to i8*
  %12 = load i64, i64* %7, align 8
  %13 = mul i64 %12, 2
  call void @_TIFFsetByteArray(i8** %9, i8* %11, i64 %13)
  ret void
}

; Function Attrs: nounwind uwtable
define void @_TIFFsetLongArray(i32**, i32*, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetLongArray, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetLongArray, i64 0, i64 0)
  %5 = alloca i32**, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i64, align 8
  store i32** %0, i32*** %5, align 8
  store i32* %1, i32** %6, align 8
  store i64 %2, i64* %7, align 8
  %8 = load i32**, i32*** %5, align 8
  %9 = bitcast i32** %8 to i8**
  %10 = load i32*, i32** %6, align 8
  %11 = bitcast i32* %10 to i8*
  %12 = load i64, i64* %7, align 8
  %13 = mul i64 %12, 4
  call void @_TIFFsetByteArray(i8** %9, i8* %11, i64 %13)
  ret void
}

; Function Attrs: nounwind uwtable
define void @_TIFFsetFloatArray(float**, float*, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetFloatArray, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetFloatArray, i64 0, i64 0)
  %5 = alloca float**, align 8
  %6 = alloca float*, align 8
  %7 = alloca i64, align 8
  store float** %0, float*** %5, align 8
  store float* %1, float** %6, align 8
  store i64 %2, i64* %7, align 8
  %8 = load float**, float*** %5, align 8
  %9 = bitcast float** %8 to i8**
  %10 = load float*, float** %6, align 8
  %11 = bitcast float* %10 to i8*
  %12 = load i64, i64* %7, align 8
  %13 = mul i64 %12, 4
  call void @_TIFFsetByteArray(i8** %9, i8* %11, i64 %13)
  ret void
}

; Function Attrs: nounwind uwtable
define void @_TIFFsetDoubleArray(double**, double*, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetDoubleArray, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFsetDoubleArray, i64 0, i64 0)
  %5 = alloca double**, align 8
  %6 = alloca double*, align 8
  %7 = alloca i64, align 8
  store double** %0, double*** %5, align 8
  store double* %1, double** %6, align 8
  store i64 %2, i64* %7, align 8
  %8 = load double**, double*** %5, align 8
  %9 = bitcast double** %8 to i8**
  %10 = load double*, double** %6, align 8
  %11 = bitcast double* %10 to i8*
  %12 = load i64, i64* %7, align 8
  %13 = mul i64 %12, 8
  call void @_TIFFsetByteArray(i8** %9, i8* %11, i64 %13)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @TIFFSetField(%struct.tiff*, i32, ...) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSetField, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSetField, i64 0, i64 0)
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca [1 x %struct.__va_list_tag], align 16
  %7 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %8 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %6, i32 0, i32 0
  %9 = bitcast %struct.__va_list_tag* %8 to i8*
  call void @llvm.va_start(i8* %9)
  %10 = load %struct.tiff*, %struct.tiff** %4, align 8
  %11 = load i32, i32* %5, align 4
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %6, i32 0, i32 0
  %13 = call i32 @TIFFVSetField(%struct.tiff* %10, i32 %11, %struct.__va_list_tag* %12)
  store i32 %13, i32* %7, align 4
  %14 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %6, i32 0, i32 0
  %15 = bitcast %struct.__va_list_tag* %14 to i8*
  call void @llvm.va_end(i8* %15)
  %16 = load i32, i32* %7, align 4
  ret i32 %16
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #3

; Function Attrs: nounwind uwtable
define i32 @TIFFVSetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.__va_list_tag*, align 8
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  store %struct.__va_list_tag* %2, %struct.__va_list_tag** %6, align 8
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = load i32, i32* %5, align 4
  %9 = call i32 @OkToChangeTag(%struct.tiff* %7, i32 %8)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %21

; <label>:11:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFVSetField, i64 0, i64 0)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFVSetField, i64 0, i64 0)
  %13 = load %struct.tiff*, %struct.tiff** %4, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %13, i32 0, i32 57
  %15 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %14, align 8
  %16 = load %struct.tiff*, %struct.tiff** %4, align 8
  %17 = load i32, i32* %5, align 4
  %18 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %19 = ptrtoint i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* %15 to i64
  call void @__llvm_profile_instrument_target(i64 %19, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFVSetField to i8*), i32 0)
  %20 = call i32 %15(%struct.tiff* %16, i32 %17, %struct.__va_list_tag* %18)
  br label %23

; <label>:21:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFVSetField, i64 0, i64 1)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFVSetField, i64 0, i64 1)
  br label %23

; <label>:23:                                     ; preds = %21, %11
  %24 = phi i32 [ %20, %11 ], [ 0, %21 ]
  ret i32 %24
}

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #3

; Function Attrs: nounwind uwtable
define internal i32 @OkToChangeTag(%struct.tiff*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.TIFFFieldInfo*, align 8
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = load i32, i32* %5, align 4
  %9 = call %struct.TIFFFieldInfo* @_TIFFFindFieldInfo(%struct.tiff* %7, i32 %8, i32 0)
  store %struct.TIFFFieldInfo* %9, %struct.TIFFFieldInfo** %6, align 8
  %10 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %11 = icmp ne %struct.TIFFFieldInfo* %10, null
  br i1 %11, label %23, label %12

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_OkToChangeTag, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_OkToChangeTag, i64 0, i64 1)
  %14 = load %struct.tiff*, %struct.tiff** %4, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 0
  %16 = load i8*, i8** %15, align 8
  %17 = load i32, i32* %5, align 4
  %18 = icmp ugt i32 %17, 65535
  %19 = zext i1 %18 to i64
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_OkToChangeTag, i64 0, i64 5)
  %20 = add i64 %pgocount1, %19
  store i64 %20, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_OkToChangeTag, i64 0, i64 5)
  %21 = select i1 %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.6, i32 0, i32 0)
  %22 = load i32, i32* %5, align 4
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0), i8* %16, i8* %21, i32 %22)
  store i32 0, i32* %3, align 4
  br label %49

; <label>:23:                                     ; preds = %2
  %24 = load i32, i32* %5, align 4
  %25 = icmp ne i32 %24, 257
  br i1 %25, label %26, label %47

; <label>:26:                                     ; preds = %23
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_OkToChangeTag, i64 0, i64 2)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_OkToChangeTag, i64 0, i64 2)
  %28 = load %struct.tiff*, %struct.tiff** %4, align 8
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %28, i32 0, i32 3
  %30 = load i32, i32* %29, align 8
  %31 = and i32 %30, 64
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %47

; <label>:33:                                     ; preds = %26
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_OkToChangeTag, i64 0, i64 3)
  %34 = add i64 %pgocount3, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_OkToChangeTag, i64 0, i64 3)
  %35 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %36 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %35, i32 0, i32 5
  %37 = load i8, i8* %36, align 2
  %38 = icmp ne i8 %37, 0
  br i1 %38, label %47, label %39

; <label>:39:                                     ; preds = %33
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_OkToChangeTag, i64 0, i64 4)
  %40 = add i64 %pgocount4, 1
  store i64 %40, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_OkToChangeTag, i64 0, i64 4)
  %41 = load %struct.tiff*, %struct.tiff** %4, align 8
  %42 = getelementptr inbounds %struct.tiff, %struct.tiff* %41, i32 0, i32 0
  %43 = load i8*, i8** %42, align 8
  %44 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %45 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %44, i32 0, i32 7
  %46 = load i8*, i8** %45, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.7, i32 0, i32 0), i8* %43, i8* %46)
  store i32 0, i32* %3, align 4
  br label %49

; <label>:47:                                     ; preds = %33, %26, %23
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_OkToChangeTag, i64 0, i64 0)
  %48 = add i64 %pgocount5, 1
  store i64 %48, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_OkToChangeTag, i64 0, i64 0)
  store i32 1, i32* %3, align 4
  br label %49

; <label>:49:                                     ; preds = %47, %39, %12
  %50 = load i32, i32* %3, align 4
  ret i32 %50
}

; Function Attrs: nounwind uwtable
define i32 @TIFFGetField(%struct.tiff*, i32, ...) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFGetField, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFGetField, i64 0, i64 0)
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [1 x %struct.__va_list_tag], align 16
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %8 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %7, i32 0, i32 0
  %9 = bitcast %struct.__va_list_tag* %8 to i8*
  call void @llvm.va_start(i8* %9)
  %10 = load %struct.tiff*, %struct.tiff** %4, align 8
  %11 = load i32, i32* %5, align 4
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %7, i32 0, i32 0
  %13 = call i32 @TIFFVGetField(%struct.tiff* %10, i32 %11, %struct.__va_list_tag* %12)
  store i32 %13, i32* %6, align 4
  %14 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %7, i32 0, i32 0
  %15 = bitcast %struct.__va_list_tag* %14 to i8*
  call void @llvm.va_end(i8* %15)
  %16 = load i32, i32* %6, align 4
  ret i32 %16
}

; Function Attrs: nounwind uwtable
define i32 @TIFFVGetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.__va_list_tag*, align 8
  %7 = alloca %struct.TIFFFieldInfo*, align 8
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  store %struct.__va_list_tag* %2, %struct.__va_list_tag** %6, align 8
  %8 = load %struct.tiff*, %struct.tiff** %4, align 8
  %9 = load i32, i32* %5, align 4
  %10 = call %struct.TIFFFieldInfo* @_TIFFFindFieldInfo(%struct.tiff* %8, i32 %9, i32 0)
  store %struct.TIFFFieldInfo* %10, %struct.TIFFFieldInfo** %7, align 8
  %11 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %12 = icmp ne %struct.TIFFFieldInfo* %11, null
  br i1 %12, label %13, label %49

; <label>:13:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFVGetField, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFVGetField, i64 0, i64 0)
  %15 = load i32, i32* %5, align 4
  %16 = icmp ugt i32 %15, 65535
  br i1 %16, label %39, label %17

; <label>:17:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFVGetField, i64 0, i64 3)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFVGetField, i64 0, i64 3)
  %19 = load %struct.tiff*, %struct.tiff** %4, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %19, i32 0, i32 6
  %21 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %20, i32 0, i32 0
  %22 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %23 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %22, i32 0, i32 4
  %24 = load i16, i16* %23, align 4
  %25 = zext i16 %24 to i32
  %26 = sdiv i32 %25, 32
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [3 x i64], [3 x i64]* %21, i64 0, i64 %27
  %29 = load i64, i64* %28, align 8
  %30 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %31 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %30, i32 0, i32 4
  %32 = load i16, i16* %31, align 4
  %33 = zext i16 %32 to i32
  %34 = and i32 %33, 31
  %35 = zext i32 %34 to i64
  %36 = shl i64 1, %35
  %37 = and i64 %29, %36
  %38 = icmp ne i64 %37, 0
  br i1 %38, label %39, label %49

; <label>:39:                                     ; preds = %17, %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFVGetField, i64 0, i64 1)
  %40 = add i64 %pgocount2, 1
  store i64 %40, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFVGetField, i64 0, i64 1)
  %41 = load %struct.tiff*, %struct.tiff** %4, align 8
  %42 = getelementptr inbounds %struct.tiff, %struct.tiff* %41, i32 0, i32 58
  %43 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %42, align 8
  %44 = load %struct.tiff*, %struct.tiff** %4, align 8
  %45 = load i32, i32* %5, align 4
  %46 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %47 = ptrtoint i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* %43 to i64
  call void @__llvm_profile_instrument_target(i64 %47, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFVGetField to i8*), i32 0)
  %48 = call i32 %43(%struct.tiff* %44, i32 %45, %struct.__va_list_tag* %46)
  br label %51

; <label>:49:                                     ; preds = %17, %3
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFVGetField, i64 0, i64 2)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFVGetField, i64 0, i64 2)
  br label %51

; <label>:51:                                     ; preds = %49, %39
  %52 = phi i32 [ %48, %39 ], [ 0, %49 ]
  ret i32 %52
}

declare %struct.TIFFFieldInfo* @_TIFFFindFieldInfo(%struct.tiff*, i32, i32) #1

; Function Attrs: nounwind uwtable
define void @TIFFFreeDirectory(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  %3 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %4 = load %struct.tiff*, %struct.tiff** %2, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 6
  store %struct.TIFFDirectory* %5, %struct.TIFFDirectory** %3, align 8
  %6 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %7 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %6, i32 0, i32 28
  %8 = getelementptr inbounds [3 x i16*], [3 x i16*]* %7, i64 0, i64 0
  %9 = load i16*, i16** %8, align 8
  %10 = icmp ne i16* %9, null
  br i1 %10, label %11, label %21

; <label>:11:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 1)
  %13 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %14 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %13, i32 0, i32 28
  %15 = getelementptr inbounds [3 x i16*], [3 x i16*]* %14, i64 0, i64 0
  %16 = load i16*, i16** %15, align 8
  %17 = bitcast i16* %16 to i8*
  call void @_TIFFfree(i8* %17)
  %18 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %19 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %18, i32 0, i32 28
  %20 = getelementptr inbounds [3 x i16*], [3 x i16*]* %19, i64 0, i64 0
  store i16* null, i16** %20, align 8
  br label %21

; <label>:21:                                     ; preds = %11, %1
  %22 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %23 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %22, i32 0, i32 28
  %24 = getelementptr inbounds [3 x i16*], [3 x i16*]* %23, i64 0, i64 1
  %25 = load i16*, i16** %24, align 8
  %26 = icmp ne i16* %25, null
  br i1 %26, label %27, label %37

; <label>:27:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 2)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 2)
  %29 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %30 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %29, i32 0, i32 28
  %31 = getelementptr inbounds [3 x i16*], [3 x i16*]* %30, i64 0, i64 1
  %32 = load i16*, i16** %31, align 8
  %33 = bitcast i16* %32 to i8*
  call void @_TIFFfree(i8* %33)
  %34 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %35 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %34, i32 0, i32 28
  %36 = getelementptr inbounds [3 x i16*], [3 x i16*]* %35, i64 0, i64 1
  store i16* null, i16** %36, align 8
  br label %37

; <label>:37:                                     ; preds = %27, %21
  %38 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %39 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %38, i32 0, i32 28
  %40 = getelementptr inbounds [3 x i16*], [3 x i16*]* %39, i64 0, i64 2
  %41 = load i16*, i16** %40, align 8
  %42 = icmp ne i16* %41, null
  br i1 %42, label %43, label %53

; <label>:43:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 3)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 3)
  %45 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %46 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %45, i32 0, i32 28
  %47 = getelementptr inbounds [3 x i16*], [3 x i16*]* %46, i64 0, i64 2
  %48 = load i16*, i16** %47, align 8
  %49 = bitcast i16* %48 to i8*
  call void @_TIFFfree(i8* %49)
  %50 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %51 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %50, i32 0, i32 28
  %52 = getelementptr inbounds [3 x i16*], [3 x i16*]* %51, i64 0, i64 2
  store i16* null, i16** %52, align 8
  br label %53

; <label>:53:                                     ; preds = %43, %37
  %54 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %55 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %54, i32 0, i32 33
  %56 = load i8*, i8** %55, align 8
  %57 = icmp ne i8* %56, null
  br i1 %57, label %58, label %65

; <label>:58:                                     ; preds = %53
  %pgocount3 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 4)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 4)
  %60 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %61 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %60, i32 0, i32 33
  %62 = load i8*, i8** %61, align 8
  call void @_TIFFfree(i8* %62)
  %63 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %64 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %63, i32 0, i32 33
  store i8* null, i8** %64, align 8
  br label %65

; <label>:65:                                     ; preds = %58, %53
  %66 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %67 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %66, i32 0, i32 34
  %68 = load i8*, i8** %67, align 8
  %69 = icmp ne i8* %68, null
  br i1 %69, label %70, label %77

; <label>:70:                                     ; preds = %65
  %pgocount4 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 5)
  %71 = add i64 %pgocount4, 1
  store i64 %71, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 5)
  %72 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %73 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %72, i32 0, i32 34
  %74 = load i8*, i8** %73, align 8
  call void @_TIFFfree(i8* %74)
  %75 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %76 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %75, i32 0, i32 34
  store i8* null, i8** %76, align 8
  br label %77

; <label>:77:                                     ; preds = %70, %65
  %78 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %79 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %78, i32 0, i32 35
  %80 = load i8*, i8** %79, align 8
  %81 = icmp ne i8* %80, null
  br i1 %81, label %82, label %89

; <label>:82:                                     ; preds = %77
  %pgocount5 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 6)
  %83 = add i64 %pgocount5, 1
  store i64 %83, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 6)
  %84 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %85 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %84, i32 0, i32 35
  %86 = load i8*, i8** %85, align 8
  call void @_TIFFfree(i8* %86)
  %87 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %88 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %87, i32 0, i32 35
  store i8* null, i8** %88, align 8
  br label %89

; <label>:89:                                     ; preds = %82, %77
  %90 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %91 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %90, i32 0, i32 36
  %92 = load i8*, i8** %91, align 8
  %93 = icmp ne i8* %92, null
  br i1 %93, label %94, label %101

; <label>:94:                                     ; preds = %89
  %pgocount6 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 7)
  %95 = add i64 %pgocount6, 1
  store i64 %95, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 7)
  %96 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %97 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %96, i32 0, i32 36
  %98 = load i8*, i8** %97, align 8
  call void @_TIFFfree(i8* %98)
  %99 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %100 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %99, i32 0, i32 36
  store i8* null, i8** %100, align 8
  br label %101

; <label>:101:                                    ; preds = %94, %89
  %102 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %103 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %102, i32 0, i32 37
  %104 = load i8*, i8** %103, align 8
  %105 = icmp ne i8* %104, null
  br i1 %105, label %106, label %113

; <label>:106:                                    ; preds = %101
  %pgocount7 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 8)
  %107 = add i64 %pgocount7, 1
  store i64 %107, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 8)
  %108 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %109 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %108, i32 0, i32 37
  %110 = load i8*, i8** %109, align 8
  call void @_TIFFfree(i8* %110)
  %111 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %112 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %111, i32 0, i32 37
  store i8* null, i8** %112, align 8
  br label %113

; <label>:113:                                    ; preds = %106, %101
  %114 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %115 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %114, i32 0, i32 38
  %116 = load i8*, i8** %115, align 8
  %117 = icmp ne i8* %116, null
  br i1 %117, label %118, label %125

; <label>:118:                                    ; preds = %113
  %pgocount8 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 9)
  %119 = add i64 %pgocount8, 1
  store i64 %119, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 9)
  %120 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %121 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %120, i32 0, i32 38
  %122 = load i8*, i8** %121, align 8
  call void @_TIFFfree(i8* %122)
  %123 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %124 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %123, i32 0, i32 38
  store i8* null, i8** %124, align 8
  br label %125

; <label>:125:                                    ; preds = %118, %113
  %126 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %127 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %126, i32 0, i32 39
  %128 = load i8*, i8** %127, align 8
  %129 = icmp ne i8* %128, null
  br i1 %129, label %130, label %137

; <label>:130:                                    ; preds = %125
  %pgocount9 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 10)
  %131 = add i64 %pgocount9, 1
  store i64 %131, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 10)
  %132 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %133 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %132, i32 0, i32 39
  %134 = load i8*, i8** %133, align 8
  call void @_TIFFfree(i8* %134)
  %135 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %136 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %135, i32 0, i32 39
  store i8* null, i8** %136, align 8
  br label %137

; <label>:137:                                    ; preds = %130, %125
  %138 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %139 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %138, i32 0, i32 40
  %140 = load i8*, i8** %139, align 8
  %141 = icmp ne i8* %140, null
  br i1 %141, label %142, label %149

; <label>:142:                                    ; preds = %137
  %pgocount10 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 11)
  %143 = add i64 %pgocount10, 1
  store i64 %143, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 11)
  %144 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %145 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %144, i32 0, i32 40
  %146 = load i8*, i8** %145, align 8
  call void @_TIFFfree(i8* %146)
  %147 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %148 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %147, i32 0, i32 40
  store i8* null, i8** %148, align 8
  br label %149

; <label>:149:                                    ; preds = %142, %137
  %150 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %151 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %150, i32 0, i32 41
  %152 = load i8*, i8** %151, align 8
  %153 = icmp ne i8* %152, null
  br i1 %153, label %154, label %161

; <label>:154:                                    ; preds = %149
  %pgocount11 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 12)
  %155 = add i64 %pgocount11, 1
  store i64 %155, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 12)
  %156 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %157 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %156, i32 0, i32 41
  %158 = load i8*, i8** %157, align 8
  call void @_TIFFfree(i8* %158)
  %159 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %160 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %159, i32 0, i32 41
  store i8* null, i8** %160, align 8
  br label %161

; <label>:161:                                    ; preds = %154, %149
  %162 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %163 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %162, i32 0, i32 31
  %164 = load i16*, i16** %163, align 8
  %165 = icmp ne i16* %164, null
  br i1 %165, label %166, label %174

; <label>:166:                                    ; preds = %161
  %pgocount12 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 13)
  %167 = add i64 %pgocount12, 1
  store i64 %167, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 13)
  %168 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %169 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %168, i32 0, i32 31
  %170 = load i16*, i16** %169, align 8
  %171 = bitcast i16* %170 to i8*
  call void @_TIFFfree(i8* %171)
  %172 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %173 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %172, i32 0, i32 31
  store i16* null, i16** %173, align 8
  br label %174

; <label>:174:                                    ; preds = %166, %161
  %175 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %176 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %175, i32 0, i32 47
  %177 = load i32*, i32** %176, align 8
  %178 = icmp ne i32* %177, null
  br i1 %178, label %179, label %187

; <label>:179:                                    ; preds = %174
  %pgocount13 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 14)
  %180 = add i64 %pgocount13, 1
  store i64 %180, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 14)
  %181 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %182 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %181, i32 0, i32 47
  %183 = load i32*, i32** %182, align 8
  %184 = bitcast i32* %183 to i8*
  call void @_TIFFfree(i8* %184)
  %185 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %186 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %185, i32 0, i32 47
  store i32* null, i32** %186, align 8
  br label %187

; <label>:187:                                    ; preds = %179, %174
  %188 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %189 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %188, i32 0, i32 48
  %190 = load float*, float** %189, align 8
  %191 = icmp ne float* %190, null
  br i1 %191, label %192, label %200

; <label>:192:                                    ; preds = %187
  %pgocount14 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 15)
  %193 = add i64 %pgocount14, 1
  store i64 %193, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 15)
  %194 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %195 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %194, i32 0, i32 48
  %196 = load float*, float** %195, align 8
  %197 = bitcast float* %196 to i8*
  call void @_TIFFfree(i8* %197)
  %198 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %199 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %198, i32 0, i32 48
  store float* null, float** %199, align 8
  br label %200

; <label>:200:                                    ; preds = %192, %187
  %201 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %202 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %201, i32 0, i32 59
  %203 = load i8*, i8** %202, align 8
  %204 = icmp ne i8* %203, null
  br i1 %204, label %205, label %212

; <label>:205:                                    ; preds = %200
  %pgocount15 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 16)
  %206 = add i64 %pgocount15, 1
  store i64 %206, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 16)
  %207 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %208 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %207, i32 0, i32 59
  %209 = load i8*, i8** %208, align 8
  call void @_TIFFfree(i8* %209)
  %210 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %211 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %210, i32 0, i32 59
  store i8* null, i8** %211, align 8
  br label %212

; <label>:212:                                    ; preds = %205, %200
  %213 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %214 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %213, i32 0, i32 60
  %215 = load i8*, i8** %214, align 8
  %216 = icmp ne i8* %215, null
  br i1 %216, label %217, label %224

; <label>:217:                                    ; preds = %212
  %pgocount16 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 17)
  %218 = add i64 %pgocount16, 1
  store i64 %218, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 17)
  %219 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %220 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %219, i32 0, i32 60
  %221 = load i8*, i8** %220, align 8
  call void @_TIFFfree(i8* %221)
  %222 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %223 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %222, i32 0, i32 60
  store i8* null, i8** %223, align 8
  br label %224

; <label>:224:                                    ; preds = %217, %212
  %225 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %226 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %225, i32 0, i32 51
  %227 = load float*, float** %226, align 8
  %228 = icmp ne float* %227, null
  br i1 %228, label %229, label %237

; <label>:229:                                    ; preds = %224
  %pgocount17 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 18)
  %230 = add i64 %pgocount17, 1
  store i64 %230, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 18)
  %231 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %232 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %231, i32 0, i32 51
  %233 = load float*, float** %232, align 8
  %234 = bitcast float* %233 to i8*
  call void @_TIFFfree(i8* %234)
  %235 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %236 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %235, i32 0, i32 51
  store float* null, float** %236, align 8
  br label %237

; <label>:237:                                    ; preds = %229, %224
  %238 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %239 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %238, i32 0, i32 52
  %240 = load float*, float** %239, align 8
  %241 = icmp ne float* %240, null
  br i1 %241, label %242, label %250

; <label>:242:                                    ; preds = %237
  %pgocount18 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 19)
  %243 = add i64 %pgocount18, 1
  store i64 %243, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 19)
  %244 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %245 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %244, i32 0, i32 52
  %246 = load float*, float** %245, align 8
  %247 = bitcast float* %246 to i8*
  call void @_TIFFfree(i8* %247)
  %248 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %249 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %248, i32 0, i32 52
  store float* null, float** %249, align 8
  br label %250

; <label>:250:                                    ; preds = %242, %237
  %251 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %252 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %251, i32 0, i32 53
  %253 = load float*, float** %252, align 8
  %254 = icmp ne float* %253, null
  br i1 %254, label %255, label %263

; <label>:255:                                    ; preds = %250
  %pgocount19 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 20)
  %256 = add i64 %pgocount19, 1
  store i64 %256, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 20)
  %257 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %258 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %257, i32 0, i32 53
  %259 = load float*, float** %258, align 8
  %260 = bitcast float* %259 to i8*
  call void @_TIFFfree(i8* %260)
  %261 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %262 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %261, i32 0, i32 53
  store float* null, float** %262, align 8
  br label %263

; <label>:263:                                    ; preds = %255, %250
  %264 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %265 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %264, i32 0, i32 54
  %266 = getelementptr inbounds [3 x i16*], [3 x i16*]* %265, i64 0, i64 0
  %267 = load i16*, i16** %266, align 8
  %268 = icmp ne i16* %267, null
  br i1 %268, label %269, label %279

; <label>:269:                                    ; preds = %263
  %pgocount20 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 21)
  %270 = add i64 %pgocount20, 1
  store i64 %270, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 21)
  %271 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %272 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %271, i32 0, i32 54
  %273 = getelementptr inbounds [3 x i16*], [3 x i16*]* %272, i64 0, i64 0
  %274 = load i16*, i16** %273, align 8
  %275 = bitcast i16* %274 to i8*
  call void @_TIFFfree(i8* %275)
  %276 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %277 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %276, i32 0, i32 54
  %278 = getelementptr inbounds [3 x i16*], [3 x i16*]* %277, i64 0, i64 0
  store i16* null, i16** %278, align 8
  br label %279

; <label>:279:                                    ; preds = %269, %263
  %280 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %281 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %280, i32 0, i32 54
  %282 = getelementptr inbounds [3 x i16*], [3 x i16*]* %281, i64 0, i64 1
  %283 = load i16*, i16** %282, align 8
  %284 = icmp ne i16* %283, null
  br i1 %284, label %285, label %295

; <label>:285:                                    ; preds = %279
  %pgocount21 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 22)
  %286 = add i64 %pgocount21, 1
  store i64 %286, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 22)
  %287 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %288 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %287, i32 0, i32 54
  %289 = getelementptr inbounds [3 x i16*], [3 x i16*]* %288, i64 0, i64 1
  %290 = load i16*, i16** %289, align 8
  %291 = bitcast i16* %290 to i8*
  call void @_TIFFfree(i8* %291)
  %292 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %293 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %292, i32 0, i32 54
  %294 = getelementptr inbounds [3 x i16*], [3 x i16*]* %293, i64 0, i64 1
  store i16* null, i16** %294, align 8
  br label %295

; <label>:295:                                    ; preds = %285, %279
  %296 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %297 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %296, i32 0, i32 54
  %298 = getelementptr inbounds [3 x i16*], [3 x i16*]* %297, i64 0, i64 2
  %299 = load i16*, i16** %298, align 8
  %300 = icmp ne i16* %299, null
  br i1 %300, label %301, label %311

; <label>:301:                                    ; preds = %295
  %pgocount22 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 23)
  %302 = add i64 %pgocount22, 1
  store i64 %302, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 23)
  %303 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %304 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %303, i32 0, i32 54
  %305 = getelementptr inbounds [3 x i16*], [3 x i16*]* %304, i64 0, i64 2
  %306 = load i16*, i16** %305, align 8
  %307 = bitcast i16* %306 to i8*
  call void @_TIFFfree(i8* %307)
  %308 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %309 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %308, i32 0, i32 54
  %310 = getelementptr inbounds [3 x i16*], [3 x i16*]* %309, i64 0, i64 2
  store i16* null, i16** %310, align 8
  br label %311

; <label>:311:                                    ; preds = %301, %295
  %312 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %313 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %312, i32 0, i32 62
  %314 = load i8*, i8** %313, align 8
  %315 = icmp ne i8* %314, null
  br i1 %315, label %316, label %323

; <label>:316:                                    ; preds = %311
  %pgocount23 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 24)
  %317 = add i64 %pgocount23, 1
  store i64 %317, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 24)
  %318 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %319 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %318, i32 0, i32 62
  %320 = load i8*, i8** %319, align 8
  call void @_TIFFfree(i8* %320)
  %321 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %322 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %321, i32 0, i32 62
  store i8* null, i8** %322, align 8
  br label %323

; <label>:323:                                    ; preds = %316, %311
  %324 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %325 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %324, i32 0, i32 64
  %326 = load i8*, i8** %325, align 8
  %327 = icmp ne i8* %326, null
  br i1 %327, label %328, label %335

; <label>:328:                                    ; preds = %323
  %pgocount24 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 25)
  %329 = add i64 %pgocount24, 1
  store i64 %329, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 25)
  %330 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %331 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %330, i32 0, i32 64
  %332 = load i8*, i8** %331, align 8
  call void @_TIFFfree(i8* %332)
  %333 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %334 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %333, i32 0, i32 64
  store i8* null, i8** %334, align 8
  br label %335

; <label>:335:                                    ; preds = %328, %323
  %336 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %337 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %336, i32 0, i32 66
  %338 = load i8*, i8** %337, align 8
  %339 = icmp ne i8* %338, null
  br i1 %339, label %340, label %347

; <label>:340:                                    ; preds = %335
  %pgocount25 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 26)
  %341 = add i64 %pgocount25, 1
  store i64 %341, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 26)
  %342 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %343 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %342, i32 0, i32 66
  %344 = load i8*, i8** %343, align 8
  call void @_TIFFfree(i8* %344)
  %345 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %346 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %345, i32 0, i32 66
  store i8* null, i8** %346, align 8
  br label %347

; <label>:347:                                    ; preds = %340, %335
  %348 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %349 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %348, i32 0, i32 44
  %350 = load i32*, i32** %349, align 8
  %351 = icmp ne i32* %350, null
  br i1 %351, label %352, label %360

; <label>:352:                                    ; preds = %347
  %pgocount26 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 27)
  %353 = add i64 %pgocount26, 1
  store i64 %353, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 27)
  %354 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %355 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %354, i32 0, i32 44
  %356 = load i32*, i32** %355, align 8
  %357 = bitcast i32* %356 to i8*
  call void @_TIFFfree(i8* %357)
  %358 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %359 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %358, i32 0, i32 44
  store i32* null, i32** %359, align 8
  br label %360

; <label>:360:                                    ; preds = %352, %347
  %361 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %362 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %361, i32 0, i32 45
  %363 = load i32*, i32** %362, align 8
  %364 = icmp ne i32* %363, null
  br i1 %364, label %365, label %373

; <label>:365:                                    ; preds = %360
  %pgocount27 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 28)
  %366 = add i64 %pgocount27, 1
  store i64 %366, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 28)
  %367 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %368 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %367, i32 0, i32 45
  %369 = load i32*, i32** %368, align 8
  %370 = bitcast i32* %369 to i8*
  call void @_TIFFfree(i8* %370)
  %371 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %372 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %371, i32 0, i32 45
  store i32* null, i32** %372, align 8
  br label %373

; <label>:373:                                    ; preds = %365, %360
  %374 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %375 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %374, i32 0, i32 69
  %376 = load i8*, i8** %375, align 8
  %377 = icmp ne i8* %376, null
  br i1 %377, label %378, label %385

; <label>:378:                                    ; preds = %373
  %pgocount28 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 29)
  %379 = add i64 %pgocount28, 1
  store i64 %379, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 29)
  %380 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %381 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %380, i32 0, i32 69
  %382 = load i8*, i8** %381, align 8
  call void @_TIFFfree(i8* %382)
  %383 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %384 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %383, i32 0, i32 69
  store i8* null, i8** %384, align 8
  br label %385

; <label>:385:                                    ; preds = %378, %373
  %386 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %387 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %386, i32 0, i32 70
  %388 = load i8*, i8** %387, align 8
  %389 = icmp ne i8* %388, null
  br i1 %389, label %390, label %397

; <label>:390:                                    ; preds = %385
  %pgocount29 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 30)
  %391 = add i64 %pgocount29, 1
  store i64 %391, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 30)
  %392 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %393 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %392, i32 0, i32 70
  %394 = load i8*, i8** %393, align 8
  call void @_TIFFfree(i8* %394)
  %395 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %396 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %395, i32 0, i32 70
  store i8* null, i8** %396, align 8
  br label %397

; <label>:397:                                    ; preds = %390, %385
  %398 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %399 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %398, i32 0, i32 72
  %400 = load float*, float** %399, align 8
  %401 = icmp ne float* %400, null
  br i1 %401, label %402, label %410

; <label>:402:                                    ; preds = %397
  %pgocount30 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 31)
  %403 = add i64 %pgocount30, 1
  store i64 %403, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 31)
  %404 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %405 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %404, i32 0, i32 72
  %406 = load float*, float** %405, align 8
  %407 = bitcast float* %406 to i8*
  call void @_TIFFfree(i8* %407)
  %408 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %409 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %408, i32 0, i32 72
  store float* null, float** %409, align 8
  br label %410

; <label>:410:                                    ; preds = %402, %397
  %411 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %412 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %411, i32 0, i32 73
  %413 = load float*, float** %412, align 8
  %414 = icmp ne float* %413, null
  br i1 %414, label %415, label %423

; <label>:415:                                    ; preds = %410
  %pgocount31 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 32)
  %416 = add i64 %pgocount31, 1
  store i64 %416, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 32)
  %417 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %418 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %417, i32 0, i32 73
  %419 = load float*, float** %418, align 8
  %420 = bitcast float* %419 to i8*
  call void @_TIFFfree(i8* %420)
  %421 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %422 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %421, i32 0, i32 73
  store float* null, float** %422, align 8
  br label %423

; <label>:423:                                    ; preds = %415, %410
  %pgocount32 = load i64, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 0)
  %424 = add i64 %pgocount32, 1
  store i64 %424, i64* getelementptr inbounds ([33 x i64], [33 x i64]* @__profc_TIFFFreeDirectory, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind uwtable
define void (%struct.tiff*)* @TIFFSetTagExtender(void (%struct.tiff*)*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSetTagExtender, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSetTagExtender, i64 0, i64 0)
  %3 = alloca void (%struct.tiff*)*, align 8
  %4 = alloca void (%struct.tiff*)*, align 8
  store void (%struct.tiff*)* %0, void (%struct.tiff*)** %3, align 8
  %5 = load void (%struct.tiff*)*, void (%struct.tiff*)** @_TIFFextender, align 8
  store void (%struct.tiff*)* %5, void (%struct.tiff*)** %4, align 8
  %6 = load void (%struct.tiff*)*, void (%struct.tiff*)** %3, align 8
  store void (%struct.tiff*)* %6, void (%struct.tiff*)** @_TIFFextender, align 8
  %7 = load void (%struct.tiff*)*, void (%struct.tiff*)** %4, align 8
  ret void (%struct.tiff*)* %7
}

; Function Attrs: nounwind uwtable
define i32 @TIFFDefaultDirectory(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  %3 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %4 = load %struct.tiff*, %struct.tiff** %2, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 6
  store %struct.TIFFDirectory* %5, %struct.TIFFDirectory** %3, align 8
  %6 = load %struct.tiff*, %struct.tiff** %2, align 8
  call void @_TIFFSetupFieldInfo(%struct.tiff* %6)
  %7 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %8 = bitcast %struct.TIFFDirectory* %7 to i8*
  call void @_TIFFmemset(i8* %8, i32 0, i32 472)
  %9 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %10 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %9, i32 0, i32 13
  store i16 1, i16* %10, align 2
  %11 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %12 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %11, i32 0, i32 8
  store i16 1, i16* %12, align 4
  %13 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %14 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %13, i32 0, i32 12
  store i16 1, i16* %14, align 4
  %15 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %16 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %15, i32 0, i32 14
  store i16 1, i16* %16, align 8
  %17 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %18 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %17, i32 0, i32 15
  store i16 1, i16* %18, align 2
  %19 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %20 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %19, i32 0, i32 16
  store i32 -1, i32* %20, align 4
  %21 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %22 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %21, i32 0, i32 4
  store i32 -1, i32* %22, align 4
  %23 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %24 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %23, i32 0, i32 5
  store i32 -1, i32* %24, align 8
  %25 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %26 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %25, i32 0, i32 6
  store i32 1, i32* %26, align 4
  %27 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %28 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %27, i32 0, i32 23
  store i16 2, i16* %28, align 8
  %29 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %30 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %29, i32 0, i32 9
  store i16 4, i16* %30, align 2
  %31 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %32 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %31, i32 0, i32 3
  store i32 1, i32* %32, align 8
  %33 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %34 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %33, i32 0, i32 49
  %35 = getelementptr inbounds [2 x i16], [2 x i16]* %34, i64 0, i64 0
  store i16 2, i16* %35, align 8
  %36 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %37 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %36, i32 0, i32 49
  %38 = getelementptr inbounds [2 x i16], [2 x i16]* %37, i64 0, i64 1
  store i16 2, i16* %38, align 2
  %39 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %40 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %39, i32 0, i32 50
  store i16 1, i16* %40, align 4
  %41 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %42 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %41, i32 0, i32 55
  store i16 1, i16* %42, align 8
  %43 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %44 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %43, i32 0, i32 56
  store i16 4, i16* %44, align 2
  %45 = load %struct.tiff*, %struct.tiff** %2, align 8
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %45, i32 0, i32 54
  store void (%struct.tiff*, i8*, i32)* @_TIFFNoPostDecode, void (%struct.tiff*, i8*, i32)** %46, align 8
  %47 = load %struct.tiff*, %struct.tiff** %2, align 8
  %48 = getelementptr inbounds %struct.tiff, %struct.tiff* %47, i32 0, i32 57
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @_TIFFVSetField, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %48, align 8
  %49 = load %struct.tiff*, %struct.tiff** %2, align 8
  %50 = getelementptr inbounds %struct.tiff, %struct.tiff* %49, i32 0, i32 58
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @_TIFFVGetField, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %50, align 8
  %51 = load %struct.tiff*, %struct.tiff** %2, align 8
  %52 = getelementptr inbounds %struct.tiff, %struct.tiff* %51, i32 0, i32 59
  store void (%struct.tiff*, %struct._IO_FILE*, i64)* null, void (%struct.tiff*, %struct._IO_FILE*, i64)** %52, align 8
  %53 = load void (%struct.tiff*)*, void (%struct.tiff*)** @_TIFFextender, align 8
  %54 = icmp ne void (%struct.tiff*)* %53, null
  br i1 %54, label %55, label %60

; <label>:55:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFDefaultDirectory, i64 0, i64 1)
  %56 = add i64 %pgocount, 1
  store i64 %56, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFDefaultDirectory, i64 0, i64 1)
  %57 = load void (%struct.tiff*)*, void (%struct.tiff*)** @_TIFFextender, align 8
  %58 = load %struct.tiff*, %struct.tiff** %2, align 8
  %59 = ptrtoint void (%struct.tiff*)* %57 to i64
  call void @__llvm_profile_instrument_target(i64 %59, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFDefaultDirectory to i8*), i32 0)
  call void %57(%struct.tiff* %58)
  br label %60

; <label>:60:                                     ; preds = %55, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFDefaultDirectory, i64 0, i64 0)
  %61 = add i64 %pgocount1, 1
  store i64 %61, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFDefaultDirectory, i64 0, i64 0)
  %62 = load %struct.tiff*, %struct.tiff** %2, align 8
  %63 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %62, i32 259, i32 1)
  %64 = load %struct.tiff*, %struct.tiff** %2, align 8
  %65 = getelementptr inbounds %struct.tiff, %struct.tiff* %64, i32 0, i32 3
  %66 = load i32, i32* %65, align 8
  %67 = and i32 %66, -9
  store i32 %67, i32* %65, align 8
  ret i32 1
}

declare void @_TIFFSetupFieldInfo(%struct.tiff*) #1

declare void @_TIFFmemset(i8*, i32, i32) #1

declare void @_TIFFNoPostDecode(%struct.tiff*, i8*, i32) #1

; Function Attrs: nounwind uwtable
define internal i32 @_TIFFVSetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.__va_list_tag*, align 8
  %8 = alloca %struct.TIFFDirectory*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca double, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store %struct.__va_list_tag* %2, %struct.__va_list_tag** %7, align 8
  %16 = load %struct.tiff*, %struct.tiff** %5, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 6
  store %struct.TIFFDirectory* %17, %struct.TIFFDirectory** %8, align 8
  store i32 1, i32* %9, align 4
  %18 = load i32, i32* %6, align 4
  switch i32 %18, label %2126 [
    i32 254, label %19
    i32 256, label %42
    i32 257, label %65
    i32 258, label %88
    i32 259, label %152
    i32 262, label %231
    i32 263, label %255
    i32 266, label %279
    i32 269, label %313
    i32 315, label %336
    i32 306, label %359
    i32 316, label %382
    i32 270, label %405
    i32 271, label %428
    i32 272, label %451
    i32 305, label %474
    i32 274, label %497
    i32 277, label %541
    i32 278, label %571
    i32 280, label %618
    i32 281, label %642
    i32 340, label %666
    i32 341, label %689
    i32 282, label %712
    i32 283, label %736
    i32 284, label %760
    i32 285, label %794
    i32 286, label %817
    i32 287, label %841
    i32 296, label %865
    i32 297, label %899
    i32 321, label %947
    i32 320, label %995
    i32 338, label %1076
    i32 32995, label %1085
    i32 322, label %1120
    i32 323, label %1165
    i32 32998, label %1210
    i32 32996, label %1239
    i32 339, label %1275
    i32 32997, label %1309
    i32 37439, label %1332
    i32 33300, label %1360
    i32 33301, label %1383
    i32 33302, label %1406
    i32 33303, label %1429
    i32 33304, label %1452
    i32 33305, label %1476
    i32 33306, label %1499
    i32 330, label %1522
    i32 529, label %1583
    i32 531, label %1606
    i32 530, label %1630
    i32 318, label %1678
    i32 319, label %1701
    i32 301, label %1724
    i32 532, label %1779
    i32 332, label %1802
    i32 336, label %1826
    i32 333, label %1874
    i32 334, label %1934
    i32 337, label %1958
    i32 34675, label %1981
    i32 34377, label %2029
    i32 33723, label %2077
  ]

; <label>:19:                                     ; preds = %3
  %20 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %21 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %20, i32 0, i32 0
  %22 = load i32, i32* %21, align 8
  %23 = icmp ule i32 %22, 40
  br i1 %23, label %24, label %31

; <label>:24:                                     ; preds = %19
  %pgocount = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 45)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 45)
  %26 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %20, i32 0, i32 3
  %27 = load i8*, i8** %26, align 8
  %28 = getelementptr i8, i8* %27, i32 %22
  %29 = bitcast i8* %28 to i32*
  %30 = add i32 %22, 8
  store i32 %30, i32* %21, align 8
  br label %37

; <label>:31:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 46)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 46)
  %33 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %20, i32 0, i32 2
  %34 = load i8*, i8** %33, align 8
  %35 = bitcast i8* %34 to i32*
  %36 = getelementptr i8, i8* %34, i32 8
  store i8* %36, i8** %33, align 8
  br label %37

; <label>:37:                                     ; preds = %31, %24
  %38 = phi i32* [ %29, %24 ], [ %35, %31 ]
  %39 = load i32, i32* %38, align 4
  %40 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %41 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %40, i32 0, i32 7
  store i32 %39, i32* %41, align 8
  br label %2141

; <label>:42:                                     ; preds = %3
  %43 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %44 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %43, i32 0, i32 0
  %45 = load i32, i32* %44, align 8
  %46 = icmp ule i32 %45, 40
  br i1 %46, label %47, label %54

; <label>:47:                                     ; preds = %42
  %pgocount2 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 47)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 47)
  %49 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %43, i32 0, i32 3
  %50 = load i8*, i8** %49, align 8
  %51 = getelementptr i8, i8* %50, i32 %45
  %52 = bitcast i8* %51 to i32*
  %53 = add i32 %45, 8
  store i32 %53, i32* %44, align 8
  br label %60

; <label>:54:                                     ; preds = %42
  %pgocount3 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 48)
  %55 = add i64 %pgocount3, 1
  store i64 %55, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 48)
  %56 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %43, i32 0, i32 2
  %57 = load i8*, i8** %56, align 8
  %58 = bitcast i8* %57 to i32*
  %59 = getelementptr i8, i8* %57, i32 8
  store i8* %59, i8** %56, align 8
  br label %60

; <label>:60:                                     ; preds = %54, %47
  %61 = phi i32* [ %52, %47 ], [ %58, %54 ]
  %62 = load i32, i32* %61, align 4
  %63 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %64 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %63, i32 0, i32 1
  store i32 %62, i32* %64, align 8
  br label %2141

; <label>:65:                                     ; preds = %3
  %66 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %67 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %66, i32 0, i32 0
  %68 = load i32, i32* %67, align 8
  %69 = icmp ule i32 %68, 40
  br i1 %69, label %70, label %77

; <label>:70:                                     ; preds = %65
  %pgocount4 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 49)
  %71 = add i64 %pgocount4, 1
  store i64 %71, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 49)
  %72 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %66, i32 0, i32 3
  %73 = load i8*, i8** %72, align 8
  %74 = getelementptr i8, i8* %73, i32 %68
  %75 = bitcast i8* %74 to i32*
  %76 = add i32 %68, 8
  store i32 %76, i32* %67, align 8
  br label %83

; <label>:77:                                     ; preds = %65
  %pgocount5 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 50)
  %78 = add i64 %pgocount5, 1
  store i64 %78, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 50)
  %79 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %66, i32 0, i32 2
  %80 = load i8*, i8** %79, align 8
  %81 = bitcast i8* %80 to i32*
  %82 = getelementptr i8, i8* %80, i32 8
  store i8* %82, i8** %79, align 8
  br label %83

; <label>:83:                                     ; preds = %77, %70
  %84 = phi i32* [ %75, %70 ], [ %81, %77 ]
  %85 = load i32, i32* %84, align 4
  %86 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %87 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %86, i32 0, i32 2
  store i32 %85, i32* %87, align 4
  br label %2141

; <label>:88:                                     ; preds = %3
  %89 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %90 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %89, i32 0, i32 0
  %91 = load i32, i32* %90, align 8
  %92 = icmp ule i32 %91, 40
  br i1 %92, label %93, label %100

; <label>:93:                                     ; preds = %88
  %pgocount6 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 51)
  %94 = add i64 %pgocount6, 1
  store i64 %94, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 51)
  %95 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %89, i32 0, i32 3
  %96 = load i8*, i8** %95, align 8
  %97 = getelementptr i8, i8* %96, i32 %91
  %98 = bitcast i8* %97 to i32*
  %99 = add i32 %91, 8
  store i32 %99, i32* %90, align 8
  br label %106

; <label>:100:                                    ; preds = %88
  %pgocount7 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 52)
  %101 = add i64 %pgocount7, 1
  store i64 %101, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 52)
  %102 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %89, i32 0, i32 2
  %103 = load i8*, i8** %102, align 8
  %104 = bitcast i8* %103 to i32*
  %105 = getelementptr i8, i8* %103, i32 8
  store i8* %105, i8** %102, align 8
  br label %106

; <label>:106:                                    ; preds = %100, %93
  %107 = phi i32* [ %98, %93 ], [ %104, %100 ]
  %108 = load i32, i32* %107, align 4
  %109 = trunc i32 %108 to i16
  %110 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %111 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %110, i32 0, i32 8
  store i16 %109, i16* %111, align 4
  %112 = load %struct.tiff*, %struct.tiff** %5, align 8
  %113 = getelementptr inbounds %struct.tiff, %struct.tiff* %112, i32 0, i32 3
  %114 = load i32, i32* %113, align 8
  %115 = and i32 %114, 128
  %116 = icmp ne i32 %115, 0
  br i1 %116, label %117, label %151

; <label>:117:                                    ; preds = %106
  %118 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %119 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %118, i32 0, i32 8
  %120 = load i16, i16* %119, align 4
  %121 = zext i16 %120 to i32
  %122 = icmp eq i32 %121, 16
  br i1 %122, label %123, label %127

; <label>:123:                                    ; preds = %117
  %pgocount8 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 163)
  %124 = add i64 %pgocount8, 1
  store i64 %124, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 163)
  %125 = load %struct.tiff*, %struct.tiff** %5, align 8
  %126 = getelementptr inbounds %struct.tiff, %struct.tiff* %125, i32 0, i32 54
  store void (%struct.tiff*, i8*, i32)* @_TIFFSwab16BitData, void (%struct.tiff*, i8*, i32)** %126, align 8
  br label %150

; <label>:127:                                    ; preds = %117
  %128 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %129 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %128, i32 0, i32 8
  %130 = load i16, i16* %129, align 4
  %131 = zext i16 %130 to i32
  %132 = icmp eq i32 %131, 32
  br i1 %132, label %133, label %137

; <label>:133:                                    ; preds = %127
  %pgocount9 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 176)
  %134 = add i64 %pgocount9, 1
  store i64 %134, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 176)
  %135 = load %struct.tiff*, %struct.tiff** %5, align 8
  %136 = getelementptr inbounds %struct.tiff, %struct.tiff* %135, i32 0, i32 54
  store void (%struct.tiff*, i8*, i32)* @_TIFFSwab32BitData, void (%struct.tiff*, i8*, i32)** %136, align 8
  br label %149

; <label>:137:                                    ; preds = %127
  %pgocount10 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 177)
  %138 = add i64 %pgocount10, 1
  store i64 %138, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 177)
  %139 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %140 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %139, i32 0, i32 8
  %141 = load i16, i16* %140, align 4
  %142 = zext i16 %141 to i32
  %143 = icmp eq i32 %142, 64
  br i1 %143, label %144, label %148

; <label>:144:                                    ; preds = %137
  %pgocount11 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 178)
  %145 = add i64 %pgocount11, 1
  store i64 %145, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 178)
  %146 = load %struct.tiff*, %struct.tiff** %5, align 8
  %147 = getelementptr inbounds %struct.tiff, %struct.tiff* %146, i32 0, i32 54
  store void (%struct.tiff*, i8*, i32)* @_TIFFSwab64BitData, void (%struct.tiff*, i8*, i32)** %147, align 8
  br label %148

; <label>:148:                                    ; preds = %144, %137
  br label %149

; <label>:149:                                    ; preds = %148, %133
  br label %150

; <label>:150:                                    ; preds = %149, %123
  br label %151

; <label>:151:                                    ; preds = %150, %106
  br label %2141

; <label>:152:                                    ; preds = %3
  %153 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %154 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %153, i32 0, i32 0
  %155 = load i32, i32* %154, align 8
  %156 = icmp ule i32 %155, 40
  br i1 %156, label %157, label %164

; <label>:157:                                    ; preds = %152
  %pgocount12 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 53)
  %158 = add i64 %pgocount12, 1
  store i64 %158, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 53)
  %159 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %153, i32 0, i32 3
  %160 = load i8*, i8** %159, align 8
  %161 = getelementptr i8, i8* %160, i32 %155
  %162 = bitcast i8* %161 to i32*
  %163 = add i32 %155, 8
  store i32 %163, i32* %154, align 8
  br label %170

; <label>:164:                                    ; preds = %152
  %pgocount13 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 54)
  %165 = add i64 %pgocount13, 1
  store i64 %165, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 54)
  %166 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %153, i32 0, i32 2
  %167 = load i8*, i8** %166, align 8
  %168 = bitcast i8* %167 to i32*
  %169 = getelementptr i8, i8* %167, i32 8
  store i8* %169, i8** %166, align 8
  br label %170

; <label>:170:                                    ; preds = %164, %157
  %171 = phi i32* [ %162, %157 ], [ %168, %164 ]
  %172 = load i32, i32* %171, align 4
  %173 = and i32 %172, 65535
  store i32 %173, i32* %12, align 4
  %174 = load %struct.tiff*, %struct.tiff** %5, align 8
  %175 = getelementptr inbounds %struct.tiff, %struct.tiff* %174, i32 0, i32 6
  %176 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %175, i32 0, i32 0
  %177 = getelementptr inbounds [3 x i64], [3 x i64]* %176, i64 0, i64 0
  %178 = load i64, i64* %177, align 8
  %179 = and i64 %178, 128
  %180 = icmp ne i64 %179, 0
  br i1 %180, label %181, label %201

; <label>:181:                                    ; preds = %170
  %182 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %183 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %182, i32 0, i32 10
  %184 = load i16, i16* %183, align 8
  %185 = zext i16 %184 to i32
  %186 = load i32, i32* %12, align 4
  %187 = icmp eq i32 %185, %186
  br i1 %187, label %188, label %190

; <label>:188:                                    ; preds = %181
  %pgocount14 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 164)
  %189 = add i64 %pgocount14, 1
  store i64 %189, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 164)
  br label %2141

; <label>:190:                                    ; preds = %181
  %pgocount15 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 165)
  %191 = add i64 %pgocount15, 1
  store i64 %191, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 165)
  %192 = load %struct.tiff*, %struct.tiff** %5, align 8
  %193 = getelementptr inbounds %struct.tiff, %struct.tiff* %192, i32 0, i32 34
  %194 = load void (%struct.tiff*)*, void (%struct.tiff*)** %193, align 8
  %195 = load %struct.tiff*, %struct.tiff** %5, align 8
  %196 = ptrtoint void (%struct.tiff*)* %194 to i64
  call void @__llvm_profile_instrument_target(i64 %196, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll__TIFFVSetField to i8*), i32 0)
  call void %194(%struct.tiff* %195)
  %197 = load %struct.tiff*, %struct.tiff** %5, align 8
  %198 = getelementptr inbounds %struct.tiff, %struct.tiff* %197, i32 0, i32 3
  %199 = load i32, i32* %198, align 8
  %200 = and i32 %199, -33
  store i32 %200, i32* %198, align 8
  br label %201

; <label>:201:                                    ; preds = %190, %170
  %202 = load %struct.tiff*, %struct.tiff** %5, align 8
  %203 = getelementptr inbounds %struct.tiff, %struct.tiff* %202, i32 0, i32 2
  %204 = load i32, i32* %203, align 4
  %205 = icmp ne i32 %204, 0
  %206 = xor i1 %205, true
  %207 = zext i1 %206 to i32
  %208 = icmp eq i32 %207, 0
  br i1 %208, label %209, label %219

; <label>:209:                                    ; preds = %201
  %210 = load i32, i32* %12, align 4
  %211 = icmp eq i32 %210, 5
  br i1 %211, label %212, label %217

; <label>:212:                                    ; preds = %209
  %pgocount16 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 175)
  %213 = add i64 %pgocount16, 1
  store i64 %213, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 175)
  %214 = load %struct.tiff*, %struct.tiff** %5, align 8
  %215 = getelementptr inbounds %struct.tiff, %struct.tiff* %214, i32 0, i32 0
  %216 = load i8*, i8** %215, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %216, i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.8, i32 0, i32 0))
  store i32 1, i32* %12, align 4
  br label %217

; <label>:217:                                    ; preds = %212, %209
  %pgocount17 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 159)
  %218 = add i64 %pgocount17, 1
  store i64 %218, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 159)
  br label %219

; <label>:219:                                    ; preds = %217, %201
  %220 = load %struct.tiff*, %struct.tiff** %5, align 8
  %221 = load i32, i32* %12, align 4
  %222 = call i32 @TIFFSetCompressionScheme(%struct.tiff* %220, i32 %221)
  store i32 %222, i32* %9, align 4
  %223 = icmp ne i32 %222, 0
  br i1 %223, label %224, label %230

; <label>:224:                                    ; preds = %219
  %pgocount18 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 148)
  %225 = add i64 %pgocount18, 1
  store i64 %225, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 148)
  %226 = load i32, i32* %12, align 4
  %227 = trunc i32 %226 to i16
  %228 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %229 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %228, i32 0, i32 10
  store i16 %227, i16* %229, align 8
  br label %230

; <label>:230:                                    ; preds = %224, %219
  br label %2141

; <label>:231:                                    ; preds = %3
  %232 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %233 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %232, i32 0, i32 0
  %234 = load i32, i32* %233, align 8
  %235 = icmp ule i32 %234, 40
  br i1 %235, label %236, label %243

; <label>:236:                                    ; preds = %231
  %pgocount19 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 55)
  %237 = add i64 %pgocount19, 1
  store i64 %237, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 55)
  %238 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %232, i32 0, i32 3
  %239 = load i8*, i8** %238, align 8
  %240 = getelementptr i8, i8* %239, i32 %234
  %241 = bitcast i8* %240 to i32*
  %242 = add i32 %234, 8
  store i32 %242, i32* %233, align 8
  br label %249

; <label>:243:                                    ; preds = %231
  %pgocount20 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 56)
  %244 = add i64 %pgocount20, 1
  store i64 %244, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 56)
  %245 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %232, i32 0, i32 2
  %246 = load i8*, i8** %245, align 8
  %247 = bitcast i8* %246 to i32*
  %248 = getelementptr i8, i8* %246, i32 8
  store i8* %248, i8** %245, align 8
  br label %249

; <label>:249:                                    ; preds = %243, %236
  %250 = phi i32* [ %241, %236 ], [ %247, %243 ]
  %251 = load i32, i32* %250, align 4
  %252 = trunc i32 %251 to i16
  %253 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %254 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %253, i32 0, i32 11
  store i16 %252, i16* %254, align 2
  br label %2141

; <label>:255:                                    ; preds = %3
  %256 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %257 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %256, i32 0, i32 0
  %258 = load i32, i32* %257, align 8
  %259 = icmp ule i32 %258, 40
  br i1 %259, label %260, label %267

; <label>:260:                                    ; preds = %255
  %pgocount21 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 57)
  %261 = add i64 %pgocount21, 1
  store i64 %261, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 57)
  %262 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %256, i32 0, i32 3
  %263 = load i8*, i8** %262, align 8
  %264 = getelementptr i8, i8* %263, i32 %258
  %265 = bitcast i8* %264 to i32*
  %266 = add i32 %258, 8
  store i32 %266, i32* %257, align 8
  br label %273

; <label>:267:                                    ; preds = %255
  %pgocount22 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 58)
  %268 = add i64 %pgocount22, 1
  store i64 %268, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 58)
  %269 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %256, i32 0, i32 2
  %270 = load i8*, i8** %269, align 8
  %271 = bitcast i8* %270 to i32*
  %272 = getelementptr i8, i8* %270, i32 8
  store i8* %272, i8** %269, align 8
  br label %273

; <label>:273:                                    ; preds = %267, %260
  %274 = phi i32* [ %265, %260 ], [ %271, %267 ]
  %275 = load i32, i32* %274, align 4
  %276 = trunc i32 %275 to i16
  %277 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %278 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %277, i32 0, i32 12
  store i16 %276, i16* %278, align 4
  br label %2141

; <label>:279:                                    ; preds = %3
  %280 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %281 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %280, i32 0, i32 0
  %282 = load i32, i32* %281, align 8
  %283 = icmp ule i32 %282, 40
  br i1 %283, label %284, label %291

; <label>:284:                                    ; preds = %279
  %pgocount23 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 59)
  %285 = add i64 %pgocount23, 1
  store i64 %285, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 59)
  %286 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %280, i32 0, i32 3
  %287 = load i8*, i8** %286, align 8
  %288 = getelementptr i8, i8* %287, i32 %282
  %289 = bitcast i8* %288 to i32*
  %290 = add i32 %282, 8
  store i32 %290, i32* %281, align 8
  br label %297

; <label>:291:                                    ; preds = %279
  %pgocount24 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 60)
  %292 = add i64 %pgocount24, 1
  store i64 %292, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 60)
  %293 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %280, i32 0, i32 2
  %294 = load i8*, i8** %293, align 8
  %295 = bitcast i8* %294 to i32*
  %296 = getelementptr i8, i8* %294, i32 8
  store i8* %296, i8** %293, align 8
  br label %297

; <label>:297:                                    ; preds = %291, %284
  %298 = phi i32* [ %289, %284 ], [ %295, %291 ]
  %299 = load i32, i32* %298, align 4
  store i32 %299, i32* %12, align 4
  %300 = load i32, i32* %12, align 4
  %301 = icmp ne i32 %300, 2
  br i1 %301, label %302, label %308

; <label>:302:                                    ; preds = %297
  %pgocount25 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 61)
  %303 = add i64 %pgocount25, 1
  store i64 %303, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 61)
  %304 = load i32, i32* %12, align 4
  %305 = icmp ne i32 %304, 1
  br i1 %305, label %306, label %308

; <label>:306:                                    ; preds = %302
  %pgocount26 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 166)
  %307 = add i64 %pgocount26, 1
  store i64 %307, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 166)
  br label %2177

; <label>:308:                                    ; preds = %302, %297
  %309 = load i32, i32* %12, align 4
  %310 = trunc i32 %309 to i16
  %311 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %312 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %311, i32 0, i32 13
  store i16 %310, i16* %312, align 2
  br label %2141

; <label>:313:                                    ; preds = %3
  %314 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %315 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %314, i32 0, i32 33
  %316 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %317 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %316, i32 0, i32 0
  %318 = load i32, i32* %317, align 8
  %319 = icmp ule i32 %318, 40
  br i1 %319, label %320, label %327

; <label>:320:                                    ; preds = %313
  %pgocount27 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 62)
  %321 = add i64 %pgocount27, 1
  store i64 %321, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 62)
  %322 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %316, i32 0, i32 3
  %323 = load i8*, i8** %322, align 8
  %324 = getelementptr i8, i8* %323, i32 %318
  %325 = bitcast i8* %324 to i8**
  %326 = add i32 %318, 8
  store i32 %326, i32* %317, align 8
  br label %333

; <label>:327:                                    ; preds = %313
  %pgocount28 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 63)
  %328 = add i64 %pgocount28, 1
  store i64 %328, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 63)
  %329 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %316, i32 0, i32 2
  %330 = load i8*, i8** %329, align 8
  %331 = bitcast i8* %330 to i8**
  %332 = getelementptr i8, i8* %330, i32 8
  store i8* %332, i8** %329, align 8
  br label %333

; <label>:333:                                    ; preds = %327, %320
  %334 = phi i8** [ %325, %320 ], [ %331, %327 ]
  %335 = load i8*, i8** %334, align 8
  call void @_TIFFsetString(i8** %315, i8* %335)
  br label %2141

; <label>:336:                                    ; preds = %3
  %337 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %338 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %337, i32 0, i32 34
  %339 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %340 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %339, i32 0, i32 0
  %341 = load i32, i32* %340, align 8
  %342 = icmp ule i32 %341, 40
  br i1 %342, label %343, label %350

; <label>:343:                                    ; preds = %336
  %pgocount29 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 64)
  %344 = add i64 %pgocount29, 1
  store i64 %344, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 64)
  %345 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %339, i32 0, i32 3
  %346 = load i8*, i8** %345, align 8
  %347 = getelementptr i8, i8* %346, i32 %341
  %348 = bitcast i8* %347 to i8**
  %349 = add i32 %341, 8
  store i32 %349, i32* %340, align 8
  br label %356

; <label>:350:                                    ; preds = %336
  %pgocount30 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 65)
  %351 = add i64 %pgocount30, 1
  store i64 %351, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 65)
  %352 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %339, i32 0, i32 2
  %353 = load i8*, i8** %352, align 8
  %354 = bitcast i8* %353 to i8**
  %355 = getelementptr i8, i8* %353, i32 8
  store i8* %355, i8** %352, align 8
  br label %356

; <label>:356:                                    ; preds = %350, %343
  %357 = phi i8** [ %348, %343 ], [ %354, %350 ]
  %358 = load i8*, i8** %357, align 8
  call void @_TIFFsetString(i8** %338, i8* %358)
  br label %2141

; <label>:359:                                    ; preds = %3
  %360 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %361 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %360, i32 0, i32 35
  %362 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %363 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %362, i32 0, i32 0
  %364 = load i32, i32* %363, align 8
  %365 = icmp ule i32 %364, 40
  br i1 %365, label %366, label %373

; <label>:366:                                    ; preds = %359
  %pgocount31 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 11)
  %367 = add i64 %pgocount31, 1
  store i64 %367, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 11)
  %368 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %362, i32 0, i32 3
  %369 = load i8*, i8** %368, align 8
  %370 = getelementptr i8, i8* %369, i32 %364
  %371 = bitcast i8* %370 to i8**
  %372 = add i32 %364, 8
  store i32 %372, i32* %363, align 8
  br label %379

; <label>:373:                                    ; preds = %359
  %pgocount32 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 12)
  %374 = add i64 %pgocount32, 1
  store i64 %374, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 12)
  %375 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %362, i32 0, i32 2
  %376 = load i8*, i8** %375, align 8
  %377 = bitcast i8* %376 to i8**
  %378 = getelementptr i8, i8* %376, i32 8
  store i8* %378, i8** %375, align 8
  br label %379

; <label>:379:                                    ; preds = %373, %366
  %380 = phi i8** [ %371, %366 ], [ %377, %373 ]
  %381 = load i8*, i8** %380, align 8
  call void @_TIFFsetString(i8** %361, i8* %381)
  br label %2141

; <label>:382:                                    ; preds = %3
  %383 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %384 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %383, i32 0, i32 36
  %385 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %386 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %385, i32 0, i32 0
  %387 = load i32, i32* %386, align 8
  %388 = icmp ule i32 %387, 40
  br i1 %388, label %389, label %396

; <label>:389:                                    ; preds = %382
  %pgocount33 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 66)
  %390 = add i64 %pgocount33, 1
  store i64 %390, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 66)
  %391 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %385, i32 0, i32 3
  %392 = load i8*, i8** %391, align 8
  %393 = getelementptr i8, i8* %392, i32 %387
  %394 = bitcast i8* %393 to i8**
  %395 = add i32 %387, 8
  store i32 %395, i32* %386, align 8
  br label %402

; <label>:396:                                    ; preds = %382
  %pgocount34 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 67)
  %397 = add i64 %pgocount34, 1
  store i64 %397, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 67)
  %398 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %385, i32 0, i32 2
  %399 = load i8*, i8** %398, align 8
  %400 = bitcast i8* %399 to i8**
  %401 = getelementptr i8, i8* %399, i32 8
  store i8* %401, i8** %398, align 8
  br label %402

; <label>:402:                                    ; preds = %396, %389
  %403 = phi i8** [ %394, %389 ], [ %400, %396 ]
  %404 = load i8*, i8** %403, align 8
  call void @_TIFFsetString(i8** %384, i8* %404)
  br label %2141

; <label>:405:                                    ; preds = %3
  %406 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %407 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %406, i32 0, i32 37
  %408 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %409 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %408, i32 0, i32 0
  %410 = load i32, i32* %409, align 8
  %411 = icmp ule i32 %410, 40
  br i1 %411, label %412, label %419

; <label>:412:                                    ; preds = %405
  %pgocount35 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 68)
  %413 = add i64 %pgocount35, 1
  store i64 %413, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 68)
  %414 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %408, i32 0, i32 3
  %415 = load i8*, i8** %414, align 8
  %416 = getelementptr i8, i8* %415, i32 %410
  %417 = bitcast i8* %416 to i8**
  %418 = add i32 %410, 8
  store i32 %418, i32* %409, align 8
  br label %425

; <label>:419:                                    ; preds = %405
  %pgocount36 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 69)
  %420 = add i64 %pgocount36, 1
  store i64 %420, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 69)
  %421 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %408, i32 0, i32 2
  %422 = load i8*, i8** %421, align 8
  %423 = bitcast i8* %422 to i8**
  %424 = getelementptr i8, i8* %422, i32 8
  store i8* %424, i8** %421, align 8
  br label %425

; <label>:425:                                    ; preds = %419, %412
  %426 = phi i8** [ %417, %412 ], [ %423, %419 ]
  %427 = load i8*, i8** %426, align 8
  call void @_TIFFsetString(i8** %407, i8* %427)
  br label %2141

; <label>:428:                                    ; preds = %3
  %429 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %430 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %429, i32 0, i32 38
  %431 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %432 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %431, i32 0, i32 0
  %433 = load i32, i32* %432, align 8
  %434 = icmp ule i32 %433, 40
  br i1 %434, label %435, label %442

; <label>:435:                                    ; preds = %428
  %pgocount37 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 13)
  %436 = add i64 %pgocount37, 1
  store i64 %436, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 13)
  %437 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %431, i32 0, i32 3
  %438 = load i8*, i8** %437, align 8
  %439 = getelementptr i8, i8* %438, i32 %433
  %440 = bitcast i8* %439 to i8**
  %441 = add i32 %433, 8
  store i32 %441, i32* %432, align 8
  br label %448

; <label>:442:                                    ; preds = %428
  %pgocount38 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 14)
  %443 = add i64 %pgocount38, 1
  store i64 %443, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 14)
  %444 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %431, i32 0, i32 2
  %445 = load i8*, i8** %444, align 8
  %446 = bitcast i8* %445 to i8**
  %447 = getelementptr i8, i8* %445, i32 8
  store i8* %447, i8** %444, align 8
  br label %448

; <label>:448:                                    ; preds = %442, %435
  %449 = phi i8** [ %440, %435 ], [ %446, %442 ]
  %450 = load i8*, i8** %449, align 8
  call void @_TIFFsetString(i8** %430, i8* %450)
  br label %2141

; <label>:451:                                    ; preds = %3
  %452 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %453 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %452, i32 0, i32 39
  %454 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %455 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %454, i32 0, i32 0
  %456 = load i32, i32* %455, align 8
  %457 = icmp ule i32 %456, 40
  br i1 %457, label %458, label %465

; <label>:458:                                    ; preds = %451
  %pgocount39 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 70)
  %459 = add i64 %pgocount39, 1
  store i64 %459, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 70)
  %460 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %454, i32 0, i32 3
  %461 = load i8*, i8** %460, align 8
  %462 = getelementptr i8, i8* %461, i32 %456
  %463 = bitcast i8* %462 to i8**
  %464 = add i32 %456, 8
  store i32 %464, i32* %455, align 8
  br label %471

; <label>:465:                                    ; preds = %451
  %pgocount40 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 71)
  %466 = add i64 %pgocount40, 1
  store i64 %466, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 71)
  %467 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %454, i32 0, i32 2
  %468 = load i8*, i8** %467, align 8
  %469 = bitcast i8* %468 to i8**
  %470 = getelementptr i8, i8* %468, i32 8
  store i8* %470, i8** %467, align 8
  br label %471

; <label>:471:                                    ; preds = %465, %458
  %472 = phi i8** [ %463, %458 ], [ %469, %465 ]
  %473 = load i8*, i8** %472, align 8
  call void @_TIFFsetString(i8** %453, i8* %473)
  br label %2141

; <label>:474:                                    ; preds = %3
  %475 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %476 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %475, i32 0, i32 40
  %477 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %478 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %477, i32 0, i32 0
  %479 = load i32, i32* %478, align 8
  %480 = icmp ule i32 %479, 40
  br i1 %480, label %481, label %488

; <label>:481:                                    ; preds = %474
  %pgocount41 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 15)
  %482 = add i64 %pgocount41, 1
  store i64 %482, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 15)
  %483 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %477, i32 0, i32 3
  %484 = load i8*, i8** %483, align 8
  %485 = getelementptr i8, i8* %484, i32 %479
  %486 = bitcast i8* %485 to i8**
  %487 = add i32 %479, 8
  store i32 %487, i32* %478, align 8
  br label %494

; <label>:488:                                    ; preds = %474
  %pgocount42 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 16)
  %489 = add i64 %pgocount42, 1
  store i64 %489, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 16)
  %490 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %477, i32 0, i32 2
  %491 = load i8*, i8** %490, align 8
  %492 = bitcast i8* %491 to i8**
  %493 = getelementptr i8, i8* %491, i32 8
  store i8* %493, i8** %490, align 8
  br label %494

; <label>:494:                                    ; preds = %488, %481
  %495 = phi i8** [ %486, %481 ], [ %492, %488 ]
  %496 = load i8*, i8** %495, align 8
  call void @_TIFFsetString(i8** %476, i8* %496)
  br label %2141

; <label>:497:                                    ; preds = %3
  %498 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %499 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %498, i32 0, i32 0
  %500 = load i32, i32* %499, align 8
  %501 = icmp ule i32 %500, 40
  br i1 %501, label %502, label %509

; <label>:502:                                    ; preds = %497
  %pgocount43 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 72)
  %503 = add i64 %pgocount43, 1
  store i64 %503, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 72)
  %504 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %498, i32 0, i32 3
  %505 = load i8*, i8** %504, align 8
  %506 = getelementptr i8, i8* %505, i32 %500
  %507 = bitcast i8* %506 to i32*
  %508 = add i32 %500, 8
  store i32 %508, i32* %499, align 8
  br label %515

; <label>:509:                                    ; preds = %497
  %pgocount44 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 73)
  %510 = add i64 %pgocount44, 1
  store i64 %510, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 73)
  %511 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %498, i32 0, i32 2
  %512 = load i8*, i8** %511, align 8
  %513 = bitcast i8* %512 to i32*
  %514 = getelementptr i8, i8* %512, i32 8
  store i8* %514, i8** %511, align 8
  br label %515

; <label>:515:                                    ; preds = %509, %502
  %516 = phi i32* [ %507, %502 ], [ %513, %509 ]
  %517 = load i32, i32* %516, align 4
  store i32 %517, i32* %12, align 4
  %518 = load i32, i32* %12, align 4
  %519 = icmp slt i32 %518, 1
  br i1 %519, label %524, label %520

; <label>:520:                                    ; preds = %515
  %pgocount45 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 7)
  %521 = add i64 %pgocount45, 1
  store i64 %521, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 7)
  %522 = load i32, i32* %12, align 4
  %523 = icmp slt i32 8, %522
  br i1 %523, label %524, label %534

; <label>:524:                                    ; preds = %520, %515
  %525 = load %struct.tiff*, %struct.tiff** %5, align 8
  %526 = getelementptr inbounds %struct.tiff, %struct.tiff* %525, i32 0, i32 0
  %527 = load i8*, i8** %526, align 8
  %528 = load i32, i32* %12, align 4
  %529 = load %struct.tiff*, %struct.tiff** %5, align 8
  %530 = load i32, i32* %6, align 4
  %531 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %529, i32 %530)
  %532 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %531, i32 0, i32 7
  %533 = load i8*, i8** %532, align 8
  call void (i8*, i8*, ...) @TIFFWarning(i8* %527, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.9, i32 0, i32 0), i32 %528, i8* %533)
  br label %540

; <label>:534:                                    ; preds = %520
  %pgocount46 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 155)
  %535 = add i64 %pgocount46, 1
  store i64 %535, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 155)
  %536 = load i32, i32* %12, align 4
  %537 = trunc i32 %536 to i16
  %538 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %539 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %538, i32 0, i32 14
  store i16 %537, i16* %539, align 8
  br label %540

; <label>:540:                                    ; preds = %534, %524
  br label %2141

; <label>:541:                                    ; preds = %3
  %542 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %543 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %542, i32 0, i32 0
  %544 = load i32, i32* %543, align 8
  %545 = icmp ule i32 %544, 40
  br i1 %545, label %546, label %553

; <label>:546:                                    ; preds = %541
  %pgocount47 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 74)
  %547 = add i64 %pgocount47, 1
  store i64 %547, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 74)
  %548 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %542, i32 0, i32 3
  %549 = load i8*, i8** %548, align 8
  %550 = getelementptr i8, i8* %549, i32 %544
  %551 = bitcast i8* %550 to i32*
  %552 = add i32 %544, 8
  store i32 %552, i32* %543, align 8
  br label %559

; <label>:553:                                    ; preds = %541
  %pgocount48 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 75)
  %554 = add i64 %pgocount48, 1
  store i64 %554, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 75)
  %555 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %542, i32 0, i32 2
  %556 = load i8*, i8** %555, align 8
  %557 = bitcast i8* %556 to i32*
  %558 = getelementptr i8, i8* %556, i32 8
  store i8* %558, i8** %555, align 8
  br label %559

; <label>:559:                                    ; preds = %553, %546
  %560 = phi i32* [ %551, %546 ], [ %557, %553 ]
  %561 = load i32, i32* %560, align 4
  store i32 %561, i32* %12, align 4
  %562 = load i32, i32* %12, align 4
  %563 = icmp eq i32 %562, 0
  br i1 %563, label %564, label %566

; <label>:564:                                    ; preds = %559
  %pgocount49 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 152)
  %565 = add i64 %pgocount49, 1
  store i64 %565, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 152)
  br label %2177

; <label>:566:                                    ; preds = %559
  %567 = load i32, i32* %12, align 4
  %568 = trunc i32 %567 to i16
  %569 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %570 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %569, i32 0, i32 15
  store i16 %568, i16* %570, align 2
  br label %2141

; <label>:571:                                    ; preds = %3
  %572 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %573 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %572, i32 0, i32 0
  %574 = load i32, i32* %573, align 8
  %575 = icmp ule i32 %574, 40
  br i1 %575, label %576, label %583

; <label>:576:                                    ; preds = %571
  %pgocount50 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 76)
  %577 = add i64 %pgocount50, 1
  store i64 %577, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 76)
  %578 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %572, i32 0, i32 3
  %579 = load i8*, i8** %578, align 8
  %580 = getelementptr i8, i8* %579, i32 %574
  %581 = bitcast i8* %580 to i32*
  %582 = add i32 %574, 8
  store i32 %582, i32* %573, align 8
  br label %589

; <label>:583:                                    ; preds = %571
  %pgocount51 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 77)
  %584 = add i64 %pgocount51, 1
  store i64 %584, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 77)
  %585 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %572, i32 0, i32 2
  %586 = load i8*, i8** %585, align 8
  %587 = bitcast i8* %586 to i32*
  %588 = getelementptr i8, i8* %586, i32 8
  store i8* %588, i8** %585, align 8
  br label %589

; <label>:589:                                    ; preds = %583, %576
  %590 = phi i32* [ %581, %576 ], [ %587, %583 ]
  %591 = load i32, i32* %590, align 4
  store i32 %591, i32* %10, align 4
  %592 = load i32, i32* %10, align 4
  %593 = icmp eq i32 %592, 0
  br i1 %593, label %594, label %596

; <label>:594:                                    ; preds = %589
  %pgocount52 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 153)
  %595 = add i64 %pgocount52, 1
  store i64 %595, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 153)
  br label %2189

; <label>:596:                                    ; preds = %589
  %597 = load i32, i32* %10, align 4
  %598 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %599 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %598, i32 0, i32 16
  store i32 %597, i32* %599, align 4
  %600 = load %struct.tiff*, %struct.tiff** %5, align 8
  %601 = getelementptr inbounds %struct.tiff, %struct.tiff* %600, i32 0, i32 6
  %602 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %601, i32 0, i32 0
  %603 = getelementptr inbounds [3 x i64], [3 x i64]* %602, i64 0, i64 0
  %604 = load i64, i64* %603, align 8
  %605 = and i64 %604, 4
  %606 = icmp ne i64 %605, 0
  br i1 %606, label %617, label %607

; <label>:607:                                    ; preds = %596
  %pgocount53 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 156)
  %608 = add i64 %pgocount53, 1
  store i64 %608, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 156)
  %609 = load i32, i32* %10, align 4
  %610 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %611 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %610, i32 0, i32 5
  store i32 %609, i32* %611, align 8
  %612 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %613 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %612, i32 0, i32 1
  %614 = load i32, i32* %613, align 8
  %615 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %616 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %615, i32 0, i32 4
  store i32 %614, i32* %616, align 4
  br label %617

; <label>:617:                                    ; preds = %607, %596
  br label %2141

; <label>:618:                                    ; preds = %3
  %619 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %620 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %619, i32 0, i32 0
  %621 = load i32, i32* %620, align 8
  %622 = icmp ule i32 %621, 40
  br i1 %622, label %623, label %630

; <label>:623:                                    ; preds = %618
  %pgocount54 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 78)
  %624 = add i64 %pgocount54, 1
  store i64 %624, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 78)
  %625 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %619, i32 0, i32 3
  %626 = load i8*, i8** %625, align 8
  %627 = getelementptr i8, i8* %626, i32 %621
  %628 = bitcast i8* %627 to i32*
  %629 = add i32 %621, 8
  store i32 %629, i32* %620, align 8
  br label %636

; <label>:630:                                    ; preds = %618
  %pgocount55 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 79)
  %631 = add i64 %pgocount55, 1
  store i64 %631, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 79)
  %632 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %619, i32 0, i32 2
  %633 = load i8*, i8** %632, align 8
  %634 = bitcast i8* %633 to i32*
  %635 = getelementptr i8, i8* %633, i32 8
  store i8* %635, i8** %632, align 8
  br label %636

; <label>:636:                                    ; preds = %630, %623
  %637 = phi i32* [ %628, %623 ], [ %634, %630 ]
  %638 = load i32, i32* %637, align 4
  %639 = trunc i32 %638 to i16
  %640 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %641 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %640, i32 0, i32 17
  store i16 %639, i16* %641, align 8
  br label %2141

; <label>:642:                                    ; preds = %3
  %643 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %644 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %643, i32 0, i32 0
  %645 = load i32, i32* %644, align 8
  %646 = icmp ule i32 %645, 40
  br i1 %646, label %647, label %654

; <label>:647:                                    ; preds = %642
  %pgocount56 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 80)
  %648 = add i64 %pgocount56, 1
  store i64 %648, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 80)
  %649 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %643, i32 0, i32 3
  %650 = load i8*, i8** %649, align 8
  %651 = getelementptr i8, i8* %650, i32 %645
  %652 = bitcast i8* %651 to i32*
  %653 = add i32 %645, 8
  store i32 %653, i32* %644, align 8
  br label %660

; <label>:654:                                    ; preds = %642
  %pgocount57 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 81)
  %655 = add i64 %pgocount57, 1
  store i64 %655, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 81)
  %656 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %643, i32 0, i32 2
  %657 = load i8*, i8** %656, align 8
  %658 = bitcast i8* %657 to i32*
  %659 = getelementptr i8, i8* %657, i32 8
  store i8* %659, i8** %656, align 8
  br label %660

; <label>:660:                                    ; preds = %654, %647
  %661 = phi i32* [ %652, %647 ], [ %658, %654 ]
  %662 = load i32, i32* %661, align 4
  %663 = trunc i32 %662 to i16
  %664 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %665 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %664, i32 0, i32 18
  store i16 %663, i16* %665, align 2
  br label %2141

; <label>:666:                                    ; preds = %3
  %667 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %668 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %667, i32 0, i32 1
  %669 = load i32, i32* %668, align 4
  %670 = icmp ule i32 %669, 160
  br i1 %670, label %671, label %678

; <label>:671:                                    ; preds = %666
  %pgocount58 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 82)
  %672 = add i64 %pgocount58, 1
  store i64 %672, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 82)
  %673 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %667, i32 0, i32 3
  %674 = load i8*, i8** %673, align 8
  %675 = getelementptr i8, i8* %674, i32 %669
  %676 = bitcast i8* %675 to double*
  %677 = add i32 %669, 16
  store i32 %677, i32* %668, align 4
  br label %684

; <label>:678:                                    ; preds = %666
  %pgocount59 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 83)
  %679 = add i64 %pgocount59, 1
  store i64 %679, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 83)
  %680 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %667, i32 0, i32 2
  %681 = load i8*, i8** %680, align 8
  %682 = bitcast i8* %681 to double*
  %683 = getelementptr i8, i8* %681, i32 8
  store i8* %683, i8** %680, align 8
  br label %684

; <label>:684:                                    ; preds = %678, %671
  %685 = phi double* [ %676, %671 ], [ %682, %678 ]
  %686 = load double, double* %685, align 8
  %687 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %688 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %687, i32 0, i32 19
  store double %686, double* %688, align 8
  br label %2141

; <label>:689:                                    ; preds = %3
  %690 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %691 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %690, i32 0, i32 1
  %692 = load i32, i32* %691, align 4
  %693 = icmp ule i32 %692, 160
  br i1 %693, label %694, label %701

; <label>:694:                                    ; preds = %689
  %pgocount60 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 84)
  %695 = add i64 %pgocount60, 1
  store i64 %695, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 84)
  %696 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %690, i32 0, i32 3
  %697 = load i8*, i8** %696, align 8
  %698 = getelementptr i8, i8* %697, i32 %692
  %699 = bitcast i8* %698 to double*
  %700 = add i32 %692, 16
  store i32 %700, i32* %691, align 4
  br label %707

; <label>:701:                                    ; preds = %689
  %pgocount61 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 85)
  %702 = add i64 %pgocount61, 1
  store i64 %702, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 85)
  %703 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %690, i32 0, i32 2
  %704 = load i8*, i8** %703, align 8
  %705 = bitcast i8* %704 to double*
  %706 = getelementptr i8, i8* %704, i32 8
  store i8* %706, i8** %703, align 8
  br label %707

; <label>:707:                                    ; preds = %701, %694
  %708 = phi double* [ %699, %694 ], [ %705, %701 ]
  %709 = load double, double* %708, align 8
  %710 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %711 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %710, i32 0, i32 20
  store double %709, double* %711, align 8
  br label %2141

; <label>:712:                                    ; preds = %3
  %713 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %714 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %713, i32 0, i32 1
  %715 = load i32, i32* %714, align 4
  %716 = icmp ule i32 %715, 160
  br i1 %716, label %717, label %724

; <label>:717:                                    ; preds = %712
  %pgocount62 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 86)
  %718 = add i64 %pgocount62, 1
  store i64 %718, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 86)
  %719 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %713, i32 0, i32 3
  %720 = load i8*, i8** %719, align 8
  %721 = getelementptr i8, i8* %720, i32 %715
  %722 = bitcast i8* %721 to double*
  %723 = add i32 %715, 16
  store i32 %723, i32* %714, align 4
  br label %730

; <label>:724:                                    ; preds = %712
  %pgocount63 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 87)
  %725 = add i64 %pgocount63, 1
  store i64 %725, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 87)
  %726 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %713, i32 0, i32 2
  %727 = load i8*, i8** %726, align 8
  %728 = bitcast i8* %727 to double*
  %729 = getelementptr i8, i8* %727, i32 8
  store i8* %729, i8** %726, align 8
  br label %730

; <label>:730:                                    ; preds = %724, %717
  %731 = phi double* [ %722, %717 ], [ %728, %724 ]
  %732 = load double, double* %731, align 8
  %733 = fptrunc double %732 to float
  %734 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %735 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %734, i32 0, i32 21
  store float %733, float* %735, align 8
  br label %2141

; <label>:736:                                    ; preds = %3
  %737 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %738 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %737, i32 0, i32 1
  %739 = load i32, i32* %738, align 4
  %740 = icmp ule i32 %739, 160
  br i1 %740, label %741, label %748

; <label>:741:                                    ; preds = %736
  %pgocount64 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 88)
  %742 = add i64 %pgocount64, 1
  store i64 %742, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 88)
  %743 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %737, i32 0, i32 3
  %744 = load i8*, i8** %743, align 8
  %745 = getelementptr i8, i8* %744, i32 %739
  %746 = bitcast i8* %745 to double*
  %747 = add i32 %739, 16
  store i32 %747, i32* %738, align 4
  br label %754

; <label>:748:                                    ; preds = %736
  %pgocount65 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 89)
  %749 = add i64 %pgocount65, 1
  store i64 %749, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 89)
  %750 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %737, i32 0, i32 2
  %751 = load i8*, i8** %750, align 8
  %752 = bitcast i8* %751 to double*
  %753 = getelementptr i8, i8* %751, i32 8
  store i8* %753, i8** %750, align 8
  br label %754

; <label>:754:                                    ; preds = %748, %741
  %755 = phi double* [ %746, %741 ], [ %752, %748 ]
  %756 = load double, double* %755, align 8
  %757 = fptrunc double %756 to float
  %758 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %759 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %758, i32 0, i32 22
  store float %757, float* %759, align 4
  br label %2141

; <label>:760:                                    ; preds = %3
  %761 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %762 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %761, i32 0, i32 0
  %763 = load i32, i32* %762, align 8
  %764 = icmp ule i32 %763, 40
  br i1 %764, label %765, label %772

; <label>:765:                                    ; preds = %760
  %pgocount66 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 90)
  %766 = add i64 %pgocount66, 1
  store i64 %766, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 90)
  %767 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %761, i32 0, i32 3
  %768 = load i8*, i8** %767, align 8
  %769 = getelementptr i8, i8* %768, i32 %763
  %770 = bitcast i8* %769 to i32*
  %771 = add i32 %763, 8
  store i32 %771, i32* %762, align 8
  br label %778

; <label>:772:                                    ; preds = %760
  %pgocount67 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 91)
  %773 = add i64 %pgocount67, 1
  store i64 %773, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 91)
  %774 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %761, i32 0, i32 2
  %775 = load i8*, i8** %774, align 8
  %776 = bitcast i8* %775 to i32*
  %777 = getelementptr i8, i8* %775, i32 8
  store i8* %777, i8** %774, align 8
  br label %778

; <label>:778:                                    ; preds = %772, %765
  %779 = phi i32* [ %770, %765 ], [ %776, %772 ]
  %780 = load i32, i32* %779, align 4
  store i32 %780, i32* %12, align 4
  %781 = load i32, i32* %12, align 4
  %782 = icmp ne i32 %781, 1
  br i1 %782, label %783, label %789

; <label>:783:                                    ; preds = %778
  %pgocount68 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 92)
  %784 = add i64 %pgocount68, 1
  store i64 %784, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 92)
  %785 = load i32, i32* %12, align 4
  %786 = icmp ne i32 %785, 2
  br i1 %786, label %787, label %789

; <label>:787:                                    ; preds = %783
  %pgocount69 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 167)
  %788 = add i64 %pgocount69, 1
  store i64 %788, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 167)
  br label %2177

; <label>:789:                                    ; preds = %783, %778
  %790 = load i32, i32* %12, align 4
  %791 = trunc i32 %790 to i16
  %792 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %793 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %792, i32 0, i32 24
  store i16 %791, i16* %793, align 2
  br label %2141

; <label>:794:                                    ; preds = %3
  %795 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %796 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %795, i32 0, i32 41
  %797 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %798 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %797, i32 0, i32 0
  %799 = load i32, i32* %798, align 8
  %800 = icmp ule i32 %799, 40
  br i1 %800, label %801, label %808

; <label>:801:                                    ; preds = %794
  %pgocount70 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 17)
  %802 = add i64 %pgocount70, 1
  store i64 %802, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 17)
  %803 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %797, i32 0, i32 3
  %804 = load i8*, i8** %803, align 8
  %805 = getelementptr i8, i8* %804, i32 %799
  %806 = bitcast i8* %805 to i8**
  %807 = add i32 %799, 8
  store i32 %807, i32* %798, align 8
  br label %814

; <label>:808:                                    ; preds = %794
  %pgocount71 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 18)
  %809 = add i64 %pgocount71, 1
  store i64 %809, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 18)
  %810 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %797, i32 0, i32 2
  %811 = load i8*, i8** %810, align 8
  %812 = bitcast i8* %811 to i8**
  %813 = getelementptr i8, i8* %811, i32 8
  store i8* %813, i8** %810, align 8
  br label %814

; <label>:814:                                    ; preds = %808, %801
  %815 = phi i8** [ %806, %801 ], [ %812, %808 ]
  %816 = load i8*, i8** %815, align 8
  call void @_TIFFsetString(i8** %796, i8* %816)
  br label %2141

; <label>:817:                                    ; preds = %3
  %818 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %819 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %818, i32 0, i32 1
  %820 = load i32, i32* %819, align 4
  %821 = icmp ule i32 %820, 160
  br i1 %821, label %822, label %829

; <label>:822:                                    ; preds = %817
  %pgocount72 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 93)
  %823 = add i64 %pgocount72, 1
  store i64 %823, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 93)
  %824 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %818, i32 0, i32 3
  %825 = load i8*, i8** %824, align 8
  %826 = getelementptr i8, i8* %825, i32 %820
  %827 = bitcast i8* %826 to double*
  %828 = add i32 %820, 16
  store i32 %828, i32* %819, align 4
  br label %835

; <label>:829:                                    ; preds = %817
  %pgocount73 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 94)
  %830 = add i64 %pgocount73, 1
  store i64 %830, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 94)
  %831 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %818, i32 0, i32 2
  %832 = load i8*, i8** %831, align 8
  %833 = bitcast i8* %832 to double*
  %834 = getelementptr i8, i8* %832, i32 8
  store i8* %834, i8** %831, align 8
  br label %835

; <label>:835:                                    ; preds = %829, %822
  %836 = phi double* [ %827, %822 ], [ %833, %829 ]
  %837 = load double, double* %836, align 8
  %838 = fptrunc double %837 to float
  %839 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %840 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %839, i32 0, i32 25
  store float %838, float* %840, align 4
  br label %2141

; <label>:841:                                    ; preds = %3
  %842 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %843 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %842, i32 0, i32 1
  %844 = load i32, i32* %843, align 4
  %845 = icmp ule i32 %844, 160
  br i1 %845, label %846, label %853

; <label>:846:                                    ; preds = %841
  %pgocount74 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 95)
  %847 = add i64 %pgocount74, 1
  store i64 %847, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 95)
  %848 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %842, i32 0, i32 3
  %849 = load i8*, i8** %848, align 8
  %850 = getelementptr i8, i8* %849, i32 %844
  %851 = bitcast i8* %850 to double*
  %852 = add i32 %844, 16
  store i32 %852, i32* %843, align 4
  br label %859

; <label>:853:                                    ; preds = %841
  %pgocount75 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 96)
  %854 = add i64 %pgocount75, 1
  store i64 %854, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 96)
  %855 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %842, i32 0, i32 2
  %856 = load i8*, i8** %855, align 8
  %857 = bitcast i8* %856 to double*
  %858 = getelementptr i8, i8* %856, i32 8
  store i8* %858, i8** %855, align 8
  br label %859

; <label>:859:                                    ; preds = %853, %846
  %860 = phi double* [ %851, %846 ], [ %857, %853 ]
  %861 = load double, double* %860, align 8
  %862 = fptrunc double %861 to float
  %863 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %864 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %863, i32 0, i32 26
  store float %862, float* %864, align 8
  br label %2141

; <label>:865:                                    ; preds = %3
  %866 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %867 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %866, i32 0, i32 0
  %868 = load i32, i32* %867, align 8
  %869 = icmp ule i32 %868, 40
  br i1 %869, label %870, label %877

; <label>:870:                                    ; preds = %865
  %pgocount76 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 97)
  %871 = add i64 %pgocount76, 1
  store i64 %871, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 97)
  %872 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %866, i32 0, i32 3
  %873 = load i8*, i8** %872, align 8
  %874 = getelementptr i8, i8* %873, i32 %868
  %875 = bitcast i8* %874 to i32*
  %876 = add i32 %868, 8
  store i32 %876, i32* %867, align 8
  br label %883

; <label>:877:                                    ; preds = %865
  %pgocount77 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 98)
  %878 = add i64 %pgocount77, 1
  store i64 %878, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 98)
  %879 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %866, i32 0, i32 2
  %880 = load i8*, i8** %879, align 8
  %881 = bitcast i8* %880 to i32*
  %882 = getelementptr i8, i8* %880, i32 8
  store i8* %882, i8** %879, align 8
  br label %883

; <label>:883:                                    ; preds = %877, %870
  %884 = phi i32* [ %875, %870 ], [ %881, %877 ]
  %885 = load i32, i32* %884, align 4
  store i32 %885, i32* %12, align 4
  %886 = load i32, i32* %12, align 4
  %887 = icmp slt i32 %886, 1
  br i1 %887, label %892, label %888

; <label>:888:                                    ; preds = %883
  %pgocount78 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 8)
  %889 = add i64 %pgocount78, 1
  store i64 %889, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 8)
  %890 = load i32, i32* %12, align 4
  %891 = icmp slt i32 3, %890
  br i1 %891, label %892, label %893

; <label>:892:                                    ; preds = %888, %883
  br label %2177

; <label>:893:                                    ; preds = %888
  %pgocount79 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 157)
  %894 = add i64 %pgocount79, 1
  store i64 %894, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 157)
  %895 = load i32, i32* %12, align 4
  %896 = trunc i32 %895 to i16
  %897 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %898 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %897, i32 0, i32 23
  store i16 %896, i16* %898, align 8
  br label %2141

; <label>:899:                                    ; preds = %3
  %900 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %901 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %900, i32 0, i32 0
  %902 = load i32, i32* %901, align 8
  %903 = icmp ule i32 %902, 40
  br i1 %903, label %904, label %910

; <label>:904:                                    ; preds = %899
  %905 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %900, i32 0, i32 3
  %906 = load i8*, i8** %905, align 8
  %907 = getelementptr i8, i8* %906, i32 %902
  %908 = bitcast i8* %907 to i32*
  %909 = add i32 %902, 8
  store i32 %909, i32* %901, align 8
  br label %916

; <label>:910:                                    ; preds = %899
  %pgocount80 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 99)
  %911 = add i64 %pgocount80, 1
  store i64 %911, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 99)
  %912 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %900, i32 0, i32 2
  %913 = load i8*, i8** %912, align 8
  %914 = bitcast i8* %913 to i32*
  %915 = getelementptr i8, i8* %913, i32 8
  store i8* %915, i8** %912, align 8
  br label %916

; <label>:916:                                    ; preds = %910, %904
  %917 = phi i32* [ %908, %904 ], [ %914, %910 ]
  %918 = load i32, i32* %917, align 4
  %919 = trunc i32 %918 to i16
  %920 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %921 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %920, i32 0, i32 27
  %922 = getelementptr inbounds [2 x i16], [2 x i16]* %921, i64 0, i64 0
  store i16 %919, i16* %922, align 4
  %923 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %924 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %923, i32 0, i32 0
  %925 = load i32, i32* %924, align 8
  %926 = icmp ule i32 %925, 40
  br i1 %926, label %927, label %934

; <label>:927:                                    ; preds = %916
  %pgocount81 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 100)
  %928 = add i64 %pgocount81, 1
  store i64 %928, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 100)
  %929 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %923, i32 0, i32 3
  %930 = load i8*, i8** %929, align 8
  %931 = getelementptr i8, i8* %930, i32 %925
  %932 = bitcast i8* %931 to i32*
  %933 = add i32 %925, 8
  store i32 %933, i32* %924, align 8
  br label %940

; <label>:934:                                    ; preds = %916
  %pgocount82 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 101)
  %935 = add i64 %pgocount82, 1
  store i64 %935, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 101)
  %936 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %923, i32 0, i32 2
  %937 = load i8*, i8** %936, align 8
  %938 = bitcast i8* %937 to i32*
  %939 = getelementptr i8, i8* %937, i32 8
  store i8* %939, i8** %936, align 8
  br label %940

; <label>:940:                                    ; preds = %934, %927
  %941 = phi i32* [ %932, %927 ], [ %938, %934 ]
  %942 = load i32, i32* %941, align 4
  %943 = trunc i32 %942 to i16
  %944 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %945 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %944, i32 0, i32 27
  %946 = getelementptr inbounds [2 x i16], [2 x i16]* %945, i64 0, i64 1
  store i16 %943, i16* %946, align 2
  br label %2141

; <label>:947:                                    ; preds = %3
  %948 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %949 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %948, i32 0, i32 0
  %950 = load i32, i32* %949, align 8
  %951 = icmp ule i32 %950, 40
  br i1 %951, label %952, label %958

; <label>:952:                                    ; preds = %947
  %953 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %948, i32 0, i32 3
  %954 = load i8*, i8** %953, align 8
  %955 = getelementptr i8, i8* %954, i32 %950
  %956 = bitcast i8* %955 to i32*
  %957 = add i32 %950, 8
  store i32 %957, i32* %949, align 8
  br label %964

; <label>:958:                                    ; preds = %947
  %pgocount83 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 102)
  %959 = add i64 %pgocount83, 1
  store i64 %959, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 102)
  %960 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %948, i32 0, i32 2
  %961 = load i8*, i8** %960, align 8
  %962 = bitcast i8* %961 to i32*
  %963 = getelementptr i8, i8* %961, i32 8
  store i8* %963, i8** %960, align 8
  br label %964

; <label>:964:                                    ; preds = %958, %952
  %965 = phi i32* [ %956, %952 ], [ %962, %958 ]
  %966 = load i32, i32* %965, align 4
  %967 = trunc i32 %966 to i16
  %968 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %969 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %968, i32 0, i32 29
  %970 = getelementptr inbounds [2 x i16], [2 x i16]* %969, i64 0, i64 0
  store i16 %967, i16* %970, align 8
  %971 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %972 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %971, i32 0, i32 0
  %973 = load i32, i32* %972, align 8
  %974 = icmp ule i32 %973, 40
  br i1 %974, label %975, label %982

; <label>:975:                                    ; preds = %964
  %pgocount84 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 103)
  %976 = add i64 %pgocount84, 1
  store i64 %976, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 103)
  %977 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %971, i32 0, i32 3
  %978 = load i8*, i8** %977, align 8
  %979 = getelementptr i8, i8* %978, i32 %973
  %980 = bitcast i8* %979 to i32*
  %981 = add i32 %973, 8
  store i32 %981, i32* %972, align 8
  br label %988

; <label>:982:                                    ; preds = %964
  %pgocount85 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 104)
  %983 = add i64 %pgocount85, 1
  store i64 %983, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 104)
  %984 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %971, i32 0, i32 2
  %985 = load i8*, i8** %984, align 8
  %986 = bitcast i8* %985 to i32*
  %987 = getelementptr i8, i8* %985, i32 8
  store i8* %987, i8** %984, align 8
  br label %988

; <label>:988:                                    ; preds = %982, %975
  %989 = phi i32* [ %980, %975 ], [ %986, %982 ]
  %990 = load i32, i32* %989, align 4
  %991 = trunc i32 %990 to i16
  %992 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %993 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %992, i32 0, i32 29
  %994 = getelementptr inbounds [2 x i16], [2 x i16]* %993, i64 0, i64 1
  store i16 %991, i16* %994, align 2
  br label %2141

; <label>:995:                                    ; preds = %3
  %996 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %997 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %996, i32 0, i32 8
  %998 = load i16, i16* %997, align 4
  %999 = zext i16 %998 to i32
  %1000 = zext i32 %999 to i64
  %1001 = shl i64 1, %1000
  %1002 = trunc i64 %1001 to i32
  store i32 %1002, i32* %10, align 4
  %1003 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1004 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1003, i32 0, i32 28
  %1005 = getelementptr inbounds [3 x i16*], [3 x i16*]* %1004, i64 0, i64 0
  %1006 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1007 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1006, i32 0, i32 0
  %1008 = load i32, i32* %1007, align 8
  %1009 = icmp ule i32 %1008, 40
  br i1 %1009, label %1010, label %1016

; <label>:1010:                                   ; preds = %995
  %1011 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1006, i32 0, i32 3
  %1012 = load i8*, i8** %1011, align 8
  %1013 = getelementptr i8, i8* %1012, i32 %1008
  %1014 = bitcast i8* %1013 to i16**
  %1015 = add i32 %1008, 8
  store i32 %1015, i32* %1007, align 8
  br label %1022

; <label>:1016:                                   ; preds = %995
  %pgocount86 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 19)
  %1017 = add i64 %pgocount86, 1
  store i64 %1017, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 19)
  %1018 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1006, i32 0, i32 2
  %1019 = load i8*, i8** %1018, align 8
  %1020 = bitcast i8* %1019 to i16**
  %1021 = getelementptr i8, i8* %1019, i32 8
  store i8* %1021, i8** %1018, align 8
  br label %1022

; <label>:1022:                                   ; preds = %1016, %1010
  %1023 = phi i16** [ %1014, %1010 ], [ %1020, %1016 ]
  %1024 = load i16*, i16** %1023, align 8
  %1025 = load i32, i32* %10, align 4
  %1026 = zext i32 %1025 to i64
  call void @_TIFFsetShortArray(i16** %1005, i16* %1024, i64 %1026)
  %1027 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1028 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1027, i32 0, i32 28
  %1029 = getelementptr inbounds [3 x i16*], [3 x i16*]* %1028, i64 0, i64 1
  %1030 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1031 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1030, i32 0, i32 0
  %1032 = load i32, i32* %1031, align 8
  %1033 = icmp ule i32 %1032, 40
  br i1 %1033, label %1034, label %1040

; <label>:1034:                                   ; preds = %1022
  %1035 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1030, i32 0, i32 3
  %1036 = load i8*, i8** %1035, align 8
  %1037 = getelementptr i8, i8* %1036, i32 %1032
  %1038 = bitcast i8* %1037 to i16**
  %1039 = add i32 %1032, 8
  store i32 %1039, i32* %1031, align 8
  br label %1046

; <label>:1040:                                   ; preds = %1022
  %pgocount87 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 20)
  %1041 = add i64 %pgocount87, 1
  store i64 %1041, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 20)
  %1042 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1030, i32 0, i32 2
  %1043 = load i8*, i8** %1042, align 8
  %1044 = bitcast i8* %1043 to i16**
  %1045 = getelementptr i8, i8* %1043, i32 8
  store i8* %1045, i8** %1042, align 8
  br label %1046

; <label>:1046:                                   ; preds = %1040, %1034
  %1047 = phi i16** [ %1038, %1034 ], [ %1044, %1040 ]
  %1048 = load i16*, i16** %1047, align 8
  %1049 = load i32, i32* %10, align 4
  %1050 = zext i32 %1049 to i64
  call void @_TIFFsetShortArray(i16** %1029, i16* %1048, i64 %1050)
  %1051 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1052 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1051, i32 0, i32 28
  %1053 = getelementptr inbounds [3 x i16*], [3 x i16*]* %1052, i64 0, i64 2
  %1054 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1055 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1054, i32 0, i32 0
  %1056 = load i32, i32* %1055, align 8
  %1057 = icmp ule i32 %1056, 40
  br i1 %1057, label %1058, label %1065

; <label>:1058:                                   ; preds = %1046
  %pgocount88 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 21)
  %1059 = add i64 %pgocount88, 1
  store i64 %1059, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 21)
  %1060 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1054, i32 0, i32 3
  %1061 = load i8*, i8** %1060, align 8
  %1062 = getelementptr i8, i8* %1061, i32 %1056
  %1063 = bitcast i8* %1062 to i16**
  %1064 = add i32 %1056, 8
  store i32 %1064, i32* %1055, align 8
  br label %1071

; <label>:1065:                                   ; preds = %1046
  %pgocount89 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 22)
  %1066 = add i64 %pgocount89, 1
  store i64 %1066, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 22)
  %1067 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1054, i32 0, i32 2
  %1068 = load i8*, i8** %1067, align 8
  %1069 = bitcast i8* %1068 to i16**
  %1070 = getelementptr i8, i8* %1068, i32 8
  store i8* %1070, i8** %1067, align 8
  br label %1071

; <label>:1071:                                   ; preds = %1065, %1058
  %1072 = phi i16** [ %1063, %1058 ], [ %1069, %1065 ]
  %1073 = load i16*, i16** %1072, align 8
  %1074 = load i32, i32* %10, align 4
  %1075 = zext i32 %1074 to i64
  call void @_TIFFsetShortArray(i16** %1053, i16* %1073, i64 %1075)
  br label %2141

; <label>:1076:                                   ; preds = %3
  %1077 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1078 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1079 = call i32 @setExtraSamples(%struct.TIFFDirectory* %1077, %struct.__va_list_tag* %1078, i32* %12)
  %1080 = icmp ne i32 %1079, 0
  br i1 %1080, label %1083, label %1081

; <label>:1081:                                   ; preds = %1076
  %pgocount90 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 151)
  %1082 = add i64 %pgocount90, 1
  store i64 %1082, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 151)
  br label %2177

; <label>:1083:                                   ; preds = %1076
  %pgocount91 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 5)
  %1084 = add i64 %pgocount91, 1
  store i64 %1084, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 5)
  br label %2141

; <label>:1085:                                   ; preds = %3
  %1086 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1087 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1086, i32 0, i32 0
  %1088 = load i32, i32* %1087, align 8
  %1089 = icmp ule i32 %1088, 40
  br i1 %1089, label %1090, label %1097

; <label>:1090:                                   ; preds = %1085
  %pgocount92 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 23)
  %1091 = add i64 %pgocount92, 1
  store i64 %1091, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 23)
  %1092 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1086, i32 0, i32 3
  %1093 = load i8*, i8** %1092, align 8
  %1094 = getelementptr i8, i8* %1093, i32 %1088
  %1095 = bitcast i8* %1094 to i32*
  %1096 = add i32 %1088, 8
  store i32 %1096, i32* %1087, align 8
  br label %1103

; <label>:1097:                                   ; preds = %1085
  %pgocount93 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 24)
  %1098 = add i64 %pgocount93, 1
  store i64 %1098, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 24)
  %1099 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1086, i32 0, i32 2
  %1100 = load i8*, i8** %1099, align 8
  %1101 = bitcast i8* %1100 to i32*
  %1102 = getelementptr i8, i8* %1100, i32 8
  store i8* %1102, i8** %1099, align 8
  br label %1103

; <label>:1103:                                   ; preds = %1097, %1090
  %1104 = phi i32* [ %1095, %1090 ], [ %1101, %1097 ]
  %1105 = load i32, i32* %1104, align 4
  %1106 = icmp ne i32 %1105, 0
  %1107 = zext i1 %1106 to i32
  %1108 = trunc i32 %1107 to i16
  %1109 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1110 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1109, i32 0, i32 30
  store i16 %1108, i16* %1110, align 4
  %1111 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1112 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1111, i32 0, i32 30
  %1113 = load i16, i16* %1112, align 4
  %1114 = icmp ne i16 %1113, 0
  br i1 %1114, label %1115, label %1119

; <label>:1115:                                   ; preds = %1103
  %pgocount94 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 6)
  %1116 = add i64 %pgocount94, 1
  store i64 %1116, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 6)
  store i16 1, i16* %15, align 2
  %1117 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1118 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1117, i32 0, i32 31
  call void @_TIFFsetShortArray(i16** %1118, i16* %15, i64 1)
  br label %1119

; <label>:1119:                                   ; preds = %1115, %1103
  br label %2141

; <label>:1120:                                   ; preds = %3
  %1121 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1122 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1121, i32 0, i32 0
  %1123 = load i32, i32* %1122, align 8
  %1124 = icmp ule i32 %1123, 40
  br i1 %1124, label %1125, label %1132

; <label>:1125:                                   ; preds = %1120
  %pgocount95 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 25)
  %1126 = add i64 %pgocount95, 1
  store i64 %1126, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 25)
  %1127 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1121, i32 0, i32 3
  %1128 = load i8*, i8** %1127, align 8
  %1129 = getelementptr i8, i8* %1128, i32 %1123
  %1130 = bitcast i8* %1129 to i32*
  %1131 = add i32 %1123, 8
  store i32 %1131, i32* %1122, align 8
  br label %1138

; <label>:1132:                                   ; preds = %1120
  %pgocount96 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 26)
  %1133 = add i64 %pgocount96, 1
  store i64 %1133, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 26)
  %1134 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1121, i32 0, i32 2
  %1135 = load i8*, i8** %1134, align 8
  %1136 = bitcast i8* %1135 to i32*
  %1137 = getelementptr i8, i8* %1135, i32 8
  store i8* %1137, i8** %1134, align 8
  br label %1138

; <label>:1138:                                   ; preds = %1132, %1125
  %1139 = phi i32* [ %1130, %1125 ], [ %1136, %1132 ]
  %1140 = load i32, i32* %1139, align 4
  store i32 %1140, i32* %10, align 4
  %1141 = load i32, i32* %10, align 4
  %1142 = urem i32 %1141, 16
  %1143 = icmp ne i32 %1142, 0
  br i1 %1143, label %1144, label %1157

; <label>:1144:                                   ; preds = %1138
  %1145 = load %struct.tiff*, %struct.tiff** %5, align 8
  %1146 = getelementptr inbounds %struct.tiff, %struct.tiff* %1145, i32 0, i32 2
  %1147 = load i32, i32* %1146, align 4
  %1148 = icmp ne i32 %1147, 0
  br i1 %1148, label %1149, label %1151

; <label>:1149:                                   ; preds = %1144
  %pgocount97 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 149)
  %1150 = add i64 %pgocount97, 1
  store i64 %1150, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 149)
  br label %2189

; <label>:1151:                                   ; preds = %1144
  %pgocount98 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 168)
  %1152 = add i64 %pgocount98, 1
  store i64 %1152, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 168)
  %1153 = load %struct.tiff*, %struct.tiff** %5, align 8
  %1154 = getelementptr inbounds %struct.tiff, %struct.tiff* %1153, i32 0, i32 0
  %1155 = load i8*, i8** %1154, align 8
  %1156 = load i32, i32* %10, align 4
  call void (i8*, i8*, ...) @TIFFWarning(i8* %1155, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.10, i32 0, i32 0), i32 %1156)
  br label %1157

; <label>:1157:                                   ; preds = %1151, %1138
  %1158 = load i32, i32* %10, align 4
  %1159 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1160 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1159, i32 0, i32 4
  store i32 %1158, i32* %1160, align 4
  %1161 = load %struct.tiff*, %struct.tiff** %5, align 8
  %1162 = getelementptr inbounds %struct.tiff, %struct.tiff* %1161, i32 0, i32 3
  %1163 = load i32, i32* %1162, align 8
  %1164 = or i32 %1163, 1024
  store i32 %1164, i32* %1162, align 8
  br label %2141

; <label>:1165:                                   ; preds = %3
  %1166 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1167 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1166, i32 0, i32 0
  %1168 = load i32, i32* %1167, align 8
  %1169 = icmp ule i32 %1168, 40
  br i1 %1169, label %1170, label %1177

; <label>:1170:                                   ; preds = %1165
  %pgocount99 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 27)
  %1171 = add i64 %pgocount99, 1
  store i64 %1171, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 27)
  %1172 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1166, i32 0, i32 3
  %1173 = load i8*, i8** %1172, align 8
  %1174 = getelementptr i8, i8* %1173, i32 %1168
  %1175 = bitcast i8* %1174 to i32*
  %1176 = add i32 %1168, 8
  store i32 %1176, i32* %1167, align 8
  br label %1183

; <label>:1177:                                   ; preds = %1165
  %pgocount100 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 28)
  %1178 = add i64 %pgocount100, 1
  store i64 %1178, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 28)
  %1179 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1166, i32 0, i32 2
  %1180 = load i8*, i8** %1179, align 8
  %1181 = bitcast i8* %1180 to i32*
  %1182 = getelementptr i8, i8* %1180, i32 8
  store i8* %1182, i8** %1179, align 8
  br label %1183

; <label>:1183:                                   ; preds = %1177, %1170
  %1184 = phi i32* [ %1175, %1170 ], [ %1181, %1177 ]
  %1185 = load i32, i32* %1184, align 4
  store i32 %1185, i32* %10, align 4
  %1186 = load i32, i32* %10, align 4
  %1187 = urem i32 %1186, 16
  %1188 = icmp ne i32 %1187, 0
  br i1 %1188, label %1189, label %1202

; <label>:1189:                                   ; preds = %1183
  %1190 = load %struct.tiff*, %struct.tiff** %5, align 8
  %1191 = getelementptr inbounds %struct.tiff, %struct.tiff* %1190, i32 0, i32 2
  %1192 = load i32, i32* %1191, align 4
  %1193 = icmp ne i32 %1192, 0
  br i1 %1193, label %1194, label %1196

; <label>:1194:                                   ; preds = %1189
  %pgocount101 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 150)
  %1195 = add i64 %pgocount101, 1
  store i64 %1195, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 150)
  br label %2189

; <label>:1196:                                   ; preds = %1189
  %pgocount102 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 169)
  %1197 = add i64 %pgocount102, 1
  store i64 %1197, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 169)
  %1198 = load %struct.tiff*, %struct.tiff** %5, align 8
  %1199 = getelementptr inbounds %struct.tiff, %struct.tiff* %1198, i32 0, i32 0
  %1200 = load i8*, i8** %1199, align 8
  %1201 = load i32, i32* %10, align 4
  call void (i8*, i8*, ...) @TIFFWarning(i8* %1200, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.11, i32 0, i32 0), i32 %1201)
  br label %1202

; <label>:1202:                                   ; preds = %1196, %1183
  %1203 = load i32, i32* %10, align 4
  %1204 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1205 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1204, i32 0, i32 5
  store i32 %1203, i32* %1205, align 8
  %1206 = load %struct.tiff*, %struct.tiff** %5, align 8
  %1207 = getelementptr inbounds %struct.tiff, %struct.tiff* %1206, i32 0, i32 3
  %1208 = load i32, i32* %1207, align 8
  %1209 = or i32 %1208, 1024
  store i32 %1209, i32* %1207, align 8
  br label %2141

; <label>:1210:                                   ; preds = %3
  %1211 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1212 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1211, i32 0, i32 0
  %1213 = load i32, i32* %1212, align 8
  %1214 = icmp ule i32 %1213, 40
  br i1 %1214, label %1215, label %1222

; <label>:1215:                                   ; preds = %1210
  %pgocount103 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 105)
  %1216 = add i64 %pgocount103, 1
  store i64 %1216, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 105)
  %1217 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1211, i32 0, i32 3
  %1218 = load i8*, i8** %1217, align 8
  %1219 = getelementptr i8, i8* %1218, i32 %1213
  %1220 = bitcast i8* %1219 to i32*
  %1221 = add i32 %1213, 8
  store i32 %1221, i32* %1212, align 8
  br label %1228

; <label>:1222:                                   ; preds = %1210
  %pgocount104 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 106)
  %1223 = add i64 %pgocount104, 1
  store i64 %1223, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 106)
  %1224 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1211, i32 0, i32 2
  %1225 = load i8*, i8** %1224, align 8
  %1226 = bitcast i8* %1225 to i32*
  %1227 = getelementptr i8, i8* %1225, i32 8
  store i8* %1227, i8** %1224, align 8
  br label %1228

; <label>:1228:                                   ; preds = %1222, %1215
  %1229 = phi i32* [ %1220, %1215 ], [ %1226, %1222 ]
  %1230 = load i32, i32* %1229, align 4
  store i32 %1230, i32* %10, align 4
  %1231 = load i32, i32* %10, align 4
  %1232 = icmp eq i32 %1231, 0
  br i1 %1232, label %1233, label %1235

; <label>:1233:                                   ; preds = %1228
  %pgocount105 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 154)
  %1234 = add i64 %pgocount105, 1
  store i64 %1234, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 154)
  br label %2189

; <label>:1235:                                   ; preds = %1228
  %1236 = load i32, i32* %10, align 4
  %1237 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1238 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1237, i32 0, i32 6
  store i32 %1236, i32* %1238, align 4
  br label %2141

; <label>:1239:                                   ; preds = %3
  %1240 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1241 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1240, i32 0, i32 0
  %1242 = load i32, i32* %1241, align 8
  %1243 = icmp ule i32 %1242, 40
  br i1 %1243, label %1244, label %1250

; <label>:1244:                                   ; preds = %1239
  %1245 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1240, i32 0, i32 3
  %1246 = load i8*, i8** %1245, align 8
  %1247 = getelementptr i8, i8* %1246, i32 %1242
  %1248 = bitcast i8* %1247 to i32*
  %1249 = add i32 %1242, 8
  store i32 %1249, i32* %1241, align 8
  br label %1256

; <label>:1250:                                   ; preds = %1239
  %pgocount106 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 107)
  %1251 = add i64 %pgocount106, 1
  store i64 %1251, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 107)
  %1252 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1240, i32 0, i32 2
  %1253 = load i8*, i8** %1252, align 8
  %1254 = bitcast i8* %1253 to i32*
  %1255 = getelementptr i8, i8* %1253, i32 8
  store i8* %1255, i8** %1252, align 8
  br label %1256

; <label>:1256:                                   ; preds = %1250, %1244
  %1257 = phi i32* [ %1248, %1244 ], [ %1254, %1250 ]
  %1258 = load i32, i32* %1257, align 4
  store i32 %1258, i32* %12, align 4
  %1259 = load i32, i32* %12, align 4
  switch i32 %1259, label %1268 [
    i32 0, label %1260
    i32 1, label %1262
    i32 2, label %1264
    i32 3, label %1266
  ]

; <label>:1260:                                   ; preds = %1256
  %pgocount107 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 170)
  %1261 = add i64 %pgocount107, 1
  store i64 %1261, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 170)
  store i32 4, i32* %12, align 4
  br label %1270

; <label>:1262:                                   ; preds = %1256
  %pgocount108 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 171)
  %1263 = add i64 %pgocount108, 1
  store i64 %1263, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 171)
  store i32 2, i32* %12, align 4
  br label %1270

; <label>:1264:                                   ; preds = %1256
  %pgocount109 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 172)
  %1265 = add i64 %pgocount109, 1
  store i64 %1265, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 172)
  store i32 1, i32* %12, align 4
  br label %1270

; <label>:1266:                                   ; preds = %1256
  %pgocount110 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 173)
  %1267 = add i64 %pgocount110, 1
  store i64 %1267, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 173)
  store i32 3, i32* %12, align 4
  br label %1270

; <label>:1268:                                   ; preds = %1256
  %pgocount111 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 174)
  %1269 = add i64 %pgocount111, 1
  store i64 %1269, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 174)
  br label %2177

; <label>:1270:                                   ; preds = %1266, %1264, %1262, %1260
  %1271 = load i32, i32* %12, align 4
  %1272 = trunc i32 %1271 to i16
  %1273 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1274 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1273, i32 0, i32 9
  store i16 %1272, i16* %1274, align 2
  br label %2141

; <label>:1275:                                   ; preds = %3
  %1276 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1277 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1276, i32 0, i32 0
  %1278 = load i32, i32* %1277, align 8
  %1279 = icmp ule i32 %1278, 40
  br i1 %1279, label %1280, label %1287

; <label>:1280:                                   ; preds = %1275
  %pgocount112 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 108)
  %1281 = add i64 %pgocount112, 1
  store i64 %1281, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 108)
  %1282 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1276, i32 0, i32 3
  %1283 = load i8*, i8** %1282, align 8
  %1284 = getelementptr i8, i8* %1283, i32 %1278
  %1285 = bitcast i8* %1284 to i32*
  %1286 = add i32 %1278, 8
  store i32 %1286, i32* %1277, align 8
  br label %1293

; <label>:1287:                                   ; preds = %1275
  %pgocount113 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 109)
  %1288 = add i64 %pgocount113, 1
  store i64 %1288, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 109)
  %1289 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1276, i32 0, i32 2
  %1290 = load i8*, i8** %1289, align 8
  %1291 = bitcast i8* %1290 to i32*
  %1292 = getelementptr i8, i8* %1290, i32 8
  store i8* %1292, i8** %1289, align 8
  br label %1293

; <label>:1293:                                   ; preds = %1287, %1280
  %1294 = phi i32* [ %1285, %1280 ], [ %1291, %1287 ]
  %1295 = load i32, i32* %1294, align 4
  store i32 %1295, i32* %12, align 4
  %1296 = load i32, i32* %12, align 4
  %1297 = icmp slt i32 %1296, 1
  br i1 %1297, label %1302, label %1298

; <label>:1298:                                   ; preds = %1293
  %pgocount114 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 9)
  %1299 = add i64 %pgocount114, 1
  store i64 %1299, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 9)
  %1300 = load i32, i32* %12, align 4
  %1301 = icmp slt i32 4, %1300
  br i1 %1301, label %1302, label %1303

; <label>:1302:                                   ; preds = %1298, %1293
  br label %2177

; <label>:1303:                                   ; preds = %1298
  %pgocount115 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 158)
  %1304 = add i64 %pgocount115, 1
  store i64 %1304, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 158)
  %1305 = load i32, i32* %12, align 4
  %1306 = trunc i32 %1305 to i16
  %1307 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1308 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1307, i32 0, i32 9
  store i16 %1306, i16* %1308, align 2
  br label %2141

; <label>:1309:                                   ; preds = %3
  %1310 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1311 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1310, i32 0, i32 0
  %1312 = load i32, i32* %1311, align 8
  %1313 = icmp ule i32 %1312, 40
  br i1 %1313, label %1314, label %1321

; <label>:1314:                                   ; preds = %1309
  %pgocount116 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 110)
  %1315 = add i64 %pgocount116, 1
  store i64 %1315, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 110)
  %1316 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1310, i32 0, i32 3
  %1317 = load i8*, i8** %1316, align 8
  %1318 = getelementptr i8, i8* %1317, i32 %1312
  %1319 = bitcast i8* %1318 to i32*
  %1320 = add i32 %1312, 8
  store i32 %1320, i32* %1311, align 8
  br label %1327

; <label>:1321:                                   ; preds = %1309
  %pgocount117 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 111)
  %1322 = add i64 %pgocount117, 1
  store i64 %1322, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 111)
  %1323 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1310, i32 0, i32 2
  %1324 = load i8*, i8** %1323, align 8
  %1325 = bitcast i8* %1324 to i32*
  %1326 = getelementptr i8, i8* %1324, i32 8
  store i8* %1326, i8** %1323, align 8
  br label %1327

; <label>:1327:                                   ; preds = %1321, %1314
  %1328 = phi i32* [ %1319, %1314 ], [ %1325, %1321 ]
  %1329 = load i32, i32* %1328, align 4
  %1330 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1331 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1330, i32 0, i32 3
  store i32 %1329, i32* %1331, align 8
  br label %2141

; <label>:1332:                                   ; preds = %3
  %1333 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1334 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1333, i32 0, i32 1
  %1335 = load i32, i32* %1334, align 4
  %1336 = icmp ule i32 %1335, 160
  br i1 %1336, label %1337, label %1343

; <label>:1337:                                   ; preds = %1332
  %1338 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1333, i32 0, i32 3
  %1339 = load i8*, i8** %1338, align 8
  %1340 = getelementptr i8, i8* %1339, i32 %1335
  %1341 = bitcast i8* %1340 to double*
  %1342 = add i32 %1335, 16
  store i32 %1342, i32* %1334, align 4
  br label %1349

; <label>:1343:                                   ; preds = %1332
  %pgocount118 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 112)
  %1344 = add i64 %pgocount118, 1
  store i64 %1344, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 112)
  %1345 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1333, i32 0, i32 2
  %1346 = load i8*, i8** %1345, align 8
  %1347 = bitcast i8* %1346 to double*
  %1348 = getelementptr i8, i8* %1346, i32 8
  store i8* %1348, i8** %1345, align 8
  br label %1349

; <label>:1349:                                   ; preds = %1343, %1337
  %1350 = phi double* [ %1341, %1337 ], [ %1347, %1343 ]
  %1351 = load double, double* %1350, align 8
  store double %1351, double* %13, align 8
  %1352 = load double, double* %13, align 8
  %1353 = fcmp ole double %1352, 0.000000e+00
  br i1 %1353, label %1354, label %1355

; <label>:1354:                                   ; preds = %1349
  br label %2201

; <label>:1355:                                   ; preds = %1349
  %pgocount119 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 113)
  %1356 = add i64 %pgocount119, 1
  store i64 %1356, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 113)
  %1357 = load double, double* %13, align 8
  %1358 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1359 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1358, i32 0, i32 32
  store double %1357, double* %1359, align 8
  br label %2141

; <label>:1360:                                   ; preds = %3
  %1361 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1362 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1361, i32 0, i32 0
  %1363 = load i32, i32* %1362, align 8
  %1364 = icmp ule i32 %1363, 40
  br i1 %1364, label %1365, label %1372

; <label>:1365:                                   ; preds = %1360
  %pgocount120 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 29)
  %1366 = add i64 %pgocount120, 1
  store i64 %1366, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 29)
  %1367 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1361, i32 0, i32 3
  %1368 = load i8*, i8** %1367, align 8
  %1369 = getelementptr i8, i8* %1368, i32 %1363
  %1370 = bitcast i8* %1369 to i32*
  %1371 = add i32 %1363, 8
  store i32 %1371, i32* %1362, align 8
  br label %1378

; <label>:1372:                                   ; preds = %1360
  %pgocount121 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 30)
  %1373 = add i64 %pgocount121, 1
  store i64 %1373, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 30)
  %1374 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1361, i32 0, i32 2
  %1375 = load i8*, i8** %1374, align 8
  %1376 = bitcast i8* %1375 to i32*
  %1377 = getelementptr i8, i8* %1375, i32 8
  store i8* %1377, i8** %1374, align 8
  br label %1378

; <label>:1378:                                   ; preds = %1372, %1365
  %1379 = phi i32* [ %1370, %1365 ], [ %1376, %1372 ]
  %1380 = load i32, i32* %1379, align 4
  %1381 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1382 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1381, i32 0, i32 67
  store i32 %1380, i32* %1382, align 8
  br label %2141

; <label>:1383:                                   ; preds = %3
  %1384 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1385 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1384, i32 0, i32 0
  %1386 = load i32, i32* %1385, align 8
  %1387 = icmp ule i32 %1386, 40
  br i1 %1387, label %1388, label %1395

; <label>:1388:                                   ; preds = %1383
  %pgocount122 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 31)
  %1389 = add i64 %pgocount122, 1
  store i64 %1389, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 31)
  %1390 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1384, i32 0, i32 3
  %1391 = load i8*, i8** %1390, align 8
  %1392 = getelementptr i8, i8* %1391, i32 %1386
  %1393 = bitcast i8* %1392 to i32*
  %1394 = add i32 %1386, 8
  store i32 %1394, i32* %1385, align 8
  br label %1401

; <label>:1395:                                   ; preds = %1383
  %pgocount123 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 32)
  %1396 = add i64 %pgocount123, 1
  store i64 %1396, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 32)
  %1397 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1384, i32 0, i32 2
  %1398 = load i8*, i8** %1397, align 8
  %1399 = bitcast i8* %1398 to i32*
  %1400 = getelementptr i8, i8* %1398, i32 8
  store i8* %1400, i8** %1397, align 8
  br label %1401

; <label>:1401:                                   ; preds = %1395, %1388
  %1402 = phi i32* [ %1393, %1388 ], [ %1399, %1395 ]
  %1403 = load i32, i32* %1402, align 4
  %1404 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1405 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1404, i32 0, i32 68
  store i32 %1403, i32* %1405, align 4
  br label %2141

; <label>:1406:                                   ; preds = %3
  %1407 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1408 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1407, i32 0, i32 69
  %1409 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1410 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1409, i32 0, i32 0
  %1411 = load i32, i32* %1410, align 8
  %1412 = icmp ule i32 %1411, 40
  br i1 %1412, label %1413, label %1420

; <label>:1413:                                   ; preds = %1406
  %pgocount124 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 114)
  %1414 = add i64 %pgocount124, 1
  store i64 %1414, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 114)
  %1415 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1409, i32 0, i32 3
  %1416 = load i8*, i8** %1415, align 8
  %1417 = getelementptr i8, i8* %1416, i32 %1411
  %1418 = bitcast i8* %1417 to i8**
  %1419 = add i32 %1411, 8
  store i32 %1419, i32* %1410, align 8
  br label %1426

; <label>:1420:                                   ; preds = %1406
  %pgocount125 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 115)
  %1421 = add i64 %pgocount125, 1
  store i64 %1421, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 115)
  %1422 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1409, i32 0, i32 2
  %1423 = load i8*, i8** %1422, align 8
  %1424 = bitcast i8* %1423 to i8**
  %1425 = getelementptr i8, i8* %1423, i32 8
  store i8* %1425, i8** %1422, align 8
  br label %1426

; <label>:1426:                                   ; preds = %1420, %1413
  %1427 = phi i8** [ %1418, %1413 ], [ %1424, %1420 ]
  %1428 = load i8*, i8** %1427, align 8
  call void @_TIFFsetString(i8** %1408, i8* %1428)
  br label %2141

; <label>:1429:                                   ; preds = %3
  %1430 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1431 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1430, i32 0, i32 70
  %1432 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1433 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1432, i32 0, i32 0
  %1434 = load i32, i32* %1433, align 8
  %1435 = icmp ule i32 %1434, 40
  br i1 %1435, label %1436, label %1443

; <label>:1436:                                   ; preds = %1429
  %pgocount126 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 116)
  %1437 = add i64 %pgocount126, 1
  store i64 %1437, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 116)
  %1438 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1432, i32 0, i32 3
  %1439 = load i8*, i8** %1438, align 8
  %1440 = getelementptr i8, i8* %1439, i32 %1434
  %1441 = bitcast i8* %1440 to i8**
  %1442 = add i32 %1434, 8
  store i32 %1442, i32* %1433, align 8
  br label %1449

; <label>:1443:                                   ; preds = %1429
  %pgocount127 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 117)
  %1444 = add i64 %pgocount127, 1
  store i64 %1444, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 117)
  %1445 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1432, i32 0, i32 2
  %1446 = load i8*, i8** %1445, align 8
  %1447 = bitcast i8* %1446 to i8**
  %1448 = getelementptr i8, i8* %1446, i32 8
  store i8* %1448, i8** %1445, align 8
  br label %1449

; <label>:1449:                                   ; preds = %1443, %1436
  %1450 = phi i8** [ %1441, %1436 ], [ %1447, %1443 ]
  %1451 = load i8*, i8** %1450, align 8
  call void @_TIFFsetString(i8** %1431, i8* %1451)
  br label %2141

; <label>:1452:                                   ; preds = %3
  %1453 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1454 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1453, i32 0, i32 1
  %1455 = load i32, i32* %1454, align 4
  %1456 = icmp ule i32 %1455, 160
  br i1 %1456, label %1457, label %1464

; <label>:1457:                                   ; preds = %1452
  %pgocount128 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 33)
  %1458 = add i64 %pgocount128, 1
  store i64 %1458, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 33)
  %1459 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1453, i32 0, i32 3
  %1460 = load i8*, i8** %1459, align 8
  %1461 = getelementptr i8, i8* %1460, i32 %1455
  %1462 = bitcast i8* %1461 to double*
  %1463 = add i32 %1455, 16
  store i32 %1463, i32* %1454, align 4
  br label %1470

; <label>:1464:                                   ; preds = %1452
  %pgocount129 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 34)
  %1465 = add i64 %pgocount129, 1
  store i64 %1465, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 34)
  %1466 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1453, i32 0, i32 2
  %1467 = load i8*, i8** %1466, align 8
  %1468 = bitcast i8* %1467 to double*
  %1469 = getelementptr i8, i8* %1467, i32 8
  store i8* %1469, i8** %1466, align 8
  br label %1470

; <label>:1470:                                   ; preds = %1464, %1457
  %1471 = phi double* [ %1462, %1457 ], [ %1468, %1464 ]
  %1472 = load double, double* %1471, align 8
  %1473 = fptrunc double %1472 to float
  %1474 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1475 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1474, i32 0, i32 71
  store float %1473, float* %1475, align 8
  br label %2141

; <label>:1476:                                   ; preds = %3
  %1477 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1478 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1477, i32 0, i32 72
  %1479 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1480 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1479, i32 0, i32 0
  %1481 = load i32, i32* %1480, align 8
  %1482 = icmp ule i32 %1481, 40
  br i1 %1482, label %1483, label %1490

; <label>:1483:                                   ; preds = %1476
  %pgocount130 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 35)
  %1484 = add i64 %pgocount130, 1
  store i64 %1484, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 35)
  %1485 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1479, i32 0, i32 3
  %1486 = load i8*, i8** %1485, align 8
  %1487 = getelementptr i8, i8* %1486, i32 %1481
  %1488 = bitcast i8* %1487 to float**
  %1489 = add i32 %1481, 8
  store i32 %1489, i32* %1480, align 8
  br label %1496

; <label>:1490:                                   ; preds = %1476
  %pgocount131 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 36)
  %1491 = add i64 %pgocount131, 1
  store i64 %1491, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 36)
  %1492 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1479, i32 0, i32 2
  %1493 = load i8*, i8** %1492, align 8
  %1494 = bitcast i8* %1493 to float**
  %1495 = getelementptr i8, i8* %1493, i32 8
  store i8* %1495, i8** %1492, align 8
  br label %1496

; <label>:1496:                                   ; preds = %1490, %1483
  %1497 = phi float** [ %1488, %1483 ], [ %1494, %1490 ]
  %1498 = load float*, float** %1497, align 8
  call void @_TIFFsetFloatArray(float** %1478, float* %1498, i64 16)
  br label %2141

; <label>:1499:                                   ; preds = %3
  %1500 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1501 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1500, i32 0, i32 73
  %1502 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1503 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1502, i32 0, i32 0
  %1504 = load i32, i32* %1503, align 8
  %1505 = icmp ule i32 %1504, 40
  br i1 %1505, label %1506, label %1513

; <label>:1506:                                   ; preds = %1499
  %pgocount132 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 37)
  %1507 = add i64 %pgocount132, 1
  store i64 %1507, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 37)
  %1508 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1502, i32 0, i32 3
  %1509 = load i8*, i8** %1508, align 8
  %1510 = getelementptr i8, i8* %1509, i32 %1504
  %1511 = bitcast i8* %1510 to float**
  %1512 = add i32 %1504, 8
  store i32 %1512, i32* %1503, align 8
  br label %1519

; <label>:1513:                                   ; preds = %1499
  %pgocount133 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 38)
  %1514 = add i64 %pgocount133, 1
  store i64 %1514, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 38)
  %1515 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1502, i32 0, i32 2
  %1516 = load i8*, i8** %1515, align 8
  %1517 = bitcast i8* %1516 to float**
  %1518 = getelementptr i8, i8* %1516, i32 8
  store i8* %1518, i8** %1515, align 8
  br label %1519

; <label>:1519:                                   ; preds = %1513, %1506
  %1520 = phi float** [ %1511, %1506 ], [ %1517, %1513 ]
  %1521 = load float*, float** %1520, align 8
  call void @_TIFFsetFloatArray(float** %1501, float* %1521, i64 16)
  br label %2141

; <label>:1522:                                   ; preds = %3
  %1523 = load %struct.tiff*, %struct.tiff** %5, align 8
  %1524 = getelementptr inbounds %struct.tiff, %struct.tiff* %1523, i32 0, i32 3
  %1525 = load i32, i32* %1524, align 8
  %1526 = and i32 %1525, 8192
  %1527 = icmp eq i32 %1526, 0
  br i1 %1527, label %1528, label %1577

; <label>:1528:                                   ; preds = %1522
  %1529 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1530 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1529, i32 0, i32 0
  %1531 = load i32, i32* %1530, align 8
  %1532 = icmp ule i32 %1531, 40
  br i1 %1532, label %1533, label %1539

; <label>:1533:                                   ; preds = %1528
  %1534 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1529, i32 0, i32 3
  %1535 = load i8*, i8** %1534, align 8
  %1536 = getelementptr i8, i8* %1535, i32 %1531
  %1537 = bitcast i8* %1536 to i32*
  %1538 = add i32 %1531, 8
  store i32 %1538, i32* %1530, align 8
  br label %1545

; <label>:1539:                                   ; preds = %1528
  %pgocount134 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 160)
  %1540 = add i64 %pgocount134, 1
  store i64 %1540, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 160)
  %1541 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1529, i32 0, i32 2
  %1542 = load i8*, i8** %1541, align 8
  %1543 = bitcast i8* %1542 to i32*
  %1544 = getelementptr i8, i8* %1542, i32 8
  store i8* %1544, i8** %1541, align 8
  br label %1545

; <label>:1545:                                   ; preds = %1539, %1533
  %1546 = phi i32* [ %1537, %1533 ], [ %1543, %1539 ]
  %1547 = load i32, i32* %1546, align 4
  %1548 = trunc i32 %1547 to i16
  %1549 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1550 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1549, i32 0, i32 46
  store i16 %1548, i16* %1550, align 8
  %1551 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1552 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1551, i32 0, i32 47
  %1553 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1554 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1553, i32 0, i32 0
  %1555 = load i32, i32* %1554, align 8
  %1556 = icmp ule i32 %1555, 40
  br i1 %1556, label %1557, label %1564

; <label>:1557:                                   ; preds = %1545
  %pgocount135 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 161)
  %1558 = add i64 %pgocount135, 1
  store i64 %1558, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 161)
  %1559 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1553, i32 0, i32 3
  %1560 = load i8*, i8** %1559, align 8
  %1561 = getelementptr i8, i8* %1560, i32 %1555
  %1562 = bitcast i8* %1561 to i32**
  %1563 = add i32 %1555, 8
  store i32 %1563, i32* %1554, align 8
  br label %1570

; <label>:1564:                                   ; preds = %1545
  %pgocount136 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 162)
  %1565 = add i64 %pgocount136, 1
  store i64 %1565, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 162)
  %1566 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1553, i32 0, i32 2
  %1567 = load i8*, i8** %1566, align 8
  %1568 = bitcast i8* %1567 to i32**
  %1569 = getelementptr i8, i8* %1567, i32 8
  store i8* %1569, i8** %1566, align 8
  br label %1570

; <label>:1570:                                   ; preds = %1564, %1557
  %1571 = phi i32** [ %1562, %1557 ], [ %1568, %1564 ]
  %1572 = load i32*, i32** %1571, align 8
  %1573 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1574 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1573, i32 0, i32 46
  %1575 = load i16, i16* %1574, align 8
  %1576 = zext i16 %1575 to i64
  call void @_TIFFsetLongArray(i32** %1552, i32* %1572, i64 %1576)
  br label %1582

; <label>:1577:                                   ; preds = %1522
  %pgocount137 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 39)
  %1578 = add i64 %pgocount137, 1
  store i64 %1578, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 39)
  %1579 = load %struct.tiff*, %struct.tiff** %5, align 8
  %1580 = getelementptr inbounds %struct.tiff, %struct.tiff* %1579, i32 0, i32 0
  %1581 = load i8*, i8** %1580, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %1581, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.12, i32 0, i32 0))
  store i32 0, i32* %9, align 4
  br label %1582

; <label>:1582:                                   ; preds = %1577, %1570
  br label %2141

; <label>:1583:                                   ; preds = %3
  %1584 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1585 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1584, i32 0, i32 48
  %1586 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1587 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1586, i32 0, i32 0
  %1588 = load i32, i32* %1587, align 8
  %1589 = icmp ule i32 %1588, 40
  br i1 %1589, label %1590, label %1597

; <label>:1590:                                   ; preds = %1583
  %pgocount138 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 118)
  %1591 = add i64 %pgocount138, 1
  store i64 %1591, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 118)
  %1592 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1586, i32 0, i32 3
  %1593 = load i8*, i8** %1592, align 8
  %1594 = getelementptr i8, i8* %1593, i32 %1588
  %1595 = bitcast i8* %1594 to float**
  %1596 = add i32 %1588, 8
  store i32 %1596, i32* %1587, align 8
  br label %1603

; <label>:1597:                                   ; preds = %1583
  %pgocount139 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 119)
  %1598 = add i64 %pgocount139, 1
  store i64 %1598, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 119)
  %1599 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1586, i32 0, i32 2
  %1600 = load i8*, i8** %1599, align 8
  %1601 = bitcast i8* %1600 to float**
  %1602 = getelementptr i8, i8* %1600, i32 8
  store i8* %1602, i8** %1599, align 8
  br label %1603

; <label>:1603:                                   ; preds = %1597, %1590
  %1604 = phi float** [ %1595, %1590 ], [ %1601, %1597 ]
  %1605 = load float*, float** %1604, align 8
  call void @_TIFFsetFloatArray(float** %1585, float* %1605, i64 3)
  br label %2141

; <label>:1606:                                   ; preds = %3
  %1607 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1608 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1607, i32 0, i32 0
  %1609 = load i32, i32* %1608, align 8
  %1610 = icmp ule i32 %1609, 40
  br i1 %1610, label %1611, label %1618

; <label>:1611:                                   ; preds = %1606
  %pgocount140 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 120)
  %1612 = add i64 %pgocount140, 1
  store i64 %1612, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 120)
  %1613 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1607, i32 0, i32 3
  %1614 = load i8*, i8** %1613, align 8
  %1615 = getelementptr i8, i8* %1614, i32 %1609
  %1616 = bitcast i8* %1615 to i32*
  %1617 = add i32 %1609, 8
  store i32 %1617, i32* %1608, align 8
  br label %1624

; <label>:1618:                                   ; preds = %1606
  %pgocount141 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 121)
  %1619 = add i64 %pgocount141, 1
  store i64 %1619, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 121)
  %1620 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1607, i32 0, i32 2
  %1621 = load i8*, i8** %1620, align 8
  %1622 = bitcast i8* %1621 to i32*
  %1623 = getelementptr i8, i8* %1621, i32 8
  store i8* %1623, i8** %1620, align 8
  br label %1624

; <label>:1624:                                   ; preds = %1618, %1611
  %1625 = phi i32* [ %1616, %1611 ], [ %1622, %1618 ]
  %1626 = load i32, i32* %1625, align 4
  %1627 = trunc i32 %1626 to i16
  %1628 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1629 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1628, i32 0, i32 50
  store i16 %1627, i16* %1629, align 4
  br label %2141

; <label>:1630:                                   ; preds = %3
  %1631 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1632 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1631, i32 0, i32 0
  %1633 = load i32, i32* %1632, align 8
  %1634 = icmp ule i32 %1633, 40
  br i1 %1634, label %1635, label %1641

; <label>:1635:                                   ; preds = %1630
  %1636 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1631, i32 0, i32 3
  %1637 = load i8*, i8** %1636, align 8
  %1638 = getelementptr i8, i8* %1637, i32 %1633
  %1639 = bitcast i8* %1638 to i32*
  %1640 = add i32 %1633, 8
  store i32 %1640, i32* %1632, align 8
  br label %1647

; <label>:1641:                                   ; preds = %1630
  %pgocount142 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 40)
  %1642 = add i64 %pgocount142, 1
  store i64 %1642, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 40)
  %1643 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1631, i32 0, i32 2
  %1644 = load i8*, i8** %1643, align 8
  %1645 = bitcast i8* %1644 to i32*
  %1646 = getelementptr i8, i8* %1644, i32 8
  store i8* %1646, i8** %1643, align 8
  br label %1647

; <label>:1647:                                   ; preds = %1641, %1635
  %1648 = phi i32* [ %1639, %1635 ], [ %1645, %1641 ]
  %1649 = load i32, i32* %1648, align 4
  %1650 = trunc i32 %1649 to i16
  %1651 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1652 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1651, i32 0, i32 49
  %1653 = getelementptr inbounds [2 x i16], [2 x i16]* %1652, i64 0, i64 0
  store i16 %1650, i16* %1653, align 8
  %1654 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1655 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1654, i32 0, i32 0
  %1656 = load i32, i32* %1655, align 8
  %1657 = icmp ule i32 %1656, 40
  br i1 %1657, label %1658, label %1665

; <label>:1658:                                   ; preds = %1647
  %pgocount143 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 41)
  %1659 = add i64 %pgocount143, 1
  store i64 %1659, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 41)
  %1660 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1654, i32 0, i32 3
  %1661 = load i8*, i8** %1660, align 8
  %1662 = getelementptr i8, i8* %1661, i32 %1656
  %1663 = bitcast i8* %1662 to i32*
  %1664 = add i32 %1656, 8
  store i32 %1664, i32* %1655, align 8
  br label %1671

; <label>:1665:                                   ; preds = %1647
  %pgocount144 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 42)
  %1666 = add i64 %pgocount144, 1
  store i64 %1666, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 42)
  %1667 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1654, i32 0, i32 2
  %1668 = load i8*, i8** %1667, align 8
  %1669 = bitcast i8* %1668 to i32*
  %1670 = getelementptr i8, i8* %1668, i32 8
  store i8* %1670, i8** %1667, align 8
  br label %1671

; <label>:1671:                                   ; preds = %1665, %1658
  %1672 = phi i32* [ %1663, %1658 ], [ %1669, %1665 ]
  %1673 = load i32, i32* %1672, align 4
  %1674 = trunc i32 %1673 to i16
  %1675 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1676 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1675, i32 0, i32 49
  %1677 = getelementptr inbounds [2 x i16], [2 x i16]* %1676, i64 0, i64 1
  store i16 %1674, i16* %1677, align 2
  br label %2141

; <label>:1678:                                   ; preds = %3
  %1679 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1680 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1679, i32 0, i32 51
  %1681 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1682 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1681, i32 0, i32 0
  %1683 = load i32, i32* %1682, align 8
  %1684 = icmp ule i32 %1683, 40
  br i1 %1684, label %1685, label %1692

; <label>:1685:                                   ; preds = %1678
  %pgocount145 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 122)
  %1686 = add i64 %pgocount145, 1
  store i64 %1686, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 122)
  %1687 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1681, i32 0, i32 3
  %1688 = load i8*, i8** %1687, align 8
  %1689 = getelementptr i8, i8* %1688, i32 %1683
  %1690 = bitcast i8* %1689 to float**
  %1691 = add i32 %1683, 8
  store i32 %1691, i32* %1682, align 8
  br label %1698

; <label>:1692:                                   ; preds = %1678
  %pgocount146 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 123)
  %1693 = add i64 %pgocount146, 1
  store i64 %1693, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 123)
  %1694 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1681, i32 0, i32 2
  %1695 = load i8*, i8** %1694, align 8
  %1696 = bitcast i8* %1695 to float**
  %1697 = getelementptr i8, i8* %1695, i32 8
  store i8* %1697, i8** %1694, align 8
  br label %1698

; <label>:1698:                                   ; preds = %1692, %1685
  %1699 = phi float** [ %1690, %1685 ], [ %1696, %1692 ]
  %1700 = load float*, float** %1699, align 8
  call void @_TIFFsetFloatArray(float** %1680, float* %1700, i64 2)
  br label %2141

; <label>:1701:                                   ; preds = %3
  %1702 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1703 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1702, i32 0, i32 52
  %1704 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1705 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1704, i32 0, i32 0
  %1706 = load i32, i32* %1705, align 8
  %1707 = icmp ule i32 %1706, 40
  br i1 %1707, label %1708, label %1715

; <label>:1708:                                   ; preds = %1701
  %pgocount147 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 124)
  %1709 = add i64 %pgocount147, 1
  store i64 %1709, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 124)
  %1710 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1704, i32 0, i32 3
  %1711 = load i8*, i8** %1710, align 8
  %1712 = getelementptr i8, i8* %1711, i32 %1706
  %1713 = bitcast i8* %1712 to float**
  %1714 = add i32 %1706, 8
  store i32 %1714, i32* %1705, align 8
  br label %1721

; <label>:1715:                                   ; preds = %1701
  %pgocount148 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 125)
  %1716 = add i64 %pgocount148, 1
  store i64 %1716, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 125)
  %1717 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1704, i32 0, i32 2
  %1718 = load i8*, i8** %1717, align 8
  %1719 = bitcast i8* %1718 to float**
  %1720 = getelementptr i8, i8* %1718, i32 8
  store i8* %1720, i8** %1717, align 8
  br label %1721

; <label>:1721:                                   ; preds = %1715, %1708
  %1722 = phi float** [ %1713, %1708 ], [ %1719, %1715 ]
  %1723 = load float*, float** %1722, align 8
  call void @_TIFFsetFloatArray(float** %1703, float* %1723, i64 6)
  br label %2141

; <label>:1724:                                   ; preds = %3
  %pgocount149 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 3)
  %1725 = add i64 %pgocount149, 1
  store i64 %1725, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 3)
  %1726 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1727 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1726, i32 0, i32 15
  %1728 = load i16, i16* %1727, align 2
  %1729 = zext i16 %1728 to i32
  %1730 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1731 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1730, i32 0, i32 30
  %1732 = load i16, i16* %1731, align 4
  %1733 = zext i16 %1732 to i32
  %1734 = sub nsw i32 %1729, %1733
  %1735 = icmp sgt i32 %1734, 1
  %1736 = zext i1 %1735 to i64
  %pgocount150 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 179)
  %1737 = add i64 %pgocount150, %1736
  store i64 %1737, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 179)
  %1738 = select i1 %1735, i32 3, i32 1
  store i32 %1738, i32* %12, align 4
  store i32 0, i32* %11, align 4
  br label %1739

; <label>:1739:                                   ; preds = %1775, %1724
  %1740 = load i32, i32* %11, align 4
  %1741 = load i32, i32* %12, align 4
  %1742 = icmp slt i32 %1740, %1741
  br i1 %1742, label %1743, label %1778

; <label>:1743:                                   ; preds = %1739
  %1744 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1745 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1744, i32 0, i32 54
  %1746 = load i32, i32* %11, align 4
  %1747 = sext i32 %1746 to i64
  %1748 = getelementptr inbounds [3 x i16*], [3 x i16*]* %1745, i64 0, i64 %1747
  %1749 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1750 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1749, i32 0, i32 0
  %1751 = load i32, i32* %1750, align 8
  %1752 = icmp ule i32 %1751, 40
  br i1 %1752, label %1753, label %1760

; <label>:1753:                                   ; preds = %1743
  %pgocount151 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 1)
  %1754 = add i64 %pgocount151, 1
  store i64 %1754, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 1)
  %1755 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1749, i32 0, i32 3
  %1756 = load i8*, i8** %1755, align 8
  %1757 = getelementptr i8, i8* %1756, i32 %1751
  %1758 = bitcast i8* %1757 to i16**
  %1759 = add i32 %1751, 8
  store i32 %1759, i32* %1750, align 8
  br label %1766

; <label>:1760:                                   ; preds = %1743
  %pgocount152 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 2)
  %1761 = add i64 %pgocount152, 1
  store i64 %1761, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 2)
  %1762 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1749, i32 0, i32 2
  %1763 = load i8*, i8** %1762, align 8
  %1764 = bitcast i8* %1763 to i16**
  %1765 = getelementptr i8, i8* %1763, i32 8
  store i8* %1765, i8** %1762, align 8
  br label %1766

; <label>:1766:                                   ; preds = %1760, %1753
  %1767 = phi i16** [ %1758, %1753 ], [ %1764, %1760 ]
  %1768 = load i16*, i16** %1767, align 8
  %1769 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1770 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1769, i32 0, i32 8
  %1771 = load i16, i16* %1770, align 4
  %1772 = zext i16 %1771 to i32
  %1773 = zext i32 %1772 to i64
  %1774 = shl i64 1, %1773
  call void @_TIFFsetShortArray(i16** %1748, i16* %1768, i64 %1774)
  br label %1775

; <label>:1775:                                   ; preds = %1766
  %1776 = load i32, i32* %11, align 4
  %1777 = add nsw i32 %1776, 1
  store i32 %1777, i32* %11, align 4
  br label %1739

; <label>:1778:                                   ; preds = %1739
  br label %2141

; <label>:1779:                                   ; preds = %3
  %1780 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1781 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1780, i32 0, i32 53
  %1782 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1783 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1782, i32 0, i32 0
  %1784 = load i32, i32* %1783, align 8
  %1785 = icmp ule i32 %1784, 40
  br i1 %1785, label %1786, label %1793

; <label>:1786:                                   ; preds = %1779
  %pgocount153 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 126)
  %1787 = add i64 %pgocount153, 1
  store i64 %1787, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 126)
  %1788 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1782, i32 0, i32 3
  %1789 = load i8*, i8** %1788, align 8
  %1790 = getelementptr i8, i8* %1789, i32 %1784
  %1791 = bitcast i8* %1790 to float**
  %1792 = add i32 %1784, 8
  store i32 %1792, i32* %1783, align 8
  br label %1799

; <label>:1793:                                   ; preds = %1779
  %pgocount154 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 127)
  %1794 = add i64 %pgocount154, 1
  store i64 %1794, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 127)
  %1795 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1782, i32 0, i32 2
  %1796 = load i8*, i8** %1795, align 8
  %1797 = bitcast i8* %1796 to float**
  %1798 = getelementptr i8, i8* %1796, i32 8
  store i8* %1798, i8** %1795, align 8
  br label %1799

; <label>:1799:                                   ; preds = %1793, %1786
  %1800 = phi float** [ %1791, %1786 ], [ %1797, %1793 ]
  %1801 = load float*, float** %1800, align 8
  call void @_TIFFsetFloatArray(float** %1781, float* %1801, i64 6)
  br label %2141

; <label>:1802:                                   ; preds = %3
  %1803 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1804 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1803, i32 0, i32 0
  %1805 = load i32, i32* %1804, align 8
  %1806 = icmp ule i32 %1805, 40
  br i1 %1806, label %1807, label %1814

; <label>:1807:                                   ; preds = %1802
  %pgocount155 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 43)
  %1808 = add i64 %pgocount155, 1
  store i64 %1808, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 43)
  %1809 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1803, i32 0, i32 3
  %1810 = load i8*, i8** %1809, align 8
  %1811 = getelementptr i8, i8* %1810, i32 %1805
  %1812 = bitcast i8* %1811 to i32*
  %1813 = add i32 %1805, 8
  store i32 %1813, i32* %1804, align 8
  br label %1820

; <label>:1814:                                   ; preds = %1802
  %pgocount156 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 44)
  %1815 = add i64 %pgocount156, 1
  store i64 %1815, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 44)
  %1816 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1803, i32 0, i32 2
  %1817 = load i8*, i8** %1816, align 8
  %1818 = bitcast i8* %1817 to i32*
  %1819 = getelementptr i8, i8* %1817, i32 8
  store i8* %1819, i8** %1816, align 8
  br label %1820

; <label>:1820:                                   ; preds = %1814, %1807
  %1821 = phi i32* [ %1812, %1807 ], [ %1818, %1814 ]
  %1822 = load i32, i32* %1821, align 4
  %1823 = trunc i32 %1822 to i16
  %1824 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1825 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1824, i32 0, i32 55
  store i16 %1823, i16* %1825, align 8
  br label %2141

; <label>:1826:                                   ; preds = %3
  %1827 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1828 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1827, i32 0, i32 0
  %1829 = load i32, i32* %1828, align 8
  %1830 = icmp ule i32 %1829, 40
  br i1 %1830, label %1831, label %1837

; <label>:1831:                                   ; preds = %1826
  %1832 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1827, i32 0, i32 3
  %1833 = load i8*, i8** %1832, align 8
  %1834 = getelementptr i8, i8* %1833, i32 %1829
  %1835 = bitcast i8* %1834 to i32*
  %1836 = add i32 %1829, 8
  store i32 %1836, i32* %1828, align 8
  br label %1843

; <label>:1837:                                   ; preds = %1826
  %pgocount157 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 128)
  %1838 = add i64 %pgocount157, 1
  store i64 %1838, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 128)
  %1839 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1827, i32 0, i32 2
  %1840 = load i8*, i8** %1839, align 8
  %1841 = bitcast i8* %1840 to i32*
  %1842 = getelementptr i8, i8* %1840, i32 8
  store i8* %1842, i8** %1839, align 8
  br label %1843

; <label>:1843:                                   ; preds = %1837, %1831
  %1844 = phi i32* [ %1835, %1831 ], [ %1841, %1837 ]
  %1845 = load i32, i32* %1844, align 4
  %1846 = trunc i32 %1845 to i16
  %1847 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1848 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1847, i32 0, i32 57
  %1849 = getelementptr inbounds [2 x i16], [2 x i16]* %1848, i64 0, i64 0
  store i16 %1846, i16* %1849, align 4
  %1850 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1851 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1850, i32 0, i32 0
  %1852 = load i32, i32* %1851, align 8
  %1853 = icmp ule i32 %1852, 40
  br i1 %1853, label %1854, label %1861

; <label>:1854:                                   ; preds = %1843
  %pgocount158 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 129)
  %1855 = add i64 %pgocount158, 1
  store i64 %1855, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 129)
  %1856 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1850, i32 0, i32 3
  %1857 = load i8*, i8** %1856, align 8
  %1858 = getelementptr i8, i8* %1857, i32 %1852
  %1859 = bitcast i8* %1858 to i32*
  %1860 = add i32 %1852, 8
  store i32 %1860, i32* %1851, align 8
  br label %1867

; <label>:1861:                                   ; preds = %1843
  %pgocount159 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 130)
  %1862 = add i64 %pgocount159, 1
  store i64 %1862, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 130)
  %1863 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1850, i32 0, i32 2
  %1864 = load i8*, i8** %1863, align 8
  %1865 = bitcast i8* %1864 to i32*
  %1866 = getelementptr i8, i8* %1864, i32 8
  store i8* %1866, i8** %1863, align 8
  br label %1867

; <label>:1867:                                   ; preds = %1861, %1854
  %1868 = phi i32* [ %1859, %1854 ], [ %1865, %1861 ]
  %1869 = load i32, i32* %1868, align 4
  %1870 = trunc i32 %1869 to i16
  %1871 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1872 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1871, i32 0, i32 57
  %1873 = getelementptr inbounds [2 x i16], [2 x i16]* %1872, i64 0, i64 1
  store i16 %1870, i16* %1873, align 2
  br label %2141

; <label>:1874:                                   ; preds = %3
  %1875 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1876 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1875, i32 0, i32 0
  %1877 = load i32, i32* %1876, align 8
  %1878 = icmp ule i32 %1877, 40
  br i1 %1878, label %1879, label %1885

; <label>:1879:                                   ; preds = %1874
  %1880 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1875, i32 0, i32 3
  %1881 = load i8*, i8** %1880, align 8
  %1882 = getelementptr i8, i8* %1881, i32 %1877
  %1883 = bitcast i8* %1882 to i32*
  %1884 = add i32 %1877, 8
  store i32 %1884, i32* %1876, align 8
  br label %1891

; <label>:1885:                                   ; preds = %1874
  %pgocount160 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 131)
  %1886 = add i64 %pgocount160, 1
  store i64 %1886, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 131)
  %1887 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1875, i32 0, i32 2
  %1888 = load i8*, i8** %1887, align 8
  %1889 = bitcast i8* %1888 to i32*
  %1890 = getelementptr i8, i8* %1888, i32 8
  store i8* %1890, i8** %1887, align 8
  br label %1891

; <label>:1891:                                   ; preds = %1885, %1879
  %1892 = phi i32* [ %1883, %1879 ], [ %1889, %1885 ]
  %1893 = load i32, i32* %1892, align 4
  store i32 %1893, i32* %11, align 4
  %1894 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1895 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1894, i32 0, i32 0
  %1896 = load i32, i32* %1895, align 8
  %1897 = icmp ule i32 %1896, 40
  br i1 %1897, label %1898, label %1905

; <label>:1898:                                   ; preds = %1891
  %pgocount161 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 132)
  %1899 = add i64 %pgocount161, 1
  store i64 %1899, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 132)
  %1900 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1894, i32 0, i32 3
  %1901 = load i8*, i8** %1900, align 8
  %1902 = getelementptr i8, i8* %1901, i32 %1896
  %1903 = bitcast i8* %1902 to i8**
  %1904 = add i32 %1896, 8
  store i32 %1904, i32* %1895, align 8
  br label %1911

; <label>:1905:                                   ; preds = %1891
  %pgocount162 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 133)
  %1906 = add i64 %pgocount162, 1
  store i64 %1906, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 133)
  %1907 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1894, i32 0, i32 2
  %1908 = load i8*, i8** %1907, align 8
  %1909 = bitcast i8* %1908 to i8**
  %1910 = getelementptr i8, i8* %1908, i32 8
  store i8* %1910, i8** %1907, align 8
  br label %1911

; <label>:1911:                                   ; preds = %1905, %1898
  %1912 = phi i8** [ %1903, %1898 ], [ %1909, %1905 ]
  %1913 = load i8*, i8** %1912, align 8
  store i8* %1913, i8** %14, align 8
  %1914 = load %struct.tiff*, %struct.tiff** %5, align 8
  %1915 = load i32, i32* %11, align 4
  %1916 = load i8*, i8** %14, align 8
  %1917 = call i32 @checkInkNamesString(%struct.tiff* %1914, i32 %1915, i8* %1916)
  store i32 %1917, i32* %11, align 4
  %1918 = load i32, i32* %11, align 4
  %1919 = icmp sgt i32 %1918, 0
  %1920 = zext i1 %1919 to i32
  store i32 %1920, i32* %9, align 4
  %1921 = load i32, i32* %11, align 4
  %1922 = icmp sgt i32 %1921, 0
  br i1 %1922, label %1923, label %1933

; <label>:1923:                                   ; preds = %1911
  %pgocount163 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 10)
  %1924 = add i64 %pgocount163, 1
  store i64 %1924, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 10)
  %1925 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1926 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1925, i32 0, i32 59
  %1927 = load i8*, i8** %14, align 8
  %1928 = load i32, i32* %11, align 4
  %1929 = sext i32 %1928 to i64
  call void @_TIFFsetNString(i8** %1926, i8* %1927, i64 %1929)
  %1930 = load i32, i32* %11, align 4
  %1931 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1932 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1931, i32 0, i32 58
  store i32 %1930, i32* %1932, align 8
  br label %1933

; <label>:1933:                                   ; preds = %1923, %1911
  br label %2141

; <label>:1934:                                   ; preds = %3
  %1935 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1936 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1935, i32 0, i32 0
  %1937 = load i32, i32* %1936, align 8
  %1938 = icmp ule i32 %1937, 40
  br i1 %1938, label %1939, label %1946

; <label>:1939:                                   ; preds = %1934
  %pgocount164 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 134)
  %1940 = add i64 %pgocount164, 1
  store i64 %1940, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 134)
  %1941 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1935, i32 0, i32 3
  %1942 = load i8*, i8** %1941, align 8
  %1943 = getelementptr i8, i8* %1942, i32 %1937
  %1944 = bitcast i8* %1943 to i32*
  %1945 = add i32 %1937, 8
  store i32 %1945, i32* %1936, align 8
  br label %1952

; <label>:1946:                                   ; preds = %1934
  %pgocount165 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 135)
  %1947 = add i64 %pgocount165, 1
  store i64 %1947, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 135)
  %1948 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1935, i32 0, i32 2
  %1949 = load i8*, i8** %1948, align 8
  %1950 = bitcast i8* %1949 to i32*
  %1951 = getelementptr i8, i8* %1949, i32 8
  store i8* %1951, i8** %1948, align 8
  br label %1952

; <label>:1952:                                   ; preds = %1946, %1939
  %1953 = phi i32* [ %1944, %1939 ], [ %1950, %1946 ]
  %1954 = load i32, i32* %1953, align 4
  %1955 = trunc i32 %1954 to i16
  %1956 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1957 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1956, i32 0, i32 56
  store i16 %1955, i16* %1957, align 2
  br label %2141

; <label>:1958:                                   ; preds = %3
  %1959 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %1960 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1959, i32 0, i32 60
  %1961 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1962 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1961, i32 0, i32 0
  %1963 = load i32, i32* %1962, align 8
  %1964 = icmp ule i32 %1963, 40
  br i1 %1964, label %1965, label %1972

; <label>:1965:                                   ; preds = %1958
  %pgocount166 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 136)
  %1966 = add i64 %pgocount166, 1
  store i64 %1966, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 136)
  %1967 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1961, i32 0, i32 3
  %1968 = load i8*, i8** %1967, align 8
  %1969 = getelementptr i8, i8* %1968, i32 %1963
  %1970 = bitcast i8* %1969 to i8**
  %1971 = add i32 %1963, 8
  store i32 %1971, i32* %1962, align 8
  br label %1978

; <label>:1972:                                   ; preds = %1958
  %pgocount167 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 137)
  %1973 = add i64 %pgocount167, 1
  store i64 %1973, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 137)
  %1974 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1961, i32 0, i32 2
  %1975 = load i8*, i8** %1974, align 8
  %1976 = bitcast i8* %1975 to i8**
  %1977 = getelementptr i8, i8* %1975, i32 8
  store i8* %1977, i8** %1974, align 8
  br label %1978

; <label>:1978:                                   ; preds = %1972, %1965
  %1979 = phi i8** [ %1970, %1965 ], [ %1976, %1972 ]
  %1980 = load i8*, i8** %1979, align 8
  call void @_TIFFsetString(i8** %1960, i8* %1980)
  br label %2141

; <label>:1981:                                   ; preds = %3
  %1982 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %1983 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1982, i32 0, i32 0
  %1984 = load i32, i32* %1983, align 8
  %1985 = icmp ule i32 %1984, 40
  br i1 %1985, label %1986, label %1992

; <label>:1986:                                   ; preds = %1981
  %1987 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1982, i32 0, i32 3
  %1988 = load i8*, i8** %1987, align 8
  %1989 = getelementptr i8, i8* %1988, i32 %1984
  %1990 = bitcast i8* %1989 to i32*
  %1991 = add i32 %1984, 8
  store i32 %1991, i32* %1983, align 8
  br label %1998

; <label>:1992:                                   ; preds = %1981
  %pgocount168 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 138)
  %1993 = add i64 %pgocount168, 1
  store i64 %1993, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 138)
  %1994 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1982, i32 0, i32 2
  %1995 = load i8*, i8** %1994, align 8
  %1996 = bitcast i8* %1995 to i32*
  %1997 = getelementptr i8, i8* %1995, i32 8
  store i8* %1997, i8** %1994, align 8
  br label %1998

; <label>:1998:                                   ; preds = %1992, %1986
  %1999 = phi i32* [ %1990, %1986 ], [ %1996, %1992 ]
  %2000 = load i32, i32* %1999, align 4
  %2001 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %2002 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %2001, i32 0, i32 61
  store i32 %2000, i32* %2002, align 8
  %2003 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %2004 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %2003, i32 0, i32 62
  %2005 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %2006 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2005, i32 0, i32 0
  %2007 = load i32, i32* %2006, align 8
  %2008 = icmp ule i32 %2007, 40
  br i1 %2008, label %2009, label %2016

; <label>:2009:                                   ; preds = %1998
  %pgocount169 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 139)
  %2010 = add i64 %pgocount169, 1
  store i64 %2010, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 139)
  %2011 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2005, i32 0, i32 3
  %2012 = load i8*, i8** %2011, align 8
  %2013 = getelementptr i8, i8* %2012, i32 %2007
  %2014 = bitcast i8* %2013 to i8**
  %2015 = add i32 %2007, 8
  store i32 %2015, i32* %2006, align 8
  br label %2022

; <label>:2016:                                   ; preds = %1998
  %pgocount170 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 140)
  %2017 = add i64 %pgocount170, 1
  store i64 %2017, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 140)
  %2018 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2005, i32 0, i32 2
  %2019 = load i8*, i8** %2018, align 8
  %2020 = bitcast i8* %2019 to i8**
  %2021 = getelementptr i8, i8* %2019, i32 8
  store i8* %2021, i8** %2018, align 8
  br label %2022

; <label>:2022:                                   ; preds = %2016, %2009
  %2023 = phi i8** [ %2014, %2009 ], [ %2020, %2016 ]
  %2024 = load i8*, i8** %2023, align 8
  %2025 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %2026 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %2025, i32 0, i32 61
  %2027 = load i32, i32* %2026, align 8
  %2028 = zext i32 %2027 to i64
  call void @_TIFFsetByteArray(i8** %2004, i8* %2024, i64 %2028)
  br label %2141

; <label>:2029:                                   ; preds = %3
  %2030 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %2031 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2030, i32 0, i32 0
  %2032 = load i32, i32* %2031, align 8
  %2033 = icmp ule i32 %2032, 40
  br i1 %2033, label %2034, label %2040

; <label>:2034:                                   ; preds = %2029
  %2035 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2030, i32 0, i32 3
  %2036 = load i8*, i8** %2035, align 8
  %2037 = getelementptr i8, i8* %2036, i32 %2032
  %2038 = bitcast i8* %2037 to i32*
  %2039 = add i32 %2032, 8
  store i32 %2039, i32* %2031, align 8
  br label %2046

; <label>:2040:                                   ; preds = %2029
  %pgocount171 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 141)
  %2041 = add i64 %pgocount171, 1
  store i64 %2041, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 141)
  %2042 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2030, i32 0, i32 2
  %2043 = load i8*, i8** %2042, align 8
  %2044 = bitcast i8* %2043 to i32*
  %2045 = getelementptr i8, i8* %2043, i32 8
  store i8* %2045, i8** %2042, align 8
  br label %2046

; <label>:2046:                                   ; preds = %2040, %2034
  %2047 = phi i32* [ %2038, %2034 ], [ %2044, %2040 ]
  %2048 = load i32, i32* %2047, align 4
  %2049 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %2050 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %2049, i32 0, i32 63
  store i32 %2048, i32* %2050, align 8
  %2051 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %2052 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %2051, i32 0, i32 64
  %2053 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %2054 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2053, i32 0, i32 0
  %2055 = load i32, i32* %2054, align 8
  %2056 = icmp ule i32 %2055, 40
  br i1 %2056, label %2057, label %2064

; <label>:2057:                                   ; preds = %2046
  %pgocount172 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 142)
  %2058 = add i64 %pgocount172, 1
  store i64 %2058, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 142)
  %2059 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2053, i32 0, i32 3
  %2060 = load i8*, i8** %2059, align 8
  %2061 = getelementptr i8, i8* %2060, i32 %2055
  %2062 = bitcast i8* %2061 to i8**
  %2063 = add i32 %2055, 8
  store i32 %2063, i32* %2054, align 8
  br label %2070

; <label>:2064:                                   ; preds = %2046
  %pgocount173 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 143)
  %2065 = add i64 %pgocount173, 1
  store i64 %2065, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 143)
  %2066 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2053, i32 0, i32 2
  %2067 = load i8*, i8** %2066, align 8
  %2068 = bitcast i8* %2067 to i8**
  %2069 = getelementptr i8, i8* %2067, i32 8
  store i8* %2069, i8** %2066, align 8
  br label %2070

; <label>:2070:                                   ; preds = %2064, %2057
  %2071 = phi i8** [ %2062, %2057 ], [ %2068, %2064 ]
  %2072 = load i8*, i8** %2071, align 8
  %2073 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %2074 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %2073, i32 0, i32 63
  %2075 = load i32, i32* %2074, align 8
  %2076 = zext i32 %2075 to i64
  call void @_TIFFsetByteArray(i8** %2052, i8* %2072, i64 %2076)
  br label %2141

; <label>:2077:                                   ; preds = %3
  %2078 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %2079 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2078, i32 0, i32 0
  %2080 = load i32, i32* %2079, align 8
  %2081 = icmp ule i32 %2080, 40
  br i1 %2081, label %2082, label %2088

; <label>:2082:                                   ; preds = %2077
  %2083 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2078, i32 0, i32 3
  %2084 = load i8*, i8** %2083, align 8
  %2085 = getelementptr i8, i8* %2084, i32 %2080
  %2086 = bitcast i8* %2085 to i32*
  %2087 = add i32 %2080, 8
  store i32 %2087, i32* %2079, align 8
  br label %2094

; <label>:2088:                                   ; preds = %2077
  %pgocount174 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 144)
  %2089 = add i64 %pgocount174, 1
  store i64 %2089, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 144)
  %2090 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2078, i32 0, i32 2
  %2091 = load i8*, i8** %2090, align 8
  %2092 = bitcast i8* %2091 to i32*
  %2093 = getelementptr i8, i8* %2091, i32 8
  store i8* %2093, i8** %2090, align 8
  br label %2094

; <label>:2094:                                   ; preds = %2088, %2082
  %2095 = phi i32* [ %2086, %2082 ], [ %2092, %2088 ]
  %2096 = load i32, i32* %2095, align 4
  %2097 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %2098 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %2097, i32 0, i32 65
  store i32 %2096, i32* %2098, align 8
  %2099 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %2100 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %2099, i32 0, i32 66
  %2101 = bitcast i8** %2100 to i32**
  %2102 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %2103 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2102, i32 0, i32 0
  %2104 = load i32, i32* %2103, align 8
  %2105 = icmp ule i32 %2104, 40
  br i1 %2105, label %2106, label %2113

; <label>:2106:                                   ; preds = %2094
  %pgocount175 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 145)
  %2107 = add i64 %pgocount175, 1
  store i64 %2107, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 145)
  %2108 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2102, i32 0, i32 3
  %2109 = load i8*, i8** %2108, align 8
  %2110 = getelementptr i8, i8* %2109, i32 %2104
  %2111 = bitcast i8* %2110 to i32**
  %2112 = add i32 %2104, 8
  store i32 %2112, i32* %2103, align 8
  br label %2119

; <label>:2113:                                   ; preds = %2094
  %pgocount176 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 146)
  %2114 = add i64 %pgocount176, 1
  store i64 %2114, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 146)
  %2115 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2102, i32 0, i32 2
  %2116 = load i8*, i8** %2115, align 8
  %2117 = bitcast i8* %2116 to i32**
  %2118 = getelementptr i8, i8* %2116, i32 8
  store i8* %2118, i8** %2115, align 8
  br label %2119

; <label>:2119:                                   ; preds = %2113, %2106
  %2120 = phi i32** [ %2111, %2106 ], [ %2117, %2113 ]
  %2121 = load i32*, i32** %2120, align 8
  %2122 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %2123 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %2122, i32 0, i32 65
  %2124 = load i32, i32* %2123, align 8
  %2125 = zext i32 %2124 to i64
  call void @_TIFFsetLongArray(i32** %2101, i32* %2121, i64 %2125)
  br label %2141

; <label>:2126:                                   ; preds = %3
  %pgocount177 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 4)
  %2127 = add i64 %pgocount177, 1
  store i64 %2127, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 4)
  %2128 = load %struct.tiff*, %struct.tiff** %5, align 8
  %2129 = getelementptr inbounds %struct.tiff, %struct.tiff* %2128, i32 0, i32 0
  %2130 = load i8*, i8** %2129, align 8
  %2131 = load i32, i32* %6, align 4
  %2132 = icmp ugt i32 %2131, 65535
  %2133 = zext i1 %2132 to i64
  %pgocount178 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 180)
  %2134 = add i64 %pgocount178, %2133
  store i64 %2134, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 180)
  %2135 = select i1 %2132, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.6, i32 0, i32 0)
  %2136 = load %struct.tiff*, %struct.tiff** %5, align 8
  %2137 = load i32, i32* %6, align 4
  %2138 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %2136, i32 %2137)
  %2139 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %2138, i32 0, i32 7
  %2140 = load i8*, i8** %2139, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.13, i32 0, i32 0), i8* %2130, i8* %2135, i8* %2140)
  store i32 0, i32* %9, align 4
  br label %2141

; <label>:2141:                                   ; preds = %2126, %2119, %2070, %2022, %1978, %1952, %1933, %1867, %1820, %1799, %1778, %1721, %1698, %1671, %1624, %1603, %1582, %1519, %1496, %1470, %1449, %1426, %1401, %1378, %1355, %1327, %1303, %1270, %1235, %1202, %1157, %1119, %1083, %1071, %988, %940, %893, %859, %835, %814, %789, %754, %730, %707, %684, %660, %636, %617, %566, %540, %494, %471, %448, %425, %402, %379, %356, %333, %308, %273, %249, %230, %188, %151, %83, %60, %37
  %2142 = load i32, i32* %9, align 4
  %2143 = icmp ne i32 %2142, 0
  br i1 %2143, label %2144, label %2173

; <label>:2144:                                   ; preds = %2141
  %pgocount179 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 0)
  %2145 = add i64 %pgocount179, 1
  store i64 %2145, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 0)
  %2146 = load %struct.tiff*, %struct.tiff** %5, align 8
  %2147 = load i32, i32* %6, align 4
  %2148 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %2146, i32 %2147)
  %2149 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %2148, i32 0, i32 4
  %2150 = load i16, i16* %2149, align 4
  %2151 = zext i16 %2150 to i32
  %2152 = and i32 %2151, 31
  %2153 = zext i32 %2152 to i64
  %2154 = shl i64 1, %2153
  %2155 = load %struct.tiff*, %struct.tiff** %5, align 8
  %2156 = getelementptr inbounds %struct.tiff, %struct.tiff* %2155, i32 0, i32 6
  %2157 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %2156, i32 0, i32 0
  %2158 = load %struct.tiff*, %struct.tiff** %5, align 8
  %2159 = load i32, i32* %6, align 4
  %2160 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %2158, i32 %2159)
  %2161 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %2160, i32 0, i32 4
  %2162 = load i16, i16* %2161, align 4
  %2163 = zext i16 %2162 to i32
  %2164 = sdiv i32 %2163, 32
  %2165 = sext i32 %2164 to i64
  %2166 = getelementptr inbounds [3 x i64], [3 x i64]* %2157, i64 0, i64 %2165
  %2167 = load i64, i64* %2166, align 8
  %2168 = or i64 %2167, %2154
  store i64 %2168, i64* %2166, align 8
  %2169 = load %struct.tiff*, %struct.tiff** %5, align 8
  %2170 = getelementptr inbounds %struct.tiff, %struct.tiff* %2169, i32 0, i32 3
  %2171 = load i32, i32* %2170, align 8
  %2172 = or i32 %2171, 8
  store i32 %2172, i32* %2170, align 8
  br label %2173

; <label>:2173:                                   ; preds = %2144, %2141
  %2174 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %2175 = bitcast %struct.__va_list_tag* %2174 to i8*
  call void @llvm.va_end(i8* %2175)
  %2176 = load i32, i32* %9, align 4
  store i32 %2176, i32* %4, align 4
  br label %2214

; <label>:2177:                                   ; preds = %1302, %1268, %1081, %892, %787, %564, %306
  %2178 = load %struct.tiff*, %struct.tiff** %5, align 8
  %2179 = getelementptr inbounds %struct.tiff, %struct.tiff* %2178, i32 0, i32 0
  %2180 = load i8*, i8** %2179, align 8
  %2181 = load i32, i32* %12, align 4
  %2182 = load %struct.tiff*, %struct.tiff** %5, align 8
  %2183 = load i32, i32* %6, align 4
  %2184 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %2182, i32 %2183)
  %2185 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %2184, i32 0, i32 7
  %2186 = load i8*, i8** %2185, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %2180, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.15, i32 0, i32 0), i32 %2181, i8* %2186)
  %2187 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %2188 = bitcast %struct.__va_list_tag* %2187 to i8*
  call void @llvm.va_end(i8* %2188)
  store i32 0, i32* %4, align 4
  br label %2214

; <label>:2189:                                   ; preds = %1233, %1194, %1149, %594
  %2190 = load %struct.tiff*, %struct.tiff** %5, align 8
  %2191 = getelementptr inbounds %struct.tiff, %struct.tiff* %2190, i32 0, i32 0
  %2192 = load i8*, i8** %2191, align 8
  %2193 = load i32, i32* %10, align 4
  %2194 = load %struct.tiff*, %struct.tiff** %5, align 8
  %2195 = load i32, i32* %6, align 4
  %2196 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %2194, i32 %2195)
  %2197 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %2196, i32 0, i32 7
  %2198 = load i8*, i8** %2197, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %2192, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.16, i32 0, i32 0), i32 %2193, i8* %2198)
  %2199 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %2200 = bitcast %struct.__va_list_tag* %2199 to i8*
  call void @llvm.va_end(i8* %2200)
  store i32 0, i32* %4, align 4
  br label %2214

; <label>:2201:                                   ; preds = %1354
  %pgocount180 = load i64, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 147)
  %2202 = add i64 %pgocount180, 1
  store i64 %2202, i64* getelementptr inbounds ([181 x i64], [181 x i64]* @__profc_tmp1.ll__TIFFVSetField, i64 0, i64 147)
  %2203 = load %struct.tiff*, %struct.tiff** %5, align 8
  %2204 = getelementptr inbounds %struct.tiff, %struct.tiff* %2203, i32 0, i32 0
  %2205 = load i8*, i8** %2204, align 8
  %2206 = load double, double* %13, align 8
  %2207 = load %struct.tiff*, %struct.tiff** %5, align 8
  %2208 = load i32, i32* %6, align 4
  %2209 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %2207, i32 %2208)
  %2210 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %2209, i32 0, i32 7
  %2211 = load i8*, i8** %2210, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %2205, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.17, i32 0, i32 0), double %2206, i8* %2211)
  %2212 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %2213 = bitcast %struct.__va_list_tag* %2212 to i8*
  call void @llvm.va_end(i8* %2213)
  store i32 0, i32* %4, align 4
  br label %2214

; <label>:2214:                                   ; preds = %2201, %2189, %2177, %2173
  %2215 = load i32, i32* %4, align 4
  ret i32 %2215
}

; Function Attrs: nounwind uwtable
define internal i32 @_TIFFVGetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.__va_list_tag*, align 8
  %7 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  store %struct.__va_list_tag* %2, %struct.__va_list_tag** %6, align 8
  %8 = load %struct.tiff*, %struct.tiff** %4, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %8, i32 0, i32 6
  store %struct.TIFFDirectory* %9, %struct.TIFFDirectory** %7, align 8
  %10 = load i32, i32* %5, align 4
  switch i32 %10, label %2016 [
    i32 254, label %13
    i32 256, label %37
    i32 257, label %61
    i32 258, label %85
    i32 259, label %109
    i32 262, label %133
    i32 263, label %157
    i32 266, label %181
    i32 269, label %205
    i32 315, label %229
    i32 306, label %253
    i32 316, label %277
    i32 270, label %301
    i32 271, label %325
    i32 272, label %349
    i32 305, label %373
    i32 274, label %397
    i32 277, label %421
    i32 278, label %445
    i32 280, label %469
    i32 281, label %493
    i32 340, label %517
    i32 341, label %541
    i32 282, label %565
    i32 283, label %589
    i32 284, label %613
    i32 286, label %637
    i32 287, label %661
    i32 285, label %685
    i32 296, label %709
    i32 297, label %733
    i32 321, label %781
    i32 320, label %829
    i32 273, label %._crit_edge
    i32 324, label %900
    i32 279, label %._crit_edge1
    i32 325, label %924
    i32 32995, label %948
    i32 338, label %987
    i32 322, label %1033
    i32 323, label %1057
    i32 32998, label %1081
    i32 32996, label %1105
    i32 339, label %1196
    i32 32997, label %1220
    i32 37439, label %1244
    i32 330, label %1268
    i32 529, label %1314
    i32 531, label %1338
    i32 530, label %1362
    i32 318, label %1410
    i32 319, label %1434
    i32 301, label %1458
    i32 532, label %1542
    i32 332, label %1566
    i32 336, label %1590
    i32 333, label %1638
    i32 334, label %1662
    i32 337, label %1686
    i32 34675, label %1710
    i32 34377, label %1756
    i32 33723, label %1802
    i32 33300, label %1848
    i32 33301, label %1872
    i32 33302, label %1896
    i32 33303, label %1920
    i32 33304, label %1944
    i32 33305, label %1968
    i32 33306, label %1992
  ]

._crit_edge1:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 1)
  br label %924

._crit_edge:                                      ; preds = %3
  %pgocount2 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 0)
  %12 = add i64 %pgocount2, 1
  store i64 %12, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 0)
  br label %900

; <label>:13:                                     ; preds = %3
  %14 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %15 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %14, i32 0, i32 7
  %16 = load i32, i32* %15, align 8
  %17 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %18 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %17, i32 0, i32 0
  %19 = load i32, i32* %18, align 8
  %20 = icmp ule i32 %19, 40
  br i1 %20, label %21, label %28

; <label>:21:                                     ; preds = %13
  %pgocount3 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 11)
  %22 = add i64 %pgocount3, 1
  store i64 %22, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 11)
  %23 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %17, i32 0, i32 3
  %24 = load i8*, i8** %23, align 8
  %25 = getelementptr i8, i8* %24, i32 %19
  %26 = bitcast i8* %25 to i32**
  %27 = add i32 %19, 8
  store i32 %27, i32* %18, align 8
  br label %34

; <label>:28:                                     ; preds = %13
  %pgocount4 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 12)
  %29 = add i64 %pgocount4, 1
  store i64 %29, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 12)
  %30 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %17, i32 0, i32 2
  %31 = load i8*, i8** %30, align 8
  %32 = bitcast i8* %31 to i32**
  %33 = getelementptr i8, i8* %31, i32 8
  store i8* %33, i8** %30, align 8
  br label %34

; <label>:34:                                     ; preds = %28, %21
  %35 = phi i32** [ %26, %21 ], [ %32, %28 ]
  %36 = load i32*, i32** %35, align 8
  store i32 %16, i32* %36, align 4
  br label %2031

; <label>:37:                                     ; preds = %3
  %38 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %39 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %38, i32 0, i32 1
  %40 = load i32, i32* %39, align 8
  %41 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %42 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %41, i32 0, i32 0
  %43 = load i32, i32* %42, align 8
  %44 = icmp ule i32 %43, 40
  br i1 %44, label %45, label %52

; <label>:45:                                     ; preds = %37
  %pgocount5 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 13)
  %46 = add i64 %pgocount5, 1
  store i64 %46, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 13)
  %47 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %41, i32 0, i32 3
  %48 = load i8*, i8** %47, align 8
  %49 = getelementptr i8, i8* %48, i32 %43
  %50 = bitcast i8* %49 to i32**
  %51 = add i32 %43, 8
  store i32 %51, i32* %42, align 8
  br label %58

; <label>:52:                                     ; preds = %37
  %pgocount6 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 14)
  %53 = add i64 %pgocount6, 1
  store i64 %53, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 14)
  %54 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %41, i32 0, i32 2
  %55 = load i8*, i8** %54, align 8
  %56 = bitcast i8* %55 to i32**
  %57 = getelementptr i8, i8* %55, i32 8
  store i8* %57, i8** %54, align 8
  br label %58

; <label>:58:                                     ; preds = %52, %45
  %59 = phi i32** [ %50, %45 ], [ %56, %52 ]
  %60 = load i32*, i32** %59, align 8
  store i32 %40, i32* %60, align 4
  br label %2031

; <label>:61:                                     ; preds = %3
  %62 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %63 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %62, i32 0, i32 2
  %64 = load i32, i32* %63, align 4
  %65 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %66 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %65, i32 0, i32 0
  %67 = load i32, i32* %66, align 8
  %68 = icmp ule i32 %67, 40
  br i1 %68, label %69, label %76

; <label>:69:                                     ; preds = %61
  %pgocount7 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 15)
  %70 = add i64 %pgocount7, 1
  store i64 %70, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 15)
  %71 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %65, i32 0, i32 3
  %72 = load i8*, i8** %71, align 8
  %73 = getelementptr i8, i8* %72, i32 %67
  %74 = bitcast i8* %73 to i32**
  %75 = add i32 %67, 8
  store i32 %75, i32* %66, align 8
  br label %82

; <label>:76:                                     ; preds = %61
  %pgocount8 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 16)
  %77 = add i64 %pgocount8, 1
  store i64 %77, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 16)
  %78 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %65, i32 0, i32 2
  %79 = load i8*, i8** %78, align 8
  %80 = bitcast i8* %79 to i32**
  %81 = getelementptr i8, i8* %79, i32 8
  store i8* %81, i8** %78, align 8
  br label %82

; <label>:82:                                     ; preds = %76, %69
  %83 = phi i32** [ %74, %69 ], [ %80, %76 ]
  %84 = load i32*, i32** %83, align 8
  store i32 %64, i32* %84, align 4
  br label %2031

; <label>:85:                                     ; preds = %3
  %86 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %87 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %86, i32 0, i32 8
  %88 = load i16, i16* %87, align 4
  %89 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %90 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %89, i32 0, i32 0
  %91 = load i32, i32* %90, align 8
  %92 = icmp ule i32 %91, 40
  br i1 %92, label %93, label %100

; <label>:93:                                     ; preds = %85
  %pgocount9 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 17)
  %94 = add i64 %pgocount9, 1
  store i64 %94, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 17)
  %95 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %89, i32 0, i32 3
  %96 = load i8*, i8** %95, align 8
  %97 = getelementptr i8, i8* %96, i32 %91
  %98 = bitcast i8* %97 to i16**
  %99 = add i32 %91, 8
  store i32 %99, i32* %90, align 8
  br label %106

; <label>:100:                                    ; preds = %85
  %pgocount10 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 18)
  %101 = add i64 %pgocount10, 1
  store i64 %101, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 18)
  %102 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %89, i32 0, i32 2
  %103 = load i8*, i8** %102, align 8
  %104 = bitcast i8* %103 to i16**
  %105 = getelementptr i8, i8* %103, i32 8
  store i8* %105, i8** %102, align 8
  br label %106

; <label>:106:                                    ; preds = %100, %93
  %107 = phi i16** [ %98, %93 ], [ %104, %100 ]
  %108 = load i16*, i16** %107, align 8
  store i16 %88, i16* %108, align 2
  br label %2031

; <label>:109:                                    ; preds = %3
  %110 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %111 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %110, i32 0, i32 10
  %112 = load i16, i16* %111, align 8
  %113 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %114 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %113, i32 0, i32 0
  %115 = load i32, i32* %114, align 8
  %116 = icmp ule i32 %115, 40
  br i1 %116, label %117, label %124

; <label>:117:                                    ; preds = %109
  %pgocount11 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 19)
  %118 = add i64 %pgocount11, 1
  store i64 %118, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 19)
  %119 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %113, i32 0, i32 3
  %120 = load i8*, i8** %119, align 8
  %121 = getelementptr i8, i8* %120, i32 %115
  %122 = bitcast i8* %121 to i16**
  %123 = add i32 %115, 8
  store i32 %123, i32* %114, align 8
  br label %130

; <label>:124:                                    ; preds = %109
  %pgocount12 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 20)
  %125 = add i64 %pgocount12, 1
  store i64 %125, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 20)
  %126 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %113, i32 0, i32 2
  %127 = load i8*, i8** %126, align 8
  %128 = bitcast i8* %127 to i16**
  %129 = getelementptr i8, i8* %127, i32 8
  store i8* %129, i8** %126, align 8
  br label %130

; <label>:130:                                    ; preds = %124, %117
  %131 = phi i16** [ %122, %117 ], [ %128, %124 ]
  %132 = load i16*, i16** %131, align 8
  store i16 %112, i16* %132, align 2
  br label %2031

; <label>:133:                                    ; preds = %3
  %134 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %135 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %134, i32 0, i32 11
  %136 = load i16, i16* %135, align 2
  %137 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %138 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %137, i32 0, i32 0
  %139 = load i32, i32* %138, align 8
  %140 = icmp ule i32 %139, 40
  br i1 %140, label %141, label %148

; <label>:141:                                    ; preds = %133
  %pgocount13 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 21)
  %142 = add i64 %pgocount13, 1
  store i64 %142, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 21)
  %143 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %137, i32 0, i32 3
  %144 = load i8*, i8** %143, align 8
  %145 = getelementptr i8, i8* %144, i32 %139
  %146 = bitcast i8* %145 to i16**
  %147 = add i32 %139, 8
  store i32 %147, i32* %138, align 8
  br label %154

; <label>:148:                                    ; preds = %133
  %pgocount14 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 22)
  %149 = add i64 %pgocount14, 1
  store i64 %149, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 22)
  %150 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %137, i32 0, i32 2
  %151 = load i8*, i8** %150, align 8
  %152 = bitcast i8* %151 to i16**
  %153 = getelementptr i8, i8* %151, i32 8
  store i8* %153, i8** %150, align 8
  br label %154

; <label>:154:                                    ; preds = %148, %141
  %155 = phi i16** [ %146, %141 ], [ %152, %148 ]
  %156 = load i16*, i16** %155, align 8
  store i16 %136, i16* %156, align 2
  br label %2031

; <label>:157:                                    ; preds = %3
  %158 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %159 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %158, i32 0, i32 12
  %160 = load i16, i16* %159, align 4
  %161 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %162 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %161, i32 0, i32 0
  %163 = load i32, i32* %162, align 8
  %164 = icmp ule i32 %163, 40
  br i1 %164, label %165, label %172

; <label>:165:                                    ; preds = %157
  %pgocount15 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 23)
  %166 = add i64 %pgocount15, 1
  store i64 %166, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 23)
  %167 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %161, i32 0, i32 3
  %168 = load i8*, i8** %167, align 8
  %169 = getelementptr i8, i8* %168, i32 %163
  %170 = bitcast i8* %169 to i16**
  %171 = add i32 %163, 8
  store i32 %171, i32* %162, align 8
  br label %178

; <label>:172:                                    ; preds = %157
  %pgocount16 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 24)
  %173 = add i64 %pgocount16, 1
  store i64 %173, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 24)
  %174 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %161, i32 0, i32 2
  %175 = load i8*, i8** %174, align 8
  %176 = bitcast i8* %175 to i16**
  %177 = getelementptr i8, i8* %175, i32 8
  store i8* %177, i8** %174, align 8
  br label %178

; <label>:178:                                    ; preds = %172, %165
  %179 = phi i16** [ %170, %165 ], [ %176, %172 ]
  %180 = load i16*, i16** %179, align 8
  store i16 %160, i16* %180, align 2
  br label %2031

; <label>:181:                                    ; preds = %3
  %182 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %183 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %182, i32 0, i32 13
  %184 = load i16, i16* %183, align 2
  %185 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %186 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %185, i32 0, i32 0
  %187 = load i32, i32* %186, align 8
  %188 = icmp ule i32 %187, 40
  br i1 %188, label %189, label %196

; <label>:189:                                    ; preds = %181
  %pgocount17 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 25)
  %190 = add i64 %pgocount17, 1
  store i64 %190, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 25)
  %191 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %185, i32 0, i32 3
  %192 = load i8*, i8** %191, align 8
  %193 = getelementptr i8, i8* %192, i32 %187
  %194 = bitcast i8* %193 to i16**
  %195 = add i32 %187, 8
  store i32 %195, i32* %186, align 8
  br label %202

; <label>:196:                                    ; preds = %181
  %pgocount18 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 26)
  %197 = add i64 %pgocount18, 1
  store i64 %197, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 26)
  %198 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %185, i32 0, i32 2
  %199 = load i8*, i8** %198, align 8
  %200 = bitcast i8* %199 to i16**
  %201 = getelementptr i8, i8* %199, i32 8
  store i8* %201, i8** %198, align 8
  br label %202

; <label>:202:                                    ; preds = %196, %189
  %203 = phi i16** [ %194, %189 ], [ %200, %196 ]
  %204 = load i16*, i16** %203, align 8
  store i16 %184, i16* %204, align 2
  br label %2031

; <label>:205:                                    ; preds = %3
  %206 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %207 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %206, i32 0, i32 33
  %208 = load i8*, i8** %207, align 8
  %209 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %210 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %209, i32 0, i32 0
  %211 = load i32, i32* %210, align 8
  %212 = icmp ule i32 %211, 40
  br i1 %212, label %213, label %220

; <label>:213:                                    ; preds = %205
  %pgocount19 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 27)
  %214 = add i64 %pgocount19, 1
  store i64 %214, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 27)
  %215 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %209, i32 0, i32 3
  %216 = load i8*, i8** %215, align 8
  %217 = getelementptr i8, i8* %216, i32 %211
  %218 = bitcast i8* %217 to i8***
  %219 = add i32 %211, 8
  store i32 %219, i32* %210, align 8
  br label %226

; <label>:220:                                    ; preds = %205
  %pgocount20 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 28)
  %221 = add i64 %pgocount20, 1
  store i64 %221, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 28)
  %222 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %209, i32 0, i32 2
  %223 = load i8*, i8** %222, align 8
  %224 = bitcast i8* %223 to i8***
  %225 = getelementptr i8, i8* %223, i32 8
  store i8* %225, i8** %222, align 8
  br label %226

; <label>:226:                                    ; preds = %220, %213
  %227 = phi i8*** [ %218, %213 ], [ %224, %220 ]
  %228 = load i8**, i8*** %227, align 8
  store i8* %208, i8** %228, align 8
  br label %2031

; <label>:229:                                    ; preds = %3
  %230 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %231 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %230, i32 0, i32 34
  %232 = load i8*, i8** %231, align 8
  %233 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %234 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %233, i32 0, i32 0
  %235 = load i32, i32* %234, align 8
  %236 = icmp ule i32 %235, 40
  br i1 %236, label %237, label %244

; <label>:237:                                    ; preds = %229
  %pgocount21 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 29)
  %238 = add i64 %pgocount21, 1
  store i64 %238, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 29)
  %239 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %233, i32 0, i32 3
  %240 = load i8*, i8** %239, align 8
  %241 = getelementptr i8, i8* %240, i32 %235
  %242 = bitcast i8* %241 to i8***
  %243 = add i32 %235, 8
  store i32 %243, i32* %234, align 8
  br label %250

; <label>:244:                                    ; preds = %229
  %pgocount22 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 30)
  %245 = add i64 %pgocount22, 1
  store i64 %245, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 30)
  %246 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %233, i32 0, i32 2
  %247 = load i8*, i8** %246, align 8
  %248 = bitcast i8* %247 to i8***
  %249 = getelementptr i8, i8* %247, i32 8
  store i8* %249, i8** %246, align 8
  br label %250

; <label>:250:                                    ; preds = %244, %237
  %251 = phi i8*** [ %242, %237 ], [ %248, %244 ]
  %252 = load i8**, i8*** %251, align 8
  store i8* %232, i8** %252, align 8
  br label %2031

; <label>:253:                                    ; preds = %3
  %254 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %255 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %254, i32 0, i32 35
  %256 = load i8*, i8** %255, align 8
  %257 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %258 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %257, i32 0, i32 0
  %259 = load i32, i32* %258, align 8
  %260 = icmp ule i32 %259, 40
  br i1 %260, label %261, label %268

; <label>:261:                                    ; preds = %253
  %pgocount23 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 31)
  %262 = add i64 %pgocount23, 1
  store i64 %262, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 31)
  %263 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %257, i32 0, i32 3
  %264 = load i8*, i8** %263, align 8
  %265 = getelementptr i8, i8* %264, i32 %259
  %266 = bitcast i8* %265 to i8***
  %267 = add i32 %259, 8
  store i32 %267, i32* %258, align 8
  br label %274

; <label>:268:                                    ; preds = %253
  %pgocount24 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 32)
  %269 = add i64 %pgocount24, 1
  store i64 %269, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 32)
  %270 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %257, i32 0, i32 2
  %271 = load i8*, i8** %270, align 8
  %272 = bitcast i8* %271 to i8***
  %273 = getelementptr i8, i8* %271, i32 8
  store i8* %273, i8** %270, align 8
  br label %274

; <label>:274:                                    ; preds = %268, %261
  %275 = phi i8*** [ %266, %261 ], [ %272, %268 ]
  %276 = load i8**, i8*** %275, align 8
  store i8* %256, i8** %276, align 8
  br label %2031

; <label>:277:                                    ; preds = %3
  %278 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %279 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %278, i32 0, i32 36
  %280 = load i8*, i8** %279, align 8
  %281 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %282 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %281, i32 0, i32 0
  %283 = load i32, i32* %282, align 8
  %284 = icmp ule i32 %283, 40
  br i1 %284, label %285, label %292

; <label>:285:                                    ; preds = %277
  %pgocount25 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 33)
  %286 = add i64 %pgocount25, 1
  store i64 %286, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 33)
  %287 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %281, i32 0, i32 3
  %288 = load i8*, i8** %287, align 8
  %289 = getelementptr i8, i8* %288, i32 %283
  %290 = bitcast i8* %289 to i8***
  %291 = add i32 %283, 8
  store i32 %291, i32* %282, align 8
  br label %298

; <label>:292:                                    ; preds = %277
  %pgocount26 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 34)
  %293 = add i64 %pgocount26, 1
  store i64 %293, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 34)
  %294 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %281, i32 0, i32 2
  %295 = load i8*, i8** %294, align 8
  %296 = bitcast i8* %295 to i8***
  %297 = getelementptr i8, i8* %295, i32 8
  store i8* %297, i8** %294, align 8
  br label %298

; <label>:298:                                    ; preds = %292, %285
  %299 = phi i8*** [ %290, %285 ], [ %296, %292 ]
  %300 = load i8**, i8*** %299, align 8
  store i8* %280, i8** %300, align 8
  br label %2031

; <label>:301:                                    ; preds = %3
  %302 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %303 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %302, i32 0, i32 37
  %304 = load i8*, i8** %303, align 8
  %305 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %306 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %305, i32 0, i32 0
  %307 = load i32, i32* %306, align 8
  %308 = icmp ule i32 %307, 40
  br i1 %308, label %309, label %316

; <label>:309:                                    ; preds = %301
  %pgocount27 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 35)
  %310 = add i64 %pgocount27, 1
  store i64 %310, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 35)
  %311 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %305, i32 0, i32 3
  %312 = load i8*, i8** %311, align 8
  %313 = getelementptr i8, i8* %312, i32 %307
  %314 = bitcast i8* %313 to i8***
  %315 = add i32 %307, 8
  store i32 %315, i32* %306, align 8
  br label %322

; <label>:316:                                    ; preds = %301
  %pgocount28 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 36)
  %317 = add i64 %pgocount28, 1
  store i64 %317, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 36)
  %318 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %305, i32 0, i32 2
  %319 = load i8*, i8** %318, align 8
  %320 = bitcast i8* %319 to i8***
  %321 = getelementptr i8, i8* %319, i32 8
  store i8* %321, i8** %318, align 8
  br label %322

; <label>:322:                                    ; preds = %316, %309
  %323 = phi i8*** [ %314, %309 ], [ %320, %316 ]
  %324 = load i8**, i8*** %323, align 8
  store i8* %304, i8** %324, align 8
  br label %2031

; <label>:325:                                    ; preds = %3
  %326 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %327 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %326, i32 0, i32 38
  %328 = load i8*, i8** %327, align 8
  %329 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %330 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %329, i32 0, i32 0
  %331 = load i32, i32* %330, align 8
  %332 = icmp ule i32 %331, 40
  br i1 %332, label %333, label %340

; <label>:333:                                    ; preds = %325
  %pgocount29 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 37)
  %334 = add i64 %pgocount29, 1
  store i64 %334, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 37)
  %335 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %329, i32 0, i32 3
  %336 = load i8*, i8** %335, align 8
  %337 = getelementptr i8, i8* %336, i32 %331
  %338 = bitcast i8* %337 to i8***
  %339 = add i32 %331, 8
  store i32 %339, i32* %330, align 8
  br label %346

; <label>:340:                                    ; preds = %325
  %pgocount30 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 38)
  %341 = add i64 %pgocount30, 1
  store i64 %341, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 38)
  %342 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %329, i32 0, i32 2
  %343 = load i8*, i8** %342, align 8
  %344 = bitcast i8* %343 to i8***
  %345 = getelementptr i8, i8* %343, i32 8
  store i8* %345, i8** %342, align 8
  br label %346

; <label>:346:                                    ; preds = %340, %333
  %347 = phi i8*** [ %338, %333 ], [ %344, %340 ]
  %348 = load i8**, i8*** %347, align 8
  store i8* %328, i8** %348, align 8
  br label %2031

; <label>:349:                                    ; preds = %3
  %350 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %351 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %350, i32 0, i32 39
  %352 = load i8*, i8** %351, align 8
  %353 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %354 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %353, i32 0, i32 0
  %355 = load i32, i32* %354, align 8
  %356 = icmp ule i32 %355, 40
  br i1 %356, label %357, label %364

; <label>:357:                                    ; preds = %349
  %pgocount31 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 39)
  %358 = add i64 %pgocount31, 1
  store i64 %358, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 39)
  %359 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %353, i32 0, i32 3
  %360 = load i8*, i8** %359, align 8
  %361 = getelementptr i8, i8* %360, i32 %355
  %362 = bitcast i8* %361 to i8***
  %363 = add i32 %355, 8
  store i32 %363, i32* %354, align 8
  br label %370

; <label>:364:                                    ; preds = %349
  %pgocount32 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 40)
  %365 = add i64 %pgocount32, 1
  store i64 %365, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 40)
  %366 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %353, i32 0, i32 2
  %367 = load i8*, i8** %366, align 8
  %368 = bitcast i8* %367 to i8***
  %369 = getelementptr i8, i8* %367, i32 8
  store i8* %369, i8** %366, align 8
  br label %370

; <label>:370:                                    ; preds = %364, %357
  %371 = phi i8*** [ %362, %357 ], [ %368, %364 ]
  %372 = load i8**, i8*** %371, align 8
  store i8* %352, i8** %372, align 8
  br label %2031

; <label>:373:                                    ; preds = %3
  %374 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %375 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %374, i32 0, i32 40
  %376 = load i8*, i8** %375, align 8
  %377 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %378 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %377, i32 0, i32 0
  %379 = load i32, i32* %378, align 8
  %380 = icmp ule i32 %379, 40
  br i1 %380, label %381, label %388

; <label>:381:                                    ; preds = %373
  %pgocount33 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 41)
  %382 = add i64 %pgocount33, 1
  store i64 %382, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 41)
  %383 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %377, i32 0, i32 3
  %384 = load i8*, i8** %383, align 8
  %385 = getelementptr i8, i8* %384, i32 %379
  %386 = bitcast i8* %385 to i8***
  %387 = add i32 %379, 8
  store i32 %387, i32* %378, align 8
  br label %394

; <label>:388:                                    ; preds = %373
  %pgocount34 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 42)
  %389 = add i64 %pgocount34, 1
  store i64 %389, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 42)
  %390 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %377, i32 0, i32 2
  %391 = load i8*, i8** %390, align 8
  %392 = bitcast i8* %391 to i8***
  %393 = getelementptr i8, i8* %391, i32 8
  store i8* %393, i8** %390, align 8
  br label %394

; <label>:394:                                    ; preds = %388, %381
  %395 = phi i8*** [ %386, %381 ], [ %392, %388 ]
  %396 = load i8**, i8*** %395, align 8
  store i8* %376, i8** %396, align 8
  br label %2031

; <label>:397:                                    ; preds = %3
  %398 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %399 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %398, i32 0, i32 14
  %400 = load i16, i16* %399, align 8
  %401 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %402 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %401, i32 0, i32 0
  %403 = load i32, i32* %402, align 8
  %404 = icmp ule i32 %403, 40
  br i1 %404, label %405, label %412

; <label>:405:                                    ; preds = %397
  %pgocount35 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 43)
  %406 = add i64 %pgocount35, 1
  store i64 %406, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 43)
  %407 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %401, i32 0, i32 3
  %408 = load i8*, i8** %407, align 8
  %409 = getelementptr i8, i8* %408, i32 %403
  %410 = bitcast i8* %409 to i16**
  %411 = add i32 %403, 8
  store i32 %411, i32* %402, align 8
  br label %418

; <label>:412:                                    ; preds = %397
  %pgocount36 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 44)
  %413 = add i64 %pgocount36, 1
  store i64 %413, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 44)
  %414 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %401, i32 0, i32 2
  %415 = load i8*, i8** %414, align 8
  %416 = bitcast i8* %415 to i16**
  %417 = getelementptr i8, i8* %415, i32 8
  store i8* %417, i8** %414, align 8
  br label %418

; <label>:418:                                    ; preds = %412, %405
  %419 = phi i16** [ %410, %405 ], [ %416, %412 ]
  %420 = load i16*, i16** %419, align 8
  store i16 %400, i16* %420, align 2
  br label %2031

; <label>:421:                                    ; preds = %3
  %422 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %423 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %422, i32 0, i32 15
  %424 = load i16, i16* %423, align 2
  %425 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %426 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %425, i32 0, i32 0
  %427 = load i32, i32* %426, align 8
  %428 = icmp ule i32 %427, 40
  br i1 %428, label %429, label %436

; <label>:429:                                    ; preds = %421
  %pgocount37 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 45)
  %430 = add i64 %pgocount37, 1
  store i64 %430, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 45)
  %431 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %425, i32 0, i32 3
  %432 = load i8*, i8** %431, align 8
  %433 = getelementptr i8, i8* %432, i32 %427
  %434 = bitcast i8* %433 to i16**
  %435 = add i32 %427, 8
  store i32 %435, i32* %426, align 8
  br label %442

; <label>:436:                                    ; preds = %421
  %pgocount38 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 46)
  %437 = add i64 %pgocount38, 1
  store i64 %437, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 46)
  %438 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %425, i32 0, i32 2
  %439 = load i8*, i8** %438, align 8
  %440 = bitcast i8* %439 to i16**
  %441 = getelementptr i8, i8* %439, i32 8
  store i8* %441, i8** %438, align 8
  br label %442

; <label>:442:                                    ; preds = %436, %429
  %443 = phi i16** [ %434, %429 ], [ %440, %436 ]
  %444 = load i16*, i16** %443, align 8
  store i16 %424, i16* %444, align 2
  br label %2031

; <label>:445:                                    ; preds = %3
  %446 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %447 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %446, i32 0, i32 16
  %448 = load i32, i32* %447, align 4
  %449 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %450 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %449, i32 0, i32 0
  %451 = load i32, i32* %450, align 8
  %452 = icmp ule i32 %451, 40
  br i1 %452, label %453, label %460

; <label>:453:                                    ; preds = %445
  %pgocount39 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 47)
  %454 = add i64 %pgocount39, 1
  store i64 %454, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 47)
  %455 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %449, i32 0, i32 3
  %456 = load i8*, i8** %455, align 8
  %457 = getelementptr i8, i8* %456, i32 %451
  %458 = bitcast i8* %457 to i32**
  %459 = add i32 %451, 8
  store i32 %459, i32* %450, align 8
  br label %466

; <label>:460:                                    ; preds = %445
  %pgocount40 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 48)
  %461 = add i64 %pgocount40, 1
  store i64 %461, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 48)
  %462 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %449, i32 0, i32 2
  %463 = load i8*, i8** %462, align 8
  %464 = bitcast i8* %463 to i32**
  %465 = getelementptr i8, i8* %463, i32 8
  store i8* %465, i8** %462, align 8
  br label %466

; <label>:466:                                    ; preds = %460, %453
  %467 = phi i32** [ %458, %453 ], [ %464, %460 ]
  %468 = load i32*, i32** %467, align 8
  store i32 %448, i32* %468, align 4
  br label %2031

; <label>:469:                                    ; preds = %3
  %470 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %471 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %470, i32 0, i32 17
  %472 = load i16, i16* %471, align 8
  %473 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %474 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %473, i32 0, i32 0
  %475 = load i32, i32* %474, align 8
  %476 = icmp ule i32 %475, 40
  br i1 %476, label %477, label %484

; <label>:477:                                    ; preds = %469
  %pgocount41 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 49)
  %478 = add i64 %pgocount41, 1
  store i64 %478, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 49)
  %479 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %473, i32 0, i32 3
  %480 = load i8*, i8** %479, align 8
  %481 = getelementptr i8, i8* %480, i32 %475
  %482 = bitcast i8* %481 to i16**
  %483 = add i32 %475, 8
  store i32 %483, i32* %474, align 8
  br label %490

; <label>:484:                                    ; preds = %469
  %pgocount42 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 50)
  %485 = add i64 %pgocount42, 1
  store i64 %485, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 50)
  %486 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %473, i32 0, i32 2
  %487 = load i8*, i8** %486, align 8
  %488 = bitcast i8* %487 to i16**
  %489 = getelementptr i8, i8* %487, i32 8
  store i8* %489, i8** %486, align 8
  br label %490

; <label>:490:                                    ; preds = %484, %477
  %491 = phi i16** [ %482, %477 ], [ %488, %484 ]
  %492 = load i16*, i16** %491, align 8
  store i16 %472, i16* %492, align 2
  br label %2031

; <label>:493:                                    ; preds = %3
  %494 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %495 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %494, i32 0, i32 18
  %496 = load i16, i16* %495, align 2
  %497 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %498 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %497, i32 0, i32 0
  %499 = load i32, i32* %498, align 8
  %500 = icmp ule i32 %499, 40
  br i1 %500, label %501, label %508

; <label>:501:                                    ; preds = %493
  %pgocount43 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 51)
  %502 = add i64 %pgocount43, 1
  store i64 %502, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 51)
  %503 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %497, i32 0, i32 3
  %504 = load i8*, i8** %503, align 8
  %505 = getelementptr i8, i8* %504, i32 %499
  %506 = bitcast i8* %505 to i16**
  %507 = add i32 %499, 8
  store i32 %507, i32* %498, align 8
  br label %514

; <label>:508:                                    ; preds = %493
  %pgocount44 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 52)
  %509 = add i64 %pgocount44, 1
  store i64 %509, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 52)
  %510 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %497, i32 0, i32 2
  %511 = load i8*, i8** %510, align 8
  %512 = bitcast i8* %511 to i16**
  %513 = getelementptr i8, i8* %511, i32 8
  store i8* %513, i8** %510, align 8
  br label %514

; <label>:514:                                    ; preds = %508, %501
  %515 = phi i16** [ %506, %501 ], [ %512, %508 ]
  %516 = load i16*, i16** %515, align 8
  store i16 %496, i16* %516, align 2
  br label %2031

; <label>:517:                                    ; preds = %3
  %518 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %519 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %518, i32 0, i32 19
  %520 = load double, double* %519, align 8
  %521 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %522 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %521, i32 0, i32 0
  %523 = load i32, i32* %522, align 8
  %524 = icmp ule i32 %523, 40
  br i1 %524, label %525, label %532

; <label>:525:                                    ; preds = %517
  %pgocount45 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 53)
  %526 = add i64 %pgocount45, 1
  store i64 %526, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 53)
  %527 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %521, i32 0, i32 3
  %528 = load i8*, i8** %527, align 8
  %529 = getelementptr i8, i8* %528, i32 %523
  %530 = bitcast i8* %529 to double**
  %531 = add i32 %523, 8
  store i32 %531, i32* %522, align 8
  br label %538

; <label>:532:                                    ; preds = %517
  %pgocount46 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 54)
  %533 = add i64 %pgocount46, 1
  store i64 %533, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 54)
  %534 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %521, i32 0, i32 2
  %535 = load i8*, i8** %534, align 8
  %536 = bitcast i8* %535 to double**
  %537 = getelementptr i8, i8* %535, i32 8
  store i8* %537, i8** %534, align 8
  br label %538

; <label>:538:                                    ; preds = %532, %525
  %539 = phi double** [ %530, %525 ], [ %536, %532 ]
  %540 = load double*, double** %539, align 8
  store double %520, double* %540, align 8
  br label %2031

; <label>:541:                                    ; preds = %3
  %542 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %543 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %542, i32 0, i32 20
  %544 = load double, double* %543, align 8
  %545 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %546 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %545, i32 0, i32 0
  %547 = load i32, i32* %546, align 8
  %548 = icmp ule i32 %547, 40
  br i1 %548, label %549, label %556

; <label>:549:                                    ; preds = %541
  %pgocount47 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 55)
  %550 = add i64 %pgocount47, 1
  store i64 %550, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 55)
  %551 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %545, i32 0, i32 3
  %552 = load i8*, i8** %551, align 8
  %553 = getelementptr i8, i8* %552, i32 %547
  %554 = bitcast i8* %553 to double**
  %555 = add i32 %547, 8
  store i32 %555, i32* %546, align 8
  br label %562

; <label>:556:                                    ; preds = %541
  %pgocount48 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 56)
  %557 = add i64 %pgocount48, 1
  store i64 %557, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 56)
  %558 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %545, i32 0, i32 2
  %559 = load i8*, i8** %558, align 8
  %560 = bitcast i8* %559 to double**
  %561 = getelementptr i8, i8* %559, i32 8
  store i8* %561, i8** %558, align 8
  br label %562

; <label>:562:                                    ; preds = %556, %549
  %563 = phi double** [ %554, %549 ], [ %560, %556 ]
  %564 = load double*, double** %563, align 8
  store double %544, double* %564, align 8
  br label %2031

; <label>:565:                                    ; preds = %3
  %566 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %567 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %566, i32 0, i32 21
  %568 = load float, float* %567, align 8
  %569 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %570 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %569, i32 0, i32 0
  %571 = load i32, i32* %570, align 8
  %572 = icmp ule i32 %571, 40
  br i1 %572, label %573, label %580

; <label>:573:                                    ; preds = %565
  %pgocount49 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 57)
  %574 = add i64 %pgocount49, 1
  store i64 %574, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 57)
  %575 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %569, i32 0, i32 3
  %576 = load i8*, i8** %575, align 8
  %577 = getelementptr i8, i8* %576, i32 %571
  %578 = bitcast i8* %577 to float**
  %579 = add i32 %571, 8
  store i32 %579, i32* %570, align 8
  br label %586

; <label>:580:                                    ; preds = %565
  %pgocount50 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 58)
  %581 = add i64 %pgocount50, 1
  store i64 %581, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 58)
  %582 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %569, i32 0, i32 2
  %583 = load i8*, i8** %582, align 8
  %584 = bitcast i8* %583 to float**
  %585 = getelementptr i8, i8* %583, i32 8
  store i8* %585, i8** %582, align 8
  br label %586

; <label>:586:                                    ; preds = %580, %573
  %587 = phi float** [ %578, %573 ], [ %584, %580 ]
  %588 = load float*, float** %587, align 8
  store float %568, float* %588, align 4
  br label %2031

; <label>:589:                                    ; preds = %3
  %590 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %591 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %590, i32 0, i32 22
  %592 = load float, float* %591, align 4
  %593 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %594 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %593, i32 0, i32 0
  %595 = load i32, i32* %594, align 8
  %596 = icmp ule i32 %595, 40
  br i1 %596, label %597, label %604

; <label>:597:                                    ; preds = %589
  %pgocount51 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 59)
  %598 = add i64 %pgocount51, 1
  store i64 %598, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 59)
  %599 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %593, i32 0, i32 3
  %600 = load i8*, i8** %599, align 8
  %601 = getelementptr i8, i8* %600, i32 %595
  %602 = bitcast i8* %601 to float**
  %603 = add i32 %595, 8
  store i32 %603, i32* %594, align 8
  br label %610

; <label>:604:                                    ; preds = %589
  %pgocount52 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 60)
  %605 = add i64 %pgocount52, 1
  store i64 %605, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 60)
  %606 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %593, i32 0, i32 2
  %607 = load i8*, i8** %606, align 8
  %608 = bitcast i8* %607 to float**
  %609 = getelementptr i8, i8* %607, i32 8
  store i8* %609, i8** %606, align 8
  br label %610

; <label>:610:                                    ; preds = %604, %597
  %611 = phi float** [ %602, %597 ], [ %608, %604 ]
  %612 = load float*, float** %611, align 8
  store float %592, float* %612, align 4
  br label %2031

; <label>:613:                                    ; preds = %3
  %614 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %615 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %614, i32 0, i32 24
  %616 = load i16, i16* %615, align 2
  %617 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %618 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %617, i32 0, i32 0
  %619 = load i32, i32* %618, align 8
  %620 = icmp ule i32 %619, 40
  br i1 %620, label %621, label %628

; <label>:621:                                    ; preds = %613
  %pgocount53 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 61)
  %622 = add i64 %pgocount53, 1
  store i64 %622, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 61)
  %623 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %617, i32 0, i32 3
  %624 = load i8*, i8** %623, align 8
  %625 = getelementptr i8, i8* %624, i32 %619
  %626 = bitcast i8* %625 to i16**
  %627 = add i32 %619, 8
  store i32 %627, i32* %618, align 8
  br label %634

; <label>:628:                                    ; preds = %613
  %pgocount54 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 62)
  %629 = add i64 %pgocount54, 1
  store i64 %629, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 62)
  %630 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %617, i32 0, i32 2
  %631 = load i8*, i8** %630, align 8
  %632 = bitcast i8* %631 to i16**
  %633 = getelementptr i8, i8* %631, i32 8
  store i8* %633, i8** %630, align 8
  br label %634

; <label>:634:                                    ; preds = %628, %621
  %635 = phi i16** [ %626, %621 ], [ %632, %628 ]
  %636 = load i16*, i16** %635, align 8
  store i16 %616, i16* %636, align 2
  br label %2031

; <label>:637:                                    ; preds = %3
  %638 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %639 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %638, i32 0, i32 25
  %640 = load float, float* %639, align 4
  %641 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %642 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %641, i32 0, i32 0
  %643 = load i32, i32* %642, align 8
  %644 = icmp ule i32 %643, 40
  br i1 %644, label %645, label %652

; <label>:645:                                    ; preds = %637
  %pgocount55 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 63)
  %646 = add i64 %pgocount55, 1
  store i64 %646, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 63)
  %647 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %641, i32 0, i32 3
  %648 = load i8*, i8** %647, align 8
  %649 = getelementptr i8, i8* %648, i32 %643
  %650 = bitcast i8* %649 to float**
  %651 = add i32 %643, 8
  store i32 %651, i32* %642, align 8
  br label %658

; <label>:652:                                    ; preds = %637
  %pgocount56 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 64)
  %653 = add i64 %pgocount56, 1
  store i64 %653, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 64)
  %654 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %641, i32 0, i32 2
  %655 = load i8*, i8** %654, align 8
  %656 = bitcast i8* %655 to float**
  %657 = getelementptr i8, i8* %655, i32 8
  store i8* %657, i8** %654, align 8
  br label %658

; <label>:658:                                    ; preds = %652, %645
  %659 = phi float** [ %650, %645 ], [ %656, %652 ]
  %660 = load float*, float** %659, align 8
  store float %640, float* %660, align 4
  br label %2031

; <label>:661:                                    ; preds = %3
  %662 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %663 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %662, i32 0, i32 26
  %664 = load float, float* %663, align 8
  %665 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %666 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %665, i32 0, i32 0
  %667 = load i32, i32* %666, align 8
  %668 = icmp ule i32 %667, 40
  br i1 %668, label %669, label %676

; <label>:669:                                    ; preds = %661
  %pgocount57 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 65)
  %670 = add i64 %pgocount57, 1
  store i64 %670, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 65)
  %671 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %665, i32 0, i32 3
  %672 = load i8*, i8** %671, align 8
  %673 = getelementptr i8, i8* %672, i32 %667
  %674 = bitcast i8* %673 to float**
  %675 = add i32 %667, 8
  store i32 %675, i32* %666, align 8
  br label %682

; <label>:676:                                    ; preds = %661
  %pgocount58 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 66)
  %677 = add i64 %pgocount58, 1
  store i64 %677, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 66)
  %678 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %665, i32 0, i32 2
  %679 = load i8*, i8** %678, align 8
  %680 = bitcast i8* %679 to float**
  %681 = getelementptr i8, i8* %679, i32 8
  store i8* %681, i8** %678, align 8
  br label %682

; <label>:682:                                    ; preds = %676, %669
  %683 = phi float** [ %674, %669 ], [ %680, %676 ]
  %684 = load float*, float** %683, align 8
  store float %664, float* %684, align 4
  br label %2031

; <label>:685:                                    ; preds = %3
  %686 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %687 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %686, i32 0, i32 41
  %688 = load i8*, i8** %687, align 8
  %689 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %690 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %689, i32 0, i32 0
  %691 = load i32, i32* %690, align 8
  %692 = icmp ule i32 %691, 40
  br i1 %692, label %693, label %700

; <label>:693:                                    ; preds = %685
  %pgocount59 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 67)
  %694 = add i64 %pgocount59, 1
  store i64 %694, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 67)
  %695 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %689, i32 0, i32 3
  %696 = load i8*, i8** %695, align 8
  %697 = getelementptr i8, i8* %696, i32 %691
  %698 = bitcast i8* %697 to i8***
  %699 = add i32 %691, 8
  store i32 %699, i32* %690, align 8
  br label %706

; <label>:700:                                    ; preds = %685
  %pgocount60 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 68)
  %701 = add i64 %pgocount60, 1
  store i64 %701, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 68)
  %702 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %689, i32 0, i32 2
  %703 = load i8*, i8** %702, align 8
  %704 = bitcast i8* %703 to i8***
  %705 = getelementptr i8, i8* %703, i32 8
  store i8* %705, i8** %702, align 8
  br label %706

; <label>:706:                                    ; preds = %700, %693
  %707 = phi i8*** [ %698, %693 ], [ %704, %700 ]
  %708 = load i8**, i8*** %707, align 8
  store i8* %688, i8** %708, align 8
  br label %2031

; <label>:709:                                    ; preds = %3
  %710 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %711 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %710, i32 0, i32 23
  %712 = load i16, i16* %711, align 8
  %713 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %714 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %713, i32 0, i32 0
  %715 = load i32, i32* %714, align 8
  %716 = icmp ule i32 %715, 40
  br i1 %716, label %717, label %724

; <label>:717:                                    ; preds = %709
  %pgocount61 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 69)
  %718 = add i64 %pgocount61, 1
  store i64 %718, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 69)
  %719 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %713, i32 0, i32 3
  %720 = load i8*, i8** %719, align 8
  %721 = getelementptr i8, i8* %720, i32 %715
  %722 = bitcast i8* %721 to i16**
  %723 = add i32 %715, 8
  store i32 %723, i32* %714, align 8
  br label %730

; <label>:724:                                    ; preds = %709
  %pgocount62 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 70)
  %725 = add i64 %pgocount62, 1
  store i64 %725, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 70)
  %726 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %713, i32 0, i32 2
  %727 = load i8*, i8** %726, align 8
  %728 = bitcast i8* %727 to i16**
  %729 = getelementptr i8, i8* %727, i32 8
  store i8* %729, i8** %726, align 8
  br label %730

; <label>:730:                                    ; preds = %724, %717
  %731 = phi i16** [ %722, %717 ], [ %728, %724 ]
  %732 = load i16*, i16** %731, align 8
  store i16 %712, i16* %732, align 2
  br label %2031

; <label>:733:                                    ; preds = %3
  %734 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %735 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %734, i32 0, i32 27
  %736 = getelementptr inbounds [2 x i16], [2 x i16]* %735, i64 0, i64 0
  %737 = load i16, i16* %736, align 4
  %738 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %739 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %738, i32 0, i32 0
  %740 = load i32, i32* %739, align 8
  %741 = icmp ule i32 %740, 40
  br i1 %741, label %742, label %748

; <label>:742:                                    ; preds = %733
  %743 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %738, i32 0, i32 3
  %744 = load i8*, i8** %743, align 8
  %745 = getelementptr i8, i8* %744, i32 %740
  %746 = bitcast i8* %745 to i16**
  %747 = add i32 %740, 8
  store i32 %747, i32* %739, align 8
  br label %754

; <label>:748:                                    ; preds = %733
  %pgocount63 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 71)
  %749 = add i64 %pgocount63, 1
  store i64 %749, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 71)
  %750 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %738, i32 0, i32 2
  %751 = load i8*, i8** %750, align 8
  %752 = bitcast i8* %751 to i16**
  %753 = getelementptr i8, i8* %751, i32 8
  store i8* %753, i8** %750, align 8
  br label %754

; <label>:754:                                    ; preds = %748, %742
  %755 = phi i16** [ %746, %742 ], [ %752, %748 ]
  %756 = load i16*, i16** %755, align 8
  store i16 %737, i16* %756, align 2
  %757 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %758 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %757, i32 0, i32 27
  %759 = getelementptr inbounds [2 x i16], [2 x i16]* %758, i64 0, i64 1
  %760 = load i16, i16* %759, align 2
  %761 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %762 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %761, i32 0, i32 0
  %763 = load i32, i32* %762, align 8
  %764 = icmp ule i32 %763, 40
  br i1 %764, label %765, label %772

; <label>:765:                                    ; preds = %754
  %pgocount64 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 72)
  %766 = add i64 %pgocount64, 1
  store i64 %766, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 72)
  %767 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %761, i32 0, i32 3
  %768 = load i8*, i8** %767, align 8
  %769 = getelementptr i8, i8* %768, i32 %763
  %770 = bitcast i8* %769 to i16**
  %771 = add i32 %763, 8
  store i32 %771, i32* %762, align 8
  br label %778

; <label>:772:                                    ; preds = %754
  %pgocount65 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 73)
  %773 = add i64 %pgocount65, 1
  store i64 %773, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 73)
  %774 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %761, i32 0, i32 2
  %775 = load i8*, i8** %774, align 8
  %776 = bitcast i8* %775 to i16**
  %777 = getelementptr i8, i8* %775, i32 8
  store i8* %777, i8** %774, align 8
  br label %778

; <label>:778:                                    ; preds = %772, %765
  %779 = phi i16** [ %770, %765 ], [ %776, %772 ]
  %780 = load i16*, i16** %779, align 8
  store i16 %760, i16* %780, align 2
  br label %2031

; <label>:781:                                    ; preds = %3
  %782 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %783 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %782, i32 0, i32 29
  %784 = getelementptr inbounds [2 x i16], [2 x i16]* %783, i64 0, i64 0
  %785 = load i16, i16* %784, align 8
  %786 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %787 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %786, i32 0, i32 0
  %788 = load i32, i32* %787, align 8
  %789 = icmp ule i32 %788, 40
  br i1 %789, label %790, label %796

; <label>:790:                                    ; preds = %781
  %791 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %786, i32 0, i32 3
  %792 = load i8*, i8** %791, align 8
  %793 = getelementptr i8, i8* %792, i32 %788
  %794 = bitcast i8* %793 to i16**
  %795 = add i32 %788, 8
  store i32 %795, i32* %787, align 8
  br label %802

; <label>:796:                                    ; preds = %781
  %pgocount66 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 74)
  %797 = add i64 %pgocount66, 1
  store i64 %797, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 74)
  %798 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %786, i32 0, i32 2
  %799 = load i8*, i8** %798, align 8
  %800 = bitcast i8* %799 to i16**
  %801 = getelementptr i8, i8* %799, i32 8
  store i8* %801, i8** %798, align 8
  br label %802

; <label>:802:                                    ; preds = %796, %790
  %803 = phi i16** [ %794, %790 ], [ %800, %796 ]
  %804 = load i16*, i16** %803, align 8
  store i16 %785, i16* %804, align 2
  %805 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %806 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %805, i32 0, i32 29
  %807 = getelementptr inbounds [2 x i16], [2 x i16]* %806, i64 0, i64 1
  %808 = load i16, i16* %807, align 2
  %809 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %810 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %809, i32 0, i32 0
  %811 = load i32, i32* %810, align 8
  %812 = icmp ule i32 %811, 40
  br i1 %812, label %813, label %820

; <label>:813:                                    ; preds = %802
  %pgocount67 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 75)
  %814 = add i64 %pgocount67, 1
  store i64 %814, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 75)
  %815 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %809, i32 0, i32 3
  %816 = load i8*, i8** %815, align 8
  %817 = getelementptr i8, i8* %816, i32 %811
  %818 = bitcast i8* %817 to i16**
  %819 = add i32 %811, 8
  store i32 %819, i32* %810, align 8
  br label %826

; <label>:820:                                    ; preds = %802
  %pgocount68 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 76)
  %821 = add i64 %pgocount68, 1
  store i64 %821, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 76)
  %822 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %809, i32 0, i32 2
  %823 = load i8*, i8** %822, align 8
  %824 = bitcast i8* %823 to i16**
  %825 = getelementptr i8, i8* %823, i32 8
  store i8* %825, i8** %822, align 8
  br label %826

; <label>:826:                                    ; preds = %820, %813
  %827 = phi i16** [ %818, %813 ], [ %824, %820 ]
  %828 = load i16*, i16** %827, align 8
  store i16 %808, i16* %828, align 2
  br label %2031

; <label>:829:                                    ; preds = %3
  %830 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %831 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %830, i32 0, i32 28
  %832 = getelementptr inbounds [3 x i16*], [3 x i16*]* %831, i64 0, i64 0
  %833 = load i16*, i16** %832, align 8
  %834 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %835 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %834, i32 0, i32 0
  %836 = load i32, i32* %835, align 8
  %837 = icmp ule i32 %836, 40
  br i1 %837, label %838, label %844

; <label>:838:                                    ; preds = %829
  %839 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %834, i32 0, i32 3
  %840 = load i8*, i8** %839, align 8
  %841 = getelementptr i8, i8* %840, i32 %836
  %842 = bitcast i8* %841 to i16***
  %843 = add i32 %836, 8
  store i32 %843, i32* %835, align 8
  br label %850

; <label>:844:                                    ; preds = %829
  %pgocount69 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 77)
  %845 = add i64 %pgocount69, 1
  store i64 %845, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 77)
  %846 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %834, i32 0, i32 2
  %847 = load i8*, i8** %846, align 8
  %848 = bitcast i8* %847 to i16***
  %849 = getelementptr i8, i8* %847, i32 8
  store i8* %849, i8** %846, align 8
  br label %850

; <label>:850:                                    ; preds = %844, %838
  %851 = phi i16*** [ %842, %838 ], [ %848, %844 ]
  %852 = load i16**, i16*** %851, align 8
  store i16* %833, i16** %852, align 8
  %853 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %854 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %853, i32 0, i32 28
  %855 = getelementptr inbounds [3 x i16*], [3 x i16*]* %854, i64 0, i64 1
  %856 = load i16*, i16** %855, align 8
  %857 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %858 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %857, i32 0, i32 0
  %859 = load i32, i32* %858, align 8
  %860 = icmp ule i32 %859, 40
  br i1 %860, label %861, label %867

; <label>:861:                                    ; preds = %850
  %862 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %857, i32 0, i32 3
  %863 = load i8*, i8** %862, align 8
  %864 = getelementptr i8, i8* %863, i32 %859
  %865 = bitcast i8* %864 to i16***
  %866 = add i32 %859, 8
  store i32 %866, i32* %858, align 8
  br label %873

; <label>:867:                                    ; preds = %850
  %pgocount70 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 78)
  %868 = add i64 %pgocount70, 1
  store i64 %868, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 78)
  %869 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %857, i32 0, i32 2
  %870 = load i8*, i8** %869, align 8
  %871 = bitcast i8* %870 to i16***
  %872 = getelementptr i8, i8* %870, i32 8
  store i8* %872, i8** %869, align 8
  br label %873

; <label>:873:                                    ; preds = %867, %861
  %874 = phi i16*** [ %865, %861 ], [ %871, %867 ]
  %875 = load i16**, i16*** %874, align 8
  store i16* %856, i16** %875, align 8
  %876 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %877 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %876, i32 0, i32 28
  %878 = getelementptr inbounds [3 x i16*], [3 x i16*]* %877, i64 0, i64 2
  %879 = load i16*, i16** %878, align 8
  %880 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %881 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %880, i32 0, i32 0
  %882 = load i32, i32* %881, align 8
  %883 = icmp ule i32 %882, 40
  br i1 %883, label %884, label %891

; <label>:884:                                    ; preds = %873
  %pgocount71 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 79)
  %885 = add i64 %pgocount71, 1
  store i64 %885, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 79)
  %886 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %880, i32 0, i32 3
  %887 = load i8*, i8** %886, align 8
  %888 = getelementptr i8, i8* %887, i32 %882
  %889 = bitcast i8* %888 to i16***
  %890 = add i32 %882, 8
  store i32 %890, i32* %881, align 8
  br label %897

; <label>:891:                                    ; preds = %873
  %pgocount72 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 80)
  %892 = add i64 %pgocount72, 1
  store i64 %892, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 80)
  %893 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %880, i32 0, i32 2
  %894 = load i8*, i8** %893, align 8
  %895 = bitcast i8* %894 to i16***
  %896 = getelementptr i8, i8* %894, i32 8
  store i8* %896, i8** %893, align 8
  br label %897

; <label>:897:                                    ; preds = %891, %884
  %898 = phi i16*** [ %889, %884 ], [ %895, %891 ]
  %899 = load i16**, i16*** %898, align 8
  store i16* %879, i16** %899, align 8
  br label %2031

; <label>:900:                                    ; preds = %._crit_edge, %3
  %901 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %902 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %901, i32 0, i32 44
  %903 = load i32*, i32** %902, align 8
  %904 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %905 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %904, i32 0, i32 0
  %906 = load i32, i32* %905, align 8
  %907 = icmp ule i32 %906, 40
  br i1 %907, label %908, label %915

; <label>:908:                                    ; preds = %900
  %pgocount73 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 3)
  %909 = add i64 %pgocount73, 1
  store i64 %909, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 3)
  %910 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %904, i32 0, i32 3
  %911 = load i8*, i8** %910, align 8
  %912 = getelementptr i8, i8* %911, i32 %906
  %913 = bitcast i8* %912 to i32***
  %914 = add i32 %906, 8
  store i32 %914, i32* %905, align 8
  br label %921

; <label>:915:                                    ; preds = %900
  %pgocount74 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 4)
  %916 = add i64 %pgocount74, 1
  store i64 %916, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 4)
  %917 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %904, i32 0, i32 2
  %918 = load i8*, i8** %917, align 8
  %919 = bitcast i8* %918 to i32***
  %920 = getelementptr i8, i8* %918, i32 8
  store i8* %920, i8** %917, align 8
  br label %921

; <label>:921:                                    ; preds = %915, %908
  %922 = phi i32*** [ %913, %908 ], [ %919, %915 ]
  %923 = load i32**, i32*** %922, align 8
  store i32* %903, i32** %923, align 8
  br label %2031

; <label>:924:                                    ; preds = %._crit_edge1, %3
  %925 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %926 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %925, i32 0, i32 45
  %927 = load i32*, i32** %926, align 8
  %928 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %929 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %928, i32 0, i32 0
  %930 = load i32, i32* %929, align 8
  %931 = icmp ule i32 %930, 40
  br i1 %931, label %932, label %939

; <label>:932:                                    ; preds = %924
  %pgocount75 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 5)
  %933 = add i64 %pgocount75, 1
  store i64 %933, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 5)
  %934 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %928, i32 0, i32 3
  %935 = load i8*, i8** %934, align 8
  %936 = getelementptr i8, i8* %935, i32 %930
  %937 = bitcast i8* %936 to i32***
  %938 = add i32 %930, 8
  store i32 %938, i32* %929, align 8
  br label %945

; <label>:939:                                    ; preds = %924
  %pgocount76 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 6)
  %940 = add i64 %pgocount76, 1
  store i64 %940, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 6)
  %941 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %928, i32 0, i32 2
  %942 = load i8*, i8** %941, align 8
  %943 = bitcast i8* %942 to i32***
  %944 = getelementptr i8, i8* %942, i32 8
  store i8* %944, i8** %941, align 8
  br label %945

; <label>:945:                                    ; preds = %939, %932
  %946 = phi i32*** [ %937, %932 ], [ %943, %939 ]
  %947 = load i32**, i32*** %946, align 8
  store i32* %927, i32** %947, align 8
  br label %2031

; <label>:948:                                    ; preds = %3
  %949 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %950 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %949, i32 0, i32 30
  %951 = load i16, i16* %950, align 4
  %952 = zext i16 %951 to i32
  %953 = icmp eq i32 %952, 1
  br i1 %953, label %954, label %963

; <label>:954:                                    ; preds = %948
  %pgocount77 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 81)
  %955 = add i64 %pgocount77, 1
  store i64 %955, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 81)
  %956 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %957 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %956, i32 0, i32 31
  %958 = load i16*, i16** %957, align 8
  %959 = getelementptr inbounds i16, i16* %958, i64 0
  %960 = load i16, i16* %959, align 2
  %961 = zext i16 %960 to i32
  %962 = icmp eq i32 %961, 1
  br label %963

; <label>:963:                                    ; preds = %954, %948
  %964 = phi i1 [ false, %948 ], [ %962, %954 ]
  %965 = zext i1 %964 to i32
  %966 = trunc i32 %965 to i16
  %967 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %968 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %967, i32 0, i32 0
  %969 = load i32, i32* %968, align 8
  %970 = icmp ule i32 %969, 40
  br i1 %970, label %971, label %978

; <label>:971:                                    ; preds = %963
  %pgocount78 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 82)
  %972 = add i64 %pgocount78, 1
  store i64 %972, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 82)
  %973 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %967, i32 0, i32 3
  %974 = load i8*, i8** %973, align 8
  %975 = getelementptr i8, i8* %974, i32 %969
  %976 = bitcast i8* %975 to i16**
  %977 = add i32 %969, 8
  store i32 %977, i32* %968, align 8
  br label %984

; <label>:978:                                    ; preds = %963
  %pgocount79 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 83)
  %979 = add i64 %pgocount79, 1
  store i64 %979, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 83)
  %980 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %967, i32 0, i32 2
  %981 = load i8*, i8** %980, align 8
  %982 = bitcast i8* %981 to i16**
  %983 = getelementptr i8, i8* %981, i32 8
  store i8* %983, i8** %980, align 8
  br label %984

; <label>:984:                                    ; preds = %978, %971
  %985 = phi i16** [ %976, %971 ], [ %982, %978 ]
  %986 = load i16*, i16** %985, align 8
  store i16 %966, i16* %986, align 2
  br label %2031

; <label>:987:                                    ; preds = %3
  %988 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %989 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %988, i32 0, i32 30
  %990 = load i16, i16* %989, align 4
  %991 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %992 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %991, i32 0, i32 0
  %993 = load i32, i32* %992, align 8
  %994 = icmp ule i32 %993, 40
  br i1 %994, label %995, label %1001

; <label>:995:                                    ; preds = %987
  %996 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %991, i32 0, i32 3
  %997 = load i8*, i8** %996, align 8
  %998 = getelementptr i8, i8* %997, i32 %993
  %999 = bitcast i8* %998 to i16**
  %1000 = add i32 %993, 8
  store i32 %1000, i32* %992, align 8
  br label %1007

; <label>:1001:                                   ; preds = %987
  %pgocount80 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 84)
  %1002 = add i64 %pgocount80, 1
  store i64 %1002, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 84)
  %1003 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %991, i32 0, i32 2
  %1004 = load i8*, i8** %1003, align 8
  %1005 = bitcast i8* %1004 to i16**
  %1006 = getelementptr i8, i8* %1004, i32 8
  store i8* %1006, i8** %1003, align 8
  br label %1007

; <label>:1007:                                   ; preds = %1001, %995
  %1008 = phi i16** [ %999, %995 ], [ %1005, %1001 ]
  %1009 = load i16*, i16** %1008, align 8
  store i16 %990, i16* %1009, align 2
  %1010 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1011 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1010, i32 0, i32 31
  %1012 = load i16*, i16** %1011, align 8
  %1013 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1014 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1013, i32 0, i32 0
  %1015 = load i32, i32* %1014, align 8
  %1016 = icmp ule i32 %1015, 40
  br i1 %1016, label %1017, label %1024

; <label>:1017:                                   ; preds = %1007
  %pgocount81 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 85)
  %1018 = add i64 %pgocount81, 1
  store i64 %1018, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 85)
  %1019 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1013, i32 0, i32 3
  %1020 = load i8*, i8** %1019, align 8
  %1021 = getelementptr i8, i8* %1020, i32 %1015
  %1022 = bitcast i8* %1021 to i16***
  %1023 = add i32 %1015, 8
  store i32 %1023, i32* %1014, align 8
  br label %1030

; <label>:1024:                                   ; preds = %1007
  %pgocount82 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 86)
  %1025 = add i64 %pgocount82, 1
  store i64 %1025, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 86)
  %1026 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1013, i32 0, i32 2
  %1027 = load i8*, i8** %1026, align 8
  %1028 = bitcast i8* %1027 to i16***
  %1029 = getelementptr i8, i8* %1027, i32 8
  store i8* %1029, i8** %1026, align 8
  br label %1030

; <label>:1030:                                   ; preds = %1024, %1017
  %1031 = phi i16*** [ %1022, %1017 ], [ %1028, %1024 ]
  %1032 = load i16**, i16*** %1031, align 8
  store i16* %1012, i16** %1032, align 8
  br label %2031

; <label>:1033:                                   ; preds = %3
  %1034 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1035 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1034, i32 0, i32 4
  %1036 = load i32, i32* %1035, align 4
  %1037 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1038 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1037, i32 0, i32 0
  %1039 = load i32, i32* %1038, align 8
  %1040 = icmp ule i32 %1039, 40
  br i1 %1040, label %1041, label %1048

; <label>:1041:                                   ; preds = %1033
  %pgocount83 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 87)
  %1042 = add i64 %pgocount83, 1
  store i64 %1042, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 87)
  %1043 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1037, i32 0, i32 3
  %1044 = load i8*, i8** %1043, align 8
  %1045 = getelementptr i8, i8* %1044, i32 %1039
  %1046 = bitcast i8* %1045 to i32**
  %1047 = add i32 %1039, 8
  store i32 %1047, i32* %1038, align 8
  br label %1054

; <label>:1048:                                   ; preds = %1033
  %pgocount84 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 88)
  %1049 = add i64 %pgocount84, 1
  store i64 %1049, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 88)
  %1050 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1037, i32 0, i32 2
  %1051 = load i8*, i8** %1050, align 8
  %1052 = bitcast i8* %1051 to i32**
  %1053 = getelementptr i8, i8* %1051, i32 8
  store i8* %1053, i8** %1050, align 8
  br label %1054

; <label>:1054:                                   ; preds = %1048, %1041
  %1055 = phi i32** [ %1046, %1041 ], [ %1052, %1048 ]
  %1056 = load i32*, i32** %1055, align 8
  store i32 %1036, i32* %1056, align 4
  br label %2031

; <label>:1057:                                   ; preds = %3
  %1058 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1059 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1058, i32 0, i32 5
  %1060 = load i32, i32* %1059, align 8
  %1061 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1062 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1061, i32 0, i32 0
  %1063 = load i32, i32* %1062, align 8
  %1064 = icmp ule i32 %1063, 40
  br i1 %1064, label %1065, label %1072

; <label>:1065:                                   ; preds = %1057
  %pgocount85 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 89)
  %1066 = add i64 %pgocount85, 1
  store i64 %1066, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 89)
  %1067 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1061, i32 0, i32 3
  %1068 = load i8*, i8** %1067, align 8
  %1069 = getelementptr i8, i8* %1068, i32 %1063
  %1070 = bitcast i8* %1069 to i32**
  %1071 = add i32 %1063, 8
  store i32 %1071, i32* %1062, align 8
  br label %1078

; <label>:1072:                                   ; preds = %1057
  %pgocount86 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 90)
  %1073 = add i64 %pgocount86, 1
  store i64 %1073, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 90)
  %1074 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1061, i32 0, i32 2
  %1075 = load i8*, i8** %1074, align 8
  %1076 = bitcast i8* %1075 to i32**
  %1077 = getelementptr i8, i8* %1075, i32 8
  store i8* %1077, i8** %1074, align 8
  br label %1078

; <label>:1078:                                   ; preds = %1072, %1065
  %1079 = phi i32** [ %1070, %1065 ], [ %1076, %1072 ]
  %1080 = load i32*, i32** %1079, align 8
  store i32 %1060, i32* %1080, align 4
  br label %2031

; <label>:1081:                                   ; preds = %3
  %1082 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1083 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1082, i32 0, i32 6
  %1084 = load i32, i32* %1083, align 4
  %1085 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1086 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1085, i32 0, i32 0
  %1087 = load i32, i32* %1086, align 8
  %1088 = icmp ule i32 %1087, 40
  br i1 %1088, label %1089, label %1096

; <label>:1089:                                   ; preds = %1081
  %pgocount87 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 91)
  %1090 = add i64 %pgocount87, 1
  store i64 %1090, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 91)
  %1091 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1085, i32 0, i32 3
  %1092 = load i8*, i8** %1091, align 8
  %1093 = getelementptr i8, i8* %1092, i32 %1087
  %1094 = bitcast i8* %1093 to i32**
  %1095 = add i32 %1087, 8
  store i32 %1095, i32* %1086, align 8
  br label %1102

; <label>:1096:                                   ; preds = %1081
  %pgocount88 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 92)
  %1097 = add i64 %pgocount88, 1
  store i64 %1097, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 92)
  %1098 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1085, i32 0, i32 2
  %1099 = load i8*, i8** %1098, align 8
  %1100 = bitcast i8* %1099 to i32**
  %1101 = getelementptr i8, i8* %1099, i32 8
  store i8* %1101, i8** %1098, align 8
  br label %1102

; <label>:1102:                                   ; preds = %1096, %1089
  %1103 = phi i32** [ %1094, %1089 ], [ %1100, %1096 ]
  %1104 = load i32*, i32** %1103, align 8
  store i32 %1084, i32* %1104, align 4
  br label %2031

; <label>:1105:                                   ; preds = %3
  %pgocount89 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 2)
  %1106 = add i64 %pgocount89, 1
  store i64 %1106, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 2)
  %1107 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1108 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1107, i32 0, i32 9
  %1109 = load i16, i16* %1108, align 2
  %1110 = zext i16 %1109 to i32
  switch i32 %1110, label %1195 [
    i32 1, label %1111
    i32 2, label %1132
    i32 3, label %1153
    i32 4, label %1174
  ]

; <label>:1111:                                   ; preds = %1105
  %1112 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1113 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1112, i32 0, i32 0
  %1114 = load i32, i32* %1113, align 8
  %1115 = icmp ule i32 %1114, 40
  br i1 %1115, label %1116, label %1123

; <label>:1116:                                   ; preds = %1111
  %pgocount90 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 157)
  %1117 = add i64 %pgocount90, 1
  store i64 %1117, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 157)
  %1118 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1112, i32 0, i32 3
  %1119 = load i8*, i8** %1118, align 8
  %1120 = getelementptr i8, i8* %1119, i32 %1114
  %1121 = bitcast i8* %1120 to i16**
  %1122 = add i32 %1114, 8
  store i32 %1122, i32* %1113, align 8
  br label %1129

; <label>:1123:                                   ; preds = %1111
  %pgocount91 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 158)
  %1124 = add i64 %pgocount91, 1
  store i64 %1124, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 158)
  %1125 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1112, i32 0, i32 2
  %1126 = load i8*, i8** %1125, align 8
  %1127 = bitcast i8* %1126 to i16**
  %1128 = getelementptr i8, i8* %1126, i32 8
  store i8* %1128, i8** %1125, align 8
  br label %1129

; <label>:1129:                                   ; preds = %1123, %1116
  %1130 = phi i16** [ %1121, %1116 ], [ %1127, %1123 ]
  %1131 = load i16*, i16** %1130, align 8
  store i16 2, i16* %1131, align 2
  br label %1195

; <label>:1132:                                   ; preds = %1105
  %1133 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1134 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1133, i32 0, i32 0
  %1135 = load i32, i32* %1134, align 8
  %1136 = icmp ule i32 %1135, 40
  br i1 %1136, label %1137, label %1144

; <label>:1137:                                   ; preds = %1132
  %pgocount92 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 151)
  %1138 = add i64 %pgocount92, 1
  store i64 %1138, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 151)
  %1139 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1133, i32 0, i32 3
  %1140 = load i8*, i8** %1139, align 8
  %1141 = getelementptr i8, i8* %1140, i32 %1135
  %1142 = bitcast i8* %1141 to i16**
  %1143 = add i32 %1135, 8
  store i32 %1143, i32* %1134, align 8
  br label %1150

; <label>:1144:                                   ; preds = %1132
  %pgocount93 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 152)
  %1145 = add i64 %pgocount93, 1
  store i64 %1145, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 152)
  %1146 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1133, i32 0, i32 2
  %1147 = load i8*, i8** %1146, align 8
  %1148 = bitcast i8* %1147 to i16**
  %1149 = getelementptr i8, i8* %1147, i32 8
  store i8* %1149, i8** %1146, align 8
  br label %1150

; <label>:1150:                                   ; preds = %1144, %1137
  %1151 = phi i16** [ %1142, %1137 ], [ %1148, %1144 ]
  %1152 = load i16*, i16** %1151, align 8
  store i16 1, i16* %1152, align 2
  br label %1195

; <label>:1153:                                   ; preds = %1105
  %1154 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1155 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1154, i32 0, i32 0
  %1156 = load i32, i32* %1155, align 8
  %1157 = icmp ule i32 %1156, 40
  br i1 %1157, label %1158, label %1165

; <label>:1158:                                   ; preds = %1153
  %pgocount94 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 153)
  %1159 = add i64 %pgocount94, 1
  store i64 %1159, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 153)
  %1160 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1154, i32 0, i32 3
  %1161 = load i8*, i8** %1160, align 8
  %1162 = getelementptr i8, i8* %1161, i32 %1156
  %1163 = bitcast i8* %1162 to i16**
  %1164 = add i32 %1156, 8
  store i32 %1164, i32* %1155, align 8
  br label %1171

; <label>:1165:                                   ; preds = %1153
  %pgocount95 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 154)
  %1166 = add i64 %pgocount95, 1
  store i64 %1166, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 154)
  %1167 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1154, i32 0, i32 2
  %1168 = load i8*, i8** %1167, align 8
  %1169 = bitcast i8* %1168 to i16**
  %1170 = getelementptr i8, i8* %1168, i32 8
  store i8* %1170, i8** %1167, align 8
  br label %1171

; <label>:1171:                                   ; preds = %1165, %1158
  %1172 = phi i16** [ %1163, %1158 ], [ %1169, %1165 ]
  %1173 = load i16*, i16** %1172, align 8
  store i16 3, i16* %1173, align 2
  br label %1195

; <label>:1174:                                   ; preds = %1105
  %1175 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1176 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1175, i32 0, i32 0
  %1177 = load i32, i32* %1176, align 8
  %1178 = icmp ule i32 %1177, 40
  br i1 %1178, label %1179, label %1186

; <label>:1179:                                   ; preds = %1174
  %pgocount96 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 155)
  %1180 = add i64 %pgocount96, 1
  store i64 %1180, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 155)
  %1181 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1175, i32 0, i32 3
  %1182 = load i8*, i8** %1181, align 8
  %1183 = getelementptr i8, i8* %1182, i32 %1177
  %1184 = bitcast i8* %1183 to i16**
  %1185 = add i32 %1177, 8
  store i32 %1185, i32* %1176, align 8
  br label %1192

; <label>:1186:                                   ; preds = %1174
  %pgocount97 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 156)
  %1187 = add i64 %pgocount97, 1
  store i64 %1187, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 156)
  %1188 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1175, i32 0, i32 2
  %1189 = load i8*, i8** %1188, align 8
  %1190 = bitcast i8* %1189 to i16**
  %1191 = getelementptr i8, i8* %1189, i32 8
  store i8* %1191, i8** %1188, align 8
  br label %1192

; <label>:1192:                                   ; preds = %1186, %1179
  %1193 = phi i16** [ %1184, %1179 ], [ %1190, %1186 ]
  %1194 = load i16*, i16** %1193, align 8
  store i16 0, i16* %1194, align 2
  br label %1195

; <label>:1195:                                   ; preds = %1192, %1171, %1150, %1129, %1105
  br label %2031

; <label>:1196:                                   ; preds = %3
  %1197 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1198 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1197, i32 0, i32 9
  %1199 = load i16, i16* %1198, align 2
  %1200 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1201 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1200, i32 0, i32 0
  %1202 = load i32, i32* %1201, align 8
  %1203 = icmp ule i32 %1202, 40
  br i1 %1203, label %1204, label %1211

; <label>:1204:                                   ; preds = %1196
  %pgocount98 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 93)
  %1205 = add i64 %pgocount98, 1
  store i64 %1205, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 93)
  %1206 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1200, i32 0, i32 3
  %1207 = load i8*, i8** %1206, align 8
  %1208 = getelementptr i8, i8* %1207, i32 %1202
  %1209 = bitcast i8* %1208 to i16**
  %1210 = add i32 %1202, 8
  store i32 %1210, i32* %1201, align 8
  br label %1217

; <label>:1211:                                   ; preds = %1196
  %pgocount99 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 94)
  %1212 = add i64 %pgocount99, 1
  store i64 %1212, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 94)
  %1213 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1200, i32 0, i32 2
  %1214 = load i8*, i8** %1213, align 8
  %1215 = bitcast i8* %1214 to i16**
  %1216 = getelementptr i8, i8* %1214, i32 8
  store i8* %1216, i8** %1213, align 8
  br label %1217

; <label>:1217:                                   ; preds = %1211, %1204
  %1218 = phi i16** [ %1209, %1204 ], [ %1215, %1211 ]
  %1219 = load i16*, i16** %1218, align 8
  store i16 %1199, i16* %1219, align 2
  br label %2031

; <label>:1220:                                   ; preds = %3
  %1221 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1222 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1221, i32 0, i32 3
  %1223 = load i32, i32* %1222, align 8
  %1224 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1225 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1224, i32 0, i32 0
  %1226 = load i32, i32* %1225, align 8
  %1227 = icmp ule i32 %1226, 40
  br i1 %1227, label %1228, label %1235

; <label>:1228:                                   ; preds = %1220
  %pgocount100 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 95)
  %1229 = add i64 %pgocount100, 1
  store i64 %1229, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 95)
  %1230 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1224, i32 0, i32 3
  %1231 = load i8*, i8** %1230, align 8
  %1232 = getelementptr i8, i8* %1231, i32 %1226
  %1233 = bitcast i8* %1232 to i32**
  %1234 = add i32 %1226, 8
  store i32 %1234, i32* %1225, align 8
  br label %1241

; <label>:1235:                                   ; preds = %1220
  %pgocount101 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 96)
  %1236 = add i64 %pgocount101, 1
  store i64 %1236, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 96)
  %1237 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1224, i32 0, i32 2
  %1238 = load i8*, i8** %1237, align 8
  %1239 = bitcast i8* %1238 to i32**
  %1240 = getelementptr i8, i8* %1238, i32 8
  store i8* %1240, i8** %1237, align 8
  br label %1241

; <label>:1241:                                   ; preds = %1235, %1228
  %1242 = phi i32** [ %1233, %1228 ], [ %1239, %1235 ]
  %1243 = load i32*, i32** %1242, align 8
  store i32 %1223, i32* %1243, align 4
  br label %2031

; <label>:1244:                                   ; preds = %3
  %1245 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1246 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1245, i32 0, i32 32
  %1247 = load double, double* %1246, align 8
  %1248 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1249 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1248, i32 0, i32 0
  %1250 = load i32, i32* %1249, align 8
  %1251 = icmp ule i32 %1250, 40
  br i1 %1251, label %1252, label %1259

; <label>:1252:                                   ; preds = %1244
  %pgocount102 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 97)
  %1253 = add i64 %pgocount102, 1
  store i64 %1253, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 97)
  %1254 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1248, i32 0, i32 3
  %1255 = load i8*, i8** %1254, align 8
  %1256 = getelementptr i8, i8* %1255, i32 %1250
  %1257 = bitcast i8* %1256 to double**
  %1258 = add i32 %1250, 8
  store i32 %1258, i32* %1249, align 8
  br label %1265

; <label>:1259:                                   ; preds = %1244
  %pgocount103 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 98)
  %1260 = add i64 %pgocount103, 1
  store i64 %1260, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 98)
  %1261 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1248, i32 0, i32 2
  %1262 = load i8*, i8** %1261, align 8
  %1263 = bitcast i8* %1262 to double**
  %1264 = getelementptr i8, i8* %1262, i32 8
  store i8* %1264, i8** %1261, align 8
  br label %1265

; <label>:1265:                                   ; preds = %1259, %1252
  %1266 = phi double** [ %1257, %1252 ], [ %1263, %1259 ]
  %1267 = load double*, double** %1266, align 8
  store double %1247, double* %1267, align 8
  br label %2031

; <label>:1268:                                   ; preds = %3
  %1269 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1270 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1269, i32 0, i32 46
  %1271 = load i16, i16* %1270, align 8
  %1272 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1273 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1272, i32 0, i32 0
  %1274 = load i32, i32* %1273, align 8
  %1275 = icmp ule i32 %1274, 40
  br i1 %1275, label %1276, label %1282

; <label>:1276:                                   ; preds = %1268
  %1277 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1272, i32 0, i32 3
  %1278 = load i8*, i8** %1277, align 8
  %1279 = getelementptr i8, i8* %1278, i32 %1274
  %1280 = bitcast i8* %1279 to i16**
  %1281 = add i32 %1274, 8
  store i32 %1281, i32* %1273, align 8
  br label %1288

; <label>:1282:                                   ; preds = %1268
  %pgocount104 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 99)
  %1283 = add i64 %pgocount104, 1
  store i64 %1283, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 99)
  %1284 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1272, i32 0, i32 2
  %1285 = load i8*, i8** %1284, align 8
  %1286 = bitcast i8* %1285 to i16**
  %1287 = getelementptr i8, i8* %1285, i32 8
  store i8* %1287, i8** %1284, align 8
  br label %1288

; <label>:1288:                                   ; preds = %1282, %1276
  %1289 = phi i16** [ %1280, %1276 ], [ %1286, %1282 ]
  %1290 = load i16*, i16** %1289, align 8
  store i16 %1271, i16* %1290, align 2
  %1291 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1292 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1291, i32 0, i32 47
  %1293 = load i32*, i32** %1292, align 8
  %1294 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1295 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1294, i32 0, i32 0
  %1296 = load i32, i32* %1295, align 8
  %1297 = icmp ule i32 %1296, 40
  br i1 %1297, label %1298, label %1305

; <label>:1298:                                   ; preds = %1288
  %pgocount105 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 100)
  %1299 = add i64 %pgocount105, 1
  store i64 %1299, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 100)
  %1300 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1294, i32 0, i32 3
  %1301 = load i8*, i8** %1300, align 8
  %1302 = getelementptr i8, i8* %1301, i32 %1296
  %1303 = bitcast i8* %1302 to i32***
  %1304 = add i32 %1296, 8
  store i32 %1304, i32* %1295, align 8
  br label %1311

; <label>:1305:                                   ; preds = %1288
  %pgocount106 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 101)
  %1306 = add i64 %pgocount106, 1
  store i64 %1306, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 101)
  %1307 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1294, i32 0, i32 2
  %1308 = load i8*, i8** %1307, align 8
  %1309 = bitcast i8* %1308 to i32***
  %1310 = getelementptr i8, i8* %1308, i32 8
  store i8* %1310, i8** %1307, align 8
  br label %1311

; <label>:1311:                                   ; preds = %1305, %1298
  %1312 = phi i32*** [ %1303, %1298 ], [ %1309, %1305 ]
  %1313 = load i32**, i32*** %1312, align 8
  store i32* %1293, i32** %1313, align 8
  br label %2031

; <label>:1314:                                   ; preds = %3
  %1315 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1316 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1315, i32 0, i32 48
  %1317 = load float*, float** %1316, align 8
  %1318 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1319 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1318, i32 0, i32 0
  %1320 = load i32, i32* %1319, align 8
  %1321 = icmp ule i32 %1320, 40
  br i1 %1321, label %1322, label %1329

; <label>:1322:                                   ; preds = %1314
  %pgocount107 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 102)
  %1323 = add i64 %pgocount107, 1
  store i64 %1323, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 102)
  %1324 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1318, i32 0, i32 3
  %1325 = load i8*, i8** %1324, align 8
  %1326 = getelementptr i8, i8* %1325, i32 %1320
  %1327 = bitcast i8* %1326 to float***
  %1328 = add i32 %1320, 8
  store i32 %1328, i32* %1319, align 8
  br label %1335

; <label>:1329:                                   ; preds = %1314
  %pgocount108 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 103)
  %1330 = add i64 %pgocount108, 1
  store i64 %1330, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 103)
  %1331 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1318, i32 0, i32 2
  %1332 = load i8*, i8** %1331, align 8
  %1333 = bitcast i8* %1332 to float***
  %1334 = getelementptr i8, i8* %1332, i32 8
  store i8* %1334, i8** %1331, align 8
  br label %1335

; <label>:1335:                                   ; preds = %1329, %1322
  %1336 = phi float*** [ %1327, %1322 ], [ %1333, %1329 ]
  %1337 = load float**, float*** %1336, align 8
  store float* %1317, float** %1337, align 8
  br label %2031

; <label>:1338:                                   ; preds = %3
  %1339 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1340 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1339, i32 0, i32 50
  %1341 = load i16, i16* %1340, align 4
  %1342 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1343 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1342, i32 0, i32 0
  %1344 = load i32, i32* %1343, align 8
  %1345 = icmp ule i32 %1344, 40
  br i1 %1345, label %1346, label %1353

; <label>:1346:                                   ; preds = %1338
  %pgocount109 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 104)
  %1347 = add i64 %pgocount109, 1
  store i64 %1347, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 104)
  %1348 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1342, i32 0, i32 3
  %1349 = load i8*, i8** %1348, align 8
  %1350 = getelementptr i8, i8* %1349, i32 %1344
  %1351 = bitcast i8* %1350 to i16**
  %1352 = add i32 %1344, 8
  store i32 %1352, i32* %1343, align 8
  br label %1359

; <label>:1353:                                   ; preds = %1338
  %pgocount110 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 105)
  %1354 = add i64 %pgocount110, 1
  store i64 %1354, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 105)
  %1355 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1342, i32 0, i32 2
  %1356 = load i8*, i8** %1355, align 8
  %1357 = bitcast i8* %1356 to i16**
  %1358 = getelementptr i8, i8* %1356, i32 8
  store i8* %1358, i8** %1355, align 8
  br label %1359

; <label>:1359:                                   ; preds = %1353, %1346
  %1360 = phi i16** [ %1351, %1346 ], [ %1357, %1353 ]
  %1361 = load i16*, i16** %1360, align 8
  store i16 %1341, i16* %1361, align 2
  br label %2031

; <label>:1362:                                   ; preds = %3
  %1363 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1364 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1363, i32 0, i32 49
  %1365 = getelementptr inbounds [2 x i16], [2 x i16]* %1364, i64 0, i64 0
  %1366 = load i16, i16* %1365, align 8
  %1367 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1368 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1367, i32 0, i32 0
  %1369 = load i32, i32* %1368, align 8
  %1370 = icmp ule i32 %1369, 40
  br i1 %1370, label %1371, label %1377

; <label>:1371:                                   ; preds = %1362
  %1372 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1367, i32 0, i32 3
  %1373 = load i8*, i8** %1372, align 8
  %1374 = getelementptr i8, i8* %1373, i32 %1369
  %1375 = bitcast i8* %1374 to i16**
  %1376 = add i32 %1369, 8
  store i32 %1376, i32* %1368, align 8
  br label %1383

; <label>:1377:                                   ; preds = %1362
  %pgocount111 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 8)
  %1378 = add i64 %pgocount111, 1
  store i64 %1378, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 8)
  %1379 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1367, i32 0, i32 2
  %1380 = load i8*, i8** %1379, align 8
  %1381 = bitcast i8* %1380 to i16**
  %1382 = getelementptr i8, i8* %1380, i32 8
  store i8* %1382, i8** %1379, align 8
  br label %1383

; <label>:1383:                                   ; preds = %1377, %1371
  %1384 = phi i16** [ %1375, %1371 ], [ %1381, %1377 ]
  %1385 = load i16*, i16** %1384, align 8
  store i16 %1366, i16* %1385, align 2
  %1386 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1387 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1386, i32 0, i32 49
  %1388 = getelementptr inbounds [2 x i16], [2 x i16]* %1387, i64 0, i64 1
  %1389 = load i16, i16* %1388, align 2
  %1390 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1391 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1390, i32 0, i32 0
  %1392 = load i32, i32* %1391, align 8
  %1393 = icmp ule i32 %1392, 40
  br i1 %1393, label %1394, label %1401

; <label>:1394:                                   ; preds = %1383
  %pgocount112 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 9)
  %1395 = add i64 %pgocount112, 1
  store i64 %1395, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 9)
  %1396 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1390, i32 0, i32 3
  %1397 = load i8*, i8** %1396, align 8
  %1398 = getelementptr i8, i8* %1397, i32 %1392
  %1399 = bitcast i8* %1398 to i16**
  %1400 = add i32 %1392, 8
  store i32 %1400, i32* %1391, align 8
  br label %1407

; <label>:1401:                                   ; preds = %1383
  %pgocount113 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 10)
  %1402 = add i64 %pgocount113, 1
  store i64 %1402, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 10)
  %1403 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1390, i32 0, i32 2
  %1404 = load i8*, i8** %1403, align 8
  %1405 = bitcast i8* %1404 to i16**
  %1406 = getelementptr i8, i8* %1404, i32 8
  store i8* %1406, i8** %1403, align 8
  br label %1407

; <label>:1407:                                   ; preds = %1401, %1394
  %1408 = phi i16** [ %1399, %1394 ], [ %1405, %1401 ]
  %1409 = load i16*, i16** %1408, align 8
  store i16 %1389, i16* %1409, align 2
  br label %2031

; <label>:1410:                                   ; preds = %3
  %1411 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1412 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1411, i32 0, i32 51
  %1413 = load float*, float** %1412, align 8
  %1414 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1415 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1414, i32 0, i32 0
  %1416 = load i32, i32* %1415, align 8
  %1417 = icmp ule i32 %1416, 40
  br i1 %1417, label %1418, label %1425

; <label>:1418:                                   ; preds = %1410
  %pgocount114 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 106)
  %1419 = add i64 %pgocount114, 1
  store i64 %1419, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 106)
  %1420 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1414, i32 0, i32 3
  %1421 = load i8*, i8** %1420, align 8
  %1422 = getelementptr i8, i8* %1421, i32 %1416
  %1423 = bitcast i8* %1422 to float***
  %1424 = add i32 %1416, 8
  store i32 %1424, i32* %1415, align 8
  br label %1431

; <label>:1425:                                   ; preds = %1410
  %pgocount115 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 107)
  %1426 = add i64 %pgocount115, 1
  store i64 %1426, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 107)
  %1427 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1414, i32 0, i32 2
  %1428 = load i8*, i8** %1427, align 8
  %1429 = bitcast i8* %1428 to float***
  %1430 = getelementptr i8, i8* %1428, i32 8
  store i8* %1430, i8** %1427, align 8
  br label %1431

; <label>:1431:                                   ; preds = %1425, %1418
  %1432 = phi float*** [ %1423, %1418 ], [ %1429, %1425 ]
  %1433 = load float**, float*** %1432, align 8
  store float* %1413, float** %1433, align 8
  br label %2031

; <label>:1434:                                   ; preds = %3
  %1435 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1436 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1435, i32 0, i32 52
  %1437 = load float*, float** %1436, align 8
  %1438 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1439 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1438, i32 0, i32 0
  %1440 = load i32, i32* %1439, align 8
  %1441 = icmp ule i32 %1440, 40
  br i1 %1441, label %1442, label %1449

; <label>:1442:                                   ; preds = %1434
  %pgocount116 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 108)
  %1443 = add i64 %pgocount116, 1
  store i64 %1443, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 108)
  %1444 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1438, i32 0, i32 3
  %1445 = load i8*, i8** %1444, align 8
  %1446 = getelementptr i8, i8* %1445, i32 %1440
  %1447 = bitcast i8* %1446 to float***
  %1448 = add i32 %1440, 8
  store i32 %1448, i32* %1439, align 8
  br label %1455

; <label>:1449:                                   ; preds = %1434
  %pgocount117 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 109)
  %1450 = add i64 %pgocount117, 1
  store i64 %1450, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 109)
  %1451 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1438, i32 0, i32 2
  %1452 = load i8*, i8** %1451, align 8
  %1453 = bitcast i8* %1452 to float***
  %1454 = getelementptr i8, i8* %1452, i32 8
  store i8* %1454, i8** %1451, align 8
  br label %1455

; <label>:1455:                                   ; preds = %1449, %1442
  %1456 = phi float*** [ %1447, %1442 ], [ %1453, %1449 ]
  %1457 = load float**, float*** %1456, align 8
  store float* %1437, float** %1457, align 8
  br label %2031

; <label>:1458:                                   ; preds = %3
  %1459 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1460 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1459, i32 0, i32 54
  %1461 = getelementptr inbounds [3 x i16*], [3 x i16*]* %1460, i64 0, i64 0
  %1462 = load i16*, i16** %1461, align 8
  %1463 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1464 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1463, i32 0, i32 0
  %1465 = load i32, i32* %1464, align 8
  %1466 = icmp ule i32 %1465, 40
  br i1 %1466, label %1467, label %1474

; <label>:1467:                                   ; preds = %1458
  %pgocount118 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 110)
  %1468 = add i64 %pgocount118, 1
  store i64 %1468, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 110)
  %1469 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1463, i32 0, i32 3
  %1470 = load i8*, i8** %1469, align 8
  %1471 = getelementptr i8, i8* %1470, i32 %1465
  %1472 = bitcast i8* %1471 to i16***
  %1473 = add i32 %1465, 8
  store i32 %1473, i32* %1464, align 8
  br label %1480

; <label>:1474:                                   ; preds = %1458
  %pgocount119 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 111)
  %1475 = add i64 %pgocount119, 1
  store i64 %1475, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 111)
  %1476 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1463, i32 0, i32 2
  %1477 = load i8*, i8** %1476, align 8
  %1478 = bitcast i8* %1477 to i16***
  %1479 = getelementptr i8, i8* %1477, i32 8
  store i8* %1479, i8** %1476, align 8
  br label %1480

; <label>:1480:                                   ; preds = %1474, %1467
  %1481 = phi i16*** [ %1472, %1467 ], [ %1478, %1474 ]
  %1482 = load i16**, i16*** %1481, align 8
  store i16* %1462, i16** %1482, align 8
  %1483 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1484 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1483, i32 0, i32 15
  %1485 = load i16, i16* %1484, align 2
  %1486 = zext i16 %1485 to i32
  %1487 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1488 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1487, i32 0, i32 30
  %1489 = load i16, i16* %1488, align 4
  %1490 = zext i16 %1489 to i32
  %1491 = sub nsw i32 %1486, %1490
  %1492 = icmp sgt i32 %1491, 1
  br i1 %1492, label %1493, label %1541

; <label>:1493:                                   ; preds = %1480
  %1494 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1495 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1494, i32 0, i32 54
  %1496 = getelementptr inbounds [3 x i16*], [3 x i16*]* %1495, i64 0, i64 1
  %1497 = load i16*, i16** %1496, align 8
  %1498 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1499 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1498, i32 0, i32 0
  %1500 = load i32, i32* %1499, align 8
  %1501 = icmp ule i32 %1500, 40
  br i1 %1501, label %1502, label %1508

; <label>:1502:                                   ; preds = %1493
  %1503 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1498, i32 0, i32 3
  %1504 = load i8*, i8** %1503, align 8
  %1505 = getelementptr i8, i8* %1504, i32 %1500
  %1506 = bitcast i8* %1505 to i16***
  %1507 = add i32 %1500, 8
  store i32 %1507, i32* %1499, align 8
  br label %1514

; <label>:1508:                                   ; preds = %1493
  %pgocount120 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 148)
  %1509 = add i64 %pgocount120, 1
  store i64 %1509, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 148)
  %1510 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1498, i32 0, i32 2
  %1511 = load i8*, i8** %1510, align 8
  %1512 = bitcast i8* %1511 to i16***
  %1513 = getelementptr i8, i8* %1511, i32 8
  store i8* %1513, i8** %1510, align 8
  br label %1514

; <label>:1514:                                   ; preds = %1508, %1502
  %1515 = phi i16*** [ %1506, %1502 ], [ %1512, %1508 ]
  %1516 = load i16**, i16*** %1515, align 8
  store i16* %1497, i16** %1516, align 8
  %1517 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1518 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1517, i32 0, i32 54
  %1519 = getelementptr inbounds [3 x i16*], [3 x i16*]* %1518, i64 0, i64 2
  %1520 = load i16*, i16** %1519, align 8
  %1521 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1522 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1521, i32 0, i32 0
  %1523 = load i32, i32* %1522, align 8
  %1524 = icmp ule i32 %1523, 40
  br i1 %1524, label %1525, label %1532

; <label>:1525:                                   ; preds = %1514
  %pgocount121 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 149)
  %1526 = add i64 %pgocount121, 1
  store i64 %1526, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 149)
  %1527 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1521, i32 0, i32 3
  %1528 = load i8*, i8** %1527, align 8
  %1529 = getelementptr i8, i8* %1528, i32 %1523
  %1530 = bitcast i8* %1529 to i16***
  %1531 = add i32 %1523, 8
  store i32 %1531, i32* %1522, align 8
  br label %1538

; <label>:1532:                                   ; preds = %1514
  %pgocount122 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 150)
  %1533 = add i64 %pgocount122, 1
  store i64 %1533, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 150)
  %1534 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1521, i32 0, i32 2
  %1535 = load i8*, i8** %1534, align 8
  %1536 = bitcast i8* %1535 to i16***
  %1537 = getelementptr i8, i8* %1535, i32 8
  store i8* %1537, i8** %1534, align 8
  br label %1538

; <label>:1538:                                   ; preds = %1532, %1525
  %1539 = phi i16*** [ %1530, %1525 ], [ %1536, %1532 ]
  %1540 = load i16**, i16*** %1539, align 8
  store i16* %1520, i16** %1540, align 8
  br label %1541

; <label>:1541:                                   ; preds = %1538, %1480
  br label %2031

; <label>:1542:                                   ; preds = %3
  %1543 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1544 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1543, i32 0, i32 53
  %1545 = load float*, float** %1544, align 8
  %1546 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1547 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1546, i32 0, i32 0
  %1548 = load i32, i32* %1547, align 8
  %1549 = icmp ule i32 %1548, 40
  br i1 %1549, label %1550, label %1557

; <label>:1550:                                   ; preds = %1542
  %pgocount123 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 112)
  %1551 = add i64 %pgocount123, 1
  store i64 %1551, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 112)
  %1552 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1546, i32 0, i32 3
  %1553 = load i8*, i8** %1552, align 8
  %1554 = getelementptr i8, i8* %1553, i32 %1548
  %1555 = bitcast i8* %1554 to float***
  %1556 = add i32 %1548, 8
  store i32 %1556, i32* %1547, align 8
  br label %1563

; <label>:1557:                                   ; preds = %1542
  %pgocount124 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 113)
  %1558 = add i64 %pgocount124, 1
  store i64 %1558, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 113)
  %1559 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1546, i32 0, i32 2
  %1560 = load i8*, i8** %1559, align 8
  %1561 = bitcast i8* %1560 to float***
  %1562 = getelementptr i8, i8* %1560, i32 8
  store i8* %1562, i8** %1559, align 8
  br label %1563

; <label>:1563:                                   ; preds = %1557, %1550
  %1564 = phi float*** [ %1555, %1550 ], [ %1561, %1557 ]
  %1565 = load float**, float*** %1564, align 8
  store float* %1545, float** %1565, align 8
  br label %2031

; <label>:1566:                                   ; preds = %3
  %1567 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1568 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1567, i32 0, i32 55
  %1569 = load i16, i16* %1568, align 8
  %1570 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1571 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1570, i32 0, i32 0
  %1572 = load i32, i32* %1571, align 8
  %1573 = icmp ule i32 %1572, 40
  br i1 %1573, label %1574, label %1581

; <label>:1574:                                   ; preds = %1566
  %pgocount125 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 114)
  %1575 = add i64 %pgocount125, 1
  store i64 %1575, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 114)
  %1576 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1570, i32 0, i32 3
  %1577 = load i8*, i8** %1576, align 8
  %1578 = getelementptr i8, i8* %1577, i32 %1572
  %1579 = bitcast i8* %1578 to i16**
  %1580 = add i32 %1572, 8
  store i32 %1580, i32* %1571, align 8
  br label %1587

; <label>:1581:                                   ; preds = %1566
  %pgocount126 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 115)
  %1582 = add i64 %pgocount126, 1
  store i64 %1582, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 115)
  %1583 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1570, i32 0, i32 2
  %1584 = load i8*, i8** %1583, align 8
  %1585 = bitcast i8* %1584 to i16**
  %1586 = getelementptr i8, i8* %1584, i32 8
  store i8* %1586, i8** %1583, align 8
  br label %1587

; <label>:1587:                                   ; preds = %1581, %1574
  %1588 = phi i16** [ %1579, %1574 ], [ %1585, %1581 ]
  %1589 = load i16*, i16** %1588, align 8
  store i16 %1569, i16* %1589, align 2
  br label %2031

; <label>:1590:                                   ; preds = %3
  %1591 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1592 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1591, i32 0, i32 57
  %1593 = getelementptr inbounds [2 x i16], [2 x i16]* %1592, i64 0, i64 0
  %1594 = load i16, i16* %1593, align 4
  %1595 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1596 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1595, i32 0, i32 0
  %1597 = load i32, i32* %1596, align 8
  %1598 = icmp ule i32 %1597, 40
  br i1 %1598, label %1599, label %1605

; <label>:1599:                                   ; preds = %1590
  %1600 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1595, i32 0, i32 3
  %1601 = load i8*, i8** %1600, align 8
  %1602 = getelementptr i8, i8* %1601, i32 %1597
  %1603 = bitcast i8* %1602 to i16**
  %1604 = add i32 %1597, 8
  store i32 %1604, i32* %1596, align 8
  br label %1611

; <label>:1605:                                   ; preds = %1590
  %pgocount127 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 116)
  %1606 = add i64 %pgocount127, 1
  store i64 %1606, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 116)
  %1607 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1595, i32 0, i32 2
  %1608 = load i8*, i8** %1607, align 8
  %1609 = bitcast i8* %1608 to i16**
  %1610 = getelementptr i8, i8* %1608, i32 8
  store i8* %1610, i8** %1607, align 8
  br label %1611

; <label>:1611:                                   ; preds = %1605, %1599
  %1612 = phi i16** [ %1603, %1599 ], [ %1609, %1605 ]
  %1613 = load i16*, i16** %1612, align 8
  store i16 %1594, i16* %1613, align 2
  %1614 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1615 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1614, i32 0, i32 57
  %1616 = getelementptr inbounds [2 x i16], [2 x i16]* %1615, i64 0, i64 1
  %1617 = load i16, i16* %1616, align 2
  %1618 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1619 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1618, i32 0, i32 0
  %1620 = load i32, i32* %1619, align 8
  %1621 = icmp ule i32 %1620, 40
  br i1 %1621, label %1622, label %1629

; <label>:1622:                                   ; preds = %1611
  %pgocount128 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 117)
  %1623 = add i64 %pgocount128, 1
  store i64 %1623, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 117)
  %1624 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1618, i32 0, i32 3
  %1625 = load i8*, i8** %1624, align 8
  %1626 = getelementptr i8, i8* %1625, i32 %1620
  %1627 = bitcast i8* %1626 to i16**
  %1628 = add i32 %1620, 8
  store i32 %1628, i32* %1619, align 8
  br label %1635

; <label>:1629:                                   ; preds = %1611
  %pgocount129 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 118)
  %1630 = add i64 %pgocount129, 1
  store i64 %1630, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 118)
  %1631 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1618, i32 0, i32 2
  %1632 = load i8*, i8** %1631, align 8
  %1633 = bitcast i8* %1632 to i16**
  %1634 = getelementptr i8, i8* %1632, i32 8
  store i8* %1634, i8** %1631, align 8
  br label %1635

; <label>:1635:                                   ; preds = %1629, %1622
  %1636 = phi i16** [ %1627, %1622 ], [ %1633, %1629 ]
  %1637 = load i16*, i16** %1636, align 8
  store i16 %1617, i16* %1637, align 2
  br label %2031

; <label>:1638:                                   ; preds = %3
  %1639 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1640 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1639, i32 0, i32 59
  %1641 = load i8*, i8** %1640, align 8
  %1642 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1643 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1642, i32 0, i32 0
  %1644 = load i32, i32* %1643, align 8
  %1645 = icmp ule i32 %1644, 40
  br i1 %1645, label %1646, label %1653

; <label>:1646:                                   ; preds = %1638
  %pgocount130 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 119)
  %1647 = add i64 %pgocount130, 1
  store i64 %1647, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 119)
  %1648 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1642, i32 0, i32 3
  %1649 = load i8*, i8** %1648, align 8
  %1650 = getelementptr i8, i8* %1649, i32 %1644
  %1651 = bitcast i8* %1650 to i8***
  %1652 = add i32 %1644, 8
  store i32 %1652, i32* %1643, align 8
  br label %1659

; <label>:1653:                                   ; preds = %1638
  %pgocount131 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 120)
  %1654 = add i64 %pgocount131, 1
  store i64 %1654, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 120)
  %1655 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1642, i32 0, i32 2
  %1656 = load i8*, i8** %1655, align 8
  %1657 = bitcast i8* %1656 to i8***
  %1658 = getelementptr i8, i8* %1656, i32 8
  store i8* %1658, i8** %1655, align 8
  br label %1659

; <label>:1659:                                   ; preds = %1653, %1646
  %1660 = phi i8*** [ %1651, %1646 ], [ %1657, %1653 ]
  %1661 = load i8**, i8*** %1660, align 8
  store i8* %1641, i8** %1661, align 8
  br label %2031

; <label>:1662:                                   ; preds = %3
  %1663 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1664 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1663, i32 0, i32 56
  %1665 = load i16, i16* %1664, align 2
  %1666 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1667 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1666, i32 0, i32 0
  %1668 = load i32, i32* %1667, align 8
  %1669 = icmp ule i32 %1668, 40
  br i1 %1669, label %1670, label %1677

; <label>:1670:                                   ; preds = %1662
  %pgocount132 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 121)
  %1671 = add i64 %pgocount132, 1
  store i64 %1671, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 121)
  %1672 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1666, i32 0, i32 3
  %1673 = load i8*, i8** %1672, align 8
  %1674 = getelementptr i8, i8* %1673, i32 %1668
  %1675 = bitcast i8* %1674 to i16**
  %1676 = add i32 %1668, 8
  store i32 %1676, i32* %1667, align 8
  br label %1683

; <label>:1677:                                   ; preds = %1662
  %pgocount133 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 122)
  %1678 = add i64 %pgocount133, 1
  store i64 %1678, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 122)
  %1679 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1666, i32 0, i32 2
  %1680 = load i8*, i8** %1679, align 8
  %1681 = bitcast i8* %1680 to i16**
  %1682 = getelementptr i8, i8* %1680, i32 8
  store i8* %1682, i8** %1679, align 8
  br label %1683

; <label>:1683:                                   ; preds = %1677, %1670
  %1684 = phi i16** [ %1675, %1670 ], [ %1681, %1677 ]
  %1685 = load i16*, i16** %1684, align 8
  store i16 %1665, i16* %1685, align 2
  br label %2031

; <label>:1686:                                   ; preds = %3
  %1687 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1688 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1687, i32 0, i32 60
  %1689 = load i8*, i8** %1688, align 8
  %1690 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1691 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1690, i32 0, i32 0
  %1692 = load i32, i32* %1691, align 8
  %1693 = icmp ule i32 %1692, 40
  br i1 %1693, label %1694, label %1701

; <label>:1694:                                   ; preds = %1686
  %pgocount134 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 123)
  %1695 = add i64 %pgocount134, 1
  store i64 %1695, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 123)
  %1696 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1690, i32 0, i32 3
  %1697 = load i8*, i8** %1696, align 8
  %1698 = getelementptr i8, i8* %1697, i32 %1692
  %1699 = bitcast i8* %1698 to i8***
  %1700 = add i32 %1692, 8
  store i32 %1700, i32* %1691, align 8
  br label %1707

; <label>:1701:                                   ; preds = %1686
  %pgocount135 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 124)
  %1702 = add i64 %pgocount135, 1
  store i64 %1702, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 124)
  %1703 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1690, i32 0, i32 2
  %1704 = load i8*, i8** %1703, align 8
  %1705 = bitcast i8* %1704 to i8***
  %1706 = getelementptr i8, i8* %1704, i32 8
  store i8* %1706, i8** %1703, align 8
  br label %1707

; <label>:1707:                                   ; preds = %1701, %1694
  %1708 = phi i8*** [ %1699, %1694 ], [ %1705, %1701 ]
  %1709 = load i8**, i8*** %1708, align 8
  store i8* %1689, i8** %1709, align 8
  br label %2031

; <label>:1710:                                   ; preds = %3
  %1711 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1712 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1711, i32 0, i32 61
  %1713 = load i32, i32* %1712, align 8
  %1714 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1715 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1714, i32 0, i32 0
  %1716 = load i32, i32* %1715, align 8
  %1717 = icmp ule i32 %1716, 40
  br i1 %1717, label %1718, label %1724

; <label>:1718:                                   ; preds = %1710
  %1719 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1714, i32 0, i32 3
  %1720 = load i8*, i8** %1719, align 8
  %1721 = getelementptr i8, i8* %1720, i32 %1716
  %1722 = bitcast i8* %1721 to i32**
  %1723 = add i32 %1716, 8
  store i32 %1723, i32* %1715, align 8
  br label %1730

; <label>:1724:                                   ; preds = %1710
  %pgocount136 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 125)
  %1725 = add i64 %pgocount136, 1
  store i64 %1725, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 125)
  %1726 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1714, i32 0, i32 2
  %1727 = load i8*, i8** %1726, align 8
  %1728 = bitcast i8* %1727 to i32**
  %1729 = getelementptr i8, i8* %1727, i32 8
  store i8* %1729, i8** %1726, align 8
  br label %1730

; <label>:1730:                                   ; preds = %1724, %1718
  %1731 = phi i32** [ %1722, %1718 ], [ %1728, %1724 ]
  %1732 = load i32*, i32** %1731, align 8
  store i32 %1713, i32* %1732, align 4
  %1733 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1734 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1733, i32 0, i32 62
  %1735 = load i8*, i8** %1734, align 8
  %1736 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1737 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1736, i32 0, i32 0
  %1738 = load i32, i32* %1737, align 8
  %1739 = icmp ule i32 %1738, 40
  br i1 %1739, label %1740, label %1747

; <label>:1740:                                   ; preds = %1730
  %pgocount137 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 126)
  %1741 = add i64 %pgocount137, 1
  store i64 %1741, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 126)
  %1742 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1736, i32 0, i32 3
  %1743 = load i8*, i8** %1742, align 8
  %1744 = getelementptr i8, i8* %1743, i32 %1738
  %1745 = bitcast i8* %1744 to i8***
  %1746 = add i32 %1738, 8
  store i32 %1746, i32* %1737, align 8
  br label %1753

; <label>:1747:                                   ; preds = %1730
  %pgocount138 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 127)
  %1748 = add i64 %pgocount138, 1
  store i64 %1748, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 127)
  %1749 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1736, i32 0, i32 2
  %1750 = load i8*, i8** %1749, align 8
  %1751 = bitcast i8* %1750 to i8***
  %1752 = getelementptr i8, i8* %1750, i32 8
  store i8* %1752, i8** %1749, align 8
  br label %1753

; <label>:1753:                                   ; preds = %1747, %1740
  %1754 = phi i8*** [ %1745, %1740 ], [ %1751, %1747 ]
  %1755 = load i8**, i8*** %1754, align 8
  store i8* %1735, i8** %1755, align 8
  br label %2031

; <label>:1756:                                   ; preds = %3
  %1757 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1758 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1757, i32 0, i32 63
  %1759 = load i32, i32* %1758, align 8
  %1760 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1761 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1760, i32 0, i32 0
  %1762 = load i32, i32* %1761, align 8
  %1763 = icmp ule i32 %1762, 40
  br i1 %1763, label %1764, label %1770

; <label>:1764:                                   ; preds = %1756
  %1765 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1760, i32 0, i32 3
  %1766 = load i8*, i8** %1765, align 8
  %1767 = getelementptr i8, i8* %1766, i32 %1762
  %1768 = bitcast i8* %1767 to i32**
  %1769 = add i32 %1762, 8
  store i32 %1769, i32* %1761, align 8
  br label %1776

; <label>:1770:                                   ; preds = %1756
  %pgocount139 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 128)
  %1771 = add i64 %pgocount139, 1
  store i64 %1771, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 128)
  %1772 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1760, i32 0, i32 2
  %1773 = load i8*, i8** %1772, align 8
  %1774 = bitcast i8* %1773 to i32**
  %1775 = getelementptr i8, i8* %1773, i32 8
  store i8* %1775, i8** %1772, align 8
  br label %1776

; <label>:1776:                                   ; preds = %1770, %1764
  %1777 = phi i32** [ %1768, %1764 ], [ %1774, %1770 ]
  %1778 = load i32*, i32** %1777, align 8
  store i32 %1759, i32* %1778, align 4
  %1779 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1780 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1779, i32 0, i32 64
  %1781 = load i8*, i8** %1780, align 8
  %1782 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1783 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1782, i32 0, i32 0
  %1784 = load i32, i32* %1783, align 8
  %1785 = icmp ule i32 %1784, 40
  br i1 %1785, label %1786, label %1793

; <label>:1786:                                   ; preds = %1776
  %pgocount140 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 129)
  %1787 = add i64 %pgocount140, 1
  store i64 %1787, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 129)
  %1788 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1782, i32 0, i32 3
  %1789 = load i8*, i8** %1788, align 8
  %1790 = getelementptr i8, i8* %1789, i32 %1784
  %1791 = bitcast i8* %1790 to i8***
  %1792 = add i32 %1784, 8
  store i32 %1792, i32* %1783, align 8
  br label %1799

; <label>:1793:                                   ; preds = %1776
  %pgocount141 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 130)
  %1794 = add i64 %pgocount141, 1
  store i64 %1794, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 130)
  %1795 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1782, i32 0, i32 2
  %1796 = load i8*, i8** %1795, align 8
  %1797 = bitcast i8* %1796 to i8***
  %1798 = getelementptr i8, i8* %1796, i32 8
  store i8* %1798, i8** %1795, align 8
  br label %1799

; <label>:1799:                                   ; preds = %1793, %1786
  %1800 = phi i8*** [ %1791, %1786 ], [ %1797, %1793 ]
  %1801 = load i8**, i8*** %1800, align 8
  store i8* %1781, i8** %1801, align 8
  br label %2031

; <label>:1802:                                   ; preds = %3
  %1803 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1804 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1803, i32 0, i32 65
  %1805 = load i32, i32* %1804, align 8
  %1806 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1807 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1806, i32 0, i32 0
  %1808 = load i32, i32* %1807, align 8
  %1809 = icmp ule i32 %1808, 40
  br i1 %1809, label %1810, label %1816

; <label>:1810:                                   ; preds = %1802
  %1811 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1806, i32 0, i32 3
  %1812 = load i8*, i8** %1811, align 8
  %1813 = getelementptr i8, i8* %1812, i32 %1808
  %1814 = bitcast i8* %1813 to i32**
  %1815 = add i32 %1808, 8
  store i32 %1815, i32* %1807, align 8
  br label %1822

; <label>:1816:                                   ; preds = %1802
  %pgocount142 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 131)
  %1817 = add i64 %pgocount142, 1
  store i64 %1817, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 131)
  %1818 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1806, i32 0, i32 2
  %1819 = load i8*, i8** %1818, align 8
  %1820 = bitcast i8* %1819 to i32**
  %1821 = getelementptr i8, i8* %1819, i32 8
  store i8* %1821, i8** %1818, align 8
  br label %1822

; <label>:1822:                                   ; preds = %1816, %1810
  %1823 = phi i32** [ %1814, %1810 ], [ %1820, %1816 ]
  %1824 = load i32*, i32** %1823, align 8
  store i32 %1805, i32* %1824, align 4
  %1825 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1826 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1825, i32 0, i32 66
  %1827 = load i8*, i8** %1826, align 8
  %1828 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1829 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1828, i32 0, i32 0
  %1830 = load i32, i32* %1829, align 8
  %1831 = icmp ule i32 %1830, 40
  br i1 %1831, label %1832, label %1839

; <label>:1832:                                   ; preds = %1822
  %pgocount143 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 132)
  %1833 = add i64 %pgocount143, 1
  store i64 %1833, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 132)
  %1834 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1828, i32 0, i32 3
  %1835 = load i8*, i8** %1834, align 8
  %1836 = getelementptr i8, i8* %1835, i32 %1830
  %1837 = bitcast i8* %1836 to i8***
  %1838 = add i32 %1830, 8
  store i32 %1838, i32* %1829, align 8
  br label %1845

; <label>:1839:                                   ; preds = %1822
  %pgocount144 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 133)
  %1840 = add i64 %pgocount144, 1
  store i64 %1840, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 133)
  %1841 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1828, i32 0, i32 2
  %1842 = load i8*, i8** %1841, align 8
  %1843 = bitcast i8* %1842 to i8***
  %1844 = getelementptr i8, i8* %1842, i32 8
  store i8* %1844, i8** %1841, align 8
  br label %1845

; <label>:1845:                                   ; preds = %1839, %1832
  %1846 = phi i8*** [ %1837, %1832 ], [ %1843, %1839 ]
  %1847 = load i8**, i8*** %1846, align 8
  store i8* %1827, i8** %1847, align 8
  br label %2031

; <label>:1848:                                   ; preds = %3
  %1849 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1850 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1849, i32 0, i32 67
  %1851 = load i32, i32* %1850, align 8
  %1852 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1853 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1852, i32 0, i32 0
  %1854 = load i32, i32* %1853, align 8
  %1855 = icmp ule i32 %1854, 40
  br i1 %1855, label %1856, label %1863

; <label>:1856:                                   ; preds = %1848
  %pgocount145 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 134)
  %1857 = add i64 %pgocount145, 1
  store i64 %1857, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 134)
  %1858 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1852, i32 0, i32 3
  %1859 = load i8*, i8** %1858, align 8
  %1860 = getelementptr i8, i8* %1859, i32 %1854
  %1861 = bitcast i8* %1860 to i32**
  %1862 = add i32 %1854, 8
  store i32 %1862, i32* %1853, align 8
  br label %1869

; <label>:1863:                                   ; preds = %1848
  %pgocount146 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 135)
  %1864 = add i64 %pgocount146, 1
  store i64 %1864, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 135)
  %1865 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1852, i32 0, i32 2
  %1866 = load i8*, i8** %1865, align 8
  %1867 = bitcast i8* %1866 to i32**
  %1868 = getelementptr i8, i8* %1866, i32 8
  store i8* %1868, i8** %1865, align 8
  br label %1869

; <label>:1869:                                   ; preds = %1863, %1856
  %1870 = phi i32** [ %1861, %1856 ], [ %1867, %1863 ]
  %1871 = load i32*, i32** %1870, align 8
  store i32 %1851, i32* %1871, align 4
  br label %2031

; <label>:1872:                                   ; preds = %3
  %1873 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1874 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1873, i32 0, i32 68
  %1875 = load i32, i32* %1874, align 4
  %1876 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1877 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1876, i32 0, i32 0
  %1878 = load i32, i32* %1877, align 8
  %1879 = icmp ule i32 %1878, 40
  br i1 %1879, label %1880, label %1887

; <label>:1880:                                   ; preds = %1872
  %pgocount147 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 136)
  %1881 = add i64 %pgocount147, 1
  store i64 %1881, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 136)
  %1882 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1876, i32 0, i32 3
  %1883 = load i8*, i8** %1882, align 8
  %1884 = getelementptr i8, i8* %1883, i32 %1878
  %1885 = bitcast i8* %1884 to i32**
  %1886 = add i32 %1878, 8
  store i32 %1886, i32* %1877, align 8
  br label %1893

; <label>:1887:                                   ; preds = %1872
  %pgocount148 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 137)
  %1888 = add i64 %pgocount148, 1
  store i64 %1888, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 137)
  %1889 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1876, i32 0, i32 2
  %1890 = load i8*, i8** %1889, align 8
  %1891 = bitcast i8* %1890 to i32**
  %1892 = getelementptr i8, i8* %1890, i32 8
  store i8* %1892, i8** %1889, align 8
  br label %1893

; <label>:1893:                                   ; preds = %1887, %1880
  %1894 = phi i32** [ %1885, %1880 ], [ %1891, %1887 ]
  %1895 = load i32*, i32** %1894, align 8
  store i32 %1875, i32* %1895, align 4
  br label %2031

; <label>:1896:                                   ; preds = %3
  %1897 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1898 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1897, i32 0, i32 69
  %1899 = load i8*, i8** %1898, align 8
  %1900 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1901 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1900, i32 0, i32 0
  %1902 = load i32, i32* %1901, align 8
  %1903 = icmp ule i32 %1902, 40
  br i1 %1903, label %1904, label %1911

; <label>:1904:                                   ; preds = %1896
  %pgocount149 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 138)
  %1905 = add i64 %pgocount149, 1
  store i64 %1905, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 138)
  %1906 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1900, i32 0, i32 3
  %1907 = load i8*, i8** %1906, align 8
  %1908 = getelementptr i8, i8* %1907, i32 %1902
  %1909 = bitcast i8* %1908 to i8***
  %1910 = add i32 %1902, 8
  store i32 %1910, i32* %1901, align 8
  br label %1917

; <label>:1911:                                   ; preds = %1896
  %pgocount150 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 139)
  %1912 = add i64 %pgocount150, 1
  store i64 %1912, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 139)
  %1913 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1900, i32 0, i32 2
  %1914 = load i8*, i8** %1913, align 8
  %1915 = bitcast i8* %1914 to i8***
  %1916 = getelementptr i8, i8* %1914, i32 8
  store i8* %1916, i8** %1913, align 8
  br label %1917

; <label>:1917:                                   ; preds = %1911, %1904
  %1918 = phi i8*** [ %1909, %1904 ], [ %1915, %1911 ]
  %1919 = load i8**, i8*** %1918, align 8
  store i8* %1899, i8** %1919, align 8
  br label %2031

; <label>:1920:                                   ; preds = %3
  %1921 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1922 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1921, i32 0, i32 70
  %1923 = load i8*, i8** %1922, align 8
  %1924 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1925 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1924, i32 0, i32 0
  %1926 = load i32, i32* %1925, align 8
  %1927 = icmp ule i32 %1926, 40
  br i1 %1927, label %1928, label %1935

; <label>:1928:                                   ; preds = %1920
  %pgocount151 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 140)
  %1929 = add i64 %pgocount151, 1
  store i64 %1929, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 140)
  %1930 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1924, i32 0, i32 3
  %1931 = load i8*, i8** %1930, align 8
  %1932 = getelementptr i8, i8* %1931, i32 %1926
  %1933 = bitcast i8* %1932 to i8***
  %1934 = add i32 %1926, 8
  store i32 %1934, i32* %1925, align 8
  br label %1941

; <label>:1935:                                   ; preds = %1920
  %pgocount152 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 141)
  %1936 = add i64 %pgocount152, 1
  store i64 %1936, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 141)
  %1937 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1924, i32 0, i32 2
  %1938 = load i8*, i8** %1937, align 8
  %1939 = bitcast i8* %1938 to i8***
  %1940 = getelementptr i8, i8* %1938, i32 8
  store i8* %1940, i8** %1937, align 8
  br label %1941

; <label>:1941:                                   ; preds = %1935, %1928
  %1942 = phi i8*** [ %1933, %1928 ], [ %1939, %1935 ]
  %1943 = load i8**, i8*** %1942, align 8
  store i8* %1923, i8** %1943, align 8
  br label %2031

; <label>:1944:                                   ; preds = %3
  %1945 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1946 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1945, i32 0, i32 71
  %1947 = load float, float* %1946, align 8
  %1948 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1949 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1948, i32 0, i32 0
  %1950 = load i32, i32* %1949, align 8
  %1951 = icmp ule i32 %1950, 40
  br i1 %1951, label %1952, label %1959

; <label>:1952:                                   ; preds = %1944
  %pgocount153 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 142)
  %1953 = add i64 %pgocount153, 1
  store i64 %1953, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 142)
  %1954 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1948, i32 0, i32 3
  %1955 = load i8*, i8** %1954, align 8
  %1956 = getelementptr i8, i8* %1955, i32 %1950
  %1957 = bitcast i8* %1956 to float**
  %1958 = add i32 %1950, 8
  store i32 %1958, i32* %1949, align 8
  br label %1965

; <label>:1959:                                   ; preds = %1944
  %pgocount154 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 143)
  %1960 = add i64 %pgocount154, 1
  store i64 %1960, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 143)
  %1961 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1948, i32 0, i32 2
  %1962 = load i8*, i8** %1961, align 8
  %1963 = bitcast i8* %1962 to float**
  %1964 = getelementptr i8, i8* %1962, i32 8
  store i8* %1964, i8** %1961, align 8
  br label %1965

; <label>:1965:                                   ; preds = %1959, %1952
  %1966 = phi float** [ %1957, %1952 ], [ %1963, %1959 ]
  %1967 = load float*, float** %1966, align 8
  store float %1947, float* %1967, align 4
  br label %2031

; <label>:1968:                                   ; preds = %3
  %1969 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1970 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1969, i32 0, i32 72
  %1971 = load float*, float** %1970, align 8
  %1972 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1973 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1972, i32 0, i32 0
  %1974 = load i32, i32* %1973, align 8
  %1975 = icmp ule i32 %1974, 40
  br i1 %1975, label %1976, label %1983

; <label>:1976:                                   ; preds = %1968
  %pgocount155 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 144)
  %1977 = add i64 %pgocount155, 1
  store i64 %1977, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 144)
  %1978 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1972, i32 0, i32 3
  %1979 = load i8*, i8** %1978, align 8
  %1980 = getelementptr i8, i8* %1979, i32 %1974
  %1981 = bitcast i8* %1980 to float***
  %1982 = add i32 %1974, 8
  store i32 %1982, i32* %1973, align 8
  br label %1989

; <label>:1983:                                   ; preds = %1968
  %pgocount156 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 145)
  %1984 = add i64 %pgocount156, 1
  store i64 %1984, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 145)
  %1985 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1972, i32 0, i32 2
  %1986 = load i8*, i8** %1985, align 8
  %1987 = bitcast i8* %1986 to float***
  %1988 = getelementptr i8, i8* %1986, i32 8
  store i8* %1988, i8** %1985, align 8
  br label %1989

; <label>:1989:                                   ; preds = %1983, %1976
  %1990 = phi float*** [ %1981, %1976 ], [ %1987, %1983 ]
  %1991 = load float**, float*** %1990, align 8
  store float* %1971, float** %1991, align 8
  br label %2031

; <label>:1992:                                   ; preds = %3
  %1993 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %7, align 8
  %1994 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %1993, i32 0, i32 73
  %1995 = load float*, float** %1994, align 8
  %1996 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %1997 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1996, i32 0, i32 0
  %1998 = load i32, i32* %1997, align 8
  %1999 = icmp ule i32 %1998, 40
  br i1 %1999, label %2000, label %2007

; <label>:2000:                                   ; preds = %1992
  %pgocount157 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 146)
  %2001 = add i64 %pgocount157, 1
  store i64 %2001, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 146)
  %2002 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1996, i32 0, i32 3
  %2003 = load i8*, i8** %2002, align 8
  %2004 = getelementptr i8, i8* %2003, i32 %1998
  %2005 = bitcast i8* %2004 to float***
  %2006 = add i32 %1998, 8
  store i32 %2006, i32* %1997, align 8
  br label %2013

; <label>:2007:                                   ; preds = %1992
  %pgocount158 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 147)
  %2008 = add i64 %pgocount158, 1
  store i64 %2008, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 147)
  %2009 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1996, i32 0, i32 2
  %2010 = load i8*, i8** %2009, align 8
  %2011 = bitcast i8* %2010 to float***
  %2012 = getelementptr i8, i8* %2010, i32 8
  store i8* %2012, i8** %2009, align 8
  br label %2013

; <label>:2013:                                   ; preds = %2007, %2000
  %2014 = phi float*** [ %2005, %2000 ], [ %2011, %2007 ]
  %2015 = load float**, float*** %2014, align 8
  store float* %1995, float** %2015, align 8
  br label %2031

; <label>:2016:                                   ; preds = %3
  %pgocount159 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 7)
  %2017 = add i64 %pgocount159, 1
  store i64 %2017, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 7)
  %2018 = load %struct.tiff*, %struct.tiff** %4, align 8
  %2019 = getelementptr inbounds %struct.tiff, %struct.tiff* %2018, i32 0, i32 0
  %2020 = load i8*, i8** %2019, align 8
  %2021 = load i32, i32* %5, align 4
  %2022 = icmp ugt i32 %2021, 65535
  %2023 = zext i1 %2022 to i64
  %pgocount160 = load i64, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 159)
  %2024 = add i64 %pgocount160, %2023
  store i64 %2024, i64* getelementptr inbounds ([160 x i64], [160 x i64]* @__profc_tmp1.ll__TIFFVGetField, i64 0, i64 159)
  %2025 = select i1 %2022, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.6, i32 0, i32 0)
  %2026 = load %struct.tiff*, %struct.tiff** %4, align 8
  %2027 = load i32, i32* %5, align 4
  %2028 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %2026, i32 %2027)
  %2029 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %2028, i32 0, i32 7
  %2030 = load i8*, i8** %2029, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.13, i32 0, i32 0), i8* %2020, i8* %2025, i8* %2030)
  br label %2031

; <label>:2031:                                   ; preds = %2016, %2013, %1989, %1965, %1941, %1917, %1893, %1869, %1845, %1799, %1753, %1707, %1683, %1659, %1635, %1587, %1563, %1541, %1455, %1431, %1407, %1359, %1335, %1311, %1265, %1241, %1217, %1195, %1102, %1078, %1054, %1030, %984, %945, %921, %897, %826, %778, %730, %706, %682, %658, %634, %610, %586, %562, %538, %514, %490, %466, %442, %418, %394, %370, %346, %322, %298, %274, %250, %226, %202, %178, %154, %130, %106, %82, %58, %34
  ret i32 1
}

; Function Attrs: nounwind uwtable
define zeroext i16 @TIFFNumberOfDirectories(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %5 = load %struct.tiff*, %struct.tiff** %2, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %5, i32 0, i32 7
  %7 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %6, i32 0, i32 2
  %8 = load i32, i32* %7, align 4
  store i32 %8, i32* %3, align 4
  store i16 0, i16* %4, align 2
  br label %9

; <label>:9:                                      ; preds = %19, %1
  %10 = load i32, i32* %3, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFNumberOfDirectories, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFNumberOfDirectories, i64 0, i64 1)
  %14 = load %struct.tiff*, %struct.tiff** %2, align 8
  %15 = call i32 @TIFFAdvanceDirectory(%struct.tiff* %14, i32* %3, i32* null)
  %16 = icmp ne i32 %15, 0
  br label %17

; <label>:17:                                     ; preds = %12, %9
  %18 = phi i1 [ false, %9 ], [ %16, %12 ]
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFNumberOfDirectories, i64 0, i64 0)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFNumberOfDirectories, i64 0, i64 0)
  %21 = load i16, i16* %4, align 2
  %22 = add i16 %21, 1
  store i16 %22, i16* %4, align 2
  br label %9

; <label>:23:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFNumberOfDirectories, i64 0, i64 2)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFNumberOfDirectories, i64 0, i64 2)
  %25 = load i16, i16* %4, align 2
  ret i16 %25
}

; Function Attrs: nounwind uwtable
define internal i32 @TIFFAdvanceDirectory(%struct.tiff*, i32*, i32*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i16, align 2
  %9 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32* %2, i32** %7, align 8
  %10 = load %struct.tiff*, %struct.tiff** %5, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 3
  %12 = load i32, i32* %11, align 8
  %13 = and i32 %12, 2048
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %94

; <label>:15:                                     ; preds = %3
  %16 = load i32*, i32** %6, align 8
  %17 = load i32, i32* %16, align 4
  store i32 %17, i32* %9, align 4
  %18 = load i32, i32* %9, align 4
  %19 = sext i32 %18 to i64
  %20 = add i64 %19, 2
  %21 = trunc i64 %20 to i32
  %22 = load %struct.tiff*, %struct.tiff** %5, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %22, i32 0, i32 45
  %24 = load i32, i32* %23, align 8
  %25 = icmp sgt i32 %21, %24
  br i1 %25, label %26, label %31

; <label>:26:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 1)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 1)
  %28 = load %struct.tiff*, %struct.tiff** %5, align 8
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %28, i32 0, i32 0
  %30 = load i8*, i8** %29, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @TIFFAdvanceDirectory.module, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.20, i32 0, i32 0), i8* %30)
  store i32 0, i32* %4, align 4
  br label %192

; <label>:31:                                     ; preds = %15
  %32 = bitcast i16* %8 to i8*
  %33 = load %struct.tiff*, %struct.tiff** %5, align 8
  %34 = getelementptr inbounds %struct.tiff, %struct.tiff* %33, i32 0, i32 44
  %35 = load i8*, i8** %34, align 8
  %36 = load i32, i32* %9, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8* %35, i64 %37
  call void @_TIFFmemcpy(i8* %32, i8* %38, i32 2)
  %39 = load %struct.tiff*, %struct.tiff** %5, align 8
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %39, i32 0, i32 3
  %41 = load i32, i32* %40, align 8
  %42 = and i32 %41, 128
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %46

; <label>:44:                                     ; preds = %31
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 4)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 4)
  call void @TIFFSwabShort(i16* %8)
  br label %46

; <label>:46:                                     ; preds = %44, %31
  %47 = load i16, i16* %8, align 2
  %48 = zext i16 %47 to i64
  %49 = mul i64 %48, 12
  %50 = add i64 2, %49
  %51 = load i32, i32* %9, align 4
  %52 = sext i32 %51 to i64
  %53 = add i64 %52, %50
  %54 = trunc i64 %53 to i32
  store i32 %54, i32* %9, align 4
  %55 = load i32*, i32** %7, align 8
  %56 = icmp ne i32* %55, null
  br i1 %56, label %57, label %61

; <label>:57:                                     ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 3)
  %58 = add i64 %pgocount2, 1
  store i64 %58, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 3)
  %59 = load i32, i32* %9, align 4
  %60 = load i32*, i32** %7, align 8
  store i32 %59, i32* %60, align 4
  br label %61

; <label>:61:                                     ; preds = %57, %46
  %62 = load i32, i32* %9, align 4
  %63 = sext i32 %62 to i64
  %64 = add i64 %63, 4
  %65 = trunc i64 %64 to i32
  %66 = load %struct.tiff*, %struct.tiff** %5, align 8
  %67 = getelementptr inbounds %struct.tiff, %struct.tiff* %66, i32 0, i32 45
  %68 = load i32, i32* %67, align 8
  %69 = icmp sgt i32 %65, %68
  br i1 %69, label %70, label %75

; <label>:70:                                     ; preds = %61
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 5)
  %71 = add i64 %pgocount3, 1
  store i64 %71, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 5)
  %72 = load %struct.tiff*, %struct.tiff** %5, align 8
  %73 = getelementptr inbounds %struct.tiff, %struct.tiff* %72, i32 0, i32 0
  %74 = load i8*, i8** %73, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @TIFFAdvanceDirectory.module, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.21, i32 0, i32 0), i8* %74)
  store i32 0, i32* %4, align 4
  br label %192

; <label>:75:                                     ; preds = %61
  %76 = load i32*, i32** %6, align 8
  %77 = bitcast i32* %76 to i8*
  %78 = load %struct.tiff*, %struct.tiff** %5, align 8
  %79 = getelementptr inbounds %struct.tiff, %struct.tiff* %78, i32 0, i32 44
  %80 = load i8*, i8** %79, align 8
  %81 = load i32, i32* %9, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i8, i8* %80, i64 %82
  call void @_TIFFmemcpy(i8* %77, i8* %83, i32 4)
  %84 = load %struct.tiff*, %struct.tiff** %5, align 8
  %85 = getelementptr inbounds %struct.tiff, %struct.tiff* %84, i32 0, i32 3
  %86 = load i32, i32* %85, align 8
  %87 = and i32 %86, 128
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %89, label %92

; <label>:89:                                     ; preds = %75
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 7)
  %90 = add i64 %pgocount4, 1
  store i64 %90, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 7)
  %91 = load i32*, i32** %6, align 8
  call void @TIFFSwabLong(i32* %91)
  br label %92

; <label>:92:                                     ; preds = %89, %75
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 6)
  %93 = add i64 %pgocount5, 1
  store i64 %93, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 6)
  store i32 1, i32* %4, align 4
  br label %192

; <label>:94:                                     ; preds = %3
  %95 = load %struct.tiff*, %struct.tiff** %5, align 8
  %96 = getelementptr inbounds %struct.tiff, %struct.tiff* %95, i32 0, i32 51
  %97 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %96, align 8
  %98 = load %struct.tiff*, %struct.tiff** %5, align 8
  %99 = getelementptr inbounds %struct.tiff, %struct.tiff* %98, i32 0, i32 48
  %100 = load i8*, i8** %99, align 8
  %101 = load i32*, i32** %6, align 8
  %102 = load i32, i32* %101, align 4
  %103 = ptrtoint i32 (i8*, i32, i32)* %97 to i64
  call void @__llvm_profile_instrument_target(i64 %103, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFAdvanceDirectory to i8*), i32 0)
  %104 = call i32 %97(i8* %100, i32 %102, i32 0)
  %105 = load i32*, i32** %6, align 8
  %106 = load i32, i32* %105, align 4
  %107 = icmp eq i32 %104, %106
  br i1 %107, label %108, label %120

; <label>:108:                                    ; preds = %94
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 2)
  %109 = add i64 %pgocount6, 1
  store i64 %109, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 2)
  %110 = load %struct.tiff*, %struct.tiff** %5, align 8
  %111 = getelementptr inbounds %struct.tiff, %struct.tiff* %110, i32 0, i32 49
  %112 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %111, align 8
  %113 = load %struct.tiff*, %struct.tiff** %5, align 8
  %114 = getelementptr inbounds %struct.tiff, %struct.tiff* %113, i32 0, i32 48
  %115 = load i8*, i8** %114, align 8
  %116 = bitcast i16* %8 to i8*
  %117 = ptrtoint i32 (i8*, i8*, i32)* %112 to i64
  call void @__llvm_profile_instrument_target(i64 %117, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFAdvanceDirectory to i8*), i32 1)
  %118 = call i32 %112(i8* %115, i8* %116, i32 2)
  %119 = icmp eq i32 %118, 2
  br i1 %119, label %125, label %120

; <label>:120:                                    ; preds = %108, %94
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 0)
  %121 = add i64 %pgocount7, 1
  store i64 %121, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 0)
  %122 = load %struct.tiff*, %struct.tiff** %5, align 8
  %123 = getelementptr inbounds %struct.tiff, %struct.tiff* %122, i32 0, i32 0
  %124 = load i8*, i8** %123, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @TIFFAdvanceDirectory.module, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.20, i32 0, i32 0), i8* %124)
  store i32 0, i32* %4, align 4
  br label %192

; <label>:125:                                    ; preds = %108
  %126 = load %struct.tiff*, %struct.tiff** %5, align 8
  %127 = getelementptr inbounds %struct.tiff, %struct.tiff* %126, i32 0, i32 3
  %128 = load i32, i32* %127, align 8
  %129 = and i32 %128, 128
  %130 = icmp ne i32 %129, 0
  br i1 %130, label %131, label %133

; <label>:131:                                    ; preds = %125
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 8)
  %132 = add i64 %pgocount8, 1
  store i64 %132, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 8)
  call void @TIFFSwabShort(i16* %8)
  br label %133

; <label>:133:                                    ; preds = %131, %125
  %134 = load i32*, i32** %7, align 8
  %135 = icmp ne i32* %134, null
  br i1 %135, label %136, label %150

; <label>:136:                                    ; preds = %133
  %137 = load %struct.tiff*, %struct.tiff** %5, align 8
  %138 = getelementptr inbounds %struct.tiff, %struct.tiff* %137, i32 0, i32 51
  %139 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %138, align 8
  %140 = load %struct.tiff*, %struct.tiff** %5, align 8
  %141 = getelementptr inbounds %struct.tiff, %struct.tiff* %140, i32 0, i32 48
  %142 = load i8*, i8** %141, align 8
  %143 = load i16, i16* %8, align 2
  %144 = zext i16 %143 to i64
  %145 = mul i64 %144, 12
  %146 = trunc i64 %145 to i32
  %147 = ptrtoint i32 (i8*, i32, i32)* %139 to i64
  call void @__llvm_profile_instrument_target(i64 %147, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFAdvanceDirectory to i8*), i32 2)
  %148 = call i32 %139(i8* %142, i32 %146, i32 1)
  %149 = load i32*, i32** %7, align 8
  store i32 %148, i32* %149, align 4
  br label %164

; <label>:150:                                    ; preds = %133
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 11)
  %151 = add i64 %pgocount9, 1
  store i64 %151, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 11)
  %152 = load %struct.tiff*, %struct.tiff** %5, align 8
  %153 = getelementptr inbounds %struct.tiff, %struct.tiff* %152, i32 0, i32 51
  %154 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %153, align 8
  %155 = load %struct.tiff*, %struct.tiff** %5, align 8
  %156 = getelementptr inbounds %struct.tiff, %struct.tiff* %155, i32 0, i32 48
  %157 = load i8*, i8** %156, align 8
  %158 = load i16, i16* %8, align 2
  %159 = zext i16 %158 to i64
  %160 = mul i64 %159, 12
  %161 = trunc i64 %160 to i32
  %162 = ptrtoint i32 (i8*, i32, i32)* %154 to i64
  call void @__llvm_profile_instrument_target(i64 %162, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFAdvanceDirectory to i8*), i32 3)
  %163 = call i32 %154(i8* %157, i32 %161, i32 1)
  br label %164

; <label>:164:                                    ; preds = %150, %136
  %165 = load %struct.tiff*, %struct.tiff** %5, align 8
  %166 = getelementptr inbounds %struct.tiff, %struct.tiff* %165, i32 0, i32 49
  %167 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %166, align 8
  %168 = load %struct.tiff*, %struct.tiff** %5, align 8
  %169 = getelementptr inbounds %struct.tiff, %struct.tiff* %168, i32 0, i32 48
  %170 = load i8*, i8** %169, align 8
  %171 = load i32*, i32** %6, align 8
  %172 = bitcast i32* %171 to i8*
  %173 = ptrtoint i32 (i8*, i8*, i32)* %167 to i64
  call void @__llvm_profile_instrument_target(i64 %173, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFAdvanceDirectory to i8*), i32 4)
  %174 = call i32 %167(i8* %170, i8* %172, i32 4)
  %175 = icmp eq i32 %174, 4
  br i1 %175, label %181, label %176

; <label>:176:                                    ; preds = %164
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 9)
  %177 = add i64 %pgocount10, 1
  store i64 %177, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 9)
  %178 = load %struct.tiff*, %struct.tiff** %5, align 8
  %179 = getelementptr inbounds %struct.tiff, %struct.tiff* %178, i32 0, i32 0
  %180 = load i8*, i8** %179, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @TIFFAdvanceDirectory.module, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.21, i32 0, i32 0), i8* %180)
  store i32 0, i32* %4, align 4
  br label %192

; <label>:181:                                    ; preds = %164
  %182 = load %struct.tiff*, %struct.tiff** %5, align 8
  %183 = getelementptr inbounds %struct.tiff, %struct.tiff* %182, i32 0, i32 3
  %184 = load i32, i32* %183, align 8
  %185 = and i32 %184, 128
  %186 = icmp ne i32 %185, 0
  br i1 %186, label %187, label %190

; <label>:187:                                    ; preds = %181
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 12)
  %188 = add i64 %pgocount11, 1
  store i64 %188, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 12)
  %189 = load i32*, i32** %6, align 8
  call void @TIFFSwabLong(i32* %189)
  br label %190

; <label>:190:                                    ; preds = %187, %181
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 10)
  %191 = add i64 %pgocount12, 1
  store i64 %191, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_TIFFAdvanceDirectory, i64 0, i64 10)
  store i32 1, i32* %4, align 4
  br label %192

; <label>:192:                                    ; preds = %190, %176, %120, %92, %70, %26
  %193 = load i32, i32* %4, align 4
  ret i32 %193
}

; Function Attrs: nounwind uwtable
define i32 @TIFFSetDirectory(%struct.tiff*, i16 zeroext) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i16, align 2
  %6 = alloca i32, align 4
  %7 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i16 %1, i16* %5, align 2
  %8 = load %struct.tiff*, %struct.tiff** %4, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %8, i32 0, i32 7
  %10 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %9, i32 0, i32 2
  %11 = load i32, i32* %10, align 4
  store i32 %11, i32* %6, align 4
  %12 = load i16, i16* %5, align 2
  store i16 %12, i16* %7, align 2
  br label %13

; <label>:13:                                     ; preds = %30, %2
  %14 = load i16, i16* %7, align 2
  %15 = zext i16 %14 to i32
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %21

; <label>:17:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFSetDirectory, i64 0, i64 1)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFSetDirectory, i64 0, i64 1)
  %19 = load i32, i32* %6, align 4
  %20 = icmp ne i32 %19, 0
  br label %21

; <label>:21:                                     ; preds = %17, %13
  %22 = phi i1 [ false, %13 ], [ %20, %17 ]
  br i1 %22, label %23, label %34

; <label>:23:                                     ; preds = %21
  %24 = load %struct.tiff*, %struct.tiff** %4, align 8
  %25 = call i32 @TIFFAdvanceDirectory(%struct.tiff* %24, i32* %6, i32* null)
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %29, label %27

; <label>:27:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFSetDirectory, i64 0, i64 3)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFSetDirectory, i64 0, i64 3)
  store i32 0, i32* %3, align 4
  br label %50

; <label>:29:                                     ; preds = %23
  br label %30

; <label>:30:                                     ; preds = %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFSetDirectory, i64 0, i64 0)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFSetDirectory, i64 0, i64 0)
  %32 = load i16, i16* %7, align 2
  %33 = add i16 %32, -1
  store i16 %33, i16* %7, align 2
  br label %13

; <label>:34:                                     ; preds = %21
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFSetDirectory, i64 0, i64 2)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFSetDirectory, i64 0, i64 2)
  %36 = load i32, i32* %6, align 4
  %37 = load %struct.tiff*, %struct.tiff** %4, align 8
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %37, i32 0, i32 5
  store i32 %36, i32* %38, align 8
  %39 = load i16, i16* %5, align 2
  %40 = zext i16 %39 to i32
  %41 = load i16, i16* %7, align 2
  %42 = zext i16 %41 to i32
  %43 = sub nsw i32 %40, %42
  %44 = sub nsw i32 %43, 1
  %45 = trunc i32 %44 to i16
  %46 = load %struct.tiff*, %struct.tiff** %4, align 8
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %46, i32 0, i32 12
  store i16 %45, i16* %47, align 4
  %48 = load %struct.tiff*, %struct.tiff** %4, align 8
  %49 = call i32 @TIFFReadDirectory(%struct.tiff* %48)
  store i32 %49, i32* %3, align 4
  br label %50

; <label>:50:                                     ; preds = %34, %27
  %51 = load i32, i32* %3, align 4
  ret i32 %51
}

declare i32 @TIFFReadDirectory(%struct.tiff*) #1

; Function Attrs: nounwind uwtable
define i32 @TIFFSetSubDirectory(%struct.tiff*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSetSubDirectory, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSetSubDirectory, i64 0, i64 0)
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 5
  store i32 %6, i32* %8, align 8
  %9 = load %struct.tiff*, %struct.tiff** %4, align 8
  %10 = call i32 @TIFFReadDirectory(%struct.tiff* %9)
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @TIFFCurrentDirOffset(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFCurrentDirOffset, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFCurrentDirOffset, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 4
  %6 = load i32, i32* %5, align 4
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @TIFFLastDirectory(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFLastDirectory, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFLastDirectory, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 5
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 0
  %8 = zext i1 %7 to i32
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @TIFFUnlinkDirectory(%struct.tiff*, i16 zeroext) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i16, align 2
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i16 %1, i16* %5, align 2
  %9 = load %struct.tiff*, %struct.tiff** %4, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 2
  %11 = load i32, i32* %10, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 1)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 1)
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @TIFFUnlinkDirectory.module, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %3, align 4
  br label %127

; <label>:15:                                     ; preds = %2
  %16 = load %struct.tiff*, %struct.tiff** %4, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 7
  %18 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %17, i32 0, i32 2
  %19 = load i32, i32* %18, align 4
  store i32 %19, i32* %6, align 4
  store i32 4, i32* %7, align 4
  %20 = load i16, i16* %5, align 2
  %21 = zext i16 %20 to i32
  %22 = sub nsw i32 %21, 1
  %23 = trunc i32 %22 to i16
  store i16 %23, i16* %8, align 2
  br label %24

; <label>:24:                                     ; preds = %42, %15
  %25 = load i16, i16* %8, align 2
  %26 = zext i16 %25 to i32
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %28, label %46

; <label>:28:                                     ; preds = %24
  %29 = load i32, i32* %6, align 4
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %35

; <label>:31:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 2)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 2)
  %33 = load i16, i16* %5, align 2
  %34 = zext i16 %33 to i32
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @TIFFUnlinkDirectory.module, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i32 0, i32 0), i32 %34)
  store i32 0, i32* %3, align 4
  br label %127

; <label>:35:                                     ; preds = %28
  %36 = load %struct.tiff*, %struct.tiff** %4, align 8
  %37 = call i32 @TIFFAdvanceDirectory(%struct.tiff* %36, i32* %6, i32* %7)
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %41, label %39

; <label>:39:                                     ; preds = %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 3)
  %40 = add i64 %pgocount2, 1
  store i64 %40, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 3)
  store i32 0, i32* %3, align 4
  br label %127

; <label>:41:                                     ; preds = %35
  br label %42

; <label>:42:                                     ; preds = %41
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 0)
  %43 = add i64 %pgocount3, 1
  store i64 %43, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 0)
  %44 = load i16, i16* %8, align 2
  %45 = add i16 %44, -1
  store i16 %45, i16* %8, align 2
  br label %24

; <label>:46:                                     ; preds = %24
  %47 = load %struct.tiff*, %struct.tiff** %4, align 8
  %48 = call i32 @TIFFAdvanceDirectory(%struct.tiff* %47, i32* %6, i32* null)
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %52, label %50

; <label>:50:                                     ; preds = %46
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 4)
  %51 = add i64 %pgocount4, 1
  store i64 %51, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 4)
  store i32 0, i32* %3, align 4
  br label %127

; <label>:52:                                     ; preds = %46
  %53 = load %struct.tiff*, %struct.tiff** %4, align 8
  %54 = getelementptr inbounds %struct.tiff, %struct.tiff* %53, i32 0, i32 51
  %55 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %54, align 8
  %56 = load %struct.tiff*, %struct.tiff** %4, align 8
  %57 = getelementptr inbounds %struct.tiff, %struct.tiff* %56, i32 0, i32 48
  %58 = load i8*, i8** %57, align 8
  %59 = load i32, i32* %7, align 4
  %60 = ptrtoint i32 (i8*, i32, i32)* %55 to i64
  call void @__llvm_profile_instrument_target(i64 %60, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFUnlinkDirectory to i8*), i32 0)
  %61 = call i32 %55(i8* %58, i32 %59, i32 0)
  %62 = load %struct.tiff*, %struct.tiff** %4, align 8
  %63 = getelementptr inbounds %struct.tiff, %struct.tiff* %62, i32 0, i32 3
  %64 = load i32, i32* %63, align 8
  %65 = and i32 %64, 128
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %69

; <label>:67:                                     ; preds = %52
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 5)
  %68 = add i64 %pgocount5, 1
  store i64 %68, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 5)
  call void @TIFFSwabLong(i32* %6)
  br label %69

; <label>:69:                                     ; preds = %67, %52
  %70 = load %struct.tiff*, %struct.tiff** %4, align 8
  %71 = getelementptr inbounds %struct.tiff, %struct.tiff* %70, i32 0, i32 50
  %72 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %71, align 8
  %73 = load %struct.tiff*, %struct.tiff** %4, align 8
  %74 = getelementptr inbounds %struct.tiff, %struct.tiff* %73, i32 0, i32 48
  %75 = load i8*, i8** %74, align 8
  %76 = bitcast i32* %6 to i8*
  %77 = ptrtoint i32 (i8*, i8*, i32)* %72 to i64
  call void @__llvm_profile_instrument_target(i64 %77, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFUnlinkDirectory to i8*), i32 1)
  %78 = call i32 %72(i8* %75, i8* %76, i32 4)
  %79 = icmp eq i32 %78, 4
  br i1 %79, label %82, label %80

; <label>:80:                                     ; preds = %69
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 6)
  %81 = add i64 %pgocount6, 1
  store i64 %81, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 6)
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @TIFFUnlinkDirectory.module, i32 0, i32 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2, i32 0, i32 0))
  store i32 0, i32* %3, align 4
  br label %127

; <label>:82:                                     ; preds = %69
  %83 = load %struct.tiff*, %struct.tiff** %4, align 8
  %84 = getelementptr inbounds %struct.tiff, %struct.tiff* %83, i32 0, i32 34
  %85 = load void (%struct.tiff*)*, void (%struct.tiff*)** %84, align 8
  %86 = load %struct.tiff*, %struct.tiff** %4, align 8
  %87 = ptrtoint void (%struct.tiff*)* %85 to i64
  call void @__llvm_profile_instrument_target(i64 %87, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFUnlinkDirectory to i8*), i32 2)
  call void %85(%struct.tiff* %86)
  %88 = load %struct.tiff*, %struct.tiff** %4, align 8
  %89 = getelementptr inbounds %struct.tiff, %struct.tiff* %88, i32 0, i32 3
  %90 = load i32, i32* %89, align 8
  %91 = and i32 %90, 512
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %93, label %108

; <label>:93:                                     ; preds = %82
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 8)
  %94 = add i64 %pgocount7, 1
  store i64 %94, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 8)
  %95 = load %struct.tiff*, %struct.tiff** %4, align 8
  %96 = getelementptr inbounds %struct.tiff, %struct.tiff* %95, i32 0, i32 40
  %97 = load i8*, i8** %96, align 8
  %98 = icmp ne i8* %97, null
  br i1 %98, label %99, label %108

; <label>:99:                                     ; preds = %93
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 9)
  %100 = add i64 %pgocount8, 1
  store i64 %100, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 9)
  %101 = load %struct.tiff*, %struct.tiff** %4, align 8
  %102 = getelementptr inbounds %struct.tiff, %struct.tiff* %101, i32 0, i32 40
  %103 = load i8*, i8** %102, align 8
  call void @_TIFFfree(i8* %103)
  %104 = load %struct.tiff*, %struct.tiff** %4, align 8
  %105 = getelementptr inbounds %struct.tiff, %struct.tiff* %104, i32 0, i32 40
  store i8* null, i8** %105, align 8
  %106 = load %struct.tiff*, %struct.tiff** %4, align 8
  %107 = getelementptr inbounds %struct.tiff, %struct.tiff* %106, i32 0, i32 43
  store i32 0, i32* %107, align 8
  br label %108

; <label>:108:                                    ; preds = %99, %93, %82
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 7)
  %109 = add i64 %pgocount9, 1
  store i64 %109, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_TIFFUnlinkDirectory, i64 0, i64 7)
  %110 = load %struct.tiff*, %struct.tiff** %4, align 8
  %111 = getelementptr inbounds %struct.tiff, %struct.tiff* %110, i32 0, i32 3
  %112 = load i32, i32* %111, align 8
  %113 = and i32 %112, -4177
  store i32 %113, i32* %111, align 8
  %114 = load %struct.tiff*, %struct.tiff** %4, align 8
  call void @TIFFFreeDirectory(%struct.tiff* %114)
  %115 = load %struct.tiff*, %struct.tiff** %4, align 8
  %116 = call i32 @TIFFDefaultDirectory(%struct.tiff* %115)
  %117 = load %struct.tiff*, %struct.tiff** %4, align 8
  %118 = getelementptr inbounds %struct.tiff, %struct.tiff* %117, i32 0, i32 4
  store i32 0, i32* %118, align 4
  %119 = load %struct.tiff*, %struct.tiff** %4, align 8
  %120 = getelementptr inbounds %struct.tiff, %struct.tiff* %119, i32 0, i32 5
  store i32 0, i32* %120, align 8
  %121 = load %struct.tiff*, %struct.tiff** %4, align 8
  %122 = getelementptr inbounds %struct.tiff, %struct.tiff* %121, i32 0, i32 14
  store i32 0, i32* %122, align 4
  %123 = load %struct.tiff*, %struct.tiff** %4, align 8
  %124 = getelementptr inbounds %struct.tiff, %struct.tiff* %123, i32 0, i32 11
  store i32 -1, i32* %124, align 8
  %125 = load %struct.tiff*, %struct.tiff** %4, align 8
  %126 = getelementptr inbounds %struct.tiff, %struct.tiff* %125, i32 0, i32 13
  store i32 -1, i32* %126, align 8
  store i32 1, i32* %3, align 4
  br label %127

; <label>:127:                                    ; preds = %108, %80, %50, %39, %31, %13
  %128 = load i32, i32* %3, align 4
  ret i32 %128
}

declare void @TIFFError(i8*, i8*, ...) #1

declare void @TIFFSwabLong(i32*) #1

; Function Attrs: nounwind uwtable
define i32 @TIFFReassignTagToIgnore(i32, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  %8 = load i32, i32* %4, align 4
  switch i32 %8, label %63 [
    i32 0, label %9
    i32 1, label %40
    i32 2, label %61
  ]

; <label>:9:                                      ; preds = %2
  %10 = load i32, i32* @TIFFReassignTagToIgnore.tagcount, align 4
  %11 = icmp slt i32 %10, 94
  br i1 %11, label %12, label %38

; <label>:12:                                     ; preds = %9
  store i32 0, i32* %7, align 4
  br label %13

; <label>:13:                                     ; preds = %27, %12
  %14 = load i32, i32* %7, align 4
  %15 = load i32, i32* @TIFFReassignTagToIgnore.tagcount, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %31

; <label>:17:                                     ; preds = %13
  %18 = load i32, i32* %7, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [95 x i32], [95 x i32]* @TIFFReassignTagToIgnore.TIFFignoretags, i64 0, i64 %19
  %21 = load i32, i32* %20, align 4
  %22 = load i32, i32* %5, align 4
  %23 = icmp eq i32 %21, %22
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 8)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 8)
  store i32 1, i32* %3, align 4
  br label %66

; <label>:26:                                     ; preds = %17
  br label %27

; <label>:27:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 1)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 1)
  %29 = load i32, i32* %7, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %7, align 4
  br label %13

; <label>:31:                                     ; preds = %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 7)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 7)
  %33 = load i32, i32* %5, align 4
  %34 = load i32, i32* @TIFFReassignTagToIgnore.tagcount, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* @TIFFReassignTagToIgnore.tagcount, align 4
  %36 = sext i32 %34 to i64
  %37 = getelementptr inbounds [95 x i32], [95 x i32]* @TIFFReassignTagToIgnore.TIFFignoretags, i64 0, i64 %36
  store i32 %33, i32* %37, align 4
  store i32 1, i32* %3, align 4
  br label %66

; <label>:38:                                     ; preds = %9
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 4)
  %39 = add i64 %pgocount3, 1
  store i64 %39, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 4)
  br label %65

; <label>:40:                                     ; preds = %2
  store i32 0, i32* %6, align 4
  br label %41

; <label>:41:                                     ; preds = %55, %40
  %42 = load i32, i32* %6, align 4
  %43 = load i32, i32* @TIFFReassignTagToIgnore.tagcount, align 4
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %45, label %59

; <label>:45:                                     ; preds = %41
  %46 = load i32, i32* %6, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [95 x i32], [95 x i32]* @TIFFReassignTagToIgnore.TIFFignoretags, i64 0, i64 %47
  %49 = load i32, i32* %48, align 4
  %50 = load i32, i32* %5, align 4
  %51 = icmp eq i32 %49, %50
  br i1 %51, label %52, label %54

; <label>:52:                                     ; preds = %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 5)
  %53 = add i64 %pgocount4, 1
  store i64 %53, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 5)
  store i32 1, i32* %3, align 4
  br label %66

; <label>:54:                                     ; preds = %45
  br label %55

; <label>:55:                                     ; preds = %54
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 0)
  %56 = add i64 %pgocount5, 1
  store i64 %56, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 0)
  %57 = load i32, i32* %6, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %6, align 4
  br label %41

; <label>:59:                                     ; preds = %41
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 6)
  %60 = add i64 %pgocount6, 1
  store i64 %60, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 6)
  br label %65

; <label>:61:                                     ; preds = %2
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 2)
  %62 = add i64 %pgocount7, 1
  store i64 %62, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 2)
  store i32 0, i32* @TIFFReassignTagToIgnore.tagcount, align 4
  store i32 1, i32* %3, align 4
  br label %66

; <label>:63:                                     ; preds = %2
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 3)
  %64 = add i64 %pgocount8, 1
  store i64 %64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFReassignTagToIgnore, i64 0, i64 3)
  br label %65

; <label>:65:                                     ; preds = %63, %59, %38
  store i32 0, i32* %3, align 4
  br label %66

; <label>:66:                                     ; preds = %65, %61, %52, %31, %24
  %67 = load i32, i32* %3, align 4
  ret i32 %67
}

declare void @_TIFFSwab16BitData(%struct.tiff*, i8*, i32) #1

declare void @_TIFFSwab32BitData(%struct.tiff*, i8*, i32) #1

declare void @_TIFFSwab64BitData(%struct.tiff*, i8*, i32) #1

declare i32 @TIFFSetCompressionScheme(%struct.tiff*, i32) #1

declare void @TIFFWarning(i8*, i8*, ...) #1

declare %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff*, i32) #1

; Function Attrs: nounwind uwtable
define internal i32 @setExtraSamples(%struct.TIFFDirectory*, %struct.__va_list_tag*, i32*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.TIFFDirectory*, align 8
  %6 = alloca %struct.__va_list_tag*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i32, align 4
  store %struct.TIFFDirectory* %0, %struct.TIFFDirectory** %5, align 8
  store %struct.__va_list_tag* %1, %struct.__va_list_tag** %6, align 8
  store i32* %2, i32** %7, align 8
  %10 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %11 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %10, i32 0, i32 0
  %12 = load i32, i32* %11, align 8
  %13 = icmp ule i32 %12, 40
  br i1 %13, label %14, label %20

; <label>:14:                                     ; preds = %3
  %15 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %10, i32 0, i32 3
  %16 = load i8*, i8** %15, align 8
  %17 = getelementptr i8, i8* %16, i32 %12
  %18 = bitcast i8* %17 to i32*
  %19 = add i32 %12, 8
  store i32 %19, i32* %11, align 8
  br label %26

; <label>:20:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setExtraSamples, i64 0, i64 1)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setExtraSamples, i64 0, i64 1)
  %22 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %10, i32 0, i32 2
  %23 = load i8*, i8** %22, align 8
  %24 = bitcast i8* %23 to i32*
  %25 = getelementptr i8, i8* %23, i32 8
  store i8* %25, i8** %22, align 8
  br label %26

; <label>:26:                                     ; preds = %20, %14
  %27 = phi i32* [ %18, %14 ], [ %24, %20 ]
  %28 = load i32, i32* %27, align 4
  %29 = load i32*, i32** %7, align 8
  store i32 %28, i32* %29, align 4
  %30 = load i32*, i32** %7, align 8
  %31 = load i32, i32* %30, align 4
  %32 = trunc i32 %31 to i16
  %33 = zext i16 %32 to i32
  %34 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %35 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %34, i32 0, i32 15
  %36 = load i16, i16* %35, align 2
  %37 = zext i16 %36 to i32
  %38 = icmp sgt i32 %33, %37
  br i1 %38, label %39, label %41

; <label>:39:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setExtraSamples, i64 0, i64 2)
  %40 = add i64 %pgocount1, 1
  store i64 %40, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setExtraSamples, i64 0, i64 2)
  store i32 0, i32* %4, align 4
  br label %105

; <label>:41:                                     ; preds = %26
  %42 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %43 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %42, i32 0, i32 0
  %44 = load i32, i32* %43, align 8
  %45 = icmp ule i32 %44, 40
  br i1 %45, label %46, label %52

; <label>:46:                                     ; preds = %41
  %47 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %42, i32 0, i32 3
  %48 = load i8*, i8** %47, align 8
  %49 = getelementptr i8, i8* %48, i32 %44
  %50 = bitcast i8* %49 to i16**
  %51 = add i32 %44, 8
  store i32 %51, i32* %43, align 8
  br label %58

; <label>:52:                                     ; preds = %41
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setExtraSamples, i64 0, i64 4)
  %53 = add i64 %pgocount2, 1
  store i64 %53, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setExtraSamples, i64 0, i64 4)
  %54 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %42, i32 0, i32 2
  %55 = load i8*, i8** %54, align 8
  %56 = bitcast i8* %55 to i16**
  %57 = getelementptr i8, i8* %55, i32 8
  store i8* %57, i8** %54, align 8
  br label %58

; <label>:58:                                     ; preds = %52, %46
  %59 = phi i16** [ %50, %46 ], [ %56, %52 ]
  %60 = load i16*, i16** %59, align 8
  store i16* %60, i16** %8, align 8
  %61 = load i32*, i32** %7, align 8
  %62 = load i32, i32* %61, align 4
  %63 = icmp sgt i32 %62, 0
  br i1 %63, label %64, label %70

; <label>:64:                                     ; preds = %58
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setExtraSamples, i64 0, i64 3)
  %65 = add i64 %pgocount3, 1
  store i64 %65, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setExtraSamples, i64 0, i64 3)
  %66 = load i16*, i16** %8, align 8
  %67 = icmp eq i16* %66, null
  br i1 %67, label %68, label %70

; <label>:68:                                     ; preds = %64
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setExtraSamples, i64 0, i64 7)
  %69 = add i64 %pgocount4, 1
  store i64 %69, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setExtraSamples, i64 0, i64 7)
  store i32 0, i32* %4, align 4
  br label %105

; <label>:70:                                     ; preds = %64, %58
  store i32 0, i32* %9, align 4
  br label %71

; <label>:71:                                     ; preds = %87, %70
  %72 = load i32, i32* %9, align 4
  %73 = load i32*, i32** %7, align 8
  %74 = load i32, i32* %73, align 4
  %75 = icmp slt i32 %72, %74
  br i1 %75, label %76, label %91

; <label>:76:                                     ; preds = %71
  %77 = load i16*, i16** %8, align 8
  %78 = load i32, i32* %9, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i16, i16* %77, i64 %79
  %81 = load i16, i16* %80, align 2
  %82 = zext i16 %81 to i32
  %83 = icmp sgt i32 %82, 2
  br i1 %83, label %84, label %86

; <label>:84:                                     ; preds = %76
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setExtraSamples, i64 0, i64 6)
  %85 = add i64 %pgocount5, 1
  store i64 %85, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setExtraSamples, i64 0, i64 6)
  store i32 0, i32* %4, align 4
  br label %105

; <label>:86:                                     ; preds = %76
  br label %87

; <label>:87:                                     ; preds = %86
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setExtraSamples, i64 0, i64 0)
  %88 = add i64 %pgocount6, 1
  store i64 %88, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setExtraSamples, i64 0, i64 0)
  %89 = load i32, i32* %9, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, i32* %9, align 4
  br label %71

; <label>:91:                                     ; preds = %71
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setExtraSamples, i64 0, i64 5)
  %92 = add i64 %pgocount7, 1
  store i64 %92, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_setExtraSamples, i64 0, i64 5)
  %93 = load i32*, i32** %7, align 8
  %94 = load i32, i32* %93, align 4
  %95 = trunc i32 %94 to i16
  %96 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %97 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %96, i32 0, i32 30
  store i16 %95, i16* %97, align 4
  %98 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %99 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %98, i32 0, i32 31
  %100 = load i16*, i16** %8, align 8
  %101 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %5, align 8
  %102 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %101, i32 0, i32 30
  %103 = load i16, i16* %102, align 4
  %104 = zext i16 %103 to i64
  call void @_TIFFsetShortArray(i16** %99, i16* %100, i64 %104)
  store i32 1, i32* %4, align 4
  br label %105

; <label>:105:                                    ; preds = %91, %84, %68, %39
  %106 = load i32, i32* %4, align 4
  ret i32 %106
}

; Function Attrs: nounwind uwtable
define internal i32 @checkInkNamesString(%struct.tiff*, i32, i8*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca %struct.TIFFDirectory*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store i8* %2, i8** %7, align 8
  %12 = load %struct.tiff*, %struct.tiff** %5, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 6
  store %struct.TIFFDirectory* %13, %struct.TIFFDirectory** %8, align 8
  %14 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %15 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %14, i32 0, i32 15
  %16 = load i16, i16* %15, align 2
  %17 = zext i16 %16 to i32
  store i32 %17, i32* %9, align 4
  %18 = load i32, i32* %6, align 4
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %20, label %61

; <label>:20:                                     ; preds = %3
  %21 = load i8*, i8** %7, align 8
  %22 = load i32, i32* %6, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i8, i8* %21, i64 %23
  store i8* %24, i8** %10, align 8
  %25 = load i8*, i8** %7, align 8
  store i8* %25, i8** %11, align 8
  br label %26

; <label>:26:                                     ; preds = %49, %20
  %27 = load i32, i32* %9, align 4
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %29, label %53

; <label>:29:                                     ; preds = %26
  br label %30

; <label>:30:                                     ; preds = %42, %29
  %31 = load i8*, i8** %11, align 8
  %32 = load i8, i8* %31, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %46

; <label>:35:                                     ; preds = %30
  %36 = load i8*, i8** %11, align 8
  %37 = load i8*, i8** %10, align 8
  %38 = icmp uge i8* %36, %37
  br i1 %38, label %39, label %41

; <label>:39:                                     ; preds = %35
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkInkNamesString, i64 0, i64 2)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkInkNamesString, i64 0, i64 2)
  br label %63

; <label>:41:                                     ; preds = %35
  br label %42

; <label>:42:                                     ; preds = %41
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkInkNamesString, i64 0, i64 0)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkInkNamesString, i64 0, i64 0)
  %44 = load i8*, i8** %11, align 8
  %45 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %45, i8** %11, align 8
  br label %30

; <label>:46:                                     ; preds = %30
  %47 = load i8*, i8** %11, align 8
  %48 = getelementptr inbounds i8, i8* %47, i32 1
  store i8* %48, i8** %11, align 8
  br label %49

; <label>:49:                                     ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkInkNamesString, i64 0, i64 1)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkInkNamesString, i64 0, i64 1)
  %51 = load i32, i32* %9, align 4
  %52 = add nsw i32 %51, -1
  store i32 %52, i32* %9, align 4
  br label %26

; <label>:53:                                     ; preds = %26
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkInkNamesString, i64 0, i64 4)
  %54 = add i64 %pgocount3, 1
  store i64 %54, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkInkNamesString, i64 0, i64 4)
  %55 = load i8*, i8** %11, align 8
  %56 = load i8*, i8** %7, align 8
  %57 = ptrtoint i8* %55 to i64
  %58 = ptrtoint i8* %56 to i64
  %59 = sub i64 %57, %58
  %60 = trunc i64 %59 to i32
  store i32 %60, i32* %4, align 4
  br label %77

; <label>:61:                                     ; preds = %3
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkInkNamesString, i64 0, i64 3)
  %62 = add i64 %pgocount4, 1
  store i64 %62, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkInkNamesString, i64 0, i64 3)
  br label %63

; <label>:63:                                     ; preds = %61, %39
  %64 = load %struct.tiff*, %struct.tiff** %5, align 8
  %65 = getelementptr inbounds %struct.tiff, %struct.tiff* %64, i32 0, i32 0
  %66 = load i8*, i8** %65, align 8
  %67 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %68 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %67, i32 0, i32 15
  %69 = load i16, i16* %68, align 2
  %70 = zext i16 %69 to i32
  %71 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %72 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %71, i32 0, i32 15
  %73 = load i16, i16* %72, align 2
  %74 = zext i16 %73 to i32
  %75 = load i32, i32* %9, align 4
  %76 = sub nsw i32 %74, %75
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.18, i32 0, i32 0), i8* %66, i32 %70, i32 %76)
  store i32 0, i32* %4, align 4
  br label %77

; <label>:77:                                     ; preds = %63, %53
  %78 = load i32, i32* %4, align 4
  ret i32 %78
}

declare void @TIFFSwabShort(i16*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

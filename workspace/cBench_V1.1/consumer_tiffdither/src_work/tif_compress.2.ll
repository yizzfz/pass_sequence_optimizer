; ModuleID = 'tmp1.ll'
source_filename = "tif_compress.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._codec = type { %struct._codec*, %struct.TIFFCodec* }
%struct.TIFFCodec = type { i8*, i16, i32 (%struct.tiff*, i32)* }
%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, {}*, {}*, {}*, {}*, {}*, {}*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [9 x i8] c"scanline\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"strip\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"tile\00", align 1
@.str.3 = private unnamed_addr constant [53 x i8] c"Compression algorithm does not support random access\00", align 1
@registeredCODECS = internal global %struct._codec* null, align 8
@_TIFFBuiltinCODECS = external global [0 x %struct.TIFFCodec], align 8
@.str.4 = private unnamed_addr constant [18 x i8] c"TIFFRegisterCODEC\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"No space to register compression scheme %s\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"TIFFUnRegisterCODEC\00", align 1
@.str.7 = private unnamed_addr constant [52 x i8] c"Cannot remove compression scheme %s; not registered\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"LZW\00", align 1
@.str.9 = private unnamed_addr constant [73 x i8] c"%s %s encoding is no longer implemented due to Unisys patent enforcement\00", align 1
@.str.10 = private unnamed_addr constant [34 x i8] c"%s %s encoding is not implemented\00", align 1
@.str.11 = private unnamed_addr constant [53 x i8] c"Compression scheme %u %s encoding is not implemented\00", align 1
@.str.12 = private unnamed_addr constant [34 x i8] c"%s %s decoding is not implemented\00", align 1
@.str.13 = private unnamed_addr constant [53 x i8] c"Compression scheme %u %s decoding is not implemented\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn__TIFFNoRowEncode = private constant [16 x i8] c"_TIFFNoRowEncode"
@__profn_tmp1.ll_TIFFNoEncode = private constant [20 x i8] c"tmp1.ll:TIFFNoEncode"
@__profn__TIFFNoStripEncode = private constant [18 x i8] c"_TIFFNoStripEncode"
@__profn__TIFFNoTileEncode = private constant [17 x i8] c"_TIFFNoTileEncode"
@__profn__TIFFNoRowDecode = private constant [16 x i8] c"_TIFFNoRowDecode"
@__profn_tmp1.ll_TIFFNoDecode = private constant [20 x i8] c"tmp1.ll:TIFFNoDecode"
@__profn__TIFFNoStripDecode = private constant [18 x i8] c"_TIFFNoStripDecode"
@__profn__TIFFNoTileDecode = private constant [17 x i8] c"_TIFFNoTileDecode"
@__profn__TIFFNoSeek = private constant [11 x i8] c"_TIFFNoSeek"
@__profn__TIFFNoPreCode = private constant [14 x i8] c"_TIFFNoPreCode"
@__profn__TIFFSetDefaultCompressionState = private constant [31 x i8] c"_TIFFSetDefaultCompressionState"
@__profn_tmp1.ll__TIFFtrue = private constant [17 x i8] c"tmp1.ll:_TIFFtrue"
@__profn_tmp1.ll__TIFFvoid = private constant [17 x i8] c"tmp1.ll:_TIFFvoid"
@__profn_TIFFSetCompressionScheme = private constant [24 x i8] c"TIFFSetCompressionScheme"
@__profn_TIFFFindCODEC = private constant [13 x i8] c"TIFFFindCODEC"
@__profn_TIFFRegisterCODEC = private constant [17 x i8] c"TIFFRegisterCODEC"
@__profn_TIFFUnRegisterCODEC = private constant [19 x i8] c"TIFFUnRegisterCODEC"
@__profc__TIFFNoRowEncode = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFNoRowEncode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7098113893714922998, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoRowEncode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoRowEncode to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFNoEncode = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFNoEncode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7139238459086483793, i64 46000771972, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFNoEncode, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFNoStripEncode = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFNoStripEncode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5493691958364225985, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoStripEncode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoStripEncode to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFNoTileEncode = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFNoTileEncode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2201103860164022169, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoTileEncode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoTileEncode to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFNoRowDecode = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFNoRowDecode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4730513550823297852, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoRowDecode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoRowDecode to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFNoDecode = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFNoDecode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4094625322651717810, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFNoDecode, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFNoStripDecode = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFNoStripDecode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3360184474056970125, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoStripDecode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoStripDecode to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFNoTileDecode = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFNoTileDecode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6473847989151179232, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoTileDecode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoTileDecode to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFNoSeek = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFNoSeek = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7217982163152661450, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoSeek, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @_TIFFNoSeek to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFNoPreCode = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFNoPreCode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6032502385652822170, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoPreCode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i16)* @_TIFFNoPreCode to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFSetDefaultCompressionState = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFSetDefaultCompressionState = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6905940192278866105, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFSetDefaultCompressionState, i32 0, i32 0), i8* bitcast (void (%struct.tiff*)* @_TIFFSetDefaultCompressionState to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll__TIFFtrue = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll__TIFFtrue = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1104208102580625219, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__TIFFtrue, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @_TIFFtrue to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll__TIFFvoid = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll__TIFFvoid = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6724678186269536691, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__TIFFvoid, i32 0, i32 0), i8* bitcast (void (%struct.tiff*)* @_TIFFvoid to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFSetCompressionScheme = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFSetCompressionScheme = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFSetCompressionScheme = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4361352555698708768, i64 281504644258452, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSetCompressionScheme, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @TIFFSetCompressionScheme to i8*), i8* bitcast ([1 x i64]* @__profvp_TIFFSetCompressionScheme to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_TIFFFindCODEC = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFFindCODEC = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8998346885776380882, i64 82198711224, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFindCODEC, i32 0, i32 0), i8* bitcast (%struct.TIFFCodec* (i16)* @TIFFFindCODEC to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFRegisterCODEC = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFRegisterCODEC = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7327980048868473582, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFRegisterCODEC, i32 0, i32 0), i8* bitcast (%struct.TIFFCodec* (i16, i8*, i32 (%struct.tiff*, i32)*)* @TIFFRegisterCODEC to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFUnRegisterCODEC = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFUnRegisterCODEC = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7965333052786688626, i64 51054561640, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFUnRegisterCODEC, i32 0, i32 0), i8* bitcast (void (%struct.TIFFCodec*)* @TIFFUnRegisterCODEC to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [151 x i8] c"\C1\02\93\01x\DAm\8D\C1\0E\820\10D\C3\0F\99x\F5Zh\E2E\0D\C53!t\D4\C6\D26\ED\A2\BF\AF\96*\94x\DBy;\FB\B6m\F6\9C\1Flm\9F\95\E9\ADDA\83\DBn\B4\DEM<\C1vJ\82\BCr9j\94FN\DE\AA\12\7FT\09.U9\FA\A8V%\E0\FE\9DO\1E\EC\B7\12\A0\12\97n\D4\C4\EC\E0<BP\D6\08\EAh~\1A{\E4\C7\15yX%\8B\A4X\DE\F67\0C\88\0B\AE\8Cd\C7\B2b1\D5\B8\AA@\F039\9B\8C\BD\00\E5\B4m\5C", section "__llvm_prf_names"
@llvm.used = appending global [19 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFNoRowEncode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFNoEncode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFNoStripEncode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFNoTileEncode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFNoRowDecode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFNoDecode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFNoStripDecode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFNoTileDecode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFNoSeek to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFNoPreCode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFSetDefaultCompressionState to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll__TIFFtrue to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll__TIFFvoid to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFSetCompressionScheme to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFFindCODEC to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFRegisterCODEC to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFUnRegisterCODEC to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([151 x i8], [151 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @_TIFFNoRowEncode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoRowEncode, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoRowEncode, i64 0, i64 0)
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %10 = load i8*, i8** %7, align 8
  %11 = load i32, i32* %8, align 4
  %12 = load i16, i16* %9, align 2
  %13 = load %struct.tiff*, %struct.tiff** %6, align 8
  %14 = call i32 @TIFFNoEncode(%struct.tiff* %13, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0))
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define internal i32 @TIFFNoEncode(%struct.tiff*, i8*) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.TIFFCodec*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store i8* %1, i8** %4, align 8
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 6
  %8 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %7, i32 0, i32 10
  %9 = load i16, i16* %8, align 8
  %10 = call %struct.TIFFCodec* @TIFFFindCODEC(i16 zeroext %9)
  store %struct.TIFFCodec* %10, %struct.TIFFCodec** %5, align 8
  %11 = load %struct.TIFFCodec*, %struct.TIFFCodec** %5, align 8
  %12 = icmp ne %struct.TIFFCodec* %11, null
  br i1 %12, label %13, label %38

; <label>:13:                                     ; preds = %2
  %14 = load %struct.TIFFCodec*, %struct.TIFFCodec** %5, align 8
  %15 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %14, i32 0, i32 0
  %16 = load i8*, i8** %15, align 8
  %17 = call i32 @strncmp(i8* %16, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), i64 3) #5
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %28, label %19

; <label>:19:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFNoEncode, i64 0, i64 2)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFNoEncode, i64 0, i64 2)
  %21 = load %struct.tiff*, %struct.tiff** %3, align 8
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %21, i32 0, i32 0
  %23 = load i8*, i8** %22, align 8
  %24 = load %struct.TIFFCodec*, %struct.TIFFCodec** %5, align 8
  %25 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %24, i32 0, i32 0
  %26 = load i8*, i8** %25, align 8
  %27 = load i8*, i8** %4, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %23, i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.9, i32 0, i32 0), i8* %26, i8* %27)
  br label %37

; <label>:28:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFNoEncode, i64 0, i64 0)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFNoEncode, i64 0, i64 0)
  %30 = load %struct.tiff*, %struct.tiff** %3, align 8
  %31 = getelementptr inbounds %struct.tiff, %struct.tiff* %30, i32 0, i32 0
  %32 = load i8*, i8** %31, align 8
  %33 = load %struct.TIFFCodec*, %struct.TIFFCodec** %5, align 8
  %34 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %33, i32 0, i32 0
  %35 = load i8*, i8** %34, align 8
  %36 = load i8*, i8** %4, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %32, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.10, i32 0, i32 0), i8* %35, i8* %36)
  br label %37

; <label>:37:                                     ; preds = %28, %19
  br label %49

; <label>:38:                                     ; preds = %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFNoEncode, i64 0, i64 1)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_TIFFNoEncode, i64 0, i64 1)
  %40 = load %struct.tiff*, %struct.tiff** %3, align 8
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %40, i32 0, i32 0
  %42 = load i8*, i8** %41, align 8
  %43 = load %struct.tiff*, %struct.tiff** %3, align 8
  %44 = getelementptr inbounds %struct.tiff, %struct.tiff* %43, i32 0, i32 6
  %45 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %44, i32 0, i32 10
  %46 = load i16, i16* %45, align 8
  %47 = zext i16 %46 to i32
  %48 = load i8*, i8** %4, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %42, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.11, i32 0, i32 0), i32 %47, i8* %48)
  br label %49

; <label>:49:                                     ; preds = %38, %37
  ret i32 -1
}

; Function Attrs: nounwind uwtable
define i32 @_TIFFNoStripEncode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoStripEncode, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoStripEncode, i64 0, i64 0)
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %10 = load i8*, i8** %7, align 8
  %11 = load i32, i32* %8, align 4
  %12 = load i16, i16* %9, align 2
  %13 = load %struct.tiff*, %struct.tiff** %6, align 8
  %14 = call i32 @TIFFNoEncode(%struct.tiff* %13, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0))
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define i32 @_TIFFNoTileEncode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoTileEncode, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoTileEncode, i64 0, i64 0)
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %10 = load i8*, i8** %7, align 8
  %11 = load i32, i32* %8, align 4
  %12 = load i16, i16* %9, align 2
  %13 = load %struct.tiff*, %struct.tiff** %6, align 8
  %14 = call i32 @TIFFNoEncode(%struct.tiff* %13, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0))
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define i32 @_TIFFNoRowDecode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoRowDecode, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoRowDecode, i64 0, i64 0)
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %10 = load i8*, i8** %7, align 8
  %11 = load i32, i32* %8, align 4
  %12 = load i16, i16* %9, align 2
  %13 = load %struct.tiff*, %struct.tiff** %6, align 8
  %14 = call i32 @TIFFNoDecode(%struct.tiff* %13, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0))
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define internal i32 @TIFFNoDecode(%struct.tiff*, i8*) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.TIFFCodec*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store i8* %1, i8** %4, align 8
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 6
  %8 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %7, i32 0, i32 10
  %9 = load i16, i16* %8, align 8
  %10 = call %struct.TIFFCodec* @TIFFFindCODEC(i16 zeroext %9)
  store %struct.TIFFCodec* %10, %struct.TIFFCodec** %5, align 8
  %11 = load %struct.TIFFCodec*, %struct.TIFFCodec** %5, align 8
  %12 = icmp ne %struct.TIFFCodec* %11, null
  br i1 %12, label %13, label %22

; <label>:13:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFNoDecode, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFNoDecode, i64 0, i64 0)
  %15 = load %struct.tiff*, %struct.tiff** %3, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %15, i32 0, i32 0
  %17 = load i8*, i8** %16, align 8
  %18 = load %struct.TIFFCodec*, %struct.TIFFCodec** %5, align 8
  %19 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %18, i32 0, i32 0
  %20 = load i8*, i8** %19, align 8
  %21 = load i8*, i8** %4, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %17, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.12, i32 0, i32 0), i8* %20, i8* %21)
  br label %33

; <label>:22:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFNoDecode, i64 0, i64 1)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_TIFFNoDecode, i64 0, i64 1)
  %24 = load %struct.tiff*, %struct.tiff** %3, align 8
  %25 = getelementptr inbounds %struct.tiff, %struct.tiff* %24, i32 0, i32 0
  %26 = load i8*, i8** %25, align 8
  %27 = load %struct.tiff*, %struct.tiff** %3, align 8
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %27, i32 0, i32 6
  %29 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %28, i32 0, i32 10
  %30 = load i16, i16* %29, align 8
  %31 = zext i16 %30 to i32
  %32 = load i8*, i8** %4, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %26, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.13, i32 0, i32 0), i32 %31, i8* %32)
  br label %33

; <label>:33:                                     ; preds = %22, %13
  ret i32 -1
}

; Function Attrs: nounwind uwtable
define i32 @_TIFFNoStripDecode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoStripDecode, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoStripDecode, i64 0, i64 0)
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %10 = load i8*, i8** %7, align 8
  %11 = load i32, i32* %8, align 4
  %12 = load i16, i16* %9, align 2
  %13 = load %struct.tiff*, %struct.tiff** %6, align 8
  %14 = call i32 @TIFFNoDecode(%struct.tiff* %13, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0))
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define i32 @_TIFFNoTileDecode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoTileDecode, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoTileDecode, i64 0, i64 0)
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %10 = load i8*, i8** %7, align 8
  %11 = load i32, i32* %8, align 4
  %12 = load i16, i16* %9, align 2
  %13 = load %struct.tiff*, %struct.tiff** %6, align 8
  %14 = call i32 @TIFFNoDecode(%struct.tiff* %13, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0))
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define i32 @_TIFFNoSeek(%struct.tiff*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoSeek, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoSeek, i64 0, i64 0)
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 0
  %9 = load i8*, i8** %8, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %9, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.3, i32 0, i32 0))
  ret i32 0
}

declare void @TIFFError(i8*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @_TIFFNoPreCode(%struct.tiff*, i16 zeroext) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoPreCode, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFNoPreCode, i64 0, i64 0)
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i16 %1, i16* %5, align 2
  %6 = load %struct.tiff*, %struct.tiff** %4, align 8
  %7 = load i16, i16* %5, align 2
  ret i32 1
}

; Function Attrs: nounwind uwtable
define void @_TIFFSetDefaultCompressionState(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFSetDefaultCompressionState, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFSetDefaultCompressionState, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 21
  store i32 (%struct.tiff*)* @_TIFFtrue, i32 (%struct.tiff*)** %5, align 8
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 22
  store i32 (%struct.tiff*, i16)* @_TIFFNoPreCode, i32 (%struct.tiff*, i16)** %7, align 8
  %8 = load %struct.tiff*, %struct.tiff** %3, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %8, i32 0, i32 26
  %10 = bitcast {}** %9 to i32 (%struct.tiff*, i8*, i32, i16)**
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoRowDecode, i32 (%struct.tiff*, i8*, i32, i16)** %10, align 8
  %11 = load %struct.tiff*, %struct.tiff** %3, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 28
  %13 = bitcast {}** %12 to i32 (%struct.tiff*, i8*, i32, i16)**
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoStripDecode, i32 (%struct.tiff*, i8*, i32, i16)** %13, align 8
  %14 = load %struct.tiff*, %struct.tiff** %3, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 30
  %16 = bitcast {}** %15 to i32 (%struct.tiff*, i8*, i32, i16)**
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoTileDecode, i32 (%struct.tiff*, i8*, i32, i16)** %16, align 8
  %17 = load %struct.tiff*, %struct.tiff** %3, align 8
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %17, i32 0, i32 23
  store i32 (%struct.tiff*)* @_TIFFtrue, i32 (%struct.tiff*)** %18, align 8
  %19 = load %struct.tiff*, %struct.tiff** %3, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %19, i32 0, i32 24
  store i32 (%struct.tiff*, i16)* @_TIFFNoPreCode, i32 (%struct.tiff*, i16)** %20, align 8
  %21 = load %struct.tiff*, %struct.tiff** %3, align 8
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %21, i32 0, i32 25
  store i32 (%struct.tiff*)* @_TIFFtrue, i32 (%struct.tiff*)** %22, align 8
  %23 = load %struct.tiff*, %struct.tiff** %3, align 8
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %23, i32 0, i32 27
  %25 = bitcast {}** %24 to i32 (%struct.tiff*, i8*, i32, i16)**
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoRowEncode, i32 (%struct.tiff*, i8*, i32, i16)** %25, align 8
  %26 = load %struct.tiff*, %struct.tiff** %3, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %26, i32 0, i32 29
  %28 = bitcast {}** %27 to i32 (%struct.tiff*, i8*, i32, i16)**
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoStripEncode, i32 (%struct.tiff*, i8*, i32, i16)** %28, align 8
  %29 = load %struct.tiff*, %struct.tiff** %3, align 8
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %29, i32 0, i32 31
  %31 = bitcast {}** %30 to i32 (%struct.tiff*, i8*, i32, i16)**
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoTileEncode, i32 (%struct.tiff*, i8*, i32, i16)** %31, align 8
  %32 = load %struct.tiff*, %struct.tiff** %3, align 8
  %33 = getelementptr inbounds %struct.tiff, %struct.tiff* %32, i32 0, i32 32
  store void (%struct.tiff*)* @_TIFFvoid, void (%struct.tiff*)** %33, align 8
  %34 = load %struct.tiff*, %struct.tiff** %3, align 8
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %34, i32 0, i32 33
  store i32 (%struct.tiff*, i32)* @_TIFFNoSeek, i32 (%struct.tiff*, i32)** %35, align 8
  %36 = load %struct.tiff*, %struct.tiff** %3, align 8
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %36, i32 0, i32 34
  store void (%struct.tiff*)* @_TIFFvoid, void (%struct.tiff*)** %37, align 8
  %38 = load %struct.tiff*, %struct.tiff** %3, align 8
  %39 = getelementptr inbounds %struct.tiff, %struct.tiff* %38, i32 0, i32 35
  store i32 (%struct.tiff*, i32)* @_TIFFDefaultStripSize, i32 (%struct.tiff*, i32)** %39, align 8
  %40 = load %struct.tiff*, %struct.tiff** %3, align 8
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %40, i32 0, i32 36
  store void (%struct.tiff*, i32*, i32*)* @_TIFFDefaultTileSize, void (%struct.tiff*, i32*, i32*)** %41, align 8
  %42 = load %struct.tiff*, %struct.tiff** %3, align 8
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %42, i32 0, i32 3
  %44 = load i32, i32* %43, align 8
  %45 = and i32 %44, -257
  store i32 %45, i32* %43, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @_TIFFtrue(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__TIFFtrue, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__TIFFtrue, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  ret i32 1
}

; Function Attrs: nounwind uwtable
define internal void @_TIFFvoid(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__TIFFvoid, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__TIFFvoid, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  ret void
}

declare i32 @_TIFFDefaultStripSize(%struct.tiff*, i32) #1

declare void @_TIFFDefaultTileSize(%struct.tiff*, i32*, i32*) #1

; Function Attrs: nounwind uwtable
define i32 @TIFFSetCompressionScheme(%struct.tiff*, i32) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.TIFFCodec*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load i32, i32* %4, align 4
  %7 = trunc i32 %6 to i16
  %8 = call %struct.TIFFCodec* @TIFFFindCODEC(i16 zeroext %7)
  store %struct.TIFFCodec* %8, %struct.TIFFCodec** %5, align 8
  %9 = load %struct.tiff*, %struct.tiff** %3, align 8
  call void @_TIFFSetDefaultCompressionState(%struct.tiff* %9)
  %10 = load %struct.TIFFCodec*, %struct.TIFFCodec** %5, align 8
  %11 = icmp ne %struct.TIFFCodec* %10, null
  br i1 %11, label %12, label %21

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSetCompressionScheme, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSetCompressionScheme, i64 0, i64 0)
  %14 = load %struct.TIFFCodec*, %struct.TIFFCodec** %5, align 8
  %15 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %14, i32 0, i32 2
  %16 = load i32 (%struct.tiff*, i32)*, i32 (%struct.tiff*, i32)** %15, align 8
  %17 = load %struct.tiff*, %struct.tiff** %3, align 8
  %18 = load i32, i32* %4, align 4
  %19 = ptrtoint i32 (%struct.tiff*, i32)* %16 to i64
  call void @__llvm_profile_instrument_target(i64 %19, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFSetCompressionScheme to i8*), i32 0)
  %20 = call i32 %16(%struct.tiff* %17, i32 %18)
  br label %23

; <label>:21:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSetCompressionScheme, i64 0, i64 1)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSetCompressionScheme, i64 0, i64 1)
  br label %23

; <label>:23:                                     ; preds = %21, %12
  %24 = phi i32 [ %20, %12 ], [ 1, %21 ]
  ret i32 %24
}

; Function Attrs: nounwind uwtable
define %struct.TIFFCodec* @TIFFFindCODEC(i16 zeroext) #0 {
  %2 = alloca %struct.TIFFCodec*, align 8
  %3 = alloca i16, align 2
  %4 = alloca %struct.TIFFCodec*, align 8
  %5 = alloca %struct._codec*, align 8
  store i16 %0, i16* %3, align 2
  %6 = load %struct._codec*, %struct._codec** @registeredCODECS, align 8
  store %struct._codec* %6, %struct._codec** %5, align 8
  br label %7

; <label>:7:                                      ; preds = %27, %1
  %8 = load %struct._codec*, %struct._codec** %5, align 8
  %9 = icmp ne %struct._codec* %8, null
  br i1 %9, label %10, label %31

; <label>:10:                                     ; preds = %7
  %11 = load %struct._codec*, %struct._codec** %5, align 8
  %12 = getelementptr inbounds %struct._codec, %struct._codec* %11, i32 0, i32 1
  %13 = load %struct.TIFFCodec*, %struct.TIFFCodec** %12, align 8
  %14 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %13, i32 0, i32 1
  %15 = load i16, i16* %14, align 8
  %16 = zext i16 %15 to i32
  %17 = load i16, i16* %3, align 2
  %18 = zext i16 %17 to i32
  %19 = icmp eq i32 %16, %18
  br i1 %19, label %20, label %25

; <label>:20:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFindCODEC, i64 0, i64 2)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFindCODEC, i64 0, i64 2)
  %22 = load %struct._codec*, %struct._codec** %5, align 8
  %23 = getelementptr inbounds %struct._codec, %struct._codec* %22, i32 0, i32 1
  %24 = load %struct.TIFFCodec*, %struct.TIFFCodec** %23, align 8
  store %struct.TIFFCodec* %24, %struct.TIFFCodec** %2, align 8
  br label %55

; <label>:25:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFindCODEC, i64 0, i64 0)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFindCODEC, i64 0, i64 0)
  br label %27

; <label>:27:                                     ; preds = %25
  %28 = load %struct._codec*, %struct._codec** %5, align 8
  %29 = getelementptr inbounds %struct._codec, %struct._codec* %28, i32 0, i32 0
  %30 = load %struct._codec*, %struct._codec** %29, align 8
  store %struct._codec* %30, %struct._codec** %5, align 8
  br label %7

; <label>:31:                                     ; preds = %7
  store %struct.TIFFCodec* getelementptr inbounds ([0 x %struct.TIFFCodec], [0 x %struct.TIFFCodec]* @_TIFFBuiltinCODECS, i32 0, i32 0), %struct.TIFFCodec** %4, align 8
  br label %32

; <label>:32:                                     ; preds = %49, %31
  %33 = load %struct.TIFFCodec*, %struct.TIFFCodec** %4, align 8
  %34 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %33, i32 0, i32 0
  %35 = load i8*, i8** %34, align 8
  %36 = icmp ne i8* %35, null
  br i1 %36, label %37, label %53

; <label>:37:                                     ; preds = %32
  %38 = load %struct.TIFFCodec*, %struct.TIFFCodec** %4, align 8
  %39 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %38, i32 0, i32 1
  %40 = load i16, i16* %39, align 8
  %41 = zext i16 %40 to i32
  %42 = load i16, i16* %3, align 2
  %43 = zext i16 %42 to i32
  %44 = icmp eq i32 %41, %43
  br i1 %44, label %45, label %48

; <label>:45:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFindCODEC, i64 0, i64 4)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFindCODEC, i64 0, i64 4)
  %47 = load %struct.TIFFCodec*, %struct.TIFFCodec** %4, align 8
  store %struct.TIFFCodec* %47, %struct.TIFFCodec** %2, align 8
  br label %55

; <label>:48:                                     ; preds = %37
  br label %49

; <label>:49:                                     ; preds = %48
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFindCODEC, i64 0, i64 1)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFindCODEC, i64 0, i64 1)
  %51 = load %struct.TIFFCodec*, %struct.TIFFCodec** %4, align 8
  %52 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %51, i32 1
  store %struct.TIFFCodec* %52, %struct.TIFFCodec** %4, align 8
  br label %32

; <label>:53:                                     ; preds = %32
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFindCODEC, i64 0, i64 3)
  %54 = add i64 %pgocount4, 1
  store i64 %54, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFindCODEC, i64 0, i64 3)
  store %struct.TIFFCodec* null, %struct.TIFFCodec** %2, align 8
  br label %55

; <label>:55:                                     ; preds = %53, %45, %20
  %56 = load %struct.TIFFCodec*, %struct.TIFFCodec** %2, align 8
  ret %struct.TIFFCodec* %56
}

; Function Attrs: nounwind uwtable
define %struct.TIFFCodec* @TIFFRegisterCODEC(i16 zeroext, i8*, i32 (%struct.tiff*, i32)*) #0 {
  %4 = alloca i16, align 2
  %5 = alloca i8*, align 8
  %6 = alloca i32 (%struct.tiff*, i32)*, align 8
  %7 = alloca %struct._codec*, align 8
  store i16 %0, i16* %4, align 2
  store i8* %1, i8** %5, align 8
  store i32 (%struct.tiff*, i32)* %2, i32 (%struct.tiff*, i32)** %6, align 8
  %8 = load i8*, i8** %5, align 8
  %9 = call i64 @strlen(i8* %8) #5
  %10 = add i64 40, %9
  %11 = add i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = call i8* @_TIFFmalloc(i32 %12)
  %14 = bitcast i8* %13 to %struct._codec*
  store %struct._codec* %14, %struct._codec** %7, align 8
  %15 = load %struct._codec*, %struct._codec** %7, align 8
  %16 = icmp ne %struct._codec* %15, null
  br i1 %16, label %17, label %55

; <label>:17:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFRegisterCODEC, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFRegisterCODEC, i64 0, i64 0)
  %19 = load %struct._codec*, %struct._codec** %7, align 8
  %20 = bitcast %struct._codec* %19 to i8*
  %21 = getelementptr inbounds i8, i8* %20, i64 16
  %22 = bitcast i8* %21 to %struct.TIFFCodec*
  %23 = load %struct._codec*, %struct._codec** %7, align 8
  %24 = getelementptr inbounds %struct._codec, %struct._codec* %23, i32 0, i32 1
  store %struct.TIFFCodec* %22, %struct.TIFFCodec** %24, align 8
  %25 = load %struct._codec*, %struct._codec** %7, align 8
  %26 = getelementptr inbounds %struct._codec, %struct._codec* %25, i32 0, i32 1
  %27 = load %struct.TIFFCodec*, %struct.TIFFCodec** %26, align 8
  %28 = bitcast %struct.TIFFCodec* %27 to i8*
  %29 = getelementptr inbounds i8, i8* %28, i64 24
  %30 = load %struct._codec*, %struct._codec** %7, align 8
  %31 = getelementptr inbounds %struct._codec, %struct._codec* %30, i32 0, i32 1
  %32 = load %struct.TIFFCodec*, %struct.TIFFCodec** %31, align 8
  %33 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %32, i32 0, i32 0
  store i8* %29, i8** %33, align 8
  %34 = load %struct._codec*, %struct._codec** %7, align 8
  %35 = getelementptr inbounds %struct._codec, %struct._codec* %34, i32 0, i32 1
  %36 = load %struct.TIFFCodec*, %struct.TIFFCodec** %35, align 8
  %37 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %36, i32 0, i32 0
  %38 = load i8*, i8** %37, align 8
  %39 = load i8*, i8** %5, align 8
  %40 = call i8* @strcpy(i8* %38, i8* %39) #4
  %41 = load i16, i16* %4, align 2
  %42 = load %struct._codec*, %struct._codec** %7, align 8
  %43 = getelementptr inbounds %struct._codec, %struct._codec* %42, i32 0, i32 1
  %44 = load %struct.TIFFCodec*, %struct.TIFFCodec** %43, align 8
  %45 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %44, i32 0, i32 1
  store i16 %41, i16* %45, align 8
  %46 = load i32 (%struct.tiff*, i32)*, i32 (%struct.tiff*, i32)** %6, align 8
  %47 = load %struct._codec*, %struct._codec** %7, align 8
  %48 = getelementptr inbounds %struct._codec, %struct._codec* %47, i32 0, i32 1
  %49 = load %struct.TIFFCodec*, %struct.TIFFCodec** %48, align 8
  %50 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %49, i32 0, i32 2
  store i32 (%struct.tiff*, i32)* %46, i32 (%struct.tiff*, i32)** %50, align 8
  %51 = load %struct._codec*, %struct._codec** @registeredCODECS, align 8
  %52 = load %struct._codec*, %struct._codec** %7, align 8
  %53 = getelementptr inbounds %struct._codec, %struct._codec* %52, i32 0, i32 0
  store %struct._codec* %51, %struct._codec** %53, align 8
  %54 = load %struct._codec*, %struct._codec** %7, align 8
  store %struct._codec* %54, %struct._codec** @registeredCODECS, align 8
  br label %58

; <label>:55:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFRegisterCODEC, i64 0, i64 1)
  %56 = add i64 %pgocount1, 1
  store i64 %56, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFRegisterCODEC, i64 0, i64 1)
  %57 = load i8*, i8** %5, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i32 0, i32 0), i8* %57)
  br label %58

; <label>:58:                                     ; preds = %55, %17
  %59 = load %struct._codec*, %struct._codec** %7, align 8
  %60 = getelementptr inbounds %struct._codec, %struct._codec* %59, i32 0, i32 1
  %61 = load %struct.TIFFCodec*, %struct.TIFFCodec** %60, align 8
  ret %struct.TIFFCodec* %61
}

declare i8* @_TIFFmalloc(i32) #1

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define void @TIFFUnRegisterCODEC(%struct.TIFFCodec*) #0 {
  %2 = alloca %struct.TIFFCodec*, align 8
  %3 = alloca %struct._codec*, align 8
  %4 = alloca %struct._codec**, align 8
  store %struct.TIFFCodec* %0, %struct.TIFFCodec** %2, align 8
  store %struct._codec** @registeredCODECS, %struct._codec*** %4, align 8
  br label %5

; <label>:5:                                      ; preds = %24, %1
  %6 = load %struct._codec**, %struct._codec*** %4, align 8
  %7 = load %struct._codec*, %struct._codec** %6, align 8
  store %struct._codec* %7, %struct._codec** %3, align 8
  %8 = icmp ne %struct._codec* %7, null
  br i1 %8, label %9, label %28

; <label>:9:                                      ; preds = %5
  %10 = load %struct._codec*, %struct._codec** %3, align 8
  %11 = getelementptr inbounds %struct._codec, %struct._codec* %10, i32 0, i32 1
  %12 = load %struct.TIFFCodec*, %struct.TIFFCodec** %11, align 8
  %13 = load %struct.TIFFCodec*, %struct.TIFFCodec** %2, align 8
  %14 = icmp eq %struct.TIFFCodec* %12, %13
  br i1 %14, label %15, label %23

; <label>:15:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFUnRegisterCODEC, i64 0, i64 2)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFUnRegisterCODEC, i64 0, i64 2)
  %17 = load %struct._codec*, %struct._codec** %3, align 8
  %18 = getelementptr inbounds %struct._codec, %struct._codec* %17, i32 0, i32 0
  %19 = load %struct._codec*, %struct._codec** %18, align 8
  %20 = load %struct._codec**, %struct._codec*** %4, align 8
  store %struct._codec* %19, %struct._codec** %20, align 8
  %21 = load %struct._codec*, %struct._codec** %3, align 8
  %22 = bitcast %struct._codec* %21 to i8*
  call void @_TIFFfree(i8* %22)
  br label %33

; <label>:23:                                     ; preds = %9
  br label %24

; <label>:24:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFUnRegisterCODEC, i64 0, i64 0)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFUnRegisterCODEC, i64 0, i64 0)
  %26 = load %struct._codec*, %struct._codec** %3, align 8
  %27 = getelementptr inbounds %struct._codec, %struct._codec* %26, i32 0, i32 0
  store %struct._codec** %27, %struct._codec*** %4, align 8
  br label %5

; <label>:28:                                     ; preds = %5
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFUnRegisterCODEC, i64 0, i64 1)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFUnRegisterCODEC, i64 0, i64 1)
  %30 = load %struct.TIFFCodec*, %struct.TIFFCodec** %2, align 8
  %31 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %30, i32 0, i32 0
  %32 = load i8*, i8** %31, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.7, i32 0, i32 0), i8* %32)
  br label %33

; <label>:33:                                     ; preds = %28, %15
  ret void
}

declare void @_TIFFfree(i8*) #1

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #4

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

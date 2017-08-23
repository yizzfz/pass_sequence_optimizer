; ModuleID = 'tmp1.ll'
source_filename = "tif_codec.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.TIFFCodec = type { i8*, i16, i32 (%struct.tiff*, i32)* }
%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [5 x i8] c"None\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"LZW\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"PackBits\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"ThunderScan\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"NeXT\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"JPEG\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Old-style JPEG\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"CCITT RLE\00", align 1
@.str.8 = private unnamed_addr constant [12 x i8] c"CCITT RLE/W\00", align 1
@.str.9 = private unnamed_addr constant [14 x i8] c"CCITT Group 3\00", align 1
@.str.10 = private unnamed_addr constant [14 x i8] c"CCITT Group 4\00", align 1
@.str.11 = private unnamed_addr constant [9 x i8] c"ISO JBIG\00", align 1
@.str.12 = private unnamed_addr constant [8 x i8] c"Deflate\00", align 1
@.str.13 = private unnamed_addr constant [13 x i8] c"AdobeDeflate\00", align 1
@.str.14 = private unnamed_addr constant [9 x i8] c"PixarLog\00", align 1
@.str.15 = private unnamed_addr constant [7 x i8] c"SGILog\00", align 1
@.str.16 = private unnamed_addr constant [9 x i8] c"SGILog24\00", align 1
@_TIFFBuiltinCODECS = global [18 x %struct.TIFFCodec] [%struct.TIFFCodec { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i16 1, i32 (%struct.tiff*, i32)* @TIFFInitDumpMode }, %struct.TIFFCodec { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i16 5, i32 (%struct.tiff*, i32)* @TIFFInitLZW }, %struct.TIFFCodec { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i16 -32763, i32 (%struct.tiff*, i32)* @TIFFInitPackBits }, %struct.TIFFCodec { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i16 -32727, i32 (%struct.tiff*, i32)* @TIFFInitThunderScan }, %struct.TIFFCodec { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), i16 32766, i32 (%struct.tiff*, i32)* @TIFFInitNeXT }, %struct.TIFFCodec { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), i16 7, i32 (%struct.tiff*, i32)* @NotConfigured }, %struct.TIFFCodec { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i32 0, i32 0), i16 6, i32 (%struct.tiff*, i32)* @NotConfigured }, %struct.TIFFCodec { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i32 0, i32 0), i16 2, i32 (%struct.tiff*, i32)* @TIFFInitCCITTRLE }, %struct.TIFFCodec { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.8, i32 0, i32 0), i16 -32765, i32 (%struct.tiff*, i32)* @TIFFInitCCITTRLEW }, %struct.TIFFCodec { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.9, i32 0, i32 0), i16 3, i32 (%struct.tiff*, i32)* @TIFFInitCCITTFax3 }, %struct.TIFFCodec { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.10, i32 0, i32 0), i16 4, i32 (%struct.tiff*, i32)* @TIFFInitCCITTFax4 }, %struct.TIFFCodec { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.11, i32 0, i32 0), i16 -30875, i32 (%struct.tiff*, i32)* @NotConfigured }, %struct.TIFFCodec { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.12, i32 0, i32 0), i16 -32590, i32 (%struct.tiff*, i32)* @NotConfigured }, %struct.TIFFCodec { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.13, i32 0, i32 0), i16 8, i32 (%struct.tiff*, i32)* @NotConfigured }, %struct.TIFFCodec { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.14, i32 0, i32 0), i16 -32627, i32 (%struct.tiff*, i32)* @NotConfigured }, %struct.TIFFCodec { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.15, i32 0, i32 0), i16 -30860, i32 (%struct.tiff*, i32)* @TIFFInitSGILog }, %struct.TIFFCodec { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.16, i32 0, i32 0), i16 -30859, i32 (%struct.tiff*, i32)* @TIFFInitSGILog }, %struct.TIFFCodec zeroinitializer], align 16
@.str.17 = private unnamed_addr constant [41 x i8] c"%s compression support is not configured\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_tmp1.ll_NotConfigured = private constant [21 x i8] c"tmp1.ll:NotConfigured"
@__profn_tmp1.ll__notConfigured = private constant [22 x i8] c"tmp1.ll:_notConfigured"
@__profc_tmp1.ll_NotConfigured = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_NotConfigured = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7769229645534477083, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_NotConfigured, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @NotConfigured to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll__notConfigured = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll__notConfigured = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1936479748563518943, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__notConfigured, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @_notConfigured to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [39 x i8] c",%x\DA+\C9-0\D4\CB\C9\B1\F2\CB/q\CE\CFK\CBL/-JMa,\81\8A\C6\E7!\0B\03\00j\E1\10s", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_NotConfigured to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll__notConfigured to i8*), i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

declare i32 @TIFFInitDumpMode(%struct.tiff*, i32) #0

declare i32 @TIFFInitLZW(%struct.tiff*, i32) #0

declare i32 @TIFFInitPackBits(%struct.tiff*, i32) #0

declare i32 @TIFFInitThunderScan(%struct.tiff*, i32) #0

declare i32 @TIFFInitNeXT(%struct.tiff*, i32) #0

; Function Attrs: nounwind uwtable
define internal i32 @NotConfigured(%struct.tiff*, i32) #1 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_NotConfigured, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_NotConfigured, i64 0, i64 0)
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load %struct.tiff*, %struct.tiff** %4, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 21
  store i32 (%struct.tiff*)* @_notConfigured, i32 (%struct.tiff*)** %7, align 8
  %8 = load %struct.tiff*, %struct.tiff** %4, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %8, i32 0, i32 23
  store i32 (%struct.tiff*)* @_notConfigured, i32 (%struct.tiff*)** %9, align 8
  ret i32 1
}

declare i32 @TIFFInitCCITTRLE(%struct.tiff*, i32) #0

declare i32 @TIFFInitCCITTRLEW(%struct.tiff*, i32) #0

declare i32 @TIFFInitCCITTFax3(%struct.tiff*, i32) #0

declare i32 @TIFFInitCCITTFax4(%struct.tiff*, i32) #0

declare i32 @TIFFInitSGILog(%struct.tiff*, i32) #0

; Function Attrs: nounwind uwtable
define internal i32 @_notConfigured(%struct.tiff*) #1 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__notConfigured, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__notConfigured, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFCodec*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %5 = load %struct.tiff*, %struct.tiff** %3, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %5, i32 0, i32 6
  %7 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %6, i32 0, i32 10
  %8 = load i16, i16* %7, align 8
  %9 = call %struct.TIFFCodec* @TIFFFindCODEC(i16 zeroext %8)
  store %struct.TIFFCodec* %9, %struct.TIFFCodec** %4, align 8
  %10 = load %struct.tiff*, %struct.tiff** %3, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 0
  %12 = load i8*, i8** %11, align 8
  %13 = load %struct.TIFFCodec*, %struct.TIFFCodec** %4, align 8
  %14 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %13, i32 0, i32 0
  %15 = load i8*, i8** %14, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %12, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.17, i32 0, i32 0), i8* %15)
  ret i32 0
}

declare %struct.TIFFCodec* @TIFFFindCODEC(i16 zeroext) #0

declare void @TIFFError(i8*, i8*, ...) #0

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

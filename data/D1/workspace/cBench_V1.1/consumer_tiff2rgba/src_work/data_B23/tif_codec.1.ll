; ModuleID = 'tif_codec.ll'
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
@_TIFFBuiltinCODECS = local_unnamed_addr global [18 x %struct.TIFFCodec] [%struct.TIFFCodec { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i16 1, i32 (%struct.tiff*, i32)* @TIFFInitDumpMode }, %struct.TIFFCodec { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i16 5, i32 (%struct.tiff*, i32)* @TIFFInitLZW }, %struct.TIFFCodec { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i16 -32763, i32 (%struct.tiff*, i32)* @TIFFInitPackBits }, %struct.TIFFCodec { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i16 -32727, i32 (%struct.tiff*, i32)* @TIFFInitThunderScan }, %struct.TIFFCodec { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), i16 32766, i32 (%struct.tiff*, i32)* @TIFFInitNeXT }, %struct.TIFFCodec { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), i16 7, i32 (%struct.tiff*, i32)* @NotConfigured }, %struct.TIFFCodec { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i32 0, i32 0), i16 6, i32 (%struct.tiff*, i32)* @NotConfigured }, %struct.TIFFCodec { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i32 0, i32 0), i16 2, i32 (%struct.tiff*, i32)* @TIFFInitCCITTRLE }, %struct.TIFFCodec { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.8, i32 0, i32 0), i16 -32765, i32 (%struct.tiff*, i32)* @TIFFInitCCITTRLEW }, %struct.TIFFCodec { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.9, i32 0, i32 0), i16 3, i32 (%struct.tiff*, i32)* @TIFFInitCCITTFax3 }, %struct.TIFFCodec { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.10, i32 0, i32 0), i16 4, i32 (%struct.tiff*, i32)* @TIFFInitCCITTFax4 }, %struct.TIFFCodec { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.11, i32 0, i32 0), i16 -30875, i32 (%struct.tiff*, i32)* @NotConfigured }, %struct.TIFFCodec { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.12, i32 0, i32 0), i16 -32590, i32 (%struct.tiff*, i32)* @NotConfigured }, %struct.TIFFCodec { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.13, i32 0, i32 0), i16 8, i32 (%struct.tiff*, i32)* @NotConfigured }, %struct.TIFFCodec { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.14, i32 0, i32 0), i16 -32627, i32 (%struct.tiff*, i32)* @NotConfigured }, %struct.TIFFCodec { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.15, i32 0, i32 0), i16 -30860, i32 (%struct.tiff*, i32)* @TIFFInitSGILog }, %struct.TIFFCodec { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.16, i32 0, i32 0), i16 -30859, i32 (%struct.tiff*, i32)* @TIFFInitSGILog }, %struct.TIFFCodec zeroinitializer], align 16
@.str.17 = private unnamed_addr constant [41 x i8] c"%s compression support is not configured\00", align 1

declare i32 @TIFFInitDumpMode(%struct.tiff*, i32) #0

declare i32 @TIFFInitLZW(%struct.tiff*, i32) #0

declare i32 @TIFFInitPackBits(%struct.tiff*, i32) #0

declare i32 @TIFFInitThunderScan(%struct.tiff*, i32) #0

declare i32 @TIFFInitNeXT(%struct.tiff*, i32) #0

; Function Attrs: noinline norecurse nounwind uwtable
define internal i32 @NotConfigured(%struct.tiff* nocapture, i32) #1 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 21
  store i32 (%struct.tiff*)* @_notConfigured, i32 (%struct.tiff*)** %3, align 8
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 23
  store i32 (%struct.tiff*)* @_notConfigured, i32 (%struct.tiff*)** %4, align 8
  ret i32 1
}

declare i32 @TIFFInitCCITTRLE(%struct.tiff*, i32) #0

declare i32 @TIFFInitCCITTRLEW(%struct.tiff*, i32) #0

declare i32 @TIFFInitCCITTFax3(%struct.tiff*, i32) #0

declare i32 @TIFFInitCCITTFax4(%struct.tiff*, i32) #0

declare i32 @TIFFInitSGILog(%struct.tiff*, i32) #0

; Function Attrs: noinline nounwind uwtable
define internal i32 @_notConfigured(%struct.tiff* nocapture readonly) #2 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 10
  %3 = load i16, i16* %2, align 8
  %4 = tail call %struct.TIFFCodec* @TIFFFindCODEC(i16 zeroext %3) #3
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %4, i64 0, i32 0
  %8 = load i8*, i8** %7, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %6, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.17, i64 0, i64 0), i8* %8) #3
  ret i32 0
}

declare %struct.TIFFCodec* @TIFFFindCODEC(i16 zeroext) local_unnamed_addr #0

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #0

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

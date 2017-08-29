; ModuleID = 'tmp1.ll'
source_filename = "tif_fax3.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tableentry = type { i16, i16, i16 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.TIFFFaxTabEnt = type { i8, i8, i32 }
%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.Fax3BaseState = type { i32, i32, i32, i16, i32, i32, i32, i32, i8*, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* }
%struct.Fax3DecodeState = type { %struct.Fax3BaseState, i8*, i32, i32, i32, void (i8*, i32*, i32*, i32)*, i32*, i32*, i32* }
%struct.Fax3EncodeState = type { %struct.Fax3BaseState, i32, i32, i32, i8*, i32, i32 }

$__llvm_profile_raw_version = comdat any

@TIFFFaxWhiteCodes = constant [109 x %struct.tableentry] [%struct.tableentry { i16 8, i16 53, i16 0 }, %struct.tableentry { i16 6, i16 7, i16 1 }, %struct.tableentry { i16 4, i16 7, i16 2 }, %struct.tableentry { i16 4, i16 8, i16 3 }, %struct.tableentry { i16 4, i16 11, i16 4 }, %struct.tableentry { i16 4, i16 12, i16 5 }, %struct.tableentry { i16 4, i16 14, i16 6 }, %struct.tableentry { i16 4, i16 15, i16 7 }, %struct.tableentry { i16 5, i16 19, i16 8 }, %struct.tableentry { i16 5, i16 20, i16 9 }, %struct.tableentry { i16 5, i16 7, i16 10 }, %struct.tableentry { i16 5, i16 8, i16 11 }, %struct.tableentry { i16 6, i16 8, i16 12 }, %struct.tableentry { i16 6, i16 3, i16 13 }, %struct.tableentry { i16 6, i16 52, i16 14 }, %struct.tableentry { i16 6, i16 53, i16 15 }, %struct.tableentry { i16 6, i16 42, i16 16 }, %struct.tableentry { i16 6, i16 43, i16 17 }, %struct.tableentry { i16 7, i16 39, i16 18 }, %struct.tableentry { i16 7, i16 12, i16 19 }, %struct.tableentry { i16 7, i16 8, i16 20 }, %struct.tableentry { i16 7, i16 23, i16 21 }, %struct.tableentry { i16 7, i16 3, i16 22 }, %struct.tableentry { i16 7, i16 4, i16 23 }, %struct.tableentry { i16 7, i16 40, i16 24 }, %struct.tableentry { i16 7, i16 43, i16 25 }, %struct.tableentry { i16 7, i16 19, i16 26 }, %struct.tableentry { i16 7, i16 36, i16 27 }, %struct.tableentry { i16 7, i16 24, i16 28 }, %struct.tableentry { i16 8, i16 2, i16 29 }, %struct.tableentry { i16 8, i16 3, i16 30 }, %struct.tableentry { i16 8, i16 26, i16 31 }, %struct.tableentry { i16 8, i16 27, i16 32 }, %struct.tableentry { i16 8, i16 18, i16 33 }, %struct.tableentry { i16 8, i16 19, i16 34 }, %struct.tableentry { i16 8, i16 20, i16 35 }, %struct.tableentry { i16 8, i16 21, i16 36 }, %struct.tableentry { i16 8, i16 22, i16 37 }, %struct.tableentry { i16 8, i16 23, i16 38 }, %struct.tableentry { i16 8, i16 40, i16 39 }, %struct.tableentry { i16 8, i16 41, i16 40 }, %struct.tableentry { i16 8, i16 42, i16 41 }, %struct.tableentry { i16 8, i16 43, i16 42 }, %struct.tableentry { i16 8, i16 44, i16 43 }, %struct.tableentry { i16 8, i16 45, i16 44 }, %struct.tableentry { i16 8, i16 4, i16 45 }, %struct.tableentry { i16 8, i16 5, i16 46 }, %struct.tableentry { i16 8, i16 10, i16 47 }, %struct.tableentry { i16 8, i16 11, i16 48 }, %struct.tableentry { i16 8, i16 82, i16 49 }, %struct.tableentry { i16 8, i16 83, i16 50 }, %struct.tableentry { i16 8, i16 84, i16 51 }, %struct.tableentry { i16 8, i16 85, i16 52 }, %struct.tableentry { i16 8, i16 36, i16 53 }, %struct.tableentry { i16 8, i16 37, i16 54 }, %struct.tableentry { i16 8, i16 88, i16 55 }, %struct.tableentry { i16 8, i16 89, i16 56 }, %struct.tableentry { i16 8, i16 90, i16 57 }, %struct.tableentry { i16 8, i16 91, i16 58 }, %struct.tableentry { i16 8, i16 74, i16 59 }, %struct.tableentry { i16 8, i16 75, i16 60 }, %struct.tableentry { i16 8, i16 50, i16 61 }, %struct.tableentry { i16 8, i16 51, i16 62 }, %struct.tableentry { i16 8, i16 52, i16 63 }, %struct.tableentry { i16 5, i16 27, i16 64 }, %struct.tableentry { i16 5, i16 18, i16 128 }, %struct.tableentry { i16 6, i16 23, i16 192 }, %struct.tableentry { i16 7, i16 55, i16 256 }, %struct.tableentry { i16 8, i16 54, i16 320 }, %struct.tableentry { i16 8, i16 55, i16 384 }, %struct.tableentry { i16 8, i16 100, i16 448 }, %struct.tableentry { i16 8, i16 101, i16 512 }, %struct.tableentry { i16 8, i16 104, i16 576 }, %struct.tableentry { i16 8, i16 103, i16 640 }, %struct.tableentry { i16 9, i16 204, i16 704 }, %struct.tableentry { i16 9, i16 205, i16 768 }, %struct.tableentry { i16 9, i16 210, i16 832 }, %struct.tableentry { i16 9, i16 211, i16 896 }, %struct.tableentry { i16 9, i16 212, i16 960 }, %struct.tableentry { i16 9, i16 213, i16 1024 }, %struct.tableentry { i16 9, i16 214, i16 1088 }, %struct.tableentry { i16 9, i16 215, i16 1152 }, %struct.tableentry { i16 9, i16 216, i16 1216 }, %struct.tableentry { i16 9, i16 217, i16 1280 }, %struct.tableentry { i16 9, i16 218, i16 1344 }, %struct.tableentry { i16 9, i16 219, i16 1408 }, %struct.tableentry { i16 9, i16 152, i16 1472 }, %struct.tableentry { i16 9, i16 153, i16 1536 }, %struct.tableentry { i16 9, i16 154, i16 1600 }, %struct.tableentry { i16 6, i16 24, i16 1664 }, %struct.tableentry { i16 9, i16 155, i16 1728 }, %struct.tableentry { i16 11, i16 8, i16 1792 }, %struct.tableentry { i16 11, i16 12, i16 1856 }, %struct.tableentry { i16 11, i16 13, i16 1920 }, %struct.tableentry { i16 12, i16 18, i16 1984 }, %struct.tableentry { i16 12, i16 19, i16 2048 }, %struct.tableentry { i16 12, i16 20, i16 2112 }, %struct.tableentry { i16 12, i16 21, i16 2176 }, %struct.tableentry { i16 12, i16 22, i16 2240 }, %struct.tableentry { i16 12, i16 23, i16 2304 }, %struct.tableentry { i16 12, i16 28, i16 2368 }, %struct.tableentry { i16 12, i16 29, i16 2432 }, %struct.tableentry { i16 12, i16 30, i16 2496 }, %struct.tableentry { i16 12, i16 31, i16 2560 }, %struct.tableentry { i16 12, i16 1, i16 -1 }, %struct.tableentry { i16 9, i16 1, i16 -2 }, %struct.tableentry { i16 10, i16 1, i16 -2 }, %struct.tableentry { i16 11, i16 1, i16 -2 }, %struct.tableentry { i16 12, i16 0, i16 -2 }], align 16
@TIFFFaxBlackCodes = constant [109 x %struct.tableentry] [%struct.tableentry { i16 10, i16 55, i16 0 }, %struct.tableentry { i16 3, i16 2, i16 1 }, %struct.tableentry { i16 2, i16 3, i16 2 }, %struct.tableentry { i16 2, i16 2, i16 3 }, %struct.tableentry { i16 3, i16 3, i16 4 }, %struct.tableentry { i16 4, i16 3, i16 5 }, %struct.tableentry { i16 4, i16 2, i16 6 }, %struct.tableentry { i16 5, i16 3, i16 7 }, %struct.tableentry { i16 6, i16 5, i16 8 }, %struct.tableentry { i16 6, i16 4, i16 9 }, %struct.tableentry { i16 7, i16 4, i16 10 }, %struct.tableentry { i16 7, i16 5, i16 11 }, %struct.tableentry { i16 7, i16 7, i16 12 }, %struct.tableentry { i16 8, i16 4, i16 13 }, %struct.tableentry { i16 8, i16 7, i16 14 }, %struct.tableentry { i16 9, i16 24, i16 15 }, %struct.tableentry { i16 10, i16 23, i16 16 }, %struct.tableentry { i16 10, i16 24, i16 17 }, %struct.tableentry { i16 10, i16 8, i16 18 }, %struct.tableentry { i16 11, i16 103, i16 19 }, %struct.tableentry { i16 11, i16 104, i16 20 }, %struct.tableentry { i16 11, i16 108, i16 21 }, %struct.tableentry { i16 11, i16 55, i16 22 }, %struct.tableentry { i16 11, i16 40, i16 23 }, %struct.tableentry { i16 11, i16 23, i16 24 }, %struct.tableentry { i16 11, i16 24, i16 25 }, %struct.tableentry { i16 12, i16 202, i16 26 }, %struct.tableentry { i16 12, i16 203, i16 27 }, %struct.tableentry { i16 12, i16 204, i16 28 }, %struct.tableentry { i16 12, i16 205, i16 29 }, %struct.tableentry { i16 12, i16 104, i16 30 }, %struct.tableentry { i16 12, i16 105, i16 31 }, %struct.tableentry { i16 12, i16 106, i16 32 }, %struct.tableentry { i16 12, i16 107, i16 33 }, %struct.tableentry { i16 12, i16 210, i16 34 }, %struct.tableentry { i16 12, i16 211, i16 35 }, %struct.tableentry { i16 12, i16 212, i16 36 }, %struct.tableentry { i16 12, i16 213, i16 37 }, %struct.tableentry { i16 12, i16 214, i16 38 }, %struct.tableentry { i16 12, i16 215, i16 39 }, %struct.tableentry { i16 12, i16 108, i16 40 }, %struct.tableentry { i16 12, i16 109, i16 41 }, %struct.tableentry { i16 12, i16 218, i16 42 }, %struct.tableentry { i16 12, i16 219, i16 43 }, %struct.tableentry { i16 12, i16 84, i16 44 }, %struct.tableentry { i16 12, i16 85, i16 45 }, %struct.tableentry { i16 12, i16 86, i16 46 }, %struct.tableentry { i16 12, i16 87, i16 47 }, %struct.tableentry { i16 12, i16 100, i16 48 }, %struct.tableentry { i16 12, i16 101, i16 49 }, %struct.tableentry { i16 12, i16 82, i16 50 }, %struct.tableentry { i16 12, i16 83, i16 51 }, %struct.tableentry { i16 12, i16 36, i16 52 }, %struct.tableentry { i16 12, i16 55, i16 53 }, %struct.tableentry { i16 12, i16 56, i16 54 }, %struct.tableentry { i16 12, i16 39, i16 55 }, %struct.tableentry { i16 12, i16 40, i16 56 }, %struct.tableentry { i16 12, i16 88, i16 57 }, %struct.tableentry { i16 12, i16 89, i16 58 }, %struct.tableentry { i16 12, i16 43, i16 59 }, %struct.tableentry { i16 12, i16 44, i16 60 }, %struct.tableentry { i16 12, i16 90, i16 61 }, %struct.tableentry { i16 12, i16 102, i16 62 }, %struct.tableentry { i16 12, i16 103, i16 63 }, %struct.tableentry { i16 10, i16 15, i16 64 }, %struct.tableentry { i16 12, i16 200, i16 128 }, %struct.tableentry { i16 12, i16 201, i16 192 }, %struct.tableentry { i16 12, i16 91, i16 256 }, %struct.tableentry { i16 12, i16 51, i16 320 }, %struct.tableentry { i16 12, i16 52, i16 384 }, %struct.tableentry { i16 12, i16 53, i16 448 }, %struct.tableentry { i16 13, i16 108, i16 512 }, %struct.tableentry { i16 13, i16 109, i16 576 }, %struct.tableentry { i16 13, i16 74, i16 640 }, %struct.tableentry { i16 13, i16 75, i16 704 }, %struct.tableentry { i16 13, i16 76, i16 768 }, %struct.tableentry { i16 13, i16 77, i16 832 }, %struct.tableentry { i16 13, i16 114, i16 896 }, %struct.tableentry { i16 13, i16 115, i16 960 }, %struct.tableentry { i16 13, i16 116, i16 1024 }, %struct.tableentry { i16 13, i16 117, i16 1088 }, %struct.tableentry { i16 13, i16 118, i16 1152 }, %struct.tableentry { i16 13, i16 119, i16 1216 }, %struct.tableentry { i16 13, i16 82, i16 1280 }, %struct.tableentry { i16 13, i16 83, i16 1344 }, %struct.tableentry { i16 13, i16 84, i16 1408 }, %struct.tableentry { i16 13, i16 85, i16 1472 }, %struct.tableentry { i16 13, i16 90, i16 1536 }, %struct.tableentry { i16 13, i16 91, i16 1600 }, %struct.tableentry { i16 13, i16 100, i16 1664 }, %struct.tableentry { i16 13, i16 101, i16 1728 }, %struct.tableentry { i16 11, i16 8, i16 1792 }, %struct.tableentry { i16 11, i16 12, i16 1856 }, %struct.tableentry { i16 11, i16 13, i16 1920 }, %struct.tableentry { i16 12, i16 18, i16 1984 }, %struct.tableentry { i16 12, i16 19, i16 2048 }, %struct.tableentry { i16 12, i16 20, i16 2112 }, %struct.tableentry { i16 12, i16 21, i16 2176 }, %struct.tableentry { i16 12, i16 22, i16 2240 }, %struct.tableentry { i16 12, i16 23, i16 2304 }, %struct.tableentry { i16 12, i16 28, i16 2368 }, %struct.tableentry { i16 12, i16 29, i16 2432 }, %struct.tableentry { i16 12, i16 30, i16 2496 }, %struct.tableentry { i16 12, i16 31, i16 2560 }, %struct.tableentry { i16 12, i16 1, i16 -1 }, %struct.tableentry { i16 9, i16 1, i16 -2 }, %struct.tableentry { i16 10, i16 1, i16 -2 }, %struct.tableentry { i16 11, i16 1, i16 -2 }, %struct.tableentry { i16 12, i16 0, i16 -2 }], align 16
@_TIFFFax3fillruns._fillmasks = internal constant [9 x i8] c"\00\80\C0\E0\F0\F8\FC\FE\FF", align 1
@.str = private unnamed_addr constant [11 x i8] c"x == lastx\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"tif_fax3.c\00", align 1
@__PRETTY_FUNCTION__._TIFFFax3fillruns = private unnamed_addr constant [61 x i8] c"void _TIFFFax3fillruns(u_char *, uint32 *, uint32 *, uint32)\00", align 1
@fax3FieldInfo = internal constant [1 x %struct.TIFFFieldInfo] [%struct.TIFFFieldInfo { i32 292, i16 1, i16 1, i32 4, i16 68, i8 0, i8 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.42, i32 0, i32 0) }], align 16
@fax4FieldInfo = internal constant [1 x %struct.TIFFFieldInfo] [%struct.TIFFFieldInfo { i32 293, i16 1, i16 1, i32 4, i16 68, i8 0, i8 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.43, i32 0, i32 0) }], align 16
@.str.2 = private unnamed_addr constant [18 x i8] c"TIFFInitCCITTFax3\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"%s: No space for state block\00", align 1
@faxFieldInfo = internal constant [10 x %struct.TIFFFieldInfo] [%struct.TIFFFieldInfo { i32 65536, i16 0, i16 0, i32 0, i16 0, i8 0, i8 0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 65540, i16 0, i16 0, i32 0, i16 0, i8 0, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 326, i16 1, i16 1, i32 4, i16 62, i8 1, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 326, i16 1, i16 1, i32 3, i16 62, i8 1, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 327, i16 1, i16 1, i32 3, i16 63, i8 1, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 328, i16 1, i16 1, i32 4, i16 64, i8 1, i8 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 328, i16 1, i16 1, i32 3, i16 64, i8 1, i8 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 34908, i16 1, i16 1, i32 4, i16 65, i8 1, i8 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.9, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 34909, i16 -1, i16 -1, i32 2, i16 66, i8 1, i8 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.10, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 34910, i16 1, i16 1, i32 4, i16 67, i8 1, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0) }], align 16
@.str.4 = private unnamed_addr constant [8 x i8] c"FaxMode\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"FaxFillFunc\00", align 1
@.str.6 = private unnamed_addr constant [12 x i8] c"BadFaxLines\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"CleanFaxData\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"ConsecutiveBadFaxLines\00", align 1
@.str.9 = private unnamed_addr constant [14 x i8] c"FaxRecvParams\00", align 1
@.str.10 = private unnamed_addr constant [14 x i8] c"FaxSubAddress\00", align 1
@.str.11 = private unnamed_addr constant [12 x i8] c"FaxRecvTime\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.13 = private unnamed_addr constant [19 x i8] c"  Group 4 Options:\00", align 1
@.str.14 = private unnamed_addr constant [20 x i8] c"%suncompressed data\00", align 1
@.str.15 = private unnamed_addr constant [19 x i8] c"  Group 3 Options:\00", align 1
@.str.16 = private unnamed_addr constant [15 x i8] c"%s2-d encoding\00", align 1
@.str.17 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@.str.18 = private unnamed_addr constant [14 x i8] c"%sEOL padding\00", align 1
@.str.19 = private unnamed_addr constant [16 x i8] c" (%lu = 0x%lx)\0A\00", align 1
@.str.20 = private unnamed_addr constant [12 x i8] c"  Fax Data:\00", align 1
@.str.21 = private unnamed_addr constant [7 x i8] c" clean\00", align 1
@.str.22 = private unnamed_addr constant [22 x i8] c" receiver regenerated\00", align 1
@.str.23 = private unnamed_addr constant [20 x i8] c" uncorrected errors\00", align 1
@.str.24 = private unnamed_addr constant [14 x i8] c" (%u = 0x%x)\0A\00", align 1
@.str.25 = private unnamed_addr constant [22 x i8] c"  Bad Fax Lines: %lu\0A\00", align 1
@.str.26 = private unnamed_addr constant [34 x i8] c"  Consecutive Bad Fax Lines: %lu\0A\00", align 1
@.str.27 = private unnamed_addr constant [33 x i8] c"  Fax Receive Parameters: %08lx\0A\00", align 1
@.str.28 = private unnamed_addr constant [22 x i8] c"  Fax SubAddress: %s\0A\00", align 1
@.str.29 = private unnamed_addr constant [30 x i8] c"  Fax Receive Time: %lu secs\0A\00", align 1
@.str.30 = private unnamed_addr constant [54 x i8] c"Bits/sample must be 1 for Group 3/4 encoding/decoding\00", align 1
@.str.31 = private unnamed_addr constant [15 x i8] c"Fax3SetupState\00", align 1
@.str.32 = private unnamed_addr constant [38 x i8] c"%s: No space for Group 3/4 run arrays\00", align 1
@.str.33 = private unnamed_addr constant [42 x i8] c"%s: No space for Group 3/4 reference line\00", align 1
@Fax3Decode2D.module = internal constant [13 x i8] c"Fax3Decode2D\00", align 1
@TIFFFaxWhiteTable = external constant [0 x %struct.TIFFFaxTabEnt], align 4
@TIFFFaxBlackTable = external constant [0 x %struct.TIFFFaxTabEnt], align 4
@TIFFFaxMainTable = external constant [0 x %struct.TIFFFaxTabEnt], align 4
@.str.34 = private unnamed_addr constant [41 x i8] c"%s: Bad code word at scanline %d (x %lu)\00", align 1
@.str.35 = private unnamed_addr constant [41 x i8] c"%s: Premature EOF at scanline %d (x %lu)\00", align 1
@.str.36 = private unnamed_addr constant [46 x i8] c"%s: %s at scanline %d (got %lu, expected %lu)\00", align 1
@.str.37 = private unnamed_addr constant [14 x i8] c"Premature EOL\00", align 1
@.str.38 = private unnamed_addr constant [21 x i8] c"Line length mismatch\00", align 1
@.str.39 = private unnamed_addr constant [61 x i8] c"%s: Uncompressed data (not supported) at scanline %d (x %lu)\00", align 1
@.str.40 = private unnamed_addr constant [11 x i8] c"sp != NULL\00", align 1
@__PRETTY_FUNCTION__.Fax3PreDecode = private unnamed_addr constant [37 x i8] c"int Fax3PreDecode(TIFF *, tsample_t)\00", align 1
@Fax3Decode1D.module = internal constant [13 x i8] c"Fax3Decode1D\00", align 1
@__PRETTY_FUNCTION__.Fax3PreEncode = private unnamed_addr constant [37 x i8] c"int Fax3PreEncode(TIFF *, tsample_t)\00", align 1
@_msbmask = internal constant [9 x i32] [i32 0, i32 1, i32 3, i32 7, i32 15, i32 31, i32 63, i32 127, i32 255], align 16
@zeroruns = internal constant [256 x i8] c"\08\07\06\06\05\05\05\05\04\04\04\04\04\04\04\04\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str.41 = private unnamed_addr constant [27 x i8] c"te->runlen == 64*(span>>6)\00", align 1
@__PRETTY_FUNCTION__.putspan = private unnamed_addr constant [48 x i8] c"void putspan(TIFF *, int32, const tableentry *)\00", align 1
@oneruns = internal constant [256 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\04\04\04\04\04\04\04\04\05\05\05\05\06\06\07\08", align 16
@horizcode = internal constant %struct.tableentry { i16 3, i16 1, i16 0 }, align 2
@vcodes = internal constant [7 x %struct.tableentry] [%struct.tableentry { i16 7, i16 3, i16 0 }, %struct.tableentry { i16 6, i16 3, i16 0 }, %struct.tableentry { i16 3, i16 3, i16 0 }, %struct.tableentry { i16 1, i16 1, i16 0 }, %struct.tableentry { i16 3, i16 2, i16 0 }, %struct.tableentry { i16 6, i16 2, i16 0 }, %struct.tableentry { i16 7, i16 2, i16 0 }], align 16
@passcode = internal constant %struct.tableentry { i16 4, i16 1, i16 0 }, align 2
@.str.42 = private unnamed_addr constant [14 x i8] c"Group3Options\00", align 1
@.str.43 = private unnamed_addr constant [14 x i8] c"Group4Options\00", align 1
@Fax4Decode.module = internal constant [11 x i8] c"Fax4Decode\00", align 1
@Fax3DecodeRLE.module = internal constant [14 x i8] c"Fax3DecodeRLE\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn__TIFFFax3fillruns = private constant [17 x i8] c"_TIFFFax3fillruns"
@__profn_TIFFInitCCITTFax3 = private constant [17 x i8] c"TIFFInitCCITTFax3"
@__profn_tmp1.ll_InitCCITTFax3 = private constant [21 x i8] c"tmp1.ll:InitCCITTFax3"
@__profn_TIFFInitCCITTFax4 = private constant [17 x i8] c"TIFFInitCCITTFax4"
@__profn_tmp1.ll_Fax4Decode = private constant [18 x i8] c"tmp1.ll:Fax4Decode"
@__profn_tmp1.ll_Fax4Encode = private constant [18 x i8] c"tmp1.ll:Fax4Encode"
@__profn_tmp1.ll_Fax4PostEncode = private constant [22 x i8] c"tmp1.ll:Fax4PostEncode"
@__profn_TIFFInitCCITTRLE = private constant [16 x i8] c"TIFFInitCCITTRLE"
@__profn_tmp1.ll_Fax3DecodeRLE = private constant [21 x i8] c"tmp1.ll:Fax3DecodeRLE"
@__profn_TIFFInitCCITTRLEW = private constant [17 x i8] c"TIFFInitCCITTRLEW"
@__profn_tmp1.ll_Fax3VGetField = private constant [21 x i8] c"tmp1.ll:Fax3VGetField"
@__profn_tmp1.ll_Fax3VSetField = private constant [21 x i8] c"tmp1.ll:Fax3VSetField"
@__profn_tmp1.ll_Fax3PrintDir = private constant [20 x i8] c"tmp1.ll:Fax3PrintDir"
@__profn_tmp1.ll_Fax3SetupState = private constant [22 x i8] c"tmp1.ll:Fax3SetupState"
@__profn_tmp1.ll_Fax3PreDecode = private constant [21 x i8] c"tmp1.ll:Fax3PreDecode"
@__profn_tmp1.ll_Fax3Decode1D = private constant [20 x i8] c"tmp1.ll:Fax3Decode1D"
@__profn_tmp1.ll_Fax3PreEncode = private constant [21 x i8] c"tmp1.ll:Fax3PreEncode"
@__profn_tmp1.ll_Fax3PostEncode = private constant [22 x i8] c"tmp1.ll:Fax3PostEncode"
@__profn_tmp1.ll_Fax3Encode = private constant [18 x i8] c"tmp1.ll:Fax3Encode"
@__profn_tmp1.ll_Fax3Close = private constant [17 x i8] c"tmp1.ll:Fax3Close"
@__profn_tmp1.ll_Fax3Cleanup = private constant [19 x i8] c"tmp1.ll:Fax3Cleanup"
@__profn_tmp1.ll_Fax3Decode2D = private constant [20 x i8] c"tmp1.ll:Fax3Decode2D"
@__profn_tmp1.ll_Fax3Unexpected = private constant [22 x i8] c"tmp1.ll:Fax3Unexpected"
@__profn_tmp1.ll_Fax3PrematureEOF = private constant [24 x i8] c"tmp1.ll:Fax3PrematureEOF"
@__profn_tmp1.ll_Fax3BadLength = private constant [21 x i8] c"tmp1.ll:Fax3BadLength"
@__profn_tmp1.ll_Fax3Extension = private constant [21 x i8] c"tmp1.ll:Fax3Extension"
@__profn_tmp1.ll_Fax3PutEOL = private constant [18 x i8] c"tmp1.ll:Fax3PutEOL"
@__profn_tmp1.ll_Fax3Encode1DRow = private constant [23 x i8] c"tmp1.ll:Fax3Encode1DRow"
@__profn_tmp1.ll_Fax3Encode2DRow = private constant [23 x i8] c"tmp1.ll:Fax3Encode2DRow"
@__profn_tmp1.ll_find0span = private constant [17 x i8] c"tmp1.ll:find0span"
@__profn_tmp1.ll_putspan = private constant [15 x i8] c"tmp1.ll:putspan"
@__profn_tmp1.ll_find1span = private constant [17 x i8] c"tmp1.ll:find1span"
@__profn_tmp1.ll_Fax3PutBits = private constant [19 x i8] c"tmp1.ll:Fax3PutBits"
@__profc__TIFFFax3fillruns = private global [38 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFFax3fillruns = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7013336496999597783, i64 477619072110, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i32 0, i32 0), i8* bitcast (void (i8*, i32*, i32*, i32)* @_TIFFFax3fillruns to i8*), i8* null, i32 38, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFInitCCITTFax3 = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFInitCCITTFax3 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7738632123124970339, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTFax3, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @TIFFInitCCITTFax3 to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_InitCCITTFax3 = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_InitCCITTFax3 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8834543774377052356, i64 64202863865, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_InitCCITTFax3, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFInitCCITTFax4 = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFInitCCITTFax4 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4450605661438697491, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTFax4, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @TIFFInitCCITTFax4 to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax4Decode = private global [88 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_Fax4Decode = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_Fax4Decode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8730738532302761481, i64 564599744482429, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @Fax4Decode to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_Fax4Decode to i8*), i32 88, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax4Encode = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax4Encode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7446951847374120726, i64 58190265016, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Fax4Encode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @Fax4Encode to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax4PostEncode = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax4PostEncode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2962410947480887310, i64 35373395463, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax4PostEncode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @Fax4PostEncode to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFInitCCITTRLE = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFInitCCITTRLE = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7378052813830802141, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTRLE, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @TIFFInitCCITTRLE to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3DecodeRLE = private global [43 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_Fax3DecodeRLE = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_Fax3DecodeRLE = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 901512527913222905, i64 563778543903862, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @Fax3DecodeRLE to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_Fax3DecodeRLE to i8*), i32 43, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_TIFFInitCCITTRLEW = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFInitCCITTRLEW = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2955207134399663709, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTRLEW, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @TIFFInitCCITTRLEW to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3VGetField = private global [21 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_Fax3VGetField = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_Fax3VGetField = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5736057570547837556, i64 281748360019850, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @Fax3VGetField to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_Fax3VGetField to i8*), i32 21, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3VSetField = private global [21 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_Fax3VSetField = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_Fax3VSetField = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7593379799835772616, i64 281745565965530, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @Fax3VSetField to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_Fax3VSetField to i8*), i32 21, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3PrintDir = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax3PrintDir = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8947615130386462413, i64 200238167398, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i32 0, i32 0), i8* bitcast (void (%struct.tiff*, %struct._IO_FILE*, i64)* @Fax3PrintDir to i8*), i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3SetupState = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax3SetupState = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1041783081964919369, i64 166031161408, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @Fax3SetupState to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3PreDecode = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax3PreDecode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -168336314105055927, i64 46272211098, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax3PreDecode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i16)* @Fax3PreDecode to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3Decode1D = private global [59 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_Fax3Decode1D = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_Fax3Decode1D = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4712594746252265484, i64 564124234551627, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Decode1D to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_Fax3Decode1D to i8*), i32 59, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3PreEncode = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax3PreEncode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8516855311039593593, i64 72057669163241232, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3PreEncode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i16)* @Fax3PreEncode to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3PostEncode = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax3PostEncode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -123496379196421623, i64 35373395463, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax3PostEncode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @Fax3PostEncode to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3Encode = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax3Encode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5906462311642207507, i64 148143096599, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Encode to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3Close = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax3Close = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -253032142383851096, i64 72071620186, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3Close, i32 0, i32 0), i8* bitcast (void (%struct.tiff*)* @Fax3Close to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3Cleanup = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax3Cleanup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5237421952162219044, i64 81226582395, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3Cleanup, i32 0, i32 0), i8* bitcast (void (%struct.tiff*)* @Fax3Cleanup to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3Decode2D = private global [148 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_Fax3Decode2D = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_Fax3Decode2D = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8615113381506012891, i64 565778956064354, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Decode2D to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_Fax3Decode2D to i8*), i32 148, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3Unexpected = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax3Unexpected = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2256942473204554323, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_Fax3Unexpected, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3PrematureEOF = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax3PrematureEOF = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8404433669338812391, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_Fax3PrematureEOF, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3BadLength = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax3BadLength = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3016030735031344515, i64 72057606922829823, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Fax3BadLength, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3Extension = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax3Extension = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2099309197753321689, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_Fax3Extension, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3PutEOL = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax3PutEOL = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5120054372440141425, i64 178508525468, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i32 0, i32 0), i8* null, i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3Encode1DRow = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax3Encode1DRow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3673403160851020005, i64 117737062030, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3Encode2DRow = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax3Encode2DRow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1602413426462343690, i64 256113889808, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i32 0, i32 0), i8* null, i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_find0span = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_find0span = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7771192377222321978, i64 212056046229, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i32 0, i32 0), i8* null, i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_putspan = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_putspan = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8913882586724289629, i64 231590365392, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i32 0, i32 0), i8* null, i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_find1span = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_find1span = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2276523683711861972, i64 212056046229, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i32 0, i32 0), i8* null, i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_Fax3PutBits = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_Fax3PutBits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2692561884590613200, i64 65462936709, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3PutBits, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [681 x i8] c"\A6\05\00_TIFFFax3fillruns\01TIFFInitCCITTFax3\01tmp1.ll:InitCCITTFax3\01TIFFInitCCITTFax4\01tmp1.ll:Fax4Decode\01tmp1.ll:Fax4Encode\01tmp1.ll:Fax4PostEncode\01TIFFInitCCITTRLE\01tmp1.ll:Fax3DecodeRLE\01TIFFInitCCITTRLEW\01tmp1.ll:Fax3VGetField\01tmp1.ll:Fax3VSetField\01tmp1.ll:Fax3PrintDir\01tmp1.ll:Fax3SetupState\01tmp1.ll:Fax3PreDecode\01tmp1.ll:Fax3Decode1D\01tmp1.ll:Fax3PreEncode\01tmp1.ll:Fax3PostEncode\01tmp1.ll:Fax3Encode\01tmp1.ll:Fax3Close\01tmp1.ll:Fax3Cleanup\01tmp1.ll:Fax3Decode2D\01tmp1.ll:Fax3Unexpected\01tmp1.ll:Fax3PrematureEOF\01tmp1.ll:Fax3BadLength\01tmp1.ll:Fax3Extension\01tmp1.ll:Fax3PutEOL\01tmp1.ll:Fax3Encode1DRow\01tmp1.ll:Fax3Encode2DRow\01tmp1.ll:find0span\01tmp1.ll:putspan\01tmp1.ll:find1span\01tmp1.ll:Fax3PutBits", section "__llvm_prf_names"
@llvm.used = appending global [35 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFFax3fillruns to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFInitCCITTFax3 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_InitCCITTFax3 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFInitCCITTFax4 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax4Decode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax4Encode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax4PostEncode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFInitCCITTRLE to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3DecodeRLE to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFInitCCITTRLEW to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3VGetField to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3VSetField to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3PrintDir to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3SetupState to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3PreDecode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3Decode1D to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3PreEncode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3PostEncode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3Encode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3Close to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3Cleanup to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3Decode2D to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3Unexpected to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3PrematureEOF to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3BadLength to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3Extension to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3PutEOL to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3Encode1DRow to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3Encode2DRow to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_find0span to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_putspan to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_find1span to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3PutBits to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([681 x i8], [681 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @_TIFFFax3fillruns(i8*, i32*, i32*, i32) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i64*, align 8
  store i8* %0, i8** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32* %2, i32** %7, align 8
  store i32 %3, i32* %8, align 4
  %16 = load i32*, i32** %7, align 8
  %17 = load i32*, i32** %6, align 8
  %18 = ptrtoint i32* %16 to i64
  %19 = ptrtoint i32* %17 to i64
  %20 = sub i64 %18, %19
  %21 = sdiv exact i64 %20, 4
  %22 = and i64 %21, 1
  %23 = icmp ne i64 %22, 0
  br i1 %23, label %24, label %28

; <label>:24:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 36)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 36)
  %26 = load i32*, i32** %7, align 8
  %27 = getelementptr inbounds i32, i32* %26, i32 1
  store i32* %27, i32** %7, align 8
  store i32 0, i32* %26, align 4
  br label %28

; <label>:28:                                     ; preds = %24, %4
  store i32 0, i32* %10, align 4
  br label %29

; <label>:29:                                     ; preds = %386, %28
  %30 = load i32*, i32** %6, align 8
  %31 = load i32*, i32** %7, align 8
  %32 = icmp ult i32* %30, %31
  br i1 %32, label %33, label %390

; <label>:33:                                     ; preds = %29
  %34 = load i32*, i32** %6, align 8
  %35 = getelementptr inbounds i32, i32* %34, i64 0
  %36 = load i32, i32* %35, align 4
  store i32 %36, i32* %12, align 4
  %37 = load i32, i32* %10, align 4
  %38 = load i32, i32* %12, align 4
  %39 = add i32 %37, %38
  %40 = load i32, i32* %8, align 4
  %41 = icmp ugt i32 %39, %40
  br i1 %41, label %42, label %51

; <label>:42:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 7)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 7)
  %44 = load i32, i32* %8, align 4
  %45 = load i32, i32* %10, align 4
  %46 = sub i32 %44, %45
  %47 = trunc i32 %46 to i16
  %48 = zext i16 %47 to i32
  %49 = load i32*, i32** %6, align 8
  %50 = getelementptr inbounds i32, i32* %49, i64 0
  store i32 %48, i32* %50, align 4
  store i32 %48, i32* %12, align 4
  br label %51

; <label>:51:                                     ; preds = %42, %33
  %52 = load i32, i32* %12, align 4
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %211

; <label>:54:                                     ; preds = %51
  %55 = load i8*, i8** %5, align 8
  %56 = load i32, i32* %10, align 4
  %57 = lshr i32 %56, 3
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8* %55, i64 %58
  store i8* %59, i8** %9, align 8
  %60 = load i32, i32* %10, align 4
  %61 = and i32 %60, 7
  store i32 %61, i32* %11, align 4
  %62 = load i32, i32* %12, align 4
  %63 = load i32, i32* %11, align 4
  %64 = sub i32 8, %63
  %65 = icmp ugt i32 %62, %64
  br i1 %65, label %66, label %189

; <label>:66:                                     ; preds = %54
  %67 = load i32, i32* %11, align 4
  %68 = icmp ne i32 %67, 0
  br i1 %68, label %69, label %84

; <label>:69:                                     ; preds = %66
  %pgocount2 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 13)
  %70 = add i64 %pgocount2, 1
  store i64 %70, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 13)
  %71 = load i32, i32* %11, align 4
  %72 = sub i32 8, %71
  %73 = shl i32 255, %72
  %74 = load i8*, i8** %9, align 8
  %75 = getelementptr inbounds i8, i8* %74, i32 1
  store i8* %75, i8** %9, align 8
  %76 = load i8, i8* %74, align 1
  %77 = zext i8 %76 to i32
  %78 = and i32 %77, %73
  %79 = trunc i32 %78 to i8
  store i8 %79, i8* %74, align 1
  %80 = load i32, i32* %11, align 4
  %81 = sub i32 8, %80
  %82 = load i32, i32* %12, align 4
  %83 = sub i32 %82, %81
  store i32 %83, i32* %12, align 4
  br label %84

; <label>:84:                                     ; preds = %69, %66
  %85 = load i32, i32* %12, align 4
  %86 = lshr i32 %85, 3
  store i32 %86, i32* %13, align 4
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %88, label %179

; <label>:88:                                     ; preds = %84
  %89 = load i32, i32* %13, align 4
  %90 = sext i32 %89 to i64
  %91 = udiv i64 %90, 8
  %92 = icmp ugt i64 %91, 1
  br i1 %92, label %93, label %139

; <label>:93:                                     ; preds = %88
  br label %94

; <label>:94:                                     ; preds = %109, %93
  %95 = load i32, i32* %13, align 4
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %104

; <label>:97:                                     ; preds = %94
  %pgocount3 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 4)
  %98 = add i64 %pgocount3, 1
  store i64 %98, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 4)
  %99 = load i8*, i8** %9, align 8
  %100 = ptrtoint i8* %99 to i64
  %101 = and i64 %100, 7
  %102 = icmp eq i64 %101, 0
  %103 = xor i1 %102, true
  br label %104

; <label>:104:                                    ; preds = %97, %94
  %105 = phi i1 [ false, %94 ], [ %103, %97 ]
  br i1 %105, label %106, label %113

; <label>:106:                                    ; preds = %104
  %107 = load i8*, i8** %9, align 8
  %108 = getelementptr inbounds i8, i8* %107, i32 1
  store i8* %108, i8** %9, align 8
  store i8 0, i8* %107, align 1
  br label %109

; <label>:109:                                    ; preds = %106
  %pgocount4 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 2)
  %110 = add i64 %pgocount4, 1
  store i64 %110, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 2)
  %111 = load i32, i32* %13, align 4
  %112 = add nsw i32 %111, -1
  store i32 %112, i32* %13, align 4
  br label %94

; <label>:113:                                    ; preds = %104
  %114 = load i8*, i8** %9, align 8
  %115 = bitcast i8* %114 to i64*
  store i64* %115, i64** %15, align 8
  %116 = load i32, i32* %13, align 4
  %117 = sext i32 %116 to i64
  %118 = udiv i64 %117, 8
  %119 = trunc i64 %118 to i32
  store i32 %119, i32* %14, align 4
  %120 = load i32, i32* %14, align 4
  %121 = sext i32 %120 to i64
  %122 = mul i64 %121, 8
  %123 = load i32, i32* %13, align 4
  %124 = sext i32 %123 to i64
  %125 = sub i64 %124, %122
  %126 = trunc i64 %125 to i32
  store i32 %126, i32* %13, align 4
  br label %127

; <label>:127:                                    ; preds = %131, %113
  %pgocount5 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 0)
  %128 = add i64 %pgocount5, 1
  store i64 %128, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 0)
  %129 = load i64*, i64** %15, align 8
  %130 = getelementptr inbounds i64, i64* %129, i32 1
  store i64* %130, i64** %15, align 8
  store i64 0, i64* %129, align 8
  br label %131

; <label>:131:                                    ; preds = %127
  %132 = load i32, i32* %14, align 4
  %133 = add nsw i32 %132, -1
  store i32 %133, i32* %14, align 4
  %134 = icmp ne i32 %133, 0
  br i1 %134, label %127, label %135

; <label>:135:                                    ; preds = %131
  %pgocount6 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 25)
  %136 = add i64 %pgocount6, 1
  store i64 %136, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 25)
  %137 = load i64*, i64** %15, align 8
  %138 = bitcast i64* %137 to i8*
  store i8* %138, i8** %9, align 8
  br label %139

; <label>:139:                                    ; preds = %135, %88
  %140 = load i32, i32* %13, align 4
  switch i32 %140, label %175 [
    i32 7, label %141
    i32 6, label %145
    i32 5, label %149
    i32 4, label %153
    i32 3, label %157
    i32 2, label %161
    i32 1, label %165
    i32 0, label %173
  ]

; <label>:141:                                    ; preds = %139
  %pgocount7 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 34)
  %142 = add i64 %pgocount7, 1
  store i64 %142, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 34)
  %143 = load i8*, i8** %9, align 8
  %144 = getelementptr inbounds i8, i8* %143, i64 6
  store i8 0, i8* %144, align 1
  br label %145

; <label>:145:                                    ; preds = %141, %139
  %pgocount8 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 31)
  %146 = add i64 %pgocount8, 1
  store i64 %146, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 31)
  %147 = load i8*, i8** %9, align 8
  %148 = getelementptr inbounds i8, i8* %147, i64 5
  store i8 0, i8* %148, align 1
  br label %149

; <label>:149:                                    ; preds = %145, %139
  %pgocount9 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 29)
  %150 = add i64 %pgocount9, 1
  store i64 %150, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 29)
  %151 = load i8*, i8** %9, align 8
  %152 = getelementptr inbounds i8, i8* %151, i64 4
  store i8 0, i8* %152, align 1
  br label %153

; <label>:153:                                    ; preds = %149, %139
  %pgocount10 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 27)
  %154 = add i64 %pgocount10, 1
  store i64 %154, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 27)
  %155 = load i8*, i8** %9, align 8
  %156 = getelementptr inbounds i8, i8* %155, i64 3
  store i8 0, i8* %156, align 1
  br label %157

; <label>:157:                                    ; preds = %153, %139
  %pgocount11 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 23)
  %158 = add i64 %pgocount11, 1
  store i64 %158, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 23)
  %159 = load i8*, i8** %9, align 8
  %160 = getelementptr inbounds i8, i8* %159, i64 2
  store i8 0, i8* %160, align 1
  br label %161

; <label>:161:                                    ; preds = %157, %139
  %pgocount12 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 21)
  %162 = add i64 %pgocount12, 1
  store i64 %162, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 21)
  %163 = load i8*, i8** %9, align 8
  %164 = getelementptr inbounds i8, i8* %163, i64 1
  store i8 0, i8* %164, align 1
  br label %165

; <label>:165:                                    ; preds = %161, %139
  %pgocount13 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 19)
  %166 = add i64 %pgocount13, 1
  store i64 %166, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 19)
  %167 = load i8*, i8** %9, align 8
  %168 = getelementptr inbounds i8, i8* %167, i64 0
  store i8 0, i8* %168, align 1
  %169 = load i32, i32* %13, align 4
  %170 = load i8*, i8** %9, align 8
  %171 = sext i32 %169 to i64
  %172 = getelementptr inbounds i8, i8* %170, i64 %171
  store i8* %172, i8** %9, align 8
  br label %173

; <label>:173:                                    ; preds = %165, %139
  %pgocount14 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 17)
  %174 = add i64 %pgocount14, 1
  store i64 %174, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 17)
  br label %175

; <label>:175:                                    ; preds = %173, %139
  %pgocount15 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 14)
  %176 = add i64 %pgocount15, 1
  store i64 %176, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 14)
  %177 = load i32, i32* %12, align 4
  %178 = and i32 %177, 7
  store i32 %178, i32* %12, align 4
  br label %179

; <label>:179:                                    ; preds = %175, %84
  %pgocount16 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 9)
  %180 = add i64 %pgocount16, 1
  store i64 %180, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 9)
  %181 = load i32, i32* %12, align 4
  %182 = ashr i32 255, %181
  %183 = load i8*, i8** %9, align 8
  %184 = getelementptr inbounds i8, i8* %183, i64 0
  %185 = load i8, i8* %184, align 1
  %186 = zext i8 %185 to i32
  %187 = and i32 %186, %182
  %188 = trunc i32 %187 to i8
  store i8 %188, i8* %184, align 1
  br label %205

; <label>:189:                                    ; preds = %54
  %pgocount17 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 10)
  %190 = add i64 %pgocount17, 1
  store i64 %190, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 10)
  %191 = load i32, i32* %12, align 4
  %192 = zext i32 %191 to i64
  %193 = getelementptr inbounds [9 x i8], [9 x i8]* @_TIFFFax3fillruns._fillmasks, i64 0, i64 %192
  %194 = load i8, i8* %193, align 1
  %195 = zext i8 %194 to i32
  %196 = load i32, i32* %11, align 4
  %197 = ashr i32 %195, %196
  %198 = xor i32 %197, -1
  %199 = load i8*, i8** %9, align 8
  %200 = getelementptr inbounds i8, i8* %199, i64 0
  %201 = load i8, i8* %200, align 1
  %202 = zext i8 %201 to i32
  %203 = and i32 %202, %198
  %204 = trunc i32 %203 to i8
  store i8 %204, i8* %200, align 1
  br label %205

; <label>:205:                                    ; preds = %189, %179
  %206 = load i32*, i32** %6, align 8
  %207 = getelementptr inbounds i32, i32* %206, i64 0
  %208 = load i32, i32* %207, align 4
  %209 = load i32, i32* %10, align 4
  %210 = add i32 %209, %208
  store i32 %210, i32* %10, align 4
  br label %211

; <label>:211:                                    ; preds = %205, %51
  %212 = load i32*, i32** %6, align 8
  %213 = getelementptr inbounds i32, i32* %212, i64 1
  %214 = load i32, i32* %213, align 4
  store i32 %214, i32* %12, align 4
  %215 = load i32, i32* %10, align 4
  %216 = load i32, i32* %12, align 4
  %217 = add i32 %215, %216
  %218 = load i32, i32* %8, align 4
  %219 = icmp ugt i32 %217, %218
  br i1 %219, label %220, label %227

; <label>:220:                                    ; preds = %211
  %pgocount18 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 8)
  %221 = add i64 %pgocount18, 1
  store i64 %221, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 8)
  %222 = load i32, i32* %8, align 4
  %223 = load i32, i32* %10, align 4
  %224 = sub i32 %222, %223
  %225 = load i32*, i32** %6, align 8
  %226 = getelementptr inbounds i32, i32* %225, i64 1
  store i32 %224, i32* %226, align 4
  store i32 %224, i32* %12, align 4
  br label %227

; <label>:227:                                    ; preds = %220, %211
  %228 = load i32, i32* %12, align 4
  %229 = icmp ne i32 %228, 0
  br i1 %229, label %230, label %385

; <label>:230:                                    ; preds = %227
  %231 = load i8*, i8** %5, align 8
  %232 = load i32, i32* %10, align 4
  %233 = lshr i32 %232, 3
  %234 = zext i32 %233 to i64
  %235 = getelementptr inbounds i8, i8* %231, i64 %234
  store i8* %235, i8** %9, align 8
  %236 = load i32, i32* %10, align 4
  %237 = and i32 %236, 7
  store i32 %237, i32* %11, align 4
  %238 = load i32, i32* %12, align 4
  %239 = load i32, i32* %11, align 4
  %240 = sub i32 8, %239
  %241 = icmp ugt i32 %238, %240
  br i1 %241, label %242, label %364

; <label>:242:                                    ; preds = %230
  %243 = load i32, i32* %11, align 4
  %244 = icmp ne i32 %243, 0
  br i1 %244, label %245, label %259

; <label>:245:                                    ; preds = %242
  %pgocount19 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 15)
  %246 = add i64 %pgocount19, 1
  store i64 %246, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 15)
  %247 = load i32, i32* %11, align 4
  %248 = ashr i32 255, %247
  %249 = load i8*, i8** %9, align 8
  %250 = getelementptr inbounds i8, i8* %249, i32 1
  store i8* %250, i8** %9, align 8
  %251 = load i8, i8* %249, align 1
  %252 = zext i8 %251 to i32
  %253 = or i32 %252, %248
  %254 = trunc i32 %253 to i8
  store i8 %254, i8* %249, align 1
  %255 = load i32, i32* %11, align 4
  %256 = sub i32 8, %255
  %257 = load i32, i32* %12, align 4
  %258 = sub i32 %257, %256
  store i32 %258, i32* %12, align 4
  br label %259

; <label>:259:                                    ; preds = %245, %242
  %260 = load i32, i32* %12, align 4
  %261 = lshr i32 %260, 3
  store i32 %261, i32* %13, align 4
  %262 = icmp ne i32 %261, 0
  br i1 %262, label %263, label %354

; <label>:263:                                    ; preds = %259
  %264 = load i32, i32* %13, align 4
  %265 = sext i32 %264 to i64
  %266 = udiv i64 %265, 8
  %267 = icmp ugt i64 %266, 1
  br i1 %267, label %268, label %314

; <label>:268:                                    ; preds = %263
  br label %269

; <label>:269:                                    ; preds = %284, %268
  %270 = load i32, i32* %13, align 4
  %271 = icmp ne i32 %270, 0
  br i1 %271, label %272, label %279

; <label>:272:                                    ; preds = %269
  %pgocount20 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 5)
  %273 = add i64 %pgocount20, 1
  store i64 %273, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 5)
  %274 = load i8*, i8** %9, align 8
  %275 = ptrtoint i8* %274 to i64
  %276 = and i64 %275, 7
  %277 = icmp eq i64 %276, 0
  %278 = xor i1 %277, true
  br label %279

; <label>:279:                                    ; preds = %272, %269
  %280 = phi i1 [ false, %269 ], [ %278, %272 ]
  br i1 %280, label %281, label %288

; <label>:281:                                    ; preds = %279
  %282 = load i8*, i8** %9, align 8
  %283 = getelementptr inbounds i8, i8* %282, i32 1
  store i8* %283, i8** %9, align 8
  store i8 -1, i8* %282, align 1
  br label %284

; <label>:284:                                    ; preds = %281
  %pgocount21 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 3)
  %285 = add i64 %pgocount21, 1
  store i64 %285, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 3)
  %286 = load i32, i32* %13, align 4
  %287 = add nsw i32 %286, -1
  store i32 %287, i32* %13, align 4
  br label %269

; <label>:288:                                    ; preds = %279
  %289 = load i8*, i8** %9, align 8
  %290 = bitcast i8* %289 to i64*
  store i64* %290, i64** %15, align 8
  %291 = load i32, i32* %13, align 4
  %292 = sext i32 %291 to i64
  %293 = udiv i64 %292, 8
  %294 = trunc i64 %293 to i32
  store i32 %294, i32* %14, align 4
  %295 = load i32, i32* %14, align 4
  %296 = sext i32 %295 to i64
  %297 = mul i64 %296, 8
  %298 = load i32, i32* %13, align 4
  %299 = sext i32 %298 to i64
  %300 = sub i64 %299, %297
  %301 = trunc i64 %300 to i32
  store i32 %301, i32* %13, align 4
  br label %302

; <label>:302:                                    ; preds = %306, %288
  %pgocount22 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 1)
  %303 = add i64 %pgocount22, 1
  store i64 %303, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 1)
  %304 = load i64*, i64** %15, align 8
  %305 = getelementptr inbounds i64, i64* %304, i32 1
  store i64* %305, i64** %15, align 8
  store i64 -1, i64* %304, align 8
  br label %306

; <label>:306:                                    ; preds = %302
  %307 = load i32, i32* %14, align 4
  %308 = add nsw i32 %307, -1
  store i32 %308, i32* %14, align 4
  %309 = icmp ne i32 %308, 0
  br i1 %309, label %302, label %310

; <label>:310:                                    ; preds = %306
  %pgocount23 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 26)
  %311 = add i64 %pgocount23, 1
  store i64 %311, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 26)
  %312 = load i64*, i64** %15, align 8
  %313 = bitcast i64* %312 to i8*
  store i8* %313, i8** %9, align 8
  br label %314

; <label>:314:                                    ; preds = %310, %263
  %315 = load i32, i32* %13, align 4
  switch i32 %315, label %350 [
    i32 7, label %316
    i32 6, label %320
    i32 5, label %324
    i32 4, label %328
    i32 3, label %332
    i32 2, label %336
    i32 1, label %340
    i32 0, label %348
  ]

; <label>:316:                                    ; preds = %314
  %pgocount24 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 35)
  %317 = add i64 %pgocount24, 1
  store i64 %317, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 35)
  %318 = load i8*, i8** %9, align 8
  %319 = getelementptr inbounds i8, i8* %318, i64 6
  store i8 -1, i8* %319, align 1
  br label %320

; <label>:320:                                    ; preds = %316, %314
  %pgocount25 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 32)
  %321 = add i64 %pgocount25, 1
  store i64 %321, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 32)
  %322 = load i8*, i8** %9, align 8
  %323 = getelementptr inbounds i8, i8* %322, i64 5
  store i8 -1, i8* %323, align 1
  br label %324

; <label>:324:                                    ; preds = %320, %314
  %pgocount26 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 30)
  %325 = add i64 %pgocount26, 1
  store i64 %325, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 30)
  %326 = load i8*, i8** %9, align 8
  %327 = getelementptr inbounds i8, i8* %326, i64 4
  store i8 -1, i8* %327, align 1
  br label %328

; <label>:328:                                    ; preds = %324, %314
  %pgocount27 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 28)
  %329 = add i64 %pgocount27, 1
  store i64 %329, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 28)
  %330 = load i8*, i8** %9, align 8
  %331 = getelementptr inbounds i8, i8* %330, i64 3
  store i8 -1, i8* %331, align 1
  br label %332

; <label>:332:                                    ; preds = %328, %314
  %pgocount28 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 24)
  %333 = add i64 %pgocount28, 1
  store i64 %333, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 24)
  %334 = load i8*, i8** %9, align 8
  %335 = getelementptr inbounds i8, i8* %334, i64 2
  store i8 -1, i8* %335, align 1
  br label %336

; <label>:336:                                    ; preds = %332, %314
  %pgocount29 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 22)
  %337 = add i64 %pgocount29, 1
  store i64 %337, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 22)
  %338 = load i8*, i8** %9, align 8
  %339 = getelementptr inbounds i8, i8* %338, i64 1
  store i8 -1, i8* %339, align 1
  br label %340

; <label>:340:                                    ; preds = %336, %314
  %pgocount30 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 20)
  %341 = add i64 %pgocount30, 1
  store i64 %341, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 20)
  %342 = load i8*, i8** %9, align 8
  %343 = getelementptr inbounds i8, i8* %342, i64 0
  store i8 -1, i8* %343, align 1
  %344 = load i32, i32* %13, align 4
  %345 = load i8*, i8** %9, align 8
  %346 = sext i32 %344 to i64
  %347 = getelementptr inbounds i8, i8* %345, i64 %346
  store i8* %347, i8** %9, align 8
  br label %348

; <label>:348:                                    ; preds = %340, %314
  %pgocount31 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 18)
  %349 = add i64 %pgocount31, 1
  store i64 %349, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 18)
  br label %350

; <label>:350:                                    ; preds = %348, %314
  %pgocount32 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 16)
  %351 = add i64 %pgocount32, 1
  store i64 %351, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 16)
  %352 = load i32, i32* %12, align 4
  %353 = and i32 %352, 7
  store i32 %353, i32* %12, align 4
  br label %354

; <label>:354:                                    ; preds = %350, %259
  %pgocount33 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 11)
  %355 = add i64 %pgocount33, 1
  store i64 %355, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 11)
  %356 = load i32, i32* %12, align 4
  %357 = ashr i32 65280, %356
  %358 = load i8*, i8** %9, align 8
  %359 = getelementptr inbounds i8, i8* %358, i64 0
  %360 = load i8, i8* %359, align 1
  %361 = zext i8 %360 to i32
  %362 = or i32 %361, %357
  %363 = trunc i32 %362 to i8
  store i8 %363, i8* %359, align 1
  br label %379

; <label>:364:                                    ; preds = %230
  %pgocount34 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 12)
  %365 = add i64 %pgocount34, 1
  store i64 %365, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 12)
  %366 = load i32, i32* %12, align 4
  %367 = zext i32 %366 to i64
  %368 = getelementptr inbounds [9 x i8], [9 x i8]* @_TIFFFax3fillruns._fillmasks, i64 0, i64 %367
  %369 = load i8, i8* %368, align 1
  %370 = zext i8 %369 to i32
  %371 = load i32, i32* %11, align 4
  %372 = ashr i32 %370, %371
  %373 = load i8*, i8** %9, align 8
  %374 = getelementptr inbounds i8, i8* %373, i64 0
  %375 = load i8, i8* %374, align 1
  %376 = zext i8 %375 to i32
  %377 = or i32 %376, %372
  %378 = trunc i32 %377 to i8
  store i8 %378, i8* %374, align 1
  br label %379

; <label>:379:                                    ; preds = %364, %354
  %380 = load i32*, i32** %6, align 8
  %381 = getelementptr inbounds i32, i32* %380, i64 1
  %382 = load i32, i32* %381, align 4
  %383 = load i32, i32* %10, align 4
  %384 = add i32 %383, %382
  store i32 %384, i32* %10, align 4
  br label %385

; <label>:385:                                    ; preds = %379, %227
  br label %386

; <label>:386:                                    ; preds = %385
  %pgocount35 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 6)
  %387 = add i64 %pgocount35, 1
  store i64 %387, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 6)
  %388 = load i32*, i32** %6, align 8
  %389 = getelementptr inbounds i32, i32* %388, i64 2
  store i32* %389, i32** %6, align 8
  br label %29

; <label>:390:                                    ; preds = %29
  %391 = load i32, i32* %10, align 4
  %392 = load i32, i32* %8, align 4
  %393 = icmp eq i32 %391, %392
  br i1 %393, label %394, label %395

; <label>:394:                                    ; preds = %390
  br label %398

; <label>:395:                                    ; preds = %390
  %pgocount36 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 37)
  %396 = add i64 %pgocount36, 1
  store i64 %396, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 37)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 454, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__._TIFFFax3fillruns, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %398

; <label>:398:                                    ; preds = %397, %394
  %pgocount37 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 33)
  %399 = add i64 %pgocount37, 1
  store i64 %399, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc__TIFFFax3fillruns, i64 0, i64 33)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFInitCCITTFax3(%struct.tiff*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load %struct.tiff*, %struct.tiff** %4, align 8
  %7 = call i32 @InitCCITTFax3(%struct.tiff* %6)
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %14

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTFax3, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTFax3, i64 0, i64 0)
  %11 = load %struct.tiff*, %struct.tiff** %4, align 8
  call void @_TIFFMergeFieldInfo(%struct.tiff* %11, %struct.TIFFFieldInfo* getelementptr inbounds ([1 x %struct.TIFFFieldInfo], [1 x %struct.TIFFFieldInfo]* @fax3FieldInfo, i32 0, i32 0), i32 1)
  %12 = load %struct.tiff*, %struct.tiff** %4, align 8
  %13 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %12, i32 65536, i32 1)
  store i32 %13, i32* %3, align 4
  br label %16

; <label>:14:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTFax3, i64 0, i64 1)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTFax3, i64 0, i64 1)
  store i32 0, i32* %3, align 4
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load i32, i32* %3, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @InitCCITTFax3(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.Fax3BaseState*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %5 = load %struct.tiff*, %struct.tiff** %3, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %5, i32 0, i32 2
  %7 = load i32, i32* %6, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %14

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_InitCCITTFax3, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_InitCCITTFax3, i64 0, i64 1)
  %11 = call i8* @_TIFFmalloc(i32 120)
  %12 = load %struct.tiff*, %struct.tiff** %3, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 37
  store i8* %11, i8** %13, align 8
  br label %18

; <label>:14:                                     ; preds = %1
  %15 = call i8* @_TIFFmalloc(i32 96)
  %16 = load %struct.tiff*, %struct.tiff** %3, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 37
  store i8* %15, i8** %17, align 8
  br label %18

; <label>:18:                                     ; preds = %14, %9
  %19 = load %struct.tiff*, %struct.tiff** %3, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %19, i32 0, i32 37
  %21 = load i8*, i8** %20, align 8
  %22 = icmp eq i8* %21, null
  br i1 %22, label %23, label %28

; <label>:23:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_InitCCITTFax3, i64 0, i64 2)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_InitCCITTFax3, i64 0, i64 2)
  %25 = load %struct.tiff*, %struct.tiff** %3, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %25, i32 0, i32 0
  %27 = load i8*, i8** %26, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i32 0, i32 0), i8* %27)
  store i32 0, i32* %2, align 4
  br label %109

; <label>:28:                                     ; preds = %18
  %29 = load %struct.tiff*, %struct.tiff** %3, align 8
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %29, i32 0, i32 37
  %31 = load i8*, i8** %30, align 8
  %32 = bitcast i8* %31 to %struct.Fax3BaseState*
  store %struct.Fax3BaseState* %32, %struct.Fax3BaseState** %4, align 8
  %33 = load %struct.tiff*, %struct.tiff** %3, align 8
  call void @_TIFFMergeFieldInfo(%struct.tiff* %33, %struct.TIFFFieldInfo* getelementptr inbounds ([10 x %struct.TIFFFieldInfo], [10 x %struct.TIFFFieldInfo]* @faxFieldInfo, i32 0, i32 0), i32 10)
  %34 = load %struct.tiff*, %struct.tiff** %3, align 8
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %34, i32 0, i32 58
  %36 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %35, align 8
  %37 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %4, align 8
  %38 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %37, i32 0, i32 10
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* %36, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %38, align 8
  %39 = load %struct.tiff*, %struct.tiff** %3, align 8
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %39, i32 0, i32 58
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @Fax3VGetField, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %40, align 8
  %41 = load %struct.tiff*, %struct.tiff** %3, align 8
  %42 = getelementptr inbounds %struct.tiff, %struct.tiff* %41, i32 0, i32 57
  %43 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %42, align 8
  %44 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %4, align 8
  %45 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %44, i32 0, i32 11
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* %43, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %45, align 8
  %46 = load %struct.tiff*, %struct.tiff** %3, align 8
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %46, i32 0, i32 57
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @Fax3VSetField, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %47, align 8
  %48 = load %struct.tiff*, %struct.tiff** %3, align 8
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %48, i32 0, i32 59
  store void (%struct.tiff*, %struct._IO_FILE*, i64)* @Fax3PrintDir, void (%struct.tiff*, %struct._IO_FILE*, i64)** %49, align 8
  %50 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %4, align 8
  %51 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %50, i32 0, i32 6
  store i32 0, i32* %51, align 8
  %52 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %4, align 8
  %53 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %52, i32 0, i32 7
  store i32 0, i32* %53, align 4
  %54 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %4, align 8
  %55 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %54, i32 0, i32 8
  store i8* null, i8** %55, align 8
  %56 = load %struct.tiff*, %struct.tiff** %3, align 8
  %57 = getelementptr inbounds %struct.tiff, %struct.tiff* %56, i32 0, i32 2
  %58 = load i32, i32* %57, align 4
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %60, label %74

; <label>:60:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_InitCCITTFax3, i64 0, i64 3)
  %61 = add i64 %pgocount2, 1
  store i64 %61, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_InitCCITTFax3, i64 0, i64 3)
  %62 = load %struct.tiff*, %struct.tiff** %3, align 8
  %63 = getelementptr inbounds %struct.tiff, %struct.tiff* %62, i32 0, i32 3
  %64 = load i32, i32* %63, align 8
  %65 = or i32 %64, 256
  store i32 %65, i32* %63, align 8
  %66 = load %struct.tiff*, %struct.tiff** %3, align 8
  %67 = getelementptr inbounds %struct.tiff, %struct.tiff* %66, i32 0, i32 37
  %68 = load i8*, i8** %67, align 8
  %69 = bitcast i8* %68 to %struct.Fax3BaseState*
  %70 = bitcast %struct.Fax3BaseState* %69 to %struct.Fax3DecodeState*
  %71 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %70, i32 0, i32 6
  store i32* null, i32** %71, align 8
  %72 = load %struct.tiff*, %struct.tiff** %3, align 8
  %73 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %72, i32 65540, void (i8*, i32*, i32*, i32)* @_TIFFFax3fillruns)
  br label %82

; <label>:74:                                     ; preds = %28
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_InitCCITTFax3, i64 0, i64 0)
  %75 = add i64 %pgocount3, 1
  store i64 %75, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_InitCCITTFax3, i64 0, i64 0)
  %76 = load %struct.tiff*, %struct.tiff** %3, align 8
  %77 = getelementptr inbounds %struct.tiff, %struct.tiff* %76, i32 0, i32 37
  %78 = load i8*, i8** %77, align 8
  %79 = bitcast i8* %78 to %struct.Fax3BaseState*
  %80 = bitcast %struct.Fax3BaseState* %79 to %struct.Fax3EncodeState*
  %81 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %80, i32 0, i32 4
  store i8* null, i8** %81, align 8
  br label %82

; <label>:82:                                     ; preds = %74, %60
  %83 = load %struct.tiff*, %struct.tiff** %3, align 8
  %84 = getelementptr inbounds %struct.tiff, %struct.tiff* %83, i32 0, i32 21
  store i32 (%struct.tiff*)* @Fax3SetupState, i32 (%struct.tiff*)** %84, align 8
  %85 = load %struct.tiff*, %struct.tiff** %3, align 8
  %86 = getelementptr inbounds %struct.tiff, %struct.tiff* %85, i32 0, i32 22
  store i32 (%struct.tiff*, i16)* @Fax3PreDecode, i32 (%struct.tiff*, i16)** %86, align 8
  %87 = load %struct.tiff*, %struct.tiff** %3, align 8
  %88 = getelementptr inbounds %struct.tiff, %struct.tiff* %87, i32 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Decode1D, i32 (%struct.tiff*, i8*, i32, i16)** %88, align 8
  %89 = load %struct.tiff*, %struct.tiff** %3, align 8
  %90 = getelementptr inbounds %struct.tiff, %struct.tiff* %89, i32 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Decode1D, i32 (%struct.tiff*, i8*, i32, i16)** %90, align 8
  %91 = load %struct.tiff*, %struct.tiff** %3, align 8
  %92 = getelementptr inbounds %struct.tiff, %struct.tiff* %91, i32 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Decode1D, i32 (%struct.tiff*, i8*, i32, i16)** %92, align 8
  %93 = load %struct.tiff*, %struct.tiff** %3, align 8
  %94 = getelementptr inbounds %struct.tiff, %struct.tiff* %93, i32 0, i32 23
  store i32 (%struct.tiff*)* @Fax3SetupState, i32 (%struct.tiff*)** %94, align 8
  %95 = load %struct.tiff*, %struct.tiff** %3, align 8
  %96 = getelementptr inbounds %struct.tiff, %struct.tiff* %95, i32 0, i32 24
  store i32 (%struct.tiff*, i16)* @Fax3PreEncode, i32 (%struct.tiff*, i16)** %96, align 8
  %97 = load %struct.tiff*, %struct.tiff** %3, align 8
  %98 = getelementptr inbounds %struct.tiff, %struct.tiff* %97, i32 0, i32 25
  store i32 (%struct.tiff*)* @Fax3PostEncode, i32 (%struct.tiff*)** %98, align 8
  %99 = load %struct.tiff*, %struct.tiff** %3, align 8
  %100 = getelementptr inbounds %struct.tiff, %struct.tiff* %99, i32 0, i32 27
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Encode, i32 (%struct.tiff*, i8*, i32, i16)** %100, align 8
  %101 = load %struct.tiff*, %struct.tiff** %3, align 8
  %102 = getelementptr inbounds %struct.tiff, %struct.tiff* %101, i32 0, i32 29
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Encode, i32 (%struct.tiff*, i8*, i32, i16)** %102, align 8
  %103 = load %struct.tiff*, %struct.tiff** %3, align 8
  %104 = getelementptr inbounds %struct.tiff, %struct.tiff* %103, i32 0, i32 31
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Encode, i32 (%struct.tiff*, i8*, i32, i16)** %104, align 8
  %105 = load %struct.tiff*, %struct.tiff** %3, align 8
  %106 = getelementptr inbounds %struct.tiff, %struct.tiff* %105, i32 0, i32 32
  store void (%struct.tiff*)* @Fax3Close, void (%struct.tiff*)** %106, align 8
  %107 = load %struct.tiff*, %struct.tiff** %3, align 8
  %108 = getelementptr inbounds %struct.tiff, %struct.tiff* %107, i32 0, i32 34
  store void (%struct.tiff*)* @Fax3Cleanup, void (%struct.tiff*)** %108, align 8
  store i32 1, i32* %2, align 4
  br label %109

; <label>:109:                                    ; preds = %82, %23
  %110 = load i32, i32* %2, align 4
  ret i32 %110
}

declare void @_TIFFMergeFieldInfo(%struct.tiff*, %struct.TIFFFieldInfo*, i32) #2

declare i32 @TIFFSetField(%struct.tiff*, i32, ...) #2

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFInitCCITTFax4(%struct.tiff*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load %struct.tiff*, %struct.tiff** %4, align 8
  %7 = call i32 @InitCCITTFax3(%struct.tiff* %6)
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %28

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTFax4, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTFax4, i64 0, i64 0)
  %11 = load %struct.tiff*, %struct.tiff** %4, align 8
  call void @_TIFFMergeFieldInfo(%struct.tiff* %11, %struct.TIFFFieldInfo* getelementptr inbounds ([1 x %struct.TIFFFieldInfo], [1 x %struct.TIFFFieldInfo]* @fax4FieldInfo, i32 0, i32 0), i32 1)
  %12 = load %struct.tiff*, %struct.tiff** %4, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax4Decode, i32 (%struct.tiff*, i8*, i32, i16)** %13, align 8
  %14 = load %struct.tiff*, %struct.tiff** %4, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax4Decode, i32 (%struct.tiff*, i8*, i32, i16)** %15, align 8
  %16 = load %struct.tiff*, %struct.tiff** %4, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax4Decode, i32 (%struct.tiff*, i8*, i32, i16)** %17, align 8
  %18 = load %struct.tiff*, %struct.tiff** %4, align 8
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %18, i32 0, i32 27
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax4Encode, i32 (%struct.tiff*, i8*, i32, i16)** %19, align 8
  %20 = load %struct.tiff*, %struct.tiff** %4, align 8
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %20, i32 0, i32 29
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax4Encode, i32 (%struct.tiff*, i8*, i32, i16)** %21, align 8
  %22 = load %struct.tiff*, %struct.tiff** %4, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %22, i32 0, i32 31
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax4Encode, i32 (%struct.tiff*, i8*, i32, i16)** %23, align 8
  %24 = load %struct.tiff*, %struct.tiff** %4, align 8
  %25 = getelementptr inbounds %struct.tiff, %struct.tiff* %24, i32 0, i32 25
  store i32 (%struct.tiff*)* @Fax4PostEncode, i32 (%struct.tiff*)** %25, align 8
  %26 = load %struct.tiff*, %struct.tiff** %4, align 8
  %27 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %26, i32 65536, i32 1)
  store i32 %27, i32* %3, align 4
  br label %30

; <label>:28:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTFax4, i64 0, i64 1)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTFax4, i64 0, i64 1)
  store i32 0, i32* %3, align 4
  br label %30

; <label>:30:                                     ; preds = %28, %9
  %31 = load i32, i32* %3, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax4Decode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca %struct.Fax3DecodeState*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i32*, align 8
  %19 = alloca i32*, align 8
  %20 = alloca i32, align 4
  %21 = alloca i8*, align 8
  %22 = alloca %struct.TIFFFaxTabEnt*, align 8
  %23 = alloca i32, align 4
  %24 = alloca i32*, align 8
  %25 = alloca i32*, align 8
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %26 = load %struct.tiff*, %struct.tiff** %6, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %26, i32 0, i32 37
  %28 = load i8*, i8** %27, align 8
  %29 = bitcast i8* %28 to %struct.Fax3BaseState*
  %30 = bitcast %struct.Fax3BaseState* %29 to %struct.Fax3DecodeState*
  store %struct.Fax3DecodeState* %30, %struct.Fax3DecodeState** %10, align 8
  %31 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %32 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %31, i32 0, i32 0
  %33 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %32, i32 0, i32 2
  %34 = load i32, i32* %33, align 8
  store i32 %34, i32* %12, align 4
  %35 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %36 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %35, i32 0, i32 1
  %37 = load i8*, i8** %36, align 8
  store i8* %37, i8** %21, align 8
  %38 = load i16, i16* %9, align 2
  br label %39

; <label>:39:                                     ; preds = %4
  %40 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %41 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %40, i32 0, i32 2
  %42 = load i32, i32* %41, align 8
  store i32 %42, i32* %13, align 4
  %43 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %44 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %43, i32 0, i32 3
  %45 = load i32, i32* %44, align 4
  store i32 %45, i32* %14, align 4
  %46 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %47 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %46, i32 0, i32 4
  %48 = load i32, i32* %47, align 8
  store i32 %48, i32* %20, align 4
  %49 = load %struct.tiff*, %struct.tiff** %6, align 8
  %50 = getelementptr inbounds %struct.tiff, %struct.tiff* %49, i32 0, i32 42
  %51 = load i8*, i8** %50, align 8
  store i8* %51, i8** %16, align 8
  %52 = load i8*, i8** %16, align 8
  %53 = load %struct.tiff*, %struct.tiff** %6, align 8
  %54 = getelementptr inbounds %struct.tiff, %struct.tiff* %53, i32 0, i32 43
  %55 = load i32, i32* %54, align 8
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8* %52, i64 %56
  store i8* %57, i8** %17, align 8
  br label %58

; <label>:58:                                     ; preds = %39
  br label %59

; <label>:59:                                     ; preds = %1286, %58
  %60 = load i32, i32* %8, align 4
  %61 = sext i32 %60 to i64
  %62 = icmp sgt i64 %61, 0
  br i1 %62, label %63, label %1323

; <label>:63:                                     ; preds = %59
  store i32 0, i32* %11, align 4
  store i32 0, i32* %15, align 4
  %64 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %65 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %64, i32 0, i32 8
  %66 = load i32*, i32** %65, align 8
  store i32* %66, i32** %19, align 8
  store i32* %66, i32** %18, align 8
  %67 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %68 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %67, i32 0, i32 7
  %69 = load i32*, i32** %68, align 8
  store i32* %69, i32** %24, align 8
  %70 = load i32*, i32** %24, align 8
  %71 = getelementptr inbounds i32, i32* %70, i32 1
  store i32* %71, i32** %24, align 8
  %72 = load i32, i32* %70, align 4
  store i32 %72, i32* %23, align 4
  br label %73

; <label>:73:                                     ; preds = %63
  br label %74

; <label>:74:                                     ; preds = %1055, %73
  %75 = load i32, i32* %11, align 4
  %76 = load i32, i32* %12, align 4
  %77 = icmp slt i32 %75, %76
  br i1 %77, label %78, label %1056

; <label>:78:                                     ; preds = %74
  br label %79

; <label>:79:                                     ; preds = %78
  br label %80

; <label>:80:                                     ; preds = %79
  %81 = load i32, i32* %14, align 4
  %82 = icmp slt i32 %81, 7
  br i1 %82, label %83, label %111

; <label>:83:                                     ; preds = %80
  %84 = load i8*, i8** %16, align 8
  %85 = load i8*, i8** %17, align 8
  %86 = icmp uge i8* %84, %85
  br i1 %86, label %87, label %94

; <label>:87:                                     ; preds = %83
  %88 = load i32, i32* %14, align 4
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %90, label %92

; <label>:90:                                     ; preds = %87
  %pgocount = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 72)
  %91 = add i64 %pgocount, 1
  store i64 %91, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 72)
  br label %940

; <label>:92:                                     ; preds = %87
  %pgocount4 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 29)
  %93 = add i64 %pgocount4, 1
  store i64 %93, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 29)
  store i32 7, i32* %14, align 4
  br label %110

; <label>:94:                                     ; preds = %83
  %pgocount5 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 26)
  %95 = add i64 %pgocount5, 1
  store i64 %95, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 26)
  %96 = load i8*, i8** %21, align 8
  %97 = load i8*, i8** %16, align 8
  %98 = getelementptr inbounds i8, i8* %97, i32 1
  store i8* %98, i8** %16, align 8
  %99 = load i8, i8* %97, align 1
  %100 = zext i8 %99 to i64
  %101 = getelementptr inbounds i8, i8* %96, i64 %100
  %102 = load i8, i8* %101, align 1
  %103 = zext i8 %102 to i32
  %104 = load i32, i32* %14, align 4
  %105 = shl i32 %103, %104
  %106 = load i32, i32* %13, align 4
  %107 = or i32 %106, %105
  store i32 %107, i32* %13, align 4
  %108 = load i32, i32* %14, align 4
  %109 = add nsw i32 %108, 8
  store i32 %109, i32* %14, align 4
  br label %110

; <label>:110:                                    ; preds = %94, %92
  br label %111

; <label>:111:                                    ; preds = %110, %80
  br label %112

; <label>:112:                                    ; preds = %111
  %113 = load i32, i32* %13, align 4
  %114 = and i32 %113, 127
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* getelementptr inbounds ([0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxMainTable, i32 0, i32 0), i64 %115
  store %struct.TIFFFaxTabEnt* %116, %struct.TIFFFaxTabEnt** %22, align 8
  br label %117

; <label>:117:                                    ; preds = %112
  %118 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %119 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %118, i32 0, i32 1
  %120 = load i8, i8* %119, align 1
  %121 = zext i8 %120 to i32
  %122 = load i32, i32* %14, align 4
  %123 = sub nsw i32 %122, %121
  store i32 %123, i32* %14, align 4
  %124 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %125 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %124, i32 0, i32 1
  %126 = load i8, i8* %125, align 1
  %127 = zext i8 %126 to i32
  %128 = load i32, i32* %13, align 4
  %129 = lshr i32 %128, %127
  store i32 %129, i32* %13, align 4
  br label %130

; <label>:130:                                    ; preds = %117
  br label %131

; <label>:131:                                    ; preds = %130
  %132 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %133 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %132, i32 0, i32 0
  %134 = load i8, i8* %133, align 4
  %135 = zext i8 %134 to i32
  switch i32 %135, label %929 [
    i32 1, label %136
    i32 2, label %187
    i32 3, label %694
    i32 4, label %748
    i32 5, label %810
    i32 6, label %872
    i32 12, label %881
  ]

; <label>:136:                                    ; preds = %131
  br label %137

; <label>:137:                                    ; preds = %136
  %138 = load i32*, i32** %18, align 8
  %139 = load i32*, i32** %19, align 8
  %140 = icmp ne i32* %138, %139
  br i1 %140, label %141, label %168

; <label>:141:                                    ; preds = %137
  br label %142

; <label>:142:                                    ; preds = %153, %141
  %143 = load i32, i32* %23, align 4
  %144 = load i32, i32* %11, align 4
  %145 = icmp sle i32 %143, %144
  br i1 %145, label %146, label %151

; <label>:146:                                    ; preds = %142
  %pgocount6 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 11)
  %147 = add i64 %pgocount6, 1
  store i64 %147, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 11)
  %148 = load i32, i32* %23, align 4
  %149 = load i32, i32* %12, align 4
  %150 = icmp slt i32 %148, %149
  br label %151

; <label>:151:                                    ; preds = %146, %142
  %152 = phi i1 [ false, %142 ], [ %150, %146 ]
  br i1 %152, label %153, label %166

; <label>:153:                                    ; preds = %151
  %pgocount7 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 4)
  %154 = add i64 %pgocount7, 1
  store i64 %154, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 4)
  %155 = load i32*, i32** %24, align 8
  %156 = getelementptr inbounds i32, i32* %155, i64 0
  %157 = load i32, i32* %156, align 4
  %158 = load i32*, i32** %24, align 8
  %159 = getelementptr inbounds i32, i32* %158, i64 1
  %160 = load i32, i32* %159, align 4
  %161 = add i32 %157, %160
  %162 = load i32, i32* %23, align 4
  %163 = add i32 %162, %161
  store i32 %163, i32* %23, align 4
  %164 = load i32*, i32** %24, align 8
  %165 = getelementptr inbounds i32, i32* %164, i64 2
  store i32* %165, i32** %24, align 8
  br label %142

; <label>:166:                                    ; preds = %151
  %pgocount8 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 40)
  %167 = add i64 %pgocount8, 1
  store i64 %167, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 40)
  br label %168

; <label>:168:                                    ; preds = %166, %137
  br label %169

; <label>:169:                                    ; preds = %168
  %pgocount9 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 32)
  %170 = add i64 %pgocount9, 1
  store i64 %170, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 32)
  %171 = load i32*, i32** %24, align 8
  %172 = getelementptr inbounds i32, i32* %171, i32 1
  store i32* %172, i32** %24, align 8
  %173 = load i32, i32* %171, align 4
  %174 = load i32, i32* %23, align 4
  %175 = add i32 %174, %173
  store i32 %175, i32* %23, align 4
  %176 = load i32, i32* %23, align 4
  %177 = load i32, i32* %11, align 4
  %178 = sub nsw i32 %176, %177
  %179 = load i32, i32* %15, align 4
  %180 = add nsw i32 %179, %178
  store i32 %180, i32* %15, align 4
  %181 = load i32, i32* %23, align 4
  store i32 %181, i32* %11, align 4
  %182 = load i32*, i32** %24, align 8
  %183 = getelementptr inbounds i32, i32* %182, i32 1
  store i32* %183, i32** %24, align 8
  %184 = load i32, i32* %182, align 4
  %185 = load i32, i32* %23, align 4
  %186 = add i32 %185, %184
  store i32 %186, i32* %23, align 4
  br label %1055

; <label>:187:                                    ; preds = %131
  %188 = load i32*, i32** %18, align 8
  %189 = load i32*, i32** %19, align 8
  %190 = ptrtoint i32* %188 to i64
  %191 = ptrtoint i32* %189 to i64
  %192 = sub i64 %190, %191
  %193 = sdiv exact i64 %192, 4
  %194 = and i64 %193, 1
  %195 = icmp ne i64 %194, 0
  br i1 %195, label %196, label %428

; <label>:196:                                    ; preds = %187
  br label %197

; <label>:197:                                    ; preds = %309, %196
  br label %198

; <label>:198:                                    ; preds = %197
  br label %199

; <label>:199:                                    ; preds = %198
  %200 = load i32, i32* %14, align 4
  %201 = icmp slt i32 %200, 13
  br i1 %201, label %202, label %255

; <label>:202:                                    ; preds = %199
  %203 = load i8*, i8** %16, align 8
  %204 = load i8*, i8** %17, align 8
  %205 = icmp uge i8* %203, %204
  br i1 %205, label %206, label %213

; <label>:206:                                    ; preds = %202
  %207 = load i32, i32* %14, align 4
  %208 = icmp eq i32 %207, 0
  br i1 %208, label %209, label %211

; <label>:209:                                    ; preds = %206
  %pgocount10 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 58)
  %210 = add i64 %pgocount10, 1
  store i64 %210, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 58)
  br label %940

; <label>:211:                                    ; preds = %206
  %pgocount11 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 21)
  %212 = add i64 %pgocount11, 1
  store i64 %212, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 21)
  store i32 13, i32* %14, align 4
  br label %254

; <label>:213:                                    ; preds = %202
  %214 = load i8*, i8** %21, align 8
  %215 = load i8*, i8** %16, align 8
  %216 = getelementptr inbounds i8, i8* %215, i32 1
  store i8* %216, i8** %16, align 8
  %217 = load i8, i8* %215, align 1
  %218 = zext i8 %217 to i64
  %219 = getelementptr inbounds i8, i8* %214, i64 %218
  %220 = load i8, i8* %219, align 1
  %221 = zext i8 %220 to i32
  %222 = load i32, i32* %14, align 4
  %223 = shl i32 %221, %222
  %224 = load i32, i32* %13, align 4
  %225 = or i32 %224, %223
  store i32 %225, i32* %13, align 4
  %226 = load i32, i32* %14, align 4
  %227 = add nsw i32 %226, 8
  store i32 %227, i32* %14, align 4
  %228 = icmp slt i32 %227, 13
  br i1 %228, label %229, label %252

; <label>:229:                                    ; preds = %213
  %230 = load i8*, i8** %16, align 8
  %231 = load i8*, i8** %17, align 8
  %232 = icmp uge i8* %230, %231
  br i1 %232, label %233, label %235

; <label>:233:                                    ; preds = %229
  %pgocount12 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 36)
  %234 = add i64 %pgocount12, 1
  store i64 %234, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 36)
  store i32 13, i32* %14, align 4
  br label %251

; <label>:235:                                    ; preds = %229
  %pgocount13 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 37)
  %236 = add i64 %pgocount13, 1
  store i64 %236, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 37)
  %237 = load i8*, i8** %21, align 8
  %238 = load i8*, i8** %16, align 8
  %239 = getelementptr inbounds i8, i8* %238, i32 1
  store i8* %239, i8** %16, align 8
  %240 = load i8, i8* %238, align 1
  %241 = zext i8 %240 to i64
  %242 = getelementptr inbounds i8, i8* %237, i64 %241
  %243 = load i8, i8* %242, align 1
  %244 = zext i8 %243 to i32
  %245 = load i32, i32* %14, align 4
  %246 = shl i32 %244, %245
  %247 = load i32, i32* %13, align 4
  %248 = or i32 %247, %246
  store i32 %248, i32* %13, align 4
  %249 = load i32, i32* %14, align 4
  %250 = add nsw i32 %249, 8
  store i32 %250, i32* %14, align 4
  br label %251

; <label>:251:                                    ; preds = %235, %233
  br label %252

; <label>:252:                                    ; preds = %251, %213
  %pgocount14 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 19)
  %253 = add i64 %pgocount14, 1
  store i64 %253, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 19)
  br label %254

; <label>:254:                                    ; preds = %252, %211
  br label %255

; <label>:255:                                    ; preds = %254, %199
  br label %256

; <label>:256:                                    ; preds = %255
  %257 = load i32, i32* %13, align 4
  %258 = and i32 %257, 8191
  %259 = zext i32 %258 to i64
  %260 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* getelementptr inbounds ([0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i32 0, i32 0), i64 %259
  store %struct.TIFFFaxTabEnt* %260, %struct.TIFFFaxTabEnt** %22, align 8
  br label %261

; <label>:261:                                    ; preds = %256
  %262 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %263 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %262, i32 0, i32 1
  %264 = load i8, i8* %263, align 1
  %265 = zext i8 %264 to i32
  %266 = load i32, i32* %14, align 4
  %267 = sub nsw i32 %266, %265
  store i32 %267, i32* %14, align 4
  %268 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %269 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %268, i32 0, i32 1
  %270 = load i8, i8* %269, align 1
  %271 = zext i8 %270 to i32
  %272 = load i32, i32* %13, align 4
  %273 = lshr i32 %272, %271
  store i32 %273, i32* %13, align 4
  br label %274

; <label>:274:                                    ; preds = %261
  br label %275

; <label>:275:                                    ; preds = %274
  %276 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %277 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %276, i32 0, i32 0
  %278 = load i8, i8* %277, align 4
  %279 = zext i8 %278 to i32
  switch i32 %279, label %307 [
    i32 8, label %281
    i32 10, label %._crit_edge
    i32 11, label %296
  ]

._crit_edge:                                      ; preds = %275
  %pgocount15 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 0)
  %280 = add i64 %pgocount15, 1
  store i64 %280, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 0)
  br label %296

; <label>:281:                                    ; preds = %275
  br label %282

; <label>:282:                                    ; preds = %281
  %283 = load i32, i32* %15, align 4
  %284 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %285 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %284, i32 0, i32 2
  %286 = load i32, i32* %285, align 4
  %287 = add i32 %283, %286
  %288 = load i32*, i32** %18, align 8
  %289 = getelementptr inbounds i32, i32* %288, i32 1
  store i32* %289, i32** %18, align 8
  store i32 %287, i32* %288, align 4
  %290 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %291 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %290, i32 0, i32 2
  %292 = load i32, i32* %291, align 4
  %293 = load i32, i32* %11, align 4
  %294 = add i32 %293, %292
  store i32 %294, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %295

; <label>:295:                                    ; preds = %282
  br label %311

; <label>:296:                                    ; preds = %._crit_edge, %275
  %297 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %298 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %297, i32 0, i32 2
  %299 = load i32, i32* %298, align 4
  %300 = load i32, i32* %11, align 4
  %301 = add i32 %300, %299
  store i32 %301, i32* %11, align 4
  %302 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %303 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %302, i32 0, i32 2
  %304 = load i32, i32* %303, align 4
  %305 = load i32, i32* %15, align 4
  %306 = add i32 %305, %304
  store i32 %306, i32* %15, align 4
  br label %309

; <label>:307:                                    ; preds = %275
  %pgocount16 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 53)
  %308 = add i64 %pgocount16, 1
  store i64 %308, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 53)
  br label %934

; <label>:309:                                    ; preds = %296
  %pgocount17 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 9)
  %310 = add i64 %pgocount17, 1
  store i64 %310, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 9)
  br label %197

; <label>:311:                                    ; preds = %295
  br label %312

; <label>:312:                                    ; preds = %424, %311
  br label %313

; <label>:313:                                    ; preds = %312
  br label %314

; <label>:314:                                    ; preds = %313
  %315 = load i32, i32* %14, align 4
  %316 = icmp slt i32 %315, 12
  br i1 %316, label %317, label %370

; <label>:317:                                    ; preds = %314
  %318 = load i8*, i8** %16, align 8
  %319 = load i8*, i8** %17, align 8
  %320 = icmp uge i8* %318, %319
  br i1 %320, label %321, label %328

; <label>:321:                                    ; preds = %317
  %322 = load i32, i32* %14, align 4
  %323 = icmp eq i32 %322, 0
  br i1 %323, label %324, label %326

; <label>:324:                                    ; preds = %321
  %pgocount18 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 75)
  %325 = add i64 %pgocount18, 1
  store i64 %325, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 75)
  br label %940

; <label>:326:                                    ; preds = %321
  %pgocount19 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 30)
  %327 = add i64 %pgocount19, 1
  store i64 %327, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 30)
  store i32 12, i32* %14, align 4
  br label %369

; <label>:328:                                    ; preds = %317
  %329 = load i8*, i8** %21, align 8
  %330 = load i8*, i8** %16, align 8
  %331 = getelementptr inbounds i8, i8* %330, i32 1
  store i8* %331, i8** %16, align 8
  %332 = load i8, i8* %330, align 1
  %333 = zext i8 %332 to i64
  %334 = getelementptr inbounds i8, i8* %329, i64 %333
  %335 = load i8, i8* %334, align 1
  %336 = zext i8 %335 to i32
  %337 = load i32, i32* %14, align 4
  %338 = shl i32 %336, %337
  %339 = load i32, i32* %13, align 4
  %340 = or i32 %339, %338
  store i32 %340, i32* %13, align 4
  %341 = load i32, i32* %14, align 4
  %342 = add nsw i32 %341, 8
  store i32 %342, i32* %14, align 4
  %343 = icmp slt i32 %342, 12
  br i1 %343, label %344, label %367

; <label>:344:                                    ; preds = %328
  %345 = load i8*, i8** %16, align 8
  %346 = load i8*, i8** %17, align 8
  %347 = icmp uge i8* %345, %346
  br i1 %347, label %348, label %350

; <label>:348:                                    ; preds = %344
  %pgocount20 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 46)
  %349 = add i64 %pgocount20, 1
  store i64 %349, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 46)
  store i32 12, i32* %14, align 4
  br label %366

; <label>:350:                                    ; preds = %344
  %pgocount21 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 47)
  %351 = add i64 %pgocount21, 1
  store i64 %351, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 47)
  %352 = load i8*, i8** %21, align 8
  %353 = load i8*, i8** %16, align 8
  %354 = getelementptr inbounds i8, i8* %353, i32 1
  store i8* %354, i8** %16, align 8
  %355 = load i8, i8* %353, align 1
  %356 = zext i8 %355 to i64
  %357 = getelementptr inbounds i8, i8* %352, i64 %356
  %358 = load i8, i8* %357, align 1
  %359 = zext i8 %358 to i32
  %360 = load i32, i32* %14, align 4
  %361 = shl i32 %359, %360
  %362 = load i32, i32* %13, align 4
  %363 = or i32 %362, %361
  store i32 %363, i32* %13, align 4
  %364 = load i32, i32* %14, align 4
  %365 = add nsw i32 %364, 8
  store i32 %365, i32* %14, align 4
  br label %366

; <label>:366:                                    ; preds = %350, %348
  br label %367

; <label>:367:                                    ; preds = %366, %328
  %pgocount22 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 27)
  %368 = add i64 %pgocount22, 1
  store i64 %368, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 27)
  br label %369

; <label>:369:                                    ; preds = %367, %326
  br label %370

; <label>:370:                                    ; preds = %369, %314
  br label %371

; <label>:371:                                    ; preds = %370
  %372 = load i32, i32* %13, align 4
  %373 = and i32 %372, 4095
  %374 = zext i32 %373 to i64
  %375 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* getelementptr inbounds ([0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i32 0, i32 0), i64 %374
  store %struct.TIFFFaxTabEnt* %375, %struct.TIFFFaxTabEnt** %22, align 8
  br label %376

; <label>:376:                                    ; preds = %371
  %377 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %378 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %377, i32 0, i32 1
  %379 = load i8, i8* %378, align 1
  %380 = zext i8 %379 to i32
  %381 = load i32, i32* %14, align 4
  %382 = sub nsw i32 %381, %380
  store i32 %382, i32* %14, align 4
  %383 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %384 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %383, i32 0, i32 1
  %385 = load i8, i8* %384, align 1
  %386 = zext i8 %385 to i32
  %387 = load i32, i32* %13, align 4
  %388 = lshr i32 %387, %386
  store i32 %388, i32* %13, align 4
  br label %389

; <label>:389:                                    ; preds = %376
  br label %390

; <label>:390:                                    ; preds = %389
  %391 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %392 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %391, i32 0, i32 0
  %393 = load i8, i8* %392, align 4
  %394 = zext i8 %393 to i32
  switch i32 %394, label %422 [
    i32 7, label %396
    i32 9, label %._crit_edge2
    i32 11, label %411
  ]

._crit_edge2:                                     ; preds = %390
  %pgocount23 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 2)
  %395 = add i64 %pgocount23, 1
  store i64 %395, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 2)
  br label %411

; <label>:396:                                    ; preds = %390
  br label %397

; <label>:397:                                    ; preds = %396
  %398 = load i32, i32* %15, align 4
  %399 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %400 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %399, i32 0, i32 2
  %401 = load i32, i32* %400, align 4
  %402 = add i32 %398, %401
  %403 = load i32*, i32** %18, align 8
  %404 = getelementptr inbounds i32, i32* %403, i32 1
  store i32* %404, i32** %18, align 8
  store i32 %402, i32* %403, align 4
  %405 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %406 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %405, i32 0, i32 2
  %407 = load i32, i32* %406, align 4
  %408 = load i32, i32* %11, align 4
  %409 = add i32 %408, %407
  store i32 %409, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %410

; <label>:410:                                    ; preds = %397
  br label %426

; <label>:411:                                    ; preds = %._crit_edge2, %390
  %412 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %413 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %412, i32 0, i32 2
  %414 = load i32, i32* %413, align 4
  %415 = load i32, i32* %11, align 4
  %416 = add i32 %415, %414
  store i32 %416, i32* %11, align 4
  %417 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %418 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %417, i32 0, i32 2
  %419 = load i32, i32* %418, align 4
  %420 = load i32, i32* %15, align 4
  %421 = add i32 %420, %419
  store i32 %421, i32* %15, align 4
  br label %424

; <label>:422:                                    ; preds = %390
  %pgocount24 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 64)
  %423 = add i64 %pgocount24, 1
  store i64 %423, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 64)
  br label %937

; <label>:424:                                    ; preds = %411
  %pgocount25 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 17)
  %425 = add i64 %pgocount25, 1
  store i64 %425, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 17)
  br label %312

; <label>:426:                                    ; preds = %410
  %pgocount26 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 65)
  %427 = add i64 %pgocount26, 1
  store i64 %427, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 65)
  br label %660

; <label>:428:                                    ; preds = %187
  br label %429

; <label>:429:                                    ; preds = %541, %428
  br label %430

; <label>:430:                                    ; preds = %429
  br label %431

; <label>:431:                                    ; preds = %430
  %432 = load i32, i32* %14, align 4
  %433 = icmp slt i32 %432, 12
  br i1 %433, label %434, label %487

; <label>:434:                                    ; preds = %431
  %435 = load i8*, i8** %16, align 8
  %436 = load i8*, i8** %17, align 8
  %437 = icmp uge i8* %435, %436
  br i1 %437, label %438, label %445

; <label>:438:                                    ; preds = %434
  %439 = load i32, i32* %14, align 4
  %440 = icmp eq i32 %439, 0
  br i1 %440, label %441, label %443

; <label>:441:                                    ; preds = %438
  %pgocount27 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 59)
  %442 = add i64 %pgocount27, 1
  store i64 %442, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 59)
  br label %940

; <label>:443:                                    ; preds = %438
  %pgocount28 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 22)
  %444 = add i64 %pgocount28, 1
  store i64 %444, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 22)
  store i32 12, i32* %14, align 4
  br label %486

; <label>:445:                                    ; preds = %434
  %446 = load i8*, i8** %21, align 8
  %447 = load i8*, i8** %16, align 8
  %448 = getelementptr inbounds i8, i8* %447, i32 1
  store i8* %448, i8** %16, align 8
  %449 = load i8, i8* %447, align 1
  %450 = zext i8 %449 to i64
  %451 = getelementptr inbounds i8, i8* %446, i64 %450
  %452 = load i8, i8* %451, align 1
  %453 = zext i8 %452 to i32
  %454 = load i32, i32* %14, align 4
  %455 = shl i32 %453, %454
  %456 = load i32, i32* %13, align 4
  %457 = or i32 %456, %455
  store i32 %457, i32* %13, align 4
  %458 = load i32, i32* %14, align 4
  %459 = add nsw i32 %458, 8
  store i32 %459, i32* %14, align 4
  %460 = icmp slt i32 %459, 12
  br i1 %460, label %461, label %484

; <label>:461:                                    ; preds = %445
  %462 = load i8*, i8** %16, align 8
  %463 = load i8*, i8** %17, align 8
  %464 = icmp uge i8* %462, %463
  br i1 %464, label %465, label %467

; <label>:465:                                    ; preds = %461
  %pgocount29 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 38)
  %466 = add i64 %pgocount29, 1
  store i64 %466, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 38)
  store i32 12, i32* %14, align 4
  br label %483

; <label>:467:                                    ; preds = %461
  %pgocount30 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 39)
  %468 = add i64 %pgocount30, 1
  store i64 %468, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 39)
  %469 = load i8*, i8** %21, align 8
  %470 = load i8*, i8** %16, align 8
  %471 = getelementptr inbounds i8, i8* %470, i32 1
  store i8* %471, i8** %16, align 8
  %472 = load i8, i8* %470, align 1
  %473 = zext i8 %472 to i64
  %474 = getelementptr inbounds i8, i8* %469, i64 %473
  %475 = load i8, i8* %474, align 1
  %476 = zext i8 %475 to i32
  %477 = load i32, i32* %14, align 4
  %478 = shl i32 %476, %477
  %479 = load i32, i32* %13, align 4
  %480 = or i32 %479, %478
  store i32 %480, i32* %13, align 4
  %481 = load i32, i32* %14, align 4
  %482 = add nsw i32 %481, 8
  store i32 %482, i32* %14, align 4
  br label %483

; <label>:483:                                    ; preds = %467, %465
  br label %484

; <label>:484:                                    ; preds = %483, %445
  %pgocount31 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 20)
  %485 = add i64 %pgocount31, 1
  store i64 %485, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 20)
  br label %486

; <label>:486:                                    ; preds = %484, %443
  br label %487

; <label>:487:                                    ; preds = %486, %431
  br label %488

; <label>:488:                                    ; preds = %487
  %489 = load i32, i32* %13, align 4
  %490 = and i32 %489, 4095
  %491 = zext i32 %490 to i64
  %492 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* getelementptr inbounds ([0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i32 0, i32 0), i64 %491
  store %struct.TIFFFaxTabEnt* %492, %struct.TIFFFaxTabEnt** %22, align 8
  br label %493

; <label>:493:                                    ; preds = %488
  %494 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %495 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %494, i32 0, i32 1
  %496 = load i8, i8* %495, align 1
  %497 = zext i8 %496 to i32
  %498 = load i32, i32* %14, align 4
  %499 = sub nsw i32 %498, %497
  store i32 %499, i32* %14, align 4
  %500 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %501 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %500, i32 0, i32 1
  %502 = load i8, i8* %501, align 1
  %503 = zext i8 %502 to i32
  %504 = load i32, i32* %13, align 4
  %505 = lshr i32 %504, %503
  store i32 %505, i32* %13, align 4
  br label %506

; <label>:506:                                    ; preds = %493
  br label %507

; <label>:507:                                    ; preds = %506
  %508 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %509 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %508, i32 0, i32 0
  %510 = load i8, i8* %509, align 4
  %511 = zext i8 %510 to i32
  switch i32 %511, label %539 [
    i32 7, label %513
    i32 9, label %._crit_edge1
    i32 11, label %528
  ]

._crit_edge1:                                     ; preds = %507
  %pgocount32 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 1)
  %512 = add i64 %pgocount32, 1
  store i64 %512, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 1)
  br label %528

; <label>:513:                                    ; preds = %507
  br label %514

; <label>:514:                                    ; preds = %513
  %515 = load i32, i32* %15, align 4
  %516 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %517 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %516, i32 0, i32 2
  %518 = load i32, i32* %517, align 4
  %519 = add i32 %515, %518
  %520 = load i32*, i32** %18, align 8
  %521 = getelementptr inbounds i32, i32* %520, i32 1
  store i32* %521, i32** %18, align 8
  store i32 %519, i32* %520, align 4
  %522 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %523 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %522, i32 0, i32 2
  %524 = load i32, i32* %523, align 4
  %525 = load i32, i32* %11, align 4
  %526 = add i32 %525, %524
  store i32 %526, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %527

; <label>:527:                                    ; preds = %514
  br label %543

; <label>:528:                                    ; preds = %._crit_edge1, %507
  %529 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %530 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %529, i32 0, i32 2
  %531 = load i32, i32* %530, align 4
  %532 = load i32, i32* %11, align 4
  %533 = add i32 %532, %531
  store i32 %533, i32* %11, align 4
  %534 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %535 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %534, i32 0, i32 2
  %536 = load i32, i32* %535, align 4
  %537 = load i32, i32* %15, align 4
  %538 = add i32 %537, %536
  store i32 %538, i32* %15, align 4
  br label %541

; <label>:539:                                    ; preds = %507
  %pgocount33 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 54)
  %540 = add i64 %pgocount33, 1
  store i64 %540, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 54)
  br label %937

; <label>:541:                                    ; preds = %528
  %pgocount34 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 10)
  %542 = add i64 %pgocount34, 1
  store i64 %542, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 10)
  br label %429

; <label>:543:                                    ; preds = %527
  br label %544

; <label>:544:                                    ; preds = %656, %543
  br label %545

; <label>:545:                                    ; preds = %544
  br label %546

; <label>:546:                                    ; preds = %545
  %547 = load i32, i32* %14, align 4
  %548 = icmp slt i32 %547, 13
  br i1 %548, label %549, label %602

; <label>:549:                                    ; preds = %546
  %550 = load i8*, i8** %16, align 8
  %551 = load i8*, i8** %17, align 8
  %552 = icmp uge i8* %550, %551
  br i1 %552, label %553, label %560

; <label>:553:                                    ; preds = %549
  %554 = load i32, i32* %14, align 4
  %555 = icmp eq i32 %554, 0
  br i1 %555, label %556, label %558

; <label>:556:                                    ; preds = %553
  %pgocount35 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 76)
  %557 = add i64 %pgocount35, 1
  store i64 %557, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 76)
  br label %940

; <label>:558:                                    ; preds = %553
  %pgocount36 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 31)
  %559 = add i64 %pgocount36, 1
  store i64 %559, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 31)
  store i32 13, i32* %14, align 4
  br label %601

; <label>:560:                                    ; preds = %549
  %561 = load i8*, i8** %21, align 8
  %562 = load i8*, i8** %16, align 8
  %563 = getelementptr inbounds i8, i8* %562, i32 1
  store i8* %563, i8** %16, align 8
  %564 = load i8, i8* %562, align 1
  %565 = zext i8 %564 to i64
  %566 = getelementptr inbounds i8, i8* %561, i64 %565
  %567 = load i8, i8* %566, align 1
  %568 = zext i8 %567 to i32
  %569 = load i32, i32* %14, align 4
  %570 = shl i32 %568, %569
  %571 = load i32, i32* %13, align 4
  %572 = or i32 %571, %570
  store i32 %572, i32* %13, align 4
  %573 = load i32, i32* %14, align 4
  %574 = add nsw i32 %573, 8
  store i32 %574, i32* %14, align 4
  %575 = icmp slt i32 %574, 13
  br i1 %575, label %576, label %599

; <label>:576:                                    ; preds = %560
  %577 = load i8*, i8** %16, align 8
  %578 = load i8*, i8** %17, align 8
  %579 = icmp uge i8* %577, %578
  br i1 %579, label %580, label %582

; <label>:580:                                    ; preds = %576
  %pgocount37 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 48)
  %581 = add i64 %pgocount37, 1
  store i64 %581, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 48)
  store i32 13, i32* %14, align 4
  br label %598

; <label>:582:                                    ; preds = %576
  %pgocount38 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 49)
  %583 = add i64 %pgocount38, 1
  store i64 %583, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 49)
  %584 = load i8*, i8** %21, align 8
  %585 = load i8*, i8** %16, align 8
  %586 = getelementptr inbounds i8, i8* %585, i32 1
  store i8* %586, i8** %16, align 8
  %587 = load i8, i8* %585, align 1
  %588 = zext i8 %587 to i64
  %589 = getelementptr inbounds i8, i8* %584, i64 %588
  %590 = load i8, i8* %589, align 1
  %591 = zext i8 %590 to i32
  %592 = load i32, i32* %14, align 4
  %593 = shl i32 %591, %592
  %594 = load i32, i32* %13, align 4
  %595 = or i32 %594, %593
  store i32 %595, i32* %13, align 4
  %596 = load i32, i32* %14, align 4
  %597 = add nsw i32 %596, 8
  store i32 %597, i32* %14, align 4
  br label %598

; <label>:598:                                    ; preds = %582, %580
  br label %599

; <label>:599:                                    ; preds = %598, %560
  %pgocount39 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 28)
  %600 = add i64 %pgocount39, 1
  store i64 %600, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 28)
  br label %601

; <label>:601:                                    ; preds = %599, %558
  br label %602

; <label>:602:                                    ; preds = %601, %546
  br label %603

; <label>:603:                                    ; preds = %602
  %604 = load i32, i32* %13, align 4
  %605 = and i32 %604, 8191
  %606 = zext i32 %605 to i64
  %607 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* getelementptr inbounds ([0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i32 0, i32 0), i64 %606
  store %struct.TIFFFaxTabEnt* %607, %struct.TIFFFaxTabEnt** %22, align 8
  br label %608

; <label>:608:                                    ; preds = %603
  %609 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %610 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %609, i32 0, i32 1
  %611 = load i8, i8* %610, align 1
  %612 = zext i8 %611 to i32
  %613 = load i32, i32* %14, align 4
  %614 = sub nsw i32 %613, %612
  store i32 %614, i32* %14, align 4
  %615 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %616 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %615, i32 0, i32 1
  %617 = load i8, i8* %616, align 1
  %618 = zext i8 %617 to i32
  %619 = load i32, i32* %13, align 4
  %620 = lshr i32 %619, %618
  store i32 %620, i32* %13, align 4
  br label %621

; <label>:621:                                    ; preds = %608
  br label %622

; <label>:622:                                    ; preds = %621
  %623 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %624 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %623, i32 0, i32 0
  %625 = load i8, i8* %624, align 4
  %626 = zext i8 %625 to i32
  switch i32 %626, label %654 [
    i32 8, label %628
    i32 10, label %._crit_edge3
    i32 11, label %643
  ]

._crit_edge3:                                     ; preds = %622
  %pgocount40 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 3)
  %627 = add i64 %pgocount40, 1
  store i64 %627, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 3)
  br label %643

; <label>:628:                                    ; preds = %622
  br label %629

; <label>:629:                                    ; preds = %628
  %630 = load i32, i32* %15, align 4
  %631 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %632 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %631, i32 0, i32 2
  %633 = load i32, i32* %632, align 4
  %634 = add i32 %630, %633
  %635 = load i32*, i32** %18, align 8
  %636 = getelementptr inbounds i32, i32* %635, i32 1
  store i32* %636, i32** %18, align 8
  store i32 %634, i32* %635, align 4
  %637 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %638 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %637, i32 0, i32 2
  %639 = load i32, i32* %638, align 4
  %640 = load i32, i32* %11, align 4
  %641 = add i32 %640, %639
  store i32 %641, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %642

; <label>:642:                                    ; preds = %629
  br label %658

; <label>:643:                                    ; preds = %._crit_edge3, %622
  %644 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %645 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %644, i32 0, i32 2
  %646 = load i32, i32* %645, align 4
  %647 = load i32, i32* %11, align 4
  %648 = add i32 %647, %646
  store i32 %648, i32* %11, align 4
  %649 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %650 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %649, i32 0, i32 2
  %651 = load i32, i32* %650, align 4
  %652 = load i32, i32* %15, align 4
  %653 = add i32 %652, %651
  store i32 %653, i32* %15, align 4
  br label %656

; <label>:654:                                    ; preds = %622
  %pgocount41 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 66)
  %655 = add i64 %pgocount41, 1
  store i64 %655, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 66)
  br label %934

; <label>:656:                                    ; preds = %643
  %pgocount42 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 18)
  %657 = add i64 %pgocount42, 1
  store i64 %657, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 18)
  br label %544

; <label>:658:                                    ; preds = %642
  %pgocount43 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 67)
  %659 = add i64 %pgocount43, 1
  store i64 %659, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 67)
  br label %660

; <label>:660:                                    ; preds = %658, %426
  br label %661

; <label>:661:                                    ; preds = %660
  %662 = load i32*, i32** %18, align 8
  %663 = load i32*, i32** %19, align 8
  %664 = icmp ne i32* %662, %663
  br i1 %664, label %665, label %692

; <label>:665:                                    ; preds = %661
  br label %666

; <label>:666:                                    ; preds = %677, %665
  %667 = load i32, i32* %23, align 4
  %668 = load i32, i32* %11, align 4
  %669 = icmp sle i32 %667, %668
  br i1 %669, label %670, label %675

; <label>:670:                                    ; preds = %666
  %pgocount44 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 25)
  %671 = add i64 %pgocount44, 1
  store i64 %671, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 25)
  %672 = load i32, i32* %23, align 4
  %673 = load i32, i32* %12, align 4
  %674 = icmp slt i32 %672, %673
  br label %675

; <label>:675:                                    ; preds = %670, %666
  %676 = phi i1 [ false, %666 ], [ %674, %670 ]
  br i1 %676, label %677, label %690

; <label>:677:                                    ; preds = %675
  %pgocount45 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 23)
  %678 = add i64 %pgocount45, 1
  store i64 %678, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 23)
  %679 = load i32*, i32** %24, align 8
  %680 = getelementptr inbounds i32, i32* %679, i64 0
  %681 = load i32, i32* %680, align 4
  %682 = load i32*, i32** %24, align 8
  %683 = getelementptr inbounds i32, i32* %682, i64 1
  %684 = load i32, i32* %683, align 4
  %685 = add i32 %681, %684
  %686 = load i32, i32* %23, align 4
  %687 = add i32 %686, %685
  store i32 %687, i32* %23, align 4
  %688 = load i32*, i32** %24, align 8
  %689 = getelementptr inbounds i32, i32* %688, i64 2
  store i32* %689, i32** %24, align 8
  br label %666

; <label>:690:                                    ; preds = %675
  %pgocount46 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 60)
  %691 = add i64 %pgocount46, 1
  store i64 %691, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 60)
  br label %692

; <label>:692:                                    ; preds = %690, %661
  br label %693

; <label>:693:                                    ; preds = %692
  br label %1055

; <label>:694:                                    ; preds = %131
  br label %695

; <label>:695:                                    ; preds = %694
  %696 = load i32*, i32** %18, align 8
  %697 = load i32*, i32** %19, align 8
  %698 = icmp ne i32* %696, %697
  br i1 %698, label %699, label %726

; <label>:699:                                    ; preds = %695
  br label %700

; <label>:700:                                    ; preds = %711, %699
  %701 = load i32, i32* %23, align 4
  %702 = load i32, i32* %11, align 4
  %703 = icmp sle i32 %701, %702
  br i1 %703, label %704, label %709

; <label>:704:                                    ; preds = %700
  %pgocount47 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 12)
  %705 = add i64 %pgocount47, 1
  store i64 %705, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 12)
  %706 = load i32, i32* %23, align 4
  %707 = load i32, i32* %12, align 4
  %708 = icmp slt i32 %706, %707
  br label %709

; <label>:709:                                    ; preds = %704, %700
  %710 = phi i1 [ false, %700 ], [ %708, %704 ]
  br i1 %710, label %711, label %724

; <label>:711:                                    ; preds = %709
  %pgocount48 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 5)
  %712 = add i64 %pgocount48, 1
  store i64 %712, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 5)
  %713 = load i32*, i32** %24, align 8
  %714 = getelementptr inbounds i32, i32* %713, i64 0
  %715 = load i32, i32* %714, align 4
  %716 = load i32*, i32** %24, align 8
  %717 = getelementptr inbounds i32, i32* %716, i64 1
  %718 = load i32, i32* %717, align 4
  %719 = add i32 %715, %718
  %720 = load i32, i32* %23, align 4
  %721 = add i32 %720, %719
  store i32 %721, i32* %23, align 4
  %722 = load i32*, i32** %24, align 8
  %723 = getelementptr inbounds i32, i32* %722, i64 2
  store i32* %723, i32** %24, align 8
  br label %700

; <label>:724:                                    ; preds = %709
  %pgocount49 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 41)
  %725 = add i64 %pgocount49, 1
  store i64 %725, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 41)
  br label %726

; <label>:726:                                    ; preds = %724, %695
  br label %727

; <label>:727:                                    ; preds = %726
  br label %728

; <label>:728:                                    ; preds = %727
  %729 = load i32, i32* %15, align 4
  %730 = load i32, i32* %23, align 4
  %731 = load i32, i32* %11, align 4
  %732 = sub nsw i32 %730, %731
  %733 = add nsw i32 %729, %732
  %734 = load i32*, i32** %18, align 8
  %735 = getelementptr inbounds i32, i32* %734, i32 1
  store i32* %735, i32** %18, align 8
  store i32 %733, i32* %734, align 4
  %736 = load i32, i32* %23, align 4
  %737 = load i32, i32* %11, align 4
  %738 = sub nsw i32 %736, %737
  %739 = load i32, i32* %11, align 4
  %740 = add nsw i32 %739, %738
  store i32 %740, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %741

; <label>:741:                                    ; preds = %728
  %pgocount50 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 33)
  %742 = add i64 %pgocount50, 1
  store i64 %742, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 33)
  %743 = load i32*, i32** %24, align 8
  %744 = getelementptr inbounds i32, i32* %743, i32 1
  store i32* %744, i32** %24, align 8
  %745 = load i32, i32* %743, align 4
  %746 = load i32, i32* %23, align 4
  %747 = add i32 %746, %745
  store i32 %747, i32* %23, align 4
  br label %1055

; <label>:748:                                    ; preds = %131
  br label %749

; <label>:749:                                    ; preds = %748
  %750 = load i32*, i32** %18, align 8
  %751 = load i32*, i32** %19, align 8
  %752 = icmp ne i32* %750, %751
  br i1 %752, label %753, label %780

; <label>:753:                                    ; preds = %749
  br label %754

; <label>:754:                                    ; preds = %765, %753
  %755 = load i32, i32* %23, align 4
  %756 = load i32, i32* %11, align 4
  %757 = icmp sle i32 %755, %756
  br i1 %757, label %758, label %763

; <label>:758:                                    ; preds = %754
  %pgocount51 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 13)
  %759 = add i64 %pgocount51, 1
  store i64 %759, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 13)
  %760 = load i32, i32* %23, align 4
  %761 = load i32, i32* %12, align 4
  %762 = icmp slt i32 %760, %761
  br label %763

; <label>:763:                                    ; preds = %758, %754
  %764 = phi i1 [ false, %754 ], [ %762, %758 ]
  br i1 %764, label %765, label %778

; <label>:765:                                    ; preds = %763
  %pgocount52 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 6)
  %766 = add i64 %pgocount52, 1
  store i64 %766, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 6)
  %767 = load i32*, i32** %24, align 8
  %768 = getelementptr inbounds i32, i32* %767, i64 0
  %769 = load i32, i32* %768, align 4
  %770 = load i32*, i32** %24, align 8
  %771 = getelementptr inbounds i32, i32* %770, i64 1
  %772 = load i32, i32* %771, align 4
  %773 = add i32 %769, %772
  %774 = load i32, i32* %23, align 4
  %775 = add i32 %774, %773
  store i32 %775, i32* %23, align 4
  %776 = load i32*, i32** %24, align 8
  %777 = getelementptr inbounds i32, i32* %776, i64 2
  store i32* %777, i32** %24, align 8
  br label %754

; <label>:778:                                    ; preds = %763
  %pgocount53 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 42)
  %779 = add i64 %pgocount53, 1
  store i64 %779, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 42)
  br label %780

; <label>:780:                                    ; preds = %778, %749
  br label %781

; <label>:781:                                    ; preds = %780
  br label %782

; <label>:782:                                    ; preds = %781
  %783 = load i32, i32* %15, align 4
  %784 = load i32, i32* %23, align 4
  %785 = load i32, i32* %11, align 4
  %786 = sub nsw i32 %784, %785
  %787 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %788 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %787, i32 0, i32 2
  %789 = load i32, i32* %788, align 4
  %790 = add i32 %786, %789
  %791 = add i32 %783, %790
  %792 = load i32*, i32** %18, align 8
  %793 = getelementptr inbounds i32, i32* %792, i32 1
  store i32* %793, i32** %18, align 8
  store i32 %791, i32* %792, align 4
  %794 = load i32, i32* %23, align 4
  %795 = load i32, i32* %11, align 4
  %796 = sub nsw i32 %794, %795
  %797 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %798 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %797, i32 0, i32 2
  %799 = load i32, i32* %798, align 4
  %800 = add i32 %796, %799
  %801 = load i32, i32* %11, align 4
  %802 = add i32 %801, %800
  store i32 %802, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %803

; <label>:803:                                    ; preds = %782
  %pgocount54 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 34)
  %804 = add i64 %pgocount54, 1
  store i64 %804, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 34)
  %805 = load i32*, i32** %24, align 8
  %806 = getelementptr inbounds i32, i32* %805, i32 1
  store i32* %806, i32** %24, align 8
  %807 = load i32, i32* %805, align 4
  %808 = load i32, i32* %23, align 4
  %809 = add i32 %808, %807
  store i32 %809, i32* %23, align 4
  br label %1055

; <label>:810:                                    ; preds = %131
  br label %811

; <label>:811:                                    ; preds = %810
  %812 = load i32*, i32** %18, align 8
  %813 = load i32*, i32** %19, align 8
  %814 = icmp ne i32* %812, %813
  br i1 %814, label %815, label %842

; <label>:815:                                    ; preds = %811
  br label %816

; <label>:816:                                    ; preds = %827, %815
  %817 = load i32, i32* %23, align 4
  %818 = load i32, i32* %11, align 4
  %819 = icmp sle i32 %817, %818
  br i1 %819, label %820, label %825

; <label>:820:                                    ; preds = %816
  %pgocount55 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 14)
  %821 = add i64 %pgocount55, 1
  store i64 %821, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 14)
  %822 = load i32, i32* %23, align 4
  %823 = load i32, i32* %12, align 4
  %824 = icmp slt i32 %822, %823
  br label %825

; <label>:825:                                    ; preds = %820, %816
  %826 = phi i1 [ false, %816 ], [ %824, %820 ]
  br i1 %826, label %827, label %840

; <label>:827:                                    ; preds = %825
  %pgocount56 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 7)
  %828 = add i64 %pgocount56, 1
  store i64 %828, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 7)
  %829 = load i32*, i32** %24, align 8
  %830 = getelementptr inbounds i32, i32* %829, i64 0
  %831 = load i32, i32* %830, align 4
  %832 = load i32*, i32** %24, align 8
  %833 = getelementptr inbounds i32, i32* %832, i64 1
  %834 = load i32, i32* %833, align 4
  %835 = add i32 %831, %834
  %836 = load i32, i32* %23, align 4
  %837 = add i32 %836, %835
  store i32 %837, i32* %23, align 4
  %838 = load i32*, i32** %24, align 8
  %839 = getelementptr inbounds i32, i32* %838, i64 2
  store i32* %839, i32** %24, align 8
  br label %816

; <label>:840:                                    ; preds = %825
  %pgocount57 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 43)
  %841 = add i64 %pgocount57, 1
  store i64 %841, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 43)
  br label %842

; <label>:842:                                    ; preds = %840, %811
  br label %843

; <label>:843:                                    ; preds = %842
  br label %844

; <label>:844:                                    ; preds = %843
  %845 = load i32, i32* %15, align 4
  %846 = load i32, i32* %23, align 4
  %847 = load i32, i32* %11, align 4
  %848 = sub nsw i32 %846, %847
  %849 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %850 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %849, i32 0, i32 2
  %851 = load i32, i32* %850, align 4
  %852 = sub i32 %848, %851
  %853 = add i32 %845, %852
  %854 = load i32*, i32** %18, align 8
  %855 = getelementptr inbounds i32, i32* %854, i32 1
  store i32* %855, i32** %18, align 8
  store i32 %853, i32* %854, align 4
  %856 = load i32, i32* %23, align 4
  %857 = load i32, i32* %11, align 4
  %858 = sub nsw i32 %856, %857
  %859 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %860 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %859, i32 0, i32 2
  %861 = load i32, i32* %860, align 4
  %862 = sub i32 %858, %861
  %863 = load i32, i32* %11, align 4
  %864 = add i32 %863, %862
  store i32 %864, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %865

; <label>:865:                                    ; preds = %844
  %pgocount58 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 35)
  %866 = add i64 %pgocount58, 1
  store i64 %866, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 35)
  %867 = load i32*, i32** %24, align 8
  %868 = getelementptr inbounds i32, i32* %867, i32 -1
  store i32* %868, i32** %24, align 8
  %869 = load i32, i32* %868, align 4
  %870 = load i32, i32* %23, align 4
  %871 = sub i32 %870, %869
  store i32 %871, i32* %23, align 4
  br label %1055

; <label>:872:                                    ; preds = %131
  %pgocount59 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 69)
  %873 = add i64 %pgocount59, 1
  store i64 %873, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 69)
  %874 = load i32, i32* %12, align 4
  %875 = load i32, i32* %11, align 4
  %876 = sub nsw i32 %874, %875
  %877 = load i32*, i32** %18, align 8
  %878 = getelementptr inbounds i32, i32* %877, i32 1
  store i32* %878, i32** %18, align 8
  store i32 %876, i32* %877, align 4
  %879 = load %struct.tiff*, %struct.tiff** %6, align 8
  %880 = load i32, i32* %11, align 4
  call void @Fax3Extension(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @Fax4Decode.module, i32 0, i32 0), %struct.tiff* %879, i32 %880)
  br label %1124

; <label>:881:                                    ; preds = %131
  %882 = load i32, i32* %12, align 4
  %883 = load i32, i32* %11, align 4
  %884 = sub nsw i32 %882, %883
  %885 = load i32*, i32** %18, align 8
  %886 = getelementptr inbounds i32, i32* %885, i32 1
  store i32* %886, i32** %18, align 8
  store i32 %884, i32* %885, align 4
  br label %887

; <label>:887:                                    ; preds = %881
  %888 = load i32, i32* %14, align 4
  %889 = icmp slt i32 %888, 5
  br i1 %889, label %890, label %918

; <label>:890:                                    ; preds = %887
  %891 = load i8*, i8** %16, align 8
  %892 = load i8*, i8** %17, align 8
  %893 = icmp uge i8* %891, %892
  br i1 %893, label %894, label %901

; <label>:894:                                    ; preds = %890
  %895 = load i32, i32* %14, align 4
  %896 = icmp eq i32 %895, 0
  br i1 %896, label %897, label %899

; <label>:897:                                    ; preds = %894
  %pgocount60 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 86)
  %898 = add i64 %pgocount60, 1
  store i64 %898, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 86)
  br label %940

; <label>:899:                                    ; preds = %894
  %pgocount61 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 83)
  %900 = add i64 %pgocount61, 1
  store i64 %900, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 83)
  store i32 5, i32* %14, align 4
  br label %917

; <label>:901:                                    ; preds = %890
  %pgocount62 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 82)
  %902 = add i64 %pgocount62, 1
  store i64 %902, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 82)
  %903 = load i8*, i8** %21, align 8
  %904 = load i8*, i8** %16, align 8
  %905 = getelementptr inbounds i8, i8* %904, i32 1
  store i8* %905, i8** %16, align 8
  %906 = load i8, i8* %904, align 1
  %907 = zext i8 %906 to i64
  %908 = getelementptr inbounds i8, i8* %903, i64 %907
  %909 = load i8, i8* %908, align 1
  %910 = zext i8 %909 to i32
  %911 = load i32, i32* %14, align 4
  %912 = shl i32 %910, %911
  %913 = load i32, i32* %13, align 4
  %914 = or i32 %913, %912
  store i32 %914, i32* %13, align 4
  %915 = load i32, i32* %14, align 4
  %916 = add nsw i32 %915, 8
  store i32 %916, i32* %14, align 4
  br label %917

; <label>:917:                                    ; preds = %901, %899
  br label %918

; <label>:918:                                    ; preds = %917, %887
  br label %919

; <label>:919:                                    ; preds = %918
  %920 = load i32, i32* %13, align 4
  %921 = and i32 %920, 31
  %922 = icmp ne i32 %921, 0
  br i1 %922, label %923, label %927

; <label>:923:                                    ; preds = %919
  %pgocount63 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 78)
  %924 = add i64 %pgocount63, 1
  store i64 %924, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 78)
  %925 = load %struct.tiff*, %struct.tiff** %6, align 8
  %926 = load i32, i32* %11, align 4
  call void @Fax3Unexpected(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @Fax4Decode.module, i32 0, i32 0), %struct.tiff* %925, i32 %926)
  br label %927

; <label>:927:                                    ; preds = %923, %919
  %pgocount64 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 71)
  %928 = add i64 %pgocount64, 1
  store i64 %928, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 71)
  store i32 1, i32* %20, align 4
  br label %1124

; <label>:929:                                    ; preds = %131
  %pgocount65 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 70)
  %930 = add i64 %pgocount65, 1
  store i64 %930, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 70)
  br label %931

; <label>:931:                                    ; preds = %1102, %929
  %932 = load %struct.tiff*, %struct.tiff** %6, align 8
  %933 = load i32, i32* %11, align 4
  call void @Fax3Unexpected(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @Fax4Decode.module, i32 0, i32 0), %struct.tiff* %932, i32 %933)
  br label %1124

; <label>:934:                                    ; preds = %654, %307
  %935 = load %struct.tiff*, %struct.tiff** %6, align 8
  %936 = load i32, i32* %11, align 4
  call void @Fax3Unexpected(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @Fax4Decode.module, i32 0, i32 0), %struct.tiff* %935, i32 %936)
  br label %1124

; <label>:937:                                    ; preds = %539, %422
  %938 = load %struct.tiff*, %struct.tiff** %6, align 8
  %939 = load i32, i32* %11, align 4
  call void @Fax3Unexpected(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @Fax4Decode.module, i32 0, i32 0), %struct.tiff* %938, i32 %939)
  br label %1124

; <label>:940:                                    ; preds = %1076, %897, %556, %441, %324, %209, %90
  %941 = load %struct.tiff*, %struct.tiff** %6, align 8
  %942 = load i32, i32* %11, align 4
  call void @Fax3PrematureEOF(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @Fax4Decode.module, i32 0, i32 0), %struct.tiff* %941, i32 %942)
  br label %943

; <label>:943:                                    ; preds = %940
  %944 = load i32, i32* %15, align 4
  %945 = icmp ne i32 %944, 0
  br i1 %945, label %946, label %956

; <label>:946:                                    ; preds = %943
  %pgocount66 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 52)
  %947 = add i64 %pgocount66, 1
  store i64 %947, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 52)
  br label %948

; <label>:948:                                    ; preds = %946
  %949 = load i32, i32* %15, align 4
  %950 = add nsw i32 %949, 0
  %951 = load i32*, i32** %18, align 8
  %952 = getelementptr inbounds i32, i32* %951, i32 1
  store i32* %952, i32** %18, align 8
  store i32 %950, i32* %951, align 4
  %953 = load i32, i32* %11, align 4
  %954 = add nsw i32 %953, 0
  store i32 %954, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %955

; <label>:955:                                    ; preds = %948
  br label %956

; <label>:956:                                    ; preds = %955, %943
  %957 = load i32, i32* %11, align 4
  %958 = load i32, i32* %12, align 4
  %959 = icmp ne i32 %957, %958
  br i1 %959, label %960, label %1053

; <label>:960:                                    ; preds = %956
  %961 = load %struct.tiff*, %struct.tiff** %6, align 8
  %962 = load i32, i32* %11, align 4
  %963 = load i32, i32* %12, align 4
  call void @Fax3BadLength(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @Fax4Decode.module, i32 0, i32 0), %struct.tiff* %961, i32 %962, i32 %963)
  br label %964

; <label>:964:                                    ; preds = %975, %960
  %965 = load i32, i32* %11, align 4
  %966 = load i32, i32* %12, align 4
  %967 = icmp sgt i32 %965, %966
  br i1 %967, label %968, label %973

; <label>:968:                                    ; preds = %964
  %pgocount67 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 24)
  %969 = add i64 %pgocount67, 1
  store i64 %969, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 24)
  %970 = load i32*, i32** %18, align 8
  %971 = load i32*, i32** %19, align 8
  %972 = icmp ugt i32* %970, %971
  br label %973

; <label>:973:                                    ; preds = %968, %964
  %974 = phi i1 [ false, %964 ], [ %972, %968 ]
  br i1 %974, label %975, label %982

; <label>:975:                                    ; preds = %973
  %pgocount68 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 16)
  %976 = add i64 %pgocount68, 1
  store i64 %976, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 16)
  %977 = load i32*, i32** %18, align 8
  %978 = getelementptr inbounds i32, i32* %977, i32 -1
  store i32* %978, i32** %18, align 8
  %979 = load i32, i32* %978, align 4
  %980 = load i32, i32* %11, align 4
  %981 = sub i32 %980, %979
  store i32 %981, i32* %11, align 4
  br label %964

; <label>:982:                                    ; preds = %973
  %983 = load i32, i32* %11, align 4
  %984 = load i32, i32* %12, align 4
  %985 = icmp slt i32 %983, %984
  br i1 %985, label %986, label %1026

; <label>:986:                                    ; preds = %982
  %987 = load i32, i32* %11, align 4
  %988 = icmp slt i32 %987, 0
  br i1 %988, label %989, label %991

; <label>:989:                                    ; preds = %986
  %pgocount69 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 79)
  %990 = add i64 %pgocount69, 1
  store i64 %990, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 79)
  store i32 0, i32* %11, align 4
  br label %991

; <label>:991:                                    ; preds = %989, %986
  %992 = load i32*, i32** %18, align 8
  %993 = load i32*, i32** %19, align 8
  %994 = ptrtoint i32* %992 to i64
  %995 = ptrtoint i32* %993 to i64
  %996 = sub i64 %994, %995
  %997 = sdiv exact i64 %996, 4
  %998 = and i64 %997, 1
  %999 = icmp ne i64 %998, 0
  br i1 %999, label %1000, label %1010

; <label>:1000:                                   ; preds = %991
  br label %1001

; <label>:1001:                                   ; preds = %1000
  %1002 = load i32, i32* %15, align 4
  %1003 = add nsw i32 %1002, 0
  %1004 = load i32*, i32** %18, align 8
  %1005 = getelementptr inbounds i32, i32* %1004, i32 1
  store i32* %1005, i32** %18, align 8
  store i32 %1003, i32* %1004, align 4
  %1006 = load i32, i32* %11, align 4
  %1007 = add nsw i32 %1006, 0
  store i32 %1007, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1008

; <label>:1008:                                   ; preds = %1001
  %pgocount70 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 73)
  %1009 = add i64 %pgocount70, 1
  store i64 %1009, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 73)
  br label %1010

; <label>:1010:                                   ; preds = %1008, %991
  br label %1011

; <label>:1011:                                   ; preds = %1010
  %1012 = load i32, i32* %15, align 4
  %1013 = load i32, i32* %12, align 4
  %1014 = load i32, i32* %11, align 4
  %1015 = sub nsw i32 %1013, %1014
  %1016 = add nsw i32 %1012, %1015
  %1017 = load i32*, i32** %18, align 8
  %1018 = getelementptr inbounds i32, i32* %1017, i32 1
  store i32* %1018, i32** %18, align 8
  store i32 %1016, i32* %1017, align 4
  %1019 = load i32, i32* %12, align 4
  %1020 = load i32, i32* %11, align 4
  %1021 = sub nsw i32 %1019, %1020
  %1022 = load i32, i32* %11, align 4
  %1023 = add nsw i32 %1022, %1021
  store i32 %1023, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1024

; <label>:1024:                                   ; preds = %1011
  %pgocount71 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 62)
  %1025 = add i64 %pgocount71, 1
  store i64 %1025, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 62)
  br label %1052

; <label>:1026:                                   ; preds = %982
  %1027 = load i32, i32* %11, align 4
  %1028 = load i32, i32* %12, align 4
  %1029 = icmp sgt i32 %1027, %1028
  br i1 %1029, label %1030, label %1050

; <label>:1030:                                   ; preds = %1026
  br label %1031

; <label>:1031:                                   ; preds = %1030
  %1032 = load i32, i32* %15, align 4
  %1033 = load i32, i32* %12, align 4
  %1034 = add nsw i32 %1032, %1033
  %1035 = load i32*, i32** %18, align 8
  %1036 = getelementptr inbounds i32, i32* %1035, i32 1
  store i32* %1036, i32** %18, align 8
  store i32 %1034, i32* %1035, align 4
  %1037 = load i32, i32* %12, align 4
  %1038 = load i32, i32* %11, align 4
  %1039 = add nsw i32 %1038, %1037
  store i32 %1039, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1040

; <label>:1040:                                   ; preds = %1031
  br label %1041

; <label>:1041:                                   ; preds = %1040
  %1042 = load i32, i32* %15, align 4
  %1043 = add nsw i32 %1042, 0
  %1044 = load i32*, i32** %18, align 8
  %1045 = getelementptr inbounds i32, i32* %1044, i32 1
  store i32* %1045, i32** %18, align 8
  store i32 %1043, i32* %1044, align 4
  %1046 = load i32, i32* %11, align 4
  %1047 = add nsw i32 %1046, 0
  store i32 %1047, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1048

; <label>:1048:                                   ; preds = %1041
  %pgocount72 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 74)
  %1049 = add i64 %pgocount72, 1
  store i64 %1049, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 74)
  br label %1050

; <label>:1050:                                   ; preds = %1048, %1026
  %pgocount73 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 63)
  %1051 = add i64 %pgocount73, 1
  store i64 %1051, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 63)
  br label %1052

; <label>:1052:                                   ; preds = %1050, %1024
  br label %1053

; <label>:1053:                                   ; preds = %1052, %956
  br label %1054

; <label>:1054:                                   ; preds = %1053
  br label %1287

; <label>:1055:                                   ; preds = %865, %803, %741, %693, %169
  br label %74

; <label>:1056:                                   ; preds = %74
  %1057 = load i32, i32* %15, align 4
  %1058 = icmp ne i32 %1057, 0
  br i1 %1058, label %1059, label %1122

; <label>:1059:                                   ; preds = %1056
  %1060 = load i32, i32* %15, align 4
  %1061 = load i32, i32* %11, align 4
  %1062 = add nsw i32 %1060, %1061
  %1063 = load i32, i32* %12, align 4
  %1064 = icmp slt i32 %1062, %1063
  br i1 %1064, label %1065, label %1112

; <label>:1065:                                   ; preds = %1059
  br label %1066

; <label>:1066:                                   ; preds = %1065
  %1067 = load i32, i32* %14, align 4
  %1068 = icmp slt i32 %1067, 1
  br i1 %1068, label %1069, label %1097

; <label>:1069:                                   ; preds = %1066
  %1070 = load i8*, i8** %16, align 8
  %1071 = load i8*, i8** %17, align 8
  %1072 = icmp uge i8* %1070, %1071
  br i1 %1072, label %1073, label %1080

; <label>:1073:                                   ; preds = %1069
  %1074 = load i32, i32* %14, align 4
  %1075 = icmp eq i32 %1074, 0
  br i1 %1075, label %1076, label %1078

; <label>:1076:                                   ; preds = %1073
  %pgocount74 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 87)
  %1077 = add i64 %pgocount74, 1
  store i64 %1077, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 87)
  br label %940

; <label>:1078:                                   ; preds = %1073
  %pgocount75 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 85)
  %1079 = add i64 %pgocount75, 1
  store i64 %1079, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 85)
  store i32 1, i32* %14, align 4
  br label %1096

; <label>:1080:                                   ; preds = %1069
  %pgocount76 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 84)
  %1081 = add i64 %pgocount76, 1
  store i64 %1081, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 84)
  %1082 = load i8*, i8** %21, align 8
  %1083 = load i8*, i8** %16, align 8
  %1084 = getelementptr inbounds i8, i8* %1083, i32 1
  store i8* %1084, i8** %16, align 8
  %1085 = load i8, i8* %1083, align 1
  %1086 = zext i8 %1085 to i64
  %1087 = getelementptr inbounds i8, i8* %1082, i64 %1086
  %1088 = load i8, i8* %1087, align 1
  %1089 = zext i8 %1088 to i32
  %1090 = load i32, i32* %14, align 4
  %1091 = shl i32 %1089, %1090
  %1092 = load i32, i32* %13, align 4
  %1093 = or i32 %1092, %1091
  store i32 %1093, i32* %13, align 4
  %1094 = load i32, i32* %14, align 4
  %1095 = add nsw i32 %1094, 8
  store i32 %1095, i32* %14, align 4
  br label %1096

; <label>:1096:                                   ; preds = %1080, %1078
  br label %1097

; <label>:1097:                                   ; preds = %1096, %1066
  br label %1098

; <label>:1098:                                   ; preds = %1097
  %1099 = load i32, i32* %13, align 4
  %1100 = and i32 %1099, 1
  %1101 = icmp ne i32 %1100, 0
  br i1 %1101, label %1104, label %1102

; <label>:1102:                                   ; preds = %1098
  %pgocount77 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 80)
  %1103 = add i64 %pgocount77, 1
  store i64 %1103, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 80)
  br label %931

; <label>:1104:                                   ; preds = %1098
  br label %1105

; <label>:1105:                                   ; preds = %1104
  %1106 = load i32, i32* %14, align 4
  %1107 = sub nsw i32 %1106, 1
  store i32 %1107, i32* %14, align 4
  %1108 = load i32, i32* %13, align 4
  %1109 = lshr i32 %1108, 1
  store i32 %1109, i32* %13, align 4
  br label %1110

; <label>:1110:                                   ; preds = %1105
  %pgocount78 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 81)
  %1111 = add i64 %pgocount78, 1
  store i64 %1111, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 81)
  br label %1112

; <label>:1112:                                   ; preds = %1110, %1059
  br label %1113

; <label>:1113:                                   ; preds = %1112
  %1114 = load i32, i32* %15, align 4
  %1115 = add nsw i32 %1114, 0
  %1116 = load i32*, i32** %18, align 8
  %1117 = getelementptr inbounds i32, i32* %1116, i32 1
  store i32* %1117, i32** %18, align 8
  store i32 %1115, i32* %1116, align 4
  %1118 = load i32, i32* %11, align 4
  %1119 = add nsw i32 %1118, 0
  store i32 %1119, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1120

; <label>:1120:                                   ; preds = %1113
  %pgocount79 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 68)
  %1121 = add i64 %pgocount79, 1
  store i64 %1121, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 68)
  br label %1122

; <label>:1122:                                   ; preds = %1120, %1056
  %pgocount80 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 55)
  %1123 = add i64 %pgocount80, 1
  store i64 %1123, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 55)
  br label %1124

; <label>:1124:                                   ; preds = %1122, %937, %934, %931, %927, %872
  br label %1125

; <label>:1125:                                   ; preds = %1124
  %1126 = load i32, i32* %15, align 4
  %1127 = icmp ne i32 %1126, 0
  br i1 %1127, label %1128, label %1138

; <label>:1128:                                   ; preds = %1125
  br label %1129

; <label>:1129:                                   ; preds = %1128
  %1130 = load i32, i32* %15, align 4
  %1131 = add nsw i32 %1130, 0
  %1132 = load i32*, i32** %18, align 8
  %1133 = getelementptr inbounds i32, i32* %1132, i32 1
  store i32* %1133, i32** %18, align 8
  store i32 %1131, i32* %1132, align 4
  %1134 = load i32, i32* %11, align 4
  %1135 = add nsw i32 %1134, 0
  store i32 %1135, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1136

; <label>:1136:                                   ; preds = %1129
  %pgocount81 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 44)
  %1137 = add i64 %pgocount81, 1
  store i64 %1137, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 44)
  br label %1138

; <label>:1138:                                   ; preds = %1136, %1125
  %1139 = load i32, i32* %11, align 4
  %1140 = load i32, i32* %12, align 4
  %1141 = icmp ne i32 %1139, %1140
  br i1 %1141, label %1142, label %1235

; <label>:1142:                                   ; preds = %1138
  %1143 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1144 = load i32, i32* %11, align 4
  %1145 = load i32, i32* %12, align 4
  call void @Fax3BadLength(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @Fax4Decode.module, i32 0, i32 0), %struct.tiff* %1143, i32 %1144, i32 %1145)
  br label %1146

; <label>:1146:                                   ; preds = %1157, %1142
  %1147 = load i32, i32* %11, align 4
  %1148 = load i32, i32* %12, align 4
  %1149 = icmp sgt i32 %1147, %1148
  br i1 %1149, label %1150, label %1155

; <label>:1150:                                   ; preds = %1146
  %pgocount82 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 15)
  %1151 = add i64 %pgocount82, 1
  store i64 %1151, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 15)
  %1152 = load i32*, i32** %18, align 8
  %1153 = load i32*, i32** %19, align 8
  %1154 = icmp ugt i32* %1152, %1153
  br label %1155

; <label>:1155:                                   ; preds = %1150, %1146
  %1156 = phi i1 [ false, %1146 ], [ %1154, %1150 ]
  br i1 %1156, label %1157, label %1164

; <label>:1157:                                   ; preds = %1155
  %pgocount83 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 8)
  %1158 = add i64 %pgocount83, 1
  store i64 %1158, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 8)
  %1159 = load i32*, i32** %18, align 8
  %1160 = getelementptr inbounds i32, i32* %1159, i32 -1
  store i32* %1160, i32** %18, align 8
  %1161 = load i32, i32* %1160, align 4
  %1162 = load i32, i32* %11, align 4
  %1163 = sub i32 %1162, %1161
  store i32 %1163, i32* %11, align 4
  br label %1146

; <label>:1164:                                   ; preds = %1155
  %1165 = load i32, i32* %11, align 4
  %1166 = load i32, i32* %12, align 4
  %1167 = icmp slt i32 %1165, %1166
  br i1 %1167, label %1168, label %1208

; <label>:1168:                                   ; preds = %1164
  %1169 = load i32, i32* %11, align 4
  %1170 = icmp slt i32 %1169, 0
  br i1 %1170, label %1171, label %1173

; <label>:1171:                                   ; preds = %1168
  %pgocount84 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 61)
  %1172 = add i64 %pgocount84, 1
  store i64 %1172, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 61)
  store i32 0, i32* %11, align 4
  br label %1173

; <label>:1173:                                   ; preds = %1171, %1168
  %1174 = load i32*, i32** %18, align 8
  %1175 = load i32*, i32** %19, align 8
  %1176 = ptrtoint i32* %1174 to i64
  %1177 = ptrtoint i32* %1175 to i64
  %1178 = sub i64 %1176, %1177
  %1179 = sdiv exact i64 %1178, 4
  %1180 = and i64 %1179, 1
  %1181 = icmp ne i64 %1180, 0
  br i1 %1181, label %1182, label %1192

; <label>:1182:                                   ; preds = %1173
  br label %1183

; <label>:1183:                                   ; preds = %1182
  %1184 = load i32, i32* %15, align 4
  %1185 = add nsw i32 %1184, 0
  %1186 = load i32*, i32** %18, align 8
  %1187 = getelementptr inbounds i32, i32* %1186, i32 1
  store i32* %1187, i32** %18, align 8
  store i32 %1185, i32* %1186, align 4
  %1188 = load i32, i32* %11, align 4
  %1189 = add nsw i32 %1188, 0
  store i32 %1189, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1190

; <label>:1190:                                   ; preds = %1183
  %pgocount85 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 56)
  %1191 = add i64 %pgocount85, 1
  store i64 %1191, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 56)
  br label %1192

; <label>:1192:                                   ; preds = %1190, %1173
  br label %1193

; <label>:1193:                                   ; preds = %1192
  %1194 = load i32, i32* %15, align 4
  %1195 = load i32, i32* %12, align 4
  %1196 = load i32, i32* %11, align 4
  %1197 = sub nsw i32 %1195, %1196
  %1198 = add nsw i32 %1194, %1197
  %1199 = load i32*, i32** %18, align 8
  %1200 = getelementptr inbounds i32, i32* %1199, i32 1
  store i32* %1200, i32** %18, align 8
  store i32 %1198, i32* %1199, align 4
  %1201 = load i32, i32* %12, align 4
  %1202 = load i32, i32* %11, align 4
  %1203 = sub nsw i32 %1201, %1202
  %1204 = load i32, i32* %11, align 4
  %1205 = add nsw i32 %1204, %1203
  store i32 %1205, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1206

; <label>:1206:                                   ; preds = %1193
  %pgocount86 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 50)
  %1207 = add i64 %pgocount86, 1
  store i64 %1207, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 50)
  br label %1234

; <label>:1208:                                   ; preds = %1164
  %1209 = load i32, i32* %11, align 4
  %1210 = load i32, i32* %12, align 4
  %1211 = icmp sgt i32 %1209, %1210
  br i1 %1211, label %1212, label %1232

; <label>:1212:                                   ; preds = %1208
  br label %1213

; <label>:1213:                                   ; preds = %1212
  %1214 = load i32, i32* %15, align 4
  %1215 = load i32, i32* %12, align 4
  %1216 = add nsw i32 %1214, %1215
  %1217 = load i32*, i32** %18, align 8
  %1218 = getelementptr inbounds i32, i32* %1217, i32 1
  store i32* %1218, i32** %18, align 8
  store i32 %1216, i32* %1217, align 4
  %1219 = load i32, i32* %12, align 4
  %1220 = load i32, i32* %11, align 4
  %1221 = add nsw i32 %1220, %1219
  store i32 %1221, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1222

; <label>:1222:                                   ; preds = %1213
  br label %1223

; <label>:1223:                                   ; preds = %1222
  %1224 = load i32, i32* %15, align 4
  %1225 = add nsw i32 %1224, 0
  %1226 = load i32*, i32** %18, align 8
  %1227 = getelementptr inbounds i32, i32* %1226, i32 1
  store i32* %1227, i32** %18, align 8
  store i32 %1225, i32* %1226, align 4
  %1228 = load i32, i32* %11, align 4
  %1229 = add nsw i32 %1228, 0
  store i32 %1229, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1230

; <label>:1230:                                   ; preds = %1223
  %pgocount87 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 57)
  %1231 = add i64 %pgocount87, 1
  store i64 %1231, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 57)
  br label %1232

; <label>:1232:                                   ; preds = %1230, %1208
  %pgocount88 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 51)
  %1233 = add i64 %pgocount88, 1
  store i64 %1233, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 51)
  br label %1234

; <label>:1234:                                   ; preds = %1232, %1206
  br label %1235

; <label>:1235:                                   ; preds = %1234, %1138
  br label %1236

; <label>:1236:                                   ; preds = %1235
  br label %1237

; <label>:1237:                                   ; preds = %1236
  %1238 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1239 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1238, i32 0, i32 5
  %1240 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %1239, align 8
  %1241 = load i8*, i8** %7, align 8
  %1242 = load i32*, i32** %19, align 8
  %1243 = load i32*, i32** %18, align 8
  %1244 = load i32, i32* %12, align 4
  %1245 = ptrtoint void (i8*, i32*, i32*, i32)* %1240 to i64
  call void @__llvm_profile_instrument_target(i64 %1245, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax4Decode to i8*), i32 0)
  call void %1240(i8* %1241, i32* %1242, i32* %1243, i32 %1244)
  br label %1246

; <label>:1246:                                   ; preds = %1237
  %1247 = load i32, i32* %15, align 4
  %1248 = add nsw i32 %1247, 0
  %1249 = load i32*, i32** %18, align 8
  %1250 = getelementptr inbounds i32, i32* %1249, i32 1
  store i32* %1250, i32** %18, align 8
  store i32 %1248, i32* %1249, align 4
  %1251 = load i32, i32* %11, align 4
  %1252 = add nsw i32 %1251, 0
  store i32 %1252, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1253

; <label>:1253:                                   ; preds = %1246
  %1254 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1255 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1254, i32 0, i32 8
  %1256 = load i32*, i32** %1255, align 8
  store i32* %1256, i32** %25, align 8
  %1257 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1258 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1257, i32 0, i32 7
  %1259 = load i32*, i32** %1258, align 8
  %1260 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1261 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1260, i32 0, i32 8
  store i32* %1259, i32** %1261, align 8
  %1262 = load i32*, i32** %25, align 8
  %1263 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1264 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1263, i32 0, i32 7
  store i32* %1262, i32** %1264, align 8
  %1265 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1266 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1265, i32 0, i32 0
  %1267 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %1266, i32 0, i32 1
  %1268 = load i32, i32* %1267, align 4
  %1269 = load i8*, i8** %7, align 8
  %1270 = zext i32 %1268 to i64
  %1271 = getelementptr inbounds i8, i8* %1269, i64 %1270
  store i8* %1271, i8** %7, align 8
  %1272 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1273 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1272, i32 0, i32 0
  %1274 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %1273, i32 0, i32 1
  %1275 = load i32, i32* %1274, align 4
  %1276 = load i32, i32* %8, align 4
  %1277 = sub i32 %1276, %1275
  store i32 %1277, i32* %8, align 4
  %1278 = load i32, i32* %8, align 4
  %1279 = icmp ne i32 %1278, 0
  br i1 %1279, label %1280, label %1286

; <label>:1280:                                   ; preds = %1253
  %pgocount89 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 45)
  %1281 = add i64 %pgocount89, 1
  store i64 %1281, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 45)
  %1282 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1283 = getelementptr inbounds %struct.tiff, %struct.tiff* %1282, i32 0, i32 11
  %1284 = load i32, i32* %1283, align 8
  %1285 = add i32 %1284, 1
  store i32 %1285, i32* %1283, align 8
  br label %1286

; <label>:1286:                                   ; preds = %1280, %1253
  br label %59

; <label>:1287:                                   ; preds = %1054
  %1288 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1289 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1288, i32 0, i32 5
  %1290 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %1289, align 8
  %1291 = load i8*, i8** %7, align 8
  %1292 = load i32*, i32** %19, align 8
  %1293 = load i32*, i32** %18, align 8
  %1294 = load i32, i32* %12, align 4
  %1295 = ptrtoint void (i8*, i32*, i32*, i32)* %1290 to i64
  call void @__llvm_profile_instrument_target(i64 %1295, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax4Decode to i8*), i32 1)
  call void %1290(i8* %1291, i32* %1292, i32* %1293, i32 %1294)
  br label %1296

; <label>:1296:                                   ; preds = %1287
  %1297 = load i32, i32* %14, align 4
  %1298 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1299 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1298, i32 0, i32 3
  store i32 %1297, i32* %1299, align 4
  %1300 = load i32, i32* %13, align 4
  %1301 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1302 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1301, i32 0, i32 2
  store i32 %1300, i32* %1302, align 8
  %1303 = load i32, i32* %20, align 4
  %1304 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1305 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1304, i32 0, i32 4
  store i32 %1303, i32* %1305, align 8
  %1306 = load i8*, i8** %16, align 8
  %1307 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1308 = getelementptr inbounds %struct.tiff, %struct.tiff* %1307, i32 0, i32 42
  %1309 = load i8*, i8** %1308, align 8
  %1310 = ptrtoint i8* %1306 to i64
  %1311 = ptrtoint i8* %1309 to i64
  %1312 = sub i64 %1310, %1311
  %1313 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1314 = getelementptr inbounds %struct.tiff, %struct.tiff* %1313, i32 0, i32 43
  %1315 = load i32, i32* %1314, align 8
  %1316 = sext i32 %1315 to i64
  %1317 = sub nsw i64 %1316, %1312
  %1318 = trunc i64 %1317 to i32
  store i32 %1318, i32* %1314, align 8
  %1319 = load i8*, i8** %16, align 8
  %1320 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1321 = getelementptr inbounds %struct.tiff, %struct.tiff* %1320, i32 0, i32 42
  store i8* %1319, i8** %1321, align 8
  br label %1322

; <label>:1322:                                   ; preds = %1296
  store i32 -1, i32* %5, align 4
  br label %1352

; <label>:1323:                                   ; preds = %59
  br label %1324

; <label>:1324:                                   ; preds = %1323
  %1325 = load i32, i32* %14, align 4
  %1326 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1327 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1326, i32 0, i32 3
  store i32 %1325, i32* %1327, align 4
  %1328 = load i32, i32* %13, align 4
  %1329 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1330 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1329, i32 0, i32 2
  store i32 %1328, i32* %1330, align 8
  %1331 = load i32, i32* %20, align 4
  %1332 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1333 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1332, i32 0, i32 4
  store i32 %1331, i32* %1333, align 8
  %1334 = load i8*, i8** %16, align 8
  %1335 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1336 = getelementptr inbounds %struct.tiff, %struct.tiff* %1335, i32 0, i32 42
  %1337 = load i8*, i8** %1336, align 8
  %1338 = ptrtoint i8* %1334 to i64
  %1339 = ptrtoint i8* %1337 to i64
  %1340 = sub i64 %1338, %1339
  %1341 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1342 = getelementptr inbounds %struct.tiff, %struct.tiff* %1341, i32 0, i32 43
  %1343 = load i32, i32* %1342, align 8
  %1344 = sext i32 %1343 to i64
  %1345 = sub nsw i64 %1344, %1340
  %1346 = trunc i64 %1345 to i32
  store i32 %1346, i32* %1342, align 8
  %1347 = load i8*, i8** %16, align 8
  %1348 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1349 = getelementptr inbounds %struct.tiff, %struct.tiff* %1348, i32 0, i32 42
  store i8* %1347, i8** %1349, align 8
  br label %1350

; <label>:1350:                                   ; preds = %1324
  %pgocount90 = load i64, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 77)
  %1351 = add i64 %pgocount90, 1
  store i64 %1351, i64* getelementptr inbounds ([88 x i64], [88 x i64]* @__profc_tmp1.ll_Fax4Decode, i64 0, i64 77)
  store i32 1, i32* %5, align 4
  br label %1352

; <label>:1352:                                   ; preds = %1350, %1322
  %1353 = load i32, i32* %5, align 4
  ret i32 %1353
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax4Encode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca %struct.Fax3EncodeState*, align 8
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %11 = load %struct.tiff*, %struct.tiff** %6, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 37
  %13 = load i8*, i8** %12, align 8
  %14 = bitcast i8* %13 to %struct.Fax3BaseState*
  %15 = bitcast %struct.Fax3BaseState* %14 to %struct.Fax3EncodeState*
  store %struct.Fax3EncodeState* %15, %struct.Fax3EncodeState** %10, align 8
  %16 = load i16, i16* %9, align 2
  br label %17

; <label>:17:                                     ; preds = %65, %4
  %18 = load i32, i32* %8, align 4
  %19 = sext i32 %18 to i64
  %20 = icmp sgt i64 %19, 0
  br i1 %20, label %21, label %67

; <label>:21:                                     ; preds = %17
  %22 = load %struct.tiff*, %struct.tiff** %6, align 8
  %23 = load i8*, i8** %7, align 8
  %24 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %25 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %24, i32 0, i32 4
  %26 = load i8*, i8** %25, align 8
  %27 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %28 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %27, i32 0, i32 0
  %29 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %28, i32 0, i32 2
  %30 = load i32, i32* %29, align 8
  %31 = call i32 @Fax3Encode2DRow(%struct.tiff* %22, i8* %23, i8* %26, i32 %30)
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %35, label %33

; <label>:33:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Fax4Encode, i64 0, i64 3)
  %34 = add i64 %pgocount, 1
  store i64 %34, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Fax4Encode, i64 0, i64 3)
  store i32 0, i32* %5, align 4
  br label %69

; <label>:35:                                     ; preds = %21
  %36 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %37 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %36, i32 0, i32 4
  %38 = load i8*, i8** %37, align 8
  %39 = load i8*, i8** %7, align 8
  %40 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %41 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %40, i32 0, i32 0
  %42 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %41, i32 0, i32 1
  %43 = load i32, i32* %42, align 4
  call void @_TIFFmemcpy(i8* %38, i8* %39, i32 %43)
  %44 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %45 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %44, i32 0, i32 0
  %46 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %45, i32 0, i32 1
  %47 = load i32, i32* %46, align 4
  %48 = load i8*, i8** %7, align 8
  %49 = zext i32 %47 to i64
  %50 = getelementptr inbounds i8, i8* %48, i64 %49
  store i8* %50, i8** %7, align 8
  %51 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %52 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %51, i32 0, i32 0
  %53 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %52, i32 0, i32 1
  %54 = load i32, i32* %53, align 4
  %55 = load i32, i32* %8, align 4
  %56 = sub i32 %55, %54
  store i32 %56, i32* %8, align 4
  %57 = load i32, i32* %8, align 4
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %65

; <label>:59:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Fax4Encode, i64 0, i64 1)
  %60 = add i64 %pgocount1, 1
  store i64 %60, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Fax4Encode, i64 0, i64 1)
  %61 = load %struct.tiff*, %struct.tiff** %6, align 8
  %62 = getelementptr inbounds %struct.tiff, %struct.tiff* %61, i32 0, i32 11
  %63 = load i32, i32* %62, align 8
  %64 = add i32 %63, 1
  store i32 %64, i32* %62, align 8
  br label %65

; <label>:65:                                     ; preds = %59, %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Fax4Encode, i64 0, i64 0)
  %66 = add i64 %pgocount2, 1
  store i64 %66, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Fax4Encode, i64 0, i64 0)
  br label %17

; <label>:67:                                     ; preds = %17
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Fax4Encode, i64 0, i64 2)
  %68 = add i64 %pgocount3, 1
  store i64 %68, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_Fax4Encode, i64 0, i64 2)
  store i32 1, i32* %5, align 4
  br label %69

; <label>:69:                                     ; preds = %67, %33
  %70 = load i32, i32* %5, align 4
  ret i32 %70
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax4PostEncode(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  %3 = alloca %struct.Fax3EncodeState*, align 8
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %4 = load %struct.tiff*, %struct.tiff** %2, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 37
  %6 = load i8*, i8** %5, align 8
  %7 = bitcast i8* %6 to %struct.Fax3BaseState*
  %8 = bitcast %struct.Fax3BaseState* %7 to %struct.Fax3EncodeState*
  store %struct.Fax3EncodeState* %8, %struct.Fax3EncodeState** %3, align 8
  %9 = load %struct.tiff*, %struct.tiff** %2, align 8
  call void @Fax3PutBits(%struct.tiff* %9, i32 1, i32 12)
  %10 = load %struct.tiff*, %struct.tiff** %2, align 8
  call void @Fax3PutBits(%struct.tiff* %10, i32 1, i32 12)
  %11 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %12 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %11, i32 0, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = icmp ne i32 %13, 8
  br i1 %14, label %15, label %45

; <label>:15:                                     ; preds = %1
  %16 = load %struct.tiff*, %struct.tiff** %2, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 43
  %18 = load i32, i32* %17, align 8
  %19 = load %struct.tiff*, %struct.tiff** %2, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %19, i32 0, i32 41
  %21 = load i32, i32* %20, align 8
  %22 = icmp sge i32 %18, %21
  br i1 %22, label %23, label %27

; <label>:23:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax4PostEncode, i64 0, i64 2)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax4PostEncode, i64 0, i64 2)
  %25 = load %struct.tiff*, %struct.tiff** %2, align 8
  %26 = call i32 @TIFFFlushData1(%struct.tiff* %25)
  br label %27

; <label>:27:                                     ; preds = %23, %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax4PostEncode, i64 0, i64 1)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax4PostEncode, i64 0, i64 1)
  %29 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %30 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %29, i32 0, i32 1
  %31 = load i32, i32* %30, align 8
  %32 = trunc i32 %31 to i8
  %33 = load %struct.tiff*, %struct.tiff** %2, align 8
  %34 = getelementptr inbounds %struct.tiff, %struct.tiff* %33, i32 0, i32 42
  %35 = load i8*, i8** %34, align 8
  %36 = getelementptr inbounds i8, i8* %35, i32 1
  store i8* %36, i8** %34, align 8
  store i8 %32, i8* %35, align 1
  %37 = load %struct.tiff*, %struct.tiff** %2, align 8
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %37, i32 0, i32 43
  %39 = load i32, i32* %38, align 8
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %38, align 8
  %41 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %42 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %41, i32 0, i32 1
  store i32 0, i32* %42, align 8
  %43 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %44 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %43, i32 0, i32 2
  store i32 8, i32* %44, align 4
  br label %45

; <label>:45:                                     ; preds = %27, %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax4PostEncode, i64 0, i64 0)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax4PostEncode, i64 0, i64 0)
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFInitCCITTRLE(%struct.tiff*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load %struct.tiff*, %struct.tiff** %4, align 8
  %7 = call i32 @InitCCITTFax3(%struct.tiff* %6)
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %19

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTRLE, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTRLE, i64 0, i64 0)
  %11 = load %struct.tiff*, %struct.tiff** %4, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3DecodeRLE, i32 (%struct.tiff*, i8*, i32, i16)** %12, align 8
  %13 = load %struct.tiff*, %struct.tiff** %4, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %13, i32 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3DecodeRLE, i32 (%struct.tiff*, i8*, i32, i16)** %14, align 8
  %15 = load %struct.tiff*, %struct.tiff** %4, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %15, i32 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3DecodeRLE, i32 (%struct.tiff*, i8*, i32, i16)** %16, align 8
  %17 = load %struct.tiff*, %struct.tiff** %4, align 8
  %18 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %17, i32 65536, i32 7)
  store i32 %18, i32* %3, align 4
  br label %21

; <label>:19:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTRLE, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTRLE, i64 0, i64 1)
  store i32 0, i32* %3, align 4
  br label %21

; <label>:21:                                     ; preds = %19, %9
  %22 = load i32, i32* %3, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3DecodeRLE(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca %struct.Fax3DecodeState*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i32*, align 8
  %19 = alloca i32*, align 8
  %20 = alloca i32, align 4
  %21 = alloca i8*, align 8
  %22 = alloca %struct.TIFFFaxTabEnt*, align 8
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %26 = load %struct.tiff*, %struct.tiff** %6, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %26, i32 0, i32 37
  %28 = load i8*, i8** %27, align 8
  %29 = bitcast i8* %28 to %struct.Fax3BaseState*
  %30 = bitcast %struct.Fax3BaseState* %29 to %struct.Fax3DecodeState*
  store %struct.Fax3DecodeState* %30, %struct.Fax3DecodeState** %10, align 8
  %31 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %32 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %31, i32 0, i32 0
  %33 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %32, i32 0, i32 2
  %34 = load i32, i32* %33, align 8
  store i32 %34, i32* %12, align 4
  %35 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %36 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %35, i32 0, i32 1
  %37 = load i8*, i8** %36, align 8
  store i8* %37, i8** %21, align 8
  %38 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %39 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %38, i32 0, i32 0
  %40 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %39, i32 0, i32 0
  %41 = load i32, i32* %40, align 8
  store i32 %41, i32* %23, align 4
  %42 = load i16, i16* %9, align 2
  br label %43

; <label>:43:                                     ; preds = %4
  %44 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %45 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %44, i32 0, i32 2
  %46 = load i32, i32* %45, align 8
  store i32 %46, i32* %13, align 4
  %47 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %48 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %47, i32 0, i32 3
  %49 = load i32, i32* %48, align 4
  store i32 %49, i32* %14, align 4
  %50 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %51 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %50, i32 0, i32 4
  %52 = load i32, i32* %51, align 8
  store i32 %52, i32* %20, align 4
  %53 = load %struct.tiff*, %struct.tiff** %6, align 8
  %54 = getelementptr inbounds %struct.tiff, %struct.tiff* %53, i32 0, i32 42
  %55 = load i8*, i8** %54, align 8
  store i8* %55, i8** %16, align 8
  %56 = load i8*, i8** %16, align 8
  %57 = load %struct.tiff*, %struct.tiff** %6, align 8
  %58 = getelementptr inbounds %struct.tiff, %struct.tiff* %57, i32 0, i32 43
  %59 = load i32, i32* %58, align 8
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8* %56, i64 %60
  store i8* %61, i8** %17, align 8
  br label %62

; <label>:62:                                     ; preds = %43
  %63 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %64 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %63, i32 0, i32 8
  %65 = load i32*, i32** %64, align 8
  store i32* %65, i32** %19, align 8
  br label %66

; <label>:66:                                     ; preds = %633, %62
  %67 = load i32, i32* %8, align 4
  %68 = sext i32 %67 to i64
  %69 = icmp sgt i64 %68, 0
  br i1 %69, label %70, label %670

; <label>:70:                                     ; preds = %66
  store i32 0, i32* %11, align 4
  store i32 0, i32* %15, align 4
  %71 = load i32*, i32** %19, align 8
  store i32* %71, i32** %18, align 8
  br label %72

; <label>:72:                                     ; preds = %70
  br label %73

; <label>:73:                                     ; preds = %323, %72
  br label %74

; <label>:74:                                     ; preds = %190, %73
  br label %75

; <label>:75:                                     ; preds = %74
  br label %76

; <label>:76:                                     ; preds = %75
  %77 = load i32, i32* %14, align 4
  %78 = icmp slt i32 %77, 12
  br i1 %78, label %79, label %132

; <label>:79:                                     ; preds = %76
  %80 = load i8*, i8** %16, align 8
  %81 = load i8*, i8** %17, align 8
  %82 = icmp uge i8* %80, %81
  br i1 %82, label %83, label %90

; <label>:83:                                     ; preds = %79
  %84 = load i32, i32* %14, align 4
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %86, label %88

; <label>:86:                                     ; preds = %83
  %pgocount = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 21)
  %87 = add i64 %pgocount, 1
  store i64 %87, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 21)
  br label %325

; <label>:88:                                     ; preds = %83
  %pgocount2 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 6)
  %89 = add i64 %pgocount2, 1
  store i64 %89, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 6)
  store i32 12, i32* %14, align 4
  br label %131

; <label>:90:                                     ; preds = %79
  %91 = load i8*, i8** %21, align 8
  %92 = load i8*, i8** %16, align 8
  %93 = getelementptr inbounds i8, i8* %92, i32 1
  store i8* %93, i8** %16, align 8
  %94 = load i8, i8* %92, align 1
  %95 = zext i8 %94 to i64
  %96 = getelementptr inbounds i8, i8* %91, i64 %95
  %97 = load i8, i8* %96, align 1
  %98 = zext i8 %97 to i32
  %99 = load i32, i32* %14, align 4
  %100 = shl i32 %98, %99
  %101 = load i32, i32* %13, align 4
  %102 = or i32 %101, %100
  store i32 %102, i32* %13, align 4
  %103 = load i32, i32* %14, align 4
  %104 = add nsw i32 %103, 8
  store i32 %104, i32* %14, align 4
  %105 = icmp slt i32 %104, 12
  br i1 %105, label %106, label %129

; <label>:106:                                    ; preds = %90
  %107 = load i8*, i8** %16, align 8
  %108 = load i8*, i8** %17, align 8
  %109 = icmp uge i8* %107, %108
  br i1 %109, label %110, label %112

; <label>:110:                                    ; preds = %106
  %pgocount3 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 11)
  %111 = add i64 %pgocount3, 1
  store i64 %111, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 11)
  store i32 12, i32* %14, align 4
  br label %128

; <label>:112:                                    ; preds = %106
  %pgocount4 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 12)
  %113 = add i64 %pgocount4, 1
  store i64 %113, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 12)
  %114 = load i8*, i8** %21, align 8
  %115 = load i8*, i8** %16, align 8
  %116 = getelementptr inbounds i8, i8* %115, i32 1
  store i8* %116, i8** %16, align 8
  %117 = load i8, i8* %115, align 1
  %118 = zext i8 %117 to i64
  %119 = getelementptr inbounds i8, i8* %114, i64 %118
  %120 = load i8, i8* %119, align 1
  %121 = zext i8 %120 to i32
  %122 = load i32, i32* %14, align 4
  %123 = shl i32 %121, %122
  %124 = load i32, i32* %13, align 4
  %125 = or i32 %124, %123
  store i32 %125, i32* %13, align 4
  %126 = load i32, i32* %14, align 4
  %127 = add nsw i32 %126, 8
  store i32 %127, i32* %14, align 4
  br label %128

; <label>:128:                                    ; preds = %112, %110
  br label %129

; <label>:129:                                    ; preds = %128, %90
  %pgocount5 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 4)
  %130 = add i64 %pgocount5, 1
  store i64 %130, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 4)
  br label %131

; <label>:131:                                    ; preds = %129, %88
  br label %132

; <label>:132:                                    ; preds = %131, %76
  br label %133

; <label>:133:                                    ; preds = %132
  %134 = load i32, i32* %13, align 4
  %135 = and i32 %134, 4095
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* getelementptr inbounds ([0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i32 0, i32 0), i64 %136
  store %struct.TIFFFaxTabEnt* %137, %struct.TIFFFaxTabEnt** %22, align 8
  br label %138

; <label>:138:                                    ; preds = %133
  %139 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %140 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %139, i32 0, i32 1
  %141 = load i8, i8* %140, align 1
  %142 = zext i8 %141 to i32
  %143 = load i32, i32* %14, align 4
  %144 = sub nsw i32 %143, %142
  store i32 %144, i32* %14, align 4
  %145 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %146 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %145, i32 0, i32 1
  %147 = load i8, i8* %146, align 1
  %148 = zext i8 %147 to i32
  %149 = load i32, i32* %13, align 4
  %150 = lshr i32 %149, %148
  store i32 %150, i32* %13, align 4
  br label %151

; <label>:151:                                    ; preds = %138
  br label %152

; <label>:152:                                    ; preds = %151
  %153 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %154 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %153, i32 0, i32 0
  %155 = load i8, i8* %154, align 4
  %156 = zext i8 %155 to i32
  switch i32 %156, label %186 [
    i32 12, label %158
    i32 7, label %160
    i32 9, label %._crit_edge
    i32 11, label %175
  ]

._crit_edge:                                      ; preds = %152
  %pgocount6 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 0)
  %157 = add i64 %pgocount6, 1
  store i64 %157, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 0)
  br label %175

; <label>:158:                                    ; preds = %152
  %pgocount7 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 19)
  %159 = add i64 %pgocount7, 1
  store i64 %159, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 19)
  store i32 1, i32* %20, align 4
  br label %440

; <label>:160:                                    ; preds = %152
  br label %161

; <label>:161:                                    ; preds = %160
  %162 = load i32, i32* %15, align 4
  %163 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %164 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %163, i32 0, i32 2
  %165 = load i32, i32* %164, align 4
  %166 = add i32 %162, %165
  %167 = load i32*, i32** %18, align 8
  %168 = getelementptr inbounds i32, i32* %167, i32 1
  store i32* %168, i32** %18, align 8
  store i32 %166, i32* %167, align 4
  %169 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %170 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %169, i32 0, i32 2
  %171 = load i32, i32* %170, align 4
  %172 = load i32, i32* %11, align 4
  %173 = add i32 %172, %171
  store i32 %173, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %174

; <label>:174:                                    ; preds = %161
  br label %192

; <label>:175:                                    ; preds = %._crit_edge, %152
  %176 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %177 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %176, i32 0, i32 2
  %178 = load i32, i32* %177, align 4
  %179 = load i32, i32* %11, align 4
  %180 = add i32 %179, %178
  store i32 %180, i32* %11, align 4
  %181 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %182 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %181, i32 0, i32 2
  %183 = load i32, i32* %182, align 4
  %184 = load i32, i32* %15, align 4
  %185 = add i32 %184, %183
  store i32 %185, i32* %15, align 4
  br label %190

; <label>:186:                                    ; preds = %152
  %pgocount8 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 20)
  %187 = add i64 %pgocount8, 1
  store i64 %187, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 20)
  %188 = load %struct.tiff*, %struct.tiff** %6, align 8
  %189 = load i32, i32* %11, align 4
  call void @Fax3Unexpected(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @Fax3DecodeRLE.module, i32 0, i32 0), %struct.tiff* %188, i32 %189)
  br label %440

; <label>:190:                                    ; preds = %175
  %pgocount9 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 2)
  %191 = add i64 %pgocount9, 1
  store i64 %191, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 2)
  br label %74

; <label>:192:                                    ; preds = %174
  %193 = load i32, i32* %11, align 4
  %194 = load i32, i32* %12, align 4
  %195 = icmp sge i32 %193, %194
  br i1 %195, label %196, label %198

; <label>:196:                                    ; preds = %192
  %pgocount10 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 41)
  %197 = add i64 %pgocount10, 1
  store i64 %197, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 41)
  br label %440

; <label>:198:                                    ; preds = %192
  br label %199

; <label>:199:                                    ; preds = %315, %198
  br label %200

; <label>:200:                                    ; preds = %199
  br label %201

; <label>:201:                                    ; preds = %200
  %202 = load i32, i32* %14, align 4
  %203 = icmp slt i32 %202, 13
  br i1 %203, label %204, label %257

; <label>:204:                                    ; preds = %201
  %205 = load i8*, i8** %16, align 8
  %206 = load i8*, i8** %17, align 8
  %207 = icmp uge i8* %205, %206
  br i1 %207, label %208, label %215

; <label>:208:                                    ; preds = %204
  %209 = load i32, i32* %14, align 4
  %210 = icmp eq i32 %209, 0
  br i1 %210, label %211, label %213

; <label>:211:                                    ; preds = %208
  %pgocount11 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 35)
  %212 = add i64 %pgocount11, 1
  store i64 %212, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 35)
  br label %325

; <label>:213:                                    ; preds = %208
  %pgocount12 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 13)
  %214 = add i64 %pgocount12, 1
  store i64 %214, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 13)
  store i32 13, i32* %14, align 4
  br label %256

; <label>:215:                                    ; preds = %204
  %216 = load i8*, i8** %21, align 8
  %217 = load i8*, i8** %16, align 8
  %218 = getelementptr inbounds i8, i8* %217, i32 1
  store i8* %218, i8** %16, align 8
  %219 = load i8, i8* %217, align 1
  %220 = zext i8 %219 to i64
  %221 = getelementptr inbounds i8, i8* %216, i64 %220
  %222 = load i8, i8* %221, align 1
  %223 = zext i8 %222 to i32
  %224 = load i32, i32* %14, align 4
  %225 = shl i32 %223, %224
  %226 = load i32, i32* %13, align 4
  %227 = or i32 %226, %225
  store i32 %227, i32* %13, align 4
  %228 = load i32, i32* %14, align 4
  %229 = add nsw i32 %228, 8
  store i32 %229, i32* %14, align 4
  %230 = icmp slt i32 %229, 13
  br i1 %230, label %231, label %254

; <label>:231:                                    ; preds = %215
  %232 = load i8*, i8** %16, align 8
  %233 = load i8*, i8** %17, align 8
  %234 = icmp uge i8* %232, %233
  br i1 %234, label %235, label %237

; <label>:235:                                    ; preds = %231
  %pgocount13 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 16)
  %236 = add i64 %pgocount13, 1
  store i64 %236, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 16)
  store i32 13, i32* %14, align 4
  br label %253

; <label>:237:                                    ; preds = %231
  %pgocount14 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 17)
  %238 = add i64 %pgocount14, 1
  store i64 %238, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 17)
  %239 = load i8*, i8** %21, align 8
  %240 = load i8*, i8** %16, align 8
  %241 = getelementptr inbounds i8, i8* %240, i32 1
  store i8* %241, i8** %16, align 8
  %242 = load i8, i8* %240, align 1
  %243 = zext i8 %242 to i64
  %244 = getelementptr inbounds i8, i8* %239, i64 %243
  %245 = load i8, i8* %244, align 1
  %246 = zext i8 %245 to i32
  %247 = load i32, i32* %14, align 4
  %248 = shl i32 %246, %247
  %249 = load i32, i32* %13, align 4
  %250 = or i32 %249, %248
  store i32 %250, i32* %13, align 4
  %251 = load i32, i32* %14, align 4
  %252 = add nsw i32 %251, 8
  store i32 %252, i32* %14, align 4
  br label %253

; <label>:253:                                    ; preds = %237, %235
  br label %254

; <label>:254:                                    ; preds = %253, %215
  %pgocount15 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 10)
  %255 = add i64 %pgocount15, 1
  store i64 %255, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 10)
  br label %256

; <label>:256:                                    ; preds = %254, %213
  br label %257

; <label>:257:                                    ; preds = %256, %201
  br label %258

; <label>:258:                                    ; preds = %257
  %259 = load i32, i32* %13, align 4
  %260 = and i32 %259, 8191
  %261 = zext i32 %260 to i64
  %262 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* getelementptr inbounds ([0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i32 0, i32 0), i64 %261
  store %struct.TIFFFaxTabEnt* %262, %struct.TIFFFaxTabEnt** %22, align 8
  br label %263

; <label>:263:                                    ; preds = %258
  %264 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %265 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %264, i32 0, i32 1
  %266 = load i8, i8* %265, align 1
  %267 = zext i8 %266 to i32
  %268 = load i32, i32* %14, align 4
  %269 = sub nsw i32 %268, %267
  store i32 %269, i32* %14, align 4
  %270 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %271 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %270, i32 0, i32 1
  %272 = load i8, i8* %271, align 1
  %273 = zext i8 %272 to i32
  %274 = load i32, i32* %13, align 4
  %275 = lshr i32 %274, %273
  store i32 %275, i32* %13, align 4
  br label %276

; <label>:276:                                    ; preds = %263
  br label %277

; <label>:277:                                    ; preds = %276
  %278 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %279 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %278, i32 0, i32 0
  %280 = load i8, i8* %279, align 4
  %281 = zext i8 %280 to i32
  switch i32 %281, label %311 [
    i32 12, label %283
    i32 8, label %285
    i32 10, label %._crit_edge1
    i32 11, label %300
  ]

._crit_edge1:                                     ; preds = %277
  %pgocount16 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 1)
  %282 = add i64 %pgocount16, 1
  store i64 %282, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 1)
  br label %300

; <label>:283:                                    ; preds = %277
  %pgocount17 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 28)
  %284 = add i64 %pgocount17, 1
  store i64 %284, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 28)
  store i32 1, i32* %20, align 4
  br label %440

; <label>:285:                                    ; preds = %277
  br label %286

; <label>:286:                                    ; preds = %285
  %287 = load i32, i32* %15, align 4
  %288 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %289 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %288, i32 0, i32 2
  %290 = load i32, i32* %289, align 4
  %291 = add i32 %287, %290
  %292 = load i32*, i32** %18, align 8
  %293 = getelementptr inbounds i32, i32* %292, i32 1
  store i32* %293, i32** %18, align 8
  store i32 %291, i32* %292, align 4
  %294 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %295 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %294, i32 0, i32 2
  %296 = load i32, i32* %295, align 4
  %297 = load i32, i32* %11, align 4
  %298 = add i32 %297, %296
  store i32 %298, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %299

; <label>:299:                                    ; preds = %286
  br label %317

; <label>:300:                                    ; preds = %._crit_edge1, %277
  %301 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %302 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %301, i32 0, i32 2
  %303 = load i32, i32* %302, align 4
  %304 = load i32, i32* %11, align 4
  %305 = add i32 %304, %303
  store i32 %305, i32* %11, align 4
  %306 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %307 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %306, i32 0, i32 2
  %308 = load i32, i32* %307, align 4
  %309 = load i32, i32* %15, align 4
  %310 = add i32 %309, %308
  store i32 %310, i32* %15, align 4
  br label %315

; <label>:311:                                    ; preds = %277
  %pgocount18 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 29)
  %312 = add i64 %pgocount18, 1
  store i64 %312, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 29)
  %313 = load %struct.tiff*, %struct.tiff** %6, align 8
  %314 = load i32, i32* %11, align 4
  call void @Fax3Unexpected(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @Fax3DecodeRLE.module, i32 0, i32 0), %struct.tiff* %313, i32 %314)
  br label %440

; <label>:315:                                    ; preds = %300
  %pgocount19 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 5)
  %316 = add i64 %pgocount19, 1
  store i64 %316, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 5)
  br label %199

; <label>:317:                                    ; preds = %299
  %318 = load i32, i32* %11, align 4
  %319 = load i32, i32* %12, align 4
  %320 = icmp sge i32 %318, %319
  br i1 %320, label %321, label %323

; <label>:321:                                    ; preds = %317
  %pgocount20 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 42)
  %322 = add i64 %pgocount20, 1
  store i64 %322, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 42)
  br label %440

; <label>:323:                                    ; preds = %317
  %pgocount21 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 30)
  %324 = add i64 %pgocount21, 1
  store i64 %324, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 30)
  br label %73

; <label>:325:                                    ; preds = %211, %86
  %326 = load %struct.tiff*, %struct.tiff** %6, align 8
  %327 = load i32, i32* %11, align 4
  call void @Fax3PrematureEOF(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @Fax3DecodeRLE.module, i32 0, i32 0), %struct.tiff* %326, i32 %327)
  br label %328

; <label>:328:                                    ; preds = %325
  %329 = load i32, i32* %15, align 4
  %330 = icmp ne i32 %329, 0
  br i1 %330, label %331, label %341

; <label>:331:                                    ; preds = %328
  br label %332

; <label>:332:                                    ; preds = %331
  %333 = load i32, i32* %15, align 4
  %334 = add nsw i32 %333, 0
  %335 = load i32*, i32** %18, align 8
  %336 = getelementptr inbounds i32, i32* %335, i32 1
  store i32* %336, i32** %18, align 8
  store i32 %334, i32* %335, align 4
  %337 = load i32, i32* %11, align 4
  %338 = add nsw i32 %337, 0
  store i32 %338, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %339

; <label>:339:                                    ; preds = %332
  %pgocount22 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 25)
  %340 = add i64 %pgocount22, 1
  store i64 %340, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 25)
  br label %341

; <label>:341:                                    ; preds = %339, %328
  %342 = load i32, i32* %11, align 4
  %343 = load i32, i32* %12, align 4
  %344 = icmp ne i32 %342, %343
  br i1 %344, label %345, label %438

; <label>:345:                                    ; preds = %341
  %346 = load %struct.tiff*, %struct.tiff** %6, align 8
  %347 = load i32, i32* %11, align 4
  %348 = load i32, i32* %12, align 4
  call void @Fax3BadLength(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @Fax3DecodeRLE.module, i32 0, i32 0), %struct.tiff* %346, i32 %347, i32 %348)
  br label %349

; <label>:349:                                    ; preds = %360, %345
  %350 = load i32, i32* %11, align 4
  %351 = load i32, i32* %12, align 4
  %352 = icmp sgt i32 %350, %351
  br i1 %352, label %353, label %358

; <label>:353:                                    ; preds = %349
  %pgocount23 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 9)
  %354 = add i64 %pgocount23, 1
  store i64 %354, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 9)
  %355 = load i32*, i32** %18, align 8
  %356 = load i32*, i32** %19, align 8
  %357 = icmp ugt i32* %355, %356
  br label %358

; <label>:358:                                    ; preds = %353, %349
  %359 = phi i1 [ false, %349 ], [ %357, %353 ]
  br i1 %359, label %360, label %367

; <label>:360:                                    ; preds = %358
  %pgocount24 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 8)
  %361 = add i64 %pgocount24, 1
  store i64 %361, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 8)
  %362 = load i32*, i32** %18, align 8
  %363 = getelementptr inbounds i32, i32* %362, i32 -1
  store i32* %363, i32** %18, align 8
  %364 = load i32, i32* %363, align 4
  %365 = load i32, i32* %11, align 4
  %366 = sub i32 %365, %364
  store i32 %366, i32* %11, align 4
  br label %349

; <label>:367:                                    ; preds = %358
  %368 = load i32, i32* %11, align 4
  %369 = load i32, i32* %12, align 4
  %370 = icmp slt i32 %368, %369
  br i1 %370, label %371, label %411

; <label>:371:                                    ; preds = %367
  %372 = load i32, i32* %11, align 4
  %373 = icmp slt i32 %372, 0
  br i1 %373, label %374, label %376

; <label>:374:                                    ; preds = %371
  %pgocount25 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 40)
  %375 = add i64 %pgocount25, 1
  store i64 %375, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 40)
  store i32 0, i32* %11, align 4
  br label %376

; <label>:376:                                    ; preds = %374, %371
  %377 = load i32*, i32** %18, align 8
  %378 = load i32*, i32** %19, align 8
  %379 = ptrtoint i32* %377 to i64
  %380 = ptrtoint i32* %378 to i64
  %381 = sub i64 %379, %380
  %382 = sdiv exact i64 %381, 4
  %383 = and i64 %382, 1
  %384 = icmp ne i64 %383, 0
  br i1 %384, label %385, label %395

; <label>:385:                                    ; preds = %376
  br label %386

; <label>:386:                                    ; preds = %385
  %387 = load i32, i32* %15, align 4
  %388 = add nsw i32 %387, 0
  %389 = load i32*, i32** %18, align 8
  %390 = getelementptr inbounds i32, i32* %389, i32 1
  store i32* %390, i32** %18, align 8
  store i32 %388, i32* %389, align 4
  %391 = load i32, i32* %11, align 4
  %392 = add nsw i32 %391, 0
  store i32 %392, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %393

; <label>:393:                                    ; preds = %386
  %pgocount26 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 37)
  %394 = add i64 %pgocount26, 1
  store i64 %394, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 37)
  br label %395

; <label>:395:                                    ; preds = %393, %376
  br label %396

; <label>:396:                                    ; preds = %395
  %397 = load i32, i32* %15, align 4
  %398 = load i32, i32* %12, align 4
  %399 = load i32, i32* %11, align 4
  %400 = sub nsw i32 %398, %399
  %401 = add nsw i32 %397, %400
  %402 = load i32*, i32** %18, align 8
  %403 = getelementptr inbounds i32, i32* %402, i32 1
  store i32* %403, i32** %18, align 8
  store i32 %401, i32* %402, align 4
  %404 = load i32, i32* %12, align 4
  %405 = load i32, i32* %11, align 4
  %406 = sub nsw i32 %404, %405
  %407 = load i32, i32* %11, align 4
  %408 = add nsw i32 %407, %406
  store i32 %408, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %409

; <label>:409:                                    ; preds = %396
  %pgocount27 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 33)
  %410 = add i64 %pgocount27, 1
  store i64 %410, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 33)
  br label %437

; <label>:411:                                    ; preds = %367
  %412 = load i32, i32* %11, align 4
  %413 = load i32, i32* %12, align 4
  %414 = icmp sgt i32 %412, %413
  br i1 %414, label %415, label %435

; <label>:415:                                    ; preds = %411
  br label %416

; <label>:416:                                    ; preds = %415
  %417 = load i32, i32* %15, align 4
  %418 = load i32, i32* %12, align 4
  %419 = add nsw i32 %417, %418
  %420 = load i32*, i32** %18, align 8
  %421 = getelementptr inbounds i32, i32* %420, i32 1
  store i32* %421, i32** %18, align 8
  store i32 %419, i32* %420, align 4
  %422 = load i32, i32* %12, align 4
  %423 = load i32, i32* %11, align 4
  %424 = add nsw i32 %423, %422
  store i32 %424, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %425

; <label>:425:                                    ; preds = %416
  br label %426

; <label>:426:                                    ; preds = %425
  %427 = load i32, i32* %15, align 4
  %428 = add nsw i32 %427, 0
  %429 = load i32*, i32** %18, align 8
  %430 = getelementptr inbounds i32, i32* %429, i32 1
  store i32* %430, i32** %18, align 8
  store i32 %428, i32* %429, align 4
  %431 = load i32, i32* %11, align 4
  %432 = add nsw i32 %431, 0
  store i32 %432, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %433

; <label>:433:                                    ; preds = %426
  %pgocount28 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 38)
  %434 = add i64 %pgocount28, 1
  store i64 %434, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 38)
  br label %435

; <label>:435:                                    ; preds = %433, %411
  %pgocount29 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 34)
  %436 = add i64 %pgocount29, 1
  store i64 %436, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 34)
  br label %437

; <label>:437:                                    ; preds = %435, %409
  br label %438

; <label>:438:                                    ; preds = %437, %341
  br label %439

; <label>:439:                                    ; preds = %438
  br label %634

; <label>:440:                                    ; preds = %321, %311, %283, %196, %186, %158
  br label %441

; <label>:441:                                    ; preds = %440
  %442 = load i32, i32* %15, align 4
  %443 = icmp ne i32 %442, 0
  br i1 %443, label %444, label %454

; <label>:444:                                    ; preds = %441
  br label %445

; <label>:445:                                    ; preds = %444
  %446 = load i32, i32* %15, align 4
  %447 = add nsw i32 %446, 0
  %448 = load i32*, i32** %18, align 8
  %449 = getelementptr inbounds i32, i32* %448, i32 1
  store i32* %449, i32** %18, align 8
  store i32 %447, i32* %448, align 4
  %450 = load i32, i32* %11, align 4
  %451 = add nsw i32 %450, 0
  store i32 %451, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %452

; <label>:452:                                    ; preds = %445
  %pgocount30 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 14)
  %453 = add i64 %pgocount30, 1
  store i64 %453, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 14)
  br label %454

; <label>:454:                                    ; preds = %452, %441
  %455 = load i32, i32* %11, align 4
  %456 = load i32, i32* %12, align 4
  %457 = icmp ne i32 %455, %456
  br i1 %457, label %458, label %551

; <label>:458:                                    ; preds = %454
  %459 = load %struct.tiff*, %struct.tiff** %6, align 8
  %460 = load i32, i32* %11, align 4
  %461 = load i32, i32* %12, align 4
  call void @Fax3BadLength(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @Fax3DecodeRLE.module, i32 0, i32 0), %struct.tiff* %459, i32 %460, i32 %461)
  br label %462

; <label>:462:                                    ; preds = %473, %458
  %463 = load i32, i32* %11, align 4
  %464 = load i32, i32* %12, align 4
  %465 = icmp sgt i32 %463, %464
  br i1 %465, label %466, label %471

; <label>:466:                                    ; preds = %462
  %pgocount31 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 7)
  %467 = add i64 %pgocount31, 1
  store i64 %467, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 7)
  %468 = load i32*, i32** %18, align 8
  %469 = load i32*, i32** %19, align 8
  %470 = icmp ugt i32* %468, %469
  br label %471

; <label>:471:                                    ; preds = %466, %462
  %472 = phi i1 [ false, %462 ], [ %470, %466 ]
  br i1 %472, label %473, label %480

; <label>:473:                                    ; preds = %471
  %pgocount32 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 3)
  %474 = add i64 %pgocount32, 1
  store i64 %474, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 3)
  %475 = load i32*, i32** %18, align 8
  %476 = getelementptr inbounds i32, i32* %475, i32 -1
  store i32* %476, i32** %18, align 8
  %477 = load i32, i32* %476, align 4
  %478 = load i32, i32* %11, align 4
  %479 = sub i32 %478, %477
  store i32 %479, i32* %11, align 4
  br label %462

; <label>:480:                                    ; preds = %471
  %481 = load i32, i32* %11, align 4
  %482 = load i32, i32* %12, align 4
  %483 = icmp slt i32 %481, %482
  br i1 %483, label %484, label %524

; <label>:484:                                    ; preds = %480
  %485 = load i32, i32* %11, align 4
  %486 = icmp slt i32 %485, 0
  br i1 %486, label %487, label %489

; <label>:487:                                    ; preds = %484
  %pgocount33 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 31)
  %488 = add i64 %pgocount33, 1
  store i64 %488, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 31)
  store i32 0, i32* %11, align 4
  br label %489

; <label>:489:                                    ; preds = %487, %484
  %490 = load i32*, i32** %18, align 8
  %491 = load i32*, i32** %19, align 8
  %492 = ptrtoint i32* %490 to i64
  %493 = ptrtoint i32* %491 to i64
  %494 = sub i64 %492, %493
  %495 = sdiv exact i64 %494, 4
  %496 = and i64 %495, 1
  %497 = icmp ne i64 %496, 0
  br i1 %497, label %498, label %508

; <label>:498:                                    ; preds = %489
  br label %499

; <label>:499:                                    ; preds = %498
  %500 = load i32, i32* %15, align 4
  %501 = add nsw i32 %500, 0
  %502 = load i32*, i32** %18, align 8
  %503 = getelementptr inbounds i32, i32* %502, i32 1
  store i32* %503, i32** %18, align 8
  store i32 %501, i32* %502, align 4
  %504 = load i32, i32* %11, align 4
  %505 = add nsw i32 %504, 0
  store i32 %505, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %506

; <label>:506:                                    ; preds = %499
  %pgocount34 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 26)
  %507 = add i64 %pgocount34, 1
  store i64 %507, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 26)
  br label %508

; <label>:508:                                    ; preds = %506, %489
  br label %509

; <label>:509:                                    ; preds = %508
  %510 = load i32, i32* %15, align 4
  %511 = load i32, i32* %12, align 4
  %512 = load i32, i32* %11, align 4
  %513 = sub nsw i32 %511, %512
  %514 = add nsw i32 %510, %513
  %515 = load i32*, i32** %18, align 8
  %516 = getelementptr inbounds i32, i32* %515, i32 1
  store i32* %516, i32** %18, align 8
  store i32 %514, i32* %515, align 4
  %517 = load i32, i32* %12, align 4
  %518 = load i32, i32* %11, align 4
  %519 = sub nsw i32 %517, %518
  %520 = load i32, i32* %11, align 4
  %521 = add nsw i32 %520, %519
  store i32 %521, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %522

; <label>:522:                                    ; preds = %509
  %pgocount35 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 22)
  %523 = add i64 %pgocount35, 1
  store i64 %523, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 22)
  br label %550

; <label>:524:                                    ; preds = %480
  %525 = load i32, i32* %11, align 4
  %526 = load i32, i32* %12, align 4
  %527 = icmp sgt i32 %525, %526
  br i1 %527, label %528, label %548

; <label>:528:                                    ; preds = %524
  br label %529

; <label>:529:                                    ; preds = %528
  %530 = load i32, i32* %15, align 4
  %531 = load i32, i32* %12, align 4
  %532 = add nsw i32 %530, %531
  %533 = load i32*, i32** %18, align 8
  %534 = getelementptr inbounds i32, i32* %533, i32 1
  store i32* %534, i32** %18, align 8
  store i32 %532, i32* %533, align 4
  %535 = load i32, i32* %12, align 4
  %536 = load i32, i32* %11, align 4
  %537 = add nsw i32 %536, %535
  store i32 %537, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %538

; <label>:538:                                    ; preds = %529
  br label %539

; <label>:539:                                    ; preds = %538
  %540 = load i32, i32* %15, align 4
  %541 = add nsw i32 %540, 0
  %542 = load i32*, i32** %18, align 8
  %543 = getelementptr inbounds i32, i32* %542, i32 1
  store i32* %543, i32** %18, align 8
  store i32 %541, i32* %542, align 4
  %544 = load i32, i32* %11, align 4
  %545 = add nsw i32 %544, 0
  store i32 %545, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %546

; <label>:546:                                    ; preds = %539
  %pgocount36 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 27)
  %547 = add i64 %pgocount36, 1
  store i64 %547, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 27)
  br label %548

; <label>:548:                                    ; preds = %546, %524
  %pgocount37 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 23)
  %549 = add i64 %pgocount37, 1
  store i64 %549, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 23)
  br label %550

; <label>:550:                                    ; preds = %548, %522
  br label %551

; <label>:551:                                    ; preds = %550, %454
  br label %552

; <label>:552:                                    ; preds = %551
  br label %553

; <label>:553:                                    ; preds = %552
  %554 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %555 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %554, i32 0, i32 5
  %556 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %555, align 8
  %557 = load i8*, i8** %7, align 8
  %558 = load i32*, i32** %19, align 8
  %559 = load i32*, i32** %18, align 8
  %560 = load i32, i32* %12, align 4
  %561 = ptrtoint void (i8*, i32*, i32*, i32)* %556 to i64
  call void @__llvm_profile_instrument_target(i64 %561, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3DecodeRLE to i8*), i32 0)
  call void %556(i8* %557, i32* %558, i32* %559, i32 %560)
  %562 = load i32, i32* %23, align 4
  %563 = and i32 %562, 4
  %564 = icmp ne i32 %563, 0
  br i1 %564, label %565, label %578

; <label>:565:                                    ; preds = %553
  %566 = load i32, i32* %14, align 4
  %567 = load i32, i32* %14, align 4
  %568 = and i32 %567, -8
  %569 = sub nsw i32 %566, %568
  store i32 %569, i32* %24, align 4
  br label %570

; <label>:570:                                    ; preds = %565
  %571 = load i32, i32* %24, align 4
  %572 = load i32, i32* %14, align 4
  %573 = sub nsw i32 %572, %571
  store i32 %573, i32* %14, align 4
  %574 = load i32, i32* %24, align 4
  %575 = load i32, i32* %13, align 4
  %576 = lshr i32 %575, %574
  store i32 %576, i32* %13, align 4
  br label %577

; <label>:577:                                    ; preds = %570
  br label %611

; <label>:578:                                    ; preds = %553
  %579 = load i32, i32* %23, align 4
  %580 = and i32 %579, 8
  %581 = icmp ne i32 %580, 0
  br i1 %581, label %582, label %609

; <label>:582:                                    ; preds = %578
  %583 = load i32, i32* %14, align 4
  %584 = load i32, i32* %14, align 4
  %585 = and i32 %584, -16
  %586 = sub nsw i32 %583, %585
  store i32 %586, i32* %25, align 4
  br label %587

; <label>:587:                                    ; preds = %582
  %588 = load i32, i32* %25, align 4
  %589 = load i32, i32* %14, align 4
  %590 = sub nsw i32 %589, %588
  store i32 %590, i32* %14, align 4
  %591 = load i32, i32* %25, align 4
  %592 = load i32, i32* %13, align 4
  %593 = lshr i32 %592, %591
  store i32 %593, i32* %13, align 4
  br label %594

; <label>:594:                                    ; preds = %587
  %595 = load i32, i32* %14, align 4
  %596 = icmp eq i32 %595, 0
  br i1 %596, label %597, label %607

; <label>:597:                                    ; preds = %594
  %pgocount38 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 32)
  %598 = add i64 %pgocount38, 1
  store i64 %598, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 32)
  %599 = load i8*, i8** %16, align 8
  %600 = ptrtoint i8* %599 to i64
  %601 = and i64 %600, 1
  %602 = icmp eq i64 %601, 0
  br i1 %602, label %607, label %603

; <label>:603:                                    ; preds = %597
  %pgocount39 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 36)
  %604 = add i64 %pgocount39, 1
  store i64 %604, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 36)
  %605 = load i8*, i8** %16, align 8
  %606 = getelementptr inbounds i8, i8* %605, i32 1
  store i8* %606, i8** %16, align 8
  br label %607

; <label>:607:                                    ; preds = %603, %597, %594
  %pgocount40 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 24)
  %608 = add i64 %pgocount40, 1
  store i64 %608, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 24)
  br label %609

; <label>:609:                                    ; preds = %607, %578
  %pgocount41 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 18)
  %610 = add i64 %pgocount41, 1
  store i64 %610, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 18)
  br label %611

; <label>:611:                                    ; preds = %609, %577
  %612 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %613 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %612, i32 0, i32 0
  %614 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %613, i32 0, i32 1
  %615 = load i32, i32* %614, align 4
  %616 = load i8*, i8** %7, align 8
  %617 = zext i32 %615 to i64
  %618 = getelementptr inbounds i8, i8* %616, i64 %617
  store i8* %618, i8** %7, align 8
  %619 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %620 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %619, i32 0, i32 0
  %621 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %620, i32 0, i32 1
  %622 = load i32, i32* %621, align 4
  %623 = load i32, i32* %8, align 4
  %624 = sub i32 %623, %622
  store i32 %624, i32* %8, align 4
  %625 = load i32, i32* %8, align 4
  %626 = icmp ne i32 %625, 0
  br i1 %626, label %627, label %633

; <label>:627:                                    ; preds = %611
  %pgocount42 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 15)
  %628 = add i64 %pgocount42, 1
  store i64 %628, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 15)
  %629 = load %struct.tiff*, %struct.tiff** %6, align 8
  %630 = getelementptr inbounds %struct.tiff, %struct.tiff* %629, i32 0, i32 11
  %631 = load i32, i32* %630, align 8
  %632 = add i32 %631, 1
  store i32 %632, i32* %630, align 8
  br label %633

; <label>:633:                                    ; preds = %627, %611
  br label %66

; <label>:634:                                    ; preds = %439
  %635 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %636 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %635, i32 0, i32 5
  %637 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %636, align 8
  %638 = load i8*, i8** %7, align 8
  %639 = load i32*, i32** %19, align 8
  %640 = load i32*, i32** %18, align 8
  %641 = load i32, i32* %12, align 4
  %642 = ptrtoint void (i8*, i32*, i32*, i32)* %637 to i64
  call void @__llvm_profile_instrument_target(i64 %642, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3DecodeRLE to i8*), i32 1)
  call void %637(i8* %638, i32* %639, i32* %640, i32 %641)
  br label %643

; <label>:643:                                    ; preds = %634
  %644 = load i32, i32* %14, align 4
  %645 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %646 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %645, i32 0, i32 3
  store i32 %644, i32* %646, align 4
  %647 = load i32, i32* %13, align 4
  %648 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %649 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %648, i32 0, i32 2
  store i32 %647, i32* %649, align 8
  %650 = load i32, i32* %20, align 4
  %651 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %652 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %651, i32 0, i32 4
  store i32 %650, i32* %652, align 8
  %653 = load i8*, i8** %16, align 8
  %654 = load %struct.tiff*, %struct.tiff** %6, align 8
  %655 = getelementptr inbounds %struct.tiff, %struct.tiff* %654, i32 0, i32 42
  %656 = load i8*, i8** %655, align 8
  %657 = ptrtoint i8* %653 to i64
  %658 = ptrtoint i8* %656 to i64
  %659 = sub i64 %657, %658
  %660 = load %struct.tiff*, %struct.tiff** %6, align 8
  %661 = getelementptr inbounds %struct.tiff, %struct.tiff* %660, i32 0, i32 43
  %662 = load i32, i32* %661, align 8
  %663 = sext i32 %662 to i64
  %664 = sub nsw i64 %663, %659
  %665 = trunc i64 %664 to i32
  store i32 %665, i32* %661, align 8
  %666 = load i8*, i8** %16, align 8
  %667 = load %struct.tiff*, %struct.tiff** %6, align 8
  %668 = getelementptr inbounds %struct.tiff, %struct.tiff* %667, i32 0, i32 42
  store i8* %666, i8** %668, align 8
  br label %669

; <label>:669:                                    ; preds = %643
  store i32 -1, i32* %5, align 4
  br label %699

; <label>:670:                                    ; preds = %66
  br label %671

; <label>:671:                                    ; preds = %670
  %672 = load i32, i32* %14, align 4
  %673 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %674 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %673, i32 0, i32 3
  store i32 %672, i32* %674, align 4
  %675 = load i32, i32* %13, align 4
  %676 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %677 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %676, i32 0, i32 2
  store i32 %675, i32* %677, align 8
  %678 = load i32, i32* %20, align 4
  %679 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %680 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %679, i32 0, i32 4
  store i32 %678, i32* %680, align 8
  %681 = load i8*, i8** %16, align 8
  %682 = load %struct.tiff*, %struct.tiff** %6, align 8
  %683 = getelementptr inbounds %struct.tiff, %struct.tiff* %682, i32 0, i32 42
  %684 = load i8*, i8** %683, align 8
  %685 = ptrtoint i8* %681 to i64
  %686 = ptrtoint i8* %684 to i64
  %687 = sub i64 %685, %686
  %688 = load %struct.tiff*, %struct.tiff** %6, align 8
  %689 = getelementptr inbounds %struct.tiff, %struct.tiff* %688, i32 0, i32 43
  %690 = load i32, i32* %689, align 8
  %691 = sext i32 %690 to i64
  %692 = sub nsw i64 %691, %687
  %693 = trunc i64 %692 to i32
  store i32 %693, i32* %689, align 8
  %694 = load i8*, i8** %16, align 8
  %695 = load %struct.tiff*, %struct.tiff** %6, align 8
  %696 = getelementptr inbounds %struct.tiff, %struct.tiff* %695, i32 0, i32 42
  store i8* %694, i8** %696, align 8
  br label %697

; <label>:697:                                    ; preds = %671
  %pgocount43 = load i64, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 39)
  %698 = add i64 %pgocount43, 1
  store i64 %698, i64* getelementptr inbounds ([43 x i64], [43 x i64]* @__profc_tmp1.ll_Fax3DecodeRLE, i64 0, i64 39)
  store i32 1, i32* %5, align 4
  br label %699

; <label>:699:                                    ; preds = %697, %669
  %700 = load i32, i32* %5, align 4
  ret i32 %700
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFInitCCITTRLEW(%struct.tiff*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load %struct.tiff*, %struct.tiff** %4, align 8
  %7 = call i32 @InitCCITTFax3(%struct.tiff* %6)
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %19

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTRLEW, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTRLEW, i64 0, i64 0)
  %11 = load %struct.tiff*, %struct.tiff** %4, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3DecodeRLE, i32 (%struct.tiff*, i8*, i32, i16)** %12, align 8
  %13 = load %struct.tiff*, %struct.tiff** %4, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %13, i32 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3DecodeRLE, i32 (%struct.tiff*, i8*, i32, i16)** %14, align 8
  %15 = load %struct.tiff*, %struct.tiff** %4, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %15, i32 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3DecodeRLE, i32 (%struct.tiff*, i8*, i32, i16)** %16, align 8
  %17 = load %struct.tiff*, %struct.tiff** %4, align 8
  %18 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %17, i32 65536, i32 11)
  store i32 %18, i32* %3, align 4
  br label %21

; <label>:19:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTRLEW, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFInitCCITTRLEW, i64 0, i64 1)
  store i32 0, i32* %3, align 4
  br label %21

; <label>:21:                                     ; preds = %19, %9
  %22 = load i32, i32* %3, align 4
  ret i32 %22
}

declare i8* @_TIFFmalloc(i32) #2

declare void @TIFFError(i8*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3VGetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.__va_list_tag*, align 8
  %8 = alloca %struct.Fax3BaseState*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store %struct.__va_list_tag* %2, %struct.__va_list_tag** %7, align 8
  %9 = load %struct.tiff*, %struct.tiff** %5, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 37
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast i8* %11 to %struct.Fax3BaseState*
  store %struct.Fax3BaseState* %12, %struct.Fax3BaseState** %8, align 8
  %13 = load i32, i32* %6, align 4
  switch i32 %13, label %242 [
    i32 65536, label %15
    i32 65540, label %39
    i32 292, label %._crit_edge
    i32 293, label %74
    i32 326, label %98
    i32 327, label %122
    i32 328, label %146
    i32 34908, label %170
    i32 34909, label %194
    i32 34910, label %218
  ]

._crit_edge:                                      ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 0)
  br label %74

; <label>:15:                                     ; preds = %3
  %16 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %17 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %16, i32 0, i32 0
  %18 = load i32, i32* %17, align 8
  %19 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %20 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %19, i32 0, i32 0
  %21 = load i32, i32* %20, align 8
  %22 = icmp ule i32 %21, 40
  br i1 %22, label %23, label %30

; <label>:23:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 5)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 5)
  %25 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %19, i32 0, i32 3
  %26 = load i8*, i8** %25, align 8
  %27 = getelementptr i8, i8* %26, i32 %21
  %28 = bitcast i8* %27 to i32**
  %29 = add i32 %21, 8
  store i32 %29, i32* %20, align 8
  br label %36

; <label>:30:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 6)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 6)
  %32 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %19, i32 0, i32 2
  %33 = load i8*, i8** %32, align 8
  %34 = bitcast i8* %33 to i32**
  %35 = getelementptr i8, i8* %33, i32 8
  store i8* %35, i8** %32, align 8
  br label %36

; <label>:36:                                     ; preds = %30, %23
  %37 = phi i32** [ %28, %23 ], [ %34, %30 ]
  %38 = load i32*, i32** %37, align 8
  store i32 %18, i32* %38, align 4
  br label %252

; <label>:39:                                     ; preds = %3
  %40 = load %struct.tiff*, %struct.tiff** %5, align 8
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %40, i32 0, i32 2
  %42 = load i32, i32* %41, align 4
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %72

; <label>:44:                                     ; preds = %39
  %45 = load %struct.tiff*, %struct.tiff** %5, align 8
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %45, i32 0, i32 37
  %47 = load i8*, i8** %46, align 8
  %48 = bitcast i8* %47 to %struct.Fax3BaseState*
  %49 = bitcast %struct.Fax3BaseState* %48 to %struct.Fax3DecodeState*
  %50 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %49, i32 0, i32 5
  %51 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %50, align 8
  %52 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %53 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %52, i32 0, i32 0
  %54 = load i32, i32* %53, align 8
  %55 = icmp ule i32 %54, 40
  br i1 %55, label %56, label %63

; <label>:56:                                     ; preds = %44
  %pgocount3 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 19)
  %57 = add i64 %pgocount3, 1
  store i64 %57, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 19)
  %58 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %52, i32 0, i32 3
  %59 = load i8*, i8** %58, align 8
  %60 = getelementptr i8, i8* %59, i32 %54
  %61 = bitcast i8* %60 to void (i8*, i32*, i32*, i32)***
  %62 = add i32 %54, 8
  store i32 %62, i32* %53, align 8
  br label %69

; <label>:63:                                     ; preds = %44
  %pgocount4 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 20)
  %64 = add i64 %pgocount4, 1
  store i64 %64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 20)
  %65 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %52, i32 0, i32 2
  %66 = load i8*, i8** %65, align 8
  %67 = bitcast i8* %66 to void (i8*, i32*, i32*, i32)***
  %68 = getelementptr i8, i8* %66, i32 8
  store i8* %68, i8** %65, align 8
  br label %69

; <label>:69:                                     ; preds = %63, %56
  %70 = phi void (i8*, i32*, i32*, i32)*** [ %61, %56 ], [ %67, %63 ]
  %71 = load void (i8*, i32*, i32*, i32)**, void (i8*, i32*, i32*, i32)*** %70, align 8
  store void (i8*, i32*, i32*, i32)* %51, void (i8*, i32*, i32*, i32)** %71, align 8
  br label %72

; <label>:72:                                     ; preds = %69, %39
  %pgocount5 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 1)
  %73 = add i64 %pgocount5, 1
  store i64 %73, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 1)
  br label %252

; <label>:74:                                     ; preds = %._crit_edge, %3
  %75 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %76 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %75, i32 0, i32 6
  %77 = load i32, i32* %76, align 8
  %78 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %79 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %78, i32 0, i32 0
  %80 = load i32, i32* %79, align 8
  %81 = icmp ule i32 %80, 40
  br i1 %81, label %82, label %89

; <label>:82:                                     ; preds = %74
  %pgocount6 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 2)
  %83 = add i64 %pgocount6, 1
  store i64 %83, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 2)
  %84 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %78, i32 0, i32 3
  %85 = load i8*, i8** %84, align 8
  %86 = getelementptr i8, i8* %85, i32 %80
  %87 = bitcast i8* %86 to i32**
  %88 = add i32 %80, 8
  store i32 %88, i32* %79, align 8
  br label %95

; <label>:89:                                     ; preds = %74
  %pgocount7 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 3)
  %90 = add i64 %pgocount7, 1
  store i64 %90, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 3)
  %91 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %78, i32 0, i32 2
  %92 = load i8*, i8** %91, align 8
  %93 = bitcast i8* %92 to i32**
  %94 = getelementptr i8, i8* %92, i32 8
  store i8* %94, i8** %91, align 8
  br label %95

; <label>:95:                                     ; preds = %89, %82
  %96 = phi i32** [ %87, %82 ], [ %93, %89 ]
  %97 = load i32*, i32** %96, align 8
  store i32 %77, i32* %97, align 4
  br label %252

; <label>:98:                                     ; preds = %3
  %99 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %100 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %99, i32 0, i32 5
  %101 = load i32, i32* %100, align 4
  %102 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %103 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %102, i32 0, i32 0
  %104 = load i32, i32* %103, align 8
  %105 = icmp ule i32 %104, 40
  br i1 %105, label %106, label %113

; <label>:106:                                    ; preds = %98
  %pgocount8 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 7)
  %107 = add i64 %pgocount8, 1
  store i64 %107, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 7)
  %108 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %102, i32 0, i32 3
  %109 = load i8*, i8** %108, align 8
  %110 = getelementptr i8, i8* %109, i32 %104
  %111 = bitcast i8* %110 to i32**
  %112 = add i32 %104, 8
  store i32 %112, i32* %103, align 8
  br label %119

; <label>:113:                                    ; preds = %98
  %pgocount9 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 8)
  %114 = add i64 %pgocount9, 1
  store i64 %114, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 8)
  %115 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %102, i32 0, i32 2
  %116 = load i8*, i8** %115, align 8
  %117 = bitcast i8* %116 to i32**
  %118 = getelementptr i8, i8* %116, i32 8
  store i8* %118, i8** %115, align 8
  br label %119

; <label>:119:                                    ; preds = %113, %106
  %120 = phi i32** [ %111, %106 ], [ %117, %113 ]
  %121 = load i32*, i32** %120, align 8
  store i32 %101, i32* %121, align 4
  br label %252

; <label>:122:                                    ; preds = %3
  %123 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %124 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %123, i32 0, i32 3
  %125 = load i16, i16* %124, align 4
  %126 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %127 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %126, i32 0, i32 0
  %128 = load i32, i32* %127, align 8
  %129 = icmp ule i32 %128, 40
  br i1 %129, label %130, label %137

; <label>:130:                                    ; preds = %122
  %pgocount10 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 9)
  %131 = add i64 %pgocount10, 1
  store i64 %131, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 9)
  %132 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %126, i32 0, i32 3
  %133 = load i8*, i8** %132, align 8
  %134 = getelementptr i8, i8* %133, i32 %128
  %135 = bitcast i8* %134 to i16**
  %136 = add i32 %128, 8
  store i32 %136, i32* %127, align 8
  br label %143

; <label>:137:                                    ; preds = %122
  %pgocount11 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 10)
  %138 = add i64 %pgocount11, 1
  store i64 %138, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 10)
  %139 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %126, i32 0, i32 2
  %140 = load i8*, i8** %139, align 8
  %141 = bitcast i8* %140 to i16**
  %142 = getelementptr i8, i8* %140, i32 8
  store i8* %142, i8** %139, align 8
  br label %143

; <label>:143:                                    ; preds = %137, %130
  %144 = phi i16** [ %135, %130 ], [ %141, %137 ]
  %145 = load i16*, i16** %144, align 8
  store i16 %125, i16* %145, align 2
  br label %252

; <label>:146:                                    ; preds = %3
  %147 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %148 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %147, i32 0, i32 4
  %149 = load i32, i32* %148, align 8
  %150 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %151 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %150, i32 0, i32 0
  %152 = load i32, i32* %151, align 8
  %153 = icmp ule i32 %152, 40
  br i1 %153, label %154, label %161

; <label>:154:                                    ; preds = %146
  %pgocount12 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 11)
  %155 = add i64 %pgocount12, 1
  store i64 %155, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 11)
  %156 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %150, i32 0, i32 3
  %157 = load i8*, i8** %156, align 8
  %158 = getelementptr i8, i8* %157, i32 %152
  %159 = bitcast i8* %158 to i32**
  %160 = add i32 %152, 8
  store i32 %160, i32* %151, align 8
  br label %167

; <label>:161:                                    ; preds = %146
  %pgocount13 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 12)
  %162 = add i64 %pgocount13, 1
  store i64 %162, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 12)
  %163 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %150, i32 0, i32 2
  %164 = load i8*, i8** %163, align 8
  %165 = bitcast i8* %164 to i32**
  %166 = getelementptr i8, i8* %164, i32 8
  store i8* %166, i8** %163, align 8
  br label %167

; <label>:167:                                    ; preds = %161, %154
  %168 = phi i32** [ %159, %154 ], [ %165, %161 ]
  %169 = load i32*, i32** %168, align 8
  store i32 %149, i32* %169, align 4
  br label %252

; <label>:170:                                    ; preds = %3
  %171 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %172 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %171, i32 0, i32 7
  %173 = load i32, i32* %172, align 4
  %174 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %175 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %174, i32 0, i32 0
  %176 = load i32, i32* %175, align 8
  %177 = icmp ule i32 %176, 40
  br i1 %177, label %178, label %185

; <label>:178:                                    ; preds = %170
  %pgocount14 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 13)
  %179 = add i64 %pgocount14, 1
  store i64 %179, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 13)
  %180 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %174, i32 0, i32 3
  %181 = load i8*, i8** %180, align 8
  %182 = getelementptr i8, i8* %181, i32 %176
  %183 = bitcast i8* %182 to i32**
  %184 = add i32 %176, 8
  store i32 %184, i32* %175, align 8
  br label %191

; <label>:185:                                    ; preds = %170
  %pgocount15 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 14)
  %186 = add i64 %pgocount15, 1
  store i64 %186, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 14)
  %187 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %174, i32 0, i32 2
  %188 = load i8*, i8** %187, align 8
  %189 = bitcast i8* %188 to i32**
  %190 = getelementptr i8, i8* %188, i32 8
  store i8* %190, i8** %187, align 8
  br label %191

; <label>:191:                                    ; preds = %185, %178
  %192 = phi i32** [ %183, %178 ], [ %189, %185 ]
  %193 = load i32*, i32** %192, align 8
  store i32 %173, i32* %193, align 4
  br label %252

; <label>:194:                                    ; preds = %3
  %195 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %196 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %195, i32 0, i32 8
  %197 = load i8*, i8** %196, align 8
  %198 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %199 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %198, i32 0, i32 0
  %200 = load i32, i32* %199, align 8
  %201 = icmp ule i32 %200, 40
  br i1 %201, label %202, label %209

; <label>:202:                                    ; preds = %194
  %pgocount16 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 15)
  %203 = add i64 %pgocount16, 1
  store i64 %203, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 15)
  %204 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %198, i32 0, i32 3
  %205 = load i8*, i8** %204, align 8
  %206 = getelementptr i8, i8* %205, i32 %200
  %207 = bitcast i8* %206 to i8***
  %208 = add i32 %200, 8
  store i32 %208, i32* %199, align 8
  br label %215

; <label>:209:                                    ; preds = %194
  %pgocount17 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 16)
  %210 = add i64 %pgocount17, 1
  store i64 %210, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 16)
  %211 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %198, i32 0, i32 2
  %212 = load i8*, i8** %211, align 8
  %213 = bitcast i8* %212 to i8***
  %214 = getelementptr i8, i8* %212, i32 8
  store i8* %214, i8** %211, align 8
  br label %215

; <label>:215:                                    ; preds = %209, %202
  %216 = phi i8*** [ %207, %202 ], [ %213, %209 ]
  %217 = load i8**, i8*** %216, align 8
  store i8* %197, i8** %217, align 8
  br label %252

; <label>:218:                                    ; preds = %3
  %219 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %220 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %219, i32 0, i32 9
  %221 = load i32, i32* %220, align 8
  %222 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %223 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %222, i32 0, i32 0
  %224 = load i32, i32* %223, align 8
  %225 = icmp ule i32 %224, 40
  br i1 %225, label %226, label %233

; <label>:226:                                    ; preds = %218
  %pgocount18 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 17)
  %227 = add i64 %pgocount18, 1
  store i64 %227, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 17)
  %228 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %222, i32 0, i32 3
  %229 = load i8*, i8** %228, align 8
  %230 = getelementptr i8, i8* %229, i32 %224
  %231 = bitcast i8* %230 to i32**
  %232 = add i32 %224, 8
  store i32 %232, i32* %223, align 8
  br label %239

; <label>:233:                                    ; preds = %218
  %pgocount19 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 18)
  %234 = add i64 %pgocount19, 1
  store i64 %234, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 18)
  %235 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %222, i32 0, i32 2
  %236 = load i8*, i8** %235, align 8
  %237 = bitcast i8* %236 to i32**
  %238 = getelementptr i8, i8* %236, i32 8
  store i8* %238, i8** %235, align 8
  br label %239

; <label>:239:                                    ; preds = %233, %226
  %240 = phi i32** [ %231, %226 ], [ %237, %233 ]
  %241 = load i32*, i32** %240, align 8
  store i32 %221, i32* %241, align 4
  br label %252

; <label>:242:                                    ; preds = %3
  %pgocount20 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 4)
  %243 = add i64 %pgocount20, 1
  store i64 %243, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VGetField, i64 0, i64 4)
  %244 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %245 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %244, i32 0, i32 10
  %246 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %245, align 8
  %247 = load %struct.tiff*, %struct.tiff** %5, align 8
  %248 = load i32, i32* %6, align 4
  %249 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %250 = ptrtoint i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* %246 to i64
  call void @__llvm_profile_instrument_target(i64 %250, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3VGetField to i8*), i32 0)
  %251 = call i32 %246(%struct.tiff* %247, i32 %248, %struct.__va_list_tag* %249)
  store i32 %251, i32* %4, align 4
  br label %253

; <label>:252:                                    ; preds = %239, %215, %191, %167, %143, %119, %95, %72, %36
  store i32 1, i32* %4, align 4
  br label %253

; <label>:253:                                    ; preds = %252, %242
  %254 = load i32, i32* %4, align 4
  ret i32 %254
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3VSetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.__va_list_tag*, align 8
  %8 = alloca %struct.Fax3BaseState*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store %struct.__va_list_tag* %2, %struct.__va_list_tag** %7, align 8
  %9 = load %struct.tiff*, %struct.tiff** %5, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 37
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast i8* %11 to %struct.Fax3BaseState*
  store %struct.Fax3BaseState* %12, %struct.Fax3BaseState** %8, align 8
  %13 = load i32, i32* %6, align 4
  switch i32 %13, label %234 [
    i32 65536, label %15
    i32 65540, label %38
    i32 292, label %._crit_edge
    i32 293, label %72
    i32 326, label %95
    i32 327, label %118
    i32 328, label %142
    i32 34908, label %165
    i32 34909, label %188
    i32 34910, label %211
  ]

._crit_edge:                                      ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 0)
  br label %72

; <label>:15:                                     ; preds = %3
  %16 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %17 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %16, i32 0, i32 0
  %18 = load i32, i32* %17, align 8
  %19 = icmp ule i32 %18, 40
  br i1 %19, label %20, label %27

; <label>:20:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 5)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 5)
  %22 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %16, i32 0, i32 3
  %23 = load i8*, i8** %22, align 8
  %24 = getelementptr i8, i8* %23, i32 %18
  %25 = bitcast i8* %24 to i32*
  %26 = add i32 %18, 8
  store i32 %26, i32* %17, align 8
  br label %33

; <label>:27:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 6)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 6)
  %29 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %16, i32 0, i32 2
  %30 = load i8*, i8** %29, align 8
  %31 = bitcast i8* %30 to i32*
  %32 = getelementptr i8, i8* %30, i32 8
  store i8* %32, i8** %29, align 8
  br label %33

; <label>:33:                                     ; preds = %27, %20
  %34 = phi i32* [ %25, %20 ], [ %31, %27 ]
  %35 = load i32, i32* %34, align 4
  %36 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %37 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %36, i32 0, i32 0
  store i32 %35, i32* %37, align 8
  store i32 1, i32* %4, align 4
  br label %272

; <label>:38:                                     ; preds = %3
  %39 = load %struct.tiff*, %struct.tiff** %5, align 8
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %39, i32 0, i32 2
  %41 = load i32, i32* %40, align 4
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %43, label %70

; <label>:43:                                     ; preds = %38
  %44 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %45 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %44, i32 0, i32 0
  %46 = load i32, i32* %45, align 8
  %47 = icmp ule i32 %46, 40
  br i1 %47, label %48, label %55

; <label>:48:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 19)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 19)
  %50 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %44, i32 0, i32 3
  %51 = load i8*, i8** %50, align 8
  %52 = getelementptr i8, i8* %51, i32 %46
  %53 = bitcast i8* %52 to void (i8*, i32*, i32*, i32)**
  %54 = add i32 %46, 8
  store i32 %54, i32* %45, align 8
  br label %61

; <label>:55:                                     ; preds = %43
  %pgocount4 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 20)
  %56 = add i64 %pgocount4, 1
  store i64 %56, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 20)
  %57 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %44, i32 0, i32 2
  %58 = load i8*, i8** %57, align 8
  %59 = bitcast i8* %58 to void (i8*, i32*, i32*, i32)**
  %60 = getelementptr i8, i8* %58, i32 8
  store i8* %60, i8** %57, align 8
  br label %61

; <label>:61:                                     ; preds = %55, %48
  %62 = phi void (i8*, i32*, i32*, i32)** [ %53, %48 ], [ %59, %55 ]
  %63 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %62, align 8
  %64 = load %struct.tiff*, %struct.tiff** %5, align 8
  %65 = getelementptr inbounds %struct.tiff, %struct.tiff* %64, i32 0, i32 37
  %66 = load i8*, i8** %65, align 8
  %67 = bitcast i8* %66 to %struct.Fax3BaseState*
  %68 = bitcast %struct.Fax3BaseState* %67 to %struct.Fax3DecodeState*
  %69 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %68, i32 0, i32 5
  store void (i8*, i32*, i32*, i32)* %63, void (i8*, i32*, i32*, i32)** %69, align 8
  br label %70

; <label>:70:                                     ; preds = %61, %38
  %pgocount5 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 1)
  %71 = add i64 %pgocount5, 1
  store i64 %71, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 1)
  store i32 1, i32* %4, align 4
  br label %272

; <label>:72:                                     ; preds = %._crit_edge, %3
  %73 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %74 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %73, i32 0, i32 0
  %75 = load i32, i32* %74, align 8
  %76 = icmp ule i32 %75, 40
  br i1 %76, label %77, label %84

; <label>:77:                                     ; preds = %72
  %pgocount6 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 2)
  %78 = add i64 %pgocount6, 1
  store i64 %78, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 2)
  %79 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %73, i32 0, i32 3
  %80 = load i8*, i8** %79, align 8
  %81 = getelementptr i8, i8* %80, i32 %75
  %82 = bitcast i8* %81 to i32*
  %83 = add i32 %75, 8
  store i32 %83, i32* %74, align 8
  br label %90

; <label>:84:                                     ; preds = %72
  %pgocount7 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 3)
  %85 = add i64 %pgocount7, 1
  store i64 %85, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 3)
  %86 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %73, i32 0, i32 2
  %87 = load i8*, i8** %86, align 8
  %88 = bitcast i8* %87 to i32*
  %89 = getelementptr i8, i8* %87, i32 8
  store i8* %89, i8** %86, align 8
  br label %90

; <label>:90:                                     ; preds = %84, %77
  %91 = phi i32* [ %82, %77 ], [ %88, %84 ]
  %92 = load i32, i32* %91, align 4
  %93 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %94 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %93, i32 0, i32 6
  store i32 %92, i32* %94, align 8
  br label %244

; <label>:95:                                     ; preds = %3
  %96 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %97 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %96, i32 0, i32 0
  %98 = load i32, i32* %97, align 8
  %99 = icmp ule i32 %98, 40
  br i1 %99, label %100, label %107

; <label>:100:                                    ; preds = %95
  %pgocount8 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 7)
  %101 = add i64 %pgocount8, 1
  store i64 %101, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 7)
  %102 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %96, i32 0, i32 3
  %103 = load i8*, i8** %102, align 8
  %104 = getelementptr i8, i8* %103, i32 %98
  %105 = bitcast i8* %104 to i32*
  %106 = add i32 %98, 8
  store i32 %106, i32* %97, align 8
  br label %113

; <label>:107:                                    ; preds = %95
  %pgocount9 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 8)
  %108 = add i64 %pgocount9, 1
  store i64 %108, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 8)
  %109 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %96, i32 0, i32 2
  %110 = load i8*, i8** %109, align 8
  %111 = bitcast i8* %110 to i32*
  %112 = getelementptr i8, i8* %110, i32 8
  store i8* %112, i8** %109, align 8
  br label %113

; <label>:113:                                    ; preds = %107, %100
  %114 = phi i32* [ %105, %100 ], [ %111, %107 ]
  %115 = load i32, i32* %114, align 4
  %116 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %117 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %116, i32 0, i32 5
  store i32 %115, i32* %117, align 4
  br label %244

; <label>:118:                                    ; preds = %3
  %119 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %120 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %119, i32 0, i32 0
  %121 = load i32, i32* %120, align 8
  %122 = icmp ule i32 %121, 40
  br i1 %122, label %123, label %130

; <label>:123:                                    ; preds = %118
  %pgocount10 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 9)
  %124 = add i64 %pgocount10, 1
  store i64 %124, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 9)
  %125 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %119, i32 0, i32 3
  %126 = load i8*, i8** %125, align 8
  %127 = getelementptr i8, i8* %126, i32 %121
  %128 = bitcast i8* %127 to i32*
  %129 = add i32 %121, 8
  store i32 %129, i32* %120, align 8
  br label %136

; <label>:130:                                    ; preds = %118
  %pgocount11 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 10)
  %131 = add i64 %pgocount11, 1
  store i64 %131, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 10)
  %132 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %119, i32 0, i32 2
  %133 = load i8*, i8** %132, align 8
  %134 = bitcast i8* %133 to i32*
  %135 = getelementptr i8, i8* %133, i32 8
  store i8* %135, i8** %132, align 8
  br label %136

; <label>:136:                                    ; preds = %130, %123
  %137 = phi i32* [ %128, %123 ], [ %134, %130 ]
  %138 = load i32, i32* %137, align 4
  %139 = trunc i32 %138 to i16
  %140 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %141 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %140, i32 0, i32 3
  store i16 %139, i16* %141, align 4
  br label %244

; <label>:142:                                    ; preds = %3
  %143 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %144 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %143, i32 0, i32 0
  %145 = load i32, i32* %144, align 8
  %146 = icmp ule i32 %145, 40
  br i1 %146, label %147, label %154

; <label>:147:                                    ; preds = %142
  %pgocount12 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 11)
  %148 = add i64 %pgocount12, 1
  store i64 %148, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 11)
  %149 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %143, i32 0, i32 3
  %150 = load i8*, i8** %149, align 8
  %151 = getelementptr i8, i8* %150, i32 %145
  %152 = bitcast i8* %151 to i32*
  %153 = add i32 %145, 8
  store i32 %153, i32* %144, align 8
  br label %160

; <label>:154:                                    ; preds = %142
  %pgocount13 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 12)
  %155 = add i64 %pgocount13, 1
  store i64 %155, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 12)
  %156 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %143, i32 0, i32 2
  %157 = load i8*, i8** %156, align 8
  %158 = bitcast i8* %157 to i32*
  %159 = getelementptr i8, i8* %157, i32 8
  store i8* %159, i8** %156, align 8
  br label %160

; <label>:160:                                    ; preds = %154, %147
  %161 = phi i32* [ %152, %147 ], [ %158, %154 ]
  %162 = load i32, i32* %161, align 4
  %163 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %164 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %163, i32 0, i32 4
  store i32 %162, i32* %164, align 8
  br label %244

; <label>:165:                                    ; preds = %3
  %166 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %167 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %166, i32 0, i32 0
  %168 = load i32, i32* %167, align 8
  %169 = icmp ule i32 %168, 40
  br i1 %169, label %170, label %177

; <label>:170:                                    ; preds = %165
  %pgocount14 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 13)
  %171 = add i64 %pgocount14, 1
  store i64 %171, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 13)
  %172 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %166, i32 0, i32 3
  %173 = load i8*, i8** %172, align 8
  %174 = getelementptr i8, i8* %173, i32 %168
  %175 = bitcast i8* %174 to i32*
  %176 = add i32 %168, 8
  store i32 %176, i32* %167, align 8
  br label %183

; <label>:177:                                    ; preds = %165
  %pgocount15 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 14)
  %178 = add i64 %pgocount15, 1
  store i64 %178, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 14)
  %179 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %166, i32 0, i32 2
  %180 = load i8*, i8** %179, align 8
  %181 = bitcast i8* %180 to i32*
  %182 = getelementptr i8, i8* %180, i32 8
  store i8* %182, i8** %179, align 8
  br label %183

; <label>:183:                                    ; preds = %177, %170
  %184 = phi i32* [ %175, %170 ], [ %181, %177 ]
  %185 = load i32, i32* %184, align 4
  %186 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %187 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %186, i32 0, i32 7
  store i32 %185, i32* %187, align 4
  br label %244

; <label>:188:                                    ; preds = %3
  %189 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %190 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %189, i32 0, i32 8
  %191 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %192 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %191, i32 0, i32 0
  %193 = load i32, i32* %192, align 8
  %194 = icmp ule i32 %193, 40
  br i1 %194, label %195, label %202

; <label>:195:                                    ; preds = %188
  %pgocount16 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 15)
  %196 = add i64 %pgocount16, 1
  store i64 %196, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 15)
  %197 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %191, i32 0, i32 3
  %198 = load i8*, i8** %197, align 8
  %199 = getelementptr i8, i8* %198, i32 %193
  %200 = bitcast i8* %199 to i8**
  %201 = add i32 %193, 8
  store i32 %201, i32* %192, align 8
  br label %208

; <label>:202:                                    ; preds = %188
  %pgocount17 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 16)
  %203 = add i64 %pgocount17, 1
  store i64 %203, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 16)
  %204 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %191, i32 0, i32 2
  %205 = load i8*, i8** %204, align 8
  %206 = bitcast i8* %205 to i8**
  %207 = getelementptr i8, i8* %205, i32 8
  store i8* %207, i8** %204, align 8
  br label %208

; <label>:208:                                    ; preds = %202, %195
  %209 = phi i8** [ %200, %195 ], [ %206, %202 ]
  %210 = load i8*, i8** %209, align 8
  call void @_TIFFsetString(i8** %190, i8* %210)
  br label %244

; <label>:211:                                    ; preds = %3
  %212 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %213 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %212, i32 0, i32 0
  %214 = load i32, i32* %213, align 8
  %215 = icmp ule i32 %214, 40
  br i1 %215, label %216, label %223

; <label>:216:                                    ; preds = %211
  %pgocount18 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 17)
  %217 = add i64 %pgocount18, 1
  store i64 %217, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 17)
  %218 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %212, i32 0, i32 3
  %219 = load i8*, i8** %218, align 8
  %220 = getelementptr i8, i8* %219, i32 %214
  %221 = bitcast i8* %220 to i32*
  %222 = add i32 %214, 8
  store i32 %222, i32* %213, align 8
  br label %229

; <label>:223:                                    ; preds = %211
  %pgocount19 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 18)
  %224 = add i64 %pgocount19, 1
  store i64 %224, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 18)
  %225 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %212, i32 0, i32 2
  %226 = load i8*, i8** %225, align 8
  %227 = bitcast i8* %226 to i32*
  %228 = getelementptr i8, i8* %226, i32 8
  store i8* %228, i8** %225, align 8
  br label %229

; <label>:229:                                    ; preds = %223, %216
  %230 = phi i32* [ %221, %216 ], [ %227, %223 ]
  %231 = load i32, i32* %230, align 4
  %232 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %233 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %232, i32 0, i32 9
  store i32 %231, i32* %233, align 8
  br label %244

; <label>:234:                                    ; preds = %3
  %pgocount20 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 4)
  %235 = add i64 %pgocount20, 1
  store i64 %235, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_tmp1.ll_Fax3VSetField, i64 0, i64 4)
  %236 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %8, align 8
  %237 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %236, i32 0, i32 11
  %238 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %237, align 8
  %239 = load %struct.tiff*, %struct.tiff** %5, align 8
  %240 = load i32, i32* %6, align 4
  %241 = load %struct.__va_list_tag*, %struct.__va_list_tag** %7, align 8
  %242 = ptrtoint i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* %238 to i64
  call void @__llvm_profile_instrument_target(i64 %242, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3VSetField to i8*), i32 0)
  %243 = call i32 %238(%struct.tiff* %239, i32 %240, %struct.__va_list_tag* %241)
  store i32 %243, i32* %4, align 4
  br label %272

; <label>:244:                                    ; preds = %229, %208, %183, %160, %136, %113, %90
  %245 = load %struct.tiff*, %struct.tiff** %5, align 8
  %246 = load i32, i32* %6, align 4
  %247 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %245, i32 %246)
  %248 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %247, i32 0, i32 4
  %249 = load i16, i16* %248, align 4
  %250 = zext i16 %249 to i32
  %251 = and i32 %250, 31
  %252 = zext i32 %251 to i64
  %253 = shl i64 1, %252
  %254 = load %struct.tiff*, %struct.tiff** %5, align 8
  %255 = getelementptr inbounds %struct.tiff, %struct.tiff* %254, i32 0, i32 6
  %256 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %255, i32 0, i32 0
  %257 = load %struct.tiff*, %struct.tiff** %5, align 8
  %258 = load i32, i32* %6, align 4
  %259 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %257, i32 %258)
  %260 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %259, i32 0, i32 4
  %261 = load i16, i16* %260, align 4
  %262 = zext i16 %261 to i32
  %263 = sdiv i32 %262, 32
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds [3 x i64], [3 x i64]* %256, i64 0, i64 %264
  %266 = load i64, i64* %265, align 8
  %267 = or i64 %266, %253
  store i64 %267, i64* %265, align 8
  %268 = load %struct.tiff*, %struct.tiff** %5, align 8
  %269 = getelementptr inbounds %struct.tiff, %struct.tiff* %268, i32 0, i32 3
  %270 = load i32, i32* %269, align 8
  %271 = or i32 %270, 8
  store i32 %271, i32* %269, align 8
  store i32 1, i32* %4, align 4
  br label %272

; <label>:272:                                    ; preds = %244, %234, %70, %33
  %273 = load i32, i32* %4, align 4
  ret i32 %273
}

; Function Attrs: noinline nounwind uwtable
define internal void @Fax3PrintDir(%struct.tiff*, %struct._IO_FILE*, i64) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i64, align 8
  %7 = alloca %struct.Fax3BaseState*, align 8
  %8 = alloca i8*, align 8
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %5, align 8
  store i64 %2, i64* %6, align 8
  %9 = load %struct.tiff*, %struct.tiff** %4, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 37
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast i8* %11 to %struct.Fax3BaseState*
  store %struct.Fax3BaseState* %12, %struct.Fax3BaseState** %7, align 8
  %13 = load i64, i64* %6, align 8
  %14 = load %struct.tiff*, %struct.tiff** %4, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 6
  %16 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %15, i32 0, i32 0
  %17 = getelementptr inbounds [3 x i64], [3 x i64]* %16, i64 0, i64 2
  %18 = load i64, i64* %17, align 8
  %19 = and i64 %18, 16
  %20 = icmp ne i64 %19, 0
  br i1 %20, label %21, label %91

; <label>:21:                                     ; preds = %3
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0), i8** %8, align 8
  %22 = load %struct.tiff*, %struct.tiff** %4, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %22, i32 0, i32 6
  %24 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %23, i32 0, i32 10
  %25 = load i16, i16* %24, align 8
  %26 = zext i16 %25 to i32
  %27 = icmp eq i32 %26, 4
  br i1 %27, label %28, label %43

; <label>:28:                                     ; preds = %21
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.13, i32 0, i32 0))
  %31 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %7, align 8
  %32 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %31, i32 0, i32 6
  %33 = load i32, i32* %32, align 8
  %34 = and i32 %33, 2
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %41

; <label>:36:                                     ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 9)
  %37 = add i64 %pgocount, 1
  store i64 %37, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 9)
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %39 = load i8*, i8** %8, align 8
  %40 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.14, i32 0, i32 0), i8* %39)
  br label %41

; <label>:41:                                     ; preds = %36, %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 7)
  %42 = add i64 %pgocount1, 1
  store i64 %42, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 7)
  br label %80

; <label>:43:                                     ; preds = %21
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %45 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.15, i32 0, i32 0))
  %46 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %7, align 8
  %47 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %46, i32 0, i32 6
  %48 = load i32, i32* %47, align 8
  %49 = and i32 %48, 1
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %56

; <label>:51:                                     ; preds = %43
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 10)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 10)
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %54 = load i8*, i8** %8, align 8
  %55 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %53, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.16, i32 0, i32 0), i8* %54)
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.17, i32 0, i32 0), i8** %8, align 8
  br label %56

; <label>:56:                                     ; preds = %51, %43
  %57 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %7, align 8
  %58 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %57, i32 0, i32 6
  %59 = load i32, i32* %58, align 8
  %60 = and i32 %59, 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %67

; <label>:62:                                     ; preds = %56
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 11)
  %63 = add i64 %pgocount3, 1
  store i64 %63, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 11)
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %65 = load i8*, i8** %8, align 8
  %66 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.18, i32 0, i32 0), i8* %65)
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.17, i32 0, i32 0), i8** %8, align 8
  br label %67

; <label>:67:                                     ; preds = %62, %56
  %68 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %7, align 8
  %69 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %68, i32 0, i32 6
  %70 = load i32, i32* %69, align 8
  %71 = and i32 %70, 2
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %78

; <label>:73:                                     ; preds = %67
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 12)
  %74 = add i64 %pgocount4, 1
  store i64 %74, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 12)
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %76 = load i8*, i8** %8, align 8
  %77 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %75, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.14, i32 0, i32 0), i8* %76)
  br label %78

; <label>:78:                                     ; preds = %73, %67
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 8)
  %79 = add i64 %pgocount5, 1
  store i64 %79, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 8)
  br label %80

; <label>:80:                                     ; preds = %78, %41
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %82 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %7, align 8
  %83 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %82, i32 0, i32 6
  %84 = load i32, i32* %83, align 8
  %85 = zext i32 %84 to i64
  %86 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %7, align 8
  %87 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %86, i32 0, i32 6
  %88 = load i32, i32* %87, align 8
  %89 = zext i32 %88 to i64
  %90 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %81, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.19, i32 0, i32 0), i64 %85, i64 %89)
  br label %91

; <label>:91:                                     ; preds = %80, %3
  %92 = load %struct.tiff*, %struct.tiff** %4, align 8
  %93 = getelementptr inbounds %struct.tiff, %struct.tiff* %92, i32 0, i32 6
  %94 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %93, i32 0, i32 0
  %95 = getelementptr inbounds [3 x i64], [3 x i64]* %94, i64 0, i64 1
  %96 = load i64, i64* %95, align 8
  %97 = and i64 %96, 2147483648
  %98 = icmp ne i64 %97, 0
  br i1 %98, label %99, label %130

; <label>:99:                                     ; preds = %91
  %100 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %101 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %100, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.20, i32 0, i32 0))
  %102 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %7, align 8
  %103 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %102, i32 0, i32 3
  %104 = load i16, i16* %103, align 4
  %105 = zext i16 %104 to i32
  switch i32 %105, label %118 [
    i32 0, label %106
    i32 1, label %110
    i32 2, label %114
  ]

; <label>:106:                                    ; preds = %99
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 15)
  %107 = add i64 %pgocount6, 1
  store i64 %107, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 15)
  %108 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %109 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %108, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.21, i32 0, i32 0))
  br label %118

; <label>:110:                                    ; preds = %99
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 13)
  %111 = add i64 %pgocount7, 1
  store i64 %111, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 13)
  %112 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %113 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %112, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.22, i32 0, i32 0))
  br label %118

; <label>:114:                                    ; preds = %99
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 14)
  %115 = add i64 %pgocount8, 1
  store i64 %115, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 14)
  %116 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %117 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %116, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.23, i32 0, i32 0))
  br label %118

; <label>:118:                                    ; preds = %114, %110, %106, %99
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 1)
  %119 = add i64 %pgocount9, 1
  store i64 %119, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 1)
  %120 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %121 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %7, align 8
  %122 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %121, i32 0, i32 3
  %123 = load i16, i16* %122, align 4
  %124 = zext i16 %123 to i32
  %125 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %7, align 8
  %126 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %125, i32 0, i32 3
  %127 = load i16, i16* %126, align 4
  %128 = zext i16 %127 to i32
  %129 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %120, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.24, i32 0, i32 0), i32 %124, i32 %128)
  br label %130

; <label>:130:                                    ; preds = %118, %91
  %131 = load %struct.tiff*, %struct.tiff** %4, align 8
  %132 = getelementptr inbounds %struct.tiff, %struct.tiff* %131, i32 0, i32 6
  %133 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %132, i32 0, i32 0
  %134 = getelementptr inbounds [3 x i64], [3 x i64]* %133, i64 0, i64 1
  %135 = load i64, i64* %134, align 8
  %136 = and i64 %135, 1073741824
  %137 = icmp ne i64 %136, 0
  br i1 %137, label %138, label %146

; <label>:138:                                    ; preds = %130
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 2)
  %139 = add i64 %pgocount10, 1
  store i64 %139, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 2)
  %140 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %141 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %7, align 8
  %142 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %141, i32 0, i32 5
  %143 = load i32, i32* %142, align 4
  %144 = zext i32 %143 to i64
  %145 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %140, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.25, i32 0, i32 0), i64 %144)
  br label %146

; <label>:146:                                    ; preds = %138, %130
  %147 = load %struct.tiff*, %struct.tiff** %4, align 8
  %148 = getelementptr inbounds %struct.tiff, %struct.tiff* %147, i32 0, i32 6
  %149 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %148, i32 0, i32 0
  %150 = getelementptr inbounds [3 x i64], [3 x i64]* %149, i64 0, i64 2
  %151 = load i64, i64* %150, align 8
  %152 = and i64 %151, 1
  %153 = icmp ne i64 %152, 0
  br i1 %153, label %154, label %162

; <label>:154:                                    ; preds = %146
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 3)
  %155 = add i64 %pgocount11, 1
  store i64 %155, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 3)
  %156 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %157 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %7, align 8
  %158 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %157, i32 0, i32 4
  %159 = load i32, i32* %158, align 8
  %160 = zext i32 %159 to i64
  %161 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %156, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.26, i32 0, i32 0), i64 %160)
  br label %162

; <label>:162:                                    ; preds = %154, %146
  %163 = load %struct.tiff*, %struct.tiff** %4, align 8
  %164 = getelementptr inbounds %struct.tiff, %struct.tiff* %163, i32 0, i32 6
  %165 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %164, i32 0, i32 0
  %166 = getelementptr inbounds [3 x i64], [3 x i64]* %165, i64 0, i64 2
  %167 = load i64, i64* %166, align 8
  %168 = and i64 %167, 2
  %169 = icmp ne i64 %168, 0
  br i1 %169, label %170, label %178

; <label>:170:                                    ; preds = %162
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 4)
  %171 = add i64 %pgocount12, 1
  store i64 %171, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 4)
  %172 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %173 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %7, align 8
  %174 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %173, i32 0, i32 7
  %175 = load i32, i32* %174, align 4
  %176 = zext i32 %175 to i64
  %177 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %172, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.27, i32 0, i32 0), i64 %176)
  br label %178

; <label>:178:                                    ; preds = %170, %162
  %179 = load %struct.tiff*, %struct.tiff** %4, align 8
  %180 = getelementptr inbounds %struct.tiff, %struct.tiff* %179, i32 0, i32 6
  %181 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %180, i32 0, i32 0
  %182 = getelementptr inbounds [3 x i64], [3 x i64]* %181, i64 0, i64 2
  %183 = load i64, i64* %182, align 8
  %184 = and i64 %183, 4
  %185 = icmp ne i64 %184, 0
  br i1 %185, label %186, label %193

; <label>:186:                                    ; preds = %178
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 5)
  %187 = add i64 %pgocount13, 1
  store i64 %187, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 5)
  %188 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %189 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %7, align 8
  %190 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %189, i32 0, i32 8
  %191 = load i8*, i8** %190, align 8
  %192 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %188, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.28, i32 0, i32 0), i8* %191)
  br label %193

; <label>:193:                                    ; preds = %186, %178
  %194 = load %struct.tiff*, %struct.tiff** %4, align 8
  %195 = getelementptr inbounds %struct.tiff, %struct.tiff* %194, i32 0, i32 6
  %196 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %195, i32 0, i32 0
  %197 = getelementptr inbounds [3 x i64], [3 x i64]* %196, i64 0, i64 2
  %198 = load i64, i64* %197, align 8
  %199 = and i64 %198, 8
  %200 = icmp ne i64 %199, 0
  br i1 %200, label %201, label %209

; <label>:201:                                    ; preds = %193
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 6)
  %202 = add i64 %pgocount14, 1
  store i64 %202, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 6)
  %203 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %204 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %7, align 8
  %205 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %204, i32 0, i32 9
  %206 = load i32, i32* %205, align 8
  %207 = zext i32 %206 to i64
  %208 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %203, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.29, i32 0, i32 0), i64 %207)
  br label %209

; <label>:209:                                    ; preds = %201, %193
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 0)
  %210 = add i64 %pgocount15, 1
  store i64 %210, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3PrintDir, i64 0, i64 0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3SetupState(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFDirectory*, align 8
  %5 = alloca %struct.Fax3BaseState*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.Fax3DecodeState*, align 8
  %10 = alloca i32, align 4
  %11 = alloca %struct.Fax3EncodeState*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %12 = load %struct.tiff*, %struct.tiff** %3, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 6
  store %struct.TIFFDirectory* %13, %struct.TIFFDirectory** %4, align 8
  %14 = load %struct.tiff*, %struct.tiff** %3, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 37
  %16 = load i8*, i8** %15, align 8
  %17 = bitcast i8* %16 to %struct.Fax3BaseState*
  store %struct.Fax3BaseState* %17, %struct.Fax3BaseState** %5, align 8
  %18 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %19 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %18, i32 0, i32 8
  %20 = load i16, i16* %19, align 4
  %21 = zext i16 %20 to i32
  %22 = icmp ne i32 %21, 1
  br i1 %22, label %23, label %28

; <label>:23:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 0)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 0)
  %25 = load %struct.tiff*, %struct.tiff** %3, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %25, i32 0, i32 0
  %27 = load i8*, i8** %26, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %27, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.30, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %192

; <label>:28:                                     ; preds = %1
  %29 = load %struct.tiff*, %struct.tiff** %3, align 8
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %29, i32 0, i32 3
  %31 = load i32, i32* %30, align 8
  %32 = and i32 %31, 1024
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %42

; <label>:34:                                     ; preds = %28
  %35 = load %struct.tiff*, %struct.tiff** %3, align 8
  %36 = call i32 @TIFFTileRowSize(%struct.tiff* %35)
  %37 = sext i32 %36 to i64
  store i64 %37, i64* %6, align 8
  %38 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %39 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %38, i32 0, i32 4
  %40 = load i32, i32* %39, align 4
  %41 = zext i32 %40 to i64
  store i64 %41, i64* %7, align 8
  br label %51

; <label>:42:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 1)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 1)
  %44 = load %struct.tiff*, %struct.tiff** %3, align 8
  %45 = call i32 @TIFFScanlineSize(%struct.tiff* %44)
  %46 = sext i32 %45 to i64
  store i64 %46, i64* %6, align 8
  %47 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %48 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %47, i32 0, i32 1
  %49 = load i32, i32* %48, align 8
  %50 = zext i32 %49 to i64
  store i64 %50, i64* %7, align 8
  br label %51

; <label>:51:                                     ; preds = %42, %34
  %52 = load i64, i64* %6, align 8
  %53 = trunc i64 %52 to i32
  %54 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %5, align 8
  %55 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %54, i32 0, i32 1
  store i32 %53, i32* %55, align 4
  %56 = load i64, i64* %7, align 8
  %57 = trunc i64 %56 to i32
  %58 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %5, align 8
  %59 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %58, i32 0, i32 2
  store i32 %57, i32* %59, align 8
  %60 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %5, align 8
  %61 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %60, i32 0, i32 6
  %62 = load i32, i32* %61, align 8
  %63 = and i32 %62, 1
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %72, label %65

; <label>:65:                                     ; preds = %51
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 2)
  %66 = add i64 %pgocount2, 1
  store i64 %66, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 2)
  %67 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %68 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %67, i32 0, i32 10
  %69 = load i16, i16* %68, align 8
  %70 = zext i16 %69 to i32
  %71 = icmp eq i32 %70, 4
  br label %72

; <label>:72:                                     ; preds = %65, %51
  %73 = phi i1 [ true, %51 ], [ %71, %65 ]
  %74 = zext i1 %73 to i32
  store i32 %74, i32* %8, align 4
  %75 = load %struct.tiff*, %struct.tiff** %3, align 8
  %76 = getelementptr inbounds %struct.tiff, %struct.tiff* %75, i32 0, i32 2
  %77 = load i32, i32* %76, align 4
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %157

; <label>:79:                                     ; preds = %72
  %80 = load %struct.tiff*, %struct.tiff** %3, align 8
  %81 = getelementptr inbounds %struct.tiff, %struct.tiff* %80, i32 0, i32 37
  %82 = load i8*, i8** %81, align 8
  %83 = bitcast i8* %82 to %struct.Fax3BaseState*
  %84 = bitcast %struct.Fax3BaseState* %83 to %struct.Fax3DecodeState*
  store %struct.Fax3DecodeState* %84, %struct.Fax3DecodeState** %9, align 8
  %85 = load i32, i32* %8, align 4
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %87, label %95

; <label>:87:                                     ; preds = %79
  %88 = load i64, i64* %7, align 8
  %89 = trunc i64 %88 to i32
  %90 = add i32 %89, 31
  %91 = udiv i32 %90, 32
  %92 = mul i32 %91, 32
  %93 = mul i32 2, %92
  %94 = zext i32 %93 to i64
  br label %98

; <label>:95:                                     ; preds = %79
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 7)
  %96 = add i64 %pgocount3, 1
  store i64 %96, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 7)
  %97 = load i64, i64* %7, align 8
  br label %98

; <label>:98:                                     ; preds = %95, %87
  %99 = phi i64 [ %94, %87 ], [ %97, %95 ]
  %100 = trunc i64 %99 to i32
  store i32 %100, i32* %10, align 4
  %101 = load i32, i32* %10, align 4
  %102 = zext i32 %101 to i64
  %103 = mul i64 %102, 4
  %104 = trunc i64 %103 to i32
  %105 = call i8* @_TIFFmalloc(i32 %104)
  %106 = bitcast i8* %105 to i32*
  %107 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %9, align 8
  %108 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %107, i32 0, i32 6
  store i32* %106, i32** %108, align 8
  %109 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %9, align 8
  %110 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %109, i32 0, i32 6
  %111 = load i32*, i32** %110, align 8
  %112 = icmp eq i32* %111, null
  br i1 %112, label %113, label %118

; <label>:113:                                    ; preds = %98
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 8)
  %114 = add i64 %pgocount4, 1
  store i64 %114, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 8)
  %115 = load %struct.tiff*, %struct.tiff** %3, align 8
  %116 = getelementptr inbounds %struct.tiff, %struct.tiff* %115, i32 0, i32 0
  %117 = load i8*, i8** %116, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.31, i32 0, i32 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.32, i32 0, i32 0), i8* %117)
  store i32 0, i32* %2, align 4
  br label %192

; <label>:118:                                    ; preds = %98
  %119 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %9, align 8
  %120 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %119, i32 0, i32 6
  %121 = load i32*, i32** %120, align 8
  %122 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %9, align 8
  %123 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %122, i32 0, i32 8
  store i32* %121, i32** %123, align 8
  %124 = load i32, i32* %8, align 4
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %126, label %137

; <label>:126:                                    ; preds = %118
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 5)
  %127 = add i64 %pgocount5, 1
  store i64 %127, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 5)
  %128 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %9, align 8
  %129 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %128, i32 0, i32 6
  %130 = load i32*, i32** %129, align 8
  %131 = load i32, i32* %10, align 4
  %132 = lshr i32 %131, 1
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32* %130, i64 %133
  %135 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %9, align 8
  %136 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %135, i32 0, i32 7
  store i32* %134, i32** %136, align 8
  br label %141

; <label>:137:                                    ; preds = %118
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 10)
  %138 = add i64 %pgocount6, 1
  store i64 %138, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 10)
  %139 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %9, align 8
  %140 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %139, i32 0, i32 7
  store i32* null, i32** %140, align 8
  br label %141

; <label>:141:                                    ; preds = %137, %126
  %142 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %9, align 8
  %143 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %142, i32 0, i32 0
  %144 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %143, i32 0, i32 6
  %145 = load i32, i32* %144, align 8
  %146 = and i32 %145, 1
  %147 = icmp ne i32 %146, 0
  br i1 %147, label %148, label %156

; <label>:148:                                    ; preds = %141
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 9)
  %149 = add i64 %pgocount7, 1
  store i64 %149, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 9)
  %150 = load %struct.tiff*, %struct.tiff** %3, align 8
  %151 = getelementptr inbounds %struct.tiff, %struct.tiff* %150, i32 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Decode2D, i32 (%struct.tiff*, i8*, i32, i16)** %151, align 8
  %152 = load %struct.tiff*, %struct.tiff** %3, align 8
  %153 = getelementptr inbounds %struct.tiff, %struct.tiff* %152, i32 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Decode2D, i32 (%struct.tiff*, i8*, i32, i16)** %153, align 8
  %154 = load %struct.tiff*, %struct.tiff** %3, align 8
  %155 = getelementptr inbounds %struct.tiff, %struct.tiff* %154, i32 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Decode2D, i32 (%struct.tiff*, i8*, i32, i16)** %155, align 8
  br label %156

; <label>:156:                                    ; preds = %148, %141
  br label %191

; <label>:157:                                    ; preds = %72
  %158 = load i32, i32* %8, align 4
  %159 = icmp ne i32 %158, 0
  br i1 %159, label %160, label %182

; <label>:160:                                    ; preds = %157
  %161 = load %struct.tiff*, %struct.tiff** %3, align 8
  %162 = getelementptr inbounds %struct.tiff, %struct.tiff* %161, i32 0, i32 37
  %163 = load i8*, i8** %162, align 8
  %164 = bitcast i8* %163 to %struct.Fax3BaseState*
  %165 = bitcast %struct.Fax3BaseState* %164 to %struct.Fax3EncodeState*
  store %struct.Fax3EncodeState* %165, %struct.Fax3EncodeState** %11, align 8
  %166 = load i64, i64* %6, align 8
  %167 = trunc i64 %166 to i32
  %168 = call i8* @_TIFFmalloc(i32 %167)
  %169 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %11, align 8
  %170 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %169, i32 0, i32 4
  store i8* %168, i8** %170, align 8
  %171 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %11, align 8
  %172 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %171, i32 0, i32 4
  %173 = load i8*, i8** %172, align 8
  %174 = icmp eq i8* %173, null
  br i1 %174, label %175, label %180

; <label>:175:                                    ; preds = %160
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 6)
  %176 = add i64 %pgocount8, 1
  store i64 %176, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 6)
  %177 = load %struct.tiff*, %struct.tiff** %3, align 8
  %178 = getelementptr inbounds %struct.tiff, %struct.tiff* %177, i32 0, i32 0
  %179 = load i8*, i8** %178, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.31, i32 0, i32 0), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.33, i32 0, i32 0), i8* %179)
  store i32 0, i32* %2, align 4
  br label %192

; <label>:180:                                    ; preds = %160
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 3)
  %181 = add i64 %pgocount9, 1
  store i64 %181, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 3)
  br label %190

; <label>:182:                                    ; preds = %157
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 4)
  %183 = add i64 %pgocount10, 1
  store i64 %183, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_Fax3SetupState, i64 0, i64 4)
  %184 = load %struct.tiff*, %struct.tiff** %3, align 8
  %185 = getelementptr inbounds %struct.tiff, %struct.tiff* %184, i32 0, i32 37
  %186 = load i8*, i8** %185, align 8
  %187 = bitcast i8* %186 to %struct.Fax3BaseState*
  %188 = bitcast %struct.Fax3BaseState* %187 to %struct.Fax3EncodeState*
  %189 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %188, i32 0, i32 4
  store i8* null, i8** %189, align 8
  br label %190

; <label>:190:                                    ; preds = %182, %180
  br label %191

; <label>:191:                                    ; preds = %190, %156
  store i32 1, i32* %2, align 4
  br label %192

; <label>:192:                                    ; preds = %191, %175, %113, %23
  %193 = load i32, i32* %2, align 4
  ret i32 %193
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3PreDecode(%struct.tiff*, i16 zeroext) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca i16, align 2
  %5 = alloca %struct.Fax3DecodeState*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store i16 %1, i16* %4, align 2
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 37
  %8 = load i8*, i8** %7, align 8
  %9 = bitcast i8* %8 to %struct.Fax3BaseState*
  %10 = bitcast %struct.Fax3BaseState* %9 to %struct.Fax3DecodeState*
  store %struct.Fax3DecodeState* %10, %struct.Fax3DecodeState** %5, align 8
  %11 = load i16, i16* %4, align 2
  %12 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %5, align 8
  %13 = icmp ne %struct.Fax3DecodeState* %12, null
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %2
  br label %18

; <label>:15:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax3PreDecode, i64 0, i64 2)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax3PreDecode, i64 0, i64 2)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.40, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 160, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__PRETTY_FUNCTION__.Fax3PreDecode, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %18

; <label>:18:                                     ; preds = %17, %14
  %19 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %5, align 8
  %20 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %19, i32 0, i32 3
  store i32 0, i32* %20, align 4
  %21 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %5, align 8
  %22 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %21, i32 0, i32 2
  store i32 0, i32* %22, align 8
  %23 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %5, align 8
  %24 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %23, i32 0, i32 4
  store i32 0, i32* %24, align 8
  %25 = load %struct.tiff*, %struct.tiff** %3, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %25, i32 0, i32 6
  %27 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %26, i32 0, i32 13
  %28 = load i16, i16* %27, align 2
  %29 = zext i16 %28 to i32
  %30 = icmp ne i32 %29, 2
  %31 = zext i1 %30 to i32
  %32 = call i8* @TIFFGetBitRevTable(i32 %31)
  %33 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %5, align 8
  %34 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %33, i32 0, i32 1
  store i8* %32, i8** %34, align 8
  %35 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %5, align 8
  %36 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %35, i32 0, i32 7
  %37 = load i32*, i32** %36, align 8
  %38 = icmp ne i32* %37, null
  br i1 %38, label %39, label %55

; <label>:39:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax3PreDecode, i64 0, i64 1)
  %40 = add i64 %pgocount1, 1
  store i64 %40, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax3PreDecode, i64 0, i64 1)
  %41 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %5, align 8
  %42 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %41, i32 0, i32 0
  %43 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %42, i32 0, i32 2
  %44 = load i32, i32* %43, align 8
  %45 = trunc i32 %44 to i16
  %46 = zext i16 %45 to i32
  %47 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %5, align 8
  %48 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %47, i32 0, i32 7
  %49 = load i32*, i32** %48, align 8
  %50 = getelementptr inbounds i32, i32* %49, i64 0
  store i32 %46, i32* %50, align 4
  %51 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %5, align 8
  %52 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %51, i32 0, i32 7
  %53 = load i32*, i32** %52, align 8
  %54 = getelementptr inbounds i32, i32* %53, i64 1
  store i32 0, i32* %54, align 4
  br label %55

; <label>:55:                                     ; preds = %39, %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax3PreDecode, i64 0, i64 0)
  %56 = add i64 %pgocount2, 1
  store i64 %56, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax3PreDecode, i64 0, i64 0)
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3Decode1D(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca %struct.Fax3DecodeState*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i32*, align 8
  %19 = alloca i32*, align 8
  %20 = alloca i32, align 4
  %21 = alloca i8*, align 8
  %22 = alloca %struct.TIFFFaxTabEnt*, align 8
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %23 = load %struct.tiff*, %struct.tiff** %6, align 8
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %23, i32 0, i32 37
  %25 = load i8*, i8** %24, align 8
  %26 = bitcast i8* %25 to %struct.Fax3BaseState*
  %27 = bitcast %struct.Fax3BaseState* %26 to %struct.Fax3DecodeState*
  store %struct.Fax3DecodeState* %27, %struct.Fax3DecodeState** %10, align 8
  %28 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %29 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %28, i32 0, i32 0
  %30 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %29, i32 0, i32 2
  %31 = load i32, i32* %30, align 8
  store i32 %31, i32* %12, align 4
  %32 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %33 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %32, i32 0, i32 1
  %34 = load i8*, i8** %33, align 8
  store i8* %34, i8** %21, align 8
  %35 = load i16, i16* %9, align 2
  br label %36

; <label>:36:                                     ; preds = %4
  %37 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %38 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %37, i32 0, i32 2
  %39 = load i32, i32* %38, align 8
  store i32 %39, i32* %13, align 4
  %40 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %41 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %40, i32 0, i32 3
  %42 = load i32, i32* %41, align 4
  store i32 %42, i32* %14, align 4
  %43 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %44 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %43, i32 0, i32 4
  %45 = load i32, i32* %44, align 8
  store i32 %45, i32* %20, align 4
  %46 = load %struct.tiff*, %struct.tiff** %6, align 8
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %46, i32 0, i32 42
  %48 = load i8*, i8** %47, align 8
  store i8* %48, i8** %16, align 8
  %49 = load i8*, i8** %16, align 8
  %50 = load %struct.tiff*, %struct.tiff** %6, align 8
  %51 = getelementptr inbounds %struct.tiff, %struct.tiff* %50, i32 0, i32 43
  %52 = load i32, i32* %51, align 8
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8* %49, i64 %53
  store i8* %54, i8** %17, align 8
  br label %55

; <label>:55:                                     ; preds = %36
  %56 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %57 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %56, i32 0, i32 8
  %58 = load i32*, i32** %57, align 8
  store i32* %58, i32** %19, align 8
  br label %59

; <label>:59:                                     ; preds = %721, %55
  %60 = load i32, i32* %8, align 4
  %61 = sext i32 %60 to i64
  %62 = icmp sgt i64 %61, 0
  br i1 %62, label %63, label %871

; <label>:63:                                     ; preds = %59
  store i32 0, i32* %11, align 4
  store i32 0, i32* %15, align 4
  %64 = load i32*, i32** %19, align 8
  store i32* %64, i32** %18, align 8
  br label %65

; <label>:65:                                     ; preds = %63
  %66 = load i32, i32* %20, align 4
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %142

; <label>:68:                                     ; preds = %65
  br label %69

; <label>:69:                                     ; preds = %139, %68
  br label %70

; <label>:70:                                     ; preds = %69
  %71 = load i32, i32* %14, align 4
  %72 = icmp slt i32 %71, 11
  br i1 %72, label %73, label %126

; <label>:73:                                     ; preds = %70
  %74 = load i8*, i8** %16, align 8
  %75 = load i8*, i8** %17, align 8
  %76 = icmp uge i8* %74, %75
  br i1 %76, label %77, label %84

; <label>:77:                                     ; preds = %73
  %78 = load i32, i32* %14, align 4
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %82

; <label>:80:                                     ; preds = %77
  %pgocount = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 38)
  %81 = add i64 %pgocount, 1
  store i64 %81, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 38)
  br label %722

; <label>:82:                                     ; preds = %77
  %pgocount2 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 16)
  %83 = add i64 %pgocount2, 1
  store i64 %83, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 16)
  store i32 11, i32* %14, align 4
  br label %125

; <label>:84:                                     ; preds = %73
  %85 = load i8*, i8** %21, align 8
  %86 = load i8*, i8** %16, align 8
  %87 = getelementptr inbounds i8, i8* %86, i32 1
  store i8* %87, i8** %16, align 8
  %88 = load i8, i8* %86, align 1
  %89 = zext i8 %88 to i64
  %90 = getelementptr inbounds i8, i8* %85, i64 %89
  %91 = load i8, i8* %90, align 1
  %92 = zext i8 %91 to i32
  %93 = load i32, i32* %14, align 4
  %94 = shl i32 %92, %93
  %95 = load i32, i32* %13, align 4
  %96 = or i32 %95, %94
  store i32 %96, i32* %13, align 4
  %97 = load i32, i32* %14, align 4
  %98 = add nsw i32 %97, 8
  store i32 %98, i32* %14, align 4
  %99 = icmp slt i32 %98, 11
  br i1 %99, label %100, label %123

; <label>:100:                                    ; preds = %84
  %101 = load i8*, i8** %16, align 8
  %102 = load i8*, i8** %17, align 8
  %103 = icmp uge i8* %101, %102
  br i1 %103, label %104, label %106

; <label>:104:                                    ; preds = %100
  %pgocount3 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 23)
  %105 = add i64 %pgocount3, 1
  store i64 %105, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 23)
  store i32 11, i32* %14, align 4
  br label %122

; <label>:106:                                    ; preds = %100
  %pgocount4 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 24)
  %107 = add i64 %pgocount4, 1
  store i64 %107, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 24)
  %108 = load i8*, i8** %21, align 8
  %109 = load i8*, i8** %16, align 8
  %110 = getelementptr inbounds i8, i8* %109, i32 1
  store i8* %110, i8** %16, align 8
  %111 = load i8, i8* %109, align 1
  %112 = zext i8 %111 to i64
  %113 = getelementptr inbounds i8, i8* %108, i64 %112
  %114 = load i8, i8* %113, align 1
  %115 = zext i8 %114 to i32
  %116 = load i32, i32* %14, align 4
  %117 = shl i32 %115, %116
  %118 = load i32, i32* %13, align 4
  %119 = or i32 %118, %117
  store i32 %119, i32* %13, align 4
  %120 = load i32, i32* %14, align 4
  %121 = add nsw i32 %120, 8
  store i32 %121, i32* %14, align 4
  br label %122

; <label>:122:                                    ; preds = %106, %104
  br label %123

; <label>:123:                                    ; preds = %122, %84
  %pgocount5 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 15)
  %124 = add i64 %pgocount5, 1
  store i64 %124, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 15)
  br label %125

; <label>:125:                                    ; preds = %123, %82
  br label %126

; <label>:126:                                    ; preds = %125, %70
  br label %127

; <label>:127:                                    ; preds = %126
  %128 = load i32, i32* %13, align 4
  %129 = and i32 %128, 2047
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %131, label %132

; <label>:131:                                    ; preds = %127
  br label %140

; <label>:132:                                    ; preds = %127
  %pgocount6 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 5)
  %133 = add i64 %pgocount6, 1
  store i64 %133, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 5)
  br label %134

; <label>:134:                                    ; preds = %132
  %135 = load i32, i32* %14, align 4
  %136 = sub nsw i32 %135, 1
  store i32 %136, i32* %14, align 4
  %137 = load i32, i32* %13, align 4
  %138 = lshr i32 %137, 1
  store i32 %138, i32* %13, align 4
  br label %139

; <label>:139:                                    ; preds = %134
  br label %69

; <label>:140:                                    ; preds = %131
  %pgocount7 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 29)
  %141 = add i64 %pgocount7, 1
  store i64 %141, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 29)
  br label %142

; <label>:142:                                    ; preds = %140, %65
  br label %143

; <label>:143:                                    ; preds = %188, %142
  br label %144

; <label>:144:                                    ; preds = %143
  %145 = load i32, i32* %14, align 4
  %146 = icmp slt i32 %145, 8
  br i1 %146, label %147, label %175

; <label>:147:                                    ; preds = %144
  %148 = load i8*, i8** %16, align 8
  %149 = load i8*, i8** %17, align 8
  %150 = icmp uge i8* %148, %149
  br i1 %150, label %151, label %158

; <label>:151:                                    ; preds = %147
  %152 = load i32, i32* %14, align 4
  %153 = icmp eq i32 %152, 0
  br i1 %153, label %154, label %156

; <label>:154:                                    ; preds = %151
  %pgocount8 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 32)
  %155 = add i64 %pgocount8, 1
  store i64 %155, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 32)
  br label %722

; <label>:156:                                    ; preds = %151
  %pgocount9 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 8)
  %157 = add i64 %pgocount9, 1
  store i64 %157, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 8)
  store i32 8, i32* %14, align 4
  br label %174

; <label>:158:                                    ; preds = %147
  %pgocount10 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 7)
  %159 = add i64 %pgocount10, 1
  store i64 %159, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 7)
  %160 = load i8*, i8** %21, align 8
  %161 = load i8*, i8** %16, align 8
  %162 = getelementptr inbounds i8, i8* %161, i32 1
  store i8* %162, i8** %16, align 8
  %163 = load i8, i8* %161, align 1
  %164 = zext i8 %163 to i64
  %165 = getelementptr inbounds i8, i8* %160, i64 %164
  %166 = load i8, i8* %165, align 1
  %167 = zext i8 %166 to i32
  %168 = load i32, i32* %14, align 4
  %169 = shl i32 %167, %168
  %170 = load i32, i32* %13, align 4
  %171 = or i32 %170, %169
  store i32 %171, i32* %13, align 4
  %172 = load i32, i32* %14, align 4
  %173 = add nsw i32 %172, 8
  store i32 %173, i32* %14, align 4
  br label %174

; <label>:174:                                    ; preds = %158, %156
  br label %175

; <label>:175:                                    ; preds = %174, %144
  br label %176

; <label>:176:                                    ; preds = %175
  %177 = load i32, i32* %13, align 4
  %178 = and i32 %177, 255
  %179 = icmp ne i32 %178, 0
  br i1 %179, label %180, label %181

; <label>:180:                                    ; preds = %176
  br label %189

; <label>:181:                                    ; preds = %176
  %pgocount11 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 2)
  %182 = add i64 %pgocount11, 1
  store i64 %182, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 2)
  br label %183

; <label>:183:                                    ; preds = %181
  %184 = load i32, i32* %14, align 4
  %185 = sub nsw i32 %184, 8
  store i32 %185, i32* %14, align 4
  %186 = load i32, i32* %13, align 4
  %187 = lshr i32 %186, 8
  store i32 %187, i32* %13, align 4
  br label %188

; <label>:188:                                    ; preds = %183
  br label %143

; <label>:189:                                    ; preds = %180
  br label %190

; <label>:190:                                    ; preds = %201, %189
  %191 = load i32, i32* %13, align 4
  %192 = and i32 %191, 1
  %193 = icmp eq i32 %192, 0
  br i1 %193, label %194, label %202

; <label>:194:                                    ; preds = %190
  %pgocount12 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 3)
  %195 = add i64 %pgocount12, 1
  store i64 %195, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 3)
  br label %196

; <label>:196:                                    ; preds = %194
  %197 = load i32, i32* %14, align 4
  %198 = sub nsw i32 %197, 1
  store i32 %198, i32* %14, align 4
  %199 = load i32, i32* %13, align 4
  %200 = lshr i32 %199, 1
  store i32 %200, i32* %13, align 4
  br label %201

; <label>:201:                                    ; preds = %196
  br label %190

; <label>:202:                                    ; preds = %190
  br label %203

; <label>:203:                                    ; preds = %202
  %204 = load i32, i32* %14, align 4
  %205 = sub nsw i32 %204, 1
  store i32 %205, i32* %14, align 4
  %206 = load i32, i32* %13, align 4
  %207 = lshr i32 %206, 1
  store i32 %207, i32* %13, align 4
  br label %208

; <label>:208:                                    ; preds = %203
  store i32 0, i32* %20, align 4
  br label %209

; <label>:209:                                    ; preds = %208
  br label %210

; <label>:210:                                    ; preds = %209
  br label %211

; <label>:211:                                    ; preds = %461, %210
  br label %212

; <label>:212:                                    ; preds = %328, %211
  br label %213

; <label>:213:                                    ; preds = %212
  br label %214

; <label>:214:                                    ; preds = %213
  %215 = load i32, i32* %14, align 4
  %216 = icmp slt i32 %215, 12
  br i1 %216, label %217, label %270

; <label>:217:                                    ; preds = %214
  %218 = load i8*, i8** %16, align 8
  %219 = load i8*, i8** %17, align 8
  %220 = icmp uge i8* %218, %219
  br i1 %220, label %221, label %228

; <label>:221:                                    ; preds = %217
  %222 = load i32, i32* %14, align 4
  %223 = icmp eq i32 %222, 0
  br i1 %223, label %224, label %226

; <label>:224:                                    ; preds = %221
  %pgocount13 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 34)
  %225 = add i64 %pgocount13, 1
  store i64 %225, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 34)
  br label %463

; <label>:226:                                    ; preds = %221
  %pgocount14 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 11)
  %227 = add i64 %pgocount14, 1
  store i64 %227, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 11)
  store i32 12, i32* %14, align 4
  br label %269

; <label>:228:                                    ; preds = %217
  %229 = load i8*, i8** %21, align 8
  %230 = load i8*, i8** %16, align 8
  %231 = getelementptr inbounds i8, i8* %230, i32 1
  store i8* %231, i8** %16, align 8
  %232 = load i8, i8* %230, align 1
  %233 = zext i8 %232 to i64
  %234 = getelementptr inbounds i8, i8* %229, i64 %233
  %235 = load i8, i8* %234, align 1
  %236 = zext i8 %235 to i32
  %237 = load i32, i32* %14, align 4
  %238 = shl i32 %236, %237
  %239 = load i32, i32* %13, align 4
  %240 = or i32 %239, %238
  store i32 %240, i32* %13, align 4
  %241 = load i32, i32* %14, align 4
  %242 = add nsw i32 %241, 8
  store i32 %242, i32* %14, align 4
  %243 = icmp slt i32 %242, 12
  br i1 %243, label %244, label %267

; <label>:244:                                    ; preds = %228
  %245 = load i8*, i8** %16, align 8
  %246 = load i8*, i8** %17, align 8
  %247 = icmp uge i8* %245, %246
  br i1 %247, label %248, label %250

; <label>:248:                                    ; preds = %244
  %pgocount15 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 20)
  %249 = add i64 %pgocount15, 1
  store i64 %249, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 20)
  store i32 12, i32* %14, align 4
  br label %266

; <label>:250:                                    ; preds = %244
  %pgocount16 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 21)
  %251 = add i64 %pgocount16, 1
  store i64 %251, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 21)
  %252 = load i8*, i8** %21, align 8
  %253 = load i8*, i8** %16, align 8
  %254 = getelementptr inbounds i8, i8* %253, i32 1
  store i8* %254, i8** %16, align 8
  %255 = load i8, i8* %253, align 1
  %256 = zext i8 %255 to i64
  %257 = getelementptr inbounds i8, i8* %252, i64 %256
  %258 = load i8, i8* %257, align 1
  %259 = zext i8 %258 to i32
  %260 = load i32, i32* %14, align 4
  %261 = shl i32 %259, %260
  %262 = load i32, i32* %13, align 4
  %263 = or i32 %262, %261
  store i32 %263, i32* %13, align 4
  %264 = load i32, i32* %14, align 4
  %265 = add nsw i32 %264, 8
  store i32 %265, i32* %14, align 4
  br label %266

; <label>:266:                                    ; preds = %250, %248
  br label %267

; <label>:267:                                    ; preds = %266, %228
  %pgocount17 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 9)
  %268 = add i64 %pgocount17, 1
  store i64 %268, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 9)
  br label %269

; <label>:269:                                    ; preds = %267, %226
  br label %270

; <label>:270:                                    ; preds = %269, %214
  br label %271

; <label>:271:                                    ; preds = %270
  %272 = load i32, i32* %13, align 4
  %273 = and i32 %272, 4095
  %274 = zext i32 %273 to i64
  %275 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* getelementptr inbounds ([0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i32 0, i32 0), i64 %274
  store %struct.TIFFFaxTabEnt* %275, %struct.TIFFFaxTabEnt** %22, align 8
  br label %276

; <label>:276:                                    ; preds = %271
  %277 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %278 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %277, i32 0, i32 1
  %279 = load i8, i8* %278, align 1
  %280 = zext i8 %279 to i32
  %281 = load i32, i32* %14, align 4
  %282 = sub nsw i32 %281, %280
  store i32 %282, i32* %14, align 4
  %283 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %284 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %283, i32 0, i32 1
  %285 = load i8, i8* %284, align 1
  %286 = zext i8 %285 to i32
  %287 = load i32, i32* %13, align 4
  %288 = lshr i32 %287, %286
  store i32 %288, i32* %13, align 4
  br label %289

; <label>:289:                                    ; preds = %276
  br label %290

; <label>:290:                                    ; preds = %289
  %291 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %292 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %291, i32 0, i32 0
  %293 = load i8, i8* %292, align 4
  %294 = zext i8 %293 to i32
  switch i32 %294, label %324 [
    i32 12, label %296
    i32 7, label %298
    i32 9, label %._crit_edge
    i32 11, label %313
  ]

._crit_edge:                                      ; preds = %290
  %pgocount18 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 0)
  %295 = add i64 %pgocount18, 1
  store i64 %295, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 0)
  br label %313

; <label>:296:                                    ; preds = %290
  %pgocount19 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 30)
  %297 = add i64 %pgocount19, 1
  store i64 %297, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 30)
  store i32 1, i32* %20, align 4
  br label %578

; <label>:298:                                    ; preds = %290
  br label %299

; <label>:299:                                    ; preds = %298
  %300 = load i32, i32* %15, align 4
  %301 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %302 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %301, i32 0, i32 2
  %303 = load i32, i32* %302, align 4
  %304 = add i32 %300, %303
  %305 = load i32*, i32** %18, align 8
  %306 = getelementptr inbounds i32, i32* %305, i32 1
  store i32* %306, i32** %18, align 8
  store i32 %304, i32* %305, align 4
  %307 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %308 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %307, i32 0, i32 2
  %309 = load i32, i32* %308, align 4
  %310 = load i32, i32* %11, align 4
  %311 = add i32 %310, %309
  store i32 %311, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %312

; <label>:312:                                    ; preds = %299
  br label %330

; <label>:313:                                    ; preds = %._crit_edge, %290
  %314 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %315 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %314, i32 0, i32 2
  %316 = load i32, i32* %315, align 4
  %317 = load i32, i32* %11, align 4
  %318 = add i32 %317, %316
  store i32 %318, i32* %11, align 4
  %319 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %320 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %319, i32 0, i32 2
  %321 = load i32, i32* %320, align 4
  %322 = load i32, i32* %15, align 4
  %323 = add i32 %322, %321
  store i32 %323, i32* %15, align 4
  br label %328

; <label>:324:                                    ; preds = %290
  %pgocount20 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 31)
  %325 = add i64 %pgocount20, 1
  store i64 %325, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 31)
  %326 = load %struct.tiff*, %struct.tiff** %6, align 8
  %327 = load i32, i32* %11, align 4
  call void @Fax3Unexpected(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode1D.module, i32 0, i32 0), %struct.tiff* %326, i32 %327)
  br label %578

; <label>:328:                                    ; preds = %313
  %pgocount21 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 4)
  %329 = add i64 %pgocount21, 1
  store i64 %329, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 4)
  br label %212

; <label>:330:                                    ; preds = %312
  %331 = load i32, i32* %11, align 4
  %332 = load i32, i32* %12, align 4
  %333 = icmp sge i32 %331, %332
  br i1 %333, label %334, label %336

; <label>:334:                                    ; preds = %330
  %pgocount22 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 57)
  %335 = add i64 %pgocount22, 1
  store i64 %335, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 57)
  br label %578

; <label>:336:                                    ; preds = %330
  br label %337

; <label>:337:                                    ; preds = %453, %336
  br label %338

; <label>:338:                                    ; preds = %337
  br label %339

; <label>:339:                                    ; preds = %338
  %340 = load i32, i32* %14, align 4
  %341 = icmp slt i32 %340, 13
  br i1 %341, label %342, label %395

; <label>:342:                                    ; preds = %339
  %343 = load i8*, i8** %16, align 8
  %344 = load i8*, i8** %17, align 8
  %345 = icmp uge i8* %343, %344
  br i1 %345, label %346, label %353

; <label>:346:                                    ; preds = %342
  %347 = load i32, i32* %14, align 4
  %348 = icmp eq i32 %347, 0
  br i1 %348, label %349, label %351

; <label>:349:                                    ; preds = %346
  %pgocount23 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 49)
  %350 = add i64 %pgocount23, 1
  store i64 %350, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 49)
  br label %463

; <label>:351:                                    ; preds = %346
  %pgocount24 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 22)
  %352 = add i64 %pgocount24, 1
  store i64 %352, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 22)
  store i32 13, i32* %14, align 4
  br label %394

; <label>:353:                                    ; preds = %342
  %354 = load i8*, i8** %21, align 8
  %355 = load i8*, i8** %16, align 8
  %356 = getelementptr inbounds i8, i8* %355, i32 1
  store i8* %356, i8** %16, align 8
  %357 = load i8, i8* %355, align 1
  %358 = zext i8 %357 to i64
  %359 = getelementptr inbounds i8, i8* %354, i64 %358
  %360 = load i8, i8* %359, align 1
  %361 = zext i8 %360 to i32
  %362 = load i32, i32* %14, align 4
  %363 = shl i32 %361, %362
  %364 = load i32, i32* %13, align 4
  %365 = or i32 %364, %363
  store i32 %365, i32* %13, align 4
  %366 = load i32, i32* %14, align 4
  %367 = add nsw i32 %366, 8
  store i32 %367, i32* %14, align 4
  %368 = icmp slt i32 %367, 13
  br i1 %368, label %369, label %392

; <label>:369:                                    ; preds = %353
  %370 = load i8*, i8** %16, align 8
  %371 = load i8*, i8** %17, align 8
  %372 = icmp uge i8* %370, %371
  br i1 %372, label %373, label %375

; <label>:373:                                    ; preds = %369
  %pgocount25 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 27)
  %374 = add i64 %pgocount25, 1
  store i64 %374, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 27)
  store i32 13, i32* %14, align 4
  br label %391

; <label>:375:                                    ; preds = %369
  %pgocount26 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 28)
  %376 = add i64 %pgocount26, 1
  store i64 %376, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 28)
  %377 = load i8*, i8** %21, align 8
  %378 = load i8*, i8** %16, align 8
  %379 = getelementptr inbounds i8, i8* %378, i32 1
  store i8* %379, i8** %16, align 8
  %380 = load i8, i8* %378, align 1
  %381 = zext i8 %380 to i64
  %382 = getelementptr inbounds i8, i8* %377, i64 %381
  %383 = load i8, i8* %382, align 1
  %384 = zext i8 %383 to i32
  %385 = load i32, i32* %14, align 4
  %386 = shl i32 %384, %385
  %387 = load i32, i32* %13, align 4
  %388 = or i32 %387, %386
  store i32 %388, i32* %13, align 4
  %389 = load i32, i32* %14, align 4
  %390 = add nsw i32 %389, 8
  store i32 %390, i32* %14, align 4
  br label %391

; <label>:391:                                    ; preds = %375, %373
  br label %392

; <label>:392:                                    ; preds = %391, %353
  %pgocount27 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 19)
  %393 = add i64 %pgocount27, 1
  store i64 %393, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 19)
  br label %394

; <label>:394:                                    ; preds = %392, %351
  br label %395

; <label>:395:                                    ; preds = %394, %339
  br label %396

; <label>:396:                                    ; preds = %395
  %397 = load i32, i32* %13, align 4
  %398 = and i32 %397, 8191
  %399 = zext i32 %398 to i64
  %400 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* getelementptr inbounds ([0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i32 0, i32 0), i64 %399
  store %struct.TIFFFaxTabEnt* %400, %struct.TIFFFaxTabEnt** %22, align 8
  br label %401

; <label>:401:                                    ; preds = %396
  %402 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %403 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %402, i32 0, i32 1
  %404 = load i8, i8* %403, align 1
  %405 = zext i8 %404 to i32
  %406 = load i32, i32* %14, align 4
  %407 = sub nsw i32 %406, %405
  store i32 %407, i32* %14, align 4
  %408 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %409 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %408, i32 0, i32 1
  %410 = load i8, i8* %409, align 1
  %411 = zext i8 %410 to i32
  %412 = load i32, i32* %13, align 4
  %413 = lshr i32 %412, %411
  store i32 %413, i32* %13, align 4
  br label %414

; <label>:414:                                    ; preds = %401
  br label %415

; <label>:415:                                    ; preds = %414
  %416 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %417 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %416, i32 0, i32 0
  %418 = load i8, i8* %417, align 4
  %419 = zext i8 %418 to i32
  switch i32 %419, label %449 [
    i32 12, label %421
    i32 8, label %423
    i32 10, label %._crit_edge1
    i32 11, label %438
  ]

._crit_edge1:                                     ; preds = %415
  %pgocount28 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 1)
  %420 = add i64 %pgocount28, 1
  store i64 %420, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 1)
  br label %438

; <label>:421:                                    ; preds = %415
  %pgocount29 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 43)
  %422 = add i64 %pgocount29, 1
  store i64 %422, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 43)
  store i32 1, i32* %20, align 4
  br label %578

; <label>:423:                                    ; preds = %415
  br label %424

; <label>:424:                                    ; preds = %423
  %425 = load i32, i32* %15, align 4
  %426 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %427 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %426, i32 0, i32 2
  %428 = load i32, i32* %427, align 4
  %429 = add i32 %425, %428
  %430 = load i32*, i32** %18, align 8
  %431 = getelementptr inbounds i32, i32* %430, i32 1
  store i32* %431, i32** %18, align 8
  store i32 %429, i32* %430, align 4
  %432 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %433 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %432, i32 0, i32 2
  %434 = load i32, i32* %433, align 4
  %435 = load i32, i32* %11, align 4
  %436 = add i32 %435, %434
  store i32 %436, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %437

; <label>:437:                                    ; preds = %424
  br label %455

; <label>:438:                                    ; preds = %._crit_edge1, %415
  %439 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %440 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %439, i32 0, i32 2
  %441 = load i32, i32* %440, align 4
  %442 = load i32, i32* %11, align 4
  %443 = add i32 %442, %441
  store i32 %443, i32* %11, align 4
  %444 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %445 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %444, i32 0, i32 2
  %446 = load i32, i32* %445, align 4
  %447 = load i32, i32* %15, align 4
  %448 = add i32 %447, %446
  store i32 %448, i32* %15, align 4
  br label %453

; <label>:449:                                    ; preds = %415
  %pgocount30 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 44)
  %450 = add i64 %pgocount30, 1
  store i64 %450, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 44)
  %451 = load %struct.tiff*, %struct.tiff** %6, align 8
  %452 = load i32, i32* %11, align 4
  call void @Fax3Unexpected(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode1D.module, i32 0, i32 0), %struct.tiff* %451, i32 %452)
  br label %578

; <label>:453:                                    ; preds = %438
  %pgocount31 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 10)
  %454 = add i64 %pgocount31, 1
  store i64 %454, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 10)
  br label %337

; <label>:455:                                    ; preds = %437
  %456 = load i32, i32* %11, align 4
  %457 = load i32, i32* %12, align 4
  %458 = icmp sge i32 %456, %457
  br i1 %458, label %459, label %461

; <label>:459:                                    ; preds = %455
  %pgocount32 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 58)
  %460 = add i64 %pgocount32, 1
  store i64 %460, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 58)
  br label %578

; <label>:461:                                    ; preds = %455
  %pgocount33 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 45)
  %462 = add i64 %pgocount33, 1
  store i64 %462, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 45)
  br label %211

; <label>:463:                                    ; preds = %349, %224
  %464 = load %struct.tiff*, %struct.tiff** %6, align 8
  %465 = load i32, i32* %11, align 4
  call void @Fax3PrematureEOF(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode1D.module, i32 0, i32 0), %struct.tiff* %464, i32 %465)
  br label %466

; <label>:466:                                    ; preds = %463
  %467 = load i32, i32* %15, align 4
  %468 = icmp ne i32 %467, 0
  br i1 %468, label %469, label %479

; <label>:469:                                    ; preds = %466
  br label %470

; <label>:470:                                    ; preds = %469
  %471 = load i32, i32* %15, align 4
  %472 = add nsw i32 %471, 0
  %473 = load i32*, i32** %18, align 8
  %474 = getelementptr inbounds i32, i32* %473, i32 1
  store i32* %474, i32** %18, align 8
  store i32 %472, i32* %473, align 4
  %475 = load i32, i32* %11, align 4
  %476 = add nsw i32 %475, 0
  store i32 %476, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %477

; <label>:477:                                    ; preds = %470
  %pgocount34 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 37)
  %478 = add i64 %pgocount34, 1
  store i64 %478, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 37)
  br label %479

; <label>:479:                                    ; preds = %477, %466
  %480 = load i32, i32* %11, align 4
  %481 = load i32, i32* %12, align 4
  %482 = icmp ne i32 %480, %481
  br i1 %482, label %483, label %576

; <label>:483:                                    ; preds = %479
  %484 = load %struct.tiff*, %struct.tiff** %6, align 8
  %485 = load i32, i32* %11, align 4
  %486 = load i32, i32* %12, align 4
  call void @Fax3BadLength(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode1D.module, i32 0, i32 0), %struct.tiff* %484, i32 %485, i32 %486)
  br label %487

; <label>:487:                                    ; preds = %498, %483
  %488 = load i32, i32* %11, align 4
  %489 = load i32, i32* %12, align 4
  %490 = icmp sgt i32 %488, %489
  br i1 %490, label %491, label %496

; <label>:491:                                    ; preds = %487
  %pgocount35 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 18)
  %492 = add i64 %pgocount35, 1
  store i64 %492, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 18)
  %493 = load i32*, i32** %18, align 8
  %494 = load i32*, i32** %19, align 8
  %495 = icmp ugt i32* %493, %494
  br label %496

; <label>:496:                                    ; preds = %491, %487
  %497 = phi i1 [ false, %487 ], [ %495, %491 ]
  br i1 %497, label %498, label %505

; <label>:498:                                    ; preds = %496
  %pgocount36 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 14)
  %499 = add i64 %pgocount36, 1
  store i64 %499, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 14)
  %500 = load i32*, i32** %18, align 8
  %501 = getelementptr inbounds i32, i32* %500, i32 -1
  store i32* %501, i32** %18, align 8
  %502 = load i32, i32* %501, align 4
  %503 = load i32, i32* %11, align 4
  %504 = sub i32 %503, %502
  store i32 %504, i32* %11, align 4
  br label %487

; <label>:505:                                    ; preds = %496
  %506 = load i32, i32* %11, align 4
  %507 = load i32, i32* %12, align 4
  %508 = icmp slt i32 %506, %507
  br i1 %508, label %509, label %549

; <label>:509:                                    ; preds = %505
  %510 = load i32, i32* %11, align 4
  %511 = icmp slt i32 %510, 0
  br i1 %511, label %512, label %514

; <label>:512:                                    ; preds = %509
  %pgocount37 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 56)
  %513 = add i64 %pgocount37, 1
  store i64 %513, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 56)
  store i32 0, i32* %11, align 4
  br label %514

; <label>:514:                                    ; preds = %512, %509
  %515 = load i32*, i32** %18, align 8
  %516 = load i32*, i32** %19, align 8
  %517 = ptrtoint i32* %515 to i64
  %518 = ptrtoint i32* %516 to i64
  %519 = sub i64 %517, %518
  %520 = sdiv exact i64 %519, 4
  %521 = and i64 %520, 1
  %522 = icmp ne i64 %521, 0
  br i1 %522, label %523, label %533

; <label>:523:                                    ; preds = %514
  br label %524

; <label>:524:                                    ; preds = %523
  %525 = load i32, i32* %15, align 4
  %526 = add nsw i32 %525, 0
  %527 = load i32*, i32** %18, align 8
  %528 = getelementptr inbounds i32, i32* %527, i32 1
  store i32* %528, i32** %18, align 8
  store i32 %526, i32* %527, align 4
  %529 = load i32, i32* %11, align 4
  %530 = add nsw i32 %529, 0
  store i32 %530, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %531

; <label>:531:                                    ; preds = %524
  %pgocount38 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 53)
  %532 = add i64 %pgocount38, 1
  store i64 %532, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 53)
  br label %533

; <label>:533:                                    ; preds = %531, %514
  br label %534

; <label>:534:                                    ; preds = %533
  %535 = load i32, i32* %15, align 4
  %536 = load i32, i32* %12, align 4
  %537 = load i32, i32* %11, align 4
  %538 = sub nsw i32 %536, %537
  %539 = add nsw i32 %535, %538
  %540 = load i32*, i32** %18, align 8
  %541 = getelementptr inbounds i32, i32* %540, i32 1
  store i32* %541, i32** %18, align 8
  store i32 %539, i32* %540, align 4
  %542 = load i32, i32* %12, align 4
  %543 = load i32, i32* %11, align 4
  %544 = sub nsw i32 %542, %543
  %545 = load i32, i32* %11, align 4
  %546 = add nsw i32 %545, %544
  store i32 %546, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %547

; <label>:547:                                    ; preds = %534
  %pgocount39 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 47)
  %548 = add i64 %pgocount39, 1
  store i64 %548, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 47)
  br label %575

; <label>:549:                                    ; preds = %505
  %550 = load i32, i32* %11, align 4
  %551 = load i32, i32* %12, align 4
  %552 = icmp sgt i32 %550, %551
  br i1 %552, label %553, label %573

; <label>:553:                                    ; preds = %549
  br label %554

; <label>:554:                                    ; preds = %553
  %555 = load i32, i32* %15, align 4
  %556 = load i32, i32* %12, align 4
  %557 = add nsw i32 %555, %556
  %558 = load i32*, i32** %18, align 8
  %559 = getelementptr inbounds i32, i32* %558, i32 1
  store i32* %559, i32** %18, align 8
  store i32 %557, i32* %558, align 4
  %560 = load i32, i32* %12, align 4
  %561 = load i32, i32* %11, align 4
  %562 = add nsw i32 %561, %560
  store i32 %562, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %563

; <label>:563:                                    ; preds = %554
  br label %564

; <label>:564:                                    ; preds = %563
  %565 = load i32, i32* %15, align 4
  %566 = add nsw i32 %565, 0
  %567 = load i32*, i32** %18, align 8
  %568 = getelementptr inbounds i32, i32* %567, i32 1
  store i32* %568, i32** %18, align 8
  store i32 %566, i32* %567, align 4
  %569 = load i32, i32* %11, align 4
  %570 = add nsw i32 %569, 0
  store i32 %570, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %571

; <label>:571:                                    ; preds = %564
  %pgocount40 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 54)
  %572 = add i64 %pgocount40, 1
  store i64 %572, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 54)
  br label %573

; <label>:573:                                    ; preds = %571, %549
  %pgocount41 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 48)
  %574 = add i64 %pgocount41, 1
  store i64 %574, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 48)
  br label %575

; <label>:575:                                    ; preds = %573, %547
  br label %576

; <label>:576:                                    ; preds = %575, %479
  br label %577

; <label>:577:                                    ; preds = %576
  br label %835

; <label>:578:                                    ; preds = %459, %449, %421, %334, %324, %296
  br label %579

; <label>:579:                                    ; preds = %578
  %580 = load i32, i32* %15, align 4
  %581 = icmp ne i32 %580, 0
  br i1 %581, label %582, label %592

; <label>:582:                                    ; preds = %579
  br label %583

; <label>:583:                                    ; preds = %582
  %584 = load i32, i32* %15, align 4
  %585 = add nsw i32 %584, 0
  %586 = load i32*, i32** %18, align 8
  %587 = getelementptr inbounds i32, i32* %586, i32 1
  store i32* %587, i32** %18, align 8
  store i32 %585, i32* %586, align 4
  %588 = load i32, i32* %11, align 4
  %589 = add nsw i32 %588, 0
  store i32 %589, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %590

; <label>:590:                                    ; preds = %583
  %pgocount42 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 25)
  %591 = add i64 %pgocount42, 1
  store i64 %591, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 25)
  br label %592

; <label>:592:                                    ; preds = %590, %579
  %593 = load i32, i32* %11, align 4
  %594 = load i32, i32* %12, align 4
  %595 = icmp ne i32 %593, %594
  br i1 %595, label %596, label %689

; <label>:596:                                    ; preds = %592
  %597 = load %struct.tiff*, %struct.tiff** %6, align 8
  %598 = load i32, i32* %11, align 4
  %599 = load i32, i32* %12, align 4
  call void @Fax3BadLength(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode1D.module, i32 0, i32 0), %struct.tiff* %597, i32 %598, i32 %599)
  br label %600

; <label>:600:                                    ; preds = %611, %596
  %601 = load i32, i32* %11, align 4
  %602 = load i32, i32* %12, align 4
  %603 = icmp sgt i32 %601, %602
  br i1 %603, label %604, label %609

; <label>:604:                                    ; preds = %600
  %pgocount43 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 12)
  %605 = add i64 %pgocount43, 1
  store i64 %605, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 12)
  %606 = load i32*, i32** %18, align 8
  %607 = load i32*, i32** %19, align 8
  %608 = icmp ugt i32* %606, %607
  br label %609

; <label>:609:                                    ; preds = %604, %600
  %610 = phi i1 [ false, %600 ], [ %608, %604 ]
  br i1 %610, label %611, label %618

; <label>:611:                                    ; preds = %609
  %pgocount44 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 6)
  %612 = add i64 %pgocount44, 1
  store i64 %612, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 6)
  %613 = load i32*, i32** %18, align 8
  %614 = getelementptr inbounds i32, i32* %613, i32 -1
  store i32* %614, i32** %18, align 8
  %615 = load i32, i32* %614, align 4
  %616 = load i32, i32* %11, align 4
  %617 = sub i32 %616, %615
  store i32 %617, i32* %11, align 4
  br label %600

; <label>:618:                                    ; preds = %609
  %619 = load i32, i32* %11, align 4
  %620 = load i32, i32* %12, align 4
  %621 = icmp slt i32 %619, %620
  br i1 %621, label %622, label %662

; <label>:622:                                    ; preds = %618
  %623 = load i32, i32* %11, align 4
  %624 = icmp slt i32 %623, 0
  br i1 %624, label %625, label %627

; <label>:625:                                    ; preds = %622
  %pgocount45 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 46)
  %626 = add i64 %pgocount45, 1
  store i64 %626, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 46)
  store i32 0, i32* %11, align 4
  br label %627

; <label>:627:                                    ; preds = %625, %622
  %628 = load i32*, i32** %18, align 8
  %629 = load i32*, i32** %19, align 8
  %630 = ptrtoint i32* %628 to i64
  %631 = ptrtoint i32* %629 to i64
  %632 = sub i64 %630, %631
  %633 = sdiv exact i64 %632, 4
  %634 = and i64 %633, 1
  %635 = icmp ne i64 %634, 0
  br i1 %635, label %636, label %646

; <label>:636:                                    ; preds = %627
  br label %637

; <label>:637:                                    ; preds = %636
  %638 = load i32, i32* %15, align 4
  %639 = add nsw i32 %638, 0
  %640 = load i32*, i32** %18, align 8
  %641 = getelementptr inbounds i32, i32* %640, i32 1
  store i32* %641, i32** %18, align 8
  store i32 %639, i32* %640, align 4
  %642 = load i32, i32* %11, align 4
  %643 = add nsw i32 %642, 0
  store i32 %643, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %644

; <label>:644:                                    ; preds = %637
  %pgocount46 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 39)
  %645 = add i64 %pgocount46, 1
  store i64 %645, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 39)
  br label %646

; <label>:646:                                    ; preds = %644, %627
  br label %647

; <label>:647:                                    ; preds = %646
  %648 = load i32, i32* %15, align 4
  %649 = load i32, i32* %12, align 4
  %650 = load i32, i32* %11, align 4
  %651 = sub nsw i32 %649, %650
  %652 = add nsw i32 %648, %651
  %653 = load i32*, i32** %18, align 8
  %654 = getelementptr inbounds i32, i32* %653, i32 1
  store i32* %654, i32** %18, align 8
  store i32 %652, i32* %653, align 4
  %655 = load i32, i32* %12, align 4
  %656 = load i32, i32* %11, align 4
  %657 = sub nsw i32 %655, %656
  %658 = load i32, i32* %11, align 4
  %659 = add nsw i32 %658, %657
  store i32 %659, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %660

; <label>:660:                                    ; preds = %647
  %pgocount47 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 35)
  %661 = add i64 %pgocount47, 1
  store i64 %661, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 35)
  br label %688

; <label>:662:                                    ; preds = %618
  %663 = load i32, i32* %11, align 4
  %664 = load i32, i32* %12, align 4
  %665 = icmp sgt i32 %663, %664
  br i1 %665, label %666, label %686

; <label>:666:                                    ; preds = %662
  br label %667

; <label>:667:                                    ; preds = %666
  %668 = load i32, i32* %15, align 4
  %669 = load i32, i32* %12, align 4
  %670 = add nsw i32 %668, %669
  %671 = load i32*, i32** %18, align 8
  %672 = getelementptr inbounds i32, i32* %671, i32 1
  store i32* %672, i32** %18, align 8
  store i32 %670, i32* %671, align 4
  %673 = load i32, i32* %12, align 4
  %674 = load i32, i32* %11, align 4
  %675 = add nsw i32 %674, %673
  store i32 %675, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %676

; <label>:676:                                    ; preds = %667
  br label %677

; <label>:677:                                    ; preds = %676
  %678 = load i32, i32* %15, align 4
  %679 = add nsw i32 %678, 0
  %680 = load i32*, i32** %18, align 8
  %681 = getelementptr inbounds i32, i32* %680, i32 1
  store i32* %681, i32** %18, align 8
  store i32 %679, i32* %680, align 4
  %682 = load i32, i32* %11, align 4
  %683 = add nsw i32 %682, 0
  store i32 %683, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %684

; <label>:684:                                    ; preds = %677
  %pgocount48 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 40)
  %685 = add i64 %pgocount48, 1
  store i64 %685, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 40)
  br label %686

; <label>:686:                                    ; preds = %684, %662
  %pgocount49 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 36)
  %687 = add i64 %pgocount49, 1
  store i64 %687, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 36)
  br label %688

; <label>:688:                                    ; preds = %686, %660
  br label %689

; <label>:689:                                    ; preds = %688, %592
  br label %690

; <label>:690:                                    ; preds = %689
  br label %691

; <label>:691:                                    ; preds = %690
  %692 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %693 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %692, i32 0, i32 5
  %694 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %693, align 8
  %695 = load i8*, i8** %7, align 8
  %696 = load i32*, i32** %19, align 8
  %697 = load i32*, i32** %18, align 8
  %698 = load i32, i32* %12, align 4
  %699 = ptrtoint void (i8*, i32*, i32*, i32)* %694 to i64
  call void @__llvm_profile_instrument_target(i64 %699, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3Decode1D to i8*), i32 0)
  call void %694(i8* %695, i32* %696, i32* %697, i32 %698)
  %700 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %701 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %700, i32 0, i32 0
  %702 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %701, i32 0, i32 1
  %703 = load i32, i32* %702, align 4
  %704 = load i8*, i8** %7, align 8
  %705 = zext i32 %703 to i64
  %706 = getelementptr inbounds i8, i8* %704, i64 %705
  store i8* %706, i8** %7, align 8
  %707 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %708 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %707, i32 0, i32 0
  %709 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %708, i32 0, i32 1
  %710 = load i32, i32* %709, align 4
  %711 = load i32, i32* %8, align 4
  %712 = sub i32 %711, %710
  store i32 %712, i32* %8, align 4
  %713 = load i32, i32* %8, align 4
  %714 = icmp ne i32 %713, 0
  br i1 %714, label %715, label %721

; <label>:715:                                    ; preds = %691
  %pgocount50 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 26)
  %716 = add i64 %pgocount50, 1
  store i64 %716, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 26)
  %717 = load %struct.tiff*, %struct.tiff** %6, align 8
  %718 = getelementptr inbounds %struct.tiff, %struct.tiff* %717, i32 0, i32 11
  %719 = load i32, i32* %718, align 8
  %720 = add i32 %719, 1
  store i32 %720, i32* %718, align 8
  br label %721

; <label>:721:                                    ; preds = %715, %691
  br label %59

; <label>:722:                                    ; preds = %154, %80
  br label %723

; <label>:723:                                    ; preds = %722
  %724 = load i32, i32* %15, align 4
  %725 = icmp ne i32 %724, 0
  br i1 %725, label %726, label %736

; <label>:726:                                    ; preds = %723
  br label %727

; <label>:727:                                    ; preds = %726
  %728 = load i32, i32* %15, align 4
  %729 = add nsw i32 %728, 0
  %730 = load i32*, i32** %18, align 8
  %731 = getelementptr inbounds i32, i32* %730, i32 1
  store i32* %731, i32** %18, align 8
  store i32 %729, i32* %730, align 4
  %732 = load i32, i32* %11, align 4
  %733 = add nsw i32 %732, 0
  store i32 %733, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %734

; <label>:734:                                    ; preds = %727
  %pgocount51 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 33)
  %735 = add i64 %pgocount51, 1
  store i64 %735, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 33)
  br label %736

; <label>:736:                                    ; preds = %734, %723
  %737 = load i32, i32* %11, align 4
  %738 = load i32, i32* %12, align 4
  %739 = icmp ne i32 %737, %738
  br i1 %739, label %740, label %833

; <label>:740:                                    ; preds = %736
  %741 = load %struct.tiff*, %struct.tiff** %6, align 8
  %742 = load i32, i32* %11, align 4
  %743 = load i32, i32* %12, align 4
  call void @Fax3BadLength(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode1D.module, i32 0, i32 0), %struct.tiff* %741, i32 %742, i32 %743)
  br label %744

; <label>:744:                                    ; preds = %755, %740
  %745 = load i32, i32* %11, align 4
  %746 = load i32, i32* %12, align 4
  %747 = icmp sgt i32 %745, %746
  br i1 %747, label %748, label %753

; <label>:748:                                    ; preds = %744
  %pgocount52 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 17)
  %749 = add i64 %pgocount52, 1
  store i64 %749, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 17)
  %750 = load i32*, i32** %18, align 8
  %751 = load i32*, i32** %19, align 8
  %752 = icmp ugt i32* %750, %751
  br label %753

; <label>:753:                                    ; preds = %748, %744
  %754 = phi i1 [ false, %744 ], [ %752, %748 ]
  br i1 %754, label %755, label %762

; <label>:755:                                    ; preds = %753
  %pgocount53 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 13)
  %756 = add i64 %pgocount53, 1
  store i64 %756, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 13)
  %757 = load i32*, i32** %18, align 8
  %758 = getelementptr inbounds i32, i32* %757, i32 -1
  store i32* %758, i32** %18, align 8
  %759 = load i32, i32* %758, align 4
  %760 = load i32, i32* %11, align 4
  %761 = sub i32 %760, %759
  store i32 %761, i32* %11, align 4
  br label %744

; <label>:762:                                    ; preds = %753
  %763 = load i32, i32* %11, align 4
  %764 = load i32, i32* %12, align 4
  %765 = icmp slt i32 %763, %764
  br i1 %765, label %766, label %806

; <label>:766:                                    ; preds = %762
  %767 = load i32, i32* %11, align 4
  %768 = icmp slt i32 %767, 0
  br i1 %768, label %769, label %771

; <label>:769:                                    ; preds = %766
  %pgocount54 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 55)
  %770 = add i64 %pgocount54, 1
  store i64 %770, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 55)
  store i32 0, i32* %11, align 4
  br label %771

; <label>:771:                                    ; preds = %769, %766
  %772 = load i32*, i32** %18, align 8
  %773 = load i32*, i32** %19, align 8
  %774 = ptrtoint i32* %772 to i64
  %775 = ptrtoint i32* %773 to i64
  %776 = sub i64 %774, %775
  %777 = sdiv exact i64 %776, 4
  %778 = and i64 %777, 1
  %779 = icmp ne i64 %778, 0
  br i1 %779, label %780, label %790

; <label>:780:                                    ; preds = %771
  br label %781

; <label>:781:                                    ; preds = %780
  %782 = load i32, i32* %15, align 4
  %783 = add nsw i32 %782, 0
  %784 = load i32*, i32** %18, align 8
  %785 = getelementptr inbounds i32, i32* %784, i32 1
  store i32* %785, i32** %18, align 8
  store i32 %783, i32* %784, align 4
  %786 = load i32, i32* %11, align 4
  %787 = add nsw i32 %786, 0
  store i32 %787, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %788

; <label>:788:                                    ; preds = %781
  %pgocount55 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 50)
  %789 = add i64 %pgocount55, 1
  store i64 %789, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 50)
  br label %790

; <label>:790:                                    ; preds = %788, %771
  br label %791

; <label>:791:                                    ; preds = %790
  %792 = load i32, i32* %15, align 4
  %793 = load i32, i32* %12, align 4
  %794 = load i32, i32* %11, align 4
  %795 = sub nsw i32 %793, %794
  %796 = add nsw i32 %792, %795
  %797 = load i32*, i32** %18, align 8
  %798 = getelementptr inbounds i32, i32* %797, i32 1
  store i32* %798, i32** %18, align 8
  store i32 %796, i32* %797, align 4
  %799 = load i32, i32* %12, align 4
  %800 = load i32, i32* %11, align 4
  %801 = sub nsw i32 %799, %800
  %802 = load i32, i32* %11, align 4
  %803 = add nsw i32 %802, %801
  store i32 %803, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %804

; <label>:804:                                    ; preds = %791
  %pgocount56 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 41)
  %805 = add i64 %pgocount56, 1
  store i64 %805, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 41)
  br label %832

; <label>:806:                                    ; preds = %762
  %807 = load i32, i32* %11, align 4
  %808 = load i32, i32* %12, align 4
  %809 = icmp sgt i32 %807, %808
  br i1 %809, label %810, label %830

; <label>:810:                                    ; preds = %806
  br label %811

; <label>:811:                                    ; preds = %810
  %812 = load i32, i32* %15, align 4
  %813 = load i32, i32* %12, align 4
  %814 = add nsw i32 %812, %813
  %815 = load i32*, i32** %18, align 8
  %816 = getelementptr inbounds i32, i32* %815, i32 1
  store i32* %816, i32** %18, align 8
  store i32 %814, i32* %815, align 4
  %817 = load i32, i32* %12, align 4
  %818 = load i32, i32* %11, align 4
  %819 = add nsw i32 %818, %817
  store i32 %819, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %820

; <label>:820:                                    ; preds = %811
  br label %821

; <label>:821:                                    ; preds = %820
  %822 = load i32, i32* %15, align 4
  %823 = add nsw i32 %822, 0
  %824 = load i32*, i32** %18, align 8
  %825 = getelementptr inbounds i32, i32* %824, i32 1
  store i32* %825, i32** %18, align 8
  store i32 %823, i32* %824, align 4
  %826 = load i32, i32* %11, align 4
  %827 = add nsw i32 %826, 0
  store i32 %827, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %828

; <label>:828:                                    ; preds = %821
  %pgocount57 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 51)
  %829 = add i64 %pgocount57, 1
  store i64 %829, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 51)
  br label %830

; <label>:830:                                    ; preds = %828, %806
  %pgocount58 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 42)
  %831 = add i64 %pgocount58, 1
  store i64 %831, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 42)
  br label %832

; <label>:832:                                    ; preds = %830, %804
  br label %833

; <label>:833:                                    ; preds = %832, %736
  br label %834

; <label>:834:                                    ; preds = %833
  br label %835

; <label>:835:                                    ; preds = %834, %577
  %836 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %837 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %836, i32 0, i32 5
  %838 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %837, align 8
  %839 = load i8*, i8** %7, align 8
  %840 = load i32*, i32** %19, align 8
  %841 = load i32*, i32** %18, align 8
  %842 = load i32, i32* %12, align 4
  %843 = ptrtoint void (i8*, i32*, i32*, i32)* %838 to i64
  call void @__llvm_profile_instrument_target(i64 %843, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3Decode1D to i8*), i32 1)
  call void %838(i8* %839, i32* %840, i32* %841, i32 %842)
  br label %844

; <label>:844:                                    ; preds = %835
  %845 = load i32, i32* %14, align 4
  %846 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %847 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %846, i32 0, i32 3
  store i32 %845, i32* %847, align 4
  %848 = load i32, i32* %13, align 4
  %849 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %850 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %849, i32 0, i32 2
  store i32 %848, i32* %850, align 8
  %851 = load i32, i32* %20, align 4
  %852 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %853 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %852, i32 0, i32 4
  store i32 %851, i32* %853, align 8
  %854 = load i8*, i8** %16, align 8
  %855 = load %struct.tiff*, %struct.tiff** %6, align 8
  %856 = getelementptr inbounds %struct.tiff, %struct.tiff* %855, i32 0, i32 42
  %857 = load i8*, i8** %856, align 8
  %858 = ptrtoint i8* %854 to i64
  %859 = ptrtoint i8* %857 to i64
  %860 = sub i64 %858, %859
  %861 = load %struct.tiff*, %struct.tiff** %6, align 8
  %862 = getelementptr inbounds %struct.tiff, %struct.tiff* %861, i32 0, i32 43
  %863 = load i32, i32* %862, align 8
  %864 = sext i32 %863 to i64
  %865 = sub nsw i64 %864, %860
  %866 = trunc i64 %865 to i32
  store i32 %866, i32* %862, align 8
  %867 = load i8*, i8** %16, align 8
  %868 = load %struct.tiff*, %struct.tiff** %6, align 8
  %869 = getelementptr inbounds %struct.tiff, %struct.tiff* %868, i32 0, i32 42
  store i8* %867, i8** %869, align 8
  br label %870

; <label>:870:                                    ; preds = %844
  store i32 -1, i32* %5, align 4
  br label %900

; <label>:871:                                    ; preds = %59
  br label %872

; <label>:872:                                    ; preds = %871
  %873 = load i32, i32* %14, align 4
  %874 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %875 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %874, i32 0, i32 3
  store i32 %873, i32* %875, align 4
  %876 = load i32, i32* %13, align 4
  %877 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %878 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %877, i32 0, i32 2
  store i32 %876, i32* %878, align 8
  %879 = load i32, i32* %20, align 4
  %880 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %881 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %880, i32 0, i32 4
  store i32 %879, i32* %881, align 8
  %882 = load i8*, i8** %16, align 8
  %883 = load %struct.tiff*, %struct.tiff** %6, align 8
  %884 = getelementptr inbounds %struct.tiff, %struct.tiff* %883, i32 0, i32 42
  %885 = load i8*, i8** %884, align 8
  %886 = ptrtoint i8* %882 to i64
  %887 = ptrtoint i8* %885 to i64
  %888 = sub i64 %886, %887
  %889 = load %struct.tiff*, %struct.tiff** %6, align 8
  %890 = getelementptr inbounds %struct.tiff, %struct.tiff* %889, i32 0, i32 43
  %891 = load i32, i32* %890, align 8
  %892 = sext i32 %891 to i64
  %893 = sub nsw i64 %892, %888
  %894 = trunc i64 %893 to i32
  store i32 %894, i32* %890, align 8
  %895 = load i8*, i8** %16, align 8
  %896 = load %struct.tiff*, %struct.tiff** %6, align 8
  %897 = getelementptr inbounds %struct.tiff, %struct.tiff* %896, i32 0, i32 42
  store i8* %895, i8** %897, align 8
  br label %898

; <label>:898:                                    ; preds = %872
  %pgocount59 = load i64, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 52)
  %899 = add i64 %pgocount59, 1
  store i64 %899, i64* getelementptr inbounds ([59 x i64], [59 x i64]* @__profc_tmp1.ll_Fax3Decode1D, i64 0, i64 52)
  store i32 1, i32* %5, align 4
  br label %900

; <label>:900:                                    ; preds = %898, %870
  %901 = load i32, i32* %5, align 4
  ret i32 %901
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3PreEncode(%struct.tiff*, i16 zeroext) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca i16, align 2
  %5 = alloca %struct.Fax3EncodeState*, align 8
  %6 = alloca float, align 4
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store i16 %1, i16* %4, align 2
  %7 = load %struct.tiff*, %struct.tiff** %3, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 37
  %9 = load i8*, i8** %8, align 8
  %10 = bitcast i8* %9 to %struct.Fax3BaseState*
  %11 = bitcast %struct.Fax3BaseState* %10 to %struct.Fax3EncodeState*
  store %struct.Fax3EncodeState* %11, %struct.Fax3EncodeState** %5, align 8
  %12 = load i16, i16* %4, align 2
  %13 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %5, align 8
  %14 = icmp ne %struct.Fax3EncodeState* %13, null
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %2
  br label %19

; <label>:16:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3PreEncode, i64 0, i64 4)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3PreEncode, i64 0, i64 4)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.40, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 699, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__PRETTY_FUNCTION__.Fax3PreEncode, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %19

; <label>:19:                                     ; preds = %18, %15
  %20 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %5, align 8
  %21 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %20, i32 0, i32 2
  store i32 8, i32* %21, align 4
  %22 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %5, align 8
  %23 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %22, i32 0, i32 1
  store i32 0, i32* %23, align 8
  %24 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %5, align 8
  %25 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %24, i32 0, i32 3
  store i32 0, i32* %25, align 8
  %26 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %5, align 8
  %27 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %26, i32 0, i32 4
  %28 = load i8*, i8** %27, align 8
  %29 = icmp ne i8* %28, null
  br i1 %29, label %30, label %39

; <label>:30:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3PreEncode, i64 0, i64 0)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3PreEncode, i64 0, i64 0)
  %32 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %5, align 8
  %33 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %32, i32 0, i32 4
  %34 = load i8*, i8** %33, align 8
  %35 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %5, align 8
  %36 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %35, i32 0, i32 0
  %37 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %36, i32 0, i32 1
  %38 = load i32, i32* %37, align 4
  call void @_TIFFmemset(i8* %34, i32 0, i32 %38)
  br label %39

; <label>:39:                                     ; preds = %30, %19
  %40 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %5, align 8
  %41 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %40, i32 0, i32 0
  %42 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %41, i32 0, i32 6
  %43 = load i32, i32* %42, align 8
  %44 = and i32 %43, 1
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %76

; <label>:46:                                     ; preds = %39
  %47 = load %struct.tiff*, %struct.tiff** %3, align 8
  %48 = getelementptr inbounds %struct.tiff, %struct.tiff* %47, i32 0, i32 6
  %49 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %48, i32 0, i32 22
  %50 = load float, float* %49, align 4
  store float %50, float* %6, align 4
  %51 = load %struct.tiff*, %struct.tiff** %3, align 8
  %52 = getelementptr inbounds %struct.tiff, %struct.tiff* %51, i32 0, i32 6
  %53 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %52, i32 0, i32 23
  %54 = load i16, i16* %53, align 8
  %55 = zext i16 %54 to i32
  %56 = icmp eq i32 %55, 3
  br i1 %56, label %57, label %61

; <label>:57:                                     ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3PreEncode, i64 0, i64 3)
  %58 = add i64 %pgocount2, 1
  store i64 %58, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3PreEncode, i64 0, i64 3)
  %59 = load float, float* %6, align 4
  %60 = fmul float %59, 0x400451EB80000000
  store float %60, float* %6, align 4
  br label %61

; <label>:61:                                     ; preds = %57, %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3PreEncode, i64 0, i64 1)
  %62 = add i64 %pgocount3, 1
  store i64 %62, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3PreEncode, i64 0, i64 1)
  %63 = load float, float* %6, align 4
  %64 = fcmp ogt float %63, 1.500000e+02
  %65 = zext i1 %64 to i64
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3PreEncode, i64 0, i64 5)
  %66 = add i64 %pgocount4, %65
  store i64 %66, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3PreEncode, i64 0, i64 5)
  %67 = select i1 %64, i32 4, i32 2
  %68 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %5, align 8
  %69 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %68, i32 0, i32 6
  store i32 %67, i32* %69, align 4
  %70 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %5, align 8
  %71 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %70, i32 0, i32 6
  %72 = load i32, i32* %71, align 4
  %73 = sub nsw i32 %72, 1
  %74 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %5, align 8
  %75 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %74, i32 0, i32 5
  store i32 %73, i32* %75, align 8
  br label %82

; <label>:76:                                     ; preds = %39
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3PreEncode, i64 0, i64 2)
  %77 = add i64 %pgocount5, 1
  store i64 %77, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3PreEncode, i64 0, i64 2)
  %78 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %5, align 8
  %79 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %78, i32 0, i32 6
  store i32 0, i32* %79, align 4
  %80 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %5, align 8
  %81 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %80, i32 0, i32 5
  store i32 0, i32* %81, align 8
  br label %82

; <label>:82:                                     ; preds = %76, %61
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3PostEncode(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  %3 = alloca %struct.Fax3EncodeState*, align 8
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %4 = load %struct.tiff*, %struct.tiff** %2, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 37
  %6 = load i8*, i8** %5, align 8
  %7 = bitcast i8* %6 to %struct.Fax3BaseState*
  %8 = bitcast %struct.Fax3BaseState* %7 to %struct.Fax3EncodeState*
  store %struct.Fax3EncodeState* %8, %struct.Fax3EncodeState** %3, align 8
  %9 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %10 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %9, i32 0, i32 2
  %11 = load i32, i32* %10, align 4
  %12 = icmp ne i32 %11, 8
  br i1 %12, label %13, label %43

; <label>:13:                                     ; preds = %1
  %14 = load %struct.tiff*, %struct.tiff** %2, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 43
  %16 = load i32, i32* %15, align 8
  %17 = load %struct.tiff*, %struct.tiff** %2, align 8
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %17, i32 0, i32 41
  %19 = load i32, i32* %18, align 8
  %20 = icmp sge i32 %16, %19
  br i1 %20, label %21, label %25

; <label>:21:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax3PostEncode, i64 0, i64 2)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax3PostEncode, i64 0, i64 2)
  %23 = load %struct.tiff*, %struct.tiff** %2, align 8
  %24 = call i32 @TIFFFlushData1(%struct.tiff* %23)
  br label %25

; <label>:25:                                     ; preds = %21, %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax3PostEncode, i64 0, i64 1)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax3PostEncode, i64 0, i64 1)
  %27 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %28 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %27, i32 0, i32 1
  %29 = load i32, i32* %28, align 8
  %30 = trunc i32 %29 to i8
  %31 = load %struct.tiff*, %struct.tiff** %2, align 8
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %31, i32 0, i32 42
  %33 = load i8*, i8** %32, align 8
  %34 = getelementptr inbounds i8, i8* %33, i32 1
  store i8* %34, i8** %32, align 8
  store i8 %30, i8* %33, align 1
  %35 = load %struct.tiff*, %struct.tiff** %2, align 8
  %36 = getelementptr inbounds %struct.tiff, %struct.tiff* %35, i32 0, i32 43
  %37 = load i32, i32* %36, align 8
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %36, align 8
  %39 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %40 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %39, i32 0, i32 1
  store i32 0, i32* %40, align 8
  %41 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %42 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %41, i32 0, i32 2
  store i32 8, i32* %42, align 4
  br label %43

; <label>:43:                                     ; preds = %25, %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax3PostEncode, i64 0, i64 0)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_Fax3PostEncode, i64 0, i64 0)
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3Encode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca %struct.Fax3EncodeState*, align 8
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %11 = load %struct.tiff*, %struct.tiff** %6, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 37
  %13 = load i8*, i8** %12, align 8
  %14 = bitcast i8* %13 to %struct.Fax3BaseState*
  %15 = bitcast %struct.Fax3BaseState* %14 to %struct.Fax3EncodeState*
  store %struct.Fax3EncodeState* %15, %struct.Fax3EncodeState** %10, align 8
  %16 = load i16, i16* %9, align 2
  br label %17

; <label>:17:                                     ; preds = %138, %4
  %18 = load i32, i32* %8, align 4
  %19 = sext i32 %18 to i64
  %20 = icmp sgt i64 %19, 0
  br i1 %20, label %21, label %139

; <label>:21:                                     ; preds = %17
  %22 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %23 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %22, i32 0, i32 0
  %24 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %23, i32 0, i32 0
  %25 = load i32, i32* %24, align 8
  %26 = and i32 %25, 2
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %31

; <label>:28:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 1)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 1)
  %30 = load %struct.tiff*, %struct.tiff** %6, align 8
  call void @Fax3PutEOL(%struct.tiff* %30)
  br label %31

; <label>:31:                                     ; preds = %28, %21
  %32 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %33 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %32, i32 0, i32 0
  %34 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %33, i32 0, i32 6
  %35 = load i32, i32* %34, align 8
  %36 = and i32 %35, 1
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %103

; <label>:38:                                     ; preds = %31
  %39 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %40 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %39, i32 0, i32 3
  %41 = load i32, i32* %40, align 8
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %43, label %58

; <label>:43:                                     ; preds = %38
  %44 = load %struct.tiff*, %struct.tiff** %6, align 8
  %45 = load i8*, i8** %7, align 8
  %46 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %47 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %46, i32 0, i32 0
  %48 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %47, i32 0, i32 2
  %49 = load i32, i32* %48, align 8
  %50 = call i32 @Fax3Encode1DRow(%struct.tiff* %44, i8* %45, i32 %49)
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %54, label %52

; <label>:52:                                     ; preds = %43
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 9)
  %53 = add i64 %pgocount1, 1
  store i64 %53, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 9)
  store i32 0, i32* %5, align 4
  br label %141

; <label>:54:                                     ; preds = %43
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 4)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 4)
  %56 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %57 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %56, i32 0, i32 3
  store i32 1, i32* %57, align 8
  br label %78

; <label>:58:                                     ; preds = %38
  %59 = load %struct.tiff*, %struct.tiff** %6, align 8
  %60 = load i8*, i8** %7, align 8
  %61 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %62 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %61, i32 0, i32 4
  %63 = load i8*, i8** %62, align 8
  %64 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %65 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %64, i32 0, i32 0
  %66 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %65, i32 0, i32 2
  %67 = load i32, i32* %66, align 8
  %68 = call i32 @Fax3Encode2DRow(%struct.tiff* %59, i8* %60, i8* %63, i32 %67)
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %72, label %70

; <label>:70:                                     ; preds = %58
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 8)
  %71 = add i64 %pgocount3, 1
  store i64 %71, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 8)
  store i32 0, i32* %5, align 4
  br label %141

; <label>:72:                                     ; preds = %58
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 3)
  %73 = add i64 %pgocount4, 1
  store i64 %73, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 3)
  %74 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %75 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %74, i32 0, i32 5
  %76 = load i32, i32* %75, align 8
  %77 = add nsw i32 %76, -1
  store i32 %77, i32* %75, align 8
  br label %78

; <label>:78:                                     ; preds = %72, %54
  %79 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %80 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %79, i32 0, i32 5
  %81 = load i32, i32* %80, align 8
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %93

; <label>:83:                                     ; preds = %78
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 5)
  %84 = add i64 %pgocount5, 1
  store i64 %84, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 5)
  %85 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %86 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %85, i32 0, i32 3
  store i32 0, i32* %86, align 8
  %87 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %88 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %87, i32 0, i32 6
  %89 = load i32, i32* %88, align 4
  %90 = sub nsw i32 %89, 1
  %91 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %92 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %91, i32 0, i32 5
  store i32 %90, i32* %92, align 8
  br label %102

; <label>:93:                                     ; preds = %78
  %94 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %95 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %94, i32 0, i32 4
  %96 = load i8*, i8** %95, align 8
  %97 = load i8*, i8** %7, align 8
  %98 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %99 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %98, i32 0, i32 0
  %100 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %99, i32 0, i32 1
  %101 = load i32, i32* %100, align 4
  call void @_TIFFmemcpy(i8* %96, i8* %97, i32 %101)
  br label %102

; <label>:102:                                    ; preds = %93, %83
  br label %116

; <label>:103:                                    ; preds = %31
  %104 = load %struct.tiff*, %struct.tiff** %6, align 8
  %105 = load i8*, i8** %7, align 8
  %106 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %107 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %106, i32 0, i32 0
  %108 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %107, i32 0, i32 2
  %109 = load i32, i32* %108, align 8
  %110 = call i32 @Fax3Encode1DRow(%struct.tiff* %104, i8* %105, i32 %109)
  %111 = icmp ne i32 %110, 0
  br i1 %111, label %114, label %112

; <label>:112:                                    ; preds = %103
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 7)
  %113 = add i64 %pgocount6, 1
  store i64 %113, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 7)
  store i32 0, i32* %5, align 4
  br label %141

; <label>:114:                                    ; preds = %103
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 2)
  %115 = add i64 %pgocount7, 1
  store i64 %115, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 2)
  br label %116

; <label>:116:                                    ; preds = %114, %102
  %117 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %118 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %117, i32 0, i32 0
  %119 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %118, i32 0, i32 1
  %120 = load i32, i32* %119, align 4
  %121 = load i8*, i8** %7, align 8
  %122 = zext i32 %120 to i64
  %123 = getelementptr inbounds i8, i8* %121, i64 %122
  store i8* %123, i8** %7, align 8
  %124 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %125 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %124, i32 0, i32 0
  %126 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %125, i32 0, i32 1
  %127 = load i32, i32* %126, align 4
  %128 = load i32, i32* %8, align 4
  %129 = sub i32 %128, %127
  store i32 %129, i32* %8, align 4
  %130 = load i32, i32* %8, align 4
  %131 = icmp ne i32 %130, 0
  br i1 %131, label %132, label %138

; <label>:132:                                    ; preds = %116
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 0)
  %133 = add i64 %pgocount8, 1
  store i64 %133, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 0)
  %134 = load %struct.tiff*, %struct.tiff** %6, align 8
  %135 = getelementptr inbounds %struct.tiff, %struct.tiff* %134, i32 0, i32 11
  %136 = load i32, i32* %135, align 8
  %137 = add i32 %136, 1
  store i32 %137, i32* %135, align 8
  br label %138

; <label>:138:                                    ; preds = %132, %116
  br label %17

; <label>:139:                                    ; preds = %17
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 6)
  %140 = add i64 %pgocount9, 1
  store i64 %140, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_Fax3Encode, i64 0, i64 6)
  store i32 1, i32* %5, align 4
  br label %141

; <label>:141:                                    ; preds = %139, %112, %70, %52
  %142 = load i32, i32* %5, align 4
  ret i32 %142
}

; Function Attrs: noinline nounwind uwtable
define internal void @Fax3Close(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  %3 = alloca %struct.Fax3EncodeState*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %7 = load %struct.tiff*, %struct.tiff** %2, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 37
  %9 = load i8*, i8** %8, align 8
  %10 = bitcast i8* %9 to %struct.Fax3BaseState*
  %11 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %10, i32 0, i32 0
  %12 = load i32, i32* %11, align 8
  %13 = and i32 %12, 1
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %81

; <label>:15:                                     ; preds = %1
  %16 = load %struct.tiff*, %struct.tiff** %2, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 37
  %18 = load i8*, i8** %17, align 8
  %19 = bitcast i8* %18 to %struct.Fax3BaseState*
  %20 = bitcast %struct.Fax3BaseState* %19 to %struct.Fax3EncodeState*
  store %struct.Fax3EncodeState* %20, %struct.Fax3EncodeState** %3, align 8
  store i32 1, i32* %4, align 4
  store i32 12, i32* %5, align 4
  %21 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %22 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %21, i32 0, i32 0
  %23 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %22, i32 0, i32 6
  %24 = load i32, i32* %23, align 8
  %25 = and i32 %24, 1
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %39

; <label>:27:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3Close, i64 0, i64 3)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3Close, i64 0, i64 3)
  %29 = load i32, i32* %4, align 4
  %30 = shl i32 %29, 1
  %31 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %32 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %31, i32 0, i32 3
  %33 = load i32, i32* %32, align 8
  %34 = icmp eq i32 %33, 0
  %35 = zext i1 %34 to i32
  %36 = or i32 %30, %35
  store i32 %36, i32* %4, align 4
  %37 = load i32, i32* %5, align 4
  %38 = add i32 %37, 1
  store i32 %38, i32* %5, align 4
  br label %39

; <label>:39:                                     ; preds = %27, %15
  store i32 0, i32* %6, align 4
  br label %40

; <label>:40:                                     ; preds = %47, %39
  %41 = load i32, i32* %6, align 4
  %42 = icmp slt i32 %41, 6
  br i1 %42, label %43, label %51

; <label>:43:                                     ; preds = %40
  %44 = load %struct.tiff*, %struct.tiff** %2, align 8
  %45 = load i32, i32* %4, align 4
  %46 = load i32, i32* %5, align 4
  call void @Fax3PutBits(%struct.tiff* %44, i32 %45, i32 %46)
  br label %47

; <label>:47:                                     ; preds = %43
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3Close, i64 0, i64 0)
  %48 = add i64 %pgocount1, 1
  store i64 %48, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3Close, i64 0, i64 0)
  %49 = load i32, i32* %6, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %6, align 4
  br label %40

; <label>:51:                                     ; preds = %40
  %52 = load %struct.tiff*, %struct.tiff** %2, align 8
  %53 = getelementptr inbounds %struct.tiff, %struct.tiff* %52, i32 0, i32 43
  %54 = load i32, i32* %53, align 8
  %55 = load %struct.tiff*, %struct.tiff** %2, align 8
  %56 = getelementptr inbounds %struct.tiff, %struct.tiff* %55, i32 0, i32 41
  %57 = load i32, i32* %56, align 8
  %58 = icmp sge i32 %54, %57
  br i1 %58, label %59, label %63

; <label>:59:                                     ; preds = %51
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3Close, i64 0, i64 4)
  %60 = add i64 %pgocount2, 1
  store i64 %60, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3Close, i64 0, i64 4)
  %61 = load %struct.tiff*, %struct.tiff** %2, align 8
  %62 = call i32 @TIFFFlushData1(%struct.tiff* %61)
  br label %63

; <label>:63:                                     ; preds = %59, %51
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3Close, i64 0, i64 2)
  %64 = add i64 %pgocount3, 1
  store i64 %64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3Close, i64 0, i64 2)
  %65 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %66 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %65, i32 0, i32 1
  %67 = load i32, i32* %66, align 8
  %68 = trunc i32 %67 to i8
  %69 = load %struct.tiff*, %struct.tiff** %2, align 8
  %70 = getelementptr inbounds %struct.tiff, %struct.tiff* %69, i32 0, i32 42
  %71 = load i8*, i8** %70, align 8
  %72 = getelementptr inbounds i8, i8* %71, i32 1
  store i8* %72, i8** %70, align 8
  store i8 %68, i8* %71, align 1
  %73 = load %struct.tiff*, %struct.tiff** %2, align 8
  %74 = getelementptr inbounds %struct.tiff, %struct.tiff* %73, i32 0, i32 43
  %75 = load i32, i32* %74, align 8
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %74, align 8
  %77 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %78 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %77, i32 0, i32 1
  store i32 0, i32* %78, align 8
  %79 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %80 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %79, i32 0, i32 2
  store i32 8, i32* %80, align 4
  br label %81

; <label>:81:                                     ; preds = %63, %1
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3Close, i64 0, i64 1)
  %82 = add i64 %pgocount4, 1
  store i64 %82, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3Close, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Fax3Cleanup(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  %3 = alloca %struct.Fax3DecodeState*, align 8
  %4 = alloca %struct.Fax3EncodeState*, align 8
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %5 = load %struct.tiff*, %struct.tiff** %2, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %5, i32 0, i32 37
  %7 = load i8*, i8** %6, align 8
  %8 = icmp ne i8* %7, null
  br i1 %8, label %9, label %71

; <label>:9:                                      ; preds = %1
  %10 = load %struct.tiff*, %struct.tiff** %2, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 2
  %12 = load i32, i32* %11, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %32

; <label>:14:                                     ; preds = %9
  %15 = load %struct.tiff*, %struct.tiff** %2, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %15, i32 0, i32 37
  %17 = load i8*, i8** %16, align 8
  %18 = bitcast i8* %17 to %struct.Fax3BaseState*
  %19 = bitcast %struct.Fax3BaseState* %18 to %struct.Fax3DecodeState*
  store %struct.Fax3DecodeState* %19, %struct.Fax3DecodeState** %3, align 8
  %20 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %3, align 8
  %21 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %20, i32 0, i32 6
  %22 = load i32*, i32** %21, align 8
  %23 = icmp ne i32* %22, null
  br i1 %23, label %24, label %30

; <label>:24:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3Cleanup, i64 0, i64 5)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3Cleanup, i64 0, i64 5)
  %26 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %3, align 8
  %27 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %26, i32 0, i32 6
  %28 = load i32*, i32** %27, align 8
  %29 = bitcast i32* %28 to i8*
  call void @_TIFFfree(i8* %29)
  br label %30

; <label>:30:                                     ; preds = %24, %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3Cleanup, i64 0, i64 4)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3Cleanup, i64 0, i64 4)
  br label %49

; <label>:32:                                     ; preds = %9
  %33 = load %struct.tiff*, %struct.tiff** %2, align 8
  %34 = getelementptr inbounds %struct.tiff, %struct.tiff* %33, i32 0, i32 37
  %35 = load i8*, i8** %34, align 8
  %36 = bitcast i8* %35 to %struct.Fax3BaseState*
  %37 = bitcast %struct.Fax3BaseState* %36 to %struct.Fax3EncodeState*
  store %struct.Fax3EncodeState* %37, %struct.Fax3EncodeState** %4, align 8
  %38 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %4, align 8
  %39 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %38, i32 0, i32 4
  %40 = load i8*, i8** %39, align 8
  %41 = icmp ne i8* %40, null
  br i1 %41, label %42, label %47

; <label>:42:                                     ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3Cleanup, i64 0, i64 3)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3Cleanup, i64 0, i64 3)
  %44 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %4, align 8
  %45 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %44, i32 0, i32 4
  %46 = load i8*, i8** %45, align 8
  call void @_TIFFfree(i8* %46)
  br label %47

; <label>:47:                                     ; preds = %42, %32
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3Cleanup, i64 0, i64 1)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3Cleanup, i64 0, i64 1)
  br label %49

; <label>:49:                                     ; preds = %47, %30
  %50 = load %struct.tiff*, %struct.tiff** %2, align 8
  %51 = getelementptr inbounds %struct.tiff, %struct.tiff* %50, i32 0, i32 37
  %52 = load i8*, i8** %51, align 8
  %53 = bitcast i8* %52 to %struct.Fax3BaseState*
  %54 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %53, i32 0, i32 8
  %55 = load i8*, i8** %54, align 8
  %56 = icmp ne i8* %55, null
  br i1 %56, label %57, label %65

; <label>:57:                                     ; preds = %49
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3Cleanup, i64 0, i64 2)
  %58 = add i64 %pgocount4, 1
  store i64 %58, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3Cleanup, i64 0, i64 2)
  %59 = load %struct.tiff*, %struct.tiff** %2, align 8
  %60 = getelementptr inbounds %struct.tiff, %struct.tiff* %59, i32 0, i32 37
  %61 = load i8*, i8** %60, align 8
  %62 = bitcast i8* %61 to %struct.Fax3BaseState*
  %63 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %62, i32 0, i32 8
  %64 = load i8*, i8** %63, align 8
  call void @_TIFFfree(i8* %64)
  br label %65

; <label>:65:                                     ; preds = %57, %49
  %66 = load %struct.tiff*, %struct.tiff** %2, align 8
  %67 = getelementptr inbounds %struct.tiff, %struct.tiff* %66, i32 0, i32 37
  %68 = load i8*, i8** %67, align 8
  call void @_TIFFfree(i8* %68)
  %69 = load %struct.tiff*, %struct.tiff** %2, align 8
  %70 = getelementptr inbounds %struct.tiff, %struct.tiff* %69, i32 0, i32 37
  store i8* null, i8** %70, align 8
  br label %71

; <label>:71:                                     ; preds = %65, %1
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3Cleanup, i64 0, i64 0)
  %72 = add i64 %pgocount5, 1
  store i64 %72, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_Fax3Cleanup, i64 0, i64 0)
  ret void
}

declare void @_TIFFsetString(i8**, i8*) #2

declare %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff*, i32) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare i32 @TIFFTileRowSize(%struct.tiff*) #2

declare i32 @TIFFScanlineSize(%struct.tiff*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3Decode2D(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca %struct.Fax3DecodeState*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i32*, align 8
  %19 = alloca i32*, align 8
  %20 = alloca i32, align 4
  %21 = alloca i8*, align 8
  %22 = alloca %struct.TIFFFaxTabEnt*, align 8
  %23 = alloca i32, align 4
  %24 = alloca i32*, align 8
  %25 = alloca i32, align 4
  %26 = alloca i32*, align 8
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %27 = load %struct.tiff*, %struct.tiff** %6, align 8
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %27, i32 0, i32 37
  %29 = load i8*, i8** %28, align 8
  %30 = bitcast i8* %29 to %struct.Fax3BaseState*
  %31 = bitcast %struct.Fax3BaseState* %30 to %struct.Fax3DecodeState*
  store %struct.Fax3DecodeState* %31, %struct.Fax3DecodeState** %10, align 8
  %32 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %33 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %32, i32 0, i32 0
  %34 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %33, i32 0, i32 2
  %35 = load i32, i32* %34, align 8
  store i32 %35, i32* %12, align 4
  %36 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %37 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %36, i32 0, i32 1
  %38 = load i8*, i8** %37, align 8
  store i8* %38, i8** %21, align 8
  %39 = load i16, i16* %9, align 2
  br label %40

; <label>:40:                                     ; preds = %4
  %41 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %42 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %41, i32 0, i32 2
  %43 = load i32, i32* %42, align 8
  store i32 %43, i32* %13, align 4
  %44 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %45 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %44, i32 0, i32 3
  %46 = load i32, i32* %45, align 4
  store i32 %46, i32* %14, align 4
  %47 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %48 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %47, i32 0, i32 4
  %49 = load i32, i32* %48, align 8
  store i32 %49, i32* %20, align 4
  %50 = load %struct.tiff*, %struct.tiff** %6, align 8
  %51 = getelementptr inbounds %struct.tiff, %struct.tiff* %50, i32 0, i32 42
  %52 = load i8*, i8** %51, align 8
  store i8* %52, i8** %16, align 8
  %53 = load i8*, i8** %16, align 8
  %54 = load %struct.tiff*, %struct.tiff** %6, align 8
  %55 = getelementptr inbounds %struct.tiff, %struct.tiff* %54, i32 0, i32 43
  %56 = load i32, i32* %55, align 8
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8* %53, i64 %57
  store i8* %58, i8** %17, align 8
  br label %59

; <label>:59:                                     ; preds = %40
  br label %60

; <label>:60:                                     ; preds = %1960, %59
  %61 = load i32, i32* %8, align 4
  %62 = sext i32 %61 to i64
  %63 = icmp sgt i64 %62, 0
  br i1 %63, label %64, label %2110

; <label>:64:                                     ; preds = %60
  store i32 0, i32* %11, align 4
  store i32 0, i32* %15, align 4
  %65 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %66 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %65, i32 0, i32 8
  %67 = load i32*, i32** %66, align 8
  store i32* %67, i32** %19, align 8
  store i32* %67, i32** %18, align 8
  br label %68

; <label>:68:                                     ; preds = %64
  %69 = load i32, i32* %20, align 4
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %145

; <label>:71:                                     ; preds = %68
  br label %72

; <label>:72:                                     ; preds = %141, %71
  br label %73

; <label>:73:                                     ; preds = %72
  %74 = load i32, i32* %14, align 4
  %75 = icmp slt i32 %74, 11
  br i1 %75, label %76, label %129

; <label>:76:                                     ; preds = %73
  %77 = load i8*, i8** %16, align 8
  %78 = load i8*, i8** %17, align 8
  %79 = icmp uge i8* %77, %78
  br i1 %79, label %80, label %87

; <label>:80:                                     ; preds = %76
  %81 = load i32, i32* %14, align 4
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %85

; <label>:83:                                     ; preds = %80
  %pgocount = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 85)
  %84 = add i64 %pgocount, 1
  store i64 %84, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 85)
  br label %1961

; <label>:85:                                     ; preds = %80
  %pgocount6 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 26)
  %86 = add i64 %pgocount6, 1
  store i64 %86, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 26)
  store i32 11, i32* %14, align 4
  br label %128

; <label>:87:                                     ; preds = %76
  %88 = load i8*, i8** %21, align 8
  %89 = load i8*, i8** %16, align 8
  %90 = getelementptr inbounds i8, i8* %89, i32 1
  store i8* %90, i8** %16, align 8
  %91 = load i8, i8* %89, align 1
  %92 = zext i8 %91 to i64
  %93 = getelementptr inbounds i8, i8* %88, i64 %92
  %94 = load i8, i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = load i32, i32* %14, align 4
  %97 = shl i32 %95, %96
  %98 = load i32, i32* %13, align 4
  %99 = or i32 %98, %97
  store i32 %99, i32* %13, align 4
  %100 = load i32, i32* %14, align 4
  %101 = add nsw i32 %100, 8
  store i32 %101, i32* %14, align 4
  %102 = icmp slt i32 %101, 11
  br i1 %102, label %103, label %126

; <label>:103:                                    ; preds = %87
  %104 = load i8*, i8** %16, align 8
  %105 = load i8*, i8** %17, align 8
  %106 = icmp uge i8* %104, %105
  br i1 %106, label %107, label %109

; <label>:107:                                    ; preds = %103
  %pgocount7 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 47)
  %108 = add i64 %pgocount7, 1
  store i64 %108, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 47)
  store i32 11, i32* %14, align 4
  br label %125

; <label>:109:                                    ; preds = %103
  %pgocount8 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 48)
  %110 = add i64 %pgocount8, 1
  store i64 %110, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 48)
  %111 = load i8*, i8** %21, align 8
  %112 = load i8*, i8** %16, align 8
  %113 = getelementptr inbounds i8, i8* %112, i32 1
  store i8* %113, i8** %16, align 8
  %114 = load i8, i8* %112, align 1
  %115 = zext i8 %114 to i64
  %116 = getelementptr inbounds i8, i8* %111, i64 %115
  %117 = load i8, i8* %116, align 1
  %118 = zext i8 %117 to i32
  %119 = load i32, i32* %14, align 4
  %120 = shl i32 %118, %119
  %121 = load i32, i32* %13, align 4
  %122 = or i32 %121, %120
  store i32 %122, i32* %13, align 4
  %123 = load i32, i32* %14, align 4
  %124 = add nsw i32 %123, 8
  store i32 %124, i32* %14, align 4
  br label %125

; <label>:125:                                    ; preds = %109, %107
  br label %126

; <label>:126:                                    ; preds = %125, %87
  %pgocount9 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 25)
  %127 = add i64 %pgocount9, 1
  store i64 %127, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 25)
  br label %128

; <label>:128:                                    ; preds = %126, %85
  br label %129

; <label>:129:                                    ; preds = %128, %73
  br label %130

; <label>:130:                                    ; preds = %129
  %131 = load i32, i32* %13, align 4
  %132 = and i32 %131, 2047
  %133 = icmp eq i32 %132, 0
  br i1 %133, label %134, label %135

; <label>:134:                                    ; preds = %130
  br label %143

; <label>:135:                                    ; preds = %130
  br label %136

; <label>:136:                                    ; preds = %135
  %137 = load i32, i32* %14, align 4
  %138 = sub nsw i32 %137, 1
  store i32 %138, i32* %14, align 4
  %139 = load i32, i32* %13, align 4
  %140 = lshr i32 %139, 1
  store i32 %140, i32* %13, align 4
  br label %141

; <label>:141:                                    ; preds = %136
  %pgocount10 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 9)
  %142 = add i64 %pgocount10, 1
  store i64 %142, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 9)
  br label %72

; <label>:143:                                    ; preds = %134
  %pgocount11 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 52)
  %144 = add i64 %pgocount11, 1
  store i64 %144, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 52)
  br label %145

; <label>:145:                                    ; preds = %143, %68
  br label %146

; <label>:146:                                    ; preds = %191, %145
  br label %147

; <label>:147:                                    ; preds = %146
  %148 = load i32, i32* %14, align 4
  %149 = icmp slt i32 %148, 8
  br i1 %149, label %150, label %178

; <label>:150:                                    ; preds = %147
  %151 = load i8*, i8** %16, align 8
  %152 = load i8*, i8** %17, align 8
  %153 = icmp uge i8* %151, %152
  br i1 %153, label %154, label %161

; <label>:154:                                    ; preds = %150
  %155 = load i32, i32* %14, align 4
  %156 = icmp eq i32 %155, 0
  br i1 %156, label %157, label %159

; <label>:157:                                    ; preds = %154
  %pgocount12 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 66)
  %158 = add i64 %pgocount12, 1
  store i64 %158, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 66)
  br label %1961

; <label>:159:                                    ; preds = %154
  %pgocount13 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 11)
  %160 = add i64 %pgocount13, 1
  store i64 %160, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 11)
  store i32 8, i32* %14, align 4
  br label %177

; <label>:161:                                    ; preds = %150
  %pgocount14 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 10)
  %162 = add i64 %pgocount14, 1
  store i64 %162, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 10)
  %163 = load i8*, i8** %21, align 8
  %164 = load i8*, i8** %16, align 8
  %165 = getelementptr inbounds i8, i8* %164, i32 1
  store i8* %165, i8** %16, align 8
  %166 = load i8, i8* %164, align 1
  %167 = zext i8 %166 to i64
  %168 = getelementptr inbounds i8, i8* %163, i64 %167
  %169 = load i8, i8* %168, align 1
  %170 = zext i8 %169 to i32
  %171 = load i32, i32* %14, align 4
  %172 = shl i32 %170, %171
  %173 = load i32, i32* %13, align 4
  %174 = or i32 %173, %172
  store i32 %174, i32* %13, align 4
  %175 = load i32, i32* %14, align 4
  %176 = add nsw i32 %175, 8
  store i32 %176, i32* %14, align 4
  br label %177

; <label>:177:                                    ; preds = %161, %159
  br label %178

; <label>:178:                                    ; preds = %177, %147
  br label %179

; <label>:179:                                    ; preds = %178
  %180 = load i32, i32* %13, align 4
  %181 = and i32 %180, 255
  %182 = icmp ne i32 %181, 0
  br i1 %182, label %183, label %184

; <label>:183:                                    ; preds = %179
  br label %192

; <label>:184:                                    ; preds = %179
  %pgocount15 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 6)
  %185 = add i64 %pgocount15, 1
  store i64 %185, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 6)
  br label %186

; <label>:186:                                    ; preds = %184
  %187 = load i32, i32* %14, align 4
  %188 = sub nsw i32 %187, 8
  store i32 %188, i32* %14, align 4
  %189 = load i32, i32* %13, align 4
  %190 = lshr i32 %189, 8
  store i32 %190, i32* %13, align 4
  br label %191

; <label>:191:                                    ; preds = %186
  br label %146

; <label>:192:                                    ; preds = %183
  br label %193

; <label>:193:                                    ; preds = %204, %192
  %194 = load i32, i32* %13, align 4
  %195 = and i32 %194, 1
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %197, label %205

; <label>:197:                                    ; preds = %193
  %pgocount16 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 7)
  %198 = add i64 %pgocount16, 1
  store i64 %198, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 7)
  br label %199

; <label>:199:                                    ; preds = %197
  %200 = load i32, i32* %14, align 4
  %201 = sub nsw i32 %200, 1
  store i32 %201, i32* %14, align 4
  %202 = load i32, i32* %13, align 4
  %203 = lshr i32 %202, 1
  store i32 %203, i32* %13, align 4
  br label %204

; <label>:204:                                    ; preds = %199
  br label %193

; <label>:205:                                    ; preds = %193
  br label %206

; <label>:206:                                    ; preds = %205
  %207 = load i32, i32* %14, align 4
  %208 = sub nsw i32 %207, 1
  store i32 %208, i32* %14, align 4
  %209 = load i32, i32* %13, align 4
  %210 = lshr i32 %209, 1
  store i32 %210, i32* %13, align 4
  br label %211

; <label>:211:                                    ; preds = %206
  store i32 0, i32* %20, align 4
  br label %212

; <label>:212:                                    ; preds = %211
  br label %213

; <label>:213:                                    ; preds = %212
  %214 = load i32, i32* %14, align 4
  %215 = icmp slt i32 %214, 1
  br i1 %215, label %216, label %244

; <label>:216:                                    ; preds = %213
  %217 = load i8*, i8** %16, align 8
  %218 = load i8*, i8** %17, align 8
  %219 = icmp uge i8* %217, %218
  br i1 %219, label %220, label %227

; <label>:220:                                    ; preds = %216
  %221 = load i32, i32* %14, align 4
  %222 = icmp eq i32 %221, 0
  br i1 %222, label %223, label %225

; <label>:223:                                    ; preds = %220
  %pgocount17 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 139)
  %224 = add i64 %pgocount17, 1
  store i64 %224, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 139)
  br label %1961

; <label>:225:                                    ; preds = %220
  %pgocount18 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 77)
  %226 = add i64 %pgocount18, 1
  store i64 %226, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 77)
  store i32 1, i32* %14, align 4
  br label %243

; <label>:227:                                    ; preds = %216
  %pgocount19 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 76)
  %228 = add i64 %pgocount19, 1
  store i64 %228, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 76)
  %229 = load i8*, i8** %21, align 8
  %230 = load i8*, i8** %16, align 8
  %231 = getelementptr inbounds i8, i8* %230, i32 1
  store i8* %231, i8** %16, align 8
  %232 = load i8, i8* %230, align 1
  %233 = zext i8 %232 to i64
  %234 = getelementptr inbounds i8, i8* %229, i64 %233
  %235 = load i8, i8* %234, align 1
  %236 = zext i8 %235 to i32
  %237 = load i32, i32* %14, align 4
  %238 = shl i32 %236, %237
  %239 = load i32, i32* %13, align 4
  %240 = or i32 %239, %238
  store i32 %240, i32* %13, align 4
  %241 = load i32, i32* %14, align 4
  %242 = add nsw i32 %241, 8
  store i32 %242, i32* %14, align 4
  br label %243

; <label>:243:                                    ; preds = %227, %225
  br label %244

; <label>:244:                                    ; preds = %243, %213
  br label %245

; <label>:245:                                    ; preds = %244
  %246 = load i32, i32* %13, align 4
  %247 = and i32 %246, 1
  store i32 %247, i32* %25, align 4
  br label %248

; <label>:248:                                    ; preds = %245
  %249 = load i32, i32* %14, align 4
  %250 = sub nsw i32 %249, 1
  store i32 %250, i32* %14, align 4
  %251 = load i32, i32* %13, align 4
  %252 = lshr i32 %251, 1
  store i32 %252, i32* %13, align 4
  br label %253

; <label>:253:                                    ; preds = %248
  %254 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %255 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %254, i32 0, i32 7
  %256 = load i32*, i32** %255, align 8
  store i32* %256, i32** %24, align 8
  %257 = load i32*, i32** %24, align 8
  %258 = getelementptr inbounds i32, i32* %257, i32 1
  store i32* %258, i32** %24, align 8
  %259 = load i32, i32* %257, align 4
  store i32 %259, i32* %23, align 4
  %260 = load i32, i32* %25, align 4
  %261 = icmp ne i32 %260, 0
  br i1 %261, label %262, label %745

; <label>:262:                                    ; preds = %253
  br label %263

; <label>:263:                                    ; preds = %262
  br label %264

; <label>:264:                                    ; preds = %514, %263
  br label %265

; <label>:265:                                    ; preds = %381, %264
  br label %266

; <label>:266:                                    ; preds = %265
  br label %267

; <label>:267:                                    ; preds = %266
  %268 = load i32, i32* %14, align 4
  %269 = icmp slt i32 %268, 12
  br i1 %269, label %270, label %323

; <label>:270:                                    ; preds = %267
  %271 = load i8*, i8** %16, align 8
  %272 = load i8*, i8** %17, align 8
  %273 = icmp uge i8* %271, %272
  br i1 %273, label %274, label %281

; <label>:274:                                    ; preds = %270
  %275 = load i32, i32* %14, align 4
  %276 = icmp eq i32 %275, 0
  br i1 %276, label %277, label %279

; <label>:277:                                    ; preds = %274
  %pgocount20 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 81)
  %278 = add i64 %pgocount20, 1
  store i64 %278, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 81)
  br label %516

; <label>:279:                                    ; preds = %274
  %pgocount21 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 21)
  %280 = add i64 %pgocount21, 1
  store i64 %280, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 21)
  store i32 12, i32* %14, align 4
  br label %322

; <label>:281:                                    ; preds = %270
  %282 = load i8*, i8** %21, align 8
  %283 = load i8*, i8** %16, align 8
  %284 = getelementptr inbounds i8, i8* %283, i32 1
  store i8* %284, i8** %16, align 8
  %285 = load i8, i8* %283, align 1
  %286 = zext i8 %285 to i64
  %287 = getelementptr inbounds i8, i8* %282, i64 %286
  %288 = load i8, i8* %287, align 1
  %289 = zext i8 %288 to i32
  %290 = load i32, i32* %14, align 4
  %291 = shl i32 %289, %290
  %292 = load i32, i32* %13, align 4
  %293 = or i32 %292, %291
  store i32 %293, i32* %13, align 4
  %294 = load i32, i32* %14, align 4
  %295 = add nsw i32 %294, 8
  store i32 %295, i32* %14, align 4
  %296 = icmp slt i32 %295, 12
  br i1 %296, label %297, label %320

; <label>:297:                                    ; preds = %281
  %298 = load i8*, i8** %16, align 8
  %299 = load i8*, i8** %17, align 8
  %300 = icmp uge i8* %298, %299
  br i1 %300, label %301, label %303

; <label>:301:                                    ; preds = %297
  %pgocount22 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 39)
  %302 = add i64 %pgocount22, 1
  store i64 %302, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 39)
  store i32 12, i32* %14, align 4
  br label %319

; <label>:303:                                    ; preds = %297
  %pgocount23 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 40)
  %304 = add i64 %pgocount23, 1
  store i64 %304, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 40)
  %305 = load i8*, i8** %21, align 8
  %306 = load i8*, i8** %16, align 8
  %307 = getelementptr inbounds i8, i8* %306, i32 1
  store i8* %307, i8** %16, align 8
  %308 = load i8, i8* %306, align 1
  %309 = zext i8 %308 to i64
  %310 = getelementptr inbounds i8, i8* %305, i64 %309
  %311 = load i8, i8* %310, align 1
  %312 = zext i8 %311 to i32
  %313 = load i32, i32* %14, align 4
  %314 = shl i32 %312, %313
  %315 = load i32, i32* %13, align 4
  %316 = or i32 %315, %314
  store i32 %316, i32* %13, align 4
  %317 = load i32, i32* %14, align 4
  %318 = add nsw i32 %317, 8
  store i32 %318, i32* %14, align 4
  br label %319

; <label>:319:                                    ; preds = %303, %301
  br label %320

; <label>:320:                                    ; preds = %319, %281
  %pgocount24 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 18)
  %321 = add i64 %pgocount24, 1
  store i64 %321, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 18)
  br label %322

; <label>:322:                                    ; preds = %320, %279
  br label %323

; <label>:323:                                    ; preds = %322, %267
  br label %324

; <label>:324:                                    ; preds = %323
  %325 = load i32, i32* %13, align 4
  %326 = and i32 %325, 4095
  %327 = zext i32 %326 to i64
  %328 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* getelementptr inbounds ([0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i32 0, i32 0), i64 %327
  store %struct.TIFFFaxTabEnt* %328, %struct.TIFFFaxTabEnt** %22, align 8
  br label %329

; <label>:329:                                    ; preds = %324
  %330 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %331 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %330, i32 0, i32 1
  %332 = load i8, i8* %331, align 1
  %333 = zext i8 %332 to i32
  %334 = load i32, i32* %14, align 4
  %335 = sub nsw i32 %334, %333
  store i32 %335, i32* %14, align 4
  %336 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %337 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %336, i32 0, i32 1
  %338 = load i8, i8* %337, align 1
  %339 = zext i8 %338 to i32
  %340 = load i32, i32* %13, align 4
  %341 = lshr i32 %340, %339
  store i32 %341, i32* %13, align 4
  br label %342

; <label>:342:                                    ; preds = %329
  br label %343

; <label>:343:                                    ; preds = %342
  %344 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %345 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %344, i32 0, i32 0
  %346 = load i8, i8* %345, align 4
  %347 = zext i8 %346 to i32
  switch i32 %347, label %377 [
    i32 12, label %349
    i32 7, label %351
    i32 9, label %._crit_edge
    i32 11, label %366
  ]

._crit_edge:                                      ; preds = %343
  %pgocount25 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 0)
  %348 = add i64 %pgocount25, 1
  store i64 %348, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 0)
  br label %366

; <label>:349:                                    ; preds = %343
  %pgocount26 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 78)
  %350 = add i64 %pgocount26, 1
  store i64 %350, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 78)
  store i32 1, i32* %20, align 4
  br label %631

; <label>:351:                                    ; preds = %343
  br label %352

; <label>:352:                                    ; preds = %351
  %353 = load i32, i32* %15, align 4
  %354 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %355 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %354, i32 0, i32 2
  %356 = load i32, i32* %355, align 4
  %357 = add i32 %353, %356
  %358 = load i32*, i32** %18, align 8
  %359 = getelementptr inbounds i32, i32* %358, i32 1
  store i32* %359, i32** %18, align 8
  store i32 %357, i32* %358, align 4
  %360 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %361 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %360, i32 0, i32 2
  %362 = load i32, i32* %361, align 4
  %363 = load i32, i32* %11, align 4
  %364 = add i32 %363, %362
  store i32 %364, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %365

; <label>:365:                                    ; preds = %352
  br label %383

; <label>:366:                                    ; preds = %._crit_edge, %343
  %367 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %368 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %367, i32 0, i32 2
  %369 = load i32, i32* %368, align 4
  %370 = load i32, i32* %11, align 4
  %371 = add i32 %370, %369
  store i32 %371, i32* %11, align 4
  %372 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %373 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %372, i32 0, i32 2
  %374 = load i32, i32* %373, align 4
  %375 = load i32, i32* %15, align 4
  %376 = add i32 %375, %374
  store i32 %376, i32* %15, align 4
  br label %381

; <label>:377:                                    ; preds = %343
  %pgocount27 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 79)
  %378 = add i64 %pgocount27, 1
  store i64 %378, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 79)
  %379 = load %struct.tiff*, %struct.tiff** %6, align 8
  %380 = load i32, i32* %11, align 4
  call void @Fax3Unexpected(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i32 0, i32 0), %struct.tiff* %379, i32 %380)
  br label %631

; <label>:381:                                    ; preds = %366
  %pgocount28 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 8)
  %382 = add i64 %pgocount28, 1
  store i64 %382, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 8)
  br label %265

; <label>:383:                                    ; preds = %365
  %384 = load i32, i32* %11, align 4
  %385 = load i32, i32* %12, align 4
  %386 = icmp sge i32 %384, %385
  br i1 %386, label %387, label %389

; <label>:387:                                    ; preds = %383
  %pgocount29 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 140)
  %388 = add i64 %pgocount29, 1
  store i64 %388, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 140)
  br label %631

; <label>:389:                                    ; preds = %383
  br label %390

; <label>:390:                                    ; preds = %506, %389
  br label %391

; <label>:391:                                    ; preds = %390
  br label %392

; <label>:392:                                    ; preds = %391
  %393 = load i32, i32* %14, align 4
  %394 = icmp slt i32 %393, 13
  br i1 %394, label %395, label %448

; <label>:395:                                    ; preds = %392
  %396 = load i8*, i8** %16, align 8
  %397 = load i8*, i8** %17, align 8
  %398 = icmp uge i8* %396, %397
  br i1 %398, label %399, label %406

; <label>:399:                                    ; preds = %395
  %400 = load i32, i32* %14, align 4
  %401 = icmp eq i32 %400, 0
  br i1 %401, label %402, label %404

; <label>:402:                                    ; preds = %399
  %pgocount30 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 109)
  %403 = add i64 %pgocount30, 1
  store i64 %403, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 109)
  br label %516

; <label>:404:                                    ; preds = %399
  %pgocount31 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 41)
  %405 = add i64 %pgocount31, 1
  store i64 %405, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 41)
  store i32 13, i32* %14, align 4
  br label %447

; <label>:406:                                    ; preds = %395
  %407 = load i8*, i8** %21, align 8
  %408 = load i8*, i8** %16, align 8
  %409 = getelementptr inbounds i8, i8* %408, i32 1
  store i8* %409, i8** %16, align 8
  %410 = load i8, i8* %408, align 1
  %411 = zext i8 %410 to i64
  %412 = getelementptr inbounds i8, i8* %407, i64 %411
  %413 = load i8, i8* %412, align 1
  %414 = zext i8 %413 to i32
  %415 = load i32, i32* %14, align 4
  %416 = shl i32 %414, %415
  %417 = load i32, i32* %13, align 4
  %418 = or i32 %417, %416
  store i32 %418, i32* %13, align 4
  %419 = load i32, i32* %14, align 4
  %420 = add nsw i32 %419, 8
  store i32 %420, i32* %14, align 4
  %421 = icmp slt i32 %420, 13
  br i1 %421, label %422, label %445

; <label>:422:                                    ; preds = %406
  %423 = load i8*, i8** %16, align 8
  %424 = load i8*, i8** %17, align 8
  %425 = icmp uge i8* %423, %424
  br i1 %425, label %426, label %428

; <label>:426:                                    ; preds = %422
  %pgocount32 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 64)
  %427 = add i64 %pgocount32, 1
  store i64 %427, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 64)
  store i32 13, i32* %14, align 4
  br label %444

; <label>:428:                                    ; preds = %422
  %pgocount33 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 65)
  %429 = add i64 %pgocount33, 1
  store i64 %429, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 65)
  %430 = load i8*, i8** %21, align 8
  %431 = load i8*, i8** %16, align 8
  %432 = getelementptr inbounds i8, i8* %431, i32 1
  store i8* %432, i8** %16, align 8
  %433 = load i8, i8* %431, align 1
  %434 = zext i8 %433 to i64
  %435 = getelementptr inbounds i8, i8* %430, i64 %434
  %436 = load i8, i8* %435, align 1
  %437 = zext i8 %436 to i32
  %438 = load i32, i32* %14, align 4
  %439 = shl i32 %437, %438
  %440 = load i32, i32* %13, align 4
  %441 = or i32 %440, %439
  store i32 %441, i32* %13, align 4
  %442 = load i32, i32* %14, align 4
  %443 = add nsw i32 %442, 8
  store i32 %443, i32* %14, align 4
  br label %444

; <label>:444:                                    ; preds = %428, %426
  br label %445

; <label>:445:                                    ; preds = %444, %406
  %pgocount34 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 38)
  %446 = add i64 %pgocount34, 1
  store i64 %446, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 38)
  br label %447

; <label>:447:                                    ; preds = %445, %404
  br label %448

; <label>:448:                                    ; preds = %447, %392
  br label %449

; <label>:449:                                    ; preds = %448
  %450 = load i32, i32* %13, align 4
  %451 = and i32 %450, 8191
  %452 = zext i32 %451 to i64
  %453 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* getelementptr inbounds ([0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i32 0, i32 0), i64 %452
  store %struct.TIFFFaxTabEnt* %453, %struct.TIFFFaxTabEnt** %22, align 8
  br label %454

; <label>:454:                                    ; preds = %449
  %455 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %456 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %455, i32 0, i32 1
  %457 = load i8, i8* %456, align 1
  %458 = zext i8 %457 to i32
  %459 = load i32, i32* %14, align 4
  %460 = sub nsw i32 %459, %458
  store i32 %460, i32* %14, align 4
  %461 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %462 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %461, i32 0, i32 1
  %463 = load i8, i8* %462, align 1
  %464 = zext i8 %463 to i32
  %465 = load i32, i32* %13, align 4
  %466 = lshr i32 %465, %464
  store i32 %466, i32* %13, align 4
  br label %467

; <label>:467:                                    ; preds = %454
  br label %468

; <label>:468:                                    ; preds = %467
  %469 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %470 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %469, i32 0, i32 0
  %471 = load i8, i8* %470, align 4
  %472 = zext i8 %471 to i32
  switch i32 %472, label %502 [
    i32 12, label %474
    i32 8, label %476
    i32 10, label %._crit_edge1
    i32 11, label %491
  ]

._crit_edge1:                                     ; preds = %468
  %pgocount35 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 1)
  %473 = add i64 %pgocount35, 1
  store i64 %473, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 1)
  br label %491

; <label>:474:                                    ; preds = %468
  %pgocount36 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 99)
  %475 = add i64 %pgocount36, 1
  store i64 %475, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 99)
  store i32 1, i32* %20, align 4
  br label %631

; <label>:476:                                    ; preds = %468
  br label %477

; <label>:477:                                    ; preds = %476
  %478 = load i32, i32* %15, align 4
  %479 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %480 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %479, i32 0, i32 2
  %481 = load i32, i32* %480, align 4
  %482 = add i32 %478, %481
  %483 = load i32*, i32** %18, align 8
  %484 = getelementptr inbounds i32, i32* %483, i32 1
  store i32* %484, i32** %18, align 8
  store i32 %482, i32* %483, align 4
  %485 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %486 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %485, i32 0, i32 2
  %487 = load i32, i32* %486, align 4
  %488 = load i32, i32* %11, align 4
  %489 = add i32 %488, %487
  store i32 %489, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %490

; <label>:490:                                    ; preds = %477
  br label %508

; <label>:491:                                    ; preds = %._crit_edge1, %468
  %492 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %493 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %492, i32 0, i32 2
  %494 = load i32, i32* %493, align 4
  %495 = load i32, i32* %11, align 4
  %496 = add i32 %495, %494
  store i32 %496, i32* %11, align 4
  %497 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %498 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %497, i32 0, i32 2
  %499 = load i32, i32* %498, align 4
  %500 = load i32, i32* %15, align 4
  %501 = add i32 %500, %499
  store i32 %501, i32* %15, align 4
  br label %506

; <label>:502:                                    ; preds = %468
  %pgocount37 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 100)
  %503 = add i64 %pgocount37, 1
  store i64 %503, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 100)
  %504 = load %struct.tiff*, %struct.tiff** %6, align 8
  %505 = load i32, i32* %11, align 4
  call void @Fax3Unexpected(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i32 0, i32 0), %struct.tiff* %504, i32 %505)
  br label %631

; <label>:506:                                    ; preds = %491
  %pgocount38 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 19)
  %507 = add i64 %pgocount38, 1
  store i64 %507, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 19)
  br label %390

; <label>:508:                                    ; preds = %490
  %509 = load i32, i32* %11, align 4
  %510 = load i32, i32* %12, align 4
  %511 = icmp sge i32 %509, %510
  br i1 %511, label %512, label %514

; <label>:512:                                    ; preds = %508
  %pgocount39 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 145)
  %513 = add i64 %pgocount39, 1
  store i64 %513, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 145)
  br label %631

; <label>:514:                                    ; preds = %508
  %pgocount40 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 103)
  %515 = add i64 %pgocount40, 1
  store i64 %515, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 103)
  br label %264

; <label>:516:                                    ; preds = %402, %277
  %517 = load %struct.tiff*, %struct.tiff** %6, align 8
  %518 = load i32, i32* %11, align 4
  call void @Fax3PrematureEOF(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i32 0, i32 0), %struct.tiff* %517, i32 %518)
  br label %519

; <label>:519:                                    ; preds = %516
  %520 = load i32, i32* %15, align 4
  %521 = icmp ne i32 %520, 0
  br i1 %521, label %522, label %532

; <label>:522:                                    ; preds = %519
  %pgocount41 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 84)
  %523 = add i64 %pgocount41, 1
  store i64 %523, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 84)
  br label %524

; <label>:524:                                    ; preds = %522
  %525 = load i32, i32* %15, align 4
  %526 = add nsw i32 %525, 0
  %527 = load i32*, i32** %18, align 8
  %528 = getelementptr inbounds i32, i32* %527, i32 1
  store i32* %528, i32** %18, align 8
  store i32 %526, i32* %527, align 4
  %529 = load i32, i32* %11, align 4
  %530 = add nsw i32 %529, 0
  store i32 %530, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %531

; <label>:531:                                    ; preds = %524
  br label %532

; <label>:532:                                    ; preds = %531, %519
  %533 = load i32, i32* %11, align 4
  %534 = load i32, i32* %12, align 4
  %535 = icmp ne i32 %533, %534
  br i1 %535, label %536, label %629

; <label>:536:                                    ; preds = %532
  %537 = load %struct.tiff*, %struct.tiff** %6, align 8
  %538 = load i32, i32* %11, align 4
  %539 = load i32, i32* %12, align 4
  call void @Fax3BadLength(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i32 0, i32 0), %struct.tiff* %537, i32 %538, i32 %539)
  br label %540

; <label>:540:                                    ; preds = %551, %536
  %541 = load i32, i32* %11, align 4
  %542 = load i32, i32* %12, align 4
  %543 = icmp sgt i32 %541, %542
  br i1 %543, label %544, label %549

; <label>:544:                                    ; preds = %540
  %pgocount42 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 37)
  %545 = add i64 %pgocount42, 1
  store i64 %545, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 37)
  %546 = load i32*, i32** %18, align 8
  %547 = load i32*, i32** %19, align 8
  %548 = icmp ugt i32* %546, %547
  br label %549

; <label>:549:                                    ; preds = %544, %540
  %550 = phi i1 [ false, %540 ], [ %548, %544 ]
  br i1 %550, label %551, label %558

; <label>:551:                                    ; preds = %549
  %pgocount43 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 32)
  %552 = add i64 %pgocount43, 1
  store i64 %552, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 32)
  %553 = load i32*, i32** %18, align 8
  %554 = getelementptr inbounds i32, i32* %553, i32 -1
  store i32* %554, i32** %18, align 8
  %555 = load i32, i32* %554, align 4
  %556 = load i32, i32* %11, align 4
  %557 = sub i32 %556, %555
  store i32 %557, i32* %11, align 4
  br label %540

; <label>:558:                                    ; preds = %549
  %559 = load i32, i32* %11, align 4
  %560 = load i32, i32* %12, align 4
  %561 = icmp slt i32 %559, %560
  br i1 %561, label %562, label %602

; <label>:562:                                    ; preds = %558
  %563 = load i32, i32* %11, align 4
  %564 = icmp slt i32 %563, 0
  br i1 %564, label %565, label %567

; <label>:565:                                    ; preds = %562
  %pgocount44 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 129)
  %566 = add i64 %pgocount44, 1
  store i64 %566, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 129)
  store i32 0, i32* %11, align 4
  br label %567

; <label>:567:                                    ; preds = %565, %562
  %568 = load i32*, i32** %18, align 8
  %569 = load i32*, i32** %19, align 8
  %570 = ptrtoint i32* %568 to i64
  %571 = ptrtoint i32* %569 to i64
  %572 = sub i64 %570, %571
  %573 = sdiv exact i64 %572, 4
  %574 = and i64 %573, 1
  %575 = icmp ne i64 %574, 0
  br i1 %575, label %576, label %586

; <label>:576:                                    ; preds = %567
  br label %577

; <label>:577:                                    ; preds = %576
  %578 = load i32, i32* %15, align 4
  %579 = add nsw i32 %578, 0
  %580 = load i32*, i32** %18, align 8
  %581 = getelementptr inbounds i32, i32* %580, i32 1
  store i32* %581, i32** %18, align 8
  store i32 %579, i32* %580, align 4
  %582 = load i32, i32* %11, align 4
  %583 = add nsw i32 %582, 0
  store i32 %583, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %584

; <label>:584:                                    ; preds = %577
  %pgocount45 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 124)
  %585 = add i64 %pgocount45, 1
  store i64 %585, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 124)
  br label %586

; <label>:586:                                    ; preds = %584, %567
  br label %587

; <label>:587:                                    ; preds = %586
  %588 = load i32, i32* %15, align 4
  %589 = load i32, i32* %12, align 4
  %590 = load i32, i32* %11, align 4
  %591 = sub nsw i32 %589, %590
  %592 = add nsw i32 %588, %591
  %593 = load i32*, i32** %18, align 8
  %594 = getelementptr inbounds i32, i32* %593, i32 1
  store i32* %594, i32** %18, align 8
  store i32 %592, i32* %593, align 4
  %595 = load i32, i32* %12, align 4
  %596 = load i32, i32* %11, align 4
  %597 = sub nsw i32 %595, %596
  %598 = load i32, i32* %11, align 4
  %599 = add nsw i32 %598, %597
  store i32 %599, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %600

; <label>:600:                                    ; preds = %587
  %pgocount46 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 107)
  %601 = add i64 %pgocount46, 1
  store i64 %601, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 107)
  br label %628

; <label>:602:                                    ; preds = %558
  %603 = load i32, i32* %11, align 4
  %604 = load i32, i32* %12, align 4
  %605 = icmp sgt i32 %603, %604
  br i1 %605, label %606, label %626

; <label>:606:                                    ; preds = %602
  br label %607

; <label>:607:                                    ; preds = %606
  %608 = load i32, i32* %15, align 4
  %609 = load i32, i32* %12, align 4
  %610 = add nsw i32 %608, %609
  %611 = load i32*, i32** %18, align 8
  %612 = getelementptr inbounds i32, i32* %611, i32 1
  store i32* %612, i32** %18, align 8
  store i32 %610, i32* %611, align 4
  %613 = load i32, i32* %12, align 4
  %614 = load i32, i32* %11, align 4
  %615 = add nsw i32 %614, %613
  store i32 %615, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %616

; <label>:616:                                    ; preds = %607
  br label %617

; <label>:617:                                    ; preds = %616
  %618 = load i32, i32* %15, align 4
  %619 = add nsw i32 %618, 0
  %620 = load i32*, i32** %18, align 8
  %621 = getelementptr inbounds i32, i32* %620, i32 1
  store i32* %621, i32** %18, align 8
  store i32 %619, i32* %620, align 4
  %622 = load i32, i32* %11, align 4
  %623 = add nsw i32 %622, 0
  store i32 %623, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %624

; <label>:624:                                    ; preds = %617
  %pgocount47 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 125)
  %625 = add i64 %pgocount47, 1
  store i64 %625, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 125)
  br label %626

; <label>:626:                                    ; preds = %624, %602
  %pgocount48 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 108)
  %627 = add i64 %pgocount48, 1
  store i64 %627, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 108)
  br label %628

; <label>:628:                                    ; preds = %626, %600
  br label %629

; <label>:629:                                    ; preds = %628, %532
  br label %630

; <label>:630:                                    ; preds = %629
  br label %2074

; <label>:631:                                    ; preds = %512, %502, %474, %387, %377, %349
  br label %632

; <label>:632:                                    ; preds = %631
  %633 = load i32, i32* %15, align 4
  %634 = icmp ne i32 %633, 0
  br i1 %634, label %635, label %645

; <label>:635:                                    ; preds = %632
  br label %636

; <label>:636:                                    ; preds = %635
  %637 = load i32, i32* %15, align 4
  %638 = add nsw i32 %637, 0
  %639 = load i32*, i32** %18, align 8
  %640 = getelementptr inbounds i32, i32* %639, i32 1
  store i32* %640, i32** %18, align 8
  store i32 %638, i32* %639, align 4
  %641 = load i32, i32* %11, align 4
  %642 = add nsw i32 %641, 0
  store i32 %642, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %643

; <label>:643:                                    ; preds = %636
  %pgocount49 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 63)
  %644 = add i64 %pgocount49, 1
  store i64 %644, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 63)
  br label %645

; <label>:645:                                    ; preds = %643, %632
  %646 = load i32, i32* %11, align 4
  %647 = load i32, i32* %12, align 4
  %648 = icmp ne i32 %646, %647
  br i1 %648, label %649, label %742

; <label>:649:                                    ; preds = %645
  %650 = load %struct.tiff*, %struct.tiff** %6, align 8
  %651 = load i32, i32* %11, align 4
  %652 = load i32, i32* %12, align 4
  call void @Fax3BadLength(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i32 0, i32 0), %struct.tiff* %650, i32 %651, i32 %652)
  br label %653

; <label>:653:                                    ; preds = %664, %649
  %654 = load i32, i32* %11, align 4
  %655 = load i32, i32* %12, align 4
  %656 = icmp sgt i32 %654, %655
  br i1 %656, label %657, label %662

; <label>:657:                                    ; preds = %653
  %pgocount50 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 24)
  %658 = add i64 %pgocount50, 1
  store i64 %658, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 24)
  %659 = load i32*, i32** %18, align 8
  %660 = load i32*, i32** %19, align 8
  %661 = icmp ugt i32* %659, %660
  br label %662

; <label>:662:                                    ; preds = %657, %653
  %663 = phi i1 [ false, %653 ], [ %661, %657 ]
  br i1 %663, label %664, label %671

; <label>:664:                                    ; preds = %662
  %pgocount51 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 12)
  %665 = add i64 %pgocount51, 1
  store i64 %665, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 12)
  %666 = load i32*, i32** %18, align 8
  %667 = getelementptr inbounds i32, i32* %666, i32 -1
  store i32* %667, i32** %18, align 8
  %668 = load i32, i32* %667, align 4
  %669 = load i32, i32* %11, align 4
  %670 = sub i32 %669, %668
  store i32 %670, i32* %11, align 4
  br label %653

; <label>:671:                                    ; preds = %662
  %672 = load i32, i32* %11, align 4
  %673 = load i32, i32* %12, align 4
  %674 = icmp slt i32 %672, %673
  br i1 %674, label %675, label %715

; <label>:675:                                    ; preds = %671
  %676 = load i32, i32* %11, align 4
  %677 = icmp slt i32 %676, 0
  br i1 %677, label %678, label %680

; <label>:678:                                    ; preds = %675
  %pgocount52 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 106)
  %679 = add i64 %pgocount52, 1
  store i64 %679, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 106)
  store i32 0, i32* %11, align 4
  br label %680

; <label>:680:                                    ; preds = %678, %675
  %681 = load i32*, i32** %18, align 8
  %682 = load i32*, i32** %19, align 8
  %683 = ptrtoint i32* %681 to i64
  %684 = ptrtoint i32* %682 to i64
  %685 = sub i64 %683, %684
  %686 = sdiv exact i64 %685, 4
  %687 = and i64 %686, 1
  %688 = icmp ne i64 %687, 0
  br i1 %688, label %689, label %699

; <label>:689:                                    ; preds = %680
  br label %690

; <label>:690:                                    ; preds = %689
  %691 = load i32, i32* %15, align 4
  %692 = add nsw i32 %691, 0
  %693 = load i32*, i32** %18, align 8
  %694 = getelementptr inbounds i32, i32* %693, i32 1
  store i32* %694, i32** %18, align 8
  store i32 %692, i32* %693, align 4
  %695 = load i32, i32* %11, align 4
  %696 = add nsw i32 %695, 0
  store i32 %696, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %697

; <label>:697:                                    ; preds = %690
  %pgocount53 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 97)
  %698 = add i64 %pgocount53, 1
  store i64 %698, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 97)
  br label %699

; <label>:699:                                    ; preds = %697, %680
  br label %700

; <label>:700:                                    ; preds = %699
  %701 = load i32, i32* %15, align 4
  %702 = load i32, i32* %12, align 4
  %703 = load i32, i32* %11, align 4
  %704 = sub nsw i32 %702, %703
  %705 = add nsw i32 %701, %704
  %706 = load i32*, i32** %18, align 8
  %707 = getelementptr inbounds i32, i32* %706, i32 1
  store i32* %707, i32** %18, align 8
  store i32 %705, i32* %706, align 4
  %708 = load i32, i32* %12, align 4
  %709 = load i32, i32* %11, align 4
  %710 = sub nsw i32 %708, %709
  %711 = load i32, i32* %11, align 4
  %712 = add nsw i32 %711, %710
  store i32 %712, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %713

; <label>:713:                                    ; preds = %700
  %pgocount54 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 82)
  %714 = add i64 %pgocount54, 1
  store i64 %714, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 82)
  br label %741

; <label>:715:                                    ; preds = %671
  %716 = load i32, i32* %11, align 4
  %717 = load i32, i32* %12, align 4
  %718 = icmp sgt i32 %716, %717
  br i1 %718, label %719, label %739

; <label>:719:                                    ; preds = %715
  br label %720

; <label>:720:                                    ; preds = %719
  %721 = load i32, i32* %15, align 4
  %722 = load i32, i32* %12, align 4
  %723 = add nsw i32 %721, %722
  %724 = load i32*, i32** %18, align 8
  %725 = getelementptr inbounds i32, i32* %724, i32 1
  store i32* %725, i32** %18, align 8
  store i32 %723, i32* %724, align 4
  %726 = load i32, i32* %12, align 4
  %727 = load i32, i32* %11, align 4
  %728 = add nsw i32 %727, %726
  store i32 %728, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %729

; <label>:729:                                    ; preds = %720
  br label %730

; <label>:730:                                    ; preds = %729
  %731 = load i32, i32* %15, align 4
  %732 = add nsw i32 %731, 0
  %733 = load i32*, i32** %18, align 8
  %734 = getelementptr inbounds i32, i32* %733, i32 1
  store i32* %734, i32** %18, align 8
  store i32 %732, i32* %733, align 4
  %735 = load i32, i32* %11, align 4
  %736 = add nsw i32 %735, 0
  store i32 %736, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %737

; <label>:737:                                    ; preds = %730
  %pgocount55 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 98)
  %738 = add i64 %pgocount55, 1
  store i64 %738, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 98)
  br label %739

; <label>:739:                                    ; preds = %737, %715
  %pgocount56 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 83)
  %740 = add i64 %pgocount56, 1
  store i64 %740, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 83)
  br label %741

; <label>:741:                                    ; preds = %739, %713
  br label %742

; <label>:742:                                    ; preds = %741, %645
  br label %743

; <label>:743:                                    ; preds = %742
  br label %744

; <label>:744:                                    ; preds = %743
  br label %1911

; <label>:745:                                    ; preds = %253
  br label %746

; <label>:746:                                    ; preds = %745
  br label %747

; <label>:747:                                    ; preds = %1728, %746
  %748 = load i32, i32* %11, align 4
  %749 = load i32, i32* %12, align 4
  %750 = icmp slt i32 %748, %749
  br i1 %750, label %751, label %1729

; <label>:751:                                    ; preds = %747
  br label %752

; <label>:752:                                    ; preds = %751
  br label %753

; <label>:753:                                    ; preds = %752
  %754 = load i32, i32* %14, align 4
  %755 = icmp slt i32 %754, 7
  br i1 %755, label %756, label %784

; <label>:756:                                    ; preds = %753
  %757 = load i8*, i8** %16, align 8
  %758 = load i8*, i8** %17, align 8
  %759 = icmp uge i8* %757, %758
  br i1 %759, label %760, label %767

; <label>:760:                                    ; preds = %756
  %761 = load i32, i32* %14, align 4
  %762 = icmp eq i32 %761, 0
  br i1 %762, label %763, label %765

; <label>:763:                                    ; preds = %760
  %pgocount57 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 130)
  %764 = add i64 %pgocount57, 1
  store i64 %764, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 130)
  br label %1613

; <label>:765:                                    ; preds = %760
  %pgocount58 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 56)
  %766 = add i64 %pgocount58, 1
  store i64 %766, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 56)
  store i32 7, i32* %14, align 4
  br label %783

; <label>:767:                                    ; preds = %756
  %pgocount59 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 53)
  %768 = add i64 %pgocount59, 1
  store i64 %768, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 53)
  %769 = load i8*, i8** %21, align 8
  %770 = load i8*, i8** %16, align 8
  %771 = getelementptr inbounds i8, i8* %770, i32 1
  store i8* %771, i8** %16, align 8
  %772 = load i8, i8* %770, align 1
  %773 = zext i8 %772 to i64
  %774 = getelementptr inbounds i8, i8* %769, i64 %773
  %775 = load i8, i8* %774, align 1
  %776 = zext i8 %775 to i32
  %777 = load i32, i32* %14, align 4
  %778 = shl i32 %776, %777
  %779 = load i32, i32* %13, align 4
  %780 = or i32 %779, %778
  store i32 %780, i32* %13, align 4
  %781 = load i32, i32* %14, align 4
  %782 = add nsw i32 %781, 8
  store i32 %782, i32* %14, align 4
  br label %783

; <label>:783:                                    ; preds = %767, %765
  br label %784

; <label>:784:                                    ; preds = %783, %753
  br label %785

; <label>:785:                                    ; preds = %784
  %786 = load i32, i32* %13, align 4
  %787 = and i32 %786, 127
  %788 = zext i32 %787 to i64
  %789 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* getelementptr inbounds ([0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxMainTable, i32 0, i32 0), i64 %788
  store %struct.TIFFFaxTabEnt* %789, %struct.TIFFFaxTabEnt** %22, align 8
  br label %790

; <label>:790:                                    ; preds = %785
  %791 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %792 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %791, i32 0, i32 1
  %793 = load i8, i8* %792, align 1
  %794 = zext i8 %793 to i32
  %795 = load i32, i32* %14, align 4
  %796 = sub nsw i32 %795, %794
  store i32 %796, i32* %14, align 4
  %797 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %798 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %797, i32 0, i32 1
  %799 = load i8, i8* %798, align 1
  %800 = zext i8 %799 to i32
  %801 = load i32, i32* %13, align 4
  %802 = lshr i32 %801, %800
  store i32 %802, i32* %13, align 4
  br label %803

; <label>:803:                                    ; preds = %790
  br label %804

; <label>:804:                                    ; preds = %803
  %805 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %806 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %805, i32 0, i32 0
  %807 = load i8, i8* %806, align 4
  %808 = zext i8 %807 to i32
  switch i32 %808, label %1602 [
    i32 1, label %809
    i32 2, label %860
    i32 3, label %1367
    i32 4, label %1421
    i32 5, label %1483
    i32 6, label %1545
    i32 12, label %1554
  ]

; <label>:809:                                    ; preds = %804
  br label %810

; <label>:810:                                    ; preds = %809
  %811 = load i32*, i32** %18, align 8
  %812 = load i32*, i32** %19, align 8
  %813 = icmp ne i32* %811, %812
  br i1 %813, label %814, label %841

; <label>:814:                                    ; preds = %810
  br label %815

; <label>:815:                                    ; preds = %826, %814
  %816 = load i32, i32* %23, align 4
  %817 = load i32, i32* %11, align 4
  %818 = icmp sle i32 %816, %817
  br i1 %818, label %819, label %824

; <label>:819:                                    ; preds = %815
  %pgocount60 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 27)
  %820 = add i64 %pgocount60, 1
  store i64 %820, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 27)
  %821 = load i32, i32* %23, align 4
  %822 = load i32, i32* %12, align 4
  %823 = icmp slt i32 %821, %822
  br label %824

; <label>:824:                                    ; preds = %819, %815
  %825 = phi i1 [ false, %815 ], [ %823, %819 ]
  br i1 %825, label %826, label %839

; <label>:826:                                    ; preds = %824
  %pgocount61 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 13)
  %827 = add i64 %pgocount61, 1
  store i64 %827, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 13)
  %828 = load i32*, i32** %24, align 8
  %829 = getelementptr inbounds i32, i32* %828, i64 0
  %830 = load i32, i32* %829, align 4
  %831 = load i32*, i32** %24, align 8
  %832 = getelementptr inbounds i32, i32* %831, i64 1
  %833 = load i32, i32* %832, align 4
  %834 = add i32 %830, %833
  %835 = load i32, i32* %23, align 4
  %836 = add i32 %835, %834
  store i32 %836, i32* %23, align 4
  %837 = load i32*, i32** %24, align 8
  %838 = getelementptr inbounds i32, i32* %837, i64 2
  store i32* %838, i32** %24, align 8
  br label %815

; <label>:839:                                    ; preds = %824
  %pgocount62 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 72)
  %840 = add i64 %pgocount62, 1
  store i64 %840, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 72)
  br label %841

; <label>:841:                                    ; preds = %839, %810
  br label %842

; <label>:842:                                    ; preds = %841
  %pgocount63 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 59)
  %843 = add i64 %pgocount63, 1
  store i64 %843, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 59)
  %844 = load i32*, i32** %24, align 8
  %845 = getelementptr inbounds i32, i32* %844, i32 1
  store i32* %845, i32** %24, align 8
  %846 = load i32, i32* %844, align 4
  %847 = load i32, i32* %23, align 4
  %848 = add i32 %847, %846
  store i32 %848, i32* %23, align 4
  %849 = load i32, i32* %23, align 4
  %850 = load i32, i32* %11, align 4
  %851 = sub nsw i32 %849, %850
  %852 = load i32, i32* %15, align 4
  %853 = add nsw i32 %852, %851
  store i32 %853, i32* %15, align 4
  %854 = load i32, i32* %23, align 4
  store i32 %854, i32* %11, align 4
  %855 = load i32*, i32** %24, align 8
  %856 = getelementptr inbounds i32, i32* %855, i32 1
  store i32* %856, i32** %24, align 8
  %857 = load i32, i32* %855, align 4
  %858 = load i32, i32* %23, align 4
  %859 = add i32 %858, %857
  store i32 %859, i32* %23, align 4
  br label %1728

; <label>:860:                                    ; preds = %804
  %861 = load i32*, i32** %18, align 8
  %862 = load i32*, i32** %19, align 8
  %863 = ptrtoint i32* %861 to i64
  %864 = ptrtoint i32* %862 to i64
  %865 = sub i64 %863, %864
  %866 = sdiv exact i64 %865, 4
  %867 = and i64 %866, 1
  %868 = icmp ne i64 %867, 0
  br i1 %868, label %869, label %1101

; <label>:869:                                    ; preds = %860
  br label %870

; <label>:870:                                    ; preds = %982, %869
  br label %871

; <label>:871:                                    ; preds = %870
  br label %872

; <label>:872:                                    ; preds = %871
  %873 = load i32, i32* %14, align 4
  %874 = icmp slt i32 %873, 13
  br i1 %874, label %875, label %928

; <label>:875:                                    ; preds = %872
  %876 = load i8*, i8** %16, align 8
  %877 = load i8*, i8** %17, align 8
  %878 = icmp uge i8* %876, %877
  br i1 %878, label %879, label %886

; <label>:879:                                    ; preds = %875
  %880 = load i32, i32* %14, align 4
  %881 = icmp eq i32 %880, 0
  br i1 %881, label %882, label %884

; <label>:882:                                    ; preds = %879
  %pgocount64 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 113)
  %883 = add i64 %pgocount64, 1
  store i64 %883, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 113)
  br label %1613

; <label>:884:                                    ; preds = %879
  %pgocount65 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 44)
  %885 = add i64 %pgocount65, 1
  store i64 %885, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 44)
  store i32 13, i32* %14, align 4
  br label %927

; <label>:886:                                    ; preds = %875
  %887 = load i8*, i8** %21, align 8
  %888 = load i8*, i8** %16, align 8
  %889 = getelementptr inbounds i8, i8* %888, i32 1
  store i8* %889, i8** %16, align 8
  %890 = load i8, i8* %888, align 1
  %891 = zext i8 %890 to i64
  %892 = getelementptr inbounds i8, i8* %887, i64 %891
  %893 = load i8, i8* %892, align 1
  %894 = zext i8 %893 to i32
  %895 = load i32, i32* %14, align 4
  %896 = shl i32 %894, %895
  %897 = load i32, i32* %13, align 4
  %898 = or i32 %897, %896
  store i32 %898, i32* %13, align 4
  %899 = load i32, i32* %14, align 4
  %900 = add nsw i32 %899, 8
  store i32 %900, i32* %14, align 4
  %901 = icmp slt i32 %900, 13
  br i1 %901, label %902, label %925

; <label>:902:                                    ; preds = %886
  %903 = load i8*, i8** %16, align 8
  %904 = load i8*, i8** %17, align 8
  %905 = icmp uge i8* %903, %904
  br i1 %905, label %906, label %908

; <label>:906:                                    ; preds = %902
  %pgocount66 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 67)
  %907 = add i64 %pgocount66, 1
  store i64 %907, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 67)
  store i32 13, i32* %14, align 4
  br label %924

; <label>:908:                                    ; preds = %902
  %pgocount67 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 68)
  %909 = add i64 %pgocount67, 1
  store i64 %909, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 68)
  %910 = load i8*, i8** %21, align 8
  %911 = load i8*, i8** %16, align 8
  %912 = getelementptr inbounds i8, i8* %911, i32 1
  store i8* %912, i8** %16, align 8
  %913 = load i8, i8* %911, align 1
  %914 = zext i8 %913 to i64
  %915 = getelementptr inbounds i8, i8* %910, i64 %914
  %916 = load i8, i8* %915, align 1
  %917 = zext i8 %916 to i32
  %918 = load i32, i32* %14, align 4
  %919 = shl i32 %917, %918
  %920 = load i32, i32* %13, align 4
  %921 = or i32 %920, %919
  store i32 %921, i32* %13, align 4
  %922 = load i32, i32* %14, align 4
  %923 = add nsw i32 %922, 8
  store i32 %923, i32* %14, align 4
  br label %924

; <label>:924:                                    ; preds = %908, %906
  br label %925

; <label>:925:                                    ; preds = %924, %886
  %pgocount68 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 42)
  %926 = add i64 %pgocount68, 1
  store i64 %926, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 42)
  br label %927

; <label>:927:                                    ; preds = %925, %884
  br label %928

; <label>:928:                                    ; preds = %927, %872
  br label %929

; <label>:929:                                    ; preds = %928
  %930 = load i32, i32* %13, align 4
  %931 = and i32 %930, 8191
  %932 = zext i32 %931 to i64
  %933 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* getelementptr inbounds ([0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i32 0, i32 0), i64 %932
  store %struct.TIFFFaxTabEnt* %933, %struct.TIFFFaxTabEnt** %22, align 8
  br label %934

; <label>:934:                                    ; preds = %929
  %935 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %936 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %935, i32 0, i32 1
  %937 = load i8, i8* %936, align 1
  %938 = zext i8 %937 to i32
  %939 = load i32, i32* %14, align 4
  %940 = sub nsw i32 %939, %938
  store i32 %940, i32* %14, align 4
  %941 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %942 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %941, i32 0, i32 1
  %943 = load i8, i8* %942, align 1
  %944 = zext i8 %943 to i32
  %945 = load i32, i32* %13, align 4
  %946 = lshr i32 %945, %944
  store i32 %946, i32* %13, align 4
  br label %947

; <label>:947:                                    ; preds = %934
  br label %948

; <label>:948:                                    ; preds = %947
  %949 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %950 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %949, i32 0, i32 0
  %951 = load i8, i8* %950, align 4
  %952 = zext i8 %951 to i32
  switch i32 %952, label %980 [
    i32 8, label %954
    i32 10, label %._crit_edge2
    i32 11, label %969
  ]

._crit_edge2:                                     ; preds = %948
  %pgocount69 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 2)
  %953 = add i64 %pgocount69, 1
  store i64 %953, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 2)
  br label %969

; <label>:954:                                    ; preds = %948
  br label %955

; <label>:955:                                    ; preds = %954
  %956 = load i32, i32* %15, align 4
  %957 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %958 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %957, i32 0, i32 2
  %959 = load i32, i32* %958, align 4
  %960 = add i32 %956, %959
  %961 = load i32*, i32** %18, align 8
  %962 = getelementptr inbounds i32, i32* %961, i32 1
  store i32* %962, i32** %18, align 8
  store i32 %960, i32* %961, align 4
  %963 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %964 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %963, i32 0, i32 2
  %965 = load i32, i32* %964, align 4
  %966 = load i32, i32* %11, align 4
  %967 = add i32 %966, %965
  store i32 %967, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %968

; <label>:968:                                    ; preds = %955
  br label %984

; <label>:969:                                    ; preds = %._crit_edge2, %948
  %970 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %971 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %970, i32 0, i32 2
  %972 = load i32, i32* %971, align 4
  %973 = load i32, i32* %11, align 4
  %974 = add i32 %973, %972
  store i32 %974, i32* %11, align 4
  %975 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %976 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %975, i32 0, i32 2
  %977 = load i32, i32* %976, align 4
  %978 = load i32, i32* %15, align 4
  %979 = add i32 %978, %977
  store i32 %979, i32* %15, align 4
  br label %982

; <label>:980:                                    ; preds = %948
  %pgocount70 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 95)
  %981 = add i64 %pgocount70, 1
  store i64 %981, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 95)
  br label %1607

; <label>:982:                                    ; preds = %969
  %pgocount71 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 22)
  %983 = add i64 %pgocount71, 1
  store i64 %983, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 22)
  br label %870

; <label>:984:                                    ; preds = %968
  br label %985

; <label>:985:                                    ; preds = %1097, %984
  br label %986

; <label>:986:                                    ; preds = %985
  br label %987

; <label>:987:                                    ; preds = %986
  %988 = load i32, i32* %14, align 4
  %989 = icmp slt i32 %988, 12
  br i1 %989, label %990, label %1043

; <label>:990:                                    ; preds = %987
  %991 = load i8*, i8** %16, align 8
  %992 = load i8*, i8** %17, align 8
  %993 = icmp uge i8* %991, %992
  br i1 %993, label %994, label %1001

; <label>:994:                                    ; preds = %990
  %995 = load i32, i32* %14, align 4
  %996 = icmp eq i32 %995, 0
  br i1 %996, label %997, label %999

; <label>:997:                                    ; preds = %994
  %pgocount72 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 133)
  %998 = add i64 %pgocount72, 1
  store i64 %998, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 133)
  br label %1613

; <label>:999:                                    ; preds = %994
  %pgocount73 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 57)
  %1000 = add i64 %pgocount73, 1
  store i64 %1000, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 57)
  store i32 12, i32* %14, align 4
  br label %1042

; <label>:1001:                                   ; preds = %990
  %1002 = load i8*, i8** %21, align 8
  %1003 = load i8*, i8** %16, align 8
  %1004 = getelementptr inbounds i8, i8* %1003, i32 1
  store i8* %1004, i8** %16, align 8
  %1005 = load i8, i8* %1003, align 1
  %1006 = zext i8 %1005 to i64
  %1007 = getelementptr inbounds i8, i8* %1002, i64 %1006
  %1008 = load i8, i8* %1007, align 1
  %1009 = zext i8 %1008 to i32
  %1010 = load i32, i32* %14, align 4
  %1011 = shl i32 %1009, %1010
  %1012 = load i32, i32* %13, align 4
  %1013 = or i32 %1012, %1011
  store i32 %1013, i32* %13, align 4
  %1014 = load i32, i32* %14, align 4
  %1015 = add nsw i32 %1014, 8
  store i32 %1015, i32* %14, align 4
  %1016 = icmp slt i32 %1015, 12
  br i1 %1016, label %1017, label %1040

; <label>:1017:                                   ; preds = %1001
  %1018 = load i8*, i8** %16, align 8
  %1019 = load i8*, i8** %17, align 8
  %1020 = icmp uge i8* %1018, %1019
  br i1 %1020, label %1021, label %1023

; <label>:1021:                                   ; preds = %1017
  %pgocount74 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 86)
  %1022 = add i64 %pgocount74, 1
  store i64 %1022, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 86)
  store i32 12, i32* %14, align 4
  br label %1039

; <label>:1023:                                   ; preds = %1017
  %pgocount75 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 87)
  %1024 = add i64 %pgocount75, 1
  store i64 %1024, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 87)
  %1025 = load i8*, i8** %21, align 8
  %1026 = load i8*, i8** %16, align 8
  %1027 = getelementptr inbounds i8, i8* %1026, i32 1
  store i8* %1027, i8** %16, align 8
  %1028 = load i8, i8* %1026, align 1
  %1029 = zext i8 %1028 to i64
  %1030 = getelementptr inbounds i8, i8* %1025, i64 %1029
  %1031 = load i8, i8* %1030, align 1
  %1032 = zext i8 %1031 to i32
  %1033 = load i32, i32* %14, align 4
  %1034 = shl i32 %1032, %1033
  %1035 = load i32, i32* %13, align 4
  %1036 = or i32 %1035, %1034
  store i32 %1036, i32* %13, align 4
  %1037 = load i32, i32* %14, align 4
  %1038 = add nsw i32 %1037, 8
  store i32 %1038, i32* %14, align 4
  br label %1039

; <label>:1039:                                   ; preds = %1023, %1021
  br label %1040

; <label>:1040:                                   ; preds = %1039, %1001
  %pgocount76 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 54)
  %1041 = add i64 %pgocount76, 1
  store i64 %1041, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 54)
  br label %1042

; <label>:1042:                                   ; preds = %1040, %999
  br label %1043

; <label>:1043:                                   ; preds = %1042, %987
  br label %1044

; <label>:1044:                                   ; preds = %1043
  %1045 = load i32, i32* %13, align 4
  %1046 = and i32 %1045, 4095
  %1047 = zext i32 %1046 to i64
  %1048 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* getelementptr inbounds ([0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i32 0, i32 0), i64 %1047
  store %struct.TIFFFaxTabEnt* %1048, %struct.TIFFFaxTabEnt** %22, align 8
  br label %1049

; <label>:1049:                                   ; preds = %1044
  %1050 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1051 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1050, i32 0, i32 1
  %1052 = load i8, i8* %1051, align 1
  %1053 = zext i8 %1052 to i32
  %1054 = load i32, i32* %14, align 4
  %1055 = sub nsw i32 %1054, %1053
  store i32 %1055, i32* %14, align 4
  %1056 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1057 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1056, i32 0, i32 1
  %1058 = load i8, i8* %1057, align 1
  %1059 = zext i8 %1058 to i32
  %1060 = load i32, i32* %13, align 4
  %1061 = lshr i32 %1060, %1059
  store i32 %1061, i32* %13, align 4
  br label %1062

; <label>:1062:                                   ; preds = %1049
  br label %1063

; <label>:1063:                                   ; preds = %1062
  %1064 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1065 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1064, i32 0, i32 0
  %1066 = load i8, i8* %1065, align 4
  %1067 = zext i8 %1066 to i32
  switch i32 %1067, label %1095 [
    i32 7, label %1069
    i32 9, label %._crit_edge4
    i32 11, label %1084
  ]

._crit_edge4:                                     ; preds = %1063
  %pgocount77 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 4)
  %1068 = add i64 %pgocount77, 1
  store i64 %1068, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 4)
  br label %1084

; <label>:1069:                                   ; preds = %1063
  br label %1070

; <label>:1070:                                   ; preds = %1069
  %1071 = load i32, i32* %15, align 4
  %1072 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1073 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1072, i32 0, i32 2
  %1074 = load i32, i32* %1073, align 4
  %1075 = add i32 %1071, %1074
  %1076 = load i32*, i32** %18, align 8
  %1077 = getelementptr inbounds i32, i32* %1076, i32 1
  store i32* %1077, i32** %18, align 8
  store i32 %1075, i32* %1076, align 4
  %1078 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1079 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1078, i32 0, i32 2
  %1080 = load i32, i32* %1079, align 4
  %1081 = load i32, i32* %11, align 4
  %1082 = add i32 %1081, %1080
  store i32 %1082, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1083

; <label>:1083:                                   ; preds = %1070
  br label %1099

; <label>:1084:                                   ; preds = %._crit_edge4, %1063
  %1085 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1086 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1085, i32 0, i32 2
  %1087 = load i32, i32* %1086, align 4
  %1088 = load i32, i32* %11, align 4
  %1089 = add i32 %1088, %1087
  store i32 %1089, i32* %11, align 4
  %1090 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1091 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1090, i32 0, i32 2
  %1092 = load i32, i32* %1091, align 4
  %1093 = load i32, i32* %15, align 4
  %1094 = add i32 %1093, %1092
  store i32 %1094, i32* %15, align 4
  br label %1097

; <label>:1095:                                   ; preds = %1063
  %pgocount78 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 119)
  %1096 = add i64 %pgocount78, 1
  store i64 %1096, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 119)
  br label %1610

; <label>:1097:                                   ; preds = %1084
  %pgocount79 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 35)
  %1098 = add i64 %pgocount79, 1
  store i64 %1098, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 35)
  br label %985

; <label>:1099:                                   ; preds = %1083
  %pgocount80 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 120)
  %1100 = add i64 %pgocount80, 1
  store i64 %1100, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 120)
  br label %1333

; <label>:1101:                                   ; preds = %860
  br label %1102

; <label>:1102:                                   ; preds = %1214, %1101
  br label %1103

; <label>:1103:                                   ; preds = %1102
  br label %1104

; <label>:1104:                                   ; preds = %1103
  %1105 = load i32, i32* %14, align 4
  %1106 = icmp slt i32 %1105, 12
  br i1 %1106, label %1107, label %1160

; <label>:1107:                                   ; preds = %1104
  %1108 = load i8*, i8** %16, align 8
  %1109 = load i8*, i8** %17, align 8
  %1110 = icmp uge i8* %1108, %1109
  br i1 %1110, label %1111, label %1118

; <label>:1111:                                   ; preds = %1107
  %1112 = load i32, i32* %14, align 4
  %1113 = icmp eq i32 %1112, 0
  br i1 %1113, label %1114, label %1116

; <label>:1114:                                   ; preds = %1111
  %pgocount81 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 114)
  %1115 = add i64 %pgocount81, 1
  store i64 %1115, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 114)
  br label %1613

; <label>:1116:                                   ; preds = %1111
  %pgocount82 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 45)
  %1117 = add i64 %pgocount82, 1
  store i64 %1117, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 45)
  store i32 12, i32* %14, align 4
  br label %1159

; <label>:1118:                                   ; preds = %1107
  %1119 = load i8*, i8** %21, align 8
  %1120 = load i8*, i8** %16, align 8
  %1121 = getelementptr inbounds i8, i8* %1120, i32 1
  store i8* %1121, i8** %16, align 8
  %1122 = load i8, i8* %1120, align 1
  %1123 = zext i8 %1122 to i64
  %1124 = getelementptr inbounds i8, i8* %1119, i64 %1123
  %1125 = load i8, i8* %1124, align 1
  %1126 = zext i8 %1125 to i32
  %1127 = load i32, i32* %14, align 4
  %1128 = shl i32 %1126, %1127
  %1129 = load i32, i32* %13, align 4
  %1130 = or i32 %1129, %1128
  store i32 %1130, i32* %13, align 4
  %1131 = load i32, i32* %14, align 4
  %1132 = add nsw i32 %1131, 8
  store i32 %1132, i32* %14, align 4
  %1133 = icmp slt i32 %1132, 12
  br i1 %1133, label %1134, label %1157

; <label>:1134:                                   ; preds = %1118
  %1135 = load i8*, i8** %16, align 8
  %1136 = load i8*, i8** %17, align 8
  %1137 = icmp uge i8* %1135, %1136
  br i1 %1137, label %1138, label %1140

; <label>:1138:                                   ; preds = %1134
  %pgocount83 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 69)
  %1139 = add i64 %pgocount83, 1
  store i64 %1139, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 69)
  store i32 12, i32* %14, align 4
  br label %1156

; <label>:1140:                                   ; preds = %1134
  %pgocount84 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 70)
  %1141 = add i64 %pgocount84, 1
  store i64 %1141, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 70)
  %1142 = load i8*, i8** %21, align 8
  %1143 = load i8*, i8** %16, align 8
  %1144 = getelementptr inbounds i8, i8* %1143, i32 1
  store i8* %1144, i8** %16, align 8
  %1145 = load i8, i8* %1143, align 1
  %1146 = zext i8 %1145 to i64
  %1147 = getelementptr inbounds i8, i8* %1142, i64 %1146
  %1148 = load i8, i8* %1147, align 1
  %1149 = zext i8 %1148 to i32
  %1150 = load i32, i32* %14, align 4
  %1151 = shl i32 %1149, %1150
  %1152 = load i32, i32* %13, align 4
  %1153 = or i32 %1152, %1151
  store i32 %1153, i32* %13, align 4
  %1154 = load i32, i32* %14, align 4
  %1155 = add nsw i32 %1154, 8
  store i32 %1155, i32* %14, align 4
  br label %1156

; <label>:1156:                                   ; preds = %1140, %1138
  br label %1157

; <label>:1157:                                   ; preds = %1156, %1118
  %pgocount85 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 43)
  %1158 = add i64 %pgocount85, 1
  store i64 %1158, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 43)
  br label %1159

; <label>:1159:                                   ; preds = %1157, %1116
  br label %1160

; <label>:1160:                                   ; preds = %1159, %1104
  br label %1161

; <label>:1161:                                   ; preds = %1160
  %1162 = load i32, i32* %13, align 4
  %1163 = and i32 %1162, 4095
  %1164 = zext i32 %1163 to i64
  %1165 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* getelementptr inbounds ([0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i32 0, i32 0), i64 %1164
  store %struct.TIFFFaxTabEnt* %1165, %struct.TIFFFaxTabEnt** %22, align 8
  br label %1166

; <label>:1166:                                   ; preds = %1161
  %1167 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1168 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1167, i32 0, i32 1
  %1169 = load i8, i8* %1168, align 1
  %1170 = zext i8 %1169 to i32
  %1171 = load i32, i32* %14, align 4
  %1172 = sub nsw i32 %1171, %1170
  store i32 %1172, i32* %14, align 4
  %1173 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1174 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1173, i32 0, i32 1
  %1175 = load i8, i8* %1174, align 1
  %1176 = zext i8 %1175 to i32
  %1177 = load i32, i32* %13, align 4
  %1178 = lshr i32 %1177, %1176
  store i32 %1178, i32* %13, align 4
  br label %1179

; <label>:1179:                                   ; preds = %1166
  br label %1180

; <label>:1180:                                   ; preds = %1179
  %1181 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1182 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1181, i32 0, i32 0
  %1183 = load i8, i8* %1182, align 4
  %1184 = zext i8 %1183 to i32
  switch i32 %1184, label %1212 [
    i32 7, label %1186
    i32 9, label %._crit_edge3
    i32 11, label %1201
  ]

._crit_edge3:                                     ; preds = %1180
  %pgocount86 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 3)
  %1185 = add i64 %pgocount86, 1
  store i64 %1185, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 3)
  br label %1201

; <label>:1186:                                   ; preds = %1180
  br label %1187

; <label>:1187:                                   ; preds = %1186
  %1188 = load i32, i32* %15, align 4
  %1189 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1190 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1189, i32 0, i32 2
  %1191 = load i32, i32* %1190, align 4
  %1192 = add i32 %1188, %1191
  %1193 = load i32*, i32** %18, align 8
  %1194 = getelementptr inbounds i32, i32* %1193, i32 1
  store i32* %1194, i32** %18, align 8
  store i32 %1192, i32* %1193, align 4
  %1195 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1196 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1195, i32 0, i32 2
  %1197 = load i32, i32* %1196, align 4
  %1198 = load i32, i32* %11, align 4
  %1199 = add i32 %1198, %1197
  store i32 %1199, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1200

; <label>:1200:                                   ; preds = %1187
  br label %1216

; <label>:1201:                                   ; preds = %._crit_edge3, %1180
  %1202 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1203 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1202, i32 0, i32 2
  %1204 = load i32, i32* %1203, align 4
  %1205 = load i32, i32* %11, align 4
  %1206 = add i32 %1205, %1204
  store i32 %1206, i32* %11, align 4
  %1207 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1208 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1207, i32 0, i32 2
  %1209 = load i32, i32* %1208, align 4
  %1210 = load i32, i32* %15, align 4
  %1211 = add i32 %1210, %1209
  store i32 %1211, i32* %15, align 4
  br label %1214

; <label>:1212:                                   ; preds = %1180
  %pgocount87 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 96)
  %1213 = add i64 %pgocount87, 1
  store i64 %1213, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 96)
  br label %1610

; <label>:1214:                                   ; preds = %1201
  %pgocount88 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 23)
  %1215 = add i64 %pgocount88, 1
  store i64 %1215, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 23)
  br label %1102

; <label>:1216:                                   ; preds = %1200
  br label %1217

; <label>:1217:                                   ; preds = %1329, %1216
  br label %1218

; <label>:1218:                                   ; preds = %1217
  br label %1219

; <label>:1219:                                   ; preds = %1218
  %1220 = load i32, i32* %14, align 4
  %1221 = icmp slt i32 %1220, 13
  br i1 %1221, label %1222, label %1275

; <label>:1222:                                   ; preds = %1219
  %1223 = load i8*, i8** %16, align 8
  %1224 = load i8*, i8** %17, align 8
  %1225 = icmp uge i8* %1223, %1224
  br i1 %1225, label %1226, label %1233

; <label>:1226:                                   ; preds = %1222
  %1227 = load i32, i32* %14, align 4
  %1228 = icmp eq i32 %1227, 0
  br i1 %1228, label %1229, label %1231

; <label>:1229:                                   ; preds = %1226
  %pgocount89 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 134)
  %1230 = add i64 %pgocount89, 1
  store i64 %1230, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 134)
  br label %1613

; <label>:1231:                                   ; preds = %1226
  %pgocount90 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 58)
  %1232 = add i64 %pgocount90, 1
  store i64 %1232, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 58)
  store i32 13, i32* %14, align 4
  br label %1274

; <label>:1233:                                   ; preds = %1222
  %1234 = load i8*, i8** %21, align 8
  %1235 = load i8*, i8** %16, align 8
  %1236 = getelementptr inbounds i8, i8* %1235, i32 1
  store i8* %1236, i8** %16, align 8
  %1237 = load i8, i8* %1235, align 1
  %1238 = zext i8 %1237 to i64
  %1239 = getelementptr inbounds i8, i8* %1234, i64 %1238
  %1240 = load i8, i8* %1239, align 1
  %1241 = zext i8 %1240 to i32
  %1242 = load i32, i32* %14, align 4
  %1243 = shl i32 %1241, %1242
  %1244 = load i32, i32* %13, align 4
  %1245 = or i32 %1244, %1243
  store i32 %1245, i32* %13, align 4
  %1246 = load i32, i32* %14, align 4
  %1247 = add nsw i32 %1246, 8
  store i32 %1247, i32* %14, align 4
  %1248 = icmp slt i32 %1247, 13
  br i1 %1248, label %1249, label %1272

; <label>:1249:                                   ; preds = %1233
  %1250 = load i8*, i8** %16, align 8
  %1251 = load i8*, i8** %17, align 8
  %1252 = icmp uge i8* %1250, %1251
  br i1 %1252, label %1253, label %1255

; <label>:1253:                                   ; preds = %1249
  %pgocount91 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 88)
  %1254 = add i64 %pgocount91, 1
  store i64 %1254, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 88)
  store i32 13, i32* %14, align 4
  br label %1271

; <label>:1255:                                   ; preds = %1249
  %pgocount92 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 89)
  %1256 = add i64 %pgocount92, 1
  store i64 %1256, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 89)
  %1257 = load i8*, i8** %21, align 8
  %1258 = load i8*, i8** %16, align 8
  %1259 = getelementptr inbounds i8, i8* %1258, i32 1
  store i8* %1259, i8** %16, align 8
  %1260 = load i8, i8* %1258, align 1
  %1261 = zext i8 %1260 to i64
  %1262 = getelementptr inbounds i8, i8* %1257, i64 %1261
  %1263 = load i8, i8* %1262, align 1
  %1264 = zext i8 %1263 to i32
  %1265 = load i32, i32* %14, align 4
  %1266 = shl i32 %1264, %1265
  %1267 = load i32, i32* %13, align 4
  %1268 = or i32 %1267, %1266
  store i32 %1268, i32* %13, align 4
  %1269 = load i32, i32* %14, align 4
  %1270 = add nsw i32 %1269, 8
  store i32 %1270, i32* %14, align 4
  br label %1271

; <label>:1271:                                   ; preds = %1255, %1253
  br label %1272

; <label>:1272:                                   ; preds = %1271, %1233
  %pgocount93 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 55)
  %1273 = add i64 %pgocount93, 1
  store i64 %1273, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 55)
  br label %1274

; <label>:1274:                                   ; preds = %1272, %1231
  br label %1275

; <label>:1275:                                   ; preds = %1274, %1219
  br label %1276

; <label>:1276:                                   ; preds = %1275
  %1277 = load i32, i32* %13, align 4
  %1278 = and i32 %1277, 8191
  %1279 = zext i32 %1278 to i64
  %1280 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* getelementptr inbounds ([0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i32 0, i32 0), i64 %1279
  store %struct.TIFFFaxTabEnt* %1280, %struct.TIFFFaxTabEnt** %22, align 8
  br label %1281

; <label>:1281:                                   ; preds = %1276
  %1282 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1283 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1282, i32 0, i32 1
  %1284 = load i8, i8* %1283, align 1
  %1285 = zext i8 %1284 to i32
  %1286 = load i32, i32* %14, align 4
  %1287 = sub nsw i32 %1286, %1285
  store i32 %1287, i32* %14, align 4
  %1288 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1289 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1288, i32 0, i32 1
  %1290 = load i8, i8* %1289, align 1
  %1291 = zext i8 %1290 to i32
  %1292 = load i32, i32* %13, align 4
  %1293 = lshr i32 %1292, %1291
  store i32 %1293, i32* %13, align 4
  br label %1294

; <label>:1294:                                   ; preds = %1281
  br label %1295

; <label>:1295:                                   ; preds = %1294
  %1296 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1297 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1296, i32 0, i32 0
  %1298 = load i8, i8* %1297, align 4
  %1299 = zext i8 %1298 to i32
  switch i32 %1299, label %1327 [
    i32 8, label %1301
    i32 10, label %._crit_edge5
    i32 11, label %1316
  ]

._crit_edge5:                                     ; preds = %1295
  %pgocount94 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 5)
  %1300 = add i64 %pgocount94, 1
  store i64 %1300, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 5)
  br label %1316

; <label>:1301:                                   ; preds = %1295
  br label %1302

; <label>:1302:                                   ; preds = %1301
  %1303 = load i32, i32* %15, align 4
  %1304 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1305 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1304, i32 0, i32 2
  %1306 = load i32, i32* %1305, align 4
  %1307 = add i32 %1303, %1306
  %1308 = load i32*, i32** %18, align 8
  %1309 = getelementptr inbounds i32, i32* %1308, i32 1
  store i32* %1309, i32** %18, align 8
  store i32 %1307, i32* %1308, align 4
  %1310 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1311 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1310, i32 0, i32 2
  %1312 = load i32, i32* %1311, align 4
  %1313 = load i32, i32* %11, align 4
  %1314 = add i32 %1313, %1312
  store i32 %1314, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1315

; <label>:1315:                                   ; preds = %1302
  br label %1331

; <label>:1316:                                   ; preds = %._crit_edge5, %1295
  %1317 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1318 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1317, i32 0, i32 2
  %1319 = load i32, i32* %1318, align 4
  %1320 = load i32, i32* %11, align 4
  %1321 = add i32 %1320, %1319
  store i32 %1321, i32* %11, align 4
  %1322 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1323 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1322, i32 0, i32 2
  %1324 = load i32, i32* %1323, align 4
  %1325 = load i32, i32* %15, align 4
  %1326 = add i32 %1325, %1324
  store i32 %1326, i32* %15, align 4
  br label %1329

; <label>:1327:                                   ; preds = %1295
  %pgocount95 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 121)
  %1328 = add i64 %pgocount95, 1
  store i64 %1328, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 121)
  br label %1607

; <label>:1329:                                   ; preds = %1316
  %pgocount96 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 36)
  %1330 = add i64 %pgocount96, 1
  store i64 %1330, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 36)
  br label %1217

; <label>:1331:                                   ; preds = %1315
  %pgocount97 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 122)
  %1332 = add i64 %pgocount97, 1
  store i64 %1332, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 122)
  br label %1333

; <label>:1333:                                   ; preds = %1331, %1099
  br label %1334

; <label>:1334:                                   ; preds = %1333
  %1335 = load i32*, i32** %18, align 8
  %1336 = load i32*, i32** %19, align 8
  %1337 = icmp ne i32* %1335, %1336
  br i1 %1337, label %1338, label %1365

; <label>:1338:                                   ; preds = %1334
  br label %1339

; <label>:1339:                                   ; preds = %1350, %1338
  %1340 = load i32, i32* %23, align 4
  %1341 = load i32, i32* %11, align 4
  %1342 = icmp sle i32 %1340, %1341
  br i1 %1342, label %1343, label %1348

; <label>:1343:                                   ; preds = %1339
  %pgocount98 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 50)
  %1344 = add i64 %pgocount98, 1
  store i64 %1344, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 50)
  %1345 = load i32, i32* %23, align 4
  %1346 = load i32, i32* %12, align 4
  %1347 = icmp slt i32 %1345, %1346
  br label %1348

; <label>:1348:                                   ; preds = %1343, %1339
  %1349 = phi i1 [ false, %1339 ], [ %1347, %1343 ]
  br i1 %1349, label %1350, label %1363

; <label>:1350:                                   ; preds = %1348
  %pgocount99 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 46)
  %1351 = add i64 %pgocount99, 1
  store i64 %1351, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 46)
  %1352 = load i32*, i32** %24, align 8
  %1353 = getelementptr inbounds i32, i32* %1352, i64 0
  %1354 = load i32, i32* %1353, align 4
  %1355 = load i32*, i32** %24, align 8
  %1356 = getelementptr inbounds i32, i32* %1355, i64 1
  %1357 = load i32, i32* %1356, align 4
  %1358 = add i32 %1354, %1357
  %1359 = load i32, i32* %23, align 4
  %1360 = add i32 %1359, %1358
  store i32 %1360, i32* %23, align 4
  %1361 = load i32*, i32** %24, align 8
  %1362 = getelementptr inbounds i32, i32* %1361, i64 2
  store i32* %1362, i32** %24, align 8
  br label %1339

; <label>:1363:                                   ; preds = %1348
  %pgocount100 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 115)
  %1364 = add i64 %pgocount100, 1
  store i64 %1364, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 115)
  br label %1365

; <label>:1365:                                   ; preds = %1363, %1334
  br label %1366

; <label>:1366:                                   ; preds = %1365
  br label %1728

; <label>:1367:                                   ; preds = %804
  br label %1368

; <label>:1368:                                   ; preds = %1367
  %1369 = load i32*, i32** %18, align 8
  %1370 = load i32*, i32** %19, align 8
  %1371 = icmp ne i32* %1369, %1370
  br i1 %1371, label %1372, label %1399

; <label>:1372:                                   ; preds = %1368
  br label %1373

; <label>:1373:                                   ; preds = %1384, %1372
  %1374 = load i32, i32* %23, align 4
  %1375 = load i32, i32* %11, align 4
  %1376 = icmp sle i32 %1374, %1375
  br i1 %1376, label %1377, label %1382

; <label>:1377:                                   ; preds = %1373
  %pgocount101 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 28)
  %1378 = add i64 %pgocount101, 1
  store i64 %1378, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 28)
  %1379 = load i32, i32* %23, align 4
  %1380 = load i32, i32* %12, align 4
  %1381 = icmp slt i32 %1379, %1380
  br label %1382

; <label>:1382:                                   ; preds = %1377, %1373
  %1383 = phi i1 [ false, %1373 ], [ %1381, %1377 ]
  br i1 %1383, label %1384, label %1397

; <label>:1384:                                   ; preds = %1382
  %pgocount102 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 14)
  %1385 = add i64 %pgocount102, 1
  store i64 %1385, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 14)
  %1386 = load i32*, i32** %24, align 8
  %1387 = getelementptr inbounds i32, i32* %1386, i64 0
  %1388 = load i32, i32* %1387, align 4
  %1389 = load i32*, i32** %24, align 8
  %1390 = getelementptr inbounds i32, i32* %1389, i64 1
  %1391 = load i32, i32* %1390, align 4
  %1392 = add i32 %1388, %1391
  %1393 = load i32, i32* %23, align 4
  %1394 = add i32 %1393, %1392
  store i32 %1394, i32* %23, align 4
  %1395 = load i32*, i32** %24, align 8
  %1396 = getelementptr inbounds i32, i32* %1395, i64 2
  store i32* %1396, i32** %24, align 8
  br label %1373

; <label>:1397:                                   ; preds = %1382
  %pgocount103 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 73)
  %1398 = add i64 %pgocount103, 1
  store i64 %1398, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 73)
  br label %1399

; <label>:1399:                                   ; preds = %1397, %1368
  br label %1400

; <label>:1400:                                   ; preds = %1399
  br label %1401

; <label>:1401:                                   ; preds = %1400
  %1402 = load i32, i32* %15, align 4
  %1403 = load i32, i32* %23, align 4
  %1404 = load i32, i32* %11, align 4
  %1405 = sub nsw i32 %1403, %1404
  %1406 = add nsw i32 %1402, %1405
  %1407 = load i32*, i32** %18, align 8
  %1408 = getelementptr inbounds i32, i32* %1407, i32 1
  store i32* %1408, i32** %18, align 8
  store i32 %1406, i32* %1407, align 4
  %1409 = load i32, i32* %23, align 4
  %1410 = load i32, i32* %11, align 4
  %1411 = sub nsw i32 %1409, %1410
  %1412 = load i32, i32* %11, align 4
  %1413 = add nsw i32 %1412, %1411
  store i32 %1413, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1414

; <label>:1414:                                   ; preds = %1401
  %pgocount104 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 60)
  %1415 = add i64 %pgocount104, 1
  store i64 %1415, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 60)
  %1416 = load i32*, i32** %24, align 8
  %1417 = getelementptr inbounds i32, i32* %1416, i32 1
  store i32* %1417, i32** %24, align 8
  %1418 = load i32, i32* %1416, align 4
  %1419 = load i32, i32* %23, align 4
  %1420 = add i32 %1419, %1418
  store i32 %1420, i32* %23, align 4
  br label %1728

; <label>:1421:                                   ; preds = %804
  br label %1422

; <label>:1422:                                   ; preds = %1421
  %1423 = load i32*, i32** %18, align 8
  %1424 = load i32*, i32** %19, align 8
  %1425 = icmp ne i32* %1423, %1424
  br i1 %1425, label %1426, label %1453

; <label>:1426:                                   ; preds = %1422
  br label %1427

; <label>:1427:                                   ; preds = %1438, %1426
  %1428 = load i32, i32* %23, align 4
  %1429 = load i32, i32* %11, align 4
  %1430 = icmp sle i32 %1428, %1429
  br i1 %1430, label %1431, label %1436

; <label>:1431:                                   ; preds = %1427
  %pgocount105 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 29)
  %1432 = add i64 %pgocount105, 1
  store i64 %1432, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 29)
  %1433 = load i32, i32* %23, align 4
  %1434 = load i32, i32* %12, align 4
  %1435 = icmp slt i32 %1433, %1434
  br label %1436

; <label>:1436:                                   ; preds = %1431, %1427
  %1437 = phi i1 [ false, %1427 ], [ %1435, %1431 ]
  br i1 %1437, label %1438, label %1451

; <label>:1438:                                   ; preds = %1436
  %pgocount106 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 15)
  %1439 = add i64 %pgocount106, 1
  store i64 %1439, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 15)
  %1440 = load i32*, i32** %24, align 8
  %1441 = getelementptr inbounds i32, i32* %1440, i64 0
  %1442 = load i32, i32* %1441, align 4
  %1443 = load i32*, i32** %24, align 8
  %1444 = getelementptr inbounds i32, i32* %1443, i64 1
  %1445 = load i32, i32* %1444, align 4
  %1446 = add i32 %1442, %1445
  %1447 = load i32, i32* %23, align 4
  %1448 = add i32 %1447, %1446
  store i32 %1448, i32* %23, align 4
  %1449 = load i32*, i32** %24, align 8
  %1450 = getelementptr inbounds i32, i32* %1449, i64 2
  store i32* %1450, i32** %24, align 8
  br label %1427

; <label>:1451:                                   ; preds = %1436
  %pgocount107 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 74)
  %1452 = add i64 %pgocount107, 1
  store i64 %1452, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 74)
  br label %1453

; <label>:1453:                                   ; preds = %1451, %1422
  br label %1454

; <label>:1454:                                   ; preds = %1453
  br label %1455

; <label>:1455:                                   ; preds = %1454
  %1456 = load i32, i32* %15, align 4
  %1457 = load i32, i32* %23, align 4
  %1458 = load i32, i32* %11, align 4
  %1459 = sub nsw i32 %1457, %1458
  %1460 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1461 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1460, i32 0, i32 2
  %1462 = load i32, i32* %1461, align 4
  %1463 = add i32 %1459, %1462
  %1464 = add i32 %1456, %1463
  %1465 = load i32*, i32** %18, align 8
  %1466 = getelementptr inbounds i32, i32* %1465, i32 1
  store i32* %1466, i32** %18, align 8
  store i32 %1464, i32* %1465, align 4
  %1467 = load i32, i32* %23, align 4
  %1468 = load i32, i32* %11, align 4
  %1469 = sub nsw i32 %1467, %1468
  %1470 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1471 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1470, i32 0, i32 2
  %1472 = load i32, i32* %1471, align 4
  %1473 = add i32 %1469, %1472
  %1474 = load i32, i32* %11, align 4
  %1475 = add i32 %1474, %1473
  store i32 %1475, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1476

; <label>:1476:                                   ; preds = %1455
  %pgocount108 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 61)
  %1477 = add i64 %pgocount108, 1
  store i64 %1477, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 61)
  %1478 = load i32*, i32** %24, align 8
  %1479 = getelementptr inbounds i32, i32* %1478, i32 1
  store i32* %1479, i32** %24, align 8
  %1480 = load i32, i32* %1478, align 4
  %1481 = load i32, i32* %23, align 4
  %1482 = add i32 %1481, %1480
  store i32 %1482, i32* %23, align 4
  br label %1728

; <label>:1483:                                   ; preds = %804
  br label %1484

; <label>:1484:                                   ; preds = %1483
  %1485 = load i32*, i32** %18, align 8
  %1486 = load i32*, i32** %19, align 8
  %1487 = icmp ne i32* %1485, %1486
  br i1 %1487, label %1488, label %1515

; <label>:1488:                                   ; preds = %1484
  br label %1489

; <label>:1489:                                   ; preds = %1500, %1488
  %1490 = load i32, i32* %23, align 4
  %1491 = load i32, i32* %11, align 4
  %1492 = icmp sle i32 %1490, %1491
  br i1 %1492, label %1493, label %1498

; <label>:1493:                                   ; preds = %1489
  %pgocount109 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 30)
  %1494 = add i64 %pgocount109, 1
  store i64 %1494, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 30)
  %1495 = load i32, i32* %23, align 4
  %1496 = load i32, i32* %12, align 4
  %1497 = icmp slt i32 %1495, %1496
  br label %1498

; <label>:1498:                                   ; preds = %1493, %1489
  %1499 = phi i1 [ false, %1489 ], [ %1497, %1493 ]
  br i1 %1499, label %1500, label %1513

; <label>:1500:                                   ; preds = %1498
  %pgocount110 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 16)
  %1501 = add i64 %pgocount110, 1
  store i64 %1501, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 16)
  %1502 = load i32*, i32** %24, align 8
  %1503 = getelementptr inbounds i32, i32* %1502, i64 0
  %1504 = load i32, i32* %1503, align 4
  %1505 = load i32*, i32** %24, align 8
  %1506 = getelementptr inbounds i32, i32* %1505, i64 1
  %1507 = load i32, i32* %1506, align 4
  %1508 = add i32 %1504, %1507
  %1509 = load i32, i32* %23, align 4
  %1510 = add i32 %1509, %1508
  store i32 %1510, i32* %23, align 4
  %1511 = load i32*, i32** %24, align 8
  %1512 = getelementptr inbounds i32, i32* %1511, i64 2
  store i32* %1512, i32** %24, align 8
  br label %1489

; <label>:1513:                                   ; preds = %1498
  %pgocount111 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 75)
  %1514 = add i64 %pgocount111, 1
  store i64 %1514, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 75)
  br label %1515

; <label>:1515:                                   ; preds = %1513, %1484
  br label %1516

; <label>:1516:                                   ; preds = %1515
  br label %1517

; <label>:1517:                                   ; preds = %1516
  %1518 = load i32, i32* %15, align 4
  %1519 = load i32, i32* %23, align 4
  %1520 = load i32, i32* %11, align 4
  %1521 = sub nsw i32 %1519, %1520
  %1522 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1523 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1522, i32 0, i32 2
  %1524 = load i32, i32* %1523, align 4
  %1525 = sub i32 %1521, %1524
  %1526 = add i32 %1518, %1525
  %1527 = load i32*, i32** %18, align 8
  %1528 = getelementptr inbounds i32, i32* %1527, i32 1
  store i32* %1528, i32** %18, align 8
  store i32 %1526, i32* %1527, align 4
  %1529 = load i32, i32* %23, align 4
  %1530 = load i32, i32* %11, align 4
  %1531 = sub nsw i32 %1529, %1530
  %1532 = load %struct.TIFFFaxTabEnt*, %struct.TIFFFaxTabEnt** %22, align 8
  %1533 = getelementptr inbounds %struct.TIFFFaxTabEnt, %struct.TIFFFaxTabEnt* %1532, i32 0, i32 2
  %1534 = load i32, i32* %1533, align 4
  %1535 = sub i32 %1531, %1534
  %1536 = load i32, i32* %11, align 4
  %1537 = add i32 %1536, %1535
  store i32 %1537, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1538

; <label>:1538:                                   ; preds = %1517
  %pgocount112 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 62)
  %1539 = add i64 %pgocount112, 1
  store i64 %1539, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 62)
  %1540 = load i32*, i32** %24, align 8
  %1541 = getelementptr inbounds i32, i32* %1540, i32 -1
  store i32* %1541, i32** %24, align 8
  %1542 = load i32, i32* %1541, align 4
  %1543 = load i32, i32* %23, align 4
  %1544 = sub i32 %1543, %1542
  store i32 %1544, i32* %23, align 4
  br label %1728

; <label>:1545:                                   ; preds = %804
  %pgocount113 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 126)
  %1546 = add i64 %pgocount113, 1
  store i64 %1546, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 126)
  %1547 = load i32, i32* %12, align 4
  %1548 = load i32, i32* %11, align 4
  %1549 = sub nsw i32 %1547, %1548
  %1550 = load i32*, i32** %18, align 8
  %1551 = getelementptr inbounds i32, i32* %1550, i32 1
  store i32* %1551, i32** %18, align 8
  store i32 %1549, i32* %1550, align 4
  %1552 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1553 = load i32, i32* %11, align 4
  call void @Fax3Extension(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i32 0, i32 0), %struct.tiff* %1552, i32 %1553)
  br label %1797

; <label>:1554:                                   ; preds = %804
  %1555 = load i32, i32* %12, align 4
  %1556 = load i32, i32* %11, align 4
  %1557 = sub nsw i32 %1555, %1556
  %1558 = load i32*, i32** %18, align 8
  %1559 = getelementptr inbounds i32, i32* %1558, i32 1
  store i32* %1559, i32** %18, align 8
  store i32 %1557, i32* %1558, align 4
  br label %1560

; <label>:1560:                                   ; preds = %1554
  %1561 = load i32, i32* %14, align 4
  %1562 = icmp slt i32 %1561, 5
  br i1 %1562, label %1563, label %1591

; <label>:1563:                                   ; preds = %1560
  %1564 = load i8*, i8** %16, align 8
  %1565 = load i8*, i8** %17, align 8
  %1566 = icmp uge i8* %1564, %1565
  br i1 %1566, label %1567, label %1574

; <label>:1567:                                   ; preds = %1563
  %1568 = load i32, i32* %14, align 4
  %1569 = icmp eq i32 %1568, 0
  br i1 %1569, label %1570, label %1572

; <label>:1570:                                   ; preds = %1567
  %pgocount114 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 146)
  %1571 = add i64 %pgocount114, 1
  store i64 %1571, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 146)
  br label %1613

; <label>:1572:                                   ; preds = %1567
  %pgocount115 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 142)
  %1573 = add i64 %pgocount115, 1
  store i64 %1573, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 142)
  store i32 5, i32* %14, align 4
  br label %1590

; <label>:1574:                                   ; preds = %1563
  %pgocount116 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 141)
  %1575 = add i64 %pgocount116, 1
  store i64 %1575, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 141)
  %1576 = load i8*, i8** %21, align 8
  %1577 = load i8*, i8** %16, align 8
  %1578 = getelementptr inbounds i8, i8* %1577, i32 1
  store i8* %1578, i8** %16, align 8
  %1579 = load i8, i8* %1577, align 1
  %1580 = zext i8 %1579 to i64
  %1581 = getelementptr inbounds i8, i8* %1576, i64 %1580
  %1582 = load i8, i8* %1581, align 1
  %1583 = zext i8 %1582 to i32
  %1584 = load i32, i32* %14, align 4
  %1585 = shl i32 %1583, %1584
  %1586 = load i32, i32* %13, align 4
  %1587 = or i32 %1586, %1585
  store i32 %1587, i32* %13, align 4
  %1588 = load i32, i32* %14, align 4
  %1589 = add nsw i32 %1588, 8
  store i32 %1589, i32* %14, align 4
  br label %1590

; <label>:1590:                                   ; preds = %1574, %1572
  br label %1591

; <label>:1591:                                   ; preds = %1590, %1560
  br label %1592

; <label>:1592:                                   ; preds = %1591
  %1593 = load i32, i32* %13, align 4
  %1594 = and i32 %1593, 31
  %1595 = icmp ne i32 %1594, 0
  br i1 %1595, label %1596, label %1600

; <label>:1596:                                   ; preds = %1592
  %pgocount117 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 135)
  %1597 = add i64 %pgocount117, 1
  store i64 %1597, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 135)
  %1598 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1599 = load i32, i32* %11, align 4
  call void @Fax3Unexpected(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i32 0, i32 0), %struct.tiff* %1598, i32 %1599)
  br label %1600

; <label>:1600:                                   ; preds = %1596, %1592
  %pgocount118 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 128)
  %1601 = add i64 %pgocount118, 1
  store i64 %1601, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 128)
  store i32 1, i32* %20, align 4
  br label %1797

; <label>:1602:                                   ; preds = %804
  %pgocount119 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 127)
  %1603 = add i64 %pgocount119, 1
  store i64 %1603, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 127)
  br label %1604

; <label>:1604:                                   ; preds = %1775, %1602
  %1605 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1606 = load i32, i32* %11, align 4
  call void @Fax3Unexpected(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i32 0, i32 0), %struct.tiff* %1605, i32 %1606)
  br label %1797

; <label>:1607:                                   ; preds = %1327, %980
  %1608 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1609 = load i32, i32* %11, align 4
  call void @Fax3Unexpected(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i32 0, i32 0), %struct.tiff* %1608, i32 %1609)
  br label %1797

; <label>:1610:                                   ; preds = %1212, %1095
  %1611 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1612 = load i32, i32* %11, align 4
  call void @Fax3Unexpected(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i32 0, i32 0), %struct.tiff* %1611, i32 %1612)
  br label %1797

; <label>:1613:                                   ; preds = %1749, %1570, %1229, %1114, %997, %882, %763
  %1614 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1615 = load i32, i32* %11, align 4
  call void @Fax3PrematureEOF(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i32 0, i32 0), %struct.tiff* %1614, i32 %1615)
  br label %1616

; <label>:1616:                                   ; preds = %1613
  %1617 = load i32, i32* %15, align 4
  %1618 = icmp ne i32 %1617, 0
  br i1 %1618, label %1619, label %1629

; <label>:1619:                                   ; preds = %1616
  %pgocount120 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 94)
  %1620 = add i64 %pgocount120, 1
  store i64 %1620, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 94)
  br label %1621

; <label>:1621:                                   ; preds = %1619
  %1622 = load i32, i32* %15, align 4
  %1623 = add nsw i32 %1622, 0
  %1624 = load i32*, i32** %18, align 8
  %1625 = getelementptr inbounds i32, i32* %1624, i32 1
  store i32* %1625, i32** %18, align 8
  store i32 %1623, i32* %1624, align 4
  %1626 = load i32, i32* %11, align 4
  %1627 = add nsw i32 %1626, 0
  store i32 %1627, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1628

; <label>:1628:                                   ; preds = %1621
  br label %1629

; <label>:1629:                                   ; preds = %1628, %1616
  %1630 = load i32, i32* %11, align 4
  %1631 = load i32, i32* %12, align 4
  %1632 = icmp ne i32 %1630, %1631
  br i1 %1632, label %1633, label %1726

; <label>:1633:                                   ; preds = %1629
  %1634 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1635 = load i32, i32* %11, align 4
  %1636 = load i32, i32* %12, align 4
  call void @Fax3BadLength(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i32 0, i32 0), %struct.tiff* %1634, i32 %1635, i32 %1636)
  br label %1637

; <label>:1637:                                   ; preds = %1648, %1633
  %1638 = load i32, i32* %11, align 4
  %1639 = load i32, i32* %12, align 4
  %1640 = icmp sgt i32 %1638, %1639
  br i1 %1640, label %1641, label %1646

; <label>:1641:                                   ; preds = %1637
  %pgocount121 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 49)
  %1642 = add i64 %pgocount121, 1
  store i64 %1642, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 49)
  %1643 = load i32*, i32** %18, align 8
  %1644 = load i32*, i32** %19, align 8
  %1645 = icmp ugt i32* %1643, %1644
  br label %1646

; <label>:1646:                                   ; preds = %1641, %1637
  %1647 = phi i1 [ false, %1637 ], [ %1645, %1641 ]
  br i1 %1647, label %1648, label %1655

; <label>:1648:                                   ; preds = %1646
  %pgocount122 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 34)
  %1649 = add i64 %pgocount122, 1
  store i64 %1649, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 34)
  %1650 = load i32*, i32** %18, align 8
  %1651 = getelementptr inbounds i32, i32* %1650, i32 -1
  store i32* %1651, i32** %18, align 8
  %1652 = load i32, i32* %1651, align 4
  %1653 = load i32, i32* %11, align 4
  %1654 = sub i32 %1653, %1652
  store i32 %1654, i32* %11, align 4
  br label %1637

; <label>:1655:                                   ; preds = %1646
  %1656 = load i32, i32* %11, align 4
  %1657 = load i32, i32* %12, align 4
  %1658 = icmp slt i32 %1656, %1657
  br i1 %1658, label %1659, label %1699

; <label>:1659:                                   ; preds = %1655
  %1660 = load i32, i32* %11, align 4
  %1661 = icmp slt i32 %1660, 0
  br i1 %1661, label %1662, label %1664

; <label>:1662:                                   ; preds = %1659
  %pgocount123 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 136)
  %1663 = add i64 %pgocount123, 1
  store i64 %1663, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 136)
  store i32 0, i32* %11, align 4
  br label %1664

; <label>:1664:                                   ; preds = %1662, %1659
  %1665 = load i32*, i32** %18, align 8
  %1666 = load i32*, i32** %19, align 8
  %1667 = ptrtoint i32* %1665 to i64
  %1668 = ptrtoint i32* %1666 to i64
  %1669 = sub i64 %1667, %1668
  %1670 = sdiv exact i64 %1669, 4
  %1671 = and i64 %1670, 1
  %1672 = icmp ne i64 %1671, 0
  br i1 %1672, label %1673, label %1683

; <label>:1673:                                   ; preds = %1664
  br label %1674

; <label>:1674:                                   ; preds = %1673
  %1675 = load i32, i32* %15, align 4
  %1676 = add nsw i32 %1675, 0
  %1677 = load i32*, i32** %18, align 8
  %1678 = getelementptr inbounds i32, i32* %1677, i32 1
  store i32* %1678, i32** %18, align 8
  store i32 %1676, i32* %1677, align 4
  %1679 = load i32, i32* %11, align 4
  %1680 = add nsw i32 %1679, 0
  store i32 %1680, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1681

; <label>:1681:                                   ; preds = %1674
  %pgocount124 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 131)
  %1682 = add i64 %pgocount124, 1
  store i64 %1682, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 131)
  br label %1683

; <label>:1683:                                   ; preds = %1681, %1664
  br label %1684

; <label>:1684:                                   ; preds = %1683
  %1685 = load i32, i32* %15, align 4
  %1686 = load i32, i32* %12, align 4
  %1687 = load i32, i32* %11, align 4
  %1688 = sub nsw i32 %1686, %1687
  %1689 = add nsw i32 %1685, %1688
  %1690 = load i32*, i32** %18, align 8
  %1691 = getelementptr inbounds i32, i32* %1690, i32 1
  store i32* %1691, i32** %18, align 8
  store i32 %1689, i32* %1690, align 4
  %1692 = load i32, i32* %12, align 4
  %1693 = load i32, i32* %11, align 4
  %1694 = sub nsw i32 %1692, %1693
  %1695 = load i32, i32* %11, align 4
  %1696 = add nsw i32 %1695, %1694
  store i32 %1696, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1697

; <label>:1697:                                   ; preds = %1684
  %pgocount125 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 117)
  %1698 = add i64 %pgocount125, 1
  store i64 %1698, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 117)
  br label %1725

; <label>:1699:                                   ; preds = %1655
  %1700 = load i32, i32* %11, align 4
  %1701 = load i32, i32* %12, align 4
  %1702 = icmp sgt i32 %1700, %1701
  br i1 %1702, label %1703, label %1723

; <label>:1703:                                   ; preds = %1699
  br label %1704

; <label>:1704:                                   ; preds = %1703
  %1705 = load i32, i32* %15, align 4
  %1706 = load i32, i32* %12, align 4
  %1707 = add nsw i32 %1705, %1706
  %1708 = load i32*, i32** %18, align 8
  %1709 = getelementptr inbounds i32, i32* %1708, i32 1
  store i32* %1709, i32** %18, align 8
  store i32 %1707, i32* %1708, align 4
  %1710 = load i32, i32* %12, align 4
  %1711 = load i32, i32* %11, align 4
  %1712 = add nsw i32 %1711, %1710
  store i32 %1712, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1713

; <label>:1713:                                   ; preds = %1704
  br label %1714

; <label>:1714:                                   ; preds = %1713
  %1715 = load i32, i32* %15, align 4
  %1716 = add nsw i32 %1715, 0
  %1717 = load i32*, i32** %18, align 8
  %1718 = getelementptr inbounds i32, i32* %1717, i32 1
  store i32* %1718, i32** %18, align 8
  store i32 %1716, i32* %1717, align 4
  %1719 = load i32, i32* %11, align 4
  %1720 = add nsw i32 %1719, 0
  store i32 %1720, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1721

; <label>:1721:                                   ; preds = %1714
  %pgocount126 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 132)
  %1722 = add i64 %pgocount126, 1
  store i64 %1722, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 132)
  br label %1723

; <label>:1723:                                   ; preds = %1721, %1699
  %pgocount127 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 118)
  %1724 = add i64 %pgocount127, 1
  store i64 %1724, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 118)
  br label %1725

; <label>:1725:                                   ; preds = %1723, %1697
  br label %1726

; <label>:1726:                                   ; preds = %1725, %1629
  br label %1727

; <label>:1727:                                   ; preds = %1726
  br label %2074

; <label>:1728:                                   ; preds = %1538, %1476, %1414, %1366, %842
  br label %747

; <label>:1729:                                   ; preds = %747
  %1730 = load i32, i32* %15, align 4
  %1731 = icmp ne i32 %1730, 0
  br i1 %1731, label %1732, label %1795

; <label>:1732:                                   ; preds = %1729
  %1733 = load i32, i32* %15, align 4
  %1734 = load i32, i32* %11, align 4
  %1735 = add nsw i32 %1733, %1734
  %1736 = load i32, i32* %12, align 4
  %1737 = icmp slt i32 %1735, %1736
  br i1 %1737, label %1738, label %1785

; <label>:1738:                                   ; preds = %1732
  br label %1739

; <label>:1739:                                   ; preds = %1738
  %1740 = load i32, i32* %14, align 4
  %1741 = icmp slt i32 %1740, 1
  br i1 %1741, label %1742, label %1770

; <label>:1742:                                   ; preds = %1739
  %1743 = load i8*, i8** %16, align 8
  %1744 = load i8*, i8** %17, align 8
  %1745 = icmp uge i8* %1743, %1744
  br i1 %1745, label %1746, label %1753

; <label>:1746:                                   ; preds = %1742
  %1747 = load i32, i32* %14, align 4
  %1748 = icmp eq i32 %1747, 0
  br i1 %1748, label %1749, label %1751

; <label>:1749:                                   ; preds = %1746
  %pgocount128 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 147)
  %1750 = add i64 %pgocount128, 1
  store i64 %1750, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 147)
  br label %1613

; <label>:1751:                                   ; preds = %1746
  %pgocount129 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 144)
  %1752 = add i64 %pgocount129, 1
  store i64 %1752, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 144)
  store i32 1, i32* %14, align 4
  br label %1769

; <label>:1753:                                   ; preds = %1742
  %pgocount130 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 143)
  %1754 = add i64 %pgocount130, 1
  store i64 %1754, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 143)
  %1755 = load i8*, i8** %21, align 8
  %1756 = load i8*, i8** %16, align 8
  %1757 = getelementptr inbounds i8, i8* %1756, i32 1
  store i8* %1757, i8** %16, align 8
  %1758 = load i8, i8* %1756, align 1
  %1759 = zext i8 %1758 to i64
  %1760 = getelementptr inbounds i8, i8* %1755, i64 %1759
  %1761 = load i8, i8* %1760, align 1
  %1762 = zext i8 %1761 to i32
  %1763 = load i32, i32* %14, align 4
  %1764 = shl i32 %1762, %1763
  %1765 = load i32, i32* %13, align 4
  %1766 = or i32 %1765, %1764
  store i32 %1766, i32* %13, align 4
  %1767 = load i32, i32* %14, align 4
  %1768 = add nsw i32 %1767, 8
  store i32 %1768, i32* %14, align 4
  br label %1769

; <label>:1769:                                   ; preds = %1753, %1751
  br label %1770

; <label>:1770:                                   ; preds = %1769, %1739
  br label %1771

; <label>:1771:                                   ; preds = %1770
  %1772 = load i32, i32* %13, align 4
  %1773 = and i32 %1772, 1
  %1774 = icmp ne i32 %1773, 0
  br i1 %1774, label %1777, label %1775

; <label>:1775:                                   ; preds = %1771
  %pgocount131 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 137)
  %1776 = add i64 %pgocount131, 1
  store i64 %1776, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 137)
  br label %1604

; <label>:1777:                                   ; preds = %1771
  br label %1778

; <label>:1778:                                   ; preds = %1777
  %1779 = load i32, i32* %14, align 4
  %1780 = sub nsw i32 %1779, 1
  store i32 %1780, i32* %14, align 4
  %1781 = load i32, i32* %13, align 4
  %1782 = lshr i32 %1781, 1
  store i32 %1782, i32* %13, align 4
  br label %1783

; <label>:1783:                                   ; preds = %1778
  %pgocount132 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 138)
  %1784 = add i64 %pgocount132, 1
  store i64 %1784, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 138)
  br label %1785

; <label>:1785:                                   ; preds = %1783, %1732
  br label %1786

; <label>:1786:                                   ; preds = %1785
  %1787 = load i32, i32* %15, align 4
  %1788 = add nsw i32 %1787, 0
  %1789 = load i32*, i32** %18, align 8
  %1790 = getelementptr inbounds i32, i32* %1789, i32 1
  store i32* %1790, i32** %18, align 8
  store i32 %1788, i32* %1789, align 4
  %1791 = load i32, i32* %11, align 4
  %1792 = add nsw i32 %1791, 0
  store i32 %1792, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1793

; <label>:1793:                                   ; preds = %1786
  %pgocount133 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 123)
  %1794 = add i64 %pgocount133, 1
  store i64 %1794, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 123)
  br label %1795

; <label>:1795:                                   ; preds = %1793, %1729
  %pgocount134 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 105)
  %1796 = add i64 %pgocount134, 1
  store i64 %1796, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 105)
  br label %1797

; <label>:1797:                                   ; preds = %1795, %1610, %1607, %1604, %1600, %1545
  br label %1798

; <label>:1798:                                   ; preds = %1797
  %1799 = load i32, i32* %15, align 4
  %1800 = icmp ne i32 %1799, 0
  br i1 %1800, label %1801, label %1811

; <label>:1801:                                   ; preds = %1798
  br label %1802

; <label>:1802:                                   ; preds = %1801
  %1803 = load i32, i32* %15, align 4
  %1804 = add nsw i32 %1803, 0
  %1805 = load i32*, i32** %18, align 8
  %1806 = getelementptr inbounds i32, i32* %1805, i32 1
  store i32* %1806, i32** %18, align 8
  store i32 %1804, i32* %1805, align 4
  %1807 = load i32, i32* %11, align 4
  %1808 = add nsw i32 %1807, 0
  store i32 %1808, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1809

; <label>:1809:                                   ; preds = %1802
  %pgocount135 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 80)
  %1810 = add i64 %pgocount135, 1
  store i64 %1810, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 80)
  br label %1811

; <label>:1811:                                   ; preds = %1809, %1798
  %1812 = load i32, i32* %11, align 4
  %1813 = load i32, i32* %12, align 4
  %1814 = icmp ne i32 %1812, %1813
  br i1 %1814, label %1815, label %1908

; <label>:1815:                                   ; preds = %1811
  %1816 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1817 = load i32, i32* %11, align 4
  %1818 = load i32, i32* %12, align 4
  call void @Fax3BadLength(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i32 0, i32 0), %struct.tiff* %1816, i32 %1817, i32 %1818)
  br label %1819

; <label>:1819:                                   ; preds = %1830, %1815
  %1820 = load i32, i32* %11, align 4
  %1821 = load i32, i32* %12, align 4
  %1822 = icmp sgt i32 %1820, %1821
  br i1 %1822, label %1823, label %1828

; <label>:1823:                                   ; preds = %1819
  %pgocount136 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 33)
  %1824 = add i64 %pgocount136, 1
  store i64 %1824, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 33)
  %1825 = load i32*, i32** %18, align 8
  %1826 = load i32*, i32** %19, align 8
  %1827 = icmp ugt i32* %1825, %1826
  br label %1828

; <label>:1828:                                   ; preds = %1823, %1819
  %1829 = phi i1 [ false, %1819 ], [ %1827, %1823 ]
  br i1 %1829, label %1830, label %1837

; <label>:1830:                                   ; preds = %1828
  %pgocount137 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 20)
  %1831 = add i64 %pgocount137, 1
  store i64 %1831, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 20)
  %1832 = load i32*, i32** %18, align 8
  %1833 = getelementptr inbounds i32, i32* %1832, i32 -1
  store i32* %1833, i32** %18, align 8
  %1834 = load i32, i32* %1833, align 4
  %1835 = load i32, i32* %11, align 4
  %1836 = sub i32 %1835, %1834
  store i32 %1836, i32* %11, align 4
  br label %1819

; <label>:1837:                                   ; preds = %1828
  %1838 = load i32, i32* %11, align 4
  %1839 = load i32, i32* %12, align 4
  %1840 = icmp slt i32 %1838, %1839
  br i1 %1840, label %1841, label %1881

; <label>:1841:                                   ; preds = %1837
  %1842 = load i32, i32* %11, align 4
  %1843 = icmp slt i32 %1842, 0
  br i1 %1843, label %1844, label %1846

; <label>:1844:                                   ; preds = %1841
  %pgocount138 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 116)
  %1845 = add i64 %pgocount138, 1
  store i64 %1845, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 116)
  store i32 0, i32* %11, align 4
  br label %1846

; <label>:1846:                                   ; preds = %1844, %1841
  %1847 = load i32*, i32** %18, align 8
  %1848 = load i32*, i32** %19, align 8
  %1849 = ptrtoint i32* %1847 to i64
  %1850 = ptrtoint i32* %1848 to i64
  %1851 = sub i64 %1849, %1850
  %1852 = sdiv exact i64 %1851, 4
  %1853 = and i64 %1852, 1
  %1854 = icmp ne i64 %1853, 0
  br i1 %1854, label %1855, label %1865

; <label>:1855:                                   ; preds = %1846
  br label %1856

; <label>:1856:                                   ; preds = %1855
  %1857 = load i32, i32* %15, align 4
  %1858 = add nsw i32 %1857, 0
  %1859 = load i32*, i32** %18, align 8
  %1860 = getelementptr inbounds i32, i32* %1859, i32 1
  store i32* %1860, i32** %18, align 8
  store i32 %1858, i32* %1859, align 4
  %1861 = load i32, i32* %11, align 4
  %1862 = add nsw i32 %1861, 0
  store i32 %1862, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1863

; <label>:1863:                                   ; preds = %1856
  %pgocount139 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 110)
  %1864 = add i64 %pgocount139, 1
  store i64 %1864, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 110)
  br label %1865

; <label>:1865:                                   ; preds = %1863, %1846
  br label %1866

; <label>:1866:                                   ; preds = %1865
  %1867 = load i32, i32* %15, align 4
  %1868 = load i32, i32* %12, align 4
  %1869 = load i32, i32* %11, align 4
  %1870 = sub nsw i32 %1868, %1869
  %1871 = add nsw i32 %1867, %1870
  %1872 = load i32*, i32** %18, align 8
  %1873 = getelementptr inbounds i32, i32* %1872, i32 1
  store i32* %1873, i32** %18, align 8
  store i32 %1871, i32* %1872, align 4
  %1874 = load i32, i32* %12, align 4
  %1875 = load i32, i32* %11, align 4
  %1876 = sub nsw i32 %1874, %1875
  %1877 = load i32, i32* %11, align 4
  %1878 = add nsw i32 %1877, %1876
  store i32 %1878, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1879

; <label>:1879:                                   ; preds = %1866
  %pgocount140 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 92)
  %1880 = add i64 %pgocount140, 1
  store i64 %1880, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 92)
  br label %1907

; <label>:1881:                                   ; preds = %1837
  %1882 = load i32, i32* %11, align 4
  %1883 = load i32, i32* %12, align 4
  %1884 = icmp sgt i32 %1882, %1883
  br i1 %1884, label %1885, label %1905

; <label>:1885:                                   ; preds = %1881
  br label %1886

; <label>:1886:                                   ; preds = %1885
  %1887 = load i32, i32* %15, align 4
  %1888 = load i32, i32* %12, align 4
  %1889 = add nsw i32 %1887, %1888
  %1890 = load i32*, i32** %18, align 8
  %1891 = getelementptr inbounds i32, i32* %1890, i32 1
  store i32* %1891, i32** %18, align 8
  store i32 %1889, i32* %1890, align 4
  %1892 = load i32, i32* %12, align 4
  %1893 = load i32, i32* %11, align 4
  %1894 = add nsw i32 %1893, %1892
  store i32 %1894, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1895

; <label>:1895:                                   ; preds = %1886
  br label %1896

; <label>:1896:                                   ; preds = %1895
  %1897 = load i32, i32* %15, align 4
  %1898 = add nsw i32 %1897, 0
  %1899 = load i32*, i32** %18, align 8
  %1900 = getelementptr inbounds i32, i32* %1899, i32 1
  store i32* %1900, i32** %18, align 8
  store i32 %1898, i32* %1899, align 4
  %1901 = load i32, i32* %11, align 4
  %1902 = add nsw i32 %1901, 0
  store i32 %1902, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1903

; <label>:1903:                                   ; preds = %1896
  %pgocount141 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 111)
  %1904 = add i64 %pgocount141, 1
  store i64 %1904, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 111)
  br label %1905

; <label>:1905:                                   ; preds = %1903, %1881
  %pgocount142 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 93)
  %1906 = add i64 %pgocount142, 1
  store i64 %1906, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 93)
  br label %1907

; <label>:1907:                                   ; preds = %1905, %1879
  br label %1908

; <label>:1908:                                   ; preds = %1907, %1811
  br label %1909

; <label>:1909:                                   ; preds = %1908
  br label %1910

; <label>:1910:                                   ; preds = %1909
  br label %1911

; <label>:1911:                                   ; preds = %1910, %744
  %1912 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1913 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1912, i32 0, i32 5
  %1914 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %1913, align 8
  %1915 = load i8*, i8** %7, align 8
  %1916 = load i32*, i32** %19, align 8
  %1917 = load i32*, i32** %18, align 8
  %1918 = load i32, i32* %12, align 4
  %1919 = ptrtoint void (i8*, i32*, i32*, i32)* %1914 to i64
  call void @__llvm_profile_instrument_target(i64 %1919, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3Decode2D to i8*), i32 0)
  call void %1914(i8* %1915, i32* %1916, i32* %1917, i32 %1918)
  br label %1920

; <label>:1920:                                   ; preds = %1911
  %1921 = load i32, i32* %15, align 4
  %1922 = add nsw i32 %1921, 0
  %1923 = load i32*, i32** %18, align 8
  %1924 = getelementptr inbounds i32, i32* %1923, i32 1
  store i32* %1924, i32** %18, align 8
  store i32 %1922, i32* %1923, align 4
  %1925 = load i32, i32* %11, align 4
  %1926 = add nsw i32 %1925, 0
  store i32 %1926, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1927

; <label>:1927:                                   ; preds = %1920
  %1928 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1929 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1928, i32 0, i32 8
  %1930 = load i32*, i32** %1929, align 8
  store i32* %1930, i32** %26, align 8
  %1931 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1932 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1931, i32 0, i32 7
  %1933 = load i32*, i32** %1932, align 8
  %1934 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1935 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1934, i32 0, i32 8
  store i32* %1933, i32** %1935, align 8
  %1936 = load i32*, i32** %26, align 8
  %1937 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1938 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1937, i32 0, i32 7
  store i32* %1936, i32** %1938, align 8
  %1939 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1940 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1939, i32 0, i32 0
  %1941 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %1940, i32 0, i32 1
  %1942 = load i32, i32* %1941, align 4
  %1943 = load i8*, i8** %7, align 8
  %1944 = zext i32 %1942 to i64
  %1945 = getelementptr inbounds i8, i8* %1943, i64 %1944
  store i8* %1945, i8** %7, align 8
  %1946 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %1947 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %1946, i32 0, i32 0
  %1948 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %1947, i32 0, i32 1
  %1949 = load i32, i32* %1948, align 4
  %1950 = load i32, i32* %8, align 4
  %1951 = sub i32 %1950, %1949
  store i32 %1951, i32* %8, align 4
  %1952 = load i32, i32* %8, align 4
  %1953 = icmp ne i32 %1952, 0
  br i1 %1953, label %1954, label %1960

; <label>:1954:                                   ; preds = %1927
  %pgocount143 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 51)
  %1955 = add i64 %pgocount143, 1
  store i64 %1955, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 51)
  %1956 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1957 = getelementptr inbounds %struct.tiff, %struct.tiff* %1956, i32 0, i32 11
  %1958 = load i32, i32* %1957, align 8
  %1959 = add i32 %1958, 1
  store i32 %1959, i32* %1957, align 8
  br label %1960

; <label>:1960:                                   ; preds = %1954, %1927
  br label %60

; <label>:1961:                                   ; preds = %223, %157, %83
  br label %1962

; <label>:1962:                                   ; preds = %1961
  %1963 = load i32, i32* %15, align 4
  %1964 = icmp ne i32 %1963, 0
  br i1 %1964, label %1965, label %1975

; <label>:1965:                                   ; preds = %1962
  %pgocount144 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 71)
  %1966 = add i64 %pgocount144, 1
  store i64 %1966, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 71)
  br label %1967

; <label>:1967:                                   ; preds = %1965
  %1968 = load i32, i32* %15, align 4
  %1969 = add nsw i32 %1968, 0
  %1970 = load i32*, i32** %18, align 8
  %1971 = getelementptr inbounds i32, i32* %1970, i32 1
  store i32* %1971, i32** %18, align 8
  store i32 %1969, i32* %1970, align 4
  %1972 = load i32, i32* %11, align 4
  %1973 = add nsw i32 %1972, 0
  store i32 %1973, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %1974

; <label>:1974:                                   ; preds = %1967
  br label %1975

; <label>:1975:                                   ; preds = %1974, %1962
  %1976 = load i32, i32* %11, align 4
  %1977 = load i32, i32* %12, align 4
  %1978 = icmp ne i32 %1976, %1977
  br i1 %1978, label %1979, label %2072

; <label>:1979:                                   ; preds = %1975
  %1980 = load %struct.tiff*, %struct.tiff** %6, align 8
  %1981 = load i32, i32* %11, align 4
  %1982 = load i32, i32* %12, align 4
  call void @Fax3BadLength(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i32 0, i32 0), %struct.tiff* %1980, i32 %1981, i32 %1982)
  br label %1983

; <label>:1983:                                   ; preds = %1994, %1979
  %1984 = load i32, i32* %11, align 4
  %1985 = load i32, i32* %12, align 4
  %1986 = icmp sgt i32 %1984, %1985
  br i1 %1986, label %1987, label %1992

; <label>:1987:                                   ; preds = %1983
  %pgocount145 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 31)
  %1988 = add i64 %pgocount145, 1
  store i64 %1988, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 31)
  %1989 = load i32*, i32** %18, align 8
  %1990 = load i32*, i32** %19, align 8
  %1991 = icmp ugt i32* %1989, %1990
  br label %1992

; <label>:1992:                                   ; preds = %1987, %1983
  %1993 = phi i1 [ false, %1983 ], [ %1991, %1987 ]
  br i1 %1993, label %1994, label %2001

; <label>:1994:                                   ; preds = %1992
  %pgocount146 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 17)
  %1995 = add i64 %pgocount146, 1
  store i64 %1995, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 17)
  %1996 = load i32*, i32** %18, align 8
  %1997 = getelementptr inbounds i32, i32* %1996, i32 -1
  store i32* %1997, i32** %18, align 8
  %1998 = load i32, i32* %1997, align 4
  %1999 = load i32, i32* %11, align 4
  %2000 = sub i32 %1999, %1998
  store i32 %2000, i32* %11, align 4
  br label %1983

; <label>:2001:                                   ; preds = %1992
  %2002 = load i32, i32* %11, align 4
  %2003 = load i32, i32* %12, align 4
  %2004 = icmp slt i32 %2002, %2003
  br i1 %2004, label %2005, label %2045

; <label>:2005:                                   ; preds = %2001
  %2006 = load i32, i32* %11, align 4
  %2007 = icmp slt i32 %2006, 0
  br i1 %2007, label %2008, label %2010

; <label>:2008:                                   ; preds = %2005
  %pgocount147 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 112)
  %2009 = add i64 %pgocount147, 1
  store i64 %2009, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 112)
  store i32 0, i32* %11, align 4
  br label %2010

; <label>:2010:                                   ; preds = %2008, %2005
  %2011 = load i32*, i32** %18, align 8
  %2012 = load i32*, i32** %19, align 8
  %2013 = ptrtoint i32* %2011 to i64
  %2014 = ptrtoint i32* %2012 to i64
  %2015 = sub i64 %2013, %2014
  %2016 = sdiv exact i64 %2015, 4
  %2017 = and i64 %2016, 1
  %2018 = icmp ne i64 %2017, 0
  br i1 %2018, label %2019, label %2029

; <label>:2019:                                   ; preds = %2010
  br label %2020

; <label>:2020:                                   ; preds = %2019
  %2021 = load i32, i32* %15, align 4
  %2022 = add nsw i32 %2021, 0
  %2023 = load i32*, i32** %18, align 8
  %2024 = getelementptr inbounds i32, i32* %2023, i32 1
  store i32* %2024, i32** %18, align 8
  store i32 %2022, i32* %2023, align 4
  %2025 = load i32, i32* %11, align 4
  %2026 = add nsw i32 %2025, 0
  store i32 %2026, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %2027

; <label>:2027:                                   ; preds = %2020
  %pgocount148 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 101)
  %2028 = add i64 %pgocount148, 1
  store i64 %2028, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 101)
  br label %2029

; <label>:2029:                                   ; preds = %2027, %2010
  br label %2030

; <label>:2030:                                   ; preds = %2029
  %2031 = load i32, i32* %15, align 4
  %2032 = load i32, i32* %12, align 4
  %2033 = load i32, i32* %11, align 4
  %2034 = sub nsw i32 %2032, %2033
  %2035 = add nsw i32 %2031, %2034
  %2036 = load i32*, i32** %18, align 8
  %2037 = getelementptr inbounds i32, i32* %2036, i32 1
  store i32* %2037, i32** %18, align 8
  store i32 %2035, i32* %2036, align 4
  %2038 = load i32, i32* %12, align 4
  %2039 = load i32, i32* %11, align 4
  %2040 = sub nsw i32 %2038, %2039
  %2041 = load i32, i32* %11, align 4
  %2042 = add nsw i32 %2041, %2040
  store i32 %2042, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %2043

; <label>:2043:                                   ; preds = %2030
  %pgocount149 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 90)
  %2044 = add i64 %pgocount149, 1
  store i64 %2044, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 90)
  br label %2071

; <label>:2045:                                   ; preds = %2001
  %2046 = load i32, i32* %11, align 4
  %2047 = load i32, i32* %12, align 4
  %2048 = icmp sgt i32 %2046, %2047
  br i1 %2048, label %2049, label %2069

; <label>:2049:                                   ; preds = %2045
  br label %2050

; <label>:2050:                                   ; preds = %2049
  %2051 = load i32, i32* %15, align 4
  %2052 = load i32, i32* %12, align 4
  %2053 = add nsw i32 %2051, %2052
  %2054 = load i32*, i32** %18, align 8
  %2055 = getelementptr inbounds i32, i32* %2054, i32 1
  store i32* %2055, i32** %18, align 8
  store i32 %2053, i32* %2054, align 4
  %2056 = load i32, i32* %12, align 4
  %2057 = load i32, i32* %11, align 4
  %2058 = add nsw i32 %2057, %2056
  store i32 %2058, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %2059

; <label>:2059:                                   ; preds = %2050
  br label %2060

; <label>:2060:                                   ; preds = %2059
  %2061 = load i32, i32* %15, align 4
  %2062 = add nsw i32 %2061, 0
  %2063 = load i32*, i32** %18, align 8
  %2064 = getelementptr inbounds i32, i32* %2063, i32 1
  store i32* %2064, i32** %18, align 8
  store i32 %2062, i32* %2063, align 4
  %2065 = load i32, i32* %11, align 4
  %2066 = add nsw i32 %2065, 0
  store i32 %2066, i32* %11, align 4
  store i32 0, i32* %15, align 4
  br label %2067

; <label>:2067:                                   ; preds = %2060
  %pgocount150 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 102)
  %2068 = add i64 %pgocount150, 1
  store i64 %2068, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 102)
  br label %2069

; <label>:2069:                                   ; preds = %2067, %2045
  %pgocount151 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 91)
  %2070 = add i64 %pgocount151, 1
  store i64 %2070, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 91)
  br label %2071

; <label>:2071:                                   ; preds = %2069, %2043
  br label %2072

; <label>:2072:                                   ; preds = %2071, %1975
  br label %2073

; <label>:2073:                                   ; preds = %2072
  br label %2074

; <label>:2074:                                   ; preds = %2073, %1727, %630
  %2075 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %2076 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %2075, i32 0, i32 5
  %2077 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %2076, align 8
  %2078 = load i8*, i8** %7, align 8
  %2079 = load i32*, i32** %19, align 8
  %2080 = load i32*, i32** %18, align 8
  %2081 = load i32, i32* %12, align 4
  %2082 = ptrtoint void (i8*, i32*, i32*, i32)* %2077 to i64
  call void @__llvm_profile_instrument_target(i64 %2082, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_Fax3Decode2D to i8*), i32 1)
  call void %2077(i8* %2078, i32* %2079, i32* %2080, i32 %2081)
  br label %2083

; <label>:2083:                                   ; preds = %2074
  %2084 = load i32, i32* %14, align 4
  %2085 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %2086 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %2085, i32 0, i32 3
  store i32 %2084, i32* %2086, align 4
  %2087 = load i32, i32* %13, align 4
  %2088 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %2089 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %2088, i32 0, i32 2
  store i32 %2087, i32* %2089, align 8
  %2090 = load i32, i32* %20, align 4
  %2091 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %2092 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %2091, i32 0, i32 4
  store i32 %2090, i32* %2092, align 8
  %2093 = load i8*, i8** %16, align 8
  %2094 = load %struct.tiff*, %struct.tiff** %6, align 8
  %2095 = getelementptr inbounds %struct.tiff, %struct.tiff* %2094, i32 0, i32 42
  %2096 = load i8*, i8** %2095, align 8
  %2097 = ptrtoint i8* %2093 to i64
  %2098 = ptrtoint i8* %2096 to i64
  %2099 = sub i64 %2097, %2098
  %2100 = load %struct.tiff*, %struct.tiff** %6, align 8
  %2101 = getelementptr inbounds %struct.tiff, %struct.tiff* %2100, i32 0, i32 43
  %2102 = load i32, i32* %2101, align 8
  %2103 = sext i32 %2102 to i64
  %2104 = sub nsw i64 %2103, %2099
  %2105 = trunc i64 %2104 to i32
  store i32 %2105, i32* %2101, align 8
  %2106 = load i8*, i8** %16, align 8
  %2107 = load %struct.tiff*, %struct.tiff** %6, align 8
  %2108 = getelementptr inbounds %struct.tiff, %struct.tiff* %2107, i32 0, i32 42
  store i8* %2106, i8** %2108, align 8
  br label %2109

; <label>:2109:                                   ; preds = %2083
  store i32 -1, i32* %5, align 4
  br label %2139

; <label>:2110:                                   ; preds = %60
  br label %2111

; <label>:2111:                                   ; preds = %2110
  %2112 = load i32, i32* %14, align 4
  %2113 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %2114 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %2113, i32 0, i32 3
  store i32 %2112, i32* %2114, align 4
  %2115 = load i32, i32* %13, align 4
  %2116 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %2117 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %2116, i32 0, i32 2
  store i32 %2115, i32* %2117, align 8
  %2118 = load i32, i32* %20, align 4
  %2119 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %2120 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %2119, i32 0, i32 4
  store i32 %2118, i32* %2120, align 8
  %2121 = load i8*, i8** %16, align 8
  %2122 = load %struct.tiff*, %struct.tiff** %6, align 8
  %2123 = getelementptr inbounds %struct.tiff, %struct.tiff* %2122, i32 0, i32 42
  %2124 = load i8*, i8** %2123, align 8
  %2125 = ptrtoint i8* %2121 to i64
  %2126 = ptrtoint i8* %2124 to i64
  %2127 = sub i64 %2125, %2126
  %2128 = load %struct.tiff*, %struct.tiff** %6, align 8
  %2129 = getelementptr inbounds %struct.tiff, %struct.tiff* %2128, i32 0, i32 43
  %2130 = load i32, i32* %2129, align 8
  %2131 = sext i32 %2130 to i64
  %2132 = sub nsw i64 %2131, %2127
  %2133 = trunc i64 %2132 to i32
  store i32 %2133, i32* %2129, align 8
  %2134 = load i8*, i8** %16, align 8
  %2135 = load %struct.tiff*, %struct.tiff** %6, align 8
  %2136 = getelementptr inbounds %struct.tiff, %struct.tiff* %2135, i32 0, i32 42
  store i8* %2134, i8** %2136, align 8
  br label %2137

; <label>:2137:                                   ; preds = %2111
  %pgocount152 = load i64, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 104)
  %2138 = add i64 %pgocount152, 1
  store i64 %2138, i64* getelementptr inbounds ([148 x i64], [148 x i64]* @__profc_tmp1.ll_Fax3Decode2D, i64 0, i64 104)
  store i32 1, i32* %5, align 4
  br label %2139

; <label>:2139:                                   ; preds = %2137, %2109
  %2140 = load i32, i32* %5, align 4
  ret i32 %2140
}

; Function Attrs: noinline nounwind uwtable
define internal void @Fax3Unexpected(i8*, %struct.tiff*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_Fax3Unexpected, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_Fax3Unexpected, i64 0, i64 0)
  %5 = alloca i8*, align 8
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store %struct.tiff* %1, %struct.tiff** %6, align 8
  store i32 %2, i32* %7, align 4
  %8 = load i8*, i8** %5, align 8
  %9 = load %struct.tiff*, %struct.tiff** %6, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 0
  %11 = load i8*, i8** %10, align 8
  %12 = load %struct.tiff*, %struct.tiff** %6, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 11
  %14 = load i32, i32* %13, align 8
  %15 = load i32, i32* %7, align 4
  %16 = zext i32 %15 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %8, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.34, i32 0, i32 0), i8* %11, i32 %14, i64 %16)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Fax3PrematureEOF(i8*, %struct.tiff*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_Fax3PrematureEOF, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_Fax3PrematureEOF, i64 0, i64 0)
  %5 = alloca i8*, align 8
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store %struct.tiff* %1, %struct.tiff** %6, align 8
  store i32 %2, i32* %7, align 4
  %8 = load i8*, i8** %5, align 8
  %9 = load %struct.tiff*, %struct.tiff** %6, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 0
  %11 = load i8*, i8** %10, align 8
  %12 = load %struct.tiff*, %struct.tiff** %6, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 11
  %14 = load i32, i32* %13, align 8
  %15 = load i32, i32* %7, align 4
  %16 = zext i32 %15 to i64
  call void (i8*, i8*, ...) @TIFFWarning(i8* %8, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.35, i32 0, i32 0), i8* %11, i32 %14, i64 %16)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Fax3BadLength(i8*, %struct.tiff*, i32, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Fax3BadLength, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Fax3BadLength, i64 0, i64 0)
  %6 = alloca i8*, align 8
  %7 = alloca %struct.tiff*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i8* %0, i8** %6, align 8
  store %struct.tiff* %1, %struct.tiff** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  %10 = load i8*, i8** %6, align 8
  %11 = load %struct.tiff*, %struct.tiff** %7, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 0
  %13 = load i8*, i8** %12, align 8
  %14 = load i32, i32* %8, align 4
  %15 = load i32, i32* %9, align 4
  %16 = icmp ult i32 %14, %15
  %17 = zext i1 %16 to i64
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Fax3BadLength, i64 0, i64 1)
  %18 = add i64 %pgocount1, %17
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_Fax3BadLength, i64 0, i64 1)
  %19 = select i1 %16, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.37, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.38, i32 0, i32 0)
  %20 = load %struct.tiff*, %struct.tiff** %7, align 8
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %20, i32 0, i32 11
  %22 = load i32, i32* %21, align 8
  %23 = load i32, i32* %8, align 4
  %24 = zext i32 %23 to i64
  %25 = load i32, i32* %9, align 4
  %26 = zext i32 %25 to i64
  call void (i8*, i8*, ...) @TIFFWarning(i8* %10, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.36, i32 0, i32 0), i8* %13, i8* %19, i32 %22, i64 %24, i64 %26)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Fax3Extension(i8*, %struct.tiff*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_Fax3Extension, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_Fax3Extension, i64 0, i64 0)
  %5 = alloca i8*, align 8
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store %struct.tiff* %1, %struct.tiff** %6, align 8
  store i32 %2, i32* %7, align 4
  %8 = load i8*, i8** %5, align 8
  %9 = load %struct.tiff*, %struct.tiff** %6, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 0
  %11 = load i8*, i8** %10, align 8
  %12 = load %struct.tiff*, %struct.tiff** %6, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 11
  %14 = load i32, i32* %13, align 8
  %15 = load i32, i32* %7, align 4
  %16 = zext i32 %15 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %8, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.39, i32 0, i32 0), i8* %11, i32 %14, i64 %16)
  ret void
}

declare void @TIFFWarning(i8*, i8*, ...) #2

declare i8* @TIFFGetBitRevTable(i32) #2

declare void @_TIFFmemset(i8*, i32, i32) #2

declare i32 @TIFFFlushData1(%struct.tiff*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @Fax3PutEOL(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  %3 = alloca %struct.Fax3EncodeState*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %10 = load %struct.tiff*, %struct.tiff** %2, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 37
  %12 = load i8*, i8** %11, align 8
  %13 = bitcast i8* %12 to %struct.Fax3BaseState*
  %14 = bitcast %struct.Fax3BaseState* %13 to %struct.Fax3EncodeState*
  store %struct.Fax3EncodeState* %14, %struct.Fax3EncodeState** %3, align 8
  %15 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %16 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %15, i32 0, i32 2
  %17 = load i32, i32* %16, align 4
  store i32 %17, i32* %4, align 4
  %18 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %19 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %18, i32 0, i32 1
  %20 = load i32, i32* %19, align 8
  store i32 %20, i32* %5, align 4
  %21 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %22 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %21, i32 0, i32 0
  %23 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %22, i32 0, i32 6
  %24 = load i32, i32* %23, align 8
  %25 = and i32 %24, 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %137

; <label>:27:                                     ; preds = %1
  store i32 4, i32* %9, align 4
  %28 = load i32, i32* %9, align 4
  %29 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %30 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %29, i32 0, i32 2
  %31 = load i32, i32* %30, align 4
  %32 = icmp ne i32 %28, %31
  br i1 %32, label %33, label %135

; <label>:33:                                     ; preds = %27
  %34 = load i32, i32* %9, align 4
  %35 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %36 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %35, i32 0, i32 2
  %37 = load i32, i32* %36, align 4
  %38 = icmp sgt i32 %34, %37
  br i1 %38, label %39, label %47

; <label>:39:                                     ; preds = %33
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 9)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 9)
  %41 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %42 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %41, i32 0, i32 2
  %43 = load i32, i32* %42, align 4
  %44 = load i32, i32* %9, align 4
  %45 = sub nsw i32 8, %44
  %46 = add nsw i32 %43, %45
  store i32 %46, i32* %9, align 4
  br label %54

; <label>:47:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 10)
  %48 = add i64 %pgocount1, 1
  store i64 %48, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 10)
  %49 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %50 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %49, i32 0, i32 2
  %51 = load i32, i32* %50, align 4
  %52 = load i32, i32* %9, align 4
  %53 = sub nsw i32 %51, %52
  store i32 %53, i32* %9, align 4
  br label %54

; <label>:54:                                     ; preds = %47, %39
  store i32 0, i32* %6, align 4
  %55 = load i32, i32* %9, align 4
  store i32 %55, i32* %8, align 4
  br label %56

; <label>:56:                                     ; preds = %81, %54
  %57 = load i32, i32* %8, align 4
  %58 = load i32, i32* %4, align 4
  %59 = icmp ugt i32 %57, %58
  br i1 %59, label %60, label %93

; <label>:60:                                     ; preds = %56
  %61 = load i32, i32* %8, align 4
  %62 = load i32, i32* %4, align 4
  %63 = sub i32 %61, %62
  %64 = ashr i32 0, %63
  %65 = load i32, i32* %5, align 4
  %66 = or i32 %65, %64
  store i32 %66, i32* %5, align 4
  %67 = load i32, i32* %4, align 4
  %68 = load i32, i32* %8, align 4
  %69 = sub i32 %68, %67
  store i32 %69, i32* %8, align 4
  %70 = load %struct.tiff*, %struct.tiff** %2, align 8
  %71 = getelementptr inbounds %struct.tiff, %struct.tiff* %70, i32 0, i32 43
  %72 = load i32, i32* %71, align 8
  %73 = load %struct.tiff*, %struct.tiff** %2, align 8
  %74 = getelementptr inbounds %struct.tiff, %struct.tiff* %73, i32 0, i32 41
  %75 = load i32, i32* %74, align 8
  %76 = icmp sge i32 %72, %75
  br i1 %76, label %77, label %81

; <label>:77:                                     ; preds = %60
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 3)
  %78 = add i64 %pgocount2, 1
  store i64 %78, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 3)
  %79 = load %struct.tiff*, %struct.tiff** %2, align 8
  %80 = call i32 @TIFFFlushData1(%struct.tiff* %79)
  br label %81

; <label>:81:                                     ; preds = %77, %60
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 2)
  %82 = add i64 %pgocount3, 1
  store i64 %82, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 2)
  %83 = load i32, i32* %5, align 4
  %84 = trunc i32 %83 to i8
  %85 = load %struct.tiff*, %struct.tiff** %2, align 8
  %86 = getelementptr inbounds %struct.tiff, %struct.tiff* %85, i32 0, i32 42
  %87 = load i8*, i8** %86, align 8
  %88 = getelementptr inbounds i8, i8* %87, i32 1
  store i8* %88, i8** %86, align 8
  store i8 %84, i8* %87, align 1
  %89 = load %struct.tiff*, %struct.tiff** %2, align 8
  %90 = getelementptr inbounds %struct.tiff, %struct.tiff* %89, i32 0, i32 43
  %91 = load i32, i32* %90, align 8
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %90, align 8
  store i32 0, i32* %5, align 4
  store i32 8, i32* %4, align 4
  br label %56

; <label>:93:                                     ; preds = %56
  %94 = load i32, i32* %8, align 4
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds [9 x i32], [9 x i32]* @_msbmask, i64 0, i64 %95
  %97 = load i32, i32* %96, align 4
  %98 = and i32 0, %97
  %99 = load i32, i32* %4, align 4
  %100 = load i32, i32* %8, align 4
  %101 = sub i32 %99, %100
  %102 = shl i32 %98, %101
  %103 = load i32, i32* %5, align 4
  %104 = or i32 %103, %102
  store i32 %104, i32* %5, align 4
  %105 = load i32, i32* %8, align 4
  %106 = load i32, i32* %4, align 4
  %107 = sub i32 %106, %105
  store i32 %107, i32* %4, align 4
  %108 = load i32, i32* %4, align 4
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %110, label %134

; <label>:110:                                    ; preds = %93
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 11)
  %111 = add i64 %pgocount4, 1
  store i64 %111, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 11)
  %112 = load %struct.tiff*, %struct.tiff** %2, align 8
  %113 = getelementptr inbounds %struct.tiff, %struct.tiff* %112, i32 0, i32 43
  %114 = load i32, i32* %113, align 8
  %115 = load %struct.tiff*, %struct.tiff** %2, align 8
  %116 = getelementptr inbounds %struct.tiff, %struct.tiff* %115, i32 0, i32 41
  %117 = load i32, i32* %116, align 8
  %118 = icmp sge i32 %114, %117
  br i1 %118, label %119, label %123

; <label>:119:                                    ; preds = %110
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 12)
  %120 = add i64 %pgocount5, 1
  store i64 %120, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 12)
  %121 = load %struct.tiff*, %struct.tiff** %2, align 8
  %122 = call i32 @TIFFFlushData1(%struct.tiff* %121)
  br label %123

; <label>:123:                                    ; preds = %119, %110
  %124 = load i32, i32* %5, align 4
  %125 = trunc i32 %124 to i8
  %126 = load %struct.tiff*, %struct.tiff** %2, align 8
  %127 = getelementptr inbounds %struct.tiff, %struct.tiff* %126, i32 0, i32 42
  %128 = load i8*, i8** %127, align 8
  %129 = getelementptr inbounds i8, i8* %128, i32 1
  store i8* %129, i8** %127, align 8
  store i8 %125, i8* %128, align 1
  %130 = load %struct.tiff*, %struct.tiff** %2, align 8
  %131 = getelementptr inbounds %struct.tiff, %struct.tiff* %130, i32 0, i32 43
  %132 = load i32, i32* %131, align 8
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %131, align 8
  store i32 0, i32* %5, align 4
  store i32 8, i32* %4, align 4
  br label %134

; <label>:134:                                    ; preds = %123, %93
  br label %135

; <label>:135:                                    ; preds = %134, %27
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 5)
  %136 = add i64 %pgocount6, 1
  store i64 %136, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 5)
  br label %137

; <label>:137:                                    ; preds = %135, %1
  store i32 1, i32* %6, align 4
  store i32 12, i32* %7, align 4
  %138 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %139 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %138, i32 0, i32 0
  %140 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %139, i32 0, i32 6
  %141 = load i32, i32* %140, align 8
  %142 = and i32 %141, 1
  %143 = icmp ne i32 %142, 0
  br i1 %143, label %144, label %156

; <label>:144:                                    ; preds = %137
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 6)
  %145 = add i64 %pgocount7, 1
  store i64 %145, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 6)
  %146 = load i32, i32* %6, align 4
  %147 = shl i32 %146, 1
  %148 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %149 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %148, i32 0, i32 3
  %150 = load i32, i32* %149, align 8
  %151 = icmp eq i32 %150, 0
  %152 = zext i1 %151 to i32
  %153 = or i32 %147, %152
  store i32 %153, i32* %6, align 4
  %154 = load i32, i32* %7, align 4
  %155 = add i32 %154, 1
  store i32 %155, i32* %7, align 4
  br label %156

; <label>:156:                                    ; preds = %144, %137
  br label %157

; <label>:157:                                    ; preds = %183, %156
  %158 = load i32, i32* %7, align 4
  %159 = load i32, i32* %4, align 4
  %160 = icmp ugt i32 %158, %159
  br i1 %160, label %161, label %195

; <label>:161:                                    ; preds = %157
  %162 = load i32, i32* %6, align 4
  %163 = load i32, i32* %7, align 4
  %164 = load i32, i32* %4, align 4
  %165 = sub i32 %163, %164
  %166 = lshr i32 %162, %165
  %167 = load i32, i32* %5, align 4
  %168 = or i32 %167, %166
  store i32 %168, i32* %5, align 4
  %169 = load i32, i32* %4, align 4
  %170 = load i32, i32* %7, align 4
  %171 = sub i32 %170, %169
  store i32 %171, i32* %7, align 4
  %172 = load %struct.tiff*, %struct.tiff** %2, align 8
  %173 = getelementptr inbounds %struct.tiff, %struct.tiff* %172, i32 0, i32 43
  %174 = load i32, i32* %173, align 8
  %175 = load %struct.tiff*, %struct.tiff** %2, align 8
  %176 = getelementptr inbounds %struct.tiff, %struct.tiff* %175, i32 0, i32 41
  %177 = load i32, i32* %176, align 8
  %178 = icmp sge i32 %174, %177
  br i1 %178, label %179, label %183

; <label>:179:                                    ; preds = %161
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 1)
  %180 = add i64 %pgocount8, 1
  store i64 %180, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 1)
  %181 = load %struct.tiff*, %struct.tiff** %2, align 8
  %182 = call i32 @TIFFFlushData1(%struct.tiff* %181)
  br label %183

; <label>:183:                                    ; preds = %179, %161
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 0)
  %184 = add i64 %pgocount9, 1
  store i64 %184, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 0)
  %185 = load i32, i32* %5, align 4
  %186 = trunc i32 %185 to i8
  %187 = load %struct.tiff*, %struct.tiff** %2, align 8
  %188 = getelementptr inbounds %struct.tiff, %struct.tiff* %187, i32 0, i32 42
  %189 = load i8*, i8** %188, align 8
  %190 = getelementptr inbounds i8, i8* %189, i32 1
  store i8* %190, i8** %188, align 8
  store i8 %186, i8* %189, align 1
  %191 = load %struct.tiff*, %struct.tiff** %2, align 8
  %192 = getelementptr inbounds %struct.tiff, %struct.tiff* %191, i32 0, i32 43
  %193 = load i32, i32* %192, align 8
  %194 = add nsw i32 %193, 1
  store i32 %194, i32* %192, align 8
  store i32 0, i32* %5, align 4
  store i32 8, i32* %4, align 4
  br label %157

; <label>:195:                                    ; preds = %157
  %196 = load i32, i32* %6, align 4
  %197 = load i32, i32* %7, align 4
  %198 = zext i32 %197 to i64
  %199 = getelementptr inbounds [9 x i32], [9 x i32]* @_msbmask, i64 0, i64 %198
  %200 = load i32, i32* %199, align 4
  %201 = and i32 %196, %200
  %202 = load i32, i32* %4, align 4
  %203 = load i32, i32* %7, align 4
  %204 = sub i32 %202, %203
  %205 = shl i32 %201, %204
  %206 = load i32, i32* %5, align 4
  %207 = or i32 %206, %205
  store i32 %207, i32* %5, align 4
  %208 = load i32, i32* %7, align 4
  %209 = load i32, i32* %4, align 4
  %210 = sub i32 %209, %208
  store i32 %210, i32* %4, align 4
  %211 = load i32, i32* %4, align 4
  %212 = icmp eq i32 %211, 0
  br i1 %212, label %213, label %237

; <label>:213:                                    ; preds = %195
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 7)
  %214 = add i64 %pgocount10, 1
  store i64 %214, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 7)
  %215 = load %struct.tiff*, %struct.tiff** %2, align 8
  %216 = getelementptr inbounds %struct.tiff, %struct.tiff* %215, i32 0, i32 43
  %217 = load i32, i32* %216, align 8
  %218 = load %struct.tiff*, %struct.tiff** %2, align 8
  %219 = getelementptr inbounds %struct.tiff, %struct.tiff* %218, i32 0, i32 41
  %220 = load i32, i32* %219, align 8
  %221 = icmp sge i32 %217, %220
  br i1 %221, label %222, label %226

; <label>:222:                                    ; preds = %213
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 8)
  %223 = add i64 %pgocount11, 1
  store i64 %223, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 8)
  %224 = load %struct.tiff*, %struct.tiff** %2, align 8
  %225 = call i32 @TIFFFlushData1(%struct.tiff* %224)
  br label %226

; <label>:226:                                    ; preds = %222, %213
  %227 = load i32, i32* %5, align 4
  %228 = trunc i32 %227 to i8
  %229 = load %struct.tiff*, %struct.tiff** %2, align 8
  %230 = getelementptr inbounds %struct.tiff, %struct.tiff* %229, i32 0, i32 42
  %231 = load i8*, i8** %230, align 8
  %232 = getelementptr inbounds i8, i8* %231, i32 1
  store i8* %232, i8** %230, align 8
  store i8 %228, i8* %231, align 1
  %233 = load %struct.tiff*, %struct.tiff** %2, align 8
  %234 = getelementptr inbounds %struct.tiff, %struct.tiff* %233, i32 0, i32 43
  %235 = load i32, i32* %234, align 8
  %236 = add nsw i32 %235, 1
  store i32 %236, i32* %234, align 8
  store i32 0, i32* %5, align 4
  store i32 8, i32* %4, align 4
  br label %237

; <label>:237:                                    ; preds = %226, %195
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 4)
  %238 = add i64 %pgocount12, 1
  store i64 %238, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_Fax3PutEOL, i64 0, i64 4)
  %239 = load i32, i32* %5, align 4
  %240 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %241 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %240, i32 0, i32 1
  store i32 %239, i32* %241, align 8
  %242 = load i32, i32* %4, align 4
  %243 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %244 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %243, i32 0, i32 2
  store i32 %242, i32* %244, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3Encode1DRow(%struct.tiff*, i8*, i32) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.Fax3EncodeState*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %10 = load %struct.tiff*, %struct.tiff** %4, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 37
  %12 = load i8*, i8** %11, align 8
  %13 = bitcast i8* %12 to %struct.Fax3BaseState*
  %14 = bitcast %struct.Fax3BaseState* %13 to %struct.Fax3EncodeState*
  store %struct.Fax3EncodeState* %14, %struct.Fax3EncodeState** %7, align 8
  store i32 0, i32* %9, align 4
  br label %15

; <label>:15:                                     ; preds = %45, %3
  %16 = load i8*, i8** %5, align 8
  %17 = load i32, i32* %9, align 4
  %18 = load i32, i32* %6, align 4
  %19 = call i32 @find0span(i8* %16, i32 %17, i32 %18)
  store i32 %19, i32* %8, align 4
  %20 = load %struct.tiff*, %struct.tiff** %4, align 8
  %21 = load i32, i32* %8, align 4
  call void @putspan(%struct.tiff* %20, i32 %21, %struct.tableentry* getelementptr inbounds ([109 x %struct.tableentry], [109 x %struct.tableentry]* @TIFFFaxWhiteCodes, i32 0, i32 0))
  %22 = load i32, i32* %8, align 4
  %23 = load i32, i32* %9, align 4
  %24 = add i32 %23, %22
  store i32 %24, i32* %9, align 4
  %25 = load i32, i32* %9, align 4
  %26 = load i32, i32* %6, align 4
  %27 = icmp uge i32 %25, %26
  br i1 %27, label %28, label %30

; <label>:28:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 2)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 2)
  br label %47

; <label>:30:                                     ; preds = %15
  %31 = load i8*, i8** %5, align 8
  %32 = load i32, i32* %9, align 4
  %33 = load i32, i32* %6, align 4
  %34 = call i32 @find1span(i8* %31, i32 %32, i32 %33)
  store i32 %34, i32* %8, align 4
  %35 = load %struct.tiff*, %struct.tiff** %4, align 8
  %36 = load i32, i32* %8, align 4
  call void @putspan(%struct.tiff* %35, i32 %36, %struct.tableentry* getelementptr inbounds ([109 x %struct.tableentry], [109 x %struct.tableentry]* @TIFFFaxBlackCodes, i32 0, i32 0))
  %37 = load i32, i32* %8, align 4
  %38 = load i32, i32* %9, align 4
  %39 = add i32 %38, %37
  store i32 %39, i32* %9, align 4
  %40 = load i32, i32* %9, align 4
  %41 = load i32, i32* %6, align 4
  %42 = icmp uge i32 %40, %41
  br i1 %42, label %43, label %45

; <label>:43:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 3)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 3)
  br label %47

; <label>:45:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 0)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 0)
  br label %15

; <label>:47:                                     ; preds = %43, %28
  %48 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %7, align 8
  %49 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %48, i32 0, i32 0
  %50 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %49, i32 0, i32 0
  %51 = load i32, i32* %50, align 8
  %52 = and i32 %51, 12
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %136

; <label>:54:                                     ; preds = %47
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 1)
  %55 = add i64 %pgocount3, 1
  store i64 %55, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 1)
  %56 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %7, align 8
  %57 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %56, i32 0, i32 2
  %58 = load i32, i32* %57, align 4
  %59 = icmp ne i32 %58, 8
  br i1 %59, label %60, label %90

; <label>:60:                                     ; preds = %54
  %61 = load %struct.tiff*, %struct.tiff** %4, align 8
  %62 = getelementptr inbounds %struct.tiff, %struct.tiff* %61, i32 0, i32 43
  %63 = load i32, i32* %62, align 8
  %64 = load %struct.tiff*, %struct.tiff** %4, align 8
  %65 = getelementptr inbounds %struct.tiff, %struct.tiff* %64, i32 0, i32 41
  %66 = load i32, i32* %65, align 8
  %67 = icmp sge i32 %63, %66
  br i1 %67, label %68, label %72

; <label>:68:                                     ; preds = %60
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 6)
  %69 = add i64 %pgocount4, 1
  store i64 %69, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 6)
  %70 = load %struct.tiff*, %struct.tiff** %4, align 8
  %71 = call i32 @TIFFFlushData1(%struct.tiff* %70)
  br label %72

; <label>:72:                                     ; preds = %68, %60
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 4)
  %73 = add i64 %pgocount5, 1
  store i64 %73, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 4)
  %74 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %7, align 8
  %75 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %74, i32 0, i32 1
  %76 = load i32, i32* %75, align 8
  %77 = trunc i32 %76 to i8
  %78 = load %struct.tiff*, %struct.tiff** %4, align 8
  %79 = getelementptr inbounds %struct.tiff, %struct.tiff* %78, i32 0, i32 42
  %80 = load i8*, i8** %79, align 8
  %81 = getelementptr inbounds i8, i8* %80, i32 1
  store i8* %81, i8** %79, align 8
  store i8 %77, i8* %80, align 1
  %82 = load %struct.tiff*, %struct.tiff** %4, align 8
  %83 = getelementptr inbounds %struct.tiff, %struct.tiff* %82, i32 0, i32 43
  %84 = load i32, i32* %83, align 8
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %83, align 8
  %86 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %7, align 8
  %87 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %86, i32 0, i32 1
  store i32 0, i32* %87, align 8
  %88 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %7, align 8
  %89 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %88, i32 0, i32 2
  store i32 8, i32* %89, align 4
  br label %90

; <label>:90:                                     ; preds = %72, %54
  %91 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %7, align 8
  %92 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %91, i32 0, i32 0
  %93 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %92, i32 0, i32 0
  %94 = load i32, i32* %93, align 8
  %95 = and i32 %94, 8
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %135

; <label>:97:                                     ; preds = %90
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 5)
  %98 = add i64 %pgocount6, 1
  store i64 %98, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 5)
  %99 = load %struct.tiff*, %struct.tiff** %4, align 8
  %100 = getelementptr inbounds %struct.tiff, %struct.tiff* %99, i32 0, i32 42
  %101 = load i8*, i8** %100, align 8
  %102 = ptrtoint i8* %101 to i64
  %103 = and i64 %102, 1
  %104 = icmp eq i64 %103, 0
  br i1 %104, label %135, label %105

; <label>:105:                                    ; preds = %97
  %106 = load %struct.tiff*, %struct.tiff** %4, align 8
  %107 = getelementptr inbounds %struct.tiff, %struct.tiff* %106, i32 0, i32 43
  %108 = load i32, i32* %107, align 8
  %109 = load %struct.tiff*, %struct.tiff** %4, align 8
  %110 = getelementptr inbounds %struct.tiff, %struct.tiff* %109, i32 0, i32 41
  %111 = load i32, i32* %110, align 8
  %112 = icmp sge i32 %108, %111
  br i1 %112, label %113, label %117

; <label>:113:                                    ; preds = %105
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 8)
  %114 = add i64 %pgocount7, 1
  store i64 %114, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 8)
  %115 = load %struct.tiff*, %struct.tiff** %4, align 8
  %116 = call i32 @TIFFFlushData1(%struct.tiff* %115)
  br label %117

; <label>:117:                                    ; preds = %113, %105
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 7)
  %118 = add i64 %pgocount8, 1
  store i64 %118, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_Fax3Encode1DRow, i64 0, i64 7)
  %119 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %7, align 8
  %120 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %119, i32 0, i32 1
  %121 = load i32, i32* %120, align 8
  %122 = trunc i32 %121 to i8
  %123 = load %struct.tiff*, %struct.tiff** %4, align 8
  %124 = getelementptr inbounds %struct.tiff, %struct.tiff* %123, i32 0, i32 42
  %125 = load i8*, i8** %124, align 8
  %126 = getelementptr inbounds i8, i8* %125, i32 1
  store i8* %126, i8** %124, align 8
  store i8 %122, i8* %125, align 1
  %127 = load %struct.tiff*, %struct.tiff** %4, align 8
  %128 = getelementptr inbounds %struct.tiff, %struct.tiff* %127, i32 0, i32 43
  %129 = load i32, i32* %128, align 8
  %130 = add nsw i32 %129, 1
  store i32 %130, i32* %128, align 8
  %131 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %7, align 8
  %132 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %131, i32 0, i32 1
  store i32 0, i32* %132, align 8
  %133 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %7, align 8
  %134 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %133, i32 0, i32 2
  store i32 8, i32* %134, align 4
  br label %135

; <label>:135:                                    ; preds = %117, %97, %90
  br label %136

; <label>:136:                                    ; preds = %135, %47
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3Encode2DRow(%struct.tiff*, i8*, i8*, i32) #0 {
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i8* %1, i8** %6, align 8
  store i8* %2, i8** %7, align 8
  store i32 %3, i32* %8, align 4
  store i32 0, i32* %9, align 4
  %15 = load i8*, i8** %6, align 8
  %16 = getelementptr inbounds i8, i8* %15, i64 0
  %17 = load i8, i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = ashr i32 %18, 7
  %20 = and i32 %19, 1
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %23

; <label>:22:                                     ; preds = %4
  br label %29

; <label>:23:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 13)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 13)
  %25 = load i8*, i8** %6, align 8
  %26 = load i32, i32* %8, align 4
  %27 = call i32 @find0span(i8* %25, i32 0, i32 %26)
  %28 = add nsw i32 0, %27
  br label %29

; <label>:29:                                     ; preds = %23, %22
  %30 = phi i32 [ 0, %22 ], [ %28, %23 ]
  store i32 %30, i32* %10, align 4
  %31 = load i8*, i8** %7, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 0
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = ashr i32 %34, 7
  %36 = and i32 %35, 1
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %40

; <label>:38:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 14)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 14)
  br label %46

; <label>:40:                                     ; preds = %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 15)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 15)
  %42 = load i8*, i8** %7, align 8
  %43 = load i32, i32* %8, align 4
  %44 = call i32 @find0span(i8* %42, i32 0, i32 %43)
  %45 = add nsw i32 0, %44
  br label %46

; <label>:46:                                     ; preds = %40, %38
  %47 = phi i32 [ 0, %38 ], [ %45, %40 ]
  store i32 %47, i32* %11, align 4
  br label %48

; <label>:48:                                     ; preds = %297, %46
  %49 = load i32, i32* %11, align 4
  %50 = load i32, i32* %8, align 4
  %51 = icmp ult i32 %49, %50
  br i1 %51, label %52, label %82

; <label>:52:                                     ; preds = %48
  %53 = load i32, i32* %11, align 4
  %54 = load i8*, i8** %7, align 8
  %55 = load i32, i32* %11, align 4
  %56 = lshr i32 %55, 3
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8* %54, i64 %57
  %59 = load i8, i8* %58, align 1
  %60 = zext i8 %59 to i32
  %61 = load i32, i32* %11, align 4
  %62 = and i32 %61, 7
  %63 = sub i32 7, %62
  %64 = ashr i32 %60, %63
  %65 = and i32 %64, 1
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %73

; <label>:67:                                     ; preds = %52
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 4)
  %68 = add i64 %pgocount3, 1
  store i64 %68, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 4)
  %69 = load i8*, i8** %7, align 8
  %70 = load i32, i32* %11, align 4
  %71 = load i32, i32* %8, align 4
  %72 = call i32 @find1span(i8* %69, i32 %70, i32 %71)
  br label %79

; <label>:73:                                     ; preds = %52
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 5)
  %74 = add i64 %pgocount4, 1
  store i64 %74, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 5)
  %75 = load i8*, i8** %7, align 8
  %76 = load i32, i32* %11, align 4
  %77 = load i32, i32* %8, align 4
  %78 = call i32 @find0span(i8* %75, i32 %76, i32 %77)
  br label %79

; <label>:79:                                     ; preds = %73, %67
  %80 = phi i32 [ %72, %67 ], [ %78, %73 ]
  %81 = add i32 %53, %80
  br label %84

; <label>:82:                                     ; preds = %48
  %83 = load i32, i32* %8, align 4
  br label %84

; <label>:84:                                     ; preds = %82, %79
  %85 = phi i32 [ %81, %79 ], [ %83, %82 ]
  store i32 %85, i32* %13, align 4
  %86 = load i32, i32* %13, align 4
  %87 = load i32, i32* %10, align 4
  %88 = icmp uge i32 %86, %87
  br i1 %88, label %89, label %202

; <label>:89:                                     ; preds = %84
  %90 = load i32, i32* %11, align 4
  %91 = load i32, i32* %10, align 4
  %92 = sub i32 %90, %91
  store i32 %92, i32* %14, align 4
  %93 = load i32, i32* %14, align 4
  %94 = icmp sle i32 -3, %93
  br i1 %94, label %95, label %99

; <label>:95:                                     ; preds = %89
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 6)
  %96 = add i64 %pgocount5, 1
  store i64 %96, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 6)
  %97 = load i32, i32* %14, align 4
  %98 = icmp sle i32 %97, 3
  br i1 %98, label %183, label %99

; <label>:99:                                     ; preds = %95, %89
  %100 = load i32, i32* %10, align 4
  %101 = load i32, i32* %8, align 4
  %102 = icmp ult i32 %100, %101
  br i1 %102, label %103, label %133

; <label>:103:                                    ; preds = %99
  %104 = load i32, i32* %10, align 4
  %105 = load i8*, i8** %6, align 8
  %106 = load i32, i32* %10, align 4
  %107 = lshr i32 %106, 3
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds i8, i8* %105, i64 %108
  %110 = load i8, i8* %109, align 1
  %111 = zext i8 %110 to i32
  %112 = load i32, i32* %10, align 4
  %113 = and i32 %112, 7
  %114 = sub i32 7, %113
  %115 = ashr i32 %111, %114
  %116 = and i32 %115, 1
  %117 = icmp ne i32 %116, 0
  br i1 %117, label %118, label %124

; <label>:118:                                    ; preds = %103
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 11)
  %119 = add i64 %pgocount6, 1
  store i64 %119, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 11)
  %120 = load i8*, i8** %6, align 8
  %121 = load i32, i32* %10, align 4
  %122 = load i32, i32* %8, align 4
  %123 = call i32 @find1span(i8* %120, i32 %121, i32 %122)
  br label %130

; <label>:124:                                    ; preds = %103
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 12)
  %125 = add i64 %pgocount7, 1
  store i64 %125, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 12)
  %126 = load i8*, i8** %6, align 8
  %127 = load i32, i32* %10, align 4
  %128 = load i32, i32* %8, align 4
  %129 = call i32 @find0span(i8* %126, i32 %127, i32 %128)
  br label %130

; <label>:130:                                    ; preds = %124, %118
  %131 = phi i32 [ %123, %118 ], [ %129, %124 ]
  %132 = add i32 %104, %131
  br label %136

; <label>:133:                                    ; preds = %99
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 8)
  %134 = add i64 %pgocount8, 1
  store i64 %134, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 8)
  %135 = load i32, i32* %8, align 4
  br label %136

; <label>:136:                                    ; preds = %133, %130
  %137 = phi i32 [ %132, %130 ], [ %135, %133 ]
  store i32 %137, i32* %12, align 4
  %138 = load %struct.tiff*, %struct.tiff** %5, align 8
  %139 = load i16, i16* getelementptr inbounds (%struct.tableentry, %struct.tableentry* @horizcode, i32 0, i32 1), align 2
  %140 = zext i16 %139 to i32
  %141 = load i16, i16* getelementptr inbounds (%struct.tableentry, %struct.tableentry* @horizcode, i32 0, i32 0), align 2
  %142 = zext i16 %141 to i32
  call void @Fax3PutBits(%struct.tiff* %138, i32 %140, i32 %142)
  %143 = load i32, i32* %9, align 4
  %144 = load i32, i32* %10, align 4
  %145 = add i32 %143, %144
  %146 = icmp eq i32 %145, 0
  br i1 %146, label %162, label %147

; <label>:147:                                    ; preds = %136
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 7)
  %148 = add i64 %pgocount9, 1
  store i64 %148, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 7)
  %149 = load i8*, i8** %6, align 8
  %150 = load i32, i32* %9, align 4
  %151 = lshr i32 %150, 3
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds i8, i8* %149, i64 %152
  %154 = load i8, i8* %153, align 1
  %155 = zext i8 %154 to i32
  %156 = load i32, i32* %9, align 4
  %157 = and i32 %156, 7
  %158 = sub i32 7, %157
  %159 = ashr i32 %155, %158
  %160 = and i32 %159, 1
  %161 = icmp eq i32 %160, 0
  br i1 %161, label %162, label %171

; <label>:162:                                    ; preds = %147, %136
  %163 = load %struct.tiff*, %struct.tiff** %5, align 8
  %164 = load i32, i32* %10, align 4
  %165 = load i32, i32* %9, align 4
  %166 = sub i32 %164, %165
  call void @putspan(%struct.tiff* %163, i32 %166, %struct.tableentry* getelementptr inbounds ([109 x %struct.tableentry], [109 x %struct.tableentry]* @TIFFFaxWhiteCodes, i32 0, i32 0))
  %167 = load %struct.tiff*, %struct.tiff** %5, align 8
  %168 = load i32, i32* %12, align 4
  %169 = load i32, i32* %10, align 4
  %170 = sub i32 %168, %169
  call void @putspan(%struct.tiff* %167, i32 %170, %struct.tableentry* getelementptr inbounds ([109 x %struct.tableentry], [109 x %struct.tableentry]* @TIFFFaxBlackCodes, i32 0, i32 0))
  br label %181

; <label>:171:                                    ; preds = %147
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 10)
  %172 = add i64 %pgocount10, 1
  store i64 %172, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 10)
  %173 = load %struct.tiff*, %struct.tiff** %5, align 8
  %174 = load i32, i32* %10, align 4
  %175 = load i32, i32* %9, align 4
  %176 = sub i32 %174, %175
  call void @putspan(%struct.tiff* %173, i32 %176, %struct.tableentry* getelementptr inbounds ([109 x %struct.tableentry], [109 x %struct.tableentry]* @TIFFFaxBlackCodes, i32 0, i32 0))
  %177 = load %struct.tiff*, %struct.tiff** %5, align 8
  %178 = load i32, i32* %12, align 4
  %179 = load i32, i32* %10, align 4
  %180 = sub i32 %178, %179
  call void @putspan(%struct.tiff* %177, i32 %180, %struct.tableentry* getelementptr inbounds ([109 x %struct.tableentry], [109 x %struct.tableentry]* @TIFFFaxWhiteCodes, i32 0, i32 0))
  br label %181

; <label>:181:                                    ; preds = %171, %162
  %182 = load i32, i32* %12, align 4
  store i32 %182, i32* %9, align 4
  br label %201

; <label>:183:                                    ; preds = %95
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 9)
  %184 = add i64 %pgocount11, 1
  store i64 %184, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 9)
  %185 = load %struct.tiff*, %struct.tiff** %5, align 8
  %186 = load i32, i32* %14, align 4
  %187 = add nsw i32 %186, 3
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [7 x %struct.tableentry], [7 x %struct.tableentry]* @vcodes, i64 0, i64 %188
  %190 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %189, i32 0, i32 1
  %191 = load i16, i16* %190, align 2
  %192 = zext i16 %191 to i32
  %193 = load i32, i32* %14, align 4
  %194 = add nsw i32 %193, 3
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds [7 x %struct.tableentry], [7 x %struct.tableentry]* @vcodes, i64 0, i64 %195
  %197 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %196, i32 0, i32 0
  %198 = load i16, i16* %197, align 2
  %199 = zext i16 %198 to i32
  call void @Fax3PutBits(%struct.tiff* %185, i32 %192, i32 %199)
  %200 = load i32, i32* %10, align 4
  store i32 %200, i32* %9, align 4
  br label %201

; <label>:201:                                    ; preds = %183, %181
  br label %209

; <label>:202:                                    ; preds = %84
  %203 = load %struct.tiff*, %struct.tiff** %5, align 8
  %204 = load i16, i16* getelementptr inbounds (%struct.tableentry, %struct.tableentry* @passcode, i32 0, i32 1), align 2
  %205 = zext i16 %204 to i32
  %206 = load i16, i16* getelementptr inbounds (%struct.tableentry, %struct.tableentry* @passcode, i32 0, i32 0), align 2
  %207 = zext i16 %206 to i32
  call void @Fax3PutBits(%struct.tiff* %203, i32 %205, i32 %207)
  %208 = load i32, i32* %13, align 4
  store i32 %208, i32* %9, align 4
  br label %209

; <label>:209:                                    ; preds = %202, %201
  %210 = load i32, i32* %9, align 4
  %211 = load i32, i32* %8, align 4
  %212 = icmp uge i32 %210, %211
  br i1 %212, label %213, label %214

; <label>:213:                                    ; preds = %209
  br label %300

; <label>:214:                                    ; preds = %209
  %215 = load i32, i32* %9, align 4
  %216 = load i8*, i8** %6, align 8
  %217 = load i32, i32* %9, align 4
  %218 = lshr i32 %217, 3
  %219 = zext i32 %218 to i64
  %220 = getelementptr inbounds i8, i8* %216, i64 %219
  %221 = load i8, i8* %220, align 1
  %222 = zext i8 %221 to i32
  %223 = load i32, i32* %9, align 4
  %224 = and i32 %223, 7
  %225 = sub i32 7, %224
  %226 = ashr i32 %222, %225
  %227 = and i32 %226, 1
  %228 = icmp ne i32 %227, 0
  br i1 %228, label %229, label %234

; <label>:229:                                    ; preds = %214
  %230 = load i8*, i8** %6, align 8
  %231 = load i32, i32* %9, align 4
  %232 = load i32, i32* %8, align 4
  %233 = call i32 @find1span(i8* %230, i32 %231, i32 %232)
  br label %240

; <label>:234:                                    ; preds = %214
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 0)
  %235 = add i64 %pgocount12, 1
  store i64 %235, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 0)
  %236 = load i8*, i8** %6, align 8
  %237 = load i32, i32* %9, align 4
  %238 = load i32, i32* %8, align 4
  %239 = call i32 @find0span(i8* %236, i32 %237, i32 %238)
  br label %240

; <label>:240:                                    ; preds = %234, %229
  %241 = phi i32 [ %233, %229 ], [ %239, %234 ]
  %242 = add i32 %215, %241
  store i32 %242, i32* %10, align 4
  %243 = load i32, i32* %9, align 4
  %244 = load i8*, i8** %6, align 8
  %245 = load i32, i32* %9, align 4
  %246 = lshr i32 %245, 3
  %247 = zext i32 %246 to i64
  %248 = getelementptr inbounds i8, i8* %244, i64 %247
  %249 = load i8, i8* %248, align 1
  %250 = zext i8 %249 to i32
  %251 = load i32, i32* %9, align 4
  %252 = and i32 %251, 7
  %253 = sub i32 7, %252
  %254 = ashr i32 %250, %253
  %255 = and i32 %254, 1
  %256 = icmp ne i32 %255, 0
  br i1 %256, label %262, label %257

; <label>:257:                                    ; preds = %240
  %258 = load i8*, i8** %7, align 8
  %259 = load i32, i32* %9, align 4
  %260 = load i32, i32* %8, align 4
  %261 = call i32 @find1span(i8* %258, i32 %259, i32 %260)
  br label %268

; <label>:262:                                    ; preds = %240
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 1)
  %263 = add i64 %pgocount13, 1
  store i64 %263, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 1)
  %264 = load i8*, i8** %7, align 8
  %265 = load i32, i32* %9, align 4
  %266 = load i32, i32* %8, align 4
  %267 = call i32 @find0span(i8* %264, i32 %265, i32 %266)
  br label %268

; <label>:268:                                    ; preds = %262, %257
  %269 = phi i32 [ %261, %257 ], [ %267, %262 ]
  %270 = add i32 %243, %269
  store i32 %270, i32* %11, align 4
  %271 = load i32, i32* %11, align 4
  %272 = load i8*, i8** %6, align 8
  %273 = load i32, i32* %9, align 4
  %274 = lshr i32 %273, 3
  %275 = zext i32 %274 to i64
  %276 = getelementptr inbounds i8, i8* %272, i64 %275
  %277 = load i8, i8* %276, align 1
  %278 = zext i8 %277 to i32
  %279 = load i32, i32* %9, align 4
  %280 = and i32 %279, 7
  %281 = sub i32 7, %280
  %282 = ashr i32 %278, %281
  %283 = and i32 %282, 1
  %284 = icmp ne i32 %283, 0
  br i1 %284, label %285, label %291

; <label>:285:                                    ; preds = %268
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 2)
  %286 = add i64 %pgocount14, 1
  store i64 %286, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 2)
  %287 = load i8*, i8** %7, align 8
  %288 = load i32, i32* %11, align 4
  %289 = load i32, i32* %8, align 4
  %290 = call i32 @find1span(i8* %287, i32 %288, i32 %289)
  br label %297

; <label>:291:                                    ; preds = %268
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 3)
  %292 = add i64 %pgocount15, 1
  store i64 %292, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_Fax3Encode2DRow, i64 0, i64 3)
  %293 = load i8*, i8** %7, align 8
  %294 = load i32, i32* %11, align 4
  %295 = load i32, i32* %8, align 4
  %296 = call i32 @find0span(i8* %293, i32 %294, i32 %295)
  br label %297

; <label>:297:                                    ; preds = %291, %285
  %298 = phi i32 [ %290, %285 ], [ %296, %291 ]
  %299 = add i32 %271, %298
  store i32 %299, i32* %11, align 4
  br label %48

; <label>:300:                                    ; preds = %213
  ret i32 1
}

declare void @_TIFFmemcpy(i8*, i8*, i32) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @find0span(i8*, i32, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i64*, align 8
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %12 = load i32, i32* %7, align 4
  %13 = load i32, i32* %6, align 4
  %14 = sub nsw i32 %12, %13
  store i32 %14, i32* %8, align 4
  %15 = load i32, i32* %6, align 4
  %16 = ashr i32 %15, 3
  %17 = load i8*, i8** %5, align 8
  %18 = sext i32 %16 to i64
  %19 = getelementptr inbounds i8, i8* %17, i64 %18
  store i8* %19, i8** %5, align 8
  %20 = load i32, i32* %8, align 4
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %22, label %68

; <label>:22:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 4)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 4)
  %24 = load i32, i32* %6, align 4
  %25 = and i32 %24, 7
  store i32 %25, i32* %9, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %68

; <label>:27:                                     ; preds = %22
  %28 = load i8*, i8** %5, align 8
  %29 = load i8, i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = load i32, i32* %9, align 4
  %32 = shl i32 %30, %31
  %33 = and i32 %32, 255
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [256 x i8], [256 x i8]* @zeroruns, i64 0, i64 %34
  %36 = load i8, i8* %35, align 1
  %37 = zext i8 %36 to i32
  store i32 %37, i32* %10, align 4
  %38 = load i32, i32* %10, align 4
  %39 = load i32, i32* %9, align 4
  %40 = sub nsw i32 8, %39
  %41 = icmp sgt i32 %38, %40
  br i1 %41, label %42, label %46

; <label>:42:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 7)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 7)
  %44 = load i32, i32* %9, align 4
  %45 = sub nsw i32 8, %44
  store i32 %45, i32* %10, align 4
  br label %46

; <label>:46:                                     ; preds = %42, %27
  %47 = load i32, i32* %10, align 4
  %48 = load i32, i32* %8, align 4
  %49 = icmp sgt i32 %47, %48
  br i1 %49, label %50, label %53

; <label>:50:                                     ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 8)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 8)
  %52 = load i32, i32* %8, align 4
  store i32 %52, i32* %10, align 4
  br label %53

; <label>:53:                                     ; preds = %50, %46
  %54 = load i32, i32* %9, align 4
  %55 = load i32, i32* %10, align 4
  %56 = add nsw i32 %54, %55
  %57 = icmp slt i32 %56, 8
  br i1 %57, label %58, label %61

; <label>:58:                                     ; preds = %53
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 9)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 9)
  %60 = load i32, i32* %10, align 4
  store i32 %60, i32* %4, align 4
  br label %186

; <label>:61:                                     ; preds = %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 10)
  %62 = add i64 %pgocount4, 1
  store i64 %62, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 10)
  %63 = load i32, i32* %10, align 4
  %64 = load i32, i32* %8, align 4
  %65 = sub nsw i32 %64, %63
  store i32 %65, i32* %8, align 4
  %66 = load i8*, i8** %5, align 8
  %67 = getelementptr inbounds i8, i8* %66, i32 1
  store i8* %67, i8** %5, align 8
  br label %69

; <label>:68:                                     ; preds = %22, %3
  store i32 0, i32* %10, align 4
  br label %69

; <label>:69:                                     ; preds = %68, %61
  %70 = load i32, i32* %8, align 4
  %71 = sext i32 %70 to i64
  %72 = icmp uge i64 %71, 128
  br i1 %72, label %73, label %133

; <label>:73:                                     ; preds = %69
  br label %74

; <label>:74:                                     ; preds = %95, %73
  %75 = load i8*, i8** %5, align 8
  %76 = ptrtoint i8* %75 to i64
  %77 = and i64 %76, 7
  %78 = icmp eq i64 %77, 0
  %79 = xor i1 %78, true
  br i1 %79, label %80, label %103

; <label>:80:                                     ; preds = %74
  %81 = load i8*, i8** %5, align 8
  %82 = load i8, i8* %81, align 1
  %83 = zext i8 %82 to i32
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %85, label %95

; <label>:85:                                     ; preds = %80
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 11)
  %86 = add i64 %pgocount5, 1
  store i64 %86, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 11)
  %87 = load i32, i32* %10, align 4
  %88 = load i8*, i8** %5, align 8
  %89 = load i8, i8* %88, align 1
  %90 = zext i8 %89 to i64
  %91 = getelementptr inbounds [256 x i8], [256 x i8]* @zeroruns, i64 0, i64 %90
  %92 = load i8, i8* %91, align 1
  %93 = zext i8 %92 to i32
  %94 = add nsw i32 %87, %93
  store i32 %94, i32* %4, align 4
  br label %186

; <label>:95:                                     ; preds = %80
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 2)
  %96 = add i64 %pgocount6, 1
  store i64 %96, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 2)
  %97 = load i32, i32* %10, align 4
  %98 = add nsw i32 %97, 8
  store i32 %98, i32* %10, align 4
  %99 = load i32, i32* %8, align 4
  %100 = sub nsw i32 %99, 8
  store i32 %100, i32* %8, align 4
  %101 = load i8*, i8** %5, align 8
  %102 = getelementptr inbounds i8, i8* %101, i32 1
  store i8* %102, i8** %5, align 8
  br label %74

; <label>:103:                                    ; preds = %74
  %104 = load i8*, i8** %5, align 8
  %105 = bitcast i8* %104 to i64*
  store i64* %105, i64** %11, align 8
  br label %106

; <label>:106:                                    ; preds = %117, %103
  %107 = load i32, i32* %8, align 4
  %108 = sext i32 %107 to i64
  %109 = icmp uge i64 %108, 64
  br i1 %109, label %110, label %115

; <label>:110:                                    ; preds = %106
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 3)
  %111 = add i64 %pgocount7, 1
  store i64 %111, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 3)
  %112 = load i64*, i64** %11, align 8
  %113 = load i64, i64* %112, align 8
  %114 = icmp eq i64 %113, 0
  br label %115

; <label>:115:                                    ; preds = %110, %106
  %116 = phi i1 [ false, %106 ], [ %114, %110 ]
  br i1 %116, label %117, label %129

; <label>:117:                                    ; preds = %115
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 1)
  %118 = add i64 %pgocount8, 1
  store i64 %118, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 1)
  %119 = load i32, i32* %10, align 4
  %120 = sext i32 %119 to i64
  %121 = add i64 %120, 64
  %122 = trunc i64 %121 to i32
  store i32 %122, i32* %10, align 4
  %123 = load i32, i32* %8, align 4
  %124 = sext i32 %123 to i64
  %125 = sub i64 %124, 64
  %126 = trunc i64 %125 to i32
  store i32 %126, i32* %8, align 4
  %127 = load i64*, i64** %11, align 8
  %128 = getelementptr inbounds i64, i64* %127, i32 1
  store i64* %128, i64** %11, align 8
  br label %106

; <label>:129:                                    ; preds = %115
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 12)
  %130 = add i64 %pgocount9, 1
  store i64 %130, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 12)
  %131 = load i64*, i64** %11, align 8
  %132 = bitcast i64* %131 to i8*
  store i8* %132, i8** %5, align 8
  br label %133

; <label>:133:                                    ; preds = %129, %69
  br label %134

; <label>:134:                                    ; preds = %152, %133
  %135 = load i32, i32* %8, align 4
  %136 = icmp sge i32 %135, 8
  br i1 %136, label %137, label %160

; <label>:137:                                    ; preds = %134
  %138 = load i8*, i8** %5, align 8
  %139 = load i8, i8* %138, align 1
  %140 = zext i8 %139 to i32
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %142, label %152

; <label>:142:                                    ; preds = %137
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 6)
  %143 = add i64 %pgocount10, 1
  store i64 %143, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 6)
  %144 = load i32, i32* %10, align 4
  %145 = load i8*, i8** %5, align 8
  %146 = load i8, i8* %145, align 1
  %147 = zext i8 %146 to i64
  %148 = getelementptr inbounds [256 x i8], [256 x i8]* @zeroruns, i64 0, i64 %147
  %149 = load i8, i8* %148, align 1
  %150 = zext i8 %149 to i32
  %151 = add nsw i32 %144, %150
  store i32 %151, i32* %4, align 4
  br label %186

; <label>:152:                                    ; preds = %137
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 0)
  %153 = add i64 %pgocount11, 1
  store i64 %153, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 0)
  %154 = load i32, i32* %10, align 4
  %155 = add nsw i32 %154, 8
  store i32 %155, i32* %10, align 4
  %156 = load i32, i32* %8, align 4
  %157 = sub nsw i32 %156, 8
  store i32 %157, i32* %8, align 4
  %158 = load i8*, i8** %5, align 8
  %159 = getelementptr inbounds i8, i8* %158, i32 1
  store i8* %159, i8** %5, align 8
  br label %134

; <label>:160:                                    ; preds = %134
  %161 = load i32, i32* %8, align 4
  %162 = icmp sgt i32 %161, 0
  br i1 %162, label %163, label %183

; <label>:163:                                    ; preds = %160
  %164 = load i8*, i8** %5, align 8
  %165 = load i8, i8* %164, align 1
  %166 = zext i8 %165 to i64
  %167 = getelementptr inbounds [256 x i8], [256 x i8]* @zeroruns, i64 0, i64 %166
  %168 = load i8, i8* %167, align 1
  %169 = zext i8 %168 to i32
  store i32 %169, i32* %9, align 4
  %170 = load i32, i32* %9, align 4
  %171 = load i32, i32* %8, align 4
  %172 = icmp sgt i32 %170, %171
  br i1 %172, label %173, label %176

; <label>:173:                                    ; preds = %163
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 13)
  %174 = add i64 %pgocount12, 1
  store i64 %174, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 13)
  %175 = load i32, i32* %8, align 4
  br label %179

; <label>:176:                                    ; preds = %163
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 14)
  %177 = add i64 %pgocount13, 1
  store i64 %177, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 14)
  %178 = load i32, i32* %9, align 4
  br label %179

; <label>:179:                                    ; preds = %176, %173
  %180 = phi i32 [ %175, %173 ], [ %178, %176 ]
  %181 = load i32, i32* %10, align 4
  %182 = add nsw i32 %181, %180
  store i32 %182, i32* %10, align 4
  br label %183

; <label>:183:                                    ; preds = %179, %160
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 5)
  %184 = add i64 %pgocount14, 1
  store i64 %184, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find0span, i64 0, i64 5)
  %185 = load i32, i32* %10, align 4
  store i32 %185, i32* %4, align 4
  br label %186

; <label>:186:                                    ; preds = %183, %142, %85, %58
  %187 = load i32, i32* %4, align 4
  ret i32 %187
}

; Function Attrs: noinline nounwind uwtable
define internal void @putspan(%struct.tiff*, i32, %struct.tableentry*) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.tableentry*, align 8
  %7 = alloca %struct.Fax3EncodeState*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.tableentry*, align 8
  %13 = alloca %struct.tableentry*, align 8
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  store %struct.tableentry* %2, %struct.tableentry** %6, align 8
  %14 = load %struct.tiff*, %struct.tiff** %4, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 37
  %16 = load i8*, i8** %15, align 8
  %17 = bitcast i8* %16 to %struct.Fax3BaseState*
  %18 = bitcast %struct.Fax3BaseState* %17 to %struct.Fax3EncodeState*
  store %struct.Fax3EncodeState* %18, %struct.Fax3EncodeState** %7, align 8
  %19 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %7, align 8
  %20 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %19, i32 0, i32 2
  %21 = load i32, i32* %20, align 4
  store i32 %21, i32* %8, align 4
  %22 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %7, align 8
  %23 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %22, i32 0, i32 1
  %24 = load i32, i32* %23, align 8
  store i32 %24, i32* %9, align 4
  br label %25

; <label>:25:                                     ; preds = %119, %3
  %26 = load i32, i32* %5, align 4
  %27 = icmp sge i32 %26, 2624
  br i1 %27, label %28, label %127

; <label>:28:                                     ; preds = %25
  %29 = load %struct.tableentry*, %struct.tableentry** %6, align 8
  %30 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %29, i64 103
  store %struct.tableentry* %30, %struct.tableentry** %12, align 8
  %31 = load %struct.tableentry*, %struct.tableentry** %12, align 8
  %32 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %31, i32 0, i32 1
  %33 = load i16, i16* %32, align 2
  %34 = zext i16 %33 to i32
  store i32 %34, i32* %10, align 4
  %35 = load %struct.tableentry*, %struct.tableentry** %12, align 8
  %36 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %35, i32 0, i32 0
  %37 = load i16, i16* %36, align 2
  %38 = zext i16 %37 to i32
  store i32 %38, i32* %11, align 4
  br label %39

; <label>:39:                                     ; preds = %65, %28
  %40 = load i32, i32* %11, align 4
  %41 = load i32, i32* %8, align 4
  %42 = icmp ugt i32 %40, %41
  br i1 %42, label %43, label %77

; <label>:43:                                     ; preds = %39
  %44 = load i32, i32* %10, align 4
  %45 = load i32, i32* %11, align 4
  %46 = load i32, i32* %8, align 4
  %47 = sub i32 %45, %46
  %48 = lshr i32 %44, %47
  %49 = load i32, i32* %9, align 4
  %50 = or i32 %49, %48
  store i32 %50, i32* %9, align 4
  %51 = load i32, i32* %8, align 4
  %52 = load i32, i32* %11, align 4
  %53 = sub i32 %52, %51
  store i32 %53, i32* %11, align 4
  %54 = load %struct.tiff*, %struct.tiff** %4, align 8
  %55 = getelementptr inbounds %struct.tiff, %struct.tiff* %54, i32 0, i32 43
  %56 = load i32, i32* %55, align 8
  %57 = load %struct.tiff*, %struct.tiff** %4, align 8
  %58 = getelementptr inbounds %struct.tiff, %struct.tiff* %57, i32 0, i32 41
  %59 = load i32, i32* %58, align 8
  %60 = icmp sge i32 %56, %59
  br i1 %60, label %61, label %65

; <label>:61:                                     ; preds = %43
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 0)
  %62 = add i64 %pgocount, 1
  store i64 %62, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 0)
  %63 = load %struct.tiff*, %struct.tiff** %4, align 8
  %64 = call i32 @TIFFFlushData1(%struct.tiff* %63)
  br label %65

; <label>:65:                                     ; preds = %61, %43
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 1)
  %66 = add i64 %pgocount1, 1
  store i64 %66, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 1)
  %67 = load i32, i32* %9, align 4
  %68 = trunc i32 %67 to i8
  %69 = load %struct.tiff*, %struct.tiff** %4, align 8
  %70 = getelementptr inbounds %struct.tiff, %struct.tiff* %69, i32 0, i32 42
  %71 = load i8*, i8** %70, align 8
  %72 = getelementptr inbounds i8, i8* %71, i32 1
  store i8* %72, i8** %70, align 8
  store i8 %68, i8* %71, align 1
  %73 = load %struct.tiff*, %struct.tiff** %4, align 8
  %74 = getelementptr inbounds %struct.tiff, %struct.tiff* %73, i32 0, i32 43
  %75 = load i32, i32* %74, align 8
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %74, align 8
  store i32 0, i32* %9, align 4
  store i32 8, i32* %8, align 4
  br label %39

; <label>:77:                                     ; preds = %39
  %78 = load i32, i32* %10, align 4
  %79 = load i32, i32* %11, align 4
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds [9 x i32], [9 x i32]* @_msbmask, i64 0, i64 %80
  %82 = load i32, i32* %81, align 4
  %83 = and i32 %78, %82
  %84 = load i32, i32* %8, align 4
  %85 = load i32, i32* %11, align 4
  %86 = sub i32 %84, %85
  %87 = shl i32 %83, %86
  %88 = load i32, i32* %9, align 4
  %89 = or i32 %88, %87
  store i32 %89, i32* %9, align 4
  %90 = load i32, i32* %11, align 4
  %91 = load i32, i32* %8, align 4
  %92 = sub i32 %91, %90
  store i32 %92, i32* %8, align 4
  %93 = load i32, i32* %8, align 4
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %95, label %119

; <label>:95:                                     ; preds = %77
  %96 = load %struct.tiff*, %struct.tiff** %4, align 8
  %97 = getelementptr inbounds %struct.tiff, %struct.tiff* %96, i32 0, i32 43
  %98 = load i32, i32* %97, align 8
  %99 = load %struct.tiff*, %struct.tiff** %4, align 8
  %100 = getelementptr inbounds %struct.tiff, %struct.tiff* %99, i32 0, i32 41
  %101 = load i32, i32* %100, align 8
  %102 = icmp sge i32 %98, %101
  br i1 %102, label %103, label %107

; <label>:103:                                    ; preds = %95
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 8)
  %104 = add i64 %pgocount2, 1
  store i64 %104, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 8)
  %105 = load %struct.tiff*, %struct.tiff** %4, align 8
  %106 = call i32 @TIFFFlushData1(%struct.tiff* %105)
  br label %107

; <label>:107:                                    ; preds = %103, %95
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 6)
  %108 = add i64 %pgocount3, 1
  store i64 %108, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 6)
  %109 = load i32, i32* %9, align 4
  %110 = trunc i32 %109 to i8
  %111 = load %struct.tiff*, %struct.tiff** %4, align 8
  %112 = getelementptr inbounds %struct.tiff, %struct.tiff* %111, i32 0, i32 42
  %113 = load i8*, i8** %112, align 8
  %114 = getelementptr inbounds i8, i8* %113, i32 1
  store i8* %114, i8** %112, align 8
  store i8 %110, i8* %113, align 1
  %115 = load %struct.tiff*, %struct.tiff** %4, align 8
  %116 = getelementptr inbounds %struct.tiff, %struct.tiff* %115, i32 0, i32 43
  %117 = load i32, i32* %116, align 8
  %118 = add nsw i32 %117, 1
  store i32 %118, i32* %116, align 8
  store i32 0, i32* %9, align 4
  store i32 8, i32* %8, align 4
  br label %119

; <label>:119:                                    ; preds = %107, %77
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 2)
  %120 = add i64 %pgocount4, 1
  store i64 %120, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 2)
  %121 = load %struct.tableentry*, %struct.tableentry** %12, align 8
  %122 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %121, i32 0, i32 2
  %123 = load i16, i16* %122, align 2
  %124 = sext i16 %123 to i32
  %125 = load i32, i32* %5, align 4
  %126 = sub nsw i32 %125, %124
  store i32 %126, i32* %5, align 4
  br label %25

; <label>:127:                                    ; preds = %25
  %128 = load i32, i32* %5, align 4
  %129 = icmp sge i32 %128, 64
  br i1 %129, label %130, label %246

; <label>:130:                                    ; preds = %127
  %131 = load %struct.tableentry*, %struct.tableentry** %6, align 8
  %132 = load i32, i32* %5, align 4
  %133 = ashr i32 %132, 6
  %134 = add nsw i32 63, %133
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %131, i64 %135
  store %struct.tableentry* %136, %struct.tableentry** %13, align 8
  %137 = load %struct.tableentry*, %struct.tableentry** %13, align 8
  %138 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %137, i32 0, i32 2
  %139 = load i16, i16* %138, align 2
  %140 = sext i16 %139 to i32
  %141 = load i32, i32* %5, align 4
  %142 = ashr i32 %141, 6
  %143 = mul nsw i32 64, %142
  %144 = icmp eq i32 %140, %143
  br i1 %144, label %145, label %146

; <label>:145:                                    ; preds = %130
  br label %149

; <label>:146:                                    ; preds = %130
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 15)
  %147 = add i64 %pgocount5, 1
  store i64 %147, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 15)
  call void @__assert_fail(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 632, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__PRETTY_FUNCTION__.putspan, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %149

; <label>:149:                                    ; preds = %148, %145
  %150 = load %struct.tableentry*, %struct.tableentry** %13, align 8
  %151 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %150, i32 0, i32 1
  %152 = load i16, i16* %151, align 2
  %153 = zext i16 %152 to i32
  store i32 %153, i32* %10, align 4
  %154 = load %struct.tableentry*, %struct.tableentry** %13, align 8
  %155 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %154, i32 0, i32 0
  %156 = load i16, i16* %155, align 2
  %157 = zext i16 %156 to i32
  store i32 %157, i32* %11, align 4
  br label %158

; <label>:158:                                    ; preds = %184, %149
  %159 = load i32, i32* %11, align 4
  %160 = load i32, i32* %8, align 4
  %161 = icmp ugt i32 %159, %160
  br i1 %161, label %162, label %196

; <label>:162:                                    ; preds = %158
  %163 = load i32, i32* %10, align 4
  %164 = load i32, i32* %11, align 4
  %165 = load i32, i32* %8, align 4
  %166 = sub i32 %164, %165
  %167 = lshr i32 %163, %166
  %168 = load i32, i32* %9, align 4
  %169 = or i32 %168, %167
  store i32 %169, i32* %9, align 4
  %170 = load i32, i32* %8, align 4
  %171 = load i32, i32* %11, align 4
  %172 = sub i32 %171, %170
  store i32 %172, i32* %11, align 4
  %173 = load %struct.tiff*, %struct.tiff** %4, align 8
  %174 = getelementptr inbounds %struct.tiff, %struct.tiff* %173, i32 0, i32 43
  %175 = load i32, i32* %174, align 8
  %176 = load %struct.tiff*, %struct.tiff** %4, align 8
  %177 = getelementptr inbounds %struct.tiff, %struct.tiff* %176, i32 0, i32 41
  %178 = load i32, i32* %177, align 8
  %179 = icmp sge i32 %175, %178
  br i1 %179, label %180, label %184

; <label>:180:                                    ; preds = %162
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 7)
  %181 = add i64 %pgocount6, 1
  store i64 %181, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 7)
  %182 = load %struct.tiff*, %struct.tiff** %4, align 8
  %183 = call i32 @TIFFFlushData1(%struct.tiff* %182)
  br label %184

; <label>:184:                                    ; preds = %180, %162
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 5)
  %185 = add i64 %pgocount7, 1
  store i64 %185, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 5)
  %186 = load i32, i32* %9, align 4
  %187 = trunc i32 %186 to i8
  %188 = load %struct.tiff*, %struct.tiff** %4, align 8
  %189 = getelementptr inbounds %struct.tiff, %struct.tiff* %188, i32 0, i32 42
  %190 = load i8*, i8** %189, align 8
  %191 = getelementptr inbounds i8, i8* %190, i32 1
  store i8* %191, i8** %189, align 8
  store i8 %187, i8* %190, align 1
  %192 = load %struct.tiff*, %struct.tiff** %4, align 8
  %193 = getelementptr inbounds %struct.tiff, %struct.tiff* %192, i32 0, i32 43
  %194 = load i32, i32* %193, align 8
  %195 = add nsw i32 %194, 1
  store i32 %195, i32* %193, align 8
  store i32 0, i32* %9, align 4
  store i32 8, i32* %8, align 4
  br label %158

; <label>:196:                                    ; preds = %158
  %197 = load i32, i32* %10, align 4
  %198 = load i32, i32* %11, align 4
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds [9 x i32], [9 x i32]* @_msbmask, i64 0, i64 %199
  %201 = load i32, i32* %200, align 4
  %202 = and i32 %197, %201
  %203 = load i32, i32* %8, align 4
  %204 = load i32, i32* %11, align 4
  %205 = sub i32 %203, %204
  %206 = shl i32 %202, %205
  %207 = load i32, i32* %9, align 4
  %208 = or i32 %207, %206
  store i32 %208, i32* %9, align 4
  %209 = load i32, i32* %11, align 4
  %210 = load i32, i32* %8, align 4
  %211 = sub i32 %210, %209
  store i32 %211, i32* %8, align 4
  %212 = load i32, i32* %8, align 4
  %213 = icmp eq i32 %212, 0
  br i1 %213, label %214, label %238

; <label>:214:                                    ; preds = %196
  %215 = load %struct.tiff*, %struct.tiff** %4, align 8
  %216 = getelementptr inbounds %struct.tiff, %struct.tiff* %215, i32 0, i32 43
  %217 = load i32, i32* %216, align 8
  %218 = load %struct.tiff*, %struct.tiff** %4, align 8
  %219 = getelementptr inbounds %struct.tiff, %struct.tiff* %218, i32 0, i32 41
  %220 = load i32, i32* %219, align 8
  %221 = icmp sge i32 %217, %220
  br i1 %221, label %222, label %226

; <label>:222:                                    ; preds = %214
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 14)
  %223 = add i64 %pgocount8, 1
  store i64 %223, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 14)
  %224 = load %struct.tiff*, %struct.tiff** %4, align 8
  %225 = call i32 @TIFFFlushData1(%struct.tiff* %224)
  br label %226

; <label>:226:                                    ; preds = %222, %214
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 13)
  %227 = add i64 %pgocount9, 1
  store i64 %227, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 13)
  %228 = load i32, i32* %9, align 4
  %229 = trunc i32 %228 to i8
  %230 = load %struct.tiff*, %struct.tiff** %4, align 8
  %231 = getelementptr inbounds %struct.tiff, %struct.tiff* %230, i32 0, i32 42
  %232 = load i8*, i8** %231, align 8
  %233 = getelementptr inbounds i8, i8* %232, i32 1
  store i8* %233, i8** %231, align 8
  store i8 %229, i8* %232, align 1
  %234 = load %struct.tiff*, %struct.tiff** %4, align 8
  %235 = getelementptr inbounds %struct.tiff, %struct.tiff* %234, i32 0, i32 43
  %236 = load i32, i32* %235, align 8
  %237 = add nsw i32 %236, 1
  store i32 %237, i32* %235, align 8
  store i32 0, i32* %9, align 4
  store i32 8, i32* %8, align 4
  br label %238

; <label>:238:                                    ; preds = %226, %196
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 10)
  %239 = add i64 %pgocount10, 1
  store i64 %239, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 10)
  %240 = load %struct.tableentry*, %struct.tableentry** %13, align 8
  %241 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %240, i32 0, i32 2
  %242 = load i16, i16* %241, align 2
  %243 = sext i16 %242 to i32
  %244 = load i32, i32* %5, align 4
  %245 = sub nsw i32 %244, %243
  store i32 %245, i32* %5, align 4
  br label %246

; <label>:246:                                    ; preds = %238, %127
  %247 = load %struct.tableentry*, %struct.tableentry** %6, align 8
  %248 = load i32, i32* %5, align 4
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %247, i64 %249
  %251 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %250, i32 0, i32 1
  %252 = load i16, i16* %251, align 2
  %253 = zext i16 %252 to i32
  store i32 %253, i32* %10, align 4
  %254 = load %struct.tableentry*, %struct.tableentry** %6, align 8
  %255 = load i32, i32* %5, align 4
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %254, i64 %256
  %258 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %257, i32 0, i32 0
  %259 = load i16, i16* %258, align 2
  %260 = zext i16 %259 to i32
  store i32 %260, i32* %11, align 4
  br label %261

; <label>:261:                                    ; preds = %287, %246
  %262 = load i32, i32* %11, align 4
  %263 = load i32, i32* %8, align 4
  %264 = icmp ugt i32 %262, %263
  br i1 %264, label %265, label %299

; <label>:265:                                    ; preds = %261
  %266 = load i32, i32* %10, align 4
  %267 = load i32, i32* %11, align 4
  %268 = load i32, i32* %8, align 4
  %269 = sub i32 %267, %268
  %270 = lshr i32 %266, %269
  %271 = load i32, i32* %9, align 4
  %272 = or i32 %271, %270
  store i32 %272, i32* %9, align 4
  %273 = load i32, i32* %8, align 4
  %274 = load i32, i32* %11, align 4
  %275 = sub i32 %274, %273
  store i32 %275, i32* %11, align 4
  %276 = load %struct.tiff*, %struct.tiff** %4, align 8
  %277 = getelementptr inbounds %struct.tiff, %struct.tiff* %276, i32 0, i32 43
  %278 = load i32, i32* %277, align 8
  %279 = load %struct.tiff*, %struct.tiff** %4, align 8
  %280 = getelementptr inbounds %struct.tiff, %struct.tiff* %279, i32 0, i32 41
  %281 = load i32, i32* %280, align 8
  %282 = icmp sge i32 %278, %281
  br i1 %282, label %283, label %287

; <label>:283:                                    ; preds = %265
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 4)
  %284 = add i64 %pgocount11, 1
  store i64 %284, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 4)
  %285 = load %struct.tiff*, %struct.tiff** %4, align 8
  %286 = call i32 @TIFFFlushData1(%struct.tiff* %285)
  br label %287

; <label>:287:                                    ; preds = %283, %265
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 3)
  %288 = add i64 %pgocount12, 1
  store i64 %288, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 3)
  %289 = load i32, i32* %9, align 4
  %290 = trunc i32 %289 to i8
  %291 = load %struct.tiff*, %struct.tiff** %4, align 8
  %292 = getelementptr inbounds %struct.tiff, %struct.tiff* %291, i32 0, i32 42
  %293 = load i8*, i8** %292, align 8
  %294 = getelementptr inbounds i8, i8* %293, i32 1
  store i8* %294, i8** %292, align 8
  store i8 %290, i8* %293, align 1
  %295 = load %struct.tiff*, %struct.tiff** %4, align 8
  %296 = getelementptr inbounds %struct.tiff, %struct.tiff* %295, i32 0, i32 43
  %297 = load i32, i32* %296, align 8
  %298 = add nsw i32 %297, 1
  store i32 %298, i32* %296, align 8
  store i32 0, i32* %9, align 4
  store i32 8, i32* %8, align 4
  br label %261

; <label>:299:                                    ; preds = %261
  %300 = load i32, i32* %10, align 4
  %301 = load i32, i32* %11, align 4
  %302 = zext i32 %301 to i64
  %303 = getelementptr inbounds [9 x i32], [9 x i32]* @_msbmask, i64 0, i64 %302
  %304 = load i32, i32* %303, align 4
  %305 = and i32 %300, %304
  %306 = load i32, i32* %8, align 4
  %307 = load i32, i32* %11, align 4
  %308 = sub i32 %306, %307
  %309 = shl i32 %305, %308
  %310 = load i32, i32* %9, align 4
  %311 = or i32 %310, %309
  store i32 %311, i32* %9, align 4
  %312 = load i32, i32* %11, align 4
  %313 = load i32, i32* %8, align 4
  %314 = sub i32 %313, %312
  store i32 %314, i32* %8, align 4
  %315 = load i32, i32* %8, align 4
  %316 = icmp eq i32 %315, 0
  br i1 %316, label %317, label %341

; <label>:317:                                    ; preds = %299
  %318 = load %struct.tiff*, %struct.tiff** %4, align 8
  %319 = getelementptr inbounds %struct.tiff, %struct.tiff* %318, i32 0, i32 43
  %320 = load i32, i32* %319, align 8
  %321 = load %struct.tiff*, %struct.tiff** %4, align 8
  %322 = getelementptr inbounds %struct.tiff, %struct.tiff* %321, i32 0, i32 41
  %323 = load i32, i32* %322, align 8
  %324 = icmp sge i32 %320, %323
  br i1 %324, label %325, label %329

; <label>:325:                                    ; preds = %317
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 12)
  %326 = add i64 %pgocount13, 1
  store i64 %326, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 12)
  %327 = load %struct.tiff*, %struct.tiff** %4, align 8
  %328 = call i32 @TIFFFlushData1(%struct.tiff* %327)
  br label %329

; <label>:329:                                    ; preds = %325, %317
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 11)
  %330 = add i64 %pgocount14, 1
  store i64 %330, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 11)
  %331 = load i32, i32* %9, align 4
  %332 = trunc i32 %331 to i8
  %333 = load %struct.tiff*, %struct.tiff** %4, align 8
  %334 = getelementptr inbounds %struct.tiff, %struct.tiff* %333, i32 0, i32 42
  %335 = load i8*, i8** %334, align 8
  %336 = getelementptr inbounds i8, i8* %335, i32 1
  store i8* %336, i8** %334, align 8
  store i8 %332, i8* %335, align 1
  %337 = load %struct.tiff*, %struct.tiff** %4, align 8
  %338 = getelementptr inbounds %struct.tiff, %struct.tiff* %337, i32 0, i32 43
  %339 = load i32, i32* %338, align 8
  %340 = add nsw i32 %339, 1
  store i32 %340, i32* %338, align 8
  store i32 0, i32* %9, align 4
  store i32 8, i32* %8, align 4
  br label %341

; <label>:341:                                    ; preds = %329, %299
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 9)
  %342 = add i64 %pgocount15, 1
  store i64 %342, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_putspan, i64 0, i64 9)
  %343 = load i32, i32* %9, align 4
  %344 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %7, align 8
  %345 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %344, i32 0, i32 1
  store i32 %343, i32* %345, align 8
  %346 = load i32, i32* %8, align 4
  %347 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %7, align 8
  %348 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %347, i32 0, i32 2
  store i32 %346, i32* %348, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @find1span(i8*, i32, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i64*, align 8
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %12 = load i32, i32* %7, align 4
  %13 = load i32, i32* %6, align 4
  %14 = sub nsw i32 %12, %13
  store i32 %14, i32* %8, align 4
  %15 = load i32, i32* %6, align 4
  %16 = ashr i32 %15, 3
  %17 = load i8*, i8** %5, align 8
  %18 = sext i32 %16 to i64
  %19 = getelementptr inbounds i8, i8* %17, i64 %18
  store i8* %19, i8** %5, align 8
  %20 = load i32, i32* %8, align 4
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %22, label %68

; <label>:22:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 4)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 4)
  %24 = load i32, i32* %6, align 4
  %25 = and i32 %24, 7
  store i32 %25, i32* %9, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %68

; <label>:27:                                     ; preds = %22
  %28 = load i8*, i8** %5, align 8
  %29 = load i8, i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = load i32, i32* %9, align 4
  %32 = shl i32 %30, %31
  %33 = and i32 %32, 255
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [256 x i8], [256 x i8]* @oneruns, i64 0, i64 %34
  %36 = load i8, i8* %35, align 1
  %37 = zext i8 %36 to i32
  store i32 %37, i32* %10, align 4
  %38 = load i32, i32* %10, align 4
  %39 = load i32, i32* %9, align 4
  %40 = sub nsw i32 8, %39
  %41 = icmp sgt i32 %38, %40
  br i1 %41, label %42, label %46

; <label>:42:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 7)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 7)
  %44 = load i32, i32* %9, align 4
  %45 = sub nsw i32 8, %44
  store i32 %45, i32* %10, align 4
  br label %46

; <label>:46:                                     ; preds = %42, %27
  %47 = load i32, i32* %10, align 4
  %48 = load i32, i32* %8, align 4
  %49 = icmp sgt i32 %47, %48
  br i1 %49, label %50, label %53

; <label>:50:                                     ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 8)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 8)
  %52 = load i32, i32* %8, align 4
  store i32 %52, i32* %10, align 4
  br label %53

; <label>:53:                                     ; preds = %50, %46
  %54 = load i32, i32* %9, align 4
  %55 = load i32, i32* %10, align 4
  %56 = add nsw i32 %54, %55
  %57 = icmp slt i32 %56, 8
  br i1 %57, label %58, label %61

; <label>:58:                                     ; preds = %53
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 9)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 9)
  %60 = load i32, i32* %10, align 4
  store i32 %60, i32* %4, align 4
  br label %186

; <label>:61:                                     ; preds = %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 10)
  %62 = add i64 %pgocount4, 1
  store i64 %62, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 10)
  %63 = load i32, i32* %10, align 4
  %64 = load i32, i32* %8, align 4
  %65 = sub nsw i32 %64, %63
  store i32 %65, i32* %8, align 4
  %66 = load i8*, i8** %5, align 8
  %67 = getelementptr inbounds i8, i8* %66, i32 1
  store i8* %67, i8** %5, align 8
  br label %69

; <label>:68:                                     ; preds = %22, %3
  store i32 0, i32* %10, align 4
  br label %69

; <label>:69:                                     ; preds = %68, %61
  %70 = load i32, i32* %8, align 4
  %71 = sext i32 %70 to i64
  %72 = icmp uge i64 %71, 128
  br i1 %72, label %73, label %133

; <label>:73:                                     ; preds = %69
  br label %74

; <label>:74:                                     ; preds = %95, %73
  %75 = load i8*, i8** %5, align 8
  %76 = ptrtoint i8* %75 to i64
  %77 = and i64 %76, 7
  %78 = icmp eq i64 %77, 0
  %79 = xor i1 %78, true
  br i1 %79, label %80, label %103

; <label>:80:                                     ; preds = %74
  %81 = load i8*, i8** %5, align 8
  %82 = load i8, i8* %81, align 1
  %83 = zext i8 %82 to i32
  %84 = icmp ne i32 %83, 255
  br i1 %84, label %85, label %95

; <label>:85:                                     ; preds = %80
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 11)
  %86 = add i64 %pgocount5, 1
  store i64 %86, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 11)
  %87 = load i32, i32* %10, align 4
  %88 = load i8*, i8** %5, align 8
  %89 = load i8, i8* %88, align 1
  %90 = zext i8 %89 to i64
  %91 = getelementptr inbounds [256 x i8], [256 x i8]* @oneruns, i64 0, i64 %90
  %92 = load i8, i8* %91, align 1
  %93 = zext i8 %92 to i32
  %94 = add nsw i32 %87, %93
  store i32 %94, i32* %4, align 4
  br label %186

; <label>:95:                                     ; preds = %80
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 2)
  %96 = add i64 %pgocount6, 1
  store i64 %96, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 2)
  %97 = load i32, i32* %10, align 4
  %98 = add nsw i32 %97, 8
  store i32 %98, i32* %10, align 4
  %99 = load i32, i32* %8, align 4
  %100 = sub nsw i32 %99, 8
  store i32 %100, i32* %8, align 4
  %101 = load i8*, i8** %5, align 8
  %102 = getelementptr inbounds i8, i8* %101, i32 1
  store i8* %102, i8** %5, align 8
  br label %74

; <label>:103:                                    ; preds = %74
  %104 = load i8*, i8** %5, align 8
  %105 = bitcast i8* %104 to i64*
  store i64* %105, i64** %11, align 8
  br label %106

; <label>:106:                                    ; preds = %117, %103
  %107 = load i32, i32* %8, align 4
  %108 = sext i32 %107 to i64
  %109 = icmp uge i64 %108, 64
  br i1 %109, label %110, label %115

; <label>:110:                                    ; preds = %106
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 3)
  %111 = add i64 %pgocount7, 1
  store i64 %111, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 3)
  %112 = load i64*, i64** %11, align 8
  %113 = load i64, i64* %112, align 8
  %114 = icmp eq i64 %113, -1
  br label %115

; <label>:115:                                    ; preds = %110, %106
  %116 = phi i1 [ false, %106 ], [ %114, %110 ]
  br i1 %116, label %117, label %129

; <label>:117:                                    ; preds = %115
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 1)
  %118 = add i64 %pgocount8, 1
  store i64 %118, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 1)
  %119 = load i32, i32* %10, align 4
  %120 = sext i32 %119 to i64
  %121 = add i64 %120, 64
  %122 = trunc i64 %121 to i32
  store i32 %122, i32* %10, align 4
  %123 = load i32, i32* %8, align 4
  %124 = sext i32 %123 to i64
  %125 = sub i64 %124, 64
  %126 = trunc i64 %125 to i32
  store i32 %126, i32* %8, align 4
  %127 = load i64*, i64** %11, align 8
  %128 = getelementptr inbounds i64, i64* %127, i32 1
  store i64* %128, i64** %11, align 8
  br label %106

; <label>:129:                                    ; preds = %115
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 12)
  %130 = add i64 %pgocount9, 1
  store i64 %130, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 12)
  %131 = load i64*, i64** %11, align 8
  %132 = bitcast i64* %131 to i8*
  store i8* %132, i8** %5, align 8
  br label %133

; <label>:133:                                    ; preds = %129, %69
  br label %134

; <label>:134:                                    ; preds = %152, %133
  %135 = load i32, i32* %8, align 4
  %136 = icmp sge i32 %135, 8
  br i1 %136, label %137, label %160

; <label>:137:                                    ; preds = %134
  %138 = load i8*, i8** %5, align 8
  %139 = load i8, i8* %138, align 1
  %140 = zext i8 %139 to i32
  %141 = icmp ne i32 %140, 255
  br i1 %141, label %142, label %152

; <label>:142:                                    ; preds = %137
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 6)
  %143 = add i64 %pgocount10, 1
  store i64 %143, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 6)
  %144 = load i32, i32* %10, align 4
  %145 = load i8*, i8** %5, align 8
  %146 = load i8, i8* %145, align 1
  %147 = zext i8 %146 to i64
  %148 = getelementptr inbounds [256 x i8], [256 x i8]* @oneruns, i64 0, i64 %147
  %149 = load i8, i8* %148, align 1
  %150 = zext i8 %149 to i32
  %151 = add nsw i32 %144, %150
  store i32 %151, i32* %4, align 4
  br label %186

; <label>:152:                                    ; preds = %137
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 0)
  %153 = add i64 %pgocount11, 1
  store i64 %153, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 0)
  %154 = load i32, i32* %10, align 4
  %155 = add nsw i32 %154, 8
  store i32 %155, i32* %10, align 4
  %156 = load i32, i32* %8, align 4
  %157 = sub nsw i32 %156, 8
  store i32 %157, i32* %8, align 4
  %158 = load i8*, i8** %5, align 8
  %159 = getelementptr inbounds i8, i8* %158, i32 1
  store i8* %159, i8** %5, align 8
  br label %134

; <label>:160:                                    ; preds = %134
  %161 = load i32, i32* %8, align 4
  %162 = icmp sgt i32 %161, 0
  br i1 %162, label %163, label %183

; <label>:163:                                    ; preds = %160
  %164 = load i8*, i8** %5, align 8
  %165 = load i8, i8* %164, align 1
  %166 = zext i8 %165 to i64
  %167 = getelementptr inbounds [256 x i8], [256 x i8]* @oneruns, i64 0, i64 %166
  %168 = load i8, i8* %167, align 1
  %169 = zext i8 %168 to i32
  store i32 %169, i32* %9, align 4
  %170 = load i32, i32* %9, align 4
  %171 = load i32, i32* %8, align 4
  %172 = icmp sgt i32 %170, %171
  br i1 %172, label %173, label %176

; <label>:173:                                    ; preds = %163
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 13)
  %174 = add i64 %pgocount12, 1
  store i64 %174, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 13)
  %175 = load i32, i32* %8, align 4
  br label %179

; <label>:176:                                    ; preds = %163
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 14)
  %177 = add i64 %pgocount13, 1
  store i64 %177, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 14)
  %178 = load i32, i32* %9, align 4
  br label %179

; <label>:179:                                    ; preds = %176, %173
  %180 = phi i32 [ %175, %173 ], [ %178, %176 ]
  %181 = load i32, i32* %10, align 4
  %182 = add nsw i32 %181, %180
  store i32 %182, i32* %10, align 4
  br label %183

; <label>:183:                                    ; preds = %179, %160
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 5)
  %184 = add i64 %pgocount14, 1
  store i64 %184, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_find1span, i64 0, i64 5)
  %185 = load i32, i32* %10, align 4
  store i32 %185, i32* %4, align 4
  br label %186

; <label>:186:                                    ; preds = %183, %142, %85, %58
  %187 = load i32, i32* %4, align 4
  ret i32 %187
}

; Function Attrs: noinline nounwind uwtable
define internal void @Fax3PutBits(%struct.tiff*, i32, i32) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.Fax3EncodeState*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %10 = load %struct.tiff*, %struct.tiff** %4, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 37
  %12 = load i8*, i8** %11, align 8
  %13 = bitcast i8* %12 to %struct.Fax3BaseState*
  %14 = bitcast %struct.Fax3BaseState* %13 to %struct.Fax3EncodeState*
  store %struct.Fax3EncodeState* %14, %struct.Fax3EncodeState** %7, align 8
  %15 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %7, align 8
  %16 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %15, i32 0, i32 2
  %17 = load i32, i32* %16, align 4
  store i32 %17, i32* %8, align 4
  %18 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %7, align 8
  %19 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %18, i32 0, i32 1
  %20 = load i32, i32* %19, align 8
  store i32 %20, i32* %9, align 4
  br label %21

; <label>:21:                                     ; preds = %47, %3
  %22 = load i32, i32* %6, align 4
  %23 = load i32, i32* %8, align 4
  %24 = icmp ugt i32 %22, %23
  br i1 %24, label %25, label %59

; <label>:25:                                     ; preds = %21
  %26 = load i32, i32* %5, align 4
  %27 = load i32, i32* %6, align 4
  %28 = load i32, i32* %8, align 4
  %29 = sub i32 %27, %28
  %30 = lshr i32 %26, %29
  %31 = load i32, i32* %9, align 4
  %32 = or i32 %31, %30
  store i32 %32, i32* %9, align 4
  %33 = load i32, i32* %8, align 4
  %34 = load i32, i32* %6, align 4
  %35 = sub i32 %34, %33
  store i32 %35, i32* %6, align 4
  %36 = load %struct.tiff*, %struct.tiff** %4, align 8
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %36, i32 0, i32 43
  %38 = load i32, i32* %37, align 8
  %39 = load %struct.tiff*, %struct.tiff** %4, align 8
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %39, i32 0, i32 41
  %41 = load i32, i32* %40, align 8
  %42 = icmp sge i32 %38, %41
  br i1 %42, label %43, label %47

; <label>:43:                                     ; preds = %25
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3PutBits, i64 0, i64 1)
  %44 = add i64 %pgocount, 1
  store i64 %44, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3PutBits, i64 0, i64 1)
  %45 = load %struct.tiff*, %struct.tiff** %4, align 8
  %46 = call i32 @TIFFFlushData1(%struct.tiff* %45)
  br label %47

; <label>:47:                                     ; preds = %43, %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3PutBits, i64 0, i64 0)
  %48 = add i64 %pgocount1, 1
  store i64 %48, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3PutBits, i64 0, i64 0)
  %49 = load i32, i32* %9, align 4
  %50 = trunc i32 %49 to i8
  %51 = load %struct.tiff*, %struct.tiff** %4, align 8
  %52 = getelementptr inbounds %struct.tiff, %struct.tiff* %51, i32 0, i32 42
  %53 = load i8*, i8** %52, align 8
  %54 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %54, i8** %52, align 8
  store i8 %50, i8* %53, align 1
  %55 = load %struct.tiff*, %struct.tiff** %4, align 8
  %56 = getelementptr inbounds %struct.tiff, %struct.tiff* %55, i32 0, i32 43
  %57 = load i32, i32* %56, align 8
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %56, align 8
  store i32 0, i32* %9, align 4
  store i32 8, i32* %8, align 4
  br label %21

; <label>:59:                                     ; preds = %21
  %60 = load i32, i32* %5, align 4
  %61 = load i32, i32* %6, align 4
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds [9 x i32], [9 x i32]* @_msbmask, i64 0, i64 %62
  %64 = load i32, i32* %63, align 4
  %65 = and i32 %60, %64
  %66 = load i32, i32* %8, align 4
  %67 = load i32, i32* %6, align 4
  %68 = sub i32 %66, %67
  %69 = shl i32 %65, %68
  %70 = load i32, i32* %9, align 4
  %71 = or i32 %70, %69
  store i32 %71, i32* %9, align 4
  %72 = load i32, i32* %6, align 4
  %73 = load i32, i32* %8, align 4
  %74 = sub i32 %73, %72
  store i32 %74, i32* %8, align 4
  %75 = load i32, i32* %8, align 4
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %101

; <label>:77:                                     ; preds = %59
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3PutBits, i64 0, i64 3)
  %78 = add i64 %pgocount2, 1
  store i64 %78, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3PutBits, i64 0, i64 3)
  %79 = load %struct.tiff*, %struct.tiff** %4, align 8
  %80 = getelementptr inbounds %struct.tiff, %struct.tiff* %79, i32 0, i32 43
  %81 = load i32, i32* %80, align 8
  %82 = load %struct.tiff*, %struct.tiff** %4, align 8
  %83 = getelementptr inbounds %struct.tiff, %struct.tiff* %82, i32 0, i32 41
  %84 = load i32, i32* %83, align 8
  %85 = icmp sge i32 %81, %84
  br i1 %85, label %86, label %90

; <label>:86:                                     ; preds = %77
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3PutBits, i64 0, i64 4)
  %87 = add i64 %pgocount3, 1
  store i64 %87, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3PutBits, i64 0, i64 4)
  %88 = load %struct.tiff*, %struct.tiff** %4, align 8
  %89 = call i32 @TIFFFlushData1(%struct.tiff* %88)
  br label %90

; <label>:90:                                     ; preds = %86, %77
  %91 = load i32, i32* %9, align 4
  %92 = trunc i32 %91 to i8
  %93 = load %struct.tiff*, %struct.tiff** %4, align 8
  %94 = getelementptr inbounds %struct.tiff, %struct.tiff* %93, i32 0, i32 42
  %95 = load i8*, i8** %94, align 8
  %96 = getelementptr inbounds i8, i8* %95, i32 1
  store i8* %96, i8** %94, align 8
  store i8 %92, i8* %95, align 1
  %97 = load %struct.tiff*, %struct.tiff** %4, align 8
  %98 = getelementptr inbounds %struct.tiff, %struct.tiff* %97, i32 0, i32 43
  %99 = load i32, i32* %98, align 8
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %98, align 8
  store i32 0, i32* %9, align 4
  store i32 8, i32* %8, align 4
  br label %101

; <label>:101:                                    ; preds = %90, %59
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3PutBits, i64 0, i64 2)
  %102 = add i64 %pgocount4, 1
  store i64 %102, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_Fax3PutBits, i64 0, i64 2)
  %103 = load i32, i32* %9, align 4
  %104 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %7, align 8
  %105 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %104, i32 0, i32 1
  store i32 %103, i32* %105, align 8
  %106 = load i32, i32* %8, align 4
  %107 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %7, align 8
  %108 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %107, i32 0, i32 2
  store i32 %106, i32* %108, align 4
  ret void
}

declare void @_TIFFfree(i8*) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
